I;26;AppKit/CPDOMWindowBridge.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jc;2601;
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"CPSound"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("_name")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithResource:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
var _8=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_7);
if(_5=objj_msgSend(objj_msgSend(_CPQuickTimeSound,"alloc"),"initWithFile:mixer:",_8,_1)){
return _5;
}
if(_5=objj_msgSend(objj_msgSend(_CPAudioSound,"alloc"),"initWithFile:mixer:",_8,_1)){
return _5;
}
_name=nil;
}
return nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9,_a,_b){
with(_9){
_delegate=_b;
}
}),new objj_method(sel_getUid("delegate"),function(_c,_d){
with(_c){
return _delegate;
}
}),new objj_method(sel_getUid("setName:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_2,"setObject:forKey:",_e,_10);
_name=_10;
}
}),new objj_method(sel_getUid("name"),function(_11,_12){
with(_11){
return _name;
}
}),new objj_method(sel_getUid("isPlaying"),function(_13,_14){
with(_13){
}
}),new objj_method(sel_getUid("play"),function(_15,_16){
with(_15){
}
}),new objj_method(sel_getUid("resume"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"isPlaying");
objj_msgSend(_17,"play");
return !_19;
}
}),new objj_method(sel_getUid("pause"),function(_1a,_1b){
with(_1a){
}
}),new objj_method(sel_getUid("stop"),function(_1c,_1d){
with(_1c){
}
}),new objj_method(sel_getUid("volume"),function(_1e,_1f){
with(_1e){
}
}),new objj_method(sel_getUid("setVolume:"),function(_20,_21,_22){
with(_20){
}
}),new objj_method(sel_getUid("duration"),function(_23,_24){
with(_23){
}
}),new objj_method(sel_getUid("loops"),function(_25,_26){
with(_25){
}
}),new objj_method(sel_getUid("setLoops:"),function(_27,_28,_29){
with(_27){
}
}),new objj_method(sel_getUid("currentTime"),function(_2a,_2b){
with(_2a){
}
}),new objj_method(sel_getUid("setCurrentTime:"),function(_2c,_2d,_2e){
with(_2c){
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_2f,_30){
with(_2f){
var _31=objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge");
var _32=_31._DOMBodyElement;
_1=document.createElement("div");
_32.appendChild(_1);
_1.style.width="0px";
_1.style.height="0px";
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("soundNamed:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(_2,"objectForKey:",_35);
}
})]);
i;19;_CPQuickTimeSound.ji;15;_CPAudioSound.j