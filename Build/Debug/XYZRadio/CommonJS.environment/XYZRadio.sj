@STATIC;1.0;p;15;_CPAudioSound.jt;3924;@STATIC;1.0;i;9;CPSound.jt;3892;objj_executeFile("CPSound.j", YES);
var _CPMixerCounter = 0;
{var the_class = objj_allocateClassPair(CPSound, "_CPAudioSound"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_Player")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_CreateDOMAudioElement:"), function $_CPAudioSound___CreateDOMAudioElement_(self, _cmd, aFileName)
{ with(self)
{
    var _DOMAudioElement = document.createElement("audio");
    _DOMAudioElement.setAttribute("src", aFileName);
    _DOMAudioElement.setAttribute("autoplay", "false");
    _DOMAudioElement.setAttribute("autostart", "0");
    _DOMAudioElement.setAttribute("controls", "false");
    _DOMAudioElement.setAttribute("loop", "false");
    _DOMAudioElement.setAttribute("id", "CPMixer" + "Audio" + _CPMixerCounter);
    return _DOMAudioElement;
}
},["BOOL","NSString"]), new objj_method(sel_getUid("initWithFile:mixer:"), function $_CPAudioSound__initWithFile_mixer_(self, _cmd, aFileName, mixerDiv)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAudioSound").super_class }, "init");
    if (self)
    {
        var _DOMAudioElement = objj_msgSend(self, "_CreateDOMAudioElement:", aFileName);
        mixerDiv.appendChild(_DOMAudioElement);
        if(!document.getElementById("CPMixer" + "Audio" + _CPMixerCounter))
            return nil;
        _Player = _DOMAudioElement;
        if (document.addEventListener)
        {
            _Player.addEventListener('ended', function () {
                if(_delegate != nil && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("sound:didFinishPlaying:")))
                objj_msgSend(_delegate, "sound:didFinishPlaying:", self, YES);
            } , false);
        } else {
            _Player.attachEvent('onended', function () {
                if(_delegate != nil && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("sound:didFinishPlaying:")))
                objj_msgSend(_delegate, "sound:didFinishPlaying:", self, YES);
            });
        }
    }
    return self;
}
},["id","CPString","DOMElement"]), new objj_method(sel_getUid("isPlaying"), function $_CPAudioSound__isPlaying(self, _cmd)
{ with(self)
{
    return !_Player.paused;
}
},["BOOL"]), new objj_method(sel_getUid("play"), function $_CPAudioSound__play(self, _cmd)
{ with(self)
{
    _Player.play();
}
},["void"]), new objj_method(sel_getUid("pause"), function $_CPAudioSound__pause(self, _cmd)
{ with(self)
{
    _Player.pause();
}
},["void"]), new objj_method(sel_getUid("stop"), function $_CPAudioSound__stop(self, _cmd)
{ with(self)
{
    _Player.pause();
    _Player.currentTime = 0;
}
},["void"]), new objj_method(sel_getUid("volume"), function $_CPAudioSound__volume(self, _cmd)
{ with(self)
{
    return _Player.volume;
}
},["var"]), new objj_method(sel_getUid("setVolume:"), function $_CPAudioSound__setVolume_(self, _cmd, volume)
{ with(self)
{
    if (volume > 1)
        volume = 1;
    else if (volume < 0)
        volume = 0;
    _Player.volume = volume;
}
},["void","var"]), new objj_method(sel_getUid("duration"), function $_CPAudioSound__duration(self, _cmd)
{ with(self)
{
    return _Player.duration;
}
},["var"]), new objj_method(sel_getUid("loops"), function $_CPAudioSound__loops(self, _cmd)
{ with(self)
{
    return _Player.loop == nil;
}
},[null]), new objj_method(sel_getUid("setLoops:"), function $_CPAudioSound__setLoops_(self, _cmd, loops)
{ with(self)
{
    _Player.loop = loops;
}
},["void","BOOL"]), new objj_method(sel_getUid("currentTime"), function $_CPAudioSound__currentTime(self, _cmd)
{ with(self)
{
    return _Player.currentTime;
}
},["var"]), new objj_method(sel_getUid("setCurrentTime:"), function $_CPAudioSound__setCurrentTime_(self, _cmd, time)
{ with(self)
{
    if(time < 0)
        time = 0;
    _Player.currentTime = time;
}
},["void","var"])]);
}

p;19;_CPQuickTimeSound.jt;7009;@STATIC;1.0;i;9;CPSound.jt;6977;objj_executeFile("CPSound.j", YES);
var _CPMixerCounter = 0;
{var the_class = objj_allocateClassPair(CPSound, "_CPQuickTimeSound"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_Player")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_haveQuickTime"), function $_CPQuickTimeSound___haveQuickTime(self, _cmd)
{ with(self)
{
    var haveqt = NO;
    if (navigator.plugins) {
        for (i=0; i < navigator.plugins.length; i++ ) {
            if (navigator.plugins[i].name.indexOf("QuickTime") >= 0)
            {
                haveqt = YES;
            }
        }
    }
    if ((navigator.appVersion.indexOf("Mac") > 0)
        && (navigator.appName.substring(0,9) == "Microsoft")
        && (parseInt(navigator.appVersion) < 5) )
    {
        haveqt = YES;
    }
    return haveqt;
}
},["BOOL"]), new objj_method(sel_getUid("_CreateDOMObjectElement:"), function $_CPQuickTimeSound___CreateDOMObjectElement_(self, _cmd, aFileName)
{ with(self)
{
    var _DOMObjectElement = document.createElement("object");
    var _DOMParamElement = document.createElement("param");
    _DOMObjectElement.setAttribute("classid", "clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B");
    _DOMObjectElement.setAttribute("codebase", "http://www.apple.com/qtactivex/qtplugin.cab");
    _DOMObjectElement.setAttribute("width", "0");
    _DOMObjectElement.setAttribute("height", "0");
    _DOMParamElement.setAttribute("src", aFileName);
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("controller", "false");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("autoplay", "false");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("hidden", "true");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("enablejavascript", "true");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("postdomevents", "true");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("id", "CPMixer" + "Object" + _CPMixerCounter);
    _DOMObjectElement.appendChild(_DOMParamElement);
    return _DOMObjectElement;
}
},["id","NSString"]), new objj_method(sel_getUid("_CreateDOMEmbedElement:"), function $_CPQuickTimeSound___CreateDOMEmbedElement_(self, _cmd, aFileName)
{ with(self)
{
    var _DOMEmbedElement = document.createElement("embed");
    _DOMEmbedElement.setAttribute("src", aFileName);
    _DOMEmbedElement.setAttribute("width", "0");
    _DOMEmbedElement.setAttribute("height", "0");
    _DOMEmbedElement.setAttribute("pluginspage", "http://www.apple.com/quicktime/download/");
    _DOMEmbedElement.setAttribute("name", "CPMixer" + "Embed" + _CPMixerCounter);
    _DOMEmbedElement.setAttribute("enablejavascript", "true");
    _DOMEmbedElement.setAttribute("postdomevents", "true");
    _DOMEmbedElement.setAttribute("autoplay", "false");
    return _DOMEmbedElement;
}
},["id","NSString"]), new objj_method(sel_getUid("initWithFile:mixer:"), function $_CPQuickTimeSound__initWithFile_mixer_(self, _cmd, aFileName, mixerDiv)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPQuickTimeSound").super_class }, "init");
    if (self)
    {
        if(!objj_msgSend(self, "_haveQuickTime"))
            return nil;
        var _DOMObjectElement = objj_msgSend(self, "_CreateDOMObjectElement:", aFileName);
        var _DOMEmbedElement = objj_msgSend(self, "_CreateDOMEmbedElement:", aFileName);
        _DOMObjectElement.appendChild(_DOMEmbedElement);
        mixerDiv.appendChild(_DOMObjectElement);
        _Player = document.getElementsByName("CPMixer" + "Embed" + _CPMixerCounter);
        if (_Player.length == 0)
        {
            _Player = document.getElementById("CPMixer" + "Object" + _CPMixerCounter);
            if(!_Player)
                return nil;
        } else {
            _Player = _Player[0];
        }
        if (document.addEventListener)
        {
            _Player.addEventListener('qt_ended', function () {
                if(_delegate != nil && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("sound:didFinishPlaying:")))
                objj_msgSend(_delegate, "sound:didFinishPlaying:", self, YES);
            } , false);
        } else {
            _Player.attachEvent('onqt_ended', function () {
                if(_delegate != nil && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("sound:didFinishPlaying:")))
                objj_msgSend(_delegate, "sound:didFinishPlaying:", self, YES);
            });
        }
    }
    return self;
}
},["id","CPString","DOMElement"]), new objj_method(sel_getUid("isPlaying"), function $_CPQuickTimeSound__isPlaying(self, _cmd)
{ with(self)
{
    return _Player.GetRate() != 0;
}
},["BOOL"]), new objj_method(sel_getUid("play"), function $_CPQuickTimeSound__play(self, _cmd)
{ with(self)
{
    _Player.Play();
}
},["void"]), new objj_method(sel_getUid("pause"), function $_CPQuickTimeSound__pause(self, _cmd)
{ with(self)
{
    _Player.Stop();
}
},["void"]), new objj_method(sel_getUid("stop"), function $_CPQuickTimeSound__stop(self, _cmd)
{ with(self)
{
    _Player.Rewind();
    _Player.Stop();
}
},["void"]), new objj_method(sel_getUid("volume"), function $_CPQuickTimeSound__volume(self, _cmd)
{ with(self)
{
    return _Player.GetVolume() / 256.0;
}
},["var"]), new objj_method(sel_getUid("setVolume:"), function $_CPQuickTimeSound__setVolume_(self, _cmd, volume)
{ with(self)
{
    if (volume > 1)
        volume = 1;
    else if (volume < 0)
        volume = 0;
    _Player.SetVolume(volume*256);
}
},["void","var"]), new objj_method(sel_getUid("duration"), function $_CPQuickTimeSound__duration(self, _cmd)
{ with(self)
{
    return _Player.GetDuration() / _Player.GetTimeScale();
}
},["var"]), new objj_method(sel_getUid("loops"), function $_CPQuickTimeSound__loops(self, _cmd)
{ with(self)
{
    return _Player.GetIsLooping() != 0;
}
},[null]), new objj_method(sel_getUid("setLoops:"), function $_CPQuickTimeSound__setLoops_(self, _cmd, loops)
{ with(self)
{
    _Player.SetIsLooping(loops?1:0);
}
},["void","BOOL"]), new objj_method(sel_getUid("currentTime"), function $_CPQuickTimeSound__currentTime(self, _cmd)
{ with(self)
{
    return _Player.GetTime() / _Player.GetTimeScale();
}
},["var"]), new objj_method(sel_getUid("setCurrentTime:"), function $_CPQuickTimeSound__setCurrentTime_(self, _cmd, time)
{ with(self)
{
    if(time < 0)
        time = 0;
    _Player.SetTime(time * _Player.GetTimeScale());
}
},["void","var"])]);
}

p;15;AppController.jt;24251;@STATIC;1.0;I;21;Foundation/CPObject.ji;12;gui/DJList.ji;17;gui/MainBrowser.ji;27;controllers/PlayerControl.ji;23;gui/PreferencesWindow.ji;15;model/XYZSong.ji;17;gui/UsersWindow.ji;30;controllers/DCFormController.ji;14;gui/UserCell.ji;15;model/XYZUser.ji;34;controllers/EventListenerManager.ji;27;gui/MainUserProfileWindow.ji;19;gui/AddSongWindow.jt;23895;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("gui/DJList.j", YES);
objj_executeFile("gui/MainBrowser.j", YES);
objj_executeFile("controllers/PlayerControl.j", YES);
objj_executeFile("gui/PreferencesWindow.j", YES);
objj_executeFile("model/XYZSong.j", YES);
objj_executeFile("gui/UsersWindow.j", YES);
objj_executeFile("controllers/DCFormController.j", YES);
objj_executeFile("gui/UserCell.j", YES);
objj_executeFile("model/XYZUser.j", YES);
objj_executeFile("controllers/EventListenerManager.j", YES);
objj_executeFile("gui/MainUserProfileWindow.j", YES);
objj_executeFile("gui/AddSongWindow.j", YES);
var BotonBrowserIdentifier = "BotonBrowserIdentifier",
    BotonMiListaIdentifier = "BotonMiListaIdentifier",
    AddSongToolbarItemIdentifier = "AddSongToolbarItemIdentifier",
    RemoveSongToolbarItemIdentifier = "RemoveSongToolbarItemIdentifier",
    PreferencesItemIdentifier = "PreferencesItemIdentifier",
    UsersItemIdentifier = "UsresItemIdentifier",
    ProfileItemIdentifier = "ProfileItemIdentifier",
    LogoutIdentifier = "LogoutIdentifier";
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("librarySongs"), new objj_ivar("toolbar"), new objj_ivar("djList"), new objj_ivar("musicBrowser"), new objj_ivar("playerControl"), new objj_ivar("preferencesWindow"), new objj_ivar("bgImage"), new objj_ivar("theWindow"), new objj_ivar("contentView"), new objj_ivar("usersWindow"), new objj_ivar("mainUserProfileWindow"), new objj_ivar("listCollectionView"), new objj_ivar("contentUsers"), new objj_ivar("bounds"), new objj_ivar("xyzradioConnectionForLogin"), new objj_ivar("serverIP"), new objj_ivar("userLoggedin"), new objj_ivar("userLoggingTimer"), new objj_ivar("eventListenerManager"), new objj_ivar("addSongWindow"), new objj_ivar("globalSongList")]);
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
    var sharedApplication = objj_msgSend(CPApplication, "sharedApplication");
    var namedArguments = objj_msgSend(sharedApplication, "namedArguments");
    var userAccount = objj_msgSend(namedArguments, "objectForKey:", "userEmail");
    CPLog.trace("The email: "+userAccount);
    if(userAccount){
        CPLog.trace("Logged olduser!");
        objj_msgSend(self, "loginUser:", userAccount);
    }else{
        CPLog.trace("No account found deny access!");
    }
    musicBrowser = objj_msgSend(objj_msgSend(MainBrowser, "alloc"), "initWithSource:rectangle:", librarySongs, CGRectMake(0, 0, 600, 500));
    objj_msgSend(musicBrowser, "setFrameOrigin:", (CPPointMake(60, 100)));
    djList = objj_msgSend(objj_msgSend(DJList, "alloc"), "initWithSource:contentRect:", librarySongs,  CGRectMake(700, 100, 600, 500));
    objj_msgSend(djList, "setFrameOrigin:", (CPPointMake(700, 100)));
    objj_msgSend(theWindow, "orderFront:", self);
    playerControl=objj_msgSend(objj_msgSend(PlayerControl, "alloc"), "initWithMainPlayingList:djList:", musicBrowser, djList);
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
},["void"]), new objj_method(sel_getUid("loginUser:"), function $AppController__loginUser_(self, _cmd, aUser)
{ with(self)
{
  var url = serverIP+"/LoginUser?email="+aUser;
  CPLog.info("Connecting to" + url);
  var request = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
  var xyzradioConnectionForLogin = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $AppController__connection_didReceiveData_(self, _cmd, connection, data)
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
                userLoggedin = userRecived;
             objj_msgSend(djList, "getUserPlaylists");
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
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("openLoginWindow"), function $AppController__openLoginWindow(self, _cmd)
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

p;9;CPSound.jt;4145;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.ji;19;_CPQuickTimeSound.ji;15;_CPAudioSound.jt;4000;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
var _CPMixerDiv = nil;
var _CPMixerSounds = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPSound"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_name")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithResource:"), function $CPSound__initWithResource_(self, _cmd, resource)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSound").super_class }, "init");
    if (self)
    {
        var aFileName = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", resource);
        _name = nil;
        if (self = objj_msgSend(objj_msgSend(_CPAudioSound, "alloc"), "initWithFile:mixer:", aFileName, _CPMixerDiv))
            return self;
        if (self = objj_msgSend(objj_msgSend(_CPQuickTimeSound, "alloc"), "initWithFile:mixer:", aFileName, _CPMixerDiv))
            return self;
    }
    return nil;
}
},["id","CPString"]), new objj_method(sel_getUid("setDelegate:"), function $CPSound__setDelegate_(self, _cmd, delegate)
{ with(self)
{
    _delegate = delegate;
}
},["void","CPObject"]), new objj_method(sel_getUid("delegate"), function $CPSound__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["void"]), new objj_method(sel_getUid("setName:"), function $CPSound__setName_(self, _cmd, aName)
{ with(self)
{
    objj_msgSend(_CPMixerSounds, "setObject:forKey:", self, aName);
    _name = aName;
}
},["void","CPString"]), new objj_method(sel_getUid("name"), function $CPSound__name(self, _cmd)
{ with(self)
{
    return _name;
}
},["CPString"]), new objj_method(sel_getUid("isPlaying"), function $CPSound__isPlaying(self, _cmd)
{ with(self)
{
}
},["BOOL"]), new objj_method(sel_getUid("play"), function $CPSound__play(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("resume"), function $CPSound__resume(self, _cmd)
{ with(self)
{
    var playing = objj_msgSend(self, "isPlaying");
    objj_msgSend(self, "play");
    return !playing;
}
},["BOOL"]), new objj_method(sel_getUid("pause"), function $CPSound__pause(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("stop"), function $CPSound__stop(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("volume"), function $CPSound__volume(self, _cmd)
{ with(self)
{
}
},["var"]), new objj_method(sel_getUid("setVolume:"), function $CPSound__setVolume_(self, _cmd, volume)
{ with(self)
{
}
},["void","var"]), new objj_method(sel_getUid("duration"), function $CPSound__duration(self, _cmd)
{ with(self)
{
}
},["var"]), new objj_method(sel_getUid("loops"), function $CPSound__loops(self, _cmd)
{ with(self)
{
}
},[null]), new objj_method(sel_getUid("setLoops:"), function $CPSound__setLoops_(self, _cmd, loops)
{ with(self)
{
}
},["void","BOOL"]), new objj_method(sel_getUid("currentTime"), function $CPSound__currentTime(self, _cmd)
{ with(self)
{
}
},["var"]), new objj_method(sel_getUid("setCurrentTime:"), function $CPSound__setCurrentTime_(self, _cmd, time)
{ with(self)
{
}
},["void","var"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPSound__initialize(self, _cmd)
{ with(self)
{
    var bridge = objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge");
    var body = bridge._DOMBodyElement;
    _CPMixerDiv = document.createElement("div");
    body.appendChild(_CPMixerDiv);
    _CPMixerDiv.style.width = "0px";
    _CPMixerDiv.style.height = "0px";
    _CPMixerSounds = objj_msgSend(CPDictionary, "dictionary");
}
},["void"]), new objj_method(sel_getUid("soundNamed:"), function $CPSound__soundNamed_(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(_CPMixerSounds, "objectForKey:", aName);
}
},["id","NSString"])]);
}
objj_executeFile("_CPQuickTimeSound.j", YES);
objj_executeFile("_CPAudioSound.j", YES);

p;6;main.jt;295;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;209;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("AppController.j", YES);
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

p;33;controllers/CPPropertyAnimation.jt;2513;@STATIC;1.0;t;2494;{var the_class = objj_allocateClassPair(CPAnimation, "CPPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_view"), new objj_ivar("_keyPath"), new objj_ivar("_start"), new objj_ivar("_end")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithView:property:"), function $CPPropertyAnimation__initWithView_property_(self, _cmd, aView, keyPath)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPropertyAnimation").super_class }, "initWithDuration:animationCurve:", 1.0, CPAnimationLinear);
 if (self) {
  if (objj_msgSend(aView, "respondsToSelector:", keyPath)) {
   _view = aView;
   _keyPath = keyPath;
  } else {
   return null;
  }
 }
 return self;
}
},["id","CPView","CPString"]), new objj_method(sel_getUid("setCurrentProgress:"), function $CPPropertyAnimation__setCurrentProgress_(self, _cmd, progress)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPropertyAnimation").super_class }, "setCurrentProgress:", progress);
 progress = objj_msgSend(self, "currentValue");
 if (_keyPath == 'width' || _keyPath == 'height')
  progress = (progress * (_end - _start)) + _start;
 else if (_keyPath == 'size')
  progress = CGSizeMake((progress * (_end.width - _start.width)) + _start.width, (progress * (_end.height - _start.height)) + _start.height);
 else if (_keyPath == 'frame') {
  progress = CGRectMake(
   (progress * (_end.origin.x - _start.origin.x)) + _start.origin.x,
   (progress * (_end.origin.y - _start.origin.y)) + _start.origin.y,
   (progress * (_end.size.width - _start.size.width)) + _start.size.width,
   (progress * (_end.size.height - _start.size.height)) + _start.size.height);
 } else if (_keyPath == 'alphaValue')
  progress = (progress * (_end - _start)) + _start;
 objj_msgSend(_view, "setValue:forKey:", progress, _keyPath);
}
},["void","float"]), new objj_method(sel_getUid("setStart:"), function $CPPropertyAnimation__setStart_(self, _cmd, aValue)
{ with(self)
{
 _start = aValue;
}
},["void","id"]), new objj_method(sel_getUid("start"), function $CPPropertyAnimation__start(self, _cmd)
{ with(self)
{
 return _start;
}
},["id"]), new objj_method(sel_getUid("setEnd:"), function $CPPropertyAnimation__setEnd_(self, _cmd, aValue)
{ with(self)
{
 _end = aValue;
}
},["void","id"]), new objj_method(sel_getUid("end"), function $CPPropertyAnimation__end(self, _cmd)
{ with(self)
{
 return _end;
}
},["id"])]);
}

