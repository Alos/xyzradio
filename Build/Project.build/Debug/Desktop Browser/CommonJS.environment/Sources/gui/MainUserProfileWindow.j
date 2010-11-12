@STATIC;1.0;i;21;../dataStore/UserDS.jt;5609;objj_executeFile("../dataStore/UserDS.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "MainUserProfileWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("avatarImageView"), new objj_ivar("saveButton"), new objj_ivar("userNameTextField"), new objj_ivar("user"), new objj_ivar("userDS")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $MainUserProfileWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyleMask)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MainUserProfileWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
        if (self)
        {
            objj_msgSend(self, "setTitle:", "Profile");
            userDS = objj_msgSend(objj_msgSend(UserDS, "alloc"), "init");
            objj_msgSend(userDS, "getUserData");
            var contentView = objj_msgSend(self, "contentView");
            var bounds = objj_msgSend(contentView, "bounds");
            var center= CGRectGetWidth(bounds)/2.0;
            var userNameLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(120, 30, 100, 50));
            objj_msgSend(userNameLabel, "setStringValue:", "User:");
            objj_msgSend(userNameLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(contentView, "addSubview:",  userNameLabel);
            userNameTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(155, 25, 130, 30));
            objj_msgSend(userNameTextField, "setEditable:", YES);
            objj_msgSend(userNameTextField, "setBezeled:", YES);
            objj_msgSend(contentView, "addSubview:",  userNameTextField);
            var ageLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(120, 70, 100, 50));
            objj_msgSend(ageLabel, "setStringValue:", "Sex:");
            objj_msgSend(ageLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(contentView, "addSubview:",  ageLabel);
            var arr =objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            objj_msgSend(arr, "addObject:", "Male")
            objj_msgSend(arr, "addObject:", "Female");
            sexMenu =objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(155, 70, 100, 24));
            objj_msgSend(sexMenu, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(sexMenu, "addItemsWithTitles:", arr);
            objj_msgSend(contentView, "addSubview:",  sexMenu);
            saveButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(220, 360, 40, 20));
            objj_msgSend(saveButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(saveButton, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(saveButton, "setTitle:", "Save");
            objj_msgSend(saveButton, "sizeToFit");
            objj_msgSend(saveButton, "setTarget:", self);
            objj_msgSend(saveButton, "setAction:", sel_getUid("savePreferences"));
            objj_msgSend(contentView, "addSubview:",  saveButton);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("userRecieved:"), "UserDataReceived", nil);
        }
        return self;
    }
},["id",null,null]), new objj_method(sel_getUid("userRecieved:"), function $MainUserProfileWindow__userRecieved_(self, _cmd, aNotification)
{ with(self)
{
        var info = objj_msgSend(aNotification, "userInfo");
        user = objj_msgSend(info, "objectForKey:", "UserData");
        objj_msgSend(self, "setupWindow");
    }
},["void","CPNotification"]), new objj_method(sel_getUid("setupWindow"), function $MainUserProfileWindow__setupWindow(self, _cmd)
{ with(self)
{
        var sex = objj_msgSend(user, "sex");
            if(sex === "FEMALE")
                var defaultAvatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/usuario-mujer.png", CPSizeMake(87,88));
            else
                var defaultAvatarImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/usuarios/usuario-hombre.png", CPSizeMake(87,88));
            objj_msgSend(defaultAvatarImage, "setDelegate:", self);
            avatarImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(20,20,87,88));
            objj_msgSend(avatarImageView, "setImage:",  defaultAvatarImage);
            objj_msgSend(contentView, "addSubview:", avatarImageView);
    }
},["void"]), new objj_method(sel_getUid("savePreferences"), function $MainUserProfileWindow__savePreferences(self, _cmd)
{ with(self)
{
        var selectedSex = objj_msgSend(sexMenu, "titleOfSelectedItem");
        if(selectedSex != objj_msgSend(loggedUser, "sex")){
            CPLog.trace("Modifying a user!");
            var app = objj_msgSend(CPApp, "delegate");
            var url = objj_msgSend(app, "serverIP")+"/ModifyUser?userID="+objj_msgSend(loggedUser, "email")+"&parameter=SEX&newValue="+selectedSex;
            CPLog.info("Modifying user: " + url);
            var request = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
            var modifyConnectionLogin = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
    }
},["void"])]);
}

