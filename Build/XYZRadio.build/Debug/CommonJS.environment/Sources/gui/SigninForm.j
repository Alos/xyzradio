@STATIC;1.0;t;8601;



{var the_class = objj_allocateClassPair(CPView, "SigninForm"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("instructionsLabel"), new objj_ivar("accountLabel"), new objj_ivar("passLabel"), new objj_ivar("userNameLabel"), new objj_ivar("account"), new objj_ivar("password"), new objj_ivar("userName"), new objj_ivar("maleButton"), new objj_ivar("femaleButton"), new objj_ivar("acceptButton"), new objj_ivar("cancelButton")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $SigninForm__initWithFrame_(self, _cmd, aRectangle)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SigninForm").super_class }, "initWithFrame:",  aRectangle);
  if(self){


   instructionsLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 0, 100, 30));
   objj_msgSend(instructionsLabel, "setStringValue:", "Create an Account!");
   objj_msgSend(instructionsLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(instructionsLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 18.0));
   objj_msgSend(instructionsLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", instructionsLabel);



   accountLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(15, 54, 100, 30));
   objj_msgSend(accountLabel, "setStringValue:", "Account:");
   objj_msgSend(accountLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(accountLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", accountLabel);

   account = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(70, 48, 170, 30));
   objj_msgSend(account, "setEditable:", YES);
   objj_msgSend(account, "setBezeled:", YES);
   objj_msgSend(account, "setPlaceholderString:", "bob@gmail.com");
   objj_msgSend(account, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
   objj_msgSend(self, "addSubview:", account);


   passLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(5, 96, 100, 30));
   objj_msgSend(passLabel, "setStringValue:", "Password:");
   objj_msgSend(passLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(passLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", passLabel);

   password = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(70, 90, 170, 30));
   objj_msgSend(password, "setEditable:", YES);
   objj_msgSend(password, "setBezeled:", YES);
   objj_msgSend(password, "setSecure:",  YES);
   objj_msgSend(password, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
   objj_msgSend(self, "addSubview:", password);


   userNameLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 138, 100, 30));
   objj_msgSend(userNameLabel, "setStringValue:", "User name:");
   objj_msgSend(userNameLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(userNameLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", userNameLabel);

   userName = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(70, 132, 170, 30));
   objj_msgSend(userName, "setEditable:", YES);
   objj_msgSend(userName, "setBezeled:", YES);
   objj_msgSend(userName, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
   objj_msgSend(self, "addSubview:", userName);


   var sexLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(40, 179, 100, 30));
   objj_msgSend(sexLabel, "setStringValue:", "Sex:");
   objj_msgSend(sexLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(sexLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", sexLabel);

   maleButton = objj_msgSend(objj_msgSend(CPRadio, "alloc"), "initWithFrame:", CGRectMake(70, 180, 30, 30));
   objj_msgSend(maleButton, "setObjectValue:", CPOnState);
   objj_msgSend(self, "addSubview:", maleButton);

   var maleLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(87, 179, 100, 30));
   objj_msgSend(maleLabel, "setStringValue:", "Male");
   objj_msgSend(maleLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(maleLabel, "setBackgroundColor:", NULL);
   objj_msgSend(maleLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", maleLabel);

   femaleButton = objj_msgSend(objj_msgSend(CPRadio, "alloc"), "initWithFrame:radioGroup:", CGRectMake(150, 180, 30, 30), objj_msgSend(maleButton, "radioGroup"));
   objj_msgSend(self, "addSubview:", femaleButton);

   var femaleLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(167, 179, 100, 30));
   objj_msgSend(femaleLabel, "setStringValue:", "Female");
   objj_msgSend(femaleLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(femaleLabel, "setBackgroundColor:", NULL);
   objj_msgSend(femaleLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", femaleLabel);


   var termsLabel = objj_msgSend(objj_msgSend(DCLinkTextField, "alloc"), "initWithFrame:", CGRectMake(0, 220, 500, 30));
   objj_msgSend(termsLabel, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
   objj_msgSend(termsLabel, "HTMLElement").style.color = "#FFFFFF";
   objj_msgSend(termsLabel, "HTMLElement").style.fontSize = "12px";
   objj_msgSend(termsLabel, "HTMLElement").style.fontFamily = "Helvetica, Sans-Serif";
   objj_msgSend(termsLabel, "HTMLElement").style.fontColor = "#FFFFFF";
   objj_msgSend(termsLabel, "HTMLElement").style.lineHeight = "1.5em";
   objj_msgSend(termsLabel, "setHTML:",  "By clicking on 'I accept' below you are agreeing to the <a href=\"Terms of Service.html\" style=\"color:#ffffff;\">Terms of Service</a>");
   objj_msgSend(self, "addSubview:",  termsLabel);


   acceptButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(120, 262, 50, 18));
   objj_msgSend(acceptButton, "setTitle:", "I accept. Create my account.");
   objj_msgSend(acceptButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(acceptButton, "sizeToFit");
   objj_msgSend(acceptButton, "setTarget:", self);
   objj_msgSend(acceptButton, "setAction:", sel_getUid("createAccountActionPerformed"));
   objj_msgSend(self, "addSubview:", acceptButton);

   cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(65, 262, 170, 30));
   objj_msgSend(cancelButton, "setTitle:", "Cancel");
   objj_msgSend(cancelButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(cancelButton, "sizeToFit");
   objj_msgSend(cancelButton, "setTarget:", self);
   objj_msgSend(cancelButton, "setAction:", sel_getUid("cancelButtonActionPerformed"));
   objj_msgSend(self, "addSubview:", cancelButton);

  }
  return self;
 }
},["id","CGRect"]), new objj_method(sel_getUid("createAccountActionPerformed"), function $SigninForm__createAccountActionPerformed(self, _cmd)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "createAccountActionPerformed", self);
 }
},["void"]), new objj_method(sel_getUid("cancelButtonActionPerformed"), function $SigninForm__cancelButtonActionPerformed(self, _cmd)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "cancelButtonActionPerformed", self);
 }
},["void"]), new objj_method(sel_getUid("getUserAccount"), function $SigninForm__getUserAccount(self, _cmd)
{ with(self)
{
  return objj_msgSend(account, "objectValue");
 }
},["CPString"]), new objj_method(sel_getUid("getUserPass"), function $SigninForm__getUserPass(self, _cmd)
{ with(self)
{
  return objj_msgSend(password, "objectValue");
 }
},["CPString"]), new objj_method(sel_getUid("getUserName"), function $SigninForm__getUserName(self, _cmd)
{ with(self)
{
  return objj_msgSend(userName, "objectValue");
 }
},["CPString"]), new objj_method(sel_getUid("getUserSex"), function $SigninForm__getUserSex(self, _cmd)
{ with(self)
{
  CPLog.info(objj_msgSend(objj_msgSend(maleButton, "radioGroup"), "selectedRadio"));
  if(objj_msgSend(objj_msgSend(maleButton, "radioGroup"), "selectedRadio") == maleButton)
   return "MALE";
  else
   return "FEMALE";
 }
},["CPString"])]);
}