p;30;controllers/DCFormController.jt;4407;@STATIC;1.0;I;21;Foundation/CPObject.ji;21;CPPropertyAnimation.ji;19;../gui/DCFormView.jt;4312;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("CPPropertyAnimation.j", YES);
objj_executeFile("../gui/DCFormView.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "DCFormController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("sheet"), new objj_ivar("formView"), new objj_ivar("shadeView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("formView"), function $DCFormController__formView(self, _cmd)
{ with(self)
{
return formView;
}
},["id"]),
new objj_method(sel_getUid("setFormView:"), function $DCFormController__setFormView_(self, _cmd, newValue)
{ with(self)
{
formView = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFormView:"), function $DCFormController__initWithFormView_(self, _cmd, aFormView)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCFormController").super_class }, "init");
 if (self) {
  formView = aFormView;
  objj_msgSend(formView, "setDelegate:", self);
  sheet = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, objj_msgSend(formView, "frame").size.width, objj_msgSend(formView, "frame").size.height), CPBorderlessWindowMask);
  objj_msgSend(sheet, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMaxYMargin);
  objj_msgSend(sheet, "setHasShadow:", YES);
  objj_msgSend(sheet, "setContentView:", formView);
  shadeView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "delegate"), "theWindow"), "contentView"), "bounds"));
  objj_msgSend(shadeView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
  objj_msgSend(shadeView, "setAlphaValue:", 0.5);
  objj_msgSend(shadeView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
 }
 return self;
}
},["id","DCFormView"]), new objj_method(sel_getUid("startForm"), function $DCFormController__startForm(self, _cmd)
{ with(self)
{
 var mainWindow = objj_msgSend(objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "delegate"), "theWindow");
 objj_msgSend(objj_msgSend(mainWindow, "contentView"), "addSubview:", shadeView);
 objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "runModalForWindow:", sheet);
 objj_msgSend(sheet, "setFrame:", CGRectMake(
  (objj_msgSend(mainWindow, "frame").size.width / 2) - (objj_msgSend(sheet, "frame").size.width / 2),
  -objj_msgSend(sheet, "frame").size.height - 20,
  objj_msgSend(sheet, "frame").size.width,
  objj_msgSend(sheet, "frame").size.height));
 var anim = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", sheet, "frame");
 objj_msgSend(anim, "setStart:", CGRectMakeCopy(objj_msgSend(sheet, "frame")));
 objj_msgSend(anim, "setEnd:", CGRectMake(objj_msgSend(sheet, "frame").origin.x, -20, objj_msgSend(sheet, "frame").size.width, objj_msgSend(sheet, "frame").size.height));
 objj_msgSend(anim, "setDuration:", 0.3);
 objj_msgSend(anim, "startAnimation");
 objj_msgSend(sheet, "orderFront:", objj_msgSend(objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "delegate"), "theWindow"));
 objj_msgSend(sheet, "becomeKeyWindow");
 objj_msgSend(formView, "didShow");
}
},["void"]), new objj_method(sel_getUid("endForm"), function $DCFormController__endForm(self, _cmd)
{ with(self)
{
 objj_msgSend(objj_msgSend(CPApplication, "sharedApplication"), "stopModal");
 objj_msgSend(shadeView, "removeFromSuperview");
 var anim = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", sheet, "frame");
 objj_msgSend(anim, "setStart:", CGRectMakeCopy(objj_msgSend(sheet, "frame")));
 objj_msgSend(anim, "setEnd:", CGRectMake(objj_msgSend(sheet, "frame").origin.x, -objj_msgSend(sheet, "frame").size.height - 20, objj_msgSend(sheet, "frame").size.width, objj_msgSend(sheet, "frame").size.height));
 objj_msgSend(anim, "setDuration:", 0.3);
 objj_msgSend(anim, "setDelegate:", self);
 objj_msgSend(anim, "startAnimation");
}
},["void"]), new objj_method(sel_getUid("animationDidEnd:"), function $DCFormController__animationDidEnd_(self, _cmd, animation)
{ with(self)
{
 objj_msgSend(sheet, "orderOut:", nil);
}
},["void","CPAnimation"])]);
}

p;34;controllers/EventListenerManager.jt;3236;@STATIC;1.0;t;3217;{var the_class = objj_allocateClassPair(CPObject, "EventListenerManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("connection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $EventListenerManager__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("EventListenerManager").super_class }, "init");
 if(self){
 }
 return self;
}
},["id"]), new objj_method(sel_getUid("getEvents"), function $EventListenerManager__getEvents(self, _cmd)
{ with(self)
{
 answerArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
 var app = objj_msgSend(CPApp, "delegate");
 var aURL = objj_msgSend(app, "serverIP") + "/GetEventsForUser?account="+objj_msgSend(objj_msgSend(app, "userLoggedin"), "email");
 CPLog.info("Getting events at: %s", aURL);
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
 connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $EventListenerManager__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
 var result = JSON.parse(data);
 CPLog.info(result);
 for(var i=0; i < result.length; i++){
  var event = result[i];
  if(event.eventName == "com.xyzradioengine.model.events.UserHasLoggedinXYZEvent"){
   CPLog.info("%s loggedin", event.userEmail);
   var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", event.userEmail, "account");
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewUserHasArrived", self, info);
  } else if(event.eventName == "com.xyzradioengine.model.events.UserHasLoggedoffXYZEvent")
  {
   CPLog.info("%s loggedoff", event.userEmail);
   var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", event.userEmail, "account");
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "UserLoggedoff", self, info);
  }
  else if(event.eventName == "com.xyzradioengine.model.events.NewSongAddedXYZEvent")
  {
   CPLog.info("%s new song arrived: ", event.song);
   var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", event.song, "song");
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewSongAddedXYZEvent", self, info);
  }
 }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $EventListenerManager__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $EventListenerManager__connection_didFailWithError_(self, _cmd, aConnection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $EventListenerManager__clearConnection_(self, _cmd, aConnection)
{ with(self)
{
    if (aConnection == louhiConnection)
        louhiConnection = nil;
}
},["void","CPURLConnection"])]);
}

p;24;controllers/FileUpload.jt;11542;@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPValue.jI;24;Foundation/CPException.jt;11442;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("Foundation/CPException.j", NO);
var UPLOAD_IFRAME_PREFIX = "UPLOAD_IFRAME_",
    UPLOAD_FORM_PREFIX = "UPLOAD_FORM_",
    UPLOAD_INPUT_PREFIX = "UPLOAD_INPUT_";
{var the_class = objj_allocateClassPair(CPButton, "UploadButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMIFrameElement"), new objj_ivar("_fileUploadElement"), new objj_ivar("_uploadForm"), new objj_ivar("_mouseMovedCallback"), new objj_ivar("_mouseUpCallback"), new objj_ivar("_delegate"), new objj_ivar("_parameters")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $UploadButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        var hash = objj_msgSend(self, "hash");
        _uploadForm = document.createElement("form");
        _uploadForm.method = "POST";
        _uploadForm.action = "#";
        if(document.attachEvent)
            _uploadForm.encoding = "multipart/form-data";
        else
            _uploadForm.enctype = "multipart/form-data";
        _fileUploadElement = document.createElement("input");
        _fileUploadElement.type = "file";
        _fileUploadElement.name = "file";
        _fileUploadElement.onmousedown = function(aDOMEvent)
        {
            aDOMEvent = aDOMEvent || window.event;
            var x = aDOMEvent.clientX,
                y = aDOMEvent.clientY,
                theWindow = objj_msgSend(self, "window");
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, objj_msgSend(theWindow, "convertBridgeToBase:", CGPointMake(x, y)), 0, 0, objj_msgSend(theWindow, "windowNumber"), nil, -1, 1, 0));
            if (document.addEventListener)
            {
                document.addEventListener(CPDOMEventMouseUp, _mouseUpCallback, NO);
                document.addEventListener(CPDOMEventMouseMoved, _mouseMovedCallback, NO);
            }
            else if(document.attachEvent)
            {
                document.attachEvent("on" + CPDOMEventMouseUp, _mouseUpCallback);
                document.attachEvent("on" + CPDOMEventMouseMoved, _mouseMovedCallback);
            }
        }
        _mouseUpCallback = function(aDOMEvent)
        {
            if (document.removeEventListener)
            {
                document.removeEventListener(CPDOMEventMouseUp, _mouseUpCallback, NO);
                document.removeEventListener(CPDOMEventMouseMoved, _mouseMovedCallback, NO);
            }
            else if(document.attachEvent)
            {
                document.detachEvent("on" + CPDOMEventMouseUp, _mouseUpCallback);
                document.detachEvent("on" + CPDOMEventMouseMoved, _mouseMovedCallback);
            }
            aDOMEvent = aDOMEvent || window.event;
            var x = aDOMEvent.clientX,
                y = aDOMEvent.clientY,
                theWindow = objj_msgSend(self, "window");
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, objj_msgSend(theWindow, "convertBridgeToBase:", CGPointMake(x, y)), 0, 0, objj_msgSend(theWindow, "windowNumber"), nil, -1, 1, 0));
        }
        _mouseMovedCallback = function(aDOMEvent)
        {
            aDOMEvent = aDOMEvent || window.event;
            var x = aDOMEvent.clientX,
                y = aDOMEvent.clientY,
                theWindow = objj_msgSend(self, "window");
            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDragged, objj_msgSend(theWindow, "convertBridgeToBase:", CGPointMake(x, y)), 0, 0, objj_msgSend(theWindow, "windowNumber"), nil, -1, 1, 0));
        }
        _uploadForm.style.position = "absolute";
        _uploadForm.style.top = "0px";
        _uploadForm.style.left = "0px";
        _uploadForm.style.zIndex = 1000;
        _fileUploadElement.style.opacity = "0";
        _fileUploadElement.style.filter = "alpha(opacity=0)";
        _uploadForm.style.width = "100%";
        _uploadForm.style.height = "100%";
        _fileUploadElement.style.fontSize = "1000px";
        if (document.attachEvent)
        {
            _fileUploadElement.style.position = "relative";
            _fileUploadElement.style.top = "-10px";
            _fileUploadElement.style.left = "-10px";
            _fileUploadElement.style.width = "1px";
        }
        else
            _fileUploadElement.style.cssFloat = "right";
        _fileUploadElement.onchange = function()
        {
            objj_msgSend(self, "uploadSelectionDidChange:",  _fileUploadElement.value);
        };
        _uploadForm.appendChild(_fileUploadElement);
        _DOMElement.appendChild(_uploadForm);
        _parameters = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(self, "setBordered:", NO);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setDelegate:"), function $UploadButton__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("delegate"), function $UploadButton__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("setURL:"), function $UploadButton__setURL_(self, _cmd, aURL)
{ with(self)
{
    _uploadForm.action = aURL;
}
},["void","CPString"]), new objj_method(sel_getUid("uploadSelectionDidChange:"), function $UploadButton__uploadSelectionDidChange_(self, _cmd, selection)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButton:didChangeSelection:")))
        objj_msgSend(_delegate, "uploadButton:didChangeSelection:",  self,  selection);
}
},["void","CPString"]), new objj_method(sel_getUid("selection"), function $UploadButton__selection(self, _cmd)
{ with(self)
{
    return _fileUploadElement.value;
}
},["CPString"]), new objj_method(sel_getUid("resetSelection"), function $UploadButton__resetSelection(self, _cmd)
{ with(self)
{
    _fileUploadElement.value = "";
}
},["void"]), new objj_method(sel_getUid("uploadDidFinishWithResponse:"), function $UploadButton__uploadDidFinishWithResponse_(self, _cmd, response)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButton:didFinishUploadWithData:")))
        objj_msgSend(_delegate, "uploadButton:didFinishUploadWithData:",  self,  response);
}
},["void","CPString"]), new objj_method(sel_getUid("uploadDidFailWithError:"), function $UploadButton__uploadDidFailWithError_(self, _cmd, anError)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButton:didFailWithError:")))
        objj_msgSend(_delegate, "uploadButton:didFailWithError:",  self,  anError);
}
},["void","CPString"]), new objj_method(sel_getUid("setValue:forParameter:"), function $UploadButton__setValue_forParameter_(self, _cmd, aValue, aParam)
{ with(self)
{
    if(aParam == "file")
        return NO;
    objj_msgSend(_parameters, "setObject:forKey:", aValue, aParam);
    return YES;
}
},["BOOL","CPString","CPString"]), new objj_method(sel_getUid("parameters"), function $UploadButton__parameters(self, _cmd)
{ with(self)
{
    return _parameters;
}
},["void"]), new objj_method(sel_getUid("submit"), function $UploadButton__submit(self, _cmd)
{ with(self)
{
    _uploadForm.target = "FRAME_"+(new Date());
    var index = _uploadForm.childNodes.length;
    while(index--)
        _uploadForm.removeChild(_uploadForm.childNodes[index]);
    var keys = objj_msgSend(_parameters, "allKeys");
    for(var i = 0, count = keys.length; i<count; i++)
    {
        var element = document.createElement("input");
        element.type = "hidden";
        element.name = keys[i];
        element.value = objj_msgSend(_parameters, "objectForKey:", keys[i]);
        _uploadForm.appendChild(element);
    }
    _uploadForm.appendChild(_fileUploadElement);
    if(_DOMIFrameElement)
    {
        document.body.removeChild(_DOMIFrameElement);
        _DOMIFrameElement.onload = nil;
        _DOMIFrameElement = nil;
    }
    if(window.attachEvent)
    {
        _DOMIFrameElement = document.createElement("<iframe id=\"" + _uploadForm.target + "\" name=\"" + _uploadForm.target + "\" />");
        if(window.location.href.toLowerCase().indexOf("https") === 0)
            _DOMIFrameElement.src = "javascript:false";
    }
    else
    {
        _DOMIFrameElement = document.createElement("iframe");
        _DOMIFrameElement.name = _uploadForm.target;
    }
    _DOMIFrameElement.style.width = "1px";
    _DOMIFrameElement.style.height = "1px";
    _DOMIFrameElement.style.zIndex = -1000;
    _DOMIFrameElement.style.opacity = "0";
    _DOMIFrameElement.style.filter = "alpha(opacity=0)";
    document.body.appendChild(_DOMIFrameElement);
    _onloadHandler = function()
    {
        try
        {
            var responseText = _DOMIFrameElement.contentWindow.document.body ? _DOMIFrameElement.contentWindow.document.body.innerHTML :
                                                                               _DOMIFrameElement.contentWindow.document.documentElement.textContent;
            objj_msgSend(self, "uploadDidFinishWithResponse:",  responseText);
            window.setTimeout(function(){
                document.body.removeChild(_DOMIFrameElement);
                _DOMIFrameElement.onload = nil;
                _DOMIFrameElement = nil;
            }, 100);
        }
        catch (e)
        {
            objj_msgSend(self, "uploadDidFailWithError:", e);
        }
    }
    if (window.attachEvent)
    {
        _DOMIFrameElement.onreadystatechange = function()
        {
            if (this.readyState == "loaded" || this.readyState == "complete")
                _onloadHandler();
        }
    }
    _DOMIFrameElement.onload = _onloadHandler;
    _uploadForm.submit();
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("uploadButtonDidBeginUpload:")))
        objj_msgSend(_delegate, "uploadButtonDidBeginUpload:", self);
}
},["void"]), new objj_method(sel_getUid("disposeOfEvent:"), function $UploadButton__disposeOfEvent_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPLeftMouseDown)
        objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("disposeOfEvent:"), CPLeftMouseUpMask, nil, nil, YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $UploadButton__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("disposeOfEvent:"), CPLeftMouseDownMask, nil, nil, YES);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadButton").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"])]);
}
_CPGUID= function()
{
    var g = "";
    for(var i = 0; i < 32; i++)
        g += Math.floor(Math.random() * 0xF).toString(0xF);
    return g;
}

p;27;controllers/PlayerControl.jt;7124;@STATIC;1.0;i;21;../gui/PlayerWindow.ji;18;../model/XYZSong.ji;20;../gui/MainBrowser.ji;15;../gui/DJList.ji;16;SMSoundManager.jt;6990;objj_executeFile("../gui/PlayerWindow.j", YES);
objj_executeFile("../model/XYZSong.j", YES);
objj_executeFile("../gui/MainBrowser.j", YES);
objj_executeFile("../gui/DJList.j", YES);
objj_executeFile("SMSoundManager.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "PlayerControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("player"), new objj_ivar("theSoundManager"), new objj_ivar("currentlyPlayingSong"), new objj_ivar("app"), new objj_ivar("mainBrowser"), new objj_ivar("djList"), new objj_ivar("playing"), new objj_ivar("paused"), new objj_ivar("singleMode")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("singleMode"), function $PlayerControl__singleMode(self, _cmd)
{ with(self)
{
return singleMode;
}
},["id"]),
new objj_method(sel_getUid("setSingleMode:"), function $PlayerControl__setSingleMode_(self, _cmd, newValue)
{ with(self)
{
singleMode = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithMainPlayingList:djList:"), function $PlayerControl__initWithMainPlayingList_djList_(self, _cmd, aMainBrowser, aDJList)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PlayerControl").super_class }, "init");
 if(self){
  app = objj_msgSend(CPApp, "delegate");
  djList=aDJList;
  mainBrowser = aMainBrowser;
  objj_msgSend(self, "togglePlayerWindow");
  theSoundManager = objj_msgSend(objj_msgSend(SMSoundManager, "alloc"), "init");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("setTime:"), "pos", theSoundManager);
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("songDidFinishPlaying:"), "SongEnded", theSoundManager);
  singleMode=YES;
  return self;
 }
}
},["id","MainBrowser","DJList"]), new objj_method(sel_getUid("play"), function $PlayerControl__play(self, _cmd)
{ with(self)
{
 CPLog.trace("Will play soemthing...");
 if(singleMode){
  var song = objj_msgSend(mainBrowser, "getSelectedSong");
  CPLog.trace("Se selecciono del main browser, %s", objj_msgSend(song, "songTitle"));
  objj_msgSend(self, "playSong:", song);
 }else{
  var song = objj_msgSend(djList, "getSelectedSong");
  CPLog.trace("Se selecciono del DJList, %s", objj_msgSend(song, "songTitle"));
  objj_msgSend(self, "playSong:", song);
 }
}
},["void"]), new objj_method(sel_getUid("playSong:"), function $PlayerControl__playSong_(self, _cmd, aSong)
{ with(self)
{
  if(objj_msgSend(theSoundManager, "isLoaded")){
   if(!playing){
    if(objj_msgSend(aSong, "pathToSong")==NULL)
     CPLog.error("No path in the song selected!");
    else{
     CPLog.info("Playing: %s", objj_msgSend(aSong, "pathToSong"));
     currentlyPlayingSong=aSong;
     var currentlyPlayingString= objj_msgSend(aSong, "songTitle")+" by "+objj_msgSend(aSong, "artist");
     objj_msgSend(player, "setCurrentlyPlayingSong:time:", currentlyPlayingString, objj_msgSend(aSong, "time"));
     objj_msgSend(player, "setTime:", objj_msgSend(aSong, "time"));
     objj_msgSend(theSoundManager, "playSound:", objj_msgSend(aSong, "pathToSong"));
     objj_msgSend(player, "setPausedIcon");
     playing = YES;
    }
   }else{
    if(paused){
     CPLog.trace("Resumming...");
     objj_msgSend(theSoundManager, "togglePause");
     objj_msgSend(player, "setPausedIcon");
     paused = NO;
    }else{
     CPLog.trace("Pausing...");
     objj_msgSend(theSoundManager, "togglePause");
     objj_msgSend(player, "setPlayIcon");
     paused = YES;
    }
   }
  }
  else{
   CPLog.trace("El sound manager aun no esta funcionando..espere un momento....");
   theSoundManager = objj_msgSend(objj_msgSend(SMSoundManager, "alloc"), "init");
  }
}
},["void","XYZSong"]), new objj_method(sel_getUid("nextSong"), function $PlayerControl__nextSong(self, _cmd)
{ with(self)
{
  if(singleMode){
   var totalSongs = objj_msgSend(mainBrowser, "getSongListSize");
   var index = objj_msgSend(mainBrowser, "getSongIndex:",  currentlyPlayingSong);
   index++;
   if(totalSongs <= index)
    index=0;
   objj_msgSend(mainBrowser, "setSelectionIndexes:", index);
   if(!paused){
    CPLog.trace("Is playing switching to the new song");
    objj_msgSend(self, "stopSong");
    objj_msgSend(self, "playSong:", objj_msgSend(mainBrowser, "getSongByIndex:", index));
   }else{
    CPLog.trace("Not playing just selecting the song");
    objj_msgSend(self, "stopSong");
    paused = NO;
    playing = NO;
   }
  }else{
  }
 }
},["void"]), new objj_method(sel_getUid("previousSong"), function $PlayerControl__previousSong(self, _cmd)
{ with(self)
{
 if(singleMode){
  var totalSongs = objj_msgSend(mainBrowser, "getSongListSize");
  var index = objj_msgSend(mainBrowser, "getSongIndex:",  currentlyPlayingSong);
  index--;
  if(index < 0)
   index = totalSongs-1;
  CPLog.trace("Index: %s",index);
  objj_msgSend(mainBrowser, "setSelectionIndexes:", index);
  if(!paused){
   CPLog.trace("Is playing switching to the new song");
   objj_msgSend(self, "stopSong");
   objj_msgSend(self, "playSong:", objj_msgSend(mainBrowser, "getSongByIndex:", index));
  }else{
   CPLog.trace("Not playing just selecting the song");
   objj_msgSend(self, "stopSong");
   paused = NO;
   playing = NO;
  }
 }else{
 }
}
},["void"]), new objj_method(sel_getUid("stopSong"), function $PlayerControl__stopSong(self, _cmd)
{ with(self)
{
 objj_msgSend(theSoundManager, "stopSound");
 objj_msgSend(player, "stopSong");
 playing = NO;
}
},["void"]), new objj_method(sel_getUid("setTime:"), function $PlayerControl__setTime_(self, _cmd, aNotification)
{ with(self)
{
 var info = objj_msgSend(aNotification, "userInfo");
 var aux = objj_msgSend(info, "objectForKey:", "time");
 time = aux;
 if(time==NULL)
  return;
 objj_msgSend(player, "setTime:", time);
}
},["void","CPNotification"]), new objj_method(sel_getUid("songDidFinishPlaying:"), function $PlayerControl__songDidFinishPlaying_(self, _cmd, aNotification)
{ with(self)
{
 CPLog.trace("Song finished playing");
 objj_msgSend(player, "songDidFinishPlaying");
 paused=NO;
 playing=NO;
}
},["void","CPNotification"]), new objj_method(sel_getUid("setVolume:"), function $PlayerControl__setVolume_(self, _cmd, aVolume)
{ with(self)
{
 objj_msgSend(theSoundManager, "setVolume:", aVolume);
}
},["void","double"]), new objj_method(sel_getUid("togglePlayerWindow"), function $PlayerControl__togglePlayerWindow(self, _cmd)
{ with(self)
{
 var xpos = objj_msgSend(objj_msgSend(objj_msgSend(app, "theWindow"), "contentView"), "bounds");
    if(!player){
  player = objj_msgSend(objj_msgSend(PlayerWindow, "alloc"), "initWithAcontrol:contentRect:", self, CGRectMake(CGRectGetWidth(xpos)/2, 560, 400, 200));
  objj_msgSend(player, "setFrameOrigin:", (CPPointMake(CGRectGetWidth(xpos)/2 - 200, 560)));
 }
    if(objj_msgSend(player, "isVisible")){
        objj_msgSend(player, "close");
    }
    else
  objj_msgSend(player, "orderFront:", self);
}
},["void"])]);
}

