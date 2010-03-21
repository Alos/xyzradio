@STATIC;1.0;I;21;Foundation/CPObject.jt;1864;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPTextField, "DCLinkTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_oldTextColor"), new objj_ivar("HTML"), new objj_ivar("HTMLElement")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("HTML"), function $DCLinkTextField__HTML(self, _cmd)
{ with(self)
{
return HTML;
}
},["id"]),
new objj_method(sel_getUid("setHTML:"), function $DCLinkTextField__setHTML_(self, _cmd, newValue)
{ with(self)
{
HTML = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("HTMLElement"), function $DCLinkTextField__HTMLElement(self, _cmd)
{ with(self)
{
return HTMLElement;
}
},["id"]),
new objj_method(sel_getUid("setHTMLElement:"), function $DCLinkTextField__setHTMLElement_(self, _cmd, newValue)
{ with(self)
{
HTMLElement = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $DCLinkTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCLinkTextField").super_class }, "initWithFrame:", aFrame);
 if (self) {
  var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
  HTMLElement = document.createElement("div");
  HTMLElement.style.width = "100%";
  HTMLElement.style.height = "100%";
  contentView._DOMElement.appendChild(HTMLElement);
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setHTML:"), function $DCLinkTextField__setHTML_(self, _cmd, theHTML)
{ with(self)
{
 HTMLElement.innerHTML = theHTML;
}
},["void","CPString"]), new objj_method(sel_getUid("HTML"), function $DCLinkTextField__HTML(self, _cmd)
{ with(self)
{
 return HTMLElement.innerHTML;
}
},["void"])]);
}

