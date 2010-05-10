@STATIC;1.0;i;21;../gui/PlayerWindow.ji;18;../model/XYZSong.ji;20;../gui/MainBrowser.ji;15;../gui/DJList.ji;16;SMSoundManager.jt;6990;objj_executeFile("../gui/PlayerWindow.j", YES);
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

