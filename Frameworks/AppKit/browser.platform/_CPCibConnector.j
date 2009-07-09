I;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;3456;
var _1="_CPCibConnectorSourceKey",_2="_CPCibConnectorDestinationKey",_3="_CPCibConnectorLabelKey";
var _4=objj_allocateClassPair(CPObject,"_CPCibConnector"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_source"),new objj_ivar("_destination"),new objj_ivar("_label")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("replaceObjects:"),function(_6,_7,_8){
with(_6){
var _9=_8[objj_msgSend(_source,"UID")];
if(_9!==undefined){
_source=_9;
}
_9=_8[objj_msgSend(_destination,"UID")];
if(_9!==undefined){
_destination=_9;
}
}
})]);
var _4=objj_getClass("_CPCibConnector");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibConnector\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPObject")},"init");
if(_a){
_source=objj_msgSend(_c,"decodeObjectForKey:",_1);
_destination=objj_msgSend(_c,"decodeObjectForKey:",_2);
_label=objj_msgSend(_c,"decodeObjectForKey:",_3);
}
return _a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_f,"encodeObject:forKey:",_source,_1);
objj_msgSend(_f,"encodeObject:forKey:",_destination,_2);
objj_msgSend(_f,"encodeObject:forKey:",_label,_3);
}
})]);
var _4=objj_allocateClassPair(_CPCibConnector,"_CPCibControlConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("establishConnection"),function(_10,_11){
with(_10){
var _12=_label,_13=objj_msgSend(_12,"length");
if(_13&&_12[_13-1]!==":"){
_12+=":";
}
var _14=CPSelectorFromString(_12);
if(!_14){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_10,"className")+" "+_11+"] selector "+_12+" does not exist.");
}
if(_destination&&!objj_msgSend(_destination,"respondsToSelector:",_14)){
CPLog.warn("Could not connect the action "+_14+" to target of class "+objj_msgSend(_destination,"className"));
return;
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_source,sel_getUid("setAction:"),_14);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_10,"className")+" "+_11+"] "+objj_msgSend(_source,"description")+" does not respond to setAction:");
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_source,sel_getUid("setTarget:"),_destination);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_10,"className")+" "+_11+"] "+objj_msgSend(_source,"description")+" does not respond to setTarget:");
}
}
})]);
var _4=objj_allocateClassPair(_CPCibConnector,"_CPCibOutletConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("establishConnection"),function(_15,_16){
with(_15){
try{
objj_msgSend(_source,"setValue:forKey:",_destination,_label);
}
catch(anException){
if(objj_msgSend(anException,"name")===CPUndefinedKeyException){
CPLog.warn("Could not connect the outlet "+_label+" of target of class "+objj_msgSend(_source,"className"));
}else{
throw anException;
}
}
}
})]);
