i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;31053;
CPLineBreakByWordWrapping = 0;
CPLineBreakByCharWrapping = 1;
CPLineBreakByClipping = 2;
CPLineBreakByTruncatingHead = 3;
CPLineBreakByTruncatingTail = 4;
CPLineBreakByTruncatingMiddle = 5;
CPTextFieldSquareBezel = 0;
CPTextFieldRoundedBezel = 1;
var CPTextFieldDOMInputElement = nil,
    CPTextFieldDOMPasswordInputElement = nil,
    CPTextFieldDOMStandardInputElement = nil,
    CPTextFieldInputOwner = nil,
    CPTextFieldTextDidChangeValue = nil,
    CPTextFieldInputResigning = NO,
    CPTextFieldInputDidBlur = NO,
    CPTextFieldInputIsActive = NO,
    CPTextFieldCachedSelectStartFunction = nil,
    CPTextFieldCachedDragFunction = nil,
    CPTextFieldBlurFunction = nil,
    CPTextFieldKeyUpFunction = nil,
    CPTextFieldKeyPressFunction = nil,
    CPTextFieldKeyDownFunction = nil;
var CPSecureTextFieldCharacter = "\u2022";
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("string"), function $CPString__string(self, _cmd)
{ with(self)
{
    return self;
}
})]);
}
CPTextFieldStateRounded = CPThemeState("rounded");
CPTextFieldStatePlaceholder = CPThemeState("placeholder");
{var the_class = objj_allocateClassPair(CPControl, "CPTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEditable"), new objj_ivar("_isSelectable"), new objj_ivar("_isSecure"), new objj_ivar("_drawsBackground"), new objj_ivar("_textFieldBackgroundColor"), new objj_ivar("_placeholderString"), new objj_ivar("_delegate"), new objj_ivar("_textDidChangeValue"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_inputElement"), function $CPTextField___inputElement(self, _cmd)
{ with(self)
{
    if (!CPTextFieldDOMInputElement)
    {
        CPTextFieldDOMInputElement = document.createElement("input");
        CPTextFieldDOMInputElement.style.position = "absolute";
        CPTextFieldDOMInputElement.style.border = "0px";
        CPTextFieldDOMInputElement.style.padding = "0px";
        CPTextFieldDOMInputElement.style.margin = "0px";
        CPTextFieldDOMInputElement.style.whiteSpace = "pre";
        CPTextFieldDOMInputElement.style.background = "transparent";
        CPTextFieldDOMInputElement.style.outline = "none";
        CPTextFieldBlurFunction = function(anEvent)
        {
            if (CPTextFieldInputOwner && CPTextFieldInputOwner._DOMElement != CPTextFieldDOMInputElement.parentNode)
                return;
            if (!CPTextFieldInputResigning)
            {
                objj_msgSend(objj_msgSend(CPTextFieldInputOwner, "window"), "makeFirstResponder:", nil);
                return;
            }
            CPTextFieldHandleBlur(anEvent, CPTextFieldDOMInputElement);
            CPTextFieldInputDidBlur = YES;
            return true;
        }
        CPTextFieldKeyDownFunction = function(anEvent)
        {
            CPTextFieldTextDidChangeValue = objj_msgSend(CPTextFieldInputOwner, "stringValue");
            CPTextFieldKeyPressFunction(anEvent);
            return true;
        }
        CPTextFieldKeyPressFunction = function(aDOMEvent)
        {
            aDOMEvent = aDOMEvent || window.event;
            if (aDOMEvent.keyCode == CPReturnKeyCode || aDOMEvent.keyCode == CPTabKeyCode)
            {
                if (aDOMEvent.preventDefault)
                    aDOMEvent.preventDefault();
                if (aDOMEvent.stopPropagation)
                    aDOMEvent.stopPropagation();
                aDOMEvent.cancelBubble = true;
                var owner = CPTextFieldInputOwner;
                if (aDOMEvent && aDOMEvent.keyCode == CPReturnKeyCode)
                {
                    objj_msgSend(owner, "sendAction:to:", objj_msgSend(owner, "action"), objj_msgSend(owner, "target"));
                    objj_msgSend(objj_msgSend(owner, "window"), "makeFirstResponder:", nil);
                }
                else if (aDOMEvent && aDOMEvent.keyCode == CPTabKeyCode)
                {
                    if (!aDOMEvent.shiftKey)
                        objj_msgSend(objj_msgSend(owner, "window"), "selectNextKeyView:", owner);
                    else
                        objj_msgSend(objj_msgSend(owner, "window"), "selectPreviousKeyView:", owner);
                }
            }
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        }
        CPTextFieldKeyUpFunction = function()
        {
            objj_msgSend(CPTextFieldInputOwner, "setStringValue:", CPTextFieldDOMInputElement.value);
            if (objj_msgSend(CPTextFieldInputOwner, "stringValue") !== CPTextFieldTextDidChangeValue)
            {
                CPTextFieldTextDidChangeValue = objj_msgSend(CPTextFieldInputOwner, "stringValue");
                objj_msgSend(CPTextFieldInputOwner, "textDidChange:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidChangeNotification, CPTextFieldInputOwner, nil));
            }
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        }
        CPTextFieldHandleBlur = function(anEvent)
        {
            var owner = CPTextFieldInputOwner;
            CPTextFieldInputOwner = nil;
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
        }
        if (document.attachEvent)
        {
            CPTextFieldDOMInputElement.attachEvent("on" + CPDOMEventKeyUp, CPTextFieldKeyUpFunction);
            CPTextFieldDOMInputElement.attachEvent("on" + CPDOMEventKeyDown, CPTextFieldKeyDownFunction);
            CPTextFieldDOMInputElement.attachEvent("on" + CPDOMEventKeyPress, CPTextFieldKeyPressFunction);
        }
        else
        {
            CPTextFieldDOMInputElement.addEventListener(CPDOMEventKeyUp, CPTextFieldKeyUpFunction, NO);
            CPTextFieldDOMInputElement.addEventListener(CPDOMEventKeyDown, CPTextFieldKeyDownFunction, NO);
            CPTextFieldDOMInputElement.addEventListener(CPDOMEventKeyPress, CPTextFieldKeyPressFunction, NO);
        }
        CPTextFieldDOMInputElement.onblur = CPTextFieldBlurFunction;
        CPTextFieldDOMStandardInputElement = CPTextFieldDOMInputElement;
    }
    if (CPFeatureIsCompatible(CPInputTypeCanBeChangedFeature))
    {
        if (objj_msgSend(self, "isSecure"))
            CPTextFieldDOMInputElement.type = "password";
        else
            CPTextFieldDOMInputElement.type = "text";
        return CPTextFieldDOMInputElement;
    }
    if (objj_msgSend(self, "isSecure"))
    {
        if (!CPTextFieldDOMPasswordInputElement)
        {
            CPTextFieldDOMPasswordInputElement = document.createElement("input");
            CPTextFieldDOMPasswordInputElement.style.position = "absolute";
            CPTextFieldDOMPasswordInputElement.style.border = "0px";
            CPTextFieldDOMPasswordInputElement.style.padding = "0px";
            CPTextFieldDOMPasswordInputElement.style.margin = "0px";
            CPTextFieldDOMPasswordInputElement.style.whiteSpace = "pre";
            CPTextFieldDOMPasswordInputElement.style.background = "transparent";
            CPTextFieldDOMPasswordInputElement.style.outline = "none";
            CPTextFieldDOMPasswordInputElement.type = "password";
            CPTextFieldDOMPasswordInputElement.attachEvent("on" + CPDOMEventKeyUp, CPTextFieldKeyUpFunction);
            CPTextFieldDOMPasswordInputElement.attachEvent("on" + CPDOMEventKeyDown, CPTextFieldKeyDownFunction);
            CPTextFieldDOMPasswordInputElement.attachEvent("on" + CPDOMEventKeyPress, CPTextFieldKeyPressFunction);
            CPTextFieldDOMPasswordInputElement.onblur = CPTextFieldBlurFunction;
        }
        CPTextFieldDOMInputElement = CPTextFieldDOMPasswordInputElement;
    }
    else
    {
        CPTextFieldDOMInputElement = CPTextFieldDOMStandardInputElement;
    }
    return CPTextFieldDOMInputElement;
}
}), new objj_method(sel_getUid("initWithFrame:"), function $CPTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setStringValue:", "");
        objj_msgSend(self, "setPlaceholderString:", "");
        _sendActionOn = CPKeyUpMask | CPKeyDownMask;
        objj_msgSend(self, "setValue:forThemeAttribute:", CPLeftTextAlignment, "alignment");
    }
    return self;
}
}), new objj_method(sel_getUid("setEditable:"), function $CPTextField__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
}), new objj_method(sel_getUid("isEditable"), function $CPTextField__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
}), new objj_method(sel_getUid("setSelectable:"), function $CPTextField__setSelectable_(self, _cmd, aFlag)
{ with(self)
{
    _isSelectable = aFlag;
}
}), new objj_method(sel_getUid("isSelectable"), function $CPTextField__isSelectable(self, _cmd)
{ with(self)
{
    return _isSelectable;
}
}), new objj_method(sel_getUid("setSecure:"), function $CPTextField__setSecure_(self, _cmd, aFlag)
{ with(self)
{
    _isSecure = aFlag;
}
}), new objj_method(sel_getUid("isSecure"), function $CPTextField__isSecure(self, _cmd)
{ with(self)
{
    return _isSecure;
}
}), new objj_method(sel_getUid("setBezeled:"), function $CPTextField__setBezeled_(self, _cmd, shouldBeBezeled)
{ with(self)
{
    if (shouldBeBezeled)
        objj_msgSend(self, "setThemeState:", CPThemeStateBezeled);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBezeled);
}
}), new objj_method(sel_getUid("isBezeled"), function $CPTextField__isBezeled(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBezeled);
}
}), new objj_method(sel_getUid("setBezelStyle:"), function $CPTextField__setBezelStyle_(self, _cmd, aBezelStyle)
{ with(self)
{
    var shouldBeRounded = aBezelStyle === CPTextFieldRoundedBezel;
    if (shouldBeRounded)
        objj_msgSend(self, "setThemeState:", CPTextFieldStateRounded);
    else
        objj_msgSend(self, "unsetThemeState:", CPTextFieldStateRounded);
}
}), new objj_method(sel_getUid("bezelStyle"), function $CPTextField__bezelStyle(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "hasThemeState:", CPTextFieldStateRounded))
        return CPTextFieldRoundedBezel;
    return CPTextFieldSquareBezel;
}
}), new objj_method(sel_getUid("setBordered:"), function $CPTextField__setBordered_(self, _cmd, shouldBeBordered)
{ with(self)
{
    if (shouldBeBordered)
        objj_msgSend(self, "setThemeState:", CPThemeStateBordered);
    else
        objj_msgSend(self, "unsetThemeState:", CPThemeStateBordered);
}
}), new objj_method(sel_getUid("isBordered"), function $CPTextField__isBordered(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "hasThemeState:", CPThemeStateBordered);
}
}), new objj_method(sel_getUid("setDrawsBackground:"), function $CPTextField__setDrawsBackground_(self, _cmd, shouldDrawBackground)
{ with(self)
{
    if (_drawsBackground == shouldDrawBackground)
        return;
    _drawsBackground = shouldDrawBackground;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("drawsBackground"), function $CPTextField__drawsBackground(self, _cmd)
{ with(self)
{
    return _drawsBackground;
}
}), new objj_method(sel_getUid("setTextFieldBackgroundColor:"), function $CPTextField__setTextFieldBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    if (_textFieldBackgroundColor == aColor)
        return;
    _textFieldBackgroundColor = aColor;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("textFieldBackgroundColor"), function $CPTextField__textFieldBackgroundColor(self, _cmd)
{ with(self)
{
    return _textFieldBackgroundColor;
}
}), new objj_method(sel_getUid("acceptsFirstResponder"), function $CPTextField__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled");
}
}), new objj_method(sel_getUid("becomeFirstResponder"), function $CPTextField__becomeFirstResponder(self, _cmd)
{ with(self)
{
    if (CPTextFieldInputOwner && objj_msgSend(CPTextFieldInputOwner, "window") !== objj_msgSend(self, "window"))
        objj_msgSend(objj_msgSend(CPTextFieldInputOwner, "window"), "makeFirstResponder:", nil);
    objj_msgSend(self, "setThemeState:", CPThemeStateEditing);
    objj_msgSend(self, "_updatePlaceholderState");
    objj_msgSend(self, "setNeedsLayout");
    var string = objj_msgSend(self, "stringValue"),
        element = objj_msgSend(self, "_inputElement");
    element.value = string;
    element.style.color = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"), "cssString");
    element.style.font = objj_msgSend(objj_msgSend(self, "currentValueForThemeAttribute:", "font"), "cssString");
    element.style.zIndex = 1000;
    var contentRect = objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    element.style.top = (contentRect.origin.y) + "px";
    element.style.left = ((contentRect.origin.x) - 1) + "px";
    element.style.width = (contentRect.size.width) + "px";
    element.style.height = (contentRect.size.height) + "px";
    _DOMElement.appendChild(element);
    window.setTimeout(function()
    {
        element.focus();
        CPTextFieldInputOwner = self;
    }, 0.0);
    objj_msgSend(self, "textDidBeginEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
    CPTextFieldInputIsActive = YES;
    if (document.attachEvent)
    {
        CPTextFieldCachedSelectStartFunction = document.body.onselectstart;
        CPTextFieldCachedDragFunction = document.body.ondrag;
        document.body.ondrag = function () {};
        document.body.onselectstart = function () {};
    }
    return YES;
}
}), new objj_method(sel_getUid("resignFirstResponder"), function $CPTextField__resignFirstResponder(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "unsetThemeState:", CPThemeStateEditing);
    objj_msgSend(self, "_updatePlaceholderState");
    objj_msgSend(self, "setNeedsLayout");
    var element = objj_msgSend(self, "_inputElement");
    objj_msgSend(self, "setObjectValue:", element.value);
    CPTextFieldInputResigning = YES;
    element.blur();
    if (!CPTextFieldInputDidBlur)
        CPTextFieldBlurFunction();
    CPTextFieldInputDidBlur = NO;
    CPTextFieldInputResigning = NO;
    if (element.parentNode == _DOMElement)
        element.parentNode.removeChild(element);
    CPTextFieldInputIsActive = NO;
    if (document.attachEvent)
    {
        CPTextFieldCachedSelectStartFunction = nil;
        CPTextFieldCachedDragFunction = nil;
        document.body.ondrag = CPTextFieldCachedDragFunction
        document.body.onselectstart = CPTextFieldCachedSelectStartFunction
    }
    objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
    return YES;
}
}), new objj_method(sel_getUid("mouseDown:"), function $CPTextField__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled"))
        return objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    else
        return objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("objectValue"), function $CPTextField__objectValue(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "objectValue");
}
}), new objj_method(sel_getUid("setObjectValue:"), function $CPTextField__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", aValue);
    objj_msgSend(self, "_updatePlaceholderState");
}
}), new objj_method(sel_getUid("_updatePlaceholderState"), function $CPTextField___updatePlaceholderState(self, _cmd)
{ with(self)
{
    var string = objj_msgSend(self, "stringValue");
    if ((!string || objj_msgSend(string, "length") === 0) && !objj_msgSend(self, "hasThemeState:", CPThemeStateEditing))
        objj_msgSend(self, "setThemeState:", CPTextFieldStatePlaceholder);
    else
        objj_msgSend(self, "unsetThemeState:", CPTextFieldStatePlaceholder);
}
}), new objj_method(sel_getUid("setPlaceholderString:"), function $CPTextField__setPlaceholderString_(self, _cmd, aStringValue)
{ with(self)
{
    if (_placeholderString === aStringValue)
        return;
    _placeholderString = aStringValue;
    if (objj_msgSend(self, "hasThemeState:", CPTextFieldStatePlaceholder))
    {
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
}), new objj_method(sel_getUid("placeholderString"), function $CPTextField__placeholderString(self, _cmd)
{ with(self)
{
    return _placeholderString;
}
}), new objj_method(sel_getUid("sizeToFit"), function $CPTextField__sizeToFit(self, _cmd)
{ with(self)
{
    var size = objj_msgSend((objj_msgSend(self, "stringValue") || " "), "sizeWithFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font")),
        contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset"),
        minSize = objj_msgSend(self, "currentValueForThemeAttribute:", "min-size"),
        maxSize = objj_msgSend(self, "currentValueForThemeAttribute:", "max-size");
    size.width = MAX(size.width + contentInset.left + contentInset.right, minSize.width);
    size.height = MAX(size.height + contentInset.top + contentInset.bottom, minSize.height);
    if (maxSize.width >= 0.0)
        size.width = MIN(size.width, maxSize.width);
    if (maxSize.height >= 0.0)
        size.height = MIN(size.height, maxSize.height);
    if (objj_msgSend(self, "isEditable"))
        size.width = CGRectGetWidth(objj_msgSend(self, "frame"));
    objj_msgSend(self, "setFrameSize:", size);
}
}), new objj_method(sel_getUid("selectText:"), function $CPTextField__selectText_(self, _cmd, sender)
{ with(self)
{
    var element = objj_msgSend(self, "_inputElement");
    if (element.parentNode == _DOMElement && (objj_msgSend(self, "isEditable") || objj_msgSend(self, "isSelectable")))
        element.select();
}
}), new objj_method(sel_getUid("setDelegate:"), function $CPTextField__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidBeginEditingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidChangeNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidEndEditingNotification, self);
    }
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidBeginEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidBeginEditing:"), CPControlTextDidBeginEditingNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidChange:"), CPControlTextDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidEndEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidEndEditing:"), CPControlTextDidEndEditingNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function $CPTextField__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("contentRectForBounds:"), function $CPTextField__contentRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemeAttribute:", "content-inset");
    if (!contentInset)
        return bounds;
    bounds.origin.x += contentInset.left;
    bounds.origin.y += contentInset.top;
    bounds.size.width -= contentInset.left + contentInset.right;
    bounds.size.height -= contentInset.top + contentInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("bezelRectForBounds:"), function $CPTextField__bezelRectForBounds_(self, _cmd, bounds)
{ with(self)
{
    var bezelInset = objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-inset");
    if (((bezelInset).top === 0 && (bezelInset).right === 0 && (bezelInset).bottom === 0 && (bezelInset).left === 0))
        return bounds;
    bounds.origin.x += bezelInset.left;
    bounds.origin.y += bezelInset.top;
    bounds.size.width -= bezelInset.left + bezelInset.right;
    bounds.size.height -= bezelInset.top + bezelInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function $CPTextField__rectForEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function $CPTextField__createEphemeralSubviewNamed_(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
    {
        var view = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("layoutSubviews"), function $CPTextField__layoutSubviews(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        objj_msgSend(contentView, "setHidden:", objj_msgSend(self, "hasThemeState:", CPThemeStateEditing));
        var string = "";
        if (objj_msgSend(self, "hasThemeState:", CPTextFieldStatePlaceholder))
            string = objj_msgSend(self, "placeholderString");
        else
        {
            string = objj_msgSend(self, "stringValue");
            if (objj_msgSend(self, "isSecure"))
                string = secureStringForString(string);
        }
        objj_msgSend(contentView, "setText:", string);
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"));
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-offset"));
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"), function $CPTextField__textFieldWithStringValue_placeholder_width_(self, _cmd, aStringValue, aPlaceholder, aWidth)
{ with(self)
{
    return objj_msgSend(self, "textFieldWithStringValue:placeholder:width:theme:", aStringValue, aPlaceholder, aWidth, objj_msgSend(CPTheme, "defaultTheme"));
}
}), new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"), function $CPTextField__textFieldWithStringValue_placeholder_width_theme_(self, _cmd, aStringValue, aPlaceholder, aWidth, aTheme)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, aWidth, 29.0));
    objj_msgSend(textField, "setTheme:", aTheme);
    objj_msgSend(textField, "setStringValue:", aStringValue);
    objj_msgSend(textField, "setPlaceholderString:", aPlaceholder);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "sizeToFit");
    return textField;
}
}), new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"), function $CPTextField__roundedTextFieldWithStringValue_placeholder_width_(self, _cmd, aStringValue, aPlaceholder, aWidth)
{ with(self)
{
    return objj_msgSend(self, "roundedTextFieldWithStringValue:placeholder:width:theme:", aStringValue, aPlaceholder, aWidth, objj_msgSend(CPTheme, "defaultTheme"));
}
}), new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"), function $CPTextField__roundedTextFieldWithStringValue_placeholder_width_theme_(self, _cmd, aStringValue, aPlaceholder, aWidth, aTheme)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, aWidth, 29.0));
    objj_msgSend(textField, "setTheme:", aTheme);
    objj_msgSend(textField, "setStringValue:", aStringValue);
    objj_msgSend(textField, "setPlaceholderString:", aPlaceholder);
    objj_msgSend(textField, "setBezelStyle:", CPTextFieldRoundedBezel);
    objj_msgSend(textField, "setBordered:", YES);
    objj_msgSend(textField, "setBezeled:", YES);
    objj_msgSend(textField, "setEditable:", YES);
    objj_msgSend(textField, "sizeToFit");
    return textField;
}
}), new objj_method(sel_getUid("labelWithTitle:"), function $CPTextField__labelWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(self, "labelWithTitle:theme:", aTitle, objj_msgSend(CPTheme, "defaultTheme"));
}
}), new objj_method(sel_getUid("labelWithTitle:theme:"), function $CPTextField__labelWithTitle_theme_(self, _cmd, aTitle, aTheme)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    objj_msgSend(textField, "setStringValue:", aTitle);
    objj_msgSend(textField, "sizeToFit");
    return textField;
}
}), new objj_method(sel_getUid("themeClass"), function $CPTextField__themeClass(self, _cmd)
{ with(self)
{
    return "textfield";
}
}), new objj_method(sel_getUid("themeAttributes"), function $CPTextField__themeAttributes(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [{ top:(0), right:(0), bottom:(0), left:(0) }, { top:(2.0), right:(2.0), bottom:(2.0), left:(2.0) }, nil], ["bezel-inset", "content-inset", "bezel-color"]);
}
})]);
}
var secureStringForString = function(aString)
{
    if (!aString)
        return "";
    var secureString = "",
        length = aString.length;
    while (length--)
        secureString += CPSecureTextFieldCharacter;
    return secureString;
}
var CPTextFieldIsEditableKey = "CPTextFieldIsEditableKey",
    CPTextFieldIsSelectableKey = "CPTextFieldIsSelectableKey",
    CPTextFieldIsBorderedKey = "CPTextFieldIsBorderedKey",
    CPTextFieldIsBezeledKey = "CPTextFieldIsBezeledKey",
    CPTextFieldBezelStyleKey = "CPTextFieldBezelStyleKey",
    CPTextFieldDrawsBackgroundKey = "CPTextFieldDrawsBackgroundKey",
    CPTextFieldLineBreakModeKey = "CPTextFieldLineBreakModeKey",
    CPTextFieldBackgroundColorKey = "CPTextFieldBackgroundColorKey",
    CPTextFieldPlaceholderStringKey = "CPTextFieldPlaceholderStringKey";
{
var the_class = objj_getClass("CPTextField")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTextField\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTextField__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setEditable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsEditableKey));
        objj_msgSend(self, "setSelectable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsSelectableKey));
        objj_msgSend(self, "setDrawsBackground:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldDrawsBackgroundKey));
        objj_msgSend(self, "setTextFieldBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldBackgroundColorKey));
        objj_msgSend(self, "setPlaceholderString:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldPlaceholderStringKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTextField__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPTextFieldIsEditableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isSelectable, CPTextFieldIsSelectableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _drawsBackground, CPTextFieldDrawsBackgroundKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _textFieldBackgroundColor, CPTextFieldBackgroundColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _placeholderString, CPTextFieldPlaceholderStringKey);
}
})]);
}

