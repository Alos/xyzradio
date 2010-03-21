@STATIC;1.0;I;18;AppKit/CPControl.jI;16;AppKit/CPImage.jt;5320;objj_executeFile("AppKit/CPControl.j", NO);
objj_executeFile("AppKit/CPImage.j", NO);
var starEmpty = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  "Resources/StarRater/empty.png",  CPSizeMake(25, 25)),
    starSet = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  "Resources/StarRater/set.png",  CPSizeMake(25, 25)),
    starActive = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  "Resources/StarRater/active.png",  CPSizeMake(25, 25));
{var the_class = objj_allocateClassPair(CPControl, "StarRatingControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("numberOfStars"), new objj_ivar("activeValue"), new objj_ivar("isActive")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("numberOfStars"), function $StarRatingControl__numberOfStars(self, _cmd)
{ with(self)
{
return numberOfStars;
}
},["id"]),
new objj_method(sel_getUid("setNumberOfStars:"), function $StarRatingControl__setNumberOfStars_(self, _cmd, newValue)
{ with(self)
{
numberOfStars = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $StarRatingControl__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StarRatingControl").super_class }, "initWithFrame:", aFrame))
    {
        numberOfStars = 6;
        self._DOMElement.style.cursor = "pointer";
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $StarRatingControl__viewWillMoveToWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(aWindow, "setAcceptsMouseMovedEvents:", YES);
}
},["void","CPWindow"]), new objj_method(sel_getUid("drawRect:"), function $StarRatingControl__drawRect_(self, _cmd, aRect)
{ with(self)
{
    if(objj_msgSend(starEmpty, "loadStatus") != CPImageLoadStatusCompleted)
      return objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, starEmpty);
    if(objj_msgSend(starSet, "loadStatus") != CPImageLoadStatusCompleted)
      return objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, starSet);
    if(objj_msgSend(starActive, "loadStatus") != CPImageLoadStatusCompleted)
      return objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, starActive);
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds"),
        starWidth = bounds.size.width / numberOfStars,
        starHeight = bounds.size.height,
        value = objj_msgSend(self, "intValue");
    for (var i=0; i<numberOfStars; i++)
    {
        if (isActive && activeValue > i)
            CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starActive);
        else
        {
            if (value > i)
                CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starSet);
            else if (value <= i)
                CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starEmpty);
        }
    }
}
},["void","CGRect"]), new objj_method(sel_getUid("imageDidLoad:"), function $StarRatingControl__imageDidLoad_(self, _cmd, aNotification)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPImageDidLoadNotification, objj_msgSend(aNotification, "object"));
  objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("mouseEntered:"), function $StarRatingControl__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{
    isActive = YES;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $StarRatingControl__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    isActive = NO;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $StarRatingControl__mouseMoved_(self, _cmd, anEvent)
{ with(self)
{
    var offset = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil).x,
        bounds = objj_msgSend(self, "bounds"),
        starWidth = bounds.size.width / numberOfStars;
    activeValue = offset < 5 ? 0 : CEIL(offset/starWidth);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $StarRatingControl__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "setIntValue:", activeValue);
    activeValue = 0;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StarRatingControl").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("sizeToFit"), function $StarRatingControl__sizeToFit(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setFrameSize:", CGSizeMake(numberOfStars*25, 25));
}
},["void"])]);
}

