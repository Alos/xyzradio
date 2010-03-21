@STATIC;1.0;i;12;CPLightbox.ji;17;DCLinkTextField.ji;9;XYZUser.ji;11;LoginForm.ji;12;SigninForm.jt;11808;objj_executeFile("CPLightbox.j", YES);
objj_executeFile("DCLinkTextField.j", YES);
objj_executeFile("XYZUser.j", YES);
objj_executeFile("LoginForm.j", YES);
objj_executeFile("SigninForm.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "LoginWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("loginForm"), new objj_ivar("signinForm"), new objj_ivar("useridReq"), new objj_ivar("userPassReq"), new objj_ivar("app"), new objj_ivar("contentView"), new objj_ivar("animFadeInLog"), new objj_ivar("animFadeOutLog"), new objj_ivar("animFadeInSign"), new objj_ivar("animFadeOutSign")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $LoginWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyle)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("LoginWindow").super_class }, "initWithContentRect:styleMask:",  aRectangle,  aStyle);
  if (self)
  {
   contentView = objj_msgSend(self, "contentView");
   app = objj_msgSend(CPApp, "delegate");
   var bgImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/fondo-login.jpg", CPSizeMake(1000, 800));
   var bgImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 1000, 800));
   objj_msgSend(bgImageView, "setImage:",  bgImage);
   objj_msgSend(contentView, "addSubview:",  bgImageView);
   loginForm = objj_msgSend(objj_msgSend(LoginForm, "alloc"), "initWithFrame:", CGRectMake(600, 200, 500, 600));
   objj_msgSend(contentView, "addSubview:",  loginForm);
   var poweredByGoogleImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/appengine-silver-120x30.gif", CPSizeMake(127, 30));
   var poweredByGoogleImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(840, 750, 127, 30));
   objj_msgSend(poweredByGoogleImageView, "setImage:",  poweredByGoogleImage);
   objj_msgSend(contentView, "addSubview:",  poweredByGoogleImageView);
   var helpLink = objj_msgSend(objj_msgSend(DCLinkTextField, "alloc"), "initWithFrame:", CGRectMake(20, 750, 100, 30));
   objj_msgSend(helpLink, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
   objj_msgSend(helpLink, "HTMLElement").style.color = "#FFFFFF";
   objj_msgSend(helpLink, "HTMLElement").style.fontSize = "12px";
   objj_msgSend(helpLink, "HTMLElement").style.fontFamily = "Helvetica, Sans-Serif";
   objj_msgSend(helpLink, "HTMLElement").style.fontColor = "#FFFFFF";
   objj_msgSend(helpLink, "HTMLElement").style.lineHeight = "1.5em";
   objj_msgSend(helpLink, "setHTML:",  "<a href=\"xyzradioHelpp.html\" style=\"color:#ffffff;\">Help</a>");
   objj_msgSend(contentView, "addSubview:",  helpLink);
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("fadeoutLoginSection:"), "newUserActionPerformed", nil);
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("loginActionPerformed:"), "loginActionPerformed", nil);
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("createAccountActionPerformed:"), "createAccountActionPerformed", nil);
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("fadeoutSigninSection:"), "cancelButtonActionPerformed", nil);
  }
  return self;
 }
},["id","CGRect","unsignedint"]), new objj_method(sel_getUid("loginActionPerformed:"), function $LoginWindow__loginActionPerformed_(self, _cmd, aNotification)
{ with(self)
{
  var useridReq = objj_msgSend(loginForm, "getUserEmail");
  var userPassReq = objj_msgSend(loginForm, "getUserPass");
  userPassReq = b64_md5(userPassReq);
  objj_msgSend(self, "loguser:password:",  useridReq,  userPassReq);
 }
},["void","CPNotification"]), new objj_method(sel_getUid("createAccountActionPerformed:"), function $LoginWindow__createAccountActionPerformed_(self, _cmd, aNotification)
{ with(self)
{
  var useridReq = objj_msgSend(signinForm, "getUserAccount");
  var userPassReq = objj_msgSend(signinForm, "getUserPass");
  var userNameReq = objj_msgSend(signinForm, "getUserName");
  var userSexReq = objj_msgSend(signinForm, "getUserSex");
  userPassReq = b64_md5(userPassReq);
  objj_msgSend(self, "createUserAccount:password:name:sex:", useridReq, userPassReq, userNameReq, userSexReq);
 }
},["void","CPNotification"]), new objj_method(sel_getUid("animationDidEnd:"), function $LoginWindow__animationDidEnd_(self, _cmd, animation)
{ with(self)
{
  if(animation == animFadeOutLog){
   CPLog.info("Removing loginform");
   objj_msgSend(loginForm, "removeFromSuperview");
   loginForm = nil;
   CPLog.info("Adding the sign in form");
   objj_msgSend(self, "fadeinSigninSection");
  }
  if(animation == animFadeOutSign){
   CPLog.info("Removing signinform");
   objj_msgSend(signinForm, "removeFromSuperview");
   signinForm = nil;
   CPLog.info("Adding the login form");
   objj_msgSend(self, "fadeinLoginSection");
  }
 }
},["void","CPAnimation"]), new objj_method(sel_getUid("fadeinLoginSection"), function $LoginWindow__fadeinLoginSection(self, _cmd)
{ with(self)
{
  CPLog.info("Adding loginform");
  loginForm = objj_msgSend(objj_msgSend(LoginForm, "alloc"), "initWithFrame:", CGRectMake(600, 200, 500, 600));
  objj_msgSend(loginForm, "setAlphaValue:", 0);
  objj_msgSend(contentView, "addSubview:",  loginForm);
  animFadeInLog = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", loginForm, "alphaValue");
  objj_msgSend(animFadeInLog, "setStart:", 0);
  objj_msgSend(animFadeInLog, "setEnd:", 1);
  objj_msgSend(animFadeInLog, "setDuration:", 1.0);
  objj_msgSend(animFadeInLog, "startAnimation");
  objj_msgSend(animFadeInLog, "setDelegate:",  self);
 }
},["void"]), new objj_method(sel_getUid("fadeoutLoginSection:"), function $LoginWindow__fadeoutLoginSection_(self, _cmd, aNotification)
{ with(self)
{
  animFadeOutLog = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", loginForm, "alphaValue");
  objj_msgSend(animFadeOutLog, "setStart:", 1);
  objj_msgSend(animFadeOutLog, "setEnd:", 0);
  objj_msgSend(animFadeOutLog, "setDuration:", 1.0);
  objj_msgSend(animFadeOutLog, "startAnimation");
  objj_msgSend(animFadeOutLog, "setDelegate:",  self);
 }
},["void","CPNotification"]), new objj_method(sel_getUid("fadeinSigninSection"), function $LoginWindow__fadeinSigninSection(self, _cmd)
{ with(self)
{
  CPLog.info("Adding sign in form");
  signinForm = objj_msgSend(objj_msgSend(SigninForm, "alloc"), "initWithFrame:", CGRectMake(600, 200, 500, 600));
  objj_msgSend(signinForm, "setAlphaValue:", 0);
  objj_msgSend(contentView, "addSubview:",  signinForm);
  animFadeInSign = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", signinForm, "alphaValue");
  objj_msgSend(animFadeInSign, "setStart:", 0);
  objj_msgSend(animFadeInSign, "setEnd:", 1);
  objj_msgSend(animFadeInSign, "setDuration:", 1.0);
  objj_msgSend(animFadeInSign, "startAnimation");
  objj_msgSend(animFadeInSign, "setDelegate:",  self);
 }
},["void"]), new objj_method(sel_getUid("fadeoutSigninSection:"), function $LoginWindow__fadeoutSigninSection_(self, _cmd, aNotification)
{ with(self)
{
  animFadeOutSign = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", signinForm, "alphaValue");
  objj_msgSend(animFadeOutSign, "setStart:", 1);
  objj_msgSend(animFadeOutSign, "setEnd:", 0);
  objj_msgSend(animFadeOutSign, "setDuration:", 1.0);
  objj_msgSend(animFadeOutSign, "startAnimation");
  objj_msgSend(animFadeOutSign, "setDelegate:",  self);
 }
},["void","CPNotification"]), new objj_method(sel_getUid("loguser:password:"), function $LoginWindow__loguser_password_(self, _cmd, aUser, aPassword)
{ with(self)
{
  var url = objj_msgSend(app, "serverIP")+"/LoginUser?email="+aUser+"&passwd="+aPassword;
  CPLog.info("Connecting to" + url);
  var request = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
  var xyzradioConnectionForLogin = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
 }
},["void","CPString","CPString"]), new objj_method(sel_getUid("createUserAccount:password:name:sex:"), function $LoginWindow__createUserAccount_password_name_sex_(self, _cmd, anAccount, aPassword, aName, aSex)
{ with(self)
{
  var url = objj_msgSend(app, "serverIP")+"/NewUser?account="+anAccount+"&password="+aPassword+"&name="+aName+"&sex="+aSex;
  CPLog.info("Connecting to " + url);
  var request = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
  var xyzradioConnectionForLogin = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
 }
},["void","CPString","CPString","CPString","CPString"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $LoginWindow__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
  CPLog.trace("La data en loging window: %s", data);
  try{
   var response = JSON.parse(data);
   if(response.error){
    CPLog.error(response.error);
   }
   if(response){
    var userRecived = objj_msgSend(objj_msgSend(XYZUser, "alloc"), "init");
    objj_msgSend(userRecived, "setEmail:",  response.email);
    objj_msgSend(userRecived, "setUsernick:",  response.usernick);
    if(response.pathToAvatar)
     objj_msgSend(userRecived, "setPathToAvatar:",  response.pathToAvatar);
    else
     objj_msgSend(userRecived, "setPathToAvatar:", "");
    objj_msgSend(userRecived, "setLogged:",  response.logged);
    if(response.dj)
     objj_msgSend(userRecived, "setDj:", YES);
    else
     objj_msgSend(userRecived, "setDj:", NO);
    objj_msgSend(userRecived, "setSex:",  response.sex);
    objj_msgSend(userRecived, "setDjList1:",  response.djList1);
    objj_msgSend(userRecived, "setDjList2:",  response.djList2);
    objj_msgSend(userRecived, "setDjList3:",  response.djList3);
    objj_msgSend(userRecived, "setOwnedSongs:",  response.ownedSongs);
    objj_msgSend(userRecived, "setUserRating:",  response.userRating);
    var somePrefrences = objj_msgSend(objj_msgSend(XYZUserPrefrences, "alloc"), "init");
    objj_msgSend(userRecived, "setPrefrences:",  somePrefrences);
    var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", userRecived, "user");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "LoginSuccessful", self, info);
   }
  }catch(e){
   var mensajeGuardar = objj_msgSend(objj_msgSend(CPAlert, "alloc"), "init");
   objj_msgSend(mensajeGuardar, "setTitle:", "Server not available");
   objj_msgSend(mensajeGuardar, "setWindowStyle:", CPHUDBackgroundWindowMask);
   objj_msgSend(mensajeGuardar, "setMessageText:", "Sorry, the server is not available. Please try again later.");
   objj_msgSend(mensajeGuardar, "addButtonWithTitle:", "Ok");
   objj_msgSend(mensajeGuardar, "runModal");
  }
 }
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $LoginWindow__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
 }
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $LoginWindow__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
 }
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $LoginWindow__clearConnection_(self, _cmd, connection)
{ with(self)
{
        if ( connection == xyzradioConnectionForLogin)
            louhiConnection = nil;
 }
},["void","CPURLConnection"])]);
}

