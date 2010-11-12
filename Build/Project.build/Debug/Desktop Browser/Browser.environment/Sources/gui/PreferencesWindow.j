@STATIC;1.0;t;3240;{var the_class = objj_allocateClassPair(CPWindow, "PreferencesWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("backButton"), new objj_ivar("playButton"), new objj_ivar("forwardButton"), new objj_ivar("currentlyPlaying"), new objj_ivar("currentlyPlayingString"), new objj_ivar("botonOk"), new objj_ivar("wallpaperMenus"), new objj_ivar("contentViewOfWindow")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:contentViewOfWindow:"), function $PreferencesWindow__initWithContentRect_styleMask_contentViewOfWindow_(self, _cmd, aRectangle, aStyleMask, aContentView)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PreferencesWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
        if (self)
        {
            contentViewOfWindow = aContentView;
            objj_msgSend(self, "setTitle:", "Preferences");
            var contentView = objj_msgSend(self, "contentView");
            var bounds = objj_msgSend(contentView, "bounds");
            var center= CGRectGetWidth(bounds)/2.0;
            var wallpaperLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 50, 100, 18));
            objj_msgSend(wallpaperLabel, "setStringValue:", "Wallpaper:");
            objj_msgSend(wallpaperLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            var arr =objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            objj_msgSend(arr, "addObject:", "xyzradiowallpaper.png")
            objj_msgSend(arr, "addObject:", "theGoldenAgeOf60.jpg");
            objj_msgSend(arr, "addObject:", "Organ-ism.jpg");
            objj_msgSend(arr, "addObject:", "Retro_Music.jpg");
            wallpaperMenus =objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(125, 50, 170, 24));
            objj_msgSend(wallpaperMenus, "addItemsWithTitles:", arr);
            botonOK = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(330, 450, 50, 18));
            objj_msgSend(botonOK, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(botonOk, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(botonOK, "setTitle:", "Ok");
            objj_msgSend(botonOK, "setTarget:", self);
            objj_msgSend(botonOK, "setAction:", sel_getUid("savePreferences"));
            objj_msgSend(contentView, "addSubview:",  botonOK);
            objj_msgSend(contentView, "addSubview:",  wallpaperLabel);
            objj_msgSend(contentView, "addSubview:",  wallpaperMenus);
        }
        return self;
    }
},["id",null,null,"CPView"]), new objj_method(sel_getUid("savePreferences"), function $PreferencesWindow__savePreferences(self, _cmd)
{ with(self)
{
        bgImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/wallpapers/"+objj_msgSend(wallpaperMenus, "titleOfSelectedItem"), CPSizeMake(1440, 960));
        objj_msgSend(contentViewOfWindow, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", bgImage));
    }
},["void"])]);
}