p;28;controllers/SMSoundManager.jt;3370;@STATIC;1.0;t;3351;{var the_class = objj_allocateClassPair(CPObject, "SMSoundManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("isLoaded"), new objj_ivar("soundManager"), new objj_ivar("song")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SMSoundManager__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SMSoundManager").super_class }, "init");
    CPLog.trace("Inicializando el SM");
    window.setTimeout(setupSoundManager, 1000, self);
    return self;
}
},["id"]), new objj_method(sel_getUid("soundManagerDidLoad:"), function $SMSoundManager__soundManagerDidLoad_(self, _cmd, aManager)
{ with(self)
{
    isLoaded = YES;
    soundManager = aManager;
}
},["void","Object"]), new objj_method(sel_getUid("playSound:"), function $SMSoundManager__playSound_(self, _cmd, aFile)
{ with(self)
{
 CPLog.trace("The File: %s",aFile);
    var song = soundManager.createSound({
  id : 'aSong',
  url : aFile,
  onfinish: function(){
   objj_msgSend(self, "soundDidFinish")
  ;},
  whileplaying: function(){
   objj_msgSend(self, "soundPosition");
  }
 });
 song.play();
}
},["void","CPString"]), new objj_method(sel_getUid("pauseSound"), function $SMSoundManager__pauseSound(self, _cmd)
{ with(self)
{
 soundManager.pause('aSong');
}
},["void"]), new objj_method(sel_getUid("resumeSound"), function $SMSoundManager__resumeSound(self, _cmd)
{ with(self)
{
 soundManager.resume('aSong');
}
},["void"]), new objj_method(sel_getUid("togglePause"), function $SMSoundManager__togglePause(self, _cmd)
{ with(self)
{
 soundManager.togglePause('aSong');
}
},["void"]), new objj_method(sel_getUid("stopSound"), function $SMSoundManager__stopSound(self, _cmd)
{ with(self)
{
 soundManager.destroySound('aSong');
 soundManager.stopAll();
}
},["void"]), new objj_method(sel_getUid("isLoaded"), function $SMSoundManager__isLoaded(self, _cmd)
{ with(self)
{
 return isLoaded;
}
},["void"]), new objj_method(sel_getUid("setVolume:"), function $SMSoundManager__setVolume_(self, _cmd, aVolume)
{ with(self)
{
 soundManager.setVolume('aSong', aVolume);
}
},["void","int"]), new objj_method(sel_getUid("soundDidFinish"), function $SMSoundManager__soundDidFinish(self, _cmd)
{ with(self)
{
  CPLog.trace("Sound finished...posting notification...");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "SongEnded", self);
}
},["void"]), new objj_method(sel_getUid("soundPosition"), function $SMSoundManager__soundPosition(self, _cmd)
{ with(self)
{
 var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", song.position, "time");
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "pos", self, info);
}
},["void"])]);
}
var setupSoundManager = function(obj)
{
 var script = document.createElement("script");
 script.type = "text/javascript";
 script.src = "Resources/soundmanager2.js";
 script.addEventListener("load", function()
 {
  soundManager.url = "Resources/";
  soundManager.onload = function() {
            objj_msgSend(obj, "soundManagerDidLoad:", soundManager);
  };
        soundManager.beginDelayedInit();
  soundManager.debugMode = false;
 }, YES);
 document.getElementsByTagName("head")[0].appendChild(script);
}

p;29;controllers/SongURLUploader.jt;2261;@STATIC;1.0;t;2242;{var the_class = objj_allocateClassPair(CPObject, "SongURLUploader"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("app"), new objj_ivar("theConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SongURLUploader__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SongURLUploader").super_class }, "init");
    if(self) {
        app = objj_msgSend(CPApp, "delegate");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("uploadSongWithTitle:artist:genere:time:pathToAlbumArt:songURL:"), function $SongURLUploader__uploadSongWithTitle_artist_genere_time_pathToAlbumArt_songURL_(self, _cmd, aTitle, anArtist, aGenere, aTime, aPathToArt, aURL)
{ with(self)
{
        var aURL = objj_msgSend(app, "serverIP") + "/AddSong?songTitle="+aTitle+"&artist="+anArtist+"&genere="+aGenere+"&time="+aTime+"&pathToAlbumArt="+aPathToArt+
        "&pathToSong="+aURL+"&userid="+objj_msgSend(objj_msgSend(app, "userLoggedin"), "email");
        CPLog.info("Getting users at: %s", aURL);
        var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
        theConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
},["void","CPString","CPString","CPString","CPString","CPString","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SongURLUploader__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
        CPLog.trace("SubmitSuccessful");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "SubmitSuccessful", self);
    }
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SongURLUploader__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
        CPLog.error(error);
    }
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongURLUploader__clearConnection_(self, _cmd, connection)
{ with(self)
{
        if ( connection == theConnection)
            theConnection = nil;
    }
},["void","CPURLConnection"])]);
}

p;31;controllers/StarRatingControl.jt;5383;@STATIC;1.0;I;18;AppKit/CPControl.jI;16;AppKit/CPImage.jt;5320;objj_executeFile("AppKit/CPControl.j", NO);
objj_executeFile("AppKit/CPImage.j", NO);
var starEmpty = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  "Resources/StarRater/empty.png",  CPSizeMake(25, 25)),
    starSet = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  "Resources/StarRater/set.png",  CPSizeMake(25, 25)),
    starActive = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  "Resources/StarRater/active.png",  CPSizeMake(25, 25));
{var the_class = objj_allocateClassPair(CPControl, "StarRatingControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("numberOfStars"), new objj_ivar("activeValue"), new objj_ivar("isActive")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("numberOfStars"), function $StarRatingControl__numberOfStars(self, _cmd)
{ with(self)
{
return numberOfStars;
}
},["id"]),
new objj_method(sel_getUid("setNumberOfStars:"), function $StarRatingControl__setNumberOfStars_(self, _cmd, newValue)
{ with(self)
{
numberOfStars = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $StarRatingControl__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StarRatingControl").super_class }, "initWithFrame:", aFrame))
    {
        numberOfStars = 6;
        self._DOMElement.style.cursor = "pointer";
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $StarRatingControl__viewWillMoveToWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(aWindow, "setAcceptsMouseMovedEvents:", YES);
}
},["void","CPWindow"]), new objj_method(sel_getUid("drawRect:"), function $StarRatingControl__drawRect_(self, _cmd, aRect)
{ with(self)
{
    if(objj_msgSend(starEmpty, "loadStatus") != CPImageLoadStatusCompleted)
      return objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, starEmpty);
    if(objj_msgSend(starSet, "loadStatus") != CPImageLoadStatusCompleted)
      return objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, starSet);
    if(objj_msgSend(starActive, "loadStatus") != CPImageLoadStatusCompleted)
      return objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, starActive);
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        bounds = objj_msgSend(self, "bounds"),
        starWidth = bounds.size.width / numberOfStars,
        starHeight = bounds.size.height,
        value = objj_msgSend(self, "intValue");
    for (var i=0; i<numberOfStars; i++)
    {
        if (isActive && activeValue > i)
            CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starActive);
        else
        {
            if (value > i)
                CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starSet);
            else if (value <= i)
                CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starEmpty);
        }
    }
}
},["void","CGRect"]), new objj_method(sel_getUid("imageDidLoad:"), function $StarRatingControl__imageDidLoad_(self, _cmd, aNotification)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPImageDidLoadNotification, objj_msgSend(aNotification, "object"));
  objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("mouseEntered:"), function $StarRatingControl__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{
    isActive = YES;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $StarRatingControl__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    isActive = NO;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $StarRatingControl__mouseMoved_(self, _cmd, anEvent)
{ with(self)
{
    var offset = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil).x,
        bounds = objj_msgSend(self, "bounds"),
        starWidth = bounds.size.width / numberOfStars;
    activeValue = offset < 5 ? 0 : CEIL(offset/starWidth);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $StarRatingControl__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "setIntValue:", activeValue);
    activeValue = 0;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StarRatingControl").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("sizeToFit"), function $StarRatingControl__sizeToFit(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setFrameSize:", CGSizeMake(numberOfStars*25, 25));
}
},["void"])]);
}

p;18;dataStore/SongDS.jt;3121;@STATIC;1.0;i;21;../gui/XYZMusicList.ji;18;../model/XYZSong.jt;3053;objj_executeFile("../gui/XYZMusicList.j", YES);
objj_executeFile("../model/XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "SongDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("xyzConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SongDS__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SongDS").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addNewPlaylist:"), function $SongDS__addNewPlaylist_(self, _cmd, nameOfPlaylist)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/AddNewPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SongDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    var info = JSON.parse(data);
    if(!response.error){
        CPLog.info("Filling songs...");
        var newSong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
        objj_msgSend(newSong, "setSongTitle:", info.songTitle);
        objj_msgSend(newSong, "setArtist:", info.artist);
        objj_msgSend(newSong, "setTime:", info.time);
        objj_msgSend(newSong, "setGenre:", info.genre);
        objj_msgSend(newSong, "setRating:", info.rating);
        CPLog.warn("El valor de songID es: "+ info.songID );
        objj_msgSend(newSong, "setSongID:", info.songID.id);
        objj_msgSend(newSong, "setLocal:", info.isLocal);
        objj_msgSend(newSong, "setPathToSong:", info.pathToSong);
        objj_msgSend(newSong, "setPathToAlbumArt:", info.pathToAlbumArt);
        var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", newSong, "theSong");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "SongReceived", self, info);
    }else{
        CPLog.info("No songs found in data!");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SongDS__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SongDS__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == xyzConnection)
        xyzConnection = nil;
}
},["void","CPURLConnection"])]);
}

p;22;dataStore/SongListDS.jt;5738;@STATIC;1.0;i;23;../model/XYZMusicList.ji;18;../model/XYZSong.jt;5668;objj_executeFile("../model/XYZMusicList.j", YES);
objj_executeFile("../model/XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "SongListDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("xyzConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SongListDS__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SongListDS").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addNewPlaylist:"), function $SongListDS__addNewPlaylist_(self, _cmd, nameOfPlaylist)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/AddNewPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("addSongToPlaylist:song:"), function $SongListDS__addSongToPlaylist_song_(self, _cmd, nameOfPlaylist, aSong)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/AddSongToPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist + "&songID=" + objj_msgSend(aSong, "songID");
    CPLog.info("Adding "+aSong+" to playlist "+nameOfPlaylist+" at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString","XYZSong"]), new objj_method(sel_getUid("removePlaylist:"), function $SongListDS__removePlaylist_(self, _cmd, nameOfPlaylist)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/RemovePlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("getUserPlaylists"), function $SongListDS__getUserPlaylists(self, _cmd)
{ with(self)
{
    answerArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/GetUserPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email");
    CPLog.info("Getting user playlists at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SongListDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if(!data)
        return;
    var result = JSON.parse(data);
    CPLog.trace("The data:"+data);
    CPLog.info("Playlists: %s", result);
    for(var i=0; i< result.length; i++){
        var object = result[i];
        CPLog.trace("The object>"+object);
        var musicList = objj_msgSend(objj_msgSend(XYZMusicList, "alloc"), "init");
        objj_msgSend(musicList, "setNameOfList:",  object.nameOfList);
        var arrayOfSongs = object.musicList;
        for(var j=0; j<objj_msgSend(arrayOfSongs, "count"); j++){
            var emptySong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
            objj_msgSend(emptySong, "setSongID:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).songID);
            objj_msgSend(emptySong, "setSongTitle:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).songTitle);
            objj_msgSend(emptySong, "setArtist:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).artist);
            objj_msgSend(emptySong, "setTime:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).time);
            objj_msgSend(emptySong, "setGenre:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).genre);
            objj_msgSend(emptySong, "setPathToAlbumArt:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).pathToAlbumArt);
            objj_msgSend(emptySong, "setPathToSong:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).pathToSong)
            objj_msgSend(musicList, "addSong:", emptySong);
        }
        objj_msgSend(answerArray, "addObject:",  musicList);
    }
    var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", answerArray, "playlist");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "PlayListsRecived", self, info);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SongListDS__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SongListDS__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongListDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == xyzConnection)
        xyzConnection = nil;
}
},["void","CPURLConnection"])]);
}

p;36;dataStore/UserListCollectionViewDS.jt;3556;@STATIC;1.0;i;18;../model/XYZUser.ji;28;../model/XYZUserPrefrences.jt;3481;objj_executeFile("../model/XYZUser.j", YES);
objj_executeFile("../model/XYZUserPrefrences.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "UserListCollectionViewDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("connection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UserListCollectionViewDS__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UserListCollectionViewDS").super_class }, "init");
 if(self){
 }
 return self;
}
},["id"]), new objj_method(sel_getUid("getOnlineUsers"), function $UserListCollectionViewDS__getOnlineUsers(self, _cmd)
{ with(self)
{
 answerArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
 var app = objj_msgSend(CPApp, "delegate");
 var aURL = objj_msgSend(app, "serverIP") + "/GetAllCheckedOnlineUsersAsJSON"
 CPLog.info("Getting users at: %s", aURL);
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
 connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UserListCollectionViewDS__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
 var result = JSON.parse(data);
 CPLog.info("The users: %s", result.pathToAvatar);
 for(var i=0; i< result.length; i++){
  var userInfo = result[i];
  var newUser = objj_msgSend(objj_msgSend(XYZUser, "alloc"), "init");
  objj_msgSend(newUser, "setEmail:",  userInfo.email);
  objj_msgSend(newUser, "setUsernick:",  userInfo.usernick);
  if(userInfo.pathToAvatar)
   objj_msgSend(newUser, "setPathToAvatar:",  userInfo.pathToAvatar);
  else
   objj_msgSend(newUser, "setPathToAvatar:", "");
  objj_msgSend(newUser, "setLogged:",  userInfo.logged);
  if(userInfo.dj)
   objj_msgSend(newUser, "setDj:", YES);
  else
   objj_msgSend(newUser, "setDj:", NO);
  objj_msgSend(newUser, "setSex:",  userInfo.sex);
  objj_msgSend(newUser, "setDjList1:",  userInfo.djList1);
  objj_msgSend(newUser, "setDjList2:",  userInfo.djList2);
  objj_msgSend(newUser, "setDjList3:",  userInfo.djList3);
  objj_msgSend(newUser, "setOwnedSongs:",  userInfo.ownedSongs);
  objj_msgSend(newUser, "setUserRating:",  userInfo.userRating);
  var somePrefrences = objj_msgSend(objj_msgSend(XYZUserPrefrences, "alloc"), "init");
  objj_msgSend(newUser, "setPrefrences:",  somePrefrences);
  objj_msgSend(answerArray, "addObject:",  newUser);
 }
 var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", answerArray, "list");
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "UserListRetrived", self, info);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $UserListCollectionViewDS__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $UserListCollectionViewDS__connection_didFailWithError_(self, _cmd, aConnection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $UserListCollectionViewDS__clearConnection_(self, _cmd, aConnection)
{ with(self)
{
    if (aConnection == louhiConnection)
        louhiConnection = nil;
}
},["void","CPURLConnection"])]);
}

p;19;gui/AddSongWindow.jt;7584;@STATIC;1.0;i;15;UploadURLForm.ji;17;UploadLocalForm.jt;7523;objj_executeFile("UploadURLForm.j", YES);;
objj_executeFile("UploadLocalForm.j", YES);;
{var the_class = objj_allocateClassPair(CPWindow, "AddSongWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("uploadURLForm"), new objj_ivar("uploadLocalForm"), new objj_ivar("animFadeInURLForm"), new objj_ivar("animFadeOutURLForm"), new objj_ivar("animFadeInUploadLocalForm"), new objj_ivar("animFadeOutUploadLocalForm"), new objj_ivar("typeOfUpload"), new objj_ivar("songURLUploader"), new objj_ivar("contentView"), new objj_ivar("currentForm")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $AddSongWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyleMask)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AddSongWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
        if (self)
        {
            objj_msgSend(self, "setTitle:", "Upload Songs");
            var contentView = objj_msgSend(self, "contentView");
            var bounds = objj_msgSend(contentView, "bounds");
            var arr =objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            objj_msgSend(arr, "addObject:", "Select how to upload your song...");
            objj_msgSend(arr, "addObject:", "URL");
            objj_msgSend(arr, "addObject:", "Upload from computer...");
            typeOfUpload =objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(20, 20, 270, 24));
            objj_msgSend(typeOfUpload, "addItemsWithTitles:", arr);
            objj_msgSend(typeOfUpload, "setTarget:", self);
            objj_msgSend(typeOfUpload, "setAction:", sel_getUid("typeOfUploadDidChangeItem"));
            objj_msgSend(contentView, "addSubview:",  typeOfUpload);
            currentForm = 0;
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("clearAndClose:"), "SubmitSuccessful", nil);
        }
    return self;
    }
},["id",null,null]), new objj_method(sel_getUid("typeOfUploadDidChangeItem"), function $AddSongWindow__typeOfUploadDidChangeItem(self, _cmd)
{ with(self)
{
        if(objj_msgSend(objj_msgSend(typeOfUpload, "selectedItem"), "title") == "URL"){
            CPLog.trace("Adding URLForm1...");
            objj_msgSend(self, "cleanForm");
            currentForm = 1;
            objj_msgSend(self, "fadeinUploadURLFormSection");
        }else if(objj_msgSend(objj_msgSend(typeOfUpload, "selectedItem"), "title") == "Upload from computer..."){
            CPLog.trace("Adding Upload local form1...");
            objj_msgSend(self, "cleanForm");
            currentForm = 2;
            objj_msgSend(self, "fadeinUploadLocalFormSection");
        }else{
            CPLog.trace("Clearing form...");
            objj_msgSend(self, "cleanForm");
            currentForm = 0;
        }
    }
},["void"]), new objj_method(sel_getUid("animationDidEnd:"), function $AddSongWindow__animationDidEnd_(self, _cmd, animation)
{ with(self)
{
        if(animation == animFadeOutURLForm){
            CPLog.info("Removing uploadURLForm...");
            objj_msgSend(uploadURLForm, "removeFromSuperview");
            uploadURLForm = nil;
        }
        if(animation == animFadeOutUploadLocalForm){
            CPLog.info("Removing uploadLocalForm...");
            objj_msgSend(uploadLocalForm, "removeFromSuperview");
            uploadLocalForm = nil;
        }
    }
},["void","CPAnimation"]), new objj_method(sel_getUid("fadeinUploadURLFormSection"), function $AddSongWindow__fadeinUploadURLFormSection(self, _cmd)
{ with(self)
{
        CPLog.info("Fading in UploadURLForm");
        uploadURLForm = objj_msgSend(objj_msgSend(UploadURLForm, "alloc"), "initWithFrame:", CGRectMake(20, 60, 500, 380));
        objj_msgSend(uploadURLForm, "setAlphaValue:", 0);
        objj_msgSend(contentView, "addSubview:",  uploadURLForm);
        animFadeInURLForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadURLForm, "alphaValue");
        objj_msgSend(animFadeInURLForm, "setStart:", 0);
        objj_msgSend(animFadeInURLForm, "setEnd:", 1);
        objj_msgSend(animFadeInURLForm, "setDuration:", 1.0);
        objj_msgSend(animFadeInURLForm, "startAnimation");
        objj_msgSend(animFadeInURLForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("fadeoutUploadURLSection"), function $AddSongWindow__fadeoutUploadURLSection(self, _cmd)
{ with(self)
{
        CPLog.trace("Fading out url section...");
        animFadeOutURLForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadURLForm, "alphaValue");
        objj_msgSend(animFadeOutURLForm, "setStart:", 1);
        objj_msgSend(animFadeOutURLForm, "setEnd:", 0);
        objj_msgSend(animFadeOutURLForm, "setDuration:", 1.0);
        objj_msgSend(animFadeOutURLForm, "startAnimation");
        objj_msgSend(animFadeOutURLForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("fadeinUploadLocalFormSection"), function $AddSongWindow__fadeinUploadLocalFormSection(self, _cmd)
{ with(self)
{
        CPLog.info("Fading in UploadLocalForm");
        uploadLocalForm = objj_msgSend(objj_msgSend(UploadLocalForm, "alloc"), "initWithFrame:", CGRectMake(20, 60, 500, 380));
        objj_msgSend(uploadLocalForm, "setAlphaValue:", 0);
        objj_msgSend(contentView, "addSubview:",  uploadLocalForm);
        animFadeInUploadLocalForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadLocalForm, "alphaValue");
        objj_msgSend(animFadeInUploadLocalForm, "setStart:", 0);
        objj_msgSend(animFadeInUploadLocalForm, "setEnd:", 1);
        objj_msgSend(animFadeInUploadLocalForm, "setDuration:", 1.0);
        objj_msgSend(animFadeInUploadLocalForm, "startAnimation");
        objj_msgSend(animFadeInUploadLocalForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("fadeoutUploadLocalSection"), function $AddSongWindow__fadeoutUploadLocalSection(self, _cmd)
{ with(self)
{
        CPLog.trace("Fading out local section...");
        animFadeOutUploadLocalForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadLocalForm, "alphaValue");
        objj_msgSend(animFadeOutUploadLocalForm, "setStart:", 1);
        objj_msgSend(animFadeOutUploadLocalForm, "setEnd:", 0);
        objj_msgSend(animFadeOutUploadLocalForm, "setDuration:", 1.0);
        objj_msgSend(animFadeOutUploadLocalForm, "startAnimation");
        objj_msgSend(animFadeOutUploadLocalForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("cleanForm"), function $AddSongWindow__cleanForm(self, _cmd)
{ with(self)
{
        if(currentForm == 0){
            CPLog.trace("Should clear all");
            return;
        }else if(currentForm == 1){
            CPLog.trace("Clearing the URLForm...");
            objj_msgSend(self, "fadeoutUploadURLSection");
        }else if(currentForm == 2){
            CPLog.trace("Clearing the LocalForm...");
             objj_msgSend(self, "fadeoutUploadLocalSection");
        }
    }
},["void"]), new objj_method(sel_getUid("clearAndClose:"), function $AddSongWindow__clearAndClose_(self, _cmd, aNotification)
{ with(self)
{
         objj_msgSend(self, "close");
     }
},["void","CPNotification"])]);
}

p;16;gui/CPLightbox.jt;2959;@STATIC;1.0;I;22;AppKit/CPApplication.jt;2913;objj_executeFile("AppKit/CPApplication.j", NO);
var SharedLightbox;
{var the_class = objj_allocateClassPair(CPObject, "CPLightbox"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_lightbox"), new objj_ivar("_backgroundColor")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("runModalForWindow:"), function $CPLightbox__runModalForWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (!_lightbox)
    {
        _lightbox = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0.0, 0.0, 10000.0, 10000.0), CPBorderlessWindowMask);
        objj_msgSend(_lightbox, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(objj_msgSend(_lightbox, "contentView"), "setBackgroundColor:", _backgroundColor || objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 209.0/255.0, 216.0/255.0, 227.0/255.0, 0.6));
    }
    objj_msgSend(_lightbox, "orderFront:", self);
    objj_msgSend(CPApp, "runModalForWindow:", aWindow);
}
},["void","CPWindow"]), new objj_method(sel_getUid("stopModal"), function $CPLightbox__stopModal(self, _cmd)
{ with(self)
{
    objj_msgSend(CPApp, "stopModal");
    objj_msgSend(_lightbox, "close");
}
},["void"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPLightbox__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    _backgroundColor = aColor;
    if (_lightbox)
        objj_msgSend(objj_msgSend(_lightbox, "contentView"), "setBackgroundColor:", _backgroundColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPLightbox__backgroundColor(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
},["CPColor"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedLightbox"), function $CPLightbox__sharedLightbox(self, _cmd)
{ with(self)
{
    if (!SharedLightbox)
        SharedLightbox = objj_msgSend(objj_msgSend(CPLightbox, "alloc"), "init");
    return SharedLightbox;
}
},["id"]), new objj_method(sel_getUid("runModalForWindow:"), function $CPLightbox__runModalForWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "sharedLightbox"), "runModalForWindow:", aWindow);
}
},["void","CPWindow"]), new objj_method(sel_getUid("stopModal"), function $CPLightbox__stopModal(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "sharedLightbox"), "stopModal");
}
},["void"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPLightbox__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "sharedLightbox"), "setBackgroundColor:", aColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPLightbox__backgroundColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "sharedLightbox"), "backgroundColor");
}
},["CPColor"])]);
}

