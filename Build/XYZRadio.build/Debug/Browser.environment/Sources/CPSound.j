@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.ji;19;_CPQuickTimeSound.ji;15;_CPAudioSound.jt;4000;objj_executeFile("Foundation/CPObject.j", NO);
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

