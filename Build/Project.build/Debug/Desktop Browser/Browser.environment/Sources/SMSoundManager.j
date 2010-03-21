@STATIC;1.0;t;3367;{var the_class = objj_allocateClassPair(CPObject, "SMSoundManager"),
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
  soundManager.url = "Resources/soundmanager2.js";
  soundManager.onload = function() {
            objj_msgSend(obj, "soundManagerDidLoad:", soundManager);
  };
        soundManager.beginDelayedInit();
  soundManager.debugMode = false;
 }, YES);
 document.getElementsByTagName("head")[0].appendChild(script);
}

