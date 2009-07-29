I;21;Foundation/CPObject.jc;2832;
var _1=NULL;
var _2=objj_allocateClassPair(CPObject,"CPPlatformWindow"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contentRect")]);
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
}),new objj_method(sel_getUid("usableContentFrame"),function(_e,_f){
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
}),new objj_method(sel_getUid("setContentRect:"),function(_12,_13,_14){
with(_12){
if(!_14||((_contentRect.origin.x==_14.origin.x&&_contentRect.origin.y==_14.origin.y)&&(_contentRect.size.width==_14.size.width&&_contentRect.size.height==_14.size.height))){
return;
}
objj_msgSend(_12,"setContentOrigin:",_14.origin);
objj_msgSend(_12,"setContentSize:",_14.size);
}
}),new objj_method(sel_getUid("setContentOrigin:"),function(_15,_16,_17){
with(_15){
var _18=_contentRect.origin;
if(!_17||(_18.x==_17.x&&_18.y==_17.y)){
return;
}
_18.x=_17.x;
_18.y=_17.y;
objj_msgSend(_15,"updateNativeContentOrigin");
}
}),new objj_method(sel_getUid("setContentSize:"),function(_19,_1a,_1b){
with(_19){
var _1c=_contentRect.size;
if(!_1b||(_1c.width==_1b.width&&_1c.height==_1b.height)){
return;
}
var _1d={width:_1b.width-_1c.width,height:_1b.height-_1c.height};
_1c.width=_1b.width;
_1c.height=_1b.height;
objj_msgSend(_19,"updateNativeContentSize");
}
}),new objj_method(sel_getUid("updateFromNativeContentRect"),function(_1e,_1f){
with(_1e){
objj_msgSend(_1e,"setContentRect:",objj_msgSend(_1e,"nativeContentRect"));
}
}),new objj_method(sel_getUid("supportsFullPlatformWindows"),function(_20,_21){
with(_20){
return NO;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("primaryPlatformWindow"),function(_22,_23){
with(_22){
return _1;
}
}),new objj_method(sel_getUid("setPrimaryPlatformWindow:"),function(_24,_25,_26){
with(_24){
_1=_26;
}
})]);
