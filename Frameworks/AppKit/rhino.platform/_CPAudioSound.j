i;9;CPSound.jc;2566;
var _1=0;
var _2=objj_allocateClassPair(CPSound,"_CPAudioSound"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_Player")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_CreateDOMAudioElement:"),function(_4,_5,_6){
with(_4){
var _7=document.createElement("audio");
_7.setAttribute("src",_6);
_7.setAttribute("autoplay","false");
_7.setAttribute("autostart","0");
_7.setAttribute("controls","false");
_7.setAttribute("loop","false");
_7.setAttribute("id","CPMixer"+"Audio"+_1);
return _7;
}
}),new objj_method(sel_getUid("initWithFile:mixer:"),function(_8,_9,_a,_b){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPSound")},"init");
if(_8){
var _c=objj_msgSend(_8,"_CreateDOMAudioElement:",_a);
_b.appendChild(_c);
if(!document.getElementById("CPMixer"+"Audio"+_1)){
return nil;
}
_Player=_c;
if(document.addEventListener){
_Player.addEventListener("ended",function(){
if(_delegate!=nil&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("sound:didFinishPlaying:"))){
objj_msgSend(_delegate,"sound:didFinishPlaying:",_8,YES);
}
},false);
}else{
_Player.attachEvent("onended",function(){
if(_delegate!=nil&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("sound:didFinishPlaying:"))){
objj_msgSend(_delegate,"sound:didFinishPlaying:",_8,YES);
}
});
}
}
return _8;
}
}),new objj_method(sel_getUid("isPlaying"),function(_d,_e){
with(_d){
return !_Player.paused;
}
}),new objj_method(sel_getUid("play"),function(_f,_10){
with(_f){
_Player.play();
}
}),new objj_method(sel_getUid("pause"),function(_11,_12){
with(_11){
_Player.pause();
}
}),new objj_method(sel_getUid("stop"),function(_13,_14){
with(_13){
_Player.pause();
_Player.currentTime=0;
}
}),new objj_method(sel_getUid("volume"),function(_15,_16){
with(_15){
return _Player.volume;
}
}),new objj_method(sel_getUid("setVolume:"),function(_17,_18,_19){
with(_17){
if(_19>1){
_19=1;
}else{
if(_19<0){
_19=0;
}
}
_Player.volume=_19;
}
}),new objj_method(sel_getUid("duration"),function(_1a,_1b){
with(_1a){
return _Player.duration;
}
}),new objj_method(sel_getUid("loops"),function(_1c,_1d){
with(_1c){
return _Player.loop==nil;
}
}),new objj_method(sel_getUid("setLoops:"),function(_1e,_1f,_20){
with(_1e){
_Player.loop=_20;
}
}),new objj_method(sel_getUid("currentTime"),function(_21,_22){
with(_21){
return _Player.currentTime;
}
}),new objj_method(sel_getUid("setCurrentTime:"),function(_23,_24,_25){
with(_23){
if(_25<0){
_25=0;
}
_Player.currentTime=_25;
}
})]);
