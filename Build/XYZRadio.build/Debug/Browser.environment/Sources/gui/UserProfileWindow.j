@STATIC;1.0;t;5692;{var the_class = objj_allocateClassPair(CPWindow, "UserProfileWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("loginButton"), new objj_ivar("userid"), new objj_ivar("password"), new objj_ivar("parentWindow"), new objj_ivar("useridReq"), new objj_ivar("userPassReq")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $UserProfileWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UserProfileWindow").super_class }, "initWithContentRect:styleMask:",  aRectangle,  aStyle);
    if (self)
    {
  var contentView = objj_msgSend(self, "contentView");
     var usuarioLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(568, 252, 100, 30));
        objj_msgSend(usuarioLabel, "setStringValue:", "User:");
        objj_msgSend(usuarioLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
        objj_msgSend(usuarioLabel, "setBackgroundColor:", NULL);
  objj_msgSend(usuarioLabel, "sizeToFit");
  objj_msgSend(contentView, "addSubview:", usuarioLabel);
  userid = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(610, 248, 170, 30));
        objj_msgSend(userid, "setEditable:", YES);
        objj_msgSend(userid, "setBezeled:", YES);
        objj_msgSend(userid, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
        objj_msgSend(userid, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
  objj_msgSend(contentView, "addSubview:", userid);
  var passLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(540, 314, 100, 30));
        objj_msgSend(passLabel, "setStringValue:", "Password:");
        objj_msgSend(passLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
        objj_msgSend(passLabel, "setBackgroundColor:", NULL);
  objj_msgSend(passLabel, "sizeToFit");
  objj_msgSend(contentView, "addSubview:", passLabel);
  password = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(610, 308, 170, 30));
        objj_msgSend(password, "setEditable:", YES);
        objj_msgSend(password, "setBezeled:", YES);
  objj_msgSend(password, "setSecure:",  YES);
        objj_msgSend(password, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
        objj_msgSend(password, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "FFFFFF"));
  objj_msgSend(contentView, "addSubview:", password);
        loginButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(730, 360, 50, 18));
        objj_msgSend(loginButton, "setTitle:", "Login");
  objj_msgSend(loginButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
        objj_msgSend(loginButton, "setTarget:", self);
        objj_msgSend(loginButton, "setAction:", sel_getUid("loginActionPerformed"));
  objj_msgSend(contentView, "addSubview:", loginButton);
  var poweredByGoogleImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/appengine-silver-120x30.gif", CPSizeMake(127, 30));
  var poweredByGoogleImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(840, 750, 127, 30));
  objj_msgSend(poweredByGoogleImageView, "setImage:",  poweredByGoogleImage);
  objj_msgSend(contentView, "addSubview:",  poweredByGoogleImageView);
  objj_msgSend(self, "makeFirstResponder:", userid);
    }
    return self;
}
},["id","CGRect","unsignedint"]), new objj_method(sel_getUid("loginActionPerformed"), function $UserProfileWindow__loginActionPerformed(self, _cmd)
{ with(self)
{
 var useridReq = objj_msgSend(userid, "objectValue");
 var userPassReq = objj_msgSend(password, "objectValue");
 objj_msgSend(self, "loguser:password:",  useridReq,  userPassReq);
}
},["void"]), new objj_method(sel_getUid("loguser:password:"), function $UserProfileWindow__loguser_password_(self, _cmd, aUser, aPassword)
{ with(self)
{
 var url = "https://www.google.com/accounts/ClientLogin?Email=alosii@gmail.com&Passwd=20lonestar01&accountType=HOSTED_OR_GOOGLE&source=alos-xyzradio-1&service=ah";
 var request = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
 var xyzradioConnectionForLogin = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UserProfileWindow__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 var authValue = objj_msgSend(data, "componentsSeparatedByString:", "=");
 var urlWithToken = "http://xyzradioengine.appspot.com/_ah/login?auth="+authValue[3];
 var googleAuthentification = objj_msgSend(objj_msgSend(GoogleAuthentification, "alloc"), "initWithURL:", urlWithToken);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $UserProfileWindow__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $UserProfileWindow__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $UserProfileWindow__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == louhiConnection)
        louhiConnection = nil;
}
},["void","CPURLConnection"])]);
}

