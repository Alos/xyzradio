@STATIC;1.0;t;3111;{var the_class = objj_allocateClassPair(CPWindow, "MainUserProfileWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("avatarImageView"), new objj_ivar("saveButton"), new objj_ivar("userNameTextField")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $MainUserProfileWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyleMask)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MainUserProfileWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
  if (self)
  {
   objj_msgSend(self, "setTitle:", "Profile");
   var contentView = objj_msgSend(self, "contentView");
   var bounds = objj_msgSend(contentView, "bounds");
   var center= CGRectGetWidth(bounds)/2.0;
   var defaultAvatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/usuario-hombre.png", CPSizeMake(87,88));
   objj_msgSend(defaultAvatarImage, "setDelegate:", self);
   avatarImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(20,20,87,88));
   objj_msgSend(avatarImageView, "setImage:",  defaultAvatarImage);
   objj_msgSend(contentView, "addSubview:", avatarImageView);
   var userNameLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(120, 30, 100, 50));
   objj_msgSend(userNameLabel, "setStringValue:", "User:");
   objj_msgSend(userNameLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(contentView, "addSubview:",  userNameLabel);
   userNameTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(155, 25, 100, 30));
   objj_msgSend(userNameTextField, "setEditable:", YES);
   objj_msgSend(userNameTextField, "setBezeled:", YES);
   objj_msgSend(contentView, "addSubview:",  userNameTextField);
   saveButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(220, 360, 40, 20));
   objj_msgSend(saveButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(saveButton, "setBezelStyle:", CPHUDBezelStyle);
   objj_msgSend(saveButton, "setTitle:", "Save");
   objj_msgSend(saveButton, "setTarget:", self);
   objj_msgSend(saveButton, "setAction:", sel_getUid("savePreferences"));
   objj_msgSend(contentView, "addSubview:",  saveButton);
  }
  return self;
 }
},["id",null,null]), new objj_method(sel_getUid("loadUserSettings"), function $MainUserProfileWindow__loadUserSettings(self, _cmd)
{ with(self)
{
 }
},["void"]), new objj_method(sel_getUid("savePreferences"), function $MainUserProfileWindow__savePreferences(self, _cmd)
{ with(self)
{
  bgImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/wallpapers/"+objj_msgSend(wallpaperMenus, "titleOfSelectedItem"), CPSizeMake(1440, 960));
  objj_msgSend(contentViewOfWindow, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", bgImage));
 }
},["void"])]);
}

