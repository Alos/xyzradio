@STATIC;1.0;i;9;CPSound.jt;6977;objj_executeFile("CPSound.j", YES);
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

