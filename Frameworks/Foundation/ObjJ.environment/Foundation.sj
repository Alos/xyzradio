@STATIC;1.0;p;13;CPArray+KVO.jt;12607;@STATIC;1.0;i;9;CPArray.ji;8;CPNull.jt;12562;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPNull.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("mutableArrayValueForKey:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_CPKVCArray,"alloc"),"initWithKey:forProxyObject:",_5,_3);
}
}),new objj_method(sel_getUid("mutableArrayValueForKeyPath:"),function(_6,_7,_8){
with(_6){
var _9=_8.indexOf(".");
if(_9<0){
return objj_msgSend(_6,"mutableArrayValueForKey:",_8);
}
var _a=_8.substring(0,_9),_b=_8.substring(_9+1);
return objj_msgSend(objj_msgSend(_6,"valueForKeyPath:",_a),"valueForKeyPath:",_b);
}
})]);
var _1=objj_allocateClassPair(CPArray,"_CPKVCArray"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_proxyObject"),new objj_ivar("_key"),new objj_ivar("_insertSEL"),new objj_ivar("_insert"),new objj_ivar("_removeSEL"),new objj_ivar("_remove"),new objj_ivar("_replaceSEL"),new objj_ivar("_replace"),new objj_ivar("_insertManySEL"),new objj_ivar("_insertMany"),new objj_ivar("_removeManySEL"),new objj_ivar("_removeMany"),new objj_ivar("_replaceManySEL"),new objj_ivar("_replaceMany"),new objj_ivar("_objectAtIndexSEL"),new objj_ivar("_objectAtIndex"),new objj_ivar("_countSEL"),new objj_ivar("_count"),new objj_ivar("_accessSEL"),new objj_ivar("_access"),new objj_ivar("_setSEL"),new objj_ivar("_set")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:forProxyObject:"),function(_c,_d,_e,_f){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("_CPKVCArray").super_class},"init");
_key=_e;
_proxyObject=_f;
var _10=_key.charAt(0).toUpperCase()+_key.substring(1);
_insertSEL=sel_getName("insertObject:in"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertSEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertSEL);
}
_removeSEL=sel_getName("removeObjectFrom"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeSEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeSEL);
}
_replaceSEL=sel_getName("replaceObjectFrom"+_10+"AtIndex:withObject:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceSEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceSEL);
}
_insertManySEL=sel_getName("insertObjects:in"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_insertManySEL)){
_insert=objj_msgSend(_proxyObject,"methodForSelector:",_insertManySEL);
}
_removeManySEL=sel_getName("removeObjectsFrom"+_10+"AtIndexes:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_removeManySEL)){
_remove=objj_msgSend(_proxyObject,"methodForSelector:",_removeManySEL);
}
_replaceManySEL=sel_getName("replaceObjectsFrom"+_10+"AtIndexes:withObjects:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_replaceManySEL)){
_replace=objj_msgSend(_proxyObject,"methodForSelector:",_replaceManySEL);
}
_objectAtIndexSEL=sel_getName("objectIn"+_10+"AtIndex:");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_objectAtIndexSEL)){
_objectAtIndex=objj_msgSend(_proxyObject,"methodForSelector:",_objectAtIndexSEL);
}
_countSEL=sel_getName("countOf"+_10);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_countSEL)){
_count=objj_msgSend(_proxyObject,"methodForSelector:",_countSEL);
}
_accessSEL=sel_getName(_key);
if(objj_msgSend(_proxyObject,"respondsToSelector:",_accessSEL)){
_access=objj_msgSend(_proxyObject,"methodForSelector:",_accessSEL);
}
_setSEL=sel_getName("set"+_10+":");
if(objj_msgSend(_proxyObject,"respondsToSelector:",_setSEL)){
_set=objj_msgSend(_proxyObject,"methodForSelector:",_setSEL);
}
return _c;
}
}),new objj_method(sel_getUid("copy"),function(_11,_12){
with(_11){
var i=0,_13=[],_14=objj_msgSend(_11,"count");
for(;i<_14;i++){
objj_msgSend(_13,"addObject:",objj_msgSend(_11,"objectAtIndex:",i));
}
return _13;
}
}),new objj_method(sel_getUid("_representedObject"),function(_15,_16){
with(_15){
if(_access){
return _access(_proxyObject,_accessSEL);
}
return objj_msgSend(_proxyObject,"valueForKey:",_key);
}
}),new objj_method(sel_getUid("_setRepresentedObject:"),function(_17,_18,_19){
with(_17){
if(_set){
return _set(_proxyObject,_setSEL,_19);
}
objj_msgSend(_proxyObject,"setValue:forKey:",_19,_key);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
if(_count){
return _count(_proxyObject,_countSEL);
}
return objj_msgSend(objj_msgSend(_1a,"_representedObject"),"count");
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=_1f.location,_21=_1f.length,_22=!!_1e.isa;
for(;_20<_21;++_20){
var _23=objj_msgSend(_1c,"objectAtIndex:",_20);
if(_1e===_23||_22&&!!_23.isa&&objj_msgSend(_1e,"isEqual:",_23)){
return _20;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"indexOfObject:inRange:",_26,CPMakeRange(0,objj_msgSend(_24,"count")));
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=_2a.location,_2c=_2a.length;
for(;_2b<_2c;++_2b){
if(_29===objj_msgSend(_27,"objectAtIndex:",_2b)){
return _2b;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_2d,"indexOfObjectIdenticalTo:inRange:",_2f,CPMakeRange(0,objj_msgSend(_2d,"count")));
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_30,_31,_32){
with(_30){
if(_objectAtIndex){
return _objectAtIndex(_proxyObject,_objectAtIndexSEL,_32);
}
return objj_msgSend(objj_msgSend(_30,"_representedObject"),"objectAtIndex:",_32);
}
}),new objj_method(sel_getUid("addObject:"),function(_33,_34,_35){
with(_33){
if(_insert){
return _insert(_proxyObject,_insertSEL,_35,objj_msgSend(_33,"count"));
}
var _36=objj_msgSend(objj_msgSend(_33,"_representedObject"),"copy");
objj_msgSend(_36,"addObject:",_35);
objj_msgSend(_33,"_setRepresentedObject:",_36);
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_37,_38,_39){
with(_37){
var _3a=0,_3b=objj_msgSend(_39,"count");
for(;_3a<_3b;++_3a){
objj_msgSend(_37,"addObject:",objj_msgSend(_39,"objectAtIndex:",_3a));
}
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_3c,_3d,_3e,_3f){
with(_3c){
if(_insert){
return _insert(_proxyObject,_insertSEL,_3e,_3f);
}
var _40=objj_msgSend(objj_msgSend(_3c,"_representedObject"),"copy");
objj_msgSend(_40,"insertObject:atIndex:",_3e,_3f);
objj_msgSend(_3c,"_setRepresentedObject:",_40);
}
}),new objj_method(sel_getUid("removeObject:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_41,"removeObject:inRange:",_43,CPMakeRange(0,objj_msgSend(_41,"count")));
}
}),new objj_method(sel_getUid("removeLastObject"),function(_44,_45){
with(_44){
if(_remove){
return _remove(_proxyObject,_removeSEL,objj_msgSend(_44,"count")-1);
}
var _46=objj_msgSend(objj_msgSend(_44,"_representedObject"),"copy");
objj_msgSend(_46,"removeLastObject");
objj_msgSend(_44,"_setRepresentedObject:",_46);
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(_47,_48,_49){
with(_47){
if(_remove){
return _remove(_proxyObject,_removeSEL,_49);
}
var _4a=objj_msgSend(objj_msgSend(_47,"_representedObject"),"copy");
objj_msgSend(_4a,"removeObjectAtIndex:",_49);
objj_msgSend(_47,"_setRepresentedObject:",_4a);
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_4b,_4c,_4d,_4e){
with(_4b){
if(_replace){
return _replace(_proxyObject,_replaceSEL,_4d,_4e);
}
var _4f=objj_msgSend(objj_msgSend(_4b,"_representedObject"),"copy");
objj_msgSend(_4f,"replaceObjectAtIndex:withObject:",_4d,_4e);
objj_msgSend(_4b,"_setRepresentedObject:",_4f);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_50,_51){
with(_50){
var _52=[];
_52.isa=_50;
var _53=class_copyIvarList(_50),_54=_53.length;
while(_54--){
_52[ivar_getName(_53[_54])]=nil;
}
return _52;
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("valueForKey:"),function(_55,_56,_57){
with(_55){
if(_57.indexOf("@")===0){
if(_57.indexOf(".")!==-1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"called valueForKey: on an array with a complex key ("+_57+"). use valueForKeyPath:");
}
if(_57=="@count"){
return length;
}
return nil;
}else{
var _58=[],_59=objj_msgSend(_55,"objectEnumerator"),_5a;
while((_5a=objj_msgSend(_59,"nextObject"))!==nil){
var _5b=objj_msgSend(_5a,"valueForKey:",_57);
if(_5b===nil||_5b===undefined){
_5b=objj_msgSend(CPNull,"null");
}
_58.push(_5b);
}
return _58;
}
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_5c,_5d,_5e){
with(_5c){
if(_5e.indexOf("@")===0){
var _5f=_5e.indexOf("."),_60,_61;
if(_5f!==-1){
_60=_5e.substring(1,_5f);
_61=_5e.substring(_5f+1);
}else{
_60=_5e.substring(1);
}
if(_62[_60]){
return _62[_60](_5c,_5d,_61);
}
return nil;
}else{
var _63=[],_64=objj_msgSend(_5c,"objectEnumerator"),_65;
while((_65=objj_msgSend(_64,"nextObject"))!==nil){
var _66=objj_msgSend(_65,"valueForKeyPath:",_5e);
if(_66===nil||_66===undefined){
_66=objj_msgSend(CPNull,"null");
}
_63.push(_66);
}
return _63;
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_67,_68,_69,_6a){
with(_67){
var _6b=objj_msgSend(_67,"objectEnumerator"),_6c;
while(_6c=objj_msgSend(_6b,"nextObject")){
objj_msgSend(_6c,"setValue:forKey:",_69,_6a);
}
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_6d,_6e,_6f,_70){
with(_6d){
var _71=objj_msgSend(_6d,"objectEnumerator"),_72;
while(_72=objj_msgSend(_71,"nextObject")){
objj_msgSend(_72,"setValue:forKeyPath:",_6f,_70);
}
}
})]);
var _62=[];
var _73,_74,_75,_76,_77;
_62["avg"]=_73=function(_78,_79,_7a){
var _7b=objj_msgSend(_78,"valueForKeyPath:",_7a),_7c=objj_msgSend(_7b,"count"),_7d=_7c;
average=0;
if(!_7c){
return 0;
}
while(_7d--){
average+=objj_msgSend(_7b[_7d],"doubleValue");
}
return average/_7c;
};
_62["max"]=_74=function(_7e,_7f,_80){
var _81=objj_msgSend(_7e,"valueForKeyPath:",_80),_82=objj_msgSend(_81,"count")-1,max=objj_msgSend(_81,"lastObject");
while(_82--){
var _83=_81[_82];
if(objj_msgSend(max,"compare:",_83)<0){
max=_83;
}
}
return max;
};
_62["min"]=_75=function(_84,_85,_86){
var _87=objj_msgSend(_84,"valueForKeyPath:",_86),_88=objj_msgSend(_87,"count")-1,min=objj_msgSend(_87,"lastObject");
while(_88--){
var _89=_87[_88];
if(objj_msgSend(min,"compare:",_89)>0){
min=_89;
}
}
return min;
};
_62["count"]=_76=function(_8a,_8b,_8c){
return objj_msgSend(_8a,"count");
};
_62["sum"]=_77=function(_8d,_8e,_8f){
var _90=objj_msgSend(_8d,"valueForKeyPath:",_8f),_91=objj_msgSend(_90,"count"),sum=0;
while(_91--){
sum+=objj_msgSend(_90[_91],"doubleValue");
}
return sum;
};
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addObserver:toObjectsAtIndexes:forKeyPath:options:context:"),function(_92,_93,_94,_95,_96,_97,_98){
with(_92){
var _99=objj_msgSend(_95,"firstIndex");
while(_99>=0){
objj_msgSend(_92[_99],"addObserver:forKeyPath:options:context:",_94,_96,_97,_98);
_99=objj_msgSend(_95,"indexGreaterThanIndex:",_99);
}
}
}),new objj_method(sel_getUid("removeObserver:fromObjectsAtIndexes:forKeyPath:"),function(_9a,_9b,_9c,_9d,_9e){
with(_9a){
var _9f=objj_msgSend(_9d,"firstIndex");
while(_9f>=0){
objj_msgSend(_9a[_9f],"removeObserver:forKeyPath:",_9c,_9e);
_9f=objj_msgSend(_9d,"indexGreaterThanIndex:",_9f);
}
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_a0,_a1,_a2,_a3,_a4,_a5){
with(_a0){
if(objj_msgSend(isa,"instanceMethodForSelector:",_a1)===objj_msgSend(CPArray,"instanceMethodForSelector:",_a1)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unsupported method on CPArray");
}else{
objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPArray").super_class},"addObserver:forKeyPath:options:context:",_a2,_a3,_a4,_a5);
}
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_a6,_a7,_a8,_a9){
with(_a6){
if(objj_msgSend(isa,"instanceMethodForSelector:",_a7)===objj_msgSend(CPArray,"instanceMethodForSelector:",_a7)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unsupported method on CPArray");
}else{
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPArray").super_class},"removeObserver:forKeyPath:",_a8,_a9);
}
}
})]);
p;9;CPArray.jt;21105;@STATIC;1.0;i;14;CPEnumerator.ji;13;CPException.ji;10;CPObject.ji;9;CPRange.ji;18;CPSortDescriptor.jt;20997;
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
CPEnumerationNormal=0;
CPEnumerationConcurrent=1<<0;
CPEnumerationReverse=1<<1;
var _1=objj_allocateClassPair(CPEnumerator,"_CPArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPArrayEnumerator").super_class},"init");
if(_3){
_array=_5;
_index=-1;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
if(++_index>=objj_msgSend(_array,"count")){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPEnumerator,"_CPReverseArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("_CPReverseArrayEnumerator").super_class},"init");
if(_8){
_array=_a;
_index=objj_msgSend(_array,"count");
}
return _8;
}
}),new objj_method(sel_getUid("nextObject"),function(_b,_c){
with(_b){
if(--_index<0){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPArray"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPArray").super_class},"init");
if(_f){
objj_msgSend(_f,"setArray:",_11);
}
return _f;
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_12,_13,_14,_15){
with(_12){
if(!_15){
return objj_msgSend(_12,"initWithArray:",_14);
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPArray").super_class},"init");
if(_12){
var _16=0,_17=objj_msgSend(_14,"count");
for(;_16<_17;++_16){
if(_14[_16].isa){
_12[_16]=objj_msgSend(_14[_16],"copy");
}else{
_12[_16]=_14[_16];
}
}
}
return _12;
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_18,_19,_1a){
with(_18){
var i=2,_1b=arguments.length;
for(;i<_1b;++i){
push(arguments[i]);
}
return _18;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_1c,_1d,_1e,_1f){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPArray").super_class},"init");
if(_1c){
var _20=0;
for(;_20<_1f;++_20){
push(_1e[_20]);
}
}
return _1c;
}
}),new objj_method(sel_getUid("containsObject:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(_21,"indexOfObject:",_23)!=CPNotFound;
}
}),new objj_method(sel_getUid("count"),function(_24,_25){
with(_24){
return length;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_26,_27,_28){
with(_26){
var i=0,_29=length;
if(_28&&_28.isa){
for(;i<_29;++i){
if(objj_msgSend(_26[i],"isEqual:",_28)){
return i;
}
}
}else{
if(_26.indexOf){
return indexOf(_28);
}else{
for(;i<_29;++i){
if(_26[i]===_28){
return i;
}
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_2a,_2b,_2c,_2d){
with(_2a){
var i=_2d.location,_2e=MIN(CPMaxRange(_2d),length);
if(_2c&&_2c.isa){
for(;i<_2e;++i){
if(objj_msgSend(_2a[i],"isEqual:",_2c)){
return i;
}
}
}else{
for(;i<_2e;++i){
if(_2a[i]===_2c){
return i;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_2f,_30,_31){
with(_2f){
if(_2f.indexOf){
return indexOf(_31);
}else{
var _32=0,_33=length;
for(;_32<_33;++_32){
if(_2f[_32]===_31){
return _32;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_34,_35,_36,_37){
with(_34){
if(_34.indexOf){
var _38=indexOf(_36,_37.location);
if(CPLocationInRange(_38,_37)){
return _38;
}
}else{
var _38=_37.location,_39=MIN(CPMaxRange(_37),length);
for(;_38<_39;++_38){
if(_34[_38]==_36){
return _38;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectPassingTest:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(_3a,"indexOfObjectWithOptions:passingTest:context:",CPEnumerationNormal,_3c,undefined);
}
}),new objj_method(sel_getUid("indexOfObjectPassingTest:context:"),function(_3d,_3e,_3f,_40){
with(_3d){
return objj_msgSend(_3d,"indexOfObjectWithOptions:passingTest:context:",CPEnumerationNormal,_3f,_40);
}
}),new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:"),function(_41,_42,_43,_44){
with(_41){
return objj_msgSend(_41,"indexOfObjectWithOptions:passingTest:context:",_43,_44,undefined);
}
}),new objj_method(sel_getUid("indexOfObjectWithOptions:passingTest:context:"),function(_45,_46,_47,_48,_49){
with(_45){
var _4a,_4b,_4c;
if(_47&CPEnumerationReverse){
_4a=objj_msgSend(_45,"count")-1;
_4b=-1;
_4c=-1;
}else{
_4a=0;
_4b=objj_msgSend(_45,"count");
_4c=1;
}
for(var i=_4a;i!=_4b;i+=_4c){
var _4d=_48(objj_msgSend(_45,"objectAtIndex:",i),i,_49);
if(typeof _4d==="boolean"&&_4d){
return i;
}else{
if(typeof _4d==="object"&&_4d==nil){
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:sortedBySelector:"),function(_4e,_4f,_50,_51){
with(_4e){
return objj_msgSend(_4e,"indexOfObject:sortedByFunction:",_50,function(lhs,rhs){
objj_msgSend(lhs,_51,rhs);
});
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:"),function(_52,_53,_54,_55){
with(_52){
return objj_msgSend(_52,"indexOfObject:sortedByFunction:context:",_54,_55,nil);
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"),function(_56,_57,_58,_59,_5a){
with(_56){
var _5b=objj_msgSend(_56,"_indexOfObject:sortedByFunction:context:",_58,_59,_5a);
return _5b>=0?_5b:CPNotFound;
}
}),new objj_method(sel_getUid("_indexOfObject:sortedByFunction:context:"),function(_5c,_5d,_5e,_5f,_60){
with(_5c){
if(!_5f){
return CPNotFound;
}
if(length===0){
return -1;
}
var mid,c,_61=0,_62=length-1;
while(_61<=_62){
mid=FLOOR((_61+_62)/2);
c=_5f(_5e,_5c[mid],_60);
if(c>0){
_61=mid+1;
}else{
if(c<0){
_62=mid-1;
}else{
while(mid<length-1&&_5f(_5e,_5c[mid+1],_60)==CPOrderedSame){
mid++;
}
return mid;
}
}
}
return -_61-1;
}
}),new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"),function(_63,_64,_65,_66){
with(_63){
var _67=objj_msgSend(_66,"count");
return objj_msgSend(_63,"indexOfObject:sortedByFunction:",_65,function(lhs,rhs){
var i=0,_68=CPOrderedSame;
while(i<_67){
if((_68=objj_msgSend(_66[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _68;
}
}
return _68;
});
}
}),new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"),function(_69,_6a,_6b,_6c){
with(_69){
if(!_6c||!objj_msgSend(_6c,"count")){
objj_msgSend(_69,"addObject:",_6b);
return objj_msgSend(_69,"count")-1;
}
var _6d=objj_msgSend(_69,"_insertObject:sortedByFunction:context:",_6b,function(lhs,rhs){
var i=0,_6e=objj_msgSend(_6c,"count"),_6f=CPOrderedSame;
while(i<_6e){
if((_6f=objj_msgSend(_6c[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _6f;
}
}
return _6f;
},nil);
if(_6d<0){
_6d=-result-1;
}
objj_msgSend(_69,"insertObject:atIndex:",_6b,_6d);
return _6d;
}
}),new objj_method(sel_getUid("lastObject"),function(_70,_71){
with(_70){
var _72=objj_msgSend(_70,"count");
if(!_72){
return nil;
}
return _70[_72-1];
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_73,_74,_75){
with(_73){
if(_75>=length||_75<0){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"index ("+_75+") beyond bounds ("+length+")");
}
return _73[_75];
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_76,_77,_78){
with(_76){
var _79=CPNotFound,_7a=[];
while((_79=objj_msgSend(_78,"indexGreaterThanIndex:",_79))!==CPNotFound){
objj_msgSend(_7a,"addObject:",objj_msgSend(_76,"objectAtIndex:",_79));
}
return _7a;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_7b,_7c){
with(_7b){
return objj_msgSend(objj_msgSend(_CPArrayEnumerator,"alloc"),"initWithArray:",_7b);
}
}),new objj_method(sel_getUid("reverseObjectEnumerator"),function(_7d,_7e){
with(_7d){
return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator,"alloc"),"initWithArray:",_7d);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_7f,_80,_81){
with(_7f){
if(!_81){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector: 'aSelector' can't be nil");
}
var _82=0,_83=length;
for(;_82<_83;++_82){
objj_msgSend(_7f[_82],_81);
}
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_84,_85,_86,_87){
with(_84){
if(!_86){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
}
var _88=0,_89=length;
for(;_88<_89;++_88){
objj_msgSend(_84[_88],_86,_87);
}
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObjects:"),function(_8a,_8b,_8c,_8d){
with(_8a){
if(!_8c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObjects: 'aSelector' can't be nil");
}
var _8e=0,_8f=length,_90=[nil,_8c].concat(_8d||[]);
for(;_8e<_8f;++_8e){
_90[0]=_8a[_8e];
objj_msgSend.apply(this,_90);
}
}
}),new objj_method(sel_getUid("firstObjectCommonWithArray:"),function(_91,_92,_93){
with(_91){
if(!objj_msgSend(_93,"count")||!objj_msgSend(_91,"count")){
return nil;
}
var i=0,_94=objj_msgSend(_91,"count");
for(;i<_94;++i){
if(objj_msgSend(_93,"containsObject:",_91[i])){
return _91[i];
}
}
return nil;
}
}),new objj_method(sel_getUid("isEqualToArray:"),function(_95,_96,_97){
with(_95){
if(_95===_97){
return YES;
}
if(_97===nil||length!==_97.length){
return NO;
}
var _98=0,_99=objj_msgSend(_95,"count");
for(;_98<_99;++_98){
var lhs=_95[_98],rhs=_97[_98];
if(lhs!==rhs&&(lhs&&!lhs.isa||rhs&&!rhs.isa||!objj_msgSend(lhs,"isEqual:",rhs))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_9a,_9b,_9c){
with(_9a){
if(_9a===_9c){
return YES;
}
if(!objj_msgSend(_9c,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return NO;
}
return objj_msgSend(_9a,"isEqualToArray:",_9c);
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=objj_msgSend(_9d,"copy");
_a0.push(_9f);
return _a0;
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_a1,_a2,_a3){
with(_a1){
return slice(0).concat(_a3);
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_a4,_a5,_a6){
with(_a4){
if(_a6.location<0||CPMaxRange(_a6)>length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"subarrayWithRange: aRange out of bounds");
}
return slice(_a6.location,CPMaxRange(_a6));
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_a7,_a8,_a9){
with(_a7){
var _aa=objj_msgSend(_a7,"copy");
objj_msgSend(_aa,"sortUsingDescriptors:",_a9);
return _aa;
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:"),function(_ab,_ac,_ad){
with(_ab){
return objj_msgSend(_ab,"sortedArrayUsingFunction:context:",_ad,nil);
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:context:"),function(_ae,_af,_b0,_b1){
with(_ae){
var _b2=objj_msgSend(_ae,"copy");
objj_msgSend(_b2,"sortUsingFunction:context:",_b0,_b1);
return _b2;
}
}),new objj_method(sel_getUid("sortedArrayUsingSelector:"),function(_b3,_b4,_b5){
with(_b3){
var _b6=objj_msgSend(_b3,"copy");
objj_msgSend(_b6,"sortUsingSelector:",_b5);
return _b6;
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_b7,_b8,_b9){
with(_b7){
return join(_b9);
}
}),new objj_method(sel_getUid("description"),function(_ba,_bb){
with(_ba){
var _bc=0,_bd=objj_msgSend(_ba,"count"),_be="(";
for(;_bc<_bd;++_bc){
if(_bc===0){
_be+="\n";
}
var _bf=objj_msgSend(_ba,"objectAtIndex:",_bc),_c0=_bf&&_bf.isa?objj_msgSend(_bf,"description"):String(_bf);
_be+="\t"+_c0.split("\n").join("\n\t");
if(_bc!==_bd-1){
_be+=", ";
}
_be+="\n";
}
return _be+")";
}
}),new objj_method(sel_getUid("pathsMatchingExtensions:"),function(_c1,_c2,_c3){
with(_c1){
var _c4=0,_c5=objj_msgSend(_c1,"count"),_c6=[];
for(;_c4<_c5;++_c4){
if(_c1[_c4].isa&&objj_msgSend(_c1[_c4],"isKindOfClass:",objj_msgSend(CPString,"class"))&&objj_msgSend(_c3,"containsObject:",objj_msgSend(_c1[_c4],"pathExtension"))){
_c6.push(_c1[_c4]);
}
}
return _c6;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_c7,_c8,_c9,_ca){
with(_c7){
var i=0,_cb=objj_msgSend(_c7,"count");
for(;i<_cb;++i){
objj_msgSend(_c7[i],"setValue:forKey:",_c9,_ca);
}
}
}),new objj_method(sel_getUid("valueForKey:"),function(_cc,_cd,_ce){
with(_cc){
var i=0,_cf=objj_msgSend(_cc,"count"),_d0=[];
for(;i<_cf;++i){
_d0.push(objj_msgSend(_cc[i],"valueForKey:",_ce));
}
return _d0;
}
}),new objj_method(sel_getUid("copy"),function(_d1,_d2){
with(_d1){
return slice(0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_d3,_d4){
with(_d3){
return [];
}
}),new objj_method(sel_getUid("array"),function(_d5,_d6){
with(_d5){
return objj_msgSend(objj_msgSend(_d5,"alloc"),"init");
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_d7,_d8,_d9){
with(_d7){
return objj_msgSend(objj_msgSend(_d7,"alloc"),"initWithArray:",_d9);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_da,_db,_dc){
with(_da){
return objj_msgSend(objj_msgSend(_da,"alloc"),"initWithObjects:",_dc);
}
}),new objj_method(sel_getUid("arrayWithObjects:"),function(_dd,_de,_df){
with(_dd){
var i=2,_e0=objj_msgSend(objj_msgSend(_dd,"alloc"),"init"),_e1=arguments.length;
for(;i<_e1;++i){
_e0.push(arguments[i]);
}
return _e0;
}
}),new objj_method(sel_getUid("arrayWithObjects:count:"),function(_e2,_e3,_e4,_e5){
with(_e2){
return objj_msgSend(objj_msgSend(_e2,"alloc"),"initWithObjects:count:",_e4,_e5);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCapacity:"),function(_e6,_e7,_e8){
with(_e6){
return _e6;
}
}),new objj_method(sel_getUid("addObject:"),function(_e9,_ea,_eb){
with(_e9){
push(_eb);
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_ec,_ed,_ee){
with(_ec){
splice.apply(_ec,[length,0].concat(_ee));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_ef,_f0,_f1,_f2){
with(_ef){
splice(_f2,0,_f1);
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_f3,_f4,_f5,_f6){
with(_f3){
var _f7=objj_msgSend(_f6,"count"),_f8=objj_msgSend(_f5,"count");
if(_f7!==_f8){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the counts of the passed-in array ("+_f8+") and index set ("+_f7+") must be identical.");
}
var _f9=objj_msgSend(_f6,"lastIndex");
if(_f9>=objj_msgSend(_f3,"count")+_f7){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the last index ("+_f9+") must be less than the sum of the original count ("+objj_msgSend(_f3,"count")+") and the insertion count ("+_f7+").");
}
var _fa=0,_fb=objj_msgSend(_f6,"firstIndex");
for(;_fa<_f8;++_fa,_fb=objj_msgSend(_f6,"indexGreaterThanIndex:",_fb)){
objj_msgSend(_f3,"insertObject:atIndex:",_f5[_fa],_fb);
}
}
}),new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"),function(_fc,_fd,_fe,_ff){
with(_fc){
var _100=objj_msgSend(_ff,"count");
var _101=objj_msgSend(_fc,"_indexOfObject:sortedByFunction:context:",_fe,function(lhs,rhs){
var i=0,_102=CPOrderedSame;
while(i<_100){
if((_102=objj_msgSend(_ff[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _102;
}
}
return _102;
},nil);
if(_101<0){
_101=-_101-1;
}
objj_msgSend(_fc,"insertObject:atIndex:",_fe,_101);
return _101;
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(self,_103,_104,_105){
with(self){
self[_104]=_105;
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(self,_106,_107,_108){
with(self){
var i=0,_109=objj_msgSend(_107,"firstIndex");
while(_109!=CPNotFound){
objj_msgSend(self,"replaceObjectAtIndex:withObject:",_109,_108[i++]);
_109=objj_msgSend(_107,"indexGreaterThanIndex:",_109);
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(self,_10a,_10b,_10c,_10d){
with(self){
if(!_10d.location&&_10d.length==objj_msgSend(_10c,"count")){
objj_msgSend(self,"replaceObjectsInRange:withObjectsFromArray:",_10b,_10c);
}else{
splice.apply(self,[_10b.location,_10b.length].concat(objj_msgSend(_10c,"subarrayWithRange:",_10d)));
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"),function(self,_10e,_10f,_110){
with(self){
splice.apply(self,[_10f.location,_10f.length].concat(_110));
}
}),new objj_method(sel_getUid("setArray:"),function(self,_111,_112){
with(self){
if(self==_112){
return;
}
splice.apply(self,[0,length].concat(_112));
}
}),new objj_method(sel_getUid("removeAllObjects"),function(self,_113){
with(self){
splice(0,length);
}
}),new objj_method(sel_getUid("removeLastObject"),function(self,_114){
with(self){
pop();
}
}),new objj_method(sel_getUid("removeObject:"),function(self,_115,_116){
with(self){
objj_msgSend(self,"removeObject:inRange:",_116,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(self,_117,_118,_119){
with(self){
var _11a;
while((_11a=objj_msgSend(self,"indexOfObject:inRange:",_118,_119))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_11a);
_119=CPIntersectionRange(CPMakeRange(_11a,length-_11a),_119);
}
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(self,_11b,_11c){
with(self){
splice(_11c,1);
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(self,_11d,_11e){
with(self){
var _11f=objj_msgSend(_11e,"lastIndex");
while(_11f!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_11f);
_11f=objj_msgSend(_11e,"indexLessThanIndex:",_11f);
}
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:"),function(self,_120,_121){
with(self){
objj_msgSend(self,"removeObjectIdenticalTo:inRange:",_121,CPMakeRange(0,objj_msgSend(self,"count")));
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"),function(self,_122,_123,_124){
with(self){
var _125,_126=objj_msgSend(self,"count");
while((_125=objj_msgSend(self,"indexOfObjectIdenticalTo:inRange:",_123,_124))!==CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_125);
_124=CPIntersectionRange(CPMakeRange(_125,(--_126)-_125),_124);
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(self,_127,_128){
with(self){
var _129=0,_12a=objj_msgSend(_128,"count");
for(;_129<_12a;++_129){
objj_msgSend(self,"removeObject:",_128[_129]);
}
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(self,_12b,_12c){
with(self){
splice(_12c.location,_12c.length);
}
}),new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"),function(self,_12d,_12e,_12f){
with(self){
var _130=self[_12e];
self[_12e]=self[_12f];
self[_12f]=_130;
}
}),new objj_method(sel_getUid("sortUsingDescriptors:"),function(self,_131,_132){
with(self){
objj_msgSend(self,"sortUsingFunction:context:",_133,_132);
}
}),new objj_method(sel_getUid("sortUsingFunction:context:"),function(self,_134,_135,_136){
with(self){
var h,i,j,k,l,m,n=objj_msgSend(self,"count"),o;
var A,B=[];
for(h=1;h<n;h+=h){
for(m=n-1-h;m>=0;m-=h+h){
l=m-h+1;
if(l<0){
l=0;
}
for(i=0,j=l;j<=m;i++,j++){
B[i]=self[j];
}
for(i=0,k=l;k<j&&j<=m+h;k++){
A=self[j];
o=_135(A,B[i],_136);
if(o==CPOrderedDescending||o==CPOrderedSame){
self[k]=B[i++];
}else{
self[k]=A;
j++;
}
}
while(k<j){
self[k++]=B[i++];
}
}
}
}
}),new objj_method(sel_getUid("sortUsingSelector:"),function(self,_137,_138){
with(self){
objj_msgSend(self,"sortUsingFunction:context:",_139,_138);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("arrayWithCapacity:"),function(self,_13a,_13b){
with(self){
return objj_msgSend(objj_msgSend(self,"alloc"),"initWithCapacity:",_13b);
}
})]);
var _139=_139=function(_13c,_13d,_13e){
return objj_msgSend(_13c,"performSelector:withObject:",_13e,_13d);
};
var _133=_133=function(lhs,rhs,_13f){
var _140=CPOrderedSame,i=0,n=objj_msgSend(_13f,"count");
while(i<n&&_140===CPOrderedSame){
_140=objj_msgSend(_13f[i++],"compareObject:withObject:",lhs,rhs);
}
return _140;
};
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(self,_141,_142){
with(self){
return objj_msgSend(_142,"decodeObjectForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_143,_144){
with(self){
objj_msgSend(_144,"_encodeArrayOfObjects:forKey:",self,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPArray,"CPMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
Array.prototype.isa=CPArray;
objj_msgSend(CPArray,"initialize");
p;20;CPAttributedString.jt;12419;@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.ji;9;CPRange.ji;10;CPString.jt;12337;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPAttributedString"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_string"),new objj_ivar("_rangeEntries")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithString:attributes:",_5,nil);
}
}),new objj_method(sel_getUid("initWithAttributedString:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"initWithString:attributes:","",nil);
objj_msgSend(_9,"setAttributedString:",_8);
return _9;
}
}),new objj_method(sel_getUid("initWithString:attributes:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPAttributedString").super_class},"init");
if(_a){
if(!_d){
_d=objj_msgSend(CPDictionary,"dictionary");
}
_string=""+_c;
_rangeEntries=[_e(CPMakeRange(0,_string.length),_d)];
}
return _a;
}
}),new objj_method(sel_getUid("string"),function(_f,_10){
with(_f){
return _string;
}
}),new objj_method(sel_getUid("mutableString"),function(_11,_12){
with(_11){
return objj_msgSend(_11,"string");
}
}),new objj_method(sel_getUid("length"),function(_13,_14){
with(_13){
return _string.length;
}
}),new objj_method(sel_getUid("_indexOfEntryWithIndex:"),function(_15,_16,_17){
with(_15){
if(_17<0||_17>_string.length||_17===undefined){
return CPNotFound;
}
var _18=function(_19,_1a){
if(CPLocationInRange(_19,_1a.range)){
return CPOrderedSame;
}else{
if(CPMaxRange(_1a.range)<=_19){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
};
return objj_msgSend(_rangeEntries,"indexOfObject:sortedByFunction:",_17,_18);
}
}),new objj_method(sel_getUid("attributesAtIndex:effectiveRange:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=objj_msgSend(_1b,"_indexOfEntryWithIndex:",_1d);
if(_1f==CPNotFound){
return nil;
}
var _20=_rangeEntries[_1f];
if(_1e){
_1e.location=_20.range.location;
_1e.length=_20.range.length;
}
return _20.attributes;
}
}),new objj_method(sel_getUid("attributesAtIndex:longestEffectiveRange:inRange:"),function(_21,_22,_23,_24,_25){
with(_21){
var _26=objj_msgSend(_21,"_indexOfEntryWithIndex:",_23);
if(_26==CPNotFound){
return nil;
}
if(!_24){
return _rangeEntries[_26].attributes;
}
if(CPRangeInRange(_rangeEntries[_26].range,_25)){
_24.location=_25.location;
_24.length=_25.length;
return _rangeEntries[_26].attributes;
}
var _27=_26-1,_28=_rangeEntries[_26],_29=_28.attributes;
while(_27>=0){
var _2a=_rangeEntries[_27];
if(CPMaxRange(_2a.range)>_25.location&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27--;
}else{
break;
}
}
_24.location=MAX(_28.range.location,_25.location);
_28=_rangeEntries[_26];
_27=_26+1;
while(_27<_rangeEntries.length){
var _2a=_rangeEntries[_27];
if(_2a.range.location<CPMaxRange(_25)&&objj_msgSend(_2a.attributes,"isEqualToDictionary:",_29)){
_28=_2a;
_27++;
}else{
break;
}
}
_24.length=MIN(CPMaxRange(_28.range),CPMaxRange(_25))-_24.location;
return _29;
}
}),new objj_method(sel_getUid("attribute:atIndex:effectiveRange:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
if(!_2d){
if(_2f){
_2f.location=0;
_2f.length=_string.length;
}
return nil;
}
return objj_msgSend(objj_msgSend(_2b,"attributesAtIndex:effectiveRange:",_2e,_2f),"valueForKey:",_2d);
}
}),new objj_method(sel_getUid("attribute:atIndex:longestEffectiveRange:inRange:"),function(_30,_31,_32,_33,_34,_35){
with(_30){
var _36=objj_msgSend(_30,"_indexOfEntryWithIndex:",_33);
if(_36==CPNotFound||!_32){
return nil;
}
if(!_34){
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
if(CPRangeInRange(_rangeEntries[_36].range,_35)){
_34.location=_35.location;
_34.length=_35.length;
return objj_msgSend(_rangeEntries[_36].attributes,"objectForKey:",_32);
}
var _37=_36-1,_38=_rangeEntries[_36],_39=objj_msgSend(_38.attributes,"objectForKey:",_32);
while(_37>=0){
var _3a=_rangeEntries[_37];
if(CPMaxRange(_3a.range)>_35.location&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37--;
}else{
break;
}
}
_34.location=MAX(_38.range.location,_35.location);
_38=_rangeEntries[_36];
_37=_36+1;
while(_37<_rangeEntries.length){
var _3a=_rangeEntries[_37];
if(_3a.range.location<CPMaxRange(_35)&&_3b(_39,objj_msgSend(_3a.attributes,"objectForKey:",_32))){
_38=_3a;
_37++;
}else{
break;
}
}
_34.length=MIN(CPMaxRange(_38.range),CPMaxRange(_35))-_34.location;
return _39;
}
}),new objj_method(sel_getUid("isEqualToAttributedString:"),function(_3c,_3d,_3e){
with(_3c){
if(!_3e){
return NO;
}
if(_string!=objj_msgSend(_3e,"string")){
return NO;
}
var _3f=CPMakeRange(),_40=CPMakeRange(),_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",0,_3f),_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",0,_40),_43=_string.length;
while(CPMaxRange(CPUnionRange(_3f,_40))<_43){
if(CPIntersectionRange(_3f,_40).length>0&&!objj_msgSend(_41,"isEqualToDictionary:",_42)){
return NO;
}
if(CPMaxRange(_3f)<CPMaxRange(_40)){
_41=objj_msgSend(_3c,"attributesAtIndex:effectiveRange:",CPMaxRange(_3f),_3f);
}else{
_42=objj_msgSend(_3e,"attributesAtIndex:effectiveRange:",CPMaxRange(_40),_40);
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_44,_45,_46){
with(_44){
if(_46==_44){
return YES;
}
if(objj_msgSend(_46,"isKindOfClass:",objj_msgSend(_44,"class"))){
return objj_msgSend(_44,"isEqualToAttributedString:",_46);
}
return NO;
}
}),new objj_method(sel_getUid("attributedSubstringFromRange:"),function(_47,_48,_49){
with(_47){
if(!_49||CPMaxRange(_49)>_string.length||_49.location<0){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to get attributedSubstring for an invalid range: "+(_49?CPStringFromRange(_49):"nil"));
}
var _4a=objj_msgSend(objj_msgSend(CPAttributedString,"alloc"),"initWithString:",_string.substring(_49.location,CPMaxRange(_49))),_4b=objj_msgSend(_47,"_indexOfEntryWithIndex:",_49.location),_4c=_rangeEntries[_4b],_4d=CPMaxRange(_49);
_4a._rangeEntries=[];
while(_4c&&CPMaxRange(_4c.range)<_4d){
var _4e=_4f(_4c);
_4e.range.location-=_49.location;
if(_4e.range.location<0){
_4e.range.length+=_4e.range.location;
_4e.range.location=0;
}
_4a._rangeEntries.push(_4e);
_4c=_rangeEntries[++_4b];
}
if(_4c){
var _50=_4f(_4c);
_50.range.length=CPMaxRange(_49)-_50.range.location;
_50.range.location-=_49.location;
if(_50.range.location<0){
_50.range.length+=_50.range.location;
_50.range.location=0;
}
_4a._rangeEntries.push(_50);
}
return _4a;
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withString:"),function(_51,_52,_53,_54){
with(_51){
if(!_54){
_54="";
}
var _55=objj_msgSend(_51,"_indexOfEntryWithIndex:",_53.location),_56=_rangeEntries[_55],_57=objj_msgSend(_51,"_indexOfEntryWithIndex:",MAX(CPMaxRange(_53)-1,0)),_58=_rangeEntries[_57],_59=_54.length-_53.length;
_string=_string.substring(0,_53.location)+_54+_string.substring(CPMaxRange(_53));
if(_55==_57){
_56.range.length+=_59;
}else{
_58.range.length=CPMaxRange(_58.range)-CPMaxRange(_53);
_58.range.location=CPMaxRange(_53);
_56.range.length=CPMaxRange(_53)-_56.range.location;
_rangeEntries.splice(_55,_57-_55);
}
_57=_55+1;
while(_57<_rangeEntries.length){
_rangeEntries[_57++].range.location+=_59;
}
}
}),new objj_method(sel_getUid("deleteCharactersInRange:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_5a,"replaceCharactersInRange:withString:",_5c,nil);
}
}),new objj_method(sel_getUid("setAttributes:range:"),function(_5d,_5e,_5f,_60){
with(_5d){
var _61=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_60.location,YES),_62=objj_msgSend(_5d,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_60),YES),_63=_61;
if(_62==CPNotFound){
_62=_rangeEntries.length;
}
while(_63<_62){
_rangeEntries[_63++].attributes=objj_msgSend(_5f,"copy");
}
objj_msgSend(_5d,"_coalesceRangeEntriesFromIndex:toIndex:",_61,_62);
}
}),new objj_method(sel_getUid("addAttributes:range:"),function(_64,_65,_66,_67){
with(_64){
var _68=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_67.location,YES),_69=objj_msgSend(_64,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_67),YES),_6a=_68;
if(_69==CPNotFound){
_69=_rangeEntries.length;
}
while(_6a<_69){
var _6b=objj_msgSend(_66,"allKeys"),_6c=objj_msgSend(_6b,"count");
while(_6c--){
objj_msgSend(_rangeEntries[_6a].attributes,"setObject:forKey:",objj_msgSend(_66,"objectForKey:",_6b[_6c]),_6b[_6c]);
}
_6a++;
}
objj_msgSend(_64,"_coalesceRangeEntriesFromIndex:toIndex:",_68,_69);
}
}),new objj_method(sel_getUid("addAttribute:value:range:"),function(_6d,_6e,_6f,_70,_71){
with(_6d){
objj_msgSend(_6d,"addAttributes:range:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_70,_6f),_71);
}
}),new objj_method(sel_getUid("removeAttribute:range:"),function(_72,_73,_74,_75){
with(_72){
var _76=objj_msgSend(_72,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_75.location,YES),_77=objj_msgSend(_72,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",CPMaxRange(_75),YES),_78=_76;
if(_77==CPNotFound){
_77=_rangeEntries.length;
}
while(_78<_77){
objj_msgSend(_rangeEntries[_78++].attributes,"removeObjectForKey:",_74);
}
objj_msgSend(_72,"_coalesceRangeEntriesFromIndex:toIndex:",_76,_77);
}
}),new objj_method(sel_getUid("appendAttributedString:"),function(_79,_7a,_7b){
with(_79){
objj_msgSend(_79,"insertAttributedString:atIndex:",_7b,_string.length);
}
}),new objj_method(sel_getUid("insertAttributedString:atIndex:"),function(_7c,_7d,_7e,_7f){
with(_7c){
if(_7f<0||_7f>objj_msgSend(_7c,"length")){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"tried to insert attributed string at an invalid index: "+_7f);
}
var _80=objj_msgSend(_7c,"_indexOfRangeEntryForIndex:splitOnMaxIndex:",_7f,YES),_81=_7e._rangeEntries,_82=objj_msgSend(_7e,"length");
if(_80==CPNotFound){
_80=_rangeEntries.length;
}
_string=_string.substring(0,_7f)+_7e._string+_string.substring(_7f);
var _83=_80;
while(_83<_rangeEntries.length){
_rangeEntries[_83++].range.location+=_82;
}
var _84=_81.length,_85=0;
while(_85<_84){
var _86=_4f(_81[_85++]);
_86.range.location+=_7f;
_rangeEntries.splice(_80-1+_85,0,_86);
}
}
}),new objj_method(sel_getUid("replaceCharactersInRange:withAttributedString:"),function(_87,_88,_89,_8a){
with(_87){
objj_msgSend(_87,"deleteCharactersInRange:",_89);
objj_msgSend(_87,"insertAttributedString:atIndex:",_8a,_89.location);
}
}),new objj_method(sel_getUid("setAttributedString:"),function(_8b,_8c,_8d){
with(_8b){
_string=_8d._string;
_rangeEntries=[];
var i=0,_8e=_8d._rangeEntries.length;
for(;i<_8e;i++){
_rangeEntries.push(_4f(_8d._rangeEntries[i]));
}
}
}),new objj_method(sel_getUid("_indexOfRangeEntryForIndex:splitOnMaxIndex:"),function(_8f,_90,_91,_92){
with(_8f){
var _93=objj_msgSend(_8f,"_indexOfEntryWithIndex:",_91);
if(_93<0){
return _93;
}
var _94=_rangeEntries[_93];
if(_94.range.location==_91||(CPMaxRange(_94.range)-1==_91&&!_92)){
return _93;
}
var _95=splitRangeEntryAtIndex(_94,_91);
_rangeEntries.splice(_93,1,_95[0],_95[1]);
_93++;
return _93;
}
}),new objj_method(sel_getUid("_coalesceRangeEntriesFromIndex:toIndex:"),function(_96,_97,_98,end){
with(_96){
var _99=_98;
if(end>=_rangeEntries.length){
end=_rangeEntries.length-1;
}
while(_99<end){
var a=_rangeEntries[_99],b=_rangeEntries[_99+1];
if(objj_msgSend(a.attributes,"isEqualToDictionary:",b.attributes)){
a.range.length=CPMaxRange(b.range)-a.range.location;
_rangeEntries.splice(_99+1,1);
end--;
}else{
_99++;
}
}
}
}),new objj_method(sel_getUid("beginEditing"),function(_9a,_9b){
with(_9a){
}
}),new objj_method(sel_getUid("endEditing"),function(_9c,_9d){
with(_9c){
}
})]);
var _1=objj_allocateClassPair(CPAttributedString,"CPMutableAttributedString"),_2=_1.isa;
objj_registerClassPair(_1);
var _3b=_3b=function(a,b){
if(a==b){
return YES;
}
if(objj_msgSend(a,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(a,"isEqual:",b)){
return YES;
}
return NO;
};
var _e=_e=function(_9e,_9f){
return {range:_9e,attributes:objj_msgSend(_9f,"copy")};
};
var _4f=_4f=function(_a0){
return _e(CPCopyRange(_a0.range),objj_msgSend(_a0.attributes,"copy"));
};
var _a1=splitRangeEntryAtIndex=function(_a2,_a3){
var _a4=_4f(_a2),_a5=CPMaxRange(_a2.range);
_a2.range.length=_a3-_a2.range.location;
_a4.range.location=_a3;
_a4.range.length=_a5-_a3;
_a4.attributes=objj_msgSend(_a4.attributes,"copy");
return [_a2,_a4];
};
p;10;CPBundle.jt;3820;@STATIC;1.0;i;14;CPDictionary.ji;10;CPObject.jt;3767;
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPObject.j",YES);
var _1={};
var _2=objj_allocateClassPair(CPObject,"CPBundle"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_bundle"),new objj_ivar("_delegate")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithURL:"),function(_4,_5,_6){
with(_4){
_6=new CFURL(_6);
var _7=_6.absoluteString(),_8=_1[_7];
if(_8){
return _8;
}
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPBundle").super_class},"init");
if(_4){
_bundle=new CFBundle(_6);
_1[_7]=_4;
}
return _4;
}
}),new objj_method(sel_getUid("initWithPath:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"initWithURL:",_b);
}
}),new objj_method(sel_getUid("classNamed:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("bundleURL"),function(_f,_10){
with(_f){
return _bundle.bundleURL();
}
}),new objj_method(sel_getUid("bundlePath"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"bundleURL"),"path");
}
}),new objj_method(sel_getUid("resourcePath"),function(_13,_14){
with(_13){
return objj_msgSend(objj_msgSend(_13,"resourceURL"),"path");
}
}),new objj_method(sel_getUid("resourceURL"),function(_15,_16){
with(_15){
return _bundle.resourcesDirectoryURL();
}
}),new objj_method(sel_getUid("principalClass"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"objectForInfoDictionaryKey:","CPPrincipalClass");
return _19?CPClassFromString(_19):Nil;
}
}),new objj_method(sel_getUid("bundleIdentifier"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"objectForInfoDictionaryKey:","CPBundleIdentifier");
}
}),new objj_method(sel_getUid("isLoaded"),function(_1c,_1d){
with(_1c){
return _bundle.isLoaded();
}
}),new objj_method(sel_getUid("pathForResource:"),function(_1e,_1f,_20){
with(_1e){
return _bundle.pathForResource(_20);
}
}),new objj_method(sel_getUid("infoDictionary"),function(_21,_22){
with(_21){
return _bundle.infoDictionary();
}
}),new objj_method(sel_getUid("objectForInfoDictionaryKey:"),function(_23,_24,_25){
with(_23){
return _bundle.valueForInfoDictionaryKey(_25);
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_26,_27,_28){
with(_26){
_delegate=_28;
_bundle.addEventListener("load",function(){
objj_msgSend(_delegate,"bundleDidFinishLoading:",_26);
});
_bundle.addEventListener("error",function(){
CPLog.error("Could not find bundle: "+_26);
});
_bundle.load(YES);
}
}),new objj_method(sel_getUid("staticResourceURLs"),function(_29,_2a){
with(_29){
var _2b=[],_2c=_bundle.staticResources(),_2d=0,_2e=objj_msgSend(_2c,"count");
for(;_2d<_2e;++_2d){
objj_msgSend(_2b,"addObject:",_2c[_2d].URL());
}
return _2b;
}
}),new objj_method(sel_getUid("environments"),function(_2f,_30){
with(_2f){
return _bundle.environments();
}
}),new objj_method(sel_getUid("mostEligibleEnvironment"),function(_31,_32){
with(_31){
return _bundle.mostEligibleEnvironment();
}
}),new objj_method(sel_getUid("description"),function(_33,_34){
with(_33){
return objj_msgSendSuper({receiver:_33,super_class:objj_getClass("CPBundle").super_class},"description")+"("+objj_msgSend(_33,"bundlePath")+")";
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bundleWithURL:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(objj_msgSend(_35,"alloc"),"initWithURL:",_37);
}
}),new objj_method(sel_getUid("bundleWithPath:"),function(_38,_39,_3a){
with(_38){
return objj_msgSend(_38,"bundleWithURL:",_3a);
}
}),new objj_method(sel_getUid("bundleForClass:"),function(_3b,_3c,_3d){
with(_3b){
return objj_msgSend(_3b,"bundleWithURL:",CFBundle.bundleForClass(_3d).bundleURL());
}
}),new objj_method(sel_getUid("mainBundle"),function(_3e,_3f){
with(_3e){
return objj_msgSend(CPBundle,"bundleWithPath:",CFBundle.mainBundle().bundleURL());
}
})]);
p;16;CPCharacterSet.jt;26710;@STATIC;1.0;I;21;Foundation/CPObject.jt;26664;
objj_executeFile("Foundation/CPObject.j",NO);
var _1={};
var _2=objj_allocateClassPair(CPObject,"CPCharacterSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_inverted")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPCharacterSet").super_class},"init");
_inverted=NO;
return _4;
}
}),new objj_method(sel_getUid("invert"),function(_6,_7){
with(_6){
_inverted=!_inverted;
}
}),new objj_method(sel_getUid("characterIsMember:"),function(_8,_9,_a){
with(_8){
}
}),new objj_method(sel_getUid("hasMemberInPlane:"),function(_b,_c,_d){
with(_b){
}
}),new objj_method(sel_getUid("_setInverted:"),function(_e,_f,_10){
with(_e){
_inverted=_10;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("characterSetWithCharactersInString:"),function(_11,_12,_13){
with(_11){
return objj_msgSend(objj_msgSend(_CPStringContentCharacterSet,"alloc"),"initWithString:",_13);
}
}),new objj_method(sel_getUid("characterSetWithRange:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRange:",_16);
}
}),new objj_method(sel_getUid("alphanumericCharacterSet"),function(_17,_18){
with(_17){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_18);
}
}),new objj_method(sel_getUid("controlCharacterSet"),function(_19,_1a){
with(_19){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_1a);
}
}),new objj_method(sel_getUid("decimalDigitCharacterSet"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_1c);
}
}),new objj_method(sel_getUid("decomposableCharacterSet"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_1e);
}
}),new objj_method(sel_getUid("illegalCharacterSet"),function(_1f,_20){
with(_1f){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_20);
}
}),new objj_method(sel_getUid("letterCharacterSet"),function(_21,_22){
with(_21){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_22);
}
}),new objj_method(sel_getUid("lowercaseLetterCharacterSet"),function(_23,_24){
with(_23){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_24);
}
}),new objj_method(sel_getUid("nonBaseCharacterSet"),function(_25,_26){
with(_25){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_26);
}
}),new objj_method(sel_getUid("punctuationCharacterSet"),function(_27,_28){
with(_27){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_28);
}
}),new objj_method(sel_getUid("uppercaseLetterCharacterSet"),function(_29,_2a){
with(_29){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_2a);
}
}),new objj_method(sel_getUid("whitespaceAndNewlineCharacterSet"),function(_2b,_2c){
with(_2b){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_2c);
}
}),new objj_method(sel_getUid("whitespaceCharacterSet"),function(_2d,_2e){
with(_2d){
return objj_msgSend(CPCharacterSet,"_sharedCharacterSetWithName:",_2e);
}
}),new objj_method(sel_getUid("_sharedCharacterSetWithName:"),function(_2f,_30,_31){
with(_2f){
var cs=_1[_31];
if(cs==nil){
var i,_32=objj_msgSend(CPArray,"array"),_33=eval(_31);
for(i=0;i<_33.length;i+=2){
var loc=_33[i];
var _34=_33[i+1];
var _35=CPMakeRange(loc,_34);
objj_msgSend(_32,"addObject:",_35);
}
cs=objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRanges:",_32);
_1[_31]=cs;
}
return cs;
}
})]);
var _2=objj_allocateClassPair(CPCharacterSet,"_CPRangeCharacterSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_ranges")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithRange:"),function(_36,_37,r){
with(_36){
return objj_msgSend(_36,"initWithRanges:",objj_msgSend(CPArray,"arrayWithObject:",r));
}
}),new objj_method(sel_getUid("initWithRanges:"),function(_38,_39,_3a){
with(_38){
if(_38=objj_msgSendSuper({receiver:_38,super_class:objj_getClass("_CPRangeCharacterSet").super_class},"init")){
_ranges=_3a;
}
return _38;
}
}),new objj_method(sel_getUid("copy"),function(_3b,_3c){
with(_3b){
var set=objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRanges:",_ranges);
objj_msgSend(set,"_setInverted:",_inverted);
return set;
}
}),new objj_method(sel_getUid("invertedSet"),function(_3d,_3e){
with(_3d){
var set=objj_msgSend(objj_msgSend(_CPRangeCharacterSet,"alloc"),"initWithRanges:",_ranges);
objj_msgSend(set,"invert");
return set;
}
}),new objj_method(sel_getUid("characterIsMember:"),function(_3f,_40,_41){
with(_3f){
c=_41.charCodeAt(0);
var enu=objj_msgSend(_ranges,"objectEnumerator");
var _42;
while(_42=objj_msgSend(enu,"nextObject")){
if(CPLocationInRange(c,_42)){
return !_inverted;
}
}
return _inverted;
}
}),new objj_method(sel_getUid("hasMemberInPlane:"),function(_43,_44,_45){
with(_43){
var _46=Math.floor((range.start+range.length-1)/65536);
return (_45<=_46);
}
}),new objj_method(sel_getUid("addCharactersInRange:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_ranges,"addObject:",_49);
}
}),new objj_method(sel_getUid("addCharactersInString:"),function(_4a,_4b,_4c){
with(_4a){
var i;
for(i=0;i<_4c.length;i++){
var _4d=_4c.charCodeAt(i);
var _4e=CPMakeRange(_4d,1);
objj_msgSend(_ranges,"addObject:",_4e);
}
}
})]);
var _2=objj_allocateClassPair(CPCharacterSet,"_CPStringContentCharacterSet"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_string")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithString:"),function(_4f,_50,s){
with(_4f){
if(_4f=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("_CPStringContentCharacterSet").super_class},"init")){
_string=s;
}
return _4f;
}
}),new objj_method(sel_getUid("copy"),function(_51,_52){
with(_51){
var set=objj_msgSend(objj_msgSend(_CPStringContentCharacterSet,"alloc"),"initWithString:",_string);
objj_msgSend(set,"_setInverted:",_inverted);
return set;
}
}),new objj_method(sel_getUid("invertedSet"),function(_53,_54){
with(_53){
var set=objj_msgSend(objj_msgSend(_CPStringContentCharacterSet,"alloc"),"initWithString:",_string);
objj_msgSend(set,"invert");
return set;
}
}),new objj_method(sel_getUid("characterIsMember:"),function(_55,_56,c){
with(_55){
return (_string.indexOf(c.charAt(0))!=-1)==!_inverted;
}
}),new objj_method(sel_getUid("description"),function(_57,_58){
with(_57){
return objj_msgSendSuper({receiver:_57,super_class:objj_getClass("_CPStringContentCharacterSet").super_class},"description")+" { string = '"+_string+"'}";
}
}),new objj_method(sel_getUid("hasMemberInPlane:"),function(_59,_5a,_5b){
with(_59){
return _5b==0;
}
}),new objj_method(sel_getUid("addCharactersInRange:"),function(_5c,_5d,_5e){
with(_5c){
var i;
for(i=_5e.location;i<_5e.location+_5e.length;i++){
var s=String.fromCharCode(i);
if(!objj_msgSend(_5c,"characterIsMember:",s)){
_string=objj_msgSend(_string,"stringByAppendingString:",s);
}
}
}
}),new objj_method(sel_getUid("addCharactersInString:"),function(_5f,_60,_61){
with(_5f){
var i;
for(i=0;i<_61.length;i++){
var s=_61.charAt(i);
if(!objj_msgSend(_5f,"characterIsMember:",s)){
_string=objj_msgSend(_string,"stringByAppendingString:",s);
}
}
}
})]);
_CPCharacterSetTrimAtBeginning=1<<1;
_CPCharacterSetTrimAtEnd=1<<2;
var _2=objj_getClass("CPString");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("stringByTrimmingCharactersInSet:"),function(_62,_63,set){
with(_62){
return objj_msgSend(_62,"_stringByTrimmingCharactersInSet:options:",set,_CPCharacterSetTrimAtBeginning|_CPCharacterSetTrimAtEnd);
}
}),new objj_method(sel_getUid("_stringByTrimmingCharactersInSet:options:"),function(_64,_65,set,_66){
with(_64){
var str=_64;
if(_66&_CPCharacterSetTrimAtBeginning){
var _67=0;
while(_67<_64.length&&objj_msgSend(set,"characterIsMember:",_64.charAt(_67))){
_67++;
}
str=str.substr(_67);
}
if(_66&_CPCharacterSetTrimAtEnd){
var _68=str.length;
while(_68>0&&objj_msgSend(set,"characterIsMember:",_64.charAt(_68))){
_68--;
}
str=str.substr(0,_68+1);
}
return str;
}
})]);
alphanumericCharacterSet=[48,10,65,26,97,26,170,1,178,2,181,1,185,2,188,3,192,23,216,31,248,458,710,12,736,5,750,1,768,112,890,4,902,1,904,3,908,1,910,20,931,44,976,38,1015,139,1155,4,1160,140,1329,38,1369,1,1377,39,1425,45,1471,1,1473,2,1476,2,1479,1,1488,27,1520,3,1552,6,1569,26,1600,31,1632,10,1646,102,1749,8,1758,11,1770,19,1791,1,1808,59,1869,33,1920,50,1984,54,2042,1,2305,57,2364,18,2384,5,2392,12,2406,10,2427,5,2433,3,2437,8,2447,2,2451,22,2474,7,2482,1,2486,4,2492,9,2503,2,2507,4,2519,1,2524,2,2527,5,2534,12,2548,6,2561,3,2565,6,2575,2,2579,22,2602,7,2610,2,2613,2,2616,2,2620,1,2622,5,2631,2,2635,3,2649,4,2654,1,2662,15,2689,3,2693,9,2703,3,2707,22,2730,7,2738,2,2741,5,2748,10,2759,3,2763,3,2768,1,2784,4,2790,10,2817,3,2821,8,2831,2,2835,22,2858,7,2866,2,2869,5,2876,8,2887,2,2891,3,2902,2,2908,2,2911,3,2918,10,2929,1,2946,2,2949,6,2958,3,2962,4,2969,2,2972,1,2974,2,2979,2,2984,3,2990,12,3006,5,3014,3,3018,4,3031,1,3046,13,3073,3,3077,8,3086,3,3090,23,3114,10,3125,5,3134,7,3142,3,3146,4,3157,2,3168,2,3174,10,3202,2,3205,8,3214,3,3218,23,3242,10,3253,5,3260,9,3270,3,3274,4,3285,2,3294,1,3296,4,3302,10,3330,2,3333,8,3342,3,3346,23,3370,16,3390,6,3398,3,3402,4,3415,1,3424,2,3430,10,3458,2,3461,18,3482,24,3507,9,3517,1,3520,7,3530,1,3535,6,3542,1,3544,8,3570,2,3585,58,3648,15,3664,10,3713,2,3716,1,3719,2,3722,1,3725,1,3732,4,3737,7,3745,3,3749,1,3751,1,3754,2,3757,13,3771,3,3776,5,3782,1,3784,6,3792,10,3804,2,3840,1,3864,2,3872,20,3893,1,3895,1,3897,1,3902,10,3913,34,3953,20,3974,6,3984,8,3993,36,4038,1,4096,34,4131,5,4137,2,4140,7,4150,4,4160,10,4176,10,4256,38,4304,43,4348,1,4352,90,4447,68,4520,82,4608,73,4682,4,4688,7,4696,1,4698,4,4704,41,4746,4,4752,33,4786,4,4792,7,4800,1,4802,4,4808,15,4824,57,4882,4,4888,67,4959,1,4969,20,4992,16,5024,85,5121,620,5743,8,5761,26,5792,75,5870,3,5888,13,5902,7,5920,21,5952,20,5984,13,5998,3,6002,2,6016,52,6070,30,6103,1,6108,2,6112,10,6128,10,6155,3,6160,10,6176,88,6272,42,6400,29,6432,12,6448,12,6470,40,6512,5,6528,42,6576,26,6608,10,6656,28,6912,76,6992,10,7019,9,7424,203,7678,158,7840,90,7936,22,7960,6,7968,38,8008,6,8016,8,8025,1,8027,1,8029,1,8031,31,8064,53,8118,7,8126,1,8130,3,8134,7,8144,4,8150,6,8160,13,8178,3,8182,7,8304,2,8308,6,8319,11,8336,5,8400,32,8450,1,8455,1,8458,10,8469,1,8473,5,8484,1,8486,1,8488,1,8490,4,8495,11,8508,4,8517,5,8526,1,8531,50,9312,60,9450,22,10102,30,11264,47,11312,47,11360,13,11380,4,11392,101,11517,1,11520,38,11568,54,11631,1,11648,23,11680,7,11688,7,11696,7,11704,7,11712,7,11720,7,11728,7,11736,7,12293,3,12321,15,12337,5,12344,5,12353,86,12441,2,12445,3,12449,90,12540,4,12549,40,12593,94,12690,4,12704,24,12784,16,12832,10,12881,15,12928,10,12977,15,13312,6582,19968,20924,40960,1165,42775,4,43008,40,43072,52,44032,11172,63744,302,64048,59,64112,106,64256,7,64275,5,64285,12,64298,13,64312,5,64318,1,64320,2,64323,2,64326,108,64467,363,64848,64,64914,54,65008,12,65024,16,65056,4,65136,5,65142,135,65296,10,65313,26,65345,26,65382,89,65474,6,65482,6,65490,6];
controlCharacterSet=[0,32,127,33,173,1,1536,4,1757,1,1807,1,6068,2,8203,5,8234,5,8288,4,8298,6,65279,1];
decimalDigitCharacterSet=[48,10,1632,10,1776,10,1984,10,2406,10,2534,10,2662,10,2790,10,2918,10,3046,10,3174,10,3302,10,3430,10,3664,10,3792,10,3872,10,4160,10,6112,10,6160,10,6470,10,6608,10,6992,10];
decomposableCharacterSet=[192,6,199,9,209,6,217,5,224,6,231,9,241,6,249,5,255,17,274,20,296,9,308,4,313,6,323,6,332,6,340,18,360,23,416,2,431,2,461,16,478,6,486,11,500,2,504,36,542,2,550,14,832,2,835,2,884,1,894,1,901,6,908,1,910,3,938,7,970,5,979,2,1024,2,1027,1,1031,1,1036,3,1049,1,1081,1,1104,2,1107,1,1111,1,1116,3,1142,2,1217,2,1232,4,1238,2,1242,6,1250,6,1258,12,1272,2,1570,5,1728,1,1730,1,1747,1,2345,1,2353,1,2356,1,2392,8,2507,2,2524,2,2527,1,2611,1,2614,1,2649,3,2654,1,2888,1,2891,2,2908,2,2964,1,3018,3,3144,1,3264,1,3271,2,3274,2,3402,3,3546,1,3548,3,3907,1,3917,1,3922,1,3927,1,3932,1,3945,1,3955,1,3957,2,3960,1,3969,1,3987,1,3997,1,4002,1,4007,1,4012,1,4025,1,4134,1,6918,1,6920,1,6922,1,6924,1,6926,1,6930,1,6971,1,6973,1,6976,2,6979,1,7680,154,7835,1,7840,90,7936,22,7960,6,7968,38,8008,6,8016,8,8025,1,8027,1,8029,1,8031,31,8064,53,8118,7,8126,1,8129,4,8134,14,8150,6,8157,19,8178,3,8182,8,8192,2,8486,1,8490,2,8602,2,8622,1,8653,3,8708,1,8713,1,8716,1,8740,1,8742,1,8769,1,8772,1,8775,1,8777,1,8800,1,8802,1,8813,5,8820,2,8824,2,8832,2,8836,2,8840,2,8876,4,8928,4,8938,4,9001,2,10972,1,12364,1,12366,1,12368,1,12370,1,12372,1,12374,1,12376,1,12378,1,12380,1,12382,1,12384,1,12386,1,12389,1,12391,1,12393,1,12400,2,12403,2,12406,2,12409,2,12412,2,12436,1,12446,1,12460,1,12462,1,12464,1,12466,1,12468,1,12470,1,12472,1,12474,1,12476,1,12478,1,12480,1,12482,1,12485,1,12487,1,12489,1,12496,2,12499,2,12502,2,12505,2,12508,2,12532,1,12535,4,12542,1,44032,11172,63744,270,64016,1,64018,1,64021,10,64032,1,64034,1,64037,2,64042,4,64048,59,64112,106,64285,1,64287,1,64298,13,64312,5,64318,1,64320,2,64323,2];
illegalCharacterSet=[880,4,886,4,895,5,907,1,909,1,930,1,975,1,1159,1,1300,29,1367,2,1376,1,1416,1,1419,6,1480,8,1515,5,1525,11,1540,7,1558,5,1564,2,1568,1,1595,5,1631,1,1806,1,1867,2,1902,18,1970,14,2043,262,2362,2,2382,2,2389,3,2417,10,2432,1,2436,1,2445,2,2449,2,2473,1,2481,1,2483,3,2490,2,2501,2,2505,2,2511,8,2520,4,2526,1,2532,2,2555,6,2564,1,2571,4,2577,2,2601,1,2609,1,2612,1,2615,1,2618,2,2621,1,2627,4,2633,2,2638,11,2653,1,2655,7,2677,12,2692,1,2702,1,2706,1,2729,1,2737,1,2740,1,2746,2,2758,1,2762,1,2766,2,2769,15,2788,2,2800,1,2802,15,2820,1,2829,2,2833,2,2857,1,2865,1,2868,1,2874,2,2884,3,2889,2,2894,8,2904,4,2910,1,2914,4,2930,16,2948,1,2955,3,2961,1,2966,3,2971,1,2973,1,2976,3,2981,3,2987,3,3002,4,3011,3,3017,1,3022,9,3032,14,3067,6,3076,1,3085,1,3089,1,3113,1,3124,1,3130,4,3141,1,3145,1,3150,7,3159,9,3170,4,3184,18,3204,1,3213,1,3217,1,3241,1,3252,1,3258,2,3269,1,3273,1,3278,7,3287,7,3295,1,3300,2,3312,1,3315,15,3332,1,3341,1,3345,1,3369,1,3386,4,3396,2,3401,1,3406,9,3416,8,3426,4,3440,18,3460,1,3479,3,3506,1,3516,1,3518,2,3527,3,3531,4,3541,1,3543,1,3552,18,3573,12,3643,4,3676,37,3715,1,3717,2,3721,1,3723,2,3726,6,3736,1,3744,1,3748,1,3750,1,3752,2,3756,1,3770,1,3774,2,3781,1,3783,1,3790,2,3802,2,3806,34,3912,1,3947,6,3980,4,3992,1,4029,1,4045,2,4050,46,4130,1,4136,1,4139,1,4147,3,4154,6,4186,70,4294,10,4349,3,4442,5,4515,5,4602,6,4681,1,4686,2,4695,1,4697,1,4702,2,4745,1,4750,2,4785,1,4790,2,4799,1,4801,1,4806,2,4823,1,4881,1,4886,2,4955,4,4989,3,5018,6,5109,12,5751,9,5789,3,5873,15,5901,1,5909,11,5943,9,5972,12,5997,1,6001,1,6004,12,6110,2,6122,6,6138,6,6159,1,6170,6,6264,8,6314,86,6429,3,6444,4,6460,4,6465,3,6510,2,6517,11,6570,6,6602,6,6618,4,6684,2,6688,224,6988,4,7037,387,7627,51,7836,4,7930,6,7958,2,7966,2,8006,2,8014,2,8024,1,8026,1,8028,1,8030,1,8062,2,8117,1,8133,1,8148,2,8156,1,8176,2,8181,1,8191,1,8292,6,8306,2,8335,1,8341,11,8374,26,8432,16,8527,4,8581,11,9192,24,9255,25,9291,21,9885,3,9907,78,9989,1,9994,2,10024,1,10060,1,10062,1,10067,3,10071,1,10079,2,10133,3,10160,1,10175,1,10187,5,10220,4,11035,5,11044,220,11311,1,11359,1,11373,7,11384,8,11499,14,11558,10,11622,9,11632,16,11671,9,11687,1,11695,1,11703,1,11711,1,11719,1,11727,1,11735,1,11743,33,11800,4,11806,98,11930,1,12020,12,12246,26,12284,4,12352,1,12439,2,12544,5,12589,4,12687,1,12728,8,12752,32,12831,1,12868,12,13055,1,19894,10,40892,68,42125,3,42183,569,42779,5,42786,222,43052,20,43128,904,55204,92,64046,2,64107,5,64218,38,64263,12,64280,5,64311,1,64317,1,64319,1,64322,1,64325,1,64434,33,64832,16,64912,2,64968,40,65022,2,65050,6,65060,12,65107,1,65127,1,65132,4,65141,1,65277,2,65280,1,65471,3,65480,2,65488,2,65496,2,65501,3,65511,1,65519,10];
letterCharacterSet=[65,26,97,26,170,1,181,1,186,1,192,23,216,31,248,458,710,12,736,5,750,1,768,112,890,4,902,1,904,3,908,1,910,20,931,44,976,38,1015,139,1155,4,1160,140,1329,38,1369,1,1377,39,1425,45,1471,1,1473,2,1476,2,1479,1,1488,27,1520,3,1552,6,1569,26,1600,31,1646,102,1749,8,1758,11,1770,6,1786,3,1791,1,1808,59,1869,33,1920,50,1994,44,2042,1,2305,57,2364,18,2384,5,2392,12,2427,5,2433,3,2437,8,2447,2,2451,22,2474,7,2482,1,2486,4,2492,9,2503,2,2507,4,2519,1,2524,2,2527,5,2544,2,2561,3,2565,6,2575,2,2579,22,2602,7,2610,2,2613,2,2616,2,2620,1,2622,5,2631,2,2635,3,2649,4,2654,1,2672,5,2689,3,2693,9,2703,3,2707,22,2730,7,2738,2,2741,5,2748,10,2759,3,2763,3,2768,1,2784,4,2817,3,2821,8,2831,2,2835,22,2858,7,2866,2,2869,5,2876,8,2887,2,2891,3,2902,2,2908,2,2911,3,2929,1,2946,2,2949,6,2958,3,2962,4,2969,2,2972,1,2974,2,2979,2,2984,3,2990,12,3006,5,3014,3,3018,4,3031,1,3073,3,3077,8,3086,3,3090,23,3114,10,3125,5,3134,7,3142,3,3146,4,3157,2,3168,2,3202,2,3205,8,3214,3,3218,23,3242,10,3253,5,3260,9,3270,3,3274,4,3285,2,3294,1,3296,4,3330,2,3333,8,3342,3,3346,23,3370,16,3390,6,3398,3,3402,4,3415,1,3424,2,3458,2,3461,18,3482,24,3507,9,3517,1,3520,7,3530,1,3535,6,3542,1,3544,8,3570,2,3585,58,3648,15,3713,2,3716,1,3719,2,3722,1,3725,1,3732,4,3737,7,3745,3,3749,1,3751,1,3754,2,3757,13,3771,3,3776,5,3782,1,3784,6,3804,2,3840,1,3864,2,3893,1,3895,1,3897,1,3902,10,3913,34,3953,20,3974,6,3984,8,3993,36,4038,1,4096,34,4131,5,4137,2,4140,7,4150,4,4176,10,4256,38,4304,43,4348,1,4352,90,4447,68,4520,82,4608,73,4682,4,4688,7,4696,1,4698,4,4704,41,4746,4,4752,33,4786,4,4792,7,4800,1,4802,4,4808,15,4824,57,4882,4,4888,67,4959,1,4992,16,5024,85,5121,620,5743,8,5761,26,5792,75,5888,13,5902,7,5920,21,5952,20,5984,13,5998,3,6002,2,6016,52,6070,30,6103,1,6108,2,6155,3,6176,88,6272,42,6400,29,6432,12,6448,12,6480,30,6512,5,6528,42,6576,26,6656,28,6912,76,7019,9,7424,203,7678,158,7840,90,7936,22,7960,6,7968,38,8008,6,8016,8,8025,1,8027,1,8029,1,8031,31,8064,53,8118,7,8126,1,8130,3,8134,7,8144,4,8150,6,8160,13,8178,3,8182,7,8305,1,8319,1,8336,5,8400,32,8450,1,8455,1,8458,10,8469,1,8473,5,8484,1,8486,1,8488,1,8490,4,8495,11,8508,4,8517,5,8526,1,8579,2,11264,47,11312,47,11360,13,11380,4,11392,101,11520,38,11568,54,11631,1,11648,23,11680,7,11688,7,11696,7,11704,7,11712,7,11720,7,11728,7,11736,7,12293,2,12330,6,12337,5,12347,2,12353,86,12441,2,12445,3,12449,90,12540,4,12549,40,12593,94,12704,24,12784,16,13312,6582,19968,20924,40960,1165,42775,4,43008,40,43072,52,44032,11172,63744,302,64048,59,64112,106,64256,7,64275,5,64285,12,64298,13,64312,5,64318,1,64320,2,64323,2,64326,108,64467,363,64848,64,64914,54,65008,12,65024,16,65056,4,65136,5,65142,135,65313,26,65345,26,65382,89,65474,6,65482,6,65490,6];
lowercaseLetterCharacterSet=[97,26,170,1,181,1,186,1,223,24,248,8,257,1,259,1,261,1,263,1,265,1,267,1,269,1,271,1,273,1,275,1,277,1,279,1,281,1,283,1,285,1,287,1,289,1,291,1,293,1,295,1,297,1,299,1,301,1,303,1,305,1,307,1,309,1,311,2,314,1,316,1,318,1,320,1,322,1,324,1,326,1,328,2,331,1,333,1,335,1,337,1,339,1,341,1,343,1,345,1,347,1,349,1,351,1,353,1,355,1,357,1,359,1,361,1,363,1,365,1,367,1,369,1,371,1,373,1,375,1,378,1,380,1,382,3,387,1,389,1,392,1,396,2,402,1,405,1,409,3,414,1,417,1,419,1,421,1,424,1,426,2,429,1,432,1,436,1,438,1,441,2,445,3,454,1,457,1,460,1,462,1,464,1,466,1,468,1,470,1,472,1,474,1,476,2,479,1,481,1,483,1,485,1,487,1,489,1,491,1,493,1,495,2,499,1,501,1,505,1,507,1,509,1,511,1,513,1,515,1,517,1,519,1,521,1,523,1,525,1,527,1,529,1,531,1,533,1,535,1,537,1,539,1,541,1,543,1,545,1,547,1,549,1,551,1,553,1,555,1,557,1,559,1,561,1,563,7,572,1,575,2,578,1,583,1,585,1,587,1,589,1,591,69,661,27,891,3,912,1,940,35,976,2,981,3,985,1,987,1,989,1,991,1,993,1,995,1,997,1,999,1,1001,1,1003,1,1005,1,1007,5,1013,1,1016,1,1019,2,1072,48,1121,1,1123,1,1125,1,1127,1,1129,1,1131,1,1133,1,1135,1,1137,1,1139,1,1141,1,1143,1,1145,1,1147,1,1149,1,1151,1,1153,1,1163,1,1165,1,1167,1,1169,1,1171,1,1173,1,1175,1,1177,1,1179,1,1181,1,1183,1,1185,1,1187,1,1189,1,1191,1,1193,1,1195,1,1197,1,1199,1,1201,1,1203,1,1205,1,1207,1,1209,1,1211,1,1213,1,1215,1,1218,1,1220,1,1222,1,1224,1,1226,1,1228,1,1230,2,1233,1,1235,1,1237,1,1239,1,1241,1,1243,1,1245,1,1247,1,1249,1,1251,1,1253,1,1255,1,1257,1,1259,1,1261,1,1263,1,1265,1,1267,1,1269,1,1271,1,1273,1,1275,1,1277,1,1279,1,1281,1,1283,1,1285,1,1287,1,1289,1,1291,1,1293,1,1295,1,1297,1,1299,1,1377,39,7424,44,7522,22,7545,34,7681,1,7683,1,7685,1,7687,1,7689,1,7691,1,7693,1,7695,1,7697,1,7699,1,7701,1,7703,1,7705,1,7707,1,7709,1,7711,1,7713,1,7715,1,7717,1,7719,1,7721,1,7723,1,7725,1,7727,1,7729,1,7731,1,7733,1,7735,1,7737,1,7739,1,7741,1,7743,1,7745,1,7747,1,7749,1,7751,1,7753,1,7755,1,7757,1,7759,1,7761,1,7763,1,7765,1,7767,1,7769,1,7771,1,7773,1,7775,1,7777,1,7779,1,7781,1,7783,1,7785,1,7787,1,7789,1,7791,1,7793,1,7795,1,7797,1,7799,1,7801,1,7803,1,7805,1,7807,1,7809,1,7811,1,7813,1,7815,1,7817,1,7819,1,7821,1,7823,1,7825,1,7827,1,7829,7,7841,1,7843,1,7845,1,7847,1,7849,1,7851,1,7853,1,7855,1,7857,1,7859,1,7861,1,7863,1,7865,1,7867,1,7869,1,7871,1,7873,1,7875,1,7877,1,7879,1,7881,1,7883,1,7885,1,7887,1,7889,1,7891,1,7893,1,7895,1,7897,1,7899,1,7901,1,7903,1,7905,1,7907,1,7909,1,7911,1,7913,1,7915,1,7917,1,7919,1,7921,1,7923,1,7925,1,7927,1,7929,1,7936,8,7952,6,7968,8,7984,8,8000,6,8016,8,8032,8,8048,14,8064,8,8080,8,8096,8,8112,5,8118,2,8126,1,8130,3,8134,2,8144,4,8150,2,8160,8,8178,3,8182,2,8305,1,8319,1,8458,1,8462,2,8467,1,8495,1,8500,1,8505,1,8508,2,8518,4,8526,1,8580,1,11312,47,11361,1,11365,2,11368,1,11370,1,11372,1,11380,1,11382,2,11393,1,11395,1,11397,1,11399,1,11401,1,11403,1,11405,1,11407,1,11409,1,11411,1,11413,1,11415,1,11417,1,11419,1,11421,1,11423,1,11425,1,11427,1,11429,1,11431,1,11433,1,11435,1,11437,1,11439,1,11441,1,11443,1,11445,1,11447,1,11449,1,11451,1,11453,1,11455,1,11457,1,11459,1,11461,1,11463,1,11465,1,11467,1,11469,1,11471,1,11473,1,11475,1,11477,1,11479,1,11481,1,11483,1,11485,1,11487,1,11489,1,11491,2,11520,38,64256,7,64275,5];
nonBaseCharacterSet=[768,112,1155,4,1160,2,1425,45,1471,1,1473,2,1476,2,1479,1,1552,6,1611,20,1648,1,1750,7,1758,7,1767,2,1770,4,1809,1,1840,27,1958,11,2027,9,2305,3,2364,1,2366,16,2385,4,2402,2,2433,3,2492,1,2494,7,2503,2,2507,3,2519,1,2530,2,2561,3,2620,1,2622,5,2631,2,2635,3,2672,2,2689,3,2748,1,2750,8,2759,3,2763,3,2786,2,2817,3,2876,1,2878,6,2887,2,2891,3,2902,2,2946,1,3006,5,3014,3,3018,4,3031,1,3073,3,3134,7,3142,3,3146,4,3157,2,3202,2,3260,1,3262,7,3270,3,3274,4,3285,2,3298,2,3330,2,3390,6,3398,3,3402,4,3415,1,3458,2,3530,1,3535,6,3542,1,3544,8,3570,2,3633,1,3636,7,3655,8,3761,1,3764,6,3771,2,3784,6,3864,2,3893,1,3895,1,3897,1,3902,2,3953,20,3974,2,3984,8,3993,36,4038,1,4140,7,4150,4,4182,4,4959,1,5906,3,5938,3,5970,2,6002,2,6070,30,6109,1,6155,3,6313,1,6432,12,6448,12,6576,17,6600,2,6679,5,6912,5,6964,17,7019,9,7616,11,7678,2,8400,32,12330,6,12441,2,43010,1,43014,1,43019,1,43043,5,64286,1,65024,16];
punctuationCharacterSet=[33,3,37,6,44,4,58,2,63,2,91,3,95,1,123,1,125,1,161,1,171,1,183,1,187,1,191,1,894,1,903,1,1370,6,1417,2,1470,1,1472,1,1475,1,1478,1,1523,2,1548,2,1563,1,1566,2,1642,4,1748,1,1792,14,2039,3,2404,2,2416,1,3572,1,3663,1,3674,2,3844,15,3898,4,3973,1,4048,2,4170,6,4347,1,4961,8,5741,2,5787,2,5867,3,5941,2,6100,3,6104,3,6144,11,6468,2,6622,2,6686,2,7002,7,8208,24,8240,20,8261,13,8275,12,8317,2,8333,2,9001,2,10088,14,10181,2,10214,6,10627,22,10712,4,10748,2,11513,4,11518,2,11776,24,11804,2,12289,3,12296,10,12308,12,12336,1,12349,1,12448,1,12539,1,43124,4,64830,2,65040,10,65072,35,65108,14,65123,1,65128,1,65130,2,65281,3,65285,6,65292,4,65306,2,65311,2,65339,3,65343,1,65371,1,65373,1];
uppercaseLetterCharacterSet=[65,26,192,23,216,7,256,1,258,1,260,1,262,1,264,1,266,1,268,1,270,1,272,1,274,1,276,1,278,1,280,1,282,1,284,1,286,1,288,1,290,1,292,1,294,1,296,1,298,1,300,1,302,1,304,1,306,1,308,1,310,1,313,1,315,1,317,1,319,1,321,1,323,1,325,1,327,1,330,1,332,1,334,1,336,1,338,1,340,1,342,1,344,1,346,1,348,1,350,1,352,1,354,1,356,1,358,1,360,1,362,1,364,1,366,1,368,1,370,1,372,1,374,1,376,2,379,1,381,1,385,2,388,1,390,2,393,3,398,4,403,2,406,3,412,2,415,2,418,1,420,1,422,2,425,1,428,1,430,2,433,3,437,1,439,2,444,1,452,2,455,2,458,2,461,1,463,1,465,1,467,1,469,1,471,1,473,1,475,1,478,1,480,1,482,1,484,1,486,1,488,1,490,1,492,1,494,1,497,2,500,1,502,3,506,1,508,1,510,1,512,1,514,1,516,1,518,1,520,1,522,1,524,1,526,1,528,1,530,1,532,1,534,1,536,1,538,1,540,1,542,1,544,1,546,1,548,1,550,1,552,1,554,1,556,1,558,1,560,1,562,1,570,2,573,2,577,1,579,4,584,1,586,1,588,1,590,1,902,1,904,3,908,1,910,2,913,17,931,9,978,3,984,1,986,1,988,1,990,1,992,1,994,1,996,1,998,1,1000,1,1002,1,1004,1,1006,1,1012,1,1015,1,1017,2,1021,51,1120,1,1122,1,1124,1,1126,1,1128,1,1130,1,1132,1,1134,1,1136,1,1138,1,1140,1,1142,1,1144,1,1146,1,1148,1,1150,1,1152,1,1162,1,1164,1,1166,1,1168,1,1170,1,1172,1,1174,1,1176,1,1178,1,1180,1,1182,1,1184,1,1186,1,1188,1,1190,1,1192,1,1194,1,1196,1,1198,1,1200,1,1202,1,1204,1,1206,1,1208,1,1210,1,1212,1,1214,1,1216,2,1219,1,1221,1,1223,1,1225,1,1227,1,1229,1,1232,1,1234,1,1236,1,1238,1,1240,1,1242,1,1244,1,1246,1,1248,1,1250,1,1252,1,1254,1,1256,1,1258,1,1260,1,1262,1,1264,1,1266,1,1268,1,1270,1,1272,1,1274,1,1276,1,1278,1,1280,1,1282,1,1284,1,1286,1,1288,1,1290,1,1292,1,1294,1,1296,1,1298,1,1329,38,4256,38,7680,1,7682,1,7684,1,7686,1,7688,1,7690,1,7692,1,7694,1,7696,1,7698,1,7700,1,7702,1,7704,1,7706,1,7708,1,7710,1,7712,1,7714,1,7716,1,7718,1,7720,1,7722,1,7724,1,7726,1,7728,1,7730,1,7732,1,7734,1,7736,1,7738,1,7740,1,7742,1,7744,1,7746,1,7748,1,7750,1,7752,1,7754,1,7756,1,7758,1,7760,1,7762,1,7764,1,7766,1,7768,1,7770,1,7772,1,7774,1,7776,1,7778,1,7780,1,7782,1,7784,1,7786,1,7788,1,7790,1,7792,1,7794,1,7796,1,7798,1,7800,1,7802,1,7804,1,7806,1,7808,1,7810,1,7812,1,7814,1,7816,1,7818,1,7820,1,7822,1,7824,1,7826,1,7828,1,7840,1,7842,1,7844,1,7846,1,7848,1,7850,1,7852,1,7854,1,7856,1,7858,1,7860,1,7862,1,7864,1,7866,1,7868,1,7870,1,7872,1,7874,1,7876,1,7878,1,7880,1,7882,1,7884,1,7886,1,7888,1,7890,1,7892,1,7894,1,7896,1,7898,1,7900,1,7902,1,7904,1,7906,1,7908,1,7910,1,7912,1,7914,1,7916,1,7918,1,7920,1,7922,1,7924,1,7926,1,7928,1,7944,8,7960,6,7976,8,7992,8,8008,6,8025,1,8027,1,8029,1,8031,1,8040,8,8072,8,8088,8,8104,8,8120,5,8136,5,8152,4,8168,5,8184,5,8450,1,8455,1,8459,3,8464,3,8469,1,8473,5,8484,1,8486,1,8488,1,8490,4,8496,4,8510,2,8517,1,8579,1,11264,47,11360,1,11362,3,11367,1,11369,1,11371,1,11381,1,11392,1,11394,1,11396,1,11398,1,11400,1,11402,1,11404,1,11406,1,11408,1,11410,1,11412,1,11414,1,11416,1,11418,1,11420,1,11422,1,11424,1,11426,1,11428,1,11430,1,11432,1,11434,1,11436,1,11438,1,11440,1,11442,1,11444,1,11446,1,11448,1,11450,1,11452,1,11454,1,11456,1,11458,1,11460,1,11462,1,11464,1,11466,1,11468,1,11470,1,11472,1,11474,1,11476,1,11478,1,11480,1,11482,1,11484,1,11486,1,11488,1,11490,1];
whitespaceAndNewlineCharacterSet=[9,5,32,1,133,1,160,1,5760,1,8192,12,8232,2,8239,1,8287,1];
whitespaceCharacterSet=[9,1,32,1,160,1,5760,1,8192,12,8239,1,8287,1];
p;9;CPCoder.jt;1892;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1840;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPCoder"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("allowsKeyedCoding"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("encodeValueOfObjCType:at:"),function(_5,_6,_7,_8){
with(_5){
CPInvalidAbstractInvocation();
}
}),new objj_method(sel_getUid("encodeDataObject:"),function(_9,_a,_b){
with(_9){
CPInvalidAbstractInvocation();
}
}),new objj_method(sel_getUid("encodeObject:"),function(_c,_d,_e){
with(_c){
}
}),new objj_method(sel_getUid("encodePoint:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"encodeNumber:",_11.x);
objj_msgSend(_f,"encodeNumber:",_11.y);
}
}),new objj_method(sel_getUid("encodeRect:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"encodePoint:",_14.origin);
objj_msgSend(_12,"encodeSize:",_14.size);
}
}),new objj_method(sel_getUid("encodeSize:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"encodeNumber:",_17.width);
objj_msgSend(_15,"encodeNumber:",_17.height);
}
}),new objj_method(sel_getUid("encodePropertyList:"),function(_18,_19,_1a){
with(_18){
}
}),new objj_method(sel_getUid("encodeRootObject:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"encodeObject:",_1d);
}
}),new objj_method(sel_getUid("encodeBycopyObject:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"encodeObject:",_20);
}
}),new objj_method(sel_getUid("encodeConditionalObject:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"encodeObject:",_23);
}
})]);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_24,_25,_26){
with(_24){
return _24;
}
})]);
p;14;CPCountedSet.jt;1287;@STATIC;1.0;i;7;CPSet.jt;1257;
objj_executeFile("CPSet.j",YES);
var _1=objj_allocateClassPair(CPMutableSet,"CPCountedSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_counts")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("addObject:"),function(_3,_4,_5){
with(_3){
if(!_counts){
_counts={};
}
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCountedSet").super_class},"addObject:",_5);
var _6=objj_msgSend(_5,"UID");
if(_counts[_6]===undefined){
_counts[_6]=1;
}else{
++_counts[_6];
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_7,_8,_9){
with(_7){
if(!_counts){
return;
}
var _a=objj_msgSend(_9,"UID");
if(_counts[_a]===undefined){
return;
}else{
--_counts[_a];
if(_counts[_a]===0){
delete _counts[_a];
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPCountedSet").super_class},"removeObject:",_9);
}
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_b,_c){
with(_b){
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPCountedSet").super_class},"removeAllObjects");
_counts={};
}
}),new objj_method(sel_getUid("countForObject:"),function(_d,_e,_f){
with(_d){
if(!_counts){
_counts={};
}
var UID=objj_msgSend(_f,"UID");
if(_counts[UID]===undefined){
return 0;
}
return _counts[UID];
}
})]);
p;8;CPData.jt;4290;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;4241;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPData"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRawString:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPData").super_class},"init");
if(_3){
objj_msgSend(_3,"setRawString:",_5);
}
return _3;
}
}),new objj_method(sel_getUid("initWithPlistObject:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPData").super_class},"init");
if(_6){
objj_msgSend(_6,"setPlistObject:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithPlistObject:format:"),function(_9,_a,_b,_c){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPData").super_class},"init");
if(_9){
objj_msgSend(_9,"setPlistObject:format:",_b,_c);
}
return _9;
}
}),new objj_method(sel_getUid("initWithJSONObject:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPData").super_class},"init");
if(_d){
objj_msgSend(_d,"setJSONObject:",_f);
}
return _d;
}
}),new objj_method(sel_getUid("rawString"),function(_10,_11){
with(_10){
return _10.rawString();
}
}),new objj_method(sel_getUid("plistObject"),function(_12,_13){
with(_12){
return _12.propertyList();
}
}),new objj_method(sel_getUid("JSONObject"),function(_14,_15){
with(_14){
return _14.JSONObject();
}
}),new objj_method(sel_getUid("length"),function(_16,_17){
with(_16){
return objj_msgSend(objj_msgSend(_16,"rawString"),"length");
}
}),new objj_method(sel_getUid("description"),function(_18,_19){
with(_18){
return _18.toString();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_1a,_1b){
with(_1a){
return new CFMutableData();
}
}),new objj_method(sel_getUid("data"),function(_1c,_1d){
with(_1c){
return objj_msgSend(objj_msgSend(_1c,"alloc"),"init");
}
}),new objj_method(sel_getUid("dataWithRawString:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithRawString:",_20);
}
}),new objj_method(sel_getUid("dataWithPlistObject:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(_21,"alloc"),"initWithPlistObject:",_23);
}
}),new objj_method(sel_getUid("dataWithPlistObject:format:"),function(_24,_25,_26,_27){
with(_24){
return objj_msgSend(objj_msgSend(_24,"alloc"),"initWithPlistObject:format:",_26,_27);
}
}),new objj_method(sel_getUid("dataWithJSONObject:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(objj_msgSend(_28,"alloc"),"initWithJSONObject:",_2a);
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setRawString:"),function(_2b,_2c,_2d){
with(_2b){
_2b.setRawString(_2d);
}
}),new objj_method(sel_getUid("setPlistObject:"),function(_2e,_2f,_30){
with(_2e){
_2e.setPropertyList(_30);
}
}),new objj_method(sel_getUid("setPlistObject:format:"),function(_31,_32,_33,_34){
with(_31){
_31.setPropertyList(_33,_34);
}
}),new objj_method(sel_getUid("setJSONObject:"),function(_35,_36,_37){
with(_35){
_35.setJSONObject(_37);
}
})]);
var _1=objj_getClass("CPData");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPData\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_38,_39,_3a){
with(_38){
_CPReportLenientDeprecation(_38,_39,sel_getUid("initWithRawString:"));
return objj_msgSend(_38,"initWithRawString:",_3a);
}
}),new objj_method(sel_getUid("setString:"),function(_3b,_3c,_3d){
with(_3b){
_CPReportLenientDeprecation(_3b,_3c,sel_getUid("setRawString:"));
objj_msgSend(_3b,"setRawString:",_3d);
}
}),new objj_method(sel_getUid("string"),function(_3e,_3f){
with(_3e){
_CPReportLenientDeprecation(_3e,_3f,sel_getUid("rawString"));
return objj_msgSend(_3e,"rawString");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("dataWithString:"),function(_40,_41,_42){
with(_40){
_CPReportLenientDeprecation(_40,_41,sel_getUid("dataWithRawString:"));
return objj_msgSend(_40,"dataWithRawString:",_42);
}
})]);
CFData.prototype.isa=CPData;
CFMutableData.prototype.isa=CPData;
p;8;CPDate.jt;5033;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;4984;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
var _1=new Date(Date.UTC(2001,1,1,0,0,0,0));
var _2=objj_allocateClassPair(CPObject,"CPDate"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"),function(_4,_5,_6){
with(_4){
_4=new Date((new Date()).getTime()+_6*1000);
return _4;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSince1970:"),function(_7,_8,_9){
with(_7){
_7=new Date(_9*1000);
return _7;
}
}),new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSend(_a,"initWithTimeInterval:sinceDate:",_c,_1);
return _a;
}
}),new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"),function(_d,_e,_f,_10){
with(_d){
_d=new Date(_10.getTime()+_f*1000);
return _d;
}
}),new objj_method(sel_getUid("initWithString:"),function(_11,_12,_13){
with(_11){
var _14=/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2}) ([-+])(\d{2})(\d{2})/,d=_13.match(new RegExp(_14));
if(!d||d.length!=10){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithString: the string must be of YYYY-MM-DD HH:MM:SS ±HHMM format");
}
var _15=new Date(d[1],d[2]-1,d[3]),_16=(Number(d[8])*60+Number(d[9]))*(d[7]==="-"?-1:1);
_15.setHours(d[4]);
_15.setMinutes(d[5]);
_15.setSeconds(d[6]);
_11=new Date(_15.getTime()+(_16-_15.getTimezoneOffset())*60*1000);
return _11;
}
}),new objj_method(sel_getUid("timeIntervalSinceDate:"),function(_17,_18,_19){
with(_17){
return (_17.getTime()-_19.getTime())/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceNow"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"timeIntervalSinceDate:",objj_msgSend(CPDate,"date"));
}
}),new objj_method(sel_getUid("timeIntervalSince1970"),function(_1c,_1d){
with(_1c){
return _1c.getTime()/1000;
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_1e,_1f){
with(_1e){
return (_1e.getTime()-_1.getTime())/1000;
}
}),new objj_method(sel_getUid("isEqual:"),function(_20,_21,_22){
with(_20){
if(_20===_22){
return YES;
}
if(!_22||!objj_msgSend(_22,"isKindOfClass:",objj_msgSend(CPDate,"class"))){
return NO;
}
return objj_msgSend(_20,"isEqualToDate:",_22);
}
}),new objj_method(sel_getUid("isEqualToDate:"),function(_23,_24,_25){
with(_23){
if(!_25){
return NO;
}
return !(_23<_25||_23>_25);
}
}),new objj_method(sel_getUid("compare:"),function(_26,_27,_28){
with(_26){
return (_26>_28)?CPOrderedDescending:((_26<_28)?CPOrderedAscending:CPOrderedSame);
}
}),new objj_method(sel_getUid("earlierDate:"),function(_29,_2a,_2b){
with(_29){
return (_29<_2b)?_29:_2b;
}
}),new objj_method(sel_getUid("laterDate:"),function(_2c,_2d,_2e){
with(_2c){
return (_2c>_2e)?_2c:_2e;
}
}),new objj_method(sel_getUid("description"),function(_2f,_30){
with(_2f){
var _31=_2f.getTimezoneOffset()>=0,_32=FLOOR(_2f.getTimezoneOffset()/60),_33=_2f.getTimezoneOffset()-_32*60;
return objj_msgSend(CPString,"stringWithFormat:","%04d-%02d-%02d %02d:%02d:%02d %s%02d%02d",_2f.getFullYear(),_2f.getMonth()+1,_2f.getDate(),_2f.getHours(),_2f.getMinutes(),_2f.getSeconds(),_31?"+":"-",ABS(_32),ABS(_33));
}
}),new objj_method(sel_getUid("copy"),function(_34,_35){
with(_34){
return new Date(_34.getTime());
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("alloc"),function(_36,_37){
with(_36){
return new Date;
}
}),new objj_method(sel_getUid("date"),function(_38,_39){
with(_38){
return objj_msgSend(objj_msgSend(_38,"alloc"),"init");
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceNow:",_3c);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"),function(_3d,_3e,_3f){
with(_3d){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSince1970:",_3f);
}
}),new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSinceReferenceDate:",_42);
}
}),new objj_method(sel_getUid("distantPast"),function(_43,_44){
with(_43){
return new Date(-10000,1,1,0,0,0,0);
}
}),new objj_method(sel_getUid("distantFuture"),function(_45,_46){
with(_45){
return new Date(10000,1,1,0,0,0,0);
}
}),new objj_method(sel_getUid("timeIntervalSinceReferenceDate"),function(_47,_48){
with(_47){
return objj_msgSend(objj_msgSend(CPDate,"date"),"timeIntervalSinceReferenceDate");
}
})]);
var _49="CPDateTimeKey";
var _2=objj_getClass("CPDate");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_4a,_4b,_4c){
with(_4a){
if(_4a){
_4a.setTime(objj_msgSend(_4c,"decodeIntForKey:",_49));
}
return _4a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4f,"encodeInt:forKey:",_4d.getTime(),_49);
}
})]);
Date.prototype.isa=CPDate;
p;14;CPDictionary.jt;8238;@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;13;CPException.ji;10;CPObject.jt;8154;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPEnumerator,"_CPDictionaryValueEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyEnumerator"),new objj_ivar("_dictionary")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("_CPDictionaryValueEnumerator").super_class},"init");
if(_3){
_keyEnumerator=objj_msgSend(_5,"keyEnumerator");
_dictionary=_5;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
var _8=objj_msgSend(_keyEnumerator,"nextObject");
if(!_8){
return nil;
}
return objj_msgSend(_dictionary,"objectForKey:",_8);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDictionary:"),function(_9,_a,_b){
with(_9){
var _c="",_d=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
for(_c in _b._buckets){
objj_msgSend(_d,"setObject:forKey:",objj_msgSend(_b,"objectForKey:",_c),_c);
}
return _d;
}
}),new objj_method(sel_getUid("initWithObjects:forKeys:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPDictionary").super_class},"init");
if(objj_msgSend(_10,"count")!=objj_msgSend(_11,"count")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Counts are different.("+objj_msgSend(_10,"count")+"!="+objj_msgSend(_11,"count")+")");
}
if(_e){
var i=objj_msgSend(_11,"count");
while(i--){
objj_msgSend(_e,"setObject:forKey:",_10[i],_11[i]);
}
}
return _e;
}
}),new objj_method(sel_getUid("initWithObjectsAndKeys:"),function(_12,_13,_14){
with(_12){
var _15=arguments.length;
if(_15%2!==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Key-value count is mismatched. ("+_15+" arguments passed)");
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPDictionary").super_class},"init");
if(_12){
var _16=2;
for(;_16<_15;_16+=2){
var _17=arguments[_16];
if(_17===nil){
break;
}
objj_msgSend(_12,"setObject:forKey:",_17,arguments[_16+1]);
}
}
return _12;
}
}),new objj_method(sel_getUid("copy"),function(_18,_19){
with(_18){
return objj_msgSend(CPDictionary,"dictionaryWithDictionary:",_18);
}
}),new objj_method(sel_getUid("count"),function(_1a,_1b){
with(_1a){
return _count;
}
}),new objj_method(sel_getUid("allKeys"),function(_1c,_1d){
with(_1c){
return objj_msgSend(_keys,"copy");
}
}),new objj_method(sel_getUid("allValues"),function(_1e,_1f){
with(_1e){
var _20=_keys.length,_21=[];
while(_20--){
_21.push(_1e.valueForKey(_keys[_20]));
}
return _21;
}
}),new objj_method(sel_getUid("allKeysForObject:"),function(_22,_23,_24){
with(_22){
var _25=_keys.length,_26=0,_27=[],_28=nil,_29=nil;
for(;_26<_25;++_26){
_28=_keys[_26],_29=_buckets[_28];
if(_29.isa&&_24&&_24.isa&&objj_msgSend(_29,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_29,"isEqual:",_24)){
_27.push(_28);
}else{
if(_29===_24){
_27.push(_28);
}
}
}
return _27;
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_2a,_2b){
with(_2a){
return objj_msgSend(_keys,"objectEnumerator");
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_2c,_2d){
with(_2c){
return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator,"alloc"),"initWithDictionary:",_2c);
}
}),new objj_method(sel_getUid("isEqualToDictionary:"),function(_2e,_2f,_30){
with(_2e){
if(_2e===_30){
return YES;
}
var _31=objj_msgSend(_2e,"count");
if(_31!==objj_msgSend(_30,"count")){
return NO;
}
var _32=_31;
while(_32--){
var _33=_keys[_32],_34=_buckets[_33],_35=_30._buckets[_33];
if(_34===_35){
continue;
}
if(_34&&_34.isa&&_35&&_35.isa&&objj_msgSend(_34,"respondsToSelector:",sel_getUid("isEqual:"))&&objj_msgSend(_34,"isEqual:",_35)){
continue;
}
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_36,_37,_38){
with(_36){
if(_36===_38){
return YES;
}
if(!objj_msgSend(_38,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return NO;
}
return objj_msgSend(_36,"isEqualToDictionary:",_38);
}
}),new objj_method(sel_getUid("objectForKey:"),function(_39,_3a,_3b){
with(_39){
var _3c=_buckets[_3b];
return (_3c===undefined)?nil:_3c;
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_3d,_3e){
with(_3d){
_3d.removeAllValues();
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(_3f,_40,_41){
with(_3f){
_3f.removeValueForKey(_41);
}
}),new objj_method(sel_getUid("removeObjectsForKeys:"),function(_42,_43,_44){
with(_42){
var _45=_44.length;
while(_45--){
objj_msgSend(_42,"removeObjectForKey:",_44[_45]);
}
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(_46,_47,_48,_49){
with(_46){
_46.setValueForKey(_49,_48);
}
}),new objj_method(sel_getUid("addEntriesFromDictionary:"),function(_4a,_4b,_4c){
with(_4a){
if(!_4c){
return;
}
var _4d=objj_msgSend(_4c,"allKeys"),_4e=objj_msgSend(_4d,"count");
while(_4e--){
var key=_4d[_4e];
objj_msgSend(_4a,"setObject:forKey:",objj_msgSend(_4c,"objectForKey:",key),key);
}
}
}),new objj_method(sel_getUid("description"),function(_4f,_50){
with(_4f){
return _4f.toString();
}
}),new objj_method(sel_getUid("containsKey:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_51,"objectForKey:",_53);
return ((_54!==nil)&&(_54!==undefined));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_55,_56){
with(_55){
return new CFMutableDictionary();
}
}),new objj_method(sel_getUid("dictionary"),function(_57,_58){
with(_57){
return objj_msgSend(objj_msgSend(_57,"alloc"),"init");
}
}),new objj_method(sel_getUid("dictionaryWithDictionary:"),function(_59,_5a,_5b){
with(_59){
return objj_msgSend(objj_msgSend(_59,"alloc"),"initWithDictionary:",_5b);
}
}),new objj_method(sel_getUid("dictionaryWithObject:forKey:"),function(_5c,_5d,_5e,_5f){
with(_5c){
return objj_msgSend(objj_msgSend(_5c,"alloc"),"initWithObjects:forKeys:",[_5e],[_5f]);
}
}),new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"),function(_60,_61,_62,_63){
with(_60){
return objj_msgSend(objj_msgSend(_60,"alloc"),"initWithObjects:forKeys:",_62,_63);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_64,"dictionaryWithJSObject:recursively:",_66,NO);
}
}),new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"),function(_67,_68,_69,_6a){
with(_67){
var key="",_6b=objj_msgSend(objj_msgSend(_67,"alloc"),"init");
for(key in _69){
if(!_69.hasOwnProperty(key)){
continue;
}
var _6c=_69[key];
if(_6c===null){
objj_msgSend(_6b,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
continue;
}
if(_6a){
if(_6c.constructor===Object){
_6c=objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_6c,YES);
}else{
if(objj_msgSend(_6c,"isKindOfClass:",CPArray)){
var _6d=[],i=0,_6e=_6c.length;
for(;i<_6e;i++){
var _6f=_6c[i];
if(_6f.constructor===Object){
_6d.push(objj_msgSend(CPDictionary,"dictionaryWithJSObject:recursively:",_6f,YES));
}else{
_6d.push(_6f);
}
}
_6c=_6d;
}
}
}
objj_msgSend(_6b,"setObject:forKey:",_6c,key);
}
return _6b;
}
}),new objj_method(sel_getUid("dictionaryWithObjectsAndKeys:"),function(_70,_71,_72){
with(_70){
arguments[0]=objj_msgSend(_70,"alloc");
arguments[1]=sel_getUid("initWithObjectsAndKeys:");
return objj_msgSend.apply(this,arguments);
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_73,_74,_75){
with(_73){
return objj_msgSend(_75,"_decodeDictionaryOfObjectsForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_78,"_encodeDictionaryOfObjects:forKey:",_76,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPDictionary,"CPMutableDictionary"),_2=_1.isa;
objj_registerClassPair(_1);
CFDictionary.prototype.isa=CPDictionary;
CFMutableDictionary.prototype.isa=CPMutableDictionary;
p;14;CPEnumerator.jt;357;@STATIC;1.0;i;10;CPObject.jt;324;
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPEnumerator"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("nextObject"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("allObjects"),function(_5,_6){
with(_5){
return [];
}
})]);
p;13;CPException.jt;3505;@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.ji;10;CPString.jt;3443;
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPInvalidArgumentException="CPInvalidArgumentException";
CPUnsupportedMethodException="CPUnsupportedMethodException";
CPRangeException="CPRangeException";
CPInternalInconsistencyException="CPInternalInconsistencyException";
var _1=objj_allocateClassPair(CPObject,"CPException"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:reason:userInfo:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPException").super_class},"init");
if(_3){
name=_5;
message=_6;
_userInfo=_7;
}
return _3;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return name;
}
}),new objj_method(sel_getUid("reason"),function(_a,_b){
with(_a){
return message;
}
}),new objj_method(sel_getUid("userInfo"),function(_c,_d){
with(_c){
return _userInfo;
}
}),new objj_method(sel_getUid("description"),function(_e,_f){
with(_e){
return message;
}
}),new objj_method(sel_getUid("raise"),function(_10,_11){
with(_10){
throw _10;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_12,_13){
with(_12){
return new Error();
}
}),new objj_method(sel_getUid("raise:reason:"),function(_14,_15,_16,_17){
with(_14){
objj_msgSend(objj_msgSend(_14,"exceptionWithName:reason:userInfo:",_16,_17,nil),"raise");
}
}),new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
return objj_msgSend(objj_msgSend(_18,"alloc"),"initWithName:reason:userInfo:",_1a,_1b,_1c);
}
})]);
var _1=objj_getClass("CPException");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPException\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_1d,_1e){
with(_1d){
return objj_msgSend(objj_msgSend(_1d,"class"),"exceptionWithName:reason:userInfo:",name,message,_userInfo);
}
})]);
var _1f="CPExceptionNameKey",_20="CPExceptionReasonKey",_21="CPExceptionUserInfoKey";
var _1=objj_getClass("CPException");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPException\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPException").super_class},"init");
if(_22){
name=objj_msgSend(_24,"decodeObjectForKey:",_1f);
message=objj_msgSend(_24,"decodeObjectForKey:",_20);
_userInfo=objj_msgSend(_24,"decodeObjectForKey:",_21);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_27,"encodeObject:forKey:",name,_1f);
objj_msgSend(_27,"encodeObject:forKey:",message,_20);
objj_msgSend(_27,"encodeObject:forKey:",_userInfo,_21);
}
})]);
Error.prototype.isa=CPException;
Error.prototype._userInfo=NULL;
objj_msgSend(CPException,"initialize");
_CPRaiseInvalidAbstractInvocation=function(_28,_29){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"*** -"+sel_getName(_29)+" cannot be sent to an abstract object of class "+objj_msgSend(_28,"className")+": Create a concrete instance!");
};
_CPReportLenientDeprecation=function(_2a,_2b,_2c){
CPLog.warn("["+CPStringFromClass(_2a)+" "+CPStringFromSelector(_2b)+"] is deprecated, using "+CPStringFromSelector(_2c)+" instead.");
};
p;13;CPFormatter.jt;1549;@STATIC;1.0;I;21;Foundation/CPObject.jt;1504;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPFormatter"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("stringForObjectValue:"),function(_3,_4,_5){
with(_3){
_CPRaiseInvalidAbstractInvocation(_3,sel_getUid("stringForObjectValue:"));
return nil;
}
}),new objj_method(sel_getUid("editingStringForObjectValue:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"stringForObjectValue:",_8);
}
}),new objj_method(sel_getUid("getObjectValue:forString:errorDescription:"),function(_9,_a,_b,_c,_d){
with(_9){
_CPRaiseInvalidAbstractInvocation(_9,sel_getUid("getObjectValue:forString:errorDescription:"));
return NO;
}
}),new objj_method(sel_getUid("isPartialStringValid:newEditingString:errorDescription:"),function(_e,_f,_10,_11,_12){
with(_e){
_CPRaiseInvalidAbstractInvocation(_e,sel_getUid("isPartialStringValid:newEditingString:errorDescription:"));
return NO;
}
}),new objj_method(sel_getUid("isPartialStringValue:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:"),function(_13,_14,_15,_16,_17,_18,_19){
with(_13){
_CPRaiseInvalidAbstractInvocation(_13,sel_getUid("isPartialStringValue:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:"));
return NO;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,"init");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
}
})]);
p;21;CPFunctionOperation.jt;1271;@STATIC;1.0;I;21;Foundation/CPObject.ji;13;CPOperation.jt;1208;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPOperation.j",YES);
var _1=objj_allocateClassPair(CPOperation,"CPFunctionOperation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_functions")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("main"),function(_3,_4){
with(_3){
if(_functions&&objj_msgSend(_functions,"count")>0){
var i=0,_5=objj_msgSend(_functions,"count");
for(;i<_5;i++){
var _6=objj_msgSend(_functions,"objectAtIndex:",i);
_6();
}
}
}
}),new objj_method(sel_getUid("init"),function(_7,_8){
with(_7){
if(_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPFunctionOperation").super_class},"init")){
_functions=[];
}
return _7;
}
}),new objj_method(sel_getUid("addExecutionFunction:"),function(_9,_a,_b){
with(_9){
objj_msgSend(_functions,"addObject:",_b);
}
}),new objj_method(sel_getUid("executionFunctions"),function(_c,_d){
with(_c){
return _functions;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("functionOperationWithFunction:"),function(_e,_f,_10){
with(_e){
functionOp=objj_msgSend(objj_msgSend(CPFunctionOperation,"alloc"),"init");
objj_msgSend(functionOp,"addExecutionFunction:",_10);
return functionOp;
}
})]);
p;12;CPIndexSet.jt;12162;@STATIC;1.0;i;10;CPObject.ji;9;CPRange.jt;12114;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRange.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPIndexSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_count"),new objj_ivar("_ranges")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIndexesInRange:",{location:(0),length:0});
}
}),new objj_method(sel_getUid("initWithIndex:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"initWithIndexesInRange:",{location:(_7),length:1});
}
}),new objj_method(sel_getUid("initWithIndexesInRange:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_8){
_count=MAX(0,_a.length);
if(_count>0){
_ranges=[_a];
}else{
_ranges=[];
}
}
return _8;
}
}),new objj_method(sel_getUid("initWithIndexSet:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_b){
_count=objj_msgSend(_d,"count");
_ranges=[];
var _e=_d._ranges,_f=_e.length;
while(_f--){
_ranges[_f]={location:(_e[_f]).location,length:(_e[_f]).length};
}
}
return _b;
}
}),new objj_method(sel_getUid("isEqual:"),function(_10,_11,_12){
with(_10){
if(_10===_12){
return YES;
}
if(!_12||!objj_msgSend(_12,"isKindOfClass:",objj_msgSend(CPIndexSet,"class"))){
return NO;
}
return objj_msgSend(_10,"isEqualToIndexSet:",_12);
}
}),new objj_method(sel_getUid("isEqualToIndexSet:"),function(_13,_14,_15){
with(_13){
if(!_15){
return NO;
}
if(_13===_15){
return YES;
}
var _16=_ranges.length,_17=_15._ranges;
if(_16!==_17.length||_count!==_15._count){
return NO;
}
while(_16--){
if(!CPEqualRanges(_ranges[_16],_17[_16])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_18,_19,_1a){
with(_18){
return _18===_1a||objj_msgSend(_1a,"isKindOfClass:",objj_msgSend(_18,"class"))&&objj_msgSend(_18,"isEqualToIndexSet:",_1a);
}
}),new objj_method(sel_getUid("containsIndex:"),function(_1b,_1c,_1d){
with(_1b){
return _1e(_ranges,_1d)!==CPNotFound;
}
}),new objj_method(sel_getUid("containsIndexesInRange:"),function(_1f,_20,_21){
with(_1f){
if(_21.length<=0){
return NO;
}
if(_count<_21.length){
return NO;
}
var _22=_1e(_ranges,_21.location);
if(_22===CPNotFound){
return NO;
}
var _23=_ranges[_22];
return CPIntersectionRange(_23,_21).length===_21.length;
}
}),new objj_method(sel_getUid("containsIndexes:"),function(_24,_25,_26){
with(_24){
var _27=_26._count;
if(_27<=0){
return YES;
}
if(_count<_27){
return NO;
}
var _28=_26._ranges,_29=_28.length;
while(_29--){
if(!objj_msgSend(_24,"containsIndexesInRange:",_28[_29])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsIndexesInRange:"),function(_2a,_2b,_2c){
with(_2a){
if(_count<=0){
return NO;
}
var _2d=_2e(_ranges,_2c.location);
if(FLOOR(_2d)===_2d){
return YES;
}
var _2f=_2e(_ranges,((_2c).location+(_2c).length)-1);
if(FLOOR(_2f)===_2f){
return YES;
}
return _2d!==_2f;
}
}),new objj_method(sel_getUid("count"),function(_30,_31){
with(_30){
return _count;
}
}),new objj_method(sel_getUid("firstIndex"),function(_32,_33){
with(_32){
if(_count>0){
return _ranges[0].location;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("lastIndex"),function(_34,_35){
with(_34){
if(_count>0){
return ((_ranges[_ranges.length-1]).location+(_ranges[_ranges.length-1]).length)-1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexGreaterThanIndex:"),function(_36,_37,_38){
with(_36){
++_38;
var _39=_2e(_ranges,_38);
if(_39===CPNotFound){
return CPNotFound;
}
_39=CEIL(_39);
if(_39>=_ranges.length){
return CPNotFound;
}
var _3a=_ranges[_39];
if(CPLocationInRange(_38,_3a)){
return _38;
}
return _3a.location;
}
}),new objj_method(sel_getUid("indexLessThanIndex:"),function(_3b,_3c,_3d){
with(_3b){
--_3d;
var _3e=_2e(_ranges,_3d);
if(_3e===CPNotFound){
return CPNotFound;
}
_3e=FLOOR(_3e);
if(_3e<0){
return CPNotFound;
}
var _3f=_ranges[_3e];
if(CPLocationInRange(_3d,_3f)){
return _3d;
}
return ((_3f).location+(_3f).length)-1;
}
}),new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"),function(_40,_41,_42){
with(_40){
return objj_msgSend(_40,"indexGreaterThanIndex:",_42-1);
}
}),new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"indexLessThanIndex:",_45+1);
}
}),new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"),function(_46,_47,_48,_49,_4a){
with(_46){
if(!_count||_49===0||_4a&&!_4a.length){
if(_4a){
_4a.length=0;
}
return 0;
}
var _4b=0;
if(_4a){
var _4c=_4a.location,_4d=((_4a).location+(_4a).length)-1,_4e=CEIL(_2e(_ranges,_4c)),_4f=FLOOR(_2e(_ranges,_4d));
}else{
var _4c=objj_msgSend(_46,"firstIndex"),_4d=objj_msgSend(_46,"lastIndex"),_4e=0,_4f=_ranges.length-1;
}
while(_4e<=_4f){
var _50=_ranges[_4e],_51=MAX(_4c,_50.location),_52=MIN(_4d+1,((_50).location+(_50).length));
for(;_51<_52;++_51){
_48[_4b++]=_51;
if(_4b===_49){
if(_4a){
_4a.location=_51+1;
_4a.length=_4d+1-_51-1;
}
return _49;
}
}
++_4e;
}
if(_4a){
_4a.location=CPNotFound;
_4a.length=0;
}
return _4b;
}
}),new objj_method(sel_getUid("description"),function(_53,_54){
with(_53){
var _55=objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPIndexSet").super_class},"description");
if(_count){
var _56=0,_57=_ranges.length;
_55+="[number of indexes: "+_count+" (in "+_57;
if(_57===1){
_55+=" range), indexes: (";
}else{
_55+=" ranges), indexes: (";
}
for(;_56<_57;++_56){
var _58=_ranges[_56];
_55+=_58.location;
if(_58.length>1){
_55+="-"+(CPMaxRange(_58)-1);
}
if(_56+1<_57){
_55+=" ";
}
}
_55+=")]";
}else{
_55+="(no indexes)";
}
return _55;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("indexSet"),function(_59,_5a){
with(_59){
return objj_msgSend(objj_msgSend(_59,"alloc"),"init");
}
}),new objj_method(sel_getUid("indexSetWithIndex:"),function(_5b,_5c,_5d){
with(_5b){
return objj_msgSend(objj_msgSend(_5b,"alloc"),"initWithIndex:",_5d);
}
}),new objj_method(sel_getUid("indexSetWithIndexesInRange:"),function(_5e,_5f,_60){
with(_5e){
return objj_msgSend(objj_msgSend(_5e,"alloc"),"initWithIndexesInRange:",_60);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addIndex:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"addIndexesInRange:",{location:(_63),length:1});
}
}),new objj_method(sel_getUid("addIndexes:"),function(_64,_65,_66){
with(_64){
var _67=_66._ranges,_68=_67.length;
while(_68--){
objj_msgSend(_64,"addIndexesInRange:",_67[_68]);
}
}
}),new objj_method(sel_getUid("addIndexesInRange:"),function(_69,_6a,_6b){
with(_69){
if(_6b.length<=0){
return;
}
if(_count<=0){
_count=_6b.length;
_ranges=[_6b];
return;
}
var _6c=_ranges.length,_6d=_2e(_ranges,_6b.location-1),_6e=CEIL(_6d);
if(_6e===_6d&&_6e<_6c){
_6b=CPUnionRange(_6b,_ranges[_6e]);
}
var _6f=_2e(_ranges,CPMaxRange(_6b)),_70=FLOOR(_6f);
if(_70===_6f&&_70>=0){
_6b=CPUnionRange(_6b,_ranges[_70]);
}
var _71=_70-_6e+1;
if(_71===_ranges.length){
_ranges=[_6b];
_count=_6b.length;
}else{
if(_71===1){
if(_6e<_ranges.length){
_count-=_ranges[_6e].length;
}
_count+=_6b.length;
_ranges[_6e]=_6b;
}else{
if(_71>0){
var _72=_6e,_73=_6e+_71-1;
for(;_72<=_73;++_72){
_count-=_ranges[_72].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_6e),length:_71});
}
objj_msgSend(_ranges,"insertObject:atIndex:",_6b,_6e);
_count+=_6b.length;
}
}
}
}),new objj_method(sel_getUid("removeIndex:"),function(_74,_75,_76){
with(_74){
objj_msgSend(_74,"removeIndexesInRange:",{location:(_76),length:1});
}
}),new objj_method(sel_getUid("removeIndexes:"),function(_77,_78,_79){
with(_77){
var _7a=_79._ranges,_7b=_7a.length;
while(_7b--){
objj_msgSend(_77,"removeIndexesInRange:",_7a[_7b]);
}
}
}),new objj_method(sel_getUid("removeAllIndexes"),function(_7c,_7d){
with(_7c){
_ranges=[];
_count=0;
}
}),new objj_method(sel_getUid("removeIndexesInRange:"),function(_7e,_7f,_80){
with(_7e){
if(_80.length<=0){
return;
}
if(_count<=0){
return;
}
var _81=_ranges.length,_82=_2e(_ranges,_80.location),_83=CEIL(_82);
if(_82===_83&&_83<_81){
var _84=_ranges[_83];
if(_80.location!==_84.location){
var _85=CPMaxRange(_80),_86=CPMaxRange(_84);
_84.length=_80.location-_84.location;
if(_85<_86){
_count-=_80.length;
objj_msgSend(_ranges,"insertObject:atIndex:",{location:(_85),length:_86-_85},_83+1);
return;
}else{
_count-=_86-_80.location;
_83+=1;
}
}
}
var _87=_2e(_ranges,CPMaxRange(_80)-1),_88=FLOOR(_87);
if(_87===_88&&_88>=0){
var _85=CPMaxRange(_80),_84=_ranges[_88],_86=CPMaxRange(_84);
if(_85!==_86){
_count-=_85-_84.location;
_88-=1;
_84.location=_85;
_84.length=_86-_85;
}
}
var _89=_88-_83+1;
if(_89>0){
var _8a=_83,_8b=_83+_89-1;
for(;_8a<=_8b;++_8a){
_count-=_ranges[_8a].length;
}
objj_msgSend(_ranges,"removeObjectsInRange:",{location:(_83),length:_89});
}
}
}),new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"),function(_8c,_8d,_8e,_8f){
with(_8c){
if(!_count||_8f==0){
return;
}
var i=_ranges.length-1,_90=CPMakeRange(CPNotFound,0);
for(;i>=0;--i){
var _91=_ranges[i],_92=CPMaxRange(_91);
if(_8e>=_92){
break;
}
if(_8e>_91.location){
_90=CPMakeRange(_8e+_8f,_92-_8e);
_91.length=_8e-_91.location;
if(_8f>0){
objj_msgSend(_ranges,"insertObject:atIndex:",_90,i+1);
}else{
if(_90.location<0){
_90.length=CPMaxRange(_90);
_90.location=0;
}
}
break;
}
if((_91.location+=_8f)<0){
_91.length=CPMaxRange(_91);
_91.location=0;
}
}
if(_8f<0){
var j=i+1,_93=_ranges.length,_94=[];
for(;j<_93;++j){
objj_msgSend(_94,"addObject:",_ranges[j]);
_count-=_ranges[j].length;
}
if((j=i+1)<_93){
objj_msgSend(_ranges,"removeObjectsInRange:",CPMakeRange(j,_93-j));
for(j=0,_93=_94.length;j<_93;++j){
objj_msgSend(_8c,"addIndexesInRange:",_94[j]);
}
}
if(_90.location!=CPNotFound){
objj_msgSend(_8c,"addIndexesInRange:",_90);
}
}
}
})]);
var _95="CPIndexSetCountKey",_96="CPIndexSetRangeStringsKey";
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_97,_98,_99){
with(_97){
_97=objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPIndexSet").super_class},"init");
if(_97){
_count=objj_msgSend(_99,"decodeIntForKey:",_95);
_ranges=[];
var _9a=objj_msgSend(_99,"decodeObjectForKey:",_96),_9b=0,_9c=_9a.length;
for(;_9b<_9c;++_9b){
_ranges.push(CPRangeFromString(_9a[_9b]));
}
}
return _97;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9d,_9e,_9f){
with(_9d){
objj_msgSend(_9f,"encodeInt:forKey:",_count,_95);
var _a0=0,_a1=_ranges.length,_a2=[];
for(;_a0<_a1;++_a0){
_a2[_a0]=CPStringFromRange(_ranges[_a0]);
}
objj_msgSend(_9f,"encodeObject:forKey:",_a2,_96);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPIndexSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_a3,_a4){
with(_a3){
return objj_msgSend(objj_msgSend(objj_msgSend(_a3,"class"),"alloc"),"initWithIndexSet:",_a3);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_a5,_a6){
with(_a5){
return objj_msgSend(objj_msgSend(objj_msgSend(_a5,"class"),"alloc"),"initWithIndexSet:",_a5);
}
})]);
var _1=objj_allocateClassPair(CPIndexSet,"CPMutableIndexSet"),_2=_1.isa;
objj_registerClassPair(_1);
var _1e=function(_a7,_a8){
var low=0,_a9=_a7.length-1;
while(low<=_a9){
var _aa=FLOOR(low+(_a9-low)/2),_ab=_a7[_aa];
if(_a8<_ab.location){
_a9=_aa-1;
}else{
if(_a8>=CPMaxRange(_ab)){
low=_aa+1;
}else{
return _aa;
}
}
}
return CPNotFound;
};
var _2e=function(_ac,_ad){
var _ae=_ac.length;
if(_ae<=0){
return CPNotFound;
}
var low=0,_af=_ae*2;
while(low<=_af){
var _b0=FLOOR(low+(_af-low)/2),_b1=_b0/2,_b2=FLOOR(_b1);
if(_b1===_b2){
if(_b2-1>=0&&_ad<CPMaxRange(_ac[_b2-1])){
_af=_b0-1;
}else{
if(_b2<_ae&&_ad>=_ac[_b2].location){
low=_b0+1;
}else{
return _b2-0.5;
}
}
}else{
var _b3=_ac[_b2];
if(_ad<_b3.location){
_af=_b0-1;
}else{
if(_ad>=CPMaxRange(_b3)){
low=_b0+1;
}else{
return _b2;
}
}
}
}
return CPNotFound;
};
p;14;CPInvocation.jt;2659;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;2607;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPInvocation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_returnValue"),new objj_ivar("_arguments"),new objj_ivar("_methodSignature")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithMethodSignature:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPInvocation").super_class},"init");
if(_3){
_arguments=[];
_methodSignature=_5;
}
return _3;
}
}),new objj_method(sel_getUid("setSelector:"),function(_6,_7,_8){
with(_6){
_arguments[1]=_8;
}
}),new objj_method(sel_getUid("selector"),function(_9,_a){
with(_9){
return _arguments[1];
}
}),new objj_method(sel_getUid("setTarget:"),function(_b,_c,_d){
with(_b){
_arguments[0]=_d;
}
}),new objj_method(sel_getUid("target"),function(_e,_f){
with(_e){
return _arguments[0];
}
}),new objj_method(sel_getUid("setArgument:atIndex:"),function(_10,_11,_12,_13){
with(_10){
_arguments[_13]=_12;
}
}),new objj_method(sel_getUid("argumentAtIndex:"),function(_14,_15,_16){
with(_14){
return _arguments[_16];
}
}),new objj_method(sel_getUid("setReturnValue:"),function(_17,_18,_19){
with(_17){
_returnValue=_19;
}
}),new objj_method(sel_getUid("returnValue"),function(_1a,_1b){
with(_1a){
return _returnValue;
}
}),new objj_method(sel_getUid("invoke"),function(_1c,_1d){
with(_1c){
_returnValue=objj_msgSend.apply(objj_msgSend,_arguments);
}
}),new objj_method(sel_getUid("invokeWithTarget:"),function(_1e,_1f,_20){
with(_1e){
_arguments[0]=_20;
_returnValue=objj_msgSend.apply(objj_msgSend,_arguments);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("invocationWithMethodSignature:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(_21,"alloc"),"initWithMethodSignature:",_23);
}
})]);
var _24="CPInvocationArguments",_25="CPInvocationReturnValue";
var _1=objj_getClass("CPInvocation");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPInvocation\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("CPInvocation").super_class},"init");
if(_26){
_returnValue=objj_msgSend(_28,"decodeObjectForKey:",_25);
_arguments=objj_msgSend(_28,"decodeObjectForKey:",_24);
}
return _26;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_2b,"encodeObject:forKey:",_returnValue,_25);
objj_msgSend(_2b,"encodeObject:forKey:",_arguments,_24);
}
})]);
p;23;CPInvocationOperation.jt;1480;@STATIC;1.0;i;14;CPInvocation.ji;10;CPObject.ji;13;CPOperation.jt;1409;
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPOperation.j",YES);
var _1=objj_allocateClassPair(CPOperation,"CPInvocationOperation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_invocation")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("main"),function(_3,_4){
with(_3){
if(_invocation){
objj_msgSend(_invocation,"invoke");
}
}
}),new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPInvocationOperation").super_class},"init")){
_invocation=nil;
}
return _5;
}
}),new objj_method(sel_getUid("initWithInvocation:"),function(_7,_8,_9){
with(_7){
if(_7=objj_msgSend(_7,"init")){
_invocation=_9;
}
return _7;
}
}),new objj_method(sel_getUid("initWithTarget:selector:object:"),function(_a,_b,_c,_d,_e){
with(_a){
var _f=objj_msgSend(objj_msgSend(CPInvocation,"alloc"),"initWithMethodSignature:",nil);
objj_msgSend(_f,"setTarget:",_c);
objj_msgSend(_f,"setSelector:",_d);
objj_msgSend(_f,"setArgument:atIndex:",_e,2);
return objj_msgSend(_a,"initWithInvocation:",_f);
}
}),new objj_method(sel_getUid("invocation"),function(_10,_11){
with(_10){
return _invocation;
}
}),new objj_method(sel_getUid("result"),function(_12,_13){
with(_12){
if(objj_msgSend(_12,"isFinished")&&_invocation){
return objj_msgSend(_invocation,"returnValue");
}
return nil;
}
})]);
p;19;CPJSONPConnection.jt;3704;@STATIC;1.0;i;10;CPObject.jt;3670;
objj_executeFile("CPObject.j",YES);
CPJSONPConnectionCallbacks={};
CPJSONPCallbackReplacementString="${JSONP_CALLBACK}";
var _1=objj_allocateClassPair(CPObject,"CPJSONPConnection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_callbackParameter"),new objj_ivar("_scriptTag")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRequest:callback:delegate:"),function(_3,_4,_5,_6,_7){
with(_3){
return objj_msgSend(_3,"initWithRequest:callback:delegate:startImmediately:",_5,_6,_7,NO);
}
}),new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:"),function(_8,_9,_a,_b,_c,_d){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPJSONPConnection").super_class},"init");
_request=_a;
_delegate=_c;
_callbackParameter=_b;
if(!_callbackParameter&&objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString").indexOf(CPJSONPCallbackReplacementString)<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"JSONP source specified without callback parameter or CPJSONPCallbackReplacementString in URL.");
}
if(_d){
objj_msgSend(_8,"start");
}
return _8;
}
}),new objj_method(sel_getUid("start"),function(_e,_f){
with(_e){
try{
CPJSONPConnectionCallbacks["callback"+objj_msgSend(_e,"UID")]=function(_10){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveData:"))){
objj_msgSend(_delegate,"connection:didReceiveData:",_e,_10);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connectionDidFinishLoading:"))){
objj_msgSend(_delegate,"connectionDidFinishLoading:",_e);
}
objj_msgSend(_e,"removeScriptTag");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
var _11=document.getElementsByTagName("head").item(0),_12=objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString");
if(_callbackParameter){
_12+=(_12.indexOf("?")<0)?"?":"&";
_12+=_callbackParameter+"=CPJSONPConnectionCallbacks.callback"+objj_msgSend(_e,"UID");
}else{
if(_12.indexOf(CPJSONPCallbackReplacementString)>=0){
_12=objj_msgSend(_12,"stringByReplacingOccurrencesOfString:withString:",CPJSONPCallbackReplacementString,"CPJSONPConnectionCallbacks.callback"+objj_msgSend(_e,"UID"));
}else{
return;
}
}
_scriptTag=document.createElement("script");
_scriptTag.setAttribute("type","text/javascript");
_scriptTag.setAttribute("charset","utf-8");
_scriptTag.setAttribute("src",_12);
_11.appendChild(_scriptTag);
}
catch(exception){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didFailWithError:"))){
objj_msgSend(_delegate,"connection:didFailWithError:",_e,exception);
}
objj_msgSend(_e,"removeScriptTag");
}
}
}),new objj_method(sel_getUid("removeScriptTag"),function(_13,_14){
with(_13){
var _15=document.getElementsByTagName("head").item(0);
if(_scriptTag&&_scriptTag.parentNode==_15){
_15.removeChild(_scriptTag);
}
CPJSONPConnectionCallbacks["callback"+objj_msgSend(_13,"UID")]=nil;
delete CPJSONPConnectionCallbacks["callback"+objj_msgSend(_13,"UID")];
}
}),new objj_method(sel_getUid("cancel"),function(_16,_17){
with(_16){
objj_msgSend(_16,"removeScriptTag");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sendRequest:callback:delegate:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
return objj_msgSend(_18,"connectionWithRequest:callback:delegate:",_1a,_1b,_1c);
}
}),new objj_method(sel_getUid("connectionWithRequest:callback:delegate:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
return objj_msgSend(objj_msgSend(objj_msgSend(_1d,"class"),"alloc"),"initWithRequest:callback:delegate:startImmediately:",_1f,_20,_21,YES);
}
})]);
p;17;CPKeyedArchiver.jt;10342;@STATIC;1.0;i;9;CPArray.ji;9;CPCoder.ji;8;CPData.ji;14;CPDictionary.ji;10;CPNumber.ji;10;CPString.ji;9;CPValue.jt;10222;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPValue.j",YES);
var _1=nil;
var _2=1,_3=2,_4=4,_5=8,_6=16;
var _7="$null",_8=nil,_9="CP$UID",_a="$top",_b="$objects",_c="$archiver",_d="$version",_e="$classname",_f="$classes",_10="$class";
var _11=Nil,_12=Nil;
var _13=objj_allocateClassPair(CPValue,"_CPKeyedArchiverValue"),_14=_13.isa;
objj_registerClassPair(_13);
var _13=objj_allocateClassPair(CPCoder,"CPKeyedArchiver"),_14=_13.isa;
class_addIvars(_13,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_objects"),new objj_ivar("_UIDs"),new objj_ivar("_conditionalUIDs"),new objj_ivar("_replacementObjects"),new objj_ivar("_replacementClassNames"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects"),new objj_ivar("_outputFormat")]);
objj_registerClassPair(_13);
class_addMethods(_13,[new objj_method(sel_getUid("initForWritingWithMutableData:"),function(_15,_16,_17){
with(_15){
_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("CPKeyedArchiver").super_class},"init");
if(_15){
_data=_17;
_objects=[];
_UIDs=objj_msgSend(CPDictionary,"dictionary");
_conditionalUIDs=objj_msgSend(CPDictionary,"dictionary");
_replacementObjects=objj_msgSend(CPDictionary,"dictionary");
_data=_17;
_plistObject=objj_msgSend(CPDictionary,"dictionary");
_plistObjects=objj_msgSend(CPArray,"arrayWithObject:",_7);
}
return _15;
}
}),new objj_method(sel_getUid("finishEncoding"),function(_18,_19){
with(_18){
if(_delegate&&_delegateSelectors&_6){
objj_msgSend(_delegate,"archiverWillFinish:",_18);
}
var i=0,_1a=_plistObject,_1b=[];
for(;i<_objects.length;++i){
var _1c=_objects[i],_1d=objj_msgSend(_1c,"classForKeyedArchiver");
_plistObject=_plistObjects[objj_msgSend(_UIDs,"objectForKey:",objj_msgSend(_1c,"UID"))];
objj_msgSend(_1c,"encodeWithCoder:",_18);
if(_delegate&&_delegateSelectors&_2){
objj_msgSend(_delegate,"archiver:didEncodeObject:",_18,_1c);
}
}
_plistObject=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_plistObject,"setObject:forKey:",_1a,_a);
objj_msgSend(_plistObject,"setObject:forKey:",_plistObjects,_b);
objj_msgSend(_plistObject,"setObject:forKey:",objj_msgSend(_18,"className"),_c);
objj_msgSend(_plistObject,"setObject:forKey:","100000",_d);
objj_msgSend(_data,"setPlistObject:",_plistObject);
if(_delegate&&_delegateSelectors&_5){
objj_msgSend(_delegate,"archiverDidFinish:",_18);
}
}
}),new objj_method(sel_getUid("outputFormat"),function(_1e,_1f){
with(_1e){
return _outputFormat;
}
}),new objj_method(sel_getUid("setOutputFormat:"),function(_20,_21,_22){
with(_20){
_outputFormat=_22;
}
}),new objj_method(sel_getUid("encodeBool:forKey:"),function(_23,_24,_25,_26){
with(_23){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_23,_25,NO),_26);
}
}),new objj_method(sel_getUid("encodeDouble:forKey:"),function(_28,_29,_2a,_2b){
with(_28){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_28,_2a,NO),_2b);
}
}),new objj_method(sel_getUid("encodeFloat:forKey:"),function(_2c,_2d,_2e,_2f){
with(_2c){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_2c,_2e,NO),_2f);
}
}),new objj_method(sel_getUid("encodeInt:forKey:"),function(_30,_31,_32,_33){
with(_30){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_30,_32,NO),_33);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_34,_35,_36){
with(_34){
_delegate=_36;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didEncodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willEncodeObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:didFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverDidFinishEncodingSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("archiver:willFinishEncoding:"))){
_delegateSelectors|=_CPKeyedArchiverWillFinishEncodingSelector;
}
}
}),new objj_method(sel_getUid("delegate"),function(_37,_38){
with(_37){
return _delegate;
}
}),new objj_method(sel_getUid("encodePoint:forKey:"),function(_39,_3a,_3b,_3c){
with(_39){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_39,CPStringFromPoint(_3b),NO),_3c);
}
}),new objj_method(sel_getUid("encodeRect:forKey:"),function(_3d,_3e,_3f,_40){
with(_3d){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_3d,CPStringFromRect(_3f),NO),_40);
}
}),new objj_method(sel_getUid("encodeSize:forKey:"),function(_41,_42,_43,_44){
with(_41){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_41,CPStringFromSize(_43),NO),_44);
}
}),new objj_method(sel_getUid("encodeConditionalObject:forKey:"),function(_45,_46,_47,_48){
with(_45){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_45,_47,YES),_48);
}
}),new objj_method(sel_getUid("encodeNumber:forKey:"),function(_49,_4a,_4b,_4c){
with(_49){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_49,_4b,NO),_4c);
}
}),new objj_method(sel_getUid("encodeObject:forKey:"),function(_4d,_4e,_4f,_50){
with(_4d){
objj_msgSend(_plistObject,"setObject:forKey:",_27(_4d,_4f,NO),_50);
}
}),new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"),function(_51,_52,_53,_54){
with(_51){
var i=0,_55=_53.length,_56=objj_msgSend(CPArray,"arrayWithCapacity:",_55);
for(;i<_55;++i){
objj_msgSend(_56,"addObject:",_27(_51,_53[i],NO));
}
objj_msgSend(_plistObject,"setObject:forKey:",_56,_54);
}
}),new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"),function(_57,_58,_59,_5a){
with(_57){
var key,_5b=objj_msgSend(_59,"keyEnumerator"),_5c=objj_msgSend(CPDictionary,"dictionary");
while(key=objj_msgSend(_5b,"nextObject")){
objj_msgSend(_5c,"setObject:forKey:",_27(_57,objj_msgSend(_59,"objectForKey:",key),NO),key);
}
objj_msgSend(_plistObject,"setObject:forKey:",_5c,_5a);
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_5d,_5e,_5f,_60){
with(_5d){
if(!_replacementClassNames){
_replacementClassNames=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_replacementClassNames,"setObject:forKey:",_5f,CPStringFromClass(_60));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_61,_62,_63){
with(_61){
if(!_replacementClassNames){
return _63.name;
}
var _64=objj_msgSend(_replacementClassNames,"objectForKey:",CPStringFromClass(aClassName));
return _64?_64:_63.name;
}
})]);
class_addMethods(_14,[new objj_method(sel_getUid("initialize"),function(_65,_66){
with(_65){
if(_65!=objj_msgSend(CPKeyedArchiver,"class")){
return;
}
_11=objj_msgSend(CPString,"class");
_12=objj_msgSend(CPNumber,"class");
_8=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",0,_9);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_67,_68){
with(_67){
return YES;
}
}),new objj_method(sel_getUid("archivedDataWithRootObject:"),function(_69,_6a,_6b){
with(_69){
var _6c=objj_msgSend(CPData,"dataWithPlistObject:",nil),_6d=objj_msgSend(objj_msgSend(_69,"alloc"),"initForWritingWithMutableData:",_6c);
objj_msgSend(_6d,"encodeObject:forKey:",_6b,"root");
objj_msgSend(_6d,"finishEncoding");
return _6c;
}
}),new objj_method(sel_getUid("setClassName:forClass:"),function(_6e,_6f,_70,_71){
with(_6e){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_1,"setObject:forKey:",_70,CPStringFromClass(_71));
}
}),new objj_method(sel_getUid("classNameForClass:"),function(_72,_73,_74){
with(_72){
if(!_1){
return _74.name;
}
var _75=objj_msgSend(_1,"objectForKey:",CPStringFromClass(aClassName));
return _75?_75:_74.name;
}
})]);
var _27=function(_76,_77,_78){
if(_77!==nil&&!_77.isa){
_77=objj_msgSend(_CPKeyedArchiverValue,"valueWithJSObject:",_77);
}
var _79=objj_msgSend(_77,"UID"),_7a=objj_msgSend(_76._replacementObjects,"objectForKey:",_79);
if(_7a===nil){
_7a=objj_msgSend(_77,"replacementObjectForKeyedArchiver:",_76);
if(_76._delegate){
if(_7a!==_77&&_76._delegateSelectors&_4){
objj_msgSend(_76._delegate,"archiver:willReplaceObject:withObject:",_76,_77,_7a);
}
if(_76._delegateSelectors&_3){
_77=objj_msgSend(_76._delegate,"archiver:willEncodeObject:",_76,_7a);
if(_77!==_7a&&_76._delegateSelectors&_4){
objj_msgSend(_76._delegate,"archiver:willReplaceObject:withObject:",_76,_7a,_77);
}
_7a=_77;
}
}
objj_msgSend(_76._replacementObjects,"setObject:forKey:",_7a,_79);
}
if(_7a===nil){
return _8;
}
var UID=objj_msgSend(_76._UIDs,"objectForKey:",_79=objj_msgSend(_7a,"UID"));
if(UID===nil){
if(_78){
if((UID=objj_msgSend(_76._conditionalUIDs,"objectForKey:",_79))===nil){
objj_msgSend(_76._conditionalUIDs,"setObject:forKey:",UID=objj_msgSend(_76._plistObjects,"count"),_79);
objj_msgSend(_76._plistObjects,"addObject:",_7);
}
}else{
var _7b=objj_msgSend(_7a,"classForKeyedArchiver"),_7c=nil;
if((_7b===_11)||(_7b===_12)){
_7c=_7a;
}else{
_7c=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_76._objects,"addObject:",_7a);
var _7d=objj_msgSend(_76,"classNameForClass:",_7b);
if(!_7d){
_7d=objj_msgSend(objj_msgSend(_76,"class"),"classNameForClass:",_7b);
}
if(!_7d){
_7d=_7b.name;
}else{
_7b=CPClassFromString(_7d);
}
var _7e=objj_msgSend(_76._UIDs,"objectForKey:",_7d);
if(!_7e){
var _7f=objj_msgSend(CPDictionary,"dictionary"),_80=[];
objj_msgSend(_7f,"setObject:forKey:",_7d,_e);
do{
objj_msgSend(_80,"addObject:",CPStringFromClass(_7b));
}while(_7b=objj_msgSend(_7b,"superclass"));
objj_msgSend(_7f,"setObject:forKey:",_80,_f);
_7e=objj_msgSend(_76._plistObjects,"count");
objj_msgSend(_76._plistObjects,"addObject:",_7f);
objj_msgSend(_76._UIDs,"setObject:forKey:",_7e,_7d);
}
objj_msgSend(_7c,"setObject:forKey:",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_7e,_9),_10);
}
UID=objj_msgSend(_76._conditionalUIDs,"objectForKey:",_79);
if(UID!==nil){
objj_msgSend(_76._UIDs,"setObject:forKey:",UID,_79);
objj_msgSend(_76._plistObjects,"replaceObjectAtIndex:withObject:",UID,_7c);
}else{
objj_msgSend(_76._UIDs,"setObject:forKey:",UID=objj_msgSend(_76._plistObjects,"count"),_79);
objj_msgSend(_76._plistObjects,"addObject:",_7c);
}
}
}
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",UID,_9);
};
p;19;CPKeyedUnarchiver.jt;8538;@STATIC;1.0;i;9;CPCoder.ji;8;CPNull.jt;8494;
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPNull.j",YES);
CPInvalidUnarchiveOperationException="CPInvalidUnarchiveOperationException";
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5;
var _7="$null";
_CPKeyedArchiverUIDKey="CP$UID",_CPKeyedArchiverTopKey="$top",_CPKeyedArchiverObjectsKey="$objects",_CPKeyedArchiverArchiverKey="$archiver",_CPKeyedArchiverVersionKey="$version",_CPKeyedArchiverClassNameKey="$classname",_CPKeyedArchiverClassesKey="$classes",_CPKeyedArchiverClassKey="$class";
var _8=Nil,_9=Nil,_a=Nil,_b=Nil,_c=Nil,_d=Nil,_e=Nil,_f=Nil;
var _10=objj_allocateClassPair(CPCoder,"CPKeyedUnarchiver"),_11=_10.isa;
class_addIvars(_10,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_replacementClasses"),new objj_ivar("_objects"),new objj_ivar("_archive"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects")]);
objj_registerClassPair(_10);
class_addMethods(_10,[new objj_method(sel_getUid("initForReadingWithData:"),function(_12,_13,_14){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPKeyedUnarchiver").super_class},"init");
if(_12){
_archive=objj_msgSend(_14,"plistObject");
_objects=[objj_msgSend(CPNull,"null")];
_plistObject=objj_msgSend(_archive,"objectForKey:",_CPKeyedArchiverTopKey);
_plistObjects=objj_msgSend(_archive,"objectForKey:",_CPKeyedArchiverObjectsKey);
_replacementClasses=new CFMutableDictionary();
}
return _12;
}
}),new objj_method(sel_getUid("containsValueForKey:"),function(_15,_16,_17){
with(_15){
return _plistObject.valueForKey(_17)!=nil;
}
}),new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"),function(_18,_19,_1a){
with(_18){
var _1b=_plistObject.valueForKey(_1a),_1c=(_1b!=nil)&&_1b.isa;
if(_1c===_b||_1c===_c){
var _1d=_1b.keys(),_1e=0,_1f=_1d.length,_20=new CFMutableDictionary();
for(;_1e<_1f;++_1e){
var key=_1d[_1e];
_20.setValueForKey(key,_21(_18,_1b.valueForKey(key).valueForKey(_CPKeyedArchiverUIDKey)));
}
return _20;
}
return nil;
}
}),new objj_method(sel_getUid("decodeBoolForKey:"),function(_22,_23,_24){
with(_22){
return objj_msgSend(_22,"decodeObjectForKey:",_24);
}
}),new objj_method(sel_getUid("decodeFloatForKey:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,"decodeObjectForKey:",_27);
}
}),new objj_method(sel_getUid("decodeDoubleForKey:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(_28,"decodeObjectForKey:",_2a);
}
}),new objj_method(sel_getUid("decodeIntForKey:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_2b,"decodeObjectForKey:",_2d);
}
}),new objj_method(sel_getUid("decodePointForKey:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"decodeObjectForKey:",_30);
if(_31){
return CPPointFromString(_31);
}else{
return CPPointMake(0,0);
}
}
}),new objj_method(sel_getUid("decodeRectForKey:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"decodeObjectForKey:",_34);
if(_35){
return CPRectFromString(_35);
}else{
return CPRectMakeZero();
}
}
}),new objj_method(sel_getUid("decodeSizeForKey:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_36,"decodeObjectForKey:",_38);
if(_39){
return CPSizeFromString(_39);
}else{
return CPSizeMake(0,0);
}
}
}),new objj_method(sel_getUid("decodeObjectForKey:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=_plistObject.valueForKey(_3c),_3e=(_3d!=nil)&&_3d.isa;
if(_3e===_b||_3e===_c){
return _21(_3a,_3d.valueForKey(_CPKeyedArchiverUIDKey));
}else{
if(_3e===_d||_3e===_e||_3e===_a){
return _3d;
}else{
if(_3e===_8||_3e===_9){
var _3f=0,_40=_3d.length,_41=[];
for(;_3f<_40;++_3f){
_41[_3f]=_21(_3a,_3d[_3f].valueForKey(_CPKeyedArchiverUIDKey));
}
return _41;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("decodeBytesForKey:"),function(_42,_43,_44){
with(_42){
var _45=objj_msgSend(_42,"decodeObjectForKey:",_44);
if(!_45){
return nil;
}
var _46=_45.isa;
if(_46===_e){
return _45.bytes;
}
return nil;
}
}),new objj_method(sel_getUid("finishDecoding"),function(_47,_48){
with(_47){
if(_delegateSelectors&_4){
objj_msgSend(_delegate,"unarchiverWillFinish:",_47);
}
if(_delegateSelectors&_5){
objj_msgSend(_delegate,"unarchiverDidFinish:",_47);
}
}
}),new objj_method(sel_getUid("delegate"),function(_49,_4a){
with(_49){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_4b,_4c,_4d){
with(_4b){
_delegate=_4d;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:didDecodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverWillFinish:"))){
_delegateSelectors|=_CPKeyedUnarchiverWilFinishSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverDidFinish:"))){
_delegateSelectors|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_6;
}
}
}),new objj_method(sel_getUid("setClass:forClassName:"),function(_4e,_4f,_50,_51){
with(_4e){
_replacementClasses.setValueForKey(_51,_50);
}
}),new objj_method(sel_getUid("classForClassName:"),function(_52,_53,_54){
with(_52){
return _replacementClasses.valueForKey(_54);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_55,_56){
with(_55){
return YES;
}
})]);
class_addMethods(_11,[new objj_method(sel_getUid("initialize"),function(_57,_58){
with(_57){
if(_57!==objj_msgSend(CPKeyedUnarchiver,"class")){
return;
}
_8=objj_msgSend(CPArray,"class");
_9=objj_msgSend(CPMutableArray,"class");
_a=objj_msgSend(CPString,"class");
_b=objj_msgSend(CPDictionary,"class");
_c=objj_msgSend(CPMutableDictionary,"class");
_d=objj_msgSend(CPNumber,"class");
_e=objj_msgSend(CPData,"class");
_f=objj_msgSend(_CPKeyedArchiverValue,"class");
}
}),new objj_method(sel_getUid("unarchiveObjectWithData:"),function(_59,_5a,_5b){
with(_59){
if(!_5b){
CPLog.error("Null data passed to -[CPKeyedUnarchiver unarchiveObjectWithData:].");
return nil;
}
var _5c=objj_msgSend(objj_msgSend(_59,"alloc"),"initForReadingWithData:",_5b),_5d=objj_msgSend(_5c,"decodeObjectForKey:","root");
objj_msgSend(_5c,"finishDecoding");
return _5d;
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:"),function(_5e,_5f,_60){
with(_5e){
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"),function(_61,_62,_63,_64){
with(_61){
}
})]);
var _21=function(_65,_66){
var _67=_65._objects[_66];
if(_67){
if(_67===_65._objects[0]){
return nil;
}else{
return _67;
}
}
var _67,_68=_65._plistObjects[_66],_69=_68.isa;
if(_69===_b||_69===_c){
var _6a=_65._plistObjects[_68.valueForKey(_CPKeyedArchiverClassKey).valueForKey(_CPKeyedArchiverUIDKey)],_6b=_6a.valueForKey(_CPKeyedArchiverClassNameKey),_6c=_6a.valueForKey(_CPKeyedArchiverClassesKey),_6d=objj_msgSend(_65,"classForClassName:",_6b);
if(!_6d){
_6d=CPClassFromString(_6b);
}
if(!_6d&&(_65._delegateSelectors&_6)){
_6d=objj_msgSend(_delegate,"unarchiver:cannotDecodeObjectOfClassName:originalClasses:",_65,_6b,_6c);
}
if(!_6d){
objj_msgSend(CPException,"raise:reason:",CPInvalidUnarchiveOperationException,"-[CPKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class ("+_6b+")");
}
var _6e=_65._plistObject;
_65._plistObject=_68;
_67=objj_msgSend(_6d,"allocWithCoder:",_65);
_65._objects[_66]=_67;
var _6f=objj_msgSend(_67,"initWithCoder:",_65);
_65._plistObject=_6e;
if(_6f!==_67){
if(_65._delegateSelectors&_3){
objj_msgSend(_65._delegate,"unarchiver:willReplaceObject:withObject:",_65,_67,_6f);
}
_67=_6f;
_65._objects[_66]=_6f;
}
_6f=objj_msgSend(_67,"awakeAfterUsingCoder:",_65);
if(_6f!==_67){
if(_65._delegateSelectors&_3){
objj_msgSend(_65._delegate,"unarchiver:willReplaceObject:withObject:",_65,_67,_6f);
}
_67=_6f;
_65._objects[_66]=_6f;
}
if(_65._delegate){
if(_65._delegateSelectors&_2){
_6f=objj_msgSend(_65._delegate,"unarchiver:didDecodeObject:",_65,_67);
}
if(_6f!=_67){
if(_65._delegateSelectors&_3){
objj_msgSend(_65._delegate,"unarchiver:willReplaceObject:withObject:",_65,_67,_6f);
}
_67=_6f;
_65._objects[_66]=_6f;
}
}
}else{
_65._objects[_66]=_67=_68;
if(objj_msgSend(_67,"class")===_a){
if(_67===_7){
_65._objects[_66]=_65._objects[0];
return nil;
}else{
_65._objects[_66]=_67=_68;
}
}
}
if((_67!=nil)&&(_67.isa===_f)){
_67=objj_msgSend(_67,"JSObject");
}
return _67;
};
p;18;CPKeyValueCoding.jt;7312;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;8;CPNull.ji;10;CPObject.ji;21;CPKeyValueObserving.ji;13;CPArray+KVO.jt;7190;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=nil,_2=nil;
CPUndefinedKeyException="CPUndefinedKeyException";
CPTargetObjectUserInfoKey="CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey="CPUnknownUserInfoKey";
var _3="$CPObjectAccessorsForClassKey",_4="$CPObjectModifiersForClassKey";
var _5=objj_getClass("CPObject");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("_ivarForKey:"),function(_7,_8,_9){
with(_7){
var _a="_"+_9;
if(typeof _7[_a]!="undefined"){
return _a;
}
var _b="is"+_9.charAt(0).toUpperCase()+_9.substr(1);
_a="_"+_b;
if(typeof _7[_a]!="undefined"){
return _a;
}
_a=_9;
if(typeof _7[_a]!="undefined"){
return _a;
}
_a=_b;
if(typeof _7[_a]!="undefined"){
return _a;
}
return nil;
}
}),new objj_method(sel_getUid("valueForKey:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_c,"class"),_10=_11(_f,_e);
if(_10){
return objj_msgSend(_c,_10);
}
if(objj_msgSend(_f,"accessInstanceVariablesDirectly")){
var _12=objj_msgSend(_c,"_ivarForKey:",_e);
if(_12){
return _c[_12];
}
}
return objj_msgSend(_c,"valueForUndefinedKey:",_e);
}
}),new objj_method(sel_getUid("valueForKeyPath:"),function(_13,_14,_15){
with(_13){
var _16=_15.indexOf(".");
if(_16===-1){
return objj_msgSend(_13,"valueForKey:",_15);
}
var _17=_15.substring(0,_16),_18=_15.substring(_16+1),_19=objj_msgSend(_13,"valueForKey:",_17);
return objj_msgSend(_19,"valueForKeyPath:",_18);
}
}),new objj_method(sel_getUid("dictionaryWithValuesForKeys:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=0,_1e=_1c.length,_1f=objj_msgSend(CPDictionary,"dictionary");
for(;_1d<_1e;++_1d){
var key=_1c[_1d],_20=objj_msgSend(_1a,"valueForKey:",key);
if(_20===nil){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNull,"null"),key);
}else{
objj_msgSend(_1f,"setObject:forKey:",_20,key);
}
}
return _1f;
}
}),new objj_method(sel_getUid("valueForUndefinedKey:"),function(_21,_22,_23){
with(_21){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_21,"description")+" is not key value coding-compliant for the key "+_23,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_21,_23],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
}),new objj_method(sel_getUid("setValue:forKeyPath:"),function(_24,_25,_26,_27){
with(_24){
if(!_27){
_27="self";
}
var i=0,_28=_27.split("."),_29=_28.length-1,_2a=_24;
for(;i<_29;++i){
_2a=objj_msgSend(_2a,"valueForKey:",_28[i]);
}
objj_msgSend(_2a,"setValue:forKey:",_26,_28[i]);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_2b,_2c,_2d,_2e){
with(_2b){
var _2f=objj_msgSend(_2b,"class"),_30=objj_msgSend(_2f,"_modifierForKey:",_2e);
if(_30){
return objj_msgSend(_2b,_30,_2d);
}
if(objj_msgSend(_2f,"accessInstanceVariablesDirectly")){
var _31=objj_msgSend(_2b,"_ivarForKey:",_2e);
if(_31){
objj_msgSend(_2b,"willChangeValueForKey:",_2e);
_2b[_31]=_2d;
objj_msgSend(_2b,"didChangeValueForKey:",_2e);
return;
}
}
objj_msgSend(_2b,"setValue:forUndefinedKey:",_2d,_2e);
}
}),new objj_method(sel_getUid("setValue:forUndefinedKey:"),function(_32,_33,_34,_35){
with(_32){
objj_msgSend(objj_msgSend(CPException,"exceptionWithName:reason:userInfo:",CPUndefinedKeyException,objj_msgSend(_32,"description")+" is not key value coding-compliant for the key "+_35,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_32,_35],[CPTargetObjectUserInfoKey,CPUnknownUserInfoKey])),"raise");
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("accessInstanceVariablesDirectly"),function(_36,_37){
with(_36){
return YES;
}
}),new objj_method(sel_getUid("_accessorForKey:"),function(_38,_39,_3a){
with(_38){
var _3b=nil,_3c=isa[_3];
if(_3c){
_3b=_3c[_3a];
if(_3b){
return _3b===objj_msgSend(CPNull,"null")?nil:_3b;
}
}else{
_3c=isa[_3]={};
}
var _3d=_3a.charAt(0).toUpperCase()+_3a.substr(1);
if(objj_msgSend(_38,"instancesRespondToSelector:",_3b=CPSelectorFromString("get"+_3d))||objj_msgSend(_38,"instancesRespondToSelector:",_3b=CPSelectorFromString(_3a))||objj_msgSend(_38,"instancesRespondToSelector:",_3b=CPSelectorFromString("is"+_3d))||objj_msgSend(_38,"instancesRespondToSelector:",_3b=CPSelectorFromString("_get"+_3d))||objj_msgSend(_38,"instancesRespondToSelector:",_3b=CPSelectorFromString("_"+_3a))||objj_msgSend(_38,"instancesRespondToSelector:",_3b=CPSelectorFromString("_is"+_3d))){
_3c[_3a]=_3b;
return _3b;
}
_3c[_3a]=objj_msgSend(CPNull,"null");
return nil;
}
}),new objj_method(sel_getUid("_modifierForKey:"),function(_3e,_3f,_40){
with(_3e){
if(!_2){
_2=objj_msgSend(CPDictionary,"dictionary");
}
var UID=objj_msgSend(isa,"UID"),_41=nil,_42=objj_msgSend(_2,"objectForKey:",UID);
if(_42){
_41=objj_msgSend(_42,"objectForKey:",_40);
if(_41){
return _41===objj_msgSend(CPNull,"null")?nil:_41;
}
}else{
_42=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_2,"setObject:forKey:",_42,UID);
}
if(_41){
return _41===objj_msgSend(CPNull,"null")?nil:_41;
}
var _43=_40.charAt(0).toUpperCase()+_40.substr(1)+":";
if(objj_msgSend(_3e,"instancesRespondToSelector:",_41=CPSelectorFromString("set"+_43))||objj_msgSend(_3e,"instancesRespondToSelector:",_41=CPSelectorFromString("_set"+_43))){
objj_msgSend(_42,"setObject:forKey:",_41,_40);
return _41;
}
objj_msgSend(_42,"setObject:forKey:",objj_msgSend(CPNull,"null"),_40);
return nil;
}
})]);
var _44=objj_msgSend(CPNull,"null");
var _11=function(_45,_46){
var _47=nil,_48=_45.isa[_3];
if(_48){
_47=_48[_46];
if(_47){
return _47===_44?nil:_47;
}
}else{
_48=_45.isa[_3]={};
}
var _49=_46.charAt(0).toUpperCase()+_46.substr(1);
if(objj_msgSend(_45,"instancesRespondToSelector:",_47=CPSelectorFromString("get"+_49))||objj_msgSend(_45,"instancesRespondToSelector:",_47=CPSelectorFromString(_46))||objj_msgSend(_45,"instancesRespondToSelector:",_47=CPSelectorFromString("is"+_49))||objj_msgSend(_45,"instancesRespondToSelector:",_47=CPSelectorFromString("_get"+_49))||objj_msgSend(_45,"instancesRespondToSelector:",_47=CPSelectorFromString("_"+_46))||objj_msgSend(_45,"instancesRespondToSelector:",_47=CPSelectorFromString("_is"+_49))){
_48[_46]=_47;
return _47;
}
_48[_46]=_44;
return nil;
};
var _5=objj_getClass("CPDictionary");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("valueForKey:"),function(_4a,_4b,_4c){
with(_4a){
if(objj_msgSend(_4c,"hasPrefix:","@")){
return objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("CPDictionary").super_class},"valueForKey:",_4c.substr(1));
}
return objj_msgSend(_4a,"objectForKey:",_4c);
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_4d,_4e,_4f,_50){
with(_4d){
objj_msgSend(_4d,"setObject:forKey:",_4f,_50);
}
})]);
var _5=objj_getClass("CPNull");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPNull\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("valueForKey:"),function(_51,_52,_53){
with(_51){
return _51;
}
})]);
objj_executeFile("CPKeyValueObserving.j",YES);
objj_executeFile("CPArray+KVO.j",YES);
p;21;CPKeyValueObserving.jt;18935;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;8;CPNull.ji;10;CPObject.ji;7;CPSet.ji;13;CPArray+KVO.jt;18809;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSet.j",YES);
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_9,_a,_b,_c,_d){
with(_9){
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_e,_f,_10,_11,key){
with(_e){
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_12,_13,_14,_15,_16,_17){
with(_12){
if(!_14||!_15){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_12),"_addObserver:forKeyPath:options:context:",_14,_15,_16,_17);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_18,_19,_1a,_1b){
with(_18){
if(!_1a||!_1b){
return;
}
objj_msgSend(_18[_1c],"_removeObserver:forKeyPath:",_1a,_1b);
}
}),new objj_method(sel_getUid("applyChange:toKeyPath:"),function(_1d,_1e,_1f,_20){
with(_1d){
var _21=objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeKindKey);
if(_21===CPKeyValueChangeSetting){
var _22=objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeNewKey);
objj_msgSend(_1d,"setValue:forKeyPath:",_22===objj_msgSend(CPNull,"null")?nil:_22,_20);
}else{
if(_21===CPKeyValueChangeInsertion){
objj_msgSend(objj_msgSend(_1d,"mutableArrayValueForKeyPath:",_20),"insertObjects:atIndexes:",objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeNewKey),objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeIndexesKey));
}else{
if(_21===CPKeyValueChangeRemoval){
objj_msgSend(objj_msgSend(_1d,"mutableArrayValueForKeyPath:",_20),"removeObjectsAtIndexes:",objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeIndexesKey));
}else{
if(_21===CPKeyValueChangeReplacement){
objj_msgSend(objj_msgSend(_1d,"mutableArrayValueForKeyPath:",_20),"replaceObjectAtIndexes:withObjects:",objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeIndexesKey),objj_msgSend(_1f,"objectForKey:",CPKeyValueChangeNewKey));
}
}
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_23,_24,_25){
with(_23){
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"),function(_26,_27,_28){
with(_26){
var _29=_28.charAt(0).toUpperCase()+_28.substring(1);
selector="keyPathsForValuesAffecting"+_29;
if(objj_msgSend(objj_msgSend(_26,"class"),"respondsToSelector:",selector)){
return objj_msgSend(objj_msgSend(_26,"class"),selector);
}
return objj_msgSend(CPSet,"set");
}
})]);
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("inverseChangeDictionary"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_2a,"mutableCopy"),_2d=objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeKindKey);
if(_2d===CPKeyValueChangeSetting||_2d===CPKeyValueChangeReplacement){
objj_msgSend(_2c,"setObject:forKey:",objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeOldKey),CPKeyValueChangeNewKey);
objj_msgSend(_2c,"setObject:forKey:",objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeNewKey),CPKeyValueChangeOldKey);
}else{
if(_2d===CPKeyValueChangeInsertion){
objj_msgSend(_2c,"setObject:forKey:",CPKeyValueChangeRemoval,CPKeyValueChangeKindKey);
objj_msgSend(_2c,"setObject:forKey:",objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeNewKey),CPKeyValueChangeOldKey);
objj_msgSend(_2c,"removeObjectForKey:",CPKeyValueChangeNewKey);
}else{
if(_2d===CPKeyValueChangeRemoval){
objj_msgSend(_2c,"setObject:forKey:",CPKeyValueChangeInsertion,CPKeyValueChangeKindKey);
objj_msgSend(_2c,"setObject:forKey:",objj_msgSend(_2a,"objectForKey:",CPKeyValueChangeOldKey),CPKeyValueChangeNewKey);
objj_msgSend(_2c,"removeObjectForKey:",CPKeyValueChangeOldKey);
}
}
}
return _2c;
}
})]);
CPKeyValueObservingOptionNew=1<<0;
CPKeyValueObservingOptionOld=1<<1;
CPKeyValueObservingOptionInitial=1<<2;
CPKeyValueObservingOptionPrior=1<<3;
CPKeyValueChangeKindKey="CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey="CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey="CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey="CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey="CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting=1;
CPKeyValueChangeInsertion=2;
CPKeyValueChangeRemoval=3;
CPKeyValueChangeReplacement=4;
var _2e=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld,_2f="$KVODEPENDENT",_1c="$KVOPROXY";
var _1=objj_allocateClassPair(CPObject,"_CPKVOProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_targetObject"),new objj_ivar("_nativeClass"),new objj_ivar("_changesForKey"),new objj_ivar("_observersForKey"),new objj_ivar("_observersForKeyLength"),new objj_ivar("_replacedKeys")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithTarget:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("_CPKVOProxy").super_class},"init");
_targetObject=_32;
_nativeClass=objj_msgSend(_32,"class");
_observersForKey={};
_changesForKey={};
_observersForKeyLength=0;
return _30;
}
}),new objj_method(sel_getUid("_replaceClass"),function(_33,_34){
with(_33){
var _35=_nativeClass,_36="$KVO_"+class_getName(_nativeClass),_37=objj_lookUpClass(_36);
if(_37){
_targetObject.isa=_37;
_replacedKeys=_37._replacedKeys;
return;
}
var _38=objj_allocateClassPair(_35,_36);
objj_registerClassPair(_38);
_replacedKeys=objj_msgSend(CPSet,"set");
_38._replacedKeys=_replacedKeys;
var _39=_CPKVOModelSubclass.method_list,_3a=_39.length,i=0;
for(;i<_3a;i++){
var _3b=_39[i];
class_addMethod(_38,method_getName(_3b),method_getImplementation(_3b),"");
}
if(objj_msgSend(_targetObject,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
var _39=_CPKVOModelDictionarySubclass.method_list,_3a=_39.length,i=0;
for(;i<_3a;i++){
var _3b=_39[i];
class_addMethod(_38,method_getName(_3b),method_getImplementation(_3b),"");
}
}
_targetObject.isa=_38;
}
}),new objj_method(sel_getUid("_replaceSetterForKey:"),function(_3c,_3d,_3e){
with(_3c){
if(objj_msgSend(_replacedKeys,"containsObject:",_3e)||!objj_msgSend(_nativeClass,"automaticallyNotifiesObserversForKey:",_3e)){
return;
}
var _3f=_nativeClass,_40=_3e.charAt(0).toUpperCase()+_3e.substring(1),_41=false,_42=["set"+_40+":",_43,"_set"+_40+":",_43,"insertObject:in"+_40+"AtIndex:",_44,"replaceObjectIn"+_40+"AtIndex:withObject:",_45,"removeObjectFrom"+_40+"AtIndex:",_46];
var i=0,_47=_42.length;
for(;i<_47;i+=2){
var _48=sel_getName(_42[i]),_49=_42[i+1];
if(objj_msgSend(_nativeClass,"instancesRespondToSelector:",_48)){
var _4a=class_getInstanceMethod(_nativeClass,_48);
class_addMethod(_targetObject.isa,_48,_49(_3e,_4a),"");
objj_msgSend(_replacedKeys,"addObject:",_3e);
}
}
var _4b=objj_msgSend(objj_msgSend(_nativeClass,"keyPathsForValuesAffectingValueForKey:",_3e),"allObjects"),_4c=_4b?_4b.length:0;
if(!_4c){
return;
}
var _4d=_nativeClass[_2f];
if(!_4d){
_4d={};
_nativeClass[_2f]=_4d;
}
while(_4c--){
var _4e=_4b[_4c],_4f=_4d[_4e];
if(!_4f){
_4f=objj_msgSend(CPSet,"new");
_4d[_4e]=_4f;
}
objj_msgSend(_4f,"addObject:",_3e);
objj_msgSend(_3c,"_replaceSetterForKey:",_4e);
}
}
}),new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"),function(_50,_51,_52,_53,_54,_55){
with(_50){
if(!_52){
return;
}
var _56=nil;
if(_53.indexOf(".")!=CPNotFound){
_56=objj_msgSend(objj_msgSend(_CPKVOForwardingObserver,"alloc"),"initWithKeyPath:object:observer:options:context:",_53,_targetObject,_52,_54,_55);
}else{
objj_msgSend(_50,"_replaceSetterForKey:",_53);
}
var _57=_observersForKey[_53];
if(!_57){
_57=objj_msgSend(CPDictionary,"dictionary");
_observersForKey[_53]=_57;
_observersForKeyLength++;
}
objj_msgSend(_57,"setObject:forKey:",_58(_52,_54,_55,_56),objj_msgSend(_52,"UID"));
if(_54&CPKeyValueObservingOptionInitial){
var _59=objj_msgSend(_targetObject,"valueForKeyPath:",_53);
if(_59===nil||_59===undefined){
_59=objj_msgSend(CPNull,"null");
}
var _5a=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_59,CPKeyValueChangeNewKey);
objj_msgSend(_52,"observeValueForKeyPath:ofObject:change:context:",_53,_50,_5a,_55);
}
}
}),new objj_method(sel_getUid("_removeObserver:forKeyPath:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var _5f=_observersForKey[_5e];
if(_5e.indexOf(".")!=CPNotFound){
var _60=objj_msgSend(_5f,"objectForKey:",objj_msgSend(_5d,"UID")).forwarder;
objj_msgSend(_60,"finalize");
}
objj_msgSend(_5f,"removeObjectForKey:",objj_msgSend(_5d,"UID"));
if(!objj_msgSend(_5f,"count")){
_observersForKeyLength--;
delete _observersForKey[_5e];
}
if(!_observersForKeyLength){
_targetObject.isa=_nativeClass;
delete _targetObject[_1c];
}
}
}),new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"),function(_61,_62,_63,_64,_65){
with(_61){
var _66=_changesForKey[_63];
if(_65){
_66=_64;
var _67=objj_msgSend(_66,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_67){
var _68=objj_msgSend(_66,"objectForKey:",CPKeyValueChangeKindKey);
if(_68===CPKeyValueChangeReplacement||_68===CPKeyValueChangeRemoval){
var _69=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_63),"objectsAtIndexes:",_67);
objj_msgSend(_66,"setValue:forKey:",_69,CPKeyValueChangeOldKey);
}
}else{
var _6a=objj_msgSend(_targetObject,"valueForKey:",_63);
if(_6a===nil||_6a===undefined){
_6a=objj_msgSend(CPNull,"null");
}
objj_msgSend(_66,"setObject:forKey:",_6a,CPKeyValueChangeOldKey);
}
objj_msgSend(_66,"setObject:forKey:",1,CPKeyValueChangeNotificationIsPriorKey);
_changesForKey[_63]=_66;
}else{
if(!_66){
_66=objj_msgSend(CPDictionary,"new");
}
objj_msgSend(_66,"removeObjectForKey:",CPKeyValueChangeNotificationIsPriorKey);
var _67=objj_msgSend(_66,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_67){
var _68=objj_msgSend(_66,"objectForKey:",CPKeyValueChangeKindKey);
if(_68==CPKeyValueChangeReplacement||_68==CPKeyValueChangeInsertion){
var _69=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_63),"objectsAtIndexes:",_67);
objj_msgSend(_66,"setValue:forKey:",_69,CPKeyValueChangeNewKey);
}
}else{
var _6b=objj_msgSend(_targetObject,"valueForKey:",_63);
if(_6b===nil||_6b===undefined){
_6b=objj_msgSend(CPNull,"null");
}
objj_msgSend(_66,"setObject:forKey:",_6b,CPKeyValueChangeNewKey);
}
}
var _6c=objj_msgSend(_observersForKey[_63],"allValues"),_6d=_6c?_6c.length:0;
while(_6d--){
var _6e=_6c[_6d];
if(_65&&(_6e.options&CPKeyValueObservingOptionPrior)){
objj_msgSend(_6e.observer,"observeValueForKeyPath:ofObject:change:context:",_63,_targetObject,_66,_6e.context);
}else{
if(!_65){
objj_msgSend(_6e.observer,"observeValueForKeyPath:ofObject:change:context:",_63,_targetObject,_66,_6e.context);
}
}
}
var _6f=_nativeClass[_2f];
if(!_6f){
return;
}
var _70=objj_msgSend(_6f[_63],"allObjects");
if(!_70){
return;
}
var _71=0,_6d=objj_msgSend(_70,"count");
for(;_71<_6d;++_71){
var _72=_70[_71];
objj_msgSend(_61,"_sendNotificationsForKey:changeOptions:isBefore:",_72,_65?objj_msgSend(_64,"copy"):_changesForKey[_72],_65);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("proxyForObject:"),function(_73,_74,_75){
with(_73){
var _76=_75[_1c];
if(_76){
return _76;
}
_76=objj_msgSend(objj_msgSend(_73,"alloc"),"initWithTarget:",_75);
objj_msgSend(_76,"_replaceClass");
_75[_1c]=_76;
return _76;
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelSubclass"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_77,"class"),_7b=sel_getUid("willChangeValueForKey:"),_7c=class_getMethodImplementation(_7a,_7b);
_7c(_77,_7b,_79);
if(!_79){
return;
}
var _7d=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_77),"_sendNotificationsForKey:changeOptions:isBefore:",_79,_7d,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_7e,"class"),_82=sel_getUid("didChangeValueForKey:"),_83=class_getMethodImplementation(_81,_82);
_83(_7e,_82,_80);
if(!_80){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_7e),"_sendNotificationsForKey:changeOptions:isBefore:",_80,nil,NO);
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_84,_85,_86,_87,_88){
with(_84){
var _89=objj_msgSend(_84,"class"),_8a=sel_getUid("willChange:valuesAtIndexes:forKey:"),_8b=class_getMethodImplementation(_89,_8a);
_8b(_84,_8a,_86,_87,_88);
if(!_88){
return;
}
var _8c=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_86,_87],[CPKeyValueChangeKindKey,CPKeyValueChangeIndexesKey]);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_84),"_sendNotificationsForKey:changeOptions:isBefore:",_88,_8c,YES);
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_8d,_8e,_8f,_90,_91){
with(_8d){
var _92=objj_msgSend(_8d,"class"),_93=sel_getUid("didChange:valuesAtIndexes:forKey:"),_94=class_getMethodImplementation(_92,_93);
_94(_8d,_93,_8f,_90,_91);
if(!_91){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_8d),"_sendNotificationsForKey:changeOptions:isBefore:",_91,nil,NO);
}
}),new objj_method(sel_getUid("class"),function(_95,_96){
with(_95){
return _95[_1c]._nativeClass;
}
}),new objj_method(sel_getUid("superclass"),function(_97,_98){
with(_97){
return objj_msgSend(objj_msgSend(_97,"class"),"superclass");
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_99,_9a,_9b){
with(_99){
return objj_msgSend(objj_msgSend(_99,"class"),"isSubclassOfClass:",_9b);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_9c,_9d,_9e){
with(_9c){
return objj_msgSend(_9c,"class")==_9e;
}
}),new objj_method(sel_getUid("className"),function(_9f,_a0){
with(_9f){
return objj_msgSend(_9f,"class").name;
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelDictionarySubclass"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("removeAllObjects"),function(_a1,_a2){
with(_a1){
var _a3=objj_msgSend(_a1,"allKeys"),_a4=objj_msgSend(_a3,"count"),i=0;
for(;i<_a4;i++){
objj_msgSend(_a1,"willChangeValueForKey:",_a3[i]);
}
var _a5=objj_msgSend(_a1,"class"),_a6=sel_getUid("removeAllObjects"),_a7=class_getMethodImplementation(_a5,_a6);
_a7(_a1,_a6);
for(i=0;i<_a4;i++){
objj_msgSend(_a1,"didChangeValueForKey:",_a3[i]);
}
}
}),new objj_method(sel_getUid("removeObjectForKey:"),function(_a8,_a9,_aa){
with(_a8){
objj_msgSend(_a8,"willChangeValueForKey:",_aa);
var _ab=objj_msgSend(_a8,"class"),_ac=sel_getUid("removeObjectForKey:"),_ad=class_getMethodImplementation(_ab,_ac);
_ad(_a8,_ac,_aa);
objj_msgSend(_a8,"didChangeValueForKey:",_aa);
}
}),new objj_method(sel_getUid("setObject:forKey:"),function(_ae,_af,_b0,_b1){
with(_ae){
objj_msgSend(_ae,"willChangeValueForKey:",_b1);
var _b2=objj_msgSend(_ae,"class"),_b3=sel_getUid("setObject:forKey:"),_b4=class_getMethodImplementation(_b2,_b3);
_b4(_ae,_b3,_b0,_b1);
objj_msgSend(_ae,"didChangeValueForKey:",_b1);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPKVOForwardingObserver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_observer"),new objj_ivar("_context"),new objj_ivar("_firstPart"),new objj_ivar("_secondPart"),new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"),function(_b5,_b6,_b7,_b8,_b9,_ba,_bb){
with(_b5){
_b5=objj_msgSendSuper({receiver:_b5,super_class:objj_getClass("_CPKVOForwardingObserver").super_class},"init");
_context=_bb;
_observer=_b9;
_object=_b8;
var _bc=_b7.indexOf(".");
if(_bc==CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Created _CPKVOForwardingObserver without compound key path: "+_b7);
}
_firstPart=_b7.substring(0,_bc);
_secondPart=_b7.substring(_bc+1);
objj_msgSend(_object,"addObserver:forKeyPath:options:context:",_b5,_firstPart,_2e,nil);
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",_b5,_secondPart,_2e,nil);
}
return _b5;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_bd,_be,_bf,_c0,_c1,_c2){
with(_bd){
if(_bf===_firstPart){
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart,_object,_c1,_context);
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",_bd,_secondPart);
}
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",_bd,_secondPart,_2e,nil);
}
}else{
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart+"."+_bf,_object,_c1,_context);
}
}
}),new objj_method(sel_getUid("finalize"),function(_c3,_c4){
with(_c3){
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",_c3,_secondPart);
}
objj_msgSend(_object,"removeObserver:forKeyPath:",_c3,_firstPart);
_object=nil;
_observer=nil;
_context=nil;
_value=nil;
}
})]);
var _58=_58=function(_c5,_c6,_c7,_c8){
return {observer:_c5,options:_c6,context:_c7,forwarder:_c8};
};
var _43=_43=function(_c9,_ca){
return function(_cb,_cc,_cd){
objj_msgSend(_cb,"willChangeValueForKey:",_c9);
_ca.method_imp(_cb,_cc,_cd);
objj_msgSend(_cb,"didChangeValueForKey:",_c9);
};
};
var _44=_44=function(_ce,_cf){
return function(_d0,_d1,_d2,_d3){
objj_msgSend(_d0,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_d3),_ce);
_cf.method_imp(_d0,_d1,_d2,_d3);
objj_msgSend(_d0,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_d3),_ce);
};
};
var _45=_45=function(_d4,_d5){
return function(_d6,_d7,_d8,_d9){
objj_msgSend(_d6,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_d8),_d4);
_d5.method_imp(_d6,_d7,_d8,_d9);
objj_msgSend(_d6,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_d8),_d4);
};
};
var _46=_46=function(_da,_db){
return function(_dc,_dd,_de){
objj_msgSend(_dc,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_de),_da);
_db.method_imp(_dc,_dd,_de);
objj_msgSend(_dc,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_de),_da);
};
};
objj_executeFile("CPArray+KVO.j",YES);
p;7;CPLog.jt;17;@STATIC;1.0;t;1;
p;16;CPNotification.jt;1472;@STATIC;1.0;i;13;CPException.ji;10;CPObject.jt;1420;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPNotification"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_object"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"CPNotification's init method should not be used");
}
}),new objj_method(sel_getUid("initWithName:object:userInfo:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPNotification").super_class},"init");
if(_5){
_name=_7;
_object=_8;
_userInfo=_9;
}
return _5;
}
}),new objj_method(sel_getUid("name"),function(_a,_b){
with(_a){
return _name;
}
}),new objj_method(sel_getUid("object"),function(_c,_d){
with(_c){
return _object;
}
}),new objj_method(sel_getUid("userInfo"),function(_e,_f){
with(_e){
return _userInfo;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("notificationWithName:object:userInfo:"),function(_10,_11,_12,_13,_14){
with(_10){
return objj_msgSend(objj_msgSend(_10,"alloc"),"initWithName:object:userInfo:",_12,_13,_14);
}
}),new objj_method(sel_getUid("notificationWithName:object:"),function(_15,_16,_17,_18){
with(_15){
return objj_msgSend(objj_msgSend(_15,"alloc"),"initWithName:object:userInfo:",_17,_18,nil);
}
})]);
p;22;CPNotificationCenter.jt;6517;@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;16;CPNotification.ji;8;CPNull.jt;6415;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPNotification.j",YES);
objj_executeFile("CPNull.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNotificationCenter"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_namedRegistries"),new objj_ivar("_unnamedRegistry")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPNotificationCenter").super_class},"init");
if(_4){
_namedRegistries=objj_msgSend(CPDictionary,"dictionary");
_unnamedRegistry=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
}
return _4;
}
}),new objj_method(sel_getUid("addObserver:selector:name:object:"),function(_6,_7,_8,_9,_a,_b){
with(_6){
var _c,_d=objj_msgSend(objj_msgSend(_CPNotificationObserver,"alloc"),"initWithObserver:selector:",_8,_9);
if(_a==nil){
_c=_unnamedRegistry;
}else{
if(!(_c=objj_msgSend(_namedRegistries,"objectForKey:",_a))){
_c=objj_msgSend(objj_msgSend(_CPNotificationRegistry,"alloc"),"init");
objj_msgSend(_namedRegistries,"setObject:forKey:",_c,_a);
}
}
objj_msgSend(_c,"addObserver:object:",_d,_b);
}
}),new objj_method(sel_getUid("removeObserver:"),function(_e,_f,_10){
with(_e){
var _11=nil,_12=objj_msgSend(_namedRegistries,"keyEnumerator");
while(_11=objj_msgSend(_12,"nextObject")){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_11),"removeObserver:object:",_10,nil);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_10,nil);
}
}),new objj_method(sel_getUid("removeObserver:name:object:"),function(_13,_14,_15,_16,_17){
with(_13){
if(_16==nil){
var _18=nil,_19=objj_msgSend(_namedRegistries,"keyEnumerator");
while(_18=objj_msgSend(_19,"nextObject")){
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_18),"removeObserver:object:",_15,_17);
}
objj_msgSend(_unnamedRegistry,"removeObserver:object:",_15,_17);
}else{
objj_msgSend(objj_msgSend(_namedRegistries,"objectForKey:",_16),"removeObserver:object:",_15,_17);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_1a,_1b,_1c){
with(_1a){
if(!_1c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"postNotification: does not except 'nil' notifications");
}
_1d(_1a,_1c);
}
}),new objj_method(sel_getUid("postNotificationName:object:userInfo:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1d(_1e,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_20,_21,_22));
}
}),new objj_method(sel_getUid("postNotificationName:object:"),function(_23,_24,_25,_26){
with(_23){
_1d(_23,objj_msgSend(objj_msgSend(CPNotification,"alloc"),"initWithName:object:userInfo:",_25,_26,nil));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultCenter"),function(_27,_28){
with(_27){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNotificationCenter,"alloc"),"init");
}
return _1;
}
})]);
var _1d=function(_29,_2a){
objj_msgSend(_29._unnamedRegistry,"postNotification:",_2a);
objj_msgSend(objj_msgSend(_29._namedRegistries,"objectForKey:",objj_msgSend(_2a,"name")),"postNotification:",_2a);
};
var _2=objj_allocateClassPair(CPObject,"_CPNotificationRegistry"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_objectObservers"),new objj_ivar("_observerRemovalCount")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("_CPNotificationRegistry").super_class},"init");
if(_2b){
_observerRemovalCount=0;
_objectObservers=objj_msgSend(CPDictionary,"dictionary");
}
return _2b;
}
}),new objj_method(sel_getUid("addObserver:object:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(!_30){
_30=objj_msgSend(CPNull,"null");
}
var _31=objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_30,"UID"));
if(!_31){
_31=[];
objj_msgSend(_objectObservers,"setObject:forKey:",_31,objj_msgSend(_30,"UID"));
}
_31.push(_2f);
}
}),new objj_method(sel_getUid("removeObserver:object:"),function(_32,_33,_34,_35){
with(_32){
var _36=[];
if(_35==nil){
var key=nil,_37=objj_msgSend(_objectObservers,"keyEnumerator");
while(key=objj_msgSend(_37,"nextObject")){
var _38=objj_msgSend(_objectObservers,"objectForKey:",key),_39=_38?_38.length:0;
while(_39--){
if(objj_msgSend(_38[_39],"observer")==_34){
++_observerRemovalCount;
_38.splice(_39,1);
}
}
if(!_38||_38.length==0){
_36.push(key);
}
}
}else{
var key=objj_msgSend(_35,"UID"),_38=objj_msgSend(_objectObservers,"objectForKey:",key);
_39=_38?_38.length:0;
while(_39--){
if(objj_msgSend(_38[_39],"observer")==_34){
++_observerRemovalCount;
_38.splice(_39,1);
}
}
if(!_38||_38.length==0){
_36.push(key);
}
}
var _39=_36.length;
while(_39--){
objj_msgSend(_objectObservers,"removeObjectForKey:",_36[_39]);
}
}
}),new objj_method(sel_getUid("postNotification:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=_observerRemovalCount,_3e=objj_msgSend(_3c,"object"),_3f=nil;
if(_3e!=nil&&(_3f=objj_msgSend(objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(_3e,"UID")),"copy"))){
var _40=_3f,_41=_3f.length;
while(_41--){
var _42=_3f[_41];
if((_3d===_observerRemovalCount)||objj_msgSend(_40,"indexOfObjectIdenticalTo:",_42)!==CPNotFound){
objj_msgSend(_42,"postNotification:",_3c);
}
}
}
_3f=objj_msgSend(objj_msgSend(_objectObservers,"objectForKey:",objj_msgSend(objj_msgSend(CPNull,"null"),"UID")),"copy");
if(!_3f){
return;
}
var _3d=_observerRemovalCount,_41=_3f.length,_40=_3f;
while(_41--){
var _42=_3f[_41];
if((_3d===_observerRemovalCount)||objj_msgSend(_40,"indexOfObjectIdenticalTo:",_42)!==CPNotFound){
objj_msgSend(_42,"postNotification:",_3c);
}
}
}
}),new objj_method(sel_getUid("count"),function(_43,_44){
with(_43){
return objj_msgSend(_objectObservers,"count");
}
})]);
var _2=objj_allocateClassPair(CPObject,"_CPNotificationObserver"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_observer"),new objj_ivar("_selector")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithObserver:selector:"),function(_45,_46,_47,_48){
with(_45){
if(_45){
_observer=_47;
_selector=_48;
}
return _45;
}
}),new objj_method(sel_getUid("observer"),function(_49,_4a){
with(_49){
return _observer;
}
}),new objj_method(sel_getUid("postNotification:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_observer,"performSelector:withObject:",_selector,_4d);
}
})]);
p;8;CPNull.jt;731;@STATIC;1.0;i;10;CPObject.jt;698;
objj_executeFile("CPObject.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPNull"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("isEqual:"),function(_4,_5,_6){
with(_4){
if(_4===_6){
return YES;
}
return objj_msgSend(_6,"isKindOfClass:",objj_msgSend(CPNull,"class"));
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(CPNull,"null");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("null"),function(_d,_e){
with(_d){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPNull,"alloc"),"init");
}
return _1;
}
})]);
p;10;CPNumber.jt;6048;@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.jt;5994;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
var _1=new Number(),_2=new CFMutableDictionary();
var _3=objj_allocateClassPair(CPObject,"CPNumber"),_4=_3.isa;
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithBool:"),function(_5,_6,_7){
with(_5){
return _7;
}
}),new objj_method(sel_getUid("initWithChar:"),function(_8,_9,_a){
with(_8){
if(_a.charCodeAt){
return _a.charCodeAt(0);
}
return _a;
}
}),new objj_method(sel_getUid("initWithDouble:"),function(_b,_c,_d){
with(_b){
return _d;
}
}),new objj_method(sel_getUid("initWithFloat:"),function(_e,_f,_10){
with(_e){
return _10;
}
}),new objj_method(sel_getUid("initWithInt:"),function(_11,_12,_13){
with(_11){
return _13;
}
}),new objj_method(sel_getUid("initWithLong:"),function(_14,_15,_16){
with(_14){
return _16;
}
}),new objj_method(sel_getUid("initWithLongLong:"),function(_17,_18,_19){
with(_17){
return _19;
}
}),new objj_method(sel_getUid("initWithShort:"),function(_1a,_1b,_1c){
with(_1a){
return _1c;
}
}),new objj_method(sel_getUid("initWithUnsignedChar:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f.charCodeAt){
return _1f.charCodeAt(0);
}
return _1f;
}
}),new objj_method(sel_getUid("initWithUnsignedInt:"),function(_20,_21,_22){
with(_20){
return _22;
}
}),new objj_method(sel_getUid("initWithUnsignedLong:"),function(_23,_24,_25){
with(_23){
return _25;
}
}),new objj_method(sel_getUid("initWithUnsignedShort:"),function(_26,_27,_28){
with(_26){
return _28;
}
}),new objj_method(sel_getUid("UID"),function(_29,_2a){
with(_29){
var UID=_2.valueForKey(_29);
if(!UID){
UID=objj_generateObjectUID();
_2.setValueForKey(_29,UID);
}
return UID+"";
}
}),new objj_method(sel_getUid("boolValue"),function(_2b,_2c){
with(_2b){
return _2b?true:false;
}
}),new objj_method(sel_getUid("charValue"),function(_2d,_2e){
with(_2d){
return String.fromCharCode(_2d);
}
}),new objj_method(sel_getUid("decimalValue"),function(_2f,_30){
with(_2f){
throw new Error("decimalValue: NOT YET IMPLEMENTED");
}
}),new objj_method(sel_getUid("descriptionWithLocale:"),function(_31,_32,_33){
with(_31){
if(!_33){
return toString();
}
throw new Error("descriptionWithLocale: NOT YET IMPLEMENTED");
}
}),new objj_method(sel_getUid("description"),function(_34,_35){
with(_34){
return objj_msgSend(_34,"descriptionWithLocale:",nil);
}
}),new objj_method(sel_getUid("doubleValue"),function(_36,_37){
with(_36){
if(typeof _36=="boolean"){
return _36?1:0;
}
return _36;
}
}),new objj_method(sel_getUid("floatValue"),function(_38,_39){
with(_38){
if(typeof _38=="boolean"){
return _38?1:0;
}
return _38;
}
}),new objj_method(sel_getUid("intValue"),function(_3a,_3b){
with(_3a){
if(typeof _3a=="boolean"){
return _3a?1:0;
}
return _3a;
}
}),new objj_method(sel_getUid("longLongValue"),function(_3c,_3d){
with(_3c){
if(typeof _3c=="boolean"){
return _3c?1:0;
}
return _3c;
}
}),new objj_method(sel_getUid("longValue"),function(_3e,_3f){
with(_3e){
if(typeof _3e=="boolean"){
return _3e?1:0;
}
return _3e;
}
}),new objj_method(sel_getUid("shortValue"),function(_40,_41){
with(_40){
if(typeof _40=="boolean"){
return _40?1:0;
}
return _40;
}
}),new objj_method(sel_getUid("stringValue"),function(_42,_43){
with(_42){
return toString();
}
}),new objj_method(sel_getUid("unsignedCharValue"),function(_44,_45){
with(_44){
return String.fromCharCode(_44);
}
}),new objj_method(sel_getUid("unsignedIntValue"),function(_46,_47){
with(_46){
if(typeof _46=="boolean"){
return _46?1:0;
}
return _46;
}
}),new objj_method(sel_getUid("unsignedLongValue"),function(_48,_49){
with(_48){
if(typeof _48=="boolean"){
return _48?1:0;
}
return _48;
}
}),new objj_method(sel_getUid("unsignedShortValue"),function(_4a,_4b){
with(_4a){
if(typeof _4a=="boolean"){
return _4a?1:0;
}
return _4a;
}
}),new objj_method(sel_getUid("compare:"),function(_4c,_4d,_4e){
with(_4c){
if(_4c>_4e){
return CPOrderedDescending;
}else{
if(_4c<_4e){
return CPOrderedAscending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("isEqualToNumber:"),function(_4f,_50,_51){
with(_4f){
return _4f==_51;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("alloc"),function(_52,_53){
with(_52){
return _1;
}
}),new objj_method(sel_getUid("numberWithBool:"),function(_54,_55,_56){
with(_54){
return _56;
}
}),new objj_method(sel_getUid("numberWithChar:"),function(_57,_58,_59){
with(_57){
if(_59.charCodeAt){
return _59.charCodeAt(0);
}
return _59;
}
}),new objj_method(sel_getUid("numberWithDouble:"),function(_5a,_5b,_5c){
with(_5a){
return _5c;
}
}),new objj_method(sel_getUid("numberWithFloat:"),function(_5d,_5e,_5f){
with(_5d){
return _5f;
}
}),new objj_method(sel_getUid("numberWithInt:"),function(_60,_61,_62){
with(_60){
return _62;
}
}),new objj_method(sel_getUid("numberWithLong:"),function(_63,_64,_65){
with(_63){
return _65;
}
}),new objj_method(sel_getUid("numberWithLongLong:"),function(_66,_67,_68){
with(_66){
return _68;
}
}),new objj_method(sel_getUid("numberWithShort:"),function(_69,_6a,_6b){
with(_69){
return _6b;
}
}),new objj_method(sel_getUid("numberWithUnsignedChar:"),function(_6c,_6d,_6e){
with(_6c){
if(_6e.charCodeAt){
return _6e.charCodeAt(0);
}
return _6e;
}
}),new objj_method(sel_getUid("numberWithUnsignedInt:"),function(_6f,_70,_71){
with(_6f){
return _71;
}
}),new objj_method(sel_getUid("numberWithUnsignedLong:"),function(_72,_73,_74){
with(_72){
return _74;
}
}),new objj_method(sel_getUid("numberWithUnsignedShort:"),function(_75,_76,_77){
with(_75){
return _77;
}
})]);
var _3=objj_getClass("CPNumber");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPNumber\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_78,_79,_7a){
with(_78){
return objj_msgSend(_7a,"decodeNumber");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7d,"encodeNumber:forKey:",_7b,"self");
}
})]);
Number.prototype.isa=CPNumber;
Boolean.prototype.isa=CPNumber;
objj_msgSend(CPNumber,"initialize");
p;10;CPObject.jt;6862;@STATIC;1.0;t;6843;
var _1=objj_allocateClassPair(Nil,"CPObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("isa")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_5,_6){
with(_5){
return _5;
}
}),new objj_method(sel_getUid("mutableCopy"),function(_7,_8){
with(_7){
return objj_msgSend(_7,"copy");
}
}),new objj_method(sel_getUid("dealloc"),function(_9,_a){
with(_9){
}
}),new objj_method(sel_getUid("class"),function(_b,_c){
with(_b){
return isa;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(isa,"isSubclassOfClass:",_f);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_10,_11,_12){
with(_10){
return _10.isa===_12;
}
}),new objj_method(sel_getUid("isProxy"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_15,_16,_17){
with(_15){
return !!class_getInstanceMethod(isa,_17);
}
}),new objj_method(sel_getUid("implementsSelector:"),function(_18,_19,_1a){
with(_18){
var _1b=class_copyMethodList(isa),_1c=_1b.length;
while(_1c--){
if(method_getName(_1b[_1c])===_1a){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("methodForSelector:"),function(_1d,_1e,_1f){
with(_1d){
return class_getMethodImplementation(isa,_1f);
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_20,_21,_22){
with(_20){
return nil;
}
}),new objj_method(sel_getUid("description"),function(_23,_24){
with(_23){
return "<"+class_getName(isa)+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_23,"UID"))+">";
}
}),new objj_method(sel_getUid("performSelector:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,_27);
}
}),new objj_method(sel_getUid("performSelector:withObject:"),function(_28,_29,_2a,_2b){
with(_28){
return objj_msgSend(_28,_2a,_2b);
}
}),new objj_method(sel_getUid("performSelector:withObject:withObject:"),function(_2c,_2d,_2e,_2f,_30){
with(_2c){
return objj_msgSend(_2c,_2e,_2f,_30);
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"doesNotRecognizeSelector:",objj_msgSend(_33,"selector"));
}
}),new objj_method(sel_getUid("forward::"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(_34,"methodSignatureForSelector:",_36);
if(_38){
invocation=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_38);
objj_msgSend(invocation,"setTarget:",_34);
objj_msgSend(invocation,"setSelector:",_36);
var _39=2,_3a=_37.length;
for(;_39<_3a;++_39){
objj_msgSend(invocation,"setArgument:atIndex:",_37[_39],_39);
}
objj_msgSend(_34,"forwardInvocation:",invocation);
return objj_msgSend(invocation,"returnValue");
}
objj_msgSend(_34,"doesNotRecognizeSelector:",_36);
}
}),new objj_method(sel_getUid("doesNotRecognizeSelector:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(class_isMetaClass(isa)?"+":"-")+" ["+objj_msgSend(_3b,"className")+" "+_3d+"] unrecognized selector sent to "+(class_isMetaClass(isa)?"class":"instance")+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_3b,"UID")));
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_3e,_3f,_40){
with(_3e){
return _3e;
}
}),new objj_method(sel_getUid("classForKeyedArchiver"),function(_41,_42){
with(_41){
return objj_msgSend(_41,"classForCoder");
}
}),new objj_method(sel_getUid("classForCoder"),function(_43,_44){
with(_43){
return objj_msgSend(_43,"class");
}
}),new objj_method(sel_getUid("replacementObjectForArchiver:"),function(_45,_46,_47){
with(_45){
return objj_msgSend(_45,"replacementObjectForCoder:",_47);
}
}),new objj_method(sel_getUid("replacementObjectForKeyedArchiver:"),function(_48,_49,_4a){
with(_48){
return objj_msgSend(_48,"replacementObjectForCoder:",_4a);
}
}),new objj_method(sel_getUid("replacementObjectForCoder:"),function(_4b,_4c,_4d){
with(_4b){
return _4b;
}
}),new objj_method(sel_getUid("className"),function(_4e,_4f){
with(_4e){
return isa.name;
}
}),new objj_method(sel_getUid("autorelease"),function(_50,_51){
with(_50){
return _50;
}
}),new objj_method(sel_getUid("hash"),function(_52,_53){
with(_52){
return objj_msgSend(_52,"UID");
}
}),new objj_method(sel_getUid("UID"),function(_54,_55){
with(_54){
if(typeof _54._UID==="undefined"){
_54._UID=objj_generateObjectUID();
}
return _UID+"";
}
}),new objj_method(sel_getUid("isEqual:"),function(_56,_57,_58){
with(_56){
return _56===_58||objj_msgSend(_56,"UID")===objj_msgSend(_58,"UID");
}
}),new objj_method(sel_getUid("retain"),function(_59,_5a){
with(_59){
return _59;
}
}),new objj_method(sel_getUid("release"),function(_5b,_5c){
with(_5b){
}
}),new objj_method(sel_getUid("self"),function(_5d,_5e){
with(_5d){
return _5d;
}
}),new objj_method(sel_getUid("superclass"),function(_5f,_60){
with(_5f){
return isa.super_class;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("load"),function(_61,_62){
with(_61){
}
}),new objj_method(sel_getUid("initialize"),function(_63,_64){
with(_63){
}
}),new objj_method(sel_getUid("new"),function(_65,_66){
with(_65){
return objj_msgSend(objj_msgSend(_65,"alloc"),"init");
}
}),new objj_method(sel_getUid("alloc"),function(_67,_68){
with(_67){
return class_createInstance(_67);
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_69,_6a,_6b){
with(_69){
return objj_msgSend(_69,"alloc");
}
}),new objj_method(sel_getUid("class"),function(_6c,_6d){
with(_6c){
return _6c;
}
}),new objj_method(sel_getUid("superclass"),function(_6e,_6f){
with(_6e){
return super_class;
}
}),new objj_method(sel_getUid("isSubclassOfClass:"),function(_70,_71,_72){
with(_70){
var _73=_70;
for(;_73;_73=_73.super_class){
if(_73===_72){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_74,_75,_76){
with(_74){
return objj_msgSend(_74,"isSubclassOfClass:",_76);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_77,_78,_79){
with(_77){
return _77===_79;
}
}),new objj_method(sel_getUid("instancesRespondToSelector:"),function(_7a,_7b,_7c){
with(_7a){
return !!class_getInstanceMethod(_7a,_7c);
}
}),new objj_method(sel_getUid("instanceMethodForSelector:"),function(_7d,_7e,_7f){
with(_7d){
return class_getMethodImplementation(_7d,_7f);
}
}),new objj_method(sel_getUid("description"),function(_80,_81){
with(_80){
return class_getName(isa);
}
}),new objj_method(sel_getUid("setVersion:"),function(_82,_83,_84){
with(_82){
version=_84;
return _82;
}
}),new objj_method(sel_getUid("version"),function(_85,_86){
with(_85){
return version;
}
})]);
objj_class.prototype.toString=objj_object.prototype.toString=function(){
if(this.isa&&class_getInstanceMethod(this.isa,"description")!=NULL){
return objj_msgSend(this,"description");
}else{
return String(this)+" (-description not implemented)";
}
};
p;15;CPObjJRuntime.jt;390;@STATIC;1.0;t;372;
CPStringFromSelector=function(_1){
return sel_getName(_1);
};
CPSelectorFromString=function(_2){
return sel_registerName(_2);
};
CPClassFromString=function(_3){
return objj_getClass(_3);
};
CPStringFromClass=function(_4){
return class_getName(_4);
};
CPOrderedAscending=-1;
CPOrderedSame=0;
CPOrderedDescending=1;
CPNotFound=-1;
MIN=Math.min;
MAX=Math.max;
ABS=Math.abs;
p;13;CPOperation.jt;4258;@STATIC;1.0;i;10;CPObject.jt;4224;
objj_executeFile("CPObject.j",YES);
CPOperationQueuePriorityVeryLow=-8;
CPOperationQueuePriorityLow=-4;
CPOperationQueuePriorityNormal=0;
CPOperationQueuePriorityHigh=4;
CPOperationQueuePriorityVeryHigh=8;
var _1=objj_allocateClassPair(CPObject,"CPOperation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("operations"),new objj_ivar("_cancelled"),new objj_ivar("_executing"),new objj_ivar("_finished"),new objj_ivar("_ready"),new objj_ivar("_queuePriority"),new objj_ivar("_completionFunction"),new objj_ivar("_dependencies")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("main"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPOperation").super_class},"init")){
_cancelled=NO;
_executing=NO;
_finished=NO;
_ready=YES;
_dependencies=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
_queuePriority=CPOperationQueuePriorityNormal;
}
return _5;
}
}),new objj_method(sel_getUid("start"),function(_7,_8){
with(_7){
if(!_cancelled){
objj_msgSend(_7,"willChangeValueForKey:","isExecuting");
_executing=YES;
objj_msgSend(_7,"didChangeValueForKey:","isExecuting");
objj_msgSend(_7,"main");
if(_completionFunction){
_completionFunction();
}
objj_msgSend(_7,"willChangeValueForKey:","isExecuting");
_executing=NO;
objj_msgSend(_7,"didChangeValueForKey:","isExecuting");
objj_msgSend(_7,"willChangeValueForKey:","isFinished");
_finished=YES;
objj_msgSend(_7,"didChangeValueForKey:","isFinished");
}
}
}),new objj_method(sel_getUid("isCancelled"),function(_9,_a){
with(_9){
return _cancelled;
}
}),new objj_method(sel_getUid("isExecuting"),function(_b,_c){
with(_b){
return _executing;
}
}),new objj_method(sel_getUid("isFinished"),function(_d,_e){
with(_d){
return _finished;
}
}),new objj_method(sel_getUid("isConcurrent"),function(_f,_10){
with(_f){
return NO;
}
}),new objj_method(sel_getUid("isReady"),function(_11,_12){
with(_11){
return _ready;
}
}),new objj_method(sel_getUid("completionFunction"),function(_13,_14){
with(_13){
return _completionFunction;
}
}),new objj_method(sel_getUid("setCompletionFunction:"),function(_15,_16,_17){
with(_15){
_completionFunction=_17;
}
}),new objj_method(sel_getUid("addDependency:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"willChangeValueForKey:","dependencies");
objj_msgSend(_1a,"addObserver:forKeyPath:options:context:",_18,"isFinished",(CPKeyValueObservingOptionNew),NULL);
objj_msgSend(_dependencies,"addObject:",_1a);
objj_msgSend(_18,"didChangeValueForKey:","dependencies");
objj_msgSend(_18,"_updateIsReadyState");
}
}),new objj_method(sel_getUid("removeDependency:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"willChangeValueForKey:","dependencies");
objj_msgSend(_dependencies,"removeObject:",_1d);
objj_msgSend(_1d,"removeObserver:forKeyPath:",_1b,"isFinished");
objj_msgSend(_1b,"didChangeValueForKey:","dependencies");
objj_msgSend(_1b,"_updateIsReadyState");
}
}),new objj_method(sel_getUid("dependencies"),function(_1e,_1f){
with(_1e){
return _dependencies;
}
}),new objj_method(sel_getUid("waitUntilFinished"),function(_20,_21){
with(_20){
}
}),new objj_method(sel_getUid("cancel"),function(_22,_23){
with(_22){
objj_msgSend(_22,"willChangeValueForKey:","isCancelled");
_cancelled=YES;
objj_msgSend(_22,"didChangeValueForKey:","isCancelled");
}
}),new objj_method(sel_getUid("setQueuePriority:"),function(_24,_25,_26){
with(_24){
_queuePriority=_26;
}
}),new objj_method(sel_getUid("queuePriority"),function(_27,_28){
with(_27){
return _queuePriority;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_29,_2a,_2b,_2c,_2d,_2e){
with(_29){
if(_2b=="isFinished"){
objj_msgSend(_29,"_updateIsReadyState");
}
}
}),new objj_method(sel_getUid("_updateIsReadyState"),function(_2f,_30){
with(_2f){
var _31=YES;
if(_dependencies&&objj_msgSend(_dependencies,"count")>0){
var i=0;
for(i=0;i<objj_msgSend(_dependencies,"count");i++){
if(!objj_msgSend(objj_msgSend(_dependencies,"objectAtIndex:",i),"isFinished")){
_31=NO;
}
}
}
if(_31!=_ready){
objj_msgSend(_2f,"willChangeValueForKey:","isReady");
_ready=_31;
objj_msgSend(_2f,"didChangeValueForKey:","isReady");
}
}
})]);
p;18;CPOperationQueue.jt;5153;@STATIC;1.0;i;21;CPFunctionOperation.ji;23;CPInvocationOperation.ji;10;CPObject.ji;13;CPOperation.jt;5047;
objj_executeFile("CPFunctionOperation.j",YES);
objj_executeFile("CPInvocationOperation.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPOperation.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPOperationQueue"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_operations"),new objj_ivar("_suspended"),new objj_ivar("_name"),new objj_ivar("_timer")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("name"),function(_4,_5){
with(_4){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_6,_7,_8){
with(_6){
_name=_8;
}
}),new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
if(_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPOperationQueue").super_class},"init")){
_operations=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
_suspended=NO;
_currentlyModifyingOps=NO;
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.01,_9,sel_getUid("_runNextOpsInQueue"),nil,YES);
}
return _9;
}
}),new objj_method(sel_getUid("_runNextOpsInQueue"),function(_b,_c){
with(_b){
if(!_suspended&&objj_msgSend(_b,"operationCount")>0){
var i=0,_d=objj_msgSend(_operations,"count");
for(;i<_d;i++){
var op=objj_msgSend(_operations,"objectAtIndex:",i);
if(objj_msgSend(op,"isReady")&&!objj_msgSend(op,"isCancelled")&&!objj_msgSend(op,"isFinished")&&!objj_msgSend(op,"isExecuting")){
objj_msgSend(op,"start");
}
}
}
}
}),new objj_method(sel_getUid("_enableTimer:"),function(_e,_f,_10){
with(_e){
if(!_10){
if(_timer){
objj_msgSend(_timer,"invalidate");
_timer=nil;
}
}else{
if(!_timer){
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.01,_e,sel_getUid("_runNextOpsInQueue"),nil,YES);
}
}
}
}),new objj_method(sel_getUid("addOperation:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"willChangeValueForKey:","operations");
objj_msgSend(_11,"willChangeValueForKey:","operationCount");
objj_msgSend(_operations,"addObject:",_13);
objj_msgSend(_11,"_sortOpsByPriority:",_operations);
objj_msgSend(_11,"didChangeValueForKey:","operations");
objj_msgSend(_11,"didChangeValueForKey:","operationCount");
}
}),new objj_method(sel_getUid("addOperations:waitUntilFinished:"),function(_14,_15,ops,_16){
with(_14){
if(ops){
if(_16){
objj_msgSend(_14,"_sortOpsByPriority:",ops);
objj_msgSend(_14,"_runOpsSynchronously:",ops);
}
objj_msgSend(_operations,"addObjectsFromArray:",ops);
objj_msgSend(_14,"_sortOpsByPriority:",_operations);
}
}
}),new objj_method(sel_getUid("addOperationWithFunction:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"addOperation:",objj_msgSend(CPFunctionOperation,"functionOperationWithFunction:",_19));
}
}),new objj_method(sel_getUid("operations"),function(_1a,_1b){
with(_1a){
return _operations;
}
}),new objj_method(sel_getUid("operationCount"),function(_1c,_1d){
with(_1c){
if(_operations){
return objj_msgSend(_operations,"count");
}
return 0;
}
}),new objj_method(sel_getUid("cancelAllOperations"),function(_1e,_1f){
with(_1e){
if(_operations){
var i=0,_20=objj_msgSend(_operations,"count");
for(;i<_20;i++){
objj_msgSend(objj_msgSend(_operations,"objectAtIndex:",i),"cancel");
}
}
}
}),new objj_method(sel_getUid("waitUntilAllOperationsAreFinished"),function(_21,_22){
with(_21){
objj_msgSend(_21,"_enableTimer:",NO);
objj_msgSend(_21,"_runOpsSynchronously:",_operations);
if(!_suspended){
objj_msgSend(_21,"_enableTimer:",YES);
}
}
}),new objj_method(sel_getUid("maxConcurrentOperationCount"),function(_23,_24){
with(_23){
return 1;
}
}),new objj_method(sel_getUid("setSuspended:"),function(_25,_26,_27){
with(_25){
_suspended=_27;
objj_msgSend(_25,"_enableTimer:",!_27);
}
}),new objj_method(sel_getUid("isSuspended"),function(_28,_29){
with(_28){
return _suspended;
}
}),new objj_method(sel_getUid("_sortOpsByPriority:"),function(_2a,_2b,_2c){
with(_2a){
if(_2c){
objj_msgSend(_2c,"sortUsingFunction:context:",function(lhs,rhs){
if(objj_msgSend(lhs,"queuePriority")<objj_msgSend(rhs,"queuePriority")){
return 1;
}else{
if(objj_msgSend(lhs,"queuePriority")>objj_msgSend(rhs,"queuePriority")){
return -1;
}else{
return 0;
}
}
},nil);
}
}
}),new objj_method(sel_getUid("_runOpsSynchronously:"),function(_2d,_2e,ops){
with(_2d){
if(ops){
var _2f=YES;
while(_2f){
var i=0,_30=objj_msgSend(ops,"count");
_2f=NO;
for(;i<_30;i++){
var op=objj_msgSend(ops,"objectAtIndex:",i);
if(objj_msgSend(op,"isReady")&&!objj_msgSend(op,"isCancelled")&&!objj_msgSend(op,"isFinished")&&!objj_msgSend(op,"isExecuting")){
objj_msgSend(op,"start");
}
}
for(i=0;i<_30;i++){
var op=objj_msgSend(ops,"objectAtIndex:",i);
if(!objj_msgSend(op,"isFinished")&&!objj_msgSend(op,"isCancelled")){
_2f=YES;
}
}
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("mainQueue"),function(_31,_32){
with(_31){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPOperationQueue,"alloc"),"init");
objj_msgSend(_1,"setName:","main");
}
return _1;
}
}),new objj_method(sel_getUid("currentQueue"),function(_33,_34){
with(_33){
return objj_msgSend(CPOperationQueue,"mainQueue");
}
})]);
p;29;CPPropertyListSerialization.jt;1497;@STATIC;1.0;i;10;CPObject.jt;1463;
objj_executeFile("CPObject.j",YES);
CPPropertyListUnknownFormat=0;
CPPropertyListOpenStepFormat=kCFPropertyListOpenStepFormat;
CPPropertyListXMLFormat_v1_0=kCFPropertyListXMLFormat_v1_0;
CPPropertyListBinaryFormat_v1_0=kCFPropertyListBinaryFormat_v1_0;
CPPropertyList280NorthFormat_v1_0=kCFPropertyList280NorthFormat_v1_0;
var _1=objj_allocateClassPair(CPObject,"CPPropertyListSerialization"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("dataFromPropertyList:format:"),function(_3,_4,_5,_6){
with(_3){
return CPPropertyListCreateData(_5,_6);
}
}),new objj_method(sel_getUid("propertyListFromData:format:"),function(_7,_8,_9,_a){
with(_7){
return CPPropertyListCreateFromData(_9,_a);
}
})]);
var _1=objj_getClass("CPPropertyListSerialization");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPPropertyListSerialization\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("dataFromPropertyList:format:errorDescription:"),function(_b,_c,_d,_e,_f){
with(_b){
_CPReportLenientDeprecation(_b,_c,sel_getUid("dataFromPropertyList:format:"));
return objj_msgSend(_b,"dataFromPropertyList:format:",_d,_e);
}
}),new objj_method(sel_getUid("propertyListFromData:format:errorDescription:"),function(_10,_11,_12,_13,_14){
with(_10){
_CPReportLenientDeprecation(_10,_11,sel_getUid("propertyListFromData:format:"));
return objj_msgSend(_10,"propertyListFromData:format:",_12,_13);
}
})]);
p;9;CPProxy.jt;3560;@STATIC;1.0;i;13;CPException.ji;14;CPInvocation.ji;10;CPString.jt;3489;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPString.j",YES);
var _1=objj_allocateClassPair(Nil,"CPProxy"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("methodSignatureForSelector:"),function(_3,_4,_5){
with(_3){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-methodSignatureForSelector: called on abstract CPProxy class.");
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_6,_7,_8){
with(_6){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-forwardInvocation: called on abstract CPProxy class.");
}
}),new objj_method(sel_getUid("forward::"),function(_9,_a,_b,_c){
with(_9){
objj_msgSend(CPObject,"methodForSelector:",_a)(_9,_a,_b,_c);
}
}),new objj_method(sel_getUid("hash"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"UID");
}
}),new objj_method(sel_getUid("UID"),function(_f,_10){
with(_f){
if(typeof _f._UID==="undefined"){
_f._UID=objj_generateObjectUID();
}
return _UID;
}
}),new objj_method(sel_getUid("isEqual:"),function(_11,_12,_13){
with(_11){
return _11===object;
}
}),new objj_method(sel_getUid("self"),function(_14,_15){
with(_14){
return _14;
}
}),new objj_method(sel_getUid("class"),function(_16,_17){
with(_16){
return isa;
}
}),new objj_method(sel_getUid("superclass"),function(_18,_19){
with(_18){
return class_getSuperclass(isa);
}
}),new objj_method(sel_getUid("performSelector:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(_1a,_1c);
}
}),new objj_method(sel_getUid("performSelector:withObject:"),function(_1d,_1e,_1f,_20){
with(_1d){
return objj_msgSend(_1d,_1f,_20);
}
}),new objj_method(sel_getUid("performSelector:withObject:withObject:"),function(_21,_22,_23,_24,_25){
with(_21){
return objj_msgSend(_21,_23,_24,_25);
}
}),new objj_method(sel_getUid("isProxy"),function(_26,_27){
with(_26){
return YES;
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"methodSignatureForSelector:",_29),_2c=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_2b);
objj_msgSend(_28,"forwardInvocation:",_2c);
return objj_msgSend(_2c,"returnValue");
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_2d,"methodSignatureForSelector:",_2e),_31=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_30);
objj_msgSend(_2d,"forwardInvocation:",_31);
return objj_msgSend(_31,"returnValue");
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"methodSignatureForSelector:",_33),_36=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",_35);
objj_msgSend(_32,"forwardInvocation:",_36);
return objj_msgSend(_36,"returnValue");
}
}),new objj_method(sel_getUid("description"),function(_37,_38){
with(_37){
return "<"+class_getName(isa)+" 0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(_37,"UID"))+">";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("load"),function(_39,_3a){
with(_39){
}
}),new objj_method(sel_getUid("initialize"),function(_3b,_3c){
with(_3b){
}
}),new objj_method(sel_getUid("class"),function(_3d,_3e){
with(_3d){
return _3d;
}
}),new objj_method(sel_getUid("alloc"),function(_3f,_40){
with(_3f){
return class_createInstance(_3f);
}
}),new objj_method(sel_getUid("respondsToSelector:"),function(_41,_42,_43){
with(_41){
return !!class_getInstanceMethod(isa,aSelector);
}
})]);
p;9;CPRange.jt;1244;@STATIC;1.0;t;1225;
CPMakeRange=function(_1,_2){
return {location:_1,length:_2};
};
CPCopyRange=function(_3){
return {location:_3.location,length:_3.length};
};
CPMakeRangeCopy=function(_4){
return {location:_4.location,length:_4.length};
};
CPEmptyRange=function(_5){
return _5.length===0;
};
CPMaxRange=function(_6){
return _6.location+_6.length;
};
CPEqualRanges=function(_7,_8){
return ((_7.location===_8.location)&&(_7.length===_8.length));
};
CPLocationInRange=function(_9,_a){
return (_9>=_a.location)&&(_9<CPMaxRange(_a));
};
CPUnionRange=function(_b,_c){
var _d=MIN(_b.location,_c.location);
return CPMakeRange(_d,MAX(CPMaxRange(_b),CPMaxRange(_c))-_d);
};
CPIntersectionRange=function(_e,_f){
if(CPMaxRange(_e)<_f.location||CPMaxRange(_f)<_e.location){
return CPMakeRange(0,0);
}
var _10=MAX(_e.location,_f.location);
return CPMakeRange(_10,MIN(CPMaxRange(_e),CPMaxRange(_f))-_10);
};
CPRangeInRange=function(_11,_12){
return (_11.location<=_12.location&&CPMaxRange(_11)>=CPMaxRange(_12));
};
CPStringFromRange=function(_13){
return "{"+_13.location+", "+_13.length+"}";
};
CPRangeFromString=function(_14){
var _15=_14.indexOf(",");
return {location:parseInt(_14.substr(1,_15-1)),length:parseInt(_14.substring(_15+1,_14.length))};
};
p;11;CPRunLoop.jt;6935;@STATIC;1.0;i;9;CPArray.ji;10;CPObject.ji;10;CPString.jt;6873;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPDefaultRunLoopMode="CPDefaultRunLoopMode";
_CPRunLoopPerformCompare=function(_1,_2){
return objj_msgSend(_2,"order")-objj_msgSend(_1,"order");
};
var _3=[],_4=5;
var _5=objj_allocateClassPair(CPObject,"_CPRunLoopPerform"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_target"),new objj_ivar("_selector"),new objj_ivar("_argument"),new objj_ivar("_order"),new objj_ivar("_runLoopModes"),new objj_ivar("_isValid")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithSelector:target:argument:order:modes:"),function(_7,_8,_9,_a,_b,_c,_d){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("_CPRunLoopPerform").super_class},"init");
if(_7){
_selector=_9;
_target=_a;
_argument=_b;
_order=_c;
_runLoopModes=_d;
_isValid=YES;
}
return _7;
}
}),new objj_method(sel_getUid("selector"),function(_e,_f){
with(_e){
return _selector;
}
}),new objj_method(sel_getUid("target"),function(_10,_11){
with(_10){
return _target;
}
}),new objj_method(sel_getUid("argument"),function(_12,_13){
with(_12){
return _argument;
}
}),new objj_method(sel_getUid("order"),function(_14,_15){
with(_14){
return _order;
}
}),new objj_method(sel_getUid("fireInMode:"),function(_16,_17,_18){
with(_16){
if(!_isValid){
return YES;
}
if(objj_msgSend(_runLoopModes,"containsObject:",_18)){
objj_msgSend(_target,"performSelector:withObject:",_selector,_argument);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("invalidate"),function(_19,_1a){
with(_19){
_isValid=NO;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("_poolPerform:"),function(_1b,_1c,_1d){
with(_1b){
if(!_1d||_3.length>=_4){
return;
}
_3.push(_1d);
}
}),new objj_method(sel_getUid("performWithSelector:target:argument:order:modes:"),function(_1e,_1f,_20,_21,_22,_23,_24){
with(_1e){
if(_3.length){
var _25=_3.pop();
_25._target=_21;
_25._selector=_20;
_25._argument=_22;
_25._order=_23;
_25._runLoopModes=_24;
_25._isValid=YES;
return _25;
}
return objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithSelector:target:argument:order:modes:",_20,_21,_22,_23,_24);
}
})]);
var _26=0;
var _5=objj_allocateClassPair(CPObject,"CPRunLoop"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_runLoopLock"),new objj_ivar("_timersForModes"),new objj_ivar("_nativeTimersForModes"),new objj_ivar("_nextTimerFireDatesForModes"),new objj_ivar("_didAddTimer"),new objj_ivar("_effectiveDate"),new objj_ivar("_orderedPerforms"),new objj_ivar("_runLoopInsuranceTimer")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("init"),function(_27,_28){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPRunLoop").super_class},"init");
if(_27){
_orderedPerforms=[];
_timersForModes={};
_nativeTimersForModes={};
_nextTimerFireDatesForModes={};
}
return _27;
}
}),new objj_method(sel_getUid("performSelector:target:argument:order:modes:"),function(_29,_2a,_2b,_2c,_2d,_2e,_2f){
with(_29){
var _30=objj_msgSend(_CPRunLoopPerform,"performWithSelector:target:argument:order:modes:",_2b,_2c,_2d,_2e,_2f),_31=_orderedPerforms.length;
while(_31--){
if(_2e<objj_msgSend(_orderedPerforms[_31],"order")){
break;
}
}
_orderedPerforms.splice(_31+1,0,_30);
}
}),new objj_method(sel_getUid("cancelPerformSelector:target:argument:"),function(_32,_33,_34,_35,_36){
with(_32){
var _37=_orderedPerforms.length;
while(_37--){
var _38=_orderedPerforms[_37];
if(objj_msgSend(_38,"selector")===_34&&objj_msgSend(_38,"target")==_35&&objj_msgSend(_38,"argument")==_36){
objj_msgSend(_orderedPerforms[_37],"invalidate");
}
}
}
}),new objj_method(sel_getUid("performSelectors"),function(_39,_3a){
with(_39){
objj_msgSend(_39,"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("addTimer:forMode:"),function(_3b,_3c,_3d,_3e){
with(_3b){
if(_timersForModes[_3e]){
_timersForModes[_3e].push(_3d);
}else{
_timersForModes[_3e]=[_3d];
}
_didAddTimer=YES;
if(!_3d._lastNativeRunLoopsForModes){
_3d._lastNativeRunLoopsForModes={};
}
_3d._lastNativeRunLoopsForModes[_3e]=_26;
if(objj_msgSend(CFBundle.environments(),"indexOfObject:",("Browser"))!==CPNotFound){
if(!_runLoopInsuranceTimer){
_runLoopInsuranceTimer=window.setNativeTimeout(function(){
objj_msgSend(_3b,"limitDateForMode:",CPDefaultRunLoopMode);
},0);
}
}
}
}),new objj_method(sel_getUid("limitDateForMode:"),function(_3f,_40,_41){
with(_3f){
if(_runLoopLock){
return;
}
_runLoopLock=YES;
if(objj_msgSend(CFBundle.environments(),"indexOfObject:",("Browser"))!==CPNotFound){
if(_runLoopInsuranceTimer){
window.clearNativeTimeout(_runLoopInsuranceTimer);
_runLoopInsuranceTimer=nil;
}
}
var now=_effectiveDate?objj_msgSend(_effectiveDate,"laterDate:",objj_msgSend(CPDate,"date")):objj_msgSend(CPDate,"date"),_42=nil,_43=_nextTimerFireDatesForModes[_41];
if(_didAddTimer||_43&&_43<=now){
_didAddTimer=NO;
if(_nativeTimersForModes[_41]!==nil){
window.clearNativeTimeout(_nativeTimersForModes[_41]);
_nativeTimersForModes[_41]=nil;
}
var _44=_timersForModes[_41],_45=_44.length;
_timersForModes[_41]=nil;
while(_45--){
var _46=_44[_45];
if(_46._lastNativeRunLoopsForModes[_41]<_26&&_46._isValid&&_46._fireDate<=now){
objj_msgSend(_46,"fire");
}
if(_46._isValid){
_42=(_42===nil)?_46._fireDate:objj_msgSend(_42,"earlierDate:",_46._fireDate);
}else{
_46._lastNativeRunLoopsForModes[_41]=0;
_44.splice(_45,1);
}
}
var _47=_timersForModes[_41];
if(_47&&_47.length){
_45=_47.length;
while(_45--){
var _46=_47[_45];
if(objj_msgSend(_46,"isValid")){
_42=(_42===nil)?_46._fireDate:objj_msgSend(_42,"earlierDate:",_46._fireDate);
}else{
_47.splice(_45,1);
}
}
_timersForModes[_41]=_47.concat(_44);
}else{
_timersForModes[_41]=_44;
}
_nextTimerFireDatesForModes[_41]=_42;
if(_nextTimerFireDatesForModes[_41]!==nil){
_nativeTimersForModes[_41]=window.setNativeTimeout(function(){
_effectiveDate=_42;
_nativeTimersForModes[_41]=nil;
++_26;
objj_msgSend(_3f,"limitDateForMode:",_41);
_effectiveDate=nil;
},MAX(0,objj_msgSend(_42,"timeIntervalSinceNow")*1000));
}
}
var _48=_orderedPerforms,_45=_48.length;
_orderedPerforms=[];
while(_45--){
var _49=_48[_45];
if(objj_msgSend(_49,"fireInMode:",CPDefaultRunLoopMode)){
objj_msgSend(_CPRunLoopPerform,"_poolPerform:",_49);
_48.splice(_45,1);
}
}
if(_orderedPerforms.length){
_orderedPerforms=_orderedPerforms.concat(_48);
_orderedPerforms.sort(_CPRunLoopPerformCompare);
}else{
_orderedPerforms=_48;
}
_runLoopLock=NO;
return _42;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_4a,_4b){
with(_4a){
if(_4a!=objj_msgSend(CPRunLoop,"class")){
return;
}
CPMainRunLoop=objj_msgSend(objj_msgSend(CPRunLoop,"alloc"),"init");
}
}),new objj_method(sel_getUid("currentRunLoop"),function(_4c,_4d){
with(_4c){
return CPMainRunLoop;
}
}),new objj_method(sel_getUid("mainRunLoop"),function(_4e,_4f){
with(_4e){
return CPMainRunLoop;
}
})]);
p;11;CPScanner.jt;7789;@STATIC;1.0;I;27;Foundation/CPCharacterSet.jt;7738;
objj_executeFile("Foundation/CPCharacterSet.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPScanner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_string"),new objj_ivar("_locale"),new objj_ivar("_scanLocation"),new objj_ivar("_caseSensitive"),new objj_ivar("_charactersToBeSkipped")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPScanner").super_class},"init")){
_string=objj_msgSend(_5,"copy");
_scanLocation=0;
_charactersToBeSkipped=objj_msgSend(CPCharacterSet,"whitespaceCharacterSet");
_caseSensitive=NO;
}
return _3;
}
}),new objj_method(sel_getUid("copy"),function(_6,_7){
with(_6){
var _8=objj_msgSend(objj_msgSend(CPScanner,"alloc"),"initWithString:",objj_msgSend(_6,"string"));
objj_msgSend(_8,"setCharactersToBeSkipped:",objj_msgSend(_6,"charactersToBeSkipped"));
objj_msgSend(_8,"setCaseSensitive:",objj_msgSend(_6,"caseSensitive"));
objj_msgSend(_8,"setLocale:",objj_msgSend(_6,"locale"));
objj_msgSend(_8,"setScanLocation:",objj_msgSend(_6,"scanLocation"));
return _8;
}
}),new objj_method(sel_getUid("locale"),function(_9,_a){
with(_9){
return _locale;
}
}),new objj_method(sel_getUid("setLocale:"),function(_b,_c,_d){
with(_b){
_locale=_d;
}
}),new objj_method(sel_getUid("setCaseSensitive:"),function(_e,_f,_10){
with(_e){
_caseSensitive=_10;
}
}),new objj_method(sel_getUid("caseSensitive"),function(_11,_12){
with(_11){
return _caseSensitive;
}
}),new objj_method(sel_getUid("string"),function(_13,_14){
with(_13){
return _string;
}
}),new objj_method(sel_getUid("charactersToBeSkipped"),function(_15,_16){
with(_15){
return _charactersToBeSkipped;
}
}),new objj_method(sel_getUid("setCharactersToBeSkipped:"),function(_17,_18,c){
with(_17){
_charactersToBeSkipped=c;
}
}),new objj_method(sel_getUid("isAtEnd"),function(_19,_1a){
with(_19){
return _scanLocation==_string.length;
}
}),new objj_method(sel_getUid("scanLocation"),function(_1b,_1c){
with(_1b){
return _scanLocation;
}
}),new objj_method(sel_getUid("setScanLocation:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f>_string.length){
_1f=_string.length;
}else{
if(_1f<0){
_1f=0;
}
}
_scanLocation=_1f;
}
}),new objj_method(sel_getUid("_performScanWithSelector:withObject:into:"),function(_20,_21,s,arg,ref){
with(_20){
var ret=objj_msgSend(_20,"performSelector:withObject:",s,arg);
if(ref!=nil){
ref(ret);
}
return ret!=NULL;
}
}),new objj_method(sel_getUid("scanCharactersFromSet:intoString:"),function(_22,_23,_24,ref){
with(_22){
return objj_msgSend(_22,"_performScanWithSelector:withObject:into:",sel_getUid("scanCharactersFromSet:"),_24,ref);
}
}),new objj_method(sel_getUid("scanCharactersFromSet:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,"_scanWithSet:breakFlag:",_27,NO);
}
}),new objj_method(sel_getUid("scanUpToCharactersFromSet:intoString:"),function(_28,_29,_2a,ref){
with(_28){
return objj_msgSend(_28,"_performScanWithSelector:withObject:into:",sel_getUid("scanUpToCharactersFromSet:"),_2a,ref);
}
}),new objj_method(sel_getUid("scanUpToCharactersFromSet:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_2b,"_scanWithSet:breakFlag:",_2d,YES);
}
}),new objj_method(sel_getUid("_scanWithSet:breakFlag:"),function(_2e,_2f,_30,_31){
with(_2e){
if(objj_msgSend(_2e,"isAtEnd")){
return nil;
}
var _32=objj_msgSend(_2e,"scanLocation");
var str=nil;
while(_32<_string.length){
var c=(_string.charAt(_32));
if(objj_msgSend(_30,"characterIsMember:",c)==_31){
break;
}
if(!objj_msgSend(_charactersToBeSkipped,"characterIsMember:",c)){
if(!str){
str="";
}
str+=c;
}
_32++;
}
if(str){
objj_msgSend(_2e,"setScanLocation:",_32);
}
return str;
}
}),new objj_method(sel_getUid("_movePastCharactersToBeSkipped"),function(_33,_34){
with(_33){
var _35=objj_msgSend(_33,"scanLocation");
var _36=objj_msgSend(_33,"string");
var _37=objj_msgSend(_33,"charactersToBeSkipped");
while(_35<_36.length){
if(!objj_msgSend(_37,"characterIsMember:",_36.charAt(_35))){
break;
}
_35++;
}
objj_msgSend(_33,"setScanLocation:",_35);
}
}),new objj_method(sel_getUid("scanString:intoString:"),function(_38,_39,_3a,ref){
with(_38){
return objj_msgSend(_38,"_performScanWithSelector:withObject:into:",sel_getUid("scanString:"),_3a,ref);
}
}),new objj_method(sel_getUid("scanString:"),function(_3b,_3c,s){
with(_3b){
objj_msgSend(_3b,"_movePastCharactersToBeSkipped");
if(objj_msgSend(_3b,"isAtEnd")){
return nil;
}
var _3d=objj_msgSend(_3b,"string").substr(objj_msgSend(_3b,"scanLocation"),s.length);
if((_caseSensitive&&_3d!=s)||(!_caseSensitive&&(_3d.toLowerCase()!=s.toLowerCase()))){
return nil;
}else{
objj_msgSend(_3b,"setScanLocation:",objj_msgSend(_3b,"scanLocation")+s.length);
return s;
}
}
}),new objj_method(sel_getUid("scanUpToString:intoString:"),function(_3e,_3f,_40,ref){
with(_3e){
return objj_msgSend(_3e,"_performScanWithSelector:withObject:into:",sel_getUid("scanUpToString:"),_40,ref);
}
}),new objj_method(sel_getUid("scanUpToString:"),function(_41,_42,s){
with(_41){
var _43=objj_msgSend(_41,"scanLocation"),str=objj_msgSend(_41,"string");
var _44=nil;
while(_43<str.length){
var _45=str.substr(_43,s.length);
if(_45==s||(!_caseSensitive&&_45.toLowerCase()==s.toLowerCase())){
break;
}
if(!_44){
_44="";
}
_44+=str.charAt(_43);
_43++;
}
if(_44){
objj_msgSend(_41,"setScanLocation:",_43);
}
if(objj_msgSend(_41,"charactersToBeSkipped")){
_44=objj_msgSend(_44,"_stringByTrimmingCharactersInSet:options:",objj_msgSend(_41,"charactersToBeSkipped"),_CPCharacterSetTrimAtBeginning);
}
return _44;
}
}),new objj_method(sel_getUid("scanFloat"),function(_46,_47){
with(_46){
objj_msgSend(_46,"_movePastCharactersToBeSkipped");
var str=objj_msgSend(_46,"string"),_48=objj_msgSend(_46,"scanLocation");
if(objj_msgSend(_46,"isAtEnd")){
return 0;
}
var s=str.substring(_48,str.length);
var f=parseFloat(s);
if(f){
var pos,_49=NO;
var _4a=45;
for(pos=_48;pos<_48+str.length;pos++){
var _4b=str.charCodeAt(pos);
if(_4b==_4a){
if(_49==YES){
break;
}
_49=YES;
}else{
if(_4b<48||_4b>57||(_4b==45&&pos!=_48)){
break;
}
}
}
objj_msgSend(_46,"setScanLocation:",pos);
return f;
}
return nil;
}
}),new objj_method(sel_getUid("scanInt"),function(_4c,_4d){
with(_4c){
objj_msgSend(_4c,"_movePastCharactersToBeSkipped");
var str=objj_msgSend(_4c,"string"),_4e=objj_msgSend(_4c,"scanLocation");
if(objj_msgSend(_4c,"isAtEnd")){
return 0;
}
var s=str.substring(_4e,str.length);
var i=parseInt(s);
if(i){
var pos,_4f=NO;
for(pos=_4e;pos<_4e+str.length;pos++){
var _50=str.charCodeAt(pos);
if(_50==46){
if(_4f==YES){
break;
}
_4f=YES;
}else{
if(_50<48||_50>57||(_50==45&&pos!=_4e)){
break;
}
}
}
objj_msgSend(_4c,"setScanLocation:",pos);
return i;
}
return nil;
}
}),new objj_method(sel_getUid("scanInt:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(_51,"_performScanWithSelector:withObject:into:",sel_getUid("scanInt"),nil,_53);
}
}),new objj_method(sel_getUid("scanFloat:"),function(_54,_55,_56){
with(_54){
return objj_msgSend(_54,"_performScanWithSelector:withObject:into:",sel_getUid("scanFloat"),nil,_56);
}
}),new objj_method(sel_getUid("scanDouble:"),function(_57,_58,_59){
with(_57){
return objj_msgSend(_57,"scanFloat:",_59);
}
}),new objj_method(sel_getUid("description"),function(_5a,_5b){
with(_5a){
return objj_msgSendSuper({receiver:_5a,super_class:objj_getClass("CPScanner").super_class},"description")+" {"+CPStringFromClass(objj_msgSend(_5a,"class"))+", state = '"+(objj_msgSend(_5a,"string").substr(0,_scanLocation)+"{{ SCAN LOCATION ->}}"+objj_msgSend(_5a,"string").substr(_scanLocation))+"'; }";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("scannerWithString:"),function(_5c,_5d,_5e){
with(_5c){
return objj_msgSend(objj_msgSend(_5c,"alloc"),"initWithString:",_5e);
}
})]);
p;7;CPSet.jt;8014;@STATIC;1.0;i;9;CPArray.ji;14;CPEnumerator.ji;10;CPNumber.ji;10;CPObject.jt;7933;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contents"),new objj_ivar("_count")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPSet").super_class},"init")){
_count=0;
_contents={};
}
return _3;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSend(_5,"init")){
var _8=_7.length;
while(_8--){
objj_msgSend(_5,"addObject:",_7[_8]);
}
}
return _5;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_9,_a,_b,_c){
with(_9){
return objj_msgSend(_9,"initWithArray:",_b.splice(0,_c));
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSend(_d,"init")){
var _10=arguments.length,i=2;
for(;i<_10&&(argument=arguments[i])!=nil;++i){
objj_msgSend(_d,"addObject:",argument);
}
}
return _d;
}
}),new objj_method(sel_getUid("initWithSet:"),function(_11,_12,_13){
with(_11){
return objj_msgSend(_11,"initWithSet:copyItems:",_13,NO);
}
}),new objj_method(sel_getUid("initWithSet:copyItems:"),function(_14,_15,_16,_17){
with(_14){
_14=objj_msgSend(_14,"init");
if(!_16){
return _14;
}
var _18=_16._contents,_19;
for(_19 in _18){
if(_18.hasOwnProperty(_19)){
if(_17){
objj_msgSend(_14,"addObject:",objj_msgSend(_18[_19],"copy"));
}else{
objj_msgSend(_14,"addObject:",_18[_19]);
}
}
}
return _14;
}
}),new objj_method(sel_getUid("allObjects"),function(_1a,_1b){
with(_1a){
var _1c=[],_1d;
for(_1d in _contents){
if(_contents.hasOwnProperty(_1d)){
_1c.push(_contents[_1d]);
}
}
return _1c;
}
}),new objj_method(sel_getUid("anyObject"),function(_1e,_1f){
with(_1e){
var _20;
for(_20 in _contents){
if(_contents.hasOwnProperty(_20)){
return _contents[_20];
}
}
return nil;
}
}),new objj_method(sel_getUid("containsObject:"),function(_21,_22,_23){
with(_21){
var obj=_contents[objj_msgSend(_23,"UID")];
if(obj!==undefined&&objj_msgSend(obj,"isEqual:",_23)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("count"),function(_24,_25){
with(_24){
return _count;
}
}),new objj_method(sel_getUid("intersectsSet:"),function(_26,_27,_28){
with(_26){
if(_26===_28){
return YES;
}
var _29=objj_msgSend(_28,"allObjects"),_2a=objj_msgSend(_29,"count");
while(_2a--){
if(objj_msgSend(_26,"containsObject:",_29[_2a])){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isEqualToSet:"),function(_2b,_2c,set){
with(_2b){
return _2b===set||(objj_msgSend(_2b,"count")===objj_msgSend(set,"count")&&objj_msgSend(set,"isSubsetOfSet:",_2b));
}
}),new objj_method(sel_getUid("isSubsetOfSet:"),function(_2d,_2e,set){
with(_2d){
var _2f=objj_msgSend(_2d,"allObjects"),i=0,_30=_2f.length;
for(;i<_30;i++){
if(!objj_msgSend(set,"containsObject:",_2f[i])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"makeObjectsPerformSelector:withObject:",_33,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(_34,"allObjects"),i=0,_39=_38.length;
for(;i<_39;i++){
objj_msgSend(_38[i],"performSelector:withObject:",_36,_37);
}
}
}),new objj_method(sel_getUid("member:"),function(_3a,_3b,_3c){
with(_3a){
if(objj_msgSend(_3a,"containsObject:",_3c)){
return _3c;
}
return nil;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_3d,_3e){
with(_3d){
return objj_msgSend(objj_msgSend(_3d,"allObjects"),"objectEnumerator");
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_3f,_40,_41){
with(_3f){
_3f=objj_msgSend(_3f,"init");
return _3f;
}
}),new objj_method(sel_getUid("setSet:"),function(_42,_43,set){
with(_42){
objj_msgSend(_42,"removeAllObjects");
objj_msgSend(_42,"addObjectsFromArray:",objj_msgSend(set,"allObjects"));
}
}),new objj_method(sel_getUid("addObject:"),function(_44,_45,_46){
with(_44){
if(objj_msgSend(_44,"containsObject:",_46)){
return;
}
_contents[objj_msgSend(_46,"UID")]=_46;
_count++;
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_47,_48,_49){
with(_47){
var _4a=objj_msgSend(_49,"count");
while(_4a--){
objj_msgSend(_47,"addObject:",_49[_4a]);
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_4b,_4c,_4d){
with(_4b){
if(objj_msgSend(_4b,"containsObject:",_4d)){
delete _contents[objj_msgSend(_4d,"UID")];
_count--;
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(_4e,_4f,_50){
with(_4e){
var _51=objj_msgSend(_50,"count");
while(_51--){
objj_msgSend(_4e,"removeObject:",_50[_51]);
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_52,_53){
with(_52){
_contents={};
_count=0;
}
}),new objj_method(sel_getUid("intersectSet:"),function(_54,_55,set){
with(_54){
var _56=objj_msgSend(_54,"allObjects"),i=0,_57=_56.length;
for(;i<_57;i++){
if(!objj_msgSend(set,"containsObject:",_56[i])){
objj_msgSend(_54,"removeObject:",_56[i]);
}
}
}
}),new objj_method(sel_getUid("minusSet:"),function(_58,_59,set){
with(_58){
var _5a=objj_msgSend(set,"allObjects"),i=0,_5b=_5a.length;
for(;i<_5b;i++){
if(objj_msgSend(_58,"containsObject:",_5a[i])){
objj_msgSend(_58,"removeObject:",_5a[i]);
}
}
}
}),new objj_method(sel_getUid("unionSet:"),function(_5c,_5d,set){
with(_5c){
var _5e=objj_msgSend(set,"allObjects"),i=0,_5f=_5e.length;
for(;i<_5f;i++){
objj_msgSend(_5c,"addObject:",_5e[i]);
}
}
}),new objj_method(sel_getUid("description"),function(_60,_61){
with(_60){
return "{("+objj_msgSend(_60,"allObjects").join(", ")+")}";
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("set"),function(_62,_63){
with(_62){
return objj_msgSend(objj_msgSend(_62,"alloc"),"init");
}
}),new objj_method(sel_getUid("setWithArray:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(objj_msgSend(_64,"alloc"),"initWithArray:",_66);
}
}),new objj_method(sel_getUid("setWithObject:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(objj_msgSend(_67,"alloc"),"initWithArray:",[_69]);
}
}),new objj_method(sel_getUid("setWithObjects:count:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(objj_msgSend(_6a,"alloc"),"initWithObjects:count:",_6c,_6d);
}
}),new objj_method(sel_getUid("setWithObjects:"),function(_6e,_6f,_70){
with(_6e){
var set=objj_msgSend(objj_msgSend(_6e,"alloc"),"init"),_71=arguments.length,i=2;
for(;i<_71&&((argument=arguments[i])!==nil);++i){
objj_msgSend(set,"addObject:",argument);
}
return set;
}
}),new objj_method(sel_getUid("setWithSet:"),function(_72,_73,set){
with(_72){
return objj_msgSend(objj_msgSend(_72,"alloc"),"initWithSet:",set);
}
}),new objj_method(sel_getUid("setWithCapacity:"),function(_74,_75,_76){
with(_74){
return objj_msgSend(objj_msgSend(_74,"alloc"),"initWithCapacity:",_76);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_77,_78){
with(_77){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithSet:",_77);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_79,_7a){
with(_79){
return objj_msgSend(_79,"copy");
}
})]);
var _7b="CPSetObjectsKey";
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7c,_7d,_7e){
with(_7c){
return objj_msgSend(_7c,"initWithArray:",objj_msgSend(_7e,"decodeObjectForKey:",_7b));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7f,_80,_81){
with(_7f){
objj_msgSend(_81,"encodeObject:forKey:",objj_msgSend(_7f,"allObjects"),_7b);
}
})]);
var _1=objj_allocateClassPair(CPSet,"CPMutableSet"),_2=_1.isa;
objj_registerClassPair(_1);
p;18;CPSortDescriptor.jt;2966;@STATIC;1.0;i;10;CPObject.ji;15;CPObjJRuntime.jt;2912;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
CPOrderedAscending=-1;
CPOrderedSame=0;
CPOrderedDescending=1;
var _1=objj_allocateClassPair(CPObject,"CPSortDescriptor"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_key"),new objj_ivar("_selector"),new objj_ivar("_ascending")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKey:ascending:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSend(_3,"initWithKey:ascending:selector:",_5,_6,sel_getUid("compare:"));
}
}),new objj_method(sel_getUid("initWithKey:ascending:selector:"),function(_7,_8,_9,_a,_b){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPSortDescriptor").super_class},"init");
if(_7){
_key=_9;
_ascending=_a;
_selector=_b;
}
return _7;
}
}),new objj_method(sel_getUid("ascending"),function(_c,_d){
with(_c){
return _ascending;
}
}),new objj_method(sel_getUid("key"),function(_e,_f){
with(_e){
return _key;
}
}),new objj_method(sel_getUid("selector"),function(_10,_11){
with(_10){
return _selector;
}
}),new objj_method(sel_getUid("compareObject:withObject:"),function(_12,_13,_14,_15){
with(_12){
return (_ascending?1:-1)*objj_msgSend(objj_msgSend(_14,"valueForKeyPath:",_key),"performSelector:withObject:",_selector,objj_msgSend(_15,"valueForKeyPath:",_key));
}
}),new objj_method(sel_getUid("reversedSortDescriptor"),function(_16,_17){
with(_16){
return objj_msgSend(objj_msgSend(objj_msgSend(_16,"class"),"alloc"),"initWithKey:ascending:selector:",_key,!_ascending,_selector);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sortDescriptorWithKey:ascending:"),function(_18,_19,_1a,_1b){
with(_18){
return objj_msgSend(objj_msgSend(_18,"alloc"),"initWithKey:ascending:",_1a,_1b);
}
}),new objj_method(sel_getUid("sortDescriptorWithKey:ascending:selector:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(objj_msgSend(_1c,"alloc"),"initWithKey:ascending:selector:",_1e,_1f,_20);
}
})]);
var _21="CPSortDescriptorKeyKey",_22="CPSortDescriptorAscendingKey",_23="CPSortDescriptorSelectorKey";
var _1=objj_getClass("CPSortDescriptor");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSortDescriptor\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_24,_25,_26){
with(_24){
if(_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPSortDescriptor").super_class},"init")){
_key=objj_msgSend(_26,"decodeObjectForKey:",_21);
_ascending=objj_msgSend(_26,"decodeBoolForKey:",_22);
_selector=CPSelectorFromString(objj_msgSend(_26,"decodeObjectForKey:",_23));
}
return _24;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_29,"encodeObject:forKey:",_key,_21);
objj_msgSend(_29,"encodeBool:forKey:",_ascending,_22);
objj_msgSend(_29,"encodeObject:forKey:",CPStringFromSelector(_selector),_23);
}
})]);
p;10;CPString.jt;11356;@STATIC;1.0;i;13;CPException.ji;10;CPObject.ji;18;CPSortDescriptor.ji;9;CPValue.jt;11267;
objj_executeFile("CPException.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
objj_executeFile("CPValue.j",YES);
CPCaseInsensitiveSearch=1;
CPLiteralSearch=2;
CPBackwardsSearch=4;
CPAnchoredSearch=8;
CPNumericSearch=64;
CPDiacriticInsensitiveSearch=128;
var _1=new CFMutableDictionary();
var _2=["/",".","*","+","?","|","$","^","(",")","[","]","{","}","\\"],_3=new RegExp("(\\"+_2.join("|\\")+")","g"),_4=new RegExp("(^\\s+|\\s+$)","g");
var _5=objj_allocateClassPair(CPObject,"CPString"),_6=_5.isa;
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("initWithString:"),function(_7,_8,_9){
with(_7){
return String(_9);
}
}),new objj_method(sel_getUid("initWithFormat:"),function(_a,_b,_c){
with(_a){
if(!_c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
_a=ObjectiveJ.sprintf.apply(this,Array.prototype.slice.call(arguments,2));
return _a;
}
}),new objj_method(sel_getUid("description"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("length"),function(_f,_10){
with(_f){
return length;
}
}),new objj_method(sel_getUid("characterAtIndex:"),function(_11,_12,_13){
with(_11){
return charAt(_13);
}
}),new objj_method(sel_getUid("stringByAppendingFormat:"),function(_14,_15,_16){
with(_14){
if(!_16){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return _14+ObjectiveJ.sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("stringByAppendingString:"),function(_17,_18,_19){
with(_17){
return _17+_19;
}
}),new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
if(length==_1c){
return _1a;
}
if(_1c<length){
return substr(0,_1c);
}
var _1f=_1a,_20=_1d.substring(_1e),_21=_1c-length;
while((_21-=_20.length)>=0){
_1f+=_20;
}
if(-_21<_20.length){
_1f+=_20.substring(0,-_21);
}
return _1f;
}
}),new objj_method(sel_getUid("componentsSeparatedByString:"),function(_22,_23,_24){
with(_22){
return split(_24);
}
}),new objj_method(sel_getUid("substringFromIndex:"),function(_25,_26,_27){
with(_25){
return substr(_27);
}
}),new objj_method(sel_getUid("substringWithRange:"),function(_28,_29,_2a){
with(_28){
return substr(_2a.location,_2a.length);
}
}),new objj_method(sel_getUid("substringToIndex:"),function(_2b,_2c,_2d){
with(_2b){
return substring(0,_2d);
}
}),new objj_method(sel_getUid("rangeOfString:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_2e,"rangeOfString:options:",_30,0);
}
}),new objj_method(sel_getUid("rangeOfString:options:"),function(_31,_32,_33,_34){
with(_31){
return objj_msgSend(_31,"rangeOfString:options:range:",_33,_34,nil);
}
}),new objj_method(sel_getUid("rangeOfString:options:range:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=(_39==nil)?_35:objj_msgSend(_35,"substringWithRange:",_39),_3b=CPNotFound;
if(_38&CPCaseInsensitiveSearch){
_3a=_3a.toLowerCase();
_37=_37.toLowerCase();
}
if(_38&CPBackwardsSearch){
_3b=_3a.lastIndexOf(_37,_38&CPAnchoredSearch?length-_37.length:0);
}else{
if(_38&CPAnchoredSearch){
_3b=_3a.substr(0,_37.length).indexOf(_37)!=CPNotFound?0:CPNotFound;
}else{
_3b=_3a.indexOf(_37);
}
}
return CPMakeRange(_3b,_3b==CPNotFound?0:_37.length);
}
}),new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"),function(_3c,_3d){
with(_3c){
return _3c.replace(_3,"\\$1");
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"),function(_3e,_3f,_40,_41){
with(_3e){
return _3e.replace(new RegExp(objj_msgSend(_40,"stringByEscapingRegexControlCharacters"),"g"),_41);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"),function(_42,_43,_44,_45,_46,_47){
with(_42){
var _48=substring(0,_47.location),_49=substr(_47.location,_47.length),end=substring(_47.location+_47.length,_42.length),_44=objj_msgSend(_44,"stringByEscapingRegexControlCharacters"),_4a;
if(_46&CPCaseInsensitiveSearch){
_4a=new RegExp(_44,"gi");
}else{
_4a=new RegExp(_44,"g");
}
return _48+""+_49.replace(_4a,_45)+""+end;
}
}),new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"),function(_4b,_4c,_4d,_4e){
with(_4b){
return ""+substring(0,_4d.location)+_4e+substring(_4d.location+_4d.length,_4b.length);
}
}),new objj_method(sel_getUid("stringByTrimmingWhitespace"),function(_4f,_50){
with(_4f){
return _4f.replace(_4,"");
}
}),new objj_method(sel_getUid("compare:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(_51,"compare:options:",_53,nil);
}
}),new objj_method(sel_getUid("caseInsensitiveCompare:"),function(_54,_55,_56){
with(_54){
return objj_msgSend(_54,"compare:options:",_56,CPCaseInsensitiveSearch);
}
}),new objj_method(sel_getUid("compare:options:"),function(_57,_58,_59,_5a){
with(_57){
var lhs=_57,rhs=_59;
if(_5a&CPCaseInsensitiveSearch){
lhs=lhs.toLowerCase();
rhs=rhs.toLowerCase();
}
if(_5a&CPDiacriticInsensitiveSearch){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
if(lhs<rhs){
return CPOrderedAscending;
}else{
if(lhs>rhs){
return CPOrderedDescending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("compare:options:range:"),function(_5b,_5c,_5d,_5e,_5f){
with(_5b){
var lhs=objj_msgSend(_5b,"substringWithRange:",_5f),rhs=_5d;
return objj_msgSend(lhs,"compare:options:",rhs,_5e);
}
}),new objj_method(sel_getUid("hasPrefix:"),function(_60,_61,_62){
with(_60){
return _62&&_62!=""&&indexOf(_62)==0;
}
}),new objj_method(sel_getUid("hasSuffix:"),function(_63,_64,_65){
with(_63){
return _65&&_65!=""&&length>=_65.length&&lastIndexOf(_65)==(length-_65.length);
}
}),new objj_method(sel_getUid("isEqual:"),function(_66,_67,_68){
with(_66){
if(_66===_68){
return YES;
}
if(!_68||!objj_msgSend(_68,"isKindOfClass:",objj_msgSend(CPString,"class"))){
return NO;
}
return objj_msgSend(_66,"isEqualToString:",_68);
}
}),new objj_method(sel_getUid("isEqualToString:"),function(_69,_6a,_6b){
with(_69){
return _69==_6b;
}
}),new objj_method(sel_getUid("UID"),function(_6c,_6d){
with(_6c){
var UID=_1.valueForKey(_6c);
if(!UID){
UID=objj_generateObjectUID();
_1.setValueForKey(_6c,UID);
}
return UID+"";
}
}),new objj_method(sel_getUid("commonPrefixWithString:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(_6e,"commonPrefixWithString:options:",_70,0);
}
}),new objj_method(sel_getUid("commonPrefixWithString:options:"),function(_71,_72,_73,_74){
with(_71){
var len=0,lhs=_71,rhs=_73,min=MIN(objj_msgSend(lhs,"length"),objj_msgSend(rhs,"length"));
if(_74&CPCaseInsensitiveSearch){
lhs=objj_msgSend(lhs,"lowercaseString");
rhs=objj_msgSend(rhs,"lowercaseString");
}
for(;len<min;len++){
if(objj_msgSend(lhs,"characterAtIndex:",len)!==objj_msgSend(rhs,"characterAtIndex:",len)){
break;
}
}
return objj_msgSend(_71,"substringToIndex:",len);
}
}),new objj_method(sel_getUid("capitalizedString"),function(_75,_76){
with(_75){
var _77=_75.split(/\b/g),i=0,_78=_77.length;
for(;i<_78;i++){
if(i==0||(/\s$/).test(_77[i-1])){
_77[i]=_77[i].substring(0,1).toUpperCase()+_77[i].substring(1).toLowerCase();
}else{
_77[i]=_77[i].toLowerCase();
}
}
return _77.join("");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_79,_7a){
with(_79){
return toLowerCase();
}
}),new objj_method(sel_getUid("uppercaseString"),function(_7b,_7c){
with(_7b){
return toUpperCase();
}
}),new objj_method(sel_getUid("doubleValue"),function(_7d,_7e){
with(_7d){
return parseFloat(_7d,10);
}
}),new objj_method(sel_getUid("boolValue"),function(_7f,_80){
with(_7f){
var _81=new RegExp("^\\s*[\\+,\\-]*0*");
return RegExp("^[Y,y,t,T,1-9]").test(_7f.replace(_81,""));
}
}),new objj_method(sel_getUid("floatValue"),function(_82,_83){
with(_82){
return parseFloat(_82,10);
}
}),new objj_method(sel_getUid("intValue"),function(_84,_85){
with(_84){
return parseInt(_84,10);
}
}),new objj_method(sel_getUid("pathComponents"),function(_86,_87){
with(_86){
var _88=split("/");
if(_88[0]===""){
_88[0]="/";
}
if(_88[_88.length-1]===""){
_88.pop();
}
return _88;
}
}),new objj_method(sel_getUid("pathExtension"),function(_89,_8a){
with(_89){
if(lastIndexOf(".")===CPNotFound){
return "";
}
return substr(lastIndexOf(".")+1);
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_8b,_8c){
with(_8b){
var _8d=objj_msgSend(_8b,"pathComponents");
return _8d[_8d.length-1];
}
}),new objj_method(sel_getUid("stringByDeletingLastPathComponent"),function(_8e,_8f){
with(_8e){
var _90=_8e,_91=length-1;
while(_90.charAt(_91)==="/"){
_91--;
}
_90=_90.substr(0,_90.lastIndexOf("/",_91));
if(_90===""&&charAt(0)==="/"){
return "/";
}
return _90;
}
}),new objj_method(sel_getUid("stringByDeletingPathExtension"),function(_92,_93){
with(_92){
var _94=objj_msgSend(_92,"pathExtension");
if(_94===""){
return _92;
}
if(lastIndexOf(".")<1){
return _92;
}
return substr(0,objj_msgSend(_92,"length")-(_94.length+1));
}
}),new objj_method(sel_getUid("stringByStandardizingPath"),function(_95,_96){
with(_95){
return objj_standardize_path(_95);
}
}),new objj_method(sel_getUid("copy"),function(_97,_98){
with(_97){
return new String(_97);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("alloc"),function(_99,_9a){
with(_99){
return new String;
}
}),new objj_method(sel_getUid("string"),function(_9b,_9c){
with(_9b){
return objj_msgSend(objj_msgSend(_9b,"alloc"),"init");
}
}),new objj_method(sel_getUid("stringWithHash:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=parseInt(_9f,10).toString(16);
return "000000".substring(0,MAX(6-_a0.length,0))+_a0;
}
}),new objj_method(sel_getUid("stringWithString:"),function(_a1,_a2,_a3){
with(_a1){
if(!_a3){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"stringWithString: the string can't be 'nil'");
}
return objj_msgSend(objj_msgSend(_a1,"alloc"),"initWithString:",_a3);
}
}),new objj_method(sel_getUid("stringWithFormat:"),function(_a4,_a5,_a6){
with(_a4){
if(!_a6){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return ObjectiveJ.sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("objectFromJSON"),function(_a7,_a8){
with(_a7){
return JSON.parse(_a7);
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("JSONFromObject:"),function(_a9,_aa,_ab){
with(_a9){
return JSON.stringify(_ab);
}
})]);
var _5=objj_getClass("CPString");
if(!_5){
throw new SyntaxError("*** Could not find definition for class \"CPString\"");
}
var _6=_5.isa;
class_addMethods(_6,[new objj_method(sel_getUid("UUID"),function(_ac,_ad){
with(_ac){
var g="",i=0;
for(;i<32;i++){
g+=FLOOR(RAND()*15).toString(15);
}
return g;
}
})]);
var _ae=[[192,198],[224,230],[231,231],[232,235],[236,239],[242,246],[249,252]];
var _af=[65,97,99,101,105,111,117];
String.prototype.stripDiacritics=function(){
var _b0="";
for(var _b1=0;_b1<this.length;_b1++){
var _b2=this.charCodeAt(_b1);
for(var i=0;i<_ae.length;i++){
var _b3=_ae[i];
if(_b2>=_b3[0]&&_b2<=_b3[_b3.length-1]){
_b2=_af[i];
break;
}
}
_b0+=String.fromCharCode(_b2);
}
return _b0;
};
String.prototype.isa=CPString;
p;9;CPTimer.jt;5527;@STATIC;1.0;i;8;CPDate.ji;14;CPInvocation.ji;10;CPObject.ji;11;CPRunLoop.jt;5446;
objj_executeFile("CPDate.j",YES);
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRunLoop.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPTimer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_timeInterval"),new objj_ivar("_invocation"),new objj_ivar("_callback"),new objj_ivar("_repeats"),new objj_ivar("_isValid"),new objj_ivar("_fireDate"),new objj_ivar("_userInfo")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFireDate:interval:invocation:repeats:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTimer").super_class},"init");
if(_3){
_timeInterval=_6;
_invocation=_7;
_repeats=_8;
_isValid=YES;
_fireDate=_5;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFireDate:interval:target:selector:userInfo:repeats:"),function(_9,_a,_b,_c,_d,_e,_f,_10){
with(_9){
var _11=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",1);
objj_msgSend(_11,"setTarget:",_d);
objj_msgSend(_11,"setSelector:",_e);
objj_msgSend(_11,"setArgument:atIndex:",_9,2);
_9=objj_msgSend(_9,"initWithFireDate:interval:invocation:repeats:",_b,_c,_11,_10);
if(_9){
_userInfo=_f;
}
return _9;
}
}),new objj_method(sel_getUid("initWithFireDate:interval:callback:repeats:"),function(_12,_13,_14,_15,_16,_17){
with(_12){
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPTimer").super_class},"init");
if(_12){
_timeInterval=_15;
_callback=_16;
_repeats=_17;
_isValid=YES;
_fireDate=_14;
}
return _12;
}
}),new objj_method(sel_getUid("timeInterval"),function(_18,_19){
with(_18){
return _timeInterval;
}
}),new objj_method(sel_getUid("fireDate"),function(_1a,_1b){
with(_1a){
return _fireDate;
}
}),new objj_method(sel_getUid("setFireDate:"),function(_1c,_1d,_1e){
with(_1c){
_fireDate=_1e;
}
}),new objj_method(sel_getUid("fire"),function(_1f,_20){
with(_1f){
if(!_isValid){
return;
}
if(_callback){
_callback();
}else{
objj_msgSend(_invocation,"invoke");
}
if(!_isValid){
return;
}
if(_repeats){
_fireDate=objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_timeInterval);
}else{
objj_msgSend(_1f,"invalidate");
}
}
}),new objj_method(sel_getUid("isValid"),function(_21,_22){
with(_21){
return _isValid;
}
}),new objj_method(sel_getUid("invalidate"),function(_23,_24){
with(_23){
_isValid=NO;
_userInfo=nil;
_invocation=nil;
_callback=nil;
}
}),new objj_method(sel_getUid("userInfo"),function(_25,_26){
with(_25){
return _userInfo;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("scheduledTimerWithTimeInterval:invocation:repeats:"),function(_27,_28,_29,_2a,_2b){
with(_27){
var _2c=objj_msgSend(objj_msgSend(_27,"alloc"),"initWithFireDate:interval:invocation:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_29),_29,_2a,_2b);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_2c,CPDefaultRunLoopMode);
return _2c;
}
}),new objj_method(sel_getUid("scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:"),function(_2d,_2e,_2f,_30,_31,_32,_33){
with(_2d){
var _34=objj_msgSend(objj_msgSend(_2d,"alloc"),"initWithFireDate:interval:target:selector:userInfo:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_2f),_2f,_30,_31,_32,_33);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_34,CPDefaultRunLoopMode);
return _34;
}
}),new objj_method(sel_getUid("scheduledTimerWithTimeInterval:callback:repeats:"),function(_35,_36,_37,_38,_39){
with(_35){
var _3a=objj_msgSend(objj_msgSend(_35,"alloc"),"initWithFireDate:interval:callback:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_37),_37,_38,_39);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"addTimer:forMode:",_3a,CPDefaultRunLoopMode);
return _3a;
}
}),new objj_method(sel_getUid("timerWithTimeInterval:invocation:repeats:"),function(_3b,_3c,_3d,_3e,_3f){
with(_3b){
return objj_msgSend(objj_msgSend(_3b,"alloc"),"initWithFireDate:interval:invocation:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_3d),_3d,_3e,_3f);
}
}),new objj_method(sel_getUid("timerWithTimeInterval:target:selector:userInfo:repeats:"),function(_40,_41,_42,_43,_44,_45,_46){
with(_40){
return objj_msgSend(objj_msgSend(_40,"alloc"),"initWithFireDate:interval:target:selector:userInfo:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_42),_42,_43,_44,_45,_46);
}
}),new objj_method(sel_getUid("timerWithTimeInterval:callback:repeats:"),function(_47,_48,_49,_4a,_4b){
with(_47){
return objj_msgSend(objj_msgSend(_47,"alloc"),"initWithFireDate:interval:callback:repeats:",objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_49),_49,_4a,_4b);
}
})]);
var _4c=1000,_4d={};
var _4e=function(_4f,_50,_51,_52){
var _53=_4c++,_54=nil;
if(typeof _4f==="string"){
_54=function(){
new Function(_4f)();
if(!_51){
_4d[_53]=nil;
}
};
}else{
if(!_52){
_52=[];
}
_54=function(){
_4f.apply(window,_52);
if(!_51){
_4d[_53]=nil;
}
};
}
_4d[_53]=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",_50/1000,_54,_51);
return _53;
};
window.setTimeout=function(_55,_56){
return _4e(_55,_56,NO,Array.prototype.slice.apply(arguments,[2]));
};
window.clearTimeout=function(_57){
var _58=_4d[_57];
if(_58){
objj_msgSend(_58,"invalidate");
}
_4d[_57]=nil;
};
window.setInterval=function(_59,_5a,_5b){
return _4e(_59,_5a,YES,Array.prototype.slice.apply(arguments,[2]));
};
window.clearInterval=function(_5c){
window.clearTimeout(_5c);
};
p;15;CPUndoManager.jt;16162;@STATIC;1.0;i;14;CPInvocation.ji;10;CPObject.ji;9;CPProxy.jt;16095;
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPProxy.j",YES);
var _1=0,_2=1,_3=2;
CPUndoManagerCheckpointNotification="CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification="CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification="CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification="CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification="CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification="CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification="CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering=350000;
var _4=[],_5=5;
var _6=objj_allocateClassPair(CPObject,"_CPUndoGrouping"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_parent"),new objj_ivar("_invocations")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithParent:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("_CPUndoGrouping").super_class},"init");
if(_8){
_parent=_a;
_invocations=[];
}
return _8;
}
}),new objj_method(sel_getUid("parent"),function(_b,_c){
with(_b){
return _parent;
}
}),new objj_method(sel_getUid("addInvocation:"),function(_d,_e,_f){
with(_d){
_invocations.push(_f);
}
}),new objj_method(sel_getUid("addInvocationsFromArray:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_invocations,"addObjectsFromArray:",_12);
}
}),new objj_method(sel_getUid("removeInvocationsWithTarget:"),function(_13,_14,_15){
with(_13){
var _16=_invocations.length;
while(_16--){
if(objj_msgSend(_invocations[_16],"target")==_15){
_invocations.splice(_16,1);
}
}
}
}),new objj_method(sel_getUid("invocations"),function(_17,_18){
with(_17){
return _invocations;
}
}),new objj_method(sel_getUid("invoke"),function(_19,_1a){
with(_19){
var _1b=_invocations.length;
while(_1b--){
objj_msgSend(_invocations[_1b],"invoke");
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("_poolUndoGrouping:"),function(_1c,_1d,_1e){
with(_1c){
if(!_1e||_4.length>=_5){
return;
}
_4.push(_1e);
}
}),new objj_method(sel_getUid("undoGroupingWithParent:"),function(_1f,_20,_21){
with(_1f){
if(_4.length){
var _22=_4.pop();
_22._parent=_21;
if(_22._invocations.length){
_22._invocations=[];
}
return _22;
}
return objj_msgSend(objj_msgSend(_1f,"alloc"),"initWithParent:",_21);
}
})]);
var _23="_CPUndoGroupingParentKey",_24="_CPUndoGroupingInvocationsKey";
var _6=objj_getClass("_CPUndoGrouping");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"_CPUndoGrouping\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("_CPUndoGrouping").super_class},"init");
if(_25){
_parent=objj_msgSend(_27,"decodeObjectForKey:",_23);
_invocations=objj_msgSend(_27,"decodeObjectForKey:",_24);
}
return _25;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_2a,"encodeObject:forKey:",_parent,_23);
objj_msgSend(_2a,"encodeObject:forKey:",_invocations,_24);
}
})]);
var _6=objj_allocateClassPair(CPObject,"CPUndoManager"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_redoStack"),new objj_ivar("_undoStack"),new objj_ivar("_groupsByEvent"),new objj_ivar("_disableCount"),new objj_ivar("_levelsOfUndo"),new objj_ivar("_currentGrouping"),new objj_ivar("_state"),new objj_ivar("_actionName"),new objj_ivar("_preparedTarget"),new objj_ivar("_undoManagerProxy"),new objj_ivar("_runLoopModes"),new objj_ivar("_registeredWithRunLoop")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("init"),function(_2b,_2c){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPUndoManager").super_class},"init");
if(_2b){
_redoStack=[];
_undoStack=[];
_state=_1;
objj_msgSend(_2b,"setRunLoopModes:",[CPDefaultRunLoopMode]);
objj_msgSend(_2b,"setGroupsByEvent:",YES);
_undoManagerProxy=objj_msgSend(_CPUndoManagerProxy,"alloc");
_undoManagerProxy._undoManager=_2b;
}
return _2b;
}
}),new objj_method(sel_getUid("_addUndoInvocation:"),function(_2d,_2e,_2f){
with(_2d){
if(!_currentGrouping){
if(objj_msgSend(_2d,"groupsByEvent")){
objj_msgSend(_2d,"_beginUndoGroupingForEvent");
}else{
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"No undo group is currently open");
}
}
objj_msgSend(_currentGrouping,"addInvocation:",_2f);
if(_state===_1){
objj_msgSend(_redoStack,"removeAllObjects");
}
}
}),new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"),function(_30,_31,_32,_33,_34){
with(_30){
if(_disableCount>0){
return;
}
var _35=objj_msgSend(CPInvocation,"invocationWithMethodSignature:",nil);
objj_msgSend(_35,"setTarget:",_32);
objj_msgSend(_35,"setSelector:",_33);
objj_msgSend(_35,"setArgument:atIndex:",_34,2);
objj_msgSend(_30,"_addUndoInvocation:",_35);
}
}),new objj_method(sel_getUid("prepareWithInvocationTarget:"),function(_36,_37,_38){
with(_36){
_preparedTarget=_38;
return _undoManagerProxy;
}
}),new objj_method(sel_getUid("_methodSignatureOfPreparedTargetForSelector:"),function(_39,_3a,_3b){
with(_39){
if(objj_msgSend(_preparedTarget,"respondsToSelector:",_3b)){
return 1;
}
return nil;
}
}),new objj_method(sel_getUid("_forwardInvocationToPreparedTarget:"),function(_3c,_3d,_3e){
with(_3c){
if(_disableCount>0){
return;
}
objj_msgSend(_3e,"setTarget:",_preparedTarget);
objj_msgSend(_3c,"_addUndoInvocation:",_3e);
_preparedTarget=nil;
}
}),new objj_method(sel_getUid("canRedo"),function(_3f,_40){
with(_3f){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUndoManagerCheckpointNotification,_3f);
return objj_msgSend(_redoStack,"count")>0;
}
}),new objj_method(sel_getUid("canUndo"),function(_41,_42){
with(_41){
if(_undoStack.length>0){
return YES;
}
return objj_msgSend(objj_msgSend(_currentGrouping,"invocations"),"count")>0;
}
}),new objj_method(sel_getUid("undo"),function(_43,_44){
with(_43){
if(objj_msgSend(_43,"groupingLevel")===1){
objj_msgSend(_43,"endUndoGrouping");
}
objj_msgSend(_43,"undoNestedGroup");
}
}),new objj_method(sel_getUid("undoNestedGroup"),function(_45,_46){
with(_45){
if(objj_msgSend(_undoStack,"count")<=0){
return;
}
var _47=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_47,"postNotificationName:object:",CPUndoManagerCheckpointNotification,_45);
objj_msgSend(_47,"postNotificationName:object:",CPUndoManagerWillUndoChangeNotification,_45);
var _48=_undoStack.pop();
_state=_2;
objj_msgSend(_45,"_beginUndoGrouping");
objj_msgSend(_48,"invoke");
objj_msgSend(_45,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_48);
_state=_1;
objj_msgSend(_47,"postNotificationName:object:",CPUndoManagerDidUndoChangeNotification,_45);
}
}),new objj_method(sel_getUid("redo"),function(_49,_4a){
with(_49){
if(objj_msgSend(_redoStack,"count")<=0){
return;
}
var _4b=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_4b,"postNotificationName:object:",CPUndoManagerCheckpointNotification,_49);
objj_msgSend(_4b,"postNotificationName:object:",CPUndoManagerWillRedoChangeNotification,_49);
var _4c=_currentGrouping,_4d=_redoStack.pop();
_currentGrouping=nil;
_state=_3;
objj_msgSend(_49,"_beginUndoGrouping");
objj_msgSend(_4d,"invoke");
objj_msgSend(_49,"endUndoGrouping");
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_4d);
_currentGrouping=_4c;
_state=_1;
objj_msgSend(_4b,"postNotificationName:object:",CPUndoManagerDidRedoChangeNotification,_49);
}
}),new objj_method(sel_getUid("beginUndoGrouping"),function(_4e,_4f){
with(_4e){
if(!_currentGrouping&&objj_msgSend(_4e,"groupsByEvent")){
objj_msgSend(_4e,"_beginUndoGroupingForEvent");
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUndoManagerCheckpointNotification,_4e);
objj_msgSend(_4e,"_beginUndoGrouping");
}
}),new objj_method(sel_getUid("_beginUndoGroupingForEvent"),function(_50,_51){
with(_50){
objj_msgSend(_50,"_beginUndoGrouping");
objj_msgSend(_50,"_registerWithRunLoop");
}
}),new objj_method(sel_getUid("_beginUndoGrouping"),function(_52,_53){
with(_52){
_currentGrouping=objj_msgSend(_CPUndoGrouping,"undoGroupingWithParent:",_currentGrouping);
}
}),new objj_method(sel_getUid("endUndoGrouping"),function(_54,_55){
with(_54){
if(!_currentGrouping){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"endUndoGrouping. No undo group is currently open.");
}
var _56=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_56,"postNotificationName:object:",CPUndoManagerCheckpointNotification,_54);
var _57=objj_msgSend(_currentGrouping,"parent");
if(!_57&&objj_msgSend(_currentGrouping,"invocations").length>0){
objj_msgSend(_56,"postNotificationName:object:",CPUndoManagerWillCloseUndoGroupNotification,_54);
var _58=_state===_2?_redoStack:_undoStack;
_58.push(_currentGrouping);
if(_levelsOfUndo>0&&_58.length>_levelsOfUndo){
_58.splice(0,1);
}
}else{
objj_msgSend(_57,"addInvocationsFromArray:",objj_msgSend(_currentGrouping,"invocations"));
objj_msgSend(_CPUndoGrouping,"_poolUndoGrouping:",_currentGrouping);
}
_currentGrouping=_57;
}
}),new objj_method(sel_getUid("enableUndoRegistration"),function(_59,_5a){
with(_59){
if(_disableCount<=0){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"enableUndoRegistration. There are no disable messages in effect right now.");
}
_disableCount--;
}
}),new objj_method(sel_getUid("groupsByEvent"),function(_5b,_5c){
with(_5b){
return _groupsByEvent;
}
}),new objj_method(sel_getUid("setGroupsByEvent:"),function(_5d,_5e,_5f){
with(_5d){
_5f=!!_5f;
if(_groupsByEvent===_5f){
return;
}
_groupsByEvent=_5f;
if(!objj_msgSend(_5d,"groupsByEvent")){
objj_msgSend(_5d,"_unregisterWithRunLoop");
}
}
}),new objj_method(sel_getUid("groupingLevel"),function(_60,_61){
with(_60){
var _62=_currentGrouping,_63=_currentGrouping!=nil;
while(_62=objj_msgSend(_62,"parent")){
++_63;
}
return _63;
}
}),new objj_method(sel_getUid("disableUndoRegistration"),function(_64,_65){
with(_64){
++_disableCount;
}
}),new objj_method(sel_getUid("isUndoRegistrationEnabled"),function(_66,_67){
with(_66){
return _disableCount==0;
}
}),new objj_method(sel_getUid("isUndoing"),function(_68,_69){
with(_68){
return _state===_2;
}
}),new objj_method(sel_getUid("isRedoing"),function(_6a,_6b){
with(_6a){
return _state===_3;
}
}),new objj_method(sel_getUid("removeAllActions"),function(_6c,_6d){
with(_6c){
_redoStack=[];
_undoStack=[];
_disableCount=0;
}
}),new objj_method(sel_getUid("removeAllActionsWithTarget:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(_currentGrouping,"removeInvocationsWithTarget:",_70);
var _71=_redoStack.length;
while(_71--){
var _72=_redoStack[_71];
objj_msgSend(_72,"removeInvocationsWithTarget:",_70);
if(!objj_msgSend(_72,"invocations").length){
_redoStack.splice(_71,1);
}
}
_71=_undoStack.length;
while(_71--){
var _72=_undoStack[_71];
objj_msgSend(_72,"removeInvocationsWithTarget:",_70);
if(!objj_msgSend(_72,"invocations").length){
_undoStack.splice(_71,1);
}
}
}
}),new objj_method(sel_getUid("setActionName:"),function(_73,_74,_75){
with(_73){
_actionName=_75;
}
}),new objj_method(sel_getUid("redoActionName"),function(_76,_77){
with(_76){
return objj_msgSend(_76,"canRedo")?_actionName:nil;
}
}),new objj_method(sel_getUid("undoActionName"),function(_78,_79){
with(_78){
return objj_msgSend(_78,"canUndo")?_actionName:nil;
}
}),new objj_method(sel_getUid("runLoopModes"),function(_7a,_7b){
with(_7a){
return _runLoopModes;
}
}),new objj_method(sel_getUid("setRunLoopModes:"),function(_7c,_7d,_7e){
with(_7c){
_runLoopModes=objj_msgSend(_7e,"copy");
if(_registeredWithRunLoop){
objj_msgSend(_7c,"_unregisterWithRunLoop");
objj_msgSend(_7c,"_registerWithRunLoop");
}
}
}),new objj_method(sel_getUid("_runLoopEndUndoGrouping"),function(_7f,_80){
with(_7f){
objj_msgSend(_7f,"endUndoGrouping");
_registeredWithRunLoop=NO;
}
}),new objj_method(sel_getUid("_registerWithRunLoop"),function(_81,_82){
with(_81){
if(_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=YES;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_runLoopEndUndoGrouping"),_81,nil,CPUndoCloseGroupingRunLoopOrdering,_runLoopModes);
}
}),new objj_method(sel_getUid("_unregisterWithRunLoop"),function(_83,_84){
with(_83){
if(!_registeredWithRunLoop){
return;
}
_registeredWithRunLoop=NO;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"cancelPerformSelector:target:argument:",sel_getUid("_runLoopEndUndoGrouping"),_83,nil);
}
}),new objj_method(sel_getUid("observeChangesForKeyPath:ofObject:"),function(_85,_86,_87,_88){
with(_85){
objj_msgSend(_88,"addObserver:forKeyPath:options:context:",_85,_87,CPKeyValueObservingOptionOld|CPKeyValueObservingOptionNew,NULL);
}
}),new objj_method(sel_getUid("stopObservingChangesForKeyPath:ofObject:"),function(_89,_8a,_8b,_8c){
with(_89){
objj_msgSend(_8c,"removeObserver:forKeyPath:",_89,_8b);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_8d,_8e,_8f,_90,_91,_92){
with(_8d){
var _93=objj_msgSend(_91,"valueForKey:",CPKeyValueChangeOldKey),_94=objj_msgSend(_91,"valueForKey:",CPKeyValueChangeNewKey);
if(_93===_94||(_93!==nil&&_93.isa&&(_94===nil||_94.isa)&&objj_msgSend(_93,"isEqual:",_94))){
return;
}
objj_msgSend(objj_msgSend(_8d,"prepareWithInvocationTarget:",_90),"applyChange:toKeyPath:",objj_msgSend(_91,"inverseChangeDictionary"),_8f);
}
})]);
var _95="CPUndoManagerRedoStackKey",_96="CPUndoManagerUndoStackKey";
CPUndoManagerLevelsOfUndoKey="CPUndoManagerLevelsOfUndoKey";
CPUndoManagerActionNameKey="CPUndoManagerActionNameKey";
CPUndoManagerCurrentGroupingKey="CPUndoManagerCurrentGroupingKey";
CPUndoManagerRunLoopModesKey="CPUndoManagerRunLoopModesKey";
CPUndoManagerGroupsByEventKey="CPUndoManagerGroupsByEventKey";
var _6=objj_getClass("CPUndoManager");
if(!_6){
throw new SyntaxError("*** Could not find definition for class \"CPUndoManager\"");
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_97,_98,_99){
with(_97){
_97=objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPUndoManager").super_class},"init");
if(_97){
_redoStack=objj_msgSend(_99,"decodeObjectForKey:",_95);
_undoStack=objj_msgSend(_99,"decodeObjectForKey:",_96);
_levelsOfUndo=objj_msgSend(_99,"decodeObjectForKey:",CPUndoManagerLevelsOfUndoKey);
_actionName=objj_msgSend(_99,"decodeObjectForKey:",CPUndoManagerActionNameKey);
_currentGrouping=objj_msgSend(_99,"decodeObjectForKey:",CPUndoManagerCurrentGroupingKey);
_state=_1;
objj_msgSend(_97,"setRunLoopModes:",objj_msgSend(_99,"decodeObjectForKey:",CPUndoManagerRunLoopModesKey));
objj_msgSend(_97,"setGroupsByEvent:",objj_msgSend(_99,"decodeBoolForKey:",CPUndoManagerGroupsByEventKey));
}
return _97;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_9c,"encodeObject:forKey:",_redoStack,_95);
objj_msgSend(_9c,"encodeObject:forKey:",_undoStack,_96);
objj_msgSend(_9c,"encodeInt:forKey:",_levelsOfUndo,CPUndoManagerLevelsOfUndoKey);
objj_msgSend(_9c,"encodeObject:forKey:",_actionName,CPUndoManagerActionNameKey);
objj_msgSend(_9c,"encodeObject:forKey:",_currentGrouping,CPUndoManagerCurrentGroupingKey);
objj_msgSend(_9c,"encodeObject:forKey:",_runLoopModes,CPUndoManagerRunLoopModesKey);
objj_msgSend(_9c,"encodeBool:forKey:",_groupsByEvent,CPUndoManagerGroupsByEventKey);
}
})]);
var _6=objj_allocateClassPair(CPProxy,"_CPUndoManagerProxy"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_undoManager")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("methodSignatureForSelector:"),function(_9d,_9e,_9f){
with(_9d){
return objj_msgSend(_undoManager,"_methodSignatureOfPreparedTargetForSelector:",_9f);
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(_undoManager,"_forwardInvocationToPreparedTarget:",_a2);
}
})]);
p;7;CPURL.jt;5953;@STATIC;1.0;i;10;CPObject.jt;5919;
objj_executeFile("CPObject.j",YES);
CPURLNameKey="CPURLNameKey";
CPURLLocalizedNameKey="CPURLLocalizedNameKey";
CPURLIsRegularFileKey="CPURLIsRegularFileKey";
CPURLIsDirectoryKey="CPURLIsDirectoryKey";
CPURLIsSymbolicLinkKey="CPURLIsSymbolicLinkKey";
CPURLIsVolumeKey="CPURLIsVolumeKey";
CPURLIsPackageKey="CPURLIsPackageKey";
CPURLIsSystemImmutableKey="CPURLIsSystemImmutableKey";
CPURLIsUserImmutableKey="CPURLIsUserImmutableKey";
CPURLIsHiddenKey="CPURLIsHiddenKey";
CPURLHasHiddenExtensionKey="CPURLHasHiddenExtensionKey";
CPURLCreationDateKey="CPURLCreationDateKey";
CPURLContentAccessDateKey="CPURLContentAccessDateKey";
CPURLContentModificationDateKey="CPURLContentModificationDateKey";
CPURLAttributeModificationDateKey="CPURLAttributeModificationDateKey";
CPURLLinkCountKey="CPURLLinkCountKey";
CPURLParentDirectoryURLKey="CPURLParentDirectoryURLKey";
CPURLVolumeURLKey="CPURLTypeIdentifierKey";
CPURLTypeIdentifierKey="CPURLTypeIdentifierKey";
CPURLLocalizedTypeDescriptionKey="CPURLLocalizedTypeDescriptionKey";
CPURLLabelNumberKey="CPURLLabelNumberKey";
CPURLLabelColorKey="CPURLLabelColorKey";
CPURLLocalizedLabelKey="CPURLLocalizedLabelKey";
CPURLEffectiveIconKey="CPURLEffectiveIconKey";
CPURLCustomIconKey="CPURLCustomIconKey";
var _1=objj_allocateClassPair(CPObject,"CPURL"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return nil;
}
}),new objj_method(sel_getUid("initWithScheme:host:path:"),function(_5,_6,_7,_8,_9){
with(_5){
var _a=(_7?_7+":":"")+(_8?_8+"//":"")+(_9||"");
return objj_msgSend(_5,"initWithString:",_a);
}
}),new objj_method(sel_getUid("initWithString:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_b,"initWithString:relativeToURL:",_d,nil);
}
}),new objj_method(sel_getUid("initWithString:relativeToURL:"),function(_e,_f,_10,_11){
with(_e){
return new CFURL(_10,_11);
}
}),new objj_method(sel_getUid("absoluteURL"),function(_12,_13){
with(_12){
return _12.absoluteURL();
}
}),new objj_method(sel_getUid("baseURL"),function(_14,_15){
with(_14){
return _14.baseURL();
}
}),new objj_method(sel_getUid("absoluteString"),function(_16,_17){
with(_16){
return _16.absoluteString();
}
}),new objj_method(sel_getUid("relativeString"),function(_18,_19){
with(_18){
return _18.string();
}
}),new objj_method(sel_getUid("path"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"absoluteURL").path();
}
}),new objj_method(sel_getUid("pathComponents"),function(_1c,_1d){
with(_1c){
var _1e=_1c.pathComponents();
return objj_msgSend(_1e,"copy");
}
}),new objj_method(sel_getUid("relativePath"),function(_1f,_20){
with(_1f){
return _1f.path();
}
}),new objj_method(sel_getUid("scheme"),function(_21,_22){
with(_21){
return _21.scheme();
}
}),new objj_method(sel_getUid("user"),function(_23,_24){
with(_23){
return objj_msgSend(_23,"absoluteURL").user();
}
}),new objj_method(sel_getUid("password"),function(_25,_26){
with(_25){
return objj_msgSend(_25,"absoluteURL").password();
}
}),new objj_method(sel_getUid("host"),function(_27,_28){
with(_27){
return objj_msgSend(_27,"absoluteURL").domain();
}
}),new objj_method(sel_getUid("port"),function(_29,_2a){
with(_29){
var _2b=objj_msgSend(_29,"absoluteURL").portNumber();
if(_2b===-1){
return nil;
}
return _2b;
}
}),new objj_method(sel_getUid("parameterString"),function(_2c,_2d){
with(_2c){
return _2c.queryString();
}
}),new objj_method(sel_getUid("fragment"),function(_2e,_2f){
with(_2e){
return _2e.fragment();
}
}),new objj_method(sel_getUid("isEqual:"),function(_30,_31,_32){
with(_30){
return objj_msgSend(_30,"relativeString")===objj_msgSend(_32,"relativeString")&&(objj_msgSend(_30,"baseURL")===objj_msgSend(_32,"baseURL")||objj_msgSend(objj_msgSend(_30,"baseURL"),"isEqual:",objj_msgSend(_32,"baseURL")));
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_33,_34){
with(_33){
return objj_msgSend(_33,"absoluteURL").lastPathComponent();
}
}),new objj_method(sel_getUid("pathExtension"),function(_35,_36){
with(_35){
return _35.pathExtension();
}
}),new objj_method(sel_getUid("standardizedURL"),function(_37,_38){
with(_37){
return _37.standardizedURL();
}
}),new objj_method(sel_getUid("isFileURL"),function(_39,_3a){
with(_39){
return objj_msgSend(_39,"scheme")==="file";
}
}),new objj_method(sel_getUid("description"),function(_3b,_3c){
with(_3b){
return objj_msgSend(_3b,"absoluteString");
}
}),new objj_method(sel_getUid("resourceValueForKey:"),function(_3d,_3e,_3f){
with(_3d){
return _3d.resourcePropertyForKey(_3f);
}
}),new objj_method(sel_getUid("setResourceValue:forKey:"),function(_40,_41,_42,_43){
with(_40){
return _40.setResourcePropertyForKey(_43,_42);
}
}),new objj_method(sel_getUid("staticResourceData"),function(_44,_45){
with(_44){
return _44.staticResourceData();
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_46,_47){
with(_46){
return new CFURL();
}
}),new objj_method(sel_getUid("URLWithString:"),function(_48,_49,_4a){
with(_48){
return objj_msgSend(objj_msgSend(_48,"alloc"),"initWithString:",_4a);
}
}),new objj_method(sel_getUid("URLWithString:relativeToURL:"),function(_4b,_4c,_4d,_4e){
with(_4b){
return objj_msgSend(objj_msgSend(_4b,"alloc"),"initWithString:relativeToURL:",_4d,_4e);
}
})]);
var _4f="CPURLURLStringKey",_50="CPURLBaseURLKey";
var _1=objj_getClass("CPURL");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPURL\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(_51,"initWithString:relativeToURL:",objj_msgSend(_53,"decodeObjectForKey:",_4f),objj_msgSend(_53,"decodeObjectForKey:",_50));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_56,"encodeObject:forKey:",_baseURL,_50);
objj_msgSend(_56,"encodeObject:forKey:",_string,_4f);
}
})]);
CFURL.prototype.isa=objj_msgSend(CPURL,"class");
p;17;CPURLConnection.jt;5414;@STATIC;1.0;i;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jt;5325;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPRunLoop.j",YES);
objj_executeFile("CPURLRequest.j",YES);
objj_executeFile("CPURLResponse.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPURLConnection"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_isCanceled"),new objj_ivar("_isLocalFileConnection"),new objj_ivar("_HTTPRequest")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"),function(_4,_5,_6,_7,_8){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPURLConnection").super_class},"init");
if(_4){
_request=_6;
_delegate=_7;
_isCanceled=NO;
var _9=objj_msgSend(_request,"URL"),_a=objj_msgSend(_9,"scheme");
_isLocalFileConnection=_a==="file"||((_a==="http"||_a==="https:")&&window.location&&(window.location.protocol==="file:"||window.location.protocol==="app:"));
_HTTPRequest=new CFHTTPRequest();
if(_8){
objj_msgSend(_4,"start");
}
}
return _4;
}
}),new objj_method(sel_getUid("initWithRequest:delegate:"),function(_b,_c,_d,_e){
with(_b){
return objj_msgSend(_b,"initWithRequest:delegate:startImmediately:",_d,_e,YES);
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("start"),function(_11,_12){
with(_11){
_isCanceled=NO;
try{
_HTTPRequest.open(objj_msgSend(_request,"HTTPMethod"),objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString"),YES);
_HTTPRequest.onreadystatechange=function(){
objj_msgSend(_11,"_readyStateDidChange");
};
var _13=objj_msgSend(_request,"allHTTPHeaderFields"),key=nil,_14=objj_msgSend(_13,"keyEnumerator");
while(key=objj_msgSend(_14,"nextObject")){
_HTTPRequest.setRequestHeader(key,objj_msgSend(_13,"objectForKey:",key));
}
_HTTPRequest.send(objj_msgSend(_request,"HTTPBody"));
}
catch(anException){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didFailWithError:"))){
objj_msgSend(_delegate,"connection:didFailWithError:",_11,anException);
}
}
}
}),new objj_method(sel_getUid("cancel"),function(_15,_16){
with(_15){
_isCanceled=YES;
try{
_HTTPRequest.abort();
}
catch(anException){
}
}
}),new objj_method(sel_getUid("isLocalFileConnection"),function(_17,_18){
with(_17){
return _isLocalFileConnection;
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_19,_1a){
with(_19){
if(_HTTPRequest.readyState()===CFHTTPRequest.CompleteState){
var _1b=_HTTPRequest.status(),URL=objj_msgSend(_request,"URL");
if(_1b===401&&objj_msgSend(_1,"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(_1,"connectionDidReceiveAuthenticationChallenge:",_19);
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveResponse:"))){
if(_isLocalFileConnection){
objj_msgSend(_delegate,"connection:didReceiveResponse:",_19,objj_msgSend(objj_msgSend(CPURLResponse,"alloc"),"initWithURL:",URL));
}else{
var _1c=objj_msgSend(objj_msgSend(CPHTTPURLResponse,"alloc"),"initWithURL:",URL);
objj_msgSend(_1c,"_setStatusCode:",_1b);
objj_msgSend(_delegate,"connection:didReceiveResponse:",_19,_1c);
}
}
if(!_isCanceled){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveData:"))){
objj_msgSend(_delegate,"connection:didReceiveData:",_19,_HTTPRequest.responseText());
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connectionDidFinishLoading:"))){
objj_msgSend(_delegate,"connectionDidFinishLoading:",_19);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_HTTPRequest"),function(_1d,_1e){
with(_1d){
return _HTTPRequest;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("setClassDelegate:"),function(_1f,_20,_21){
with(_1f){
_1=_21;
}
}),new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:"),function(_22,_23,_24,_25){
with(_22){
try{
var _26=new CFHTTPRequest();
_26.open(objj_msgSend(_24,"HTTPMethod"),objj_msgSend(objj_msgSend(_24,"URL"),"absoluteString"),NO);
var _27=objj_msgSend(_24,"allHTTPHeaderFields"),key=nil,_28=objj_msgSend(_27,"keyEnumerator");
while(key=objj_msgSend(_28,"nextObject")){
_26.setRequestHeader(key,objj_msgSend(_27,"objectForKey:",key));
}
_26.send(objj_msgSend(_24,"HTTPBody"));
return objj_msgSend(CPData,"dataWithRawString:",_26.responseText());
}
catch(anException){
}
return nil;
}
}),new objj_method(sel_getUid("connectionWithRequest:delegate:"),function(_29,_2a,_2b,_2c){
with(_29){
return objj_msgSend(objj_msgSend(_29,"alloc"),"initWithRequest:delegate:",_2b,_2c);
}
})]);
var _2=objj_getClass("CPURLConnection");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPURLConnection\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_XMLHTTPRequest"),function(_2d,_2e){
with(_2d){
_CPReportLenientDeprecation(_2d,_2e,sel_getUid("_HTTPRequest"));
return objj_msgSend(_2d,"_HTTPRequest");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"),function(_2f,_30,_31,_32,_33){
with(_2f){
_CPReportLenientDeprecation(_2f,_30,sel_getUid("sendSynchronousRequest:returningResponse:"));
return objj_msgSend(_2f,"sendSynchronousRequest:returningResponse:",_31,_32);
}
})]);
p;14;CPURLRequest.jt;2069;@STATIC;1.0;i;10;CPObject.jt;2035;
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPURLRequest"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL"),new objj_ivar("_HTTPBody"),new objj_ivar("_HTTPMethod"),new objj_ivar("_HTTPHeaderFields")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithURL:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPURLRequest").super_class},"init");
if(_3){
objj_msgSend(_3,"setURL:",_5);
_HTTPBody="";
_HTTPMethod="GET";
_HTTPHeaderFields=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","Thu, 01 Jan 1970 00:00:00 GMT","If-Modified-Since");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","no-cache","Cache-Control");
objj_msgSend(_3,"setValue:forHTTPHeaderField:","XMLHttpRequest","X-Requested-With");
}
return _3;
}
}),new objj_method(sel_getUid("URL"),function(_6,_7){
with(_6){
return _URL;
}
}),new objj_method(sel_getUid("setURL:"),function(_8,_9,_a){
with(_8){
_URL=new CFURL(_a);
}
}),new objj_method(sel_getUid("setHTTPBody:"),function(_b,_c,_d){
with(_b){
_HTTPBody=_d;
}
}),new objj_method(sel_getUid("HTTPBody"),function(_e,_f){
with(_e){
return _HTTPBody;
}
}),new objj_method(sel_getUid("setHTTPMethod:"),function(_10,_11,_12){
with(_10){
_HTTPMethod=_12;
}
}),new objj_method(sel_getUid("HTTPMethod"),function(_13,_14){
with(_13){
return _HTTPMethod;
}
}),new objj_method(sel_getUid("allHTTPHeaderFields"),function(_15,_16){
with(_15){
return _HTTPHeaderFields;
}
}),new objj_method(sel_getUid("valueForHTTPHeaderField:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(_HTTPHeaderFields,"objectForKey:",_19);
}
}),new objj_method(sel_getUid("setValue:forHTTPHeaderField:"),function(_1a,_1b,_1c,_1d){
with(_1a){
objj_msgSend(_HTTPHeaderFields,"setObject:forKey:",_1c,_1d);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("requestWithURL:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(objj_msgSend(CPURLRequest,"alloc"),"initWithURL:",_20);
}
})]);
p;15;CPURLResponse.jt;888;@STATIC;1.0;i;10;CPObject.jt;855;
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPURLResponse"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithURL:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPURLResponse").super_class},"init");
if(_3){
_URL=_5;
}
return _3;
}
}),new objj_method(sel_getUid("URL"),function(_6,_7){
with(_6){
return _URL;
}
})]);
var _1=objj_allocateClassPair(CPURLResponse,"CPHTTPURLResponse"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_statusCode")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_setStatusCode:"),function(_8,_9,_a){
with(_8){
_statusCode=_a;
}
}),new objj_method(sel_getUid("statusCode"),function(_b,_c){
with(_b){
return _statusCode;
}
})]);
p;22;CPUserSessionManager.jt;1912;@STATIC;1.0;i;10;CPObject.ji;10;CPString.jt;1863;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPString.j",YES);
CPUserSessionUndeterminedStatus=0;
CPUserSessionLoggedInStatus=1;
CPUserSessionLoggedOutStatus=2;
CPUserSessionManagerStatusDidChangeNotification="CPUserSessionManagerStatusDidChangeNotification";
CPUserSessionManagerUserIdentifierDidChangeNotification="CPUserSessionManagerUserIdentifierDidChangeNotification";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPUserSessionManager"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_status"),new objj_ivar("_userIdentifier")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPUserSessionManager").super_class},"init");
if(_4){
_status=CPUserSessionUndeterminedStatus;
}
return _4;
}
}),new objj_method(sel_getUid("status"),function(_6,_7){
with(_6){
return _status;
}
}),new objj_method(sel_getUid("setStatus:"),function(_8,_9,_a){
with(_8){
if(_status==_a){
return;
}
_status=_a;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUserSessionManagerStatusDidChangeNotification,_8);
if(_status!=CPUserSessionLoggedInStatus){
objj_msgSend(_8,"setUserIdentifier:",nil);
}
}
}),new objj_method(sel_getUid("userIdentifier"),function(_b,_c){
with(_b){
return _userIdentifier;
}
}),new objj_method(sel_getUid("setUserIdentifier:"),function(_d,_e,_f){
with(_d){
if(_userIdentifier==_f){
return;
}
_userIdentifier=_f;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPUserSessionManagerUserIdentifierDidChangeNotification,_d);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultManager"),function(_10,_11){
with(_10){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPUserSessionManager,"alloc"),"init");
}
return _1;
}
})]);
p;9;CPValue.jt;1690;@STATIC;1.0;i;9;CPCoder.ji;10;CPObject.jt;1643;
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPObject.j",YES);
var _1=objj_allocateClassPair(CPObject,"CPValue"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_JSObject")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithJSObject:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPValue").super_class},"init");
if(_3){
_JSObject=_5;
}
return _3;
}
}),new objj_method(sel_getUid("JSObject"),function(_6,_7){
with(_6){
return _JSObject;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("valueWithJSObject:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(objj_msgSend(_8,"alloc"),"initWithJSObject:",_a);
}
})]);
var _b="CPValueValueKey";
var _1=objj_getClass("CPValue");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPValue\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPValue").super_class},"init");
if(_c){
_JSObject=JSON.parse(objj_msgSend(_e,"decodeObjectForKey:",_b));
}
return _c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_11,"encodeObject:forKey:",JSON.stringify(_JSObject),_b);
}
})]);
CPJSObjectCreateJSON=function(_12){
CPLog.warn("CPJSObjectCreateJSON deprecated, use JSON.stringify() or CPString's objectFromJSON");
return JSON.stringify(_12);
};
CPJSObjectCreateWithJSON=function(_13){
CPLog.warn("CPJSObjectCreateWithJSON deprecated, use JSON.parse() or CPString's JSONFromObject");
return JSON.parse(_13);
};
p;20;CPValueTransformer.jt;4788;@STATIC;1.0;i;10;CPObject.ji;14;CPDictionary.jt;4735;
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPDictionary.j",YES);
var _1=objj_msgSend(CPDictionary,"dictionary");
var _2=objj_allocateClassPair(CPObject,"CPValueTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_4,_5,_6){
with(_4){
if(objj_msgSend(objj_msgSend(_4,"class"),"allowsReverseTransformation")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,(_4+" is not reversible."));
}
return objj_msgSend(_4,"transformedValue:",_6);
}
}),new objj_method(sel_getUid("transformedValue:"),function(_7,_8,_9){
with(_7){
return nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_a,_b){
with(_a){
if(_a!==objj_msgSend(CPValueTransformer,"class")){
return;
}
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPNegateBooleanTransformer,"alloc"),"init"),CPNegateBooleanTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPIsNilTransformer,"alloc"),"init"),CPIsNilTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPIsNotNilTransformer,"alloc"),"init"),CPIsNotNilTransformerName);
objj_msgSend(CPValueTransformer,"setValueTransformer:forName:",objj_msgSend(objj_msgSend(CPUnarchiveFromDataTransformer,"alloc"),"init"),CPUnarchiveFromDataTransformerName);
}
}),new objj_method(sel_getUid("setValueTransformer:forName:"),function(_c,_d,_e,_f){
with(_c){
objj_msgSend(_1,"setObject:forKey:",_e,_f);
}
}),new objj_method(sel_getUid("valueTransformerForName:"),function(_10,_11,_12){
with(_10){
return objj_msgSend(_1,"objectForKey:",_12);
}
}),new objj_method(sel_getUid("valueTransformerNames"),function(_13,_14){
with(_13){
return objj_msgSend(_1,"allKeys");
}
}),new objj_method(sel_getUid("allowsReverseTransformation"),function(_15,_16){
with(_15){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_17,_18){
with(_17){
return objj_msgSend(CPObject,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPNegateBooleanTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_19,_1a,_1b){
with(_19){
return !objj_msgSend(_1b,"boolValue");
}
}),new objj_method(sel_getUid("transformedValue:"),function(_1c,_1d,_1e){
with(_1c){
return !objj_msgSend(_1e,"boolValue");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_1f,_20){
with(_1f){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_21,_22){
with(_21){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPIsNilTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_23,_24,_25){
with(_23){
return _25===nil||_25===undefined;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_26,_27){
with(_26){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_28,_29){
with(_28){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPIsNotNilTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_2a,_2b,_2c){
with(_2a){
return _2c!==nil&&_2c!==undefined;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_2d,_2e){
with(_2d){
return NO;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_2f,_30){
with(_2f){
return objj_msgSend(CPNumber,"class");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"CPUnarchiveFromDataTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_33);
}
}),new objj_method(sel_getUid("transformedValue:"),function(_34,_35,_36){
with(_34){
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_36);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_37,_38){
with(_37){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_39,_3a){
with(_39){
return objj_msgSend(CPData,"class");
}
})]);
CPNegateBooleanTransformerName="CPNegateBooleanTransformerName";
CPIsNilTransformerName="CPIsNilTransformerName";
CPIsNotNilTransformerName="CPIsNotNilTransformerName";
CPUnarchiveFromDataTransformerName="CPUnarchiveFromDataTransformerName";
p;17;CPWebDAVManager.jt;4315;@STATIC;1.0;t;4296;
var _1=function(_2,_3,_4){
var _5=objj_msgSend(_4,"objectForKey:","resourcetype");
if(_5===CPWebDAVManagerCollectionResourceType){
objj_msgSend(_2,"setResourceValue:forKey:",YES,CPURLIsDirectoryKey);
objj_msgSend(_2,"setResourceValue:forKey:",NO,CPURLIsRegularFileKey);
}else{
if(_5===CPWebDAVManagerNonCollectionResourceType){
objj_msgSend(_2,"setResourceValue:forKey:",NO,CPURLIsDirectoryKey);
objj_msgSend(_2,"setResourceValue:forKey:",YES,CPURLIsRegularFileKey);
}
}
var _6=objj_msgSend(_4,"objectForKey:","displayname");
if(_6!==nil){
objj_msgSend(_2,"setResourceValue:forKey:",_6,CPURLNameKey);
objj_msgSend(_2,"setResourceValue:forKey:",_6,CPURLLocalizedNameKey);
}
};
CPWebDAVManagerCollectionResourceType=1;
CPWebDAVManagerNonCollectionResourceType=0;
var _7=objj_allocateClassPair(CPObject,"CPWebDAVManager"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_blocksForConnections")]);
objj_registerClassPair(_7);
class_addMethods(_7,[new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPWebDAVManager").super_class},"init");
if(_9){
_blocksForConnections=objj_msgSend(CPDictionary,"dictionary");
}
return _9;
}
}),new objj_method(sel_getUid("contentsOfDirectoryAtURL:includingPropertiesForKeys:options:block:"),function(_b,_c,_d,_e,_f,_10){
with(_b){
var _11=[],_12=objj_msgSend(_e,"count");
while(_12--){
_11.push(_13[_e[_12]]);
}
var _14=function(_15,_16){
var _17=[],_18=nil,_19=objj_msgSend(_16,"keyEnumerator");
while(_18=objj_msgSend(_19,"nextObject")){
var URL=objj_msgSend(CPURL,"URLWithString:",_18),_11=objj_msgSend(_16,"objectForKey:",_18);
if(!objj_msgSend(objj_msgSend(URL,"absoluteString"),"isEqual:",objj_msgSend(_15,"absoluteString"))){
_17.push(URL);
_1(URL,_e,_11);
}
}
return _17;
};
if(!_10){
return _14(_d,response);
}
objj_msgSend(_b,"PROPFIND:properties:depth:block:",_d,_11,1,function(_1a,_1b){
_10(_1a,_14(_1a,_1b));
});
}
}),new objj_method(sel_getUid("PROPFIND:properties:depth:block:"),function(_1c,_1d,_1e,_1f,_20,_21){
with(_1c){
var _22=objj_msgSend(CPURLRequest,"requestWithURL:",_1e);
objj_msgSend(_22,"setHTTPMethod:","PROPFIND");
objj_msgSend(_22,"setValue:forHTTPHeaderField:",_20,"Depth");
var _23=["<?xml version=\"1.0\"?><a:propfind xmlns:a=\"DAV:\">"],_24=0,_25=_1f.length;
for(;_24<_25;++_24){
_23.push("<a:prop><a:",_1f[_24],"/></a:prop>");
}
_23.push("</a:propfind>");
objj_msgSend(_22,"setHTTPBody:",_23.join(""));
if(!_21){
return _26(objj_msgSend(objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_22,nil),"rawString"));
}else{
var _27=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_22,_1c);
objj_msgSend(_blocksForConnections,"setObject:forKey:",_21,objj_msgSend(_27,"UID"));
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=objj_msgSend(_blocksForConnections,"objectForKey:",objj_msgSend(_2a,"UID"));
_2c(objj_msgSend(_2a._request,"URL"),_26(_2b));
}
})]);
var _13={};
_13[CPURLNameKey]="displayname";
_13[CPURLLocalizedNameKey]="displayname";
_13[CPURLIsRegularFileKey]="resourcetype";
_13[CPURLIsDirectoryKey]="resourcetype";
var _2d=function(_2e){
if(typeof window["ActiveXObject"]!=="undefined"){
var _2f=new ActiveXObject("Microsoft.XMLDOM");
_2f.async=false;
_2f.loadXML(_2e);
return _2f;
}
return new DOMParser().parseFromString(_2e,"text/xml");
};
var _26=function(_30){
var _31=_2d(_30),_32=_31.getElementsByTagNameNS("*","response"),_33=0,_34=_32.length;
var _35=objj_msgSend(CPDictionary,"dictionary");
for(;_33<_34;++_33){
var _36=_32[_33],_37=_36.getElementsByTagNameNS("*","prop").item(0).childNodes,_38=0,_39=_37.length,_3a=objj_msgSend(CPDictionary,"dictionary");
for(;_38<_39;++_38){
var _3b=_37[_38];
if(_3b.nodeType===8||_3b.nodeType===3){
continue;
}
var _3c=_3b.nodeName,_3d=_3c.lastIndexOf(":");
if(_3d>-1){
_3c=_3c.substr(_3d+1);
}
if(_3c==="resourcetype"){
objj_msgSend(_3a,"setObject:forKey:",_3b.firstChild?CPWebDAVManagerCollectionResourceType:CPWebDAVManagerNonCollectionResourceType,_3c);
}else{
objj_msgSend(_3a,"setObject:forKey:",_3b.firstChild.nodeValue,_3c);
}
}
var _3e=_36.getElementsByTagNameNS("*","href").item(0);
objj_msgSend(_35,"setObject:forKey:",_3a,_3e.firstChild.nodeValue);
}
return _35;
};
var _3f=function(_40,_41){
};
p;12;Foundation.jt;2685;@STATIC;1.0;i;9;CPArray.ji;10;CPBundle.ji;16;CPCharacterSet.ji;9;CPCoder.ji;23;CPComparisonPredicate.ji;21;CPCompoundPredicate.ji;8;CPData.ji;8;CPDate.ji;14;CPDictionary.ji;14;CPEnumerator.ji;13;CPException.ji;13;CPFormatter.ji;14;CPExpression.ji;12;CPIndexSet.ji;14;CPInvocation.ji;19;CPJSONPConnection.ji;17;CPKeyedArchiver.ji;19;CPKeyedUnarchiver.ji;18;CPKeyValueCoding.ji;21;CPKeyValueObserving.ji;16;CPNotification.ji;22;CPNotificationCenter.ji;8;CPNull.ji;10;CPNumber.ji;10;CPObject.ji;15;CPObjJRuntime.ji;13;CPOperation.ji;18;CPOperationQueue.ji;13;CPPredicate.ji;29;CPPropertyListSerialization.ji;9;CPRange.ji;11;CPRunLoop.ji;11;CPScanner.ji;7;CPSet.ji;18;CPSortDescriptor.ji;10;CPString.ji;9;CPTimer.ji;15;CPUndoManager.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.ji;15;CPURLResponse.ji;22;CPUserSessionManager.ji;9;CPValue.ji;20;CPValueTransformer.jt;1811;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPBundle.j",YES);
objj_executeFile("CPCharacterSet.j",YES);
objj_executeFile("CPCoder.j",YES);
objj_executeFile("CPComparisonPredicate.j",YES);
objj_executeFile("CPCompoundPredicate.j",YES);
objj_executeFile("CPData.j",YES);
objj_executeFile("CPDate.j",YES);
objj_executeFile("CPDictionary.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPException.j",YES);
objj_executeFile("CPFormatter.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPIndexSet.j",YES);
objj_executeFile("CPInvocation.j",YES);
objj_executeFile("CPJSONPConnection.j",YES);
objj_executeFile("CPKeyedArchiver.j",YES);
objj_executeFile("CPKeyedUnarchiver.j",YES);
objj_executeFile("CPKeyValueCoding.j",YES);
objj_executeFile("CPKeyValueObserving.j",YES);
objj_executeFile("CPNotification.j",YES);
objj_executeFile("CPNotificationCenter.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPNumber.j",YES);
objj_executeFile("CPObject.j",YES);
objj_executeFile("CPObjJRuntime.j",YES);
objj_executeFile("CPOperation.j",YES);
objj_executeFile("CPOperationQueue.j",YES);
objj_executeFile("CPPredicate.j",YES);
objj_executeFile("CPPropertyListSerialization.j",YES);
objj_executeFile("CPRange.j",YES);
objj_executeFile("CPRunLoop.j",YES);
objj_executeFile("CPScanner.j",YES);
objj_executeFile("CPSet.j",YES);
objj_executeFile("CPSortDescriptor.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPTimer.j",YES);
objj_executeFile("CPUndoManager.j",YES);
objj_executeFile("CPURL.j",YES);
objj_executeFile("CPURLConnection.j",YES);
objj_executeFile("CPURLRequest.j",YES);
objj_executeFile("CPURLResponse.j",YES);
objj_executeFile("CPUserSessionManager.j",YES);
objj_executeFile("CPValue.j",YES);
objj_executeFile("CPValueTransformer.j",YES);
p;23;CPComparisonPredicate.jt;12931;@STATIC;1.0;i;9;CPArray.ji;8;CPNull.ji;10;CPString.ji;14;CPEnumerator.ji;13;CPPredicate.ji;14;CPExpression.ji;23;CPExpression_operator.jt;12787;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPNull.j",YES);
objj_executeFile("CPString.j",YES);
objj_executeFile("CPEnumerator.j",YES);
objj_executeFile("CPPredicate.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPExpression_operator.j",YES);
CPDirectPredicateModifier=0;
CPAllPredicateModifier=1;
CPAnyPredicateModifier=2;
CPCaseInsensitivePredicateOption=1;
CPDiacriticInsensitivePredicateOption=2;
CPDiacriticInsensitiveSearch=128;
CPLessThanPredicateOperatorType=0;
CPLessThanOrEqualToPredicateOperatorType=1;
CPGreaterThanPredicateOperatorType=2;
CPGreaterThanOrEqualToPredicateOperatorType=3;
CPEqualToPredicateOperatorType=4;
CPNotEqualToPredicateOperatorType=5;
CPMatchesPredicateOperatorType=6;
CPLikePredicateOperatorType=7;
CPBeginsWithPredicateOperatorType=8;
CPEndsWithPredicateOperatorType=9;
CPInPredicateOperatorType=10;
CPCustomSelectorPredicateOperatorType=11;
CPContainsPredicateOperatorType=99;
CPBetweenPredicateOperatorType=100;
var _1;
var _2;
var _3=objj_allocateClassPair(CPPredicate,"CPComparisonPredicate"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_left"),new objj_ivar("_right"),new objj_ivar("_modifier"),new objj_ivar("_type"),new objj_ivar("_options"),new objj_ivar("_customSelector")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithLeftExpression:rightExpression:customSelector:"),function(_5,_6,_7,_8,_9){
with(_5){
_left=_7;
_right=_8;
_modifier=CPDirectPredicateModifier;
_type=CPCustomSelectorPredicateOperatorType;
_options=0;
_customSelector=_9;
return _5;
}
}),new objj_method(sel_getUid("initWithLeftExpression:rightExpression:modifier:type:options:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_left=_c;
_right=_d;
_modifier=_e;
_type=_f;
_options=(_f!=CPMatchesPredicateOperatorType&&_f!=CPLikePredicateOperatorType&&_f!=CPBeginsWithPredicateOperatorType&&_f!=CPEndsWithPredicateOperatorType&&_f!=CPInPredicateOperatorType&&_f!=CPContainsPredicateOperatorType)?0:_10;
_customSelector=NULL;
return _a;
}
}),new objj_method(sel_getUid("comparisonPredicateModifier"),function(_11,_12){
with(_11){
return _modifier;
}
}),new objj_method(sel_getUid("customSelector"),function(_13,_14){
with(_13){
return _customSelector;
}
}),new objj_method(sel_getUid("leftExpression"),function(_15,_16){
with(_15){
return _left;
}
}),new objj_method(sel_getUid("options"),function(_17,_18){
with(_17){
return _options;
}
}),new objj_method(sel_getUid("predicateOperatorType"),function(_19,_1a){
with(_19){
return _type;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1b,_1c){
with(_1b){
return _right;
}
}),new objj_method(sel_getUid("predicateFormat"),function(_1d,_1e){
with(_1d){
var _1f;
switch(_modifier){
case CPDirectPredicateModifier:
_1f="";
break;
case CPAllPredicateModifier:
_1f="ALL ";
break;
case CPAnyPredicateModifier:
_1f="ANY ";
break;
default:
_1f="";
break;
}
var _20;
switch(_options){
case CPCaseInsensitivePredicateOption:
_20="[c]";
break;
case CPDiacriticInsensitivePredicateOption:
_20="[d]";
break;
case CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption:
_20="[cd]";
break;
default:
_20="";
break;
}
var _21;
switch(_type){
case CPLessThanPredicateOperatorType:
_21="<";
break;
case CPLessThanOrEqualToPredicateOperatorType:
_21="<=";
break;
case CPGreaterThanPredicateOperatorType:
_21=">";
break;
case CPGreaterThanOrEqualToPredicateOperatorType:
_21=">=";
break;
case CPEqualToPredicateOperatorType:
_21="==";
break;
case CPNotEqualToPredicateOperatorType:
_21="!=";
break;
case CPMatchesPredicateOperatorType:
_21="MATCHES";
break;
case CPLikePredicateOperatorType:
_21="LIKE";
break;
case CPBeginsWithPredicateOperatorType:
_21="BEGINSWITH";
break;
case CPEndsWithPredicateOperatorType:
_21="ENDSWITH";
break;
case CPInPredicateOperatorType:
_21="IN";
break;
case CPContainsPredicateOperatorType:
_21="CONTAINS";
break;
case CPCustomSelectorPredicateOperatorType:
_21=CPStringFromSelector(_customSelector);
break;
}
return objj_msgSend(CPString,"stringWithFormat:","%s%s %s%s %s",_1f,objj_msgSend(_left,"description"),_21,_20,objj_msgSend(_right,"description"));
}
}),new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_left,"_expressionWithSubstitutionVariables:",_24),_26=objj_msgSend(_right,"_expressionWithSubstitutionVariables:",_24);
if(_type!=CPCustomSelectorPredicateOperatorType){
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_25,_26,_modifier,_type,_options);
}else{
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:customSelector:",_25,_26,_customSelector);
}
}
}),new objj_method(sel_getUid("_evaluateValue:rightValue:"),function(_27,_28,lhs,rhs){
with(_27){
var _29=(lhs==nil||objj_msgSend(lhs,"isEqual:",objj_msgSend(CPNull,"null"))),_2a=(rhs==nil||objj_msgSend(rhs,"isEqual:",objj_msgSend(CPNull,"null")));
if((_29||_2a)&&_type!=CPCustomSelectorPredicateOperatorType){
return (_29==_2a&&(_type==CPEqualToPredicateOperatorType||_type==CPLessThanOrEqualToPredicateOperatorType||_type==CPGreaterThanOrEqualToPredicateOperatorType));
}
var _2b=0;
switch(_type){
case CPLessThanPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)==CPOrderedAscending);
case CPLessThanOrEqualToPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)!=CPOrderedDescending);
case CPGreaterThanPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)==CPOrderedDescending);
case CPGreaterThanOrEqualToPredicateOperatorType:
return (objj_msgSend(lhs,"compare:",rhs)!=CPOrderedAscending);
case CPEqualToPredicateOperatorType:
return objj_msgSend(lhs,"isEqual:",rhs);
case CPNotEqualToPredicateOperatorType:
return (!objj_msgSend(lhs,"isEqual:",rhs));
case CPMatchesPredicateOperatorType:
var _2c=(_options&CPCaseInsensitivePredicateOption)?"gi":"g";
if(_options&CPDiacriticInsensitivePredicateOption){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
return (new RegExp(rhs,_2c)).test(lhs);
case CPLikePredicateOperatorType:
if(_options&CPDiacriticInsensitivePredicateOption){
lhs=lhs.stripDiacritics();
rhs=rhs.stripDiacritics();
}
var _2c=(_options&CPCaseInsensitivePredicateOption)?"gi":"g";
var reg=new RegExp(rhs.escapeForRegExp(),_2c);
return reg.test(lhs);
case CPBeginsWithPredicateOperatorType:
var _2d=CPMakeRange(0,objj_msgSend(rhs,"length"));
if(_options&CPCaseInsensitivePredicateOption){
_2b|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2b|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"compare:options:range:",rhs,_2b,_2d)==CPOrderedSame);
case CPEndsWithPredicateOperatorType:
var _2d=CPMakeRange(objj_msgSend(lhs,"length")-objj_msgSend(rhs,"length"),objj_msgSend(rhs,"length"));
if(_options&CPCaseInsensitivePredicateOption){
_2b|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2b|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"compare:options:range:",rhs,_2b,_2d)==CPOrderedSame);
case CPInPredicateOperatorType:
if(!objj_msgSend(rhs,"isKindOfClass:",objj_msgSend(CPString,"class"))){
if(!objj_msgSend(rhs,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right hand side for an IN operator must be a collection");
}
var e=objj_msgSend(rhs,"objectEnumerator"),_2e;
while(_2e=objj_msgSend(e,"nextObject")){
if(objj_msgSend(_2e,"isEqual:",lhs)){
return YES;
}
}
return NO;
}
if(_options&CPCaseInsensitivePredicateOption){
_2b|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2b|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(rhs,"rangeOfString:options:",lhs,_2b).location!=CPNotFound);
case CPCustomSelectorPredicateOperatorType:
return objj_msgSend(lhs,"performSelector:withObject:",_customSelector,rhs);
case CPContainsPredicateOperatorType:
if(!objj_msgSend(lhs,"isKindOfClass:",objj_msgSend(CPString,"class"))){
if(!objj_msgSend(lhs,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left hand side for a CONTAINS operator must be a collection or a string");
}
var e=objj_msgSend(lhs,"objectEnumerator"),_2e;
while(_2e=objj_msgSend(e,"nextObject")){
if(objj_msgSend(_2e,"isEqual:",rhs)){
return YES;
}
}
return NO;
}
if(_options&CPCaseInsensitivePredicateOption){
_2b|=CPCaseInsensitiveSearch;
}
if(_options&CPDiacriticInsensitivePredicateOption){
_2b|=CPDiacriticInsensitiveSearch;
}
return (objj_msgSend(lhs,"rangeOfString:options:",rhs,_2b).location!=CPNotFound);
case CPBetweenPredicateOperatorType:
if(objj_msgSend(lhs,"count")<2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right hand side for a BETWEEN operator must contain 2 objects");
}
var _2f=objj_msgSend(rhs,"objectAtIndex:",0),_30=objj_msgSend(rhs,"objectAtIndex:",1);
return (objj_msgSend(lhs,"compare:",_2f)==CPOrderedDescending&&objj_msgSend(lhs,"compare:",_30)==CPOrderedAscending);
default:
return NO;
}
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_31,"evaluateWithObject:substitutionVariables:",_33,nil);
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_34,_35,_36,_37){
with(_34){
var _38=_left,_39=_right;
if(_37!=nil){
_38=objj_msgSend(_38,"_expressionWithSubstitutionVariables:",_37);
_39=objj_msgSend(_39,"_expressionWithSubstitutionVariables:",_37);
}
var _3a=objj_msgSend(_38,"expressionValueWithObject:context:",_36,nil),_3b=objj_msgSend(_39,"expressionValueWithObject:context:",_36,nil);
if(_modifier==CPDirectPredicateModifier){
return objj_msgSend(_34,"_evaluateValue:rightValue:",_3a,_3b);
}else{
if(!objj_msgSend(_3a,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left hand side for an ALL or ANY operator must be either a CPArray or a CPSet");
}
var e=objj_msgSend(_3a,"objectEnumerator"),_3c=(_modifier==CPAllPredicateModifier),_3d;
while(_3d=objj_msgSend(e,"nextObject")){
var _3e=objj_msgSend(_34,"_evaluateValue:rightValue:",_3d,_3b);
if(_3e!=_3c){
return _3e;
}
}
return _3c;
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:customSelector:"),function(_3f,_40,_41,_42,_43){
with(_3f){
return objj_msgSend(objj_msgSend(_3f,"alloc"),"initWithLeftExpression:rightExpression:customSelector:",_41,_42,_43);
}
}),new objj_method(sel_getUid("predicateWithLeftExpression:rightExpression:modifier:type:options:"),function(_44,_45,_46,_47,_48,_49,_4a){
with(_44){
return objj_msgSend(objj_msgSend(_44,"alloc"),"initWithLeftExpression:rightExpression:modifier:type:options:",_46,_47,_48,_49,_4a);
}
})]);
var _3=objj_getClass("CPComparisonPredicate");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPComparisonPredicate\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_4b,_4c,_4d){
with(_4b){
_4b=objj_msgSendSuper({receiver:_4b,super_class:objj_getClass("CPComparisonPredicate").super_class},"init");
if(_4b!=nil){
_left=objj_msgSend(_4d,"decodeObjectForKey:","CPComparisonPredicateLeftExpression");
_right=objj_msgSend(_4d,"decodeObjectForKey:","CPComparisonPredicateRightExpression");
_modifier=objj_msgSend(_4d,"decodeIntForKey:","CPComparisonPredicateModifier");
_type=objj_msgSend(_4d,"decodeIntForKey:","CPComparisonPredicateType");
_options=objj_msgSend(_4d,"decodeIntForKey:","CPComparisonPredicateOptions");
_customSelector=objj_msgSend(_4d,"decodeObjectForKey:","CPComparisonPredicateCustomSelector");
}
return _4b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_50,"encodeObject:forKey:",_left,"CPComparisonPredicateLeftExpression");
objj_msgSend(_50,"encodeObject:forKey:",_right,"CPComparisonPredicateRightExpression");
objj_msgSend(_50,"encodeInt:forKey:",_modifier,"CPComparisonPredicateModifier");
objj_msgSend(_50,"encodeInt:forKey:",_type,"CPComparisonPredicateType");
objj_msgSend(_50,"encodeInt:forKey:",_options,"CPComparisonPredicateOptions");
objj_msgSend(_50,"encodeObject:forKey:",_customSelector,"CPComparisonPredicateCustomSelector");
}
})]);
var _51=["*","?","(",")","{","}",".","+","|","/","$","^"];
var _52=[".*",".?","\\(","\\)","\\{","\\}","\\.","\\+","\\|","\\/","\\$","\\^"];
String.prototype.escapeForRegExp=function(){
var _53=false;
for(var i=0;i<_51.length;++i){
if(this.indexOf(_51[i])!==-1){
_53=true;
break;
}
}
if(!_53){
return this;
}
var _54="",_55;
for(var i=0;i<this.length;++i){
var _55=_51.indexOf(this.charAt(i));
if(_55!==-1){
_54+=_52[_55];
}else{
_54+=this.charAt(i);
}
}
return _54;
};
p;21;CPCompoundPredicate.jt;4754;@STATIC;1.0;i;13;CPPredicate.jI;20;Foundation/CPArray.jI;21;Foundation/CPString.jt;4666;
objj_executeFile("CPPredicate.j",YES);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
CPNotPredicateType=0;
CPAndPredicateType=1;
CPOrPredicateType=2;
var _1;
var _2=objj_allocateClassPair(CPPredicate,"CPCompoundPredicate"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_type"),new objj_ivar("_predicates")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithType:subpredicates:"),function(_4,_5,_6,_7){
with(_4){
_type=_6;
_predicates=_7;
return _4;
}
}),new objj_method(sel_getUid("compoundPredicateType"),function(_8,_9){
with(_8){
return _type;
}
}),new objj_method(sel_getUid("subpredicates"),function(_a,_b){
with(_a){
return _predicates;
}
}),new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(CPArray,"array"),_10=objj_msgSend(_f,"count");
i;
for(i=0;i<_10;i++){
var p=objj_msgSend(_f,"objectAtIndex:",i),sp=objj_msgSend(p,"predicateWithSubstitutionVariables:",_e);
objj_msgSend(_f,"addObject:",sp);
}
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_type,_f);
}
}),new objj_method(sel_getUid("predicateFormat"),function(_11,_12){
with(_11){
var _13="",_14=objj_msgSend(CPArray,"array"),_15=objj_msgSend(_predicates,"count"),i;
if(_15==0){
return "TRUPREDICATE";
}
for(i=0;i<_15;i++){
var _16=objj_msgSend(_predicates,"objectAtIndex:",i),_17=objj_msgSend(_16,"predicateFormat");
if(objj_msgSend(_16,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(objj_msgSend(_16,"subpredicates"),"count")>1&&objj_msgSend(_16,"compoundPredicateType")!=_type){
_17=objj_msgSend(CPString,"stringWithFormat:","(%s)",_17);
}
if(_17!=nil){
objj_msgSend(_14,"addObject:",_17);
}
}
switch(_type){
case CPNotPredicateType:
_13+="NOT %s"+objj_msgSend(_14,"objectAtIndex:",0);
break;
case CPAndPredicateType:
_13+=objj_msgSend(_14,"objectAtIndex:",0);
var _15=objj_msgSend(_14,"count");
for(var j=1;j<_15;j++){
_13+=" AND "+objj_msgSend(_14,"objectAtIndex:",j);
}
break;
case CPOrPredicateType:
_13+=objj_msgSend(_14,"objectAtIndex:",0);
var _15=objj_msgSend(_14,"count");
for(var j=1;j<_15;j++){
_13+=" OR "+objj_msgSend(_14,"objectAtIndex:",j);
}
break;
}
return _13;
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_18,_19,_1a){
with(_18){
return objj_msgSend(_18,"evaluateWithObject:substitutionVariables:",_1a,nil);
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=NO,_20=objj_msgSend(_predicates,"count"),i;
if(_20==0){
return YES;
}
for(i=0;i<_20;i++){
var _21=objj_msgSend(_predicates,"objectAtIndex:",i);
switch(_type){
case CPNotPredicateType:
return !objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e);
case CPAndPredicateType:
if(i==0){
_1f=objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e);
}else{
_1f=_1f&&objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e);
}
if(!_1f){
return NO;
}
break;
case CPOrPredicateType:
if(objj_msgSend(_21,"evaluateWithObject:substitutionVariables:",_1d,_1e)){
return YES;
}
break;
}
}
return _1f;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("notPredicateWithSubpredicate:"),function(_22,_23,_24){
with(_22){
return objj_msgSend(objj_msgSend(_22,"alloc"),"initWithType:subpredicates:",CPNotPredicateType,objj_msgSend(CPArray,"arrayWithObject:",_24));
}
}),new objj_method(sel_getUid("andPredicateWithSubpredicates:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(objj_msgSend(_25,"alloc"),"initWithType:subpredicates:",CPAndPredicateType,_27);
}
}),new objj_method(sel_getUid("orPredicateWithSubpredicates:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(objj_msgSend(_28,"alloc"),"initWithType:subpredicates:",CPOrPredicateType,_2a);
}
})]);
var _2=objj_getClass("CPCompoundPredicate");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPCompoundPredicate\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPCompoundPredicate").super_class},"init");
if(_2b!=nil){
_predicates=objj_msgSend(_2d,"decodeObjectForKey:","CPCompoundPredicateSubpredicates");
_type=objj_msgSend(_2d,"decodeIntForKey:","CPCompoundPredicateType");
}
return _2b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(_30,"encodeObject:forKey:",_predicates,"CPCompoundPredicateSubpredicates");
objj_msgSend(_30,"encodeInt:forKey:",_type,"CPCompoundPredicateType");
}
})]);
p;14;CPExpression.jt;5093;@STATIC;1.0;I;21;Foundation/CPString.jI;20;Foundation/CPArray.jI;29;Foundation/CPKeyValueCoding.jI;25;Foundation/CPDictionary.jI;20;Foundation/CPCoder.ji;23;CPExpression_constant.ji;19;CPExpression_self.ji;23;CPExpression_variable.ji;22;CPExpression_keypath.ji;23;CPExpression_function.ji;24;CPExpression_aggregate.ji;23;CPExpression_unionset.ji;27;CPExpression_intersectset.ji;23;CPExpression_minusset.jt;4682;
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPKeyValueCoding.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPCoder.j",NO);
CPConstantValueExpressionType=0;
CPEvaluatedObjectExpressionType=1;
CPVariableExpressionType=2;
CPKeyPathExpressionType=3;
CPFunctionExpressionType=4;
CPAggregateExpressionType=5;
CPSubqueryExpressionType=6;
CPUnionSetExpressionType=7;
CPIntersectSetExpressionType=8;
CPMinusSetExpressionType=9;
var _1=objj_allocateClassPair(CPObject,"CPExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_type")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithExpressionType:"),function(_3,_4,_5){
with(_3){
_type=_5;
return _3;
}
}),new objj_method(sel_getUid("expressionType"),function(_6,_7){
with(_6){
return _type;
}
}),new objj_method(sel_getUid("constantValue"),function(_8,_9){
with(_8){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"self is not of CPConstantValueExpressionType");
return nil;
}
}),new objj_method(sel_getUid("variable"),function(_a,_b){
with(_a){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"self is not of CPVariableExpressionType");
return nil;
}
}),new objj_method(sel_getUid("keyPath"),function(_c,_d){
with(_c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"self is not of CPKeyPathExpressionType");
return nil;
}
}),new objj_method(sel_getUid("function"),function(_e,_f){
with(_e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"self is not of CPFunctionExpressionType");
return nil;
}
}),new objj_method(sel_getUid("arguments"),function(_10,_11){
with(_10){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"self is not of CPFunctionExpressionType");
return nil;
}
}),new objj_method(sel_getUid("collection"),function(_12,_13){
with(_12){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"self is not of CPAggregateExpressionType");
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("expressionForConstantValue:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(objj_msgSend(CPExpression_constant,"alloc"),"initWithValue:",_16);
}
}),new objj_method(sel_getUid("expressionForEvaluatedObject"),function(_17,_18){
with(_17){
return objj_msgSend(objj_msgSend(CPExpression_self,"alloc"),"init");
}
}),new objj_method(sel_getUid("expressionForVariable:"),function(_19,_1a,_1b){
with(_19){
return objj_msgSend(objj_msgSend(CPExpression_variable,"alloc"),"initWithVariable:",_1b);
}
}),new objj_method(sel_getUid("expressionForKeyPath:"),function(_1c,_1d,_1e){
with(_1c){
return objj_msgSend(objj_msgSend(CPExpression_keypath,"alloc"),"initWithKeyPath:",_1e);
}
}),new objj_method(sel_getUid("expressionForAggregate:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(CPExpression_aggregate,"alloc"),"initWithAggregate:",_21);
}
}),new objj_method(sel_getUid("expressionForUnionSet:with:"),function(_22,_23,_24,_25){
with(_22){
return objj_msgSend(objj_msgSend(CPExpression_unionset,"alloc"),"initWithLeft:right:",_24,_25);
}
}),new objj_method(sel_getUid("expressionForIntersectSet:with:"),function(_26,_27,_28,_29){
with(_26){
return objj_msgSend(objj_msgSend(CPExpression_intersectset,"alloc"),"initWithLeft:right:",_28,_29);
}
}),new objj_method(sel_getUid("expressionForMinusSet:with:"),function(_2a,_2b,_2c,_2d){
with(_2a){
return objj_msgSend(objj_msgSend(CPExpression_minusset,"alloc"),"initWithLeft:right:",_2c,_2d);
}
}),new objj_method(sel_getUid("expressionForFunction:arguments:"),function(_2e,_2f,_30,_31){
with(_2e){
return objj_msgSend(objj_msgSend(CPExpression_function,"alloc"),"initWithSelector:arguments:",CPSelectorFromString(_30),_31);
}
}),new objj_method(sel_getUid("expressionForFunction:selectorName:arguments:"),function(_32,_33,_34,_35,_36){
with(_32){
return objj_msgSend(objj_msgSend(CPExpression_function,"alloc"),"initWithTarget:selector:arguments:",_34,CPSelectorFromString(_35),_36);
}
}),new objj_method(sel_getUid("expressionForSubquery:usingIteratorVariable:predicate:"),function(_37,_38,_39,_3a,_3b){
with(_37){
return nil;
}
})]);
objj_executeFile("CPExpression_constant.j",YES);
objj_executeFile("CPExpression_self.j",YES);
objj_executeFile("CPExpression_variable.j",YES);
objj_executeFile("CPExpression_keypath.j",YES);
objj_executeFile("CPExpression_function.j",YES);
objj_executeFile("CPExpression_aggregate.j",YES);
objj_executeFile("CPExpression_unionset.j",YES);
objj_executeFile("CPExpression_intersectset.j",YES);
objj_executeFile("CPExpression_minusset.j",YES);
p;24;CPExpression_aggregate.jt;3086;@STATIC;1.0;i;14;CPExpression.jI;20;Foundation/CPArray.jI;21;Foundation/CPString.jt;2997;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_aggregate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_aggregate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAggregate:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_aggregate").super_class},"initWithExpressionType:",CPAggregateExpressionType);
_aggregate=_5;
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_8,"decodeObjectForKey:","CPExpressionAggregate");
return objj_msgSend(_6,"initWithAggregate:",_9);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_c,"encodeObject:forKey:",_aggregate,"CPExpressionAggregate");
}
}),new objj_method(sel_getUid("isEqual:"),function(_d,_e,_f){
with(_d){
if(_d==_f){
return YES;
}
if(_f.isa!=_d.isa||objj_msgSend(_f,"expressionType")!=objj_msgSend(_d,"expressionType")||!objj_msgSend(objj_msgSend(_f,"collection"),"isEqual:",objj_msgSend(_d,"collection"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("collection"),function(_10,_11){
with(_10){
return _aggregate;
}
}),new objj_method(sel_getUid("rightExpression"),function(_12,_13){
with(_12){
if(objj_msgSend(_aggregate,"count")>0){
return objj_msgSend(_aggregate,"lastObject");
}
return nil;
}
}),new objj_method(sel_getUid("leftExpression"),function(_14,_15){
with(_14){
if(objj_msgSend(_aggregate,"count")>0){
return objj_msgSend(_aggregate,"objectAtIndex:",0);
}
return nil;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_16,_17,_18,_19){
with(_16){
var _1a=objj_msgSend(CPArray,"array"),_1b=objj_msgSend(_aggregate,"objectEnumerator"),exp;
while(exp=objj_msgSend(_1b,"nextObject")){
var _1c=objj_msgSend(exp,"expressionValueWithObject:context:",_18,_19);
if(_1c!=nil){
objj_msgSend(_1a,"addObject:",_1c);
}
}
return _1a;
}
}),new objj_method(sel_getUid("description"),function(_1d,_1e){
with(_1d){
var i,_1f=objj_msgSend(_aggregate,"count"),_20="{";
for(i=0;i<_1f;i++){
_20=_20+objj_msgSend(CPString,"stringWithFormat:","%s%s",objj_msgSend(objj_msgSend(_aggregate,"objectAtIndex:",i),"description"),(i+1<_1f)?", ":"");
}
_20=_20+"}";
return _20;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(CPArray,"array"),_25=objj_msgSend(_aggregate,"count"),i;
for(i=0;i<_25;i++){
objj_msgSend(_24,"addObject:",objj_msgSend(objj_msgSend(_aggregate,"objectAtIndex:",i),"_expressionWithSubstitutionVariables:",_23));
}
return objj_msgSend(CPExpression,"expressionForAggregate:",_24);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("expressionForAggregate:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(objj_msgSend(_26,"alloc"),"initWithAggregate:",_28);
}
})]);
p;25;CPExpression_assignment.jt;2785;@STATIC;1.0;i;14;CPExpression.ji;23;CPExpression_variable.jI;21;Foundation/CPString.jt;2693;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPExpression_variable.j",YES);
objj_executeFile("Foundation/CPString.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_assignment"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_assignmentVariable"),new objj_ivar("_subexpression")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAssignmentVariable:expression:"),function(_3,_4,_5,_6){
with(_3){
_assignmentVariable=objj_msgSend(CPExpression,"expressionForVariable:",_5);
_subexpression=_6;
return _3;
}
}),new objj_method(sel_getUid("initWithAssignmentExpression:expression:"),function(_7,_8,_9,_a){
with(_7){
_assignmentVariable=_9;
_subexpression=_a;
return _7;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_d,"decodeObjectForKey:","CPExpressionAssignmentVariable");
var _f=objj_msgSend(_d,"decodeObjectForKey:","CPExpressionAssignmentExpression");
return objj_msgSend(_b,"initWithAssignmentVariable:expression:",_e,_f);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_12,"encodeObject:forKey:",_assignmentVariable,"CPExpressionAssignmentVariable");
objj_msgSend(_12,"encodeObject:forKey:",_subexpression,"CPExpressionAssignmentExpression");
}
}),new objj_method(sel_getUid("isEqual:"),function(_13,_14,_15){
with(_13){
if(_13==_15){
return YES;
}
if(_15.isa!=_13.isa||objj_msgSend(_15,"expressionType")!=objj_msgSend(_13,"expressionType")||!objj_msgSend(objj_msgSend(_15,"subexpression"),"isEqual:",objj_msgSend(_13,"subexpression"))||!objj_msgSend(objj_msgSend(_15,"variable"),"isEqualToString:",objj_msgSend(_13,"variable"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("assignmentVariable"),function(_16,_17){
with(_16){
return _assignmentVariable;
}
}),new objj_method(sel_getUid("subexpression"),function(_18,_19){
with(_18){
return _subexpression;
}
}),new objj_method(sel_getUid("variable"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_assignmentVariable,"variable");
}
}),new objj_method(sel_getUid("description"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(_expression,"description");
if(objj_msgSend(_subexpression,"isKindOfClass:",objj_msgSend(CPExpression_operator,"class"))){
_1e=objj_msgSend(CPString,"stringWithFormat:","(%@)",_1e);
}
return objj_msgSend(CPString,"stringWithFormat:","%@ := %@",objj_msgSend(_1c,"variable"),_1e);
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_1f,_20,_21,_22){
with(_1f){
return nil;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_23,_24,_25){
with(_23){
return nil;
}
})]);
p;23;CPExpression_constant.jt;1814;@STATIC;1.0;i;14;CPExpression.jI;25;Foundation/CPDictionary.jt;1746;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPDictionary.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_constant"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithValue:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_constant").super_class},"initWithExpressionType:",CPConstantValueExpressionType);
_value=_5;
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_8,"decodeObjectForKey:","CPExpressionConstantValue");
return objj_msgSend(_6,"initWithValue:",_9);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_c,"encodeObject:forKey:",_value,"CPExpressionConstantValue");
}
}),new objj_method(sel_getUid("isEqual:"),function(_d,_e,_f){
with(_d){
if(_d==_f){
return YES;
}
if(_f.isa!=_d.isa||objj_msgSend(_f,"expressionType")!=objj_msgSend(_d,"expressionType")||!objj_msgSend(objj_msgSend(_f,"constantValue"),"isEqual:",objj_msgSend(_d,"constantValue"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("constantValue"),function(_10,_11){
with(_10){
return _value;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_12,_13,_14,_15){
with(_12){
return _value;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_16,_17,_18){
with(_16){
return _16;
}
}),new objj_method(sel_getUid("description"),function(_19,_1a){
with(_19){
if(objj_msgSend(_value,"isKindOfClass:",objj_msgSend(CPString,"class"))){
return "\""+_value+"\"";
}
return objj_msgSend(_value,"description");
}
})]);
p;23;CPExpression_function.jt;11558;@STATIC;1.0;i;14;CPExpression.jI;21;Foundation/CPString.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jt;11438;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_function"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_operand"),new objj_ivar("_selector"),new objj_ivar("_arguments"),new objj_ivar("_argc")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithSelector:arguments:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_function").super_class},"initWithExpressionType:",CPFunctionExpressionType);
if(!objj_msgSend(_3,"respondsToSelector:",_5)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown function implementation: "+_5);
}
_selector=_5;
_operand=nil;
_arguments=_6;
_argc=objj_msgSend(_6,"count");
return _3;
}
}),new objj_method(sel_getUid("initWithTarget:selector:arguments:"),function(_7,_8,_9,_a,_b){
with(_7){
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPExpression_function").super_class},"initWithExpressionType:",CPFunctionExpressionType);
var _c=objj_msgSend(_9,"expressionValueWithObject:context:",object,context);
if(!objj_msgSend(_c,"respondsToSelector:",_a)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown function implementation: "+_a);
}
_selector=_a;
_operand=_9;
_arguments=_b;
_argc=objj_msgSend(_b,"count");
return _7;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_d,_e,_f){
with(_d){
var _10=CPSelectorFromString(objj_msgSend(_f,"decodeObjectForKey:","CPExpressionFunctionName"));
var _11=objj_msgSend(_f,"decodeObjectForKey:","CPExpressionFunctionArguments");
return objj_msgSend(_d,"initWithSelector:arguments:",_10,_11);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_14,"encodeObject:forKey:",objj_msgSend(_12,"_function"),"CPExpressionFunctionName");
objj_msgSend(_14,"encodeObject:forKey:",_arguments,"CPExpressionArguments");
}
}),new objj_method(sel_getUid("isEqual:"),function(_15,_16,_17){
with(_15){
if(_15==_17){
return YES;
}
if(_17.isa!=_15.isa||objj_msgSend(_17,"expressionType")!=objj_msgSend(_15,"expressionType")||!objj_msgSend(objj_msgSend(_17,"_function"),"isEqualToString:",objj_msgSend(_15,"_function"))||!objj_msgSend(objj_msgSend(_17,"operand"),"isEqual:",objj_msgSend(_15,"operand"))||!objj_msgSend(objj_msgSend(_17,"arguments"),"isEqualToArray:",objj_msgSend(_15,"arguments"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("_function"),function(_18,_19){
with(_18){
return CPStringFromSelector(_selector);
}
}),new objj_method(sel_getUid("function"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"_function");
}
}),new objj_method(sel_getUid("arguments"),function(_1c,_1d){
with(_1c){
return _arguments;
}
}),new objj_method(sel_getUid("operand"),function(_1e,_1f){
with(_1e){
return _operand;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(CPArray,"array"),i;
for(i=0;i<_argc;i++){
var arg=objj_msgSend(objj_msgSend(_arguments,"objectAtIndex:",i),"expressionValueWithObject:context:",_22,_23);
if(arg!=nil){
objj_msgSend(_24,"addObject:",arg);
}
}
var _25=(_operand==nil)?_20:objj_msgSend(_operand,"expressionValueWithObject:context:",_22,_23);
return objj_msgSend(_25,"performSelector:withObject:",_selector,_24);
}
}),new objj_method(sel_getUid("description"),function(_26,_27){
with(_26){
var _28=objj_msgSend(CPString,"stringWithFormat:","%@ %s(",objj_msgSend(_operand,"description"),objj_msgSend(_26,"_function")),i;
for(i=0;i<_argc;i++){
_28=_28+objj_msgSend(_arguments,"objectAtIndex:",i)+(i+1<_argc)?", ":"";
}
_28=_28+")";
return _28;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(CPArray,"array"),i;
for(i=0;i<_argc;i++){
objj_msgSend(_2c,"addObject:",objj_msgSend(objj_msgSend(_arguments,"objectAtIndex:",i),"_expressionWithSubstitutionVariables:",_2b));
}
return objj_msgSend(CPExpression,"expressionForFunction:selectorName:arguments:",objj_msgSend(_29,"operand"),objj_msgSend(_29,"_function"),_2c);
}
}),new objj_method(sel_getUid("sum:"),function(_2d,_2e,_2f){
with(_2d){
if(_argc<1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var i,sum=0;
for(i=0;i<_argc;i++){
sum+=objj_msgSend(objj_msgSend(_2f,"objectAtIndex:",i),"doubleValue");
}
return objj_msgSend(CPNumber,"numberWithDouble:",sum);
}
}),new objj_method(sel_getUid("count:"),function(_30,_31,_32){
with(_30){
if(_argc<1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
return objj_msgSend(CPNumber,"numberWithUnsignedInt:",objj_msgSend(objj_msgSend(_32,"objectAtIndex:",0),"count"));
}
}),new objj_method(sel_getUid("min:"),function(_33,_34,_35){
with(_33){
if(_argc<1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
return MIN(objj_msgSend(_35,"objectAtIndex:",0),objj_msgSend(_35,"objectAtIndex:",1));
}
}),new objj_method(sel_getUid("max:"),function(_36,_37,_38){
with(_36){
if(_argc<1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
return MAX(objj_msgSend(_38,"objectAtIndex:",0),objj_msgSend(_38,"objectAtIndex:",1));
}
}),new objj_method(sel_getUid("average:"),function(_39,_3a,_3b){
with(_39){
if(_argc<1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var i,sum=0;
for(i=0;i<_argc;i++){
sum+=objj_msgSend(objj_msgSend(_3b,"objectAtIndex:",i),"doubleValue");
}
return objj_msgSend(CPNumber,"numberWithDouble:",sum/_argc);
}
}),new objj_method(sel_getUid("add::"),function(_3c,_3d,to,_3e){
with(_3c){
if(_argc!=2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var _3f=objj_msgSend(_3e,"objectAtIndex:",0),_40=objj_msgSend(_3e,"objectAtIndex:",1);
return objj_msgSend(CPNumber,"numberWithDouble:",objj_msgSend(_3f,"doubleValue")+objj_msgSend(_40,"doubleValue"));
}
}),new objj_method(sel_getUid("from::"),function(_41,_42,_43,_44){
with(_41){
if(_argc!=2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var _45=objj_msgSend(_44,"objectAtIndex:",0),_46=objj_msgSend(_44,"objectAtIndex:",1);
return objj_msgSend(CPNumber,"numberWithDouble:",objj_msgSend(_45,"doubleValue")-objj_msgSend(_46,"doubleValue"));
}
}),new objj_method(sel_getUid("multiply::"),function(_47,_48,by,_49){
with(_47){
if(_argc!=2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var _4a=objj_msgSend(_49,"objectAtIndex:",0),_4b=objj_msgSend(_49,"objectAtIndex:",1);
return objj_msgSend(CPNumber,"numberWithDouble:",objj_msgSend(_4a,"doubleValue")*objj_msgSend(_4b,"doubleValue"));
}
}),new objj_method(sel_getUid("divide::"),function(_4c,_4d,by,_4e){
with(_4c){
if(_argc!=2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var _4f=objj_msgSend(_4e,"objectAtIndex:",0),_50=objj_msgSend(_4e,"objectAtIndex:",1);
return objj_msgSend(CPNumber,"numberWithDouble:",objj_msgSend(_4f,"doubleValue")/objj_msgSend(_50,"doubleValue"));
}
}),new objj_method(sel_getUid("sqrt:"),function(_51,_52,_53){
with(_51){
if(_argc!=1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var num=objj_msgSend(objj_msgSend(_53,"objectAtIndex:",0),"doubleValue");
return objj_msgSend(CPNumber,"numberWithDouble:",SQRT(num));
}
}),new objj_method(sel_getUid("raise::"),function(_54,_55,to,_56){
with(_54){
if(_argc<2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var num=objj_msgSend(objj_msgSend(_56,"objectAtIndex:",0),"doubleValue"),_57=objj_msgSend(objj_msgSend(_56,"objectAtIndex:",1),"doubleValue");
return objj_msgSend(CPNumber,"numberWithDouble:",POW(num,_57));
}
}),new objj_method(sel_getUid("abs:"),function(_58,_59,_5a){
with(_58){
if(_argc!=1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var num=objj_msgSend(objj_msgSend(_5a,"objectAtIndex:",0),"doubleValue");
return objj_msgSend(CPNumber,"numberWithDouble:",ABS(num));
}
}),new objj_method(sel_getUid("now"),function(_5b,_5c){
with(_5b){
return objj_msgSend(CPDate,"date");
}
}),new objj_method(sel_getUid("ln:"),function(_5d,_5e,_5f){
with(_5d){
if(_argc!=1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var num=objj_msgSend(objj_msgSend(_5f,"objectAtIndex:",0),"doubleValue");
return objj_msgSend(CPNumber,"numberWithDouble:",Math.log(num));
}
}),new objj_method(sel_getUid("exp:"),function(_60,_61,_62){
with(_60){
if(_argc!=1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var num=objj_msgSend(objj_msgSend(_62,"objectAtIndex:",0),"doubleValue");
return objj_msgSend(CPNumber,"numberWithDouble:",EXP(num));
}
}),new objj_method(sel_getUid("ceiling:"),function(_63,_64,_65){
with(_63){
if(_argc!=1){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var num=objj_msgSend(objj_msgSend(_65,"objectAtIndex:",0),"doubleValue");
return objj_msgSend(CPNumber,"numberWithDouble:",CEIL(num));
}
}),new objj_method(sel_getUid("random"),function(_66,_67){
with(_66){
return objj_msgSend(CPNumber,"numberWithDouble:",RAND());
}
}),new objj_method(sel_getUid("modulus::"),function(_68,_69,by,_6a){
with(_68){
if(_argc!=2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var _6b=objj_msgSend(_6a,"objectAtIndex:",0),_6c=objj_msgSend(_6a,"objectAtIndex:",1);
return objj_msgSend(CPNumber,"numberWithInt:",(objj_msgSend(_6b,"intValue")%objj_msgSend(_6c,"intValue")));
}
}),new objj_method(sel_getUid("first:"),function(_6d,_6e,_6f){
with(_6d){
if(_argc==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
return objj_msgSend(objj_msgSend(_6f,"objectAtIndex:",0),"objectAtIndex:",0);
}
}),new objj_method(sel_getUid("last:"),function(_70,_71,_72){
with(_70){
if(_argc==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
return objj_msgSend(objj_msgSend(_72,"objectAtIndex:",0),"lastObject");
}
}),new objj_method(sel_getUid("chs:"),function(_73,_74,_75){
with(_73){
if(_argc==0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
return objj_msgSend(CPNumber,"numberWithInt:",-objj_msgSend(objj_msgSend(_75,"objectAtIndex:",0),"intValue"));
}
}),new objj_method(sel_getUid("index:"),function(_76,_77,_78){
with(_76){
if(_argc<2){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid number of parameters");
}
var _79=objj_msgSend(_78,"objectAtIndex:",0),_7a=objj_msgSend(_78,"objectAtIndex:",1);
if(objj_msgSend(_79,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return objj_msgSend(_79,"objectForKey:",_7a);
}else{
return objj_msgSend(_79,"objectAtIndex:",objj_msgSend(_7a,"intValue"));
}
}
})]);
p;27;CPExpression_intersectset.jt;3032;@STATIC;1.0;i;14;CPExpression.jt;2994;
objj_executeFile("CPExpression.j",YES);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_intersectset"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_left"),new objj_ivar("_right")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithLeft:right:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_intersectset").super_class},"initWithExpressionType:",CPIntersectSetExpressionType);
_left=_5;
_right=_6;
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(_9,"decodeObjectForKey:","CPExpressionUnionSetLeftExpression");
var _b=objj_msgSend(_9,"decodeObjectForKey:","CPExpressionUnionSetRightExpression");
return objj_msgSend(_7,"initWithLeft:right:",_a,_b);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"encodeObject:forKey:",_left,"CPExpressionUnionSetLeftExpression");
objj_msgSend(_e,"encodeObject:forKey:",_right,"CPExpressionUnionSetRightExpression");
}
}),new objj_method(sel_getUid("isEqual:"),function(_f,_10,_11){
with(_f){
if(_f==_11){
return YES;
}
if(_11.isa!=_f.isa||objj_msgSend(_11,"expressionType")!=objj_msgSend(_f,"expressionType")||!objj_msgSend(objj_msgSend(_11,"leftExpression"),"isEqual:",objj_msgSend(_f,"leftExpression"))||!objj_msgSend(objj_msgSend(_11,"rightExpression"),"isEqual:",objj_msgSend(_f,"rightExpression"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_12,_13,_14,_15){
with(_12){
var _16=objj_msgSend(_right,"expressionValueWithObject:context:",_14,_15);
if(!objj_msgSend(_16,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right expression for a CPIntersectSetExpressionType expression must be either a CPArray, CPDictionary or CPSet");
}
var _17=objj_msgSend(_left,"expressionValueWithObject:context:",_14,_15);
if(!objj_msgSend(_17,"isKindOfClass:",objj_msgSend(CPSet,"set"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left expression for a CPIntersectSetExpressionType expression must a CPSet");
}
var set=objj_msgSend(CPSet,"setWithSet:",_17),e=objj_msgSend(_16,"objectEnumerator"),_18;
while(_18=objj_msgSend(e,"nextObject")){
if(objj_msgSend(_17,"containsObject:",_18)){
objj_msgSend(set,"addObject:",_18);
}
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",set);
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_19,_1a,_1b){
with(_19){
return _19;
}
}),new objj_method(sel_getUid("leftExpression"),function(_1c,_1d){
with(_1c){
return _left;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1e,_1f){
with(_1e){
return _right;
}
}),new objj_method(sel_getUid("description"),function(_20,_21){
with(_20){
return objj_msgSend(_left,"description")+" INTERSECT "+objj_msgSend(_right,"description");
}
})]);
p;22;CPExpression_keypath.jt;1788;@STATIC;1.0;i;14;CPExpression.jI;21;Foundation/CPString.jI;29;Foundation/CPKeyValueCoding.jt;1690;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPKeyValueCoding.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_keypath"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyPath")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_keypath").super_class},"initWithExpressionType:",CPKeyPathExpressionType);
_keyPath=_5;
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_8,"decodeObjectForKey:","CPExpressionKeyPath");
return objj_msgSend(_6,"initWithKeyPath:",_9);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_c,"encodeObject:forKey:",_keyPath,"CPExpressionKeyPath");
}
}),new objj_method(sel_getUid("isEqual:"),function(_d,_e,_f){
with(_d){
if(_d==_f){
return YES;
}
if(_f.isa!=_d.isa||objj_msgSend(_f,"expressionType")!=objj_msgSend(_d,"expressionType")||!objj_msgSend(objj_msgSend(_f,"keyPath"),"isEqualToString:",objj_msgSend(_d,"keyPath"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("keyPath"),function(_10,_11){
with(_10){
return _keyPath;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_12,_13,_14,_15){
with(_12){
return objj_msgSend(_14,"valueForKeyPath:",_keyPath);
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_16,_17,_18){
with(_16){
return _16;
}
}),new objj_method(sel_getUid("description"),function(_19,_1a){
with(_19){
return _keyPath;
}
})]);
p;23;CPExpression_minusset.jt;2903;@STATIC;1.0;i;14;CPExpression.jt;2865;
objj_executeFile("CPExpression.j",YES);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_minusset"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithLeft:right:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_minusset").super_class},"initWithExpressionType:",CPMinusSetExpressionType);
_left=_5;
_right=_6;
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(_9,"decodeObjectForKey:","CPExpressionMinusSetLeftExpression");
var _b=objj_msgSend(_9,"decodeObjectForKey:","CPExpressionMinusSetRightExpression");
return objj_msgSend(_7,"initWithLeft:right:",_a,_b);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"encodeObject:forKey:",_left,"CPExpressionMinusSetLeftExpression");
objj_msgSend(_e,"encodeObject:forKey:",_right,"CPExpressionMinusSetRightExpression");
}
}),new objj_method(sel_getUid("isEqual:"),function(_f,_10,_11){
with(_f){
if(_f==_11){
return YES;
}
if(_11.isa!=_f.isa||objj_msgSend(_11,"expressionType")!=objj_msgSend(_f,"expressionType")||!objj_msgSend(objj_msgSend(_11,"leftExpression"),"isEqual:",objj_msgSend(_f,"leftExpression"))||!objj_msgSend(objj_msgSend(_11,"rightExpression"),"isEqual:",objj_msgSend(_f,"rightExpression"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_12,_13,_14,_15){
with(_12){
var _16=objj_msgSend(_right,"expressionValueWithObject:context:",_14,_15);
if(!objj_msgSend(_16,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right expression for a CPIntersectSetExpressionType expression must be either a CPArray, CPDictionary or CPSet");
}
var _17=objj_msgSend(_left,"expressionValueWithObject:context:",_14,_15);
if(!objj_msgSend(_17,"isKindOfClass:",objj_msgSend(CPSet,"set"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left expression for a CPIntersectSetExpressionType expression must a CPSet");
}
var set=objj_msgSend(CPSet,"setWithSet:",_17),e=objj_msgSend(_16,"objectEnumerator"),_18;
while(_18=objj_msgSend(e,"nextObject")){
objj_msgSend(set,"removeObject:",_18);
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",set);
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_19,_1a,_1b){
with(_19){
return _19;
}
}),new objj_method(sel_getUid("leftExpression"),function(_1c,_1d){
with(_1c){
return _left;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1e,_1f){
with(_1e){
return _right;
}
}),new objj_method(sel_getUid("description"),function(_20,_21){
with(_20){
return objj_msgSend(_left,"description")+" MINUS "+objj_msgSend(_right,"description");
}
})]);
p;23;CPExpression_operator.jt;4015;@STATIC;1.0;i;14;CPExpression.jI;20;Foundation/CPArray.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jt;3896;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
var _1="CPExpressionOperatorNegate";
var _2="CPExpressionOperatorAdd";
var _3="CPExpressionOperatorSubtract";
var _4="CPExpressionOperatorMultiply";
var _5="CPExpressionOperatorDivide";
var _6="CPExpressionOperatorExp";
var _7="CPExpressionOperatorAssign";
var _8="CPExpressionOperatorKeypath";
var _9="CPExpressionOperatorIndex";
var _a="CPExpressionOperatorIndexFirst";
var _b="CPExpressionOperatorIndexLast";
var _c="CPExpressionOperatorIndexSize";
var _d=objj_allocateClassPair(CPExpression,"CPExpression_operator"),_e=_d.isa;
class_addIvars(_d,[new objj_ivar("_operator"),new objj_ivar("_arguments")]);
objj_registerClassPair(_d);
class_addMethods(_d,[new objj_method(sel_getUid("initWithOperator:arguments:"),function(_f,_10,_11,_12){
with(_f){
_operator=_11;
_arguments=_12;
return _f;
}
}),new objj_method(sel_getUid("arguments"),function(_13,_14){
with(_13){
return _arguments;
}
}),new objj_method(sel_getUid("description"),function(_15,_16){
with(_15){
var _17=objj_msgSend(CPString,"string"),_18=objj_msgSend(CPArray,"array"),_19=objj_msgSend(_arguments,"count"),i;
for(i=0;i<_19;i++){
var _1a=objj_msgSend(_arguments,"objectAtIndex:",i),_1b=objj_msgSend(_1a,"description");
if(objj_msgSend(_1a,"isKindOfClass:",objj_msgSend(CPExpression_operator,"class"))){
_1b=objj_msgSend(CPString,"stringWithFormat:","(%@)",_1b);
}
objj_msgSend(_18,"addObject:",_1b);
}
switch(_operator){
case _1:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","-%@",objj_msgSend(_18,"objectAtIndex:",0));
break;
case _2:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@ + %@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _3:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@ - %@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _4:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@ * %@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _5:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@ / %@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _6:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@ ** %@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _7:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@ := %@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _8:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@.%@",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _9:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@[%@]",objj_msgSend(_18,"objectAtIndex:",0),objj_msgSend(_18,"objectAtIndex:",1));
break;
case _a:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@[FIRST]",objj_msgSend(_18,"objectAtIndex:",0));
break;
case _b:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@[LAST]",objj_msgSend(_18,"objectAtIndex:",0));
break;
case _c:
_17=_17+objj_msgSend(CPString,"stringWithFormat:","%@[SIZE]",objj_msgSend(_18,"objectAtIndex:",0));
break;
}
return _17;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(CPArray,"array"),_20=objj_msgSend(_arguments,"count"),i;
for(i=0;i<_20;i++){
objj_msgSend(_1f,"addObject:",objj_msgSend(objj_msgSend(_arguments,"objectAtIndex:",i),"_expressionWithSubstitutionVariables:",_1e));
}
return objj_msgSend(CPExpression_operator,"expressionForOperator:arguments:",_operator,_1f);
}
})]);
class_addMethods(_e,[new objj_method(sel_getUid("expressionForOperator:arguments:"),function(_21,_22,_23,_24){
with(_21){
return objj_msgSend(_21,"initWithOperator:arguments:",_23,_24);
}
})]);
p;19;CPExpression_self.jt;1270;@STATIC;1.0;i;14;CPExpression.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jI;20;Foundation/CPCoder.jt;1151;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPCoder.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_self"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_self").super_class},"initWithExpressionType:",CPEvaluatedObjectExpressionType);
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"init");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8,_9,_a){
with(_8){
}
}),new objj_method(sel_getUid("isEqual:"),function(_b,_c,_d){
with(_b){
return (_d==_b);
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_e,_f,_10,_11){
with(_e){
return _10;
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_12,_13,_14){
with(_12){
return _12;
}
}),new objj_method(sel_getUid("description"),function(_15,_16){
with(_15){
return "SELF";
}
})]);
p;23;CPExpression_unionset.jt;2895;@STATIC;1.0;i;14;CPExpression.jt;2857;
objj_executeFile("CPExpression.j",YES);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_unionset"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithLeft:right:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_unionset").super_class},"initWithExpressionType:",CPUnionSetExpressionType);
_left=_5;
_right=_6;
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(_9,"decodeObjectForKey:","CPExpressionUnionSetLeftExpression"),_b=objj_msgSend(_9,"decodeObjectForKey:","CPExpressionUnionSetRightExpression");
return objj_msgSend(_7,"initWithLeft:right:",_a,_b);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"encodeObject:forKey:",_left,"CPExpressionUnionSetLeftExpression");
objj_msgSend(_e,"encodeObject:forKey:",_right,"CPExpressionUnionSetRightExpression");
}
}),new objj_method(sel_getUid("isEqual:"),function(_f,_10,_11){
with(_f){
if(_f==_11){
return YES;
}
if(_11.isa!=_f.isa||objj_msgSend(_11,"expressionType")!=objj_msgSend(_f,"expressionType")||!objj_msgSend(objj_msgSend(_11,"leftExpression"),"isEqual:",objj_msgSend(_f,"leftExpression"))||!objj_msgSend(objj_msgSend(_11,"rightExpression"),"isEqual:",objj_msgSend(_f,"rightExpression"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_12,_13,_14,_15){
with(_12){
var _16=objj_msgSend(_right,"expressionValueWithObject:context:",_14,_15);
if(!objj_msgSend(_16,"respondsToSelector:",sel_getUid("objectEnumerator"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The right expression for a CPIntersectSetExpressionType expression must be either a CPArray, CPDictionary or CPSet");
}
var _17=objj_msgSend(_left,"expressionValueWithObject:context:",_14,_15);
if(!objj_msgSend(_17,"isKindOfClass:",objj_msgSend(CPSet,"set"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The left expression for a CPIntersectSetExpressionType expression must a CPSet");
}
var _18=objj_msgSend(CPSet,"setWithSet:",_17),e=objj_msgSend(_16,"objectEnumerator"),_19;
while(_19=objj_msgSend(e,"nextObject")){
objj_msgSend(_18,"addObject:",_19);
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",_18);
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_1a,_1b,_1c){
with(_1a){
return _1a;
}
}),new objj_method(sel_getUid("leftExpression"),function(_1d,_1e){
with(_1d){
return _left;
}
}),new objj_method(sel_getUid("rightExpression"),function(_1f,_20){
with(_1f){
return _right;
}
}),new objj_method(sel_getUid("description"),function(_21,_22){
with(_21){
return objj_msgSend(_left,"description")+" UNION "+objj_msgSend(_right,"description");
}
})]);
p;23;CPExpression_variable.jt;2001;@STATIC;1.0;i;14;CPExpression.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jt;1907;
objj_executeFile("CPExpression.j",YES);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
var _1=objj_allocateClassPair(CPExpression,"CPExpression_variable"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_variable")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithVariable:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPExpression_variable").super_class},"initWithExpressionType:",CPVariableExpressionType);
_variable=objj_msgSend(_5,"copy");
return _3;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_8,"decodeObjectForKey:","CPExpressionVariable");
return objj_msgSend(_6,"initWithVariable:",_9);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_c,"encodeObject:forKey:",_variable,"CPExpressionVariable");
}
}),new objj_method(sel_getUid("isEqual:"),function(_d,_e,_f){
with(_d){
if(_d==_f){
return YES;
}
if(_f.isa!=_d.isa||objj_msgSend(_f,"expressionType")!=objj_msgSend(_d,"expressionType")||!objj_msgSend(objj_msgSend(_f,"variable"),"isEqualToString:",objj_msgSend(_d,"variable"))){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("variable"),function(_10,_11){
with(_10){
return _variable;
}
}),new objj_method(sel_getUid("expressionValueWithObject:context:"),function(_12,_13,_14,_15){
with(_12){
return objj_msgSend(_15,"objectForKey:",_variable);
}
}),new objj_method(sel_getUid("description"),function(_16,_17){
with(_16){
return objj_msgSend(CPString,"stringWithFormat:","$%s",_variable);
}
}),new objj_method(sel_getUid("_expressionWithSubstitutionVariables:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(_1a,"objectForKey:",_variable);
if(_1b!=nil){
return objj_msgSend(CPExpression,"expressionForConstantValue:",_1b);
}
return _18;
}
})]);
p;13;CPPredicate.jt;24096;@STATIC;1.0;I;20;Foundation/CPValue.jI;20;Foundation/CPArray.jI;18;Foundation/CPSet.jI;19;Foundation/CPNull.jI;22;Foundation/CPScanner.ji;21;CPCompoundPredicate.ji;23;CPComparisonPredicate.ji;14;CPExpression.ji;23;CPExpression_operator.ji;24;CPExpression_aggregate.ji;25;CPExpression_assignment.jt;23792;
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPSet.j",NO);
objj_executeFile("Foundation/CPNull.j",NO);
objj_executeFile("Foundation/CPScanner.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPPredicate"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("predicateWithSubstitutionVariables:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("evaluateWithObject:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("evaluateWithObject:substitutionVariables:"),function(_9,_a,_b,_c){
with(_9){
}
}),new objj_method(sel_getUid("predicateFormat"),function(_d,_e){
with(_d){
}
}),new objj_method(sel_getUid("description"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"predicateFormat");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("predicateWithFormat:"),function(_11,_12,_13){
with(_11){
if(!_13){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_12+" the format can't be 'nil'");
}
var _14=Array.prototype.slice.call(arguments,3);
return objj_msgSend(_11,"predicateWithFormat:argumentArray:",arguments[2],_14);
}
}),new objj_method(sel_getUid("predicateWithFormat:argumentArray:"),function(_15,_16,_17,_18){
with(_15){
if(!_17){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,_16+" the format can't be 'nil'");
}
var s=objj_msgSend(objj_msgSend(CPPredicateScanner,"alloc"),"initWithString:args:",_17,_18),p=objj_msgSend(s,"parse");
return p;
}
}),new objj_method(sel_getUid("predicateWithFormat:arguments:"),function(_19,_1a,_1b,_1c){
with(_19){
return nil;
}
}),new objj_method(sel_getUid("predicateWithValue:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(objj_msgSend(CPPredicate_BOOL,"alloc"),"initWithBool:",_1f);
}
})]);
var _1=objj_allocateClassPair(CPPredicate,"CPPredicate_BOOL"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_value")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithBool:"),function(_20,_21,_22){
with(_20){
_value=_22;
return _20;
}
}),new objj_method(sel_getUid("evaluateObject:"),function(_23,_24,_25){
with(_23){
return _value;
}
}),new objj_method(sel_getUid("predicateFormat"),function(_26,_27){
with(_26){
return (_value)?"TRUEPREDICATE":"FALSEPREDICATE";
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPArray\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("filteredArrayUsingPredicate:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"count"),_2c=objj_msgSend(CPArray,"array"),i;
for(i=0;i<_2b;i++){
var _2d=_28[i];
if(objj_msgSend(_2a,"evaluateWithObject:",_2d)){
_2c.push(_2d);
}
}
return _2c;
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"count");
while(_31--){
if(!objj_msgSend(_30,"evaluateWithObject:",_2e[_31])){
splice(_31,1);
}
}
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPSet\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("filteredSetUsingPredicate:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"count"),_36=objj_msgSend(CPSet,"set"),i;
for(i=0;i<_35;i++){
var _37=objj_msgSend(_32,"objectAtIndex:",i);
if(objj_msgSend(_34,"evaluateWithObject:",_37)){
objj_msgSend(_36,"addObject:",_37);
}
}
return _36;
}
}),new objj_method(sel_getUid("filterUsingPredicate:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(_38,"count");
while(--_3b>=0){
var _3c=objj_msgSend(_38,"objectAtIndex:",_3b);
if(!objj_msgSend(_3a,"evaluateWithObject:",_3c)){
objj_msgSend(_38,"removeObjectAtIndex:",_3b);
}
}
}
})]);
var _1=objj_allocateClassPair(CPScanner,"CPPredicateScanner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_args"),new objj_ivar("_retrieved")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithString:args:"),function(_3d,_3e,_3f,_40){
with(_3d){
_3d=objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPPredicateScanner").super_class},"initWithString:",_3f);
if(_3d!=nil){
_args=objj_msgSend(_40,"objectEnumerator");
}
return _3d;
}
}),new objj_method(sel_getUid("nextArg"),function(_41,_42){
with(_41){
return objj_msgSend(_args,"nextObject");
}
}),new objj_method(sel_getUid("scanPredicateKeyword:"),function(_43,_44,key){
with(_43){
var loc=objj_msgSend(_43,"scanLocation");
var c;
objj_msgSend(_43,"setCaseSensitive:",NO);
if(!objj_msgSend(_43,"scanString:intoString:",key,NULL)){
return NO;
}
if(objj_msgSend(_43,"isAtEnd")){
return YES;
}
c=objj_msgSend(objj_msgSend(_43,"string"),"characterAtIndex:",objj_msgSend(_43,"scanLocation"));
if(!objj_msgSend(objj_msgSend(CPCharacterSet,"alphanumericCharacterSet"),"characterIsMember:",c)){
return YES;
}
objj_msgSend(_43,"setScanLocation:",loc);
return NO;
}
}),new objj_method(sel_getUid("parse"),function(_45,_46){
with(_45){
var r=nil;
try{
objj_msgSend(_45,"setCharactersToBeSkipped:",objj_msgSend(CPCharacterSet,"whitespaceCharacterSet"));
r=objj_msgSend(_45,"parsePredicate");
}
catch(error){
CPLogConsole("Parsing failed for "+objj_msgSend(_45,"string")+" with "+error);
}
finally{
if(!objj_msgSend(_45,"isAtEnd")){
CPLogConsole("Format string contains extra characters: \""+objj_msgSend(_45,"string")+"\"");
}
}
return r;
}
}),new objj_method(sel_getUid("parsePredicate"),function(_47,_48){
with(_47){
return objj_msgSend(_47,"parseAnd");
}
}),new objj_method(sel_getUid("parseAnd"),function(_49,_4a){
with(_49){
var l=objj_msgSend(_49,"parseOr");
while(objj_msgSend(_49,"scanPredicateKeyword:","AND")||objj_msgSend(_49,"scanPredicateKeyword:","&&")){
var r=objj_msgSend(_49,"parseOr");
if(objj_msgSend(r,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(r,"compoundPredicateType")==CPAndPredicateType){
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPAndPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObjectsFromArray:",objj_msgSend(r,"subpredicates"));
}else{
objj_msgSend(objj_msgSend(r,"subpredicates"),"insertObject:atIndex:",l,0);
l=r;
}
}else{
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPAndPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObject:",r);
}else{
l=objj_msgSend(CPCompoundPredicate,"andPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",l,r));
}
}
}
return l;
}
}),new objj_method(sel_getUid("parseNot"),function(_4b,_4c){
with(_4b){
if(objj_msgSend(_4b,"scanString:intoString:","(",NULL)){
var r=objj_msgSend(_4b,"parsePredicate");
if(!objj_msgSend(_4b,"scanString:intoString:",")",NULL)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Missing ) in compound predicate");
}
return r;
}
if(objj_msgSend(_4b,"scanPredicateKeyword:","NOT")||objj_msgSend(_4b,"scanPredicateKeyword:","!")){
return objj_msgSend(CPCompoundPredicate,"notPredicateWithSubpredicate:",objj_msgSend(_4b,"parseNot"));
}
if(objj_msgSend(_4b,"scanPredicateKeyword:","TRUEPREDICATE")){
return objj_msgSend(CPPredicate,"predicateWithValue:",YES);
}
if(objj_msgSend(_4b,"scanPredicateKeyword:","FALSEPREDICATE")){
return objj_msgSend(CPPredicate,"predicateWithValue:",NO);
}
return objj_msgSend(_4b,"parseComparison");
}
}),new objj_method(sel_getUid("parseOr"),function(_4d,_4e){
with(_4d){
var l=objj_msgSend(_4d,"parseNot");
while(objj_msgSend(_4d,"scanPredicateKeyword:","OR")||objj_msgSend(_4d,"scanPredicateKeyword:","||")){
var r=objj_msgSend(_4d,"parseNot");
if(objj_msgSend(r,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(r,"compoundPredicateType")==CPOrPredicateType){
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPOrPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObjectsFromArray:",objj_msgSend(r,"subpredicates"));
}else{
objj_msgSend(objj_msgSend(r,"subpredicates"),"insertObject:atIndex:",l,0);
l=r;
}
}else{
if(objj_msgSend(l,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))&&objj_msgSend(l,"compoundPredicateType")==CPOrPredicateType){
objj_msgSend(objj_msgSend(l,"subpredicates"),"addObject:",r);
}else{
l=objj_msgSend(CPCompoundPredicate,"orPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",l,r));
}
}
}
return l;
}
}),new objj_method(sel_getUid("parseComparison"),function(_4f,_50){
with(_4f){
var _51=CPDirectPredicateModifier,_52=0,_53=0,_54,_55,p,_56=NO,_57=NO;
if(objj_msgSend(_4f,"scanPredicateKeyword:","ANY")){
_51=CPAnyPredicateModifier;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","ALL")){
_51=CPAllPredicateModifier;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","NONE")){
_51=CPAnyPredicateModifier;
_56=YES;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","SOME")){
_51=CPAllPredicateModifier;
_56=YES;
}
}
}
}
_54=objj_msgSend(_4f,"parseExpression");
if(objj_msgSend(_4f,"scanString:intoString:","!=",NULL)||objj_msgSend(_4f,"scanString:intoString:","<>",NULL)){
_52=CPNotEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanString:intoString:","<=",NULL)||objj_msgSend(_4f,"scanString:intoString:","=<",NULL)){
_52=CPLessThanOrEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanString:intoString:",">=",NULL)||objj_msgSend(_4f,"scanString:intoString:","=>",NULL)){
_52=CPGreaterThanOrEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanString:intoString:","<",NULL)){
_52=CPLessThanPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanString:intoString:",">",NULL)){
_52=CPGreaterThanPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanString:intoString:","==",NULL)||objj_msgSend(_4f,"scanString:intoString:","=",NULL)){
_52=CPEqualToPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","MATCHES")){
_52=CPMatchesPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","LIKE")){
_52=CPLikePredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","BEGINSWITH")){
_52=CPBeginsWithPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","ENDSWITH")){
_52=CPEndsWithPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","IN")){
_52=CPInPredicateOperatorType;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","CONTAINS")){
_52=CPInPredicateOperatorType;
_57=YES;
}else{
if(objj_msgSend(_4f,"scanPredicateKeyword:","BETWEEN")){
var exp=objj_msgSend(_4f,"parseSimpleExpression"),a=objj_msgSend(exp,"constantValue"),_58,_59,_5a,_5b,lp,up;
if(!objj_msgSend(a,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"BETWEEN operator requires array argument");
}
_58=objj_msgSend(a,"objectAtIndex:",0);
_59=objj_msgSend(a,"objectAtIndex:",1);
_5a=objj_msgSend(CPExpression,"expressionForConstantValue:",_58);
_5b=objj_msgSend(CPExpression,"expressionForConstantValue:",_59);
lp=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_54,_5a,_51,CPGreaterThanPredicateOperatorType,_53);
up=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_54,_5b,_51,CPLessThanPredicateOperatorType,_53);
return objj_msgSend(CPCompoundPredicate,"andPredicateWithSubpredicates:",objj_msgSend(CPArray,"arrayWithObjects:",lp,up));
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid comparison predicate: "+objj_msgSend(objj_msgSend(_4f,"string"),"substringFromIndex:",objj_msgSend(_4f,"scanLocation")));
}
}
}
}
}
}
}
}
}
}
}
}
}
if(objj_msgSend(_4f,"scanString:intoString:","[cd]",NULL)){
_53=CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption;
}else{
if(objj_msgSend(_4f,"scanString:intoString:","[c]",NULL)){
_53=CPCaseInsensitivePredicateOption;
}else{
if(objj_msgSend(_4f,"scanString:intoString:","[d]",NULL)){
_53=CPDiacriticInsensitivePredicateOption;
}
}
}
_55=objj_msgSend(_4f,"parseExpression");
if(_57==YES){
var tmp=_54;
_54=_55;
_55=tmp;
}
p=objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",_54,_55,_51,_52,_53);
return _56?objj_msgSend(CPCompoundPredicate,"notPredicateWithSubpredicate:",p):p;
}
}),new objj_method(sel_getUid("parseExpression"),function(_5c,_5d){
with(_5c){
return objj_msgSend(_5c,"parseBinaryExpression");
}
}),new objj_method(sel_getUid("parseSimpleExpression"),function(_5e,_5f){
with(_5e){
var _60,_61,_62,dbl;
if(objj_msgSend(_5e,"scanDouble:",function(_63){
var _64=dbl;
if(typeof _63!="undefined"){
dbl=_63;
}
return _64;
})){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithDouble:",dbl));
}
if(objj_msgSend(_5e,"scanString:intoString:","-",NULL)){
return objj_msgSend(CPExpression,"expressionForFunction:arguments:","chs",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_5e,"parseExpression")));
}
if(objj_msgSend(_5e,"scanString:intoString:","(",NULL)){
var arg=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(_5e,"scanString:intoString:",")",NULL)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Missing ) in expression");
}
return arg;
}
if(objj_msgSend(_5e,"scanString:intoString:","{",NULL)){
var a=objj_msgSend(CPMutableArray,"arrayWithCapacity:",10);
if(objj_msgSend(_5e,"scanString:intoString:","}",NULL)){
return objj_msgSend(CPExpression,"expressionForConstantValue:",a);
}
objj_msgSend(a,"addObject:",objj_msgSend(_5e,"parseExpression"));
while(objj_msgSend(_5e,"scanString:intoString:",",",NULL)){
objj_msgSend(a,"addObject:",objj_msgSend(_5e,"parseExpression"));
}
if(!objj_msgSend(_5e,"scanString:intoString:","}",NULL)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Missing } in aggregate");
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",a);
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","NULL")||objj_msgSend(_5e,"scanPredicateKeyword:","NIL")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNull,"null"));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","TRUE")||objj_msgSend(_5e,"scanPredicateKeyword:","YES")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithBool:",YES));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","FALSE")||objj_msgSend(_5e,"scanPredicateKeyword:","NO")){
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(CPNumber,"numberWithBool:",NO));
}
if(objj_msgSend(_5e,"scanPredicateKeyword:","SELF")){
return objj_msgSend(CPExpression,"expressionForEvaluatedObject");
}
if(objj_msgSend(_5e,"scanString:intoString:","$",NULL)){
var _65=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(_65,"keyPath")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid variable identifier: "+_65);
}
return objj_msgSend(CPExpression,"expressionForVariable:",objj_msgSend(_65,"keyPath"));
}
_61=objj_msgSend(_5e,"scanLocation");
if(objj_msgSend(_5e,"scanString:intoString:","%",NULL)){
if(objj_msgSend(_5e,"isAtEnd")==NO){
var c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
switch(c){
case "%":
_61=objj_msgSend(_5e,"scanLocation");
break;
case "K":
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_5e,"nextArg"));
case "@":
case "c":
case "C":
case "d":
case "D":
case "i":
case "o":
case "O":
case "u":
case "U":
case "x":
case "X":
case "e":
case "E":
case "f":
case "g":
case "G":
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
case "h":
objj_msgSend(_5e,"scanString:intoString:","h",NULL);
if(objj_msgSend(_5e,"isAtEnd")==NO){
c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
if(c=="i"||c=="u"){
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
}
}
break;
case "q":
objj_msgSend(_5e,"scanString:intoString:","q",NULL);
if(objj_msgSend(_5e,"isAtEnd")==NO){
c=objj_msgSend(objj_msgSend(_5e,"string"),"characterAtIndex:",objj_msgSend(_5e,"scanLocation"));
if(c=="i"||c=="u"||c=="x"||c=="X"){
objj_msgSend(_5e,"setScanLocation:",objj_msgSend(_5e,"scanLocation")+1);
return objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_5e,"nextArg"));
}
}
break;
}
}
objj_msgSend(_5e,"setScanLocation:",_61);
}
if(objj_msgSend(_5e,"scanString:intoString:","\"",NULL)){
var _66=objj_msgSend(_5e,"charactersToBeSkipped"),str;
objj_msgSend(_5e,"setCharactersToBeSkipped:",nil);
if(objj_msgSend(_5e,"scanUpToString:intoString:","\"",function(_67){
var _68=str;
if(typeof _67!="undefined"){
str=_67;
}
return _68;
})==NO){
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid double quoted literal at "+_61);
}
objj_msgSend(_5e,"scanString:intoString:","\"",NULL);
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
return objj_msgSend(CPExpression,"expressionForConstantValue:",str);
}
if(objj_msgSend(_5e,"scanString:intoString:","'",NULL)){
var _66=objj_msgSend(_5e,"charactersToBeSkipped"),str;
objj_msgSend(_5e,"setCharactersToBeSkipped:",nil);
if(objj_msgSend(_5e,"scanUpToString:intoString:","'",function(_69){
var _6a=str;
if(typeof _69!="undefined"){
str=_69;
}
return _6a;
})==NO){
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid single quoted literal at "+_61);
}
objj_msgSend(_5e,"scanString:intoString:","'",NULL);
objj_msgSend(_5e,"setCharactersToBeSkipped:",_66);
return objj_msgSend(CPExpression,"expressionForConstantValue:",str);
}
if(objj_msgSend(_5e,"scanString:intoString:","@",NULL)){
var e=objj_msgSend(_5e,"parseExpression");
if(!objj_msgSend(e,"keyPath")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid keypath identifier: "+e);
}
return objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(e,"keyPath")+"@");
}
objj_msgSend(_5e,"scanString:intoString:","#",NULL);
if(!_60){
_60=objj_msgSend(CPCharacterSet,"characterSetWithCharactersInString:","_$abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
}
if(!objj_msgSend(_5e,"scanCharactersFromSet:intoString:",_60,function(_6b){
var _6c=_62;
if(typeof _6b!="undefined"){
_62=_6b;
}
return _6c;
})){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Missing identifier: "+objj_msgSend(objj_msgSend(_5e,"string"),"substringFromIndex:",objj_msgSend(_5e,"scanLocation")));
}
return objj_msgSend(CPExpression,"expressionForKeyPath:",_62);
}
}),new objj_method(sel_getUid("parseFunctionalExpression"),function(_6d,_6e){
with(_6d){
var _6f=objj_msgSend(_6d,"parseSimpleExpression");
while(YES){
if(objj_msgSend(_6d,"scanString:intoString:","(",NULL)){
var _70=objj_msgSend(CPMutableArray,"arrayWithCapacity:",5);
if(!objj_msgSend(_6f,"keyPath")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid function identifier: "+_6f);
}
if(!objj_msgSend(_6d,"scanString:intoString:",")",NULL)){
objj_msgSend(_70,"addObject:",objj_msgSend(_6d,"parseExpression"));
while(objj_msgSend(_6d,"scanString:intoString:",",",NULL)){
objj_msgSend(_70,"addObject:",objj_msgSend(_6d,"parseExpression"));
}
if(!objj_msgSend(_6d,"scanString:intoString:",")",NULL)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Missing ) in function arguments");
}
}
_6f=objj_msgSend(CPExpression,"expressionForFunction:arguments:",objj_msgSend(_6f,"keyPath"),_70);
}else{
if(objj_msgSend(_6d,"scanString:intoString:","[",NULL)){
if(objj_msgSend(_6d,"scanPredicateKeyword:","FIRST")){
_6f=objj_msgSend(CPExpression,"expressionForFunction:arguments:","first",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_6d,"parseExpression")));
}else{
if(objj_msgSend(_6d,"scanPredicateKeyword:","LAST")){
_6f=objj_msgSend(CPExpression,"expressionForFunction:arguments:","last",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_6d,"parseExpression")));
}else{
if(objj_msgSend(_6d,"scanPredicateKeyword:","SIZE")){
_6f=objj_msgSend(CPExpression,"expressionForFunction:arguments:","count",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_6d,"parseExpression")));
}else{
_6f=objj_msgSend(CPExpression,"expressionForFunction:arguments:","index",objj_msgSend(CPArray,"arrayWithObjects:",_6f,objj_msgSend(_6d,"parseExpression")));
}
}
}
if(!objj_msgSend(_6d,"scanString:intoString:","]",NULL)){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Missing ] in index argument");
}
}else{
if(objj_msgSend(_6d,"scanString:intoString:",".",NULL)){
if(!objj_msgSend(_6f,"keyPath")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid left keypath:"+_6f);
}
var _71=objj_msgSend(_6d,"parseExpression");
if(!objj_msgSend(_71,"keyPath")){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid right keypath:"+_71);
}
_6f=objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_6f,"keyPath")+"."+objj_msgSend(_71,"keyPath"));
}else{
return _6f;
}
}
}
}
}
}),new objj_method(sel_getUid("parsePowerExpression"),function(_72,_73){
with(_72){
var _74=objj_msgSend(_72,"parseFunctionalExpression");
while(YES){
var _75;
if(objj_msgSend(_72,"scanString:intoString:","**",NULL)){
_75=objj_msgSend(_72,"parseFunctionalExpression");
_74=objj_msgSend(CPExpression,"expressionForFunction:arguments:","pow",objj_msgSend(CPArray,"arrayWithObjects:",_74,_75));
}else{
return _74;
}
}
}
}),new objj_method(sel_getUid("parseMultiplicationExpression"),function(_76,_77){
with(_76){
var _78=objj_msgSend(_76,"parsePowerExpression");
while(YES){
var _79;
if(objj_msgSend(_76,"scanString:intoString:","*",NULL)){
_79=objj_msgSend(_76,"parsePowerExpression");
_78=objj_msgSend(CPExpression,"expressionForFunction:arguments:","_mul",objj_msgSend(CPArray,"arrayWithObjects:",_78,_79));
}else{
if(objj_msgSend(_76,"scanString:intoString:","/",NULL)){
_79=objj_msgSend(_76,"parsePowerExpression");
_78=objj_msgSend(CPExpression,"expressionForFunction:arguments:","_div",objj_msgSend(CPArray,"arrayWithObjects:",_78,_79));
}else{
return _78;
}
}
}
}
}),new objj_method(sel_getUid("parseAdditionExpression"),function(_7a,_7b){
with(_7a){
var _7c=objj_msgSend(_7a,"parseMultiplicationExpression");
while(YES){
var _7d;
if(objj_msgSend(_7a,"scanString:intoString:","+",NULL)){
_7d=objj_msgSend(_7a,"parseMultiplicationExpression");
_7c=objj_msgSend(CPExpression,"expressionForFunction:arguments:","_add",objj_msgSend(CPArray,"arrayWithObjects:",_7c,_7d));
}else{
if(objj_msgSend(_7a,"scanString:intoString:","-",NULL)){
_7d=objj_msgSend(_7a,"parseMultiplicationExpression");
_7c=objj_msgSend(CPExpression,"expressionForFunction:arguments:","_sub",objj_msgSend(CPArray,"arrayWithObjects:",_7c,_7d));
}else{
return _7c;
}
}
}
}
}),new objj_method(sel_getUid("parseBinaryExpression"),function(_7e,_7f){
with(_7e){
var _80=objj_msgSend(_7e,"parseAdditionExpression");
while(YES){
var _81;
if(objj_msgSend(_7e,"scanString:intoString:",":=",NULL)){
_81=objj_msgSend(_7e,"parseAdditionExpression");
}else{
return _80;
}
}
}
})]);
objj_executeFile("CPCompoundPredicate.j",YES);
objj_executeFile("CPComparisonPredicate.j",YES);
objj_executeFile("CPExpression.j",YES);
objj_executeFile("CPExpression_operator.j",YES);
objj_executeFile("CPExpression_aggregate.j",YES);
objj_executeFile("CPExpression_assignment.j",YES);
e;