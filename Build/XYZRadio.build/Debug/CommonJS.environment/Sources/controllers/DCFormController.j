@STATIC;1.0;I;21;Foundation/CPObject.ji;21;CPPropertyAnimation.ji;19;../gui/DCFormView.jt;4312;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("CPPropertyAnimation.j", YES);
objj_executeFile("../gui/DCFormView.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "DCFormController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("sheet"), new objj_ivar("formView"), new objj_ivar("shadeView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("formView"), function $DCFormController__formView(self, _cmd)
{ with(self)
{
return formView;
}
},["id"]),
new objj_method(sel_getUid("setFormView:"), function $DCFormController__setFormView_(self, _cmd, newValue)
{ with(self)
{
formView = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFormView:"), function $DCFormController__initWithFormView_(self, _cmd, aFormView)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCFormController").super_class }, "init");
 if (self) {
  formView = aFormView;
  objj_msgSend(formView, "setDelegate:", self);
  sheet = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, objj_msgSend(formView, "frame").size.width, objj_msgSend(formView, "frame").size.height), CPBorderlessWindowMask);
  objj_msgSend(sheet, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMaxYMargin);
  objj_msgSend(sheet, "setHasShadow:", YES);
  objj_msgSend(sheet, "setContentView:", formView);
  shadeView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "delegate"), "theWindow"), "contentView"), "bounds"));
  objj_msgSend(shadeView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
  objj_msgSend(shadeView, "setAlphaValue:", 0.5);
  objj_msgSend(shadeView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
 }
 return self;
}
},["id","DCFormView"]), new objj_method(sel_getUid("startForm"), function $DCFormController__startForm(self, _cmd)
{ with(self)
{
 var mainWindow = objj_msgSend(objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "delegate"), "theWindow");
 objj_msgSend(objj_msgSend(mainWindow, "contentView"), "addSubview:", shadeView);
 objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "runModalForWindow:", sheet);
 objj_msgSend(sheet, "setFrame:", CGRectMake(
  (objj_msgSend(mainWindow, "frame").size.width / 2) - (objj_msgSend(sheet, "frame").size.width / 2),
  -objj_msgSend(sheet, "frame").size.height - 20,
  objj_msgSend(sheet, "frame").size.width,
  objj_msgSend(sheet, "frame").size.height));
 var anim = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", sheet, "frame");
 objj_msgSend(anim, "setStart:", CGRectMakeCopy(objj_msgSend(sheet, "frame")));
 objj_msgSend(anim, "setEnd:", CGRectMake(objj_msgSend(sheet, "frame").origin.x, -20, objj_msgSend(sheet, "frame").size.width, objj_msgSend(sheet, "frame").size.height));
 objj_msgSend(anim, "setDuration:", 0.3);
 objj_msgSend(anim, "startAnimation");
 objj_msgSend(sheet, "orderFront:", objj_msgSend(objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "delegate"), "theWindow"));
 objj_msgSend(sheet, "becomeKeyWindow");
 objj_msgSend(formView, "didShow");
}
},["void"]), new objj_method(sel_getUid("endForm"), function $DCFormController__endForm(self, _cmd)
{ with(self)
{
 objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "stopModal");
 objj_msgSend(shadeView, "removeFromSuperview");
 var anim = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", sheet, "frame");
 objj_msgSend(anim, "setStart:", CGRectMakeCopy(objj_msgSend(sheet, "frame")));
 objj_msgSend(anim, "setEnd:", CGRectMake(objj_msgSend(sheet, "frame").origin.x, -objj_msgSend(sheet, "frame").size.height - 20, objj_msgSend(sheet, "frame").size.width, objj_msgSend(sheet, "frame").size.height));
 objj_msgSend(anim, "setDuration:", 0.3);
 objj_msgSend(anim, "setDelegate:", self);
 objj_msgSend(anim, "startAnimation");
}
},["void"]), new objj_method(sel_getUid("animationDidEnd:"), function $DCFormController__animationDidEnd_(self, _cmd, animation)
{ with(self)
{
 objj_msgSend(sheet, "orderOut:", nil);
}
},["void","CPAnimation"])]);
}