p;16;gui/DCFormView.jt;15561;@STATIC;1.0;I;21;Foundation/CPObject.ji;13;DCTextField.jt;15497;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("DCTextField.j", YES);
DCFormControlTypeTextField = "DCFormControlTypeTextField";
DCFormControlTypeTextFieldShort = "DCFormControlTypeTextFieldShort";
DCFormControlTypeTextArea = "DCFormControlTypeTextArea";
DCFormControlTypeCheckBox = "DCFormControlTypeCheckBox";
DCFormControlTypeHidden = "DCFormControlTypeHidden";
{var the_class = objj_allocateClassPair(CPView, "DCFormView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("delegate"), new objj_ivar("enabled"), new objj_ivar("submitURLString"), new objj_ivar("submitButtonTitle"), new objj_ivar("headerLabel"), new objj_ivar("requiredLabel"), new objj_ivar("cancelButton"), new objj_ivar("submitButton"), new objj_ivar("fields"), new objj_ivar("paddingBottom"), new objj_ivar("paddingLeft"), new objj_ivar("paddingRight"), new objj_ivar("paddingTop"), new objj_ivar("lineSpacing"), new objj_ivar("columnSpacing"), new objj_ivar("labelWidth"), new objj_ivar("fieldHeight"), new objj_ivar("currentYOffset"), new objj_ivar("connection"), new objj_ivar("data")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $DCFormView__delegate(self, _cmd)
{ with(self)
{
return delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $DCFormView__setDelegate_(self, _cmd, newValue)
{ with(self)
{
delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("enabled"), function $DCFormView__enabled(self, _cmd)
{ with(self)
{
return enabled;
}
},["id"]),
new objj_method(sel_getUid("setEnabled:"), function $DCFormView__setEnabled_(self, _cmd, newValue)
{ with(self)
{
enabled = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("submitURLString"), function $DCFormView__submitURLString(self, _cmd)
{ with(self)
{
return submitURLString;
}
},["id"]),
new objj_method(sel_getUid("setSubmitURLString:"), function $DCFormView__setSubmitURLString_(self, _cmd, newValue)
{ with(self)
{
submitURLString = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("submitButtonTitle"), function $DCFormView__submitButtonTitle(self, _cmd)
{ with(self)
{
return submitButtonTitle;
}
},["id"]),
new objj_method(sel_getUid("setSubmitButtonTitle:"), function $DCFormView__setSubmitButtonTitle_(self, _cmd, newValue)
{ with(self)
{
submitButtonTitle = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("fields"), function $DCFormView__fields(self, _cmd)
{ with(self)
{
return fields;
}
},["id"]),
new objj_method(sel_getUid("setFields:"), function $DCFormView__setFields_(self, _cmd, newValue)
{ with(self)
{
fields = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $DCFormView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCFormView").super_class }, "initWithFrame:", aFrame);
 if (self) {
  objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.95, 0.95));
  paddingBottom = 20;
  paddingLeft = 20;
  paddingRight = 20;
  paddingTop = 100;
  lineSpacing = 14;
  columnSpacing = 10;
  labelWidth = 106;
  fieldHeight = 26;
  currentYOffset = paddingTop;
  fields = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
  submitButtonTitle = "Submit";
  headerLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft, 45, objj_msgSend(self, "frame").size.width - paddingLeft - paddingRight, 40));
  objj_msgSend(headerLabel, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "444444"));
  objj_msgSend(headerLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12));
  objj_msgSend(headerLabel, "setAlignment:", CPCenterTextAlignment);
  objj_msgSend(headerLabel, "setStringValue:", "");
  objj_msgSend(headerLabel, "setAutoresizingMask:", CPViewMaxXMargin | CPViewMaxYMargin);
  objj_msgSend(self, "addSubview:", headerLabel);
  requiredLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft, objj_msgSend(self, "frame").size.height - paddingBottom - 20, 100, fieldHeight));
  objj_msgSend(requiredLabel, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "444444"));
  objj_msgSend(requiredLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11));
  objj_msgSend(requiredLabel, "setStringValue:", "* Required Fields");
  objj_msgSend(requiredLabel, "setAutoresizingMask:", CPViewMaxXMargin | CPViewMinYMargin);
  objj_msgSend(requiredLabel, "setHidden:", YES);
  objj_msgSend(self, "addSubview:", requiredLabel);
  submitButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(objj_msgSend(self, "frame").size.width - paddingRight - 112, objj_msgSend(self, "frame").size.height - paddingBottom - 24, 112, 24));
  objj_msgSend(submitButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
  objj_msgSend(submitButton, "setTarget:", self);
  objj_msgSend(submitButton, "setAction:", sel_getUid("submitAction:"));
  objj_msgSend(submitButton, "setTitle:", objj_msgSend(self, "submitButtonTitle"));
  objj_msgSend(self, "addSubview:", submitButton);
  cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(
   objj_msgSend(self, "frame").size.width - paddingRight - objj_msgSend(submitButton, "frame").size.width - columnSpacing - 70,
   objj_msgSend(self, "frame").size.height - paddingBottom - 24,
   70,
   24));
  objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
  objj_msgSend(cancelButton, "setTarget:", self);
  objj_msgSend(cancelButton, "setAction:", sel_getUid("cancelAction"));
  objj_msgSend(cancelButton, "setTitle:", "Cancel");
  objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
  objj_msgSend(self, "addSubview:", cancelButton);
  objj_msgSend(self, "becomeFirstResponder");
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("didShow"), function $DCFormView__didShow(self, _cmd)
{ with(self)
{
 objj_msgSend(self, "setEnabled:", YES);
 if (objj_msgSend(fields, "count") > 0) {
 }
 for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
  if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "superview")) {
   objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "becomeFirstResponder");
   break;
  }
 }
}
},["void"]), new objj_method(sel_getUid("cancelAction"), function $DCFormView__cancelAction(self, _cmd)
{ with(self)
{
 objj_msgSend(delegate, "endForm");
}
},["void"]), new objj_method(sel_getUid("labelWithTitle:originY:"), function $DCFormView__labelWithTitle_originY_(self, _cmd, aString, y)
{ with(self)
{
 var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft, y, labelWidth, fieldHeight));
 objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "444444"));
 objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12));
 objj_msgSend(label, "setAlignment:", CPRightTextAlignment);
 objj_msgSend(label, "setStringValue:", aString);
 objj_msgSend(label, "setAutoresizingMask:", CPViewMaxXMargin | CPViewMaxYMargin);
 objj_msgSend(self, "addSubview:", label);
 return label;
}
},["CPTextField","CPString","float"]), new objj_method(sel_getUid("addFieldRowWithTitle:name:controlType:required:"), function $DCFormView__addFieldRowWithTitle_name_controlType_required_(self, _cmd, theTitle, name, theControlType, required)
{ with(self)
{
 if (theControlType != DCFormControlTypeCheckBox) {
  objj_msgSend(self, "labelWithTitle:originY:", theTitle, currentYOffset + 54);
 }
 var control;
 if (theControlType == DCFormControlTypeTextField || theControlType == DCFormControlTypeTextFieldShort) {
  var width = objj_msgSend(self, "frame").size.width - paddingLeft - labelWidth - columnSpacing - paddingRight;
  if (theControlType == DCFormControlTypeTextFieldShort) {
   width = width / 2;
  }
  control = objj_msgSend(objj_msgSend(DCTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset+50, width, fieldHeight));
  objj_msgSend(control, "setAutoresizingMask:", CPViewWidthSizable | CPViewMaxYMargin);
  objj_msgSend(control, "setDelegate:", self);
  objj_msgSend(self, "addSubview:", control);
  currentYOffset += fieldHeight + lineSpacing;
 } else if (theControlType == DCFormControlTypeTextArea) {
  var width = objj_msgSend(self, "frame").size.width - paddingLeft - labelWidth - columnSpacing - paddingRight;
  control = objj_msgSend(objj_msgSend(DCTextArea, "alloc"), "initWithFrame:", CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset, width, fieldHeight * 4));
  objj_msgSend(control, "setAutoresizingMask:", CPViewWidthSizable | CPViewMaxYMargin);
  objj_msgSend(self, "addSubview:", control);
  currentYOffset += (fieldHeight * 4) + lineSpacing;
 } else if (theControlType == DCFormControlTypeCheckBox) {
  var label = objj_msgSend(self, "labelWithTitle:originY:", theTitle, currentYOffset + 4);
  var width = objj_msgSend(self, "frame").size.width - paddingLeft - labelWidth - columnSpacing - paddingRight - 30;
  objj_msgSend(label, "setFrame:", CGRectMake(paddingLeft + labelWidth + columnSpacing + 30, objj_msgSend(label, "frame").origin.y - 10, width, objj_msgSend(label, "frame").size.height));
  objj_msgSend(label, "setAlignment:", CPLeftTextAlignment);
  currentYOffset += fieldHeight + lineSpacing - 10;
 } else if (theControlType == DCFormControlTypeHidden) {
  control = objj_msgSend(objj_msgSend(DCTextField, "alloc"), "initWithFrame:", CGRectMake(10, 10, 10, 10));
  objj_msgSend(control, "setDelegate:", self);
 }
 objj_msgSend(control, "setName:", name);
 objj_msgSend(control, "setRequired:", required);
 objj_msgSend(fields, "addObject:", control);
 if (objj_msgSend(control, "required")) {
  objj_msgSend(requiredLabel, "setHidden:", NO);
 }
 return control;
}
},["CPControl","CPString","CPString","CPString","bool"]), new objj_method(sel_getUid("setEnabled:"), function $DCFormView__setEnabled_(self, _cmd, yesNo)
{ with(self)
{
 enabled = yesNo;
 if (enabled == YES) {
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "setEnabled:", YES);
  }
  objj_msgSend(cancelButton, "setEnabled:", YES);
  objj_msgSend(cancelButton, "setAlphaValue:", 1);
  objj_msgSend(submitButton, "setEnabled:", YES);
  objj_msgSend(submitButton, "setTitle:", objj_msgSend(self, "submitButtonTitle"));
  objj_msgSend(submitButton, "setAlphaValue:", 1);
 } else {
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "respondsToSelector:", sel_getUid("setEnabled:"))) {
    objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "setEnabled:", NO);
   }
  }
  objj_msgSend(submitButton, "setEnabled:", NO);
  objj_msgSend(submitButton, "setTitle:", "Sending...");
  objj_msgSend(submitButton, "setAlphaValue:", 0.7);
 }
}
},["void","bool"]), new objj_method(sel_getUid("submitAction:"), function $DCFormView__submitAction_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(self, "setEnabled:", NO);
 var requiredError = NO;
 for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
  if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "required") && objj_msgSend(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "stringValue"), "isEqualToString:", "")) {
   requiredError = YES;
  }
 }
 if (requiredError) {
  alert("Please fill in all required fields.");
  objj_msgSend(self, "setEnabled:", YES);
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "required") && objj_msgSend(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "stringValue"), "isEqualToString:", "")) {
    objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "becomeFirstResponder");
    return;
   }
  }
 } else {
  var body = "";
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   body += "&"+ escape(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "name")) +"="+ escape(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "stringValue"));
  }
  var uniqueCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:", "unique");
  body += "&unique="+ escape(objj_msgSend(uniqueCookie, "value"));
  if (objj_msgSend(submitURLString, "isEqualToString:", "") == NO) {
   var request = objj_msgSend(CPURLRequest, "requestWithURL:", submitURLString);
   objj_msgSend(request, "setHTTPMethod:", "POST");
   objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/x-www-form-urlencoded", "Content-Type");
   objj_msgSend(request, "setValue:forHTTPHeaderField:", objj_msgSend(body, "length"), "Content-Length");
   objj_msgSend(request, "setHTTPBody:", body);
   var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
  } else {
   CPConsoleLog("Invalid submitURLString: "+ submitURLString);
  }
 }
}
},["void","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $DCFormView__connection_didReceiveResponse_(self, _cmd, aConnection, response)
{ with(self)
{
}
},["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $DCFormView__connection_didReceiveData_(self, _cmd, aConnection, theData)
{ with(self)
{
 data = theData;
}
},["void","CPURLConnection","Object"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $DCFormView__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
 objj_msgSend(submitButton, "setTitle:", "Done!");
 objj_msgSend(cancelButton, "setEnabled:", NO);
 objj_msgSend(cancelButton, "setAlphaValue:", 0.7);
 var message = NO;
 if (objj_msgSend(objj_msgSend(self, "thankYouMessage"), "isEqualToString:", "")) {
  objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 1, self, sel_getUid("clearAndClose"), nil, NO);
 } else {
  objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("thanks"), nil, NO);
 }
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $DCFormView__connection_didFailWithError_(self, _cmd, aConnection, error)
{ with(self)
{
 alert("Error sending form.  Please try again.");
 objj_msgSend(self, "setEnabled:", YES);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("thanks"), function $DCFormView__thanks(self, _cmd)
{ with(self)
{
 alert(objj_msgSend(self, "thankYouMessage"));
 objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("clearAndClose"), nil, NO);
}
},["void"]), new objj_method(sel_getUid("clearAndClose"), function $DCFormView__clearAndClose(self, _cmd)
{ with(self)
{
 for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
  objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "setStringValue:", "");
 }
 objj_msgSend(self, "setEnabled:", YES);
 objj_msgSend(delegate, "endForm");
}
},["void"]), new objj_method(sel_getUid("commitAction"), function $DCFormView__commitAction(self, _cmd)
{ with(self)
{
 objj_msgSend(self, "submitAction:", nil);
}
},["void"]), new objj_method(sel_getUid("thankYouMessage"), function $DCFormView__thankYouMessage(self, _cmd)
{ with(self)
{
 return "";
}
},["CPString"])]);
}

p;21;gui/DCLinkTextField.jt;1909;@STATIC;1.0;I;21;Foundation/CPObject.jt;1864;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPTextField, "DCLinkTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_oldTextColor"), new objj_ivar("HTML"), new objj_ivar("HTMLElement")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("HTML"), function $DCLinkTextField__HTML(self, _cmd)
{ with(self)
{
return HTML;
}
},["id"]),
new objj_method(sel_getUid("setHTML:"), function $DCLinkTextField__setHTML_(self, _cmd, newValue)
{ with(self)
{
HTML = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("HTMLElement"), function $DCLinkTextField__HTMLElement(self, _cmd)
{ with(self)
{
return HTMLElement;
}
},["id"]),
new objj_method(sel_getUid("setHTMLElement:"), function $DCLinkTextField__setHTMLElement_(self, _cmd, newValue)
{ with(self)
{
HTMLElement = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $DCLinkTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCLinkTextField").super_class }, "initWithFrame:", aFrame);
 if (self) {
  var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
  HTMLElement = document.createElement("div");
  HTMLElement.style.width = "100%";
  HTMLElement.style.height = "100%";
  contentView._DOMElement.appendChild(HTMLElement);
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setHTML:"), function $DCLinkTextField__setHTML_(self, _cmd, theHTML)
{ with(self)
{
 HTMLElement.innerHTML = theHTML;
}
},["void","CPString"]), new objj_method(sel_getUid("HTML"), function $DCLinkTextField__HTML(self, _cmd)
{ with(self)
{
 return HTMLElement.innerHTML;
}
},["void"])]);
}

p;17;gui/DCTextField.jt;5296;@STATIC;1.0;I;21;Foundation/CPObject.jt;5251;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPControl, "DCTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMTextElement"), new objj_ivar("delegate"), new objj_ivar("required"), new objj_ivar("name")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $DCTextField__delegate(self, _cmd)
{ with(self)
{
return delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $DCTextField__setDelegate_(self, _cmd, newValue)
{ with(self)
{
delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("required"), function $DCTextField__required(self, _cmd)
{ with(self)
{
return required;
}
},["id"]),
new objj_method(sel_getUid("setRequired:"), function $DCTextField__setRequired_(self, _cmd, newValue)
{ with(self)
{
required = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("name"), function $DCTextField__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $DCTextField__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $DCTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "initWithFrame:", aFrame);
 if (self) {
  required = NO;
  var padding = 2;
  var border = 1;
  _DOMTextElement = document.createElement("input");
  _DOMTextElement.type = "text";
  _DOMTextElement.style.position = "absolute";
  _DOMTextElement.style.top = "0px";
  _DOMTextElement.style.left = "0px";
  _DOMTextElement.style.width = (objj_msgSend(self, "frame").size.width - (padding * 2) - (border * 2)) + "px";
  _DOMTextElement.style.height = (objj_msgSend(self, "frame").size.height - (padding * 2) - (border * 2)) + "px";
  _DOMTextElement.style.whiteSpace = "pre";
  _DOMTextElement.style.zIndex = 100;
  _DOMTextElement.style.padding = padding +"px";
  _DOMTextElement.style.margin = "0px";
  _DOMTextElement.style.border = "1px solid #999999";
  _DOMElement.appendChild(_DOMTextElement);
  _DOMElement.style.overflow = "visible";
  _DOMTextElement.onkeypress = function(aDOMEvent) {
   aDOMEvent = aDOMEvent || window.event;
   if (aDOMEvent.keyCode == 13) {
    if (aDOMEvent.preventDefault)
     aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
     aDOMEvent.stopPropagation();
    aDOMEvent.cancelBubble = true;
    _DOMTextElement.blur();
    objj_msgSend(self, "commitAction");
   }
  };
  _DOMTextElement.onkeydown = function(aDOMEvent) {
   aDOMEvent = aDOMEvent || window.event;
   if (aDOMEvent.keyCode == 27) {
    if (aDOMEvent.preventDefault)
     aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
     aDOMEvent.stopPropagation();
    aDOMEvent.cancelBubble = true;
    _DOMTextElement.blur();
    objj_msgSend(self, "cancelAction");
   }
  };
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("becomeFirstResponder"), function $DCTextField__becomeFirstResponder(self, _cmd)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "becomeFirstResponder");
 objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0, self, sel_getUid("focus"), nil, NO);
 return YES;
}
},["BOOL"]), new objj_method(sel_getUid("focus"), function $DCTextField__focus(self, _cmd)
{ with(self)
{
 _DOMTextElement.focus();
}
},["void"]), new objj_method(sel_getUid("setStringValue:"), function $DCTextField__setStringValue_(self, _cmd, aString)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "setStringValue:", aString);
 _DOMTextElement.value = aString;
}
},["void","CPString"]), new objj_method(sel_getUid("stringValue"), function $DCTextField__stringValue(self, _cmd)
{ with(self)
{
 return _DOMTextElement.value;
}
},["CPString"]), new objj_method(sel_getUid("setEnabled:"), function $DCTextField__setEnabled_(self, _cmd, yesNo)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCTextField").super_class }, "setEnabled:", yesNo);
 if (objj_msgSend(self, "isEnabled") == YES) {
  _DOMTextElement.disabled = false;
  objj_msgSend(self, "setAlphaValue:", 1);
 } else {
  _DOMTextElement.disabled = true;
  objj_msgSend(self, "setAlphaValue:", 0.6);
 }
}
},["void","bool"]), new objj_method(sel_getUid("commitAction"), function $DCTextField__commitAction(self, _cmd)
{ with(self)
{
 if (objj_msgSend(self, "delegate") != nil) {
  if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("commitAction"))) {
   objj_msgSend(objj_msgSend(self, "delegate"), "performSelector:", sel_getUid("commitAction"));
  }
 }
}
},["void"]), new objj_method(sel_getUid("cancelAction"), function $DCTextField__cancelAction(self, _cmd)
{ with(self)
{
 if (objj_msgSend(self, "delegate") != nil) {
  if (objj_msgSend(objj_msgSend(self, "delegate"), "respondsToSelector:", sel_getUid("cancelAction"))) {
   objj_msgSend(objj_msgSend(self, "delegate"), "performSelector:", sel_getUid("cancelAction"));
  }
 }
}
},["void"])]);
}

