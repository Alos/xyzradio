@STATIC;1.0;t;3452;{var the_class = objj_allocateClassPair(CPWindow, "ProfileWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("avatarImageView"), new objj_ivar("backButton"), new objj_ivar("playButton"), new objj_ivar("forwardButton"), new objj_ivar("currentlyPlaying"), new objj_ivar("currentlyPlayingString"), new objj_ivar("addButton"), new objj_ivar("wallpaperMenus"), new objj_ivar("contentViewOfWindow")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $ProfileWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("ProfileWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
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
        var infoLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(120, 30, 100, 50));
        objj_msgSend(infoLabel, "setStringValue:", "User: oswa\nAge: 24");
        objj_msgSend(infoLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
 objj_msgSend(contentView, "addSubview:",  infoLabel);
        addButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(170, 360, 40, 20));
 objj_msgSend(addButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
        objj_msgSend(addButton, "setBezelStyle:", CPHUDBezelStyle);
        objj_msgSend(addButton, "setTitle:", "Add");
        objj_msgSend(addButton, "setTarget:", self);
        objj_msgSend(addButton, "setAction:", sel_getUid("savePreferences"));
        objj_msgSend(contentView, "addSubview:",  addButton);
        sendMailButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(220, 360, 70, 20));
 objj_msgSend(sendMailButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
        objj_msgSend(sendMailButton, "setBezelStyle:", CPHUDBezelStyle);
        objj_msgSend(sendMailButton, "setTitle:", "Send mail");
        objj_msgSend(sendMailButton, "setTarget:", self);
        objj_msgSend(sendMailButton, "setAction:", sel_getUid("savePreferences"));
        objj_msgSend(contentView, "addSubview:",  sendMailButton);
    }
    return self;
}
},["id",null,null]), new objj_method(sel_getUid("savePreferences"), function $ProfileWindow__savePreferences(self, _cmd)
{ with(self)
{
    bgImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/wallpapers/"+objj_msgSend(wallpaperMenus, "titleOfSelectedItem"), CPSizeMake(1440, 960));
    objj_msgSend(contentViewOfWindow, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", bgImage));
}
},["void"])]);
}

