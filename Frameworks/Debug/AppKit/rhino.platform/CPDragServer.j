I;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;12323;
var CPSharedDragServer = nil;
var CPDragServerView = nil,
    CPDragServerSource = nil,
    CPDragServerWindow = nil,
    CPDragServerOffset = nil,
    CPDragServerLocation = nil,
    CPDragServerPasteboard = nil,
    CPDragServerDestination = nil,
    CPDragServerDraggingInfo = nil,
    CPDragServerPreviousEvent = nil,
    CPDragServerAutoscrollInterval = nil;
var CPDragServerIsDraggingImage = NO,
    CPDragServerShouldSendDraggedViewMovedTo = NO,
    CPDragServerShouldSendDraggedImageMovedTo = NO,
    CPDragServerShouldSendDraggedViewEndedAtOperation = NO,
    CPDragServerShouldSendDraggedImageEndedAtOperation = NO;
var CPDragServerAutoscroll = function()
{
    objj_msgSend(CPDragServerSource, "autoscroll:", CPDragServerPreviousEvent);
}
var CPDragServerStartDragging = function(anEvent)
{
    CPDragServerUpdateDragging(anEvent);
}
var CPDragServerUpdateDragging = function(anEvent)
{
    if(objj_msgSend(anEvent, "type") == CPLeftMouseUp)
    {
        if (CPDragServerAutoscrollInterval !== nil)
            clearInterval(CPDragServerAutoscrollInterval);
        CPDragServerAutoscrollInterval = nil;
        CPDragServerLocation = objj_msgSend((objj_msgSend(CPDragServerDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? CPDragServerDestination : objj_msgSend(CPDragServerDestination, "window")), "convertBridgeToBase:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")));
        objj_msgSend(CPDragServerView, "removeFromSuperview");
        objj_msgSend(CPSharedDragServer._dragWindow, "orderOut:", nil);
        if (CPDragServerDestination &&
            (!objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("prepareForDragOperation:")) || objj_msgSend(CPDragServerDestination, "prepareForDragOperation:", CPDragServerDraggingInfo)) &&
            (!objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("performDragOperation:")) || objj_msgSend(CPDragServerDestination, "performDragOperation:", CPDragServerDraggingInfo)) &&
            objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("concludeDragOperation:")))
            objj_msgSend(CPDragServerDestination, "concludeDragOperation:", CPDragServerDraggingInfo);
        if (CPDragServerShouldSendDraggedImageEndedAtOperation)
            objj_msgSend(CPDragServerSource, "draggedImage:endedAt:operation:", objj_msgSend(CPDragServerView, "image"), CPDragServerLocation, NO);
        else if (CPDragServerShouldSendDraggedViewEndedAtOperation)
            objj_msgSend(CPDragServerSource, "draggedView:endedAt:operation:", CPDragServerView, CPDragServerLocation, NO);
        CPDragServerIsDraggingImage = NO;
        CPDragServerDestination = nil;
        return;
    }
    if (CPDragServerAutoscrollInterval === nil)
    {
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("autoscroll:")))
            CPDragServerAutoscrollInterval = setInterval(CPDragServerAutoscroll, 100);
    }
    CPDragServerPreviousEvent = anEvent;
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", CPDragServerUpdateDragging, CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, 0, NO);
    var location = objj_msgSend(anEvent, "locationInWindow"),
        operation =
        bridgeLocation = objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", location);
    var draggingDestination = objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_dragHitTest:pasteboard:", bridgeLocation, CPDragServerPasteboard);
    CPDragServerLocation = objj_msgSend((objj_msgSend(draggingDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? draggingDestination : objj_msgSend(draggingDestination, "window")), "convertBridgeToBase:", bridgeLocation);
    if(draggingDestination != CPDragServerDestination)
    {
        if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("draggingExited:")))
            objj_msgSend(CPDragServerDestination, "draggingExited:", CPDragServerDraggingInfo);
        CPDragServerDestination = draggingDestination;
        if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("draggingEntered:")))
            objj_msgSend(CPDragServerDestination, "draggingEntered:", CPDragServerDraggingInfo);
    }
    else if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("draggingUpdated:")))
        objj_msgSend(CPDragServerDestination, "draggingUpdated:", CPDragServerDraggingInfo);
    location.x -= CPDragServerOffset.x;
    location.y -= CPDragServerOffset.y;
    objj_msgSend(CPDragServerView, "setFrameOrigin:", location);
    if (CPDragServerShouldSendDraggedImageMovedTo)
        objj_msgSend(CPDragServerSource, "draggedImage:movedTo:", objj_msgSend(CPDragServerView, "image"), location);
    else if (CPDragServerShouldSendDraggedViewMovedTo)
        objj_msgSend(CPDragServerSource, "draggedView:movedTo:", CPDragServerView, location);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDraggingInfo"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("draggingSource"), function $CPDraggingInfo__draggingSource(self, _cmd)
{ with(self)
{
    return CPDragServerSource;
}
}), new objj_method(sel_getUid("draggingLocation"), function $CPDraggingInfo__draggingLocation(self, _cmd)
{ with(self)
{
    return CPDragServerLocation;
}
}), new objj_method(sel_getUid("draggingPasteboard"), function $CPDraggingInfo__draggingPasteboard(self, _cmd)
{ with(self)
{
    return CPDragServerPasteboard;
}
}), new objj_method(sel_getUid("draggedImage"), function $CPDraggingInfo__draggedImage(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDragServerView, "image");
}
}), new objj_method(sel_getUid("draggedImageLocation"), function $CPDraggingInfo__draggedImageLocation(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "draggedViewLocation");
}
}), new objj_method(sel_getUid("draggedViewLocation"), function $CPDraggingInfo__draggedViewLocation(self, _cmd)
{ with(self)
{
    return objj_msgSend((objj_msgSend(CPDragServerDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? CPDragServerDestination : objj_msgSend(CPDragServerDestination, "window")), "convertBridgeToBase:", objj_msgSend(CPDragServerView, "frame").origin);
}
}), new objj_method(sel_getUid("draggedView"), function $CPDraggingInfo__draggedView(self, _cmd)
{ with(self)
{
    return CPDragServerView;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDragServer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dragWindow"), new objj_ivar("_imageView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDragServer__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _dragWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CPRectMakeZero(), CPBorderlessWindowMask);
        objj_msgSend(_dragWindow, "setLevel:", CPDraggingWindowLevel);
    }
    return self;
}
}), new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragView_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aWindow, viewLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    var eventLocation = objj_msgSend(anEvent, "locationInWindow");
    CPDragServerView = aView;
    CPDragServerSource = aSourceObject;
    CPDragServerWindow = aWindow;
    CPDragServerOffset = CPPointMake(eventLocation.x - viewLocation.x, eventLocation.y - viewLocation.y);
    CPDragServerPasteboard = objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    objj_msgSend(_dragWindow, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "frame").size));
    objj_msgSend(_dragWindow, "orderFront:", self);
    objj_msgSend(aView, "setFrameOrigin:", viewLocation);
    objj_msgSend(objj_msgSend(_dragWindow, "contentView"), "addSubview:", aView);
    if (CPDragServerIsDraggingImage)
    {
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedImage:beganAt:")))
            objj_msgSend(CPDragServerSource, "draggedImage:beganAt:", objj_msgSend(aView, "image"), viewLocation);
        CPDragServerShouldSendDraggedImageMovedTo = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedImage:movedTo:"));
        CPDragServerShouldSendDraggedImageEndedAtOperation = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedImage:endAt:operation:"));
        CPDragServerShouldSendDraggedViewMovedTo = NO;
        CPDragServerShouldSendDraggedViewEndedAtOperation = NO;
    }
    else
    {
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedView:beganAt:")))
            objj_msgSend(CPDragServerSource, "draggedView:beganAt:", aView, viewLocation);
        CPDragServerShouldSendDraggedViewMovedTo = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedView:movedTo:"));
        CPDragServerShouldSendDraggedViewEndedAtOperation = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedView:endedAt:operation:"));
        CPDragServerShouldSendDraggedImageMovedTo = NO;
        CPDragServerShouldSendDraggedImageEndedAtOperation = NO;
    }
    CPDragServerStartDragging(anEvent);
}
}), new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragImage_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    CPDragServerIsDraggingImage = YES;
    if (!_imageView)
        _imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CPRectMakeZero());
    objj_msgSend(_imageView, "setImage:", anImage);
    objj_msgSend(_imageView, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(anImage, "size")));
    objj_msgSend(self, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", _imageView, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPDragServer__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPDragServer, "class"))
        return;
    CPDragServerDraggingInfo = objj_msgSend(objj_msgSend(CPDraggingInfo, "alloc"), "init");
}
}), new objj_method(sel_getUid("sharedDragServer"), function $CPDragServer__sharedDragServer(self, _cmd)
{ with(self)
{
    if (!CPSharedDragServer)
        CPSharedDragServer = objj_msgSend(objj_msgSend(CPDragServer, "alloc"), "init");
    return CPSharedDragServer;
}
})]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function $CPWindow___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    if (!_inclusiveRegisteredDraggedTypes)
        return nil;
    var adjustedPoint = { x:aPoint.x - (_frame.origin.x), y:aPoint.y - (_frame.origin.y) },
        hitView = objj_msgSend(_windowView, "hitTest:", adjustedPoint);
    while (hitView && !objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(hitView, "registeredDraggedTypes")))
        hitView = objj_msgSend(hitView, "superview");
    if (hitView)
        return hitView;
    if (objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(self, "registeredDraggedTypes")))
        return self;
    return nil;
}
})]);
}