p;12;gui/DJList.jt;14614;@STATIC;1.0;I;16;AppKit/CPPanel.ji;24;XYZPlayListWindowForDJ.ji;23;../model/XYZMusicList.ji;15;XYZTableForDJ.ji;19;NewPlaylistWindow.ji;25;../dataStore/SongListDS.jt;14442;objj_executeFile("AppKit/CPPanel.j", NO);
objj_executeFile("XYZPlayListWindowForDJ.j", YES);
objj_executeFile("../model/XYZMusicList.j", YES);
objj_executeFile("XYZTableForDJ.j", YES);
objj_executeFile("NewPlaylistWindow.j", YES);
objj_executeFile("../dataStore/SongListDS.j", YES);
{var the_class = objj_allocateClassPair(XYZPlayListWindowForDJ, "DJList"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("playlistCollectionView"), new objj_ivar("playlistsArray"), new objj_ivar("newPlaylistWindow"), new objj_ivar("djListContentView"), new objj_ivar("bounds"), new objj_ivar("songListDS"), new objj_ivar("selectedPlaylist")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSource:contentRect:"), function $DJList__initWithSource_contentRect_(self, _cmd, list, aRect)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DJList").super_class }, "initWithContentRect:", aRect);
        if (self)
        {
            objj_msgSend(self, "setTitle:", "DJ List");
            djListContentView = objj_msgSend(self, "contentView");
            bounds = objj_msgSend(djListContentView, "bounds");
            var playlistCollectionViewWidthSize = 150;
            var playlistCollectionViewHeightSize = 380;
            songListDS = objj_msgSend(objj_msgSend(SongListDS, "alloc"), "init");
            playlistsArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            var headderLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(50, 32, 100, 18));
            objj_msgSend(headderLabel, "setStringValue:", "Playlists");
            objj_msgSend(headderLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  headderLabel);
            var playListCells = objj_msgSend(objj_msgSend(PlayListCell, "alloc"), "initWithFrame:", CGRectMakeZero());
            playlistCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:",  CGRectMake(0, 0, playlistCollectionViewWidthSize, playlistCollectionViewHeightSize));
            var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:",  CGRectMake(0, 50, playlistCollectionViewWidthSize, playlistCollectionViewHeightSize+30));
            objj_msgSend(scrollView, "setAutohidesScrollers:",  YES);
            objj_msgSend(scrollView, "setDocumentView:",  playlistCollectionView);
            objj_msgSend(scrollView, "setHasHorizontalScroller:", NO);
            objj_msgSend(scrollView, "setAutoresizesSubviews:", YES);
            objj_msgSend(objj_msgSend(scrollView, "contentView"), "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "012909"));
            var listItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
            objj_msgSend(listItem, "setView:",  playListCells);
            objj_msgSend(playlistCollectionView, "setItemPrototype:",  listItem);
            objj_msgSend(playlistCollectionView, "setMaxNumberOfColumns:", 1);
            objj_msgSend(playlistCollectionView, "setMinItemSize:", CPSizeMake(playlistCollectionViewWidthSize, 20));
            objj_msgSend(playlistCollectionView, "setMaxItemSize:", CPSizeMake(playlistCollectionViewWidthSize, 20));
            objj_msgSend(playlistCollectionView, "setContent:", playlistsArray);
            objj_msgSend(djListContentView, "addSubview:", scrollView);
            objj_msgSend(playlistCollectionView, "setDelegate:",  self);
            var newPlaylistButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(20, 470, 50, 18));
            objj_msgSend(newPlaylistButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(newPlaylistButton, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(newPlaylistButton, "setTitle:", "  +  ");
            objj_msgSend(newPlaylistButton, "sizeToFit");
            objj_msgSend(newPlaylistButton, "setTarget:", self);
            objj_msgSend(newPlaylistButton, "setAction:", sel_getUid("newPlaylist"));
            objj_msgSend(djListContentView, "addSubview:",  newPlaylistButton);
            var removePlaylistButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(50, 470, 0, 0));
            objj_msgSend(removePlaylistButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(removePlaylistButton, "setTitle:", "  -  ");
            objj_msgSend(removePlaylistButton, "sizeToFit");
            objj_msgSend(removePlaylistButton, "setTarget:", self);
            objj_msgSend(removePlaylistButton, "setAction:", sel_getUid("removePlaylist"));
            objj_msgSend(djListContentView, "addSubview:",  removePlaylistButton);
            var border0a = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2, 30, playlistCollectionViewWidthSize-2, 1));
            objj_msgSend(border0a, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border0a);
            var border0b = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2, 50, playlistCollectionViewWidthSize-2, 1));
            objj_msgSend(border0b, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border0b);
            var border1 = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(playlistCollectionViewWidthSize, 30, 1, CGRectGetHeight(bounds)-32));
            objj_msgSend(border1, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border1);
            var border2 = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2, playlistCollectionViewHeightSize+80, playlistCollectionViewWidthSize-2, 1));
            objj_msgSend(border2, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border2);
            var cmArray =objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            var titleColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(2, 7, 150, 31), "Name", nil);
            var artistColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(155, 7, 150, 31), "Artist",  nil);
            var ratingColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(305, 7, 48, 31), "Rating",  nil);
            var fullModel = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [titleColumnModel, artistColumnModel, ratingColumnModel], ["title", "artist", "rating"]);
            theTable = objj_msgSend(objj_msgSend(XYZTableForDJ, "alloc"), "initWithColumnModel:model:frame:", fullModel, theList,  CGRectMake(playlistCollectionViewWidthSize, 25, 450, CGRectGetHeight(bounds)-26));
            objj_msgSend(djListContentView, "addSubview:",  theTable);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("addNewPlaylist:"), "NewPlaylistAdded", nil);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("playListsRecived:"), "PlayListsRecived", nil);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("addSongToPlaylist:"), "NewSongAddedToPlaylist", nil);
        }
        return self;
    }
},["id","CPArray","CGRect"]), new objj_method(sel_getUid("addSongToPlaylist:"), function $DJList__addSongToPlaylist_(self, _cmd, aNotification)
{ with(self)
{
        CPLog.trace("On addSongToPlaylist in the DJPlaylist.j");
        var info = objj_msgSend(aNotification, "userInfo");
        var aux = objj_msgSend(info, "objectForKey:", "songAdded");
        CPLog.trace("The song that wants to be added is: "+aux+" with the id " + objj_msgSend(aux, "songID"));
        objj_msgSend(songListDS, "addSongToPlaylist:song:", escape(objj_msgSend(selectedPlaylist, "nameOfList")), aux);
    }
},["void","CPNotification"]), new objj_method(sel_getUid("newPlaylist"), function $DJList__newPlaylist(self, _cmd)
{ with(self)
{
        var mainContentView = objj_msgSend(objj_msgSend(CPApp, "delegate"), "contentView");
        var windowsCenter = objj_msgSend(mainContentView, "convertPoint:fromView:", objj_msgSend(djListContentView, "center"), djListContentView);
        var xpos = windowsCenter.x - 300/2;
        var ypos = windowsCenter.y - 100/2;
        if(!newPlaylistWindow)
            newPlaylistWindow = objj_msgSend(objj_msgSend(NewPlaylistWindow, "alloc"), "initWithContentRect:styleMask:contentViewOfWindow:", CGRectMake(0, 0, 300, 100),  CPHUDBackgroundWindowMask|CPClosableWindowMask, djListContentView);
        objj_msgSend(newPlaylistWindow, "setFrameOrigin:", (CPPointMake(xpos,ypos)));
        objj_msgSend(newPlaylistWindow, "clean");
        objj_msgSend(newPlaylistWindow, "orderFront:", self);
    }
},["void"]), new objj_method(sel_getUid("removePlaylist"), function $DJList__removePlaylist(self, _cmd)
{ with(self)
{
        for(var i= 0; i< objj_msgSend(playlistsArray, "count"); i++){
            CPLog.info(i+"->"+objj_msgSend(objj_msgSend(playlistsArray, "objectAtIndex:",  i), "nameOfList"));
        }
        var index = objj_msgSend(playlistCollectionView, "selectionIndexes");
        var deletedPlaylist = objj_msgSend(playlistsArray, "objectAtIndex:",  objj_msgSend(index, "firstIndex"));
        var nameOfDeletedPlaylist = objj_msgSend(deletedPlaylist, "nameOfList");
        CPLog.info("removing: "+nameOfDeletedPlaylist);
        objj_msgSend(playlistsArray, "removeObjectAtIndex:",  objj_msgSend(index, "firstIndex"));
        objj_msgSend(playlistCollectionView, "reloadContent");
        objj_msgSend(songListDS, "removePlaylist:",  escape(nameOfDeletedPlaylist));
    }
},["void"]), new objj_method(sel_getUid("addNewPlaylist:"), function $DJList__addNewPlaylist_(self, _cmd, aNotification)
{ with(self)
{
        var info = objj_msgSend(aNotification, "userInfo");
        var aux = objj_msgSend(info, "objectForKey:", "playlistName");
        CPLog.info("Adding new playlist!" + aux);
        var newPlaylist =objj_msgSend(objj_msgSend(XYZMusicList, "alloc"), "init");
        objj_msgSend(newPlaylist, "setNameOfList:", aux);
        objj_msgSend(playlistsArray, "addObject:",  newPlaylist);
        objj_msgSend(playlistCollectionView, "reloadContent");
        objj_msgSend(songListDS, "addNewPlaylist:",  aux);
    }
},["void","CPNotification"]), new objj_method(sel_getUid("playListsRecived:"), function $DJList__playListsRecived_(self, _cmd, aNotification)
{ with(self)
{
        var info = objj_msgSend(aNotification, "userInfo");
        var aux = objj_msgSend(info, "objectForKey:", "playlist");
        CPLog.info("Recived:"+aux);
        playlistsArray = aux;
        objj_msgSend(playlistCollectionView, "setContent:", playlistsArray);
        objj_msgSend(playlistCollectionView, "reloadContent");
    }
},["void","CPNotification"]), new objj_method(sel_getUid("getUserPlaylists"), function $DJList__getUserPlaylists(self, _cmd)
{ with(self)
{
        CPLog.info("Getting playlists...");
        objj_msgSend(songListDS, "getUserPlaylists");
    }
},["void"]), new objj_method(sel_getUid("collectionViewDidChangeSelection:"), function $DJList__collectionViewDidChangeSelection_(self, _cmd, collectionView)
{ with(self)
{
        var index = objj_msgSend(collectionView, "selectionIndexes");
        CPLog.trace("Selected index of collectionView: "+ objj_msgSend(index, "firstIndex"));
        CPLog.trace("The playlistsArray contains: "+ playlistsArray);
        selectedPlaylist = objj_msgSend(playlistsArray, "objectAtIndex:", objj_msgSend(index, "firstIndex"));
        CPLog.trace("The selected list: "+ selectedPlaylist);
        objj_msgSend(theTable, "setModel:",  objj_msgSend(selectedPlaylist, "musicList"));
    }
},["void","CPCollectionView"])]);
}
{var the_class = objj_allocateClassPair(CPView, "PlayListCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("playlistLabel"), new objj_ivar("theIcon"), new objj_ivar("highlightView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function $PlayListCell__setRepresentedObject_(self, _cmd, playlistObject)
{ with(self)
{
        if(!playlistLabel)
        {
            playlistLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset( objj_msgSend(self, "bounds"), 4, 4));
            objj_msgSend(playlistLabel, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
            objj_msgSend(playlistLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  playlistLabel);
        }
        objj_msgSend(playlistLabel, "setStringValue:",  objj_msgSend(playlistObject, "nameOfList"));
        objj_msgSend(playlistLabel, "sizeToFit");
        objj_msgSend(playlistLabel, "setFrameOrigin:",  CGPointMake(10,0.0));
    }
},["void","JSObject"]), new objj_method(sel_getUid("setSelected:"), function $PlayListCell__setSelected_(self, _cmd, flag)
{ with(self)
{
        if(!highlightView)
        {
            highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectCreateCopy(objj_msgSend(self, "bounds")));
            objj_msgSend(highlightView, "setBackgroundColor:",  objj_msgSend(CPColor, "greenColor"));
        }
        if(flag)
        {
            objj_msgSend(self, "addSubview:positioned:relativeTo:", highlightView, CPWindowBelow,  playlistLabel);
            objj_msgSend(playlistLabel, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        }
        else
        {
            objj_msgSend(highlightView, "removeFromSuperview");
            objj_msgSend(playlistLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        }
    }
},["void","BOOL"])]);
}

p;17;gui/MainBrowser.jt;5709;@STATIC;1.0;i;19;XYZPlayListWindow.ji;16;XYZColumnModel.ji;10;XYZTable.jt;5630;objj_executeFile("XYZPlayListWindow.j", YES);
objj_executeFile("XYZColumnModel.j", YES);
objj_executeFile("XYZTable.j", YES);
{var the_class = objj_allocateClassPair(XYZPlayListWindow, "MainBrowser"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSource:rectangle:"), function $MainBrowser__initWithSource_rectangle_(self, _cmd, list, aRectangle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MainBrowser").super_class }, "initWithContentRect:", aRectangle);
    if (self)
    {
        objj_msgSend(self, "setTitle:", "Music Browser");
        var contentView = objj_msgSend(self, "contentView");
        var bounds = objj_msgSend(contentView, "bounds");
        objj_msgSend(self, "getAllSongs");
        var playingColumnModel = objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(10, 7, 26, 31), " ", nil);
        var titleColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(27, 7, 202, 31), "Name", nil);
        var artistColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(230, 7, 190, 31), "Artist",  nil);
        var timeColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(422, 7, 48, 31), "Time",  nil);
        var ratingColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(470, 7, 48, 31), "Rating",  nil);
        var fullModel = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [playingColumnModel, titleColumnModel, artistColumnModel, timeColumnModel, ratingColumnModel], ["playing", "title", "artist", "time", "rating"]);
        theTable = objj_msgSend(objj_msgSend(XYZTable, "alloc"), "initWithColumnModel:model:frame:", fullModel, list,  bounds);
        objj_msgSend(contentView, "addSubview:",  theTable);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("getAllSongs:"), "NewSongAddedXYZEvent", nil);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("getAllSongs:"), "SubmitSuccessful", nil);
    }
    return self;
}
},["id","CPArray","CGRect"]), new objj_method(sel_getUid("addItem:"), function $MainBrowser__addItem_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(theTable, "addItem:", anObject);
}
},["void","CPObject"]), new objj_method(sel_getUid("addList:"), function $MainBrowser__addList_(self, _cmd, aModel)
{ with(self)
{
    CPLog.trace("addlist here!");
    objj_msgSend(theTable, "setModel:",  aModel);
    var app = objj_msgSend(CPApp, "delegate");
    objj_msgSend(app, "setGlobalSongList:",  aModel);
}
},["void","CPArray"]), new objj_method(sel_getUid("removeSelectedItems"), function $MainBrowser__removeSelectedItems(self, _cmd)
{ with(self)
{
   CPLog.trace("removeSlectedItems in SFBrowser got a msg");
   objj_msgSend(theTable, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("getAllSongs"), function $MainBrowser__getAllSongs(self, _cmd)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var url = objj_msgSend(app, "serverIP")+"/GetAllSongs";
    theRequest = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
    serverConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", theRequest, self);
}
},["void"]), new objj_method(sel_getUid("getAllSongs:"), function $MainBrowser__getAllSongs_(self, _cmd, aNotification)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var url = objj_msgSend(app, "serverIP")+"/GetAllSongs";
    theRequest = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
    serverConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", theRequest, self);
}
},["void","CPNotification"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $MainBrowser__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    var response = JSON.parse(data);
    if(!response.error){
        CPLog.info("Filling songs...");
        var songsArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        for(var i=0; i< response.length; i++){
            var info = response[i];
            var newSong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
            objj_msgSend(newSong, "setSongTitle:", info.songTitle);
            objj_msgSend(newSong, "setArtist:", info.artist);
            objj_msgSend(newSong, "setTime:", info.time);
            objj_msgSend(newSong, "setGenre:", info.genre);
            objj_msgSend(newSong, "setRating:", info.rating);
            objj_msgSend(newSong, "setSongID:", info.songID);
            objj_msgSend(newSong, "setLocal:", info.isLocal);
            objj_msgSend(newSong, "setPathToSong:", info.pathToSong);
            objj_msgSend(newSong, "setPathToAlbumArt:", info.pathToAlbumArt);
            CPLog.trace("El valor de songID del objeto es: "+ objj_msgSend(newSong, "songID") );
            objj_msgSend(songsArray, "addObject:",  newSong);
        }
        objj_msgSend(self, "addList:", songsArray);
    }else{
        CPLog.info("No songs found in data!");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $MainBrowser__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
    connection = null;
}
},["void","CPURLConnection"])]);
}

p;27;gui/MainUserProfileWindow.jt;3130;@STATIC;1.0;t;3111;{var the_class = objj_allocateClassPair(CPWindow, "MainUserProfileWindow"),
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

p;23;gui/NewPlaylistWindow.jt;2717;@STATIC;1.0;t;2698;{var the_class = objj_allocateClassPair(CPWindow, "NewPlaylistWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("nameTextField"), new objj_ivar("botonGuardar")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:contentViewOfWindow:"), function $NewPlaylistWindow__initWithContentRect_styleMask_contentViewOfWindow_(self, _cmd, aRectangle, aStyleMask, aContentView)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NewPlaylistWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
  if (self)
  {
   contentViewOfWindow = aContentView;
   objj_msgSend(self, "setTitle:", "New Playlist");
   var contentView = objj_msgSend(self, "contentView");
   var bounds = objj_msgSend(contentView, "bounds");
   var center= CGRectGetWidth(bounds)/2.0;
   var nameLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 30, 50, 18));
   objj_msgSend(nameLabel, "setStringValue:", "Name:");
   objj_msgSend(nameLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(contentView, "addSubview:", nameLabel);
    nameTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(60, 25, 170, 28));
   objj_msgSend(nameTextField, "setEditable:", YES);
   objj_msgSend(nameTextField, "setBezeled:", YES);
   objj_msgSend(contentView, "addSubview:", nameTextField);
   botonGuardar = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(230, 65, 50, 18));
   objj_msgSend(botonGuardar, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(botonGuardar, "setBezelStyle:", CPHUDBezelStyle);
   objj_msgSend(botonGuardar, "setTitle:", "Ok");
   objj_msgSend(botonGuardar, "setTarget:", self);
   objj_msgSend(botonGuardar, "setAction:", sel_getUid("savePreferences"));
   objj_msgSend(contentView, "addSubview:",  botonGuardar);
  }
  return self;
 }
},["id",null,null,"CPView"]), new objj_method(sel_getUid("clean"), function $NewPlaylistWindow__clean(self, _cmd)
{ with(self)
{
  objj_msgSend(nameTextField, "setStringValue:", "");
 }
},["void"]), new objj_method(sel_getUid("savePreferences"), function $NewPlaylistWindow__savePreferences(self, _cmd)
{ with(self)
{
  var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(nameTextField, "objectValue"), "playlistName");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewPlaylistAdded", self, info);
  objj_msgSend(self, "close");
 }
},["void"])]);
}

