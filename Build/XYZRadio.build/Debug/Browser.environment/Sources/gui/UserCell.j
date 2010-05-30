@STATIC;1.0;I;15;AppKit/CPView.jt;4986;

objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "UserCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("userNickTextField"), new objj_ivar("image"), new objj_ivar("userView"), new objj_ivar("highlightView"), new objj_ivar("glassImageView"), new objj_ivar("raterView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function $UserCell__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{

    if(!userView)
    {
  var backImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/70/userBG.png", CPSizeMake(246, 91));
        userView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 246, 91));
  objj_msgSend(userView, "setImage:", backImage);
        objj_msgSend(self, "addSubview:", userView);
    }
 if(objj_msgSend(anObject, "pathToAvatar") == ""){
  CPLog.info("No path!");
  if(objj_msgSend(anObject, "sex")=="MALE"){
   if(objj_msgSend(anObject, "dj")== YES){
    var avatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/70/usuario-dj-hombre.png", CPSizeMake(87, 88));
    var avatarImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 87, 88));
    objj_msgSend(avatarImageView, "setImage:", avatarImage);
    objj_msgSend(self, "addSubview:", avatarImageView);
   }else{
    var avatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/70/usuario-hombre.png", CPSizeMake(87, 88));
    var avatarImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 87, 88));
    objj_msgSend(avatarImageView, "setImage:", avatarImage);
    objj_msgSend(self, "addSubview:", avatarImageView);
   }
  }else{
   if(objj_msgSend(anObject, "dj")== YES){
    var avatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/70/usuario-dj-mujer.png", CPSizeMake(87, 88));
    var avatarImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 87, 88));
    objj_msgSend(avatarImageView, "setImage:", avatarImage);
    objj_msgSend(self, "addSubview:", avatarImageView);
   }else{
    var avatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/70/usuario-mujer.png", CPSizeMake(87, 88));
    var avatarImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 87, 88));
    objj_msgSend(avatarImageView, "setImage:", avatarImage);
    objj_msgSend(self, "addSubview:", avatarImageView);
   }
  }
 }else{


 }

 if(!userNickTextField)
  userNickTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(100, 20, 350, 24));
 objj_msgSend(userNickTextField, "setStringValue:", objj_msgSend(anObject, "usernick"));
 objj_msgSend(userNickTextField, "sizeToFit");
 objj_msgSend(userNickTextField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
    objj_msgSend(self, "addSubview:",  userNickTextField);

 if(!raterView){
    raterView = objj_msgSend(objj_msgSend(StarRatingView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 300, 25));

 }
 objj_msgSend(raterView, "setFrameOrigin:", CGPointMake(100, 40));
 objj_msgSend(self, "addSubview:",  raterView);
 var control = objj_msgSend(raterView, "rater");
 objj_msgSend(control, "setIntValue:",  objj_msgSend(anObject, "userRating"));

 if(!glassImageView){
   glassImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 246, 91));
 }
 var glassImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/70/userInfoGlow.png", CPSizeMake(246, 91));
 objj_msgSend(glassImageView, "setImage:", glassImage);
 objj_msgSend(glassImageView, "setAlphaValue:", .3);
 objj_msgSend(self, "addSubview:", glassImageView);
}
},["void","JSObject"]), new objj_method(sel_getUid("imageDidLoad:"), function $UserCell__imageDidLoad_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(userView, "setImage:", anImage);
}
},["void","CPImage"]), new objj_method(sel_getUid("setSelected:"), function $UserCell__setSelected_(self, _cmd, flag)
{ with(self)
{
    if(!highlightView)
    {
        highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(highlightView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.8, 0.6));
        objj_msgSend(highlightView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    }

    if(flag)
    {
  objj_msgSend(glassImageView, "setAlphaValue:", .5);
    }
    else{
        objj_msgSend(glassImageView, "setAlphaValue:", .3);
 }
}
},["void","BOOL"])]);
}

