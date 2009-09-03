I;21;Foundation/CPObject.jc;3687;
var _1=NULL;
var _2=objj_allocateClassPair(CPObject,"CPPlatformWindow"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contentRect"),new objj_ivar("_level"),new objj_ivar("_hasShadow")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentRect:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_contentRect={origin:{x:_6.origin.x,y:_6.origin.y},size:{width:_6.size.width,height:_6.size.height}};
}
return _4;
}
}),new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"initWithContentRect:",{origin:{x:0,y:0},size:{width:400,height:500}});
}
}),new objj_method(sel_getUid("contentRect"),function(_9,_a){
with(_9){
return {origin:{x:_contentRect.origin.x,y:_contentRect.origin.y},size:{width:_contentRect.size.width,height:_contentRect.size.height}};
}
}),new objj_method(sel_getUid("contentBounds"),function(_b,_c){
with(_b){
var _d=objj_msgSend(_b,"contentRect");
_d.origin={x:0,y:0};
return _d;
}
}),new objj_method(sel_getUid("visibleFrame"),function(_e,_f){
with(_e){
var _10=objj_msgSend(_e,"contentBounds");
_10.origin=CGPointMakeZero();
if(objj_msgSend(CPMenu,"menuBarVisible")){
var _11=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"menuBarHeight");
_10.origin.y+=_11;
_10.size.height-=_11;
}
return _10;
}
}),new objj_method(sel_getUid("usableContentFrame"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"visibleFrame");
}
}),new objj_method(sel_getUid("setContentRect:"),function(_14,_15,_16){
with(_14){
if(!_16||((_contentRect.origin.x==_16.origin.x&&_contentRect.origin.y==_16.origin.y)&&(_contentRect.size.width==_16.size.width&&_contentRect.size.height==_16.size.height))){
return;
}
objj_msgSend(_14,"setContentOrigin:",_16.origin);
objj_msgSend(_14,"setContentSize:",_16.size);
}
}),new objj_method(sel_getUid("setContentOrigin:"),function(_17,_18,_19){
with(_17){
var _1a=_contentRect.origin;
if(!_19||(_1a.x==_19.x&&_1a.y==_19.y)){
return;
}
_1a.x=_19.x;
_1a.y=_19.y;
objj_msgSend(_17,"updateNativeContentOrigin");
}
}),new objj_method(sel_getUid("setContentSize:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=_contentRect.size;
if(!_1d||(_1e.width==_1d.width&&_1e.height==_1d.height)){
return;
}
var _1f={width:_1d.width-_1e.width,height:_1d.height-_1e.height};
_1e.width=_1d.width;
_1e.height=_1d.height;
objj_msgSend(_1b,"updateNativeContentSize");
}
}),new objj_method(sel_getUid("updateFromNativeContentRect"),function(_20,_21){
with(_20){
objj_msgSend(_20,"setContentRect:",objj_msgSend(_20,"nativeContentRect"));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_22,"contentRect");
return {x:_24.x+(_25.origin.x),y:_24.y+(_25.origin.y)};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_26,"contentRect");
return {x:_28.x-(_29.origin.x),y:_28.y-(_29.origin.y)};
}
}),new objj_method(sel_getUid("isVisible"),function(_2a,_2b){
with(_2a){
return NO;
}
}),new objj_method(sel_getUid("setLevel:"),function(_2c,_2d,_2e){
with(_2c){
_level=_2e;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_2f,_30,_31){
with(_2f){
_hasShadow=_31;
}
}),new objj_method(sel_getUid("supportsFullPlatformWindows"),function(_32,_33){
with(_32){
return objj_msgSend(CPPlatform,"isBrowser");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("primaryPlatformWindow"),function(_34,_35){
with(_34){
return _1;
}
}),new objj_method(sel_getUid("setPrimaryPlatformWindow:"),function(_36,_37,_38){
with(_36){
_1=_38;
}
})]);