p;18;gui/PlayerWindow.jt;13655;@STATIC;1.0;I;16;AppKit/CPPanel.jI;27;AppKit/CPWindowController.ji;18;../model/XYZSong.ji;30;../controllers/PlayerControl.jt;13524;objj_executeFile("AppKit/CPPanel.j", NO);
objj_executeFile("AppKit/CPWindowController.j", NO);
objj_executeFile("../model/XYZSong.j", YES);
objj_executeFile("../controllers/PlayerControl.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "PlayerWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("backButton"), new objj_ivar("playButton"), new objj_ivar("forwardButton"), new objj_ivar("volumeSlider"), new objj_ivar("currentlyPlayingTextField"), new objj_ivar("currentlyPlayingTimeTextField"), new objj_ivar("playerControl"), new objj_ivar("time"), new objj_ivar("timeSlider"), new objj_ivar("contentView"), new objj_ivar("modeControl"), new objj_ivar("singleUserModeImageOn"), new objj_ivar("multiUserModeImageOn"), new objj_ivar("singleImage")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithAcontrol:contentRect:"), function $PlayerWindow__initWithAcontrol_contentRect_(self, _cmd, aPlayerControl, aRectangle)
{ with(self)
{
  CPLog.trace("Inicializanso la ventana con un control");
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PlayerWindow").super_class }, "initWithContentRect:styleMask:", aRectangle, CPHUDBackgroundWindowMask|CPBorderlessWindowMask);
  playerControl=aPlayerControl;
  if (self)
  {
   objj_msgSend(self, "setTitle:", "Player");
   contentView = objj_msgSend(self, "contentView");
   var bounds = objj_msgSend(contentView, "bounds");
   var center= CGRectGetWidth(bounds)/2.0 -35;
   var singleUserModeImageOn = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/privado.png", CPSizeMake(26, 27));
   var multiUserModeImageOn = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/radio.png", CPSizeMake(26, 27));
   modeControl = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(20, 20, 26, 27));
   objj_msgSend(modeControl, "setImage:",  singleUserModeImageOn);
   objj_msgSend(modeControl, "setBordered:", NO);
   objj_msgSend(modeControl, "setAction:", sel_getUid("modeControlActionPerformed"));
   objj_msgSend(contentView, "addSubview:", modeControl);
   singleImage=YES;
   var backImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/backButton.png", CPSizeMake(50, 50));
   var backImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/backButtonPressed.png", CPSizeMake(50, 50));
   backButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)/2.0-100 , 30, 50, 50));
   objj_msgSend(backButton, "setImage:",  backImage);
   objj_msgSend(backButton, "setAlternateImage:",  backImagePressed);
   objj_msgSend(backButton, "setBordered:", NO);
   objj_msgSend(backButton, "setAction:", sel_getUid("previousSong"));
   var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButtonPressed.png", CPSizeMake(70, 70));
   var playImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
   playButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(center, 15, 70, 70));
   objj_msgSend(playButton, "setImage:",  playImage);
   objj_msgSend(playButton, "setBordered:", NO);
   objj_msgSend(playButton, "setAction:", sel_getUid("playSong"));
   var forwardImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/nextButton.png", CPSizeMake(50, 50));
   var forwardImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/nextButtonPressed.png", CPSizeMake(50, 50));
   forwardButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)/2.0+50, 30, 50, 50));
   objj_msgSend(forwardButton, "setImage:",  forwardImage);
   objj_msgSend(forwardButton, "setAlternateImage:",  forwardImagePressed);
   objj_msgSend(forwardButton, "setBordered:", NO);
   objj_msgSend(forwardButton, "setAction:", sel_getUid("nextSong"));
   volumeSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)/2.0 - 100, 95, 200, 25));
   objj_msgSend(volumeSlider, "setMinValue:", 0);
   objj_msgSend(volumeSlider, "setMaxValue:", 100);
   objj_msgSend(volumeSlider, "setDoubleValue:", 100);
   objj_msgSend(contentView, "addSubview:", volumeSlider);
   var volumeDownImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/volumeDown.png", CPSizeMake(26, 25));
   var volumeDownImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(70, 95, 26, 25));
   objj_msgSend(volumeDownImageView, "setImage:",  volumeDownImage);
   var volumeUpImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/volumeUp.png", CPSizeMake(26, 25));
   var volumeUpImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(305, 95, 26, 25));
   objj_msgSend(volumeUpImageView, "setImage:",  volumeUpImage);
   objj_msgSend(contentView, "addSubview:", volumeDownImageView);
   objj_msgSend(contentView, "addSubview:", volumeUpImageView);
   objj_msgSend(volumeSlider, "setTarget:", self);
   objj_msgSend(volumeSlider, "setAction:", sel_getUid("setVolume:"));
   var grillBG = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/fondotrans.png", CPSizeMake(371, 67));
   var grillBGImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 130, 371, 67));
   objj_msgSend(grillBGImageView, "setImage:",  grillBG);
   objj_msgSend(grillBGImageView, "setAlphaValue:", 0.6);
   objj_msgSend(contentView, "addSubview:",  grillBGImageView);
   var currentlyPlayingString=" ";
   currentlyPlayingTextField= objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 150, 350, 18));
   objj_msgSend(currentlyPlayingTextField, "setStringValue:", currentlyPlayingString);
   objj_msgSend(currentlyPlayingTextField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(currentlyPlayingTextField, "setAlignment:", CPCenterTextAlignment);
   objj_msgSend(contentView, "addSubview:",  currentlyPlayingTextField);
   var currentlyPlayingTimeString="0:00";
   currentlyPlayingTimeTextField= objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(300, 133, 100, 18));
   objj_msgSend(currentlyPlayingTimeTextField, "setStringValue:", currentlyPlayingTimeString);
   objj_msgSend(currentlyPlayingTimeTextField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(currentlyPlayingTimeTextField, "setAlignment:", CPCenterTextAlignment);
   objj_msgSend(contentView, "addSubview:",  currentlyPlayingTimeTextField);
   timeSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake( (CGRectGetWidth(bounds)- 250)/2, 170, 250, 25));
   objj_msgSend(timeSlider, "setMinValue:", 0);
   objj_msgSend(timeSlider, "setMaxValue:", 100);
   objj_msgSend(timeSlider, "setDoubleValue:", 0);
   objj_msgSend(timeSlider, "setTarget:", self);
   objj_msgSend(timeSlider, "setAction:", sel_getUid("setTimeOfSong:"));
   objj_msgSend(contentView, "addSubview:", timeSlider);
   var glassImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/transparencia-cristal.png", CPSizeMake(371, 34));
   var glassImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 128, 371, 34));
   objj_msgSend(glassImageView, "setImage:",  glassImage);
   objj_msgSend(glassImageView, "setAlphaValue:", .3);
   objj_msgSend(contentView, "addSubview:",  glassImageView);
   objj_msgSend(contentView, "addSubview:",  backButton);
   objj_msgSend(contentView, "addSubview:",  playButton);
   objj_msgSend(contentView, "addSubview:",  forwardButton);
  }
  return self;
 }
},["id","PlayerControl","CGRect"]), new objj_method(sel_getUid("setPlayIcon"), function $PlayerWindow__setPlayIcon(self, _cmd)
{ with(self)
{
  var pausedIcon = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:", pausedIcon);
 }
},["void"]), new objj_method(sel_getUid("setStopIcon"), function $PlayerWindow__setStopIcon(self, _cmd)
{ with(self)
{
 }
},["void"]), new objj_method(sel_getUid("setPausedIcon"), function $PlayerWindow__setPausedIcon(self, _cmd)
{ with(self)
{
  var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/pausedIcon.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:", playImage);
 }
},["void"]), new objj_method(sel_getUid("setVolume:"), function $PlayerWindow__setVolume_(self, _cmd, aVolume)
{ with(self)
{
  objj_msgSend(playerControl, "setVolume:", objj_msgSend(aVolume, "doubleValue"));
 }
},["void","id"]), new objj_method(sel_getUid("playSong"), function $PlayerWindow__playSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "play");
 }
},["void"]), new objj_method(sel_getUid("pauseSong"), function $PlayerWindow__pauseSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "pauseSong");
 }
},["void"]), new objj_method(sel_getUid("stopSong"), function $PlayerWindow__stopSong(self, _cmd)
{ with(self)
{
  var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:", playImage);
 }
},["void"]), new objj_method(sel_getUid("nextSong"), function $PlayerWindow__nextSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "nextSong");
 }
},["void"]), new objj_method(sel_getUid("previousSong"), function $PlayerWindow__previousSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "previousSong");
 }
},["void"]), new objj_method(sel_getUid("setTime:"), function $PlayerWindow__setTime_(self, _cmd, aTime)
{ with(self)
{
  if(aTime){
   objj_msgSend(currentlyPlayingTimeTextField, "setStringValue:",  objj_msgSend(self, "getTime:",  aTime));
   objj_msgSend(timeSlider, "setDoubleValue:", parseInt(aTime));
   objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
  }
 }
},["void","int"]), new objj_method(sel_getUid("setCurrentlyPlayingSong:time:"), function $PlayerWindow__setCurrentlyPlayingSong_time_(self, _cmd, aSongTitle, aMaxTime)
{ with(self)
{
  CPLog.trace(aMaxTime);
  objj_msgSend(currentlyPlayingTextField, "setStringValue:", aSongTitle);
  var auxArray = objj_msgSend(aMaxTime, "componentsSeparatedByString:", ":");
  var seconds = (parseInt(auxArray[0]) * 60) + parseInt(auxArray[1]);
  var milies = seconds * 1000;
  CPLog.trace("%s milies", milies);
  objj_msgSend(timeSlider, "setMaxValue:", parseInt(milies));
  objj_msgSend(timeSlider, "setDoubleValue:", 0);
 }
},["void","CPString","CPString"]), new objj_method(sel_getUid("labelWithTitle:"), function $PlayerWindow__labelWithTitle_(self, _cmd, aTitle)
{ with(self)
{
  var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
  objj_msgSend(label, "setStringValue:", aTitle);
  objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
  objj_msgSend(label, "sizeToFit");
  return label;
 }
},["CPTextField","CPString"]), new objj_method(sel_getUid("songDidFinishPlaying"), function $PlayerWindow__songDidFinishPlaying(self, _cmd)
{ with(self)
{
  var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButtonPressed.png", CPSizeMake(70, 70));
  var playImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:",  playImage);
  objj_msgSend(playButton, "setAlternateImage:",  playImagePressed);
  objj_msgSend(currentlyPlayingTextField, "setStringValue:", " ");
  objj_msgSend(currentlyPlayingTimeTextField, "setStringValue:", "0:00");
 }
},["void"]), new objj_method(sel_getUid("setTimeOfSong:"), function $PlayerWindow__setTimeOfSong_(self, _cmd, aVolume)
{ with(self)
{
 }
},["void","id"]), new objj_method(sel_getUid("getTime:"), function $PlayerWindow__getTime_(self, _cmd, timeInMilis)
{ with(self)
{
  var nSec = Math.floor(timeInMilis/1000);
  var min = Math.floor(nSec/60);
  var sec = nSec-(min*60);
  if (min == 0 && sec == 0) return null;
  if(sec>=10)
  return min+":"+sec;
  else
  return min+":0"+sec;
 }
},["CPString","int"]), new objj_method(sel_getUid("modeControlActionPerformed"), function $PlayerWindow__modeControlActionPerformed(self, _cmd)
{ with(self)
{
  if(singleImage){
   CPLog.info("Setting singleuser");
   objj_msgSend(modeControl, "setImage:",  multiUserModeImageOn);
   objj_msgSend(playerControl, "setSingleMode:", YES);
   singleImage = NO;
  }else{
   CPLog.info("Setting multiuser");
   objj_msgSend(modeControl, "setImage:",  singleUserModeImageOn);
   objj_msgSend(playerControl, "setSingleMode:", NO);
   singleImage = YES;
  }
 }
},["void"])]);
}

p;23;gui/PreferencesWindow.jt;2995;@STATIC;1.0;t;2976;{var the_class = objj_allocateClassPair(CPWindow, "PreferencesWindow"),
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

p;19;gui/ProfileWindow.jt;3471;@STATIC;1.0;t;3452;{var the_class = objj_allocateClassPair(CPWindow, "ProfileWindow"),
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

p;20;gui/StarRatingView.jt;2723;@STATIC;1.0;I;15;AppKit/CPView.ji;34;../controllers/StarRatingControl.jt;2645;





objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("../controllers/StarRatingControl.j", YES);

var values = [ "No selection",
               "Failed",
               "Not good",
               "Average",
               "Good",
               "Very good",
               "Excellent" ];

{var the_class = objj_allocateClassPair(CPView, "StarRatingView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("rater"), new objj_ivar("indicator")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("rater"), function $StarRatingView__rater(self, _cmd)
{ with(self)
{
return rater;
}
},["id"]),
new objj_method(sel_getUid("indicator"), function $StarRatingView__indicator(self, _cmd)
{ with(self)
{
return indicator;
}
},["id"]), new objj_method(sel_getUid("initWithFrame:"), function $StarRatingView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StarRatingView").super_class }, "initWithFrame:", aFrame))
    {
      rater = objj_msgSend(objj_msgSend(StarRatingControl, "alloc"), "initWithFrame:", CGRectMakeZero());
      objj_msgSend(rater, "setNumberOfStars:", 5);
      objj_msgSend(rater, "sizeToFit");
      objj_msgSend(rater, "setTarget:", self);
      objj_msgSend(rater, "setAction:", sel_getUid("starClick:"));
      indicator = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
      objj_msgSend(indicator, "setPlaceholderString:", values[0]);
      objj_msgSend(indicator, "sizeToFit");
      var s_bounds = objj_msgSend(self, "bounds"),
          r_bounds = objj_msgSend(rater, "bounds"),
          i_bounds = objj_msgSend(indicator, "bounds"),
          origin = CGPointMake(r_bounds.size.width + 5, (r_bounds.size.height - i_bounds.size.height) / 2.0),
          size = CGSizeMake(s_bounds.size.width - r_bounds.size.width - 5, i_bounds.size.height);
      objj_msgSend(indicator, "setFrameOrigin:", origin);
      objj_msgSend(indicator, "setFrameSize:", size);
      objj_msgSend(indicator, "setAutoresizingMask:",  CPViewWidthSizable);
      objj_msgSend(self, "addSubview:", rater);

    }
    return self;
}
},["void","CGRect"]), new objj_method(sel_getUid("starClick:"), function $StarRatingView__starClick_(self, _cmd, sender)
{ with(self)
{
  var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(sender, "intValue"), "rating");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "StarRatingForSongChanged", self, info);

}
},["void","id"])]);
}

p;21;gui/UploadLocalForm.jt;1246;@STATIC;1.0;t;1227;{var the_class = objj_allocateClassPair(CPView, "UploadLocalForm"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $UploadLocalForm__initWithFrame_(self, _cmd, aRectangle)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadLocalForm").super_class }, "initWithFrame:",  aRectangle);
        if(self){
            var commingSoon = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(47, 80, 100, 18));
            objj_msgSend(commingSoon, "setStringValue:", "Comming soon...");
            objj_msgSend(commingSoon, "sizeToFit");
            objj_msgSend(commingSoon, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:", commingSoon);
        }
        return self;
    }
},["id","CGRect"]), new objj_method(sel_getUid("newUserActionPerformed"), function $UploadLocalForm__newUserActionPerformed(self, _cmd)
{ with(self)
{
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "newUserActionPerformed", self);
    }
},["void"])]);
}

p;19;gui/UploadURLForm.jt;9188;@STATIC;1.0;i;32;../controllers/SongURLUploader.jt;9132;objj_executeFile("../controllers/SongURLUploader.j", YES);
{var the_class = objj_allocateClassPair(CPView, "UploadURLForm"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("urlField"), new objj_ivar("titleField"), new objj_ivar("artistField"), new objj_ivar("genreField"), new objj_ivar("timeField"), new objj_ivar("pathAlbumArtField"), new objj_ivar("componentsArray"), new objj_ivar("submitSongButton"), new objj_ivar("songURLUploader")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $UploadURLForm__initWithFrame_(self, _cmd, aRectangle)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadURLForm").super_class }, "initWithFrame:",  aRectangle);
        if(self){
            componentsArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            songURLUploader = objj_msgSend(objj_msgSend(SongURLUploader, "alloc"), "init");
            var URLFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(47, 40, 100, 18));
            objj_msgSend(URLFieldLabel, "setStringValue:", "URL:");
            objj_msgSend(URLFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  URLFieldLabel);
            urlField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 32, 300, 30));
            objj_msgSend(urlField, "setEditable:", YES);
            objj_msgSend(urlField, "setBezeled:", YES);
            objj_msgSend(urlField, "setPlaceholderString:", "http://www.someurl.com/yoursong.mp3");
            objj_msgSend(urlField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", urlField);
            objj_msgSend(self, "addSubview:", urlField);
            var titleFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 80, 100, 18));
            objj_msgSend(titleFieldLabel, "setStringValue:", "Song title:");
            objj_msgSend(titleFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  titleFieldLabel);
            titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 72, 300, 30));
            objj_msgSend(titleField, "setEditable:", YES);
            objj_msgSend(titleField, "setBezeled:", YES);
            objj_msgSend(titleField, "setPlaceholderString:", "Some title");
            objj_msgSend(titleField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", titleField);
            objj_msgSend(self, "addSubview:", titleField);
            var artistFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(45, 120, 100, 18));
            objj_msgSend(artistFieldLabel, "setStringValue:", "Artist:");
            objj_msgSend(artistFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  artistFieldLabel);
            artistField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 112, 200, 30));
            objj_msgSend(artistField, "setEditable:", YES);
            objj_msgSend(artistField, "setBezeled:", YES);
            objj_msgSend(artistField, "setPlaceholderString:", "Some Artist");
            objj_msgSend(artistField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:",  artistField);
            objj_msgSend(self, "addSubview:", artistField);
            var genreFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(38, 160, 100, 18));
            objj_msgSend(genreFieldLabel, "setStringValue:", "Genre:");
            objj_msgSend(genreFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  genreFieldLabel);
            genreField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 152, 100, 30));
            objj_msgSend(genreField, "setEditable:", YES);
            objj_msgSend(genreField, "setBezeled:", YES);
            objj_msgSend(genreField, "setPlaceholderString:", "Some genre");
            objj_msgSend(genreField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", genreField);
            objj_msgSend(self, "addSubview:", genreField);
            var timeFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 200, 100, 18));
            objj_msgSend(timeFieldLabel, "setStringValue:", "Total time:");
            objj_msgSend(timeFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:", timeFieldLabel);
            timeField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 192, 100, 30));
            objj_msgSend(timeField, "setEditable:", YES);
            objj_msgSend(timeField, "setBezeled:", YES);
            objj_msgSend(timeField, "setPlaceholderString:", "02:30");
            objj_msgSend(timeField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", timeField);
            objj_msgSend(self, "addSubview:", timeField);
            var pathAlbumArtFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 240, 100, 18));
            objj_msgSend(pathAlbumArtFieldLabel, "setStringValue:", "Album art:");
            objj_msgSend(pathAlbumArtFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:", pathAlbumArtFieldLabel);
            pathAlbumArtField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 232, 300, 30));
            objj_msgSend(pathAlbumArtField, "setEditable:", YES);
            objj_msgSend(pathAlbumArtField, "setBezeled:", YES);
            objj_msgSend(pathAlbumArtField, "setPlaceholderString:", "http://www.someurl.com/image.jpg");
            objj_msgSend(pathAlbumArtField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", pathAlbumArtField);
            objj_msgSend(self, "addSubview:", pathAlbumArtField);
            submitSongButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(330, 272, 50, 18));
            objj_msgSend(submitSongButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(submitSongButton, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(submitSongButton, "setTitle:", "Submit song");
            objj_msgSend(submitSongButton, "sizeToFit");
            objj_msgSend(submitSongButton, "setTarget:", self);
            objj_msgSend(submitSongButton, "setAction:", sel_getUid("submitSong"));
            objj_msgSend(self, "addSubview:", submitSongButton);
        }
        return self;
    }
},["id","CGRect"]), new objj_method(sel_getUid("submitSong"), function $UploadURLForm__submitSong(self, _cmd)
{ with(self)
{
        CPLog.trace("Checking complete fields...");
        var completeData = true;
        for(var i = 0; i < objj_msgSend(componentsArray, "count"); i++){
            var aux = objj_msgSend(componentsArray, "objectAtIndex:", i);
            CPLog.debug(aux);
            if(objj_msgSend(aux, "objectValue") == ""){
                completeData = false;
                break;
            }
        }
        if(completeData){
            CPLog.trace("Fields are complete! Sending song...");
            var url = objj_msgSend(urlField, "objectValue");
            var title = objj_msgSend(titleField, "objectValue");
            var artist = objj_msgSend(artistField, "objectValue");
            var genre = objj_msgSend(genreField, "objectValue");
            var time = objj_msgSend(timeField, "objectValue");
            var albumArt = objj_msgSend(pathAlbumArtField, "objectValue");
            objj_msgSend(songURLUploader, "uploadSongWithTitle:artist:genere:time:pathToAlbumArt:songURL:", title, artist, genre, time, albumArt, url);
        }else{
            var errorAlert = objj_msgSend(objj_msgSend(CPAlert, "alloc"), "init");
            objj_msgSend(errorAlert, "setTitle:", "Incomplete form");
            objj_msgSend(errorAlert, "setWindowStyle:", CPHUDBackgroundWindowMask);
            objj_msgSend(errorAlert, "setMessageText:", "Please fill all the fields to submit your song");
            objj_msgSend(errorAlert, "addButtonWithTitle:", "Ok");
            objj_msgSend(errorAlert, "runModal");
        }
    }
},["void"])]);
}

p;14;gui/UserCell.jt;5025;@STATIC;1.0;I;15;AppKit/CPView.jt;4986;

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

p;17;gui/UsersWindow.jt;6419;@STATIC;1.0;i;10;UserCell.ji;18;../model/XYZUser.ji;39;../dataStore/UserListCollectionViewDS.jt;6318;objj_executeFile("UserCell.j", YES);
objj_executeFile("../model/XYZUser.j", YES);
objj_executeFile("../dataStore/UserListCollectionViewDS.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "UsersWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("list"), new objj_ivar("listCollectionView"), new objj_ivar("userListCollectionViewDS")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRect:styleMask:"), function $UsersWindow__contentRect_styleMask_(self, _cmd, aRect, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UsersWindow").super_class }, "initWithContentRect:styleMask:", aRect,  aStyleMask);
    if (self)
    {
   list = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
         objj_msgSend(self, "setTitle:", "Users");
         var contentView = objj_msgSend(self, "contentView");
         var bounds = objj_msgSend(contentView, "bounds");
  objj_msgSend(self, "setBackgroundColor:", nil);
  var listScrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 246 , CGRectGetHeight(bounds)));
         objj_msgSend(listScrollView, "setAutohidesScrollers:", YES);
  objj_msgSend(listScrollView, "setAutoresizingMask:", CPViewHeightSizable);
  objj_msgSend(objj_msgSend(listScrollView, "contentView"), "setBackgroundColor:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 0, 0, 0, 0.0));
  var userListItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
  objj_msgSend(userListItem, "setView:", objj_msgSend(objj_msgSend(UserCell, "alloc"), "initWithFrame:", CGRectMakeZero()));
  listCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 246, 91));
  objj_msgSend(listCollectionView, "setDelegate:", self);
  objj_msgSend(listCollectionView, "setItemPrototype:", userListItem);
  objj_msgSend(listCollectionView, "setMinItemSize:", CGSizeMake(246, 91));
  objj_msgSend(listCollectionView, "setMaxItemSize:", CGSizeMake(246, 91));
  objj_msgSend(listCollectionView, "setMaxNumberOfColumns:", 1);
     objj_msgSend(listScrollView, "setDocumentView:", listCollectionView);
  objj_msgSend(contentView, "addSubview:", listScrollView);
  userListCollectionViewDS = objj_msgSend(objj_msgSend(UserListCollectionViewDS, "alloc"), "init");
  objj_msgSend(userListCollectionViewDS, "getOnlineUsers");
    }
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("updateList:"), "UserListRetrived", nil);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("addUser:"), "NewUserHasArrived", nil);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("removeUser:"), "UserLoggedoff", nil);
    return self;
}
},["id","CGRect",null]), new objj_method(sel_getUid("updateList:"), function $UsersWindow__updateList_(self, _cmd, aNotification)
{ with(self)
{
 var info = objj_msgSend(aNotification, "userInfo");
 var aux = objj_msgSend(info, "objectForKey:", "list");
 for(var i = 0 ; i< objj_msgSend(aux, "count") ; ++i){
  objj_msgSend(list, "addObject:",  aux[i]);
 }
 objj_msgSend(listCollectionView, "setContent:", objj_msgSend(CPArray, "arrayWithArray:", list));
}
},["void","CPNotification"]), new objj_method(sel_getUid("getCollectionViewContent"), function $UsersWindow__getCollectionViewContent(self, _cmd)
{ with(self)
{
 return objj_msgSend(listCollectionView, "content");
}
},["CPArray"]), new objj_method(sel_getUid("removeUser:"), function $UsersWindow__removeUser_(self, _cmd, aNotification)
{ with(self)
{
 var info = objj_msgSend(aNotification, "userInfo");
 var account = objj_msgSend(info, "objectForKey:", "account");
 objj_msgSend(list, "removeObject:", account);
 objj_msgSend(listCollectionView, "setContent:",  objj_msgSend(CPArray, "arrayWithArray:", list));
}
},["void","CPNotification"]), new objj_method(sel_getUid("addUser:"), function $UsersWindow__addUser_(self, _cmd, aNotification)
{ with(self)
{
 CPLog.info("Adding new user...");
 var info = objj_msgSend(aNotification, "userInfo");
 var account = objj_msgSend(info, "objectForKey:", "account");
 var app = objj_msgSend(CPApp, "delegate");
 var aURL = objj_msgSend(app, "serverIP") + "/GetUserByEmail?account="+account;
 CPLog.info("Getting users at: %s", aURL);
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
 connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPNotification"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UsersWindow__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 var result = JSON.parse(data);
 var newUserArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
  var userInfo = result;
  var newUser = objj_msgSend(objj_msgSend(XYZUser, "alloc"), "init");
  objj_msgSend(newUser, "setEmail:",  userInfo.email);
  objj_msgSend(newUser, "setUsernick:",  userInfo.usernick);
  if(userInfo.pathToAvatar)
   objj_msgSend(newUser, "setPathToAvatar:",  userInfo.pathToAvatar);
  else
   objj_msgSend(newUser, "setPathToAvatar:", "");
  objj_msgSend(newUser, "setLogged:",  userInfo.logged);
  if(userInfo.dj)
   objj_msgSend(newUser, "setDj:", YES);
  else
   objj_msgSend(newUser, "setDj:", NO);
  objj_msgSend(newUser, "setSex:",  userInfo.sex);
  objj_msgSend(newUser, "setDjList1:",  userInfo.djList1);
  objj_msgSend(newUser, "setDjList2:",  userInfo.djList2);
  objj_msgSend(newUser, "setDjList3:",  userInfo.djList3);
  objj_msgSend(newUser, "setOwnedSongs:",  userInfo.ownedSongs);
  objj_msgSend(newUser, "setUserRating:",  userInfo.userRating);
  var somePrefrences = objj_msgSend(objj_msgSend(XYZUserPrefrences, "alloc"), "init");
  objj_msgSend(newUser, "setPrefrences:",  somePrefrences);
  objj_msgSend(newUserArray, "addObject:",  newUser);
 for(var i = 0; i < list.length; i++){
  objj_msgSend(newUserArray, "addObject:",  list[i]);
 }
 objj_msgSend(listCollectionView, "setContent:",  newUserArray);
 list = objj_msgSend(CPArray, "arrayWithArray:", list);
}
},["void","CPURLConnection","CPString"])]);
}

