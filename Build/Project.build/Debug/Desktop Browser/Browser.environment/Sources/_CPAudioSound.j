@STATIC;1.0;i;9;CPSound.jt;3892;objj_executeFile("CPSound.j", YES);
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

