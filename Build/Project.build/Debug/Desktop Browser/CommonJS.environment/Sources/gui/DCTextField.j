@STATIC;1.0;I;21;Foundation/CPObject.jt;5251;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPControl, "DCTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMTextElement"), new objj_ivar("delegate"), new objj_ivar("required"), new objj_ivar("name")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $DCTextField__delegate(self, _cmd)
{ with(self)
{
return delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $DCTextField__setDelegate_(self, _cmd, newValue)
{ with(self)
{
delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("required"), function $DCTextField__required(self, _cmd)
{ with(self)
{
return required;
}
},["id"]),
new objj_method(sel_getUid("setRequired:"), function $DCTextField__setRequired_(self, _cmd, newValue)
{ with(self)
{
required = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("name"), function $DCTextField__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $DCTextField__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $DCTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "initWithFrame:", aFrame);
 if (self) {
  required = NO;
  var padding = 2;
  var border = 1;
  _DOMTextElement = document.createElement("input");
  _DOMTextElement.type = "text";
  _DOMTextElement.style.position = "absolute";
  _DOMTextElement.style.top = "0px";
  _DOMTextElement.style.left = "0px";
  _DOMTextElement.style.width = (objj_msgSend(self, "frame").size.width - (padding * 2) - (border * 2)) + "px";
  _DOMTextElement.style.height = (objj_msgSend(self, "frame").size.height - (padding * 2) - (border * 2)) + "px";
  _DOMTextElement.style.whiteSpace = "pre";
  _DOMTextElement.style.zIndex = 100;
  _DOMTextElement.style.padding = padding +"px";
  _DOMTextElement.style.margin = "0px";
  _DOMTextElement.style.border = "1px solid #999999";
  _DOMElement.appendChild(_DOMTextElement);
  _DOMElement.style.overflow = "visible";
  _DOMTextElement.onkeypress = function(aDOMEvent) {
   aDOMEvent = aDOMEvent || window.event;
   if (aDOMEvent.keyCode == 13) {
    if (aDOMEvent.preventDefault)
     aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
     aDOMEvent.stopPropagation();
    aDOMEvent.cancelBubble = true;
    _DOMTextElement.blur();
    objj_msgSend(self, "commitAction");
   }
  };
  _DOMTextElement.onkeydown = function(aDOMEvent) {
   aDOMEvent = aDOMEvent || window.event;
   if (aDOMEvent.keyCode == 27) {
    if (aDOMEvent.preventDefault)
     aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
     aDOMEvent.stopPropagation();
    aDOMEvent.cancelBubble = true;
    _DOMTextElement.blur();
    objj_msgSend(self, "cancelAction");
   }
  };
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("becomeFirstResponder"), function $DCTextField__becomeFirstResponder(self, _cmd)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "becomeFirstResponder");
 objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0, self, sel_getUid("focus"), nil, NO);
 return YES;
}
},["BOOL"]), new objj_method(sel_getUid("focus"), function $DCTextField__focus(self, _cmd)
{ with(self)
{
 _DOMTextElement.focus();
}
},["void"]), new objj_method(sel_getUid("setStringValue:"), function $DCTextField__setStringValue_(self, _cmd, aString)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "setStringValue:", aString);
 _DOMTextElement.value = aString;
}
},["void","CPString"]), new objj_method(sel_getUid("stringValue"), function $DCTextField__stringValue(self, _cmd)
{ with(self)
{
 return _DOMTextElement.value;
}
},["CPString"]), new objj_method(sel_getUid("setEnabled:"), function $DCTextField__setEnabled_(self, _cmd, yesNo)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "setEnabled:", yesNo);
 if (objj_msgSend(self, "isEnabled") == YES) {
  _DOMTextElement.disabled = false;
  objj_msgSend(self, "setAlphaValue:", 1);
 } else {
  _DOMTextElement.disabled = true;
  objj_msgSend(self, "setAlphaValue:", 0.6);
 }
}
},["void","bool"]), new objj_method(sel_getUid("commitAction"), function $DCTextField__commitAction(self, _cmd)
{ with(self)
{
 if (objj_msgSend(self, "delegate") != nil) {
  if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("commitAction"))) {
   objj_msgSend(objj_msgSend(self, "delegate"), "performSelector:", sel_getUid("commitAction"));
  }
 }
}
},["void"]), new objj_method(sel_getUid("cancelAction"), function $DCTextField__cancelAction(self, _cmd)
{ with(self)
{
 if (objj_msgSend(self, "delegate") != nil) {
  if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("cancelAction"))) {
   objj_msgSend(objj_msgSend(self, "delegate"), "performSelector:", sel_getUid("cancelAction"));
  }
 }
}
},["void"])]);
}