p;20;gui/XYZColumnModel.jt;1026;@STATIC;1.0;t;1007;{var the_class = objj_allocateClassPair(CPView, "XYZColumnModel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("textfield")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:title:color:"), function $XYZColumnModel__initWithFrame_title_color_(self, _cmd, aFrame, aTitle, aColor)
{ with(self)
{
    self= objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  aFrame);
 textfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 0, 0, 18));
    objj_msgSend(textfield, "setStringValue:", aTitle);
 if(aColor)
  objj_msgSend(textfield, "setTextColor:",  aColor);
 else
  objj_msgSend(textfield, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
    objj_msgSend(textfield, "setBackgroundColor:",  aColor);
 objj_msgSend(textfield, "sizeToFit");
 objj_msgSend(self, "addSubview:",  textfield);
    return self;
}
},["id","CPRect","CPString","CPColor"])]);
}

p;23;gui/XYZPlayListWindow.jt;2543;@STATIC;1.0;i;18;../model/XYZSong.jt;2501;objj_executeFile("../model/XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "XYZPlayListWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theTable"), new objj_ivar("theList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $XYZPlayListWindow__initWithContentRect_(self, _cmd, aRectangle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZPlayListWindow").super_class }, "initWithContentRect:styleMask:", aRectangle, CPHUDBackgroundWindowMask|CPClosableWindowMask);
    if (self){
    theList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("getSelectedSong"), function $XYZPlayListWindow__getSelectedSong(self, _cmd)
{ with(self)
{
    var index = objj_msgSend(theTable, "getSelectedItem");
    var aux = objj_msgSend(theTable, "getSongByIndex:",  index);
    return aux;
}
},["XYZSong"]), new objj_method(sel_getUid("labelWithTitle:"), function $XYZPlayListWindow__labelWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(label, "setStringValue:", aTitle);
    objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(label, "sizeToFit");
    return label;
}
},["CPTextField","CPString"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZPlayListWindow__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
    return objj_msgSend(theTable, "getSongIndex:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZPlayListWindow__getSongByIndex_(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(theTable, "getSongByIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZPlayListWindow__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
    objj_msgSend(theTable, "setSelectionIndexes:", index);
}
},["void","int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZPlayListWindow__removeSelectedItems(self, _cmd)
{ with(self)
{
   objj_msgSend(theTable, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("getSongListSize"), function $XYZPlayListWindow__getSongListSize(self, _cmd)
{ with(self)
{
 return objj_msgSend(theTable, "getSongListSize");
}
},["int"])]);
}

p;28;gui/XYZPlayListWindowForDJ.jt;2219;@STATIC;1.0;i;18;../model/XYZSong.jt;2177;objj_executeFile("../model/XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "XYZPlayListWindowForDJ"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theTable"), new objj_ivar("theList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $XYZPlayListWindowForDJ__initWithContentRect_(self, _cmd, aRectangle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZPlayListWindowForDJ").super_class }, "initWithContentRect:styleMask:", aRectangle, CPHUDBackgroundWindowMask|CPClosableWindowMask);
    if (self){
        theList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        objj_msgSend(self, "registerForDraggedTypes:", [SongsDragType]);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("getSelectedSong"), function $XYZPlayListWindowForDJ__getSelectedSong(self, _cmd)
{ with(self)
{
    var index = objj_msgSend(theTable, "getSelectedItem");
    var aux = objj_msgSend(theTable, "getSongByIndex:",  index);
    return aux;
}
},["XYZSong"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZPlayListWindowForDJ__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
    return objj_msgSend(theTable, "getSongIndex:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZPlayListWindowForDJ__getSongByIndex_(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(theTable, "getSongByIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZPlayListWindowForDJ__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
    objj_msgSend(theTable, "setSelectionIndexes:", index);
}
},["void","int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZPlayListWindowForDJ__removeSelectedItems(self, _cmd)
{ with(self)
{
   objj_msgSend(theTable, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("getSongListSize"), function $XYZPlayListWindowForDJ__getSongListSize(self, _cmd)
{ with(self)
{
    return objj_msgSend(theTable, "getSongListSize");
}
},["int"])]);
}

p;14;gui/XYZTable.jt;14506;@STATIC;1.0;I;21;Foundation/CPObject.ji;18;../model/XYZSong.ji;16;StarRatingView.jt;14416;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("../model/XYZSong.j", YES);
objj_executeFile("StarRatingView.j", YES);
SongsDragType = "SongsDragType";
{var the_class = objj_allocateClassPair(CPView, "XYZTable"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("collectionView"), new objj_ivar("model"), new objj_ivar("columnModel"), new objj_ivar("celdas"), new objj_ivar("pos")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithColumnModel:model:frame:"), function $XYZTable__initWithColumnModel_model_frame_(self, _cmd, aColumnModel, aModel, bounds)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZTable").super_class }, "initWithFrame:", bounds);
    objj_msgSend(self, "setModel:", aModel);
    celdas = objj_msgSend(objj_msgSend(XYZCell, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(celdas, "setModel:",  aColumnModel);
    collectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:",  CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
    pos=0;
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:",  CGRectMake(0, 30, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
    objj_msgSend(scrollView, "setAutohidesScrollers:",  YES);
    objj_msgSend(scrollView, "setDocumentView:",  collectionView);
    objj_msgSend(objj_msgSend(scrollView, "contentView"), "setBackgroundColor:",  NULL);
    objj_msgSend(scrollView, "setHasHorizontalScroller:", NO)
    objj_msgSend(scrollView, "setAutoresizesSubviews:", NO);
    var listItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(listItem, "setView:",  celdas);
    objj_msgSend(collectionView, "setItemPrototype:",  listItem);
    objj_msgSend(collectionView, "setMaxNumberOfColumns:", 1);
    objj_msgSend(collectionView, "setMinItemSize:", CPSizeMake(CGRectGetWidth(bounds), 20));
    objj_msgSend(collectionView, "setMaxItemSize:", CPSizeMake(CGRectGetWidth(bounds), 20));
    objj_msgSend(collectionView, "setContent:",  model);
    objj_msgSend(self, "addSubview:", scrollView);
    objj_msgSend(collectionView, "setDelegate:",  self);
    var borderTop = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 5, CGRectGetWidth(bounds)-2, 1));
        objj_msgSend(borderTop, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  borderTop);
    var borderArriba = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 25 , CGRectGetWidth(bounds)-2, 1));
        objj_msgSend(borderArriba, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  borderArriba);
    objj_msgSend(self, "setColumnModel:", aColumnModel);
    objj_msgSend(self, "registerForDraggedTypes:", [SongsDragType]);
    return self;
}
},["void","CPDictionary","CPArray","CGRect"]), new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"), function $XYZTable__collectionView_didDoubleClickOnItemAtIndex_(self, _cmd, aCollectionView, index)
{ with(self)
{
    var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", index, "index");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "songDoubleClicked", self, info);
}
},["void","CPCollectionView","int"]), new objj_method(sel_getUid("performDragOperation:"), function $XYZTable__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    CPLog.trace("here in performdrag....");
    if (objj_msgSend(aSender, "draggingSource") == collectionView){
  CPLog.trace("Same draggingSource on XYZTable");
  return;
 }
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if (objj_msgSend(objj_msgSend(pasteboard, "types"), "containsObject:", SongsDragType))
    {
        songs = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(pasteboard, "dataForType:", SongsDragType));
        var index = 0,
            count = songs.length;
        for (; index < count; ++index){
            if(!objj_msgSend(objj_msgSend(collectionView, "content"), "containsObject:", songs[index]))
    objj_msgSend(self, "addItem:", songs[index]);
   else
    CPLog.trace("Repetido!");
  }
    }
}
},["void","id<CPDraggingInfo>"]), new objj_method(sel_getUid("setColumnModel:"), function $XYZTable__setColumnModel_(self, _cmd, aColumnModel)
{ with(self)
{
 columnModel = objj_msgSend(aColumnModel, "allValues");
 for(var i=0; i<objj_msgSend(columnModel, "count");i++){
        var thisColumnModel = objj_msgSend(columnModel, "objectAtIndex:", i);
        objj_msgSend(self, "addSubview:",  thisColumnModel);
        if(i>0 && i<objj_msgSend(columnModel, "count")){
            pos = pos+CGRectGetWidth(objj_msgSend(objj_msgSend(columnModel, "objectAtIndex:",  i-1), "bounds"))+1;
            var border = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(pos, 5, 1, CGRectGetHeight(objj_msgSend(self, "bounds"))-7));
            objj_msgSend(border, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  border);
        }
    }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setModel:"), function $XYZTable__setModel_(self, _cmd, aModel)
{ with(self)
{
    model = aModel;
    objj_msgSend(collectionView, "setContent:",  model);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","CPArray"]), new objj_method(sel_getUid("addItem:"), function $XYZTable__addItem_(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(model, "addObject:", anItem);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","CPObject"]), new objj_method(sel_getUid("removeItem:"), function $XYZTable__removeItem_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(model, "removeObjectAtIndex:",  anIndex);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","int"]), new objj_method(sel_getUid("getSelectedItem"), function $XYZTable__getSelectedItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(collectionView, "selectionIndexes"), "firstIndex");
}
},["int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZTable__removeSelectedItems(self, _cmd)
{ with(self)
{
    var indexes= objj_msgSend(collectionView, "selectionIndexes");
    var a = objj_msgSend(indexes, "firstIndex");
    objj_msgSend(model, "removeObjectAtIndex:",  a);
    objj_msgSend(collectionView, "reloadContent");
}
},["void"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZTable__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
 return objj_msgSend(model, "indexOfObject:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZTable__getSongByIndex_(self, _cmd, index)
{ with(self)
{
 CPLog.trace("Getting song by index: %s ",objj_msgSend(objj_msgSend(model, "objectAtIndex:", index), "pathToSong"));
 return objj_msgSend(model, "objectAtIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("getSongListSize"), function $XYZTable__getSongListSize(self, _cmd)
{ with(self)
{
 return objj_msgSend(objj_msgSend(collectionView, "content"), "count");
}
},["int"]), new objj_method(sel_getUid("getSelectedItems"), function $XYZTable__getSelectedItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(collectionView, "selectionIndexes");
}
},["CPIndexSet"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZTable__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
  objj_msgSend(collectionView, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"), function $XYZTable__collectionView_dragTypesForItemsAtIndexes_(self, _cmd, aCollectionView, indices)
{ with(self)
{
 CPLog.trace("here in dragtypes....%s",indices);
    return [SongsDragType];
}
},["CPArray","CPCollectionView","CPIndexSet"]), new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"), function $XYZTable__collectionView_dataForItemsAtIndexes_forType_(self, _cmd, aCollectionView, indexes, aType)
{ with(self)
{
 CPLog.trace("here in dataForItemsAtIndexes....");
    var index = CPNotFound,
        content = objj_msgSend(aCollectionView, "content"),
        songs = [];
    while ((index = objj_msgSend(indexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        songs.push(content[index]);
    CPLog.trace("The songs before archive:" + songs);
    return objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", songs);
}
},["CPData","CPCollectionView","CPIndexSet","CPString"])]);
}
var authorViewSize;
var titleViewSize;
var timeViewSize;
var ratingViewSize;
var playingViewSize;
{var the_class = objj_allocateClassPair(CPView, "XYZCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("titleView"), new objj_ivar("authorView"), new objj_ivar("timeView"), new objj_ivar("highlightView"), new objj_ivar("theSong"), new objj_ivar("raterView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setModel:"), function $XYZCell__setModel_(self, _cmd, aModel)
{ with(self)
{
 CPLog.trace("Setting the model: %s", aModel);
 if(aModel){
  var playingColumn = objj_msgSend(aModel, "objectForKey:", " ");
  if(playingColumn){
   var playingColumnWidth = objj_msgSend(playingColumn, "frame").origin.x;
   playingViewSize = playingColumnWidth+2;
  }
  var titleColumn = objj_msgSend(aModel, "objectForKey:", "title");
  if(titleColumn){
   var titleColumnWidth = objj_msgSend(titleColumn, "frame").origin.x;
   titleViewSize = titleColumnWidth+2;
  }
  var artistColumn = objj_msgSend(aModel, "objectForKey:", "artist");
  if(artistColumn){
   var artistColumnWidth = objj_msgSend(artistColumn, "frame").origin.x;
   authorViewSize = artistColumnWidth+2;
  }
  var timeColumn = objj_msgSend(aModel, "objectForKey:", "time");
  if(timeColumn){
   var timeColumnWidth = objj_msgSend(timeColumn, "frame").origin.x;
   timeViewSize = timeColumnWidth + 2;
  }
  var ratingColumn = objj_msgSend(aModel, "objectForKey:", "rating");
  if(ratingColumn){
   var ratingColumnWidth = objj_msgSend(ratingColumn, "frame").origin.x;
   ratingViewSize = ratingColumnWidth+2;
  }
     CPLog.info("titleViewSize comun y corriente:"+titleViewSize);
 }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setRepresentedObject:"), function $XYZCell__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    theSong = anObject;
    if(!titleView)
    {
        titleView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset( objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(titleView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  titleView);
    }
    objj_msgSend(titleView, "setStringValue:",  objj_msgSend(anObject, "songTitle"));
    objj_msgSend(titleView, "sizeToFit");
    objj_msgSend(titleView, "setFrameOrigin:",  CGPointMake(titleViewSize,0.0));
    if(!authorView)
    {
        authorView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(authorView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  authorView);
    }
    objj_msgSend(authorView, "setStringValue:",  objj_msgSend(anObject, "artist"));
    objj_msgSend(authorView, "sizeToFit");
    objj_msgSend(authorView, "setFrameOrigin:",  CGPointMake(authorViewSize,0.0));
    if(!timeView)
    {
        timeView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(timeView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  timeView);
    }
    objj_msgSend(timeView, "setStringValue:",  objj_msgSend(anObject, "time"));
    objj_msgSend(timeView, "sizeToFit");
    objj_msgSend(timeView, "setFrameOrigin:",  CGPointMake(timeViewSize,0.0));
 if(!raterView){
    var raterView = objj_msgSend(objj_msgSend(StarRatingView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 300, 25));
    objj_msgSend(raterView, "setFrameOrigin:", CGPointMake(ratingViewSize, 0.0));
    CPLog.trace("Setting rater for %s width %s", objj_msgSend(anObject, "songTitle"), raterView);
    objj_msgSend(anObject, "setStarRater:",  raterView);
    objj_msgSend(self, "addSubview:",  raterView);
 }
 var control = objj_msgSend(raterView, "rater");
 objj_msgSend(control, "setIntValue:",  objj_msgSend(anObject, "rating"));
}
},["void","JSObject"]), new objj_method(sel_getUid("setSelected:"), function $XYZCell__setSelected_(self, _cmd, flag)
{ with(self)
{
    if(!highlightView)
    {
        highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectCreateCopy(objj_msgSend(self, "bounds")));
        objj_msgSend(highlightView, "setBackgroundColor:",  objj_msgSend(CPColor, "greenColor"));
    }
    if(flag)
    {
        objj_msgSend(self, "addSubview:positioned:relativeTo:", highlightView, CPWindowBelow,  titleView);
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
    }
    else
    {
        objj_msgSend(highlightView, "removeFromSuperview");
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
    }
}
},["void","BOOL"])]);
}

p;19;gui/XYZTableForDJ.jt;13984;@STATIC;1.0;i;18;../model/XYZSong.ji;16;StarRatingView.jt;13920;objj_executeFile("../model/XYZSong.j", YES);
objj_executeFile("StarRatingView.j", YES);
SongsDragType = "SongsDragType";
{var the_class = objj_allocateClassPair(CPView, "XYZTableForDJ"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("collectionView"), new objj_ivar("model"), new objj_ivar("columnModel"), new objj_ivar("celdas"), new objj_ivar("pos")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithColumnModel:model:frame:"), function $XYZTableForDJ__initWithColumnModel_model_frame_(self, _cmd, aColumnModel, aModel, bounds)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZTableForDJ").super_class }, "initWithFrame:", bounds);
    objj_msgSend(self, "setModel:", aModel);
 celdas = objj_msgSend(objj_msgSend(XYZCellForDJ, "alloc"), "initWithFrame:", CGRectMakeZero());
 objj_msgSend(celdas, "setModel:",  aColumnModel);
    collectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:",  CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
    pos=0;
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:",  CGRectMake(0, 30, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
    objj_msgSend(scrollView, "setAutohidesScrollers:",  YES);
    objj_msgSend(scrollView, "setDocumentView:",  collectionView);
    objj_msgSend(objj_msgSend(scrollView, "contentView"), "setBackgroundColor:",  NULL);
    objj_msgSend(scrollView, "setHasHorizontalScroller:", NO)
    objj_msgSend(scrollView, "setAutoresizesSubviews:", YES);
    var listItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(listItem, "setView:",  celdas);
    objj_msgSend(collectionView, "setItemPrototype:",  listItem);
    objj_msgSend(collectionView, "setMaxNumberOfColumns:", 1);
    objj_msgSend(collectionView, "setMinItemSize:", CPSizeMake(CGRectGetWidth(bounds), 20));
    objj_msgSend(collectionView, "setMaxItemSize:", CPSizeMake(CGRectGetWidth(bounds), 20));
    objj_msgSend(collectionView, "setContent:",  model);
    objj_msgSend(self, "addSubview:", scrollView);
    objj_msgSend(collectionView, "setDelegate:",  self);
    var borderTop = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 5, CGRectGetWidth(bounds)-2, 1));
        objj_msgSend(borderTop, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  borderTop);
    var borderArriba = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 25 , CGRectGetWidth(bounds)-2, 1));
        objj_msgSend(borderArriba, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  borderArriba);
    objj_msgSend(self, "setColumnModel:", aColumnModel);
    objj_msgSend(self, "registerForDraggedTypes:", [SongsDragType]);
    return self;
}
},["void","CPDictionary","CPArray","CGRect"]), new objj_method(sel_getUid("setColumnModel:"), function $XYZTableForDJ__setColumnModel_(self, _cmd, aColumnModel)
{ with(self)
{
 columnModel = objj_msgSend(aColumnModel, "allValues");
 for(var i=0; i<objj_msgSend(columnModel, "count");i++){
        var thisColumnModel = objj_msgSend(columnModel, "objectAtIndex:", i);
        objj_msgSend(self, "addSubview:",  thisColumnModel);
        if(i>0 && i<objj_msgSend(columnModel, "count")){
            pos = pos+CGRectGetWidth(objj_msgSend(objj_msgSend(columnModel, "objectAtIndex:",  i-1), "bounds"))+1;
            var border = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(pos, 5, 1, CGRectGetHeight(objj_msgSend(self, "bounds"))-7));
            objj_msgSend(border, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  border);
        }
    }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setModel:"), function $XYZTableForDJ__setModel_(self, _cmd, aModel)
{ with(self)
{
    model = aModel;
    objj_msgSend(collectionView, "setContent:",  model);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","CPArray"]), new objj_method(sel_getUid("addItem:"), function $XYZTableForDJ__addItem_(self, _cmd, anItem)
{ with(self)
{
    CPLog.trace("Adding in XYZTableForDJ: "+anItem);
    var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anItem, "songAdded");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewSongAddedToPlaylist", self, info);
    CPLog.info("The model: "+ model);
    objj_msgSend(model, "addObject:", anItem);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","CPObject"]), new objj_method(sel_getUid("removeItem:"), function $XYZTableForDJ__removeItem_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(model, "removeObjectAtIndex:",  anIndex);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","int"]), new objj_method(sel_getUid("getSelectedItem"), function $XYZTableForDJ__getSelectedItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(collectionView, "selectionIndexes"), "firstIndex");
}
},["int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZTableForDJ__removeSelectedItems(self, _cmd)
{ with(self)
{
    var indexes= objj_msgSend(collectionView, "selectionIndexes");
    var a = objj_msgSend(indexes, "firstIndex");
    objj_msgSend(model, "removeObjectAtIndex:",  a);
    objj_msgSend(collectionView, "reloadContent");
}
},["void"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZTableForDJ__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
 return objj_msgSend(model, "indexOfObject:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZTableForDJ__getSongByIndex_(self, _cmd, index)
{ with(self)
{
 CPLog.trace("Getting song by index: %s ",objj_msgSend(objj_msgSend(model, "objectAtIndex:", index), "pathToSong"));
 return objj_msgSend(model, "objectAtIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("getSongListSize"), function $XYZTableForDJ__getSongListSize(self, _cmd)
{ with(self)
{
 return objj_msgSend(objj_msgSend(collectionView, "content"), "count");
}
},["int"]), new objj_method(sel_getUid("getSelectedItems"), function $XYZTableForDJ__getSelectedItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(collectionView, "selectionIndexes");
}
},["CPIndexSet"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZTableForDJ__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
  objj_msgSend(collectionView, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"), function $XYZTableForDJ__collectionView_dragTypesForItemsAtIndexes_(self, _cmd, aCollectionView, indices)
{ with(self)
{
 CPLog.trace("here in dragtypes XYZTableForDJ....%s",indices);
    return [SongsDragType];
}
},["CPArray","CPCollectionView","CPIndexSet"]), new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"), function $XYZTableForDJ__collectionView_dataForItemsAtIndexes_forType_(self, _cmd, aCollectionView, indexes, aType)
{ with(self)
{
    var index = CPNotFound,
        content = objj_msgSend(aCollectionView, "content"),
        songs = [];
    while ((index = objj_msgSend(indexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        songs.push(content[index]);
    return objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", songs);
}
},["CPData","CPCollectionView","CPIndexSet","CPString"]), new objj_method(sel_getUid("performDragOperation:"), function $XYZTableForDJ__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    CPLog.trace("Got to performdrag in the XYZTableForDJ....");
    if (objj_msgSend(aSender, "draggingSource") == collectionView){
        CPLog.error("Same draggingSource");
        return;
    }
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if (objj_msgSend(objj_msgSend(pasteboard, "types"), "containsObject:", SongsDragType))
    {
        songs = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(pasteboard, "dataForType:", SongsDragType));
        var index = 0,
            count = songs.length;
        for (; index < count; ++index){
            if(!objj_msgSend(objj_msgSend(collectionView, "content"), "containsObject:", songs[index])){
                CPLog.trace("Adding "+songs[index]);
                objj_msgSend(self, "addItem:", songs[index]);
            }
            else
            CPLog.trace("Repetido!");
        }
    }else{
        CPLog.trace("XYZTableForDJ does not accept drags for types: "+objj_msgSend(pasteboard, "types"));
    }
}
},["void","id<CPDraggingInfo>"])]);
}
var authorViewSizeForDJ;
var titleViewSizeForDJ;
var timeViewSizeForDJ;
var ratingViewSizeForDJ;
var playingViewSizeForDJ;
{var the_class = objj_allocateClassPair(CPView, "XYZCellForDJ"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("titleView"), new objj_ivar("authorView"), new objj_ivar("timeView"), new objj_ivar("highlightView"), new objj_ivar("theSong"), new objj_ivar("raterView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setModel:"), function $XYZCellForDJ__setModel_(self, _cmd, aModel)
{ with(self)
{
    CPLog.trace("Setting the model: %s", aModel);
    if(aModel){
        var playingColumn = objj_msgSend(aModel, "objectForKey:", " ");
        if(playingColumn){
            var playingColumnWidth = objj_msgSend(playingColumn, "frame").origin.x;
            playingViewSizeForDJ = playingColumnWidth+2;
        }
        var titleColumn = objj_msgSend(aModel, "objectForKey:", "title");
        if(titleColumn){
            var titleColumnWidth = objj_msgSend(titleColumn, "frame").origin.x;
            titleViewSizeForDJ = titleColumnWidth+2;
        }
        var artistColumn = objj_msgSend(aModel, "objectForKey:", "artist");
        if(artistColumn){
            var artistColumnWidth = objj_msgSend(artistColumn, "frame").origin.x;
            authorViewSizeForDJ = artistColumnWidth+2;
        }
        var ratingColumn = objj_msgSend(aModel, "objectForKey:", "rating");
        if(ratingColumn){
            var ratingColumnWidth = objj_msgSend(ratingColumn, "frame").origin.x;
            ratingViewSizeForDJ = ratingColumnWidth+2;
        }
        CPLog.info("titleViewSizeForDJ:"+titleViewSizeForDJ);
    }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setRepresentedObject:"), function $XYZCellForDJ__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    theSong = anObject;
    if(!titleView)
    {
        titleView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset( objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(titleView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  titleView);
    }
    objj_msgSend(titleView, "setStringValue:",  objj_msgSend(anObject, "songTitle"));
    objj_msgSend(titleView, "sizeToFit");
    objj_msgSend(titleView, "setFrameOrigin:",  CGPointMake(titleViewSizeForDJ,0.0));
    if(!authorView)
    {
        authorView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(authorView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  authorView);
    }
    objj_msgSend(authorView, "setStringValue:",  objj_msgSend(anObject, "artist"));
    objj_msgSend(authorView, "sizeToFit");
    objj_msgSend(authorView, "setFrameOrigin:",  CGPointMake(authorViewSizeForDJ,0.0));
    if(!raterView){
        var raterView = objj_msgSend(objj_msgSend(StarRatingView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 300, 25));
        objj_msgSend(raterView, "setFrameOrigin:", CGPointMake(ratingViewSizeForDJ, 0.0));
        CPLog.trace("Setting rater for %s width %s", objj_msgSend(anObject, "songTitle"), raterView);
        objj_msgSend(anObject, "setStarRater:",  raterView);
        objj_msgSend(self, "addSubview:",  raterView);
    }
    var control = objj_msgSend(raterView, "rater");
    objj_msgSend(control, "setIntValue:",  objj_msgSend(anObject, "rating"));
}
},["void","JSObject"]), new objj_method(sel_getUid("setSelected:"), function $XYZCellForDJ__setSelected_(self, _cmd, flag)
{ with(self)
{
    if(!highlightView)
    {
        highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectCreateCopy(objj_msgSend(self, "bounds")));
        objj_msgSend(highlightView, "setBackgroundColor:",  objj_msgSend(CPColor, "greenColor"));
    }
    if(flag)
    {
        objj_msgSend(self, "addSubview:positioned:relativeTo:", highlightView, CPWindowBelow,  titleView);
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
    }
    else
    {
        objj_msgSend(highlightView, "removeFromSuperview");
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
    }
}
},["void","BOOL"])]);
}

