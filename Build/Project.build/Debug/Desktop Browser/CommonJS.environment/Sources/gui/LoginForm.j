@STATIC;1.0;t;5002;


{var the_class = objj_allocateClassPair(CPView, "LoginForm"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("loginButton"), new objj_ivar("userid"), new objj_ivar("password"), new objj_ivar("newUserLabel"), new objj_ivar("instructionsLabel"), new objj_ivar("usuarioLabel"), new objj_ivar("passLabel")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $LoginForm__initWithFrame_(self, _cmd, aRectangle)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LoginForm").super_class }, "initWithFrame:",  aRectangle);
  if(self){


   instructionsLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 0, 100, 30));
   objj_msgSend(instructionsLabel, "setStringValue:", "Login to XYZRadio");
   objj_msgSend(instructionsLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(instructionsLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 18.0));
   objj_msgSend(instructionsLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", instructionsLabel);



   usuarioLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(10, 54, 100, 30));
   objj_msgSend(usuarioLabel, "setStringValue:", "Account:");
   objj_msgSend(usuarioLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(usuarioLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", usuarioLabel);

   userid = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(70, 48, 170, 30));
   objj_msgSend(userid, "setEditable:", YES);
   objj_msgSend(userid, "setBezeled:", YES);
   objj_msgSend(userid, "setPlaceholderString:", "bob@gmail.com");
   objj_msgSend(userid, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
   objj_msgSend(self, "addSubview:", userid);


   passLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 96, 100, 30));
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

   loginButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(190, 140, 50, 18));
   objj_msgSend(loginButton, "setTitle:", "Login");
   objj_msgSend(loginButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(loginButton, "setTarget:", self);
   objj_msgSend(loginButton, "setAction:", sel_getUid("loginActionPerformed"));
   objj_msgSend(self, "addSubview:", loginButton);




   newUserLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 220, 100, 30));
   objj_msgSend(newUserLabel, "setStringValue:", "New user?");
   objj_msgSend(newUserLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
   objj_msgSend(newUserLabel, "sizeToFit");
   objj_msgSend(self, "addSubview:", newUserLabel);

   newUserButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(65, 220, 170, 30));
   objj_msgSend(newUserButton, "setTitle:", "Create an account");
   objj_msgSend(newUserButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(newUserButton, "setTarget:", self);
   objj_msgSend(newUserButton, "sizeToFit");
   objj_msgSend(newUserButton, "setAction:", sel_getUid("newUserActionPerformed"));
   objj_msgSend(self, "addSubview:", newUserButton);

  }
  return self;
 }
},["id","CGRect"]), new objj_method(sel_getUid("newUserActionPerformed"), function $LoginForm__newUserActionPerformed(self, _cmd)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "newUserActionPerformed", self);
 }
},["void"]), new objj_method(sel_getUid("loginActionPerformed"), function $LoginForm__loginActionPerformed(self, _cmd)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "loginActionPerformed", self);
 }
},["void"]), new objj_method(sel_getUid("getUserEmail"), function $LoginForm__getUserEmail(self, _cmd)
{ with(self)
{
  return objj_msgSend(userid, "objectValue");
 }
},["CPString"]), new objj_method(sel_getUid("getUserPass"), function $LoginForm__getUserPass(self, _cmd)
{ with(self)
{
  return objj_msgSend(password, "objectValue");
 }
},["CPString"])]);
}

