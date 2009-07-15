I;26;AppKit/CPDOMWindowBridge.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jc;3612;
var _CPMixerDiv = nil;
var _CPMixerSounds = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPSound"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_name")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithResource:"), function $CPSound__initWithResource_(self, _cmd, resource)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        var aFileName = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", resource);
        if (self = objj_msgSend(objj_msgSend(_CPQuickTimeSound, "alloc"), "initWithFile:mixer:", aFileName, _CPMixerDiv))
            return self;
        if (self = objj_msgSend(objj_msgSend(_CPAudioSound, "alloc"), "initWithFile:mixer:", aFileName, _CPMixerDiv))
            return self;
        _name = nil;
    }
    return nil;
}
}), new objj_method(sel_getUid("setDelegate:"), function $CPSound__setDelegate_(self, _cmd, delegate)
{ with(self)
{
    _delegate = delegate;
}
}), new objj_method(sel_getUid("delegate"), function $CPSound__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setName:"), function $CPSound__setName_(self, _cmd, aName)
{ with(self)
{
    objj_msgSend(_CPMixerSounds, "setObject:forKey:", self, aName);
    _name = aName;
}
}), new objj_method(sel_getUid("name"), function $CPSound__name(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("isPlaying"), function $CPSound__isPlaying(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("play"), function $CPSound__play(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("resume"), function $CPSound__resume(self, _cmd)
{ with(self)
{
    var playing = objj_msgSend(self, "isPlaying");
    objj_msgSend(self, "play");
    return !playing;
}
}), new objj_method(sel_getUid("pause"), function $CPSound__pause(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("stop"), function $CPSound__stop(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("volume"), function $CPSound__volume(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setVolume:"), function $CPSound__setVolume_(self, _cmd, volume)
{ with(self)
{
}
}), new objj_method(sel_getUid("duration"), function $CPSound__duration(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("loops"), function $CPSound__loops(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setLoops:"), function $CPSound__setLoops_(self, _cmd, loops)
{ with(self)
{
}
}), new objj_method(sel_getUid("currentTime"), function $CPSound__currentTime(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setCurrentTime:"), function $CPSound__setCurrentTime_(self, _cmd, time)
{ with(self)
{
}
})]);
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
}), new objj_method(sel_getUid("soundNamed:"), function $CPSound__soundNamed_(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(_CPMixerSounds, "objectForKey:", aName);
}
})]);
}
i;19;_CPQuickTimeSound.ji;15;_CPAudioSound.j