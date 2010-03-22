@STATIC;1.0;I;21;Foundation/CPObject.ji;8;DJList.ji;13;MainBrowser.ji;15;PlayerControl.ji;19;PreferencesWindow.ji;9;XYZSong.ji;13;UsersWindow.ji;18;DCFormController.ji;10;UserCell.ji;13;LoginWindow.ji;19;UserProfileWindow.ji;9;XYZUser.ji;22;EventListenerManager.ji;23;MainUserProfileWindow.ji;15;AddSongWindow.jt;21991;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("DJList.j", YES);
objj_executeFile("MainBrowser.j", YES);
objj_executeFile("PlayerControl.j", YES);
objj_executeFile("PreferencesWindow.j", YES);
objj_executeFile("XYZSong.j", YES);
objj_executeFile("UsersWindow.j", YES);
objj_executeFile("DCFormController.j", YES);
objj_executeFile("UserCell.j", YES);
objj_executeFile("LoginWindow.j", YES);
objj_executeFile("UserProfileWindow.j", YES);
objj_executeFile("XYZUser.j", YES);
objj_executeFile("EventListenerManager.j", YES);
objj_executeFile("MainUserProfileWindow.j", YES);
objj_executeFile("AddSongWindow.j", YES);
var BotonBrowserIdentifier = "BotonBrowserIdentifier",
    BotonMiListaIdentifier = "BotonMiListaIdentifier",
    AddSongToolbarItemIdentifier = "AddSongToolbarItemIdentifier",
    RemoveSongToolbarItemIdentifier = "RemoveSongToolbarItemIdentifier",
    PreferencesItemIdentifier = "PreferencesItemIdentifier",
    UsersItemIdentifier = "UsresItemIdentifier",
    ProfileItemIdentifier = "ProfileItemIdentifier",
    LogoutIdentifier = "LogoutIdentifier";
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("librarySongs"), new objj_ivar("toolbar"), new objj_ivar("djList"), new objj_ivar("musicBrowser"), new objj_ivar("playerControl"), new objj_ivar("preferencesWindow"), new objj_ivar("bgImage"), new objj_ivar("theWindow"), new objj_ivar("contentView"), new objj_ivar("usersWindow"), new objj_ivar("mainUserProfileWindow"), new objj_ivar("listCollectionView"), new objj_ivar("contentUsers"), new objj_ivar("bounds"), new objj_ivar("xyzradioConnectionForLogin"), new objj_ivar("serverIP"), new objj_ivar("loginWindow"), new objj_ivar("userProfileWindow"), new objj_ivar("userLoggedin"), new objj_ivar("userLoggingTimer"), new objj_ivar("eventListenerManager"), new objj_ivar("addSongWindow"), new objj_ivar("globalSongList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("globalSongList"), function $AppController__globalSongList(self, _cmd)
{ with(self)
{
return globalSongList;
}
},["id"]),
new objj_method(sel_getUid("setGlobalSongList:"), function $AppController__setGlobalSongList_(self, _cmd, newValue)
{ with(self)
{
globalSongList = newValue;
}
},["void","id"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{ with(self)
{
    CPLogRegister(CPLogConsole);
    CPLog.info("Inicio de ventana");
    theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask);
    contentView = objj_msgSend(theWindow, "contentView");
    bgImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/wallpapers/xyzradiowallpaper.png", CPSizeMake(30, 25));
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", bgImage));
    bounds = objj_msgSend(contentView, "bounds");
    librarySongs = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    toolbar= objj_msgSend(objj_msgSend(CPToolbar, "alloc"), "initWithIdentifier:", "main-toolbar");
    objj_msgSend(theWindow, "setToolbar:",  toolbar);
    objj_msgSend(toolbar, "setDelegate:", self);
    serverIP = "http://localhost:8888";
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("closeLoginWindow:"), "LoginSuccessful", nil);
        musicBrowser = objj_msgSend(objj_msgSend(MainBrowser, "alloc"), "initWithSource:rectangle:", librarySongs, CGRectMake(0, 0, 600, 500));
    objj_msgSend(musicBrowser, "setFrameOrigin:", (CPPointMake(60, 100)));
    djList = objj_msgSend(objj_msgSend(DJList, "alloc"), "initWithSource:contentRect:", librarySongs,  CGRectMake(700, 100, 600, 500));
    objj_msgSend(djList, "setFrameOrigin:", (CPPointMake(700, 100)));
    objj_msgSend(theWindow, "orderFront:", self);
    playerControl=objj_msgSend(objj_msgSend(PlayerControl, "alloc"), "initWithMainPlayingList:djList:", musicBrowser, djList);
    objj_msgSend(self, "openLoginWindow");
}
},["void","CPNotification"]), new objj_method(sel_getUid("contentView"), function $AppController__contentView(self, _cmd)
{ with(self)
{
 return contentView;
}
},["CPView"]), new objj_method(sel_getUid("setServerIP:"), function $AppController__setServerIP_(self, _cmd, aURL)
{ with(self)
{
 serverIP = aURL;
}
},["void","CPString"]), new objj_method(sel_getUid("userLoggedin"), function $AppController__userLoggedin(self, _cmd)
{ with(self)
{
 return userLoggedin;
}
},["XYZUser"]), new objj_method(sel_getUid("setUserLoggedin:"), function $AppController__setUserLoggedin_(self, _cmd, aUser)
{ with(self)
{
 userLoggedin= aUser;
}
},["void","XYZUser"]), new objj_method(sel_getUid("serverIP"), function $AppController__serverIP(self, _cmd)
{ with(self)
{
 return serverIP;
}
},["CPString"]), new objj_method(sel_getUid("sound:didFinishPlaying:"), function $AppController__sound_didFinishPlaying_(self, _cmd, aSound, aBoolean)
{ with(self)
{
 CPLog.info("Sound did finish playing");
}
},["void","CPSound","BOOL"]), new objj_method(sel_getUid("theWindow"), function $AppController__theWindow(self, _cmd)
{ with(self)
{
 return theWindow;
}
},["void"]), new objj_method(sel_getUid("addSong:"), function $AppController__addSong_(self, _cmd, aSong)
{ with(self)
{ if(!musicBrowser)
         musicBrowser = objj_msgSend(objj_msgSend(MainBrowser, "alloc"), "initWithSource:", librarySongs);
    objj_msgSend(musicBrowser, "addItem:",  aSong);
}
},["void","XYZSong"]), new objj_method(sel_getUid("addSongList:"), function $AppController__addSongList_(self, _cmd, songs)
{ with(self)
{
    if(!musicBrowser){
        musicBrowser = objj_msgSend(objj_msgSend(MainBrowser, "alloc"), "initWithSource:rectangle:", songs, CGRectMake(60, 100, 600, 500));
    }
    else{
        objj_msgSend(musicBrowser, "addList:", songs);
    }
}
},["void","CPArray"]), new objj_method(sel_getUid("removeSong"), function $AppController__removeSong(self, _cmd)
{ with(self)
{
    if(djList)
        objj_msgSend(djList, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $AppController__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
    objj_msgSend(self, "addSongList:",  data.songs);
}
},["void","CPJSONPConnection","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $AppController__connection_didFailWithError_(self, _cmd, aConnection, error)
{ with(self)
{
    alert(error);
}
},["void","CPJSONPConnection","CPString"]), new objj_method(sel_getUid("togglePlayerWindow"), function $AppController__togglePlayerWindow(self, _cmd)
{ with(self)
{
 objj_msgSend(playerControl, "togglePlayerWindow");
}
},["void"]), new objj_method(sel_getUid("openPreferences"), function $AppController__openPreferences(self, _cmd)
{ with(self)
{
    if(!preferencesWindow)
        preferencesWindow = objj_msgSend(objj_msgSend(PreferencesWindow, "alloc"), "initWithContentRect:styleMask:contentViewOfWindow:", CGRectMake(500, 50, 400, 500),  CPHUDBackgroundWindowMask|CPClosableWindowMask, contentView);
  objj_msgSend(preferencesWindow, "setFrameOrigin:", (CPPointMake(500, 50)));
    if(objj_msgSend(preferencesWindow, "isVisible")){
        objj_msgSend(preferencesWindow, "setFrameOrigin:", (CPPointMake(500, 100)));
        objj_msgSend(preferencesWindow, "close");
    }
    else
    objj_msgSend(preferencesWindow, "orderFront:", self);
}
},["void"]), new objj_method(sel_getUid("openUserProfileWindow"), function $AppController__openUserProfileWindow(self, _cmd)
{ with(self)
{
    if(!userProfileWindow)
        userProfileWindow = objj_msgSend(objj_msgSend(UserProfileWindow, "alloc"), "initWithContentRect:styleMask:contentViewOfWindow:", CGRectMake(500, 50, 400, 500),  CPHUDBackgroundWindowMask|CPClosableWindowMask, contentView);
  objj_msgSend(userProfileWindow, "setFrameOrigin:", (CPPointMake(500, 50)));
    if(objj_msgSend(userProfileWindow, "isVisible")){
        objj_msgSend(userProfileWindow, "setFrameOrigin:", (CPPointMake(500, 50)));
        objj_msgSend(userProfileWindow, "close");
    }
    else
    objj_msgSend(userProfileWindow, "orderFront:", self);
}
},["void"]), new objj_method(sel_getUid("openAddSongForm"), function $AppController__openAddSongForm(self, _cmd)
{ with(self)
{
 if(!addSongWindow)
        addSongWindow = objj_msgSend(objj_msgSend(AddSongWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(500, 50, 500, 400),  CPHUDBackgroundWindowMask|CPClosableWindowMask);
        objj_msgSend(addSongWindow, "setFrameOrigin:", (CPPointMake(500, 50)));
    if(objj_msgSend(addSongWindow, "isVisible")){
        objj_msgSend(addSongWindow, "setFrameOrigin:", (CPPointMake(500, 100)));
        objj_msgSend(addSongWindow, "close");
    }
    else
        objj_msgSend(addSongWindow, "orderFront:", self);
}
},["void"]), new objj_method(sel_getUid("openDJList"), function $AppController__openDJList(self, _cmd)
{ with(self)
{
    if(!djList){
        djList = objj_msgSend(objj_msgSend(DJList, "alloc"), "initWithSource:contentRect:", librarySongs,  CGRectMake(700, 100, 600, 500));
 }
    if(objj_msgSend(djList, "isVisible")){
        objj_msgSend(djList, "setFrameOrigin:", (CPPointMake(700, 100)));
        objj_msgSend(djList, "close");
    }
    else
    objj_msgSend(djList, "orderFront:", self);
}
},["void"]), new objj_method(sel_getUid("openBrowser"), function $AppController__openBrowser(self, _cmd)
{ with(self)
{
    if(!musicBrowser){
        musicBrowser = objj_msgSend(objj_msgSend(MainBrowser, "alloc"), "initWithSource:rectangle:", librarySongs, CGRectMake(0, 0, 600, 500));
        objj_msgSend(musicBrowser, "setFrameOrigin:", (CPPointMake(60, 100)));
    }
    if(objj_msgSend(musicBrowser, "isVisible")){
        objj_msgSend(musicBrowser, "setFrameOrigin:", (CPPointMake(60, 100)));
        objj_msgSend(musicBrowser, "close");
    }
    else
        objj_msgSend(musicBrowser, "orderFront:", self);
}
},["void"]), new objj_method(sel_getUid("openUsers"), function $AppController__openUsers(self, _cmd)
{ with(self)
{
        if(!usersWindow){
            usersWindow = objj_msgSend(objj_msgSend(UsersWindow, "alloc"), "contentRect:styleMask:", CGRectMake(5,60,247,CGRectGetHeight(bounds)-60), CPBorderlessWindowMask);
            objj_msgSend(usersWindow, "setFrameOrigin:", (CPPointMake(5, 70)));
            CPLog.info("Starting timer!");
            userLoggingTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 15.0,  self, "checkForNewUsers:", nil, YES );
            objj_msgSend(usersWindow, "orderFront:", self);
        }else{
            if(objj_msgSend(usersWindow, "isVisible")){
                objj_msgSend(usersWindow, "close");
                CPLog.info("Stoping the timer");
                objj_msgSend(userLoggingTimer, "invalidate");
            }
            else{
                CPLog.info("Restarting the timer");
                userLoggingTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 15.0,  self, "checkForNewUsers:", nil, YES );
                objj_msgSend(usersWindow, "orderFront:", self);
            }
        }
    }
},["void"]), new objj_method(sel_getUid("openProfile"), function $AppController__openProfile(self, _cmd)
{ with(self)
{
  if(!mainUserProfileWindow){
    mainUserProfileWindow = objj_msgSend(objj_msgSend(MainUserProfileWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(100,200,300,400), CPHUDBackgroundWindowMask|CPClosableWindowMask);
    objj_msgSend(mainUserProfileWindow, "setFrameOrigin:", (CPPointMake(100, 200)));
    objj_msgSend(mainUserProfileWindow, "orderFront:", self);
  }else{
    if(objj_msgSend(mainUserProfileWindow, "isVisible")){
        objj_msgSend(mainUserProfileWindow, "close");
    }else{
        objj_msgSend(mainUserProfileWindow, "orderFront:", self);
    }
  }
}
},["void"]), new objj_method(sel_getUid("checkForNewUsers:"), function $AppController__checkForNewUsers_(self, _cmd, theTimer)
{ with(self)
{
        CPLog.info("Getting events");
        eventListenerManager = objj_msgSend(objj_msgSend(EventListenerManager, "alloc"), "init");
        objj_msgSend(eventListenerManager, "getEvents");
}
},["void","CPTimer"]), new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"), function $AppController__toolbarAllowedItemIdentifiers_(self, _cmd, aToolbar)
{ with(self)
{
   return [CPToolbarFlexibleSpaceItemIdentifier, BotonBrowserIdentifier,BotonMiListaIdentifier, AddSongToolbarItemIdentifier, UsersItemIdentifier, ProfileItemIdentifier, RemoveSongToolbarItemIdentifier, LogoutIdentifier, PreferencesItemIdentifier];
}
},["CPArray","CPToolbar"]), new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"), function $AppController__toolbarDefaultItemIdentifiers_(self, _cmd, aToolbar)
{ with(self)
{
   return [BotonBrowserIdentifier, BotonMiListaIdentifier, AddSongToolbarItemIdentifier, RemoveSongToolbarItemIdentifier, UsersItemIdentifier, ProfileItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier, PreferencesItemIdentifier,LogoutIdentifier];
}
},["CPArray","CPToolbar"]), new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"), function $AppController__toolbar_itemForItemIdentifier_willBeInsertedIntoToolbar_(self, _cmd, aToolbar, anItemIdentifier, aFlag)
{ with(self)
{
    var toolbarItem = objj_msgSend(objj_msgSend(CPToolbarItem, "alloc"), "initWithItemIdentifier:",  anItemIdentifier);
    if (anItemIdentifier == BotonBrowserIdentifier)
    {
  var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/biblioteca.png", CPSizeMake(27, 27)),
            highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/bibliotecaOff.png", CPSizeMake(27, 27));
  objj_msgSend(toolbarItem, "setImage:",  image);
  objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
  objj_msgSend(toolbarItem, "setTarget:", self);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("openBrowser"));
  objj_msgSend(toolbarItem, "setLabel:",  "Music Browser");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }
    else if (anItemIdentifier == BotonMiListaIdentifier)
    {
  var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/dj.png", CPSizeMake(27, 27)),
  highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/djOff.png", CPSizeMake(27, 27));
  objj_msgSend(toolbarItem, "setImage:",  image);
  objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
        objj_msgSend(toolbarItem, "setTarget:", self);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("openDJList"));
  objj_msgSend(toolbarItem, "setLabel:", "DJList");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }
    else if (anItemIdentifier == AddSongToolbarItemIdentifier)
    {
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/addSong.png", CPSizeMake(27, 27)),
            highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/addSongOff.png", CPSizeMake(27, 27));
        objj_msgSend(toolbarItem, "setImage:",  image);
        objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
        objj_msgSend(toolbarItem, "setTarget:",  self);
        objj_msgSend(toolbarItem, "setAction:",  sel_getUid("openAddSongForm"));
        objj_msgSend(toolbarItem, "setLabel:",  "Add a song");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }
    else if (anItemIdentifier == RemoveSongToolbarItemIdentifier)
    {
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/removeSong.png", CPSizeMake(27, 27)),
        highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/removeSongOff.png", CPSizeMake(27, 27));
        objj_msgSend(toolbarItem, "setImage:",  image);
        objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
        objj_msgSend(toolbarItem, "setTarget:",  self);
        objj_msgSend(toolbarItem, "setAction:",  sel_getUid("removeSong"));
        objj_msgSend(toolbarItem, "setLabel:",  "Remove a song");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }
    else if(anItemIdentifier == UsersItemIdentifier){
 var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/usuario.png", CPSizeMake(27, 27)),
        highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/usuariosOff.png", CPSizeMake(27, 27));
        objj_msgSend(toolbarItem, "setImage:",  image);
        objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
        objj_msgSend(toolbarItem, "setTarget:",  self);
        objj_msgSend(toolbarItem, "setAction:",  sel_getUid("openUsers"));
        objj_msgSend(toolbarItem, "setLabel:",  "Users");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }else if(anItemIdentifier == ProfileItemIdentifier){
 var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/miperfiloff.png", CPSizeMake(27, 27)),
        highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/miperfilon.png", CPSizeMake(27, 27));
        objj_msgSend(toolbarItem, "setImage:",  image);
        objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
        objj_msgSend(toolbarItem, "setTarget:",  self);
        objj_msgSend(toolbarItem, "setAction:",  sel_getUid("openProfile"));
        objj_msgSend(toolbarItem, "setLabel:",  "Profile");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }else if (anItemIdentifier == PreferencesItemIdentifier)
    {
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/setup.png", CPSizeMake(27, 27)),
            highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/setupOff.png", CPSizeMake(27, 27));
  objj_msgSend(toolbarItem, "setImage:",  image);
        objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
  objj_msgSend(toolbarItem, "setTarget:", self);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("openPreferences"));
        objj_msgSend(toolbarItem, "setLabel:", "Prefrences");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }else if (anItemIdentifier == LogoutIdentifier)
    {
        var image = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/logouton.png", CPSizeMake(27, 27)),
            highlighted = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/buttons/logoutOff.png", CPSizeMake(27, 27));
  objj_msgSend(toolbarItem, "setImage:",  image);
        objj_msgSend(toolbarItem, "setAlternateImage:",  highlighted);
  objj_msgSend(toolbarItem, "setTarget:", self);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("logoutUser"));
        objj_msgSend(toolbarItem, "setLabel:", "Logout");
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(32, 32));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(32, 32));
    }
    return toolbarItem;
}
},["CPToolbarItem","CPToolbar","CPString","BOOL"]), new objj_method(sel_getUid("modeSwitch"), function $AppController__modeSwitch(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("logoutUser"), function $AppController__logoutUser(self, _cmd)
{ with(self)
{
  var url = serverIP+"/LogoutUser?email="+objj_msgSend(userLoggedin, "email");
  CPLog.info("Connecting to" + url);
  var request = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
  var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
  objj_msgSend(self, "openLoginWindow");
}
},["void"]), new objj_method(sel_getUid("openLoginWindow"), function $AppController__openLoginWindow(self, _cmd)
{ with(self)
{
  loginWindow = objj_msgSend(objj_msgSend(LoginWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, 1000, 800),  CPHUDBackgroundWindowMask | CPBorderlessWindowMask);
  objj_msgSend(loginWindow, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
  objj_msgSend(CPLightbox, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 0, 0, 0, 0.6));
  objj_msgSend(CPLightbox, "runModalForWindow:", loginWindow);
}
},["void"]), new objj_method(sel_getUid("closeLoginWindow:"), function $AppController__closeLoginWindow_(self, _cmd, aNotification)
{ with(self)
{
 var info = objj_msgSend(aNotification, "userInfo");
 var aux = objj_msgSend(info, "objectForKey:", "user");
 userLoggedin = aux;
 objj_msgSend(CPLightbox, "stopModal");
 objj_msgSend(loginWindow, "close");
 objj_msgSend(djList, "getUserPlaylists");
}
},["void","CPNotification"])]);
}