p;20;model/XYZMusicList.jt;2092;@STATIC;1.0;I;21;Foundation/CPObject.jt;2047;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZMusicList"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("nameOfList"), new objj_ivar("musicList"), new objj_ivar("fullyLoaded")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("nameOfList"), function $XYZMusicList__nameOfList(self, _cmd)
{ with(self)
{
return nameOfList;
}
},["id"]),
new objj_method(sel_getUid("setNameOfList:"), function $XYZMusicList__setNameOfList_(self, _cmd, newValue)
{ with(self)
{
nameOfList = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("musicList"), function $XYZMusicList__musicList(self, _cmd)
{ with(self)
{
return musicList;
}
},["id"]),
new objj_method(sel_getUid("setMusicList:"), function $XYZMusicList__setMusicList_(self, _cmd, newValue)
{ with(self)
{
musicList = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isFullyLoaded"), function $XYZMusicList__isFullyLoaded(self, _cmd)
{ with(self)
{
return fullyLoaded;
}
},["id"]),
new objj_method(sel_getUid("setFullyLoaded:"), function $XYZMusicList__setFullyLoaded_(self, _cmd, newValue)
{ with(self)
{
fullyLoaded = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $XYZMusicList__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZMusicList").super_class }, "init");
    if(self){
        musicList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        fullyLoaded = NO;
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addSong:"), function $XYZMusicList__addSong_(self, _cmd, aSong)
{ with(self)
{
    CPLog.trace("Agregando la cancion: "+aSong+" a la lista "+nameOfList);
    objj_msgSend(musicList, "addObject:", aSong);
}
},["void","XYZSong"]), new objj_method(sel_getUid("description"), function $XYZMusicList__description(self, _cmd)
{ with(self)
{
    return " Name of the list: "+ nameOfList + " Songs in list: "+ musicList;
}
},["CPString"])]);
}

p;15;model/XYZSong.jt;6615;@STATIC;1.0;I;21;Foundation/CPObject.jt;6570;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZSong"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("songTitle"), new objj_ivar("artist"), new objj_ivar("time"), new objj_ivar("genre"), new objj_ivar("rating"), new objj_ivar("pathToAlbumArt"), new objj_ivar("songID"), new objj_ivar("local"), new objj_ivar("pathToSong")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("songTitle"), function $XYZSong__songTitle(self, _cmd)
{ with(self)
{
return songTitle;
}
},["id"]),
new objj_method(sel_getUid("setSongTitle:"), function $XYZSong__setSongTitle_(self, _cmd, newValue)
{ with(self)
{
songTitle = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("artist"), function $XYZSong__artist(self, _cmd)
{ with(self)
{
return artist;
}
},["id"]),
new objj_method(sel_getUid("setArtist:"), function $XYZSong__setArtist_(self, _cmd, newValue)
{ with(self)
{
artist = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("time"), function $XYZSong__time(self, _cmd)
{ with(self)
{
return time;
}
},["id"]),
new objj_method(sel_getUid("setTime:"), function $XYZSong__setTime_(self, _cmd, newValue)
{ with(self)
{
time = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("genre"), function $XYZSong__genre(self, _cmd)
{ with(self)
{
return genre;
}
},["id"]),
new objj_method(sel_getUid("setGenre:"), function $XYZSong__setGenre_(self, _cmd, newValue)
{ with(self)
{
genre = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rating"), function $XYZSong__rating(self, _cmd)
{ with(self)
{
return rating;
}
},["id"]),
new objj_method(sel_getUid("setRating:"), function $XYZSong__setRating_(self, _cmd, newValue)
{ with(self)
{
rating = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pathToAlbumArt"), function $XYZSong__pathToAlbumArt(self, _cmd)
{ with(self)
{
return pathToAlbumArt;
}
},["id"]),
new objj_method(sel_getUid("setPathToAlbumArt:"), function $XYZSong__setPathToAlbumArt_(self, _cmd, newValue)
{ with(self)
{
pathToAlbumArt = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("songID"), function $XYZSong__songID(self, _cmd)
{ with(self)
{
return songID;
}
},["id"]),
new objj_method(sel_getUid("setSongID:"), function $XYZSong__setSongID_(self, _cmd, newValue)
{ with(self)
{
songID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isLocal"), function $XYZSong__isLocal(self, _cmd)
{ with(self)
{
return local;
}
},["id"]),
new objj_method(sel_getUid("setLocal:"), function $XYZSong__setLocal_(self, _cmd, newValue)
{ with(self)
{
local = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pathToSong"), function $XYZSong__pathToSong(self, _cmd)
{ with(self)
{
return pathToSong;
}
},["id"]),
new objj_method(sel_getUid("setPathToSong:"), function $XYZSong__setPathToSong_(self, _cmd, newValue)
{ with(self)
{
pathToSong = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithSongTitle:setArtist:setID:time:pathToSong:rating:"), function $XYZSong__initWithSongTitle_setArtist_setID_time_pathToSong_rating_(self, _cmd, aSongTitle, anArtist, anID, aTime, aPath, aRating)
{ with(self)
{
    if(self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZSong").super_class }, "init")){
        songTitle = aSongTitle;
        artist = anArtist;
        songID = anID;
        isLocal = false;
        time = aTime;
        pathToSong = aPath;
        rating = aRating;
    }
    return self;
}
},["id","CPString","CPString","int","CPString","CPString","CPString"]), new objj_method(sel_getUid("isEqual:"), function $XYZSong__isEqual_(self, _cmd, anObject)
{ with(self)
{
if(objj_msgSend(objj_msgSend(anObject, "class"), "instancesRespondToSelector:",  sel_getUid("songID")))
    if(objj_msgSend(anObject, "songID") == objj_msgSend(self, "songID"))
        return YES;
    else
        return NO;
}
},["BOOL","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $XYZSong__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", songTitle, "SongTitle");
    objj_msgSend(aCoder, "encodeObject:forKey:", artist, "Artist");
    objj_msgSend(aCoder, "encodeObject:forKey:", time, "Time");
    objj_msgSend(aCoder, "encodeObject:forKey:", genre, "Genre");
    objj_msgSend(aCoder, "encodeObject:forKey:", rating, "Rating");
    objj_msgSend(aCoder, "encodeObject:forKey:", pathToAlbumArt, "PathToAlbumArt");
    objj_msgSend(aCoder, "encodeObject:forKey:", songID, "SongID");
    objj_msgSend(aCoder, "encodeObject:forKey:", local, "Local");
    objj_msgSend(aCoder, "encodeObject:forKey:", pathToSong, "PathToSong");
}
},["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $XYZSong__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZSong").super_class }, "init");
    if (self)
    {
        songTitle = objj_msgSend(aCoder, "decodeObjectForKey:", "SongTitle");
        artist = objj_msgSend(aCoder, "decodeObjectForKey:", "Artist");
        time = objj_msgSend(aCoder, "decodeObjectForKey:", "Time");
        genre = objj_msgSend(aCoder, "decodeObjectForKey:", "Genre");
        rating = objj_msgSend(aCoder, "decodeObjectForKey:", "Rating");
        pathToAlbumArt = objj_msgSend(aCoder, "decodeObjectForKey:", "PathToAlbumArt");
        songID = objj_msgSend(aCoder, "decodeObjectForKey:", "SongID");
        local = objj_msgSend(aCoder, "decodeObjectForKey:", "Local");
        pathToSong = objj_msgSend(aCoder, "decodeObjectForKey:", "PathToSong");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("starRatingForSongChanged:"), function $XYZSong__starRatingForSongChanged_(self, _cmd, aNotification)
{ with(self)
{
    CPLog.trace("notified!!");
    var info = objj_msgSend(aNotification, "userInfo");
    var aux = objj_msgSend(info, "objectForKey:", "rating");
    objj_msgSend(self, "setRating:",  aux);
    CPLog.trace(objj_msgSend(self, "rating"));
}
},["void","CPNotification"]), new objj_method(sel_getUid("setStarRater:"), function $XYZSong__setStarRater_(self, _cmd, aRater)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("starRatingForSongChanged:"), "StarRatingForSongChanged", aRater);
}
},["void","StarRatingView"]), new objj_method(sel_getUid("description"), function $XYZSong__description(self, _cmd)
{ with(self)
{
    return songTitle +"-"+ songID;
}
},["CPString"])]);
}

p;15;model/XYZUser.jt;8284;@STATIC;1.0;I;21;Foundation/CPObject.jt;8239;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZUser"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("email"), new objj_ivar("usernick"), new objj_ivar("pathToAvatar"), new objj_ivar("logged"), new objj_ivar("dj"), new objj_ivar("sex"), new objj_ivar("djList1"), new objj_ivar("djList2"), new objj_ivar("djList3"), new objj_ivar("ownedSongs"), new objj_ivar("userRating"), new objj_ivar("prefrences")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("email"), function $XYZUser__email(self, _cmd)
{ with(self)
{
return email;
}
},["id"]),
new objj_method(sel_getUid("setEmail:"), function $XYZUser__setEmail_(self, _cmd, newValue)
{ with(self)
{
email = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("usernick"), function $XYZUser__usernick(self, _cmd)
{ with(self)
{
return usernick;
}
},["id"]),
new objj_method(sel_getUid("setUsernick:"), function $XYZUser__setUsernick_(self, _cmd, newValue)
{ with(self)
{
usernick = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pathToAvatar"), function $XYZUser__pathToAvatar(self, _cmd)
{ with(self)
{
return pathToAvatar;
}
},["id"]),
new objj_method(sel_getUid("setPathToAvatar:"), function $XYZUser__setPathToAvatar_(self, _cmd, newValue)
{ with(self)
{
pathToAvatar = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("logged"), function $XYZUser__logged(self, _cmd)
{ with(self)
{
return logged;
}
},["id"]),
new objj_method(sel_getUid("setLogged:"), function $XYZUser__setLogged_(self, _cmd, newValue)
{ with(self)
{
logged = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("dj"), function $XYZUser__dj(self, _cmd)
{ with(self)
{
return dj;
}
},["id"]),
new objj_method(sel_getUid("setDj:"), function $XYZUser__setDj_(self, _cmd, newValue)
{ with(self)
{
dj = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("sex"), function $XYZUser__sex(self, _cmd)
{ with(self)
{
return sex;
}
},["id"]),
new objj_method(sel_getUid("setSex:"), function $XYZUser__setSex_(self, _cmd, newValue)
{ with(self)
{
sex = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("djList1"), function $XYZUser__djList1(self, _cmd)
{ with(self)
{
return djList1;
}
},["id"]),
new objj_method(sel_getUid("setDjList1:"), function $XYZUser__setDjList1_(self, _cmd, newValue)
{ with(self)
{
djList1 = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("djList2"), function $XYZUser__djList2(self, _cmd)
{ with(self)
{
return djList2;
}
},["id"]),
new objj_method(sel_getUid("setDjList2:"), function $XYZUser__setDjList2_(self, _cmd, newValue)
{ with(self)
{
djList2 = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("djList3"), function $XYZUser__djList3(self, _cmd)
{ with(self)
{
return djList3;
}
},["id"]),
new objj_method(sel_getUid("setDjList3:"), function $XYZUser__setDjList3_(self, _cmd, newValue)
{ with(self)
{
djList3 = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("ownedSongs"), function $XYZUser__ownedSongs(self, _cmd)
{ with(self)
{
return ownedSongs;
}
},["id"]),
new objj_method(sel_getUid("setOwnedSongs:"), function $XYZUser__setOwnedSongs_(self, _cmd, newValue)
{ with(self)
{
ownedSongs = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("userRating"), function $XYZUser__userRating(self, _cmd)
{ with(self)
{
return userRating;
}
},["id"]),
new objj_method(sel_getUid("setUserRating:"), function $XYZUser__setUserRating_(self, _cmd, newValue)
{ with(self)
{
userRating = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("prefrences"), function $XYZUser__prefrences(self, _cmd)
{ with(self)
{
return prefrences;
}
},["id"]),
new objj_method(sel_getUid("setPrefrences:"), function $XYZUser__setPrefrences_(self, _cmd, newValue)
{ with(self)
{
prefrences = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithEmail:usernick:pathToAvatar:logged:dj:sex:djList1:djList2:djList3:ownedSongs:rating:prefrences:"), function $XYZUser__initWithEmail_usernick_pathToAvatar_logged_dj_sex_djList1_djList2_djList3_ownedSongs_rating_prefrences_(self, _cmd, anEmail, aName, aPath, state, isDJ, aSex, aDJList, aDJList2, aDJList3, aList, aRating, somePrefs)
{ with(self)
{
    if(self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init")){
  email = anEmail;
        usernick = aName;
  pathToAvatar = aPath;
  logged = state;
  dj = isDJ;
  sex = aSex;
  djList1 = aDJList;
  djList2 = aDJList2;
  djList3 = aDJList3;
  ownedSongs = aList;
        userRating = aRating;
  prefrences = somePrefs;
    }
    return self;
}
},["id","CPString","CPString","CPString","BOOL","BOOL","CPString","CPArray","CPArray","CPArray","CPArray","CPString","XYZUserPrefrences"]), new objj_method(sel_getUid("initWithUserName:rating:"), function $XYZUser__initWithUserName_rating_(self, _cmd, aUserName, aRating)
{ with(self)
{
    if(self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init")){
        usernick = aUserName
        userRating = aRating;
    }
    return self;
}
},["id","CPString","CPString"]), new objj_method(sel_getUid("init"), function $XYZUser__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("isEqual:"), function $XYZUser__isEqual_(self, _cmd, anObject)
{ with(self)
{
 if(objj_msgSend(objj_msgSend(anObject, "class"), "instancesRespondToSelector:",  sel_getUid("email")))
    if(objj_msgSend(anObject, "email")==objj_msgSend(self, "email"))
        return YES;
    else
        return NO;
}
},["BOOL","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $XYZUser__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
 objj_msgSend(aCoder, "encodeObject:forKey:", email, "Email");
 objj_msgSend(aCoder, "encodeObject:forKey:", usernick, "UserNick");
    objj_msgSend(aCoder, "encodeObject:forKey:", logged, "Logged");
 objj_msgSend(aCoder, "encodeObject:forKey:", sex, "Sex");
 objj_msgSend(aCoder, "encodeObject:forKey:", status, "Status");
 objj_msgSend(aCoder, "encodeObject:forKey:", djList1, "DJList1");
 objj_msgSend(aCoder, "encodeObject:forKey:", djList2, "DJList2");
 objj_msgSend(aCoder, "encodeObject:forKey:", djList3, "DJList3");
 objj_msgSend(aCoder, "encodeObject:forKey:", ownedSongs, "OwnedSongs");
 objj_msgSend(aCoder, "encodeObject:forKey:", userRating, "UserRating");
}
},["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $XYZUser__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init");
    if (self)
    {
  email = objj_msgSend(aCoder, "decodeObjectForKey:", "Email");
  usernick =objj_msgSend(aCoder, "decodeObjectForKey:", "UserNick");
  logged = objj_msgSend(aCoder, "decodeObjectForKey:", "Logged");
  sex = objj_msgSend(aCoder, "decodeObjectForKey:", "Sex");
  status = objj_msgSend(aCoder, "decodeObjectForKey:", "Status");
  djList1 = objj_msgSend(aCoder, "decodeObjectForKey:", "DJList1");
  djList2 = objj_msgSend(aCoder, "decodeObjectForKey:", "DJList2");
  djList3 = objj_msgSend(aCoder, "decodeObjectForKey:", "DJList3");
  ownedSongs = objj_msgSend(aCoder, "decodeObjectForKey:", "OwnedSongs");
  userRating = objj_msgSend(aCoder, "decodeObjectForKey:", "UserRating");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("starRatingForUserChanged:"), function $XYZUser__starRatingForUserChanged_(self, _cmd, aNotification)
{ with(self)
{
 console.log("notified!!");
 var info = objj_msgSend(aNotification, "userInfo");
 var aux = objj_msgSend(info, "objectForKey:", "rating");
 objj_msgSend(self, "setUserRating:",  aux);
 console.log(objj_msgSend(self, "rating"));
}
},["void","CPNotification"]), new objj_method(sel_getUid("setStarRater:"), function $XYZUser__setStarRater_(self, _cmd, aRater)
{ with(self)
{
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("starRatingForUserChanged:"), "StarRatingForUserChanged", aRater);
}
},["void","StarRatingView"])]);
}

p;25;model/XYZUserPrefrences.jt;228;@STATIC;1.0;I;21;Foundation/CPObject.jt;184;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZUserPrefrences"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}

e;