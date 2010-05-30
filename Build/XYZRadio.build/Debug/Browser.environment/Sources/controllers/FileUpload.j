@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPValue.jI;24;Foundation/CPException.jt;11442;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("Foundation/CPException.j", NO);
var UPLOAD_IFRAME_PREFIX = "UPLOAD_IFRAME_",
    UPLOAD_FORM_PREFIX = "UPLOAD_FORM_",
    UPLOAD_INPUT_PREFIX = "UPLOAD_INPUT_";
{var the_class = objj_allocateClassPair(CPButton, "UploadButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMIFrameElement"), new objj_ivar("_fileUploadElement"), new objj_ivar("_uploadForm"), new objj_ivar("_mouseMovedCallback"), new objj_ivar("_mouseUpCallback"), new objj_ivar("_delegate"), new objj_ivar("_parameters")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $UploadButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        var hash = objj_msgSend(self, "hash");
        _uploadForm = document.createElement("form");
        _uploadForm.method = "POST";
        _uploadForm.action = "#";
        if(document.attachEvent)
            _uploadForm.encoding = "multipart/form-data";
        else
            _uploadForm.enctype = "multipart/form-data";
        _fileUploadElement = document.createElement("input");
        _fileUploadElement.type = "file";
        _fileUploadElement.name = "file";
        _fileUploadElement.onmousedown = function(aDOMEvent)
        {
            aDOMEvent = aDOMEvent || window.event;
            var x = aDOMEvent.clientX,
                y = aDOMEvent.clientY,
                theWindow = objj_msgSend(self, "window");
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, objj_msgSend(theWindow, "convertBridgeToBase:", CGPointMake(x, y)), 0, 0, objj_msgSend(theWindow, "windowNumber"), nil, -1, 1, 0));
            if (document.addEventListener)
            {
                document.addEventListener(CPDOMEventMouseUp, _mouseUpCallback, NO);
                document.addEventListener(CPDOMEventMouseMoved, _mouseMovedCallback, NO);
            }
            else if(document.attachEvent)
            {
                document.attachEvent("on" + CPDOMEventMouseUp, _mouseUpCallback);
                document.attachEvent("on" + CPDOMEventMouseMoved, _mouseMovedCallback);
            }
        }
        _mouseUpCallback = function(aDOMEvent)
        {
            if (document.removeEventListener)
            {
                document.removeEventListener(CPDOMEventMouseUp, _mouseUpCallback, NO);
                document.removeEventListener(CPDOMEventMouseMoved, _mouseMovedCallback, NO);
            }
            else if(document.attachEvent)
            {
                document.detachEvent("on" + CPDOMEventMouseUp, _mouseUpCallback);
                document.detachEvent("on" + CPDOMEventMouseMoved, _mouseMovedCallback);
            }
            aDOMEvent = aDOMEvent || window.event;
            var x = aDOMEvent.clientX,
                y = aDOMEvent.clientY,
                theWindow = objj_msgSend(self, "window");
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, objj_msgSend(theWindow, "convertBridgeToBase:", CGPointMake(x, y)), 0, 0, objj_msgSend(theWindow, "windowNumber"), nil, -1, 1, 0));
        }
        _mouseMovedCallback = function(aDOMEvent)
        {
            aDOMEvent = aDOMEvent || window.event;
            var x = aDOMEvent.clientX,
                y = aDOMEvent.clientY,
                theWindow = objj_msgSend(self, "window");
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDragged, objj_msgSend(theWindow, "convertBridgeToBase:", CGPointMake(x, y)), 0, 0, objj_msgSend(theWindow, "windowNumber"), nil, -1, 1, 0));
        }
        _uploadForm.style.position = "absolute";
        _uploadForm.style.top = "0px";
        _uploadForm.style.left = "0px";
        _uploadForm.style.zIndex = 1000;
        _fileUploadElement.style.opacity = "0";
        _fileUploadElement.style.filter = "alpha(opacity=0)";
        _uploadForm.style.width = "100%";
        _uploadForm.style.height = "100%";
        _fileUploadElement.style.fontSize = "1000px";
        if (document.attachEvent)
        {
            _fileUploadElement.style.position = "relative";
            _fileUploadElement.style.top = "-10px";
            _fileUploadElement.style.left = "-10px";
            _fileUploadElement.style.width = "1px";
        }
        else
            _fileUploadElement.style.cssFloat = "right";
        _fileUploadElement.onchange = function()
        {
            objj_msgSend(self, "uploadSelectionDidChange:",  _fileUploadElement.value);
        };
        _uploadForm.appendChild(_fileUploadElement);
        _DOMElement.appendChild(_uploadForm);
        _parameters = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(self, "setBordered:", NO);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setDelegate:"), function $UploadButton__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $UploadButton__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("setURL:"), function $UploadButton__setURL_(self, _cmd, aURL)
{ with(self)
{
    _uploadForm.action = aURL;
}
},["void","CPString"]), new objj_method(sel_getUid("uploadSelectionDidChange:"), function $UploadButton__uploadSelectionDidChange_(self, _cmd, selection)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButton:didChangeSelection:")))
        objj_msgSend(_delegate, "uploadButton:didChangeSelection:",  self,  selection);
}
},["void","CPString"]), new objj_method(sel_getUid("selection"), function $UploadButton__selection(self, _cmd)
{ with(self)
{
    return _fileUploadElement.value;
}
},["CPString"]), new objj_method(sel_getUid("resetSelection"), function $UploadButton__resetSelection(self, _cmd)
{ with(self)
{
    _fileUploadElement.value = "";
}
},["void"]), new objj_method(sel_getUid("uploadDidFinishWithResponse:"), function $UploadButton__uploadDidFinishWithResponse_(self, _cmd, response)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButton:didFinishUploadWithData:")))
        objj_msgSend(_delegate, "uploadButton:didFinishUploadWithData:",  self,  response);
}
},["void","CPString"]), new objj_method(sel_getUid("uploadDidFailWithError:"), function $UploadButton__uploadDidFailWithError_(self, _cmd, anError)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButton:didFailWithError:")))
        objj_msgSend(_delegate, "uploadButton:didFailWithError:",  self,  anError);
}
},["void","CPString"]), new objj_method(sel_getUid("setValue:forParameter:"), function $UploadButton__setValue_forParameter_(self, _cmd, aValue, aParam)
{ with(self)
{
    if(aParam == "file")
        return NO;
    objj_msgSend(_parameters, "setObject:forKey:", aValue, aParam);
    return YES;
}
},["BOOL","CPString","CPString"]), new objj_method(sel_getUid("parameters"), function $UploadButton__parameters(self, _cmd)
{ with(self)
{
    return _parameters;
}
},["void"]), new objj_method(sel_getUid("submit"), function $UploadButton__submit(self, _cmd)
{ with(self)
{
    _uploadForm.target = "FRAME_"+(new Date());
    var index = _uploadForm.childNodes.length;
    while(index--)
        _uploadForm.removeChild(_uploadForm.childNodes[index]);
    var keys = objj_msgSend(_parameters, "allKeys");
    for(var i = 0, count = keys.length; i<count; i++)
    {
        var element = document.createElement("input");
        element.type = "hidden";
        element.name = keys[i];
        element.value = objj_msgSend(_parameters, "objectForKey:", keys[i]);
        _uploadForm.appendChild(element);
    }
    _uploadForm.appendChild(_fileUploadElement);
    if(_DOMIFrameElement)
    {
        document.body.removeChild(_DOMIFrameElement);
        _DOMIFrameElement.onload = nil;
        _DOMIFrameElement = nil;
    }
    if(window.attachEvent)
    {
        _DOMIFrameElement = document.createElement("<iframe id=\"" + _uploadForm.target + "\" name=\"" + _uploadForm.target + "\" />");
        if(window.location.href.toLowerCase().indexOf("https") === 0)
            _DOMIFrameElement.src = "javascript:false";
    }
    else
    {
        _DOMIFrameElement = document.createElement("iframe");
        _DOMIFrameElement.name = _uploadForm.target;
    }
    _DOMIFrameElement.style.width = "1px";
    _DOMIFrameElement.style.height = "1px";
    _DOMIFrameElement.style.zIndex = -1000;
    _DOMIFrameElement.style.opacity = "0";
    _DOMIFrameElement.style.filter = "alpha(opacity=0)";
    document.body.appendChild(_DOMIFrameElement);
    _onloadHandler = function()
    {
        try
        {
            var responseText = _DOMIFrameElement.contentWindow.document.body ? _DOMIFrameElement.contentWindow.document.body.innerHTML :
                                                                               _DOMIFrameElement.contentWindow.document.documentElement.textContent;
            objj_msgSend(self, "uploadDidFinishWithResponse:",  responseText);
            window.setTimeout(function(){
                document.body.removeChild(_DOMIFrameElement);
                _DOMIFrameElement.onload = nil;
                _DOMIFrameElement = nil;
            }, 100);
        }
        catch (e)
        {
            objj_msgSend(self, "uploadDidFailWithError:", e);
        }
    }
    if (window.attachEvent)
    {
        _DOMIFrameElement.onreadystatechange = function()
        {
            if (this.readyState == "loaded" || this.readyState == "complete")
                _onloadHandler();
        }
    }
    _DOMIFrameElement.onload = _onloadHandler;
    _uploadForm.submit();
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButtonDidBeginUpload:")))
        objj_msgSend(_delegate, "uploadButtonDidBeginUpload:", self);
}
},["void"]), new objj_method(sel_getUid("disposeOfEvent:"), function $UploadButton__disposeOfEvent_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPLeftMouseDown)
        objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("disposeOfEvent:"), CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $UploadButton__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("disposeOfEvent:"), CPLeftMouseDownMask, nil, nil, YES);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadButton").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"])]);
}
_CPGUID= function()
{
    var g = "";
    for(var i = 0; i < 32; i++)
        g += Math.floor(Math.random() * 0xF).toString(0xF);
    return g;
}

