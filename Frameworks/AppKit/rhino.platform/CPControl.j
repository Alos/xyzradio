i;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;16076;
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_continuousTracking"),new objj_ivar("_trackingWasWithinFrame"),new objj_ivar("_trackingMouseDownFlags"),new objj_ivar("_previousTrackingLocation"),new objj_ivar("_toolTip")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPView")},"initWithFrame:",_6);
if(_4){
_sendActionOn=CPLeftMouseUpMask;
_trackingMouseDownFlags=0;
}
return _4;
}
}),new objj_method(sel_getUid("setAction:"),function(_7,_8,_9){
with(_7){
_action=_9;
}
}),new objj_method(sel_getUid("action"),function(_a,_b){
with(_a){
return _action;
}
}),new objj_method(sel_getUid("setTarget:"),function(_c,_d,_e){
with(_c){
_target=_e;
}
}),new objj_method(sel_getUid("target"),function(_f,_10){
with(_f){
return _target;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_11,_12,_13,_14){
with(_11){
objj_msgSend(CPApp,"sendAction:to:from:",_13,_14,_11);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_15,_16,_17){
with(_15){
var _18=_sendActionOn;
_sendActionOn=_17;
return _18;
}
}),new objj_method(sel_getUid("isContinuous"),function(_19,_1a){
with(_19){
return (_sendActionOn&CPPeriodicMask)!==0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_1b,_1c,_1d){
with(_1b){
if(_1d){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_1e,_1f){
with(_1e){
return NO;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_22,"type"),_24=objj_msgSend(_20,"convertPoint:fromView:",objj_msgSend(_22,"locationInWindow"),nil);
isWithinFrame=objj_msgSend(_20,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_20,"bounds"),_24);
if(_23===CPLeftMouseUp){
objj_msgSend(_20,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_24,YES);
_trackingMouseDownFlags=0;
}else{
if(_23===CPLeftMouseDown){
_trackingMouseDownFlags=objj_msgSend(_22,"modifierFlags");
_continuousTracking=objj_msgSend(_20,"startTrackingAt:",_24);
}else{
if(_23===CPLeftMouseDragged){
if(isWithinFrame){
if(!_trackingWasWithinFrame){
_continuousTracking=objj_msgSend(_20,"startTrackingAt:",_24);
}else{
if(_continuousTracking){
_continuousTracking=objj_msgSend(_20,"continueTracking:at:",_previousTrackingLocation,_24);
}
}
}else{
objj_msgSend(_20,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_24,NO);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_20,sel_getUid("trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
if((_sendActionOn&(1<<_23))&&isWithinFrame){
objj_msgSend(_20,"sendAction:to:",_action,_target);
}
_trackingWasWithinFrame=isWithinFrame;
_previousTrackingLocation=_24;
}
}),new objj_method(sel_getUid("performClick:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"highlight:",YES);
objj_msgSend(_25,"setState:",objj_msgSend(_25,"nextState"));
objj_msgSend(_25,"sendAction:to:",objj_msgSend(_25,"action"),objj_msgSend(_25,"target"));
objj_msgSend(_25,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_28,_29){
with(_28){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_2d,_2e,_2f,_30){
with(_2d){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_31,_32,_33,_34,_35){
with(_31){
objj_msgSend(_31,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_36,_37,_38){
with(_36){
if(!objj_msgSend(_36,"isEnabled")){
return;
}
objj_msgSend(_36,"trackMouse:",_38);
}
}),new objj_method(sel_getUid("objectValue"),function(_39,_3a){
with(_39){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3b,_3c,_3d){
with(_3b){
_value=_3d;
objj_msgSend(_3b,"setNeedsLayout");
objj_msgSend(_3b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_3e,_3f){
with(_3e){
var _40=parseFloat(_value,10);
return isNaN(_40)?0:_40;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_41,"setObjectValue:",_43);
}
}),new objj_method(sel_getUid("doubleValue"),function(_44,_45){
with(_44){
var _46=parseFloat(_value,10);
return isNaN(_46)?0:_46;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_47,"setObjectValue:",_49);
}
}),new objj_method(sel_getUid("intValue"),function(_4a,_4b){
with(_4a){
var _4c=parseInt(_value,10);
return isNaN(_4c)?0:_4c;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"setObjectValue:",_4f);
}
}),new objj_method(sel_getUid("integerValue"),function(_50,_51){
with(_50){
var _52=parseInt(_value,10);
return isNaN(_52)?0:_52;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_53,"setObjectValue:",_55);
}
}),new objj_method(sel_getUid("stringValue"),function(_56,_57){
with(_56){
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_58,"setObjectValue:",_5a);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_5b,_5c,_5d){
with(_5b){
if(objj_msgSend(_5d,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_5b,"setDoubleValue:",objj_msgSend(_5d,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_5e,_5f,_60){
with(_5e){
if(objj_msgSend(_60,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_5e,"setFloatValue:",objj_msgSend(_60,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_61,_62,_63){
with(_61){
if(objj_msgSend(_63,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_61,"setIntegerValue:",objj_msgSend(_63,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_64,_65,_66){
with(_64){
if(objj_msgSend(_66,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_64,"setIntValue:",objj_msgSend(_66,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_67,_68,_69){
with(_67){
if(objj_msgSend(_69,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_67,"setObjectValue:",objj_msgSend(_69,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_6a,_6b,_6c){
with(_6a){
if(objj_msgSend(_6c,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_6a,"setStringValue:",objj_msgSend(_6c,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_6d,_6e,_6f){
with(_6d){
if(objj_msgSend(_6f,"object")!=_6d){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_6d,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_6f,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_70,_71,_72){
with(_70){
if(objj_msgSend(_72,"object")!=_70){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_70,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_72,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_73,_74,_75){
with(_73){
if(objj_msgSend(_75,"object")!=_73){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_73,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_75,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_76,"setValue:forThemeAttribute:",_78,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_79,_7a){
with(_79){
return objj_msgSend(_79,"valueForThemeAttribute:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7b,"setValue:forThemeAttribute:",_7d,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_7e,_7f){
with(_7e){
return objj_msgSend(_7e,"valueForThemeAttribute:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_80,"setValue:forThemeAttribute:",_82,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"valueForThemeAttribute:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setValue:forThemeAttribute:",_87,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_88,_89){
with(_88){
return objj_msgSend(_88,"valueForThemeAttribute:","text-color");
}
}),new objj_method(sel_getUid("setFont:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"setValue:forThemeAttribute:",_8c,"font");
}
}),new objj_method(sel_getUid("font"),function(_8d,_8e){
with(_8d){
return objj_msgSend(_8d,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"setValue:forThemeAttribute:",_91,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_92,_93){
with(_92){
return objj_msgSend(_92,"valueForThemeAttribute:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"setValue:forThemeAttribute:",_96,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_97,_98){
with(_97){
return objj_msgSend(_97,"valueForThemeAttribute:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"setValue:forThemeAttribute:",_9b,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_9c,_9d){
with(_9c){
return objj_msgSend(_9c,"valueForThemeAttribute:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"setValue:forThemeAttribute:",_a0,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_a1,"valueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a3,_a4,_a5){
with(_a3){
if(_a5){
objj_msgSend(_a3,"unsetThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_a3,"setThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_a6,_a7){
with(_a6){
return !objj_msgSend(_a6,"hasThemeState:",CPThemeStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_a8,_a9,_aa){
with(_a8){
objj_msgSend(_a8,"setHighlighted:",_aa);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_ab,_ac,_ad){
with(_ab){
if(_ad){
objj_msgSend(_ab,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_ab,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("isHighlighted"),function(_ae,_af){
with(_ae){
return objj_msgSend(_ae,"hasThemeState:",CPThemeStateHighlighted);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_b0,_b1){
with(_b0){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12),nil,{width:0,height:0},CPImageLeft,CPScaleToFit,{width:0,height:0},{width:-1,height:-1}],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling","min-size","max-size"]);
}
})]);
var _b2="CPControlValueKey",_b3="CPControlControlStateKey",_b4="CPControlIsEnabledKey",_b5="CPControlTargetKey",_b6="CPControlActionKey",_b7="CPControlSendActionOnKey";
var _b8="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b9,_ba,_bb){
with(_b9){
_b9=objj_msgSendSuper({receiver:_b9,super_class:objj_getClass("CPView")},"initWithCoder:",_bb);
if(_b9){
objj_msgSend(_b9,"setObjectValue:",objj_msgSend(_bb,"decodeObjectForKey:",_b2));
objj_msgSend(_b9,"setTarget:",objj_msgSend(_bb,"decodeObjectForKey:",_b5));
objj_msgSend(_b9,"setAction:",objj_msgSend(_bb,"decodeObjectForKey:",_b6));
objj_msgSend(_b9,"sendActionOn:",objj_msgSend(_bb,"decodeIntForKey:",_b7));
}
return _b9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_bc,_bd,_be){
with(_bc){
objj_msgSendSuper({receiver:_bc,super_class:objj_getClass("CPView")},"encodeWithCoder:",_be);
if(_value!==nil){
objj_msgSend(_be,"encodeObject:forKey:",_value,_b2);
}
if(_target!==nil){
objj_msgSend(_be,"encodeConditionalObject:forKey:",_target,_b5);
}
if(_action!==NULL){
objj_msgSend(_be,"encodeObject:forKey:",_action,_b6);
}
objj_msgSend(_be,"encodeInt:forKey:",_sendActionOn,_b7);
}
})]);
var _bf=[],_c0={},_c1={};
_bf[CPRegularControlSize]="Regular";
_bf[CPSmallControlSize]="Small";
_bf[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_c2){
return _bf[_c2];
};
_CPControlColorWithPatternImage=function(_c3,_c4){
var _c5=1,_c6=arguments.length,_c7="";
for(;_c5<_c6;++_c5){
_c7+=arguments[_c5];
}
var _c8=_c0[_c7];
if(!_c8){
var _c9=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_c8=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_c9,"pathForResource:",_c4+"/"+_c7+".png"),_c3[_c7]));
_c0[_c7]=_c8;
}
return _c8;
};
_CPControlThreePartImagePattern=function(_ca,_cb,_cc){
var _cd=2,_ce=arguments.length,_cf="";
for(;_cd<_ce;++_cd){
_cf+=arguments[_cd];
}
var _d0=_c1[_cf];
if(!_d0){
var _d1=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_d2=_cc+"/"+_cf;
_cb=_cb[_cf];
_d0=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d1,"pathForResource:",_d2+"0.png"),_cb[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d1,"pathForResource:",_d2+"1.png"),_cb[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d1,"pathForResource:",_d2+"2.png"),_cb[2])],_ca));
_c1[_cf]=_d0;
}
return _d0;
};
