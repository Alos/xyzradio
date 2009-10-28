@STATIC;1.0;p;31;_CPBorderlessBridgeWindowView.ji;15;_CPWindowView.jc;1901;
var _1=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPBorderlessBridgeWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_toolbarBackgroundView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("tile"),function(_4,_5){
with(_4){
objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPWindowView")},"tile");
var _6=objj_msgSend(_4,"window"),_7=objj_msgSend(_4,"bounds");
objj_msgSend(objj_msgSend(_6,"contentView"),"setFrame:",CGRectMake(0,objj_msgSend(_4,"toolbarMaxY"),CGRectGetWidth(_7),CGRectGetHeight(_7)-objj_msgSend(_4,"toolbarMaxY")));
if(!objj_msgSend(objj_msgSend(_6,"toolbar"),"isVisible")){
objj_msgSend(_toolbarBackgroundView,"removeFromSuperview");
_toolbarBackgroundView=nil;
return;
}
if(!_toolbarBackgroundView){
_toolbarBackgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_toolbarBackgroundView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_4,"class"),"toolbarBackgroundColor"));
objj_msgSend(_toolbarBackgroundView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_4,"addSubview:positioned:relativeTo:",_toolbarBackgroundView,CPWindowBelow,nil);
}
var _8=CGRectMakeZero();
_8.origin=CGPointMakeCopy(objj_msgSend(_4,"toolbarOffset"));
_8.size=objj_msgSend(_toolbarView,"frame").size;
objj_msgSend(_toolbarBackgroundView,"setFrame:",_8);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("toolbarBackgroundColor"),function(_9,_a){
with(_9){
if(!_1){
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPBorderlessBridgeWindowView,"class")),"pathForResource:","_CPToolbarView/_CPToolbarViewBackground.png"),CGSizeMake(1,59)));
}
return _1;
}
})]);
p;25;_CPBorderlessWindowView.ji;15;_CPWindowView.jc;188;
var _1=objj_allocateClassPair(_CPWindowView,"_CPBorderlessWindowView"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;20;_CPCibClassSwapper.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1259;
var _1="_CPCibClassSwapperClassNameKey",_2="_CPCibClassSwapperOriginalClassNameKey";
var _3=objj_allocateClassPair(CPObject,"_CPCibClassSwapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("allocObjectWithCoder:className:"),function(_5,_6,_7,_8){
with(_5){
var _9=objj_msgSend(_7,"classForClassName:",_8);
if(!_9){
_9=objj_lookUpClass(_8);
if(!_9){
return nil;
}
}
return objj_msgSend(_9,"alloc");
}
}),new objj_method(sel_getUid("allocWithCoder:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_c,"respondsToSelector:",sel_getUid("usesOriginalClasses"))&&objj_msgSend(_c,"usesOriginalClasses")){
var _d=objj_msgSend(_c,"decodeObjectForKey:",_2),_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,_d);
}else{
var _d=objj_msgSend(_c,"decodeObjectForKey:",_1),_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,_d);
if(!_e){
CPLog.error("Unable to find class "+_d+" in cib file.");
_e=objj_msgSend(_a,"allocObjectWithCoder:className:",_c,objj_msgSend(_c,"decodeObjectForKey:",_2));
}
}
if(!_e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unable to find class "+_d+" in cib file.");
}
return _e;
}
})]);
p;20;_CPCibCustomObject.jI;21;Foundation/CPObject.jc;1705;
var _1="_CPCibCustomObjectClassName";
var _2=objj_allocateClassPair(CPObject,"_CPCibCustomObject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_className")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("customClassName"),function(_4,_5){
with(_4){
return _className;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_6,_7,_8){
with(_6){
_className=_8;
}
}),new objj_method(sel_getUid("description"),function(_9,_a){
with(_9){
return objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"description")+" ("+objj_msgSend(_9,"customClassName")+")";
}
})]);
var _2=objj_getClass("_CPCibCustomObject");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomObject\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_className);
if(_13===objj_msgSend(_11,"class")){
_className="CPObject";
return _11;
}
if(!_13){
_13=objj_msgSend(CPObject,"class");
}
if(_13===objj_msgSend(CPApplication,"class")){
return objj_msgSend(CPApplication,"sharedApplication");
}
return objj_msgSend(objj_msgSend(_13,"alloc"),"init");
}
})]);
p;22;_CPCibCustomResource.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;2848;
var _1="_CPCibCustomResourceClassNameKey",_2="_CPCibCustomResourceResourceNameKey",_3="_CPCibCustomResourcePropertiesKey";
var _4=objj_allocateClassPair(CPObject,"_CPCibCustomResource"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_className"),new objj_ivar("_resourceName"),new objj_ivar("_properties")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithClassName:resourceName:properties:"),function(_6,_7,_8,_9,_a){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_className=_8;
_resourceName=_9;
_properties=_a;
}
return _6;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_className=objj_msgSend(_d,"decodeObjectForKey:",_1);
_resourceName=objj_msgSend(_d,"decodeObjectForKey:",_2);
_properties=objj_msgSend(_d,"decodeObjectForKey:",_3);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_10,"encodeObject:forKey:",_className,_1);
objj_msgSend(_10,"encodeObject:forKey:",_resourceName,_2);
objj_msgSend(_10,"encodeObject:forKey:",_properties,_3);
}
}),new objj_method(sel_getUid("awakeAfterUsingCoder:"),function(_11,_12,_13){
with(_11){
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("bundle"))&&(!objj_msgSend(_13,"respondsToSelector:",sel_getUid("awakenCustomResources"))||objj_msgSend(_13,"awakenCustomResources"))){
if(_className==="CPImage"){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(_13,"bundle"),"pathForResource:",_resourceName),objj_msgSend(_properties,"objectForKey:","size"));
}
}
return _11;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("imageResourceWithName:size:"),function(_14,_15,_16,_17){
with(_14){
return objj_msgSend(objj_msgSend(_14,"alloc"),"initWithClassName:resourceName:properties:","CPImage",_16,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_17,"size"));
}
})]);
var _4=objj_getClass("_CPCibCustomResource");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomResource\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("filename"),function(_18,_19){
with(_18){
return objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_resourceName);
}
}),new objj_method(sel_getUid("size"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_properties,"objectForKey:","size");
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_1c,_1d){
with(_1c){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_1e,_1f){
with(_1e){
return NO;
}
})]);
p;18;_CPCibCustomView.ji;8;CPView.jc;2330;
var _1=objj_allocateClassPair(CPView,"_CPCibCustomView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_className")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("customClassName"),function(_3,_4){
with(_3){
return _className;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_5,_6,_7){
with(_5){
_className=_7;
}
})]);
var _8="_CPCibCustomViewClassNameKey";
var _1=objj_getClass("_CPCibCustomView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPView")},"initWithCoder:",_b);
if(_9){
_className=objj_msgSend(_b,"decodeObjectForKey:",_8);
}
return _9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPView")},"encodeWithCoder:",_e);
objj_msgSend(_e,"encodeObject:forKey:",_className,_8);
}
}),new objj_method(sel_getUid("customClassName"),function(_f,_10){
with(_f){
return _className;
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_className);
if(!_13){
_13=objj_msgSend(CPView,"class");
}
if(_13===objj_msgSend(_11,"class")){
_className="CPView";
return _11;
}
var _14=objj_msgSend(objj_msgSend(_13,"alloc"),"initWithFrame:",objj_msgSend(_11,"frame"));
if(_14){
objj_msgSend(_14,"setBounds:",objj_msgSend(_11,"bounds"));
var _15=objj_msgSend(objj_msgSend(_11,"subviews"),"copy"),_16=0,_17=_15.length;
for(;_16<_17;++_16){
objj_msgSend(_14,"addSubview:",_15[_16]);
}
objj_msgSend(_14,"setAutoresizingMask:",objj_msgSend(_11,"autoresizingMask"));
objj_msgSend(_14,"setAutoresizesSubviews:",objj_msgSend(_11,"autoresizesSubviews"));
objj_msgSend(_14,"setHitTests:",objj_msgSend(_11,"hitTests"));
objj_msgSend(_14,"setHidden:",objj_msgSend(_11,"isHidden"));
objj_msgSend(_14,"setAlphaValue:",objj_msgSend(_11,"alphaValue"));
objj_msgSend(_superview,"replaceSubview:with:",_11,_14);
objj_msgSend(_14,"setBackgroundColor:",objj_msgSend(_11,"backgroundColor"));
}
return _14;
}
})]);
p;23;_CPCibKeyedUnarchiver.jI;30;Foundation/CPKeyedUnarchiver.jc;1437;
var _1=objj_allocateClassPair(CPKeyedUnarchiver,"_CPCibKeyedUnarchiver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_externalObjectsForProxyIdentifiers")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_5);
if(_3){
_bundle=_6;
_awakenCustomResources=_7;
objj_msgSend(_3,"setDelegate:",_3);
}
return _3;
}
}),new objj_method(sel_getUid("bundle"),function(_8,_9){
with(_8){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_a,_b){
with(_a){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("setExternalObjectsForProxyIdentifiers:"),function(_c,_d,_e){
with(_c){
_externalObjectsForProxyIdentifiers=_e;
}
}),new objj_method(sel_getUid("externalObjectForProxyIdentifier:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(_externalObjectsForProxyIdentifiers,"objectForKey:",_11);
}
}),new objj_method(sel_getUid("replaceObjectAtUID:withObject:"),function(_12,_13,_14,_15){
with(_12){
_objects[_14]=_15;
}
}),new objj_method(sel_getUid("objectAtUID:"),function(_16,_17,_18){
with(_16){
return _objects[_18];
}
})]);
p;18;_CPCibObjectData.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;22;CPCibOutletConnector.jc;5807;
var _1=objj_allocateClassPair(CPObject,"_CPCibObjectData"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_namesKeys"),new objj_ivar("_namesValues"),new objj_ivar("_accessibilityConnectors"),new objj_ivar("_accessibilityOidsKeys"),new objj_ivar("_accessibilityOidsValues"),new objj_ivar("_classesKeys"),new objj_ivar("_classesValues"),new objj_ivar("_connections"),new objj_ivar("_fontManager"),new objj_ivar("_framework"),new objj_ivar("_nextOid"),new objj_ivar("_objectsKeys"),new objj_ivar("_objectsValues"),new objj_ivar("_oidKeys"),new objj_ivar("_oidValues"),new objj_ivar("_fileOwner"),new objj_ivar("_visibleWindows"),new objj_ivar("_replacementObjects")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_namesKeys=[];
_namesValues=[];
_classesKeys=[];
_classesValues=[];
_connections=[];
_framework="";
_nextOid=[];
_objectsKeys=[];
_objectsValues=[];
_oidKeys=[];
_oidValues=[];
_fileOwner=nil;
_visibleWindows=objj_msgSend(CPSet,"set");
}
return _3;
}
}),new objj_method(sel_getUid("displayVisibleWindows"),function(_5,_6){
with(_5){
var _7=nil,_8=objj_msgSend(_visibleWindows,"objectEnumerator");
while(_7=objj_msgSend(_8,"nextObject")){
objj_msgSend(_replacementObjects[objj_msgSend(_7,"UID")],"makeKeyAndOrderFront:",_5);
}
}
})]);
var _9="_CPCibObjectDataNamesKeysKey",_a="_CPCibObjectDataNamesValuesKey",_b="_CPCibObjectDataAccessibilityConnectors",_c="_CPCibObjectDataAccessibilityOidsKeys",_d="_CPCibObjectDataAccessibilityOidsValues",_e="_CPCibObjectDataClassesKeysKey",_f="_CPCibObjectDataClassesValuesKey",_10="_CPCibObjectDataConnectionsKey",_11="_CPCibObjectDataFontManagerKey",_12="_CPCibObjectDataFrameworkKey",_13="_CPCibObjectDataNextOidKey",_14="_CPCibObjectDataObjectsKeysKey",_15="_CPCibObjectDataObjectsValuesKey",_16="_CPCibObjectDataOidKeysKey",_17="_CPCibObjectDataOidValuesKey",_18="_CPCibObjectDataFileOwnerKey",_19="_CPCibObjectDataVisibleWindowsKey";
var _1=objj_getClass("_CPCibObjectData");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibObjectData\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_replacementObjects={};
_namesKeys=objj_msgSend(_1c,"decodeObjectForKey:",_9);
_namesValues=objj_msgSend(_1c,"decodeObjectForKey:",_a);
_classesKeys=objj_msgSend(_1c,"decodeObjectForKey:",_e);
_classesValues=objj_msgSend(_1c,"decodeObjectForKey:",_f);
_connections=objj_msgSend(_1c,"decodeObjectForKey:",_10);
_framework=objj_msgSend(_1c,"decodeObjectForKey:",_12);
_nextOid=objj_msgSend(_1c,"decodeIntForKey:",_13);
_objectsKeys=objj_msgSend(_1c,"decodeObjectForKey:",_14);
_objectsValues=objj_msgSend(_1c,"decodeObjectForKey:",_15);
_oidKeys=objj_msgSend(_1c,"decodeObjectForKey:",_16);
_oidValues=objj_msgSend(_1c,"decodeObjectForKey:",_17);
_fileOwner=objj_msgSend(_1c,"decodeObjectForKey:",_18);
_visibleWindows=objj_msgSend(_1c,"decodeObjectForKey:",_19);
}
return _1a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1f,"encodeObject:forKey:",_namesKeys,_9);
objj_msgSend(_1f,"encodeObject:forKey:",_namesValues,_a);
objj_msgSend(_1f,"encodeObject:forKey:",_classesKeys,_e);
objj_msgSend(_1f,"encodeObject:forKey:",_classesValues,_f);
objj_msgSend(_1f,"encodeObject:forKey:",_connections,_10);
objj_msgSend(_1f,"encodeObject:forKey:",_framework,_12);
objj_msgSend(_1f,"encodeInt:forKey:",_nextOid,_13);
objj_msgSend(_1f,"encodeObject:forKey:",_objectsKeys,_14);
objj_msgSend(_1f,"encodeObject:forKey:",_objectsValues,_15);
objj_msgSend(_1f,"encodeObject:forKey:",_oidKeys,_16);
objj_msgSend(_1f,"encodeObject:forKey:",_oidValues,_17);
objj_msgSend(_1f,"encodeObject:forKey:",_fileOwner,_18);
objj_msgSend(_1f,"encodeObject:forKey:",_visibleWindows,_19);
}
}),new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(_objectsKeys,"count");
while(_24--){
var _25=_objectsKeys[_24],_26=_objectsValues[_24],_27=_25;
if(objj_msgSend(_25,"respondsToSelector:",sel_getUid("_cibInstantiate"))){
var _27=objj_msgSend(_25,"_cibInstantiate");
if(_27!==_25){
_replacementObjects[objj_msgSend(_25,"UID")]=_27;
if(objj_msgSend(_27,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _28=objj_msgSend(_27,"superview");
if(objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _29=objj_msgSend(_28,"superview");
if(objj_msgSend(_29,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_29,"setDocumentView:",_27);
}
}
}
}
}
if(_23&&_26===_fileOwner&&_25!==_fileOwner){
_23.push(_27);
}
}
}
}),new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"),function(_2a,_2b,_2c,_2d){
with(_2a){
_replacementObjects[objj_msgSend(_fileOwner,"UID")]=_2c;
var _2e=0,_2f=_connections.length;
for(;_2e<_2f;++_2e){
var _30=_connections[_2e];
objj_msgSend(_30,"replaceObjects:",_replacementObjects);
objj_msgSend(_30,"establishConnection");
}
}
}),new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"),function(_31,_32,_33,_34){
with(_31){
var _35=objj_msgSend(_objectsKeys,"count");
while(_35--){
var _36=_objectsKeys[_35],_37=_replacementObjects[objj_msgSend(_36,"UID")];
if(_37){
_36=_37;
}
if(_36!==_33&&objj_msgSend(_36,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_36,"awakeFromCib");
}
}
if(objj_msgSend(_33,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_33,"awakeFromCib");
}
}
})]);
p;19;_CPCibProxyObject.jI;21;Foundation/CPObject.jc;1021;
var _1=objj_allocateClassPair(CPObject,"_CPCibProxyObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _3="CPIdentifier";
var _1=objj_getClass("_CPCibProxyObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibProxyObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_identifier=objj_msgSend(_6,"decodeObjectForKey:",_3);
}
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("externalObjectForProxyIdentifier:"))){
return objj_msgSend(_6,"externalObjectForProxyIdentifier:",_identifier);
}
return _4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_9,"encodeObject:forKey:",_identifier,_3);
}
})]);
p;22;_CPCibWindowTemplate.jI;21;Foundation/CPObject.jc;3880;
var _1="_CPCibWindowTemplateMinSizeKey",_2="_CPCibWindowTemplateMaxSizeKey",_3="_CPCibWindowTemplateViewClassKey",_4="_CPCibWindowTemplateWindowClassKey",_5="_CPCibWindowTemplateWindowRectKey",_6="_CPCibWindowTempatStyleMaskKey",_7="_CPCibWindowTemplateWindowTitleKey",_8="_CPCibWindowTemplateWindowViewKey",_9="_CPCibWindowTemplateWindowIsFullBridgeKey";
var _a=objj_allocateClassPair(CPObject,"_CPCibWindowTemplate"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_viewClass"),new objj_ivar("_windowClass"),new objj_ivar("_windowRect"),new objj_ivar("_windowStyleMask"),new objj_ivar("_windowTitle"),new objj_ivar("_windowView"),new objj_ivar("_windowIsFullBridge")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_windowClass="CPWindow";
_windowRect=CGRectMake(0,0,400,200);
_windowStyleMask=CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask;
_windowTitle="Window";
_windowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,400,200));
_windowIsFullBridge=NO;
}
return _c;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPObject")},"init");
if(_e){
if(objj_msgSend(_10,"containsValueForKey:",_1)){
_minSize=objj_msgSend(_10,"decodeSizeForKey:",_1);
}
if(objj_msgSend(_10,"containsValueForKey:",_2)){
_maxSize=objj_msgSend(_10,"decodeSizeForKey:",_2);
}
_viewClass=objj_msgSend(_10,"decodeObjectForKey:",_3);
_windowClass=objj_msgSend(_10,"decodeObjectForKey:",_4);
_windowRect=objj_msgSend(_10,"decodeRectForKey:",_5);
_windowStyleMask=objj_msgSend(_10,"decodeIntForKey:",_6);
_windowTitle=objj_msgSend(_10,"decodeObjectForKey:",_7);
_windowView=objj_msgSend(_10,"decodeObjectForKey:",_8);
_windowIsFullBridge=objj_msgSend(_10,"decodeObjectForKey:",_9);
}
return _e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_11,_12,_13){
with(_11){
if(_minSize){
objj_msgSend(_13,"encodeSize:forKey:",_minSize,_1);
}
if(_maxSize){
objj_msgSend(_13,"encodeSize:forKey:",_maxSize,_2);
}
objj_msgSend(_13,"encodeObject:forKey:",_viewClass,_3);
objj_msgSend(_13,"encodeObject:forKey:",_windowClass,_4);
objj_msgSend(_13,"encodeRect:forKey:",_windowRect,_5);
objj_msgSend(_13,"encodeInt:forKey:",_windowStyleMask,_6);
objj_msgSend(_13,"encodeObject:forKey:",_windowTitle,_7);
objj_msgSend(_13,"encodeObject:forKey:",_windowView,_8);
objj_msgSend(_13,"encodeObject:forKey:",_windowIsFullBridge,_9);
}
}),new objj_method(sel_getUid("customClassName"),function(_14,_15){
with(_14){
return _windowClass;
}
}),new objj_method(sel_getUid("setCustomClassName:"),function(_16,_17,_18){
with(_16){
_windowClass=_18;
}
}),new objj_method(sel_getUid("windowClass"),function(_19,_1a){
with(_19){
return _windowClass;
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_1b,_1c){
with(_1b){
var _1d=CPClassFromString(objj_msgSend(_1b,"windowClass"));
var _1e=objj_msgSend(objj_msgSend(_1d,"alloc"),"initWithContentRect:styleMask:",_windowRect,_windowStyleMask);
if(_minSize){
objj_msgSend(_1e,"setMinSize:",_minSize);
}
if(_maxSize){
objj_msgSend(_1e,"setMaxSize:",_maxSize);
}
objj_msgSend(_1e,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_1e,"setTitle:",_windowTitle);
objj_msgSend(_windowView,"setAutoresizesSubviews:",NO);
objj_msgSend(_1e,"setContentView:",_windowView);
objj_msgSend(_windowView,"setAutoresizesSubviews:",YES);
if(objj_msgSend(_viewClass,"isKindOfClass:",objj_msgSend(CPToolbar,"class"))){
objj_msgSend(_1e,"setToolbar:",_viewClass);
}
objj_msgSend(_1e,"setFullBridge:",_windowIsFullBridge);
return _1e;
}
})]);
p;15;_CPCornerView.ji;8;CPView.jc;461;
var _1=objj_allocateClassPair(CPView,"_CPCornerView"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5)){
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(CPColor,"purpleColor"));
}
return _3;
}
})]);
p;18;_CPDisplayServer.jc;1205;
var _1=[],_2={},_3=[],_4={},_5=objj_msgSend(CPRunLoop,"mainRunLoop");
_CPDisplayServerAddDisplayObject=function(_6){
var _7=objj_msgSend(_6,"UID");
if(typeof _2[_7]!=="undefined"){
return;
}
var _8=_1.length;
_2[_7]=_8;
_1[_8]=_6;
};
_CPDisplayServerAddLayoutObject=function(_9){
var _a=objj_msgSend(_9,"UID");
if(typeof _4[_a]!=="undefined"){
return;
}
var _b=_3.length;
_4[_a]=_b;
_3[_b]=_9;
};
var _c=objj_allocateClassPair(CPObject,"_CPDisplayServer"),_d=_c.isa;
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_d,[new objj_method(sel_getUid("run"),function(_e,_f){
with(_e){
while(_3.length||_1.length){
var _10=0;
for(;_10<_3.length;++_10){
var _11=_3[_10];
delete _4[objj_msgSend(_11,"UID")];
objj_msgSend(_11,"layoutIfNeeded");
}
_3=[];
_4={};
_10=0;
for(;_10<_1.length;++_10){
if(_3.length){
break;
}
var _11=_1[_10];
delete _2[objj_msgSend(_11,"UID")];
objj_msgSend(_11,"displayIfNeeded");
}
if(_10===_1.length){
_1=[];
_2={};
}else{
_1=_1.splice(0,_10);
}
}
objj_msgSend(_5,"performSelector:target:argument:order:modes:",sel_getUid("run"),_e,nil,0,[CPDefaultRunLoopMode]);
}
})]);
objj_msgSend(_CPDisplayServer,"run");
p;23;_CPDocModalWindowView.ji;15;_CPWindowView.jc;1336;
var _1=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPDocModalWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_bodyView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_6,_7);
if(_4){
var _8=objj_msgSend(_4,"class"),_9=objj_msgSend(_4,"bounds");
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_9),CGRectGetHeight(_9)));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_8,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_4,"addSubview:",_bodyView);
}
return _4;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_a,_b,_c){
with(_a){
return _c;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_d,_e,_f){
with(_d){
return _f;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_10,_11){
with(_10){
if(!_1){
_1=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,0.9);
}
return _1;
}
})]);
p;18;_CPHUDWindowView.jc;6989;
var _1=nil,_2=nil;
var _3=26;
var _4=objj_allocateClassPair(_CPWindowView,"_CPHUDWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(objj_msgSend(_6,"class"),"contentRectForFrameRect:",_8);
if(objj_msgSend(objj_msgSend(objj_msgSend(_6,"window"),"toolbar"),"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_6,"toolbarView"),"frame"));
_9.origin.y+=toolbarHeight;
_9.size.height-=toolbarHeight;
}
return _9;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(objj_msgSend(_a,"class"),"frameRectForContentRect:",_c);
if(objj_msgSend(objj_msgSend(objj_msgSend(_a,"window"),"toolbar"),"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_a,"toolbarView"),"frame"));
_d.origin.y-=toolbarHeight;
_d.size.height+=toolbarHeight;
}
return _d;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_e,_f,_10,_11){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_10,_11);
if(_e){
var _12=objj_msgSend(_e,"bounds");
objj_msgSend(_e,"setBackgroundColor:",_1);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setHitTests:",NO);
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_titleField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,CGRectGetWidth(objj_msgSend(_e,"bounds"))-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(_e,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
var _13=objj_msgSend(_CPHUDWindowViewCloseImage,"size");
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(4,4,_13.width,_13.height));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_CPHUDWindowViewCloseImage);
objj_msgSend(_closeButton,"setAlternateImage:",_CPHUDWindowViewCloseActiveImage);
objj_msgSend(_e,"addSubview:",_closeButton);
}
objj_msgSend(_e,"setResizeIndicatorOffset:",CGSizeMake(5,5));
}
return _e;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_14,_15){
with(_14){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_14,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
}
}),new objj_method(sel_getUid("setTitle:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_titleField,"setStringValue:",_18);
}
}),new objj_method(sel_getUid("toolbarView"),function(_19,_1a){
with(_19){
return _toolbarView;
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPColor,"whiteColor");
}
}),new objj_method(sel_getUid("toolbarLabelShadowColor"),function(_1d,_1e){
with(_1d){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_1f,_20){
with(_1f){
return CGSizeMake(0,_3);
}
}),new objj_method(sel_getUid("tile"),function(_21,_22){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("_CPWindowView")},"tile");
var _23=objj_msgSend(_21,"window"),_24=objj_msgSend(_21,"bounds"),_25=CGRectGetWidth(_24);
objj_msgSend(_titleField,"setFrame:",CGRectMake(20,3,_25-40,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
var _26=objj_msgSend(_21,"toolbarMaxY");
objj_msgSend(objj_msgSend(_23,"contentView"),"setFrameOrigin:",CGPointMake(0,_26,_25,CGRectGetHeight(_24)-_26));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_27,_28){
with(_27){
if(_27!=objj_msgSend(_CPHUDWindowView,"class")){
return;
}
var _29=objj_msgSend(CPBundle,"bundleForClass:",_27);
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground0.png"),CPSizeMake(6,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground1.png"),CPSizeMake(1,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground2.png"),CPSizeMake(6,78)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground3.png"),CPSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground4.png"),CPSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground5.png"),CPSizeMake(6,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground6.png"),CPSizeMake(6,6)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground7.png"),CPSizeMake(6,6)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","CPWindow/HUD/CPWindowHUDBackground8.png"),CPSizeMake(6,6))]));
_CPHUDWindowViewCloseImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","HUDTheme/WindowClose.png"),CPSizeMake(20,20));
_CPHUDWindowViewCloseActiveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_29,"pathForResource:","HUDTheme/WindowCloseActive.png"),CPSizeMake(20,20));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=CGRectMakeCopy(_2c),_2e=_3;
_2d.origin.y+=_2e;
_2d.size.height-=_2e;
return _2d;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2f,_30,_31){
with(_2f){
var _32=CGRectMakeCopy(_31),_33=_3;
_32.origin.y-=_33;
_32.size.height+=_33;
return _32;
}
})]);
p;21;_CPImageAndTextView.jI;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;7026;
CPTopVerticalTextAlignment=1,CPCenterVerticalTextAlignment=2,CPBottomVerticalTextAlignment=3;
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6,_8=1<<7,_9=1<<8,_a=1<<9,_b=1<<10;
var _c=3,_d=5;
var _e=objj_allocateClassPair(CPView,"_CPImageAndTextView"),_f=_e.isa;
class_addIvars(_e,[new objj_ivar("_alignment"),new objj_ivar("_verticalAlignment"),new objj_ivar("_lineBreakMode"),new objj_ivar("_textColor"),new objj_ivar("_font"),new objj_ivar("_textShadowColor"),new objj_ivar("_textShadowOffset"),new objj_ivar("_imagePosition"),new objj_ivar("_imageScaling"),new objj_ivar("_image"),new objj_ivar("_text"),new objj_ivar("_textSize"),new objj_ivar("_flags")]);
objj_registerClassPair(_e);
objj_addClassForBundle(_e,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_e,[new objj_method(sel_getUid("initWithFrame:control:"),function(_10,_11,_12,_13){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPView")},"initWithFrame:",_12);
if(_10){
_textShadowOffset={width:0,height:0};
objj_msgSend(_10,"setVerticalAlignment:",CPTopVerticalTextAlignment);
if(_13){
objj_msgSend(_10,"setLineBreakMode:",objj_msgSend(_13,"lineBreakMode"));
objj_msgSend(_10,"setTextColor:",objj_msgSend(_13,"textColor"));
objj_msgSend(_10,"setAlignment:",objj_msgSend(_13,"alignment"));
objj_msgSend(_10,"setVerticalAlignment:",objj_msgSend(_13,"verticalAlignment"));
objj_msgSend(_10,"setFont:",objj_msgSend(_13,"font"));
objj_msgSend(_10,"setImagePosition:",objj_msgSend(_13,"imagePosition"));
objj_msgSend(_10,"setImageScaling:",objj_msgSend(_13,"imageScaling"));
}else{
objj_msgSend(_10,"setLineBreakMode:",CPLineBreakByClipping);
objj_msgSend(_10,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_10,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_10,"setImagePosition:",CPNoImage);
objj_msgSend(_10,"setImageScaling:",CPScaleNone);
}
_textSize=NULL;
}
return _10;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(_14,"initWithFrame:control:",_16,nil);
}
}),new objj_method(sel_getUid("setAlignment:"),function(_17,_18,_19){
with(_17){
if(_alignment===_19){
return;
}
_alignment=_19;
}
}),new objj_method(sel_getUid("alignment"),function(_1a,_1b){
with(_1a){
return _alignment;
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_1c,_1d,_1e){
with(_1c){
if(_verticalAlignment===_1e){
return;
}
_verticalAlignment=_1e;
_flags|=_5;
objj_msgSend(_1c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_1f,_20){
with(_1f){
return _verticalAlignment;
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_21,_22,_23){
with(_21){
if(_lineBreakMode===_23){
return;
}
_lineBreakMode=_23;
_flags|=_6;
objj_msgSend(_21,"setNeedsLayout");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_24,_25){
with(_24){
return _lineBreakMode;
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_26,_27,_28){
with(_26){
if(_imagePosition==_28){
return;
}
_imagePosition=_28;
_flags|=_a;
objj_msgSend(_26,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imagePosition"),function(_29,_2a){
with(_29){
return _imagePosition;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_2b,_2c,_2d){
with(_2b){
if(_imageScaling==_2d){
return;
}
_imageScaling=_2d;
_flags|=_b;
objj_msgSend(_2b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("imageScaling"),function(_2e,_2f){
with(_2e){
return _imageScaling;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_30,_31,_32){
with(_30){
if(_textColor===_32){
return;
}
_textColor=_32;
}
}),new objj_method(sel_getUid("textColor"),function(_33,_34){
with(_33){
return _textColor;
}
}),new objj_method(sel_getUid("setFont:"),function(_35,_36,_37){
with(_35){
if(_font===_37){
return;
}
_font=_37;
_flags|=_8;
_textSize=NULL;
objj_msgSend(_35,"setNeedsLayout");
}
}),new objj_method(sel_getUid("font"),function(_38,_39){
with(_38){
return _font;
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_3a,_3b,_3c){
with(_3a){
if(_textShadowColor===_3c){
return;
}
_textShadowColor=_3c;
_flags|=_9;
objj_msgSend(_3a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_3d,_3e){
with(_3d){
return _textShadowColor;
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_3f,_40,_41){
with(_3f){
if((_textShadowOffset.width==_41.width&&_textShadowOffset.height==_41.height)){
return;
}
_textShadowOffset={width:_41.width,height:_41.height};
objj_msgSend(_3f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_42,_43){
with(_42){
return _textShadowOffset;
}
}),new objj_method(sel_getUid("setImage:"),function(_44,_45,_46){
with(_44){
if(_image==_46){
return;
}
_image=_46;
_flags|=_2;
objj_msgSend(_44,"setNeedsLayout");
}
}),new objj_method(sel_getUid("image"),function(_47,_48){
with(_47){
return _image;
}
}),new objj_method(sel_getUid("setText:"),function(_49,_4a,_4b){
with(_49){
if(_text===_4b){
return;
}
_text=_4b;
_flags|=_3;
_textSize=NULL;
objj_msgSend(_49,"setNeedsLayout");
}
}),new objj_method(sel_getUid("text"),function(_4c,_4d){
with(_4c){
return _text;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(_4e,"bounds").size,_51={origin:{x:0,y:0},size:{width:_50.width,height:_50.height}};
if(hasDOMImageElement){
if(!_52){
var _52=_DOMImageElement.style;
}
if(_flags&_2){
_DOMImageElement.src=objj_msgSend(_image,"filename");
}
var _53=_50.width/2,_54=_50.height/2,_55=objj_msgSend(_image,"size"),_56=_55.width,_57=_55.height;
if(_imageScaling===CPScaleToFit){
_56=_50.width;
_57=_50.height;
}else{
if(_imageScaling===CPScaleProportionally){
var _58=MIN(MIN(_50.width,_56)/_56,MIN(_50.height,_57)/_57);
_56*=_58;
_57*=_58;
}
}
if(_imagePosition===CPImageBelow){
_51.size.height=_50.height-_57-_d;
}else{
if(_imagePosition===CPImageAbove){
_51.origin.y+=_57+_d;
_51.size.height=_50.height-_57-_d;
}else{
if(_imagePosition===CPImageLeft){
_51.origin.x=_56+_c;
_51.size.width-=_56+_c;
}else{
if(_imagePosition===CPImageRight){
_51.size.width-=_56+_c;
}else{
if(_imagePosition===CPImageOnly){
}
}
}
}
}
}
_flags=0;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_59,_5a){
with(_59){
var _5b=CGSizeMakeZero();
if((_imagePosition!==CPNoImage)&&_image){
var _5c=objj_msgSend(_image,"size");
_5b.width+=_5c.width;
_5b.height+=_5c.height;
}
if((_imagePosition!==CPImageOnly)&&objj_msgSend(_text,"length")>0){
if(!_textSize){
_textSize=objj_msgSend(_text,"sizeWithFont:",_font?_font:objj_msgSend(CPFont,"systemFontOfSize:",12));
}
if(_imagePosition===CPImageLeft||_imagePosition===CPImageRight){
_5b.width+=_textSize.width+_c;
_5b.height=MAX(_5b.height,_textSize.height);
}else{
if(_imagePosition===CPImageAbove||_imagePosition===CPImageBelow){
_5b.width=MAX(_5b.width,_textSize.width);
_5b.height+=_textSize.height+_d;
}else{
_5b.width=MAX(_5b.width,_textSize.width);
_5b.height=MAX(_5b.height,_textSize.height);
}
}
}
objj_msgSend(_59,"setFrameSize:",_5b);
}
})]);
p;23;_CPStandardWindowView.ji;15;_CPWindowView.jc;10990;
var _1=41;
var _2=nil,_3=nil;
var _4=objj_allocateClassPair(CPView,"_CPTexturedWindowHeadView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_gradientView"),new objj_ivar("_solidView"),new objj_ivar("_dividerView")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPView")},"initWithFrame:",_8);
if(_6){
var _9=objj_msgSend(_6,"class"),_a=objj_msgSend(_6,"bounds");
_gradientView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_a),_1));
objj_msgSend(_gradientView,"setBackgroundColor:",objj_msgSend(_9,"gradientColor"));
objj_msgSend(_6,"addSubview:",_gradientView);
_solidView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1,CGRectGetWidth(_a),CGRectGetHeight(_a)-_1));
objj_msgSend(_solidView,"setBackgroundColor:",objj_msgSend(_9,"solidColor"));
objj_msgSend(_6,"addSubview:",_solidView);
}
return _6;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_b,"bounds");
objj_msgSend(_gradientView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),_1));
objj_msgSend(_solidView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),CGRectGetHeight(_e)-_1));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("gradientColor"),function(_f,_10){
with(_f){
if(!_2){
var _11=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPWindowView,"class"));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop0.png"),CGSizeMake(6,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop1.png"),CGSizeMake(1,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop2.png"),CGSizeMake(6,41))],NO));
}
return _2;
}
}),new objj_method(sel_getUid("solidColor"),function(_12,_13){
with(_12){
if(!_3){
_3=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",195/255,195/255,195/255,1);
}
return _3;
}
})]);
var _14=nil,_15=nil,_16=nil,_17=nil,_18=nil,_19=nil,_1a=nil;
var _1b=41;
STANDARD_TITLEBAR_HEIGHT=25;
var _4=objj_allocateClassPair(_CPWindowView,"_CPStandardWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_headView"),new objj_ivar("_dividerView"),new objj_ivar("_bodyView"),new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton"),new objj_ivar("_minimizeButton")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(objj_msgSend(_1c,"class"),"contentRectForFrameRect:",_1e),_20=objj_msgSend(objj_msgSend(_1c,"window"),"toolbar");
if(objj_msgSend(_20,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_20,"_toolbarView"),"frame"));
_1f.origin.y+=toolbarHeight;
_1f.size.height-=toolbarHeight;
}
return _1f;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(objj_msgSend(_21,"class"),"frameRectForContentRect:",_23),_25=objj_msgSend(objj_msgSend(_21,"window"),"toolbar");
if(objj_msgSend(_25,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_25,"_toolbarView"),"frame"));
_24.origin.y-=toolbarHeight;
_24.size.height+=toolbarHeight;
}
return _24;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_26,_27,_28,_29){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_28,_29);
if(_26){
var _2a=objj_msgSend(_26,"class"),_2b=objj_msgSend(_26,"bounds");
_headView=objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_2b),objj_msgSend(objj_msgSend(_26,"class"),"titleBarHeight")));
objj_msgSend(_headView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_headView,"setHitTests:",NO);
objj_msgSend(_26,"addSubview:",_headView);
_dividerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),CGRectGetWidth(_2b),1));
objj_msgSend(_dividerView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_dividerView,"setBackgroundColor:",objj_msgSend(_2a,"dividerBackgroundColor"));
objj_msgSend(_dividerView,"setHitTests:",NO);
objj_msgSend(_26,"addSubview:",_dividerView);
var y=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,y,CGRectGetWidth(_2b),CGRectGetHeight(_2b)-y));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_2a,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_26,"addSubview:",_bodyView);
objj_msgSend(_26,"setResizeIndicatorOffset:",CGSizeMake(2,2));
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_26,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
if(!_17){
var _2d=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_17=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButton.png"),CGSizeMake(16,16));
_18=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"),CGSizeMake(16,16));
}
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(8,7,16,16));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_17);
objj_msgSend(_closeButton,"setAlternateImage:",_18);
objj_msgSend(_26,"addSubview:",_closeButton);
}
if(_styleMask&CPMiniaturizableWindowMask&&!objj_msgSend(CPPlatform,"isBrowser")){
if(!_19){
var _2d=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_19=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButton.png"),CGSizeMake(16,16));
_1a=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButtonHighlighted.png"),CGSizeMake(16,16));
}
_minimizeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(27,7,16,16));
objj_msgSend(_minimizeButton,"setBordered:",NO);
objj_msgSend(_minimizeButton,"setImage:",_19);
objj_msgSend(_minimizeButton,"setAlternateImage:",_1a);
objj_msgSend(_26,"addSubview:",_minimizeButton);
}
objj_msgSend(_26,"tile");
}
return _26;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_2e,_2f){
with(_2e){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_2e,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
objj_msgSend(_minimizeButton,"setTarget:",objj_msgSend(_2e,"window"));
objj_msgSend(_minimizeButton,"setAction:",sel_getUid("performMiniaturize:"));
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_30,_31){
with(_30){
return CGSizeMake(0,objj_msgSend(objj_msgSend(_30,"class"),"titleBarHeight"));
}
}),new objj_method(sel_getUid("tile"),function(_32,_33){
with(_32){
objj_msgSendSuper({receiver:_32,super_class:objj_getClass("_CPWindowView")},"tile");
var _34=objj_msgSend(_32,"window"),_35=objj_msgSend(_32,"bounds"),_36=CGRectGetWidth(_35);
objj_msgSend(_headView,"setFrameSize:",CGSizeMake(_36,objj_msgSend(_32,"toolbarMaxY")));
objj_msgSend(_dividerView,"setFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),_36,1));
var _37=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
objj_msgSend(_bodyView,"setFrame:",CGRectMake(0,_37,_36,CGRectGetHeight(_35)-_37));
var _38=8;
if(_closeButton){
_38+=19;
}
if(_minimizeButton){
_38+=19;
}
objj_msgSend(_titleField,"setFrame:",CGRectMake(_38,5,_36-_38*2,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(objj_msgSend(_34,"contentView"),"setFrameOrigin:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_dividerView,"frame"))));
}
}),new objj_method(sel_getUid("setTitle:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_titleField,"setStringValue:",_3b);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3c,_3d,_3e){
with(_3c){
if(CGRectContainsPoint(objj_msgSend(_headView,"frame"),objj_msgSend(_3c,"convertPoint:fromView:",objj_msgSend(_3e,"locationInWindow"),nil))){
return objj_msgSend(_3c,"trackMoveWithEvent:",_3e);
}
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("_CPWindowView")},"mouseDown:",_3e);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_3f,_40){
with(_3f){
if(!_14){
_14=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,1);
}
return _14;
}
}),new objj_method(sel_getUid("dividerBackgroundColor"),function(_41,_42){
with(_41){
if(!_15){
_15=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",125/255,125/255,125/255,1);
}
return _15;
}
}),new objj_method(sel_getUid("titleColor"),function(_43,_44){
with(_43){
if(!_16){
_16=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",44/255,44/255,44/255,1);
}
return _16;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_45,_46,_47){
with(_45){
var _48=CGRectMakeCopy(_47),_49=objj_msgSend(_45,"titleBarHeight")+1;
_48.origin.y+=_49;
_48.size.height-=_49;
return _48;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=CGRectMakeCopy(_4c),_4e=objj_msgSend(_4a,"titleBarHeight")+1;
_4d.origin.y-=_4e;
_4d.size.height+=_4e;
return _4d;
}
}),new objj_method(sel_getUid("titleBarHeight"),function(_4f,_50){
with(_4f){
return STANDARD_TITLEBAR_HEIGHT;
}
})]);
p;15;_CPWindowView.ji;8;CPView.ji;13;CPImageView.jc;9243;
var _1=nil;
var _2=objj_allocateClassPair(CPView,"_CPWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_styleMask"),new objj_ivar("_resizeIndicator"),new objj_ivar("_resizeIndicatorOffset"),new objj_ivar("_toolbarView"),new objj_ivar("_resizeFrame"),new objj_ivar("_mouseDraggedPoint"),new objj_ivar("_cachedScreenFrame")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(objj_msgSend(_4,"class"),"contentRectForFrameRect:",_6);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(objj_msgSend(_7,"class"),"frameRectForContentRect:",_9);
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPView")},"initWithFrame:",_c);
if(_a){
_styleMask=_d;
_resizeIndicatorOffset=CGSizeMake(0,0);
_toolbarOffset=CGSizeMake(0,0);
objj_msgSend(_a,"setShowsResizeIndicator:",!(_styleMask&CPBorderlessBridgeWindowMask)&&(_styleMask&CPResizableWindowMask));
}
return _a;
}
}),new objj_method(sel_getUid("setTitle:"),function(_e,_f,_10){
with(_e){
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_11,_12,_13){
with(_11){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(_14,"window");
if((_styleMask&CPResizableWindowMask)&&_resizeIndicator){
var _18=objj_msgSend(_resizeIndicator,"frame");
if(CGRectContainsPoint(_18,objj_msgSend(_14,"convertPoint:fromView:",objj_msgSend(_16,"locationInWindow"),nil))){
return objj_msgSend(_14,"trackResizeWithEvent:",_16);
}
}
if(objj_msgSend(_17,"isMovableByWindowBackground")){
objj_msgSend(_14,"trackMoveWithEvent:",_16);
}else{
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPView")},"mouseDown:",_16);
}
}
}),new objj_method(sel_getUid("trackResizeWithEvent:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_1b,"locationInWindow"),_1d=objj_msgSend(_1b,"type");
if(_1d===CPLeftMouseUp){
return;
}
var _1e=objj_msgSend(_19,"window");
if(_1d===CPLeftMouseDown){
var _1f=objj_msgSend(_1e,"frame");
_resizeFrame=CGRectMake(_1c.x,_1c.y,CGRectGetWidth(_1f),CGRectGetHeight(_1f));
}else{
if(_1d===CPLeftMouseDragged){
var _20=CGSizeMake(CGRectGetWidth(_resizeFrame)+_1c.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+_1c.y-CGRectGetMinY(_resizeFrame));
if(_1e._isSheet&&_1e._parentView&&(_1e._frame.size.width!==_20.width)){
objj_msgSend(_1e._parentView,"_setAttachedSheetFrameOrigin");
}
objj_msgSend(_1e,"setFrameSize:",_20);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_19,sel_getUid("trackResizeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_pointWithinScreenFrame:"),function(_21,_22,_23){
with(_21){
if(!objj_msgSend(CPPlatform,"isBrowser")){
return _23;
}
var _24=_cachedScreenFrame;
if(!_24){
_24=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}
var _25=CGPointMake(0,0);
_25.x=MIN(MAX(_23.x,-_frame.size.width+4),CGRectGetMaxX(_24)-4);
_25.y=MIN(MAX(_23.y,0),CGRectGetMaxY(_24)-8);
return _25;
}
}),new objj_method(sel_getUid("trackMoveWithEvent:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_28,"type");
if(_29===CPLeftMouseUp){
_cachedScreenFrame=nil;
return;
}else{
if(_29===CPLeftMouseDown){
_mouseDraggedPoint=objj_msgSend(objj_msgSend(_26,"window"),"convertBaseToGlobal:",objj_msgSend(_28,"locationInWindow"));
_cachedScreenFrame=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"visibleFrame");
}else{
if(_29===CPLeftMouseDragged){
var _2a=objj_msgSend(_26,"window"),_2b=objj_msgSend(_2a,"frame"),_2c=objj_msgSend(_2a,"convertBaseToGlobal:",objj_msgSend(_28,"locationInWindow")),_2d=objj_msgSend(_26,"_pointWithinScreenFrame:",CGPointMake((_2b.origin.x)+(_2c.x-_mouseDraggedPoint.x),(_2b.origin.y)+(_2c.y-_mouseDraggedPoint.y)));
objj_msgSend(_2a,"setFrameOrigin:",_2d);
_mouseDraggedPoint=objj_msgSend(_26,"_pointWithinScreenFrame:",_2c);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_26,sel_getUid("trackMoveWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_2e,_2f,_30){
with(_2e){
if(_30){
var _31=objj_msgSend(_1,"size"),_32=objj_msgSend(_2e,"frame").size;
_resizeIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_32.width-_31.width-_resizeIndicatorOffset.width,_32.height-_31.height-_resizeIndicatorOffset.height,_31.width,_31.height));
objj_msgSend(_resizeIndicator,"setImage:",_1);
objj_msgSend(_resizeIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_2e,"addSubview:",_resizeIndicator);
}else{
objj_msgSend(_resizeIndicator,"removeFromSuperview");
_resizeIndicator=nil;
}
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_33,_34){
with(_33){
return _resizeIndicator!==nil;
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_35,_36,_37){
with(_35){
if(CGSizeEqualToSize(_resizeIndicatorOffset,_37)){
return;
}
_resizeIndicatorOffset=_37;
if(!_resizeIndicator){
return;
}
var _38=objj_msgSend(_resizeIndicator,"frame").size,_39=objj_msgSend(_35,"frame").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_39.width-_38.width-_37.width,_39.height-_38.height-_37.height));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_3a,_3b){
with(_3a){
return _resizeIndicatorOffset;
}
}),new objj_method(sel_getUid("windowDidChangeDocumentEdited"),function(_3c,_3d){
with(_3c){
}
}),new objj_method(sel_getUid("windowDidChangeDocumentSaving"),function(_3e,_3f){
with(_3e){
}
}),new objj_method(sel_getUid("showsToolbar"),function(_40,_41){
with(_40){
return YES;
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_42,_43){
with(_42){
return CGSizeMakeZero();
}
}),new objj_method(sel_getUid("toolbarLabelColor"),function(_44,_45){
with(_44){
return objj_msgSend(CPColor,"blackColor");
}
}),new objj_method(sel_getUid("toolbarMaxY"),function(_46,_47){
with(_46){
if(!_toolbarView||objj_msgSend(_toolbarView,"isHidden")){
return objj_msgSend(_46,"toolbarOffset").height;
}
return CGRectGetMaxY(objj_msgSend(_toolbarView,"frame"));
}
}),new objj_method(sel_getUid("toolbarView"),function(_48,_49){
with(_48){
return _toolbarView;
}
}),new objj_method(sel_getUid("tile"),function(_4a,_4b){
with(_4a){
var _4c=objj_msgSend(_4a,"window"),_4d=objj_msgSend(_4a,"bounds"),_4e=CGRectGetWidth(_4d);
if(objj_msgSend(objj_msgSend(_4c,"toolbar"),"isVisible")){
var _4f=objj_msgSend(_4a,"toolbarView"),_50=objj_msgSend(_4a,"toolbarOffset");
objj_msgSend(_4f,"setFrame:",CGRectMake(_50.width,_50.height,_4e,CGRectGetHeight(objj_msgSend(_4f,"frame"))));
}
if(objj_msgSend(_4a,"showsResizeIndicator")){
var _51=objj_msgSend(_resizeIndicator,"frame").size,_52=objj_msgSend(_4a,"bounds").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_52.width-_51.width-_resizeIndicatorOffset.width,_52.height-_51.height-_resizeIndicatorOffset.height));
}
}
}),new objj_method(sel_getUid("noteToolbarChanged"),function(_53,_54){
with(_53){
var _55=objj_msgSend(_53,"window"),_56=objj_msgSend(_55,"toolbar"),_57=objj_msgSend(_56,"_toolbarView");
if(_toolbarView!==_57){
objj_msgSend(_toolbarView,"removeFromSuperview");
if(_57){
objj_msgSend(_57,"removeFromSuperview");
objj_msgSend(_57,"setLabelColor:",objj_msgSend(_53,"toolbarLabelColor"));
if(objj_msgSend(_53,"respondsToSelector:",sel_getUid("toolbarLabelShadowColor"))){
objj_msgSend(_57,"setLabelShadowColor:",objj_msgSend(_53,"toolbarLabelShadowColor"));
}
objj_msgSend(_53,"addSubview:",_57);
}
_toolbarView=_57;
}
objj_msgSend(_57,"setHidden:",!objj_msgSend(_53,"showsToolbar")||!objj_msgSend(_56,"isVisible"));
if(_55){
var _58=objj_msgSend(_53,"convertRect:toView:",objj_msgSend(objj_msgSend(_55,"contentView"),"frame"),nil);
_58.origin=objj_msgSend(_55,"convertBaseToGlobal:",_58.origin);
objj_msgSend(_53,"setAutoresizesSubviews:",NO);
objj_msgSend(_55,"setFrame:",objj_msgSend(_55,"frameRectForContentRect:",_58));
objj_msgSend(_53,"setAutoresizesSubviews:",YES);
}
objj_msgSend(_53,"tile");
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_59,_5a,_5b){
with(_59){
if(!_resizeIndicator||_5b===_resizeIndicator){
return;
}
objj_msgSend(_59,"addSubview:",_resizeIndicator);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_5c,_5d){
with(_5c){
if(_5c!=objj_msgSend(_CPWindowView,"class")){
return;
}
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class")),"pathForResource:","_CPWindowView/_CPWindowViewResizeIndicator.png"),CGSizeMake(12,12));
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_5e,_5f,_60){
with(_5e){
return CGRectMakeCopy(_60);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_61,_62,_63){
with(_61){
return CGRectMakeCopy(_63);
}
})]);
p;8;AppKit.ji;9;CALayer.ji;9;CPAlert.ji;13;CPAnimation.ji;15;CPApplication.ji;14;CPBezierPath.ji;7;CPBox.ji;10;CPButton.ji;13;CPButtonBar.ji;12;CPCheckBox.ji;7;CPCib.ji;16;CPCibConnector.ji;23;CPCibControlConnector.ji;14;CPCibLoading.ji;22;CPCibOutletConnector.ji;12;CPClipView.ji;22;CPCollectionViewItem.ji;18;CPCollectionView.ji;9;CPColor.ji;14;CPColorPanel.ji;13;CPColorWell.ji;17;CPCompatibility.ji;11;CPControl.ji;10;CPCookie.ji;12;CPDocument.ji;22;CPDocumentController.ji;9;CPEvent.ji;14;CPFlashMovie.ji;13;CPFlashView.ji;8;CPFont.ji;15;CPFontManager.ji;12;CPGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPMenu.ji;12;CPMenuItem.ji;13;CPOpenPanel.ji;9;CPPanel.ji;14;CPPasteboard.ji;15;CPPopUpButton.ji;21;CPProgressIndicator.ji;9;CPRadio.ji;13;CPResponder.ji;15;CPSearchField.ji;14;CPScrollView.ji;12;CPScroller.ji;19;CPSecureTextField.ji;20;CPSegmentedControl.ji;10;CPShadow.ji;10;CPSlider.ji;13;CPSplitView.ji;11;CPTabView.ji;15;CPTableColumn.ji;13;CPTableView.ji;13;CPTextField.ji;11;CPToolbar.ji;15;CPToolbarItem.ji;8;CPView.ji;18;CPViewController.ji;11;CPWebView.ji;10;CPWindow.ji;20;CPWindowController.jp;13;CAAnimation.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;3790;
var _1=objj_allocateClassPair(CPObject,"CAAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isRemovedOnCompletion"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_isRemovedOnCompletion=YES;
}
return _3;
}
}),new objj_method(sel_getUid("shouldArchiveValueForKey:"),function(_5,_6,_7){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("setRemovedOnCompletion:"),function(_8,_9,_a){
with(_8){
_isRemovedOnCompletion=_a;
}
}),new objj_method(sel_getUid("removedOnCompletion"),function(_b,_c){
with(_b){
return _isRemovedOnCompletion;
}
}),new objj_method(sel_getUid("isRemovedOnCompletion"),function(_d,_e){
with(_d){
return _isRemovedOnCompletion;
}
}),new objj_method(sel_getUid("timingFunction"),function(_f,_10){
with(_f){
return nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_11,_12,_13){
with(_11){
_delegate=_13;
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("runActionForKey:object:arguments:"),function(_16,_17,_18,_19,_1a){
with(_16){
objj_msgSend(_19,"addAnimation:forKey:",_16,_18);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("animation"),function(_1b,_1c){
with(_1b){
return objj_msgSend(objj_msgSend(_1b,"alloc"),"init");
}
}),new objj_method(sel_getUid("defaultValueForKey:"),function(_1d,_1e,_1f){
with(_1d){
return nil;
}
})]);
var _1=objj_allocateClassPair(CAAnimation,"CAPropertyAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyPath"),new objj_ivar("_isCumulative"),new objj_ivar("_isAdditive")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setKeyPath:"),function(_20,_21,_22){
with(_20){
_keyPath=_22;
}
}),new objj_method(sel_getUid("keyPath"),function(_23,_24){
with(_23){
return _keyPath;
}
}),new objj_method(sel_getUid("setCumulative:"),function(_25,_26,_27){
with(_25){
_isCumulative=_27;
}
}),new objj_method(sel_getUid("cumulative"),function(_28,_29){
with(_28){
return _isCumulative;
}
}),new objj_method(sel_getUid("isCumulative"),function(_2a,_2b){
with(_2a){
return _isCumulative;
}
}),new objj_method(sel_getUid("setAdditive:"),function(_2c,_2d,_2e){
with(_2c){
_isAdditive=_2e;
}
}),new objj_method(sel_getUid("additive"),function(_2f,_30){
with(_2f){
return _isAdditive;
}
}),new objj_method(sel_getUid("isAdditive"),function(_31,_32){
with(_31){
return _isAdditive;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("animationWithKeyPath:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_33,"animation");
objj_msgSend(_36,"setKeyPath:",_35);
return _36;
}
})]);
var _1=objj_allocateClassPair(CAPropertyAnimation,"CABasicAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fromValue"),new objj_ivar("_toValue"),new objj_ivar("_byValue")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setFromValue:"),function(_37,_38,_39){
with(_37){
_fromValue=_39;
}
}),new objj_method(sel_getUid("fromValue"),function(_3a,_3b){
with(_3a){
return _fromValue;
}
}),new objj_method(sel_getUid("setToValue:"),function(_3c,_3d,_3e){
with(_3c){
_toValue=_3e;
}
}),new objj_method(sel_getUid("toValue"),function(_3f,_40){
with(_3f){
return _toValue;
}
}),new objj_method(sel_getUid("setByValue:"),function(_41,_42,_43){
with(_41){
_byValue=_43;
}
}),new objj_method(sel_getUid("byValue"),function(_44,_45){
with(_44){
return _byValue;
}
})]);
p;16;CABackingStore.ji;12;CGGeometry.ji;17;CPCompatibility.jc;599;
CABackingStoreGetContext=function(_1){
return _1.context;
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CABackingStoreCreate=function(){
var _2=document.createElement("canvas");
_2.style.position="absolute";
return {context:_2.getContext("2d"),buffer:_2,_image:_2};
};
CABackingStoreSetSize=function(_3,_4){
var _5=_3.buffer;
_5.width=_4.width;
_5.height=_4.height;
_5.style.width=_4.width+"px";
_5.style.height=_4.height+"px";
};
}else{
CABackingStoreCreate=function(){
var _6=CGBitmapGraphicsContextCreate();
_6.buffer="";
return {context:_6};
};
CABackingStoreSetSize=function(_7,_8){
};
}
p;14;CAFlashLayer.ji;9;CALayer.ji;14;CPFlashMovie.jc;803;
var _1=objj_allocateClassPair(CALayer,"CAFlashLayer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_flashMovie")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setFlashMovie:"),function(_3,_4,_5){
with(_3){
if(_flashMovie==_5){
return;
}
_flashMovie=_5;
_DOMElement.innerHTML="<object width = \"100%\" height = \"100%\"><param name = \"movie\" value = \""+_5._fileName+"\"></param><param name = \"wmode\" value = \"transparent\"></param><embed src = \""+_5._fileName+"\" type = \"application/x-shockwave-flash\" wmode = \"transparent\" width = \"100%\" height = \"100%\"></embed></object>";
}
}),new objj_method(sel_getUid("flashMovie"),function(_6,_7){
with(_6){
return _flashMovie;
}
})]);
p;9;CALayer.jI;21;Foundation/CPObject.jI;23;AppKit/CABackingStore.jI;18;AppKit/CGContext.jI;19;AppKit/CGGeometry.ji;12;CGGeometry.jc;24767;
CGAffineTransformMake=function(a,b,c,d,tx,ty){
return {a:a,b:b,c:c,d:d,tx:tx,ty:ty};
};
CGAffineTransformMakeIdentity=function(){
return {a:1,b:0,c:0,d:1,tx:0,ty:0};
};
CGAffineTransformMakeCopy=function(_7){
return {a:_7.a,b:_7.b,c:_7.c,d:_7.d,tx:_7.tx,ty:_7.ty};
};
CGAffineTransformMakeScale=function(sx,sy){
return {a:sx,b:0,c:0,d:sy,tx:0,ty:0};
};
CGAffineTransformMakeTranslation=function(tx,ty){
return {a:1,b:0,c:0,d:1,tx:tx,ty:ty};
};
CGAffineTransformTranslate=function(_c,tx,ty){
return {a:_c.a,b:_c.b,c:_c.c,d:_c.d,tx:_c.tx+_c.a*tx+_c.c*ty,ty:_c.ty+_c.b*tx+_c.d*ty};
};
CGAffineTransformScale=function(_f,sx,sy){
return {a:_f.a*sx,b:_f.b*sx,c:_f.c*sy,d:_f.d*sy,tx:_f.tx,ty:_f.ty};
};
CGAffineTransformConcat=function(lhs,rhs){
return {a:lhs.a*rhs.a+lhs.b*rhs.c,b:lhs.a*rhs.b+lhs.b*rhs.d,c:lhs.c*rhs.a+lhs.d*rhs.c,d:lhs.c*rhs.b+lhs.d*rhs.d,tx:lhs.tx*rhs.a+lhs.ty*rhs.c+rhs.tx,ty:lhs.tx*rhs.b+lhs.ty*rhs.d+rhs.ty};
};
CGPointApplyAffineTransform=function(_14,_15){
return {x:_14.x*_15.a+_14.y*_15.c+_15.tx,y:_14.x*_15.b+_14.y*_15.d+_15.ty};
};
CGSizeApplyAffineTransform=function(_16,_17){
return {width:_16.width*_17.a+_16.height*_17.c,height:_16.width*_17.b+_16.height*_17.d};
};
CGAffineTransformIsIdentity=function(_18){
return (_18.a==1&&_18.b==0&&_18.c==0&&_18.d==1&&_18.tx==0&&_18.ty==0);
};
CGAffineTransformEqualToTransform=function(lhs,rhs){
return (lhs.a==rhs.a&&lhs.b==rhs.b&&lhs.c==rhs.c&&lhs.d==rhs.d&&lhs.tx==rhs.tx&&lhs.ty==rhs.ty);
};
CGStringCreateWithCGAffineTransform=function(_1b){
return (" [[ "+_1b.a+", "+_1b.b+", 0 ], [ "+_1b.c+", "+_1b.d+", 0 ], [ "+_1b.tx+", "+_1b.ty+", 1]]");
};
CGAffineTransformCreateCopy=function(_1c){
return {a:_1c.a,b:_1c.b,c:_1c.c,d:_1c.d,tx:_1c.tx,ty:_1c.ty};
};
CGAffineTransformMakeRotation=function(_1d){
var sin=SIN(_1d),cos=COS(_1d);
return {a:cos,b:sin,c:-sin,d:cos,tx:0,ty:0};
};
CGAffineTransformRotate=function(_20,_21){
var sin=SIN(_21),cos=COS(_21);
return {a:_20.a*cos+_20.c*sin,b:_20.b*cos+_20.d*sin,c:_20.c*cos-_20.a*sin,d:_20.d*cos-_20.b*sin,tx:_20.tx,ty:_20.ty};
};
CGAffineTransformInvert=function(_24){
var _25=1/(_24.a*_24.d-_24.b*_24.c);
return {a:_25*_24.d,b:-_25*_24.b,c:-_25*_24.c,d:_25*_24.a,tx:_25*(_24.c*_24.ty-_24.d*_24.tx),ty:_25*(_24.b*_24.tx-_24.a*_24.ty)};
};
CGRectApplyAffineTransform=function(_26,_27){
var top=(_26.origin.y),_29=(_26.origin.x),_2a=(_26.origin.x+_26.size.width),_2b=(_26.origin.y+_26.size.height),_2c=CGPointApplyAffineTransform({x:_29,y:top},_27),_2d=CGPointApplyAffineTransform({x:_2a,y:top},_27),_2e=CGPointApplyAffineTransform({x:_29,y:_2b},_27),_2f=CGPointApplyAffineTransform({x:_2a,y:_2b},_27),_30=MIN(_2c.x,_2d.x,_2e.x,_2f.x),_31=MAX(_2c.x,_2d.x,_2e.x,_2f.x),_32=MIN(_2c.y,_2d.y,_2e.y,_2f.y),_33=MAX(_2c.y,_2d.y,_2e.y,_2f.y);
return {origin:{x:_30,y:_32},size:{width:(_31-_30),height:(_33-_32)}};
};
CPStringFromCGAffineTransform=function(_34){
return "{"+_34.a+", "+_34.b+", "+_34.c+", "+_34.d+", "+_34.tx+", "+_34.ty+"}";
};
var _35=1,_36=2,_37=4,_38=8,_39=16;
var _3a=NO;
var _3b=1,_3c=2,_3d=4,_3e=8,_3f=16,_40=_3d|_3b|_3c;
var _41=nil;
var _42=objj_allocateClassPair(CPObject,"CALayer"),_43=_42.isa;
class_addIvars(_42,[new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_position"),new objj_ivar("_zPosition"),new objj_ivar("_anchorPoint"),new objj_ivar("_affineTransform"),new objj_ivar("_sublayerTransform"),new objj_ivar("_sublayerTransformForSublayers"),new objj_ivar("_backingStoreFrame"),new objj_ivar("_standardBackingStoreFrame"),new objj_ivar("_hasSublayerTransform"),new objj_ivar("_hasCustomBackingStoreFrame"),new objj_ivar("_opacity"),new objj_ivar("_isHidden"),new objj_ivar("_backgroundColor"),new objj_ivar("_superlayer"),new objj_ivar("_sublayers"),new objj_ivar("_runLoopUpdateMask"),new objj_ivar("_needsDisplayOnBoundsChange"),new objj_ivar("_delegate"),new objj_ivar("_delegateRespondsToDisplayLayerSelector"),new objj_ivar("_delegateRespondsToDrawLayerInContextSelector"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_contents"),new objj_ivar("_context"),new objj_ivar("_owningView"),new objj_ivar("_transformToLayer"),new objj_ivar("_transformFromLayer")]);
objj_registerClassPair(_42);
objj_addClassForBundle(_42,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_42,[new objj_method(sel_getUid("init"),function(_44,_45){
with(_44){
_44=objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPObject")},"init");
if(_44){
_frame=CGRectMakeZero();
_backingStoreFrame=CGRectMakeZero();
_standardBackingStoreFrame=CGRectMakeZero();
_bounds=CGRectMakeZero();
_position=CGPointMakeZero();
_zPosition=0;
_anchorPoint=CGPointMake(0.5,0.5);
_affineTransform=CGAffineTransformMakeIdentity();
_sublayerTransform=CGAffineTransformMakeIdentity();
_transformToLayer=CGAffineTransformMakeIdentity();
_transformFromLayer=CGAffineTransformMakeIdentity();
_opacity=1;
_isHidden=NO;
_masksToBounds=NO;
_sublayers=[];
_DOMElement=document.createElement("div");
_DOMElement.style.overflow="visible";
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.top="0px";
_DOMElement.style.left="0px";
_DOMElement.style.zIndex=0;
_DOMElement.style.width="0px";
_DOMElement.style.height="0px";
}
return _44;
}
}),new objj_method(sel_getUid("setBounds:"),function(_46,_47,_48){
with(_46){
if(CGRectEqualToRect(_bounds,_48)){
return;
}
var _49=_bounds.origin;
_bounds={origin:{x:_48.origin.x,y:_48.origin.y},size:{width:_48.size.width,height:_48.size.height}};
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_46);
}
_CALayerRecalculateGeometry(_46,_35);
}
}),new objj_method(sel_getUid("bounds"),function(_4a,_4b){
with(_4a){
return _bounds;
}
}),new objj_method(sel_getUid("setPosition:"),function(_4c,_4d,_4e){
with(_4c){
if(CGPointEqualToPoint(_position,_4e)){
return;
}
_position={x:_4e.x,y:_4e.y};
_CALayerRecalculateGeometry(_4c,_36);
}
}),new objj_method(sel_getUid("position"),function(_4f,_50){
with(_4f){
return _position;
}
}),new objj_method(sel_getUid("setZPosition:"),function(_51,_52,_53){
with(_51){
if(_zPosition==_53){
return;
}
_zPosition=_53;
objj_msgSend(_51,"registerRunLoopUpdateWithMask:",_3d);
}
}),new objj_method(sel_getUid("setAnchorPoint:"),function(_54,_55,_56){
with(_54){
_56={x:_56.x,y:_56.y};
_56.x=MIN(1,MAX(0,_56.x));
_56.y=MIN(1,MAX(0,_56.y));
if(CGPointEqualToPoint(_anchorPoint,_56)){
return;
}
_anchorPoint=_56;
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_54);
}
if(_owningView){
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
}
_CALayerRecalculateGeometry(_54,_37);
}
}),new objj_method(sel_getUid("anchorPoint"),function(_57,_58){
with(_57){
return _anchorPoint;
}
}),new objj_method(sel_getUid("setAffineTransform:"),function(_59,_5a,_5b){
with(_59){
if(CGAffineTransformEqualToTransform(_affineTransform,_5b)){
return;
}
_affineTransform={a:_5b.a,b:_5b.b,c:_5b.c,d:_5b.d,tx:_5b.tx,ty:_5b.ty};
_CALayerRecalculateGeometry(_59,_38);
}
}),new objj_method(sel_getUid("affineTransform"),function(_5c,_5d){
with(_5c){
return _affineTransform;
}
}),new objj_method(sel_getUid("setSublayerTransform:"),function(_5e,_5f,_60){
with(_5e){
if(CGAffineTransformEqualToTransform(_sublayerTransform,_60)){
return;
}
var _61=_hasSublayerTransform;
_sublayerTransform={a:_60.a,b:_60.b,c:_60.c,d:_60.d,tx:_60.tx,ty:_60.ty};
_hasSublayerTransform=!(_sublayerTransform.a==1&&_sublayerTransform.b==0&&_sublayerTransform.c==0&&_sublayerTransform.d==1&&_sublayerTransform.tx==0&&_sublayerTransform.ty==0);
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_5e);
var _62=_sublayers.length;
while(_62--){
_CALayerRecalculateGeometry(_sublayers[_62],_39);
}
}
}
}),new objj_method(sel_getUid("sublayerTransform"),function(_63,_64){
with(_63){
return _sublayerTransform;
}
}),new objj_method(sel_getUid("transformToLayer"),function(_65,_66){
with(_65){
return _transformToLayer;
}
}),new objj_method(sel_getUid("setFrame:"),function(_67,_68,_69){
with(_67){
alert("FIXME IMPLEMENT");
}
}),new objj_method(sel_getUid("frame"),function(_6a,_6b){
with(_6a){
if(!_frame){
_frame=objj_msgSend(_6a,"convertRect:toLayer:",_bounds,_superlayer);
}
return _frame;
}
}),new objj_method(sel_getUid("backingStoreFrame"),function(_6c,_6d){
with(_6c){
return _backingStoreFrame;
}
}),new objj_method(sel_getUid("setBackingStoreFrame:"),function(_6e,_6f,_70){
with(_6e){
_hasCustomBackingStoreFrame=(_70!=nil);
if(_70==nil){
_70=CGRectMakeCopy(_standardBackingStoreFrame);
}else{
if(_superlayer){
_70=objj_msgSend(_superlayer,"convertRect:toLayer:",_70,nil);
var _71=objj_msgSend(_superlayer,"bounds"),_72=objj_msgSend(_superlayer,"convertRect:toLayer:",_71,nil);
_70.origin.x-=(_72.origin.x);
_70.origin.y-=(_72.origin.y);
}else{
_70=CGRectMakeCopy(_70);
}
}
if(!CGPointEqualToPoint(_backingStoreFrame.origin,_70.origin)){
objj_msgSend(_6e,"registerRunLoopUpdateWithMask:",_3b);
}
if(!CGSizeEqualToSize(_backingStoreFrame.size,_70.size)){
objj_msgSend(_6e,"registerRunLoopUpdateWithMask:",_3c);
}
_backingStoreFrame=_70;
}
}),new objj_method(sel_getUid("contents"),function(_73,_74){
with(_73){
return _contents;
}
}),new objj_method(sel_getUid("setContents:"),function(_75,_76,_77){
with(_75){
if(_contents==_77){
return;
}
_contents=_77;
objj_msgSend(_75,"composite");
}
}),new objj_method(sel_getUid("composite"),function(_78,_79){
with(_78){
if(_3a&&!_contents||!_context){
return;
}
CGContextClearRect(_context,{origin:{x:0,y:0},size:{width:(_backingStoreFrame.size.width),height:(_backingStoreFrame.size.height)}});
var _7a=_transformFromLayer;
if(_superlayer){
var _7b=_CALayerGetTransform(_superlayer,nil),_7c=CGPointApplyAffineTransform(_superlayer._bounds.origin,_7b);
_7a=CGAffineTransformConcat(_7a,_7b);
_7a.tx-=_7c.x;
_7a.ty-=_7c.y;
}
_7a.tx-=(_backingStoreFrame.origin.x);
_7a.ty-=(_backingStoreFrame.origin.y);
CGContextSaveGState(_context);
CGContextConcatCTM(_context,_7a);
if(_3a){
_context.drawImage(_contents.buffer,(_bounds.origin.x),(_bounds.origin.y));
}else{
objj_msgSend(_78,"drawInContext:",_context);
}
CGContextRestoreGState(_context);
}
}),new objj_method(sel_getUid("display"),function(_7d,_7e){
with(_7d){
if(!_context){
_context=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_context.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_backingStoreFrame.size.width));
_DOMContentsElement.height=ROUND((_backingStoreFrame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_backingStoreFrame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_backingStoreFrame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
}
if(_3a){
if(_delegateRespondsToDisplayLayerSelector){
return objj_msgSend(_delegate,"displayInLayer:",_7d);
}
if((_backingStoreFrame.size.width)==0||(_backingStoreFrame.size.height)==0){
return;
}
if(!_contents){
_contents=CABackingStoreCreate();
}
CABackingStoreSetSize(_contents,_bounds.size);
objj_msgSend(_7d,"drawInContext:",CABackingStoreGetContext(_contents));
}
objj_msgSend(_7d,"composite");
}
}),new objj_method(sel_getUid("drawInContext:"),function(_7f,_80,_81){
with(_7f){
if(_backgroundColor){
CGContextSetFillColor(_81,_backgroundColor);
CGContextFillRect(_81,_bounds);
}
if(_delegateRespondsToDrawLayerInContextSelector){
objj_msgSend(_delegate,"drawLayer:inContext:",_7f,_81);
}
}
}),new objj_method(sel_getUid("opacity"),function(_82,_83){
with(_82){
return _opacity;
}
}),new objj_method(sel_getUid("setOpacity:"),function(_84,_85,_86){
with(_84){
if(_opacity==_86){
return;
}
_opacity=_86;
_DOMElement.style.opacity=_86;
_DOMElement.style.filter="alpha(opacity="+_86*100+")";
}
}),new objj_method(sel_getUid("setHidden:"),function(_87,_88,_89){
with(_87){
_isHidden=_89;
_DOMElement.style.display=_89?"none":"block";
}
}),new objj_method(sel_getUid("hidden"),function(_8a,_8b){
with(_8a){
return _isHidden;
}
}),new objj_method(sel_getUid("isHidden"),function(_8c,_8d){
with(_8c){
return _isHidden;
}
}),new objj_method(sel_getUid("setMasksToBounds:"),function(_8e,_8f,_90){
with(_8e){
if(_masksToBounds==_90){
return;
}
_masksToBounds=_90;
_DOMElement.style.overflow=_masksToBounds?"hidden":"visible";
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_91,_92,_93){
with(_91){
_backgroundColor=_93;
objj_msgSend(_91,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("backgroundColor"),function(_94,_95){
with(_94){
return _backgroundColor;
}
}),new objj_method(sel_getUid("sublayers"),function(_96,_97){
with(_96){
return _sublayers;
}
}),new objj_method(sel_getUid("superlayer"),function(_98,_99){
with(_98){
return _superlayer;
}
}),new objj_method(sel_getUid("addSublayer:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_9a,"insertSublayer:atIndex:",_9c,_sublayers.length);
return;
if(_DOMContentsElement&&_9c._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"addObject:",_9c);
_DOMElement.appendChild(_9c._DOMElement);
}
}),new objj_method(sel_getUid("removeFromSuperlayer"),function(_9d,_9e){
with(_9d){
if(_owningView){
objj_msgSend(_owningView,"setLayer:",nil);
}
if(!_superlayer){
return;
}
_superlayer._DOMElement.removeChild(_DOMElement);
objj_msgSend(_superlayer._sublayers,"removeObject:",_9d);
_superlayer=nil;
}
}),new objj_method(sel_getUid("insertSublayer:atIndex:"),function(_9f,_a0,_a1,_a2){
with(_9f){
if(!_a1){
return;
}
var _a3=objj_msgSend(_a1,"superlayer");
if(_a3==_9f){
var _a4=objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_a1);
if(_a4==_a2){
return;
}
objj_msgSend(_sublayers,"removeObjectAtIndex:",_a4);
if(_a4<_a2){
--_a2;
}
}else{
if(_a3!=nil){
objj_msgSend(_a1,"removeFromSuperlayer");
}
}
if(_DOMContentsElement&&_a1._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"insertObject:atIndex:",_a1,_a2);
if(_a2>=_sublayers.length-1){
_DOMElement.appendChild(_a1._DOMElement);
}else{
_DOMElement.insertBefore(_a1._DOMElement,_sublayers[_a2+1]._DOMElement);
}
_a1._superlayer=_9f;
if(_9f!=_a3){
_CALayerRecalculateGeometry(_a1,268435455);
}
}
}),new objj_method(sel_getUid("insertSublayer:below:"),function(_a5,_a6,_a7,_a8){
with(_a5){
var _a9=_a8?objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_a8):0;
objj_msgSend(_a5,"insertSublayer:atIndex:",_a7,_a9==CPNotFound?_sublayers.length:_a9);
}
}),new objj_method(sel_getUid("insertSublayer:above:"),function(_aa,_ab,_ac,_ad){
with(_aa){
var _ae=_ad?objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_ad):_sublayers.length;
if(_ae==CPNotFound){
objj_msgSend(CPException,"raise:reason:","CALayerNotFoundException","aSublayer is not a sublayer of this layer");
}
objj_msgSend(_sublayers,"insertObject:atIndex:",_ac,_ae==CPNotFound?_sublayers.length:_ae+1);
}
}),new objj_method(sel_getUid("replaceSublayer:with:"),function(_af,_b0,_b1,_b2){
with(_af){
if(_b1==_b2){
return;
}
if(_b1._superlayer!=_af){
alert("EXCEPTION");
return;
}
if(_DOMContentsElement&&_b2._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"replaceObjectAtIndex:withObject:",objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_b1),_b2);
_DOMElement.replaceChild(_b1._DOMElement,_b2._DOMElement);
}
}),new objj_method(sel_getUid("registerRunLoopUpdateWithMask:"),function(_b3,_b4,_b5){
with(_b3){
if(_41==nil){
_41={};
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("runLoopUpdateLayers"),CALayer,nil,0,[CPDefaultRunLoopMode]);
}
_runLoopUpdateMask|=_b5;
_41[objj_msgSend(_b3,"UID")]=_b3;
}
}),new objj_method(sel_getUid("setNeedsComposite"),function(_b6,_b7){
with(_b6){
objj_msgSend(_b6,"registerRunLoopUpdateWithMask:",_3f);
}
}),new objj_method(sel_getUid("setNeedsDisplay"),function(_b8,_b9){
with(_b8){
objj_msgSend(_b8,"registerRunLoopUpdateWithMask:",_3e);
}
}),new objj_method(sel_getUid("setNeedsDisplayOnBoundsChange:"),function(_ba,_bb,_bc){
with(_ba){
_needsDisplayOnBoundsChange=_bc;
}
}),new objj_method(sel_getUid("needsDisplayOnBoundsChange"),function(_bd,_be){
with(_bd){
return _needsDisplayOnBoundsChange;
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(_bf,_c0,_c1){
with(_bf){
_dirtyRect=_c1;
objj_msgSend(_bf,"display");
}
}),new objj_method(sel_getUid("convertPoint:fromLayer:"),function(_c2,_c3,_c4,_c5){
with(_c2){
return CGPointApplyAffineTransform(_c4,_CALayerGetTransform(_c5,_c2));
}
}),new objj_method(sel_getUid("convertPoint:toLayer:"),function(_c6,_c7,_c8,_c9){
with(_c6){
return CGPointApplyAffineTransform(_c8,_CALayerGetTransform(_c6,_c9));
}
}),new objj_method(sel_getUid("convertRect:fromLayer:"),function(_ca,_cb,_cc,_cd){
with(_ca){
return CGRectApplyAffineTransform(_cc,_CALayerGetTransform(_cd,_ca));
}
}),new objj_method(sel_getUid("convertRect:toLayer:"),function(_ce,_cf,_d0,_d1){
with(_ce){
return CGRectApplyAffineTransform(_d0,_CALayerGetTransform(_ce,_d1));
}
}),new objj_method(sel_getUid("containsPoint:"),function(_d2,_d3,_d4){
with(_d2){
return (_d4.x>=(_bounds.origin.x)&&_d4.y>=(_bounds.origin.y)&&_d4.x<(_bounds.origin.x+_bounds.size.width)&&_d4.y<(_bounds.origin.y+_bounds.size.height));
}
}),new objj_method(sel_getUid("hitTest:"),function(_d5,_d6,_d7){
with(_d5){
if(_isHidden){
return nil;
}
var _d8=CGPointApplyAffineTransform(_d7,_transformToLayer);
if(!(_d8.x>=(_bounds.origin.x)&&_d8.y>=(_bounds.origin.y)&&_d8.x<(_bounds.origin.x+_bounds.size.width)&&_d8.y<(_bounds.origin.y+_bounds.size.height))){
return nil;
}
var _d9=nil,_da=_sublayers.length;
while(_da--){
if(_d9=objj_msgSend(_sublayers[_da],"hitTest:",_d8)){
return _d9;
}
}
return _d5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_db,_dc,_dd){
with(_db){
if(_delegate==_dd){
return;
}
_delegate=_dd;
_delegateRespondsToDisplayLayerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("displayLayer:"));
_delegateRespondsToDrawLayerInContextSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("drawLayer:inContext:"));
if(_delegateRespondsToDisplayLayerSelector||_delegateRespondsToDrawLayerInContextSelector){
objj_msgSend(_db,"setNeedsDisplay");
}
}
}),new objj_method(sel_getUid("delegate"),function(_de,_df){
with(_de){
return _delegate;
}
}),new objj_method(sel_getUid("_setOwningView:"),function(_e0,_e1,_e2){
with(_e0){
_owningView=_e2;
if(_owningView){
_owningView=_e2;
_bounds.size=CGSizeMakeCopy(objj_msgSend(_owningView,"bounds").size);
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
}
_CALayerRecalculateGeometry(_e0,_36|_35);
}
}),new objj_method(sel_getUid("_owningViewBoundsChanged"),function(_e3,_e4){
with(_e3){
_bounds.size=CGSizeMakeCopy(objj_msgSend(_owningView,"bounds").size);
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
_CALayerRecalculateGeometry(_e3,_36|_35);
}
}),new objj_method(sel_getUid("_update"),function(_e5,_e6){
with(_e5){
window.loop=true;
var _e7=_runLoopUpdateMask;
if(_e7&_40){
_CALayerUpdateDOM(_e5,_e7);
}
if(_e7&_3e){
objj_msgSend(_e5,"display");
}else{
if(_e7&_3c||_e7&_3f){
objj_msgSend(_e5,"composite");
}
}
_runLoopUpdateMask=0;
window.loop=false;
}
})]);
class_addMethods(_43,[new objj_method(sel_getUid("layer"),function(_e8,_e9){
with(_e8){
return objj_msgSend(objj_msgSend(objj_msgSend(_e8,"class"),"alloc"),"init");
}
}),new objj_method(sel_getUid("runLoopUpdateLayers"),function(_ea,_eb){
with(_ea){
if(window.oops){
alert(window.latest);
objj_debug_print_backtrace();
}
window.loop=true;
for(UID in _41){
var _ec=_41[UID],_ed=_ec._runLoopUpdateMask;
if(_ed&_40){
_CALayerUpdateDOM(_ec,_ed);
}
if(_ed&_3e){
objj_msgSend(_ec,"display");
}else{
if(_ed&_3c||_ed&_3f){
objj_msgSend(_ec,"composite");
}
}
_ec._runLoopUpdateMask=0;
}
window.loop=false;
_41=nil;
}
})]);
_CALayerUpdateSublayerTransformForSublayers=function(_ee){
var _ef=_ee._bounds,_f0=_ee._anchorPoint,_f1=(_ef.size.width)*_f0.x,_f2=(_ef.size.height)*_f0.y;
_ee._sublayerTransformForSublayers=CGAffineTransformConcat(CGAffineTransformMakeTranslation(-_f1,-_f2),CGAffineTransformConcat(_ee._sublayerTransform,CGAffineTransformMakeTranslation(_f1,_f2)));
};
_CALayerUpdateDOM=function(_f3,_f4){
var _f5=_f3._DOMElement.style;
if(_f4&_3d){
_f5.zIndex=_f3._zPosition;
}
var _f6=_f3._backingStoreFrame;
if(_f4&_3b){
_f5.top=ROUND((_f6.origin.y))+"px";
_f5.left=ROUND((_f6.origin.x))+"px";
}
if(_f4&_3c){
var _f7=MAX(0,ROUND((_f6.size.width))),_f8=MAX(0,ROUND((_f6.size.height))),_f9=_f3._DOMContentsElement;
_f5.width=_f7+"px";
_f5.height=_f8+"px";
if(_f9){
_f9.width=_f7;
_f9.height=_f8;
_f9.style.width=_f7+"px";
_f9.style.height=_f8+"px";
}
}
};
_CALayerRecalculateGeometry=function(_fa,_fb){
var _fc=_fa._bounds,_fd=_fa._superlayer,_fe=(_fc.size.width),_ff=(_fc.size.height),_100=_fa._position,_101=_fa._anchorPoint,_102=_fa._affineTransform,_103={width:_fa._backingStoreFrame.width,height:_fa._backingStoreFrame.height},_104=_fa._hasCustomBackingStoreFrame;
_fa._transformFromLayer=CGAffineTransformConcat(CGAffineTransformMakeTranslation(-_fe*_101.x-(_fa._bounds.origin.x),-_ff*_101.y-(_fa._bounds.origin.y)),CGAffineTransformConcat(_102,CGAffineTransformMakeTranslation(_100.x,_100.y)));
if(_fd&&_fd._hasSublayerTransform){
var tx=_fa._transformFromLayer.tx*_fd._sublayerTransformForSublayers.a+_fa._transformFromLayer.ty*_fd._sublayerTransformForSublayers.c+_fd._sublayerTransformForSublayers.tx;
_fa._transformFromLayer.ty=_fa._transformFromLayer.tx*_fd._sublayerTransformForSublayers.b+_fa._transformFromLayer.ty*_fd._sublayerTransformForSublayers.d+_fd._sublayerTransformForSublayers.ty;
_fa._transformFromLayer.tx=tx;
var a=_fa._transformFromLayer.a*_fd._sublayerTransformForSublayers.a+_fa._transformFromLayer.b*_fd._sublayerTransformForSublayers.c,b=_fa._transformFromLayer.a*_fd._sublayerTransformForSublayers.b+_fa._transformFromLayer.b*_fd._sublayerTransformForSublayers.d,c=_fa._transformFromLayer.c*_fd._sublayerTransformForSublayers.a+_fa._transformFromLayer.d*_fd._sublayerTransformForSublayers.c;
_fa._transformFromLayer.d=_fa._transformFromLayer.c*_fd._sublayerTransformForSublayers.b+_fa._transformFromLayer.d*_fd._sublayerTransformForSublayers.d;
_fa._transformFromLayer.a=a;
_fa._transformFromLayer.b=b;
_fa._transformFromLayer.c=c;
}
_fa._transformToLayer=CGAffineTransformInvert(_fa._transformFromLayer);
_fa._frame=nil;
_fa._standardBackingStoreFrame=objj_msgSend(_fa,"convertRect:toLayer:",_fc,nil);
if(_fd){
var _fc=objj_msgSend(_fd,"bounds"),_109=objj_msgSend(_fd,"convertRect:toLayer:",_fc,nil);
_fa._standardBackingStoreFrame.origin.x-=(_109.origin.x);
_fa._standardBackingStoreFrame.origin.y-=(_109.origin.y);
}
var _10a=_fa._standardBackingStoreFrame.origin,size=_fa._standardBackingStoreFrame.size;
_10a.x=FLOOR(_10a.x);
_10a.y=FLOOR(_10a.y);
size.width=CEIL(size.width)+1;
size.height=CEIL(size.height)+1;
if(!_104){
var _10c=CGRectMakeCopy(_fa._standardBackingStoreFrame);
if(ROUND((_10c.origin.x))!=ROUND((_fa._backingStoreFrame.origin.x))||ROUND((_10c.origin.y))!=ROUND((_fa._backingStoreFrame.origin.y))){
objj_msgSend(_fa,"registerRunLoopUpdateWithMask:",_3b);
}
if(((_10c.size.width)!=ROUND((_fa._backingStoreFrame.size.width))||(_10c.size.height)!=ROUND((_fa._backingStoreFrame.size.height)))){
objj_msgSend(_fa,"registerRunLoopUpdateWithMask:",_3c);
}
_fa._backingStoreFrame=_10c;
}
if(_fb&_35&&_fa._needsDisplayOnBoundsChange){
objj_msgSend(_fa,"setNeedsDisplay");
}else{
if(_104||(_fb&~(_36|_37))){
objj_msgSend(_fa,"setNeedsComposite");
}
}
var _10d=_fa._sublayers,_10e=0,_10f=_10d.length;
for(;_10e<_10f;++_10e){
_CALayerRecalculateGeometry(_10d[_10e],_fb);
}
};
_CALayerGetTransform=function(_110,_111){
var _112=CGAffineTransformMakeIdentity();
if(_110){
var _113=_110;
while(_113&&_113!=_111){
var _114=_113._transformFromLayer;
var tx=_112.tx*_114.a+_112.ty*_114.c+_114.tx;
_112.ty=_112.tx*_114.b+_112.ty*_114.d+_114.ty;
_112.tx=tx;
var a=_112.a*_114.a+_112.b*_114.c,b=_112.a*_114.b+_112.b*_114.d,c=_112.c*_114.a+_112.d*_114.c;
_112.d=_112.c*_114.b+_112.d*_114.d;
_112.a=a;
_112.b=b;
_112.c=c;
_113=_113._superlayer;
}
if(_113==_111){
return _112;
}
}
var _119=[],_113=_111;
while(_113){
_119.push(_113);
_113=_113._superlayer;
}
var _11a=_119.length;
while(_11a--){
var _11b=_119[_11a]._transformToLayer;
var tx=_112.tx*_11b.a+_112.ty*_11b.c+_11b.tx;
_112.ty=_112.tx*_11b.b+_112.ty*_11b.d+_11b.ty;
_112.tx=tx;
var a=_112.a*_11b.a+_112.b*_11b.c,b=_112.a*_11b.b+_112.b*_11b.d,c=_112.c*_11b.a+_112.d*_11b.c;
_112.d=_112.c*_11b.b+_112.d*_11b.d;
_112.a=a;
_112.b=b;
_112.c=c;
}
return _112;
};
p;23;CAMediaTimingFunction.jI;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2072;
kCAMediaTimingFunctionLinear="kCAMediaTimingFunctionLinear";
kCAMediaTimingFunctionEaseIn="kCAMediaTimingFunctionEaseIn";
kCAMediaTimingFunctionEaseOut="kCAMediaTimingFunctionEaseOut";
kCAMediaTimingFunctionEaseInEaseOut="kCAMediaTimingFunctionEaseInEaseOut";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CAMediaTimingFunction"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_c1x"),new objj_ivar("_c1y"),new objj_ivar("_c2x"),new objj_ivar("_c2y")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithControlPoints::::"),function(_4,_5,_6,_7,_8,_9){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_c1x=_6;
_c1y=_7;
_c2x=_8;
_c2y=_9;
}
return _4;
}
}),new objj_method(sel_getUid("getControlPointAtIndex:values:"),function(_a,_b,_c,_d){
with(_a){
if(_c==0){
_d[0]=0;
_d[1]=0;
}else{
if(_c==1){
_d[0]=_c1x;
_d[1]=_c1y;
}else{
if(_c==2){
_d[0]=_c2x;
_d[1]=_c2y;
}else{
_d[0]=1;
_d[1]=1;
}
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("functionWithName:"),function(_e,_f,_10){
with(_e){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0,0,1,1),kCAMediaTimingFunctionLinear);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.42,0,1,1),kCAMediaTimingFunctionEaseIn);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0,0,0.58,1),kCAMediaTimingFunctionEaseOut);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.42,0,0.58,1),kCAMediaTimingFunctionEaseInEaseOut);
}
return objj_msgSend(_1,"objectForKey:",_10);
}
}),new objj_method(sel_getUid("functionWithControlPoints::::"),function(_11,_12,c1x,c1y,c2x,c2y){
with(_11){
return objj_msgSend(objj_msgSend(_11,"alloc"),"initWithControlPoints::::",c1x,c1y,c2x,c2y);
}
})]);
p;19;CGAffineTransform.ji;12;CGGeometry.jc;2950;
CGAffineTransformMake=function(a,b,c,d,tx,ty){
return {a:a,b:b,c:c,d:d,tx:tx,ty:ty};
};
CGAffineTransformMakeIdentity=function(){
return {a:1,b:0,c:0,d:1,tx:0,ty:0};
};
CGAffineTransformMakeCopy=function(_7){
return {a:_7.a,b:_7.b,c:_7.c,d:_7.d,tx:_7.tx,ty:_7.ty};
};
CGAffineTransformMakeScale=function(sx,sy){
return {a:sx,b:0,c:0,d:sy,tx:0,ty:0};
};
CGAffineTransformMakeTranslation=function(tx,ty){
return {a:1,b:0,c:0,d:1,tx:tx,ty:ty};
};
CGAffineTransformTranslate=function(_c,tx,ty){
return {a:_c.a,b:_c.b,c:_c.c,d:_c.d,tx:_c.tx+_c.a*tx+_c.c*ty,ty:_c.ty+_c.b*tx+_c.d*ty};
};
CGAffineTransformScale=function(_f,sx,sy){
return {a:_f.a*sx,b:_f.b*sx,c:_f.c*sy,d:_f.d*sy,tx:_f.tx,ty:_f.ty};
};
CGAffineTransformConcat=function(lhs,rhs){
return {a:lhs.a*rhs.a+lhs.b*rhs.c,b:lhs.a*rhs.b+lhs.b*rhs.d,c:lhs.c*rhs.a+lhs.d*rhs.c,d:lhs.c*rhs.b+lhs.d*rhs.d,tx:lhs.tx*rhs.a+lhs.ty*rhs.c+rhs.tx,ty:lhs.tx*rhs.b+lhs.ty*rhs.d+rhs.ty};
};
CGPointApplyAffineTransform=function(_14,_15){
return {x:_14.x*_15.a+_14.y*_15.c+_15.tx,y:_14.x*_15.b+_14.y*_15.d+_15.ty};
};
CGSizeApplyAffineTransform=function(_16,_17){
return {width:_16.width*_17.a+_16.height*_17.c,height:_16.width*_17.b+_16.height*_17.d};
};
CGAffineTransformIsIdentity=function(_18){
return (_18.a==1&&_18.b==0&&_18.c==0&&_18.d==1&&_18.tx==0&&_18.ty==0);
};
CGAffineTransformEqualToTransform=function(lhs,rhs){
return (lhs.a==rhs.a&&lhs.b==rhs.b&&lhs.c==rhs.c&&lhs.d==rhs.d&&lhs.tx==rhs.tx&&lhs.ty==rhs.ty);
};
CGStringCreateWithCGAffineTransform=function(_1b){
return (" [[ "+_1b.a+", "+_1b.b+", 0 ], [ "+_1b.c+", "+_1b.d+", 0 ], [ "+_1b.tx+", "+_1b.ty+", 1]]");
};
CGAffineTransformCreateCopy=function(_1c){
return {a:_1c.a,b:_1c.b,c:_1c.c,d:_1c.d,tx:_1c.tx,ty:_1c.ty};
};
CGAffineTransformMakeRotation=function(_1d){
var sin=SIN(_1d),cos=COS(_1d);
return {a:cos,b:sin,c:-sin,d:cos,tx:0,ty:0};
};
CGAffineTransformRotate=function(_20,_21){
var sin=SIN(_21),cos=COS(_21);
return {a:_20.a*cos+_20.c*sin,b:_20.b*cos+_20.d*sin,c:_20.c*cos-_20.a*sin,d:_20.d*cos-_20.b*sin,tx:_20.tx,ty:_20.ty};
};
CGAffineTransformInvert=function(_24){
var _25=1/(_24.a*_24.d-_24.b*_24.c);
return {a:_25*_24.d,b:-_25*_24.b,c:-_25*_24.c,d:_25*_24.a,tx:_25*(_24.c*_24.ty-_24.d*_24.tx),ty:_25*(_24.b*_24.tx-_24.a*_24.ty)};
};
CGRectApplyAffineTransform=function(_26,_27){
var top=(_26.origin.y),_29=(_26.origin.x),_2a=(_26.origin.x+_26.size.width),_2b=(_26.origin.y+_26.size.height),_2c=CGPointApplyAffineTransform({x:_29,y:top},_27),_2d=CGPointApplyAffineTransform({x:_2a,y:top},_27),_2e=CGPointApplyAffineTransform({x:_29,y:_2b},_27),_2f=CGPointApplyAffineTransform({x:_2a,y:_2b},_27),_30=MIN(_2c.x,_2d.x,_2e.x,_2f.x),_31=MAX(_2c.x,_2d.x,_2e.x,_2f.x),_32=MIN(_2c.y,_2d.y,_2e.y,_2f.y),_33=MAX(_2c.y,_2d.y,_2e.y,_2f.y);
return {origin:{x:_30,y:_32},size:{width:(_31-_30),height:(_33-_32)}};
};
CPStringFromCGAffineTransform=function(_34){
return "{"+_34.a+", "+_34.b+", "+_34.c+", "+_34.d+", "+_34.tx+", "+_34.ty+"}";
};
p;9;CGColor.ji;14;CGColorSpace.jc;2065;
var _1=0;
CFHashCode=function(_2){
if(!_2.hash){
_2.hash=++_1;
}
return _2;
};
kCGColorWhite="kCGColorWhite";
kCGColorBlack="kCGColorBlack";
kCGColorClear="kCGColorClear";
var _3={};
CGColorGetConstantColor=function(_4){
alert("FIX ME");
};
CGColorRetain=function(_5){
return _5;
};
CGColorRelease=function(){
};
CGColorCreate=function(_6,_7){
if(!_6||!_7){
return NULL;
}
var _7=_7.slice();
CGColorSpaceStandardizeComponents(_6,_7);
var _8=CFHashCode(_6)+_7.join("");
if(_3[_8]){
return _3[_8];
}
return _3[_8]={colorspace:_6,pattern:NULL,components:_7};
};
CGColorCreateCopy=function(_9){
return _9;
};
CGColorCreateGenericGray=function(_a,_b){
return CGColorCreate(0,[_a,_b]);
};
CGColorCreateGenericRGB=function(_c,_d,_e,_f){
return CGColorCreate(0,[_c,_d,_e,_f]);
};
CGColorCreateGenericCMYK=function(_10,_11,_12,_13,_14){
return CGColorCreate(0,[_10,_11,_12,_13,_14]);
};
CGColorCreateCopyWithAlpha=function(_15,_16){
var _17=_15.components;
if(!_15||_16==_17[_17.length-1]){
return _15;
}
if(_15.pattern){
var _18=CGColorCreateWithPattern(_15.colorspace,_15.pattern,_17);
}else{
var _18=CGColorCreate(_15.colorspace,_17);
}
_18.components[_17.length-1]=_16;
return _18;
};
CGColorCreateWithPattern=function(_19,_1a,_1b){
if(!_19||!_1a||!_1b){
return NULL;
}
return {colorspace:_19,pattern:_1a,components:_1b.slice()};
};
CGColorEqualToColor=function(lhs,rhs){
if(lhs==rhs){
return true;
}
if(!lhs||!rhs){
return false;
}
var _1e=lhs.components,_1f=rhs.components,_20=_1e.length;
if(_20!=_1f.length){
return false;
}
while(_20--){
if(_1e[_20]!=_1f[_20]){
return false;
}
}
if(lhs.pattern!=rhs.pattern){
return false;
}
if(CGColorSpaceEqualToColorSpace(lhs.colorspace,rhs.colorspace)){
return false;
}
return true;
};
CGColorGetAlpha=function(_21){
var _22=_21.components;
return _22[_22.length-1];
};
CGColorGetColorSpace=function(_23){
return _23.colorspace;
};
CGColorGetComponents=function(_24){
return _24.components;
};
CGColorGetNumberOfComponents=function(_25){
return _25.components.length;
};
CGColorGetPattern=function(_26){
return _26.pattern;
};
p;14;CGColorSpace.jc;3502;
kCGColorSpaceModelUnknown=-1;
kCGColorSpaceModelMonochrome=0;
kCGColorSpaceModelRGB=1;
kCGColorSpaceModelCMYK=2;
kCGColorSpaceModelLab=3;
kCGColorSpaceModelDeviceN=4;
kCGColorSpaceModelIndexed=5;
kCGColorSpaceModelPattern=6;
kCGColorSpaceGenericGray="CGColorSpaceGenericGray";
kCGColorSpaceGenericRGB="CGColorSpaceGenericRGB";
kCGColorSpaceGenericCMYK="CGColorSpaceGenericCMYK";
kCGColorSpaceGenericRGBLinear="CGColorSpaceGenericRGBLinear";
kCGColorSpaceGenericRGBHDR="CGColorSpaceGenericRGBHDR";
kCGColorSpaceAdobeRGB1998="CGColorSpaceAdobeRGB1998";
kCGColorSpaceSRGB="CGColorSpaceSRGB";
var _1={};
CGColorSpaceCreateCalibratedGray=function(_2,_3,_4){
return {model:kCGColorSpaceModelMonochrome,count:1,base:NULL};
};
CGColorSpaceCreateCalibratedRGB=function(_5,_6,_7){
return {model:kCGColorSpaceModelRGB,count:1,base:NULL};
};
CGColorSpaceCreateICCBased=function(_8,_9,_a,_b){
return NULL;
};
CGColorSpaceCreateLab=function(_c,_d,_e){
return NULL;
};
CGColorSpaceCreateDeviceCMYK=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK);
};
CGColorSpaceCreateDeviceGray=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
};
CGColorSpaceCreateDeviceRGB=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
};
CGColorSpaceCreateWithPlatformColorSpace=function(){
return NULL;
};
CGColorSpaceCreateIndexed=function(_f,_10,_11){
return NULL;
};
CGColorSpaceCreatePattern=function(_12){
if(_12){
return {model:kCGColorSpaceModelPattern,count:_12.count,base:_12};
}
return {model:kCGColorSpaceModelPattern,count:0,base:NULL};
};
CGColorSpaceCreateWithName=function(_13){
var _14=_1[_13];
if(_14){
return _14;
}
switch(_13){
case kCGColorSpaceGenericGray:
return _1[_13]={model:kCGColorSpaceModelMonochrome,count:1,base:NULL};
case kCGColorSpaceGenericRGB:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceGenericCMYK:
return _1[_13]={model:kCGColorSpaceModelCMYK,count:4,base:NULL};
case kCGColorSpaceGenericRGBLinear:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceGenericRGBHDR:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceAdobeRGB1998:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceSRGB:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
}
return NULL;
};
CGColorSpaceCopyICCProfile=function(_15){
return NULL;
};
CGColorSpaceGetNumberOfComponents=function(_16){
return _16.count;
};
CGColorSpaceGetTypeID=function(_17){
};
CGColorSpaceGetModel=function(_18){
return _18.model;
};
CGColorSpaceGetBaseColorSpace=function(_19){
};
CGColorSpaceGetColorTableCount=function(_1a){
};
CGColorSpaceGetColorTable=function(_1b){
};
CGColorSpaceRelease=function(_1c){
};
CGColorSpaceRetain=function(_1d){
return _1d;
};
CGColorSpaceStandardizeComponents=function(_1e,_1f){
var _20=_1e.count;
if(_20>_1f.length){
_1f[_20]=1;
return;
}
var _21=_1f[_20];
if(_21<0){
_1f[_20]=0;
}else{
if(_21>1){
_1f[_20]=1;
}else{
_1f[_20]=ROUND(_21*1000)/1000;
}
}
if(_1e.base){
_1e=_1e.base;
}
switch(_1e.model){
case kCGColorSpaceModelMonochrome:
case kCGColorSpaceModelRGB:
case kCGColorSpaceModelCMYK:
case kCGColorSpaceModelDeviceN:
while(_20--){
if(_20>_1f.length){
_1f[_20]=1;
return;
}
var _21=_1f[_20];
if(_21<0){
_1f[_20]=0;
}else{
if(_21>1){
_1f[_20]=1;
}else{
_1f[_20]=ROUND(_21*255)/255;
}
}
}
break;
case kCGColorSpaceModelIndexed:
case kCGColorSpaceModelLab:
case kCGColorSpaceModelPattern:
break;
}
};
p;11;CGContext.ji;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;20472;
kCGLineCapButt=0;
kCGLineCapRound=1;
kCGLineCapSquare=2;
kCGLineJoinMiter=0;
kCGLineJoinRound=1;
kCGLineJoinBevel=2;
kCGPathFill=0;
kCGPathEOFill=1;
kCGPathStroke=2;
kCGPathFillStroke=3;
kCGPathEOFillStroke=4;
kCGBlendModeNormal=0;
kCGBlendModeMultiply=1;
kCGBlendModeScreen=2;
kCGBlendModeOverlay=3;
kCGBlendModeDarken=4;
kCGBlendModeLighten=5;
kCGBlendModeColorDodge=6;
kCGBlendModeColorBurn=7;
kCGBlendModeSoftLight=8;
kCGBlendModeHardLight=9;
kCGBlendModeDifference=10;
kCGBlendModeExclusion=11;
kCGBlendModeHue=12;
kCGBlendModeSaturation=13;
kCGBlendModeColor=14;
kCGBlendModeLuminosity=15;
kCGBlendModeClear=16;
kCGBlendModeCopy=17;
kCGBlendModeSourceIn=18;
kCGBlendModeSourceOut=19;
kCGBlendModeSourceAtop=20;
kCGBlendModeDestinationOver=21;
kCGBlendModeDestinationIn=22;
kCGBlendModeDestinationOut=23;
kCGBlendModeDestinationAtop=24;
kCGBlendModeXOR=25;
kCGBlendModePlusDarker=26;
kCGBlendModePlusLighter=27;
CGContextRelease=function(){
};
CGContextRetain=function(_1){
return _1;
};
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CGGStateCreate=function(){
return {alpha:1,strokeStyle:"#000",fillStyle:"#ccc",lineWidth:1,lineJoin:kCGLineJoinMiter,lineCap:kCGLineCapButt,miterLimit:10,globalAlpha:1,blendMode:kCGBlendModeNormal,shadowOffset:{width:0,height:0},shadowBlur:0,shadowColor:NULL,CTM:{a:1,b:0,c:0,d:1,tx:0,ty:0}};
};
CGGStateCreateCopy=function(_2){
return {alpha:_2.alpha,strokeStyle:_2.strokeStyle,fillStyle:_2.fillStyle,lineWidth:_2.lineWidth,lineJoin:_2.lineJoin,lineCap:_2.lineCap,miterLimit:_2.miterLimit,globalAlpha:_2.globalAlpha,blendMode:_2.blendMode,shadowOffset:_2.shadowOffset,shadowBlur:_2.shadowBlur,shadowColor:_2.shadowColor,CTM:{a:_2.CTM.a,b:_2.CTM.b,c:_2.CTM.c,d:_2.CTM.d,tx:_2.CTM.tx,ty:_2.CTM.ty}};
};
CGBitmapGraphicsContextCreate=function(){
return {DOMElement:document.createElement("div"),path:NULL,gState:CGGStateCreate(),gStateStack:[]};
};
CGContextSaveGState=function(_3){
_3.gStateStack.push(CGGStateCreateCopy(_3.gState));
};
CGContextRestoreGState=function(_4){
_4.gState=_4.gStateStack.pop();
};
CGContextSetLineCap=function(_5,_6){
_5.gState.lineCap=_6;
};
CGContextSetLineJoin=function(_7,_8){
_7.gState.lineJoin=_8;
};
CGContextSetLineWidth=function(_9,_a){
_9.gState.lineWidth=_a;
};
CGContextSetMiterLimit=function(_b,_c){
_b.gState.miterLimit=_c;
};
CGContextSetBlendMode=function(_d,_e){
_d.gState.blendMode=_e;
};
CGContextAddArc=function(_f,x,y,_12,_13,_14,_15){
CGPathAddArc(_f.path,_f.gState.CTM,x,y,_12,_13,_14,_15);
};
CGContextAddArcToPoint=function(_16,x1,y1,x2,y2,_1b){
CGPathAddArcToPoint(_16.path,_16.gState.CTM,x1,y1,x2,y2,_1b);
};
CGContextAddCurveToPoint=function(_1c,_1d,_1e,_1f,_20,x,y){
CGPathAddCurveToPoint(_1c.path,_1c.gState.CTM,_1d,_1e,_1f,_20,x,y);
};
CGContextAddLines=function(_23,_24,_25){
CGPathAddLines(_23.path,_23.gState.CTM,_24,_25);
};
CGContextAddLineToPoint=function(_26,x,y){
CGPathAddLineToPoint(_26.path,_26.gState.CTM,x,y);
};
CGContextAddPath=function(_29,_2a){
if(!_29||CGPathIsEmpty(_2a)){
return;
}
if(!_29.path){
_29.path=CGPathCreateMutable();
}
CGPathAddPath(_29.path,_29.gState.CTM,_2a);
};
CGContextAddQuadCurveToPoint=function(_2b,cpx,cpy,x,y){
CGPathAddQuadCurveToPoint(_2b.path,_2b.gState.CTM,cpx,cpy,x,y);
};
CGContextAddRect=function(_30,_31){
CGPathAddRect(_30.path,_30.gState.CTM,_31);
};
CGContextAddRects=function(_32,_33,_34){
CGPathAddRects(_32.path,_32.gState.CTM,_33,_34);
};
CGContextBeginPath=function(_35){
_35.path=CGPathCreateMutable();
};
CGContextClosePath=function(_36){
CGPathCloseSubpath(_36.path);
};
CGContextMoveToPoint=function(_37,x,y){
if(!_37.path){
_37.path=CGPathCreateMutable();
}
CGPathMoveToPoint(_37.path,_37.gState.CTM,x,y);
};
CGContextFillRect=function(_3a,_3b){
CGContextFillRects(_3a,[_3b],1);
};
CGContextFillRects=function(_3c,_3d,_3e){
if(arguments[2]===undefined){
var _3e=_3d.length;
}
CGContextBeginPath(_3c);
CGContextAddRects(_3c,_3d,_3e);
CGContextClosePath(_3c);
CGContextDrawPath(_3c,kCGPathFill);
};
CGContextStrokeRect=function(_3f,_40){
CGContextBeginPath(_3f);
CGContextAddRect(_3f,_40);
CGContextClosePath(_3f);
CGContextDrawPath(_3f,kCGPathStroke);
};
CGContextStrokeRectWithWidth=function(_41,_42,_43){
CGContextSaveGState(_41);
CGContextSetLineWidth(_41,_43);
CGContextStrokeRect(_41,_42);
CGContextRestoreGState(_41);
};
CGContextConcatCTM=function(_44,_45){
var CTM=_44.gState.CTM;
var tx=CTM.tx*_45.a+CTM.ty*_45.c+_45.tx;
CTM.ty=CTM.tx*_45.b+CTM.ty*_45.d+_45.ty;
CTM.tx=tx;
var a=CTM.a*_45.a+CTM.b*_45.c,b=CTM.a*_45.b+CTM.b*_45.d,c=CTM.c*_45.a+CTM.d*_45.c;
CTM.d=CTM.c*_45.b+CTM.d*_45.d;
CTM.a=a;
CTM.b=b;
CTM.c=c;
};
CGContextGetCTM=function(_4b){
return _4b.gState.CTM;
};
CGContextRotateCTM=function(_4c,_4d){
var _4e=_4c.gState;
_4e.CTM=CGAffineTransformRotate(_4e.CTM,_4d);
};
CGContextScaleCTM=function(_4f,sx,sy){
var _52=_4f.gState;
_52.CTM={a:_52.CTM.a*sx,b:_52.CTM.b*sx,c:_52.CTM.c*sy,d:_52.CTM.d*sy,tx:_52.CTM.tx,ty:_52.CTM.ty};
};
CGContextTranslateCTM=function(_53,tx,ty){
var _56=_53.gState;
_56.CTM={a:_56.CTM.a,b:_56.CTM.b,c:_56.CTM.c,d:_56.CTM.d,tx:_56.CTM.tx+_56.CTM.a*tx+_56.CTM.c*ty,ty:_56.CTM.ty+_56.CTM.b*tx+_56.CTM.d*ty};
};
CGContextSetShadow=function(_57,_58,_59){
var _5a=_57.gState;
_5a.shadowOffset={width:_58.width,height:_58.height};
_5a.shadowBlur=_59;
_5a.shadowColor=objj_msgSend(CPColor,"shadowColor");
};
CGContextSetShadowWithColor=function(_5b,_5c,_5d,_5e){
var _5f=_5b.gState;
_5f.shadowOffset={width:_5c.width,height:_5c.height};
_5f.shadowBlur=_5d;
_5f.shadowColor=_5e;
};
CGContextSetAlpha=function(_60,_61){
_60.gState.alpha=MAX(MIN(_61,1),0);
};
}
CGContextEOFillPath=function(_62){
CGContextDrawPath(_62,kCGPathEOFill);
};
CGContextFillPath=function(_63){
CGContextDrawPath(_63,kCGPathFill);
};
var _64=4*((SQRT2-1)/3);
CGContextAddEllipseInRect=function(_65,_66){
CGContextBeginPath(_65);
CGContextAddPath(_65,CGPathWithEllipseInRect(_66));
CGContextClosePath(_65);
};
CGContextFillEllipseInRect=function(_67,_68){
CGContextBeginPath(_67);
CGContextAddEllipseInRect(_67,_68);
CGContextClosePath(_67);
CGContextFillPath(_67);
};
CGContextStrokeEllipseInRect=function(_69,_6a){
CGContextBeginPath(_69);
CGContextAddEllipseInRect(_69,_6a);
CGContextClosePath(_69);
CGContextStrokePath(_69);
};
CGContextStrokePath=function(_6b){
CGContextDrawPath(_6b,kCGPathStroke);
};
CGContextStrokeLineSegments=function(_6c,_6d,_6e){
var i=0;
if(arguments["count"]==NULL){
var _6e=_6d.length;
}
CGContextBeginPath(_6c);
for(;i<_6e;i+=2){
CGContextMoveToPoint(_6c,_6d[i].x,_6d[i].y);
CGContextAddLineToPoint(_6c,_6d[i+1].x,_6d[i+1].y);
}
CGContextStrokePath(_6c);
};
CGContextSetFillColor=function(_70,_71){
if(_71){
_70.gState.fillStyle=objj_msgSend(_71,"cssString");
}
};
CGContextSetStrokeColor=function(_72,_73){
if(_73){
_72.gState.strokeStyle=objj_msgSend(_73,"cssString");
}
};
CGContextFillRoundedRectangleInRect=function(_74,_75,_76,ne,se,sw,nw){
CGContextBeginPath(_74);
CGContextAddPath(_74,CGPathWithRoundedRectangleInRect(_75,_76,_76,ne,se,sw,nw));
CGContextClosePath(_74);
CGContextFillPath(_74);
};
CGContextStrokeRoundedRectangleInRect=function(_7b,_7c,_7d,ne,se,sw,nw){
CGContextBeginPath(_7b);
CGContextAddPath(_7b,CGPathWithRoundedRectangleInRect(_7c,_7d,_7d,ne,se,sw,nw));
CGContextClosePath(_7b);
CGContextStrokePath(_7b);
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
var _82=["butt","round","square"],_83=["miter","round","bevel"],_84=["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState=function(_85){
_85.save();
};
CGContextRestoreGState=function(_86){
_86.restore();
};
CGContextSetLineCap=function(_87,_88){
_87.lineCap=_82[_88];
};
CGContextSetLineJoin=function(_89,_8a){
_89.lineJoin=_83[_8a];
};
CGContextSetLineWidth=function(_8b,_8c){
_8b.lineWidth=_8c;
};
CGContextSetMiterLimit=function(_8d,_8e){
_8d.miterLimit=_8e;
};
CGContextSetBlendMode=function(_8f,_90){
_8f.globalCompositeOperation=_84[_90];
};
CGContextAddArc=function(_91,x,y,_94,_95,_96,_97){
_91.arc(x,y,_94,_95,_96,!_97);
};
CGContextAddArcToPoint=function(_98,x1,y1,x2,y2,_9d){
_98.arcTo(x1,y1,x2,y2,_9d);
};
CGContextAddCurveToPoint=function(_9e,_9f,_a0,_a1,_a2,x,y){
_9e.bezierCurveTo(_9f,_a0,_a1,_a2,x,y);
};
CGContextAddLineToPoint=function(_a5,x,y){
_a5.lineTo(x,y);
};
CGContextAddPath=function(_a8,_a9){
if(!_a8||CGPathIsEmpty(_a9)){
return;
}
var _aa=_a9.elements,i=0,_ac=_a9.count;
for(;i<_ac;++i){
var _ad=_aa[i],_ae=_ad.type;
switch(_ae){
case kCGPathElementMoveToPoint:
_a8.moveTo(_ad.x,_ad.y);
break;
case kCGPathElementAddLineToPoint:
_a8.lineTo(_ad.x,_ad.y);
break;
case kCGPathElementAddQuadCurveToPoint:
_a8.quadraticCurveTo(_ad.cpx,_ad.cpy,_ad.x,_ad.y);
break;
case kCGPathElementAddCurveToPoint:
_a8.bezierCurveTo(_ad.cp1x,_ad.cp1y,_ad.cp2x,_ad.cp2y,_ad.x,_ad.y);
break;
case kCGPathElementCloseSubpath:
_a8.closePath();
break;
case kCGPathElementAddArc:
_a8.arc(_ad.x,_ad.y,_ad.radius,_ad.startAngle,_ad.endAngle,_ad.clockwise);
break;
case kCGPathElementAddArcTo:
break;
}
}
};
CGContextAddRect=function(_af,_b0){
_af.rect((_b0.origin.x),(_b0.origin.y),(_b0.size.width),(_b0.size.height));
};
CGContextAddRects=function(_b1,_b2,_b3){
var i=0;
if(arguments["count"]==NULL){
var _b3=_b2.length;
}
for(;i<_b3;++i){
var _b5=_b2[i];
_b1.rect((_b5.origin.x),(_b5.origin.y),(_b5.size.width),(_b5.size.height));
}
};
CGContextBeginPath=function(_b6){
_b6.beginPath();
};
CGContextClosePath=function(_b7){
_b7.closePath();
};
CGContextMoveToPoint=function(_b8,x,y){
_b8.moveTo(x,y);
};
CGContextClearRect=function(_bb,_bc){
_bb.clearRect((_bc.origin.x),(_bc.origin.y),(_bc.size.width),(_bc.size.height));
};
CGContextDrawPath=function(_bd,_be){
if(_be==kCGPathFill||_be==kCGPathFillStroke){
_bd.fill();
}else{
if(_be==kCGPathEOFill||_be==kCGPathEOFillStroke){
alert("not implemented!!!");
}
}
if(_be==kCGPathStroke||_be==kCGPathFillStroke||_be==kCGPathEOFillStroke){
_bd.stroke();
}
};
CGContextFillRect=function(_bf,_c0){
_bf.fillRect((_c0.origin.x),(_c0.origin.y),(_c0.size.width),(_c0.size.height));
};
CGContextFillRects=function(_c1,_c2,_c3){
var i=0;
if(arguments["count"]==NULL){
var _c3=_c2.length;
}
for(;i<_c3;++i){
var _c5=_c2[i];
_c1.fillRect((_c5.origin.x),(_c5.origin.y),(_c5.size.width),(_c5.size.height));
}
};
CGContextStrokeRect=function(_c6,_c7){
_c6.strokeRect((_c7.origin.x),(_c7.origin.y),(_c7.size.width),(_c7.size.height));
};
CGContextClip=function(_c8){
_c8.clip();
};
CGContextClipToRect=function(_c9,_ca){
_c9.beginPath();
_c9.rect((_ca.origin.x),(_ca.origin.y),(_ca.size.width),(_ca.size.height));
_c9.closePath();
_c9.clip();
};
CGContextClipToRects=function(_cb,_cc,_cd){
if(arguments["count"]==NULL){
var _cd=_cc.length;
}
_cb.beginPath();
CGContextAddRects(_cb,_cc,_cd);
_cb.clip();
};
CGContextSetAlpha=function(_ce,_cf){
_ce.globalAlpha=_cf;
};
CGContextSetFillColor=function(_d0,_d1){
_d0.fillStyle=objj_msgSend(_d1,"cssString");
};
CGContextSetStrokeColor=function(_d2,_d3){
_d2.strokeStyle=objj_msgSend(_d3,"cssString");
};
CGContextSetShadow=function(_d4,_d5,_d6){
_d4.shadowOffsetX=_d5.width;
_d4.shadowOffsetY=_d5.height;
_d4.shadowBlur=_d6;
};
CGContextSetShadowWithColor=function(_d7,_d8,_d9,_da){
_d7.shadowOffsetX=_d8.width;
_d7.shadowOffsetY=_d8.height;
_d7.shadowBlur=_d9;
_d7.shadowColor=objj_msgSend(_da,"cssString");
};
CGContextRotateCTM=function(_db,_dc){
_db.rotate(_dc);
};
CGContextScaleCTM=function(_dd,sx,sy){
_dd.scale(sx,sy);
};
CGContextTranslateCTM=function(_e0,tx,ty){
_e0.translate(tx,ty);
};
eigen=function(_e3){
alert("IMPLEMENT ME!");
};
if(CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature)){
CGContextConcatCTM=function(_e4,_e5){
_e4.transform(_e5.a,_e5.b,_e5.c,_e5.d,_e5.tx,_e5.ty);
};
}else{
CGContextConcatCTM=function(_e6,_e7){
var a=_e7.a,b=_e7.b,c=_e7.c,d=_e7.d,tx=_e7.tx,ty=_e7.ty,sx=1,sy=1,a1=0,a2=0;
if(b==0&&c==0){
sx=a;
sy=d;
}else{
if(a*b==-c*d){
var _f2=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_f2*c,_f2*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
}else{
if(a*c==-b*d){
var _f2=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_f2*b,_f2*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
}else{
var _f5=CGAffineTransformMake(a,c,b,d,0,0),u=eigen(CGAffineTransformConcat(_e7,_f5)),v=eigen(CGAffineTransformConcat(_f5,_e7)),U=CGAffineTransformMake(u.vector_1.x,u.vector_2.x,u.vector_1.y,u.vector_2.y,0,0),VT=CGAffineTransformMake(v.vector_1.x,v.vector_1.y,v.vector_2.x,v.vector_2.y,0,0),S=CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U),_e7),CGAffineTransformInvert(VT));
a=VT.a;
b=VT.b;
c=VT.c;
d=VT.d;
var _f2=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_f2*c,_f2*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
S.a*=sx;
S.d*=sy;
a=U.a;
b=U.b;
c=U.c;
d=U.d;
var _f2=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_f2*b,_f2*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
sx=S.a*sx;
sy=S.d*sy;
}
}
}
if(tx!=0||ty!=0){
CGContextTranslateCTM(_e6,tx,ty);
}
if(a1!=0){
CGContextRotateCTM(_e6,a1);
}
if(sx!=1||sy!=1){
CGContextScaleCTM(_e6,sx,sy);
}
if(a2!=0){
CGContextRotateCTM(_e6,a2);
}
};
}
CGContextDrawImage=function(_fb,_fc,_fd){
_fb.drawImage(_fd._image,(_fc.origin.x),(_fc.origin.y),(_fc.size.width),(_fc.size.height));
};
to_string=function(_fe){
return "rgba("+ROUND(_fe.components[0]*255)+", "+ROUND(_fe.components[1]*255)+", "+ROUND(255*_fe.components[2])+", "+_fe.components[3]+")";
};
CGContextDrawLinearGradient=function(_ff,_100,_101,_102,_103){
var _104=_100.colors,_105=_104.length,_106=_ff.createLinearGradient(_101.x,_101.y,_102.x,_102.y);
while(_105--){
_106.addColorStop(_100.locations[_105],to_string(_104[_105]));
}
_ff.fillStyle=_106;
_ff.fill();
};
CGBitmapGraphicsContextCreate=function(){
var _107=document.createElement("canvas"),_108=_107.getContext("2d");
_108.DOMElement=_107;
return _108;
};
}else{
if(CPFeatureIsCompatible(CPVMLFeature)){
var _109=["f","t"],_10a=["flat","round","square"],_10b=["miter","round","bevel"],_10c=[" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _10d=CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate=function(){
document.namespaces.add("cg_vml_","urn:schemas-microsoft-com:vml");
document.createStyleSheet().cssText="cg_vml_\\:*{behavior:url(#default#VML)}";
CGBitmapGraphicsContextCreate=_10d;
return _10d();
};
CGContextClearRect=function(_10e,_10f){
if(_10e.buffer!=nil){
_10e.buffer="";
}else{
_10e.DOMElement.innerHTML="";
}
_10e.path=NULL;
};
var W=10,H=10,Z=10,Z_2=Z/2;
CGContextDrawImage=function(_114,_115,_116){
var _117="";
if(_116.buffer!=nil){
_117=_116.buffer;
}else{
var ctm=_114.gState.CTM,_119=CGPointApplyAffineTransform(_115.origin,ctm),_11a=ctm.a==ctm.d&&ctm.b==-ctm.c,vml=["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
var _11c=CGRectApplyAffineTransform(_115,ctm);
vml.push(";padding:0 ",ROUND((_11c.origin.x+_11c.size.width)),"px ",ROUND((_11c.origin.y+_11c.size.height)),"px 0;filter:progid:DXImageTransform.Microsoft.Matrix(","M11='",ctm.a,"',M12='",ctm.c,"',M21='",ctm.b,"',M22='",ctm.d,"',","Dx='",ROUND(_119.x),"', Dy='",ROUND(_119.y),"', sizingmethod='clip');");
vml.push("\"><cg_vml_:image src=\"",_116._image.src,"\" style=\"width:",(_115.size.width),"px;height:",(_115.size.height),"px;\"/></g_vml_:group>");
_117=vml.join("");
}
if(_114.buffer!=nil){
_114.buffer+=_117;
}else{
_114.DOMElement.insertAdjacentHTML("BeforeEnd",_117);
}
};
CGContextDrawPath=function(_11d,_11e){
if(!_11d||CGPathIsEmpty(_11d.path)){
return;
}
var _11f=_11d.path.elements,i=0,_121=_11d.path.count,_122=_11d.gState,fill=(_11e==kCGPathFill||_11e==kCGPathFillStroke)?1:0,_124=(_11e==kCGPathStroke||_11e==kCGPathFillStroke)?1:0,_125=_122.alpha,vml=["<cg_vml_:shape"," fillcolor=\"",_122.fillStyle,"\" filled=\"",_109[fill],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",_109[_124],"\" strokeweight=\"",_122.lineWidth,"\" strokecolor=\"",_122.strokeStyle,"\" path=\""];
for(;i<_121;++i){
var _127=_11f[i],type=_127.type;
switch(type){
case kCGPathElementMoveToPoint:
case kCGPathElementAddLineToPoint:
vml.push(_10c[type],(ROUND(Z*(_127.x)-Z_2)),",",(ROUND(Z*(_127.y)-Z_2)));
break;
case kCGPathElementAddQuadCurveToPoint:
vml.push(_10c[type],(ROUND(Z*(_127.cpx)-Z_2)),",",(ROUND(Z*(_127.cpy)-Z_2)),",",(ROUND(Z*(_127.x)-Z_2)),",",(ROUND(Z*(_127.y)-Z_2)));
break;
case kCGPathElementAddCurveToPoint:
vml.push(_10c[type],(ROUND(Z*(_127.cp1x)-Z_2)),",",(ROUND(Z*(_127.cp1y)-Z_2)),",",(ROUND(Z*(_127.cp2x)-Z_2)),",",(ROUND(Z*(_127.cp2y)-Z_2)),",",(ROUND(Z*(_127.x)-Z_2)),",",(ROUND(Z*(_127.y)-Z_2)));
break;
case kCGPathElementCloseSubpath:
vml.push(_10c[type]);
break;
case kCGPathElementAddArc:
var x=_127.x,y=_127.y,_12b=_127.radius,_12c=_127.clockwise?1:0,_12d=_127.endAngle,_12e=_127.startAngle,_12f={x:x+_12b*COS(_12e),y:y+_12b*SIN(_12e)};
if(_12e==_12d&&!_12c){
vml.push(_10c[kCGPathElementMoveToPoint],(ROUND(Z*(_12f.x)-Z_2)),",",(ROUND(Z*(_12f.y)-Z_2)));
continue;
}
var end={x:x+_12b*COS(_12d),y:y+_12b*SIN(_12d)};
if(_12c&&_12e!=_12d&&(_12f.x==end.x&&_12f.y==end.y)){
if(_12f.x>=x){
if(_12f.y<y){
_12f.x+=0.125;
}else{
_12f.y+=0.125;
}
}else{
if(end.y<=y){
end.x+=0.125;
}else{
end.y+=0.125;
}
}
}
vml.push(_10c[type][_12c],(ROUND(Z*(x-_12b)-Z_2)),",",(ROUND(Z*(y-_12b)-Z_2))," ",(ROUND(Z*(x+_12b)-Z_2)),",",(ROUND(Z*(y+_12b)-Z_2))," ",(ROUND(Z*(_12f.x)-Z_2)),",",(ROUND(Z*(_12f.y)-Z_2))," ",(ROUND(Z*(end.x)-Z_2)),",",(ROUND(Z*(end.y)-Z_2)));
break;
case kCGPathElementAddArcTo:
break;
}
}
vml.push("\">");
if(_122.gradient){
vml.push(_122.gradient);
}else{
if(fill){
vml.push("<cg_vml_:fill color=\"",_122.fillStyle,"\" opacity=\"",_125,"\" />");
}
}
if(_124){
vml.push("<cg_vml_:stroke opacity=\"",_125,"\" joinstyle=\"",_10b[_122.lineJoin],"\" miterlimit=\"",_122.miterLimit,"\" endcap=\"",_10a[_122.lineCap],"\" weight=\"",_122.lineWidth,"","px\" color=\"",_122.strokeStyle,"\" />");
}
var _131=_122.shadowColor;
if(_131){
var _132=_122.shadowOffset;
vml.push("<cg_vml_:shadow on=\"t\" offset=\"",_132.width,"pt ",_132.height,"pt\" opacity=\"",objj_msgSend(_131,"alphaComponent"),"\" color=black />");
}
vml.push("</cg_vml_:shape>");
_11d.path=NULL;
if(_11d.buffer!=nil){
_11d.buffer+=vml.join("");
}else{
_11d.DOMElement.insertAdjacentHTML("BeforeEnd",vml.join(""));
}
};
to_string=function(_133){
return "rgb("+ROUND(_133.components[0]*255)+", "+ROUND(_133.components[1]*255)+", "+ROUND(255*_133.components[2])+")";
};
CGContextDrawLinearGradient=function(_134,_135,_136,_137,_138){
if(!_134||!_135){
return;
}
var vml=nil;
if(_135.vml_gradient){
var _13a=objj_msgSend(objj_msgSend(_135.vml_gradient,"stops"),"sortedArrayUsingSelector:",sel_getUid("comparePosition:")),_13b=objj_msgSend(_13a,"count");
vml=["<cg_vml_:fill type=\"gradient\" method=\"linear sigma\" "];
vml.push("angle=\""+(objj_msgSend(_135.vml_gradient,"angle")+90)+"\" ");
vml.push("colors=\"");
for(var i=0;i<_13b;i++){
vml.push((objj_msgSend(_13a[i],"position")*100).toFixed(0)+"% ");
vml.push(objj_msgSend(objj_msgSend(objj_msgSend(_13a[i],"color"),"colorForSlideBase:",nil),"cssString"));
if(i<_13b-1){
vml.push(",");
}
}
vml.push("\" />");
}else{
var _13d=_135.colors,_13b=_13d.length;
vml=["<cg_vml_:fill type=\"gradient\" "];
vml.push("colors=\"");
for(var i=0;i<_13b;i++){
vml.push((_135.locations[i]*100).toFixed(0)+"% "+to_string(_13d[i])+(i<_13b-1?",":""));
}
vml.push("\" />");
}
_134.gState.gradient=vml.join("");
console.log(vml.join(""));
};
}
}
p;12;CGGeometry.jc;5881;
CGPointMake=function(x,y){
return {x:x,y:y};
};
CGPointMakeZero=function(){
return {x:0,y:0};
};
CGPointMakeCopy=function(_3){
return {x:_3.x,y:_3.y};
};
CGPointCreateCopy=function(_4){
return {x:_4.x,y:_4.y};
};
CGPointEqualToPoint=function(_5,_6){
return (_5.x==_6.x&&_5.y==_6.y);
};
CGStringFromPoint=function(_7){
return ("{"+_7.x+", "+_7.y+"}");
};
CGSizeMake=function(_8,_9){
return {width:_8,height:_9};
};
CGSizeMakeZero=function(){
return {width:0,height:0};
};
CGSizeMakeCopy=function(_a){
return {width:_a.width,height:_a.height};
};
CGSizeCreateCopy=function(_b){
return {width:_b.width,height:_b.height};
};
CGSizeEqualToSize=function(_c,_d){
return (_c.width==_d.width&&_c.height==_d.height);
};
CGStringFromSize=function(_e){
return ("{"+_e.width+", "+_e.height+"}");
};
CGRectMake=function(x,y,_11,_12){
return {origin:{x:x,y:y},size:{width:_11,height:_12}};
};
CGRectMakeZero=function(){
return {origin:{x:0,y:0},size:{width:0,height:0}};
};
CGRectMakeCopy=function(_13){
return {origin:{x:_13.origin.x,y:_13.origin.y},size:{width:_13.size.width,height:_13.size.height}};
};
CGRectCreateCopy=function(_14){
return {origin:{x:_14.origin.x,y:_14.origin.y},size:{width:_14.size.width,height:_14.size.height}};
};
CGRectEqualToRect=function(_15,_16){
return ((_15.origin.x==_16.origin.x&&_15.origin.y==_16.origin.y)&&(_15.size.width==_16.size.width&&_15.size.height==_16.size.height));
};
CGStringFromRect=function(_17){
return ("{"+("{"+_17.origin.x+", "+_17.origin.y+"}")+", "+("{"+_17.size.width+", "+_17.size.height+"}")+"}");
};
CGRectOffset=function(_18,dX,dY){
return {origin:{x:_18.origin.x+dX,y:_18.origin.y+dY},size:{width:_18.size.width,height:_18.size.height}};
};
CGRectInset=function(_1b,dX,dY){
return {origin:{x:_1b.origin.x+dX,y:_1b.origin.y+dY},size:{width:_1b.size.width-2*dX,height:_1b.size.height-2*dY}};
};
CGRectGetHeight=function(_1e){
return (_1e.size.height);
};
CGRectGetMaxX=function(_1f){
return (_1f.origin.x+_1f.size.width);
};
CGRectGetMaxY=function(_20){
return (_20.origin.y+_20.size.height);
};
CGRectGetMidX=function(_21){
return (_21.origin.x+(_21.size.width)/2);
};
CGRectGetMidY=function(_22){
return (_22.origin.y+(_22.size.height)/2);
};
CGRectGetMinX=function(_23){
return (_23.origin.x);
};
CGRectGetMinY=function(_24){
return (_24.origin.y);
};
CGRectGetWidth=function(_25){
return (_25.size.width);
};
CGRectIsEmpty=function(_26){
return (_26.size.width<=0||_26.size.height<=0);
};
CGRectIsNull=function(_27){
return (_27.size.width<=0||_27.size.height<=0);
};
CGRectContainsPoint=function(_28,_29){
return (_29.x>=(_28.origin.x)&&_29.y>=(_28.origin.y)&&_29.x<(_28.origin.x+_28.size.width)&&_29.y<(_28.origin.y+_28.size.height));
};
CGInsetMake=function(top,_2b,_2c,_2d){
return {top:(top),right:(_2b),bottom:(_2c),left:(_2d)};
};
CGInsetMakeZero=function(){
return {top:(0),right:(0),bottom:(0),left:(0)};
};
CGInsetMakeCopy=function(_2e){
return {top:(_2e.top),right:(_2e.right),bottom:(_2e.bottom),left:(_2e.left)};
};
CGInsetIsEmpty=function(_2f){
return ((_2f).top===0&&(_2f).right===0&&(_2f).bottom===0&&(_2f).left===0);
};
CGRectNull={origin:{x:Infinity,y:Infinity},size:{width:0,height:0}};
CGRectContainsRect=function(_30,_31){
var _32=CGRectUnion(_30,_31);
return ((_32.origin.x==_30.origin.x&&_32.origin.y==_30.origin.y)&&(_32.size.width==_30.size.width&&_32.size.height==_30.size.height));
};
CGRectIntersectsRect=function(_33,_34){
var _35=CGRectIntersection(_33,_34);
return !(_35.size.width<=0||_35.size.height<=0);
};
CGRectIntegral=function(_36){
_36=CGRectStandardize(_36);
var x=FLOOR((_36.origin.x)),y=FLOOR((_36.origin.y));
_36.size.width=CEIL((_36.origin.x+_36.size.width))-x;
_36.size.height=CEIL((_36.origin.y+_36.size.height))-y;
_36.origin.x=x;
_36.origin.y=y;
return _36;
};
CGRectIntersection=function(_39,_3a){
var _3b={origin:{x:MAX((_39.origin.x),(_3a.origin.x)),y:MAX((_39.origin.y),(_3a.origin.y))},size:{width:0,height:0}};
_3b.size.width=MIN((_39.origin.x+_39.size.width),(_3a.origin.x+_3a.size.width))-(_3b.origin.x);
_3b.size.height=MIN((_39.origin.y+_39.size.height),(_3a.origin.y+_3a.size.height))-(_3b.origin.y);
return (_3b.size.width<=0||_3b.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_3b;
};
CGRectStandardize=function(_3c){
var _3d=(_3c.size.width),_3e=(_3c.size.height),_3f={origin:{x:_3c.origin.x,y:_3c.origin.y},size:{width:_3c.size.width,height:_3c.size.height}};
if(_3d<0){
_3f.origin.x+=_3d;
_3f.size.width=-_3d;
}
if(_3e<0){
_3f.origin.y+=_3e;
_3f.size.height=-_3e;
}
return _3f;
};
CGRectUnion=function(_40,_41){
var _42=!_40||_40===CGRectNull,_43=!_41||_41===CGRectNull;
if(_42){
return _43?CGRectNull:_41;
}
if(_43){
return _42?CGRectNull:_40;
}
var _44=MIN((_40.origin.x),(_41.origin.x)),_45=MIN((_40.origin.y),(_41.origin.y)),_46=MAX((_40.origin.x+_40.size.width),(_41.origin.x+_41.size.width)),_47=MAX((_40.origin.y+_40.size.height),(_41.origin.y+_41.size.height));
return {origin:{x:_44,y:_45},size:{width:_46-_44,height:_47-_45}};
};
CGPointFromString=function(_48){
var _49=_48.indexOf(",");
return {x:parseInt(_48.substr(1,_49-1)),y:parseInt(_48.substring(_49+1,_48.length))};
};
CGSizeFromString=function(_4a){
var _4b=_4a.indexOf(",");
return {width:parseInt(_4a.substr(1,_4b-1)),height:parseInt(_4a.substring(_4b+1,_4a.length))};
};
CGRectFromString=function(_4c){
var _4d=_4c.indexOf(",",_4c.indexOf(",")+1);
return {origin:CGPointFromString(_4c.substr(1,_4d-1)),size:CGSizeFromString(_4c.substring(_4d+2,_4c.length))};
};
CGPointFromEvent=function(_4e){
return {x:_4e.clientX,y:_4e.clientY};
};
CGInsetFromString=function(_4f){
var _50=_4f.substr(1,_4f.length-2).split(",");
return {top:(parseFloat(_50[0])),right:(parseFloat(_50[1])),bottom:(parseFloat(_50[2])),left:(parseFloat(_50[3]))};
};
CGInsetFromCPString=CGInsetFromString;
CPStringFromCGInset=function(_51){
return "{"+_51.top+", "+_51.left+", "+_51.bottom+", "+_51.right+"}";
};
p;12;CGGradient.ji;9;CGColor.ji;14;CGColorSpace.jc;497;
kCGGradientDrawsBeforeStartLocation=1<<0;
kCGGradientDrawsAfterEndLocation=1<<1;
CGGradientCreateWithColorComponents=function(_1,_2,_3,_4){
if(arguments["count"]==NULL){
var _4=_3.length;
}
var _5=[];
while(_4--){
var _6=_4*4;
_5[_4]=CGColorCreate(_1,_2.slice(_6,_6+4));
}
return CGGradientCreateWithColors(_1,_5,_3);
};
CGGradientCreateWithColors=function(_7,_8,_9){
return {colorspace:_7,colors:_8,locations:_9};
};
CGGradientRelease=function(){
};
CGGradientRetain=function(_a){
return _a;
};
p;8;CGPath.ji;12;CGGeometry.ji;19;CGAffineTransform.jc;7354;
kCGPathElementMoveToPoint=0;
kCGPathElementAddLineToPoint=1;
kCGPathElementAddQuadCurveToPoint=2;
kCGPathElementAddCurveToPoint=3;
kCGPathElementCloseSubpath=4;
kCGPathElementAddArc=5;
kCGPathElementAddArcToPoint=6;
CGPathCreateMutable=function(){
return {count:0,start:NULL,current:NULL,elements:[]};
};
CGPathCreateMutableCopy=function(_1){
var _2=CGPathCreateMutable();
CGPathAddPath(_2,_1);
return _2;
};
CGPathCreateCopy=function(_3){
return CGPathCreateMutableCopy(_3);
};
CGPathRelease=function(_4){
};
CGPathRetain=function(_5){
return _5;
};
CGPathAddArc=function(_6,_7,x,y,_a,_b,_c,_d){
if(_7&&!(_7.a==1&&_7.b==0&&_7.c==0&&_7.d==1&&_7.tx==0&&_7.ty==0)){
var _e={x:x,y:y},_f={x:COS(_c),y:SIN(_c)},_10={x:COS(_b),y:SIN(_b)};
_f={x:_f.x*_7.a+_f.y*_7.c+_7.tx,y:_f.x*_7.b+_f.y*_7.d+_7.ty};
_10={x:_10.x*_7.a+_10.y*_7.c+_7.tx,y:_10.x*_7.b+_10.y*_7.d+_7.ty};
_e={x:_e.x*_7.a+_e.y*_7.c+_7.tx,y:_e.x*_7.b+_e.y*_7.d+_7.ty};
x=_e.x;
y=_e.y;
var _11=_c,_12=_b;
_c=ATAN2(_f.y-_7.ty,_f.x-_7.tx);
_b=ATAN2(_10.y-_7.ty,_10.x-_7.tx);
if(_c==_b&&_11!=_12){
if(_12>_11){
_c=_c-PI2;
}else{
_b=_b-PI2;
}
}
_a={width:_a,height:0};
_a={width:_a.width*_7.a+_a.height*_7.c,height:_a.width*_7.b+_a.height*_7.d};
_a=SQRT(_a.width*_a.width+_a.height*_a.height);
}
_6.current={x:x+_a*COS(_c),y:y+_a*SIN(_c)};
_6.elements[_6.count++]={type:kCGPathElementAddArc,x:x,y:y,radius:_a,startAngle:_b,endAngle:_c};
};
CGPathAddArcToPoint=function(_13,_14,x1,y1,x2,y2,_19){
};
CGPathAddCurveToPoint=function(_1a,_1b,_1c,_1d,_1e,_1f,x,y){
var cp1={x:_1c,y:_1d},cp2={x:_1e,y:_1f},end={x:x,y:y};
if(_1b){
cp1={x:cp1.x*_1b.a+cp1.y*_1b.c+_1b.tx,y:cp1.x*_1b.b+cp1.y*_1b.d+_1b.ty};
cp2={x:cp2.x*_1b.a+cp2.y*_1b.c+_1b.tx,y:cp2.x*_1b.b+cp2.y*_1b.d+_1b.ty};
end={x:end.x*_1b.a+end.y*_1b.c+_1b.tx,y:end.x*_1b.b+end.y*_1b.d+_1b.ty};
}
_1a.current=end;
_1a.elements[_1a.count++]={type:kCGPathElementAddCurveToPoint,cp1x:cp1.x,cp1y:cp1.y,cp2x:cp2.x,cp2y:cp2.y,x:end.x,y:end.y};
};
CGPathAddLines=function(_25,_26,_27,_28){
var i=1;
if(arguments["count"]==NULL){
var _28=_27.length;
}
if(!_25||_28<2){
return;
}
CGPathMoveToPoint(_25,_26,_27[0].x,_27[0].y);
for(;i<_28;++i){
CGPathAddLineToPoint(_25,_26,_27[i].x,_27[i].y);
}
};
CGPathAddLineToPoint=function(_2a,_2b,x,y){
var _2e={x:x,y:y};
if(_2b!=NULL){
_2e={x:_2e.x*_2b.a+_2e.y*_2b.c+_2b.tx,y:_2e.x*_2b.b+_2e.y*_2b.d+_2b.ty};
}
_2a.elements[_2a.count++]={type:kCGPathElementAddLineToPoint,x:_2e.x,y:_2e.y};
_2a.current=_2e;
};
CGPathAddPath=function(_2f,_30,_31){
for(var i=0,_33=_31.count;i<_33;++i){
var _34=_31.elements[i];
switch(_34.type){
case kCGPathElementAddLineToPoint:
CGPathAddLineToPoint(_2f,_30,_34.x,_34.y);
break;
case kCGPathElementAddCurveToPoint:
CGPathAddCurveToPoint(_2f,_30,_34.cp1x,_34.cp1y,_34.cp2x,_34.cp2y,_34.x,_34.y);
break;
case kCGPathElementAddArc:
CGPathAddArc(_2f,_30,_34.x,_34.y,_34.radius,_34.startAngle,_34.endAngle,_34.isClockwise);
break;
case kCGPathElementAddQuadCurveToPoint:
CGPathAddQuadCurveToPoint(_2f,_30,_34.cpx,_34.cpy,_34.x,_34.y);
break;
case kCGPathElementMoveToPoint:
CGPathMoveToPoint(_2f,_30,_34.x,_34.y);
break;
case kCGPathElementCloseSubpath:
CGPathCloseSubpath(_2f);
break;
}
}
};
CGPathAddQuadCurveToPoint=function(_35,_36,cpx,cpy,x,y){
var cp={x:cpx,y:cpy},end={x:x,y:y};
if(_36){
cp={x:control.x*_36.a+control.y*_36.c+_36.tx,y:control.x*_36.b+control.y*_36.d+_36.ty};
end={x:end.x*_36.a+end.y*_36.c+_36.tx,y:end.x*_36.b+end.y*_36.d+_36.ty};
}
_35.elements[_35.count++]={type:kCGPathElementAddQuadCurveToPoint,cpx:cp.x,cpy:cp.y,x:end.x,y:end.y};
_35.current=end;
};
CGPathAddRect=function(_3d,_3e,_3f){
CGPathAddRects(_3d,_3e,[_3f],1);
};
CGPathAddRects=function(_40,_41,_42,_43){
var i=0;
if(arguments["count"]==NULL){
var _43=_42.length;
}
for(;i<_43;++i){
var _45=_42[i];
CGPathMoveToPoint(_40,_41,(_45.origin.x),(_45.origin.y));
CGPathAddLineToPoint(_40,_41,(_45.origin.x+_45.size.width),(_45.origin.y));
CGPathAddLineToPoint(_40,_41,(_45.origin.x+_45.size.width),(_45.origin.y+_45.size.height));
CGPathAddLineToPoint(_40,_41,(_45.origin.x),(_45.origin.y+_45.size.height));
CGPathCloseSubpath(_40);
}
};
CGPathMoveToPoint=function(_46,_47,x,y){
var _4a={x:x,y:y},_4b=_46.count;
if(_47!=NULL){
_4a={x:_4a.x*_47.a+_4a.y*_47.c+_47.tx,y:_4a.x*_47.b+_4a.y*_47.d+_47.ty};
}
_46.start=_4a;
_46.current=_4a;
var _4c=_46.elements[_4b-1];
if(_4b!=0&&_4c.type==kCGPathElementMoveToPoint){
_4c.x=_4a.x;
_4c.y=_4a.y;
}else{
_46.elements[_46.count++]={type:kCGPathElementMoveToPoint,x:_4a.x,y:_4a.y};
}
};
var _4d=4*((SQRT2-1)/3);
CGPathWithEllipseInRect=function(_4e){
var _4f=CGPathCreateMutable();
if((_4e.size.width)==(_4e.size.height)){
CGPathAddArc(_4f,nil,(_4e.origin.x+(_4e.size.width)/2),(_4e.origin.y+(_4e.size.height)/2),(_4e.size.width)/2,0,2*PI,YES);
}else{
var _50={width:(_4e.size.width)/2,height:(_4e.size.height)/2},_51={x:(_4e.origin.x)+_50.width,y:(_4e.origin.y)+_50.height};
CGPathMoveToPoint(_4f,nil,_51.x,_51.y-_50.height);
CGPathAddCurveToPoint(_4f,nil,_51.x+(_4d*_50.width),_51.y-_50.height,_51.x+_50.width,_51.y-(_4d*_50.height),_51.x+_50.width,_51.y);
CGPathAddCurveToPoint(_4f,nil,_51.x+_50.width,_51.y+(_4d*_50.height),_51.x+(_4d*_50.width),_51.y+_50.height,_51.x,_51.y+_50.height);
CGPathAddCurveToPoint(_4f,nil,_51.x-(_4d*_50.width),_51.y+_50.height,_51.x-_50.width,_51.y+(_4d*_50.height),_51.x-_50.width,_51.y);
CGPathAddCurveToPoint(_4f,nil,_51.x-_50.width,_51.y-(_4d*_50.height),_51.x-(_4d*_50.width),_51.y-_50.height,_51.x,_51.y-_50.height);
}
CGPathCloseSubpath(_4f);
return _4f;
};
CGPathWithRoundedRectangleInRect=function(_52,_53,_54,ne,se,sw,nw){
var _59=CGPathCreateMutable(),_5a=(_52.origin.x),_5b=(_52.origin.x+_52.size.width),_5c=(_52.origin.y),_5d=(_52.origin.y+_52.size.height);
CGPathMoveToPoint(_59,nil,_5a+_53,_5c);
if(ne){
CGPathAddLineToPoint(_59,nil,_5b-_53,_5c);
CGPathAddCurveToPoint(_59,nil,_5b-_53,_5c,_5b,_5c,_5b,_5c+_53);
}else{
CGPathAddLineToPoint(_59,nil,_5b,_5c);
}
if(se){
CGPathAddLineToPoint(_59,nil,_5b,_5d-_53);
CGPathAddCurveToPoint(_59,nil,_5b,_5d-_53,_5b,_5d,_5b-_53,_5d);
}else{
CGPathAddLineToPoint(_59,nil,_5b,_5d);
}
if(sw){
CGPathAddLineToPoint(_59,nil,_5a+_53,_5d);
CGPathAddCurveToPoint(_59,nil,_5a+_53,_5d,_5a,_5d,_5a,_5d-_53);
}else{
CGPathAddLineToPoint(_59,nil,_5a,_5d);
}
if(nw){
CGPathAddLineToPoint(_59,nil,_5a,_5c+_53);
CGPathAddCurveToPoint(_59,nil,_5a,_5c+_53,_5a,_5c,_5a+_53,_5c);
}else{
CGPathAddLineToPoint(_59,nil,_5a,_5c);
}
CGPathCloseSubpath(_59);
return _59;
};
CGPathCloseSubpath=function(_5e){
var _5f=_5e.count;
if(_5f==0||_5e.elements[_5f-1].type==kCGPathElementCloseSubpath){
return;
}
_5e.elements[_5e.count++]={type:kCGPathElementCloseSubpath,points:[_5e.start]};
};
CGPathEqualToPath=function(_60,_61){
if(_60==_61){
return YES;
}
if(_60.count!=_61.count||!(_60.start.x==_61.start.x&&_60.start.y==_61.start.y)||!(_60.current.x==_61.current.x&&_60.current.y==_61.current.y)){
return NO;
}
var i=0,_63=_60.count;
for(;i<_63;++i){
var _64=_60[i],_65=_61[i];
if(_64.type!=_65.type){
return NO;
}
if((_64.type==kCGPathElementAddArc||_64.type==kCGPathElementAddArcToPoint)&&_64.radius!=_65.radius){
return NO;
}
var j=_64.points.length;
while(j--){
if(!(_64.points[j].x==_65.points[j].x&&_64.points[j].y==_65.points[j].y)){
return NO;
}
}
}
return YES;
};
CGPathGetCurrentPoint=function(_67){
return {x:_67.current.x,y:_67.current.y};
};
CGPathIsEmpty=function(_68){
return !_68||_68.count==0;
};
p;17;CPAccordionView.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;32;Foundation/CPKeyValueObserving.jI;23;Foundation/CPIndexSet.jI;21;Foundation/CPString.jI;15;AppKit/CPView.jc;10068;
var _1=objj_allocateClassPair(CPObject,"CPAccordionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_view"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return _identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_5,_6,_7){
with(_5){
_identifier=_7;
}
}),new objj_method(sel_getUid("view"),function(_8,_9){
with(_8){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_a,_b,_c){
with(_a){
_view=_c;
}
}),new objj_method(sel_getUid("label"),function(_d,_e){
with(_d){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_f,_10,_11){
with(_f){
_label=_11;
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPObject")},"init");
if(_14){
objj_msgSend(_14,"setIdentifier:",_16);
}
return _14;
}
})]);
var _1=objj_allocateClassPair(CPView,"CPAccordionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_dirtyItemIndex"),new objj_ivar("_itemHeaderPrototype"),new objj_ivar("_items"),new objj_ivar("_itemViews"),new objj_ivar("_expandedItemIndexes")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("CPView")},"initWithFrame:",_19);
if(_17){
_items=[];
_itemViews=[];
_expandedItemIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(_17,"setItemHeaderPrototype:",objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:100,height:24}}));
}
return _17;
}
}),new objj_method(sel_getUid("setItemHeaderPrototype:"),function(_1a,_1b,_1c){
with(_1a){
_itemHeaderPrototype=_1c;
}
}),new objj_method(sel_getUid("itemHeaderPrototype"),function(_1d,_1e){
with(_1d){
return _itemHeaderPrototype;
}
}),new objj_method(sel_getUid("items"),function(_1f,_20){
with(_1f){
return _items;
}
}),new objj_method(sel_getUid("addItem:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"insertItem:atIndex:",_23,_items.length);
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_24,_25,_26,_27){
with(_24){
objj_msgSend(_expandedItemIndexes,"addIndex:",_27);
var _28=objj_msgSend(objj_msgSend(_CPAccordionItemView,"alloc"),"initWithAccordionView:",_24);
objj_msgSend(_28,"setIndex:",_27);
objj_msgSend(_28,"setLabel:",objj_msgSend(_26,"label"));
objj_msgSend(_28,"setContentView:",objj_msgSend(_26,"view"));
objj_msgSend(_24,"addSubview:",_28);
objj_msgSend(_items,"insertObject:atIndex:",_26,_27);
objj_msgSend(_itemViews,"insertObject:atIndex:",_28,_27);
objj_msgSend(_24,"_invalidateItemsStartingAtIndex:",_27);
objj_msgSend(_24,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeItem:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_29,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2b));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_expandedItemIndexes,"removeIndex:",_2e);
objj_msgSend(_itemViews[_2e],"removeFromSuperview");
objj_msgSend(_items,"removeObjectAtIndex:",_2e);
objj_msgSend(_itemViews,"removeObjectAtIndex:",_2e);
objj_msgSend(_2c,"_invalidateItemsStartingAtIndex:",_2e);
objj_msgSend(_2c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeAllItems"),function(_2f,_30){
with(_2f){
var _31=_items.length;
while(_31--){
objj_msgSend(_2f,"removeItemAtIndex:",_31);
}
}
}),new objj_method(sel_getUid("expandItemAtIndex:"),function(_32,_33,_34){
with(_32){
if(!objj_msgSend(_itemViews[_34],"isCollapsed")){
return;
}
objj_msgSend(_expandedItemIndexes,"addIndex:",_34);
objj_msgSend(_itemViews[_34],"setCollapsed:",NO);
objj_msgSend(_32,"_invalidateItemsStartingAtIndex:",_34);
}
}),new objj_method(sel_getUid("collapseItemAtIndex:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_itemViews[_37],"isCollapsed")){
return;
}
objj_msgSend(_expandedItemIndexes,"removeIndex:",_37);
objj_msgSend(_itemViews[_37],"setCollapsed:",YES);
objj_msgSend(_35,"_invalidateItemsStartingAtIndex:",_37);
}
}),new objj_method(sel_getUid("toggleItemAtIndex:"),function(_38,_39,_3a){
with(_38){
var _3b=_itemViews[_3a];
if(objj_msgSend(_3b,"isCollapsed")){
objj_msgSend(_38,"expandItemAtIndex:",_3a);
}else{
objj_msgSend(_38,"collapseItemAtIndex:",_3a);
}
}
}),new objj_method(sel_getUid("expandedItemIndexes"),function(_3c,_3d){
with(_3c){
return _expandedItemIndexes;
}
}),new objj_method(sel_getUid("collapsedItemIndexes"),function(_3e,_3f){
with(_3e){
var _40=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,_items.length));
objj_msgSend(_40,"removeIndexes:",_expandedIndexes);
return _40;
}
}),new objj_method(sel_getUid("_invalidateItemsStartingAtIndex:"),function(_41,_42,_43){
with(_41){
if(_dirtyItemIndex===CPNotFound){
_dirtyItemIndex=_43;
}
_dirtyItemIndex=MIN(_dirtyItemIndex,_43);
objj_msgSend(_41,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_44,_45,_46){
with(_44){
var _47=(objj_msgSend(_44,"frame").size.width);
objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPView")},"setFrameSize:",_46);
if(_47!==(objj_msgSend(_44,"frame").size.width)){
objj_msgSend(_44,"_invalidateItemsStartingAtIndex:",0);
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_48,_49){
with(_48){
if(_items.length<=0){
return objj_msgSend(_48,"setFrameSize:",{width:(objj_msgSend(_48,"frame").size.width),height:0});
}
if(_dirtyItemIndex===CPNotFound){
return;
}
_dirtyItemIndex=MIN(_dirtyItemIndex,_items.length-1);
var _4a=_dirtyItemIndex,_4b=_itemViews.length,_4c=(objj_msgSend(_48,"bounds").size.width),y=_4a>0?CGRectGetMaxY(objj_msgSend(_itemViews[_4a-1],"frame")):0;
_dirtyItemIndex=CPNotFound;
for(;_4a<_4b;++_4a){
var _4e=_itemViews[_4a];
objj_msgSend(_4e,"setFrameY:width:",y,_4c);
y=CGRectGetMaxY(objj_msgSend(_4e,"frame"));
}
objj_msgSend(_48,"setFrameSize:",{width:(objj_msgSend(_48,"frame").size.width),height:y});
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPAccordionItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_accordionView"),new objj_ivar("_isCollapsed"),new objj_ivar("_index"),new objj_ivar("_headerView"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isCollapsed"),function(_4f,_50){
with(_4f){
return _isCollapsed;
}
}),new objj_method(sel_getUid("setCollapsed:"),function(_51,_52,_53){
with(_51){
_isCollapsed=_53;
}
}),new objj_method(sel_getUid("index"),function(_54,_55){
with(_54){
return _index;
}
}),new objj_method(sel_getUid("setIndex:"),function(_56,_57,_58){
with(_56){
_index=_58;
}
}),new objj_method(sel_getUid("initWithAccordionView:"),function(_59,_5a,_5b){
with(_59){
_59=objj_msgSendSuper({receiver:_59,super_class:objj_getClass("CPView")},"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
if(_59){
_accordionView=_5b;
_isCollapsed=NO;
var _5c=objj_msgSend(_59,"bounds");
_headerView=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",objj_msgSend(_accordionView,"itemHeaderPrototype")));
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setTarget:"))&&objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_headerView,"setTarget:",_59);
objj_msgSend(_headerView,"setAction:",sel_getUid("toggle:"));
}
objj_msgSend(_59,"addSubview:",_headerView);
}
return _59;
}
}),new objj_method(sel_getUid("toggle:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_accordionView,"toggleItemAtIndex:",objj_msgSend(_5d,"index"));
}
}),new objj_method(sel_getUid("setLabel:"),function(_60,_61,_62){
with(_60){
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setTitle:"))){
objj_msgSend(_headerView,"setTitle:",_62);
}else{
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setLabel:"))){
objj_msgSend(_headerView,"setLabel:",_62);
}else{
if(objj_msgSend(_headerView,"respondsToSelector:",sel_getUid("setStringValue:"))){
objj_msgSend(_headerView,"setStringValue:",_62);
}
}
}
}
}),new objj_method(sel_getUid("setContentView:"),function(_63,_64,_65){
with(_63){
if(_contentView===_65){
return;
}
objj_msgSend(_contentView,"removeObserver:forKeyPath:",_63,"frame");
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_65;
objj_msgSend(_contentView,"addObserver:forKeyPath:options:context:",_63,"frame",0,NULL);
objj_msgSend(_63,"addSubview:",_contentView);
objj_msgSend(_accordionView,"_invalidateItemsStartingAtIndex:",objj_msgSend(_63,"index"));
}
}),new objj_method(sel_getUid("setFrameY:width:"),function(_66,_67,aY,_69){
with(_66){
var _6a=(objj_msgSend(_headerView,"frame").size.height);
objj_msgSend(_headerView,"setFrameSize:",{width:_69,height:_6a});
objj_msgSend(_contentView,"setFrameOrigin:",{x:0,y:_6a});
if(objj_msgSend(_66,"isCollapsed")){
objj_msgSend(_66,"setFrame:",{origin:{x:0,y:aY},size:{width:_69,height:_6a}});
}else{
var _6b=(objj_msgSend(_contentView,"frame").size.height);
objj_msgSend(_contentView,"setFrameSize:",{width:_69,height:_6b});
objj_msgSend(_66,"setFrame:",{origin:{x:0,y:aY},size:{width:_69,height:_6b+_6a}});
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6c,_6d,_6e){
with(_6c){
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_6f,_70,_71,_72,_73,_74){
with(_6f){
if(_71==="frame"&&!CGRectEqualToRect(objj_msgSend(_73,"objectForKey:",CPKeyValueChangeOldKey),objj_msgSend(_73,"objectForKey:",CPKeyValueChangeNewKey))){
objj_msgSend(_accordionView,"_invalidateItemsStartingAtIndex:",objj_msgSend(_6f,"index"));
}
}
})]);
p;9;CPAlert.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPColor.jI;15;AppKit/CPFont.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jI;16;AppKit/CPPanel.jI;20;AppKit/CPTextField.jc;5790;
CPWarningAlertStyle=0;
CPInformationalAlertStyle=1;
CPCriticalAlertStyle=2;
var _1,_2,_3;
var _4=objj_allocateClassPair(CPObject,"CPAlert"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_alertPanel"),new objj_ivar("_messageLabel"),new objj_ivar("_alertImageView"),new objj_ivar("_alertStyle"),new objj_ivar("_windowTitle"),new objj_ivar("_windowStyle"),new objj_ivar("_buttonCount"),new objj_ivar("_buttons"),new objj_ivar("_delegate")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init")){
_buttonCount=0;
_buttons=objj_msgSend(CPArray,"array");
_alertStyle=CPWarningAlertStyle;
objj_msgSend(_6,"setWindowStyle:",nil);
}
return _6;
}
}),new objj_method(sel_getUid("setWindowStyle:"),function(_8,_9,_a){
with(_8){
_windowStyle=_a;
_alertPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,110),_a?_a|CPTitledWindowMask:CPTitledWindowMask);
objj_msgSend(_alertPanel,"setFloatingPanel:",YES);
objj_msgSend(_alertPanel,"center");
objj_msgSend(_messageLabel,"setTextColor:",(_a&CPHUDBackgroundWindowMask)?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(CPColor,"blackColor"));
var _b=objj_msgSend(_buttons,"count");
for(var i=0;i<_b;i++){
var _d=_buttons[i];
objj_msgSend(_d,"setFrameSize:",CGSizeMake(objj_msgSend(_d,"frame").size.width,(_a==CPHUDBackgroundWindowMask)?20:24));
objj_msgSend(_d,"setBezelStyle:",(_a&CPHUDBackgroundWindowMask)?CPHUDBezelStyle:CPRoundedBezelStyle);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_d);
}
if(!_messageLabel){
var _e=objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"bounds");
_messageLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(57,10,CGRectGetWidth(_e)-73,62));
objj_msgSend(_messageLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",13));
objj_msgSend(_messageLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_messageLabel,"setAlignment:",CPJustifiedTextAlignment);
_alertImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(15,12,32,32));
}
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_messageLabel);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_alertImageView);
}
}),new objj_method(sel_getUid("setTitle:"),function(_f,_10,_11){
with(_f){
_windowTitle=_11;
}
}),new objj_method(sel_getUid("title"),function(_12,_13){
with(_12){
return _windowTitle;
}
}),new objj_method(sel_getUid("windowStyle"),function(_14,_15){
with(_14){
return _windowStyle;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_16,_17,_18){
with(_16){
_delegate=_18;
}
}),new objj_method(sel_getUid("delegate"),function(_19,_1a){
with(_19){
return _delegate;
}
}),new objj_method(sel_getUid("setAlertStyle:"),function(_1b,_1c,_1d){
with(_1b){
_alertStyle=_1d;
}
}),new objj_method(sel_getUid("alertStyle"),function(_1e,_1f){
with(_1e){
return _alertStyle;
}
}),new objj_method(sel_getUid("setMessageText:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_messageLabel,"setStringValue:",_22);
}
}),new objj_method(sel_getUid("messageText"),function(_23,_24){
with(_23){
return objj_msgSend(_messageLabel,"stringValue");
}
}),new objj_method(sel_getUid("addButtonWithTitle:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"bounds"),_29=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(CGRectGetWidth(_28)-((_buttonCount+1)*90),CGRectGetHeight(_28)-34,80,(_windowStyle==CPHUDBackgroundWindowMask)?20:24));
objj_msgSend(_29,"setTitle:",_27);
objj_msgSend(_29,"setTarget:",_25);
objj_msgSend(_29,"setTag:",_buttonCount);
objj_msgSend(_29,"setAction:",sel_getUid("_notifyDelegate:"));
objj_msgSend(_29,"setBezelStyle:",(_windowStyle==CPHUDBackgroundWindowMask)?CPHUDBezelStyle:CPRoundRectBezelStyle);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_29);
if(_buttonCount==0){
objj_msgSend(_alertPanel,"setDefaultButton:",_29);
}
_buttonCount++;
objj_msgSend(_buttons,"addObject:",_29);
}
}),new objj_method(sel_getUid("runModal"),function(_2a,_2b){
with(_2a){
var _2c;
switch(_alertStyle){
case CPWarningAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_1);
_2c="Warning";
break;
case CPInformationalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_2);
_2c="Information";
break;
case CPCriticalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_3);
_2c="Error";
break;
}
objj_msgSend(_alertPanel,"setTitle:",_windowTitle?_windowTitle:_2c);
objj_msgSend(CPApp,"runModalForWindow:",_alertPanel);
}
}),new objj_method(sel_getUid("_notifyDelegate:"),function(_2d,_2e,_2f){
with(_2d){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("alertDidEnd:returnCode:"))){
objj_msgSend(_delegate,"alertDidEnd:returnCode:",_2d,objj_msgSend(_2f,"tag"));
}
objj_msgSend(CPApp,"abortModal");
objj_msgSend(_alertPanel,"close");
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_30,_31){
with(_30){
if(_30!=CPAlert){
return;
}
var _32=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_30,"class"));
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_32,"pathForResource:","CPAlert/dialog-warning.png"),CGSizeMake(32,32));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_32,"pathForResource:","CPAlert/dialog-information.png"),CGSizeMake(32,32));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_32,"pathForResource:","CPAlert/dialog-error.png"),CGSizeMake(32,32));
}
})]);
p;13;CPAnimation.jI;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;5384;
CPAnimationEaseInOut=0;
CPAnimationEaseIn=1;
CPAnimationEaseOut=2;
CPAnimationLinear=3;
ACTUAL_FRAME_RATE=0;
var _1=objj_allocateClassPair(CPObject,"CPAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_lastTime"),new objj_ivar("_duration"),new objj_ivar("_animationCurve"),new objj_ivar("_timingFunction"),new objj_ivar("_frameRate"),new objj_ivar("_progress"),new objj_ivar("_delegate"),new objj_ivar("_timer")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithDuration:animationCurve:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_progress=0;
_duration=MAX(0,_5);
_frameRate=60;
objj_msgSend(_3,"setAnimationCurve:",_6);
}
return _3;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_7,_8,_9){
with(_7){
switch(_9){
case CPAnimationEaseInOut:
timingFunctionName=kCAMediaTimingFunctionEaseInEaseOut;
break;
case CPAnimationEaseIn:
timingFunctionName=kCAMediaTimingFunctionEaseIn;
break;
case CPAnimationEaseOut:
timingFunctionName=kCAMediaTimingFunctionEaseOut;
break;
case CPAnimationLinear:
timingFunctionName=kCAMediaTimingFunctionLinear;
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid value provided for animation curve");
break;
}
_animationCurve=_9;
_timingFunction=objj_msgSend(CAMediaTimingFunction,"functionWithName:",timingFunctionName);
}
}),new objj_method(sel_getUid("animationCurve"),function(_a,_b){
with(_a){
return _animationCurve;
}
}),new objj_method(sel_getUid("setDuration:"),function(_c,_d,_e){
with(_c){
if(_e<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"aDuration can't be negative");
}
_duration=_e;
}
}),new objj_method(sel_getUid("duration"),function(_f,_10){
with(_f){
return _duration;
}
}),new objj_method(sel_getUid("setFrameRate:"),function(_11,_12,_13){
with(_11){
if(_13<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"frameRate can't be negative");
}
_frameRate=_13;
}
}),new objj_method(sel_getUid("frameRate"),function(_14,_15){
with(_14){
return _frameRate;
}
}),new objj_method(sel_getUid("delegate"),function(_16,_17){
with(_16){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_18,_19,_1a){
with(_18){
_delegate=_1a;
}
}),new objj_method(sel_getUid("startAnimation"),function(_1b,_1c){
with(_1b){
if(_timer||_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationShouldStart:"))&&!objj_msgSend(_delegate,"animationShouldStart:",_1b)){
return;
}
if(_progress===1){
_progress=0;
}
ACTUAL_FRAME_RATE=0;
_lastTime=new Date();
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_1b,sel_getUid("animationTimerDidFire:"),nil,YES);
}
}),new objj_method(sel_getUid("animationTimerDidFire:"),function(_1d,_1e,_1f){
with(_1d){
var _20=new Date(),_21=MIN(1,objj_msgSend(_1d,"currentProgress")+(_20-_lastTime)/(_duration*1000));
_lastTime=_20;
++ACTUAL_FRAME_RATE;
objj_msgSend(_1d,"setCurrentProgress:",_21);
if(_21===1){
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_1d);
}
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_22,_23){
with(_22){
if(!_timer){
return;
}
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidStop:"))){
objj_msgSend(_delegate,"animationDidStop:",_22);
}
}
}),new objj_method(sel_getUid("isAnimating"),function(_24,_25){
with(_24){
return _timer;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_26,_27,_28){
with(_26){
_progress=_28;
}
}),new objj_method(sel_getUid("currentProgress"),function(_29,_2a){
with(_29){
return _progress;
}
}),new objj_method(sel_getUid("currentValue"),function(_2b,_2c){
with(_2b){
var t=objj_msgSend(_2b,"currentProgress");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animation:valueForProgress:"))){
return objj_msgSend(_delegate,"animation:valueForProgress:",_2b,t);
}
var c1=[],c2=[];
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",1,c1);
objj_msgSend(_timingFunction,"getControlPointAtIndex:values:",2,c2);
return _30(t,c1[0],c1[1],c2[0],c2[1],_duration);
}
})]);
var _30=_30=function(t,p1x,p1y,p2x,p2y,_36){
var ax=0,bx=0,cx=0,ay=0,by=0,cy=0;
sampleCurveX=function(t){
return ((ax*t+bx)*t+cx)*t;
};
sampleCurveY=function(t){
return ((ay*t+by)*t+cy)*t;
};
sampleCurveDerivativeX=function(t){
return (3*ax*t+2*bx)*t+cx;
};
solveEpsilon=function(_40){
return 1/(200*_40);
};
solve=function(x,_42){
return sampleCurveY(solveCurveX(x,_42));
};
solveCurveX=function(x,_44){
var t0,t1,t2,x2,d2,i;
fabs=function(n){
if(n>=0){
return n;
}else{
return 0-n;
}
};
for(t2=x,i=0;i<8;i++){
x2=sampleCurveX(t2)-x;
if(fabs(x2)<_44){
return t2;
}
d2=sampleCurveDerivativeX(t2);
if(fabs(d2)<0.000001){
break;
}
t2=t2-x2/d2;
}
t0=0;
t1=1;
t2=x;
if(t2<t0){
return t0;
}
if(t2>t1){
return t1;
}
while(t0<t1){
x2=sampleCurveX(t2);
if(fabs(x2-x)<_44){
return t2;
}
if(x>x2){
t0=t2;
}else{
t1=t2;
}
t2=(t1-t0)*0.5+t0;
}
return t2;
};
cx=3*p1x;
bx=3*(p2x-p1x)-cx;
ax=1-cx-bx;
cy=3*p1y;
by=3*(p2y-p1y)-cy;
ay=1-cy-by;
return solve(t,solveEpsilon(_36));
};
p;15;CPApplication.jI;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;19843;
var _1="CPMainCibFile",_2="Main cib file base name";
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _3=objj_allocateClassPair(CPResponder,"CPApplication"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_finishedLaunching"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
_mainMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_mainMenu,"setAutoenablesItems:",NO);
var _7=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_8=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"N");
objj_msgSend(_8,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_8,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_8);
var _9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"O");
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_9,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_9);
var _a=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),nil);
objj_msgSend(_b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"S"));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),nil));
objj_msgSend(_b,"setSubmenu:",_a);
objj_msgSend(_mainMenu,"addItem:",_b);
var _c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_e,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_f,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_d,"addItem:",_e);
objj_msgSend(_d,"addItem:",_f);
objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"X")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"C")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"V"));
objj_msgSend(_c,"setSubmenu:",_d);
objj_msgSend(_c,"setHidden:",YES);
objj_msgSend(_mainMenu,"addItem:",_c);
objj_msgSend(_mainMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
return _5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_10,_11,_12){
with(_10){
if(_delegate==_12){
return;
}
var _13=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationWillFinishLaunchingNotification,_10);
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationDidFinishLaunchingNotification,_10);
}
_delegate=_12;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationWillFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationWillFinishLaunching:"),CPApplicationWillFinishLaunchingNotification,_10);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationDidFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationDidFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,_10);
}
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_19,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _1a=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_1a){
var _1b=objj_getClass(_1a);
if(_1b){
if(objj_msgSend(_documentController,"class")==_1b){
objj_msgSend(_16,"setDelegate:",_documentController);
}else{
objj_msgSend(_16,"setDelegate:",objj_msgSend(objj_msgSend(_1b,"alloc"),"init"));
}
}
}
var _1c=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_16);
var _1d=window.cpOpeningFilename&&window.cpOpeningFilename(),_1e=!!_documentController;
if(objj_msgSend(_1d,"length")){
_1e=!objj_msgSend(_16,"_openFile:",_1d);
}
if(_1e&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldOpenUntitledFile:"))){
_1e=objj_msgSend(_delegate,"applicationShouldOpenUntitledFile:",_16);
}
if(_1e){
objj_msgSend(_documentController,"newDocument:",_16);
}
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_16);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
_finishedLaunching=YES;
}
}),new objj_method(sel_getUid("terminate:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(CPPlatform,"terminateApplication");
}
}),new objj_method(sel_getUid("activateIgnoringOtherApps:"),function(_22,_23,_24){
with(_22){
objj_msgSend(CPPlatform,"activateIgnoringOtherApps:",_24);
}
}),new objj_method(sel_getUid("run"),function(_25,_26){
with(_25){
objj_msgSend(_25,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"runModalSession:",objj_msgSend(_27,"beginModalSessionForWindow:",_29));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_2a,_2b,_2c){
with(_2a){
if(!_currentSession){
return;
}
_currentSession._state=_2c;
_currentSession=_currentSession._previous;
objj_msgSend(_2a,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_2d,_2e){
with(_2d){
var _2f=_eventListeners.length;
while(_2f--){
if(_eventListeners[_2f]._callback===_30){
_eventListeners.splice(_2f,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_31,_32){
with(_31){
objj_msgSend(_31,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_33,_34){
with(_33){
objj_msgSend(_33,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_35,_36,_37){
with(_35){
return _38(_37,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_39,_3a,_3b){
with(_39){
_3b._previous=_currentSession;
_currentSession=_3b;
var _3c=_3b._window;
objj_msgSend(_3c,"center");
objj_msgSend(_3c,"makeKeyAndOrderFront:",_39);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_30,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_3d,_3e){
with(_3d){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_mainMenu,"performKeyEquivalent:",_41)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendEvent:"),function(_42,_43,_44){
with(_42){
_currentEvent=_44;
if(objj_msgSend(_44,"type")==CPKeyDown&&objj_msgSend(_44,"modifierFlags")&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(objj_msgSend(_44,"characters"),"length")>0&&objj_msgSend(_42,"_handleKeyEquivalent:",_44)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_44,"type"))){
_eventListeners.pop()._callback(_44);
}
return;
}
objj_msgSend(objj_msgSend(_44,"window"),"sendEvent:",_44);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_delegate,"respondsToSelector:",_47)){
objj_msgSend(_delegate,"performSelector:",_47);
}else{
objj_msgSendSuper({receiver:_45,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_47);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_48,_49){
with(_48){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_4a,_4b){
with(_4a){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_4c,_4d,_4e){
with(_4c){
return _windows[_4e];
}
}),new objj_method(sel_getUid("windows"),function(_4f,_50){
with(_4f){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_51,_52){
with(_51){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_53,_54,_55){
with(_53){
if(objj_msgSend(_55,"_menuName")==="CPMainMenu"){
if(_mainMenu===_55){
return;
}
_mainMenu=_55;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
window.cpSetMainMenu(_mainMenu);
}
}else{
objj_msgSend(_55,"_setMenuName:","CPMainMenu");
}
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_56,_57,_58){
with(_56){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_56);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_5c,_5d,_5e){
with(_5c){
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_5f,_60,_61,_62){
with(_5f){
if(!_61){
return NO;
}
if(objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPResponder")},"tryToPerform:with:",_61,_62)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_61)){
objj_msgSend(_delegate,"performSelector:withObject:",_61,_62);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_63,_64,_65,_66,_67){
with(_63){
var _68=objj_msgSend(_63,"targetForAction:to:from:",_65,_66,_67);
if(!_68){
return NO;
}
objj_msgSend(_68,"performSelector:withObject:",_65,_67);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_69,_6a,_6b,_6c,_6d){
with(_69){
if(!_6b){
return nil;
}
if(_6c){
return _6c;
}
return objj_msgSend(_69,"targetForAction:",_6b);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_6e,_6f,_70,_71){
with(_6e){
var _72=objj_msgSend(_70,"firstResponder"),_73=YES;
while(_72){
if(objj_msgSend(_72,"respondsToSelector:",_71)){
return _72;
}
if(_72==_70){
_73=NO;
}
_72=objj_msgSend(_72,"nextResponder");
}
if(_73&&objj_msgSend(_70,"respondsToSelector:",_71)){
return _70;
}
var _74=objj_msgSend(_70,"delegate");
if(objj_msgSend(_74,"respondsToSelector:",_71)){
return _74;
}
var _75=objj_msgSend(_70,"windowController");
if(objj_msgSend(_75,"respondsToSelector:",_71)){
return _75;
}
var _76=objj_msgSend(_75,"document");
if(_76!=_74&&objj_msgSend(_76,"respondsToSelector:",_71)){
return _76;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_77,_78,_79){
with(_77){
if(!_79){
return nil;
}
var _7a=objj_msgSend(_77,"_targetForWindow:action:",objj_msgSend(_77,"keyWindow"),_79);
if(_7a){
return _7a;
}
_7a=objj_msgSend(_77,"_targetForWindow:action:",objj_msgSend(_77,"mainWindow"),_79);
if(_7a){
return _7a;
}
if(objj_msgSend(_77,"respondsToSelector:",_79)){
return _77;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_79)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_79)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_7b,_7c,_7d,_7e,_7f,_80,_81){
with(_7b){
_eventListeners.push(_82(_7e,_7d));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_83,_84,_85,_86,_87,_88,_89,_8a){
with(_83){
_eventListeners.push(_82(_87,function(_8b){
objj_msgSend(_85,_86,_8b);
}));
}
}),new objj_method(sel_getUid("currentEvent"),function(_8c,_8d){
with(_8c){
return _currentEvent;
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_8e,_8f,_90,_91,_92,_93,_94){
with(_8e){
var _95=objj_msgSend(_90,"styleMask");
if(!(_95&CPDocModalWindowMask)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Currently only CPDocModalWindowMask style mask is supported for attached sheets");
return;
}
objj_msgSend(_91,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_90,_92,_93,_94);
}
}),new objj_method(sel_getUid("endSheet:returnCode:"),function(_96,_97,_98,_99){
with(_96){
var _9a=objj_msgSend(_windows,"count");
while(--_9a>=0){
var _9b=objj_msgSend(_windows,"objectAtIndex:",_9a);
var _9c=_9b._sheetContext;
if(_9c!=nil&&_9c["sheet"]===_98){
_9c["returnCode"]=_99;
objj_msgSend(_9b,"_detachSheetWindow");
return;
}
}
}
}),new objj_method(sel_getUid("endSheet:"),function(_9d,_9e,_9f){
with(_9d){
objj_msgSend(_9d,"endSheet:returnCode:",_9f,0);
}
}),new objj_method(sel_getUid("arguments"),function(_a0,_a1){
with(_a0){
if(_fullArgsString!=window.location.hash){
objj_msgSend(_a0,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_a2,_a3,_a4){
with(_a2){
if(!_a4||_a4.length==0){
_args=[];
window.location.hash="#";
return;
}
if(objj_msgSend(_a4,"class")!=CPArray){
_a4=objj_msgSend(CPArray,"arrayWithObject:",_a4);
}
_args=_a4;
var _a5=objj_msgSend(_args,"copy");
for(var i=0,_a7=_a5.length;i<_a7;i++){
_a5[i]=encodeURIComponent(_a5[i]);
}
var _a8=objj_msgSend(_a5,"componentsJoinedByString:","/");
window.location.hash="#"+_a8;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_a9,_aa){
with(_a9){
_fullArgsString=window.location.hash;
var _ab=_fullArgsString.replace("#","").split("/").slice(0);
for(var i=0,_ad=_ab.length;i<_ad;i++){
_ab[i]=decodeURIComponent(_ab[i]);
}
_args=_ab;
}
}),new objj_method(sel_getUid("namedArguments"),function(_ae,_af){
with(_ae){
return _namedArgs;
}
}),new objj_method(sel_getUid("_openFile:"),function(_b0,_b1,_b2){
with(_b0){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("application:openFile:"))){
return objj_msgSend(_delegate,"application:openFile:",_b0,_b2);
}else{
return objj_msgSend(_documentController,"openDocumentWithContentsOfURL:display:error:",_b2,YES,NULL);
}
}
}),new objj_method(sel_getUid("_didResignActive"),function(_b3,_b4){
with(_b3){
if(_b3._activeMenu){
objj_msgSend(_b3._activeMenu,"cancelTracking");
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedApplication"),function(_b5,_b6){
with(_b5){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _38=function(_b7,_b8){
return {_window:_b7,_state:CPRunContinuesResponse,_previous:nil};
};
var _82=function(_b9,_ba){
return {_mask:_b9,_callback:_ba};
};
var _30=function(_bb){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_30,CPAnyEventMask,nil,0,NO);
var _bc=objj_msgSend(_bb,"window"),_bd=CPApp._currentSession;
if(_bc==_bd._window||objj_msgSend(_bc,"worksWhenModal")){
objj_msgSend(_bc,"sendEvent:",_bb);
}
};
CPApplicationMain=function(_be,_bf){
var _c0=objj_msgSend(CPBundle,"mainBundle"),_c1=objj_msgSend(_c0,"principalClass");
if(!_c1){
_c1=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_c1,"sharedApplication");
if(!_be){
var _be=objj_msgSend(CPApp,"arguments");
if(objj_msgSend(_be,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
}
if(!_bf){
var _c2=window.location.search.substring(1).split("&");
_bf=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_c2.length;i++){
var _c4=_c2[i].indexOf("=");
if(_c4==-1){
objj_msgSend(_bf,"setObject:forKey:","",_c2[i]);
}else{
objj_msgSend(_bf,"setObject:forKey:",_c2[i].substring(_c4+1),_c2[i].substring(0,_c4));
}
}
}
CPApp._args=_be;
CPApp._namedArgs=_bf;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _c5=nil;
var _3=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("actions"),function(_c6,_c7){
with(_c6){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_c8,_c9){
with(_c8){
if(!_c5){
_c5=objj_msgSend(_c8,"actions");
}
while(_c5.length){
var _ca=_c5.shift();
if(objj_msgSend(_c8,_ca)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_cb,_cc){
with(_cb){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_cd,_ce){
with(_cd){
var _cf=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:","Aristo.blend"));
objj_msgSend(_cf,"loadWithDelegate:",_cd);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(_d0,_d1,_d2){
with(_d0){
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo"));
objj_msgSend(_d0,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(_d3,_d4){
with(_d3){
var _d5=objj_msgSend(CPBundle,"mainBundle"),_d6=objj_msgSend(_d5,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_d5,"objectForInfoDictionaryKey:",_2);
if(_d6){
objj_msgSend(_d5,"loadCibFile:externalNameTable:loadDelegate:",_d6,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),_d3);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_d7,_d8,_d9){
with(_d7){
objj_msgSend(_d7,"performActions");
}
})]);
p;14;CPBezierPath.jI;26;AppKit/CPGraphicsContext.jI;21;Foundation/CPObject.jc;4365;
var _1=1;
var _2=objj_allocateClassPair(CPObject,"CPBezierPath"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_path"),new objj_ivar("_lineWidth")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init")){
_path=CGPathCreateMutable();
_lineWidth=objj_msgSend(objj_msgSend(_4,"class"),"defaultLineWidth");
}
return _4;
}
}),new objj_method(sel_getUid("moveToPoint:"),function(_6,_7,_8){
with(_6){
CGPathMoveToPoint(_path,nil,_8.x,_8.y);
}
}),new objj_method(sel_getUid("lineToPoint:"),function(_9,_a,_b){
with(_9){
CGPathAddLineToPoint(_path,nil,_b.x,_b.y);
}
}),new objj_method(sel_getUid("curveToPoint:controlPoint1:controlPoint2:"),function(_c,_d,_e,_f,_10){
with(_c){
CGPathAddCurveToPoint(_path,nil,_f.x,_f.y,_10.x,_10.y,_e.x,_e.y);
}
}),new objj_method(sel_getUid("closePath"),function(_11,_12){
with(_11){
CGPathCloseSubpath(_path);
}
}),new objj_method(sel_getUid("stroke"),function(_13,_14){
with(_13){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(ctx);
CGContextAddPath(ctx,_path);
CGContextSetLineWidth(ctx,objj_msgSend(_13,"lineWidth"));
CGContextClosePath(ctx);
CGContextStrokePath(ctx);
}
}),new objj_method(sel_getUid("fill"),function(_16,_17){
with(_16){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(ctx);
CGContextAddPath(ctx,_path);
CGContextSetLineWidth(ctx,objj_msgSend(_16,"lineWidth"));
CGContextClosePath(ctx);
CGContextFillPath(ctx);
}
}),new objj_method(sel_getUid("lineWidth"),function(_19,_1a){
with(_19){
return _lineWidth;
}
}),new objj_method(sel_getUid("setLineWidth:"),function(_1b,_1c,_1d){
with(_1b){
_lineWidth=_1d;
}
}),new objj_method(sel_getUid("elementCount"),function(_1e,_1f){
with(_1e){
return _path.count;
}
}),new objj_method(sel_getUid("isEmpty"),function(_20,_21){
with(_20){
return CGPathIsEmpty(_path);
}
}),new objj_method(sel_getUid("currentPoint"),function(_22,_23){
with(_22){
return CGPathGetCurrentPoint(_path);
}
}),new objj_method(sel_getUid("appendBezierPathWithPoints:count:"),function(_24,_25,_26,_27){
with(_24){
CGPathAddLines(_path,nil,_26,_27);
}
}),new objj_method(sel_getUid("appendBezierPathWithRect:"),function(_28,_29,_2a){
with(_28){
CGPathAddRect(_path,nil,_2a);
}
}),new objj_method(sel_getUid("appendBezierPathWithOvalInRect:"),function(_2b,_2c,_2d){
with(_2b){
CGPathAddPath(_path,nil,CGPathWithEllipseInRect(_2d));
}
}),new objj_method(sel_getUid("appendBezierPathWithRoundedRect:xRadius:yRadius:"),function(_2e,_2f,_30,_31,_32){
with(_2e){
CGPathAddPath(_path,nil,CGPathWithRoundedRectangleInRect(_30,_31,_32,YES,YES,YES,YES));
}
}),new objj_method(sel_getUid("appendBezierPath:"),function(_33,_34,_35){
with(_33){
CGPathAddPath(_path,nil,_35._path);
}
}),new objj_method(sel_getUid("removeAllPoints"),function(_36,_37){
with(_36){
_path=CGPathCreateMutable();
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bezierPath"),function(_38,_39){
with(_38){
return objj_msgSend(objj_msgSend(_38,"alloc"),"init");
}
}),new objj_method(sel_getUid("bezierPathWithOvalInRect:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"bezierPath");
objj_msgSend(_3d,"appendBezierPathWithOvalInRect:",_3c);
return _3d;
}
}),new objj_method(sel_getUid("bezierPathWithRect:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(_3e,"bezierPath");
objj_msgSend(_41,"appendBezierPathWithRect:",_40);
return _41;
}
}),new objj_method(sel_getUid("defaultLineWidth"),function(_42,_43){
with(_42){
return _1;
}
}),new objj_method(sel_getUid("setDefaultLineWidth:"),function(_44,_45,_46){
with(_44){
_1=_46;
}
}),new objj_method(sel_getUid("fillRect:"),function(_47,_48,_49){
with(_47){
objj_msgSend(objj_msgSend(_47,"bezierPathWithRect:",_49),"fill");
}
}),new objj_method(sel_getUid("strokeRect:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(objj_msgSend(_4a,"bezierPathWithRect:",_4c),"stroke");
}
}),new objj_method(sel_getUid("strokeLineFromPoint:toPoint:"),function(_4d,_4e,_4f,_50){
with(_4d){
var _51=objj_msgSend(_4d,"bezierPath");
objj_msgSend(_51,"moveToPoint:",_4f);
objj_msgSend(_51,"lineToPoint:",_50);
objj_msgSend(_51,"stroke");
}
})]);
p;7;CPBox.ji;8;CPView.jc;5852;
CPNoBorder=0;
CPLineBorder=1;
CPBezelBorder=2;
CPGrooveBorder=3;
var _1=objj_allocateClassPair(CPView,"CPBox"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_borderType"),new objj_ivar("_borderColor"),new objj_ivar("_fillColor"),new objj_ivar("_cornerRadius"),new objj_ivar("_borderWidth"),new objj_ivar("_contentMargin"),new objj_ivar("_contentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_fillColor=objj_msgSend(CPColor,"clearColor");
_borderColor=objj_msgSend(CPColor,"blackColor");
_borderWidth=1;
_contentMargin=CGSizeMake(0,0);
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
}
return _3;
}
}),new objj_method(sel_getUid("borderRect"),function(_6,_7){
with(_6){
return objj_msgSend(_6,"bounds");
}
}),new objj_method(sel_getUid("borderType"),function(_8,_9){
with(_8){
return _borderType;
}
}),new objj_method(sel_getUid("setBorderType:"),function(_a,_b,_c){
with(_a){
_borderType=_c;
objj_msgSend(_a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderColor"),function(_d,_e){
with(_d){
return _borderColor;
}
}),new objj_method(sel_getUid("setBorderColor:"),function(_f,_10,_11){
with(_f){
if(objj_msgSend(_11,"isEqual:",_borderColor)){
return;
}
_borderColor=_11;
objj_msgSend(_f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("borderWidth"),function(_12,_13){
with(_12){
return _borderWidth;
}
}),new objj_method(sel_getUid("setBorderWidth:"),function(_14,_15,_16){
with(_14){
if(_16===_borderWidth){
return;
}
_borderWidth=_16;
objj_msgSend(_14,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("cornerRadius"),function(_17,_18){
with(_17){
return _cornerRadius;
}
}),new objj_method(sel_getUid("setCornerRadius:"),function(_19,_1a,_1b){
with(_19){
if(_1b===_cornerRadius){
return;
}
_cornerRadius=_1b;
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("fillColor"),function(_1c,_1d){
with(_1c){
return _fillColor;
}
}),new objj_method(sel_getUid("setFillColor:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_20,"isEqual:",_fillColor)){
return;
}
_fillColor=_20;
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("contentView"),function(_21,_22){
with(_21){
return _contentView;
}
}),new objj_method(sel_getUid("setContentView:"),function(_23,_24,_25){
with(_23){
if(_25===_contentView){
return;
}
objj_msgSend(_25,"setFrame:",CGRectInset(objj_msgSend(_23,"bounds"),_contentMargin.width+_borderWidth,_contentMargin.height+_borderWidth));
objj_msgSend(_23,"replaceSubview:with:",_contentView,_25);
_contentView=_25;
}
}),new objj_method(sel_getUid("contentViewMargins"),function(_26,_27){
with(_26){
return _contentMargin;
}
}),new objj_method(sel_getUid("setContentViewMargins:"),function(_28,_29,_2a){
with(_28){
if(_2a.width<0||_2a.height<0){
objj_msgSend(CPException,"raise:reason:",CPGenericException,"Margins must be positive");
}
_contentMargin=CGSizeMakeCopy(_2a);
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameFromContentFrame:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"setFrame:",CGRectInset(_2d,-(_contentMargin.width+_borderWidth),-(_contentMargin.height+_borderWidth)));
objj_msgSend(_2b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(_contentView,"frame");
objj_msgSend(_2e,"setFrameSize:",CGSizeMake(_30.size.width+_contentMargin.width*2,_30.size.height+_contentMargin.height*2));
objj_msgSend(_contentView,"setFrameOrigin:",CGPointMake(_contentMargin.width,_contentMargin.height));
}
}),new objj_method(sel_getUid("drawRect:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"bounds"),_35=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_36=_borderWidth/2,_37=CGRectMake(_34.origin.x+_36,_34.origin.y+_36,_34.size.width-_borderWidth,_34.size.height-_borderWidth),_38=CGRectMake(_34.origin.x+_36,_34.origin.y+_36,_34.size.width-_borderWidth,_34.size.height-_borderWidth);
CGContextSetFillColor(_35,objj_msgSend(_31,"fillColor"));
CGContextSetStrokeColor(_35,objj_msgSend(_31,"borderColor"));
CGContextSetLineWidth(_35,_borderWidth);
switch(_borderType){
case CPLineBorder:
CGContextFillRoundedRectangleInRect(_35,_38,_cornerRadius,YES,YES,YES,YES);
CGContextStrokeRoundedRectangleInRect(_35,_37,_cornerRadius,YES,YES,YES,YES);
break;
case CPBezelBorder:
CGContextFillRoundedRectangleInRect(_35,_38,_cornerRadius,YES,YES,YES,YES);
CGContextSetStrokeColor(_35,objj_msgSend(CPColor,"colorWithWhite:alpha:",190/255,1));
CGContextBeginPath(_35);
CGContextMoveToPoint(_35,_37.origin.x,_37.origin.y);
CGContextAddLineToPoint(_35,CGRectGetMinX(_37),CGRectGetMaxY(_37)),CGContextAddLineToPoint(_35,CGRectGetMaxX(_37),CGRectGetMaxY(_37)),CGContextAddLineToPoint(_35,CGRectGetMaxX(_37),CGRectGetMinY(_37)),CGContextStrokePath(_35);
CGContextSetStrokeColor(_35,objj_msgSend(CPColor,"colorWithWhite:alpha:",142/255,1));
CGContextBeginPath(_35);
CGContextMoveToPoint(_35,_34.origin.x,_37.origin.y);
CGContextAddLineToPoint(_35,CGRectGetMaxX(_34),CGRectGetMinY(_37));
CGContextStrokePath(_35);
break;
default:
break;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("boxEnclosingView:"),function(_39,_3a,_3b){
with(_39){
var box=objj_msgSend(objj_msgSend(_39,"alloc"),"initWithFrame:",CGRectMakeZero()),_3d=objj_msgSend(_3b,"superview");
objj_msgSend(box,"setFrameFromContentFrame:",objj_msgSend(_3b,"frame"));
objj_msgSend(_3d,"replaceSubview:with:",_3b,box);
objj_msgSend(box,"setContentView:",_3b);
return box;
}
})]);
p;10;CPButton.ji;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;15891;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
CPNoImage=0;
CPImageOnly=1;
CPImageLeft=2;
CPImageRight=3;
CPImageBelow=4;
CPImageAbove=5;
CPImageOverlaps=6;
CPOnState=1;
CPOffState=0;
CPMixedState=-1;
CPRoundedBezelStyle=1;
CPRegularSquareBezelStyle=2;
CPThickSquareBezelStyle=3;
CPThickerSquareBezelStyle=4;
CPDisclosureBezelStyle=5;
CPShadowlessSquareBezelStyle=6;
CPCircularBezelStyle=7;
CPTexturedSquareBezelStyle=8;
CPHelpButtonBezelStyle=9;
CPSmallSquareBezelStyle=10;
CPTexturedRoundedBezelStyle=11;
CPRoundRectBezelStyle=12;
CPRecessedBezelStyle=13;
CPRoundedDisclosureBezelStyle=14;
CPHUDBezelStyle=-1;
CPMomentaryLightButton=0;
CPPushOnPushOffButton=1;
CPToggleButton=2;
CPSwitchButton=3;
CPRadioButton=4;
CPMomentaryChangeButton=5;
CPOnOffButton=6;
CPMomentaryPushInButton=7;
CPMomentaryPushButton=0;
CPMomentaryLight=7;
CPNoButtonMask=0;
CPContentsButtonMask=1;
CPPushInButtonMask=2;
CPGrayButtonMask=4;
CPBackgroundButtonMask=8;
CPNoCellMask=CPNoButtonMask;
CPContentsCellMask=CPContentsButtonMask;
CPPushInCellMask=CPPushInButtonMask;
CPChangeGrayCellMask=CPGrayButtonMask;
CPChangeBackgroundCellMask=CPBackgroundButtonMask;
CPButtonStateMixed=CPThemeState("mixed");
var _1=objj_allocateClassPair(CPControl,"CPButton"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_allowsMixedState"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_showsStateBy"),new objj_ivar("_highlightsBy"),new objj_ivar("_imageDimsWhenDisabled"),new objj_ivar("_bezelStyle"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_3,"setValue:forThemeAttribute:",CPScaleNone,"image-scaling");
_controlSize=CPRegularControlSize;
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_6,_7){
with(_6){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_8,_9,_a){
with(_8){
_a=!!_a;
if(_allowsMixedState===_a){
return;
}
_allowsMixedState=_a;
if(!_allowsMixedState){
objj_msgSend(_8,"unsetThemeState:",CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_b,_c,_d){
with(_b){
if(!_d||_d===""||(objj_msgSend(_d,"intValue")===0)){
_d=CPOffState;
}else{
if(!objj_msgSend(_d,"isKindOfClass:",objj_msgSend(CPNumber,"class"))){
_d=CPOnState;
}else{
if(_d>CPOnState){
_d=CPOnState;
}else{
if(_d<CPOffState){
if(objj_msgSend(_b,"allowsMixedState")){
_d=CPMixedState;
}else{
_d=CPOnState;
}
}
}
}
}
objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPControl")},"setObjectValue:",_d);
switch(objj_msgSend(_b,"objectValue")){
case CPMixedState:
objj_msgSend(_b,"unsetThemeState:",CPThemeStateSelected);
objj_msgSend(_b,"setThemeState:",CPButtonStateMixed);
break;
case CPOnState:
objj_msgSend(_b,"unsetThemeState:",CPButtonStateMixed);
objj_msgSend(_b,"setThemeState:",CPThemeStateSelected);
break;
case CPOffState:
objj_msgSend(_b,"unsetThemeState:",CPThemeStateSelected|CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("nextState"),function(_e,_f){
with(_e){
if(objj_msgSend(_e,"allowsMixedState")){
var _10=objj_msgSend(_e,"state");
return _10-((_10===-1)?-2:1);
}
return 1-objj_msgSend(_e,"state");
}
}),new objj_method(sel_getUid("setNextState"),function(_11,_12){
with(_11){
objj_msgSend(_11,"setState:",objj_msgSend(_11,"nextState"));
}
}),new objj_method(sel_getUid("setState:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"setIntValue:",_15);
}
}),new objj_method(sel_getUid("state"),function(_16,_17){
with(_16){
return objj_msgSend(_16,"intValue");
}
}),new objj_method(sel_getUid("setTitle:"),function(_18,_19,_1a){
with(_18){
if(_title===_1a){
return;
}
_title=_1a;
objj_msgSend(_18,"setNeedsLayout");
objj_msgSend(_18,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("title"),function(_1b,_1c){
with(_1b){
return _title;
}
}),new objj_method(sel_getUid("setAlternateTitle:"),function(_1d,_1e,_1f){
with(_1d){
if(_alternateTitle===_1f){
return;
}
_alternateTitle=_1f;
objj_msgSend(_1d,"setNeedsLayout");
objj_msgSend(_1d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateTitle"),function(_20,_21){
with(_20){
return _alternateTitle;
}
}),new objj_method(sel_getUid("setImage:"),function(_22,_23,_24){
with(_22){
if(_image===_24){
return;
}
_image=_24;
objj_msgSend(_22,"setNeedsLayout");
objj_msgSend(_22,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("image"),function(_25,_26){
with(_25){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_27,_28,_29){
with(_27){
if(_alternateImage===_29){
return;
}
_alternateImage=_29;
objj_msgSend(_27,"setNeedsLayout");
objj_msgSend(_27,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateImage"),function(_2a,_2b){
with(_2a){
return _alternateImage;
}
}),new objj_method(sel_getUid("setShowsStateBy:"),function(_2c,_2d,_2e){
with(_2c){
if(_showsStateBy===_2e){
return;
}
_showsStateBy=_2e;
objj_msgSend(_2c,"setNeedsDisplay:",YES);
objj_msgSend(_2c,"setNeedsLayout");
}
}),new objj_method(sel_getUid("showsStateBy"),function(_2f,_30){
with(_2f){
return _showsStateBy;
}
}),new objj_method(sel_getUid("setHighlightsBy:"),function(_31,_32,_33){
with(_31){
if(_highlightsBy===_33){
return;
}
_highlightsBy=_33;
if(objj_msgSend(_31,"hasThemeState:",CPThemeStateHighlighted)){
objj_msgSend(_31,"setNeedsDisplay:",YES);
objj_msgSend(_31,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("setButtonType:"),function(_34,_35,_36){
with(_34){
switch(_36){
case CPMomentaryLightButton:
objj_msgSend(_34,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryPushInButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryChangeButton:
objj_msgSend(_34,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPNoCellMask);
break;
case CPPushOnPushOffButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPOnOffButton:
objj_msgSend(_34,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPToggleButton:
objj_msgSend(_34,"setHighlightsBy:",CPPushInCellMask|CPContentsCellMask);
objj_msgSend(_34,"setShowsStateBy:",CPContentsCellMask);
break;
case CPSwitchButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
case CPRadioButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown button type.");
}
objj_msgSend(_34,"setImageDimsWhenDisabled:",YES);
}
}),new objj_method(sel_getUid("setImageDimsWhenDisabled:"),function(_37,_38,_39){
with(_37){
_39=!!_39;
if(_imageDimsWhenDisabled===_39){
return;
}
_imageDimsWhenDisabled=_39;
if(_imageDimsWhenDisabled){
objj_msgSend(_37,"setNeedsDisplay:",YES);
objj_msgSend(_37,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("imageDimsWhenDisabled"),function(_3a,_3b){
with(_3a){
return _imageDimsWhenDisabled;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"highlight:",YES);
return objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPControl")},"startTrackingAt:",_3e);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_3f,_40,_41,_42,_43){
with(_3f){
objj_msgSend(_3f,"highlight:",NO);
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPControl")},"stopTracking:at:mouseIsUp:",_41,_42,_43);
if(_43&&CGRectContainsPoint(objj_msgSend(_3f,"bounds"),_42)){
objj_msgSend(_3f,"setNextState");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_44,_45,_46){
with(_44){
var _47=objj_msgSend(_44,"currentValueForThemeAttribute:","content-inset");
if(((_47).top===0&&(_47).right===0&&(_47).bottom===0&&(_47).left===0)){
return _46;
}
_46.origin.x+=_47.left;
_46.origin.y+=_47.top;
_46.size.width-=_47.left+_47.right;
_46.size.height-=_47.top+_47.bottom;
return _46;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_48,_49,_4a){
with(_48){
if(!objj_msgSend(_48,"isBordered")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4b=objj_msgSend(_48,"currentValueForThemeAttribute:","bezel-inset");
if(((_4b).top===0&&(_4b).right===0&&(_4b).bottom===0&&(_4b).left===0)){
return _4a;
}
_4a.origin.x+=_4b.left;
_4a.origin.y+=_4b.top;
_4a.size.width-=_4b.left+_4b.right;
_4a.size.height-=_4b.top+_4b.bottom;
return _4a;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend((objj_msgSend(_4c,"title")||" "),"sizeWithFont:",objj_msgSend(_4c,"currentValueForThemeAttribute:","font")),_4f=objj_msgSend(_4c,"currentValueForThemeAttribute:","content-inset"),_50=objj_msgSend(_4c,"currentValueForThemeAttribute:","min-size"),_51=objj_msgSend(_4c,"currentValueForThemeAttribute:","max-size");
_4e.width=MAX(_4e.width+_4f.left+_4f.right,_50.width);
_4e.height=MAX(_4e.height+_4f.top+_4f.bottom,_50.height);
if(_51.width>=0){
_4e.width=MIN(_4e.width,_51.width);
}
if(_51.height>=0){
_4e.height=MIN(_4e.height,_51.height);
}
objj_msgSend(_4c,"setFrameSize:",_4e);
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_52,_53,_54){
with(_52){
if(_54==="bezel-view"){
return objj_msgSend(_52,"bezelRectForBounds:",objj_msgSend(_52,"bounds"));
}else{
if(_54==="content-view"){
return objj_msgSend(_52,"contentRectForBounds:",objj_msgSend(_52,"bounds"));
}
}
return objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_54);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_55,_56,_57){
with(_55){
if(_57==="bezel-view"){
var _58=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_58,"setHitTests:",NO);
return _58;
}else{
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_57);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_59,_5a){
with(_59){
var _5b=objj_msgSend(_59,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_5b){
objj_msgSend(_5b,"setBackgroundColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","bezel-color"));
}
var _5c=objj_msgSend(_59,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_5c){
objj_msgSend(_5c,"setText:",(objj_msgSend(_59,"hasThemeState:",CPThemeStateHighlighted)&&_alternateTitle)?_alternateTitle:_title);
objj_msgSend(_5c,"setImage:",(objj_msgSend(_59,"hasThemeState:",CPThemeStateHighlighted)&&_alternateImage)?_alternateImage:_image);
objj_msgSend(_5c,"setFont:",objj_msgSend(_59,"currentValueForThemeAttribute:","font"));
objj_msgSend(_5c,"setTextColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_5c,"setAlignment:",objj_msgSend(_59,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_5c,"setVerticalAlignment:",objj_msgSend(_59,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_5c,"setLineBreakMode:",objj_msgSend(_59,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_5c,"setTextShadowColor:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_5c,"setTextShadowOffset:",objj_msgSend(_59,"currentValueForThemeAttribute:","text-shadow-offset"));
objj_msgSend(_5c,"setImagePosition:",objj_msgSend(_59,"currentValueForThemeAttribute:","image-position"));
objj_msgSend(_5c,"setImageScaling:",objj_msgSend(_59,"currentValueForThemeAttribute:","image-scaling"));
}
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(_5d,_5e,_5f){
with(_5d){
if(_5f){
objj_msgSend(_5d,"setThemeState:",CPThemeStateDefault);
}else{
objj_msgSend(_5d,"unsetThemeState:",CPThemeStateDefault);
}
}
}),new objj_method(sel_getUid("setBordered:"),function(_60,_61,_62){
with(_60){
if(_62){
objj_msgSend(_60,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_60,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_63,_64){
with(_63){
return objj_msgSend(_63,"hasThemeState:",CPThemeStateBordered);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("buttonWithTitle:"),function(_65,_66,_67){
with(_65){
return objj_msgSend(_65,"buttonWithTitle:theme:",_67,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("buttonWithTitle:theme:"),function(_68,_69,_6a,_6b){
with(_68){
var _6c=objj_msgSend(objj_msgSend(_68,"alloc"),"init");
objj_msgSend(_6c,"setTheme:",_6b);
objj_msgSend(_6c,"setTitle:",_6a);
objj_msgSend(_6c,"sizeToFit");
return _6c;
}
}),new objj_method(sel_getUid("themeClass"),function(_6d,_6e){
with(_6d){
return "button";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_6f,_70){
with(_6f){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setBezelStyle:"),function(_71,_72,_73){
with(_71){
}
}),new objj_method(sel_getUid("bezelStyle"),function(_74,_75){
with(_74){
}
})]);
var _76="CPButtonImageKey",_77="CPButtonAlternateImageKey",_78="CPButtonTitleKey",_79="CPButtonAlternateTitleKey",_7a="CPButtonIsBorderedKey";
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
_7b=objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPControl")},"initWithCoder:",_7d);
if(_7b){
_controlSize=CPRegularControlSize;
objj_msgSend(_7b,"setImage:",objj_msgSend(_7d,"decodeObjectForKey:",_76));
objj_msgSend(_7b,"setAlternateImage:",objj_msgSend(_7d,"decodeObjectForKey:",_77));
objj_msgSend(_7b,"setTitle:",objj_msgSend(_7d,"decodeObjectForKey:",_78));
objj_msgSend(_7b,"setAlternateTitle:",objj_msgSend(_7d,"decodeObjectForKey:",_79));
objj_msgSend(_7b,"setNeedsLayout");
objj_msgSend(_7b,"setNeedsDisplay:",YES);
}
return _7b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7e,_7f,_80){
with(_7e){
objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_80);
objj_msgSend(_80,"encodeObject:forKey:",_image,_76);
objj_msgSend(_80,"encodeObject:forKey:",_alternateImage,_77);
objj_msgSend(_80,"encodeObject:forKey:",_title,_78);
objj_msgSend(_80,"encodeObject:forKey:",_alternateTitle,_79);
}
})]);
i;12;CPCheckBox.ji;9;CPRadio.jp;13;CPButtonBar.jI;15;AppKit/CPView.jc;1693;
var _1=objj_allocateClassPair(CPControl,"CPButtonBar"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_3,_4,_5){
with(_3){
if(_5==="bezel-view"){
return objj_msgSend(_3,"bounds");
}
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_5);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6,_7,_8){
with(_6){
if(_8==="bezel-view"){
var _9=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_9,"setHitTests:",NO);
return _9;
}
return objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_8);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_a,_b){
with(_a){
var _c=objj_msgSend(_a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"");
if(_c){
objj_msgSend(_c,"setBackgroundColor:",objj_msgSend(_a,"currentValueForThemeAttribute:","bezel-color"));
}
}
}),new objj_method(sel_getUid("addSubview:"),function(_d,_e,_f){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPControl")},"addSubview:",_f);
objj_msgSend(_f,"setAutoresizingMask:",CPViewMinXMargin);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_10,_11){
with(_10){
return "button-bar";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_12,_13){
with(_12){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil],["bezel-color"]);
}
})]);
p;12;CPCheckBox.ji;10;CPButton.jc;1040;
var _1=objj_allocateClassPair(CPButton,"CPCheckBox"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("checkBoxWithTitle:theme:"),function(_6,_7,_8,_9){
with(_6){
return objj_msgSend(_6,"buttonWithTitle:theme:",_8,_9);
}
}),new objj_method(sel_getUid("checkBoxWithTitle:"),function(_a,_b,_c){
with(_a){
return objj_msgSend(_a,"buttonWithTitle:",_c);
}
}),new objj_method(sel_getUid("themeClass"),function(_d,_e){
with(_d){
return "check-box";
}
})]);
p;7;CPCib.jI;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibClassSwapper.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;19;_CPCibProxyObject.ji;22;_CPCibWindowTemplate.jc;4545;
CPCibOwner="CPCibOwner",CPCibTopLevelObjects="CPCibTopLevelObjects",CPCibReplacementClasses="CPCibReplacementClasses",CPCibExternalObjects="CPCibExternalObjects";
var _1="CPCibObjectDataKey";
var _2=objj_allocateClassPair(CPObject,"CPCib"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_data"),new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_data=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_6),nil,nil);
_awakenCustomResources=YES;
}
return _4;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:loadDelegate:"),function(_7,_8,_9,_a){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_9),_7);
_awakenCustomResources=YES;
_loadDelegate=_a;
}
return _7;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:"),function(_b,_c,_d,_e){
with(_b){
if(!objj_msgSend(_d,"hasSuffix:",".cib")){
_d=objj_msgSend(_d,"stringByAppendingString:",".cib");
}
_b=objj_msgSend(_b,"initWithContentsOfURL:",objj_msgSend(_e||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_d));
if(_b){
_bundle=_e;
}
return _b;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:loadDelegate:"),function(_f,_10,_11,_12,_13){
with(_f){
if(!objj_msgSend(_11,"hasSuffix:",".cib")){
_11=objj_msgSend(_11,"stringByAppendingString:",".cib");
}
_f=objj_msgSend(_f,"initWithContentsOfURL:loadDelegate:",objj_msgSend(_12||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_11),_13);
if(_f){
_bundle=_12;
}
return _f;
}
}),new objj_method(sel_getUid("_setAwakenCustomResources:"),function(_14,_15,_16){
with(_14){
_awakenCustomResources=_16;
}
}),new objj_method(sel_getUid("_awakenCustomResources"),function(_17,_18){
with(_17){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"),function(_19,_1a,_1b){
with(_19){
var _1c=_bundle,_1d=objj_msgSend(_1b,"objectForKey:",CPCibOwner);
if(!_1c&&_1d){
_1c=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_1d,"class"));
}
var _1e=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:awakenCustomResources:",_data,_1c,_awakenCustomResources),_1f=objj_msgSend(_1b,"objectForKey:",CPCibReplacementClasses);
if(_1f){
var key=nil,_21=objj_msgSend(_1f,"keyEnumerator");
while(key=objj_msgSend(_21,"nextObject")){
objj_msgSend(_1e,"setClass:forClassName:",objj_msgSend(_1f,"objectForKey:",key),key);
}
}
objj_msgSend(_1e,"setExternalObjectsForProxyIdentifiers:",objj_msgSend(_1b,"objectForKey:",CPCibExternalObjects));
var _22=objj_msgSend(_1e,"decodeObjectForKey:",_1);
if(!_22||!objj_msgSend(_22,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
var _23=objj_msgSend(_1b,"objectForKey:",CPCibTopLevelObjects);
objj_msgSend(_22,"instantiateWithOwner:topLevelObjects:",_1d,_23);
objj_msgSend(_22,"establishConnectionsWithOwner:topLevelObjects:",_1d,_23);
objj_msgSend(_22,"awakeWithOwner:topLevelObjects:",_1d,_23);
objj_msgSend(_22,"displayVisibleWindows");
return YES;
}
}),new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"),function(_24,_25,_26,_27){
with(_24){
return objj_msgSend(_24,"instantiateCibWithExternalNameTable:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_26,CPCibOwner,_27,CPCibTopLevelObjects));
}
})]);
var _2=objj_getClass("CPCib");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCib\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("connection:didReceiveData:"),function(_28,_29,_2a,_2b){
with(_28){
_data=objj_msgSend(CPData,"dataWithString:",_2b);
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_2c,_2d,_2e,_2f){
with(_2c){
alert("cib: connection failed.");
_loadDelegate=nil;
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_30,_31,_32){
with(_30){
if(objj_msgSend(_loadDelegate,"respondsToSelector:",sel_getUid("cibDidFinishLoading:"))){
objj_msgSend(_loadDelegate,"cibDidFinishLoading:",_30);
}
_loadDelegate=nil;
}
})]);
p;16;CPCibConnector.jI;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;2366;
var _1="_CPCibConnectorSourceKey",_2="_CPCibConnectorDestinationKey",_3="_CPCibConnectorLabelKey";
var _4=objj_allocateClassPair(CPObject,"CPCibConnector"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_source"),new objj_ivar("_destination"),new objj_ivar("_label")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("source"),function(_6,_7){
with(_6){
return _source;
}
}),new objj_method(sel_getUid("setSource:"),function(_8,_9,_a){
with(_8){
_source=_a;
}
}),new objj_method(sel_getUid("destination"),function(_b,_c){
with(_b){
return _destination;
}
}),new objj_method(sel_getUid("setDestination:"),function(_d,_e,_f){
with(_d){
_destination=_f;
}
}),new objj_method(sel_getUid("label"),function(_10,_11){
with(_10){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_12,_13,_14){
with(_12){
_label=_14;
}
}),new objj_method(sel_getUid("replaceObject:withObject:"),function(_15,_16,_17,_18){
with(_15){
if(_source===_17){
_source=_18;
}
if(_destination===_17){
_destination=_18;
}
}
}),new objj_method(sel_getUid("replaceObjects:"),function(_19,_1a,_1b){
with(_19){
var _1c=_1b[objj_msgSend(_source,"UID")];
if(_1c!==undefined){
_source=_1c;
}
_1c=_1b[objj_msgSend(_destination,"UID")];
if(_1c!==undefined){
_destination=_1c;
}
}
})]);
var _4=objj_getClass("CPCibConnector");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCibConnector\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
_source=objj_msgSend(_1f,"decodeObjectForKey:",_1);
_destination=objj_msgSend(_1f,"decodeObjectForKey:",_2);
_label=objj_msgSend(_1f,"decodeObjectForKey:",_3);
}
return _1d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_22,"encodeObject:forKey:",_source,_1);
objj_msgSend(_22,"encodeObject:forKey:",_destination,_2);
objj_msgSend(_22,"encodeObject:forKey:",_label,_3);
}
})]);
var _4=objj_allocateClassPair(CPCibConnector,"_CPCibConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;23;CPCibControlConnector.ji;16;CPCibConnector.jc;1599;
var _1=objj_allocateClassPair(CPCibConnector,"CPCibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("establishConnection"),function(_3,_4){
with(_3){
var _5=_label,_6=objj_msgSend(_5,"length");
if(_6&&_5[_6-1]!==":"){
_5+=":";
}
var _7=CPSelectorFromString(_5);
if(!_7){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] selector "+_5+" does not exist.");
}
if(_destination&&!objj_msgSend(_destination,"respondsToSelector:",_7)){
CPLog.warn("Could not connect the action "+_7+" to target of class "+objj_msgSend(_destination,"className"));
return;
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_source,sel_getUid("setAction:"),_7);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] "+objj_msgSend(_source,"description")+" does not respond to setAction:");
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_source,sel_getUid("setTarget:"),_destination);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_3,"className")+" "+_4+"] "+objj_msgSend(_source,"description")+" does not respond to setTarget:");
}
}
})]);
var _1=objj_allocateClassPair(CPCibControlConnector,"_CPCibControlConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;14;CPCibLoading.jI;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2894;
var _1="CPCibOwner";
var _2={};
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
}
})]);
var _3=objj_getClass("CPBundle");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_7,_8,_9,_a){
with(_7){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_9),"instantiateCibWithExternalNameTable:",_a);
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_b,_c,_d,_e,_f){
with(_b){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:loadDelegate:",_d,_b,objj_msgSend(_b,"class"));
_2[objj_msgSend(cib,"UID")]={loadDelegate:_f,externalNameTable:_e};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_11,_12,_13,_14){
with(_11){
objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",_13),"instantiateCibWithExternalNameTable:",_14);
}
}),new objj_method(sel_getUid("loadCibNamed:owner:"),function(_15,_16,_17,_18){
with(_15){
if(!objj_msgSend(_17,"hasSuffix:",".cib")){
_17=objj_msgSend(_17,"stringByAppendingString:",".cib");
}
var _19=_18?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_18,"class")):objj_msgSend(CPBundle,"mainBundle"),_1a=objj_msgSend(_19,"pathForResource:",_17);
objj_msgSend(_15,"loadCibFile:externalNameTable:",_1a,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_18,_1));
}
}),new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:loadDelegate:",_1d,_1b);
_2[objj_msgSend(cib,"UID")]={loadDelegate:_1f,externalNameTable:_1e};
}
}),new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"),function(_21,_22,_23,_24,_25){
with(_21){
if(!objj_msgSend(_23,"hasSuffix:",".cib")){
_23=objj_msgSend(_23,"stringByAppendingString:",".cib");
}
var _26=_24?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_24,"class")):objj_msgSend(CPBundle,"mainBundle"),_27=objj_msgSend(_26,"pathForResource:",_23);
objj_msgSend(_21,"loadCibFile:externalNameTable:loadDelegate:",_27,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_24,_1),_25);
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_28,_29,_2a){
with(_28){
var _2b=_2[objj_msgSend(_2a,"UID")];
delete _2[objj_msgSend(_2a,"UID")];
objj_msgSend(_2a,"instantiateCibWithExternalNameTable:",_2b.externalNameTable);
objj_msgSend(_2b.loadDelegate,"cibDidFinishLoading:",_2a);
}
})]);
p;22;CPCibOutletConnector.ji;16;CPCibConnector.jc;776;
var _1=objj_allocateClassPair(CPCibConnector,"CPCibOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("establishConnection"),function(_3,_4){
with(_3){
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
var _1=objj_allocateClassPair(CPCibOutletConnector,"_CPCibOutletConnector"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
p;12;CPClipView.ji;8;CPView.jc;4242;
var _1=objj_allocateClassPair(CPView,"CPClipView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_documentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setDocumentView:"),function(_3,_4,_5){
with(_3){
if(_documentView==_5){
return;
}
var _6=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_documentView){
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewBoundsDidChangeNotification,_documentView);
objj_msgSend(_documentView,"removeFromSuperview");
}
_documentView=_5;
if(_documentView){
objj_msgSend(_3,"addSubview:",_documentView);
objj_msgSend(_documentView,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_documentView,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewFrameChanged:"),CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewBoundsChanged:"),CPViewBoundsDidChangeNotification,_documentView);
}
}
}),new objj_method(sel_getUid("documentView"),function(_7,_8){
with(_7){
return _documentView;
}
}),new objj_method(sel_getUid("constrainScrollPoint:"),function(_9,_a,_b){
with(_9){
if(!_documentView){
return {x:0,y:0};
}
var _c=objj_msgSend(_documentView,"frame");
_b.x=MAX(0,MIN(_b.x,MAX((_c.size.width)-(_bounds.size.width),0)));
_b.y=MAX(0,MIN(_b.y,MAX((_c.size.height)-(_bounds.size.height),0)));
return _b;
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_d,_e,_f){
with(_d){
if((_bounds.origin.x==_f.x&&_bounds.origin.y==_f.y)){
return;
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"setBoundsOrigin:",_f);
var _10=objj_msgSend(_d,"superview");
if(objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_10,"reflectScrolledClipView:",_d);
}
}
}),new objj_method(sel_getUid("scrollToPoint:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setBoundsOrigin:",objj_msgSend(_11,"constrainScrollPoint:",_13));
}
}),new objj_method(sel_getUid("viewBoundsChanged:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("viewFrameChanged:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPView")},"resizeSubviewsWithOldSize:",_1c);
objj_msgSend(_1a,"_constrainScrollPoint");
}
}),new objj_method(sel_getUid("_constrainScrollPoint"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"bounds").origin;
objj_msgSend(_1d,"scrollToPoint:",_1f);
if(!CGPointEqualToPoint(_1f,objj_msgSend(_1d,"bounds").origin)){
return;
}
var _20=objj_msgSend(_1d,"superview");
if(objj_msgSend(_20,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_20,"reflectScrolledClipView:",_1d);
}
}
}),new objj_method(sel_getUid("autoscroll:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(_21,"bounds"),_25=objj_msgSend(_21,"convertPoint:fromView:",objj_msgSend(_23,"locationInWindow"),nil);
if(CPRectContainsPoint(_24,_25)){
return NO;
}
var _26=CGRectMakeZero();
_26.origin=_25;
_26.size=CPSizeMake(10,10);
return objj_msgSend(_documentView,"scrollRectToVisible:",_26);
}
})]);
var _27="CPScrollViewDocumentView";
var _1=objj_getClass("CPClipView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPClipView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_28,_29,_2a){
with(_28){
if(_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPView")},"initWithCoder:",_2a)){
objj_msgSend(_28,"setDocumentView:",objj_msgSend(_2a,"decodeObjectForKey:",_27));
}
return _28;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPView")},"encodeWithCoder:",_2d);
objj_msgSend(_2d,"encodeObject:forKey:",_documentView,_27);
}
})]);
p;18;CPCollectionView.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.ji;8;CPView.ji;22;CPCollectionViewItem.jc;12968;
var _1=objj_allocateClassPair(CPView,"CPCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_items"),new objj_ivar("_itemData"),new objj_ivar("_itemPrototype"),new objj_ivar("_itemForDragging"),new objj_ivar("_cachedItems"),new objj_ivar("_maxNumberOfRows"),new objj_ivar("_maxNumberOfColumns"),new objj_ivar("_minItemSize"),new objj_ivar("_maxItemSize"),new objj_ivar("_backgroundColors"),new objj_ivar("_tileWidth"),new objj_ivar("_isSelectable"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_selectionIndexes"),new objj_ivar("_itemSize"),new objj_ivar("_horizontalMargin"),new objj_ivar("_verticalMargin"),new objj_ivar("_numberOfRows"),new objj_ivar("_numberOfColumns"),new objj_ivar("_delegate"),new objj_ivar("_mouseDownEvent")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=CGSizeMakeZero();
_maxItemSize=CGSizeMakeZero();
objj_msgSend(_3,"setBackgroundColors:",nil);
_verticalMargin=5;
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
_isSelectable=YES;
}
return _3;
}
}),new objj_method(sel_getUid("setItemPrototype:"),function(_6,_7,_8){
with(_6){
_cachedItems=[];
_itemData=nil;
_itemForDragging=nil;
_itemPrototype=_8;
objj_msgSend(_6,"reloadContent");
}
}),new objj_method(sel_getUid("itemPrototype"),function(_9,_a){
with(_9){
return _itemPrototype;
}
}),new objj_method(sel_getUid("newItemForRepresentedObject:"),function(_b,_c,_d){
with(_b){
var _e=nil;
if(_cachedItems.length){
_e=_cachedItems.pop();
}else{
if(!_itemData){
if(_itemPrototype){
_itemData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_itemPrototype);
}
}
_e=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_itemData);
}
objj_msgSend(_e,"setRepresentedObject:",_d);
objj_msgSend(objj_msgSend(_e,"view"),"setFrameSize:",_itemSize);
return _e;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_f,_10){
with(_f){
return YES;
}
}),new objj_method(sel_getUid("isFirstResponder"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"window"),"firstResponder")===_11;
}
}),new objj_method(sel_getUid("setContent:"),function(_13,_14,_15){
with(_13){
if(_content==_15){
return;
}
_content=_15;
objj_msgSend(_13,"reloadContent");
}
}),new objj_method(sel_getUid("content"),function(_16,_17){
with(_16){
return _content;
}
}),new objj_method(sel_getUid("items"),function(_18,_19){
with(_18){
return _items;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_1a,_1b,_1c){
with(_1a){
if(_isSelectable==_1c){
return;
}
_isSelectable=_1c;
if(!_isSelectable){
var _1d=CPNotFound;
while((_1d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_1d))!=CPNotFound){
objj_msgSend(_items[_1d],"setSelected:",NO);
}
}
}
}),new objj_method(sel_getUid("isSelectable"),function(_1e,_1f){
with(_1e){
return _isSelectable;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_20,_21,_22){
with(_20){
_allowsEmptySelection=_22;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_23,_24){
with(_23){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_25,_26,_27){
with(_25){
_allowsMultipleSelection=_27;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_28,_29){
with(_28){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_2a,_2b,_2c){
with(_2a){
if(_selectionIndexes==_2c||!_isSelectable){
return;
}
var _2d=CPNotFound;
while((_2d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2d))!=CPNotFound){
objj_msgSend(_items[_2d],"setSelected:",NO);
}
_selectionIndexes=_2c;
var _2d=CPNotFound;
while((_2d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_2d))!=CPNotFound){
objj_msgSend(_items[_2d],"setSelected:",YES);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionViewDidChangeSelection:"))){
objj_msgSend(_delegate,"collectionViewDidChangeSelection:",_2a);
}
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_2e,_2f){
with(_2e){
return _selectionIndexes;
}
}),new objj_method(sel_getUid("reloadContent"),function(_30,_31){
with(_30){
var _32=_items.length;
while(_32--){
objj_msgSend(objj_msgSend(_items[_32],"view"),"removeFromSuperview");
_cachedItems.push(_items[_32]);
}
_items=[];
if(!_itemPrototype||!_content){
return;
}
var _33=0;
_32=_content.length;
for(;_33<_32;++_33){
_items.push(objj_msgSend(_30,"newItemForRepresentedObject:",_content[_33]));
objj_msgSend(_30,"addSubview:",objj_msgSend(_items[_33],"view"));
}
objj_msgSend(_30,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_34,_35){
with(_34){
var _36=CGRectGetWidth(objj_msgSend(_34,"bounds"));
if(!objj_msgSend(_content,"count")||_36==_tileWidth){
return;
}
var _37=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_36/_37.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _38=_36-_numberOfColumns*_37.width,_39=NO;
if(_38>0&&_37.width<_maxItemSize.width){
_37.width=MIN(_maxItemSize.width,_37.width+FLOOR(_38/_numberOfColumns));
}
if(_maxNumberOfColumns==1&&_37.width<_maxItemSize.width&&_37.width<_36){
_37.width=MIN(_maxItemSize.width,_36);
}
if(!CGSizeEqualToSize(_itemSize,_37)){
_itemSize=_37;
_39=YES;
}
var _3a=0,_3b=_items.length;
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_3b=MIN(_3b,_maxNumberOfColumns*_maxNumberOfRows);
}
_numberOfRows=CEIL(_3b/_numberOfColumns);
_horizontalMargin=FLOOR((_36-_numberOfColumns*_37.width)/(_numberOfColumns+1));
var x=_horizontalMargin,y=-_37.height;
for(;_3a<_3b;++_3a){
if(_3a%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_37.height;
}
var _3e=objj_msgSend(_items[_3a],"view");
objj_msgSend(_3e,"setFrameOrigin:",CGPointMake(x,y));
if(_39){
objj_msgSend(_3e,"setFrameSize:",_itemSize);
}
x+=_37.width+_horizontalMargin;
}
_tileWidth=_36;
objj_msgSend(_34,"setFrameSize:",CGSizeMake(_36,y+_37.height+_verticalMargin));
_tileWidth=-1;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_3f,"tile");
}
}),new objj_method(sel_getUid("setMaxNumberOfRows:"),function(_42,_43,_44){
with(_42){
if(_maxNumberOfRows==_44){
return;
}
_maxNumberOfRows=_44;
objj_msgSend(_42,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfRows"),function(_45,_46){
with(_45){
return _maxNumberOfRows;
}
}),new objj_method(sel_getUid("setMaxNumberOfColumns:"),function(_47,_48,_49){
with(_47){
if(_maxNumberOfColumns==_49){
return;
}
_maxNumberOfColumns=_49;
objj_msgSend(_47,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfColumns"),function(_4a,_4b){
with(_4a){
return _maxNumberOfColumns;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_4c,_4d){
with(_4c){
return _numberOfRows;
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_4e,_4f){
with(_4e){
return _numberOfColumns;
}
}),new objj_method(sel_getUid("setMinItemSize:"),function(_50,_51,_52){
with(_50){
if(CGSizeEqualToSize(_minItemSize,_52)){
return;
}
_minItemSize=CGSizeMakeCopy(_52);
objj_msgSend(_50,"tile");
}
}),new objj_method(sel_getUid("minItemSize"),function(_53,_54){
with(_53){
return _minItemSize;
}
}),new objj_method(sel_getUid("setMaxItemSize:"),function(_55,_56,_57){
with(_55){
if(CGSizeEqualToSize(_maxItemSize,_57)){
return;
}
_maxItemSize=CGSizeMakeCopy(_57);
objj_msgSend(_55,"tile");
}
}),new objj_method(sel_getUid("maxItemSize"),function(_58,_59){
with(_58){
return _maxItemSize;
}
}),new objj_method(sel_getUid("setBackgroundColors:"),function(_5a,_5b,_5c){
with(_5a){
if(_backgroundColors===_5c){
return;
}
_backgroundColors=_5c;
if(!_backgroundColors){
_backgroundColors=objj_msgSend(CPColor,"whiteColor");
}
if(objj_msgSend(_backgroundColors,"count")===1){
objj_msgSend(_5a,"setBackgroundColor:",_backgroundColors[0]);
}else{
objj_msgSend(_5a,"setBackgroundColor:",nil);
}
objj_msgSend(_5a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("backgroundColors"),function(_5d,_5e){
with(_5d){
return _backgroundColors;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_selectionIndexes,"count")&&objj_msgSend(_61,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"))){
objj_msgSend(_delegate,"collectionView:didDoubleClickOnItemAtIndex:",_5f,objj_msgSend(_selectionIndexes,"firstIndex"));
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_62,_63,_64){
with(_62){
_mouseDownEvent=_64;
var _65=objj_msgSend(_62,"convertPoint:fromView:",objj_msgSend(_64,"locationInWindow"),nil),row=FLOOR(_65.y/(_itemSize.height+_verticalMargin)),_67=FLOOR(_65.x/(_itemSize.width+_horizontalMargin)),_68=row*_numberOfColumns+_67;
if(_68>=0&&_68<_items.length){
objj_msgSend(_62,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_68));
}else{
if(_allowsEmptySelection){
objj_msgSend(_62,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
}
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_69,_6a,_6b){
with(_69){
if(!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:dragTypesForItemsAtIndexes:"))){
return;
}
if(!objj_msgSend(_selectionIndexes,"count")){
return;
}
var _6c=objj_msgSend(_delegate,"collectionView:dragTypesForItemsAtIndexes:",_69,_selectionIndexes);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",_6c,_69);
var _6d=objj_msgSend(_69,"convertPoint:fromView:",objj_msgSend(_6b,"locationInWindow"),nil);
if(!_itemForDragging){
_itemForDragging=objj_msgSend(_69,"newItemForRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}else{
objj_msgSend(_itemForDragging,"setRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
}
var _6e=objj_msgSend(_itemForDragging,"view");
objj_msgSend(_6e,"setFrameSize:",_itemSize);
objj_msgSend(_6e,"setAlphaValue:",0.7);
objj_msgSend(_69,"dragView:at:offset:event:pasteboard:source:slideBack:",_6e,objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes,"firstIndex")],"view"),"frame").origin,CGSizeMakeZero(),_mouseDownEvent,nil,_69,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_6f,_70,_71,_72){
with(_6f){
objj_msgSend(_71,"setData:forType:",objj_msgSend(_delegate,"collectionView:dataForItemsAtIndexes:forType:",_6f,_selectionIndexes,_72),_72);
}
}),new objj_method(sel_getUid("setVerticalMargin:"),function(_73,_74,_75){
with(_73){
if(_verticalMargin==_75){
return;
}
_verticalMargin=_75;
objj_msgSend(_73,"tile");
}
}),new objj_method(sel_getUid("verticalMargin"),function(_76,_77){
with(_76){
return _verticalMargin;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_78,_79,_7a){
with(_78){
_delegate=_7a;
}
}),new objj_method(sel_getUid("delegate"),function(_7b,_7c){
with(_7b){
return _delegate;
}
})]);
var _7d="CPCollectionViewMinItemSizeKey",_7e="CPCollectionViewMaxItemSizeKey",_7f="CPCollectionViewVerticalMarginKey",_80="CPCollectionViewSelectableKey",_81="CPCollectionViewBackgroundColorsKey";
var _1=objj_getClass("CPCollectionView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCollectionView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_82,_83,_84){
with(_82){
_82=objj_msgSendSuper({receiver:_82,super_class:objj_getClass("CPView")},"initWithCoder:",_84);
if(_82){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=objj_msgSend(_84,"decodeSizeForKey:",_7d)||CGSizeMakeZero();
_maxItemSize=objj_msgSend(_84,"decodeSizeForKey:",_7e)||CGSizeMakeZero();
_verticalMargin=objj_msgSend(_84,"decodeFloatForKey:",_7f);
_isSelectable=objj_msgSend(_84,"decodeBoolForKey:",_80);
objj_msgSend(_82,"setBackgroundColors:",objj_msgSend(_84,"decodeObjectForKey:",_81));
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
_allowsEmptySelection=YES;
}
return _82;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_85,_86,_87){
with(_85){
objj_msgSendSuper({receiver:_85,super_class:objj_getClass("CPView")},"encodeWithCoder:",_87);
if(!CGSizeEqualToSize(_minItemSize,CGSizeMakeZero())){
objj_msgSend(_87,"encodeSize:forKey:",_minItemSize,_7d);
}
if(!CGSizeEqualToSize(_maxItemSize,CGSizeMakeZero())){
objj_msgSend(_87,"encodeSize:forKey:",_maxItemSize,_7e);
}
objj_msgSend(_87,"encodeBool:forKey:",_isSelectable,_80);
objj_msgSend(_87,"encodeFloat:forKey:",_verticalMargin,_7f);
objj_msgSend(_87,"encodeObject:forKey:",_backgroundColors,_81);
}
})]);
p;22;CPCollectionViewItem.ji;18;CPViewController.jc;1163;
var _1=objj_allocateClassPair(CPViewController,"CPCollectionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isSelected")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPViewController")},"setRepresentedObject:",_5);
var _6=objj_msgSend(_3,"view");
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("setRepresentedObject:"))){
objj_msgSend(_6,"setRepresentedObject:",objj_msgSend(_3,"representedObject"));
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_7,_8,_9){
with(_7){
_9=!!_9;
if(_isSelected===_9){
return;
}
_isSelected=_9;
var _a=objj_msgSend(_7,"view");
if(objj_msgSend(_a,"respondsToSelector:",sel_getUid("setSelected:"))){
objj_msgSend(_a,"setSelected:",objj_msgSend(_7,"isSelected"));
}
}
}),new objj_method(sel_getUid("isSelected"),function(_b,_c){
with(_b){
return _isSelected;
}
}),new objj_method(sel_getUid("collectionView"),function(_d,_e){
with(_d){
return objj_msgSend(_view,"superview");
}
})]);
p;9;CPColor.jI;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;14542;
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2;
var _8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,_15,_16,_17;
var _18=objj_allocateClassPair(CPObject,"CPColor"),_19=_18.isa;
class_addIvars(_18,[new objj_ivar("_components"),new objj_ivar("_patternImage"),new objj_ivar("_cssString")]);
objj_registerClassPair(_18);
objj_addClassForBundle(_18,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_18,[new objj_method(sel_getUid("_initWithCSSString:"),function(_1a,_1b,_1c){
with(_1a){
if(_1c.indexOf("rgb")==CPNotFound){
return nil;
}
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
var _1d=_1c.indexOf("(");
var _1e=_1c.substring(_1d+1).split(",");
_components=[parseInt(_1e[0],10)/255,parseInt(_1e[1],10)/255,parseInt(_1e[2],10)/255,_1e[3]?parseInt(_1e[3],10)/255:1];
_cssString=_1c;
return _1a;
}
}),new objj_method(sel_getUid("_initWithRGBA:"),function(_1f,_20,_21){
with(_1f){
_1f=objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("CPObject")},"init");
if(_1f){
_components=_21;
if(!CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1&&window.Base64&&window.CRC32){
var _22=[137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,1,0,0,0,1,8,3,0,0,0,40,203,52,187,0,0,3,0,80,76,84,69,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,137,153,85,0,0,0,1,116,82,78,83,0,64,230,216,102,0,0,0,16,73,68,65,84,120,218,98,96,0,0,0,0,255,255,3,0,0,2,0,1,36,127,36,241,0,0,0,0,73,69,78,68,174,66,96,130,255];
var _23=41;
var _24=42;
var _25=43;
var _26=821;
var _27=809;
var _28=822;
var _29=37;
var _2a=817;
_22[_23]=Math.round(_components[0]*255);
_22[_24]=Math.round(_components[1]*255);
_22[_25]=Math.round(_components[2]*255);
_22[_26]=Math.round(_components[3]*255);
var _2b=integerToBytes(CRC32.getCRC(_22,_29,4+768),4);
var _2c=integerToBytes(CRC32.getCRC(_22,_2a,4+1),4);
for(var i=0;i<4;i++){
_22[_27+i]=_2b[i];
_22[_28+i]=_2c[i];
}
var _2e=Base64.encode(_22);
_cssString="url(\"data:image/png;base64,"+_2e+"\")";
}else{
var _2f=CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1;
_cssString=(_2f?"rgba(":"rgb(")+parseInt(_components[0]*255)+", "+parseInt(_components[1]*255)+", "+parseInt(_components[2]*255)+(_2f?(", "+_components[3]):"")+")";
}
}
return _1f;
}
}),new objj_method(sel_getUid("_initWithPatternImage:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("CPObject")},"init");
if(_30){
_patternImage=_32;
_cssString="url(\""+objj_msgSend(_patternImage,"filename")+"\")";
}
return _30;
}
}),new objj_method(sel_getUid("patternImage"),function(_33,_34){
with(_33){
return _patternImage;
}
}),new objj_method(sel_getUid("alphaComponent"),function(_35,_36){
with(_35){
return _components[3];
}
}),new objj_method(sel_getUid("blueComponent"),function(_37,_38){
with(_37){
return _components[2];
}
}),new objj_method(sel_getUid("greenComponent"),function(_39,_3a){
with(_39){
return _components[1];
}
}),new objj_method(sel_getUid("redComponent"),function(_3b,_3c){
with(_3b){
return _components[0];
}
}),new objj_method(sel_getUid("components"),function(_3d,_3e){
with(_3d){
return _components;
}
}),new objj_method(sel_getUid("colorWithAlphaComponent:"),function(_3f,_40,_41){
with(_3f){
var _42=_components.slice();
_42[_42.length-1]=_41;
return objj_msgSend(objj_msgSend(objj_msgSend(_3f,"class"),"alloc"),"_initWithRGBA:",_42);
}
}),new objj_method(sel_getUid("hsbComponents"),function(_43,_44){
with(_43){
var red=ROUND(_components[_1]*255),_46=ROUND(_components[_2]*255),_47=ROUND(_components[_3]*255);
var max=MAX(red,_46,_47),min=MIN(red,_46,_47),_4a=max-min;
var _4b=max/255,_4c=(max!=0)?_4a/max:0;
var hue;
if(_4c==0){
hue=0;
}else{
var rr=(max-red)/_4a;
var gr=(max-_46)/_4a;
var br=(max-_47)/_4a;
if(red==max){
hue=br-gr;
}else{
if(_46==max){
hue=2+rr-br;
}else{
hue=4+gr-rr;
}
}
hue/=6;
if(hue<0){
hue++;
}
}
return [ROUND(hue*360),ROUND(_4c*100),ROUND(_4b*100)];
}
}),new objj_method(sel_getUid("cssString"),function(_51,_52){
with(_51){
return _cssString;
}
}),new objj_method(sel_getUid("hexString"),function(_53,_54){
with(_53){
return rgbToHex(objj_msgSend(_53,"redComponent"),objj_msgSend(_53,"greenComponent"),objj_msgSend(_53,"blueComponent"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_55,_56,_57){
with(_55){
if(!_57){
return NO;
}
if(_57===_55){
return YES;
}
return objj_msgSend(_57,"isKindOfClass:",CPColor)&&objj_msgSend(_57,"cssString")===objj_msgSend(_55,"cssString");
}
}),new objj_method(sel_getUid("description"),function(_58,_59){
with(_58){
return objj_msgSendSuper({receiver:_58,super_class:objj_getClass("CPObject")},"description")+" "+objj_msgSend(_58,"cssString");
}
})]);
class_addMethods(_19,[new objj_method(sel_getUid("colorWithRed:green:blue:alpha:"),function(_5a,_5b,red,_5d,_5e,_5f){
with(_5a){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[red,_5d,_5e,_5f]);
}
}),new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"),function(_60,_61,red,_63,_64,_65){
with(_60){
return objj_msgSend(_60,"colorWithRed:green:blue:alpha:",red,_63,_64,_65);
}
}),new objj_method(sel_getUid("colorWithWhite:alpha:"),function(_66,_67,_68,_69){
with(_66){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[_68,_68,_68,_69]);
}
}),new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(_6a,"colorWithWhite:alpha:",_6c,_6d);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:"),function(_6e,_6f,hue,_71,_72){
with(_6e){
return objj_msgSend(_6e,"colorWithHue:saturation:brightness:alpha:",hue,_71,_72,1);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:alpha:"),function(_73,_74,hue,_76,_77,_78){
with(_73){
if(_76===0){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_77/100,_78);
}
var f=hue%60,p=(_77*(100-_76))/10000,q=(_77*(6000-_76*f))/600000,t=(_77*(6000-_76*(60-f)))/600000,b=_77/100;
switch(FLOOR(hue/60)){
case 0:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,t,p,_78);
case 1:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",q,b,p,_78);
case 2:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,b,t,_78);
case 3:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,q,b,_78);
case 4:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",t,p,b,_78);
case 5:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,p,q,_78);
}
}
}),new objj_method(sel_getUid("colorWithHexString:"),function(_7e,_7f,hex){
with(_7e){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",hexToRGB(hex));
}
}),new objj_method(sel_getUid("blackColor"),function(_81,_82){
with(_81){
if(!_8){
_8=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1]);
}
return _8;
}
}),new objj_method(sel_getUid("blueColor"),function(_83,_84){
with(_83){
if(!_b){
_b=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,1,1]);
}
return _b;
}
}),new objj_method(sel_getUid("darkGrayColor"),function(_85,_86){
with(_85){
if(!_f){
_f=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1/3,1);
}
return _f;
}
}),new objj_method(sel_getUid("grayColor"),function(_87,_88){
with(_87){
if(!_d){
_d=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1);
}
return _d;
}
}),new objj_method(sel_getUid("greenColor"),function(_89,_8a){
with(_89){
if(!_a){
_a=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,0,1]);
}
return _a;
}
}),new objj_method(sel_getUid("lightGrayColor"),function(_8b,_8c){
with(_8b){
if(!_e){
_e=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",2/3,1);
}
return _e;
}
}),new objj_method(sel_getUid("redColor"),function(_8d,_8e){
with(_8d){
if(!_9){
_9=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,0,1]);
}
return _9;
}
}),new objj_method(sel_getUid("whiteColor"),function(_8f,_90){
with(_8f){
if(!_10){
_10=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,1,1]);
}
return _10;
}
}),new objj_method(sel_getUid("yellowColor"),function(_91,_92){
with(_91){
if(!_c){
_c=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,0,1]);
}
return _c;
}
}),new objj_method(sel_getUid("brownColor"),function(_93,_94){
with(_93){
if(!_11){
_11=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.6,0.4,0.2,1]);
}
return _11;
}
}),new objj_method(sel_getUid("cyanColor"),function(_95,_96){
with(_95){
if(!_12){
_12=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,1,1]);
}
return _12;
}
}),new objj_method(sel_getUid("magentaColor"),function(_97,_98){
with(_97){
if(!_13){
_13=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,1,1]);
}
return _13;
}
}),new objj_method(sel_getUid("orangeColor"),function(_99,_9a){
with(_99){
if(!_14){
_14=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0.5,0,1]);
}
return _14;
}
}),new objj_method(sel_getUid("purpleColor"),function(_9b,_9c){
with(_9b){
if(!_15){
_15=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.5,0,0.5,1]);
}
return _15;
}
}),new objj_method(sel_getUid("shadowColor"),function(_9d,_9e){
with(_9d){
if(!_16){
_16=objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1/3]);
}
return _16;
}
}),new objj_method(sel_getUid("clearColor"),function(_9f,_a0){
with(_9f){
if(!_17){
_17=objj_msgSend(_9f,"colorWithCalibratedWhite:alpha:",0,0);
}
return _17;
}
}),new objj_method(sel_getUid("alternateSelectedControlColor"),function(_a1,_a2){
with(_a1){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.22,0.46,0.84,1]);
}
}),new objj_method(sel_getUid("secondarySelectedControlColor"),function(_a3,_a4){
with(_a3){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.83,0.83,0.83,1]);
}
}),new objj_method(sel_getUid("colorWithPatternImage:"),function(_a5,_a6,_a7){
with(_a5){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",_a7);
}
}),new objj_method(sel_getUid("colorWithCSSString:"),function(_a8,_a9,_aa){
with(_a8){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_aa);
}
})]);
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("set"),function(_ab,_ac){
with(_ab){
objj_msgSend(_ab,"setFill");
objj_msgSend(_ab,"setStroke");
}
}),new objj_method(sel_getUid("setFill"),function(_ad,_ae){
with(_ad){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetFillColor(ctx,_ad);
}
}),new objj_method(sel_getUid("setStroke"),function(_b0,_b1){
with(_b0){
var ctx=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetStrokeColor(ctx,_b0);
}
})]);
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_19,[new objj_method(sel_getUid("randomColor"),function(_b3,_b4){
with(_b3){
return objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",RAND(),RAND(),RAND(),1);
}
})]);
var _b5="CPColorComponentsKey",_b6="CPColorPatternImageKey";
var _18=objj_getClass("CPColor");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("initWithCoder:"),function(_b7,_b8,_b9){
with(_b7){
if(objj_msgSend(_b9,"containsValueForKey:",_b6)){
return objj_msgSend(_b7,"_initWithPatternImage:",objj_msgSend(_b9,"decodeObjectForKey:",_b6));
}
return objj_msgSend(_b7,"_initWithRGBA:",objj_msgSend(_b9,"decodeObjectForKey:",_b5));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ba,_bb,_bc){
with(_ba){
if(_patternImage){
objj_msgSend(_bc,"encodeObject:forKey:",_patternImage,_b6);
}else{
objj_msgSend(_bc,"encodeObject:forKey:",_components,_b5);
}
}
})]);
var _bd="0123456789ABCDEF";
hexToRGB=function(hex){
if(hex.length==3){
hex=hex.charAt(0)+hex.charAt(0)+hex.charAt(1)+hex.charAt(1)+hex.charAt(2)+hex.charAt(2);
}
if(hex.length!=6){
return null;
}
hex=hex.toUpperCase();
for(var i=0;i<hex.length;i++){
if(_bd.indexOf(hex.charAt(i))==-1){
return null;
}
}
var red=(_bd.indexOf(hex.charAt(0))*16+_bd.indexOf(hex.charAt(1)))/255;
var _c1=(_bd.indexOf(hex.charAt(2))*16+_bd.indexOf(hex.charAt(3)))/255;
var _c2=(_bd.indexOf(hex.charAt(4))*16+_bd.indexOf(hex.charAt(5)))/255;
return [red,_c1,_c2,1];
};
integerToBytes=function(_c3,_c4){
if(!_c4){
_c4=(_c3==0)?1:Math.round((Math.log(_c3)/Math.log(2))/8+0.5);
}
var _c5=new Array(_c4);
for(var i=_c4-1;i>=0;i--){
_c5[i]=_c3&255;
_c3=_c3>>8;
}
return _c5;
};
rgbToHex=function(r,g,b){
return byteToHex(r)+byteToHex(g)+byteToHex(b);
};
byteToHex=function(n){
if(!n||isNaN(n)){
return "00";
}
n=ROUND(MIN(255,MAX(0,256*n)));
return _bd.charAt((n-n%16)/16)+_bd.charAt(n%16);
};
p;14;CPColorPanel.ji;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;8;CPView.jc;16229;
CPColorPanelColorDidChangeNotification="CPColorPanelColorDidChangeNotification";
var _1=20,_2=32,_3=14,_4=32,_5=12;
var _6=nil,_7=[];
CPWheelColorPickerMode=1;
CPSliderColorPickerMode=2;
CPColorPickerViewWidth=265,CPColorPickerViewHeight=370;
var _8=objj_allocateClassPair(CPPanel,"CPColorPanel"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_toolbar"),new objj_ivar("_swatchView"),new objj_ivar("_previewView"),new objj_ivar("_opacitySlider"),new objj_ivar("_colorPickers"),new objj_ivar("_currentView"),new objj_ivar("_activePicker"),new objj_ivar("_color"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_mode")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_a,_b){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",CGRectMake(500,50,219,370),(CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
if(_a){
objj_msgSend(objj_msgSend(_a,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.95,1));
objj_msgSend(_a,"setTitle:","Color Panel");
objj_msgSend(_a,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_a,"setFloatingPanel:",YES);
objj_msgSend(_a,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_a,"setMinSize:",CGSizeMake(219,342));
objj_msgSend(_a,"setMaxSize:",CGSizeMake(323,537));
}
return _a;
}
}),new objj_method(sel_getUid("setColor:"),function(_c,_d,_e){
with(_c){
_color=_e;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
objj_msgSend(CPApp,"sendAction:to:from:",sel_getUid("changeColor:"),nil,_c);
if(_target&&_action){
objj_msgSend(CPApp,"sendAction:to:from:",_action,_target,_c);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPColorPanelColorDidChangeNotification,_c);
objj_msgSend(_activePicker,"setColor:",_color);
objj_msgSend(_opacitySlider,"setFloatValue:",objj_msgSend(_color,"alphaComponent"));
}
}),new objj_method(sel_getUid("setColor:updatePicker:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(_f,"setColor:",_11);
if(_12){
objj_msgSend(_activePicker,"setColor:",_color);
}
}
}),new objj_method(sel_getUid("color"),function(_13,_14){
with(_13){
return _color;
}
}),new objj_method(sel_getUid("opacity"),function(_15,_16){
with(_15){
return objj_msgSend(_opacitySlider,"floatValue");
}
}),new objj_method(sel_getUid("setTarget:"),function(_17,_18,_19){
with(_17){
_target=_19;
}
}),new objj_method(sel_getUid("target"),function(_1a,_1b){
with(_1a){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1c,_1d,_1e){
with(_1c){
_action=_1e;
}
}),new objj_method(sel_getUid("action"),function(_1f,_20){
with(_1f){
return _action;
}
}),new objj_method(sel_getUid("setMode:"),function(_21,_22,_23){
with(_21){
_mode=_23;
}
}),new objj_method(sel_getUid("_setPicker:"),function(_24,_25,_26){
with(_24){
var _27=_colorPickers[objj_msgSend(_26,"tag")],_28=objj_msgSend(_27,"provideNewView:",NO);
if(!_28){
_28=objj_msgSend(_27,"provideNewView:",YES);
}
if(_28==_currentView){
return;
}
if(_currentView){
objj_msgSend(_28,"setFrame:",objj_msgSend(_currentView,"frame"));
}else{
var _29=(_2+10+_1+5+_3+32),_2a=objj_msgSend(objj_msgSend(_24,"contentView"),"bounds");
objj_msgSend(_28,"setFrameSize:",CPSizeMake(_2a.size.width-10,_2a.size.height-_29));
objj_msgSend(_28,"setFrameOrigin:",CPPointMake(5,_29));
}
objj_msgSend(_currentView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_24,"contentView"),"addSubview:",_28);
_currentView=_28;
_activePicker=_27;
objj_msgSend(_27,"setColor:",objj_msgSend(_24,"color"));
}
}),new objj_method(sel_getUid("mode"),function(_2b,_2c){
with(_2b){
return _mode;
}
}),new objj_method(sel_getUid("orderFront:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"_loadContentsIfNecessary");
objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPPanel")},"orderFront:",_2f);
}
}),new objj_method(sel_getUid("_loadContentsIfNecessary"),function(_30,_31){
with(_30){
if(_toolbar){
return;
}
if(!_color){
_color=objj_msgSend(CPColor,"whiteColor");
}
_colorPickers=[];
var _32=objj_msgSend(_7,"count");
for(var i=0;i<_32;i++){
var _34=_7[i],_35=objj_msgSend(objj_msgSend(_34,"alloc"),"initWithPickerMask:colorPanel:",0,_30);
_colorPickers.push(_35);
}
var _36=objj_msgSend(_30,"contentView"),_37=objj_msgSend(_36,"bounds");
_toolbar=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,6,CGRectGetWidth(_37),_2));
objj_msgSend(_toolbar,"setAutoresizingMask:",CPViewWidthSizable);
var _38=_32*_4+(_32-1)*_5,_39=(CGRectGetWidth(_37)-_38)/2,_3a=nil;
for(var i=0;i<_32;i++){
var _3b=objj_msgSend(_colorPickers[i],"provideNewButtonImage"),_3c=objj_msgSend(_colorPickers[i],"provideNewAlternateButtonImage"),_3d=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_39+i*(_4+_5),0,_4,_4));
objj_msgSend(_3d,"setTag:",i);
objj_msgSend(_3d,"setTarget:",_30);
objj_msgSend(_3d,"setAction:",sel_getUid("_setPicker:"));
objj_msgSend(_3d,"setBordered:",NO);
objj_msgSend(_3d,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_3d,"setImage:",_3b);
objj_msgSend(_3d,"setAlternateImage:",_3c);
objj_msgSend(_toolbar,"addSubview:",_3d);
if(!_3a){
_3a=_3d;
}
}
var _3e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10,CGRectGetWidth(_37)-86,_1));
_previewView=objj_msgSend(objj_msgSend(_CPColorPanelPreview,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_3e,"bounds"),2,2));
objj_msgSend(_previewView,"setColorPanel:",_30);
objj_msgSend(_previewView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3e,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,1));
objj_msgSend(_3e,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3e,"addSubview:",_previewView);
var _3f=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+10,60,15));
objj_msgSend(_3f,"setStringValue:","Preview:");
objj_msgSend(_3f,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_3f,"setAlignment:",CPRightTextAlignment);
var _40=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10+_1+5,CGRectGetWidth(_37)-86,_3+2));
objj_msgSend(_40,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,1));
objj_msgSend(_40,"setAutoresizingMask:",CPViewWidthSizable);
_swatchView=objj_msgSend(objj_msgSend(_CPColorPanelSwatches,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_40,"bounds"),1,1));
objj_msgSend(_swatchView,"setColorPanel:",_30);
objj_msgSend(_swatchView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_40,"addSubview:",_swatchView);
var _41=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+8+_1+6,60,15));
objj_msgSend(_41,"setStringValue:","Swatches:");
objj_msgSend(_41,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_41,"setAlignment:",CPRightTextAlignment);
var _42=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+_1+35,60,20));
objj_msgSend(_42,"setStringValue:","Opacity:");
objj_msgSend(_42,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_42,"setAlignment:",CPRightTextAlignment);
_opacitySlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CGRectMake(76,_2+_1+34,CGRectGetWidth(_37)-86,20));
objj_msgSend(_opacitySlider,"setMinValue:",0);
objj_msgSend(_opacitySlider,"setMaxValue:",1);
objj_msgSend(_opacitySlider,"setTarget:",_30);
objj_msgSend(_opacitySlider,"setAction:",sel_getUid("setOpacity:"));
objj_msgSend(_36,"addSubview:",_toolbar);
objj_msgSend(_36,"addSubview:",_3e);
objj_msgSend(_36,"addSubview:",_3f);
objj_msgSend(_36,"addSubview:",_40);
objj_msgSend(_36,"addSubview:",_41);
objj_msgSend(_36,"addSubview:",_42);
objj_msgSend(_36,"addSubview:",_opacitySlider);
_target=nil;
_action=nil;
_activePicker=nil;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
if(_3a){
objj_msgSend(_30,"_setPicker:",_3a);
}
}
}),new objj_method(sel_getUid("setOpacity:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(objj_msgSend(_43,"color"),"components"),_47=objj_msgSend(_45,"floatValue");
objj_msgSend(_43,"setColor:updatePicker:",objj_msgSend(_color,"colorWithAlphaComponent:",_47),YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("provideColorPickerClass:"),function(_48,_49,_4a){
with(_48){
_7.push(_4a);
}
}),new objj_method(sel_getUid("sharedColorPanel"),function(_4b,_4c){
with(_4b){
if(!_6){
_6=objj_msgSend(objj_msgSend(CPColorPanel,"alloc"),"init");
}
return _6;
}
}),new objj_method(sel_getUid("setPickerMode:"),function(_4d,_4e,_4f){
with(_4d){
var _50=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_50,"setMode:",_4f);
}
})]);
CPColorDragType="CPColorDragType";
var _51="CPColorPanelSwatchesCookie";
var _8=objj_allocateClassPair(CPView,"_CPColorPanelSwatches"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_swatches"),new objj_ivar("_dragColor"),new objj_ivar("_colorPanel"),new objj_ivar("_swatchCookie")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_52,_53,_54){
with(_52){
_52=objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPView")},"initWithFrame:",_54);
objj_msgSend(_52,"setBackgroundColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_52,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
var _55=objj_msgSend(CPColor,"whiteColor");
_swatchCookie=objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:",_51);
var _56=objj_msgSend(_52,"startingColorList");
_swatches=[];
for(var i=0;i<50;i++){
var _58=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(13*i+1,1,12,12)),_59=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_58,"bounds"),1,1));
objj_msgSend(_58,"setBackgroundColor:",_55);
objj_msgSend(_59,"setBackgroundColor:",(i<_56.length)?_56[i]:_55);
objj_msgSend(_58,"addSubview:",_59);
objj_msgSend(_52,"addSubview:",_58);
_swatches.push(_58);
}
return _52;
}
}),new objj_method(sel_getUid("isOpaque"),function(_5a,_5b){
with(_5a){
return YES;
}
}),new objj_method(sel_getUid("startingColorList"),function(_5c,_5d){
with(_5c){
var _5e=objj_msgSend(_swatchCookie,"value");
if(_5e==""){
return [objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPColor,"darkGrayColor"),objj_msgSend(CPColor,"grayColor"),objj_msgSend(CPColor,"lightGrayColor"),objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"redColor"),objj_msgSend(CPColor,"greenColor"),objj_msgSend(CPColor,"blueColor"),objj_msgSend(CPColor,"yellowColor")];
}
var _5e=eval(_5e);
var _5f=[];
for(var i=0;i<_5e.length;i++){
_5f.push(objj_msgSend(CPColor,"colorWithHexString:",_5e[i]));
}
return _5f;
}
}),new objj_method(sel_getUid("saveColorList"),function(_61,_62){
with(_61){
var _63=[];
for(var i=0;i<_swatches.length;i++){
_63.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i],"subviews")[0],"backgroundColor"),"hexString"));
}
var _65=new Date();
_65.setYear(2019);
objj_msgSend(_swatchCookie,"setValue:expires:domain:",JSON.stringify(_63),_65,nil);
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_66,_67,_68){
with(_66){
_colorPanel=_68;
}
}),new objj_method(sel_getUid("colorPanel"),function(_69,_6a){
with(_69){
return _colorPanel;
}
}),new objj_method(sel_getUid("colorAtIndex:"),function(_6b,_6c,_6d){
with(_6b){
return objj_msgSend(objj_msgSend(_swatches[_6d],"subviews")[0],"backgroundColor");
}
}),new objj_method(sel_getUid("setColor:atIndex:"),function(_6e,_6f,_70,_71){
with(_6e){
objj_msgSend(objj_msgSend(_swatches[_71],"subviews")[0],"setBackgroundColor:",_70);
objj_msgSend(_6e,"saveColorList");
}
}),new objj_method(sel_getUid("mouseUp:"),function(_72,_73,_74){
with(_72){
var _75=objj_msgSend(_72,"convertPoint:fromView:",objj_msgSend(_74,"locationInWindow"),nil);
if(_75.x>objj_msgSend(_72,"bounds").size.width-1||_75.x<1){
return NO;
}
objj_msgSend(_colorPanel,"setColor:updatePicker:",objj_msgSend(_72,"colorAtIndex:",FLOOR(_75.x/13)),YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"convertPoint:fromView:",objj_msgSend(_78,"locationInWindow"),nil);
if(_79.x>objj_msgSend(_76,"bounds").size.width-1||_79.x<1){
return NO;
}
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_76);
var _7a=_swatches[FLOOR(_79.x/13)];
_dragColor=objj_msgSend(objj_msgSend(_7a,"subviews")[0],"backgroundColor");
var _7b=CPRectCreateCopy(objj_msgSend(_7a,"bounds"));
var _7c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_7b);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_7b,1,1));
objj_msgSend(_7c,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",_dragColor);
objj_msgSend(_7c,"addSubview:",dragFillView);
objj_msgSend(_76,"dragView:at:offset:event:pasteboard:source:slideBack:",_7c,CPPointMake(_79.x-_7b.size.width/2,_79.y-_7b.size.height/2),CPPointMake(0,0),_78,nil,_76,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_7d,_7e,_7f,_80){
with(_7d){
if(_80==CPColorDragType){
objj_msgSend(_7f,"setData:forType:",_dragColor,_80);
}
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_81,"convertPoint:fromView:",objj_msgSend(_83,"draggingLocation"),nil),_85=objj_msgSend(_83,"draggingPasteboard"),_86=nil;
if(!objj_msgSend(_85,"availableTypeFromArray:",[CPColorDragType])||_84.x>objj_msgSend(_81,"bounds").size.width-1||_84.x<1){
return NO;
}
objj_msgSend(_81,"setColor:atIndex:",objj_msgSend(_85,"dataForType:",CPColorDragType),FLOOR(_84.x/13));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPColorPanelPreview"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_colorPanel")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_87,_88,_89){
with(_87){
_87=objj_msgSendSuper({receiver:_87,super_class:objj_getClass("CPView")},"initWithFrame:",_89);
objj_msgSend(_87,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
return _87;
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_8a,_8b,_8c){
with(_8a){
_colorPanel=_8c;
}
}),new objj_method(sel_getUid("colorPanel"),function(_8d,_8e){
with(_8d){
return _colorPanel;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_8f,_90,_91){
with(_8f){
var _92=objj_msgSend(_91,"draggingPasteboard");
if(!objj_msgSend(_92,"availableTypeFromArray:",[CPColorDragType])){
return NO;
}
var _93=objj_msgSend(_92,"dataForType:",CPColorDragType);
objj_msgSend(_colorPanel,"setColor:updatePicker:",_93,YES);
}
}),new objj_method(sel_getUid("isOpaque"),function(_94,_95){
with(_94){
return YES;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_96,_97,_98){
with(_96){
var _99=objj_msgSend(_96,"convertPoint:fromView:",objj_msgSend(_98,"locationInWindow"),nil);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_96);
var _9a=CPRectMake(0,0,15,15);
var _9b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_9a);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_9a,1,1));
objj_msgSend(_9b,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",objj_msgSend(_96,"backgroundColor"));
objj_msgSend(_9b,"addSubview:",dragFillView);
objj_msgSend(_96,"dragView:at:offset:event:pasteboard:source:slideBack:",_9b,CPPointMake(_99.x-_9a.size.width/2,_99.y-_9a.size.height/2),CPPointMake(0,0),_98,nil,_96,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_9c,_9d,_9e,_9f){
with(_9c){
if(_9f==CPColorDragType){
objj_msgSend(_9e,"setData:forType:",objj_msgSend(_9c,"backgroundColor"),_9f);
}
}
})]);
i;15;CPColorPicker.ji;21;CPSliderColorPicker.jc;155;
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPColorWheelColorPicker);
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPSliderColorPicker);
p;15;CPColorPicker.jI;21;Foundation/CPObject.ji;14;CPColorPanel.jc;10196;
var _1=objj_allocateClassPair(CPObject,"CPColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_mask")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
_panel=_6;
_mask=_5;
return _3;
}
}),new objj_method(sel_getUid("colorPanel"),function(_7,_8){
with(_7){
return _panel;
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_9,_a){
with(_9){
return nil;
}
}),new objj_method(sel_getUid("setMode:"),function(_b,_c,_d){
with(_b){
return;
}
}),new objj_method(sel_getUid("setColor:"),function(_e,_f,_10){
with(_e){
return;
}
})]);
var _1=objj_allocateClassPair(CPColorPicker,"CPColorWheelColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_pickerView"),new objj_ivar("_brightnessSlider"),new objj_ivar("_hueSaturationView"),new objj_ivar("_cachedColor")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPColorPicker")},"initWithPickerMask:colorPanel:",_13,_14);
}
}),new objj_method(sel_getUid("initView"),function(_15,_16){
with(_15){
aFrame=CPRectMake(0,0,CPColorPickerViewWidth,CPColorPickerViewHeight);
_pickerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",aFrame);
objj_msgSend(_pickerView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CGRectMake(0,(aFrame.size.height-34),aFrame.size.width,15));
objj_msgSend(_brightnessSlider,"setValue:forThemeAttribute:",15,"track-width");
objj_msgSend(_brightnessSlider,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPColorPicker,"class")),"pathForResource:","brightness_bar.png"))),"track-color");
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setFloatValue:",100);
objj_msgSend(_brightnessSlider,"setTarget:",_15);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("brightnessSliderDidChange:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
_hueSaturationView=objj_msgSend(objj_msgSend(__CPColorWheel,"alloc"),"initWithFrame:",CPRectMake(0,0,aFrame.size.width,aFrame.size.height-38));
objj_msgSend(_hueSaturationView,"setDelegate:",_15);
objj_msgSend(_hueSaturationView,"setAutoresizingMask:",(CPViewWidthSizable|CPViewHeightSizable));
objj_msgSend(_pickerView,"addSubview:",_hueSaturationView);
objj_msgSend(_pickerView,"addSubview:",_brightnessSlider);
}
}),new objj_method(sel_getUid("brightnessSliderDidChange:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"updateColor");
}
}),new objj_method(sel_getUid("colorWheelDidChange:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"updateColor");
}
}),new objj_method(sel_getUid("updateColor"),function(_1d,_1e){
with(_1d){
var hue=objj_msgSend(_hueSaturationView,"angle"),_20=objj_msgSend(_hueSaturationView,"distance"),_21=objj_msgSend(_brightnessSlider,"floatValue");
objj_msgSend(_hueSaturationView,"setWheelBrightness:",_21/100);
objj_msgSend(_brightnessSlider,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hue,_20,100));
var _22=objj_msgSend(_1d,"colorPanel"),_23=objj_msgSend(_22,"opacity");
_cachedColor=objj_msgSend(CPColor,"colorWithHue:saturation:brightness:alpha:",hue,_20,_21,_23);
objj_msgSend(objj_msgSend(_1d,"colorPanel"),"setColor:",_cachedColor);
}
}),new objj_method(sel_getUid("supportsMode:"),function(_24,_25,_26){
with(_24){
return (_26==CPWheelColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("currentMode"),function(_27,_28){
with(_27){
return CPWheelColorPickerMode;
}
}),new objj_method(sel_getUid("provideNewView:"),function(_29,_2a,_2b){
with(_29){
if(_2b){
objj_msgSend(_29,"initView");
}
return _pickerView;
}
}),new objj_method(sel_getUid("setColor:"),function(_2c,_2d,_2e){
with(_2c){
if(objj_msgSend(_2e,"isEqual:",_cachedColor)){
return;
}
var hsb=objj_msgSend(_2e,"hsbComponents");
objj_msgSend(_hueSaturationView,"setPositionToColor:",_2e);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
objj_msgSend(_hueSaturationView,"setWheelBrightness:",hsb[2]/100);
objj_msgSend(_brightnessSlider,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hsb[0],hsb[1],100));
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_30,_31){
with(_30){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_32,_33){
with(_32){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button_h.png"),CGSizeMake(32,32));
}
})]);
var _1=objj_allocateClassPair(CPView,"__CPColorWheel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_wheelImage"),new objj_ivar("_blackWheelImage"),new objj_ivar("_crosshair"),new objj_ivar("_delegate"),new objj_ivar("_angle"),new objj_ivar("_distance"),new objj_ivar("_radius")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_34,_35,_36){
with(_34){
_34=objj_msgSendSuper({receiver:_34,super_class:objj_getClass("CPView")},"initWithFrame:",_36);
var _37=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel.png");
_wheelImage=new Image();
_wheelImage.src=_37;
_wheelImage.style.position="absolute";
_37=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_black.png");
_blackWheelImage=new Image();
_blackWheelImage.src=_37;
_blackWheelImage.style.opacity="0";
_blackWheelImage.style.filter="alpha(opacity=0)";
_blackWheelImage.style.position="absolute";
_DOMElement.appendChild(_wheelImage);
_DOMElement.appendChild(_blackWheelImage);
objj_msgSend(_34,"setWheelSize:",_36.size);
_crosshair=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(_radius-2,_radius-2,4,4));
objj_msgSend(_crosshair,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
var _38=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_crosshair,"bounds"),1,1));
objj_msgSend(_38,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_crosshair,"addSubview:",_38);
objj_msgSend(_34,"addSubview:",_crosshair);
return _34;
}
}),new objj_method(sel_getUid("setWheelBrightness:"),function(_39,_3a,_3b){
with(_39){
_blackWheelImage.style.opacity=1-_3b;
_blackWheelImage.style.filter="alpha(opacity="+(1-_3b)*100+")";
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPView")},"setFrameSize:",_3e);
objj_msgSend(_3c,"setWheelSize:",_3e);
}
}),new objj_method(sel_getUid("setWheelSize:"),function(_3f,_40,_41){
with(_3f){
var min=MIN(_41.width,_41.height);
_blackWheelImage.style.width=min;
_blackWheelImage.style.height=min;
_blackWheelImage.width=min;
_blackWheelImage.height=min;
_blackWheelImage.style.top=(_41.height-min)/2+"px";
_blackWheelImage.style.left=(_41.width-min)/2+"px";
_wheelImage.style.width=min;
_wheelImage.style.height=min;
_wheelImage.width=min;
_wheelImage.height=min;
_wheelImage.style.top=(_41.height-min)/2+"px";
_wheelImage.style.left=(_41.width-min)/2+"px";
_radius=min/2;
objj_msgSend(_3f,"setAngle:distance:",objj_msgSend(_3f,"degreesToRadians:",_angle),(_distance/100)*_radius);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_43,_44,_45){
with(_43){
_delegate=_45;
}
}),new objj_method(sel_getUid("delegate"),function(_46,_47){
with(_46){
return _delegate;
}
}),new objj_method(sel_getUid("angle"),function(_48,_49){
with(_48){
return _angle;
}
}),new objj_method(sel_getUid("distance"),function(_4a,_4b){
with(_4a){
return _distance;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"reposition:",_4e);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_4f,"reposition:",_51);
}
}),new objj_method(sel_getUid("reposition:"),function(_52,_53,_54){
with(_52){
var _55=objj_msgSend(_52,"bounds"),_56=objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil);
var _57=CGRectGetMidX(_55);
var _58=CGRectGetMidY(_55);
var _59=MIN(SQRT((_56.x-_57)*(_56.x-_57)+(_56.y-_58)*(_56.y-_58)),_radius);
var _5a=ATAN2(_56.y-_58,_56.x-_57);
objj_msgSend(_52,"setAngle:distance:",_5a,_59);
objj_msgSend(_delegate,"colorWheelDidChange:",_52);
}
}),new objj_method(sel_getUid("setAngle:distance:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var _5f=objj_msgSend(_5b,"bounds");
var _60=CGRectGetMidX(_5f);
var _61=CGRectGetMidY(_5f);
_angle=objj_msgSend(_5b,"radiansToDegrees:",_5d);
_distance=(_5e/_radius)*100;
objj_msgSend(_crosshair,"setFrameOrigin:",CPPointMake(COS(_5d)*_5e+_60-2,SIN(_5d)*_5e+_61-2));
}
}),new objj_method(sel_getUid("setPositionToColor:"),function(_62,_63,_64){
with(_62){
var hsb=objj_msgSend(_64,"hsbComponents"),_66=objj_msgSend(_62,"bounds");
var _67=objj_msgSend(_62,"degreesToRadians:",hsb[0]),_68=(hsb[1]/100)*_radius;
objj_msgSend(_62,"setAngle:distance:",_67,_68);
}
}),new objj_method(sel_getUid("radiansToDegrees:"),function(_69,_6a,_6b){
with(_69){
return ((-_6b/PI)*180+360)%360;
}
}),new objj_method(sel_getUid("degreesToRadians:"),function(_6c,_6d,_6e){
with(_6c){
return -(((_6e-360)/180)*PI);
}
})]);
p;13;CPColorWell.jI;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jc;5916;
var _1="_CPColorWellDidBecomeExclusiveNotification";
var _2=objj_allocateClassPair(CPControl,"CPColorWell"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_active"),new objj_ivar("_bordered"),new objj_ivar("_color"),new objj_ivar("_wellView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPControl")},"initWithFrame:",_6);
if(_4){
_active=NO;
_bordered=YES;
_color=objj_msgSend(CPColor,"whiteColor");
objj_msgSend(_4,"drawBezelWithHighlight:",NO);
objj_msgSend(_4,"drawWellInside:",CGRectInset(objj_msgSend(_4,"bounds"),3,3));
objj_msgSend(_4,"_registerForNotifications");
}
return _4;
}
}),new objj_method(sel_getUid("_registerForNotifications"),function(_7,_8){
with(_7){
var _9=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_9,"addObserver:selector:name:object:",_7,sel_getUid("colorWellDidBecomeExclusive:"),_1,nil);
objj_msgSend(_9,"addObserver:selector:name:object:",_7,sel_getUid("colorPanelWillClose:"),CPWindowWillCloseNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isBordered"),function(_a,_b){
with(_a){
return _bordered;
}
}),new objj_method(sel_getUid("setBordered:"),function(_c,_d,_e){
with(_c){
if(_bordered==_e){
return;
}
_bordered=_e;
objj_msgSend(_c,"drawWellInside:",CGRectInset(objj_msgSend(_c,"bounds"),3,3));
}
}),new objj_method(sel_getUid("color"),function(_f,_10){
with(_f){
return _color;
}
}),new objj_method(sel_getUid("setColor:"),function(_11,_12,_13){
with(_11){
if(_color==_13){
return;
}
_color=_13;
objj_msgSend(_11,"drawWellInside:",CGRectInset(objj_msgSend(_11,"bounds"),3,3));
}
}),new objj_method(sel_getUid("takeColorFrom:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"setColor:",objj_msgSend(_16,"color"));
}
}),new objj_method(sel_getUid("activate:"),function(_17,_18,_19){
with(_17){
if(_19){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_17);
}
if(objj_msgSend(_17,"isActive")){
return;
}
_active=YES;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_17,sel_getUid("colorPanelDidChangeColor:"),CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("deactivate"),function(_1a,_1b){
with(_1a){
if(!objj_msgSend(_1a,"isActive")){
return;
}
_active=NO;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1a,CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isActive"),function(_1c,_1d){
with(_1c){
return _active;
}
}),new objj_method(sel_getUid("drawBezelWithHighlight:"),function(_1e,_1f,_20){
with(_1e){
}
}),new objj_method(sel_getUid("drawWellInside:"),function(_21,_22,_23){
with(_21){
if(!_wellView){
_wellView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_23);
objj_msgSend(_wellView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_21,"addSubview:",_wellView);
}else{
objj_msgSend(_wellView,"setFrame:",_23);
}
objj_msgSend(_wellView,"setBackgroundColor:",_color);
}
}),new objj_method(sel_getUid("colorPanelDidChangeColor:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"takeColorFrom:",objj_msgSend(_26,"object"));
objj_msgSend(_24,"sendAction:to:",objj_msgSend(_24,"action"),objj_msgSend(_24,"target"));
}
}),new objj_method(sel_getUid("colorWellDidBecomeExclusive:"),function(_27,_28,_29){
with(_27){
if(_27!=objj_msgSend(_29,"object")){
objj_msgSend(_27,"deactivate");
}
}
}),new objj_method(sel_getUid("colorPanelWillClose:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"deactivate");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"drawBezelWithHighlight:",YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"drawBezelWithHighlight:",CGRectContainsPoint(objj_msgSend(_30,"bounds"),objj_msgSend(_30,"convertPoint:fromView:",objj_msgSend(_32,"locationInWindow"),nil)));
}
}),new objj_method(sel_getUid("mouseUp:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"drawBezelWithHighlight:",NO);
if(!CGRectContainsPoint(objj_msgSend(_33,"bounds"),objj_msgSend(_33,"convertPoint:fromView:",objj_msgSend(_35,"locationInWindow"),nil))){
return;
}
objj_msgSend(_33,"activate:",YES);
var _36=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_36,"setColor:",_color);
objj_msgSend(_36,"orderFront:",_33);
}
})]);
var _37="CPColorWellColorKey",_38="CPColorWellBorderedKey";
var _2=objj_getClass("CPColorWell");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColorWell\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPControl")},"initWithCoder:",_3b);
if(_39){
_active=NO;
_bordered=objj_msgSend(_3b,"decodeObjectForKey:",_38);
_color=objj_msgSend(_3b,"decodeObjectForKey:",_37);
objj_msgSend(_39,"drawBezelWithHighlight:",NO);
objj_msgSend(_39,"drawWellInside:",CGRectInset(objj_msgSend(_39,"bounds"),3,3));
objj_msgSend(_39,"_registerForNotifications");
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_wellView);
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_3e);
_subviews=_3f;
objj_msgSend(_3e,"encodeObject:forKey:",_color,_37);
objj_msgSend(_3e,"encodeObject:forKey:",_bordered,_38);
}
})]);
p;17;CPCompatibility.ji;9;CPEvent.jc;3168;
CPUnknownBrowserEngine=0;
CPGeckoBrowserEngine=1;
CPInternetExplorerBrowserEngine=2;
CPKHTMLBrowserEngine=3;
CPOperaBrowserEngine=4;
CPWebKitBrowserEngine=5;
CPCSSRGBAFeature=1<<5;
CPHTMLCanvasFeature=1<<6;
CPHTMLContentEditableFeature=1<<7;
CPHTMLDragAndDropFeature=1<<8;
CPJavascriptInnerTextFeature=1<<9;
CPJavascriptTextContentFeature=1<<10;
CPJavascriptClipboardEventsFeature=1<<11;
CPJavascriptClipboardAccessFeature=1<<12;
CPJavaScriptCanvasDrawFeature=1<<13;
CPJavaScriptCanvasTransformFeature=1<<14;
CPVMLFeature=1<<15;
CPJavascriptRemedialKeySupport=1<<16;
CPJavaScriptShadowFeature=1<<20;
CPJavaScriptNegativeMouseWheelValues=1<<22;
CPJavaScriptMouseWheelValues_8_15=1<<23;
CPOpacityRequiresFilterFeature=1<<24;
CPInputTypeCanBeChangedFeature=1<<25;
var _1="",_2=CPUnknownBrowserEngine,_3=0;
_3|=CPInputTypeCanBeChangedFeature;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
_1=window.navigator.userAgent;
}
if(window.opera){
_2=CPOperaBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
}else{
if(window.attachEvent){
_2=CPInternetExplorerBrowserEngine;
_3|=CPVMLFeature;
_3|=CPJavascriptRemedialKeySupport;
_3|=CPJavaScriptShadowFeature;
_3|=CPOpacityRequiresFilterFeature;
_3&=~CPInputTypeCanBeChangedFeature;
}else{
if(_1.indexOf("AppleWebKit/")!=-1){
_2=CPWebKitBrowserEngine;
_3|=CPCSSRGBAFeature;
_3|=CPHTMLContentEditableFeature;
_3|=CPHTMLDragAndDropFeature;
_3|=CPJavascriptClipboardEventsFeature;
_3|=CPJavascriptClipboardAccessFeature;
_3|=CPJavaScriptShadowFeature;
var _4=_1.indexOf("AppleWebKit/")+"AppleWebKit/".length,_5=_1.indexOf(" ",_4),_6=_1.substring(_4,_5),_7=_6.indexOf("."),_8=parseInt(_6.substring(0,_7)),_9=parseInt(_6.substr(_7+1));
if((_1.indexOf("Safari")!==CPNotFound&&(_8>525||(_8===525&&_9>14)))||_1.indexOf("Chrome")!==CPNotFound){
_3|=CPJavascriptRemedialKeySupport;
}
}else{
if(_1.indexOf("KHTML")!=-1){
_2=CPKHTMLBrowserEngine;
}else{
if(_1.indexOf("Gecko")!==-1){
_2=CPGeckoBrowserEngine;
_3|=CPJavaScriptCanvasDrawFeature;
var _a=_1.indexOf("Firefox"),_b=(_a===-1)?2:parseFloat(_1.substring(_a+"Firefox".length+1));
if(_b>=3){
_3|=CPCSSRGBAFeature;
}
if(_b<3){
_3|=CPJavaScriptMouseWheelValues_8_15;
}
}
}
}
}
}
if(typeof document!="undefined"){
var _c=document.createElement("canvas");
if(_c&&_c.getContext){
_3|=CPHTMLCanvasFeature;
var _d=document.createElement("canvas").getContext("2d");
if(_d&&_d.setTransform&&_d.transform){
_3|=CPJavaScriptCanvasTransformFeature;
}
}
var _e=document.createElement("div");
if(_e.innerText!=undefined){
_3|=CPJavascriptInnerTextFeature;
}else{
if(_e.textContent!=undefined){
_3|=CPJavascriptTextContentFeature;
}
}
}
CPFeatureIsCompatible=function(_f){
return _3&_f;
};
CPBrowserIsEngine=function(_10){
return _2==_10;
};
if(_1.indexOf("Mac")!=-1){
CPPlatformActionKeyMask=CPCommandKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Z";
CPUndoKeyEquivalentModifierMask=CPCommandKeyMask;
CPRedoKeyEquivalentModifierMask=CPCommandKeyMask|CPShiftKeyMask;
}else{
CPPlatformActionKeyMask=CPControlKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Y";
CPUndoKeyEquivalentModifierMask=CPControlKeyMask;
CPRedoKeyEquivalentModifierMask=CPControlKeyMask;
}
p;11;CPControl.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;16240;
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
}),new objj_method(sel_getUid("setState:"),function(_25,_26,_27){
with(_25){
}
}),new objj_method(sel_getUid("nextState"),function(_28,_29){
with(_28){
return 0;
}
}),new objj_method(sel_getUid("performClick:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"highlight:",YES);
objj_msgSend(_2a,"setState:",objj_msgSend(_2a,"nextState"));
objj_msgSend(_2a,"sendAction:to:",objj_msgSend(_2a,"action"),objj_msgSend(_2a,"target"));
objj_msgSend(_2a,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_2d,_2e){
with(_2d){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_32,_33,_34,_35){
with(_32){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_36,_37,_38,_39,_3a){
with(_36){
objj_msgSend(_36,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3b,_3c,_3d){
with(_3b){
if(!objj_msgSend(_3b,"isEnabled")){
return;
}
objj_msgSend(_3b,"trackMouse:",_3d);
}
}),new objj_method(sel_getUid("objectValue"),function(_3e,_3f){
with(_3e){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
_value=_42;
objj_msgSend(_40,"setNeedsLayout");
objj_msgSend(_40,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_43,_44){
with(_43){
var _45=parseFloat(_value,10);
return isNaN(_45)?0:_45;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_46,_47,_48){
with(_46){
objj_msgSend(_46,"setObjectValue:",_48);
}
}),new objj_method(sel_getUid("doubleValue"),function(_49,_4a){
with(_49){
var _4b=parseFloat(_value,10);
return isNaN(_4b)?0:_4b;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"setObjectValue:",_4e);
}
}),new objj_method(sel_getUid("intValue"),function(_4f,_50){
with(_4f){
var _51=parseInt(_value,10);
return isNaN(_51)?0:_51;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_52,"setObjectValue:",_54);
}
}),new objj_method(sel_getUid("integerValue"),function(_55,_56){
with(_55){
var _57=parseInt(_value,10);
return isNaN(_57)?0:_57;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_58,"setObjectValue:",_5a);
}
}),new objj_method(sel_getUid("stringValue"),function(_5b,_5c){
with(_5b){
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"setObjectValue:",_5f);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_60,_61,_62){
with(_60){
if(objj_msgSend(_62,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_60,"setDoubleValue:",objj_msgSend(_62,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_65,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_63,"setFloatValue:",objj_msgSend(_65,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_66,_67,_68){
with(_66){
if(objj_msgSend(_68,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_66,"setIntegerValue:",objj_msgSend(_68,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_69,_6a,_6b){
with(_69){
if(objj_msgSend(_6b,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_69,"setIntValue:",objj_msgSend(_6b,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_6c,_6d,_6e){
with(_6c){
if(objj_msgSend(_6e,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_6c,"setObjectValue:",objj_msgSend(_6e,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_6f,_70,_71){
with(_6f){
if(objj_msgSend(_71,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_6f,"setStringValue:",objj_msgSend(_71,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_72,_73,_74){
with(_72){
if(objj_msgSend(_74,"object")!=_72){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_72,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_74,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_75,_76,_77){
with(_75){
if(objj_msgSend(_77,"object")!=_75){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_75,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_77,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_78,_79,_7a){
with(_78){
if(objj_msgSend(_7a,"object")!=_78){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_78,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_7a,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7b,"setValue:forThemeAttribute:",_7d,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_7e,_7f){
with(_7e){
return objj_msgSend(_7e,"valueForThemeAttribute:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_80,"setValue:forThemeAttribute:",_82,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"valueForThemeAttribute:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setValue:forThemeAttribute:",_87,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_88,_89){
with(_88){
return objj_msgSend(_88,"valueForThemeAttribute:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"setValue:forThemeAttribute:",_8c,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_8d,_8e){
with(_8d){
return objj_msgSend(_8d,"valueForThemeAttribute:","text-color");
}
}),new objj_method(sel_getUid("setFont:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"setValue:forThemeAttribute:",_91,"font");
}
}),new objj_method(sel_getUid("font"),function(_92,_93){
with(_92){
return objj_msgSend(_92,"valueForThemeAttribute:","font");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"setValue:forThemeAttribute:",_96,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_97,_98){
with(_97){
return objj_msgSend(_97,"valueForThemeAttribute:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"setValue:forThemeAttribute:",_9b,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_9c,_9d){
with(_9c){
return objj_msgSend(_9c,"valueForThemeAttribute:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"setValue:forThemeAttribute:",_a0,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_a1,"valueForThemeAttribute:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_a3,_a4,_a5){
with(_a3){
objj_msgSend(_a3,"setValue:forThemeAttribute:",_a5,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_a6,_a7){
with(_a6){
return objj_msgSend(_a6,"valueForThemeAttribute:","image-scaling");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a8,_a9,_aa){
with(_a8){
if(_aa){
objj_msgSend(_a8,"unsetThemeState:",CPThemeStateDisabled);
}else{
objj_msgSend(_a8,"setThemeState:",CPThemeStateDisabled);
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_ab,_ac){
with(_ab){
return !objj_msgSend(_ab,"hasThemeState:",CPThemeStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_ad,_ae,_af){
with(_ad){
objj_msgSend(_ad,"setHighlighted:",_af);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_b0,_b1,_b2){
with(_b0){
if(_b2){
objj_msgSend(_b0,"setThemeState:",CPThemeStateHighlighted);
}else{
objj_msgSend(_b0,"unsetThemeState:",CPThemeStateHighlighted);
}
}
}),new objj_method(sel_getUid("isHighlighted"),function(_b3,_b4){
with(_b3){
return objj_msgSend(_b3,"hasThemeState:",CPThemeStateHighlighted);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_b5,_b6){
with(_b5){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12),nil,{width:0,height:0},CPImageLeft,CPScaleToFit,{width:0,height:0},{width:-1,height:-1}],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling","min-size","max-size"]);
}
})]);
var _b7="CPControlValueKey",_b8="CPControlControlStateKey",_b9="CPControlIsEnabledKey",_ba="CPControlTargetKey",_bb="CPControlActionKey",_bc="CPControlSendActionOnKey";
var _bd="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_be,_bf,_c0){
with(_be){
_be=objj_msgSendSuper({receiver:_be,super_class:objj_getClass("CPView")},"initWithCoder:",_c0);
if(_be){
objj_msgSend(_be,"setObjectValue:",objj_msgSend(_c0,"decodeObjectForKey:",_b7));
objj_msgSend(_be,"setTarget:",objj_msgSend(_c0,"decodeObjectForKey:",_ba));
objj_msgSend(_be,"setAction:",objj_msgSend(_c0,"decodeObjectForKey:",_bb));
objj_msgSend(_be,"sendActionOn:",objj_msgSend(_c0,"decodeIntForKey:",_bc));
}
return _be;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c1,_c2,_c3){
with(_c1){
objj_msgSendSuper({receiver:_c1,super_class:objj_getClass("CPView")},"encodeWithCoder:",_c3);
if(_value!==nil){
objj_msgSend(_c3,"encodeObject:forKey:",_value,_b7);
}
if(_target!==nil){
objj_msgSend(_c3,"encodeConditionalObject:forKey:",_target,_ba);
}
if(_action!==NULL){
objj_msgSend(_c3,"encodeObject:forKey:",_action,_bb);
}
objj_msgSend(_c3,"encodeInt:forKey:",_sendActionOn,_bc);
}
})]);
var _c4=[],_c5={},_c6={};
_c4[CPRegularControlSize]="Regular";
_c4[CPSmallControlSize]="Small";
_c4[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_c7){
return _c4[_c7];
};
_CPControlColorWithPatternImage=function(_c8,_c9){
var _ca=1,_cb=arguments.length,_cc="";
for(;_ca<_cb;++_ca){
_cc+=arguments[_ca];
}
var _cd=_c5[_cc];
if(!_cd){
var _ce=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_cd=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ce,"pathForResource:",_c9+"/"+_cc+".png"),_c8[_cc]));
_c5[_cc]=_cd;
}
return _cd;
};
_CPControlThreePartImagePattern=function(_cf,_d0,_d1){
var _d2=2,_d3=arguments.length,_d4="";
for(;_d2<_d3;++_d2){
_d4+=arguments[_d2];
}
var _d5=_c6[_d4];
if(!_d5){
var _d6=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_d7=_d1+"/"+_d4;
_d0=_d0[_d4];
_d5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d6,"pathForResource:",_d7+"0.png"),_d0[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d6,"pathForResource:",_d7+"1.png"),_d0[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d6,"pathForResource:",_d7+"2.png"),_d0[2])],_cf));
_c6[_d4]=_d5;
}
return _d5;
};
p;10;CPCookie.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1385;
var _1=objj_allocateClassPair(CPObject,"CPCookie"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_cookieName"),new objj_ivar("_cookieValue"),new objj_ivar("_expires")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
_cookieName=_5;
_cookieValue=objj_msgSend(_3,"_readCookieValue");
return _3;
}
}),new objj_method(sel_getUid("value"),function(_6,_7){
with(_6){
return _cookieValue;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _cookieName;
}
}),new objj_method(sel_getUid("expires"),function(_a,_b){
with(_a){
return _expires;
}
}),new objj_method(sel_getUid("setValue:expires:domain:"),function(_c,_d,_e,_f,_10){
with(_c){
if(_f){
var _11="; expires="+_f.toGMTString();
}else{
var _11="";
}
if(_10){
_10="; domain="+_10;
}else{
_10="";
}
document.cookie=_cookieName+"="+_e+_11+"; path=/"+_10;
}
}),new objj_method(sel_getUid("_readCookieValue"),function(_12,_13){
with(_12){
var _14=_cookieName+"=";
var ca=document.cookie.split(";");
for(var i=0;i<ca.length;i++){
var c=ca[i];
while(c.charAt(0)==" "){
c=c.substring(1,c.length);
}
if(c.indexOf(_14)==0){
return c.substring(_14.length,c.length);
}
}
return "";
}
})]);
p;12;CPDocument.jI;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;13;CPSavePanel.ji;18;CPViewController.ji;20;CPWindowController.jc;17977;
CPSaveOperation=0;
CPSaveAsOperation=1;
CPSaveToOperation=2;
CPAutosaveOperation=3;
CPChangeDone=0;
CPChangeUndone=1;
CPChangeCleared=2;
CPChangeReadOtherContents=3;
CPChangeAutosaved=4;
CPDocumentWillSaveNotification="CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification="CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification="CPDocumentDidFailToSaveNotification";
var _1=0;
var _2=objj_allocateClassPair(CPResponder,"CPDocument"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_window"),new objj_ivar("_view"),new objj_ivar("_viewControllersForWindowControllers"),new objj_ivar("_fileURL"),new objj_ivar("_fileType"),new objj_ivar("_windowControllers"),new objj_ivar("_untitledDocumentIndex"),new objj_ivar("_hasUndoManager"),new objj_ivar("_undoManager"),new objj_ivar("_changeCount"),new objj_ivar("_readConnection"),new objj_ivar("_writeRequest"),new objj_ivar("_canCloseAlert")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPResponder")},"init");
if(_4){
_windowControllers=[];
_viewControllersForWindowControllers=objj_msgSend(CPDictionary,"dictionary");
_hasUndoManager=YES;
_changeCount=0;
objj_msgSend(_4,"setNextResponder:",CPApp);
}
return _4;
}
}),new objj_method(sel_getUid("initWithType:error:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSend(_6,"init");
if(_6){
objj_msgSend(_6,"setFileType:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSend(_a,"init");
if(_a){
objj_msgSend(_a,"setFileURL:",_c);
objj_msgSend(_a,"setFileType:",_d);
objj_msgSend(_a,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_c,_d,_e,_f,_10);
}
return _a;
}
}),new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_11,_12,_13,_14,_15,_16,_17,_18){
with(_11){
_11=objj_msgSend(_11,"init");
if(_11){
objj_msgSend(_11,"setFileURL:",_13);
objj_msgSend(_11,"setFileType:",_15);
objj_msgSend(_11,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_14,_15,_16,_17,_18);
}
return _11;
}
}),new objj_method(sel_getUid("dataOfType:error:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataOfType:error: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("readFromData:ofType:error:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"readFromData:ofType: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("viewControllerWillLoadCib:"),function(_22,_23,_24){
with(_22){
}
}),new objj_method(sel_getUid("viewControllerDidLoadCib:"),function(_25,_26,_27){
with(_25){
}
}),new objj_method(sel_getUid("firstEligibleExistingWindowController"),function(_28,_29){
with(_28){
return nil;
}
}),new objj_method(sel_getUid("makeWindowControllers"),function(_2a,_2b){
with(_2a){
objj_msgSend(_2a,"makeViewAndWindowControllers");
}
}),new objj_method(sel_getUid("makeViewAndWindowControllers"),function(_2c,_2d){
with(_2c){
var _2e=objj_msgSend(_2c,"viewCibName"),_2f=nil,_30=nil;
if(objj_msgSend(_2e,"length")){
_2f=objj_msgSend(objj_msgSend(CPViewController,"alloc"),"initWithCibName:bundle:owner:",_2e,nil,_2c);
}
if(_2f){
_30=objj_msgSend(_2c,"firstEligibleExistingWindowController");
}
if(!_30){
var _31=objj_msgSend(_2c,"windowCibName");
if(objj_msgSend(_31,"length")){
_30=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindowCibName:owner:",_31,_2c);
}else{
if(_2f){
var _32=objj_msgSend(_2f,"view"),_33=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(_32,"frame"),CPTitledWindowMask|CPClosableWindowMask|CPMiniaturizableWindowMask|CPResizableWindowMask);
objj_msgSend(_33,"setSupportsMultipleDocuments:",YES);
_30=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindow:",_33);
}
}
}
if(_30){
objj_msgSend(_2c,"addWindowController:",_30);
}
if(_2f){
objj_msgSend(_2c,"addViewController:forWindowController:",_2f,_30);
}
}
}),new objj_method(sel_getUid("windowControllers"),function(_34,_35){
with(_34){
return _windowControllers;
}
}),new objj_method(sel_getUid("addWindowController:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_windowControllers,"addObject:",_38);
if(objj_msgSend(_38,"document")!==_36){
objj_msgSend(_38,"setDocument:",_36);
}
}
}),new objj_method(sel_getUid("view"),function(_39,_3a){
with(_39){
return _view;
}
}),new objj_method(sel_getUid("viewControllers"),function(_3b,_3c){
with(_3b){
return objj_msgSend(_viewControllersForWindowControllers,"allValues");
}
}),new objj_method(sel_getUid("addViewController:forWindowController:"),function(_3d,_3e,_3f,_40){
with(_3d){
objj_msgSend(_viewControllersForWindowControllers,"setObject:forKey:",_3f,objj_msgSend(_40,"UID"));
if(objj_msgSend(_40,"document")===_3d){
objj_msgSend(_40,"setViewController:",_3f);
}
}
}),new objj_method(sel_getUid("removeViewController:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_viewControllersForWindowControllers,"removeObject:",_43);
}
}),new objj_method(sel_getUid("viewControllerForWindowController:"),function(_44,_45,_46){
with(_44){
return objj_msgSend(_viewControllersForWindowControllers,"objectForKey:",objj_msgSend(_46,"UID"));
}
}),new objj_method(sel_getUid("showWindows"),function(_47,_48){
with(_47){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocument:"),_47);
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("showWindow:"),_47);
}
}),new objj_method(sel_getUid("displayName"),function(_49,_4a){
with(_49){
if(_fileURL){
return objj_msgSend(_fileURL,"lastPathComponent");
}
if(!_untitledDocumentIndex){
_untitledDocumentIndex=++_1;
}
if(_untitledDocumentIndex==1){
return "Untitled";
}
return "Untitled "+_untitledDocumentIndex;
}
}),new objj_method(sel_getUid("viewCibName"),function(_4b,_4c){
with(_4b){
return nil;
}
}),new objj_method(sel_getUid("windowCibName"),function(_4d,_4e){
with(_4d){
return nil;
}
}),new objj_method(sel_getUid("windowControllerDidLoadCib:"),function(_4f,_50,_51){
with(_4f){
}
}),new objj_method(sel_getUid("windowControllerWillLoadCib:"),function(_52,_53,_54){
with(_52){
}
}),new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"),function(_55,_56,_57,_58,_59,_5a,_5b){
with(_55){
objj_msgSend(_readConnection,"cancel");
_readConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_57),_55);
_readConnection.session=_5c(_58,_59,_5a,_5b);
}
}),new objj_method(sel_getUid("fileURL"),function(_5d,_5e){
with(_5d){
return _fileURL;
}
}),new objj_method(sel_getUid("setFileURL:"),function(_5f,_60,_61){
with(_5f){
if(_fileURL===_61){
return;
}
_fileURL=_61;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:",sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}),new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"),function(_62,_63,_64,_65,_66,_67,_68,_69){
with(_62){
var _6a=objj_msgSend(_62,"dataOfType:error:",objj_msgSend(_62,"fileType"),nil),_6b=_changeCount;
_writeRequest=objj_msgSend(CPURLRequest,"requestWithURL:",_64);
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_writeRequest,"setHTTPMethod:","POST");
}else{
objj_msgSend(_writeRequest,"setHTTPMethod:","PUT");
}
objj_msgSend(_writeRequest,"setHTTPBody:",objj_msgSend(_6a,"string"));
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","close","Connection");
if(_66==CPSaveOperation){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
}
if(_66!=CPSaveToOperation){
objj_msgSend(_62,"updateChangeCount:",CPChangeCleared);
}
var _6c=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_writeRequest,_62);
_6c.session=_6d(_64,_66,_6b,_67,_68,_69,_6c);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_6e,_6f,_70,_71){
with(_6e){
if(!objj_msgSend(_71,"isKindOfClass:",objj_msgSend(CPHTTPURLResponse,"class"))){
return;
}
var _72=objj_msgSend(_71,"statusCode");
if(_72===200){
return;
}
var _73=_70.session;
if(_70==_readConnection){
objj_msgSend(_70,"cancel");
alert("There was an error retrieving the document.");
objj_msgSend(_73.delegate,_73.didReadSelector,_6e,NO,_73.contextInfo);
}else{
if(_72==409){
objj_msgSend(_70,"cancel");
if(confirm("There already exists a file with that name, would you like to overwrite it?")){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
objj_msgSend(_70,"start");
}else{
if(_73.saveOperation!=CPSaveToOperation){
_changeCount+=_73.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_6e,"isDocumentEdited"));
}
_writeRequest=nil;
objj_msgSend(_73.delegate,_73.didSaveSelector,_6e,NO,_73.contextInfo);
objj_msgSend(_6e,"_sendDocumentSavedNotification:",NO);
}
}
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_74,_75,_76,_77){
with(_74){
var _78=_76.session;
if(_76==_readConnection){
objj_msgSend(_74,"readFromData:ofType:error:",objj_msgSend(CPData,"dataWithString:",_77),_78.fileType,nil);
objj_msgSend(_78.delegate,_78.didReadSelector,_74,YES,_78.contextInfo);
}else{
if(_78.saveOperation!=CPSaveToOperation){
objj_msgSend(_74,"setFileURL:",_78.absoluteURL);
}
_writeRequest=nil;
objj_msgSend(_78.delegate,_78.didSaveSelector,_74,YES,_78.contextInfo);
objj_msgSend(_74,"_sendDocumentSavedNotification:",YES);
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_79,_7a,_7b,_7c){
with(_79){
var _7d=_7b.session;
if(_readConnection==_7b){
objj_msgSend(_7d.delegate,_7d.didReadSelector,_79,NO,_7d.contextInfo);
}else{
if(_7d.saveOperation!=CPSaveToOperation){
_changeCount+=_7d.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_79,"isDocumentEdited"));
}
_writeRequest=nil;
alert("There was an error saving the document.");
objj_msgSend(_7d.delegate,_7d.didSaveSelector,_79,NO,_7d.contextInfo);
objj_msgSend(_79,"_sendDocumentSavedNotification:",NO);
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_7e,_7f,_80){
with(_7e){
if(_readConnection==_80){
_readConnection=nil;
}
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_81,_82){
with(_81){
return _changeCount!=0;
}
}),new objj_method(sel_getUid("updateChangeCount:"),function(_83,_84,_85){
with(_83){
if(_85==CPChangeDone){
++_changeCount;
}else{
if(_85==CPChangeUndone){
--_changeCount;
}else{
if(_85==CPChangeCleared){
_changeCount=0;
}
}
}
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_83,"isDocumentEdited"));
}
}),new objj_method(sel_getUid("setFileType:"),function(_86,_87,_88){
with(_86){
_fileType=_88;
}
}),new objj_method(sel_getUid("fileType"),function(_89,_8a){
with(_89){
return _fileType;
}
}),new objj_method(sel_getUid("hasUndoManager"),function(_8b,_8c){
with(_8b){
return _hasUndoManager;
}
}),new objj_method(sel_getUid("setHasUndoManager:"),function(_8d,_8e,_8f){
with(_8d){
if(_hasUndoManager==_8f){
return;
}
_hasUndoManager=_8f;
if(!_hasUndoManager){
objj_msgSend(_8d,"setUndoManager:",nil);
}
}
}),new objj_method(sel_getUid("_undoManagerWillCloseGroup:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(_92,"object");
if(objj_msgSend(_93,"isUndoing")||objj_msgSend(_93,"isRedoing")){
return;
}
objj_msgSend(_90,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("_undoManagerDidUndoChange:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"updateChangeCount:",CPChangeUndone);
}
}),new objj_method(sel_getUid("_undoManagerDidRedoChange:"),function(_97,_98,_99){
with(_97){
objj_msgSend(_97,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_9a,_9b,_9c){
with(_9a){
var _9d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_undoManager){
objj_msgSend(_9d,"removeObserver:name:object:",_9a,CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_9d,"removeObserver:name:object:",_9a,CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_9d,"removeObserver:name:object:",_9a,CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
_undoManager=_9c;
if(_undoManager){
objj_msgSend(_9d,"addObserver:selector:name:object:",_9a,sel_getUid("_undoManagerDidUndoChange:"),CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_9d,"addObserver:selector:name:object:",_9a,sel_getUid("_undoManagerDidRedoChange:"),CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_9d,"addObserver:selector:name:object:",_9a,sel_getUid("_undoManagerWillCloseGroup:"),CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
}
}),new objj_method(sel_getUid("undoManager"),function(_9e,_9f){
with(_9e){
if(_hasUndoManager&&!_undoManager){
objj_msgSend(_9e,"setUndoManager:",objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init"));
}
return _undoManager;
}
}),new objj_method(sel_getUid("windowWillReturnUndoManager:"),function(_a0,_a1,_a2){
with(_a0){
return objj_msgSend(_a0,"undoManager");
}
}),new objj_method(sel_getUid("saveDocument:"),function(_a3,_a4,_a5){
with(_a3){
objj_msgSend(_a3,"saveDocumentWithDelegate:didSaveSelector:contextInfo:",nil,nil,nil);
}
}),new objj_method(sel_getUid("saveDocumentWithDelegate:didSaveSelector:contextInfo:"),function(_a6,_a7,_a8,_a9,_aa){
with(_a6){
if(_fileURL){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_a6);
objj_msgSend(_a6,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_fileURL,objj_msgSend(_a6,"fileType"),CPSaveOperation,_a8,_a9,_aa);
}else{
objj_msgSend(_a6,"_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:",_a8,_a9,_aa);
}
}
}),new objj_method(sel_getUid("saveDocumentAs:"),function(_ab,_ac,_ad){
with(_ab){
objj_msgSend(_ab,"_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:",nil,nil,nil);
}
}),new objj_method(sel_getUid("_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:"),function(_ae,_af,_b0,_b1,_b2){
with(_ae){
var _b3=objj_msgSend(CPSavePanel,"savePanel"),_b4=objj_msgSend(_b3,"runModal");
if(!_b4){
return;
}
var _b5=objj_msgSend(_b3,"URL");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_ae);
objj_msgSend(_ae,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_b5,objj_msgSend(_ae,"fileType"),CPSaveAsOperation,_b0,_b1,_b2);
}
}),new objj_method(sel_getUid("_sendDocumentSavedNotification:"),function(_b6,_b7,_b8){
with(_b6){
if(_b8){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidSaveNotification,_b6);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidFailToSaveNotification,_b6);
}
}
})]);
var _2=objj_getClass("CPDocument");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDocument\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("close"),function(_b9,_ba){
with(_b9){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:",sel_getUid("close"));
objj_msgSend(objj_msgSend(CPDocumentController,"sharedDocumentController"),"removeDocument:",_b9);
}
}),new objj_method(sel_getUid("shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:"),function(_bb,_bc,_bd,_be,_bf,_c0){
with(_bb){
if(objj_msgSend(_bd,"shouldCloseDocument")||(objj_msgSend(_windowControllers,"count")<2&&objj_msgSend(_windowControllers,"indexOfObject:",_bd)!==CPNotFound)){
objj_msgSend(_bb,"canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:",_be,_bf,_c0);
}else{
if(objj_msgSend(_be,"respondsToSelector:",_bf)){
objj_msgSend(_be,_bf,_bb,YES,_c0);
}
}
}
}),new objj_method(sel_getUid("canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:"),function(_c1,_c2,_c3,_c4,_c5){
with(_c1){
if(!objj_msgSend(_c1,"isDocumentEdited")){
return objj_msgSend(_c3,"respondsToSelector:",_c4)&&objj_msgSend(_c3,_c4,_c1,YES,_c5);
}
_canCloseAlert=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_canCloseAlert,"setDelegate:",_c1);
objj_msgSend(_canCloseAlert,"setAlertStyle:",CPWarningAlertStyle);
objj_msgSend(_canCloseAlert,"setTitle:","Unsaved Document");
objj_msgSend(_canCloseAlert,"setMessageText:",sprintf("Do you want to save the changes you've made to the document \"%@\"?",objj_msgSend(_c1,"displayName")||objj_msgSend(_c1,"fileName")));
objj_msgSend(_canCloseAlert,"addButtonWithTitle:","Save");
objj_msgSend(_canCloseAlert,"addButtonWithTitle:","Cancel");
objj_msgSend(_canCloseAlert,"addButtonWithTitle:","Don't Save");
_canCloseAlert._context={delegate:_c3,selector:_c4,context:_c5};
objj_msgSend(_canCloseAlert,"runModal");
}
}),new objj_method(sel_getUid("alertDidEnd:returnCode:"),function(_c6,_c7,_c8,_c9){
with(_c6){
if(_c8!==_canCloseAlert){
return;
}
var _ca=_c8._context.delegate,_cb=_c8._context.selector,_cc=_c8._context.context;
if(_c9===0){
objj_msgSend(_c6,"saveDocumentWithDelegate:didSaveSelector:contextInfo:",_ca,_cb,_cc);
}else{
objj_msgSend(_ca,_cb,_c6,_c9===2,_cc);
}
_canCloseAlert=nil;
}
})]);
var _5c=function(_cd,_ce,_cf,_d0){
return {fileType:_cd,delegate:_ce,didReadSelector:_cf,contextInfo:_d0};
};
var _6d=function(_d1,_d2,_d3,_d4,_d5,_d6,_d7){
return {absoluteURL:_d1,saveOperation:_d2,changeCount:_d3,delegate:_d4,didSaveSelector:_d5,contextInfo:_d6,connection:_d7};
};
p;22;CPDocumentController.jI;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.ji;13;CPOpenPanel.jc;5744;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPDocumentController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_documents"),new objj_ivar("_documentTypes")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_documents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
if(!_1){
_1=_4;
}
_documentTypes=objj_msgSend(objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"infoDictionary"),"objectForKey:","CPBundleDocumentTypes");
}
return _4;
}
}),new objj_method(sel_getUid("documentForURL:"),function(_6,_7,_8){
with(_6){
var _9=0,_a=objj_msgSend(_documents,"count");
for(;_9<_a;++_9){
var _b=_documents[_9];
if(objj_msgSend(objj_msgSend(_b,"fileURL"),"isEqual:",_8)){
return _b;
}
}
return nil;
}
}),new objj_method(sel_getUid("openUntitledDocumentOfType:display:"),function(_c,_d,_e,_f){
with(_c){
var _10=objj_msgSend(_c,"makeUntitledDocumentOfType:error:",_e,nil);
if(_10){
objj_msgSend(_c,"addDocument:",_10);
}
if(_f){
objj_msgSend(_10,"makeWindowControllers");
objj_msgSend(_10,"showWindows");
}
return _10;
}
}),new objj_method(sel_getUid("makeUntitledDocumentOfType:error:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSend(objj_msgSend(objj_msgSend(_11,"documentClassForType:",_13),"alloc"),"initWithType:error:",_13,_14);
}
}),new objj_method(sel_getUid("openDocumentWithContentsOfURL:display:error:"),function(_15,_16,_17,_18,_19){
with(_15){
var _1a=objj_msgSend(_15,"documentForURL:",_17);
if(!_1a){
var _1b=objj_msgSend(_15,"typeForContentsOfURL:error:",_17,_19);
_1a=objj_msgSend(_15,"makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_17,_1b,_15,sel_getUid("document:didRead:contextInfo:"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_18,"shouldDisplay"));
}else{
if(_18){
objj_msgSend(_1a,"showWindows");
}
}
return _1a;
}
}),new objj_method(sel_getUid("reopenDocumentForURL:withContentsOfURL:error:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(_1c,"makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_1e,_1f,objj_msgSend(objj_msgSend(_documentTypes,"objectAtIndex:",0),"objectForKey:","CPBundleTypeName"),_1c,sel_getUid("document:didRead:contextInfo:"),nil);
}
}),new objj_method(sel_getUid("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_21,_22,_23,_24,_25,_26,_27){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_21,"documentClassForType:",_24),"alloc"),"initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_23,_24,_25,_26,_27);
}
}),new objj_method(sel_getUid("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_28,_29,_2a,_2b,_2c,_2d,_2e,_2f){
with(_28){
return objj_msgSend(objj_msgSend(objj_msgSend(_28,"documentClassForType:",_2c),"alloc"),"initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_2a,_2b,_2c,_2d,_2e,_2f);
}
}),new objj_method(sel_getUid("document:didRead:contextInfo:"),function(_30,_31,_32,_33,_34){
with(_30){
if(!_33){
return;
}
objj_msgSend(_30,"addDocument:",_32);
objj_msgSend(_32,"makeWindowControllers");
if(objj_msgSend(_34,"objectForKey:","shouldDisplay")){
objj_msgSend(_32,"showWindows");
}
}
}),new objj_method(sel_getUid("newDocument:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"openUntitledDocumentOfType:display:",objj_msgSend(objj_msgSend(_documentTypes,"objectAtIndex:",0),"objectForKey:","CPBundleTypeName"),YES);
}
}),new objj_method(sel_getUid("openDocument:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(CPOpenPanel,"openPanel");
objj_msgSend(_3b,"runModal");
var _3c=objj_msgSend(_3b,"URLs"),_3d=0,_3e=objj_msgSend(_3c,"count");
for(;_3d<_3e;++_3d){
objj_msgSend(_38,"openDocumentWithContentsOfURL:display:error:",objj_msgSend(CPURL,"URLWithString:",_3c[_3d]),YES,nil);
}
}
}),new objj_method(sel_getUid("documents"),function(_3f,_40){
with(_3f){
return _documents;
}
}),new objj_method(sel_getUid("addDocument:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_documents,"addObject:",_43);
}
}),new objj_method(sel_getUid("removeDocument:"),function(_44,_45,_46){
with(_44){
objj_msgSend(_documents,"removeObjectIdenticalTo:",_46);
}
}),new objj_method(sel_getUid("defaultType"),function(_47,_48){
with(_47){
return objj_msgSend(_documentTypes[0],"objectForKey:","CPBundleTypeName");
}
}),new objj_method(sel_getUid("typeForContentsOfURL:error:"),function(_49,_4a,_4b,_4c){
with(_49){
var _4d=0,_4e=_documentTypes.length,_4f=objj_msgSend(objj_msgSend(_4b,"pathExtension"),"lowercaseString");
for(;_4d<_4e;++_4d){
var _50=_documentTypes[_4d],_51=objj_msgSend(_50,"objectForKey:","CFBundleTypeExtensions"),_52=0,_53=_51.length;
for(;_52<_53;++_52){
if(objj_msgSend(_51[_52],"lowercaseString")==_4f){
return objj_msgSend(_50,"objectForKey:","CPBundleTypeName");
}
}
}
return objj_msgSend(_49,"defaultType");
}
}),new objj_method(sel_getUid("_infoForType:"),function(_54,_55,_56){
with(_54){
var i=0,_58=objj_msgSend(_documentTypes,"count");
for(;i<_58;++i){
var _59=_documentTypes[i];
if(objj_msgSend(_59,"objectForKey:","CPBundleTypeName")==_56){
return _59;
}
}
return nil;
}
}),new objj_method(sel_getUid("documentClassForType:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(objj_msgSend(_5a,"_infoForType:",_5c),"objectForKey:","CPDocumentClass");
return _5d?CPClassFromString(_5d):nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedDocumentController"),function(_5e,_5f){
with(_5e){
if(!_1){
objj_msgSend(objj_msgSend(_5e,"alloc"),"init");
}
return _1;
}
})]);
p;18;CPDOMWindowLayer.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jc;1985;
var _1=objj_allocateClassPair(CPObject,"CPDOMWindowLayer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_level"),new objj_ivar("_windows"),new objj_ivar("_DOMElement")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithLevel:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_level=_5;
_windows=[];
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.top="0px";
_DOMElement.style.left="0px";
_DOMElement.style.width="1px";
_DOMElement.style.height="1px";
}
return _3;
}
}),new objj_method(sel_getUid("level"),function(_6,_7){
with(_6){
return _level;
}
}),new objj_method(sel_getUid("removeWindow:"),function(_8,_9,_a){
with(_8){
if(!_a._isVisible){
return;
}
var _b=_a._index,_c=_windows.length-1;
_DOMElement.removeChild(_a._DOMElement);
objj_msgSend(_windows,"removeObjectAtIndex:",_a._index);
for(;_b<_c;++_b){
_windows[_b]._index=_b;
_windows[_b]._DOMElement.style.zIndex=_b;
}
_a._isVisible=NO;
}
}),new objj_method(sel_getUid("insertWindow:atIndex:"),function(_d,_e,_f,_10){
with(_d){
var _11=objj_msgSend(_windows,"count"),_12=(_10==CPNotFound?_11:_10),_13=_f._isVisible;
if(_13){
_12=MIN(_12,_f._index);
objj_msgSend(_windows,"removeObjectAtIndex:",_f._index);
}else{
++_11;
}
if(_10==CPNotFound||_10>=_11){
objj_msgSend(_windows,"addObject:",_f);
}else{
objj_msgSend(_windows,"insertObject:atIndex:",_f,_10);
}
for(;_12<_11;++_12){
_windows[_12]._index=_12;
_windows[_12]._DOMElement.style.zIndex=_12;
}
if(_f._DOMElement.parentNode!==_DOMElement){
_DOMElement.appendChild(_f._DOMElement);
_f._isVisible=YES;
if(objj_msgSend(_f,"isFullBridge")){
objj_msgSend(_f,"setFrame:",objj_msgSend(_f._platformWindow,"usableContentFrame"));
}
}
}
}),new objj_method(sel_getUid("orderedWindows"),function(_14,_15){
with(_14){
return _windows;
}
})]);
p;14;CPDragServer.jI;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;11956;
CPDragOperationNone=0,CPDragOperationCopy=1<<1,CPDragOperationLink=1<<1,CPDragOperationGeneric=1<<2,CPDragOperationPrivate=1<<3,CPDragOperationMove=1<<4,CPDragOperationDelete=1<<5,CPDragOperationEvery=-1;
var _1=nil,_2=nil;
var _3=nil;
var _4=nil;
var _5=nil;
var _6=objj_allocateClassPair(CPObject,"CPDraggingInfo"),_7=_6.isa;
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("draggingPasteboard"),function(_8,_9){
with(_8){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
return objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
}
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingPasteboard");
}
}),new objj_method(sel_getUid("draggingSource"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingSource");
}
}),new objj_method(sel_getUid("draggingLocation"),function(_c,_d){
with(_c){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingLocation");
}
}),new objj_method(sel_getUid("draggingDestinationWindow"),function(_e,_f){
with(_e){
return (objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"),"isKindOfClass:",objj_msgSend(CPWindow,"class"))?objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"):objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"),"window"));
}
}),new objj_method(sel_getUid("draggedImage"),function(_10,_11){
with(_10){
return objj_msgSend(objj_msgSend(_10,"draggedView"),"image");
}
}),new objj_method(sel_getUid("draggedImageLocation"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"draggedViewLocation");
}
}),new objj_method(sel_getUid("draggedView"),function(_14,_15){
with(_14){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggedView");
}
}),new objj_method(sel_getUid("draggedViewLocation"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPDragServer,"sharedDragServer");
return objj_msgSend((objj_msgSend(objj_msgSend(_18,"draggingDestination"),"isKindOfClass:",objj_msgSend(CPWindow,"class"))?objj_msgSend(_18,"draggingDestination"):objj_msgSend(objj_msgSend(_18,"draggingDestination"),"window")),"convertPlatformWindowToBase:",objj_msgSend(objj_msgSend(_18,"draggedView"),"frame").origin);
}
})]);
var _19=1<<0,_1a=1<<1,_1b=1<<2,_1c=1<<3;
var _6=objj_allocateClassPair(CPObject,"CPDragServer"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_isDragging"),new objj_ivar("_draggedWindow"),new objj_ivar("_draggedView"),new objj_ivar("_imageView"),new objj_ivar("_isDraggingImage"),new objj_ivar("_draggingOffset"),new objj_ivar("_draggingPasteboard"),new objj_ivar("_draggingSource"),new objj_ivar("_implementedDraggingSourceMethods"),new objj_ivar("_draggingLocation"),new objj_ivar("_draggingDestination")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("isDragging"),function(_1d,_1e){
with(_1d){
return _isDragging;
}
}),new objj_method(sel_getUid("draggedWindow"),function(_1f,_20){
with(_1f){
return _draggedWindow;
}
}),new objj_method(sel_getUid("draggedView"),function(_21,_22){
with(_21){
return _draggedView;
}
}),new objj_method(sel_getUid("draggingOffset"),function(_23,_24){
with(_23){
return _draggingOffset;
}
}),new objj_method(sel_getUid("draggingPasteboard"),function(_25,_26){
with(_25){
return _draggingPasteboard;
}
}),new objj_method(sel_getUid("draggingSource"),function(_27,_28){
with(_27){
return _draggingSource;
}
}),new objj_method(sel_getUid("init"),function(_29,_2a){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPObject")},"init");
if(_29){
_draggedWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",{origin:{x:0,y:0},size:{width:0,height:0}},CPBorderlessWindowMask);
objj_msgSend(_draggedWindow,"setLevel:",CPDraggingWindowLevel);
}
return _29;
}
}),new objj_method(sel_getUid("draggingLocation"),function(_2b,_2c){
with(_2b){
return _draggingLocation;
}
}),new objj_method(sel_getUid("draggingStartedInPlatformWindow:globalLocation:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(_isDraggingImage){
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:beganAt:"))){
objj_msgSend(_draggingSource,"draggedImage:beganAt:",objj_msgSend(_draggedView,"image"),_30);
}
}else{
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:beganAt:"))){
objj_msgSend(_draggingSource,"draggedView:beganAt:",_draggedView,_30);
}
}
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"orderFront:",_2d);
}
}
}),new objj_method(sel_getUid("draggingSourceUpdatedWithGlobalLocation:"),function(_31,_32,_33){
with(_31){
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"setFrameOrigin:",{x:_33.x-_draggingOffset.width,y:_33.y-_draggingOffset.height});
}
if(_implementedDraggingSourceMethods&_19){
objj_msgSend(_draggingSource,"draggedImage:movedTo:",objj_msgSend(_draggedView,"image"),_33);
}else{
if(_implementedDraggingSourceMethods&_1b){
objj_msgSend(_draggingSource,"draggedView:movedTo:",_draggedView,_33);
}
}
}
}),new objj_method(sel_getUid("draggingUpdatedInPlatformWindow:location:"),function(_34,_35,_36,_37){
with(_34){
var _38=CPDragOperationCopy;
var _39=objj_msgSend(_36,"_dragHitTest:pasteboard:",_37,objj_msgSend(_5,"draggingPasteboard"));
if(_39){
_draggingLocation=objj_msgSend((objj_msgSend(_39,"isKindOfClass:",objj_msgSend(CPWindow,"class"))?_39:objj_msgSend(_39,"window")),"convertPlatformWindowToBase:",_37);
}
if(_39!==_draggingDestination){
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingExited:"))){
objj_msgSend(_draggingDestination,"draggingExited:",_5);
}
_draggingDestination=_39;
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingEntered:"))){
_38=objj_msgSend(_draggingDestination,"draggingEntered:",_5);
}
}else{
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingUpdated:"))){
_38=objj_msgSend(_draggingDestination,"draggingUpdated:",_5);
}
}
if(!_draggingDestination){
_38=CPDragOperationNone;
}
return _38;
}
}),new objj_method(sel_getUid("draggingEndedInPlatformWindow:globalLocation:"),function(_3a,_3b,_3c,_3d){
with(_3a){
objj_msgSend(_draggedView,"removeFromSuperview");
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"orderOut:",_3a);
}
if(_implementedDraggingSourceMethods&_1a){
objj_msgSend(_draggingSource,"draggedImage:endedAt:operation:",objj_msgSend(_draggedView,"image"),_3d,NO);
}else{
if(_implementedDraggingSourceMethods&_1c){
objj_msgSend(_draggingSource,"draggedView:endedAt:operation:",_draggedView,_3d,NO);
}
}
_isDragging=NO;
}
}),new objj_method(sel_getUid("performDragOperationInPlatformWindow:"),function(_3e,_3f,_40){
with(_3e){
if(_draggingDestination&&(!objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("prepareForDragOperation:"))||objj_msgSend(_draggingDestination,"prepareForDragOperation:",_5))&&(!objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("performDragOperation:"))||objj_msgSend(_draggingDestination,"performDragOperation:",_5))&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("concludeDragOperation:"))){
objj_msgSend(_draggingDestination,"concludeDragOperation:",_5);
}
}
}),new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_41,_42,_43,_44,_45,_46,_47,_48,_49,_4a){
with(_41){
_isDragging=YES;
_draggedView=_43;
_draggingPasteboard=_48||objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
_draggingSource=_49;
_draggingDestination=nil;
var _4b=objj_msgSend(_47,"window"),_4c=objj_msgSend(_47,"locationInWindow");
if(_4c){
if(_4b){
_4c=objj_msgSend(_4b,"convertBaseToGlobal:",_4c);
}
_draggingOffset={width:_4c.x-_45.x,height:_4c.y-_45.y};
}else{
_draggingOffset=_CGSizeMakerZero();
}
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_draggedWindow,"setPlatformWindow:",objj_msgSend(_44,"platformWindow"));
}
objj_msgSend(_43,"setFrameOrigin:",{x:0,y:0});
var _4d=objj_msgSend(CPEvent,"mouseLocation");
objj_msgSend(_draggedWindow,"setFrameOrigin:",{x:_4d.x-_draggingOffset.width,y:_4d.y-_draggingOffset.height});
objj_msgSend(_draggedWindow,"setFrameSize:",objj_msgSend(_43,"frame").size);
objj_msgSend(objj_msgSend(_draggedWindow,"contentView"),"addSubview:",_43);
_implementedDraggingSourceMethods=0;
if(_draggedView===_imageView){
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:movedTo:"))){
_implementedDraggingSourceMethods|=_19;
}
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:endAt:operation:"))){
_implementedDraggingSourceMethods|=_1a;
}
}else{
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:movedTo:"))){
_implementedDraggingSourceMethods|=_1b;
}
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:endedAt:operation:"))){
_implementedDraggingSourceMethods|=_1c;
}
}
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_41,"draggingStartedInPlatformWindow:globalLocation:",objj_msgSend(_44,"platformWindow"),_4d);
objj_msgSend(_41,"trackDragging:",_47);
}
}
}),new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_4e,_4f,_50,_51,_52,_53,_54,_55,_56,_57){
with(_4e){
_isDraggingImage=YES;
var _58=objj_msgSend(_50,"size");
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:_58.width,height:_58.height}});
}
objj_msgSend(_imageView,"setImage:",_50);
objj_msgSend(_4e,"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_imageView,_51,_52,_53,_54,_55,_56,_57);
}
}),new objj_method(sel_getUid("trackDragging:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(_5b,"type"),_5d=objj_msgSend(_draggedWindow,"platformWindow"),_5e=objj_msgSend(objj_msgSend(_5b,"window"),"convertBaseToPlatformWindow:",objj_msgSend(_5b,"locationInWindow"));
if(_5c===CPLeftMouseUp){
objj_msgSend(_59,"performDragOperationInPlatformWindow:",_5d);
objj_msgSend(_59,"draggingEndedInPlatformWindow:globalLocation:",_5d,_5e);
return;
}
objj_msgSend(_59,"draggingSourceUpdatedWithGlobalLocation:",_5e);
objj_msgSend(_59,"draggingUpdatedInPlatformWindow:location:",_5d,_5e);
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_59,sel_getUid("trackDragging:"),CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,0,NO);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(_5f,_60){
with(_5f){
if(_5f!==objj_msgSend(CPDragServer,"class")){
return;
}
_5=objj_msgSend(objj_msgSend(CPDraggingInfo,"alloc"),"init");
}
}),new objj_method(sel_getUid("sharedDragServer"),function(_61,_62){
with(_61){
if(!_3){
_3=objj_msgSend(objj_msgSend(CPDragServer,"alloc"),"init");
}
return _3;
}
})]);
var _6=objj_getClass("CPWindow");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_63,_64,_65,_66){
with(_63){
if(!_inclusiveRegisteredDraggedTypes){
return nil;
}
var _67=objj_msgSend(_63,"convertPlatformWindowToBase:",_65),_68=objj_msgSend(_windowView,"hitTest:",_67);
while(_68&&!objj_msgSend(_66,"availableTypeFromArray:",objj_msgSend(_68,"registeredDraggedTypes"))){
_68=objj_msgSend(_68,"superview");
}
if(_68){
return _68;
}
if(objj_msgSend(_66,"availableTypeFromArray:",objj_msgSend(_63,"registeredDraggedTypes"))){
return _63;
}
return nil;
}
})]);
p;9;CPEvent.jI;21;Foundation/CPObject.jc;8406;
CPLeftMouseDown=1;
CPLeftMouseUp=2;
CPRightMouseDown=3;
CPRightMouseUp=4;
CPMouseMoved=5;
CPLeftMouseDragged=6;
CPRightMouseDragged=7;
CPMouseEntered=8;
CPMouseExited=9;
CPKeyDown=10;
CPKeyUp=11;
CPFlagsChanged=12;
CPAppKitDefined=13;
CPSystemDefined=14;
CPApplicationDefined=15;
CPPeriodic=16;
CPCursorUpdate=17;
CPScrollWheel=22;
CPOtherMouseDown=25;
CPOtherMouseUp=26;
CPOtherMouseDragged=27;
CPTouchStart=28;
CPTouchMove=29;
CPTouchEnd=30;
CPTouchCancel=31;
CPAlphaShiftKeyMask=1<<16;
CPShiftKeyMask=1<<17;
CPControlKeyMask=1<<18;
CPAlternateKeyMask=1<<19;
CPCommandKeyMask=1<<20;
CPNumericPadKeyMask=1<<21;
CPHelpKeyMask=1<<22;
CPFunctionKeyMask=1<<23;
CPDeviceIndependentModifierFlagsMask=4294901760;
CPLeftMouseDownMask=1<<CPLeftMouseDown;
CPLeftMouseUpMask=1<<CPLeftMouseUp;
CPRightMouseDownMask=1<<CPRightMouseDown;
CPRightMouseUpMask=1<<CPRightMouseUp;
CPOtherMouseDownMask=1<<CPOtherMouseDown;
CPOtherMouseUpMask=1<<CPOtherMouseUp;
CPMouseMovedMask=1<<CPMouseMoved;
CPLeftMouseDraggedMask=1<<CPLeftMouseDragged;
CPRightMouseDraggedMask=1<<CPRightMouseDragged;
CPOtherMouseDragged=1<<CPOtherMouseDragged;
CPMouseEnteredMask=1<<CPMouseEntered;
CPMouseExitedMask=1<<CPMouseExited;
CPCursorUpdateMask=1<<CPCursorUpdate;
CPKeyDownMask=1<<CPKeyDown;
CPKeyUpMask=1<<CPKeyUp;
CPFlagsChangedMask=1<<CPFlagsChanged;
CPAppKitDefinedMask=1<<CPAppKitDefined;
CPSystemDefinedMask=1<<CPSystemDefined;
CPApplicationDefinedMask=1<<CPApplicationDefined;
CPPeriodicMask=1<<CPPeriodic;
CPScrollWheelMask=1<<CPScrollWheel;
CPAnyEventMask=4294967295;
CPDOMEventDoubleClick="dblclick",CPDOMEventMouseDown="mousedown",CPDOMEventMouseUp="mouseup",CPDOMEventMouseMoved="mousemove",CPDOMEventMouseDragged="mousedrag",CPDOMEventKeyUp="keyup",CPDOMEventKeyDown="keydown",CPDOMEventKeyPress="keypress";
CPDOMEventCopy="copy";
CPDOMEventPaste="paste";
CPDOMEventScrollWheel="mousewheel";
CPDOMEventTouchStart="touchstart";
CPDOMEventTouchMove="touchmove";
CPDOMEventTouchEnd="touchend";
CPDOMEventTouchCancel="touchcancel";
var _1=0,_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPEvent"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_type"),new objj_ivar("_location"),new objj_ivar("_modifierFlags"),new objj_ivar("_timestamp"),new objj_ivar("_context"),new objj_ivar("_eventNumber"),new objj_ivar("_clickCount"),new objj_ivar("_pressure"),new objj_ivar("_window"),new objj_ivar("_windowNumber"),new objj_ivar("_characters"),new objj_ivar("_isARepeat"),new objj_ivar("_keyCode"),new objj_ivar("_DOMEvent"),new objj_ivar("_deltaX"),new objj_ivar("_deltaY"),new objj_ivar("_deltaZ")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_type=_7;
_location=CPPointCreateCopy(_8);
_modifierFlags=_9;
_timestamp=_a;
_context=_c;
_eventNumber=_d;
_clickCount=_e;
_pressure=_f;
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_b);
}
return _5;
}
}),new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_1a,_1b){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPObject")},"init");
if(_10){
_type=_12;
_location=CPPointCreateCopy(_13);
_modifierFlags=_14;
_timestamp=_15;
_context=_17;
_characters=_18;
_charactersIgnoringModifiers=_19;
_isARepeat=_1a;
_keyCode=_1b;
_windowNumber=_16;
}
return _10;
}
}),new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_1c,_1d,_1e,_1f,_20,_21,_22,_23,_24,_25,_26){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPObject")},"init");
if(_1c){
_type=_1e;
_location=CPPointCreateCopy(_1f);
_modifierFlags=_20;
_timestamp=_21;
_context=_23;
_subtype=_24;
_data1=_25;
_data2=_26;
}
return _1c;
}
}),new objj_method(sel_getUid("locationInWindow"),function(_27,_28){
with(_27){
return {x:_location.x,y:_location.y};
}
}),new objj_method(sel_getUid("modifierFlags"),function(_29,_2a){
with(_29){
return _modifierFlags;
}
}),new objj_method(sel_getUid("timestamp"),function(_2b,_2c){
with(_2b){
return _timestamp;
}
}),new objj_method(sel_getUid("type"),function(_2d,_2e){
with(_2d){
return _type;
}
}),new objj_method(sel_getUid("window"),function(_2f,_30){
with(_2f){
if(!_window){
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_windowNumber);
}
return _window;
}
}),new objj_method(sel_getUid("windowNumber"),function(_31,_32){
with(_31){
return _windowNumber;
}
}),new objj_method(sel_getUid("buttonNumber"),function(_33,_34){
with(_33){
return _buttonNumber;
}
}),new objj_method(sel_getUid("clickCount"),function(_35,_36){
with(_35){
return _clickCount;
}
}),new objj_method(sel_getUid("characters"),function(_37,_38){
with(_37){
return _characters;
}
}),new objj_method(sel_getUid("charactersIgnoringModifiers"),function(_39,_3a){
with(_39){
return _charactersIgnoringModifiers;
}
}),new objj_method(sel_getUid("isARepeat"),function(_3b,_3c){
with(_3b){
return _isARepeat;
}
}),new objj_method(sel_getUid("keyCode"),function(_3d,_3e){
with(_3d){
return _keyCode;
}
}),new objj_method(sel_getUid("pressure"),function(_3f,_40){
with(_3f){
return _pressure;
}
}),new objj_method(sel_getUid("_DOMEvent"),function(_41,_42){
with(_41){
return _DOMEvent;
}
}),new objj_method(sel_getUid("deltaX"),function(_43,_44){
with(_43){
return _deltaX;
}
}),new objj_method(sel_getUid("deltaY"),function(_45,_46){
with(_45){
return _deltaY;
}
}),new objj_method(sel_getUid("deltaZ"),function(_47,_48){
with(_47){
return _deltaZ;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54){
with(_49){
return objj_msgSend(objj_msgSend(_49,"alloc"),"_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54);
}
}),new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_55,_56,_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f);
}
}),new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_60,_61,_62,_63,_64,_65,_66,_67,_68,_69,_6a){
with(_60){
return objj_msgSend(objj_msgSend(_60,"alloc"),"_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",_62,_63,_64,_65,_66,_67,_68,_69,_6a);
}
}),new objj_method(sel_getUid("mouseLocation"),function(_6b,_6c){
with(_6b){
var _6d=objj_msgSend(CPApp,"currentEvent"),_6e=objj_msgSend(_6d,"window");
if(_6e){
return objj_msgSend(_6e,"convertBaseToGlobal:",objj_msgSend(_6d,"locationInWindow"));
}
return objj_msgSend(_6d,"locationInWindow");
}
}),new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"),function(_6f,_70,_71,_72){
with(_6f){
_1=_72;
_2=window.setTimeout(function(){
_2=window.setInterval(_CPEventFirePeriodEvent,_72*1000);
},_71*1000);
}
}),new objj_method(sel_getUid("stopPeriodicEvents"),function(_73,_74){
with(_73){
if(_2===nil){
return;
}
window.clearTimeout(_2);
_2=nil;
}
})]);
_CPEventFirePeriodEvent=function(){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPPeriodic,{x:0,y:0},0,0,0,nil,0,0,0));
};
var _75=objj_msgSend(CPEvent,"class");
_CPEventFromNativeMouseEvent=function(_76,_77,_78,_79,_7a,_7b,_7c,_7d,_7e,_7f){
_76.isa=_75;
_76._type=_77;
_76._location=_78;
_76._modifierFlags=_79;
_76._timestamp=_7a;
_76._windowNumber=_7b;
_76._window=nil;
_76._context=_7c;
_76._eventNumber=_7d;
_76._clickCount=_7e;
_76._pressure=_7f;
return _76;
};
p;14;CPFlashMovie.jI;21;Foundation/CPObject.jc;616;
var _1=objj_allocateClassPair(CPObject,"CPFlashMovie"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fileName")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFile:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_fileName=_5;
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("flashMovieWithFile:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(objj_msgSend(_6,"alloc"),"initWithFile:",_8);
}
})]);
p;13;CPFlashView.ji;14;CPFlashMovie.ji;8;CPView.jc;2152;
var _1=objj_allocateClassPair(CPView,"CPFlashView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_flashMovie"),new objj_ivar("_DOMEmbedElement"),new objj_ivar("_DOMMParamElement"),new objj_ivar("_DOMObjectElement")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_DOMObjectElement=document.createElement("object");
_DOMObjectElement.width="100%";
_DOMObjectElement.height="100%";
_DOMObjectElement.style.top="0px";
_DOMObjectElement.style.left="0px";
_DOMParamElement=document.createElement("param");
_DOMParamElement.name="movie";
_DOMObjectElement.appendChild(_DOMParamElement);
var _6=document.createElement("param");
_6.name="wmode";
_6.value="transparent";
_DOMObjectElement.appendChild(_6);
_DOMEmbedElement=document.createElement("embed");
_DOMEmbedElement.type="application/x-shockwave-flash";
_DOMEmbedElement.setAttribute("wmode","transparent");
_DOMEmbedElement.width="100%";
_DOMEmbedElement.height="100%";
_DOMElement.appendChild(_DOMEmbedElement);
_DOMElement.appendChild(_DOMObjectElement);
}
return _3;
}
}),new objj_method(sel_getUid("setFlashMovie:"),function(_7,_8,_9){
with(_7){
if(_flashMovie==_9){
return;
}
_flashMovie=_9;
_DOMParamElement.value=_9._fileName;
if(_DOMEmbedElement){
_DOMEmbedElement.src=_9._fileName;
}
}
}),new objj_method(sel_getUid("flashMovie"),function(_a,_b){
with(_a){
return _flashMovie;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_c,_d,_e){
with(_c){
objj_msgSend(objj_msgSend(objj_msgSend(_c,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_f,_10,_11){
with(_f){
objj_msgSend(objj_msgSend(objj_msgSend(_f,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_12,_13,_14){
with(_12){
objj_msgSend(objj_msgSend(objj_msgSend(_12,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
})]);
p;8;CPFont.jc;2706;
var _1={};
_CPFontSystemFontFace="Arial";
var _2=objj_allocateClassPair(CPObject,"CPFont"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_name"),new objj_ivar("_size"),new objj_ivar("_isBold"),new objj_ivar("_cssString")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_initWithName:size:bold:"),function(_4,_5,_6,_7,_8){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_name=_6;
_size=_7;
_isBold=_8;
_cssString=(_isBold?"bold ":"")+ROUND(_7)+"px '"+_6+"'";
_1[_cssString]=_4;
}
return _4;
}
}),new objj_method(sel_getUid("size"),function(_9,_a){
with(_9){
return _size;
}
}),new objj_method(sel_getUid("cssString"),function(_b,_c){
with(_b){
return _cssString;
}
}),new objj_method(sel_getUid("familyName"),function(_d,_e){
with(_d){
return _name;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("fontWithName:size:"),function(_f,_10,_11,_12){
with(_f){
return _1[(NO?"bold ":"")+ROUND(_12)+"px '"+_11+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_11,_12,NO);
}
}),new objj_method(sel_getUid("boldFontWithName:size:"),function(_13,_14,_15,_16){
with(_13){
return _1[(YES?"bold ":"")+ROUND(_16)+"px '"+_15+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_15,_16,YES);
}
}),new objj_method(sel_getUid("systemFontOfSize:"),function(_17,_18,_19){
with(_17){
return _1[(NO?"bold ":"")+ROUND(_19)+"px '"+_CPFontSystemFontFace+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_CPFontSystemFontFace,_19,NO);
}
}),new objj_method(sel_getUid("boldSystemFontOfSize:"),function(_1a,_1b,_1c){
with(_1a){
return _1[(YES?"bold ":"")+ROUND(_1c)+"px '"+_CPFontSystemFontFace+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_CPFontSystemFontFace,_1c,YES);
}
})]);
var _1d="CPFontNameKey",_1e="CPFontSizeKey",_1f="CPFontIsBoldKey";
var _2=objj_getClass("CPFont");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPFont\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,"_initWithName:size:bold:",objj_msgSend(_22,"decodeObjectForKey:",_1d),objj_msgSend(_22,"decodeFloatForKey:",_1e),objj_msgSend(_22,"decodeBoolForKey:",_1f));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_25,"encodeObject:forKey:",_name,_1d);
objj_msgSend(_25,"encodeFloat:forKey:",_size,_1e);
objj_msgSend(_25,"encodeBool:forKey:",_isBold,_1f);
}
})]);
p;15;CPFontManager.jI;21;Foundation/CPObject.jI;15;AppKit/CPFont.jc;3249;
var _1=nil,_2=Nil;
var _3=objj_allocateClassPair(CPObject,"CPFontManager"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_availableFonts")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("availableFonts"),function(_5,_6){
with(_5){
if(!_availableFonts){
_7=document.createElement("span");
_7.fontSize="24px";
_7.appendChild(document.createTextNode("mmmmmmmmmml"));
var _8=document.createElement("div");
_8.style.position="absolute";
_8.style.top="-1000px";
_8.appendChild(_7);
document.getElementsByTagName("body")[0].appendChild(_8);
_9=_a(["monospace","serif","sans-serif","cursive"]);
_availableFonts=[];
for(var i=0;i<_c.length;i++){
var _d=_e(_c[i]);
if(_d){
_availableFonts.push(_c[i]);
}
}
}
return _availableFonts;
}
}),new objj_method(sel_getUid("fontWithNameIsAvailable:"),function(_f,_10,_11){
with(_f){
return _e(_11);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedFontManager"),function(_12,_13){
with(_12){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("setFontManagerFactory:"),function(_14,_15,_16){
with(_14){
_2=_16;
}
})]);
var _7,_9,_c=["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _e=function(_17){
for(var i=0;i<_9.length;i++){
if(_19(_9[i],_17)){
return true;
}
}
return false;
};
var _1a={};
var _19=function(_1b,_1c){
var a;
if(_1a[_1b]){
a=_1a[_1b];
}else{
_7.style.fontFamily="\""+_1b+"\"";
_1a[_1b]=a={w:_7.offsetWidth,h:_7.offsetHeight};
}
_7.style.fontFamily="\""+_1c+"\", \""+_1b+"\"";
var _1e=_7.offsetWidth;
var _1f=_7.offsetHeight;
return (a.w!=_1e||a.h!=_1f);
};
var _a=function(_20){
for(var i=0;i<_20.length;i++){
for(var j=0;j<i;j++){
if(_19(_20[i],_20[j])){
return [_20[i],_20[j]];
}
}
}
return [_20[0]];
};
objj_msgSend(CPFontManager,"setFontManagerFactory:",objj_msgSend(CPFontManager,"class"));
p;12;CPGeometry.ji;12;CGGeometry.jc;4107;
CPMinXEdge=0;
CPMinYEdge=1;
CPMaxXEdge=2;
CPMaxYEdge=3;
CPMakePoint=CGPointMake;
CPMakeSize=CGSizeMake;
CPMakeRect=CGRectMake;
CPPointCreateCopy=function(_1){
return {x:_1.x,y:_1.y};
};
CPPointMake=function(x,y){
return {x:x,y:y};
};
CPRectInset=function(_4,dX,dY){
return CPRectMake(_4.origin.x+dX,_4.origin.y+dY,_4.size.width-2*dX,_4.size.height-2*dY);
};
CPRectIntegral=function(_7){
alert("CPRectIntegral unimplemented");
};
CPRectIntersection=function(_8,_9){
var _a=CPRectMake(Math.max(CPRectGetMinX(_8),CPRectGetMinX(_9)),Math.max(CPRectGetMinY(_8),CPRectGetMinY(_9)),0,0);
_a.size.width=Math.min(CPRectGetMaxX(_8),CPRectGetMaxX(_9))-CPRectGetMinX(_a);
_a.size.height=Math.min(CPRectGetMaxY(_8),CPRectGetMaxY(_9))-CPRectGetMinY(_a);
return CPRectIsEmpty(_a)?CPRectMakeZero():_a;
};
CPRectCreateCopy=function(_b){
return {origin:CPPointCreateCopy(_b.origin),size:CPSizeCreateCopy(_b.size)};
};
CPRectMake=function(x,y,_e,_f){
return {origin:CPPointMake(x,y),size:CPSizeMake(_e,_f)};
};
CPRectOffset=function(_10,dX,dY){
return CPRectMake(_10.origin.x+dX,_10.origin.y+dY,_10.size.width,_10.size.height);
};
CPRectStandardize=function(_13){
var _14=CPRectGetWidth(_13),_15=CPRectGetHeight(_13),_16=CPRectCreateCopy(_13);
if(_14<0){
_16.origin.x+=_14;
_16.size.width=-_14;
}
if(_15<0){
_16.origin.y+=_15;
_16.size.height=-_15;
}
return _16;
};
CPRectUnion=function(_17,_18){
var _19=Math.min(CPRectGetMinX(_17),CPRectGetMinX(_18)),_1a=Math.min(CPRectGetMinY(_17),CPRectGetMinY(_18)),_1b=Math.max(CPRectGetMaxX(_17),CPRectGetMaxX(_18)),_1c=Math.max(CPRectGetMaxY(_17),CPRectGetMaxY(_18));
return CPRectMake(_19,_1a,_1b-_19,_1c-_1a);
};
CPSizeCreateCopy=function(_1d){
return {width:_1d.width,height:_1d.height};
};
CPSizeMake=function(_1e,_1f){
return {width:_1e,height:_1f};
};
CPRectContainsPoint=function(_20,_21){
return _21.x>=CPRectGetMinX(_20)&&_21.y>=CPRectGetMinY(_20)&&_21.x<CPRectGetMaxX(_20)&&_21.y<CPRectGetMaxY(_20);
};
CPRectContainsRect=function(_22,_23){
return CPRectEqualToRect(CPUnionRect(_22,_23),_23);
};
CPPointEqualToPoint=function(_24,_25){
return _24.x==_25.x&&_24.y==_25.y;
};
CPRectEqualToRect=function(_26,_27){
return CPPointEqualToPoint(_26.origin,_27.origin)&&CPSizeEqualToSize(_26.size,_27.size);
};
CPRectGetHeight=function(_28){
return _28.size.height;
};
CPRectGetMaxX=function(_29){
return _29.origin.x+_29.size.width;
};
CPRectGetMaxY=function(_2a){
return _2a.origin.y+_2a.size.height;
};
CPRectGetMidX=function(_2b){
return _2b.origin.x+(_2b.size.width)/2;
};
CPRectGetMidY=function(_2c){
return _2c.origin.y+(_2c.size.height)/2;
};
CPRectGetMinX=function(_2d){
return _2d.origin.x;
};
CPRectGetMinY=function(_2e){
return _2e.origin.y;
};
CPRectGetWidth=function(_2f){
return _2f.size.width;
};
CPRectIntersectsRect=function(_30,_31){
return !CPRectIsEmpty(CPRectIntersection(_30,_31));
};
CPRectIsEmpty=function(_32){
return _32.size.width<=0||_32.size.height<=0;
};
CPRectIsNull=function(_33){
return _33.size.width<=0||_33.size.height<=0;
};
CPSizeEqualToSize=function(_34,_35){
return _34.width==_35.width&&_34.height==_35.height;
};
CPStringFromPoint=function(_36){
return "{"+_36.x+", "+_36.y+"}";
};
CPStringFromSize=function(_37){
return "{"+_37.width+", "+_37.height+"}";
};
CPStringFromRect=function(_38){
return "{"+CPStringFromPoint(_38.origin)+", "+CPStringFromSize(_38.size)+"}";
};
CPPointFromString=function(_39){
var _3a=_39.indexOf(",");
return {x:parseFloat(_39.substr(1,_3a-1),10),y:parseFloat(_39.substring(_3a+1,_39.length),10)};
};
CPSizeFromString=function(_3b){
var _3c=_3b.indexOf(",");
return {width:parseFloat(_3b.substr(1,_3c-1),10),height:parseFloat(_3b.substring(_3c+1,_3b.length),10)};
};
CPRectFromString=function(_3d){
var _3e=_3d.indexOf(",",_3d.indexOf(",")+1);
return {origin:CPPointFromString(_3d.substr(1,_3e-1)),size:CPSizeFromString(_3d.substring(_3e+2,_3d.length))};
};
CPPointFromEvent=function(_3f){
return CPPointMake(_3f.clientX,_3f.clientY,0);
};
CPSizeMakeZero=function(){
return CPSizeMake(0,0);
};
CPRectMakeZero=function(){
return CPRectMake(0,0,0,0);
};
CPPointMakeZero=function(){
return CPPointMake(0,0,0);
};
p;19;CPGraphicsContext.jc;960;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPGraphicsContext"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_graphicsPort")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithGraphicsPort:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_graphicsPort=_6;
}
return _4;
}
}),new objj_method(sel_getUid("graphicsPort"),function(_7,_8){
with(_7){
return _graphicsPort;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("currentContext"),function(_9,_a){
with(_9){
return _1;
}
}),new objj_method(sel_getUid("setCurrentContext:"),function(_b,_c,_d){
with(_b){
_1=_d;
}
}),new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"),function(_e,_f,_10,_11){
with(_e){
return objj_msgSend(objj_msgSend(_e,"alloc"),"initWithGraphicsPort:",_10);
}
})]);
p;9;CPImage.jI;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;9082;
CPImageLoadStatusInitialized=0;
CPImageLoadStatusLoading=1;
CPImageLoadStatusCompleted=2;
CPImageLoadStatusCancelled=3;
CPImageLoadStatusInvalidData=4;
CPImageLoadStatusUnexpectedEOF=5;
CPImageLoadStatusReadError=6;
CPImageDidLoadNotification="CPImageDidLoadNotification";
CPImageInBundle=function(_1,_2,_3){
if(!_3){
_3=objj_msgSend(CPBundle,"mainBundle");
}
if(_2){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3,"pathForResource:",_1),_2);
}
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_3,"pathForResource:",_1));
};
var _4=objj_getClass("CPBundle");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("pathForResource:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"resourcePath")+"/"+_8;
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_size"),new objj_ivar("_filename"),new objj_ivar("_delegate"),new objj_ivar("_loadStatus"),new objj_ivar("_image")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
return objj_msgSend(_9,"initByReferencingFile:size:","",CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("initByReferencingFile:size:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_size=CPSizeCreateCopy(_e);
_filename=_d;
_loadStatus=CPImageLoadStatusInitialized;
}
return _b;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:size:"),function(_f,_10,_11,_12){
with(_f){
_f=objj_msgSend(_f,"initByReferencingFile:size:",_11,_12);
if(_f){
objj_msgSend(_f,"load");
}
return _f;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_13,_14,_15){
with(_13){
_13=objj_msgSend(_13,"initByReferencingFile:size:",_15,CGSizeMake(-1,-1));
if(_13){
objj_msgSend(_13,"load");
}
return _13;
}
}),new objj_method(sel_getUid("filename"),function(_16,_17){
with(_16){
return _filename;
}
}),new objj_method(sel_getUid("setSize:"),function(_18,_19,_1a){
with(_18){
_size=CGSizeMakeCopy(_1a);
}
}),new objj_method(sel_getUid("size"),function(_1b,_1c){
with(_1b){
return _size;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1d,_1e,_1f){
with(_1d){
_delegate=_1f;
}
}),new objj_method(sel_getUid("delegate"),function(_20,_21){
with(_20){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_22,_23){
with(_22){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_24,_25){
with(_24){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
var _26=YES;
_image.onload=function(){
if(_26){
window.setTimeout(function(){
objj_msgSend(_24,"_imageDidLoad");
},0);
}else{
objj_msgSend(_24,"_imageDidLoad");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_24,"_derefFromImage");
};
_image.onerror=function(){
if(_26){
window.setTimeout(function(){
objj_msgSend(_24,"_imageDidError");
},0);
}else{
objj_msgSend(_24,"_imageDidError");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_24,"_derefFromImage");
};
_image.onabort=function(){
if(_26){
window.setTimeout(function(){
objj_msgSend(_24,"_imageDidAbort");
},0);
}else{
objj_msgSend(_24,"_imageDidAbort");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_24,"_derefFromImage");
};
_image.src=_filename;
_26=NO;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_27,_28){
with(_27){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_29,_2a){
with(_29){
return NO;
}
}),new objj_method(sel_getUid("_derefFromImage"),function(_2b,_2c){
with(_2b){
_image.onload=null;
_image.onerror=null;
_image.onabort=null;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_2d,_2e){
with(_2d){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_2d);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_2d);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_2f,_30){
with(_2f){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_2f);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_31,_32){
with(_31){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_31);
}
}
})]);
var _4=objj_getClass("CPImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(_33,"initWithContentsOfFile:size:",objj_msgSend(_35,"decodeObjectForKey:","CPFilename"),objj_msgSend(_35,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_38,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_38,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPThreePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_39,_3a,_3b,_3c){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPObject")},"init");
if(_39){
_imageSlices=_3b;
_isVertical=_3c;
}
return _39;
}
}),new objj_method(sel_getUid("filename"),function(_3d,_3e){
with(_3d){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_3f,_40){
with(_3f){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_41,_42){
with(_41){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_43,_44){
with(_43){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_45,_46){
with(_45){
return NO;
}
})]);
var _47="CPThreePartImageImageSlicesKey",_48="CPThreePartImageIsVerticalKey";
var _4=objj_getClass("CPThreePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPThreePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_49,_4a,_4b){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPObject")},"init");
if(_49){
_imageSlices=objj_msgSend(_4b,"decodeObjectForKey:",_47);
_isVertical=objj_msgSend(_4b,"decodeBoolForKey:",_48);
}
return _49;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4e,"encodeObject:forKey:",_imageSlices,_47);
objj_msgSend(_4e,"encodeBool:forKey:",_isVertical,_48);
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPNinePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:"),function(_4f,_50,_51){
with(_4f){
_4f=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPObject")},"init");
if(_4f){
_imageSlices=_51;
}
return _4f;
}
}),new objj_method(sel_getUid("filename"),function(_52,_53){
with(_52){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_54,_55){
with(_54){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_56,_57){
with(_56){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_58,_59){
with(_58){
return YES;
}
})]);
var _5a="CPNinePartImageImageSlicesKey";
var _4=objj_getClass("CPNinePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPNinePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_5b,_5c,_5d){
with(_5b){
_5b=objj_msgSendSuper({receiver:_5b,super_class:objj_getClass("CPObject")},"init");
if(_5b){
_imageSlices=objj_msgSend(_5d,"decodeObjectForKey:",_5a);
}
return _5b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_60,"encodeObject:forKey:",_imageSlices,_5a);
}
})]);
p;13;CPImageView.jI;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;6312;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
var _1=nil;
var _2=3,_3=3,_4=3,_5=5,_6=_4+_5,_7=_2+_3;
var _8=objj_allocateClassPair(CPControl,"CPImageView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_DOMImageElement"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowView"),new objj_ivar("_isEditable"),new objj_ivar("_imageRect")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
}
return _a;
}
}),new objj_method(sel_getUid("image"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"objectValue");
}
}),new objj_method(sel_getUid("setImage:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setObjectValue:",_11);
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"objectValue");
if(_15===_14){
return;
}
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",_14);
var _16=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_15){
objj_msgSend(_16,"removeObserver:name:object:",_12,CPImageDidLoadNotification,_15);
}
var _17=objj_msgSend(_12,"objectValue");
var _18=objj_msgSend(_17,"size");
if(_18&&_18.width===-1&&_18.height===-1){
objj_msgSend(_16,"addObserver:selector:name:object:",_12,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_17);
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_12,"hideOrDisplayContents");
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"hideOrDisplayContents");
objj_msgSend(_19,"setNeedsLayout");
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hasShadow"),function(_1c,_1d){
with(_1c){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_1e,_1f,_20){
with(_1e){
if(_hasShadow==_20){
return;
}
_hasShadow=_20;
if(_hasShadow){
_shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",objj_msgSend(_1e,"bounds"));
objj_msgSend(_1e,"addSubview:",_shadowView);
objj_msgSend(_1e,"setNeedsLayout");
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}else{
objj_msgSend(_shadowView,"removeFromSuperview");
_shadowView=nil;
}
objj_msgSend(_1e,"hideOrDisplayContents");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_21,_22,_23){
with(_21){
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPControl")},"setImageScaling:",_23);
objj_msgSend(_21,"setNeedsLayout");
objj_msgSend(_21,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_24,_25){
with(_24){
if(!objj_msgSend(_24,"image")){
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_26,_27){
with(_26){
return _imageRect;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_28,_29){
with(_28){
if(!objj_msgSend(_28,"image")){
return;
}
var _2a=objj_msgSend(_28,"bounds"),_2b=objj_msgSend(_28,"image"),_2c=objj_msgSend(_28,"currentValueForThemeAttribute:","image-scaling"),x=0,y=0,_2f=(_hasShadow?_7:0),_30=(_hasShadow?_6:0),_31=(_2a.size.width),_32=(_2a.size.height),_33=_31-_2f,_34=_32-_30;
if(_2c===CPScaleToFit){
}else{
var _35=objj_msgSend(_2b,"size");
if(_35.width==-1&&_35.height==-1){
return;
}
if(_2c===CPScaleProportionally){
if(_33>=_35.width&&_34>=_35.height){
_33=_35.width;
_34=_35.height;
}else{
var _36=_35.width/_35.height,_37=_33/_34;
if(_37>_36){
_33=_34*_36;
}else{
_34=_33/_36;
}
}
}else{
_33=_35.width;
_34=_35.height;
}
if(_2c==CPScaleNone){
}
var x=(_31-_33)/2,y=(_32-_34)/2;
}
_imageRect={origin:{x:x,y:y},size:{width:_33,height:_34}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-_2,y:y-_4},size:{width:_33+_2f,height:_34+_30}});
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(objj_msgSend(_38,"nextResponder"),"mouseDown:",_3a);
}
}),new objj_method(sel_getUid("setEditable:"),function(_3b,_3c,_3d){
with(_3b){
if(_isEditable===_3d){
return;
}
_isEditable=_3d;
if(_isEditable){
objj_msgSend(_3b,"registerForDraggedTypes:",[CPImagesPboardType]);
}else{
var _3e=objj_msgSend(_3b,"registeredDraggedTypes");
objj_msgSend(_3b,"unregisterDraggedTypes");
objj_msgSend(_3e,"removeObjectIdenticalTo:",CPImagesPboardType);
objj_msgSend(_3b,"registerForDraggedTypes:",_3e);
}
}
}),new objj_method(sel_getUid("isEditable"),function(_3f,_40){
with(_3f){
return _isEditable;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(objj_msgSend(_43,"draggingPasteboard"),"dataForType:",CPImagesPboardType));
if(objj_msgSend(_44,"count")){
objj_msgSend(_41,"setImage:",_44[0]);
}
}
})]);
var _45="CPImageViewImageKey",_46="CPImageViewImageScalingKey",_47="CPImageViewHasShadowKey",_48="CPImageViewIsEditableKey";
var _8=objj_getClass("CPImageView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImageView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_49,_4a,_4b){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPControl")},"initWithCoder:",_4b);
if(_49){
objj_msgSend(_49,"setHasShadow:",objj_msgSend(_4b,"decodeBoolForKey:",_47));
if(objj_msgSend(_4b,"decodeBoolForKey:",_48)||NO){
objj_msgSend(_49,"setEditable:",YES);
}
objj_msgSend(_49,"setNeedsLayout");
objj_msgSend(_49,"setNeedsDisplay:",YES);
}
return _49;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
if(_shadowView){
var _4f=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_4e);
if(_shadowView){
_subviews=_4f;
}
objj_msgSend(_4e,"encodeBool:forKey:",_hasShadow,_47);
if(_isEditable){
objj_msgSend(_4e,"encodeBool:forKey:",_isEditable,_48);
}
}
})]);
p;8;CPMenu.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;49204;
CPMenuDidAddItemNotification="CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification="CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification="CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification="CPMenuDidEndTrackingNotification";
var _1=19;
var _2=NO,_3="",_4=nil,_5=1,_6=nil,_7=nil;
var _8=objj_allocateClassPair(CPObject,"CPMenu"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_supermenu"),new objj_ivar("_title"),new objj_ivar("_name"),new objj_ivar("_items"),new objj_ivar("_attachedMenu"),new objj_ivar("_autoenablesItems"),new objj_ivar("_showsStateColumn"),new objj_ivar("_delegate"),new objj_ivar("_highlightedIndex"),new objj_ivar("_menuWindow")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("menuBarHeight"),function(_a,_b){
with(_a){
if(_a==objj_msgSend(CPApp,"mainMenu")){
return _1;
}
return 0;
}
}),new objj_method(sel_getUid("initWithTitle:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_title=_e;
_items=[];
_autoenablesItems=YES;
_showsStateColumn=YES;
}
return _c;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithTitle:","");
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_11,_12,_13,_14){
with(_11){
var _15=objj_msgSend(_13,"menu");
if(_15){
if(_15!==_11){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Attempted to insert item into menu that was already in another menu.");
}else{
return;
}
}
objj_msgSend(_13,"setMenu:",_11);
objj_msgSend(_items,"insertObject:atIndex:",_13,_14);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidAddItemNotification,_11,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_14,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"),function(_16,_17,_18,_19,_1a,_1b){
with(_16){
var _1c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_18,_19,_1a);
objj_msgSend(_16,"insertItem:atIndex:",_1c,_1b);
return _1c;
}
}),new objj_method(sel_getUid("addItem:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1d,"insertItem:atIndex:",_1f,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"),function(_20,_21,_22,_23,_24){
with(_20){
return objj_msgSend(_20,"insertItemWithTitle:action:keyEquivalent:atIndex:",_22,_23,_24,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("removeItem:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_27));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_28,_29,_2a){
with(_28){
if(_2a<0||_2a>=_items.length){
return;
}
objj_msgSend(_items[_2a],"setMenu:",nil);
objj_msgSend(_items,"removeObjectAtIndex:",_2a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidRemoveItemNotification,_28,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_2a,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemChanged:"),function(_2b,_2c,_2d){
with(_2b){
if(objj_msgSend(_2d,"menu")!=_2b){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidChangeItemNotification,_2b,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2d),"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemWithTag:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"indexOfItemWithTag:",_30);
if(_31==CPNotFound){
return nil;
}
return _items[_31];
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"indexOfItemWithTitle:",_34);
if(_35==CPNotFound){
return nil;
}
return _items[_35];
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_36,_37,_38){
with(_36){
return objj_msgSend(_items,"objectAtIndex:",_38);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_39,_3a){
with(_39){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("itemArray"),function(_3b,_3c){
with(_3b){
return _items;
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_3f,"menu")!=_3d){
return CPNotFound;
}
return objj_msgSend(_items,"indexOfObjectIdenticalTo:",_3f);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_40,_41,_42){
with(_40){
var _43=0,_44=_items.length;
for(;_43<_44;++_43){
if(objj_msgSend(_items[_43],"title")===_42){
return _43;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_45,_46,_47){
with(_45){
var _48=0,_49=_items.length;
for(;_48<_49;++_48){
if(objj_msgSend(_items[_48],"tag")==_47){
return _48;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var _4e=0,_4f=_items.length;
for(;_4e<_4f;++_4e){
var _50=_items[_4e];
if(objj_msgSend(_50,"target")==_4c&&(!_4d||objj_msgSend(_50,"action")==_4d)){
return _4e;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_51,_52,_53){
with(_51){
var _54=0,_55=_items.length;
for(;_54<_55;++_54){
if(objj_msgSend(objj_msgSend(_items[_54],"representedObject"),"isEqual:",_53)){
return _54;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithSubmenu:"),function(_56,_57,_58){
with(_56){
var _59=0,_5a=_items.length;
for(;_59<_5a;++_59){
if(objj_msgSend(_items[_59],"submenu")==_58){
return _59;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setSubmenu:forItem:"),function(_5b,_5c,_5d,_5e){
with(_5b){
objj_msgSend(_5e,"setTarget:",_5e);
objj_msgSend(_5e,"setAction:",sel_getUid("submenuAction:"));
objj_msgSend(_5e,"setSubmenu:",_5d);
}
}),new objj_method(sel_getUid("submenuAction:"),function(_5f,_60,_61){
with(_5f){
}
}),new objj_method(sel_getUid("attachedMenu"),function(_62,_63){
with(_62){
return _attachedMenu;
}
}),new objj_method(sel_getUid("isAttached"),function(_64,_65){
with(_64){
return _isAttached;
}
}),new objj_method(sel_getUid("locationOfSubmenu:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("supermenu"),function(_69,_6a){
with(_69){
return _supermenu;
}
}),new objj_method(sel_getUid("setSupermenu:"),function(_6b,_6c,_6d){
with(_6b){
_supermenu=_6d;
}
}),new objj_method(sel_getUid("isTornOff"),function(_6e,_6f){
with(_6e){
return !_supermenu||_6e==objj_msgSend(CPApp,"mainMenu");
}
}),new objj_method(sel_getUid("setAutoenablesItems:"),function(_70,_71,_72){
with(_70){
_autoenablesItems=_72;
}
}),new objj_method(sel_getUid("autoenablesItems"),function(_73,_74){
with(_73){
return _autoenablesItems;
}
}),new objj_method(sel_getUid("update"),function(_75,_76){
with(_75){
}
}),new objj_method(sel_getUid("setTitle:"),function(_77,_78,_79){
with(_77){
_title=_79;
}
}),new objj_method(sel_getUid("title"),function(_7a,_7b){
with(_7a){
return _title;
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_7c,_7d,_7e){
with(_7c){
_showsStateColumn=_7e;
}
}),new objj_method(sel_getUid("showsStateColumn"),function(_7f,_80){
with(_7f){
return _showsStateColumn;
}
}),new objj_method(sel_getUid("highlightedItem"),function(_81,_82){
with(_81){
return _highlightedIndex>=0?_items[_highlightedIndex]:nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_83,_84,_85){
with(_83){
_delegate=_85;
}
}),new objj_method(sel_getUid("delegate"),function(_86,_87){
with(_86){
return _delegate;
}
}),new objj_method(sel_getUid("cancelTracking"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_fireCancelTrackingEvent"),_88,nil,0,[CPDefaultRunLoopMode]);
}
}),new objj_method(sel_getUid("_fireCancelTrackingEvent"),function(_8a,_8b){
with(_8a){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPAppKitDefined,{x:0,y:0},0,0,0,0,0,0,0));
}
}),new objj_method(sel_getUid("_setMenuWindow:"),function(_8c,_8d,_8e){
with(_8c){
_menuWindow=_8e;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_8f,_90,_91){
with(_8f){
if(_autoenablesItems){
objj_msgSend(_8f,"update");
}
var _92=0,_93=_items.length,_94=objj_msgSend(_91,"charactersIgnoringModifiers"),_95=objj_msgSend(_91,"modifierFlags");
for(;_92<_93;++_92){
var _96=_items[_92],_97=objj_msgSend(_96,"keyEquivalentModifierMask");
if((_95&(CPShiftKeyMask|CPAlternateKeyMask|CPCommandKeyMask|CPControlKeyMask))==_97&&objj_msgSend(_94,"caseInsensitiveCompare:",objj_msgSend(_96,"keyEquivalent"))==CPOrderedSame){
if(objj_msgSend(_96,"isEnabled")){
objj_msgSend(_8f,"performActionForItemAtIndex:",_92);
}else{
}
return YES;
}
if(objj_msgSend(objj_msgSend(_96,"submenu"),"performKeyEquivalent:",_91)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("performActionForItemAtIndex:"),function(_98,_99,_9a){
with(_98){
var _9b=_items[_9a];
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9b,"action"),objj_msgSend(_9b,"target"),_9b);
}
}),new objj_method(sel_getUid("_itemIsHighlighted:"),function(_9c,_9d,_9e){
with(_9c){
return _items[_highlightedIndex]==_9e;
}
}),new objj_method(sel_getUid("_highlightItemAtIndex:"),function(_9f,_a0,_a1){
with(_9f){
var _a2=_highlightedIndex;
_highlightedIndex=_a1;
if(_a2!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_a2],"_menuItemView"),"highlight:",NO);
}
if(_highlightedIndex!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",YES);
}
}
}),new objj_method(sel_getUid("_setMenuName:"),function(_a3,_a4,_a5){
with(_a3){
if(_name===_a5){
return;
}
_name=_a5;
if(_name==="CPMainMenu"){
objj_msgSend(CPApp,"setMainMenu:",_a3);
}
}
}),new objj_method(sel_getUid("_menuName"),function(_a6,_a7){
with(_a6){
return _name;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_a8,_a9){
with(_a8){
if(_name==="_CPMainMenu"){
objj_msgSend(_a8,"_setMenuName:","CPMainMenu");
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_aa,_ab){
with(_aa){
objj_msgSend(objj_msgSend(_aa,"class"),"setMenuBarAttributes:",objj_msgSend(CPDictionary,"dictionary"));
}
}),new objj_method(sel_getUid("menuBarVisible"),function(_ac,_ad){
with(_ac){
return _2;
}
}),new objj_method(sel_getUid("setMenuBarVisible:"),function(_ae,_af,_b0){
with(_ae){
if(_2==_b0){
return;
}
_2=_b0;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
return;
}
if(_b0){
if(!_7){
_7=objj_msgSend(objj_msgSend(_CPMenuBarWindow,"alloc"),"init");
}
objj_msgSend(_7,"setMenu:",objj_msgSend(CPApp,"mainMenu"));
objj_msgSend(_7,"setTitle:",_3);
objj_msgSend(_7,"setIconImage:",_4);
objj_msgSend(_7,"setIconImageAlphaValue:",_5);
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
objj_msgSend(_7,"orderFront:",_ae);
}else{
objj_msgSend(_7,"orderOut:",_ae);
}
}
}),new objj_method(sel_getUid("setMenuBarTitle:"),function(_b1,_b2,_b3){
with(_b1){
_3=_b3;
objj_msgSend(_7,"setTitle:",_3);
}
}),new objj_method(sel_getUid("menuBarTitle"),function(_b4,_b5){
with(_b4){
return _3;
}
}),new objj_method(sel_getUid("setMenuBarIconImage:"),function(_b6,_b7,_b8){
with(_b6){
_CPMenuBarImage=_b8;
objj_msgSend(_7,"setIconImage:",_b8);
}
}),new objj_method(sel_getUid("menuBarIconImage"),function(_b9,_ba){
with(_b9){
return _CPMenuBarImage;
}
}),new objj_method(sel_getUid("setMenuBarAttributes:"),function(_bb,_bc,_bd){
with(_bb){
if(_6==_bd){
return;
}
_6=objj_msgSend(_bd,"copy");
var _be=objj_msgSend(_bd,"objectForKey:","CPMenuBarTextColor"),_bf=objj_msgSend(_bd,"objectForKey:","CPMenuBarTitleColor"),_c0=objj_msgSend(_bd,"objectForKey:","CPMenuBarTextShadowColor"),_c1=objj_msgSend(_bd,"objectForKey:","CPMenuBarTitleShadowColor"),_c2=objj_msgSend(_bd,"objectForKey:","CPMenuBarHighlightColor"),_c3=objj_msgSend(_bd,"objectForKey:","CPMenuBarHighlightTextColor"),_c4=objj_msgSend(_bd,"objectForKey:","CPMenuBarHighlightTextShadowColor");
if(!_be&&_bf){
objj_msgSend(_6,"setObject:forKey:",_bf,"CPMenuBarTextColor");
}else{
if(_be&&!_bf){
objj_msgSend(_6,"setObject:forKey:",_be,"CPMenuBarTitleColor");
}else{
if(!_be&&!_bf){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTextColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTitleColor");
}
}
}
if(!_c0&&_c1){
objj_msgSend(_6,"setObject:forKey:",_c1,"CPMenuBarTextShadowColor");
}else{
if(_c0&&!_c1){
objj_msgSend(_6,"setObject:forKey:",_c0,"CPMenuBarTitleShadowColor");
}else{
if(!_c0&&!_c1){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTextShadowColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTitleShadowColor");
}
}
}
if(!_c2){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",94/255,130/255,186/255,1),"CPMenuBarHighlightColor");
}
if(!_c3){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarHighlightTextColor");
}
if(!_c4){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"blackColor"),"CPMenuBarHighlightTextShadowColor");
}
if(_7){
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
}
}
}),new objj_method(sel_getUid("menuBarAttributes"),function(_c5,_c6){
with(_c5){
return _6;
}
}),new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"),function(_c7,_c8,_c9){
with(_c7){
_5=_c9;
objj_msgSend(_7,"setIconImageAlphaValue:",_c9);
}
}),new objj_method(sel_getUid("menuBarHeight"),function(_ca,_cb){
with(_ca){
return _1;
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"),function(_cc,_cd,_ce,_cf,_d0){
with(_cc){
objj_msgSend(_cc,"popUpContextMenu:withEvent:forView:withFont:",_ce,_cf,_d0,nil);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"),function(_d1,_d2,_d3,_d4,_d5,_d6){
with(_d1){
objj_msgSend(_d1,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_d3,_d4,_d5,_d6,NO);
}
}),new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"),function(_d7,_d8,_d9,_da,_db,_dc,_dd){
with(_d7){
var _de=objj_msgSend(_d9,"delegate");
if(objj_msgSend(_de,"respondsToSelector:",sel_getUid("menuWillOpen:"))){
objj_msgSend(_de,"menuWillOpen:",_d9);
}
if(!_dc){
_dc=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
var _df=objj_msgSend(_db,"window"),_e0=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_d9,_dc);
objj_msgSend(_e0,"setDelegate:",_d7);
objj_msgSend(_e0,"setBackgroundStyle:",_dd?_CPMenuWindowMenuBarBackgroundStyle:_CPMenuWindowPopUpBackgroundStyle);
objj_msgSend(_e0,"setFrameOrigin:",objj_msgSend(objj_msgSend(_da,"window"),"convertBaseToGlobal:",objj_msgSend(_da,"locationInWindow")));
objj_msgSend(_e0,"orderFront:",_d7);
objj_msgSend(_e0,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_da,_d7,sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"),function(_e1,_e2,_e3,_e4){
with(_e1){
var _e5=objj_msgSend(_e3,"menu");
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_e3);
if(objj_msgSend(_e4,"isEnabled")){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_e4,"action"),objj_msgSend(_e4,"target"),_e4);
}
}
})]);
var _e6="CPMenuTitleKey",_e7="CPMenuNameKey",_e8="CPMenuItemsKey",_e9="CPMenuShowsStateColumnKey";
var _8=objj_getClass("CPMenu");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenu\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_ea,_eb,_ec){
with(_ea){
_ea=objj_msgSendSuper({receiver:_ea,super_class:objj_getClass("CPObject")},"init");
if(_ea){
_title=objj_msgSend(_ec,"decodeObjectForKey:",_e6);
_items=objj_msgSend(_ec,"decodeObjectForKey:",_e8);
objj_msgSend(_ea,"_setMenuName:",objj_msgSend(_ec,"decodeObjectForKey:",_e7));
_showsStateColumn=!objj_msgSend(_ec,"containsValueForKey:",_e9)||objj_msgSend(_ec,"decodeBoolForKey:",_e9);
}
return _ea;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ed,_ee,_ef){
with(_ed){
objj_msgSend(_ef,"encodeObject:forKey:",_title,_e6);
if(_name){
objj_msgSend(_ef,"encodeObject:forKey:",_name,_e7);
}
objj_msgSend(_ef,"encodeObject:forKey:",_items,_e8);
if(!_showsStateColumn){
objj_msgSend(_ef,"encodeBool:forKey:",_showsStateColumn,_e9);
}
}
})]);
var _f0=[],_f1=5,_f2=[],_f3=-1,_f4=1,_f5=0;
_CPMenuWindowMenuBarBackgroundStyle=0;
_CPMenuWindowPopUpBackgroundStyle=1;
_CPMenuWindowAttachedMenuBackgroundStyle=2;
var _f6=500,_f7=5,_f8=1,_f9=1,_fa=5,_fb=16;
var _8=objj_allocateClassPair(CPWindow,"_CPMenuWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuView"),new objj_ivar("_menuClipView"),new objj_ivar("_lastMouseOverMenuView"),new objj_ivar("_moreAboveView"),new objj_ivar("_moreBelowView"),new objj_ivar("_sessionDelegate"),new objj_ivar("_didEndSelector"),new objj_ivar("_startTime"),new objj_ivar("_scrollingState"),new objj_ivar("_lastGlobalLocation"),new objj_ivar("_isShowingTopScrollIndicator"),new objj_ivar("_isShowingBottomScrollIndicator"),new objj_ivar("_trackingCanceled"),new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_fc,_fd){
with(_fc){
_fc=objj_msgSendSuper({receiver:_fc,super_class:objj_getClass("CPWindow")},"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessWindowMask);
if(_fc){
objj_msgSend(_fc,"setLevel:",CPPopUpMenuWindowLevel);
objj_msgSend(_fc,"setHasShadow:",YES);
objj_msgSend(_fc,"setShadowStyle:",CPMenuWindowShadowStyle);
objj_msgSend(_fc,"setAcceptsMouseMovedEvents:",YES);
_unconstrainedFrame=CGRectMakeZero();
var _fe=objj_msgSend(_fc,"contentView");
_menuView=objj_msgSend(objj_msgSend(_CPMenuView,"alloc"),"initWithFrame:",CGRectMakeZero());
_menuClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",CGRectMake(_f8,_f7,0,0));
objj_msgSend(_menuClipView,"setDocumentView:",_menuView);
objj_msgSend(_fe,"addSubview:",_menuClipView);
_moreAboveView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreAboveView,"setImage:",_CPMenuWindowMoreAboveImage);
objj_msgSend(_moreAboveView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreAboveImage,"size"));
objj_msgSend(_fe,"addSubview:",_moreAboveView);
_moreBelowView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreBelowView,"setImage:",_CPMenuWindowMoreBelowImage);
objj_msgSend(_moreBelowView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreBelowImage,"size"));
objj_msgSend(_fe,"addSubview:",_moreBelowView);
objj_msgSend(_fc,"setShadowStyle:",CPWindowShadowStyleMenu);
}
return _fc;
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(_ff,_cmd){
with(_ff){
return _f8;
}
}),new objj_method(sel_getUid("setFont:"),function(self,_cmd,_103){
with(self){
objj_msgSend(_menuView,"setFont:",_103);
}
}),new objj_method(sel_getUid("setBackgroundStyle:"),function(self,_cmd,_106){
with(self){
var _107=_f2[_106];
if(!_107){
var _108=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(self,"class"));
if(_106==_CPMenuWindowPopUpBackgroundStyle){
_107=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}else{
if(_106==_CPMenuWindowMenuBarBackgroundStyle){
_107=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}
}
_f2[_106]=_107;
}
objj_msgSend(self,"setBackgroundColor:",_107);
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_10b){
with(self){
objj_msgSend(_10b,"_setMenuWindow:",self);
objj_msgSend(_menuView,"setMenu:",_10b);
var _10c=objj_msgSend(_menuView,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(_f8+_10c.width+_f9,_f7+_10c.height+_fa));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,0));
objj_msgSend(_menuClipView,"setFrame:",CGRectMake(_f8,_f7,_10c.width,_10c.height));
}
}),new objj_method(sel_getUid("setMinWidth:"),function(self,_cmd,_10f){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(MAX(size.width,_10f),size.height));
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_113){
with(self){
return objj_msgSend(_menuView,"convertRect:toView:",objj_msgSend(_menuView,"rectForItemAtIndex:",_113),nil);
}
}),new objj_method(sel_getUid("orderFront:"),function(self,_cmd,_116){
with(self){
objj_msgSend(self,"constrainToScreen");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"orderFront:",_116);
}
}),new objj_method(sel_getUid("constrainToScreen"),function(self,_cmd){
with(self){
_unconstrainedFrame=CGRectMakeCopy(objj_msgSend(self,"frame"));
var _119=objj_msgSend(CPPlatform,"isBrowser"),_11a=CGRectInset(_119?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5),_11b=CGRectIntersection(_unconstrainedFrame,_11a);
_11b.origin.x=CGRectGetMinX(_unconstrainedFrame);
_11b.size.width=CGRectGetWidth(_unconstrainedFrame);
if(CGRectGetWidth(_11b)>CGRectGetWidth(_11a)){
_11b.size.width=CGRectGetWidth(_11a);
}
if(CGRectGetMaxX(_11b)>CGRectGetMaxX(_11a)){
_11b.origin.x-=CGRectGetMaxX(_11b)-CGRectGetMaxX(_11a);
}
if(CGRectGetMinX(_11b)<CGRectGetMinX(_11a)){
_11b.origin.x=CGRectGetMinX(_11a);
}
var _11c=objj_msgSend(self,"convertBaseToGlobal:",CGPointMake(_f8,_f7));
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"setFrame:",_11b);
var _11d=_11c.y<CGRectGetMinY(_11b)+_f7,_11e=_11c.y+CGRectGetHeight(objj_msgSend(_menuView,"frame"))>CGRectGetMaxY(_11b)-_fa,_11f=_f7,_120=_fa,_121=objj_msgSend(self,"contentView"),_122=objj_msgSend(_121,"bounds");
if(_11d){
_11f+=_fb;
var _123=objj_msgSend(_moreAboveView,"frame");
objj_msgSend(_moreAboveView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_122)-CGRectGetWidth(_123))/2,(_f7+_fb-CGRectGetHeight(_123))/2));
}
objj_msgSend(_moreAboveView,"setHidden:",!_11d);
if(_11e){
_120+=_fb;
objj_msgSend(_moreBelowView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_122)-CGRectGetWidth(objj_msgSend(_moreBelowView,"frame")))/2,CGRectGetHeight(_122)-_fb-_fa));
}
objj_msgSend(_moreBelowView,"setHidden:",!_11e);
var _124=CGRectMake(_f8,_11f,CGRectGetWidth(_11b)-_f8-_f9,CGRectGetHeight(_11b)-_11f-_120);
objj_msgSend(_menuClipView,"setFrame:",_124);
objj_msgSend(_menuView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_124),CGRectGetHeight(objj_msgSend(_menuView,"frame"))));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,objj_msgSend(self,"convertBaseToGlobal:",_124.origin).y-_11c.y));
}
}),new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"),function(self,_cmd,_127,_128,_129){
with(self){
CPApp._activeMenu=objj_msgSend(_menuView,"menu");
_startTime=objj_msgSend(_127,"timestamp");
_scrollingState=_f5;
_trackingCanceled=NO;
_sessionDelegate=_128;
_didEndSelector=_129;
objj_msgSend(self,"trackEvent:",_127);
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_12c){
with(self){
var type=objj_msgSend(_12c,"type"),menu=objj_msgSend(_menuView,"menu");
if(type===CPAppKitDefined){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _12f=objj_msgSend(objj_msgSend(_menuView,"menu"),"highlightedItem");
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
objj_msgSend(self,"orderOut:",self);
var _130=objj_msgSend(menu,"delegate");
if(objj_msgSend(_130,"respondsToSelector:",sel_getUid("menuDidClose:"))){
objj_msgSend(_130,"menuDidClose:",menu);
}
if(_sessionDelegate&&_didEndSelector){
objj_msgSend(_sessionDelegate,_didEndSelector,self,_12f);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPMenuDidEndTrackingNotification,menu);
objj_msgSend(_menuView,"setMenu:",nil);
CPApp._activeMenu=nil;
return;
}
var _131=objj_msgSend(_12c,"window"),_132=_131?objj_msgSend(_131,"convertBaseToGlobal:",objj_msgSend(_12c,"locationInWindow")):objj_msgSend(_12c,"locationInWindow");
if(type===CPPeriodic){
var _133=CGRectInset(objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5);
if(_scrollingState==_f3){
if(CGRectGetMinY(_unconstrainedFrame)<CGRectGetMinY(_133)){
_unconstrainedFrame.origin.y+=10;
}
}else{
if(_scrollingState==_f4){
if(CGRectGetMaxY(_unconstrainedFrame)>CGRectGetHeight(_133)){
_unconstrainedFrame.origin.y-=10;
}
}
}
objj_msgSend(self,"setFrame:",_unconstrainedFrame);
objj_msgSend(self,"constrainToScreen");
_132=_lastGlobalLocation;
}
_lastGlobalLocation=_132;
var _134=objj_msgSend(self,"convertGlobalToBase:",_132),_135=objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",_134,nil)),_136=objj_msgSend(objj_msgSend(menu,"itemAtIndex:",_135),"view");
if(_136){
if(!_lastMouseOverMenuView){
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
}
if(_lastMouseOverMenuView!=_136){
objj_msgSend(_136,"mouseExited:",_12c);
objj_msgSend(_lastMouseOverMenuView,"mouseEntered:",_12c);
_lastMouseOverMenuView=_136;
}
objj_msgSend(self,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",type,_134,objj_msgSend(_12c,"modifierFlags"),objj_msgSend(_12c,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_12c,"clickCount"),objj_msgSend(_12c,"pressure")));
}else{
if(_lastMouseOverMenuView){
objj_msgSend(_lastMouseOverMenuView,"mouseExited:",_12c);
_lastMouseOverMenuView=nil;
}
objj_msgSend(menu,"_highlightItemAtIndex:",objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",objj_msgSend(self,"convertGlobalToBase:",_132),nil)));
if(type==CPMouseMoved||type==CPLeftMouseDragged||type==CPLeftMouseDown){
var _137=objj_msgSend(self,"frame"),_138=_scrollingState;
_scrollingState=_f5;
if(_132.y<CGRectGetMinY(_137)+_f7+_fb){
_scrollingState=_f3;
}else{
if(_132.y>CGRectGetMaxY(_137)-_fa-_fb){
_scrollingState=_f4;
}
}
if(_scrollingState!=_138){
if(_scrollingState==_f5){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}else{
if(_138==_f5){
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.04);
}
}
}
}else{
if(type==CPLeftMouseUp&&(objj_msgSend(_12c,"timestamp")-_startTime>_f6)){
objj_msgSend(menu,"cancelTracking");
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask|CPAppKitDefinedMask,nil,nil,YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("menuWindowWithMenu:font:"),function(self,_cmd,_13b,_13c){
with(self){
var _13d=nil;
if(_f0.length){
_13d=_f0.pop();
}else{
_13d=objj_msgSend(objj_msgSend(_CPMenuWindow,"alloc"),"init");
}
objj_msgSend(_13d,"setFont:",_13c);
objj_msgSend(_13d,"setMenu:",_13b);
return _13d;
}
}),new objj_method(sel_getUid("poolMenuWindow:"),function(self,_cmd,_140){
with(self){
if(!_140||_f0.length>=_f1){
return;
}
_f0.push(_140);
}
}),new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuWindow,"class")){
return;
}
var _143=objj_msgSend(CPBundle,"bundleForClass:",self);
_CPMenuWindowMoreAboveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_143,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreAbove.png"),CGSizeMake(38,18));
_CPMenuWindowMoreBelowImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_143,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreBelow.png"),CGSizeMake(38,18));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPMenuView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuItemViews"),new objj_ivar("_visibleMenuItemInfos"),new objj_ivar("_font")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("setFont:"),function(self,_cmd,_146){
with(self){
_font=_146;
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_149){
with(self){
return objj_msgSend(_menuItemViews[_149==CPNotFound?0:_149],"frame");
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(self,_cmd,_14c){
with(self){
var x=_14c.x,_14e=objj_msgSend(self,"bounds");
if(x<CGRectGetMinX(_14e)||x>CGRectGetMaxX(_14e)){
return CPNotFound;
}
var y=_14c.y,low=0,high=_visibleMenuItemInfos.length-1;
while(low<=high){
var _152=FLOOR(low+(high-low)/2),info=_visibleMenuItemInfos[_152];
frame=objj_msgSend(info.view,"frame");
if(y<CGRectGetMinY(frame)){
high=_152-1;
}else{
if(y>CGRectGetMaxY(frame)){
low=_152+1;
}else{
return info.index;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_156){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView")},"setMenu:",_156);
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
_menuItemViews=[];
_visibleMenuItemInfos=[];
var menu=objj_msgSend(self,"menu");
if(!menu){
return;
}
var _158=objj_msgSend(menu,"itemArray"),_159=0,_15a=objj_msgSend(_158,"count"),_15b=0,y=0,_15d=objj_msgSend(menu,"showsStateColumn");
for(;_159<_15a;++_159){
var item=_158[_159],view=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(view);
if(objj_msgSend(item,"isHidden")){
continue;
}
_visibleMenuItemInfos.push({view:view,index:_159});
objj_msgSend(view,"setFont:",_font);
objj_msgSend(view,"setShowsStateColumn:",_15d);
objj_msgSend(view,"synchronizeWithMenuItem");
objj_msgSend(view,"setFrameOrigin:",CGPointMake(0,y));
objj_msgSend(self,"addSubview:",view);
var size=objj_msgSend(view,"minSize"),_161=size.width;
if(_15b<_161){
_15b=_161;
}
y+=size.height;
}
for(_159=0;_159<_15a;++_159){
var view=_menuItemViews[_159];
objj_msgSend(view,"setFrameSize:",CGSizeMake(_15b,CGRectGetHeight(objj_msgSend(view,"frame"))));
}
objj_msgSend(self,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setFrameSize:",CGSizeMake(_15b,y));
objj_msgSend(self,"setAutoresizesSubviews:",YES);
}
})]);
var _1=29,_162=10,_163=10,_164=10;
var _165=nil,_166=nil;
var _8=objj_allocateClassPair(CPPanel,"_CPMenuBarWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menu"),new objj_ivar("_highlightView"),new objj_ivar("_menuItemViews"),new objj_ivar("_trackingMenuItem"),new objj_ivar("_iconImageView"),new objj_ivar("_titleField"),new objj_ivar("_textColor"),new objj_ivar("_titleColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_titleShadowColor"),new objj_ivar("_highlightColor"),new objj_ivar("_highlightTextColor"),new objj_ivar("_highlightTextShadowColor")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(self,_cmd){
with(self){
var _169=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds");
_169.size.height=_1;
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",_169,CPBorderlessWindowMask);
if(self){
objj_msgSend(self,"setLevel:",-1);
objj_msgSend(self,"setAutoresizingMask:",CPWindowWidthSizable);
var _16a=objj_msgSend(self,"contentView");
objj_msgSend(_16a,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setBecomesKeyOnlyIfNeeded:",YES);
_iconImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_16a,"addSubview:",_iconImageView);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_16a,"addSubview:",_titleField);
}
return self;
}
}),new objj_method(sel_getUid("setTitle:"),function(self,_cmd,_16d){
with(self){
objj_msgSend(_titleField,"setStringValue:",_16d);
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImage:"),function(self,_cmd,_170){
with(self){
objj_msgSend(_iconImageView,"setImage:",_170);
objj_msgSend(_iconImageView,"setHidden:",_170==nil);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImageAlphaValue:"),function(self,_cmd,_173){
with(self){
objj_msgSend(_iconImageView,"setAlphaValue:",_173);
}
}),new objj_method(sel_getUid("setColor:"),function(self,_cmd,_176){
with(self){
if(!_176){
if(!_165){
_165=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuBarWindow,"class")),"pathForResource:","_CPMenuBarWindow/_CPMenuBarWindowBackground.png"),CGSizeMake(1,18)));
}
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_165);
}else{
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_176);
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(self,_cmd,_179){
with(self){
if(_textColor==_179){
return;
}
_textColor=_179;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextColor:"),_textColor);
}
}),new objj_method(sel_getUid("setTitleColor:"),function(self,_cmd,_17c){
with(self){
if(_titleColor==_17c){
return;
}
_titleColor=_17c;
objj_msgSend(_titleField,"setTextColor:",_17c?_17c:objj_msgSend(CPColor,"blackColor"));
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(self,_cmd,_17f){
with(self){
if(_textShadowColor==_17f){
return;
}
_textShadowColor=_17f;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextShadowColor:"),_textShadowColor);
}
}),new objj_method(sel_getUid("setTitleShadowColor:"),function(self,_cmd,_182){
with(self){
if(_titleShadowColor==_182){
return;
}
_titleShadowColor=_182;
objj_msgSend(_titleField,"setTextShadowColor:",_182?_182:objj_msgSend(CPColor,"whiteColor"));
}
}),new objj_method(sel_getUid("setHighlightColor:"),function(self,_cmd,_185){
with(self){
if(_highlightColor==_185){
return;
}
_highlightColor=_185;
}
}),new objj_method(sel_getUid("setHighlightTextColor:"),function(self,_cmd,_188){
with(self){
if(_highlightTextColor==_188){
return;
}
_highlightTextColor=_188;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateColor:"),_highlightTextColor);
}
}),new objj_method(sel_getUid("setHighlightTextShadowColor:"),function(self,_cmd,_18b){
with(self){
if(_highlightTextShadowColor==_18b){
return;
}
_highlightTextShadowColor=_18b;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateShadowColor:"),_highlightTextShadowColor);
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_18e){
with(self){
if(_menu==_18e){
return;
}
var _18f=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_18f,"removeObserver:name:object:",self,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_18f,"removeObserver:name:object:",self,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_18f,"removeObserver:name:object:",self,CPMenuDidRemoveItemNotification,_menu);
var _190=objj_msgSend(_menu,"itemArray"),_191=_190.length;
while(_191--){
objj_msgSend(objj_msgSend(_190[_191],"_menuItemView"),"removeFromSuperview");
}
}
_menu=_18e;
if(_menu){
objj_msgSend(_18f,"addObserver:selector:name:object:",self,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_18f,"addObserver:selector:name:object:",self,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_18f,"addObserver:selector:name:object:",self,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
_menuItemViews=[];
var _192=objj_msgSend(self,"contentView"),_190=objj_msgSend(_menu,"itemArray"),_191=_190.length;
for(index=0;index<_191;++index){
var item=_190[index],_194=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(_194);
objj_msgSend(_194,"setShowsStateColumn:",NO);
objj_msgSend(_194,"setBelongsToMenuBar:",YES);
objj_msgSend(_194,"setFont:",_166);
objj_msgSend(_194,"setTextColor:",_textColor);
objj_msgSend(_194,"setHidden:",objj_msgSend(item,"isHidden"));
objj_msgSend(_194,"synchronizeWithMenuItem");
objj_msgSend(_192,"addSubview:",_194);
}
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(self,_cmd,_197){
with(self){
var _198=objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(objj_msgSend(_197,"userInfo"),"objectForKey:","CPMenuItemIndex")),_199=objj_msgSend(_198,"_menuItemView");
objj_msgSend(_199,"setHidden:",objj_msgSend(_198,"isHidden"));
objj_msgSend(_199,"synchronizeWithMenuItem");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(self,_cmd,_19c){
with(self){
var _19d=objj_msgSend(objj_msgSend(_19c,"userInfo"),"objectForKey:","CPMenuItemIndex"),_19e=objj_msgSend(_menu,"itemAtIndex:",_19d),_19f=objj_msgSend(_19e,"_menuItemView");
objj_msgSend(_menuItemViews,"insertObject:atIndex:",_19f,_19d);
objj_msgSend(_19f,"setShowsStateColumn:",NO);
objj_msgSend(_19f,"setBelongsToMenuBar:",YES);
objj_msgSend(_19f,"setFont:",_166);
objj_msgSend(_19f,"setTextColor:",_textColor);
objj_msgSend(_19f,"setHidden:",objj_msgSend(_19e,"isHidden"));
objj_msgSend(_19f,"synchronizeWithMenuItem");
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:",_19f);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(self,_cmd,_1a2){
with(self){
var _1a3=objj_msgSend(objj_msgSend(_1a2,"userInfo"),"objectForKey:","CPMenuItemIndex"),_1a4=objj_msgSend(_menuItemViews,"objectAtIndex:",_1a3);
objj_msgSend(_menuItemViews,"removeObjectAtIndex:",_1a3);
objj_msgSend(_1a4,"removeFromSuperview");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("frameForMenuItem:"),function(self,_cmd,_1a7){
with(self){
var _1a8=objj_msgSend(objj_msgSend(_1a7,"_menuItemView"),"frame");
_1a8.origin.x-=5;
_1a8.origin.y=0;
_1a8.size.width+=10;
_1a8.size.height=_1;
return _1a8;
}
}),new objj_method(sel_getUid("menuItemAtPoint:"),function(self,_cmd,_1ab){
with(self){
var _1ac=objj_msgSend(_menu,"itemArray"),_1ad=_1ac.length;
while(_1ad--){
var item=_1ac[_1ad];
if(objj_msgSend(item,"isHidden")||objj_msgSend(item,"isSeparatorItem")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(self,"frameForMenuItem:",item),_1ab)){
return item;
}
}
return nil;
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_cmd,_1b1){
with(self){
_trackingMenuItem=objj_msgSend(self,"menuItemAtPoint:",objj_msgSend(_1b1,"locationInWindow"));
if(!objj_msgSend(_trackingMenuItem,"isEnabled")){
return;
}
if(objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"eventOnSubmenu:",_1b1)){
return objj_msgSend(self,"showMenu:",_1b1);
}
if(objj_msgSend(_trackingMenuItem,"isEnabled")){
objj_msgSend(self,"trackEvent:",_1b1);
}
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_1b4){
with(self){
var type=objj_msgSend(_1b4,"type");
if(type===CPPeriodic){
return objj_msgSend(self,"showMenu:",_1b4);
}
var _1b6=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_1b7=objj_msgSend(_trackingMenuItem,"_menuItemView"),_1b8=CGRectContainsPoint(_1b6,objj_msgSend(_1b4,"locationInWindow"));
if(type==CPLeftMouseDown){
if(objj_msgSend(_trackingMenuItem,"submenu")!=nil){
var _1b9=objj_msgSend(_trackingMenuItem,"action");
if(!_1b9||_1b9===sel_getUid("submenuAction:")){
return objj_msgSend(self,"showMenu:",_1b4);
}
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.5);
}
objj_msgSend(_1b7,"highlight:",_1b8);
}else{
if(type==CPLeftMouseDragged){
if(!_1b8&&objj_msgSend(_trackingMenuItem,"submenu")){
return objj_msgSend(self,"showMenu:",_1b4);
}
objj_msgSend(_1b7,"highlight:",_1b8);
}else{
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(_1b7,"highlight:",NO);
if(_1b8){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_trackingMenuItem,"action"),objj_msgSend(_trackingMenuItem,"target"),_trackingMenuItem);
}
return;
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("showMenu:"),function(self,_cmd,_1bc){
with(self){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _1bd=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_1be=objj_msgSend(_trackingMenuItem,"_menuItemView");
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_1bd);
objj_msgSend(_highlightView,"setBackgroundColor:",_highlightColor?_highlightColor:objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",95/255,131/255,185/255,1));
}else{
objj_msgSend(_highlightView,"setFrame:",_1bd);
}
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_1be);
objj_msgSend(_1be,"activate:",YES);
var _1bf=objj_msgSend(_trackingMenuItem,"submenu");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("menuDidEndTracking:"),CPMenuDidEndTrackingNotification,_1bf);
objj_msgSend(CPMenu,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_1bf,objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,CGPointMake(CGRectGetMinX(_1bd),CGRectGetMaxY(_1bd)),objj_msgSend(_1bc,"modifierFlags"),objj_msgSend(_1bc,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_1bc,"clickCount"),objj_msgSend(_1bc,"pressure")),objj_msgSend(self,"contentView"),nil,YES);
}
}),new objj_method(sel_getUid("menuDidEndTracking:"),function(self,_cmd,_1c2){
with(self){
objj_msgSend(_highlightView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"activate:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",self,CPMenuDidEndTrackingNotification,objj_msgSend(_1c2,"object"));
}
}),new objj_method(sel_getUid("tile"),function(self,_cmd){
with(self){
var _1c5=objj_msgSend(_menu,"itemArray"),_1c6=0,_1c7=_1c5.length,x=_163,y=0,_1ca=YES;
for(;_1c6<_1c7;++_1c6){
var item=_1c5[_1c6];
if(objj_msgSend(item,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(self,"frame"))-_164;
_1ca=NO;
continue;
}
if(objj_msgSend(item,"isHidden")){
continue;
}
var _1cc=objj_msgSend(item,"_menuItemView"),_1cd=objj_msgSend(_1cc,"frame");
if(_1ca){
objj_msgSend(_1cc,"setFrameOrigin:",CGPointMake(x,(_1-1-CGRectGetHeight(_1cd))/2));
x+=CGRectGetWidth(objj_msgSend(_1cc,"frame"))+_162;
}else{
objj_msgSend(_1cc,"setFrameOrigin:",CGPointMake(x-CGRectGetWidth(_1cd),(_1-1-CGRectGetHeight(_1cd))/2));
x=CGRectGetMinX(objj_msgSend(_1cc,"frame"))-_162;
}
}
var _1ce=objj_msgSend(objj_msgSend(self,"contentView"),"bounds"),_1cf=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1ce)-CGRectGetWidth(_1cf))/2,(CGRectGetHeight(_1ce)-CGRectGetHeight(_1cf))/2));
}else{
var _1d0=objj_msgSend(_iconImageView,"frame"),_1d1=CGRectGetWidth(_1d0),_1d2=_1d1+CGRectGetWidth(_1cf);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1ce)-_1d2)/2,(CGRectGetHeight(_1ce)-CGRectGetHeight(_1d0))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1ce)-_1d2)/2+_1d1,(CGRectGetHeight(_1ce)-CGRectGetHeight(_1cf))/2));
}
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(self,_cmd,_1d5,_1d6,_1d7){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"setFrame:display:animate:",_1d5,_1d6,_1d7);
if(!(size.width==_1d5.size.width&&size.height==_1d5.size.height)){
objj_msgSend(self,"tile");
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuBarWindow,"class")){
return;
}
var _1db=objj_msgSend(CPBundle,"bundleForClass:",self);
_166=objj_msgSend(CPFont,"systemFontOfSize:",11);
}
})]);
p;12;CPMenuItem.jI;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;23152;
var _1=objj_allocateClassPair(CPObject,"CPMenuItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isSeparator"),new objj_ivar("_title"),new objj_ivar("_font"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_isHidden"),new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_onStateImage"),new objj_ivar("_offStateImage"),new objj_ivar("_mixedStateImage"),new objj_ivar("_submenu"),new objj_ivar("_menu"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask"),new objj_ivar("_mnemonicLocation"),new objj_ivar("_isAlternate"),new objj_ivar("_indentationLevel"),new objj_ivar("_toolTip"),new objj_ivar("_representedObject"),new objj_ivar("_view"),new objj_ivar("_menuItemView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithTitle:action:keyEquivalent:","",nil,nil);
}
}),new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_isSeparator=NO;
_title=_7;
_action=_8;
_isEnabled=YES;
_tag=0;
_state=CPOffState;
_keyEquivalent=_9||"";
_keyEquivalentModifierMask=CPPlatformActionKeyMask;
_mnemonicLocation=CPNotFound;
}
return _5;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a,_b,_c){
with(_a){
if(objj_msgSend(_menu,"autoenablesItems")){
return;
}
_isEnabled=_c;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_a);
}
}),new objj_method(sel_getUid("isEnabled"),function(_d,_e){
with(_d){
return _isEnabled;
}
}),new objj_method(sel_getUid("setHidden:"),function(_f,_10,_11){
with(_f){
if(_isHidden==_11){
return;
}
_isHidden=_11;
objj_msgSend(_menu,"itemChanged:",_f);
}
}),new objj_method(sel_getUid("isHidden"),function(_12,_13){
with(_12){
return _isHidden;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_14,_15){
with(_14){
if(_isHidden){
return YES;
}
var _16=objj_msgSend(_menu,"supermenu");
if(objj_msgSend(objj_msgSend(_16,"itemAtIndex:",objj_msgSend(_16,"indexOfItemWithSubmenu:",_menu)),"isHiddenOrHasHiddenAncestor")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("setTarget:"),function(_17,_18,_19){
with(_17){
_target=_19;
}
}),new objj_method(sel_getUid("target"),function(_1a,_1b){
with(_1a){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1c,_1d,_1e){
with(_1c){
_action=_1e;
}
}),new objj_method(sel_getUid("action"),function(_1f,_20){
with(_1f){
return _action;
}
}),new objj_method(sel_getUid("setTitle:"),function(_21,_22,_23){
with(_21){
_mnemonicLocation=CPNotFound;
if(_title==_23){
return;
}
_title=_23;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_21);
}
}),new objj_method(sel_getUid("title"),function(_24,_25){
with(_24){
return _title;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_26,_27,_28){
with(_26){
}
}),new objj_method(sel_getUid("setFont:"),function(_29,_2a,_2b){
with(_29){
if(_font==_2b){
return;
}
_font=_2b;
objj_msgSend(_menu,"itemChanged:",_29);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("font"),function(_2c,_2d){
with(_2c){
return _font;
}
}),new objj_method(sel_getUid("setTag:"),function(_2e,_2f,_30){
with(_2e){
_tag=_30;
}
}),new objj_method(sel_getUid("tag"),function(_31,_32){
with(_31){
return _tag;
}
}),new objj_method(sel_getUid("setState:"),function(_33,_34,_35){
with(_33){
if(_state==_35){
return;
}
_state=_35;
objj_msgSend(_menu,"itemChanged:",_33);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("state"),function(_36,_37){
with(_36){
return _state;
}
}),new objj_method(sel_getUid("setImage:"),function(_38,_39,_3a){
with(_38){
if(_image==_3a){
return;
}
_image=_3a;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_38);
}
}),new objj_method(sel_getUid("image"),function(_3b,_3c){
with(_3b){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_3d,_3e,_3f){
with(_3d){
_alternateImage=_3f;
}
}),new objj_method(sel_getUid("alternateImage"),function(_40,_41){
with(_40){
return _alternateImage;
}
}),new objj_method(sel_getUid("setOnStateImage:"),function(_42,_43,_44){
with(_42){
if(_onStateImage==_44){
return;
}
_onStateImage=_44;
objj_msgSend(_menu,"itemChanged:",_42);
}
}),new objj_method(sel_getUid("onStateImage"),function(_45,_46){
with(_45){
return _onStateImage;
}
}),new objj_method(sel_getUid("setOffStateImage:"),function(_47,_48,_49){
with(_47){
if(_offStateImage==_49){
return;
}
_offStateImage=_49;
objj_msgSend(_menu,"itemChanged:",_47);
}
}),new objj_method(sel_getUid("offStateImage"),function(_4a,_4b){
with(_4a){
return _offStateImage;
}
}),new objj_method(sel_getUid("setMixedStateImage:"),function(_4c,_4d,_4e){
with(_4c){
if(_mixedStateImage==_4e){
return;
}
_mixedStateImage=_4e;
objj_msgSend(_menu,"itemChanged:",_4c);
}
}),new objj_method(sel_getUid("mixedStateImage"),function(_4f,_50){
with(_4f){
return _mixedStateImage;
}
}),new objj_method(sel_getUid("setSubmenu:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_submenu,"supermenu");
if(_54==_51){
return;
}
if(_54){
return alert("bad");
}
objj_msgSend(_submenu,"setSupermenu:",_menu);
_submenu=_53;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_51);
}
}),new objj_method(sel_getUid("submenu"),function(_55,_56){
with(_55){
return _submenu;
}
}),new objj_method(sel_getUid("hasSubmenu"),function(_57,_58){
with(_57){
return _submenu?YES:NO;
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_59,_5a){
with(_59){
return _isSeparator;
}
}),new objj_method(sel_getUid("setMenu:"),function(_5b,_5c,_5d){
with(_5b){
_menu=_5d;
}
}),new objj_method(sel_getUid("menu"),function(_5e,_5f){
with(_5e){
return _menu;
}
}),new objj_method(sel_getUid("setKeyEquivalent:"),function(_60,_61,_62){
with(_60){
_keyEquivalent=_62||"";
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_63,_64){
with(_63){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("setKeyEquivalentModifierMask:"),function(_65,_66,_67){
with(_65){
_keyEquivalentModifierMask=_67;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_68,_69){
with(_68){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("setMnemonicLocation:"),function(_6a,_6b,_6c){
with(_6a){
_mnemonicLocation=_6c;
}
}),new objj_method(sel_getUid("mnemonicLocation"),function(_6d,_6e){
with(_6d){
return _mnemonicLocation;
}
}),new objj_method(sel_getUid("setTitleWithMnemonicLocation:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_71,"rangeOfString:","&").location;
if(_72==CPNotFound){
objj_msgSend(_6f,"setTitle:",_71);
}else{
objj_msgSend(_6f,"setTitle:",objj_msgSend(_71,"substringToIndex:",_72)+objj_msgSend(_71,"substringFromIndex:",_72+1));
objj_msgSend(_6f,"setMnemonicLocation:",_72);
}
}
}),new objj_method(sel_getUid("mnemonic"),function(_73,_74){
with(_73){
return _mnemonicLocation==CPNotFound?"":objj_msgSend(_title,"characterAtIndex:",_mnemonicLocation);
}
}),new objj_method(sel_getUid("setAlternate:"),function(_75,_76,_77){
with(_75){
_isAlternate=_77;
}
}),new objj_method(sel_getUid("isAlternate"),function(_78,_79){
with(_78){
return _isAlternate;
}
}),new objj_method(sel_getUid("setIndentationLevel:"),function(_7a,_7b,_7c){
with(_7a){
if(_7c<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"setIndentationLevel: argument must be greater than 0.");
}
_indentationLevel=MIN(15,_7c);
}
}),new objj_method(sel_getUid("indentationLevel"),function(_7d,_7e){
with(_7d){
return _indentationLevel;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_7f,_80,_81){
with(_7f){
_toolTip=_81;
}
}),new objj_method(sel_getUid("toolTip"),function(_82,_83){
with(_82){
return _toolTip;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_84,_85,_86){
with(_84){
_representedObject=_86;
}
}),new objj_method(sel_getUid("representedObject"),function(_87,_88){
with(_87){
return _representedObject;
}
}),new objj_method(sel_getUid("setView:"),function(_89,_8a,_8b){
with(_89){
if(_view===_8b){
return;
}
_view=_8b;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_89);
}
}),new objj_method(sel_getUid("view"),function(_8c,_8d){
with(_8c){
return _view;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_8e,_8f){
with(_8e){
return objj_msgSend(objj_msgSend(_8e,"menu"),"highlightedItem")==_8e;
}
}),new objj_method(sel_getUid("_menuItemView"),function(_90,_91){
with(_90){
if(!_menuItemView){
_menuItemView=objj_msgSend(objj_msgSend(_CPMenuItemView,"alloc"),"initWithFrame:forMenuItem:",CGRectMakeZero(),_90);
}
return _menuItemView;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("separatorItem"),function(_92,_93){
with(_92){
var _94=objj_msgSend(objj_msgSend(_92,"alloc"),"initWithTitle:action:keyEquivalent:","",nil,nil);
_94._isSeparator=YES;
return _94;
}
})]);
var _95="CPMenuItemIsSeparatorKey",_96="CPMenuItemTitleKey",_97="CPMenuItemTargetKey",_98="CPMenuItemActionKey",_99="CPMenuItemIsEnabledKey",_9a="CPMenuItemIsHiddenKey",_9b="CPMenuItemTagKey",_9c="CPMenuItemStateKey",_9d="CPMenuItemImageKey",_9e="CPMenuItemAlternateImageKey",_9f="CPMenuItemSubmenuKey",_a0="CPMenuItemMenuKey",_a1="CPMenuItemRepresentedObjectKey",_a2="CPMenuItemViewKey";
var _1=objj_getClass("CPMenuItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenuItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a3,_a4,_a5){
with(_a3){
_a3=objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("CPObject")},"init");
if(_a3){
_isSeparator=objj_msgSend(_a5,"containsValueForKey:",_95)&&objj_msgSend(_a5,"decodeBoolForKey:",_95);
_title=objj_msgSend(_a5,"decodeObjectForKey:",_96);
_target=objj_msgSend(_a5,"decodeObjectForKey:",_97);
_action=objj_msgSend(_a5,"decodeObjectForKey:",_98);
_isEnabled=objj_msgSend(_a5,"containsValueForKey:",(_99))?objj_msgSend(_a5,"decodeObjectForKey:",(_99)):(YES);
_isHidden=objj_msgSend(_a5,"containsValueForKey:",(_9a))?objj_msgSend(_a5,"decodeObjectForKey:",(_9a)):(NO);
_tag=objj_msgSend(_a5,"containsValueForKey:",(_9b))?objj_msgSend(_a5,"decodeObjectForKey:",(_9b)):(0);
_state=objj_msgSend(_a5,"containsValueForKey:",(_9c))?objj_msgSend(_a5,"decodeObjectForKey:",(_9c)):(CPOffState);
_image=objj_msgSend(_a5,"containsValueForKey:",(_9d))?objj_msgSend(_a5,"decodeObjectForKey:",(_9d)):(nil);
_alternateImage=objj_msgSend(_a5,"containsValueForKey:",(_9e))?objj_msgSend(_a5,"decodeObjectForKey:",(_9e)):(nil);
_submenu=objj_msgSend(_a5,"containsValueForKey:",(_9f))?objj_msgSend(_a5,"decodeObjectForKey:",(_9f)):(nil);
_menu=objj_msgSend(_a5,"containsValueForKey:",(_a0))?objj_msgSend(_a5,"decodeObjectForKey:",(_a0)):(nil);
_representedObject=objj_msgSend(_a5,"containsValueForKey:",(_a1))?objj_msgSend(_a5,"decodeObjectForKey:",(_a1)):(nil);
_view=objj_msgSend(_a5,"containsValueForKey:",(_a2))?objj_msgSend(_a5,"decodeObjectForKey:",(_a2)):(nil);
}
return _a3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
if(_isSeparator){
objj_msgSend(_a8,"encodeBool:forKey:",_isSeparator,_95);
}
objj_msgSend(_a8,"encodeObject:forKey:",_title,_96);
objj_msgSend(_a8,"encodeObject:forKey:",_target,_97);
objj_msgSend(_a8,"encodeObject:forKey:",_action,_98);
if((_isEnabled)!==(YES)){
objj_msgSend(_a8,"encodeObject:forKey:",(_isEnabled),(_99));
}
if((_isHidden)!==(NO)){
objj_msgSend(_a8,"encodeObject:forKey:",(_isHidden),(_9a));
}
if((_tag)!==(0)){
objj_msgSend(_a8,"encodeObject:forKey:",(_tag),(_9b));
}
if((_state)!==(CPOffState)){
objj_msgSend(_a8,"encodeObject:forKey:",(_state),(_9c));
}
if((_image)!==(nil)){
objj_msgSend(_a8,"encodeObject:forKey:",(_image),(_9d));
}
if((_alternateImage)!==(nil)){
objj_msgSend(_a8,"encodeObject:forKey:",(_alternateImage),(_9e));
}
if((_submenu)!==(nil)){
objj_msgSend(_a8,"encodeObject:forKey:",(_submenu),(_9f));
}
if((_menu)!==(nil)){
objj_msgSend(_a8,"encodeObject:forKey:",(_menu),(_a0));
}
if((_representedObject)!==(nil)){
objj_msgSend(_a8,"encodeObject:forKey:",(_representedObject),(_a1));
}
if((_view)!==(nil)){
objj_msgSend(_a8,"encodeObject:forKey:",(_view),(_a2));
}
}
})]);
var _a9=3,_aa=16,_ab=14,_ac=17,_ad=4;
var _ae=nil,_af=nil,_b0=[],_b1=[];
var _1=objj_allocateClassPair(CPView,"_CPMenuItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menuItem"),new objj_ivar("_font"),new objj_ivar("_textColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_activateColor"),new objj_ivar("_activateShadowColor"),new objj_ivar("_minSize"),new objj_ivar("_isDirty"),new objj_ivar("_showsStateColumn"),new objj_ivar("_belongsToMenuBar"),new objj_ivar("_stateView"),new objj_ivar("_imageAndTextView"),new objj_ivar("_submenuView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:forMenuItem:"),function(_b2,_b3,_b4,_b5){
with(_b2){
_b2=objj_msgSendSuper({receiver:_b2,super_class:objj_getClass("CPView")},"initWithFrame:",_b4);
if(_b2){
_menuItem=_b5;
_showsStateColumn=YES;
_isDirty=YES;
objj_msgSend(_b2,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_b2,"synchronizeWithMenuItem");
}
return _b2;
}
}),new objj_method(sel_getUid("minSize"),function(_b6,_b7){
with(_b6){
return _minSize;
}
}),new objj_method(sel_getUid("setDirty"),function(_b8,_b9){
with(_b8){
_isDirty=YES;
}
}),new objj_method(sel_getUid("synchronizeWithMenuItem"),function(_ba,_bb){
with(_ba){
if(!_isDirty){
return;
}
_isDirty=NO;
var _bc=objj_msgSend(_menuItem,"view");
if(objj_msgSend(_menuItem,"isSeparatorItem")){
var _bd=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,5,10,1));
_bc=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,10));
objj_msgSend(_bc,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_bd,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_bd,"setBackgroundColor:",objj_msgSend(CPColor,"lightGrayColor"));
objj_msgSend(_bc,"addSubview:",_bd);
}
if(_bc){
objj_msgSend(_imageAndTextView,"removeFromSuperview");
_imageAndTextView=nil;
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
objj_msgSend(_submenuView,"removeFromSuperview");
_submenuView=nil;
_minSize=objj_msgSend(_bc,"frame").size;
objj_msgSend(_ba,"setFrameSize:",_minSize);
objj_msgSend(_ba,"addSubview:",_bc);
return;
}
var x=_belongsToMenuBar?0:(_a9+objj_msgSend(_menuItem,"indentationLevel")*_ac);
if(_showsStateColumn){
if(!_stateView){
_stateView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(x,(CGRectGetHeight(objj_msgSend(_ba,"frame"))-_ab)/2,_ab,_ab));
objj_msgSend(_stateView,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_ba,"addSubview:",_stateView);
}
var _bf=objj_msgSend(_menuItem,"state");
switch(_bf){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_b0[_bf]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
x+=_ab;
}else{
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
}
if(!_imageAndTextView){
_imageAndTextView=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,0));
objj_msgSend(_imageAndTextView,"setImagePosition:",CPImageLeft);
objj_msgSend(_imageAndTextView,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_ba,"addSubview:",_imageAndTextView);
}
var _c0=objj_msgSend(_menuItem,"font");
if(!_c0){
_c0=_font;
}
objj_msgSend(_imageAndTextView,"setFont:",_c0);
objj_msgSend(_imageAndTextView,"setVerticalAlignment:",CPCenterVerticalTextAlignment);
objj_msgSend(_imageAndTextView,"setImage:",objj_msgSend(_menuItem,"image"));
objj_msgSend(_imageAndTextView,"setText:",objj_msgSend(_menuItem,"title"));
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_ba,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_ba,"textShadowColor"));
objj_msgSend(_imageAndTextView,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_imageAndTextView,"setFrameOrigin:",CGPointMake(x,_ad));
objj_msgSend(_imageAndTextView,"sizeToFit");
var _c1=objj_msgSend(_imageAndTextView,"frame");
_c1.size.height+=2*_ad;
x+=CGRectGetWidth(_c1);
if(objj_msgSend(_menuItem,"hasSubmenu")){
x+=3;
if(!_submenuView){
_submenuView=objj_msgSend(objj_msgSend(_CPMenuItemArrowView,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10));
objj_msgSend(_ba,"addSubview:",_submenuView);
}
objj_msgSend(_submenuView,"setHidden:",NO);
objj_msgSend(_submenuView,"setColor:",_belongsToMenuBar?objj_msgSend(_ba,"textColor"):nil);
objj_msgSend(_submenuView,"setFrameOrigin:",CGPointMake(x,(CGRectGetHeight(_c1)-10)/2));
x+=10;
}else{
objj_msgSend(_submenuView,"setHidden:",YES);
}
_minSize=CGSizeMake(x+(_belongsToMenuBar?0:_aa)+3,CGRectGetHeight(_c1));
objj_msgSend(_ba,"setFrameSize:",_minSize);
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(_c2,_c3){
with(_c2){
return _a9+(objj_msgSend(objj_msgSend(_menuItem,"menu"),"showsStateColumn")?_ab:0);
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_c4,_c5,_c6){
with(_c4){
_showsStateColumn=_c6;
}
}),new objj_method(sel_getUid("setBelongsToMenuBar:"),function(_c7,_c8,_c9){
with(_c7){
_belongsToMenuBar=_c9;
}
}),new objj_method(sel_getUid("highlight:"),function(_ca,_cb,_cc){
with(_ca){
if(_belongsToMenuBar){
objj_msgSend(_imageAndTextView,"setImage:",_cc?objj_msgSend(_menuItem,"alternateImage"):objj_msgSend(_menuItem,"image"));
}else{
if(objj_msgSend(_menuItem,"isEnabled")){
if(_cc){
objj_msgSend(_ca,"setBackgroundColor:",_ae);
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",_af);
}else{
objj_msgSend(_ca,"setBackgroundColor:",nil);
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_ca,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_ca,"textShadowColor"));
}
var _cd=objj_msgSend(_menuItem,"state");
switch(_cd){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_cc?_b1[_cd]:_b0[_cd]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
}
}
}
}),new objj_method(sel_getUid("activate:"),function(_ce,_cf,_d0){
with(_ce){
objj_msgSend(_imageAndTextView,"setImage:",objj_msgSend(_menuItem,"image"));
if(_d0){
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_ce,"activateColor")||objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_ce,"activateShadowColor")||objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_ce,"activateColor")||objj_msgSend(CPColor,"whiteColor"));
}else{
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_ce,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_ce,"textShadowColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_ce,"textColor"));
}
}
}),new objj_method(sel_getUid("eventOnSubmenu:"),function(_d1,_d2,_d3){
with(_d1){
if(!objj_msgSend(_menuItem,"hasSubmenu")){
return NO;
}
return CGRectContainsPoint(objj_msgSend(_submenuView,"frame"),objj_msgSend(_d1,"convertPoint:fromView:",objj_msgSend(_d3,"locationInWindow"),nil));
}
}),new objj_method(sel_getUid("isHidden"),function(_d4,_d5){
with(_d4){
return objj_msgSend(_menuItem,"isHidden");
}
}),new objj_method(sel_getUid("menuItem"),function(_d6,_d7){
with(_d6){
return _menuItem;
}
}),new objj_method(sel_getUid("setFont:"),function(_d8,_d9,_da){
with(_d8){
if(_font==_da){
return;
}
_font=_da;
objj_msgSend(_d8,"setDirty");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_db,_dc,_dd){
with(_db){
if(_textColor==_dd){
return;
}
_textColor=_dd;
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_db,"textColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_db,"textColor"));
}
}),new objj_method(sel_getUid("textColor"),function(_de,_df){
with(_de){
return objj_msgSend(_menuItem,"isEnabled")?(_textColor?_textColor:objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",70/255,69/255,69/255,1)):objj_msgSend(CPColor,"lightGrayColor");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_e0,_e1,_e2){
with(_e0){
if(_textShadowColor==_e2){
return;
}
_textShadowColor=_e2;
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_e0,"textShadowColor"));
}
}),new objj_method(sel_getUid("textShadowColor"),function(_e3,_e4){
with(_e3){
return objj_msgSend(_menuItem,"isEnabled")?(_textShadowColor?_textShadowColor:objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.8)):objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,0.8);
}
}),new objj_method(sel_getUid("setActivateColor:"),function(_e5,_e6,_e7){
with(_e5){
_activateColor=_e7;
}
}),new objj_method(sel_getUid("activateColor"),function(_e8,_e9){
with(_e8){
return _activateColor;
}
}),new objj_method(sel_getUid("setActivateShadowColor:"),function(_ea,_eb,_ec){
with(_ea){
_activateShadowColor=_ec;
}
}),new objj_method(sel_getUid("activateShadowColor"),function(_ed,_ee){
with(_ed){
return _activateShadowColor;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_ef,_f0){
with(_ef){
if(_ef!=objj_msgSend(_CPMenuItemView,"class")){
return;
}
_ae=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",95/255,131/255,185/255,1);
_af=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",26/255,73/255,109/255,1);
var _f1=objj_msgSend(CPBundle,"bundleForClass:",_ef);
_b0[CPOffState]=nil;
_b1[CPOffState]=nil;
_b0[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","CPMenuItem/CPMenuItemOnState.png"),CGSizeMake(14,14));
_b1[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","CPMenuItem/CPMenuItemOnStateHighlighted.png"),CGSizeMake(14,14));
_b0[CPMixedState]=nil;
_b1[CPMixedState]=nil;
}
}),new objj_method(sel_getUid("leftMargin"),function(_f2,_f3){
with(_f2){
return _a9+_ab;
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPMenuItemArrowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_color")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setColor:"),function(_f4,_f5,_f6){
with(_f4){
if(_color==_f6){
return;
}
_color=_f6;
objj_msgSend(_f4,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_f7,_f8,_f9){
with(_f7){
var _fa=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_fa);
CGContextMoveToPoint(_fa,1,4);
CGContextAddLineToPoint(_fa,9,4);
CGContextAddLineToPoint(_fa,5,8);
CGContextAddLineToPoint(_fa,1,4);
CGContextClosePath(_fa);
CGContextSetFillColor(_fa,_color);
CGContextFillPath(_fa);
}
})]);
p;13;CPOpenPanel.jI;16;AppKit/CPPanel.jc;2075;
var _1=objj_allocateClassPair(CPPanel,"CPOpenPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_canChooseFiles"),new objj_ivar("_canChooseDirectories"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_directoryURL"),new objj_ivar("_URLs")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("canChooseFiles"),function(_3,_4){
with(_3){
return _canChooseFiles;
}
}),new objj_method(sel_getUid("setCanChooseFiles:"),function(_5,_6,_7){
with(_5){
_canChooseFiles=_7;
}
}),new objj_method(sel_getUid("canChooseDirectories"),function(_8,_9){
with(_8){
return _canChooseDirectories;
}
}),new objj_method(sel_getUid("setCanChooseDirectories:"),function(_a,_b,_c){
with(_a){
_canChooseDirectories=_c;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_d,_e){
with(_d){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_f,_10,_11){
with(_f){
_allowsMultipleSelection=_11;
}
}),new objj_method(sel_getUid("directoryURL"),function(_12,_13){
with(_12){
return _directoryURL;
}
}),new objj_method(sel_getUid("setDirectoryURL:"),function(_14,_15,_16){
with(_14){
_directoryURL=_16;
}
}),new objj_method(sel_getUid("runModal"),function(_17,_18){
with(_17){
if(typeof window["cpOpenPanel"]==="function"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
var _19={directoryURL:objj_msgSend(_17,"directoryURL"),canChooseFiles:objj_msgSend(_17,"canChooseFiles"),canChooseDirectories:objj_msgSend(_17,"canChooseDirectories"),allowsMultipleSelection:objj_msgSend(_17,"allowsMultipleSelection")};
var _1a=window.cpOpenPanel(_19);
_URLs=_1a.URLs;
return _1a.button;
}
throw "-runModal is unimplemented.";
}
}),new objj_method(sel_getUid("URLs"),function(_1b,_1c){
with(_1b){
return _URLs;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("openPanel"),function(_1d,_1e){
with(_1d){
return objj_msgSend(objj_msgSend(CPOpenPanel,"alloc"),"init");
}
})]);
p;15;CPOutlineView.ji;15;CPTableColumn.ji;13;CPTableView.jc;20462;
CPOutlineViewColumnDidMoveNotification="CPOutlineViewColumnDidMoveNotification";
CPOutlineViewColumnDidResizeNotification="CPOutlineViewColumnDidResizeNotification";
CPOutlineViewItemDidCollapseNotification="CPOutlineViewItemDidCollapseNotification";
CPOutlineViewItemDidExpandNotification="CPOutlineViewItemDidExpandNotification";
CPOutlineViewItemWillCollapseNotification="CPOutlineViewItemWillCollapseNotification";
CPOutlineViewItemWillExpandNotification="CPOutlineViewItemWillExpandNotification";
CPOutlineViewSelectionDidChangeNotification="CPOutlineViewSelectionDidChangeNotification";
CPOutlineViewSelectionIsChangingNotification="CPOutlineViewSelectionIsChangingNotification";
var _1=1<<1,_2=1<<2,_3=1<<3,_4=1<<4,_5=1<<5,_6=1<<6,_7=1<<7,_8=1<<8,_9=1<<9,_a=1<<10;
var _b=objj_allocateClassPair(CPTableView,"CPOutlineView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineViewDataSource"),new objj_ivar("_outlineViewDelegate"),new objj_ivar("_outlineTableColumn"),new objj_ivar("_indentationPerLevel"),new objj_ivar("_indentationMarkerFollowsDataView"),new objj_ivar("_implementedOutlineViewDataSourceMethods"),new objj_ivar("_rootItemInfo"),new objj_ivar("_itemsForRows"),new objj_ivar("_itemInfosForItems"),new objj_ivar("_disclosureControlPrototype"),new objj_ivar("_disclosureControlsForRows"),new objj_ivar("_disclosureControlData"),new objj_ivar("_disclosureControlQueue")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPTableView")},"initWithFrame:",_f);
if(_d){
_rootItemInfo={isExpanded:YES,isExpandable:NO,level:-1,row:-1,children:[],weight:0};
_itemsForRows=[];
_itemInfosForItems={};
_disclosureControlsForRows=[];
objj_msgSend(_d,"setIndentationPerLevel:",16);
objj_msgSend(_d,"setIndentationMarkerFollowsDataView:",YES);
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPTableView")},"setDataSource:",objj_msgSend(objj_msgSend(_CPOutlineViewTableViewDataSource,"alloc"),"initWithOutlineView:",_d));
objj_msgSend(_d,"setDisclosureControlPrototype:",objj_msgSend(objj_msgSend(CPDisclosureButton,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10)));
}
return _d;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_10,_11,_12){
with(_10){
if(_outlineViewDataSource===_12){
return;
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:child:ofItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:child:ofItem:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:isItemExpandable:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:isItemExpandable:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:numberOfChildrenOfItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:numberOfChildrenOfItem:'");
}
if(!objj_msgSend(_12,"respondsToSelector:",sel_getUid("outlineView:objectValueForTableColumn:byItem:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:objectValueForTableColumn:byItem:'");
}
_outlineViewDataSource=_12;
_implementedOutlineViewDataSourceMethods=0;
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:setObjectValue:forTableColumn:byItem:"))){
_implementedOutlineViewDataSourceMethods|=_1;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:shouldDeferDisplayingChildrenOfItem:"))){
_implementedOutlineViewDataSourceMethods|=_2;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:acceptDrop:item:childIndex:"))){
_implementedOutlineViewDataSourceMethods|=_3;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"))){
_implementedOutlineViewDataSourceMethods|=_4;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedOutlineViewDataSourceMethods|=_5;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:namesOfPromisedFilesDroppedAtDestination:forDraggedItems:"))){
_implementedOutlineViewDataSourceMethods|=_6;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:itemForPersistentObject:"))){
_implementedOutlineViewDataSourceMethods|=_7;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:persistentObjectForItem:"))){
_implementedOutlineViewDataSourceMethods|=_8;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:writeItems:toPasteboard:"))){
_implementedOutlineViewDataSourceMethods|=_9;
}
if(objj_msgSend(_outlineViewDataSource,"respondsToSelector:",sel_getUid("outlineView:sortDescriptorsDidChange:"))){
_implementedOutlineViewDataSourceMethods|=_a;
}
objj_msgSend(_10,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_13,_14){
with(_13){
return _outlineViewDataSource;
}
}),new objj_method(sel_getUid("isExpandable:"),function(_15,_16,_17){
with(_15){
if(!_17){
return YES;
}
var _18=_itemInfosForItems[objj_msgSend(_17,"UID")];
if(!_18){
return NO;
}
return _18.isExpandable;
}
}),new objj_method(sel_getUid("isItemExpanded:"),function(_19,_1a,_1b){
with(_19){
if(!_1b){
return YES;
}
var _1c=_itemInfosForItems[objj_msgSend(_1b,"UID")];
if(!_1c){
return NO;
}
return _1c.isExpanded;
}
}),new objj_method(sel_getUid("expandItem:"),function(_1d,_1e,_1f){
with(_1d){
if(!_1f){
return;
}
var _20=_itemInfosForItems[objj_msgSend(_1f,"UID")];
if(!_20){
return;
}
if(_20.isExpanded){
return;
}
_20.isExpanded=YES;
objj_msgSend(_1d,"reloadItem:reloadChildren:",_1f,YES);
}
}),new objj_method(sel_getUid("collapseItem:"),function(_21,_22,_23){
with(_21){
if(!_23){
return;
}
var _24=_itemInfosForItems[objj_msgSend(_23,"UID")];
if(!_24){
return;
}
if(!_24.isExpanded){
return;
}
_24.isExpanded=NO;
objj_msgSend(_21,"reloadItem:reloadChildren:",_23,YES);
}
}),new objj_method(sel_getUid("reloadItem:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"reloadItem:reloadChildren:",_27,NO);
}
}),new objj_method(sel_getUid("reloadItem:reloadChildren:"),function(_28,_29,_2a,_2b){
with(_28){
if(!!_2b||!_2a){
_2c(_28,_2a);
}else{
_2d(_28,_2a);
}
objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPTableView")},"reloadData");
}
}),new objj_method(sel_getUid("itemAtRow:"),function(_2e,_2f,_30){
with(_2e){
return _itemsForRows[_30]||nil;
}
}),new objj_method(sel_getUid("rowForItem:"),function(_31,_32,_33){
with(_31){
if(!anItem){
return _rootItemInfo.row;
}
var _34=_itemInfosForItems[objj_msgSend(anItem,"UID")];
if(!_34){
return CPNotFound;
}
return _34.row;
}
}),new objj_method(sel_getUid("setOutlineTableColumn:"),function(_35,_36,_37){
with(_35){
if(_outlineTableColumn===_37){
return;
}
_outlineTableColumn=_37;
objj_msgSend(_35,"reloadData");
}
}),new objj_method(sel_getUid("outlineTableColumn"),function(_38,_39){
with(_38){
return _outlineTableColumn;
}
}),new objj_method(sel_getUid("levelForItem:"),function(_3a,_3b,_3c){
with(_3a){
if(!_3c){
return _rootItemInfo.level;
}
var _3d=_itemInfosForItems[objj_msgSend(_3c,"UID")];
if(!_3d){
return CPNotFound;
}
return _3d.level;
}
}),new objj_method(sel_getUid("levelForRow:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(_3e,"levelForItem:",objj_msgSend(_3e,"itemAtRow:",_40));
}
}),new objj_method(sel_getUid("setIndentationPerLevel:"),function(_41,_42,_43){
with(_41){
if(_indentationPerLevel===_43){
return;
}
_indentationPerLevel=_43;
objj_msgSend(_41,"reloadData");
}
}),new objj_method(sel_getUid("indentationPerLevel"),function(_44,_45){
with(_44){
return _indentationPerLevel;
}
}),new objj_method(sel_getUid("setIndentationMarkerFollowsDataView:"),function(_46,_47,_48){
with(_46){
if(_indentationMarkerFollowsDataView===_48){
return;
}
_indentationMarkerFollowsDataView=_48;
objj_msgSend(_46,"reloadData");
}
}),new objj_method(sel_getUid("indentationMarkerFollowsDataView"),function(_49,_4a){
with(_49){
return _indentationMarkerFollowsDataView;
}
}),new objj_method(sel_getUid("parentForItem:"),function(_4b,_4c,_4d){
with(_4b){
if(!_4d){
return nil;
}
var _4e=_itemInfosForItems[objj_msgSend(_4d,"UID")];
if(!_4e){
return nil;
}
return _4e.parent;
}
}),new objj_method(sel_getUid("frameOfOutlineDataViewAtColumn:row:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPTableView")},"frameOfDataViewAtColumn:row:",_51,_52),_54=(objj_msgSend(_4f,"levelForRow:",_52)+1)*objj_msgSend(_4f,"indentationPerLevel");
_53.origin.x+=_54;
_53.size.width-=_54;
return _53;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_55,_56,_57){
with(_55){
if(_outlineViewDelegate===_57){
return;
}
var _58=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_outlineViewDelegate){
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidMoveNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewColumnDidResizeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionDidChangeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_58,"removeObserver:name:object:",_outlineViewDelegate,CPOutlineViewSelectionIsChangingNotification,_55);
}
}
_outlineViewDelegate=_57;
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidMove:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidMoveNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewColumnDidResize:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewColumnDidMove:"),CPOutlineViewColumnDidResizeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionDidChange:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionDidChange:"),CPOutlineViewSelectionDidChangeNotification,_55);
}
if(objj_msgSend(_outlineViewDelegate,"respondsToSelector:",sel_getUid("outlineViewSelectionIsChanging:"))){
objj_msgSend(_58,"addObserver:selector:name:object:",_outlineViewDelegate,sel_getUid("outlineViewSelectionIsChanging:"),CPOutlineViewSelectionIsChangingNotification,_55);
}
}
}),new objj_method(sel_getUid("delegate"),function(_59,_5a){
with(_59){
return _outlineViewDelegate;
}
}),new objj_method(sel_getUid("setDisclosureControlPrototype:"),function(_5b,_5c,_5d){
with(_5b){
_disclosureControlPrototype=_5d;
_disclosureControlData=nil;
_disclosureControlQueue=[];
objj_msgSend(_5b,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_5e,_5f){
with(_5e){
objj_msgSend(_5e,"reloadItem:reloadChildren:",nil,YES);
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_60,_61,_62,_63){
with(_60){
var _64=objj_msgSend(_60,"tableColumns")[_62];
if(_64===_outlineTableColumn){
return objj_msgSend(_60,"frameOfOutlineDataViewAtColumn:row:",_62,_63);
}
return objj_msgSendSuper({receiver:_60,super_class:objj_getClass("CPTableView")},"frameOfDataViewAtColumn:row:",_62,_63);
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(_65,_66,_67,_68){
with(_65){
objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPTableView")},"_loadDataViewsInRows:columns:",_67,_68);
var _69=objj_msgSend(objj_msgSend(_65,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_65,"outlineTableColumn"));
if(!objj_msgSend(_68,"containsIndex:",_69)){
return;
}
var _6a=[];
objj_msgSend(_67,"getIndexes:maxCount:inIndexRange:",_6a,-1,nil);
var _6b=0,_6c=_6a.length;
for(;_6b<_6c;++_6b){
var row=_6a[_6b],_6e=_itemsForRows[row],_6f=objj_msgSend(_65,"isExpandable:",_6e);
if(!_6f){
continue;
}
var _70=objj_msgSend(_65,"_dequeueDisclosureControl"),_71=objj_msgSend(_70,"frame"),_72=objj_msgSend(_65,"frameOfDataViewAtColumn:row:",_69,row);
_71.origin.x=_indentationMarkerFollowsDataView?(_72.origin.x)-(_71.size.width):0;
_71.origin.y=(_72.origin.y);
_71.size.height=(_72.size.height);
_disclosureControlsForRows[row]=_70;
objj_msgSend(_70,"setState:",objj_msgSend(_65,"isItemExpanded:",_6e)?CPOnState:CPOffState);
objj_msgSend(_70,"setFrame:",_71);
objj_msgSend(_65,"addSubview:",_70);
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(_73,_74,_75,_76){
with(_73){
objj_msgSendSuper({receiver:_73,super_class:objj_getClass("CPTableView")},"_unloadDataViewsInRows:columns:",_75,_76);
var _77=objj_msgSend(objj_msgSend(_73,"tableColumns"),"indexOfObjectIdenticalTo:",objj_msgSend(_73,"outlineTableColumn"));
if(!objj_msgSend(_76,"containsIndex:",_77)){
return;
}
var _78=[];
objj_msgSend(_75,"getIndexes:maxCount:inIndexRange:",_78,-1,nil);
var _79=0,_7a=_78.length;
for(;_79<_7a;++_79){
var row=_78[_79],_7c=_disclosureControlsForRows[row];
if(!_7c){
continue;
}
objj_msgSend(_7c,"removeFromSuperview");
objj_msgSend(_73,"_enqueueDisclosureControl:",_7c);
_disclosureControlsForRows[row]=nil;
}
}
}),new objj_method(sel_getUid("_toggleFromDisclosureControl:"),function(_7d,_7e,_7f){
with(_7d){
var _80=objj_msgSend(_7f,"frame"),_81=objj_msgSend(_7d,"itemAtRow:",objj_msgSend(_7d,"rowAtPoint:",{x:(_80.origin.x),y:(_80.origin.y+(_80.size.height)/2)}));
if(objj_msgSend(_7d,"isItemExpanded:",_81)){
objj_msgSend(_7d,"collapseItem:",_81);
}else{
objj_msgSend(_7d,"expandItem:",_81);
}
}
}),new objj_method(sel_getUid("_enqueueDisclosureControl:"),function(_82,_83,_84){
with(_82){
_disclosureControlQueue.push(_84);
}
}),new objj_method(sel_getUid("_dequeueDisclosureControl"),function(_85,_86){
with(_85){
if(_disclosureControlQueue.length){
return _disclosureControlQueue.pop();
}
if(!_disclosureControlData){
if(!_disclosureControlPrototype){
return nil;
}else{
_disclosureControlData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_disclosureControlPrototype);
}
}
var _87=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_disclosureControlData);
objj_msgSend(_87,"setTarget:",_85);
objj_msgSend(_87,"setAction:",sel_getUid("_toggleFromDisclosureControl:"));
return _87;
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionIsChangingNotification,_88,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(_8a,_8b){
with(_8a){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPOutlineViewSelectionDidChangeNotification,_8a,nil);
}
})]);
var _2d=function(_8c,_8d){
if(!_8d){
return;
}
var _8e=_8c._itemInfosForItems,_8f=_8c._outlineViewDataSource,_90=objj_msgSend(_8d,"UID"),_91=_8e[_90];
if(!_91){
return [];
}
var _92=_91.parent,_93=_92?_8e[objj_msgSend(_92,"UID")]:_8c._rootItemInfo,_94=_93.children,_95=objj_msgSend(_94,"indexOfObjectIdenticalTo:",_8d),_96=objj_msgSend(_8f,"outlineView:child:ofItem:",_8c,_95,_92);
if(_8d!==_96){
_8e[objj_msgSend(_8d,"UID")]=nil;
_8e[objj_msgSend(_96,"UID")]=_91;
_94[_95]=_96;
_8c._itemsForRows[_91.row]=_96;
}
_91.isExpandable=objj_msgSend(_8f,"outlineView:isItemExpandable:",_8c,_96);
_91.isExpanded=_91.isExpandable&&_91.isExpanded;
};
var _2c=function(_97,_98,_99){
var _9a=_97._itemInfosForItems,_9b=_97._outlineViewDataSource;
if(!_98){
var _9c=_97._rootItemInfo;
}else{
var _9d=objj_msgSend(_98,"UID"),_9c=_9a[_9d];
if(!_9c){
return [];
}
_9c.isExpandable=objj_msgSend(_9b,"outlineView:isItemExpandable:",_97,_98);
if(!_9c.isExpandable&&_9c.isExpanded){
_9c.isExpanded=NO;
_9c.children=[];
}
}
var _9e=_9c.weight,_9f=_98?[_98]:[];
if(_9c.isExpanded&&(!(_97._implementedOutlineViewDataSourceMethods&_2)||!objj_msgSend(_9b,"outlineView:shouldDeferDisplayingChildrenOfItem:",_97,_98))){
var _a0=0,_a1=objj_msgSend(_9b,"outlineView:numberOfChildrenOfItem:",_97,_98),_a2=_9c.level+1;
_9c.children=[];
for(;_a0<_a1;++_a0){
var _a3=objj_msgSend(_9b,"outlineView:child:ofItem:",_97,_a0,_98),_a4=_9a[objj_msgSend(_a3,"UID")];
if(!_a4){
_a4={isExpanded:NO,isExpandable:NO,children:[],weight:1};
_9a[objj_msgSend(_a3,"UID")]=_a4;
}
_9c.children[_a0]=_a3;
var _a5=_2c(_97,_a3,YES);
_a4.parent=_98;
_a4.level=_a2;
_9f=_9f.concat(_a5);
}
}
_9c.weight=_9f.length;
if(!_99){
var _a0=MAX(_9c.row,0),_a6=_97._itemsForRows;
_9f.unshift(_a0,_9e);
_a6.splice.apply(_a6,_9f);
var _a1=_a6.length;
for(;_a0<_a1;++_a0){
_9a[objj_msgSend(_a6[_a0],"UID")].row=_a0;
}
var _a7=_9c.weight-_9e;
if(_a7!==0){
var _a8=_9c.parent;
while(_a8){
var _a9=_9a[objj_msgSend(_a8,"UID")];
_a9.weight+=_a7;
_a8=_a9.parent;
}
if(_98){
_97._rootItemInfo.weight+=_a7;
}
}
}
return _9f;
};
var _b=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDataSource"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithOutlineView:"),function(_aa,_ab,_ac){
with(_aa){
_aa=objj_msgSendSuper({receiver:_aa,super_class:objj_getClass("CPObject")},"init");
if(_aa){
_outlineView=_ac;
}
return _aa;
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_ad,_ae,_af){
with(_ad){
return _outlineView._itemsForRows.length;
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_b0,_b1,_b2,_b3,_b4){
with(_b0){
return objj_msgSend(_outlineView._outlineViewDataSource,"outlineView:objectValueForTableColumn:byItem:",_outlineView,_b3,_outlineView._itemsForRows[_b4]);
}
})]);
var _b=objj_allocateClassPair(CPObject,"_CPOutlineViewTableViewDelegate"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_outlineView")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithOutlineView:"),function(_b5,_b6,_b7){
with(_b5){
_b5=objj_msgSendSuper({receiver:_b5,super_class:objj_getClass("CPObject")},"init");
if(_b5){
_outlineView=_b7;
}
return _b5;
}
})]);
var _b=objj_allocateClassPair(CPButton,"CPDisclosureButton"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_angle")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_b8,_b9,_ba){
with(_b8){
_b8=objj_msgSendSuper({receiver:_b8,super_class:objj_getClass("CPButton")},"initWithFrame:",_ba);
if(_b8){
objj_msgSend(_b8,"setBordered:",NO);
}
return _b8;
}
}),new objj_method(sel_getUid("setState:"),function(_bb,_bc,_bd){
with(_bb){
objj_msgSendSuper({receiver:_bb,super_class:objj_getClass("CPButton")},"setState:",_bd);
if(objj_msgSend(_bb,"state")===CPOnState){
_angle=0;
}else{
_angle=-PI_2;
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_be,_bf,_c0){
with(_be){
var _c1=objj_msgSend(_be,"bounds"),_c2=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_c2);
CGContextTranslateCTM(_c2,(_c1.size.width)/2,(_c1.size.height)/2);
CGContextRotateCTM(_c2,_angle);
CGContextTranslateCTM(_c2,-(_c1.size.width)/2,-(_c1.size.height)/2);
CGContextTranslateCTM(_c2,FLOOR(((_c1.size.width)-9)/2),FLOOR(((_c1.size.height)-8)/2));
CGContextMoveToPoint(_c2,0,0);
CGContextAddLineToPoint(_c2,9,0);
CGContextAddLineToPoint(_c2,4.5,8);
CGContextAddLineToPoint(_c2,0,0);
CGContextClosePath(_c2);
CGContextSetFillColor(_c2,(objj_msgSend(_be,"themeState")&CPThemeState("highlighted"))?objj_msgSend(CPColor,"blackColor"):objj_msgSend(CPColor,"grayColor"));
CGContextFillPath(_c2);
}
})]);
p;9;CPPanel.ji;10;CPWindow.jc;1179;
CPOKButton=1;
CPCancelButton=0;
CPDocModalWindowMask=1<<6;
var _1=objj_allocateClassPair(CPWindow,"CPPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_becomesKeyOnlyIfNeeded"),new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isFloatingPanel"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"level")==CPFloatingWindowLevel;
}
}),new objj_method(sel_getUid("setFloatingPanel:"),function(_5,_6,_7){
with(_5){
objj_msgSend(_5,"setLevel:",_7?CPFloatingWindowLevel:CPNormalWindowLevel);
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(_8,_9){
with(_8){
return _becomesKeyOnlyIfNeeded;
}
}),new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"),function(_a,_b,_c){
with(_a){
_becomesKeyOnlyIfNeeded=_c;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(_d,_e){
with(_d){
return _worksWhenModal;
}
}),new objj_method(sel_getUid("setWorksWhenModal:"),function(_f,_10,_11){
with(_f){
_worksWhenModal=_11;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(_12,_13){
with(_12){
return NO;
}
})]);
p;14;CPPasteboard.jI;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;4594;
CPGeneralPboard="CPGeneralPboard";
CPFontPboard="CPFontPboard";
CPRulerPboard="CPRulerPboard";
CPFindPboard="CPFindPboard";
CPDragPboard="CPDragPboard";
CPColorPboardType="CPColorPboardType";
CPFilenamesPboardType="CPFilenamesPboardType";
CPFontPboardType="CPFontPboardType";
CPHTMLPboardType="CPHTMLPboardType";
CPStringPboardType="CPStringPboardType";
CPURLPboardType="CPURLPboardType";
CPImagesPboardType="CPImagesPboardType";
CPVideosPboardType="CPVideosPboardType";
CPImagePboardType="CPImagePboardType";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPPasteboard"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_types"),new objj_ivar("_owners"),new objj_ivar("_provided"),new objj_ivar("_changeCount"),new objj_ivar("_stateUID")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_initWithName:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_name=_6;
_types=[];
_owners=objj_msgSend(CPDictionary,"dictionary");
_provided=objj_msgSend(CPDictionary,"dictionary");
_changeCount=0;
}
return _4;
}
}),new objj_method(sel_getUid("addTypes:owner:"),function(_7,_8,_9,_a){
with(_7){
var i=0,_c=_9.length;
for(;i<_c;++i){
var _d=_9[i];
if(!objj_msgSend(_owners,"objectForKey:",_d)){
objj_msgSend(_types,"addObject:",_d);
objj_msgSend(_provided,"removeObjectForKey:",_d);
}
objj_msgSend(_owners,"setObject:forKey:",_a,_d);
}
return ++_changeCount;
}
}),new objj_method(sel_getUid("declareTypes:owner:"),function(_e,_f,_10,_11){
with(_e){
objj_msgSend(_types,"setArray:",_10);
_owners=objj_msgSend(CPDictionary,"dictionary");
_provided=objj_msgSend(CPDictionary,"dictionary");
var _12=_types.length;
while(_12--){
objj_msgSend(_owners,"setObject:forKey:",_11,_types[_12]);
}
return ++_changeCount;
}
}),new objj_method(sel_getUid("setData:forType:"),function(_13,_14,_15,_16){
with(_13){
objj_msgSend(_provided,"setObject:forKey:",_15,_16);
return YES;
}
}),new objj_method(sel_getUid("setPropertyList:forType:"),function(_17,_18,_19,_1a){
with(_17){
return objj_msgSend(_17,"setData:forType:",objj_msgSend(CPPropertyListSerialization,"dataFromPropertyList:format:errorDescription:",_19,CPPropertyListXMLFormat_v1_0,nil),_1a);
}
}),new objj_method(sel_getUid("setString:forType:"),function(_1b,_1c,_1d,_1e){
with(_1b){
return objj_msgSend(_1b,"setPropertyList:forType:",_1d,_1e);
}
}),new objj_method(sel_getUid("availableTypeFromArray:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"types"),"firstObjectCommonWithArray:",_21);
}
}),new objj_method(sel_getUid("types"),function(_22,_23){
with(_22){
return _types;
}
}),new objj_method(sel_getUid("changeCount"),function(_24,_25){
with(_24){
return _changeCount;
}
}),new objj_method(sel_getUid("dataForType:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_provided,"objectForKey:",_28);
if(_29){
return _29;
}
var _2a=objj_msgSend(_owners,"objectForKey:",_28);
if(_2a){
objj_msgSend(_2a,"pasteboard:provideDataForType:",_26,_28);
++_changeCount;
return objj_msgSend(_provided,"objectForKey:",_28);
}
return nil;
}
}),new objj_method(sel_getUid("propertyListForType:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"dataForType:",_2d);
if(_2e){
return objj_msgSend(CPPropertyListSerialization,"propertyListFromData:format:errorDescription:",_2e,CPPropertyListXMLFormat_v1_0,nil);
}
return nil;
}
}),new objj_method(sel_getUid("stringForType:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(_2f,"propertyListForType:",_31);
}
}),new objj_method(sel_getUid("_generateStateUID"),function(_32,_33){
with(_32){
var _34=32;
_stateUID="";
while(_34--){
_stateUID+=FLOOR(RAND()*16).toString(16).toUpperCase();
}
return _stateUID;
}
}),new objj_method(sel_getUid("_stateUID"),function(_35,_36){
with(_35){
return _stateUID;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_37,_38){
with(_37){
if(_37!=objj_msgSend(CPPasteboard,"class")){
return;
}
objj_msgSend(_37,"setVersion:",1);
_1=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("generalPasteboard"),function(_39,_3a){
with(_39){
return objj_msgSend(CPPasteboard,"pasteboardWithName:",CPGeneralPboard);
}
}),new objj_method(sel_getUid("pasteboardWithName:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_1,"objectForKey:",_3d);
if(_3e){
return _3e;
}
_3e=objj_msgSend(objj_msgSend(CPPasteboard,"alloc"),"_initWithName:",_3d);
objj_msgSend(_1,"setObject:forKey:",_3e,_3d);
return _3e;
}
})]);
p;12;CPPlatform.jI;21;Foundation/CPObject.jc;1074;
var _1=objj_allocateClassPair(CPObject,"CPPlatform"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
objj_msgSend(CPPlatformString,"bootstrap");
objj_msgSend(CPPlatformWindow,"setPrimaryPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"_init"));
}
}),new objj_method(sel_getUid("isBrowser"),function(_5,_6){
with(_5){
return typeof window.cpIsDesktop==="undefined";
}
}),new objj_method(sel_getUid("supportsDragAndDrop"),function(_7,_8){
with(_7){
return CPFeatureIsCompatible(CPHTMLDragAndDropFeature);
}
}),new objj_method(sel_getUid("supportsNativeMainMenu"),function(_9,_a){
with(_9){
return (typeof window["cpSetMainMenu"]==="function");
}
}),new objj_method(sel_getUid("terminateApplication"),function(_b,_c){
with(_b){
if(typeof window["cpTerminate"]==="function"){
window.cpTerminate();
}
}
}),new objj_method(sel_getUid("activateIgnoringOtherApps:"),function(_d,_e,_f){
with(_d){
}
})]);
p;18;CPPlatformString.jI;21;Foundation/CPObject.jc;402;
var _1=objj_allocateClassPair(CPObject,"CPPlatformString"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
}
}),new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_5,_6,_7,_8,_9){
with(_5){
return {width:0,height:0};
}
})]);
p;22;CPPlatformWindow+DOM.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;12;CPPlatform.ji;18;CPPlatformWindow.jc;23934;
var _1="dblclick",_2="mousedown",_3="mouseup",_4="mousemove",_5="mousedrag",_6="keyup",_7="keydown",_8="keypress",_9="copy",_a="paste",_b="resize",_c="mousewheel",_d="touchstart",_e="touchmove",_f="touchend",_10="touchcancel";
var _11=[];
_11["INPUT"]=YES;
_11["SELECT"]=YES;
_11["TEXTAREA"]=YES;
_11["OPTION"]=YES;
var _12,_13,_14;
var _15={},_16={},_17={"8":1,"9":1,"16":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _18=17;
var _19=objj_msgSend(CPPlatform,"supportsDragAndDrop");
var _1a=objj_getClass("CPPlatformWindow");
if(!_1a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPlatformWindow\""));
}
var _1b=_1a.isa;
class_addMethods(_1a,[new objj_method(sel_getUid("_init"),function(_1c,_1d){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPObject")},"init");
if(_1c){
_DOMWindow=window;
_contentRect={origin:{x:0,y:0},size:{width:0,height:0}};
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1c,"registerDOMWindow");
objj_msgSend(_1c,"updateFromNativeContentRect");
_charCodes={};
}
return _1c;
}
}),new objj_method(sel_getUid("nativeContentRect"),function(_1e,_1f){
with(_1e){
if(!_DOMWindow){
return objj_msgSend(_1e,"contentRect");
}
if(_DOMWindow.cpFrame){
return _DOMWindow.cpFrame();
}
var _20={origin:{x:0,y:0},size:{width:0,height:0}};
if(window.screenTop){
_20.origin={x:_DOMWindow.screenLeft,y:_DOMWindow.screenTop};
}else{
if(window.screenX){
_20.origin={x:_DOMWindow.screenX,y:_DOMWindow.screenY};
}
}
if(_DOMWindow.innerWidth){
_20.size={width:_DOMWindow.innerWidth,height:_DOMWindow.innerHeight};
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_20.size={width:_DOMWindow.document.documentElement.clientWidth,height:_DOMWindow.document.documentElement.clientHeight};
}else{
_20.size={width:_DOMWindow.document.body.clientWidth,height:_DOMWindow.document.body.clientHeight};
}
}
return _20;
}
}),new objj_method(sel_getUid("updateNativeContentRect"),function(_21,_22){
with(_21){
if(!_DOMWindow){
return;
}
if(typeof _DOMWindow["cpSetFrame"]==="function"){
return _DOMWindow.cpSetFrame(objj_msgSend(_21,"contentRect"));
}
var _23=objj_msgSend(_21,"contentRect").origin,_24=objj_msgSend(_21,"nativeContentRect").origin;
if(_23.x!==_24.x||_23.y!==_24.y){
_DOMWindow.moveBy(_23.x-_24.x,_23.y-_24.y);
}
var _25=objj_msgSend(_21,"contentRect").size,_26=objj_msgSend(_21,"nativeContentRect").size;
if(_25.width!==_26.width||_25.height!==_26.height){
_DOMWindow.resizeBy(_25.width-_26.width,_25.height-_26.height);
}
}
}),new objj_method(sel_getUid("orderBack:"),function(_27,_28,_29){
with(_27){
if(_DOMWindow){
_DOMWindow.blur();
}
}
}),new objj_method(sel_getUid("registerDOMWindow"),function(_2a,_2b){
with(_2a){
var _2c=_DOMWindow.document;
_DOMBodyElement=_2c.getElementsByTagName("body")[0];
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.style["-khtml-user-select"]="none";
}
_DOMBodyElement.webkitTouchCallout="none";
_DOMFocusElement=_2c.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=_2c.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
objj_msgSend(_2a,"_addLayers");
var _2d=objj_msgSend(_2a,"class"),_2e=class_getMethodImplementation(_2d,sel_getUid("dragEvent:")),_2f=function(_30){
_2e(_2a,nil,_30);
},_31=sel_getUid("resizeEvent:"),_32=class_getMethodImplementation(_2d,_31),_33=function(_34){
_32(_2a,nil,_34);
},_35=sel_getUid("keyEvent:"),_36=class_getMethodImplementation(_2d,_35),_37=function(_38){
_36(_2a,nil,_38);
},_39=sel_getUid("mouseEvent:"),_3a=class_getMethodImplementation(_2d,_39),_3b=function(_3c){
_3a(_2a,nil,_3c);
},_3d=sel_getUid("scrollEvent:"),_3e=class_getMethodImplementation(_2d,_3d),_3f=function(_40){
_3e(_2a,nil,_40);
},_41=sel_getUid("touchEvent:"),_42=class_getMethodImplementation(_2d,_41),_43=function(_44){
_42(_2a,nil,_44);
};
if(_2c.addEventListener){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_2c.addEventListener("dragstart",_2f,NO);
_2c.addEventListener("drag",_2f,NO);
_2c.addEventListener("dragend",_2f,NO);
_2c.addEventListener("dragover",_2f,NO);
_2c.addEventListener("dragleave",_2f,NO);
_2c.addEventListener("drop",_2f,NO);
}
_2c.addEventListener("mouseup",_3b,NO);
_2c.addEventListener("mousedown",_3b,NO);
_2c.addEventListener("mousemove",_3b,NO);
_2c.addEventListener("keyup",_37,NO);
_2c.addEventListener("keydown",_37,NO);
_2c.addEventListener("keypress",_37,NO);
_2c.addEventListener("touchstart",_43,NO);
_2c.addEventListener("touchend",_43,NO);
_2c.addEventListener("touchmove",_43,NO);
_2c.addEventListener("touchcancel",_43,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.addEventListener("mousewheel",_3f,NO);
_DOMWindow.addEventListener("resize",_33,NO);
_DOMWindow.addEventListener("unload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
objj_msgSend(_2a,"_removeLayers");
_2c.removeEventListener("mouseup",_3b,NO);
_2c.removeEventListener("mousedown",_3b,NO);
_2c.removeEventListener("mousemove",_3b,NO);
_2c.removeEventListener("keyup",_37,NO);
_2c.removeEventListener("keydown",_37,NO);
_2c.removeEventListener("keypress",_37,NO);
_2c.removeEventListener("touchstart",_43,NO);
_2c.removeEventListener("touchend",_43,NO);
_2c.removeEventListener("touchmove",_43,NO);
_DOMWindow.removeEventListener("resize",_33,NO);
_DOMWindow.removeEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.removeEventListener("mousewheel",_3f,NO);
_2a._DOMWindow=nil;
},NO);
}else{
_2c.attachEvent("onmouseup",_3b);
_2c.attachEvent("onmousedown",_3b);
_2c.attachEvent("onmousemove",_3b);
_2c.attachEvent("ondblclick",_3b);
_2c.attachEvent("onkeyup",_37);
_2c.attachEvent("onkeydown",_37);
_2c.attachEvent("onkeypress",_37);
_DOMWindow.attachEvent("onresize",_33);
_DOMWindow.onmousewheel=_3f;
_2c.onmousewheel=_3f;
_2c.body.ondrag=function(){
return NO;
};
_2c.body.onselectstart=function(){
return _DOMWindow.event.srcElement===_DOMPasteboardElement;
};
_DOMWindow.attachEvent("onbeforeunload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
objj_msgSend(_2a,"_removeLayers");
_2c.removeEvent("onmouseup",_3b);
_2c.removeEvent("onmousedown",_3b);
_2c.removeEvent("onmousemove",_3b);
_2c.removeEvent("ondblclick",_3b);
_2c.removeEvent("onkeyup",_37);
_2c.removeEvent("onkeydown",_37);
_2c.removeEvent("onkeypress",_37);
_DOMWindow.removeEvent("onresize",_33);
_DOMWindow.onmousewheel=NULL;
_2c.onmousewheel=NULL;
_2c.body.ondrag=NULL;
_2c.body.onselectstart=NULL;
_2a._DOMWindow=nil;
},NO);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_45,_46,_47){
with(_45){
if(_DOMWindow){
return _DOMWindow.focus();
}
_DOMWindow=window.open("","_blank","menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left="+(_contentRect.origin.x)+",top="+(_contentRect.origin.y)+",width="+(_contentRect.size.width)+",height="+(_contentRect.size.height));
_DOMWindow.document.write("<html><head></head><body style = 'background-color:transparent;'></body></html>");
_DOMWindow.document.close();
if(!objj_msgSend(CPPlatform,"isBrowser")){
_DOMWindow.cpWindowNumber=objj_msgSend(_45._only,"windowNumber");
_DOMWindow.cpSetFrame(_contentRect);
_DOMWindow.cpSetLevel(_level);
_DOMWindow.cpSetHasShadow(_hasShadow);
_DOMWindow.cpSetShadowStyle(_shadowStyle);
}
objj_msgSend(_45,"registerDOMWindow");
}
}),new objj_method(sel_getUid("orderOut:"),function(_48,_49,_4a){
with(_48){
if(!_DOMWindow){
return;
}
_DOMWindow.close();
}
}),new objj_method(sel_getUid("dragEvent:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=_4d.type,_4f=objj_msgSend(CPDragServer,"sharedDragServer"),_50={x:_4d.clientX,y:_4d.clientY},_51=objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
objj_msgSend(_51,"_setDataTransfer:",_4d.dataTransfer);
if(_4d.type==="dragstart"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
objj_msgSend(_51,"_setPasteboard:",objj_msgSend(_4f,"draggingPasteboard"));
var _52=objj_msgSend(_4f,"draggedWindow"),_53=objj_msgSend(_52,"frame"),_54=_52._DOMElement;
_54.style.left=-(_53.size.width)+"px";
_54.style.top=-(_53.size.height)+"px";
document.getElementsByTagName("body")[0].appendChild(_54);
var _55=objj_msgSend(_4f,"draggingOffset");
_4d.dataTransfer.setDragImage(_54,_55.width,_55.height);
objj_msgSend(_4f,"draggingStartedInPlatformWindow:globalLocation:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="drag"){
objj_msgSend(_4f,"draggingSourceUpdatedWithGlobalLocation:",objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="dragover"||_4e==="dragleave"){
if(_4d.preventDefault){
_4d.preventDefault();
}
var _56="none",_57=objj_msgSend(_4f,"draggingUpdatedInPlatformWindow:location:",_4b,_50);
if(_57===CPDragOperationMove||_57===CPDragOperationGeneric||_57===CPDragOperationPrivate){
_56="move";
}else{
if(_57===CPDragOperationCopy){
_56="copy";
}else{
if(_57===CPDragOperationLink){
_56="link";
}
}
}
_4d.dataTransfer.dropEffect=_56;
}else{
if(_4e==="dragend"){
objj_msgSend(_4f,"draggingEndedInPlatformWindow:globalLocation:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
objj_msgSend(_4f,"performDragOperationInPlatformWindow:",_4b);
if(_4d.preventDefault){
_4d.preventDefault();
}
if(_4d.stopPropagation){
_4d.stopPropagation();
}
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyEvent:"),function(_58,_59,_5a){
with(_58){
var _5b,_5c=_5a.timeStamp?_5a.timeStamp:new Date(),_5d=(_5a.target||_5a.srcElement),_5e=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_5f=(_5a.shiftKey?CPShiftKeyMask:0)|(_5a.ctrlKey?CPControlKeyMask:0)|(_5a.altKey?CPAlternateKeyMask:0)|(_5a.metaKey?CPCommandKeyMask:0);
if(_11[_5d.tagName]&&_5d!=_DOMFocusElement&&_5d!=_DOMPasteboardElement){
return;
}
_14=!(_5f&(CPControlKeyMask|CPCommandKeyMask))||_16[String.fromCharCode(_5a.keyCode||_5a.charCode).toLowerCase()]||_15[_5a.keyCode];
var _60=NO,_61=NO;
switch(_5a.type){
case "keydown":
_keyCode=_5a.keyCode;
var _62=String.fromCharCode(_keyCode).toLowerCase();
if(_62=="v"&&(_5f&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_60=YES;
}else{
if((_62=="c"||_62=="x")&&(_5f&CPPlatformActionKeyMask)){
_61=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_17[_keyCode]&&(_keyCode==_18||!(_5f&CPControlKeyMask))){
return;
}
}
}
}
case "keypress":
if((_5a.target||_5a.srcElement)==_DOMPasteboardElement){
return;
}
var _63=_keyCode,_64=_5a.keyCode||_5a.charCode,_65=(_charCodes[_63]!=nil);
_charCodes[_63]=_64;
var _62=String.fromCharCode(_64),_66=_62.toLowerCase();
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_5f,_5c,_5e,nil,_62,_66,_65,_63);
if(_60){
_pasteboardKeyDownEvent=_5b;
window.setNativeTimeout(function(){
objj_msgSend(_58,"_checkPasteboardElement");
},0);
return;
}
break;
case "keyup":
var _63=_5a.keyCode,_64=_charCodes[_63];
_charCodes[_63]=nil;
var _62=String.fromCharCode(_64),_66=_62.toLowerCase();
if(!(_5f&CPShiftKeyMask)){
_62=_66;
}
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_5f,_5c,_5e,nil,_62,_66,NO,_63);
break;
}
if(_5b){
_5b._DOMEvent=_5a;
objj_msgSend(CPApp,"sendEvent:",_5b);
if(_61){
var _67=objj_msgSend(CPPasteboard,"generalPasteboard"),_68=objj_msgSend(_67,"types");
if(_68.length){
if(objj_msgSend(_68,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_67,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_67,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_58,"_clearPasteboardElement");
},0);
}
return;
}
}
if(_14){
_13(_5a,_58);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("scrollEvent:"),function(_69,_6a,_6b){
with(_69){
if(!_6b){
_6b=window.event;
}
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=0,y=0,_6e=_6b.target;
while(_6e.nodeType!==1){
_6e=_6e.parentNode;
}
if(_6e.offsetParent){
do{
x+=_6e.offsetLeft;
y+=_6e.offsetTop;
}while(_6e=_6e.offsetParent);
}
var _6f={x:(x+((_6b.clientX-8)/15)),y:(y+((_6b.clientY-8)/15))};
}else{
var _6f={x:_6b.clientX,y:_6b.clientY};
}
var _70=0,_71=0,_72=0,_73=_6b.timeStamp?_6b.timeStamp:new Date(),_74=(_6b.shiftKey?CPShiftKeyMask:0)|(_6b.ctrlKey?CPControlKeyMask:0)|(_6b.altKey?CPAlternateKeyMask:0)|(_6b.metaKey?CPCommandKeyMask:0);
_14=YES;
var _75=objj_msgSend(_69,"hitTest:",_6f);
if(!_75){
return;
}
var _72=objj_msgSend(_75,"windowNumber");
_6f=objj_msgSend(_75,"convertBridgeToBase:",_6f);
if(typeof _6b.wheelDeltaX!="undefined"){
_70=_6b.wheelDeltaX/120;
_71=_6b.wheelDeltaY/120;
}else{
if(_6b.wheelDelta){
_71=_6b.wheelDelta/120;
}else{
if(_6b.detail){
_71=-_6b.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_70=-_70;
_71=-_71;
}
var _76=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_6f,_74,_73,_72,nil,-1,1,0);
_76._DOMEvent=_6b;
_76._deltaX=_70;
_76._deltaY=_71;
objj_msgSend(CPApp,"sendEvent:",_76);
if(_14){
_13(_6b,_69);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("resizeEvent:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_77,"contentRect").size;
objj_msgSend(_77,"updateFromNativeContentRect");
var _7b=_windowLevels,_7c=_windowLayers,_7d=_7b.length;
while(_7d--){
var _7e=objj_msgSend(_7c,"objectForKey:",_7b[_7d])._windows,_7f=_7e.length;
while(_7f--){
objj_msgSend(_7e[_7f],"resizeWithOldPlatformWindowSize:",_7a);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("touchEvent:"),function(_80,_81,_82){
with(_80){
if(_82.touches&&(_82.touches.length==1||(_82.touches.length==0&&_82.changedTouches.length==1))){
var _83={};
switch(_82.type){
case CPDOMEventTouchStart:
_83.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_83.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_83.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_83.type=CPDOMEventMouseUp;
break;
}
var _84=_82.touches.length?_82.touches[0]:_82.changedTouches[0];
_83.clientX=_84.clientX;
_83.clientY=_84.clientY;
_83.timestamp=_82.timestamp;
_83.target=_82.target;
_83.shiftKey=_83.ctrlKey=_83.altKey=_83.metaKey=false;
_83.preventDefault=function(){
if(_82.preventDefault){
_82.preventDefault();
}
};
_83.stopPropagation=function(){
if(_82.stopPropagation){
_82.stopPropagation();
}
};
objj_msgSend(_80,"_bridgeMouseEvent:",_83);
return;
}else{
if(_82.preventDefault){
_82.preventDefault();
}
if(_82.stopPropagation){
_82.stopPropagation();
}
}
}
}),new objj_method(sel_getUid("mouseEvent:"),function(_85,_86,_87){
with(_85){
var _88=_overriddenEventType||_87.type;
if(_88==="dblclick"){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_85,"_bridgeMouseEvent:",_87);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_85,"_bridgeMouseEvent:",_87);
_overriddenEventType=nil;
return;
}
var _89,_8a={x:_87.clientX,y:_87.clientY},_8b=_87.timeStamp?_87.timeStamp:new Date(),_8c=(_87.target||_87.srcElement),_8d=0,_8e=(_87.shiftKey?CPShiftKeyMask:0)|(_87.ctrlKey?CPControlKeyMask:0)|(_87.altKey?CPAlternateKeyMask:0)|(_87.metaKey?CPCommandKeyMask:0);
_14=YES;
if(_mouseDownWindow){
_8d=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _8f=objj_msgSend(_85,"hitTest:",_8a);
if((_87.type===CPDOMEventMouseDown)&&_8f){
_mouseDownWindow=_8f;
}
_8d=objj_msgSend(_8f,"windowNumber");
}
if(_8d){
_8a=objj_msgSend(CPApp._windows[_8d],"convertPlatformWindowToBase:",_8a);
}
if(_88==="mouseup"){
if(_mouseIsDown){
_89=_90(_87,CPLeftMouseUp,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseUp,_8b,_8a),0);
_mouseIsDown=NO;
_lastMouseUp=_89;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
}else{
if(_88==="mousedown"){
if(_11[_8c.tagName]&&_8c!=_DOMFocusElement){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","false");
_DOMBodyElement.style["-khtml-user-drag"]="none";
}
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0));
return;
}else{
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","true");
_DOMBodyElement.style["-khtml-user-drag"]="element";
}
}
_89=_90(_87,CPLeftMouseDown,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0);
_mouseIsDown=YES;
_lastMouseDown=_89;
}else{
if(_DOMEventMode){
return;
}
_89=_90(_87,_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_8a,_8e,_8b,_8d,nil,-1,1,0);
}
}
var _91=objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"isDragging");
if(_89&&(!_91||!_19)){
_89._DOMEvent=_87;
objj_msgSend(CPApp,"sendEvent:",_89);
}
if(_14&&(!_19||_88!=="mousedown"&&!_91)){
_13(_87,_85);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_92,_93,_94,_95){
with(_92){
var _96=objj_msgSend(_windowLayers,"objectForKey:",_94);
if(!_96&&_95){
_96=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_94);
objj_msgSend(_windowLayers,"setObject:forKey:",_96,_94);
var low=0,_98=_windowLevels.length-1,_99;
while(low<=_98){
_99=FLOOR((low+_98)/2);
if(_windowLevels[_99]>_94){
_98=_99-1;
}else{
low=_99+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_94,_windowLevels[_99]>_94?_99:_99+1);
_96._DOMElement.style.zIndex=_94;
_DOMBodyElement.appendChild(_96._DOMElement);
}
return _96;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_9a,_9b,_9c,_9d,_9e){
with(_9a){
var _9f=objj_msgSend(_9a,"layerAtLevel:create:",objj_msgSend(_9d,"level"),_9c!=CPWindowOut);
if(_9c==CPWindowOut){
return objj_msgSend(_9f,"removeWindow:",_9d);
}
objj_msgSend(_9f,"insertWindow:atIndex:",_9d,(_9e?(_9c==CPWindowAbove?_9e._index+1:_9e._index):CPNotFound));
}
}),new objj_method(sel_getUid("_removeLayers"),function(_a0,_a1){
with(_a0){
var _a2=_windowLevels,_a3=_windowLayers,_a4=_a2.length;
while(_a4--){
var _a5=objj_msgSend(_a3,"objectForKey:",_a2[_a4]);
_DOMBodyElement.removeChild(_a5._DOMElement);
}
}
}),new objj_method(sel_getUid("_addLayers"),function(_a6,_a7){
with(_a6){
var _a8=_windowLevels,_a9=_windowLayers,_aa=_a8.length;
while(_aa--){
var _ab=objj_msgSend(_a9,"objectForKey:",_a8[_aa]);
_DOMBodyElement.appendChild(_ab._DOMElement);
}
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_ac,_ad,_ae,_af){
with(_ac){
var _b0=_windowLevels,_b1=_windowLayers,_b2=_b0.length;
while(_b2--){
if(_b0[_b2]>=CPDraggingWindowLevel){
continue;
}
var _b3=objj_msgSend(_b1,"objectForKey:",_b0[_b2])._windows,_b4=_b3.length;
while(_b4--){
var _b5=_b3[_b4];
if(objj_msgSend(_b5,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_b5,"_dragHitTest:pasteboard:",_ae,_af);
}
if(objj_msgSend(_b5,"containsPoint:",_ae)){
return objj_msgSend(_b5,"_dragHitTest:pasteboard:",_ae,_af);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_b6,_b7,_b8){
with(_b6){
_14=!_b8;
}
}),new objj_method(sel_getUid("hitTest:"),function(_b9,_ba,_bb){
with(_b9){
if(_b9._only){
return _b9._only;
}
var _bc=_windowLevels,_bd=_windowLayers,_be=_bc.length,_bf=nil;
while(_be--&&!_bf){
var _c0=objj_msgSend(_bd,"objectForKey:",_bc[_be])._windows,_c1=_c0.length;
while(_c1--&&!_bf){
var _c2=_c0[_c1];
if(!_c2._ignoresMouseEvents&&objj_msgSend(_c2,"containsPoint:",_bb)){
_bf=_c2;
}
}
}
return _bf;
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_c3,_c4){
with(_c3){
var _c5=_DOMPasteboardElement.value;
if(objj_msgSend(_c5,"length")){
var _c6=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_c6,"_stateUID")!=_c5){
objj_msgSend(_c6,"declareTypes:owner:",[CPStringPboardType],_c3);
objj_msgSend(_c6,"setString:forType:",_c5,CPStringPboardType);
}
}
objj_msgSend(_c3,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_c7,_c8){
with(_c7){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
class_addMethods(_1b,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_c9,_ca,_cb){
with(_c9){
for(var i=_cb.length;i>0;i--){
_16[""+_cb[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_cd,_ce,_cf){
with(_cd){
_16[_cf.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_d0,_d1){
with(_d0){
_16={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_d2,_d3,_d4){
with(_d2){
for(var i=_d4.length;i>0;i--){
_15[_d4[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_d6,_d7,_d8){
with(_d6){
_15[_d8]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_d9,_da){
with(_d9){
_15={};
}
})]);
var _db=objj_msgSend(CPEvent,"class");
var _90=function(_dc,_dd,_de,_df,_e0,_e1,_e2,_e3,_e4,_e5){
_dc.isa=_db;
_dc._type=_dd;
_dc._location=_de;
_dc._modifierFlags=_df;
_dc._timestamp=_e0;
_dc._windowNumber=_e1;
_dc._window=nil;
_dc._context=_e2;
_dc._eventNumber=_e3;
_dc._clickCount=_e4;
_dc._pressure=_e5;
return _dc;
};
var _e6=5,_e7=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _12=function(_e8,_e9,_ea){
if(!_e8){
return 1;
}
var _eb=objj_msgSend(_e8,"locationInWindow");
return (_e9-objj_msgSend(_e8,"timestamp")<_e7&&ABS(_eb.x-_ea.x)<_e6&&ABS(_eb.y-_ea.y)<_e6)?objj_msgSend(_e8,"clickCount")+1:1;
};
var _13=function(_ec,_ed){
_ec.cancelBubble=true;
_ec.returnValue=false;
if(_ec.preventDefault){
_ec.preventDefault();
}
if(_ec.stopPropagation){
_ec.stopPropagation();
}
if(_ec.type===CPDOMEventMouseDown){
_ed._DOMFocusElement.focus();
_ed._DOMFocusElement.blur();
}
};
CPWindowObjectList=function(){
var _ee=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_ef=_ee._windowLevels,_f0=_ee._windowLayers,_f1=_ef.length,_f2=[];
while(_f1--){
var _f3=objj_msgSend(_f0,"objectForKey:",_ef[_f1])._windows,_f4=_f3.length;
while(_f4--){
_f2.push(_f3[_f4]);
}
}
return _f2;
};
CPWindowList=function(){
var _f5=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_f6=_f5._windowLevels,_f7=_f5._windowLayers,_f8=_f6.length,_f9=[];
while(_f8--){
var _fa=objj_msgSend(_f7,"objectForKey:",_f6[_f8])._windows,_fb=_fa.length;
while(_fb--){
_f9.push(objj_msgSend(_fa[_fb],"windowNumber"));
}
}
return _f9;
};
p;18;CPPlatformWindow.jI;21;Foundation/CPObject.jc;3467;
var _1=NULL;
var _2=objj_allocateClassPair(CPObject,"CPPlatformWindow"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_contentRect"),new objj_ivar("_level"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowStyle")]);
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
_contentRect={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
objj_msgSend(_14,"updateNativeContentRect");
}
}),new objj_method(sel_getUid("updateFromNativeContentRect"),function(_17,_18){
with(_17){
objj_msgSend(_17,"setContentRect:",objj_msgSend(_17,"nativeContentRect"));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_19,"contentRect");
return {x:_1b.x+(_1c.origin.x),y:_1b.y+(_1c.origin.y)};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(_1d,_1e,_1f){
with(_1d){
var _20=objj_msgSend(_1d,"contentRect");
return {x:_1f.x-(_20.origin.x),y:_1f.y-(_20.origin.y)};
}
}),new objj_method(sel_getUid("isVisible"),function(_21,_22){
with(_21){
return NO;
}
}),new objj_method(sel_getUid("deminiaturize:"),function(_23,_24,_25){
with(_23){
}
}),new objj_method(sel_getUid("miniaturize:"),function(_26,_27,_28){
with(_26){
}
}),new objj_method(sel_getUid("setLevel:"),function(_29,_2a,_2b){
with(_29){
_level=_2b;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_2c,_2d,_2e){
with(_2c){
_hasShadow=_2e;
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_2f,_30,_31){
with(_2f){
_shadowStyle=_31;
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
p;15;CPPopUpButton.ji;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;13908;
var _1=7;
CPPopUpButtonStatePullsDown=CPThemeState("pulls-down");
var _2=objj_allocateClassPair(CPButton,"CPPopUpButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_selectedIndex"),new objj_ivar("_preferredEdge"),new objj_ivar("_menu")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:pullsDown:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPButton")},"initWithFrame:",_6);
if(_4){
_selectedIndex=CPNotFound;
_preferredEdge=CPMaxYEdge;
objj_msgSend(_4,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
objj_msgSend(_4,"setValue:forThemeAttribute:",CPLineBreakByTruncatingTail,"line-break-mode");
objj_msgSend(_4,"setMenu:",objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""));
objj_msgSend(_4,"setPullsDown:",_7);
}
return _4;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithFrame:pullsDown:",_a,NO);
}
}),new objj_method(sel_getUid("setPullsDown:"),function(_b,_c,_d){
with(_b){
if(_d){
var _e=objj_msgSend(_b,"setThemeState:",CPPopUpButtonStatePullsDown);
}else{
var _e=objj_msgSend(_b,"unsetThemeState:",CPPopUpButtonStatePullsDown);
}
if(!_e){
return;
}
var _f=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_f,"count")<=0){
return;
}
objj_msgSend(_f[0],"setHidden:",objj_msgSend(_b,"pullsDown"));
objj_msgSend(_b,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("pullsDown"),function(_10,_11){
with(_10){
return objj_msgSend(_10,"hasThemeState:",CPPopUpButtonStatePullsDown);
}
}),new objj_method(sel_getUid("addItem:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_menu,"addItem:",_14);
}
}),new objj_method(sel_getUid("addItemWithTitle:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_menu,"addItemWithTitle:action:keyEquivalent:",_17,NULL,nil);
}
}),new objj_method(sel_getUid("addItemsWithTitles:"),function(_18,_19,_1a){
with(_18){
var _1b=0,_1c=objj_msgSend(_1a,"count");
for(;_1b<_1c;++_1b){
objj_msgSend(_18,"addItemWithTitle:",_1a[_1b]);
}
}
}),new objj_method(sel_getUid("insertItemWithTitle:atIndex:"),function(_1d,_1e,_1f,_20){
with(_1d){
var _21=objj_msgSend(_1d,"itemArray"),_22=objj_msgSend(_21,"count");
while(_22--){
if(objj_msgSend(_21[_22],"title")==_1f){
objj_msgSend(_1d,"removeItemAtIndex:",_22);
}
}
objj_msgSend(_menu,"insertItemWithTitle:action:keyEquivalent:atIndex:",_1f,NULL,nil,_20);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_23,_24){
with(_23){
var _25=objj_msgSend(_menu,"numberOfItems");
while(_25--){
objj_msgSend(_menu,"removeItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("removeItemWithTitle:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_26,"removeItemAtIndex:",objj_msgSend(_26,"indexOfItemWithTitle:",_28));
objj_msgSend(_26,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_menu,"removeItemAtIndex:",_2b);
objj_msgSend(_29,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectedItem"),function(_2c,_2d){
with(_2c){
if(_selectedIndex<0||_selectedIndex>objj_msgSend(_2c,"numberOfItems")-1){
return nil;
}
return objj_msgSend(_menu,"itemAtIndex:",_selectedIndex);
}
}),new objj_method(sel_getUid("titleOfSelectedItem"),function(_2e,_2f){
with(_2e){
return objj_msgSend(objj_msgSend(_2e,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_30,_31){
with(_30){
return _selectedIndex;
}
}),new objj_method(sel_getUid("objectValue"),function(_32,_33){
with(_32){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItem:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"selectItemAtIndex:",objj_msgSend(_34,"indexOfItem:",_36));
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_37,_38,_39){
with(_37){
if(_selectedIndex==_39){
return;
}
if(_selectedIndex>=0&&!objj_msgSend(_37,"pullsDown")){
objj_msgSend(objj_msgSend(_37,"selectedItem"),"setState:",CPOffState);
}
_selectedIndex=_39;
if(_selectedIndex>=0&&!objj_msgSend(_37,"pullsDown")){
objj_msgSend(objj_msgSend(_37,"selectedItem"),"setState:",CPOnState);
}
objj_msgSend(_37,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectItemWithTag:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3a,"selectItemAtIndex:",objj_msgSend(_3a,"indexOfItemWithTag:",_3c));
}
}),new objj_method(sel_getUid("selectItemWithTitle:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_3d,"selectItemAtIndex:",objj_msgSend(_3d,"indexOfItemWithTitle:",_3f));
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
objj_msgSend(_40,"selectItemAtIndex:",objj_msgSend(_42,"intValue"));
}
}),new objj_method(sel_getUid("menu"),function(_43,_44){
with(_43){
return _menu;
}
}),new objj_method(sel_getUid("setMenu:"),function(_45,_46,_47){
with(_45){
if(_menu===_47){
return;
}
var _48=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_48,"removeObserver:name:object:",_45,CPMenuDidRemoveItemNotification,_menu);
}
_menu=_47;
if(_menu){
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_48,"addObserver:selector:name:object:",_45,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
objj_msgSend(_45,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("numberOfItems"),function(_49,_4a){
with(_49){
return objj_msgSend(_menu,"numberOfItems");
}
}),new objj_method(sel_getUid("itemArray"),function(_4b,_4c){
with(_4b){
return objj_msgSend(_menu,"itemArray");
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_4d,_4e,_4f){
with(_4d){
return objj_msgSend(_menu,"itemAtIndex:",_4f);
}
}),new objj_method(sel_getUid("itemTitleAtIndex:"),function(_50,_51,_52){
with(_50){
return objj_msgSend(objj_msgSend(_menu,"itemAtIndex:",_52),"title");
}
}),new objj_method(sel_getUid("itemTitles"),function(_53,_54){
with(_53){
var _55=[],_56=objj_msgSend(_53,"itemArray"),_57=0,_58=objj_msgSend(_56,"count");
for(;_57<_58;++_57){
_56.push(objj_msgSend(_56[_57],"title"));
}
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_59,_5a,_5b){
with(_59){
return objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(_menu,"indexOfItemWithTitle:",_5b));
}
}),new objj_method(sel_getUid("lastItem"),function(_5c,_5d){
with(_5c){
return objj_msgSend(objj_msgSend(_menu,"itemArray"),"lastObject");
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_5e,_5f,_60){
with(_5e){
return objj_msgSend(_menu,"indexOfItem:",_60);
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_61,_62,_63){
with(_61){
return objj_msgSend(_menu,"indexOfItemWithTag:",_63);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_64,_65,_66){
with(_64){
return objj_msgSend(_menu,"indexOfItemWithTitle:",_66);
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_67,_68,_69){
with(_67){
return objj_msgSend(_menu,"indexOfItemWithRepresentedObject:",_69);
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:action:"),function(_6a,_6b,_6c,_6d){
with(_6a){
return objj_msgSend(_menu,"indexOfItemWithTarget:action:",_6c,_6d);
}
}),new objj_method(sel_getUid("preferredEdge"),function(_6e,_6f){
with(_6e){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_70,_71,_72){
with(_70){
_preferredEdge=_72;
}
}),new objj_method(sel_getUid("setTitle:"),function(_73,_74,_75){
with(_73){
if(objj_msgSend(_73,"title")===_75){
return;
}
if(objj_msgSend(_73,"pullsDown")){
var _76=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_76,"count")<=0){
objj_msgSend(_73,"addItemWithTitle:",_75);
}else{
objj_msgSend(_76[0],"setTitle:",_75);
objj_msgSend(_73,"synchronizeTitleAndSelectedItem");
}
}else{
var _77=objj_msgSend(_73,"indexOfItemWithTitle:",_75);
if(_77<0){
objj_msgSend(_73,"addItemWithTitle:",_75);
_77=objj_msgSend(_73,"numberOfItems")-1;
}
objj_msgSend(_73,"selectItemAtIndex:",_77);
}
}
}),new objj_method(sel_getUid("setImage:"),function(_78,_79,_7a){
with(_78){
}
}),new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"),function(_7b,_7c){
with(_7b){
var _7d=nil;
if(objj_msgSend(_7b,"pullsDown")){
var _7e=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_7e,"count")>0){
_7d=_7e[0];
}
}else{
_7d=objj_msgSend(_7b,"selectedItem");
}
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setImage:",objj_msgSend(_7d,"image"));
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setTitle:",objj_msgSend(_7d,"title"));
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_81,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(_selectedIndex<0){
objj_msgSend(_7f,"selectItemAtIndex:",0);
}else{
if(_82==_selectedIndex){
objj_msgSend(_7f,"synchronizeTitleAndSelectedItem");
}else{
if(_82<_selectedIndex){
++_selectedIndex;
}
}
}
if(_82==0&&objj_msgSend(_7f,"pullsDown")){
var _83=objj_msgSend(_menu,"itemArray");
objj_msgSend(_83[0],"setHidden:",YES);
if(_83.length>0){
objj_msgSend(_83[1],"setHidden:",NO);
}
}
var _84=objj_msgSend(_menu,"itemArray")[_82],_85=objj_msgSend(_84,"action");
if(!_85||(_85===sel_getUid("_popUpItemAction:"))){
objj_msgSend(_84,"setTarget:",_7f);
objj_msgSend(_84,"setAction:",sel_getUid("_popUpItemAction:"));
}
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(objj_msgSend(_88,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(objj_msgSend(_86,"pullsDown")&&_89!=0){
return;
}
if(!objj_msgSend(_86,"pullsDown")&&_89!=_selectedIndex){
return;
}
objj_msgSend(_86,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_8a,"numberOfItems");
if(_8d<=_selectedIndex&&_8d>0){
objj_msgSend(_8a,"selectItemAtIndex:",_8d-1);
}else{
objj_msgSend(_8a,"synchronizeTitleAndSelectedItem");
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8e,_8f,_90){
with(_8e){
if(!objj_msgSend(_8e,"isEnabled")||!objj_msgSend(_8e,"numberOfItems")){
return;
}
objj_msgSend(_8e,"highlight:",YES);
var _91=objj_msgSend(_8e,"menu"),_92=objj_msgSend(_8e,"window"),_93=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_91,objj_msgSend(_8e,"font"));
objj_msgSend(_93,"setDelegate:",_8e);
objj_msgSend(_93,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
if(objj_msgSend(_8e,"pullsDown")){
var _94=objj_msgSend(_92,"convertBaseToGlobal:",objj_msgSend(_8e,"convertPoint:toView:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_8e,"bounds"))),nil));
}else{
var _95=objj_msgSend(_8e,"convertRect:toView:",objj_msgSend(_8e,"contentRectForBounds:",objj_msgSend(_8e,"bounds")),nil),_94=objj_msgSend(_92,"convertBaseToGlobal:",_95.origin),_96=objj_msgSend(_93,"rectForItemAtIndex:",_selectedIndex);
_94.x-=CGRectGetMinX(_96)+objj_msgSend(_93,"overlapOffsetWidth")+objj_msgSend(objj_msgSend(objj_msgSend(_91,"itemAtIndex:",_selectedIndex),"_menuItemView"),"overlapOffsetWidth");
_94.y-=CGRectGetMinY(_96)+(CGRectGetHeight(_96)-CGRectGetHeight(_95))/2;
}
objj_msgSend(_93,"setFrameOrigin:",_94);
var _97=CGRectGetMaxX(objj_msgSend(_93,"frame")),_98=objj_msgSend(_92,"convertBaseToGlobal:",CGPointMake(CGRectGetMaxX(objj_msgSend(_8e,"convertRect:toView:",objj_msgSend(_8e,"bounds"),nil)),0)).x;
if(_97<_98){
objj_msgSend(_93,"setMinWidth:",CGRectGetWidth(objj_msgSend(_93,"frame"))+_98-_97-(objj_msgSend(_8e,"pullsDown")?0:_1));
}
objj_msgSend(_93,"orderFront:",_8e);
objj_msgSend(_93,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_90,_8e,sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"),function(_99,_9a,_9b,_9c){
with(_99){
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_9b);
objj_msgSend(_99,"highlight:",NO);
var _9d=objj_msgSend(_menu,"indexOfItem:",_9c);
if(_9d==CPNotFound){
return;
}
objj_msgSend(_99,"selectItemAtIndex:",_9d);
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9c,"action"),objj_msgSend(_9c,"target"),_9c);
}
}),new objj_method(sel_getUid("_popUpItemAction:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"sendAction:to:",objj_msgSend(_9e,"action"),objj_msgSend(_9e,"target"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeClass"),function(_a1,_a2){
with(_a1){
return "popup-button";
}
})]);
var _a3="CPPopUpButtonMenuKey",_a4="CPPopUpButtonSelectedIndexKey",_a5="CPPopUpButtonPullsDownKey";
var _2=objj_getClass("CPPopUpButton");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPopUpButton\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
_a6=objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPButton")},"initWithCoder:",_a8);
if(_a6){
_selectedIndex=-1;
objj_msgSend(_a6,"setMenu:",objj_msgSend(_a8,"decodeObjectForKey:",_a3));
objj_msgSend(_a6,"selectItemAtIndex:",objj_msgSend(_a8,"decodeObjectForKey:",_a4));
}
return _a6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a9,_aa,_ab){
with(_a9){
objj_msgSendSuper({receiver:_a9,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_ab);
objj_msgSend(_ab,"encodeObject:forKey:",_menu,_a3);
objj_msgSend(_ab,"encodeInt:forKey:",_selectedIndex,_a4);
}
})]);
p;21;CPProgressIndicator.jI;19;AppKit/CGGeometry.jI;20;AppKit/CPImageView.jI;15;AppKit/CPView.jc;8511;
CPProgressIndicatorBarStyle=0;
CPProgressIndicatorSpinningStyle=1;
CPProgressIndicatorHUDBarStyle=2;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPView,"CPProgressIndicator"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_doubleValue"),new objj_ivar("_controlSize"),new objj_ivar("_isIndeterminate"),new objj_ivar("_style"),new objj_ivar("_isAnimating"),new objj_ivar("_isDisplayedWhenStoppedSet"),new objj_ivar("_isDisplayedWhenStopped"),new objj_ivar("_barView")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPView")},"initWithFrame:",_9);
if(_7){
_minValue=0;
_maxValue=100;
_doubleValue=0;
_style=CPProgressIndicatorBarStyle;
_isDisplayedWhenStoppedSet=NO;
_controlSize=CPRegularControlSize;
objj_msgSend(_7,"updateBackgroundColor");
objj_msgSend(_7,"drawBar");
}
return _7;
}
}),new objj_method(sel_getUid("setUsesThreadedAnimation:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("startAnimation:"),function(_d,_e,_f){
with(_d){
_isAnimating=YES;
objj_msgSend(_d,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("stopAnimation:"),function(_10,_11,_12){
with(_10){
_isAnimating=NO;
objj_msgSend(_10,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("usesThreadedAnimation"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("incrementBy:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setDoubleValue:",_doubleValue+_17);
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_18,_19,_1a){
with(_18){
_doubleValue=MIN(MAX(_1a,_minValue),_maxValue);
objj_msgSend(_18,"drawBar");
}
}),new objj_method(sel_getUid("doubleValue"),function(_1b,_1c){
with(_1b){
return _doubleValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_1d,_1e,_1f){
with(_1d){
_minValue=_1f;
}
}),new objj_method(sel_getUid("minValue"),function(_20,_21){
with(_20){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_22,_23,_24){
with(_22){
_maxValue=_24;
}
}),new objj_method(sel_getUid("maxValue"),function(_25,_26){
with(_25){
return _maxValue;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_27,_28,_29){
with(_27){
if(_controlSize==_29){
return;
}
_controlSize=_29;
objj_msgSend(_27,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("controlSize"),function(_2a,_2b){
with(_2a){
return _controlSize;
}
}),new objj_method(sel_getUid("setControlTint:"),function(_2c,_2d,_2e){
with(_2c){
}
}),new objj_method(sel_getUid("controlTint"),function(_2f,_30){
with(_2f){
return 0;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("isBezeled"),function(_34,_35){
with(_34){
return YES;
}
}),new objj_method(sel_getUid("setIndeterminate:"),function(_36,_37,_38){
with(_36){
if(_isIndeterminate==_38){
return;
}
_isIndeterminate=_38;
objj_msgSend(_36,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("isIndeterminate"),function(_39,_3a){
with(_39){
return _isIndeterminate;
}
}),new objj_method(sel_getUid("setStyle:"),function(_3b,_3c,_3d){
with(_3b){
if(_style==_3d){
return;
}
_style=_3d;
objj_msgSend(_3b,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_3e,_3f){
with(_3e){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_3e,"setFrameSize:",objj_msgSend(objj_msgSend(_1[_controlSize],"patternImage"),"size"));
}else{
objj_msgSend(_3e,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_3e,"frame")),_4[_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle]+_CPControlIdentifierForControlSize(_controlSize)][0].height));
}
}
}),new objj_method(sel_getUid("setDisplayedWhenStopped:"),function(_40,_41,_42){
with(_40){
if(_isDisplayedWhenStoppedSet&&_isDisplayedWhenStopped==_42){
return;
}
_isDisplayedWhenStoppedSet=YES;
_isDisplayedWhenStopped=_42;
objj_msgSend(_40,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("isDisplayedWhenStopped"),function(_43,_44){
with(_43){
if(_isDisplayedWhenStoppedSet){
return _isDisplayedWhenStopped;
}
if(_style==CPProgressIndicatorBarStyle||_style==CPProgressIndicatorHUDBarStyle){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_hideOrDisplay"),function(_45,_46){
with(_45){
objj_msgSend(_45,"setHidden:",!_isAnimating&&!objj_msgSend(_45,"isDisplayedWhenStopped"));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_47,_48,_49){
with(_47){
objj_msgSendSuper({receiver:_47,super_class:objj_getClass("CPView")},"setFrameSize:",_49);
objj_msgSend(_47,"drawBar");
}
}),new objj_method(sel_getUid("drawBar"),function(_4a,_4b){
with(_4a){
if(_style==CPProgressIndicatorSpinningStyle){
return;
}
if(!_barView){
_barView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(2,2,0,9));
objj_msgSend(_barView,"setBackgroundColor:",objj_msgSend(CPColor,"redColor"));
objj_msgSend(_4a,"addSubview:",_barView);
}
objj_msgSend(_barView,"setBackgroundColor:",_CPControlColorWithPatternImage(_4,_2,"Bar",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_barView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_4a,"bounds"))*(_doubleValue-_minValue)/(_maxValue-_minValue)-4,9));
}
}),new objj_method(sel_getUid("updateBackgroundColor"),function(_4c,_4d){
with(_4c){
if(YES){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_barView,"removeFromSuperview");
_barView=nil;
objj_msgSend(_4c,"setBackgroundColor:",_1[_controlSize]);
}else{
objj_msgSend(_4c,"setBackgroundColor:",_CPControlThreePartImagePattern(NO,_4,_2,"BezelBorder",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_4c,"drawBar");
}
}else{
objj_msgSend(_4c,"setBackgroundColor:",nil);
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_4e,_4f){
with(_4e){
if(_4e!=objj_msgSend(CPProgressIndicator,"class")){
return;
}
var _50=objj_msgSend(CPBundle,"bundleForClass:",_4e);
_1=[];
_1[CPMiniControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
_1[CPSmallControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
_1[CPRegularControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
CPProgressIndicatorBezelBorderViewPool=[];
var _51=CPProgressIndicatorBarStyle,end=CPProgressIndicatorHUDBarStyle;
for(;_51<=end;++_51){
CPProgressIndicatorBezelBorderViewPool[_51]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPMiniControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPSmallControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPRegularControlSize]=[];
}
_2=objj_msgSend(_4e,"className");
_3=[];
_3[CPProgressIndicatorBarStyle]="Bar";
_3[CPProgressIndicatorSpinningStyle]="Spinny";
_3[CPProgressIndicatorHUDBarStyle]="HUDBar";
var _53=_CPControlIdentifierForControlSize(CPRegularControlSize),_54=_CPControlIdentifierForControlSize(CPSmallControlSize),_55=_CPControlIdentifierForControlSize(CPMiniControlSize);
_4=[];
var _56=_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle];
_4[_56+_53]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_54]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_55]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_56=_2+"Bar"+_3[CPProgressIndicatorBarStyle];
_4[_56+_53]={width:1,height:9};
_4[_56+_54]={width:1,height:9};
_4[_56+_55]={width:1,height:9};
_56=_2+"BezelBorder"+_3[CPProgressIndicatorHUDBarStyle];
_4[_56+_53]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_54]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_55]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_56=_2+"Bar"+_3[CPProgressIndicatorHUDBarStyle];
_4[_56+_53]={width:1,height:9};
_4[_56+_54]={width:1,height:9};
_4[_56+_55]={width:1,height:9};
}
})]);
p;9;CPRadio.jI;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jc;5034;
var _1=objj_allocateClassPair(CPButton,"CPRadio"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radioGroup")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:radioGroup:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
objj_msgSend(_3,"setRadioGroup:",_6||objj_msgSend(CPRadioGroup,"new"));
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"initWithFrame:radioGroup:",_9,nil);
}
}),new objj_method(sel_getUid("nextState"),function(_a,_b){
with(_a){
return CPOnState;
}
}),new objj_method(sel_getUid("setRadioGroup:"),function(_c,_d,_e){
with(_c){
if(_radioGroup===_e){
return;
}
objj_msgSend(_radioGroup,"_removeRadio:",_c);
_radioGroup=_e;
objj_msgSend(_radioGroup,"_addRadio:",_c);
}
}),new objj_method(sel_getUid("radioGroup"),function(_f,_10){
with(_f){
return _radioGroup;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPButton")},"setObjectValue:",_13);
if(objj_msgSend(_11,"state")===CPOnState){
objj_msgSend(_radioGroup,"_setSelectedRadio:",_11);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("radioWithTitle:theme:"),function(_14,_15,_16,_17){
with(_14){
return objj_msgSend(_14,"buttonWithTitle:theme:",_16,_17);
}
}),new objj_method(sel_getUid("radioWithTitle:"),function(_18,_19,_1a){
with(_18){
return objj_msgSend(_18,"buttonWithTitle:",_1a);
}
}),new objj_method(sel_getUid("standardButtonWithTitle:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(objj_msgSend(CPRadio,"alloc"),"init");
objj_msgSend(_1e,"setTitle:",_1d);
return _1e;
}
}),new objj_method(sel_getUid("themeClass"),function(_1f,_20){
with(_1f){
return "radio";
}
})]);
var _21="CPRadioRadioGroupKey";
var _1=objj_getClass("CPRadio");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPRadio\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPButton")},"initWithCoder:",_24);
if(_22){
_radioGroup=objj_msgSend(_24,"decodeObjectForKey:",_21);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_27);
objj_msgSend(_27,"encodeObject:forKey:",_radioGroup,_21);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPRadioGroup"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radios"),new objj_ivar("_selectedRadio")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_28,_29){
with(_28){
_28=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("CPObject")},"init");
if(_28){
_radios=objj_msgSend(CPSet,"set");
_selectedRadio=nil;
}
return _28;
}
}),new objj_method(sel_getUid("_addRadio:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_radios,"addObject:",_2c);
if(objj_msgSend(_2c,"state")===CPOnState){
objj_msgSend(_2a,"_setSelectedRadio:",_2c);
}
}
}),new objj_method(sel_getUid("_removeRadio:"),function(_2d,_2e,_2f){
with(_2d){
if(_selectedRadio===_2f){
_selectedRadio=nil;
}
objj_msgSend(_radios,"removeObject:",_2f);
}
}),new objj_method(sel_getUid("_setSelectedRadio:"),function(_30,_31,_32){
with(_30){
if(_selectedRadio===_32){
return;
}
objj_msgSend(_selectedRadio,"setState:",CPOffState);
_selectedRadio=_32;
}
}),new objj_method(sel_getUid("selectedRadio"),function(_33,_34){
with(_33){
return _selectedRadio;
}
}),new objj_method(sel_getUid("radios"),function(_35,_36){
with(_35){
return objj_msgSend(_radios,"allObjects");
}
})]);
var _37="CPRadioGroupRadiosKey",_38="CPRadioGroupSelectedRadioKey";
var _1=objj_getClass("CPRadioGroup");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPRadioGroup\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPObject")},"init");
if(_39){
_radios=objj_msgSend(_3b,"decodeObjectForKey:",_37);
_selectedRadio=objj_msgSend(_3b,"decodeObjectForKey:",_38);
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3e,"encodeObject:forKey:",_radios,_37);
objj_msgSend(_3e,"encodeObject:forKey:",_selectedRadio,_38);
}
})]);
p;13;CPResponder.jI;21;Foundation/CPObject.jc;5749;
CPDeleteKeyCode=8;
CPTabKeyCode=9;
CPReturnKeyCode=13;
CPEscapeKeyCode=27;
CPLeftArrowKeyCode=37;
CPUpArrowKeyCode=38;
CPRightArrowKeyCode=39;
CPDownArrowKeyCode=40;
var _1=objj_allocateClassPair(CPObject,"CPResponder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menu"),new objj_ivar("_nextResponder")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("acceptsFirstResponder"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_5,_6){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_7,_8){
with(_7){
return YES;
}
}),new objj_method(sel_getUid("setNextResponder:"),function(_9,_a,_b){
with(_9){
_nextResponder=_b;
}
}),new objj_method(sel_getUid("nextResponder"),function(_c,_d){
with(_c){
return _nextResponder;
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_e,_f,_10){
with(_e){
var _11=0,_12=objj_msgSend(_10,"count");
for(;_11<_12;++_11){
var _13=_10[_11];
switch(objj_msgSend(_13,"keyCode")){
case CPLeftArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveLeft:"));
break;
case CPRightArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveRight:"));
break;
case CPUpArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveUp:"));
break;
case CPDownArrowKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("moveDown:"));
break;
case CPDeleteKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("deleteBackward:"));
break;
case CPReturnKeyCode:
case 3:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertLineBreak:"));
break;
case CPEscapeKeyCode:
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("cancel:"));
break;
case CPTabKeyCode:
var _14=objj_msgSend(_13,"modifierFlags")&CPShiftKeyMask;
if(!_14){
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertTab:"));
}else{
objj_msgSend(_e,"doCommandBySelector:",sel_getUid("insertBackTab:"));
}
break;
default:
objj_msgSend(_e,"insertText:",objj_msgSend(_13,"characters"));
}
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_nextResponder,"performSelector:withObject:",_16,_17);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_nextResponder,"performSelector:withObject:",_19,_1a);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1c,_1d);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1f,_20);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_nextResponder,"performSelector:withObject:",_22,_23);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_nextResponder,"performSelector:withObject:",_25,_26);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_nextResponder,"performSelector:withObject:",_28,_29);
}
}),new objj_method(sel_getUid("keyDown:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2b,_2c);
}
}),new objj_method(sel_getUid("keyUp:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2e,_2f);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_30,_31,_32){
with(_30){
return NO;
}
}),new objj_method(sel_getUid("insertLineBreak:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"insertNewline:",_35);
}
}),new objj_method(sel_getUid("insertNewline:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_36,"insertNewline:",_38);
}
}),new objj_method(sel_getUid("cancel:"),function(_39,_3a,_3b){
with(_39){
}
}),new objj_method(sel_getUid("insertTab:"),function(_3c,_3d,_3e){
with(_3c){
}
}),new objj_method(sel_getUid("insertBackTab:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("insertText:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_45,"respondsToSelector:",_47)){
objj_msgSend(_45,"performSelector:",_47);
}else{
objj_msgSend(_nextResponder,"doCommandBySelector:",_47);
}
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_48,_49,_4a,_4b){
with(_48){
if(objj_msgSend(_48,"respondsToSelector:",_4a)){
objj_msgSend(_48,"performSelector:withObject:",_4a,_4b);
return YES;
}
return objj_msgSend(_nextResponder,"tryToPerform:with:",_4a,_4b);
}
}),new objj_method(sel_getUid("setMenu:"),function(_4c,_4d,_4e){
with(_4c){
_menu=_4e;
}
}),new objj_method(sel_getUid("menu"),function(_4f,_50){
with(_4f){
return _menu;
}
}),new objj_method(sel_getUid("undoManager"),function(_51,_52){
with(_51){
return objj_msgSend(_nextResponder,"performSelector:",_52);
}
}),new objj_method(sel_getUid("noResponderFor:"),function(_53,_54,_55){
with(_53){
}
})]);
var _56="CPResponderNextResponderKey";
var _1=objj_getClass("CPResponder");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPResponder\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_57,_58,_59){
with(_57){
_57=objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPObject")},"init");
if(_57){
_nextResponder=objj_msgSend(_59,"decodeObjectForKey:",_56);
}
return _57;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5a,_5b,_5c){
with(_5a){
if(_nextResponder!==nil){
objj_msgSend(_5c,"encodeConditionalObject:forKey:",_nextResponder,_56);
}
}
})]);
p;13;CPSavePanel.jI;16;AppKit/CPPanel.jc;953;
var _1=objj_allocateClassPair(CPPanel,"CPSavePanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_URL")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("runModal"),function(_3,_4){
with(_3){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
if(typeof window["cpSavePanel"]==="function"){
var _5=window.cpSavePanel(),_6=_5.button;
_URL=_6?objj_msgSend(CPURL,"URLWithString:",_5.URL):nil;
}else{
var _7=window.prompt("Document Name:"),_6=_7!==null;
_URL=_6?objj_msgSend(objj_msgSend(_3,"class"),"proposedFileURLWithDocumentName:",_7):nil;
}
return _6;
}
}),new objj_method(sel_getUid("URL"),function(_8,_9){
with(_8){
return _URL;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("savePanel"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(CPSavePanel,"alloc"),"init");
}
})]);
p;10;CPScreen.jI;21;Foundation/CPObject.jc;408;
var _1=objj_allocateClassPair(CPObject,"CPScreen"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("visibleFrame"),function(_3,_4){
with(_3){
return {origin:{x:window.screen.availLeft,y:window.screen.availTop},size:{width:window.screen.availWidth,height:window.screen.availHeight}};
}
})]);
p;12;CPScroller.ji;11;CPControl.jc;15644;
CPScrollerNoPart=0;
CPScrollerDecrementPage=1;
CPScrollerKnob=2;
CPScrollerIncrementPage=3;
CPScrollerDecrementLine=4;
CPScrollerIncrementLine=5;
CPScrollerKnobSlot=6;
CPScrollerIncrementArrow=0;
CPScrollerDecrementArrow=1;
CPNoScrollerParts=0;
CPOnlyScrollerArrows=1;
CPAllScrollerParts=2;
var _1=[CPScrollerKnobSlot,CPScrollerDecrementLine,CPScrollerIncrementLine,CPScrollerKnob],_2={},_3={};
_2[CPScrollerDecrementLine]="decrement-line";
_2[CPScrollerIncrementLine]="increment-line";
_2[CPScrollerKnobSlot]="knob-slot";
_2[CPScrollerKnob]="knob";
var _4=objj_allocateClassPair(CPControl,"CPScroller"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_controlSize"),new objj_ivar("_usableParts"),new objj_ivar("_partRects"),new objj_ivar("_isVertical"),new objj_ivar("_knobProportion"),new objj_ivar("_hitPart"),new objj_ivar("_trackingPart"),new objj_ivar("_trackingFloatValue"),new objj_ivar("_trackingStartPoint")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("isVertical"),function(_6,_7){
with(_6){
return _isVertical;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPControl")},"initWithFrame:",_a);
if(_8){
_controlSize=CPRegularControlSize;
_partRects=[];
objj_msgSend(_8,"setFloatValue:",0);
objj_msgSend(_8,"setKnobProportion:",1);
_hitPart=CPScrollerNoPart;
objj_msgSend(_8,"_calculateIsVertical");
}
return _8;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_b,_c,_d){
with(_b){
if(_controlSize==_d){
return;
}
_controlSize=_d;
objj_msgSend(_b,"setNeedsLayout");
objj_msgSend(_b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("controlSize"),function(_e,_f){
with(_e){
return _controlSize;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPControl")},"setObjectValue:",MIN(1,MAX(0,+_12)));
}
}),new objj_method(sel_getUid("setKnobProportion:"),function(_13,_14,_15){
with(_13){
_knobProportion=MIN(1,MAX(0.0001,_15));
objj_msgSend(_13,"setNeedsDisplay:",YES);
objj_msgSend(_13,"setNeedsLayout");
}
}),new objj_method(sel_getUid("knobProportion"),function(_16,_17){
with(_16){
return _knobProportion;
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(_18,_19,_1a){
with(_18){
var _1b=_themeState;
if(_2[_hitPart]+"-color"!==_1a){
_1b&=~CPThemeStateHighlighted;
}
return objj_msgSend(_18,"valueForThemeAttribute:inState:",_1a,_1b);
}
}),new objj_method(sel_getUid("rectForPart:"),function(_1c,_1d,_1e){
with(_1c){
if(_1e==CPScrollerNoPart){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
return _partRects[_1e];
}
}),new objj_method(sel_getUid("testPart:"),function(_1f,_20,_21){
with(_1f){
_21=objj_msgSend(_1f,"convertPoint:fromView:",_21,nil);
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerKnob),_21)){
return CPScrollerKnob;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerDecrementPage),_21)){
return CPScrollerDecrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerIncrementPage),_21)){
return CPScrollerIncrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerDecrementLine),_21)){
return CPScrollerDecrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerIncrementLine),_21)){
return CPScrollerIncrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_1f,"rectForPart:",CPScrollerKnobSlot),_21)){
return CPScrollerKnobSlot;
}
return CPScrollerNoPart;
}
}),new objj_method(sel_getUid("checkSpaceForParts"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"bounds");
if(_knobProportion===1){
_usableParts=CPNoScrollerParts;
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:_24.origin.x,y:_24.origin.y},size:{width:_24.size.width,height:_24.size.height}};
return;
}
_usableParts=CPAllScrollerParts;
var _25=objj_msgSend(_22,"currentValueForThemeAttribute:","knob-inset"),_26=objj_msgSend(_22,"currentValueForThemeAttribute:","track-inset"),_27=(_24.size.width),_28=(_24.size.height);
if(objj_msgSend(_22,"isVertical")){
var _29=objj_msgSend(_22,"currentValueForThemeAttribute:","decrement-line-size"),_2a=objj_msgSend(_22,"currentValueForThemeAttribute:","increment-line-size"),_2b=_29.height+_26.top,_2c=_2a.height+_26.bottom,_2d=_28-_2b-_2c,_2e=objj_msgSend(_22,"currentValueForThemeAttribute:","minimum-knob-length"),_2f=_27-_25.left-_25.right,_30=MAX(_2e,(_2d*_knobProportion)),_31=_2b+(_2d-_30)*objj_msgSend(_22,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:_2b},size:{width:_27,height:_31-_2b}};
_partRects[CPScrollerKnob]={origin:{x:_25.left,y:_31},size:{width:_2f,height:_30}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:_31+_30},size:{width:_27,height:_28-(_31+_30)-_2c}};
_partRects[CPScrollerKnobSlot]={origin:{x:_26.left,y:_2b},size:{width:_27-_26.left-_26.right,height:_2d}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_29.width,height:_29.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:_28-_2a.height},size:{width:_2a.width,height:_2a.height}};
}else{
var _29=objj_msgSend(_22,"currentValueForThemeAttribute:","decrement-line-size"),_2a=objj_msgSend(_22,"currentValueForThemeAttribute:","increment-line-size"),_32=_29.width+_26.left,_33=_2a.width+_26.right;
slotWidth=_27-_32-_33,_2e=objj_msgSend(_22,"currentValueForThemeAttribute:","minimum-knob-length"),_2f=MAX(_2e,(slotWidth*_knobProportion)),_30=_28-_25.top-_25.bottom,_31=_32+(slotWidth-_2f)*objj_msgSend(_22,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:_32,y:0},size:{width:_31-_32,height:_28}};
_partRects[CPScrollerKnob]={origin:{x:_31,y:_25.top},size:{width:_2f,height:_30}};
_partRects[CPScrollerIncrementPage]={origin:{x:_31+_2f,y:0},size:{width:_27-(_31+_2f)-_33,height:_28}};
_partRects[CPScrollerKnobSlot]={origin:{x:_32,y:_26.top},size:{width:slotWidth,height:_28-_26.top-_26.bottom}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_29.width,height:_29.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:_27-_2a.width,y:0},size:{width:_2a.width,height:_2a.height}};
}
}
}),new objj_method(sel_getUid("usableParts"),function(_34,_35){
with(_34){
return _usableParts;
}
}),new objj_method(sel_getUid("drawArrow:highlight:"),function(_36,_37,_38,_39){
with(_36){
}
}),new objj_method(sel_getUid("drawKnob"),function(_3a,_3b){
with(_3a){
}
}),new objj_method(sel_getUid("drawKnobSlot"),function(_3c,_3d){
with(_3c){
}
}),new objj_method(sel_getUid("createViewForPart:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_41,"setHitTests:",NO);
return _41;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_42,_43,_44){
with(_42){
return _partRects[_44];
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_45,_46,_47){
with(_45){
var _48=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_48,"setHitTests:",NO);
return _48;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_49,_4a){
with(_49){
objj_msgSend(_49,"checkSpaceForParts");
var _4b=0,_4c=_1.length;
for(;_4b<_4c;++_4b){
var _4d=_1[_4b];
if(_4b===0){
view=objj_msgSend(_49,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4d,CPWindowBelow,_1[_4b+1]);
}else{
view=objj_msgSend(_49,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4d,CPWindowAbove,_1[_4b-1]);
}
if(view){
objj_msgSend(view,"setBackgroundColor:",objj_msgSend(_49,"currentValueForThemeAttribute:",_2[_4d]+"-color"));
}
}
}
}),new objj_method(sel_getUid("drawParts"),function(_4e,_4f){
with(_4e){
objj_msgSend(_4e,"drawKnobSlot");
objj_msgSend(_4e,"drawKnob");
objj_msgSend(_4e,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
objj_msgSend(_4e,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
}
}),new objj_method(sel_getUid("hitPart"),function(_50,_51){
with(_50){
return _hitPart;
}
}),new objj_method(sel_getUid("trackKnob:"),function(_52,_53,_54){
with(_52){
var _55=objj_msgSend(_54,"type");
if(_55===CPLeftMouseUp){
_hitPart=CPScrollerNoPart;
return;
}
if(_55===CPLeftMouseDown){
_trackingFloatValue=objj_msgSend(_52,"floatValue");
_trackingStartPoint=objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil);
}else{
if(_55===CPLeftMouseDragged){
var _56=objj_msgSend(_52,"rectForPart:",CPScrollerKnob),_57=objj_msgSend(_52,"rectForPart:",CPScrollerKnobSlot),_58=!objj_msgSend(_52,"isVertical")?((_57.size.width)-(_56.size.width)):((_57.size.height)-(_56.size.height));
if(_58<=0){
objj_msgSend(_52,"setFloatValue:",0);
}else{
var _59=objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil);
delta=!objj_msgSend(_52,"isVertical")?_59.x-_trackingStartPoint.x:_59.y-_trackingStartPoint.y;
objj_msgSend(_52,"setFloatValue:",_trackingFloatValue+delta/_58);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_52,sel_getUid("trackKnob:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
objj_msgSend(_52,"sendAction:to:",objj_msgSend(_52,"action"),objj_msgSend(_52,"target"));
}
}),new objj_method(sel_getUid("trackScrollButtons:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5c,"type");
if(_5d===CPLeftMouseUp){
objj_msgSend(_5a,"highlight:",NO);
objj_msgSend(CPEvent,"stopPeriodicEvents");
_hitPart=CPScrollerNoPart;
return;
}
if(_5d===CPLeftMouseDown){
_trackingPart=objj_msgSend(_5a,"hitPart");
_trackingStartPoint=objj_msgSend(_5a,"convertPoint:fromView:",objj_msgSend(_5c,"locationInWindow"),nil);
if(objj_msgSend(_5c,"modifierFlags")&CPAlternateKeyMask){
if(_trackingPart==CPScrollerDecrementLine){
_hitPart=CPScrollerDecrementPage;
}else{
if(_trackingPart==CPScrollerIncrementLine){
_hitPart=CPScrollerIncrementPage;
}else{
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _5e=objj_msgSend(_5a,"rectForPart:",CPScrollerKnob),_5f=!objj_msgSend(_5a,"isVertical")?(_5e.size.width):(_5e.size.height),_60=objj_msgSend(_5a,"rectForPart:",CPScrollerKnobSlot),_61=(!objj_msgSend(_5a,"isVertical")?(_60.size.width):(_60.size.height))-_5f;
objj_msgSend(_5a,"setFloatValue:",((!objj_msgSend(_5a,"isVertical")?_trackingStartPoint.x-(_60.origin.x):_trackingStartPoint.y-(_60.origin.y))-_5f/2)/_61);
_hitPart=CPScrollerKnob;
objj_msgSend(_5a,"sendAction:to:",objj_msgSend(_5a,"action"),objj_msgSend(_5a,"target"));
return objj_msgSend(_5a,"trackKnob:",_5c);
}
}
}
}
objj_msgSend(_5a,"highlight:",YES);
objj_msgSend(_5a,"sendAction:to:",objj_msgSend(_5a,"action"),objj_msgSend(_5a,"target"));
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.5,0.04);
}else{
if(_5d===CPLeftMouseDragged){
_trackingStartPoint=objj_msgSend(_5a,"convertPoint:fromView:",objj_msgSend(_5c,"locationInWindow"),nil);
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _62=objj_msgSend(_5a,"testPart:",objj_msgSend(_5c,"locationInWindow"));
if(_62==CPScrollerDecrementPage||_62==CPScrollerIncrementPage){
_trackingPart=_62;
_hitPart=_62;
}
}
objj_msgSend(_5a,"highlight:",CGRectContainsPoint(objj_msgSend(_5a,"rectForPart:",_trackingPart),_trackingStartPoint));
}else{
if(_5d==CPPeriodic&&CGRectContainsPoint(objj_msgSend(_5a,"rectForPart:",_trackingPart),_trackingStartPoint)){
objj_msgSend(_5a,"sendAction:to:",objj_msgSend(_5a,"action"),objj_msgSend(_5a,"target"));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_5a,sel_getUid("trackScrollButtons:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_calculateIsVertical"),function(_63,_64){
with(_63){
var _65=objj_msgSend(_63,"bounds"),_66=(_65.size.width),_67=(_65.size.height);
_isVertical=_66<_67?1:(_66>_67?0:-1);
if(_isVertical===1){
objj_msgSend(_63,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_63,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_68,_69,_6a){
with(_68){
objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPControl")},"setFrameSize:",_6a);
objj_msgSend(_68,"checkSpaceForParts");
objj_msgSend(_68,"setNeedsLayout");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6b,_6c,_6d){
with(_6b){
if(!objj_msgSend(_6b,"isEnabled")){
return;
}
_hitPart=objj_msgSend(_6b,"testPart:",objj_msgSend(_6d,"locationInWindow"));
switch(_hitPart){
case CPScrollerKnob:
return objj_msgSend(_6b,"trackKnob:",_6d);
case CPScrollerDecrementLine:
case CPScrollerIncrementLine:
case CPScrollerDecrementPage:
case CPScrollerIncrementPage:
return objj_msgSend(_6b,"trackScrollButtons:",_6d);
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("themeClass"),function(_6e,_6f){
with(_6e){
return "scroller";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_70,_71){
with(_70){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,nil,nil,nil,{width:0,height:0},{width:0,height:0},{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},{width:0,height:0}],["knob-slot-color","decrement-line-color","increment-line-color","knob-color","decrement-line-size","increment-line-size","track-inset","knob-inset","minimum-knob-length"]);
}
}),new objj_method(sel_getUid("scrollerWidth"),function(_72,_73){
with(_72){
return 15;
}
}),new objj_method(sel_getUid("scrollerWidthForControlSize:"),function(_74,_75,_76){
with(_74){
return 15;
}
})]);
var _77="CPScrollerControlSize",_78="CPScrollerKnobProportion";
var _4=objj_getClass("CPScroller");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScroller\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_79,_7a,_7b){
with(_79){
if(_79=objj_msgSendSuper({receiver:_79,super_class:objj_getClass("CPControl")},"initWithCoder:",_7b)){
_controlSize=CPRegularControlSize;
if(objj_msgSend(_7b,"containsValueForKey:",_77)){
_controlSize=objj_msgSend(_7b,"decodeIntForKey:",_77);
}
_knobProportion=1;
if(objj_msgSend(_7b,"containsValueForKey:",_78)){
_knobProportion=objj_msgSend(_7b,"decodeFloatForKey:",_78);
}
_partRects=[];
_hitPart=CPScrollerNoPart;
objj_msgSend(_79,"_calculateIsVertical");
}
return _79;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_7e);
objj_msgSend(_7e,"encodeInt:forKey:",_controlSize,_77);
objj_msgSend(_7e,"encodeFloat:forKey:",_knobProportion,_78);
}
})]);
var _4=objj_getClass("CPScroller");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScroller\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("setFloatValue:knobProportion:"),function(_7f,_80,_81,_82){
with(_7f){
objj_msgSend(_7f,"setFloatValue:",_81);
objj_msgSend(_7f,"setKnobProportion:",_82);
}
})]);
p;14;CPScrollView.ji;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;17135;
var _1=objj_allocateClassPair(CPView,"CPScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_headerClipView"),new objj_ivar("_cornerView"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(_3,"addSubview:",_headerClipView);
objj_msgSend(_3,"setHasVerticalScroller:",YES);
objj_msgSend(_3,"setHasHorizontalScroller:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("contentSize"),function(_6,_7){
with(_6){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_8,_9){
with(_8){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setContentView:"),function(_a,_b,_c){
with(_a){
if(_contentView!==_c||!_c){
return;
}
var _d=objj_msgSend(_c,"documentView");
if(_d){
objj_msgSend(_d,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
_contentView=_c;
objj_msgSend(_contentView,"setDocumentView:",_d);
objj_msgSend(_a,"addSubview:",_contentView);
objj_msgSend(_a,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_e,_f){
with(_e){
return _contentView;
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_contentView,"setDocumentView:",_12);
objj_msgSend(_10,"_updateCornerAndHeaderView");
objj_msgSend(_10,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_13,_14,_15){
with(_13){
if(_contentView!==_15){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _16=objj_msgSend(_13,"documentView");
if(!_16){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}else{
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_13,"bounds"));
objj_msgSend(_headerClipView,"setFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
--_recursionCount;
return;
}
var _17=objj_msgSend(_16,"frame"),_18=objj_msgSend(_13,"bounds"),_19=objj_msgSend(_13,"_headerClipViewFrame"),_1a=(_19.size.height);
_18.origin.y+=_1a;
_18.size.height-=_1a;
var _1b={width:(_17.size.width)-(_18.size.width),height:(_17.size.height)-(_18.size.height)},_1c=(objj_msgSend(_verticalScroller,"frame").size.width),_1d=(objj_msgSend(_horizontalScroller,"frame").size.height),_1e=_1b.height>0,_1f=_1b.width>0,_20=_hasVerticalScroller&&(!_autohidesScrollers||_1e),_21=_hasHorizontalScroller&&(!_autohidesScrollers||_1f);
if(_20){
_1b.width+=_1c;
_1f=_1b.width>0;
_21=_hasHorizontalScroller&&(!_autohidesScrollers||_1f);
}
if(_21){
_1b.height+=_1d;
_1e=_1b.height>0;
_20=_hasVerticalScroller&&(!_autohidesScrollers||_1e);
}
objj_msgSend(_verticalScroller,"setHidden:",!_20);
objj_msgSend(_verticalScroller,"setEnabled:",_1e);
objj_msgSend(_horizontalScroller,"setHidden:",!_21);
objj_msgSend(_horizontalScroller,"setEnabled:",_1f);
if(_20){
_18.size.width-=_1c;
}
if(_21){
_18.size.height-=_1d;
}
var _22=objj_msgSend(_contentView,"bounds").origin,_23=!objj_msgSend(_verticalScroller,"isHidden"),_24=!objj_msgSend(_horizontalScroller,"isHidden");
if(_20){
var _25=MAX((objj_msgSend(_13,"_cornerViewFrame").size.height),_1a),_26=(objj_msgSend(_13,"bounds").size.height)-_25;
if(_21){
_26-=_1d;
}
objj_msgSend(_verticalScroller,"setFloatValue:",(_1b.height<=0)?0:_22.y/_1b.height);
objj_msgSend(_verticalScroller,"setKnobProportion:",(_18.size.height)/(_17.size.height));
objj_msgSend(_verticalScroller,"setFrame:",{origin:{x:(_18.origin.x+_18.size.width),y:_25},size:{width:_1c,height:_26}});
}else{
if(_23){
objj_msgSend(_verticalScroller,"setFloatValue:",0);
objj_msgSend(_verticalScroller,"setKnobProportion:",1);
}
}
if(_21){
objj_msgSend(_horizontalScroller,"setFloatValue:",(_1b.width<=0)?0:_22.x/_1b.width);
objj_msgSend(_horizontalScroller,"setKnobProportion:",(_18.size.width)/(_17.size.width));
objj_msgSend(_horizontalScroller,"setFrame:",{origin:{x:0,y:(_18.origin.y+_18.size.height)},size:{width:(_18.size.width),height:_1d}});
}else{
if(_24){
objj_msgSend(_horizontalScroller,"setFloatValue:",0);
objj_msgSend(_horizontalScroller,"setKnobProportion:",1);
}
}
objj_msgSend(_contentView,"setFrame:",_18);
objj_msgSend(_headerClipView,"setFrame:",_19);
objj_msgSend(_cornerView,"setFrame:",objj_msgSend(_13,"_cornerViewFrame"));
--_recursionCount;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_27,_28,_29){
with(_27){
if(_horizontalScroller===_29){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_29;
objj_msgSend(_horizontalScroller,"setTarget:",_27);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_27,"addSubview:",_horizontalScroller);
objj_msgSend(_27,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_2a,_2b){
with(_2a){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_2c,_2d,_2e){
with(_2c){
if(_hasHorizontalScroller===_2e){
return;
}
_hasHorizontalScroller=_2e;
if(_hasHorizontalScroller&&!_horizontalScroller){
objj_msgSend(_2c,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,(objj_msgSend(_2c,"bounds").size.width),objj_msgSend(CPScroller,"scrollerWidth"))));
}else{
if(!_hasHorizontalScroller&&_horizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",YES);
objj_msgSend(_2c,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_2f,_30){
with(_2f){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_31,_32,_33){
with(_31){
if(_verticalScroller===_33){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_33;
objj_msgSend(_verticalScroller,"setTarget:",_31);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_31,"addSubview:",_verticalScroller);
objj_msgSend(_31,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_34,_35){
with(_34){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_36,_37,_38){
with(_36){
if(_hasVerticalScroller===_38){
return;
}
_hasVerticalScroller=_38;
if(_hasVerticalScroller&&!_verticalScroller){
objj_msgSend(_36,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidth"),height:(objj_msgSend(_36,"bounds").size.height)}}));
}else{
if(!_hasVerticalScroller&&_verticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_36,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_39,_3a){
with(_39){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_3b,_3c,_3d){
with(_3b){
if(_autohidesScrollers==_3d){
return;
}
_autohidesScrollers=_3d;
objj_msgSend(_3b,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_3e,_3f){
with(_3e){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("_updateCornerAndHeaderView"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"documentView"),_43=objj_msgSend(_40,"_headerView"),_44=objj_msgSend(_42,"respondsToSelector:",sel_getUid("headerView"))?objj_msgSend(_42,"headerView"):nil;
if(_43!==_44){
objj_msgSend(_43,"removeFromSuperview");
objj_msgSend(_headerClipView,"setDocumentView:",_44);
}
var _45=objj_msgSend(_42,"respondsToSelector:",sel_getUid("cornerView"))?objj_msgSend(_42,"cornerView"):nil;
if(_cornerView!==_45){
objj_msgSend(_cornerView,"removeFromSuperview");
_cornerView=_45;
if(_cornerView){
objj_msgSend(_40,"addSubview:",_cornerView);
}
}
objj_msgSend(_40,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("_headerView"),function(_46,_47){
with(_46){
var _48=objj_msgSend(_headerClipView,"subviews");
return objj_msgSend(_48,"count")?_48[0]:nil;
}
}),new objj_method(sel_getUid("_cornerViewFrame"),function(_49,_4a){
with(_49){
if(!_cornerView){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4b=objj_msgSend(_49,"bounds"),_4c=objj_msgSend(_cornerView,"frame");
_4c.origin.x=(_4b.origin.x+_4b.size.width)-(_4c.size.width);
_4c.origin.y=0;
return _4c;
}
}),new objj_method(sel_getUid("_headerClipViewFrame"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSend(_4d,"_headerView");
if(!_4f){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _50=objj_msgSend(_4d,"bounds");
_50.size.height=(objj_msgSend(_4f,"frame").size.height);
_50.size.width-=(objj_msgSend(_4d,"_cornerViewFrame").size.width);
return _50;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_53,"floatValue"),_55=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame");
contentBounds=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
contentBounds.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
contentBounds.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
contentBounds.origin.y-=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
contentBounds.origin.y+=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
contentBounds.origin.y=ROUND(_54*((_55.size.height)-(contentBounds.size.height)));
}
objj_msgSend(_contentView,"scrollToPoint:",contentBounds.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_58,"floatValue"),_5a=objj_msgSend(objj_msgSend(_56,"documentView"),"frame"),_5b=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_5b.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_5b.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_5b.origin.x-=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_5b.origin.x+=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_5b.origin.x=ROUND(_59*((_5a.size.width)-(_5b.size.width)));
}
objj_msgSend(_contentView,"scrollToPoint:",_5b.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_5b.origin.x,0));
}
}),new objj_method(sel_getUid("tile"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_5e,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setHorizonalLineScroll:",_63);
objj_msgSend(_61,"setVerticalLineScroll:",_63);
}
}),new objj_method(sel_getUid("lineScroll"),function(_64,_65){
with(_64){
return objj_msgSend(_64,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_66,_67,_68){
with(_66){
_horizontalLineScroll=_68;
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_69,_6a){
with(_69){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_6b,_6c,_6d){
with(_6b){
_verticalLineScroll=_6d;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_6e,_6f){
with(_6e){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"setHorizontalPageScroll:",_72);
objj_msgSend(_70,"setVerticalPageScroll:",_72);
}
}),new objj_method(sel_getUid("pageScroll"),function(_73,_74){
with(_73){
return objj_msgSend(_73,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_75,_76,_77){
with(_75){
_horizontalPageScroll=_77;
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_78,_79){
with(_78){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_7a,_7b,_7c){
with(_7a){
_verticalPageScroll=_7c;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_7d,_7e){
with(_7d){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_7f,"documentView"),"frame"),_83=objj_msgSend(_contentView,"bounds");
_83.origin.x=ROUND(_83.origin.x+objj_msgSend(_81,"deltaX")*_horizontalLineScroll);
_83.origin.y=ROUND(_83.origin.y+objj_msgSend(_81,"deltaY")*_verticalLineScroll);
objj_msgSend(_contentView,"scrollToPoint:",_83.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_83.origin.x,0));
}
}),new objj_method(sel_getUid("keyDown:"),function(_84,_85,_86){
with(_84){
var _87=objj_msgSend(_86,"keyCode"),_88=objj_msgSend(objj_msgSend(_84,"documentView"),"frame"),_89=objj_msgSend(_contentView,"bounds");
switch(_87){
case 33:
_89.origin.y-=(_89.size.height)-_verticalPageScroll;
break;
case 34:
_89.origin.y+=(_89.size.height)-_verticalPageScroll;
break;
case 38:
_89.origin.y-=_verticalLineScroll;
break;
case 40:
_89.origin.y+=_verticalLineScroll;
break;
case 37:
_89.origin.x-=_horizontalLineScroll;
break;
case 49:
_89.origin.x+=_horizontalLineScroll;
break;
default:
return objj_msgSendSuper({receiver:_84,super_class:objj_getClass("CPView")},"keyDown:",_86);
}
objj_msgSend(_contentView,"scrollToPoint:",_89.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_89.origin,0));
}
})]);
var _8a="CPScrollViewContentView",_8b="CPScrollViewVLineScroll",_8c="CPScrollViewHLineScroll",_8d="CPScrollViewVPageScroll",_8e="CPScrollViewHPageScroll",_8f="CPScrollViewHasVScroller",_90="CPScrollViewHasHScroller",_91="CPScrollViewVScroller",_92="CPScrollViewHScroller",_93="CPScrollViewAutohidesScroller";
var _1=objj_getClass("CPScrollView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScrollView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_94,_95,_96){
with(_94){
if(_94=objj_msgSendSuper({receiver:_94,super_class:objj_getClass("CPView")},"initWithCoder:",_96)){
_verticalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8b);
_verticalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8d);
_horizontalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8c);
_horizontalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8e);
_contentView=objj_msgSend(_96,"decodeObjectForKey:",_8a);
_verticalScroller=objj_msgSend(_96,"decodeObjectForKey:",_91);
_horizontalScroller=objj_msgSend(_96,"decodeObjectForKey:",_92);
_hasVerticalScroller=objj_msgSend(_96,"decodeBoolForKey:",_8f);
_hasHorizontalScroller=objj_msgSend(_96,"decodeBoolForKey:",_90);
_autohidesScrollers=objj_msgSend(_96,"decodeBoolForKey:",_93);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("reflectScrolledClipView:"),_94,_contentView,0,[CPDefaultRunLoopMode]);
}
return _94;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_97,_98,_99){
with(_97){
objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPView")},"encodeWithCoder:",_99);
objj_msgSend(_99,"encodeObject:forKey:",_contentView,_8a);
objj_msgSend(_99,"encodeObject:forKey:",_verticalScroller,_91);
objj_msgSend(_99,"encodeObject:forKey:",_horizontalScroller,_92);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalLineScroll,_8b);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalPageScroll,_8d);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalLineScroll,_8c);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalPageScroll,_8e);
objj_msgSend(_99,"encodeBool:forKey:",_hasVerticalScroller,_8f);
objj_msgSend(_99,"encodeBool:forKey:",_hasHorizontalScroller,_90);
objj_msgSend(_99,"encodeBool:forKey:",_autohidesScrollers,_93);
}
})]);
p;15;CPSearchField.ji;13;CPTextField.jc;17963;
CPSearchFieldRecentsTitleMenuItemTag=1000;
CPSearchFieldRecentsMenuItemTag=1001;
CPSearchFieldClearRecentsMenuItemTag=1002;
CPSearchFieldNoRecentsMenuItemTag=1003;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPTextField,"CPSearchField"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_searchButton"),new objj_ivar("_cancelButton"),new objj_ivar("_searchMenuTemplate"),new objj_ivar("_searchMenu"),new objj_ivar("_recentsAutosaveName"),new objj_ivar("_recentSearches"),new objj_ivar("_maximumRecents"),new objj_ivar("_sendsWholeSearchString"),new objj_ivar("_sendsSearchStringImmediately"),new objj_ivar("_partialStringTimer")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPTextField")},"initWithFrame:",_9);
if(_7!=nil){
_recentSearches=objj_msgSend(CPArray,"array");
_maximumRecents=10;
_sendsWholeSearchString=NO;
_sendsSearchStringImmediately=NO;
objj_msgSend(_7,"setBezeled:",YES);
objj_msgSend(_7,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_7,"setBordered:",YES);
objj_msgSend(_7,"setEditable:",YES);
objj_msgSend(_7,"setDelegate:",_7);
_cancelButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPMakeRect(_9.size.width-27,(_9.size.height-22)/2,22,22));
objj_msgSend(_7,"resetCancelButton");
objj_msgSend(_cancelButton,"setHidden:",YES);
objj_msgSend(_cancelButton,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_7,"addSubview:",_cancelButton);
_searchButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPMakeRect(5,(_9.size.height-25)/2,25,25));
objj_msgSend(_searchButton,"setBezelStyle:",CPRegularSquareBezelStyle);
objj_msgSend(_searchButton,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_searchButton,"setBordered:",NO);
objj_msgSend(_searchButton,"setImageScaling:",CPScaleToFit);
objj_msgSend(_7,"setSearchMenuTemplate:",objj_msgSend(_7,"_searchMenuTemplate"));
objj_msgSend(_7,"addSubview:",_searchButton);
}
return _7;
}
}),new objj_method(sel_getUid("copy"),function(_a,_b){
with(_a){
var _c=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPTextField")},"copy");
objj_msgSend(_c,"setCancelButton:",objj_msgSend(_cancelButton,"copy"));
objj_msgSend(_c,"setSearchButton:",objj_msgSend(_searchButton,"copy"));
objj_msgSend(_c,"setrecentsAutosaveName:",objj_msgSend(_recentsAutosaveName,"copy"));
objj_msgSend(_c,"setSendsWholeSearchString:",objj_msgSend(_sendsWholeSearchString,"copy"));
objj_msgSend(_c,"setSendsSearchStringImmediately:",objj_msgSend(_sendsSearchStringImmediately,"copy"));
objj_msgSend(_c,"setMaximumRecents:",_maximumRecents);
objj_msgSend(_c,"setSearchMenutemplate:",objj_msgSend(_searchMenuTemplate,"copy"));
return _c;
}
}),new objj_method(sel_getUid("setSearchButton:"),function(_d,_e,_f){
with(_d){
_searchButton=_f;
}
}),new objj_method(sel_getUid("searchButton"),function(_10,_11){
with(_10){
return _searchButton;
}
}),new objj_method(sel_getUid("resetSearchButton"),function(_12,_13){
with(_12){
var _14,_15,_16,_17=objj_msgSend(_12,"searchButton");
if(_searchMenuTemplate==nil){
_14=_1;
_15=objj_msgSend(_12,"action");
_16=objj_msgSend(_12,"target");
}else{
_14=_2;
_15=sel_getUid("_showMenu:");
_16=_12;
}
objj_msgSend(_17,"setImage:",_14);
objj_msgSend(_17,"setTarget:",_16);
objj_msgSend(_17,"setAction:",_15);
}
}),new objj_method(sel_getUid("setCancelButton:"),function(_18,_19,_1a){
with(_18){
_cancelButton=_1a;
}
}),new objj_method(sel_getUid("cancelButton"),function(_1b,_1c){
with(_1b){
return _cancelButton;
}
}),new objj_method(sel_getUid("resetCancelButton"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"cancelButton");
objj_msgSend(_1f,"setBezelStyle:",CPRegularSquareBezelStyle);
objj_msgSend(_1f,"setBordered:",NO);
objj_msgSend(_1f,"setImageScaling:",CPScaleToFit);
objj_msgSend(_1f,"setImage:",_3);
objj_msgSend(_1f,"setAlternateImage:",_4);
objj_msgSend(_1f,"setTarget:",_1d);
objj_msgSend(_1f,"setAction:",sel_getUid("_searchFieldCancel:"));
}
}),new objj_method(sel_getUid("searchTextRectForBounds:"),function(_20,_21,_22){
with(_20){
var _23=0,_24=_22.size.width;
if(_searchButton){
var _25=objj_msgSend(_searchButton,"frame");
_23=_25.origin.x+_25.size.width;
}
if(_cancelButton){
var _26=objj_msgSend(_cancelButton,"frame");
_24=_26.origin.x-_23;
}
return CPMakeRect(_23,_22.origin.y,_24,_22.size.height);
}
}),new objj_method(sel_getUid("searchButtonRectForBounds:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(_searchButton,"frame");
}
}),new objj_method(sel_getUid("cancelButtonRectForBounds:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(_cancelButton,"frame");
}
}),new objj_method(sel_getUid("searchMenuTemplate"),function(_2d,_2e){
with(_2d){
return _searchMenuTemplate;
}
}),new objj_method(sel_getUid("setSearchMenuTemplate:"),function(_2f,_30,_31){
with(_2f){
_searchMenuTemplate=_31;
objj_msgSend(_2f,"resetSearchButton");
objj_msgSend(_2f,"_updateSearchMenu");
}
}),new objj_method(sel_getUid("sendsWholeSearchString"),function(_32,_33){
with(_32){
return _sendsWholeSearchString;
}
}),new objj_method(sel_getUid("setSendsWholeSearchString:"),function(_34,_35,_36){
with(_34){
_sendsWholeSearchString=_36;
}
}),new objj_method(sel_getUid("sendsSearchStringImmediately"),function(_37,_38){
with(_37){
return _sendsSearchStringImmediately;
}
}),new objj_method(sel_getUid("setSendsSearchStringImmediately:"),function(_39,_3a,_3b){
with(_39){
_sendsSearchStringImmediately=_3b;
}
}),new objj_method(sel_getUid("maximumRecents"),function(_3c,_3d){
with(_3c){
return _maximumRecents;
}
}),new objj_method(sel_getUid("setMaximumRecents:"),function(_3e,_3f,max){
with(_3e){
if(max>254){
max=254;
}else{
if(max<0){
max=10;
}
}
_maximumRecents=max;
}
}),new objj_method(sel_getUid("recentSearches"),function(_41,_42){
with(_41){
return _recentSearches;
}
}),new objj_method(sel_getUid("setRecentSearches:"),function(_43,_44,_45){
with(_43){
var max=MIN(objj_msgSend(_43,"maximumRecents"),objj_msgSend(_45,"count"));
var _45=objj_msgSend(_45,"subarrayWithRange:",CPMakeRange(0,max));
_recentSearches=_45;
objj_msgSend(_43,"_autosaveRecentSearchList");
}
}),new objj_method(sel_getUid("recentsAutosaveName"),function(_47,_48){
with(_47){
return _recentsAutosaveName;
}
}),new objj_method(sel_getUid("setRecentsAutosaveName:"),function(_49,_4a,_4b){
with(_49){
_recentsAutosaveName=_4b;
if(_4b!=nil){
objj_msgSend(_49,"_registerForAutosaveNotification");
}else{
objj_msgSend(_49,"_deregisterForAutosaveNotification");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPTextField")},"contentRectForBounds:",_4e);
return objj_msgSend(_4c,"searchTextRectForBounds:",_4f);
}
}),new objj_method(sel_getUid("menu"),function(_50,_51){
with(_50){
return _searchMenu;
}
}),new objj_method(sel_getUid("isOpaque"),function(_52,_53){
with(_52){
return objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPTextField")},"isOpaque")&&objj_msgSend(_cancelButton,"isOpaque")&&objj_msgSend(_searchButton,"isOpaque");
}
}),new objj_method(sel_getUid("_updateCancelButtonVisibility"),function(_54,_55){
with(_54){
objj_msgSend(_cancelButton,"setHidden:",(objj_msgSend(objj_msgSend(_54,"stringValue"),"length")==0));
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_56,_57,_58){
with(_56){
if(!_sendsWholeSearchString){
if(_sendsSearchStringImmediately){
objj_msgSend(_56,"_sendPartialString");
}else{
objj_msgSend(_partialStringTimer,"invalidate");
var _59=objj_msgSend(CPSearchField,"_keyboardDelayForPartialSearchString:",objj_msgSend(_56,"stringValue"));
_partialStringTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_59,_56,sel_getUid("_sendPartialString"),nil,NO);
}
}
objj_msgSend(_56,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_5a,_5b,_5c,_5d){
with(_5a){
objj_msgSendSuper({receiver:_5a,super_class:objj_getClass("CPTextField")},"sendAction:to:",_5c,_5d);
objj_msgSend(_partialStringTimer,"invalidate");
var _5e=objj_msgSend(_5a,"objectValue");
if(_5e!=nil&&_5e!=""&&!objj_msgSend(_recentSearches,"containsObject:",_5e)){
objj_msgSend(_5a,"_addStringToRecentSearches:",_5e);
objj_msgSend(_5a,"_updateSearchMenu");
}
objj_msgSend(_5a,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("_addStringToRecentSearches:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(CPMutableArray,"arrayWithArray:",_recentSearches);
objj_msgSend(_62,"addObject:",_61);
objj_msgSend(_5f,"setRecentSearches:",_62);
}
}),new objj_method(sel_getUid("trackMouse:"),function(_63,_64,_65){
with(_63){
var _66;
var _67;
var _68=objj_msgSend(_65,"locationInWindow");
_67=objj_msgSend(_63,"convertPoint:fromView:",_68,nil);
_66=objj_msgSend(_63,"searchButtonRectForBounds:",objj_msgSend(_63,"frame"));
if(CPRectContainsPoint(_66,_67)){
return objj_msgSend(objj_msgSend(_63,"searchButton"),"trackMouse:",_65);
}
_66=objj_msgSend(_63,"cancelButtonRectForBounds:",objj_msgSend(_63,"frame"));
if(CPRectContainsPoint(_66,_67)){
return objj_msgSend(objj_msgSend(_63,"cancelButton"),"trackMouse:",_65);
}
return objj_msgSendSuper({receiver:_63,super_class:objj_getClass("CPTextField")},"trackMouse:",_65);
}
}),new objj_method(sel_getUid("_searchMenuTemplate"),function(_69,_6a){
with(_69){
var _6b,_6c;
_6b=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Recent searches",NULL,"");
objj_msgSend(_6c,"setTag:",CPSearchFieldRecentsTitleMenuItemTag);
objj_msgSend(_6c,"setEnabled:",NO);
objj_msgSend(_6b,"addItem:",_6c);
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Recent search item",sel_getUid("_searchFieldSearch:"),"");
objj_msgSend(_6c,"setTag:",CPSearchFieldRecentsMenuItemTag);
objj_msgSend(_6c,"setTarget:",_69);
objj_msgSend(_6b,"addItem:",_6c);
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Clear recent searches",sel_getUid("_searchFieldClearRecents:"),"");
objj_msgSend(_6c,"setTag:",CPSearchFieldClearRecentsMenuItemTag);
objj_msgSend(_6c,"setTarget:",_69);
objj_msgSend(_6b,"addItem:",_6c);
_6c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","No recent searches",NULL,"");
objj_msgSend(_6c,"setTag:",CPSearchFieldNoRecentsMenuItemTag);
objj_msgSend(_6c,"setEnabled:",NO);
objj_msgSend(_6b,"addItem:",_6c);
return _6b;
}
}),new objj_method(sel_getUid("_updateSearchMenu"),function(_6d,_6e){
with(_6d){
if(_searchMenuTemplate==nil){
return;
}
var i,_70=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
var _71=objj_msgSend(_recentSearches,"count");
for(i=0;i<objj_msgSend(_searchMenuTemplate,"numberOfItems");i++){
var _72=objj_msgSend(_searchMenuTemplate,"itemAtIndex:",i);
var tag=objj_msgSend(_72,"tag");
if(tag==CPSearchFieldClearRecentsMenuItemTag&&_71!=0){
var _74=objj_msgSend(CPMenuItem,"separatorItem");
objj_msgSend(_70,"addItem:",_74);
}
if(!(tag==CPSearchFieldRecentsTitleMenuItemTag&&_71==0)&&!(tag==CPSearchFieldClearRecentsMenuItemTag&&_71==0)&&!(tag==CPSearchFieldNoRecentsMenuItemTag&&_71!=0)&&!(tag==CPSearchFieldRecentsMenuItemTag)){
var _75=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_72,"title"),objj_msgSend(_72,"action"),objj_msgSend(_72,"keyEquivalent"));
objj_msgSend(_75,"setTarget:",objj_msgSend(_72,"target"));
objj_msgSend(_75,"setEnabled:",objj_msgSend(_72,"isEnabled"));
objj_msgSend(_75,"setTag:",objj_msgSend(_72,"tag"));
objj_msgSend(_70,"addItem:",_75);
}else{
if(tag==CPSearchFieldRecentsMenuItemTag){
var j;
for(j=0;j<_71;j++){
var _77=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_recentSearches,"objectAtIndex:",j),objj_msgSend(_72,"action"),objj_msgSend(_72,"keyEquivalent"));
objj_msgSend(_77,"setTarget:",objj_msgSend(_72,"target"));
objj_msgSend(_70,"addItem:",_77);
}
}
}
}
_searchMenu=_70;
}
}),new objj_method(sel_getUid("_showMenu:"),function(_78,_79,_7a){
with(_78){
if(_searchMenu==nil||!objj_msgSend(_78,"isEnabled")){
return;
}
objj_msgSendSuper({receiver:_78,super_class:objj_getClass("CPTextField")},"selectText:",nil);
var _7b=CPMakePoint(objj_msgSend(_78,"frame").origin.x,objj_msgSend(_78,"frame").origin.y+objj_msgSend(_78,"frame").size.height);
var _7c=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPRightMouseDown,_7b,0,objj_msgSend(CPDate,"date"),1,objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),"","",NO,0);
objj_msgSend(CPMenu,"popUpContextMenu:withEvent:forView:",_searchMenu,_7c,_7a);
}
}),new objj_method(sel_getUid("_sendPartialString"),function(_7d,_7e){
with(_7d){
objj_msgSend(objj_msgSend(_7d,"target"),"performSelector:withObject:",objj_msgSend(_7d,"action"),_7d);
}
}),new objj_method(sel_getUid("_searchFieldCancel:"),function(_7f,_80,_81){
with(_7f){
objj_msgSend(_7f,"setObjectValue:",nil);
objj_msgSend(_7f,"_sendPartialString");
objj_msgSend(_7f,"_updateCancelButtonVisibility");
objj_msgSend(_81,"setHidden:",YES);
}
}),new objj_method(sel_getUid("_searchFieldSearch:"),function(_82,_83,_84){
with(_82){
objj_msgSend(_82,"setObjectValue:",objj_msgSend(_84,"title"));
objj_msgSend(_82,"_sendPartialString");
objj_msgSend(_82,"_updateCancelButtonVisibility");
}
}),new objj_method(sel_getUid("_searchFieldClearRecents:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setRecentSearches:",objj_msgSend(CPArray,"array"));
objj_msgSend(_85,"_updateSearchMenu");
}
}),new objj_method(sel_getUid("_registerForAutosaveNotification"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_88,sel_getUid("_updateAutosavedRecents:"),"CPAutosavedRecentsChangedNotification",nil);
}
}),new objj_method(sel_getUid("_deregisterForAutosaveNotification"),function(_8a,_8b){
with(_8a){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_8a,"CPAutosavedRecentsChangedNotification",nil);
}
}),new objj_method(sel_getUid("_updateAutosavedRecents:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8e,"object");
var _90=objj_msgSend(_8c,"recentSearches");
objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"setObject:forKey:",_90,_8f);
}
}),new objj_method(sel_getUid("_autosaveRecentSearchList"),function(_91,_92){
with(_91){
if(_recentsAutosaveName!=nil){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:","CPAutosavedRecentsChangedNotification",_recentsAutosaveName);
}
}
}),new objj_method(sel_getUid("_loadRecentSearchList"),function(_93,_94){
with(_93){
var _95,_96=objj_msgSend(_93,"recentsAutosaveName");
_95=objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"objectForKey:",_96);
_recentSearches=_95;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_97,_98){
with(_97){
if(_97!=objj_msgSend(CPSearchField,"class")){
return;
}
var _99=objj_msgSend(CPBundle,"bundleForClass:",_97);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldSearch.png"));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldFind.png"));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldCancel.png"));
_4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_99,"pathForResource:","CPSearchField/CPSearchFieldCancelPressed.png"));
}
}),new objj_method(sel_getUid("_keyboardDelayForPartialSearchString:"),function(_9a,_9b,_9c){
with(_9a){
return (6-MIN(objj_msgSend(_9c,"length"),4))/10;
}
})]);
var _9d="CPSearchButtonKey",_9e="CPCancelButtonKey",_9f="CPRecentsAutosaveNameKey",_a0="CPSendsWholeSearchStringKey",_a1="CPSendsSearchStringImmediatelyKey",_a2="CPMaximumRecentsKey",_a3="CPSearchMenuTemplateKey";
var _5=objj_getClass("CPSearchField");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSearchField\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("encodeWithCoder:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSendSuper({receiver:_a4,super_class:objj_getClass("CPTextField")},"encodeWithCoder:",_a6);
objj_msgSend(_a6,"encodeObject:forKey:",_searchButton,_9d);
objj_msgSend(_a6,"encodeObject:forKey:",_cancelButton,_9e);
objj_msgSend(_a6,"encodeObject:forKey:",_recentsAutosaveName,_9f);
objj_msgSend(_a6,"encodeBool:forKey:",_sendsWholeSearchString,_a0);
objj_msgSend(_a6,"encodeBool:forKey:",_sendsSearchStringImmediately,_a1);
objj_msgSend(_a6,"encodeInt:forKey:",_maximumRecents,_a2);
objj_msgSend(_a6,"encodeObject:forKey:",_searchMenuTemplate,_a3);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_a7,_a8,_a9){
with(_a7){
_a7=objj_msgSendSuper({receiver:_a7,super_class:objj_getClass("CPTextField")},"initWithCoder:",_a9);
_searchButton=objj_msgSend(_a9,"decodeObjectForKey:",_9d);
_cancelButton=objj_msgSend(_a9,"decodeObjectForKey:",_9e);
_recentsAutosaveName=objj_msgSend(_a9,"decodeObjectForKey:",_9f);
_sendsWholeSearchString=objj_msgSend(_a9,"decodeBoolForKey:",_a0);
_sendsSearchStringImmediately=objj_msgSend(_a9,"decodeBoolForKey:",_a1);
_maximumRecents=objj_msgSend(_a9,"decodeIntForKey:",_a2);
objj_msgSend(_a7,"setSearchMenuTemplate:",objj_msgSend(_a9,"decodeObjectForKey:",_a3));
objj_msgSend(_a7,"resetCancelButton");
objj_msgSend(_a7,"setDelegate:",_a7);
return _a7;
}
})]);
p;19;CPSecureTextField.ji;13;CPTextField.jc;287;
var _1=objj_allocateClassPair(CPTextField,"CPSecureTextField"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isSecure"),function(_3,_4){
with(_3){
return YES;
}
})]);
p;20;CPSegmentedControl.jI;20;Foundation/CPArray.ji;11;CPControl.jc;20550;
CPSegmentSwitchTrackingSelectOne=0;
CPSegmentSwitchTrackingSelectAny=1;
CPSegmentSwitchTrackingMomentary=2;
var _1=objj_allocateClassPair(CPControl,"CPSegmentedControl"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segments"),new objj_ivar("_themeStates"),new objj_ivar("_selectedSegment"),new objj_ivar("_segmentStyle"),new objj_ivar("_trackingMode"),new objj_ivar("_trackingSegment"),new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_segments=[];
_themeStates=[];
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_selectedSegment=-1;
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
return _3;
}
}),new objj_method(sel_getUid("selectedTag"),function(_6,_7){
with(_6){
return _segments[_selectedSegment].tag;
}
}),new objj_method(sel_getUid("setSegmentCount:"),function(_8,_9,_a){
with(_8){
if(_segments.length==_a){
return;
}
var _b=CGRectGetHeight(objj_msgSend(_8,"bounds"));
if(_segments.length<_a){
for(var _c=_segments.length;_c<_a;++_c){
_segments[_c]=objj_msgSend(objj_msgSend(_CPSegmentItem,"alloc"),"init");
_themeStates[_c]=CPThemeStateNormal;
}
}else{
if(_a<_segments.length){
_segments.length=_a;
_themeStates.length=_a;
}
}
if(_selectedSegment>=_segments.length){
_selectedSegment=-1;
}
objj_msgSend(_8,"tileWithChangedSegment:",0);
}
}),new objj_method(sel_getUid("segmentCount"),function(_d,_e){
with(_d){
return _segments.length;
}
}),new objj_method(sel_getUid("setSelectedSegment:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setSelected:forSegment:",YES,_11);
}
}),new objj_method(sel_getUid("selectedSegment"),function(_12,_13){
with(_12){
return _selectedSegment;
}
}),new objj_method(sel_getUid("selectSegmentWithTag:"),function(_14,_15,_16){
with(_14){
var _17=0;
for(;_17<_segments.length;++_17){
if(_segments[_17].tag==_16){
objj_msgSend(_14,"setSelectedSegment:",_17);
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isTracking"),function(_18,_19){
with(_18){
}
}),new objj_method(sel_getUid("setTrackingMode:"),function(_1a,_1b,_1c){
with(_1a){
if(_trackingMode==_1c){
return;
}
_trackingMode=_1c;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne){
var _1d=0,_1e=NO;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
if(_1e){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}else{
_1e=YES;
}
}
}
}else{
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
var _1d=0;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}
}
}
}
}
}),new objj_method(sel_getUid("trackingMode"),function(_1f,_20){
with(_1f){
return _trackingMode;
}
}),new objj_method(sel_getUid("setWidth:forSegment:"),function(_21,_22,_23,_24){
with(_21){
_segments[_24].width=_23;
objj_msgSend(_21,"tileWithChangedSegment:",_24);
}
}),new objj_method(sel_getUid("widthForSegment:"),function(_25,_26,_27){
with(_25){
return _segments[_27].width;
}
}),new objj_method(sel_getUid("setImage:forSegment:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=_segments[_2b];
_2c.image=_2a;
objj_msgSend(_28,"tileWithChangedSegment:",_2b);
}
}),new objj_method(sel_getUid("imageForSegment:"),function(_2d,_2e,_2f){
with(_2d){
return _segments[_2f].image;
}
}),new objj_method(sel_getUid("setLabel:forSegment:"),function(_30,_31,_32,_33){
with(_30){
var _34=_segments[_33];
_segments[_33].label=_32;
objj_msgSend(_30,"tileWithChangedSegment:",_33);
}
}),new objj_method(sel_getUid("labelForSegment:"),function(_35,_36,_37){
with(_35){
return _segments[_37].label;
}
}),new objj_method(sel_getUid("setMenu:forSegment:"),function(_38,_39,_3a,_3b){
with(_38){
_segments[_3b].menu=_3a;
}
}),new objj_method(sel_getUid("menuForSegment:"),function(_3c,_3d,_3e){
with(_3c){
return _segments[_3e].menu;
}
}),new objj_method(sel_getUid("setSelected:forSegment:"),function(_3f,_40,_41,_42){
with(_3f){
var _43=_segments[_42];
if(_43.selected==_41){
return;
}
_43.selected=_41;
_themeStates[_42]=_41?CPThemeStateSelected:CPThemeStateNormal;
if(_41){
var _44=_selectedSegment;
_selectedSegment=_42;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_44!=_42&&_44!=-1){
_segments[_44].selected=NO;
_themeStates[_44]=CPThemeStateNormal;
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_44,NO);
}
}
if(_trackingMode!=CPSegmentSwitchTrackingMomentary){
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_42,NO);
}
objj_msgSend(_3f,"setNeedsLayout");
objj_msgSend(_3f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isSelectedForSegment:"),function(_45,_46,_47){
with(_45){
return _segments[_47].selected;
}
}),new objj_method(sel_getUid("setEnabled:forSegment:"),function(_48,_49,_4a,_4b){
with(_48){
_segments[_4b].enabled=_4a;
objj_msgSend(_48,"setNeedsLayout");
objj_msgSend(_48,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isEnabledForSegment:"),function(_4c,_4d,_4e){
with(_4c){
return _segments[_4e].enabled;
}
}),new objj_method(sel_getUid("setTag:forSegment:"),function(_4f,_50,_51,_52){
with(_4f){
_segments[_52].tag=_51;
}
}),new objj_method(sel_getUid("tagForSegment:"),function(_53,_54,_55){
with(_53){
return _segments[_55].tag;
}
}),new objj_method(sel_getUid("drawSegmentBezel:highlight:"),function(_56,_57,_58,_59){
with(_56){
if(_59){
_themeStates[_58]|=CPThemeStateHighlighted;
}else{
_themeStates[_58]&=~CPThemeStateHighlighted;
}
objj_msgSend(_56,"setNeedsLayout");
objj_msgSend(_56,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_leftOffsetForSegment:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemeAttribute:","bezel-inset");
if(_5c==0){
return _5d.left;
}
var _5e=objj_msgSend(_5a,"currentValueForThemeAttribute:","divider-thickness");
return objj_msgSend(_5a,"_leftOffsetForSegment:",_5c-1)+objj_msgSend(_5a,"widthForSegment:",_5c-1)+_5e;
}
}),new objj_method(sel_getUid("_indexOfLastSegment"),function(_5f,_60){
with(_5f){
var _61=objj_msgSend(_segments,"count")-1;
if(_61<0){
_61=0;
}
return _61;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_62,_63,_64){
with(_62){
var _65=objj_msgSend(_62,"currentValueForThemeAttribute:","default-height"),_66=objj_msgSend(_62,"currentValueForThemeAttribute:","content-inset"),_67=objj_msgSend(_62,"currentValueForThemeAttribute:","bezel-inset"),_68=objj_msgSend(_62,"bounds");
if(_64==="left-segment-bezel"){
return CGRectMake(_67.left,_67.top,_66.left,_65);
}else{
if(_64==="right-segment-bezel"){
var _69=objj_msgSend(_62,"_leftOffsetForSegment:",objj_msgSend(_62,"_indexOfLastSegment"));
return CPRectMake(_69+objj_msgSend(_62,"widthForSegment:",objj_msgSend(_62,"_indexOfLastSegment"))-_66.right,_67.top,_66.right,_65);
}else{
if(_64.substring(0,"segment-bezel".length)=="segment-bezel"){
var _6a=parseInt(_64.substring("segment-bezel-".length),10),_6b=CGRectCreateCopy(_segments[_6a].frame);
if(_6a==0){
_6b.origin.x+=_66.left;
_6b.size.width-=_66.left;
}
if(_6a==_segments.length-1){
_6b.size.width-=_66.right;
}
return _6b;
}else{
if(_64.substring(0,"divider-bezel".length)=="divider-bezel"){
var _6a=parseInt(_64.substring("divider-bezel-".length),10),_6c=objj_msgSend(_62,"widthForSegment:",_6a),_6d=objj_msgSend(_62,"_leftOffsetForSegment:",_6a),_6e=objj_msgSend(_62,"currentValueForThemeAttribute:","divider-thickness");
return CGRectMake(_6d+_6c,_67.top,_6e,_65);
}else{
if(_64.substring(0,"segment-content".length)=="segment-content"){
var _6a=parseInt(_64.substring("segment-content-".length),10);
return objj_msgSend(_62,"contentFrameForSegment:",_6a);
}
}
}
}
}
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_64);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6f,_70,_71){
with(_6f){
if(_71.substring(0,"segment-content".length)=="segment-content"){
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_72,_73){
with(_72){
if(_segments.length<=0){
return;
}
var _74=objj_msgSend(_72,"valueForThemeAttribute:inState:","left-segment-bezel-color",_themeStates[0]);
var _75=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","left-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_75,"setBackgroundColor:",_74);
var _76=objj_msgSend(_72,"valueForThemeAttribute:inState:","right-segment-bezel-color",_themeStates[_themeStates.length-1]);
var _77=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","right-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_77,"setBackgroundColor:",_76);
for(var i=0,_79=_themeStates.length;i<_79;i++){
var _7a=_themeStates[i];
_7a|=_themeState&CPThemeStateDisabled;
var _7b=objj_msgSend(_72,"valueForThemeAttribute:inState:","center-segment-bezel-color",_7a);
var _7c=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_7c,"setBackgroundColor:",_7b);
var _7d=_segments[i];
var _7e=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-content-"+i,CPWindowAbove,"segment-bezel-"+i);
objj_msgSend(_7e,"setText:",_7d.label);
objj_msgSend(_7e,"setImage:",_7d.image);
objj_msgSend(_7e,"setFont:",objj_msgSend(_72,"valueForThemeAttribute:inState:","font",_7a));
objj_msgSend(_7e,"setTextColor:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-color",_7a));
objj_msgSend(_7e,"setAlignment:",objj_msgSend(_72,"valueForThemeAttribute:inState:","alignment",_7a));
objj_msgSend(_7e,"setVerticalAlignment:",objj_msgSend(_72,"valueForThemeAttribute:inState:","vertical-alignment",_7a));
objj_msgSend(_7e,"setLineBreakMode:",objj_msgSend(_72,"valueForThemeAttribute:inState:","line-break-mode",_7a));
objj_msgSend(_7e,"setTextShadowColor:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-shadow-color",_7a));
objj_msgSend(_7e,"setTextShadowOffset:",objj_msgSend(_72,"valueForThemeAttribute:inState:","text-shadow-offset",_7a));
objj_msgSend(_7e,"setImageScaling:",objj_msgSend(_72,"valueForThemeAttribute:inState:","image-scaling",_7a));
if(_7d.image&&_7d.label){
objj_msgSend(_7e,"setImagePosition:",objj_msgSend(_72,"valueForThemeAttribute:inState:","image-position",_7a));
}else{
if(_7d.image){
objj_msgSend(_7e,"setImagePosition:",CPImageOnly);
}
}
if(i==_79-1){
continue;
}
var _7f=_themeStates[i]|_themeStates[i+1];
_7f=(_7f&CPThemeStateSelected&~CPThemeStateHighlighted)?CPThemeStateSelected:CPThemeStateNormal;
_7f|=_themeState&CPThemeStateDisabled;
var _80=objj_msgSend(_72,"valueForThemeAttribute:inState:","divider-bezel-color",_7f);
var _81=objj_msgSend(_72,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","divider-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_81,"setBackgroundColor:",_80);
}
}
}),new objj_method(sel_getUid("drawSegment:highlight:"),function(_82,_83,_84,_85){
with(_82){
}
}),new objj_method(sel_getUid("tileWithChangedSegment:"),function(_86,_87,_88){
with(_86){
if(_88>=_segments.length){
return;
}
var _89=_segments[_88],_8a=_89.width,_8b=_themeStates[_88]|(_themeState&CPThemeStateDisabled),_8c=objj_msgSend(_86,"valueForThemeAttribute:inState:","content-inset",_8b),_8d=objj_msgSend(_86,"valueForThemeAttribute:inState:","font",_8b);
if(!_8a){
if(_89.image&&_89.label){
_8a=objj_msgSend(_89.label,"sizeWithFont:",_8d).width+objj_msgSend(_89.image,"size").width+_8c.left+_8c.right;
}else{
if(_89.image){
_8a=objj_msgSend(_89.image,"size").width+_8c.left+_8c.right;
}else{
if(_89.label){
_8a=objj_msgSend(_89.label,"sizeWithFont:",_8d).width+_8c.left+_8c.right;
}else{
_8a=0;
}
}
}
}
var _8e=_8a-CGRectGetWidth(_89.frame);
if(!_8e){
return;
}
var _8f=objj_msgSend(_86,"frame");
objj_msgSend(_86,"setFrameSize:",CGSizeMake(CGRectGetWidth(_8f)+_8e,CGRectGetHeight(_8f)));
_89.width=_8a;
_89.frame=objj_msgSend(_86,"frameForSegment:",_88);
var _90=_88+1;
for(;_90<_segments.length;++_90){
_segments[_90].frame.origin.x+=_8e;
objj_msgSend(_86,"drawSegmentBezel:highlight:",_90,NO);
objj_msgSend(_86,"drawSegment:highlight:",_90,NO);
}
objj_msgSend(_86,"drawSegmentBezel:highlight:",_88,NO);
objj_msgSend(_86,"drawSegment:highlight:",_88,NO);
objj_msgSend(_86,"setNeedsLayout");
objj_msgSend(_86,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("frameForSegment:"),function(_91,_92,_93){
with(_91){
return objj_msgSend(_91,"bezelFrameForSegment:",_93);
}
}),new objj_method(sel_getUid("bezelFrameForSegment:"),function(_94,_95,_96){
with(_94){
var _97=objj_msgSend(_94,"currentValueForThemeAttribute:","default-height"),_98=objj_msgSend(_94,"currentValueForThemeAttribute:","bezel-inset"),_99=objj_msgSend(_94,"widthForSegment:",_96),_9a=objj_msgSend(_94,"_leftOffsetForSegment:",_96);
return CGRectMake(_9a,_98.top,_99,_97);
}
}),new objj_method(sel_getUid("contentFrameForSegment:"),function(_9b,_9c,_9d){
with(_9b){
var _9e=objj_msgSend(_9b,"currentValueForThemeAttribute:","default-height"),_9f=objj_msgSend(_9b,"currentValueForThemeAttribute:","content-inset"),_a0=objj_msgSend(_9b,"widthForSegment:",_9d),_a1=objj_msgSend(_9b,"_leftOffsetForSegment:",_9d);
return CGRectMake(_a1+_9f.left,_9f.top,_a0-_9f.left-_9f.right,_9e-_9f.top-_9f.bottom);
}
}),new objj_method(sel_getUid("testSegment:"),function(_a2,_a3,_a4){
with(_a2){
var _a5=objj_msgSend(_a2,"convertPoint:fromView:",_a4,nil),_a6=_segments.length;
while(_a6--){
if(CGRectContainsPoint(_segments[_a6].frame,_a4)){
return _a6;
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_a7,_a8,_a9){
with(_a7){
if(!objj_msgSend(_a7,"isEnabled")){
return;
}
objj_msgSend(_a7,"trackSegment:",_a9);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_aa,_ab,_ac){
with(_aa){
}
}),new objj_method(sel_getUid("trackSegment:"),function(_ad,_ae,_af){
with(_ad){
var _b0=objj_msgSend(_af,"type"),_b1=objj_msgSend(_ad,"convertPoint:fromView:",objj_msgSend(_af,"locationInWindow"),nil);
if(_b0==CPLeftMouseUp){
if(_trackingSegment==-1){
return;
}
if(CGRectContainsPoint(_segments[_trackingSegment].frame,_b1)){
if(_trackingMode==CPSegmentSwitchTrackingSelectAny){
objj_msgSend(_ad,"setSelected:forSegment:",!objj_msgSend(_ad,"isSelectedForSegment:",_trackingSegment),_trackingSegment);
_selectedSegment=_trackingSegment;
}else{
objj_msgSend(_ad,"setSelected:forSegment:",YES,_trackingSegment);
}
objj_msgSend(_ad,"sendAction:to:",objj_msgSend(_ad,"action"),objj_msgSend(_ad,"target"));
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
objj_msgSend(_ad,"setSelected:forSegment:",NO,_trackingSegment);
_selectedSegment=-1;
}
}
objj_msgSend(_ad,"drawSegmentBezel:highlight:",_trackingSegment,NO);
_trackingSegment=-1;
return;
}
if(_b0==CPLeftMouseDown){
_trackingHighlighted=YES;
_trackingSegment=objj_msgSend(_ad,"testSegment:",_b1);
objj_msgSend(_ad,"drawSegmentBezel:highlight:",_trackingSegment,YES);
}else{
if(_b0==CPLeftMouseDragged){
if(_trackingSegment==-1){
return;
}
var _b2=CGRectContainsPoint(_segments[_trackingSegment].frame,_b1);
if(_b2!=_trackingHighlighted){
_trackingHighlighted=_b2;
objj_msgSend(_ad,"drawSegmentBezel:highlight:",_trackingSegment,_trackingHighlighted);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_ad,sel_getUid("trackSegment:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFont:"),function(_b3,_b4,_b5){
with(_b3){
objj_msgSendSuper({receiver:_b3,super_class:objj_getClass("CPControl")},"setFont:",_b5);
objj_msgSend(_b3,"tileWithChangedSegment:",0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_b6,_b7){
with(_b6){
return "segmented-control";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_b8,_b9){
with(_b8){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPCenterTextAlignment,CPCenterVerticalTextAlignment,CPImageLeft,CPScaleNone,{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil,nil,nil,nil,1,24],["alignment","vertical-alignment","image-position","image-scaling","bezel-inset","content-inset","left-segment-bezel-color","right-segment-bezel-color","center-segment-bezel-color","divider-bezel-color","divider-thickness","default-height"]);
}
})]);
var _ba="CPSegmentedControlSegmentsKey",_bb="CPSegmentedControlSelectedKey",_bc="CPSegmentedControlSegmentStyleKey",_bd="CPSegmentedControlTrackingModeKey";
var _1=objj_getClass("CPSegmentedControl");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSegmentedControl\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_be,_bf,_c0){
with(_be){
_be=objj_msgSendSuper({receiver:_be,super_class:objj_getClass("CPControl")},"initWithCoder:",_c0);
if(_be){
var _c1=objj_msgSend(_be,"frame"),_c2=_c1.size.width;
_c1.size.width=0;
objj_msgSend(_be,"setFrame:",_c1);
_segments=objj_msgSend(_c0,"decodeObjectForKey:",_ba);
_segmentStyle=objj_msgSend(_c0,"decodeIntForKey:",_bc);
_themeStates=[];
if(objj_msgSend(_c0,"containsValueForKey:",_bb)){
_selectedSegment=objj_msgSend(_c0,"decodeIntForKey:",_bb);
}else{
_selectedSegment=-1;
}
if(objj_msgSend(_c0,"containsValueForKey:",_bd)){
_trackingMode=objj_msgSend(_c0,"decodeIntForKey:",_bd);
}else{
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
for(var i=0;i<_segments.length;i++){
_themeStates[i]=_segments[i].selected?CPThemeStateSelected:CPThemeStateNormal;
objj_msgSend(_be,"tileWithChangedSegment:",i);
}
var _c4=MAX(_c2-objj_msgSend(_be,"frame").size.width,0),_c5=FLOOR(_c4/_segments.length);
for(var i=0;i<_segments.length;i++){
objj_msgSend(_be,"setWidth:forSegment:",_segments[i].width+_c5,i);
}
objj_msgSend(_be,"tileWithChangedSegment:",0);
}
return _be;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c6,_c7,_c8){
with(_c6){
objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_c8);
objj_msgSend(_c8,"encodeObject:forKey:",_segments,_ba);
objj_msgSend(_c8,"encodeInt:forKey:",_selectedSegment,_bb);
objj_msgSend(_c8,"encodeInt:forKey:",_segmentStyle,_bc);
objj_msgSend(_c8,"encodeInt:forKey:",_trackingMode,_bd);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPSegmentItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("label"),new objj_ivar("menu"),new objj_ivar("selected"),new objj_ivar("enabled"),new objj_ivar("tag"),new objj_ivar("width"),new objj_ivar("frame")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_c9,_ca){
with(_c9){
if(_c9=objj_msgSendSuper({receiver:_c9,super_class:objj_getClass("CPObject")},"init")){
image=nil;
label="";
menu=nil;
selected=NO;
enabled=NO;
tag=0;
width=0;
frame=CGRectMakeZero();
}
return _c9;
}
})]);
var _cb="CPSegmentItemImageKey",_cc="CPSegmentItemLabelKey",_cd="CPSegmentItemMenuKey",_ce="CPSegmentItemSelectedKey",_cf="CPSegmentItemEnabledKey",_d0="CPSegmentItemTagKey",_d1="CPSegmentItemWidthKey";
var _1=objj_getClass("_CPSegmentItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPSegmentItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_d2,_d3,_d4){
with(_d2){
_d2=objj_msgSendSuper({receiver:_d2,super_class:objj_getClass("CPObject")},"init");
if(_d2){
image=objj_msgSend(_d4,"decodeObjectForKey:",_cb);
label=objj_msgSend(_d4,"decodeObjectForKey:",_cc);
menu=objj_msgSend(_d4,"decodeObjectForKey:",_cd);
selected=objj_msgSend(_d4,"decodeBoolForKey:",_ce);
enabled=objj_msgSend(_d4,"decodeBoolForKey:",_cf);
tag=objj_msgSend(_d4,"decodeIntForKey:",_d0);
width=objj_msgSend(_d4,"decodeFloatForKey:",_d1);
frame=CGRectMakeZero();
}
return _d2;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d5,_d6,_d7){
with(_d5){
objj_msgSend(_d7,"encodeObject:forKey:",image,_cb);
objj_msgSend(_d7,"encodeObject:forKey:",label,_cc);
objj_msgSend(_d7,"encodeObject:forKey:",menu,_cd);
objj_msgSend(_d7,"encodeBool:forKey:",selected,_ce);
objj_msgSend(_d7,"encodeBool:forKey:",enabled,_cf);
objj_msgSend(_d7,"encodeInt:forKey:",tag,_d0);
objj_msgSend(_d7,"encodeFloat:forKey:",width,_d1);
}
})]);
p;10;CPShadow.jI;21;Foundation/CPObject.jc;1307;
var _1=objj_allocateClassPair(CPObject,"CPShadow"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_offset"),new objj_ivar("_blurRadius"),new objj_ivar("_color"),new objj_ivar("_cssString")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_offset=_5;
_blurRadius=_6;
_color=_7;
_cssString=objj_msgSend(_color,"cssString")+" "+Math.round(_5.width)+"px "+Math.round(_5.height)+"px "+Math.round(_blurRadius)+"px";
}
return _3;
}
}),new objj_method(sel_getUid("shadowOffset"),function(_8,_9){
with(_8){
return _offset;
}
}),new objj_method(sel_getUid("shadowBlurRadius"),function(_a,_b){
with(_a){
return _blurRadius;
}
}),new objj_method(sel_getUid("shadowColor"),function(_c,_d){
with(_c){
return _color;
}
}),new objj_method(sel_getUid("cssString"),function(_e,_f){
with(_e){
return _cssString;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"),function(_10,_11,_12,_13,_14){
with(_10){
return objj_msgSend(objj_msgSend(CPShadow,"alloc"),"_initWithOffset:blurRadius:color:",_12,_13,_14);
}
})]);
p;14;CPShadowView.jI;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jc;5564;
CPLightShadow=0;
CPHeavyShadow=1;
var _1=nil,_2=nil;
var _3=3,_4=3,_5=3,_6=5,_7=7,_8=7,_9=5,_a=5;
var _b=objj_allocateClassPair(CPView,"CPShadowView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_weight")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"initWithFrame:",_f);
if(_d){
_weight=CPLightShadow;
objj_msgSend(_d,"setBackgroundColor:",_1);
objj_msgSend(_d,"setHitTests:",NO);
}
return _d;
}
}),new objj_method(sel_getUid("setWeight:"),function(_10,_11,_12){
with(_10){
if(_weight==_12){
return;
}
_weight=_12;
if(_weight==CPLightShadow){
objj_msgSend(_10,"setBackgroundColor:",_1);
}else{
objj_msgSend(_10,"setBackgroundColor:",_2);
}
}
}),new objj_method(sel_getUid("leftInset"),function(_13,_14){
with(_13){
return _weight==CPLightShadow?_3:_7;
}
}),new objj_method(sel_getUid("rightInset"),function(_15,_16){
with(_15){
return _weight==CPLightShadow?_4:_8;
}
}),new objj_method(sel_getUid("topInset"),function(_17,_18){
with(_17){
return _weight==CPLightShadow?_5:_9;
}
}),new objj_method(sel_getUid("bottomInset"),function(_19,_1a){
with(_19){
return _weight==CPLightShadow?_6:_a;
}
}),new objj_method(sel_getUid("horizontalInset"),function(_1b,_1c){
with(_1b){
if(_weight==CPLightShadow){
return _3+_4;
}
return _7+_8;
}
}),new objj_method(sel_getUid("verticalInset"),function(_1d,_1e){
with(_1d){
if(_weight==CPLightShadow){
return _5+_6;
}
return _9+_a;
}
}),new objj_method(sel_getUid("frameForContentFrame:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"class"),"frameForContentFrame:withWeight:",_21,_weight);
}
}),new objj_method(sel_getUid("setFrameForContentFrame:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_22,"setFrame:",objj_msgSend(_22,"frameForContentFrame:",_24));
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(_25,_26){
with(_25){
if(_25!=objj_msgSend(CPShadowView,"class")){
return;
}
var _27=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_25,"class"));
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTopLeft.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTop.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTopRight.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightLeft.png"),CGSizeMake(9,1)),nil,objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightRight.png"),CGSizeMake(9,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottomLeft.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottom.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottomRight.png"),CGSizeMake(9,9))]));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTopLeft.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTop.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTopRight.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyLeft.png"),CGSizeMake(17,1)),nil,objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyRight.png"),CGSizeMake(17,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottomLeft.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottom.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottomRight.png"),CGSizeMake(17,17))]));
}
}),new objj_method(sel_getUid("frameForContentFrame:withWeight:"),function(_28,_29,_2a,_2b){
with(_28){
if(_2b==CPLightShadow){
return CGRectMake((_2a.origin.x)-_3,(_2a.origin.y)-_5,(_2a.size.width)+_3+_4,(_2a.size.height)+_5+_6);
}else{
return CGRectMake((_2a.origin.x)-_7,(_2a.origin.y)-_9,(_2a.size.width)+_7+_8,(_2a.size.height)+_9+_a);
}
}
})]);
p;10;CPSlider.ji;11;CPControl.jc;11368;
CPLinearSlider=0;
CPCircularSlider=1;
var _1=objj_allocateClassPair(CPControl,"CPSlider"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_altIncrementValue"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_minValue=0;
_maxValue=100;
objj_msgSend(_3,"setObjectValue:",50);
objj_msgSend(_3,"setContinuous:",YES);
objj_msgSend(_3,"_recalculateIsVertical");
}
return _3;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_6,_7,_8){
with(_6){
if(_minValue===_8){
return;
}
_minValue=_8;
var _9=objj_msgSend(_6,"doubleValue");
if(_9<_minValue){
objj_msgSend(_6,"setDoubleValue:",_minValue);
}
objj_msgSend(_6,"setNeedsLayout");
objj_msgSend(_6,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("minValue"),function(_a,_b){
with(_a){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_c,_d,_e){
with(_c){
if(_maxValue===_e){
return;
}
_maxValue=_e;
var _f=objj_msgSend(_c,"doubleValue");
if(_f>_maxValue){
objj_msgSend(_c,"setDoubleValue:",_maxValue);
}
objj_msgSend(_c,"setNeedsLayout");
objj_msgSend(_c,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("maxValue"),function(_10,_11){
with(_10){
return _maxValue;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_12,_13,_14){
with(_12){
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPControl")},"setObjectValue:",MIN(MAX(_14,_minValue),_maxValue));
objj_msgSend(_12,"setNeedsLayout");
objj_msgSend(_12,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setSliderType:"),function(_15,_16,_17){
with(_15){
if(_17===CPCircularSlider){
objj_msgSend(_15,"setThemeState:",CPThemeStateCircular);
}else{
objj_msgSend(_15,"unsetThemeState:",CPThemeStateCircular);
}
}
}),new objj_method(sel_getUid("sliderType"),function(_18,_19){
with(_18){
return objj_msgSend(_18,"hasThemeState:",CPThemeStateCircular)?CPCircularSlider:CPLinearSlider;
}
}),new objj_method(sel_getUid("trackRectForBounds:"),function(_1a,_1b,_1c){
with(_1a){
if(objj_msgSend(_1a,"hasThemeState:",CPThemeStateCircular)){
var _1d=CGRectCreateCopy(_1c);
_1c.size.width=MIN(_1c.size.width,_1c.size.height);
_1c.size.height=_1c.size.width;
if(_1c.size.width<_1d.size.width){
_1c.origin.x+=(_1d.size.width-_1c.size.width)/2;
}else{
_1c.origin.y+=(_1d.size.height-_1c.size.height)/2;
}
}else{
var _1e=objj_msgSend(_1a,"currentValueForThemeAttribute:","track-width");
if(_1e<=0){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(objj_msgSend(_1a,"isVertical")){
_1c.origin.x=((_1c.size.width)-_1e)/2;
_1c.size.width=_1e;
}else{
_1c.origin.y=((_1c.size.height)-_1e)/2;
_1c.size.height=_1e;
}
}
return _1c;
}
}),new objj_method(sel_getUid("knobRectForBounds:"),function(_1f,_20,_21){
with(_1f){
var _22=objj_msgSend(_1f,"currentValueForThemeAttribute:","knob-size");
if(_22.width<=0||_22.height<=0){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _23={origin:{x:0,y:0},size:{width:_22.width,height:_22.height}},_24=objj_msgSend(_1f,"trackRectForBounds:",_21);
if(!_24||(_24.size.width<=0||_24.size.height<=0)){
_24=_21;
}
if(objj_msgSend(_1f,"hasThemeState:",CPThemeStateCircular)){
var _25=3*PI_2-(1-objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue)*PI2,_26=CGRectGetWidth(_24)/2-8;
_23.origin.x=_26*COS(_25)+CGRectGetMidX(_24)-3;
_23.origin.y=_26*SIN(_25)+CGRectGetMidY(_24)-2;
}else{
if(objj_msgSend(_1f,"isVertical")){
_23.origin.x=(_24.origin.x+(_24.size.width)/2)-_22.width/2;
_23.origin.y=((objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue))*((_24.size.height)-_22.height);
}else{
_23.origin.x=((objj_msgSend(_1f,"doubleValue")-_minValue)/(_maxValue-_minValue))*((_24.size.width)-_22.width);
_23.origin.y=(_24.origin.y+(_24.size.height)/2)-_22.height/2;
}
}
return _23;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_27,_28,_29){
with(_27){
if(_29==="track-view"){
return objj_msgSend(_27,"trackRectForBounds:",objj_msgSend(_27,"bounds"));
}else{
if(_29==="knob-view"){
return objj_msgSend(_27,"knobRectForBounds:",objj_msgSend(_27,"bounds"));
}
}
return objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_29);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_2a,_2b,_2c){
with(_2a){
if(_2c==="track-view"||_2c==="knob-view"){
var _2d=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_2d,"setHitTests:",NO);
return _2d;
}
return objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_2c);
}
}),new objj_method(sel_getUid("setAltIncrementValue:"),function(_2e,_2f,_30){
with(_2e){
_altIncrementValue=_30;
}
}),new objj_method(sel_getUid("altIncrementValue"),function(_31,_32){
with(_31){
return _altIncrementValue;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_33,_34,_35){
with(_33){
objj_msgSendSuper({receiver:_33,super_class:objj_getClass("CPControl")},"setFrameSize:",_35);
objj_msgSend(_33,"_recalculateIsVertical");
}
}),new objj_method(sel_getUid("_recalculateIsVertical"),function(_36,_37){
with(_36){
var _38=objj_msgSend(_36,"bounds"),_39=(_38.size.width),_3a=(_38.size.height);
_isVertical=_39<_3a?1:(_39>_3a?0:-1);
if(_isVertical===1){
objj_msgSend(_36,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("isVertical"),function(_3b,_3c){
with(_3b){
return _isVertical;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_3d,_3e){
with(_3d){
var _3f=objj_msgSend(_3d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","track-view",CPWindowBelow,"knob-view");
if(_3f){
objj_msgSend(_3f,"setBackgroundColor:",objj_msgSend(_3d,"currentValueForThemeAttribute:","track-color"));
}
var _40=objj_msgSend(_3d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","knob-view",CPWindowAbove,"track-view");
if(_40){
objj_msgSend(_40,"setBackgroundColor:",objj_msgSend(_3d,"currentValueForThemeAttribute:","knob-color"));
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_41,_42){
with(_41){
return YES;
}
}),new objj_method(sel_getUid("_valueAtPoint:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"bounds"),_47=objj_msgSend(_43,"knobRectForBounds:",_46),_48=objj_msgSend(_43,"trackRectForBounds:",_46);
if(objj_msgSend(_43,"hasThemeState:",CPThemeStateCircular)){
var _49=(_47.size.width);
_48.origin.x+=_49/2;
_48.size.width-=_49;
var _4a=objj_msgSend(_43,"minValue"),dx=_45.x-(_48.origin.x+(_48.size.width)/2),dy=_45.y-(_48.origin.y+(_48.size.height)/2);
return MAX(0,MIN(1,1-(3*PI_2-ATAN2(dy,dx))%PI2/PI2))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}else{
if(objj_msgSend(_43,"isVertical")){
var _4d=(_47.size.height);
_48.origin.y+=_4d/2;
_48.size.height-=_4d;
var _4a=objj_msgSend(_43,"minValue");
return MAX(0,MIN(1,(_45.y-(_48.origin.y))/(_48.size.height)))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}else{
var _49=(_47.size.width);
_48.origin.x+=_49/2;
_48.size.width-=_49;
var _4a=objj_msgSend(_43,"minValue");
return MAX(0,MIN(1,(_45.x-(_48.origin.x))/(_48.size.width)))*(objj_msgSend(_43,"maxValue")-_4a)+_4a;
}
}
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_4e,_4f,_50){
with(_4e){
var _51=objj_msgSend(_4e,"bounds"),_52=objj_msgSend(_4e,"knobRectForBounds:",{origin:{x:_51.origin.x,y:_51.origin.y},size:{width:_51.size.width,height:_51.size.height}});
if((_50.x>=(_52.origin.x)&&_50.y>=(_52.origin.y)&&_50.x<(_52.origin.x+_52.size.width)&&_50.y<(_52.origin.y+_52.size.height))){
_dragOffset={width:(_52.origin.x+(_52.size.width)/2)-_50.x,height:(_52.origin.y+(_52.size.height)/2)-_50.y};
}else{
var _53=objj_msgSend(_4e,"trackRectForBounds:",_51);
if(_53&&(_50.x>=(_53.origin.x)&&_50.y>=(_53.origin.y)&&_50.x<(_53.origin.x+_53.size.width)&&_50.y<(_53.origin.y+_53.size.height))){
_dragOffset={width:0,height:0};
objj_msgSend(_4e,"setObjectValue:",objj_msgSend(_4e,"_valueAtPoint:",_50));
}else{
return NO;
}
}
objj_msgSend(_4e,"setHighlighted:",YES);
objj_msgSend(_4e,"setNeedsLayout");
objj_msgSend(_4e,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_54,_55,_56,_57){
with(_54){
objj_msgSend(_54,"setObjectValue:",objj_msgSend(_54,"_valueAtPoint:",{x:_57.x+_dragOffset.width,y:_57.y+_dragOffset.height}));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_58,_59,_5a,_5b,_5c){
with(_58){
objj_msgSend(_58,"setHighlighted:",NO);
if(objj_msgSend(_target,"respondsToSelector:",sel_getUid("sliderDidFinish:"))){
objj_msgSend(_target,"sliderDidFinish:",_58);
}
objj_msgSend(_58,"setNeedsLayout");
objj_msgSend(_58,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setContinuous:"),function(_5d,_5e,_5f){
with(_5d){
if(_5f){
_sendActionOn|=CPLeftMouseDraggedMask;
}else{
_sendActionOn&=~CPLeftMouseDraggedMask;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_60,_61){
with(_60){
return "slider";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_62,_63){
with(_62){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,{width:0,height:0},0,nil],["knob-color","knob-size","track-width","track-color"]);
}
})]);
var _64="CPSliderMinValueKey",_65="CPSliderMaxValueKey",_66="CPSliderAltIncrValueKey";
var _1=objj_getClass("CPSlider");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_67,_68,_69){
with(_67){
_minValue=objj_msgSend(_69,"decodeDoubleForKey:",_64);
_maxValue=objj_msgSend(_69,"decodeDoubleForKey:",_65);
_67=objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPControl")},"initWithCoder:",_69);
if(_67){
_altIncrementValue=objj_msgSend(_69,"decodeDoubleForKey:",_66);
objj_msgSend(_67,"setContinuous:",YES);
objj_msgSend(_67,"_recalculateIsVertical");
objj_msgSend(_67,"setNeedsLayout");
objj_msgSend(_67,"setNeedsDisplay:",YES);
}
return _67;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSendSuper({receiver:_6a,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_6c);
objj_msgSend(_6c,"encodeDouble:forKey:",_minValue,_64);
objj_msgSend(_6c,"encodeDouble:forKey:",_maxValue,_65);
objj_msgSend(_6c,"encodeDouble:forKey:",_altIncrementValue,_66);
}
})]);
var _1=objj_getClass("CPSlider");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("value"),function(_6d,_6e){
with(_6d){
CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
return objj_msgSend(_6d,"doubleValue");
}
}),new objj_method(sel_getUid("setValue:"),function(_6f,_70,_71){
with(_6f){
CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
objj_msgSend(_6f,"setObjectValue:",_71);
}
})]);
p;21;CPSliderColorPicker.ji;15;CPColorPicker.jc;13716;
var _1=objj_allocateClassPair(CPColorPicker,"CPSliderColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_redSlider"),new objj_ivar("_greenSlider"),new objj_ivar("_blueSlider"),new objj_ivar("_hueSlider"),new objj_ivar("_saturationSlider"),new objj_ivar("_brightnessSlider"),new objj_ivar("_rgbLabel"),new objj_ivar("_hsbLabel"),new objj_ivar("_redLabel"),new objj_ivar("_greenLabel"),new objj_ivar("_blueLabel"),new objj_ivar("_hueLabel"),new objj_ivar("_saturationLabel"),new objj_ivar("_brightnessLabel"),new objj_ivar("_hexLabel"),new objj_ivar("_redValue"),new objj_ivar("_greenValue"),new objj_ivar("_blueValue"),new objj_ivar("_hueValue"),new objj_ivar("_saturationValue"),new objj_ivar("_brightnessValue"),new objj_ivar("_hexValue")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPColorPicker")},"initWithPickerMask:colorPanel:",_5,_6);
}
}),new objj_method(sel_getUid("initView"),function(_7,_8){
with(_7){
aFrame=CPRectMake(0,0,CPColorPickerViewWidth,CPColorPickerViewHeight);
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",aFrame);
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_rgbLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,10,100,20));
objj_msgSend(_rgbLabel,"setStringValue:","Red, Green, Blue");
objj_msgSend(_rgbLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_redLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,35,15,20));
objj_msgSend(_redLabel,"setStringValue:","R");
objj_msgSend(_redLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_redSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,35,aFrame.size.width-70,20));
objj_msgSend(_redSlider,"setMaxValue:",1);
objj_msgSend(_redSlider,"setMinValue:",0);
objj_msgSend(_redSlider,"setTarget:",_7);
objj_msgSend(_redSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_redSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _9=function(_a){
if(isNaN(this.value)){
return;
}
switch(this){
case _redValue:
objj_msgSend(_redSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _greenValue:
objj_msgSend(_greenSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _blueValue:
objj_msgSend(_blueSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _hueValue:
objj_msgSend(_hueSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),360),0));
break;
case _saturationValue:
objj_msgSend(_saturationSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),100),0));
break;
case _brightnessValue:
objj_msgSend(_brightnessSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),100),0));
break;
}
this.blur();
};
var _b=function(_c){
_c=_c||window.event;
if(_c.keyCode==13){
_9(_c);
if(_c.preventDefault){
_c.preventDefault();
}else{
if(_c.stopPropagation){
_c.stopPropagation();
}
}
}
};
var _d=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,35,45,20));
objj_msgSend(_d,"setAutoresizingMask:",CPViewMinXMargin);
_redValue=document.createElement("input");
_redValue.style.width="40px";
_redValue.style.backgroundColor="transparent";
_redValue.style.border="1px solid black";
_redValue.style.color="black";
_redValue.style.position="absolute";
_redValue.style.top="0px";
_redValue.style.left="0px";
_redValue.onchange=_9;
_d._DOMElement.appendChild(_redValue);
objj_msgSend(_contentView,"addSubview:",_d);
_greenLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,58,15,20));
objj_msgSend(_greenLabel,"setStringValue:","G");
objj_msgSend(_greenLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_greenSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,58,aFrame.size.width-70,20));
objj_msgSend(_greenSlider,"setMaxValue:",1);
objj_msgSend(_greenSlider,"setMinValue:",0);
objj_msgSend(_greenSlider,"setTarget:",_7);
objj_msgSend(_greenSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_greenSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,58,45,20));
objj_msgSend(_e,"setAutoresizingMask:",CPViewMinXMargin);
_greenValue=_redValue.cloneNode(false);
_greenValue.onchange=_9;
_e._DOMElement.appendChild(_greenValue);
objj_msgSend(_contentView,"addSubview:",_e);
_blueLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,81,15,20));
objj_msgSend(_blueLabel,"setStringValue:","B");
objj_msgSend(_blueLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_blueSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,81,aFrame.size.width-70,20));
objj_msgSend(_blueSlider,"setMaxValue:",1);
objj_msgSend(_blueSlider,"setMinValue:",0);
objj_msgSend(_blueSlider,"setTarget:",_7);
objj_msgSend(_blueSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_blueSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _f=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,81,45,20));
objj_msgSend(_f,"setAutoresizingMask:",CPViewMinXMargin);
_blueValue=_redValue.cloneNode(false);
_blueValue.onchange=_9;
_f._DOMElement.appendChild(_blueValue);
objj_msgSend(_contentView,"addSubview:",_f);
_hsbLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,120,190,20));
objj_msgSend(_hsbLabel,"setStringValue:","Hue, Saturation, Brightness");
objj_msgSend(_hsbLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_hueLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,145,15,20));
objj_msgSend(_hueLabel,"setStringValue:","H");
objj_msgSend(_hueLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_hueSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,145,aFrame.size.width-70,20));
objj_msgSend(_hueSlider,"setMaxValue:",359);
objj_msgSend(_hueSlider,"setMinValue:",0);
objj_msgSend(_hueSlider,"setTarget:",_7);
objj_msgSend(_hueSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_hueSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _10=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,145,45,20));
objj_msgSend(_10,"setAutoresizingMask:",CPViewMinXMargin);
_hueValue=_redValue.cloneNode(false);
_hueValue.onchange=_9;
_10._DOMElement.appendChild(_hueValue);
objj_msgSend(_contentView,"addSubview:",_10);
_saturationLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,168,15,20));
objj_msgSend(_saturationLabel,"setStringValue:","S");
objj_msgSend(_saturationLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_saturationSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,168,aFrame.size.width-70,20));
objj_msgSend(_saturationSlider,"setMaxValue:",100);
objj_msgSend(_saturationSlider,"setMinValue:",0);
objj_msgSend(_saturationSlider,"setTarget:",_7);
objj_msgSend(_saturationSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_saturationSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _11=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,168,45,20));
objj_msgSend(_11,"setAutoresizingMask:",CPViewMinXMargin);
_saturationValue=_redValue.cloneNode(false);
_saturationValue.onchange=_9;
_11._DOMElement.appendChild(_saturationValue);
objj_msgSend(_contentView,"addSubview:",_11);
_brightnessLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,191,15,20));
objj_msgSend(_brightnessLabel,"setStringValue:","B");
objj_msgSend(_brightnessLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,191,aFrame.size.width-70,20));
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setTarget:",_7);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _12=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,191,45,20));
objj_msgSend(_12,"setAutoresizingMask:",CPViewMinXMargin);
_brightnessValue=_redValue.cloneNode(false);
_brightnessValue.onchange=_9;
_12._DOMElement.appendChild(_brightnessValue);
objj_msgSend(_contentView,"addSubview:",_12);
_hexLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,230,30,20));
objj_msgSend(_hexLabel,"setStringValue:","Hex");
objj_msgSend(_hexLabel,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
_hexValue=_redValue.cloneNode(false);
_hexValue.style.top="228px";
_hexValue.style.width="80px";
_hexValue.style.left="35px";
_hexValue.onkeypress=function(_13){
_13=_13||window.event;
if(_13.keyCode==13){
var _14=objj_msgSend(CPColor,"colorWithHexString:",this.value);
if(_14){
objj_msgSend(_7,"setColor:",_14);
objj_msgSend(objj_msgSend(_7,"colorPanel"),"setColor:",_14);
}
if(_13.preventDefault){
_13.preventDefault();
}else{
if(_13.stopPropagation){
_13.stopPropagation();
}
}
this.blur();
}
};
_contentView._DOMElement.appendChild(_hexValue);
objj_msgSend(_contentView,"addSubview:",_rgbLabel);
objj_msgSend(_contentView,"addSubview:",_redLabel);
objj_msgSend(_contentView,"addSubview:",_greenLabel);
objj_msgSend(_contentView,"addSubview:",_blueLabel);
objj_msgSend(_contentView,"addSubview:",_redSlider);
objj_msgSend(_contentView,"addSubview:",_greenSlider);
objj_msgSend(_contentView,"addSubview:",_blueSlider);
objj_msgSend(_contentView,"addSubview:",_hsbLabel);
objj_msgSend(_contentView,"addSubview:",_hueLabel);
objj_msgSend(_contentView,"addSubview:",_saturationLabel);
objj_msgSend(_contentView,"addSubview:",_brightnessLabel);
objj_msgSend(_contentView,"addSubview:",_hueSlider);
objj_msgSend(_contentView,"addSubview:",_saturationSlider);
objj_msgSend(_contentView,"addSubview:",_brightnessSlider);
objj_msgSend(_contentView,"addSubview:",_hexLabel);
}
}),new objj_method(sel_getUid("provideNewView:"),function(_15,_16,_17){
with(_15){
if(_17){
objj_msgSend(_15,"initView");
}
return _contentView;
}
}),new objj_method(sel_getUid("currentMode"),function(_18,_19){
with(_18){
return CPSliderColorPickerMode;
}
}),new objj_method(sel_getUid("supportsMode:"),function(_1a,_1b,_1c){
with(_1a){
return (_1c==CPSliderColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("sliderChanged:"),function(_1d,_1e,_1f){
with(_1d){
var _20,_21=objj_msgSend(_1d,"colorPanel"),_22=objj_msgSend(_21,"opacity");
switch(_1f){
case _hueSlider:
case _saturationSlider:
case _brightnessSlider:
_20=objj_msgSend(CPColor,"colorWithHue:saturation:brightness:alpha:",objj_msgSend(_hueSlider,"floatValue"),objj_msgSend(_saturationSlider,"floatValue"),objj_msgSend(_brightnessSlider,"floatValue"),_22);
objj_msgSend(_1d,"updateRGBSliders:",_20);
break;
case _redSlider:
case _greenSlider:
case _blueSlider:
_20=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",objj_msgSend(_redSlider,"floatValue"),objj_msgSend(_greenSlider,"floatValue"),objj_msgSend(_blueSlider,"floatValue"),_22);
objj_msgSend(_1d,"updateHSBSliders:",_20);
break;
}
objj_msgSend(_1d,"updateLabels");
objj_msgSend(_1d,"updateHex:",_20);
objj_msgSend(_21,"setColor:",_20);
}
}),new objj_method(sel_getUid("setColor:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_23,"updateRGBSliders:",_25);
objj_msgSend(_23,"updateHSBSliders:",_25);
objj_msgSend(_23,"updateHex:",_25);
objj_msgSend(_23,"updateLabels");
}
}),new objj_method(sel_getUid("updateHSBSliders:"),function(_26,_27,_28){
with(_26){
var hsb=objj_msgSend(_28,"hsbComponents");
objj_msgSend(_hueSlider,"setFloatValue:",hsb[0]);
objj_msgSend(_saturationSlider,"setFloatValue:",hsb[1]);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
}
}),new objj_method(sel_getUid("updateHex:"),function(_2a,_2b,_2c){
with(_2a){
_hexValue.value=objj_msgSend(_2c,"hexString");
}
}),new objj_method(sel_getUid("updateRGBSliders:"),function(_2d,_2e,_2f){
with(_2d){
var rgb=objj_msgSend(_2f,"components");
objj_msgSend(_redSlider,"setFloatValue:",rgb[0]);
objj_msgSend(_greenSlider,"setFloatValue:",rgb[1]);
objj_msgSend(_blueSlider,"setFloatValue:",rgb[2]);
}
}),new objj_method(sel_getUid("updateLabels"),function(_31,_32){
with(_31){
_hueValue.value=ROUND(objj_msgSend(_hueSlider,"floatValue"));
_saturationValue.value=ROUND(objj_msgSend(_saturationSlider,"floatValue"));
_brightnessValue.value=ROUND(objj_msgSend(_brightnessSlider,"floatValue"));
_redValue.value=ROUND(objj_msgSend(_redSlider,"floatValue")*255);
_greenValue.value=ROUND(objj_msgSend(_greenSlider,"floatValue")*255);
_blueValue.value=ROUND(objj_msgSend(_blueSlider,"floatValue")*255);
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_33,_34){
with(_33){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","slider_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_35,_36){
with(_35){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","slider_button_h.png"),CGSizeMake(32,32));
}
})]);
p;13;CPSplitView.ji;9;CPImage.ji;8;CPView.jc;16313;
CPSplitViewDidResizeSubviewsNotification="CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification="CPSplitViewWillResizeSubviewsNotification";
var _1=nil,_2=nil;
var _3=objj_allocateClassPair(CPView,"CPSplitView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("_isVertical"),new objj_ivar("_isPaneSplitter"),new objj_ivar("_currentDivider"),new objj_ivar("_initialOffset"),new objj_ivar("_originComponent"),new objj_ivar("_sizeComponent"),new objj_ivar("_DOMDividerElements"),new objj_ivar("_dividerImagePath"),new objj_ivar("_drawingDivider"),new objj_ivar("_needsResizeSubviews")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPView")},"initWithFrame:",_7)){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
objj_msgSend(_5,"_setVertical:",YES);
}
return _5;
}
}),new objj_method(sel_getUid("dividerThickness"),function(_8,_9){
with(_8){
return _isPaneSplitter?1:10;
}
}),new objj_method(sel_getUid("isVertical"),function(_a,_b){
with(_a){
return _isVertical;
}
}),new objj_method(sel_getUid("setVertical:"),function(_c,_d,_e){
with(_c){
if(!objj_msgSend(_c,"_setVertical:",_e)){
return;
}
var _f=objj_msgSend(_c,"frame"),_10=objj_msgSend(_c,"dividerThickness");
objj_msgSend(_c,"_postNotificationWillResize");
var _11=ROUND((_f.size[_sizeComponent]-_10*(_subviews.length-1))/_subviews.length),_12=0,_13=_subviews.length;
if(objj_msgSend(_c,"isVertical")){
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(ROUND((_11+_10)*_12),0,_11,_f.size.height));
}
}else{
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(0,ROUND((_11+_10)*_12),_f.size.width,_11));
}
}
objj_msgSend(_c,"setNeedsDisplay:",YES);
objj_msgSend(_c,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("_setVertical:"),function(_14,_15,_16){
with(_14){
var _17=(_isVertical!=_16);
_isVertical=_16;
_originComponent=objj_msgSend(_14,"isVertical")?"x":"y";
_sizeComponent=objj_msgSend(_14,"isVertical")?"width":"height";
_dividerImagePath=objj_msgSend(_14,"isVertical")?objj_msgSend(_2,"filename"):objj_msgSend(_1,"filename");
return _17;
}
}),new objj_method(sel_getUid("isPaneSplitter"),function(_18,_19){
with(_18){
return _isPaneSplitter;
}
}),new objj_method(sel_getUid("setIsPaneSplitter:"),function(_1a,_1b,_1c){
with(_1a){
if(_isPaneSplitter==_1c){
return;
}
_isPaneSplitter=_1c;
objj_msgSend(_1a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_1d,_1e,_1f){
with(_1d){
_needsResizeSubviews=YES;
}
}),new objj_method(sel_getUid("isSubviewCollapsed:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_22,"frame").size[_sizeComponent]<1?YES:NO;
}
}),new objj_method(sel_getUid("rectOfDividerAtIndex:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_subviews[_25],"frame"),_27=CGRectMakeZero();
_27.size=objj_msgSend(_23,"frame").size;
_27.size[_sizeComponent]=objj_msgSend(_23,"dividerThickness");
_27.origin[_originComponent]=_26.origin[_originComponent]+_26.size[_sizeComponent];
return _27;
}
}),new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"rectOfDividerAtIndex:",_2a);
var _2c=2;
_2b.size[_sizeComponent]+=_2c*2;
_2b.origin[_originComponent]-=_2c;
return _2b;
}
}),new objj_method(sel_getUid("drawRect:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_subviews,"count")-1;
while((_30--)>0){
_drawingDivider=_30;
objj_msgSend(_2d,"drawDividerInRect:",objj_msgSend(_2d,"rectOfDividerAtIndex:",_30));
}
}
}),new objj_method(sel_getUid("drawDividerInRect:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_34,_35){
with(_34){
objj_msgSend(_34,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_36,_37){
with(_36){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
var _38=objj_msgSend(_36,"subviews"),_39=_38.length,_3a=CGSizeMakeZero();
if(objj_msgSend(_36,"isVertical")){
_3a.width+=objj_msgSend(_36,"dividerThickness")*(_39-1);
_3a.height=CGRectGetHeight(objj_msgSend(_36,"frame"));
}else{
_3a.width=CGRectGetWidth(objj_msgSend(_36,"frame"));
_3a.height+=objj_msgSend(_36,"dividerThickness")*(_39-1);
}
while(_39--){
_3a[_sizeComponent]+=objj_msgSend(_38[_39],"frame").size[_sizeComponent];
}
objj_msgSend(_36,"resizeSubviewsWithOldSize:",_3a);
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_3b,_3c,_3d,_3e){
with(_3b){
var _3f=objj_msgSend(_subviews[_3e],"frame"),_40=_3f.origin[_originComponent]+_3f.size[_sizeComponent],_41=objj_msgSend(_3b,"effectiveRectOfDividerAtIndex:",_3e),_42=null;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_41=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_3b,_41,_41,_3e);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_42=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_3b,_3e);
}
return CGRectContainsPoint(_41,_3d)||(_42&&CGRectContainsPoint(_42,_3d));
}
}),new objj_method(sel_getUid("hitTest:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_43,"isHidden")||!objj_msgSend(_43,"hitTests")||!CGRectContainsPoint(objj_msgSend(_43,"frame"),_45)){
return nil;
}
var _46=objj_msgSend(_43,"convertPoint:fromView:",_45,objj_msgSend(_43,"superview"));
var _47=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_47;i++){
if(objj_msgSend(_43,"cursorAtPoint:hitDividerAtIndex:",_46,i)){
return _43;
}
}
return objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPView")},"hitTest:",_45);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_49,_4a,_4b){
with(_49){
var _4c=objj_msgSend(_4b,"type");
if(_4c==CPLeftMouseUp){
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_49,"_postNotificationDidResize");
}
return;
}
if(_4c==CPLeftMouseDown){
var _4d=objj_msgSend(_49,"convertPoint:fromView:",objj_msgSend(_4b,"locationInWindow"),nil);
_currentDivider=CPNotFound;
var _4e=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_4e;i++){
var _50=objj_msgSend(_subviews[i],"frame"),_51=_50.origin[_originComponent]+_50.size[_sizeComponent];
if(objj_msgSend(_49,"cursorAtPoint:hitDividerAtIndex:",_4d,i)){
if(objj_msgSend(_4b,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _52=objj_msgSend(_49,"minPossiblePositionOfDividerAtIndex:",i),_53=objj_msgSend(_49,"maxPossiblePositionOfDividerAtIndex:",i);
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_49,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_49,_subviews[i],i)){
if(objj_msgSend(_49,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",(_52+(_53-_52)/2),i);
}else{
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",_52,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_49,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_49,_subviews[i+1],i)){
if(objj_msgSend(_49,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",(_52+(_53-_52)/2),i);
}else{
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",_53,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_51-_4d[_originComponent];
objj_msgSend(_49,"_postNotificationWillResize");
}
}
}
if(_currentDivider===CPNotFound){
return;
}
}else{
if(_4c==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _4d=objj_msgSend(_49,"convertPoint:fromView:",objj_msgSend(_4b,"locationInWindow"),nil);
objj_msgSend(_49,"setPosition:ofDividerAtIndex:",(_4d[_originComponent]+_initialOffset),_currentDivider);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_49,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_54,"trackDivider:",_56);
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(_subviews[_59+1],"frame");
if(_59+1<objj_msgSend(_subviews,"count")-1){
return _5a.origin[_originComponent]+_5a.size[_sizeComponent]-objj_msgSend(_57,"dividerThickness");
}else{
return objj_msgSend(_57,"frame").size[_sizeComponent]-objj_msgSend(_57,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_5b,_5c,_5d){
with(_5b){
if(_5d>0){
var _5e=objj_msgSend(_subviews[_5d-1],"frame");
return _5e.origin[_originComponent]+_5e.size[_sizeComponent]+objj_msgSend(_5b,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_5f,_60,_61,_62){
with(_5f){
objj_msgSend(_5f,"_adjustSubviewsWithCalculatedSize");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
_61=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_5f,_61,_62);
}
var _63=objj_msgSend(_5f,"maxPossiblePositionOfDividerAtIndex:",_62),_64=objj_msgSend(_5f,"minPossiblePositionOfDividerAtIndex:",_62),_65=_63,_66=_64;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
_66=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_5f,_64,_62);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
_65=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_5f,_63,_62);
}
var _67=objj_msgSend(_5f,"frame"),_68=_subviews[_62],_69=objj_msgSend(_68,"frame"),_6a=_subviews[_62+1],_6b=objj_msgSend(_6a,"frame");
var _6c=MAX(MIN(_61,_65),_66);
if(_61<_64+(_66-_64)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_5f,_68)){
_6c=_64;
}
}
}
_69.size[_sizeComponent]=_6c-_69.origin[_originComponent];
objj_msgSend(_subviews[_62],"setFrame:",_69);
_6b.size[_sizeComponent]=_6b.origin[_originComponent]+_6b.size[_sizeComponent]-_6c-objj_msgSend(_5f,"dividerThickness");
_6b.origin[_originComponent]=_6c+objj_msgSend(_5f,"dividerThickness");
objj_msgSend(_subviews[_62+1],"setFrame:",_6b);
objj_msgSend(_5f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_6d,"_adjustSubviewsWithCalculatedSize");
objj_msgSendSuper({receiver:_6d,super_class:objj_getClass("CPView")},"setFrameSize:",_6f);
objj_msgSend(_6d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_70,_71,_72){
with(_70){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_70,_72);
return;
}
objj_msgSend(_70,"_postNotificationWillResize");
var _73=0,_74=objj_msgSend(_subviews,"count"),_75=objj_msgSend(_70,"bounds"),_76=objj_msgSend(_70,"dividerThickness"),_77=_74-1,_78=0,_79=0,_7a=-1,_7b=0,_7c=objj_msgSend(_70,"isVertical");
for(_73=0;_73<_74;++_73){
var _7d=_subviews[_73],_7e=_7c?objj_msgSend(_7d,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7d,"autoresizingMask")&CPViewHeightSizable;
if(_7e){
_78+=objj_msgSend(_7d,"frame").size[_sizeComponent];
_7a=_73;
_7b++;
}
}
if(_7b===_74){
_78=0;
}
var _79=_78?_75.size[_sizeComponent]-_78:0,_7f=_75.size[_sizeComponent]-_72[_sizeComponent],_80=(_72[_sizeComponent]-_77*_76-_79),_81=_80<=0?0:(_75.size[_sizeComponent]-_77*_76-_79)/_80;
for(_73=0;_73<_74;++_73){
var _7d=_subviews[_73],_82=CGRectMakeCopy(_75),_7e=_7c?objj_msgSend(_7d,"autoresizingMask")&CPViewWidthSizable:objj_msgSend(_7d,"autoresizingMask")&CPViewHeightSizable;
if(_73+1==_74){
_82.size[_sizeComponent]=_75.size[_sizeComponent]-_82.origin[_originComponent];
}else{
if(_78&&_7e&&_7a===_73){
_82.size[_sizeComponent]=MAX(0,ROUND(objj_msgSend(_7d,"frame").size[_sizeComponent]+_7f));
}else{
if(_7e||!_78){
_82.size[_sizeComponent]=MAX(0,ROUND(_81*objj_msgSend(_7d,"frame").size[_sizeComponent]));
_7f-=(_82.size[_sizeComponent]-objj_msgSend(_7d,"frame").size[_sizeComponent]);
}else{
if(_78&&!_7e){
_82.size[_sizeComponent]=objj_msgSend(_7d,"frame").size[_sizeComponent];
}else{
alert("SHOULD NEVER GET HERE");
}
}
}
}
_75.origin[_originComponent]+=_82.size[_sizeComponent]+_76;
objj_msgSend(_7d,"setFrame:",_82);
}
objj_msgSend(_70,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_83,_84,_85){
with(_83){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_83);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_83);
}
_delegate=_85;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_83);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_83);
}
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_86,_87){
with(_86){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewWillResizeSubviewsNotification,_86);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewDidResizeSubviewsNotification,_88);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_8a,_8b){
with(_8a){
if(_8a!=objj_msgSend(CPSplitView,"class")){
return;
}
var _8c=objj_msgSend(CPBundle,"bundleForClass:",_8a);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","CPSplitView/CPSplitViewHorizontal.png"),CPSizeMake(5,10));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_8c,"pathForResource:","CPSplitView/CPSplitViewVertical.png"),CPSizeMake(10,5));
}
})]);
var _8d="CPSplitViewDelegateKey",_8e="CPSplitViewIsVerticalKey",_8f="CPSplitViewIsPaneSplitterKey";
var _3=objj_getClass("CPSplitView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSplitView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_90,_91,_92){
with(_90){
_90=objj_msgSendSuper({receiver:_90,super_class:objj_getClass("CPView")},"initWithCoder:",_92);
if(_90){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
_delegate=objj_msgSend(_92,"decodeObjectForKey:",_8d);
_isPaneSplitter=objj_msgSend(_92,"decodeBoolForKey:",_8f);
objj_msgSend(_90,"_setVertical:",objj_msgSend(_92,"decodeBoolForKey:",_8e));
}
return _90;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_93,_94,_95){
with(_93){
objj_msgSendSuper({receiver:_93,super_class:objj_getClass("CPView")},"encodeWithCoder:",_95);
objj_msgSend(_95,"encodeConditionalObject:forKey:",_delegate,_8d);
objj_msgSend(_95,"encodeBool:forKey:",_isVertical,_8e);
objj_msgSend(_95,"encodeBool:forKey:",_isPaneSplitter,_8f);
}
})]);
p;17;CPStringDrawing.jI;21;Foundation/CPString.ji;18;CPPlatformString.jc;601;
var _1=objj_getClass("CPString");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("cssString"),function(_3,_4){
with(_3){
return _3;
}
}),new objj_method(sel_getUid("sizeWithFont:"),function(_5,_6,_7){
with(_5){
return objj_msgSend(_5,"sizeWithFont:inWidth:",_7,NULL);
}
}),new objj_method(sel_getUid("sizeWithFont:inWidth:"),function(_8,_9,_a,_b){
with(_8){
return objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",_8,_a,_b);
}
})]);
p;15;CPTableColumn.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;8673;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"CPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tableView"),new objj_ivar("_headerView"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_identifier"),new objj_ivar("_isEditable"),new objj_ivar("_sortDescriptorPrototype"),new objj_ivar("_isHidden"),new objj_ivar("_headerToolTip")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_dataViewData={};
_width=100;
_minWidth=10;
_maxWidth=1000000;
objj_msgSend(_5,"setIdentifier:",_7);
objj_msgSend(_5,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_5,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _5;
}
}),new objj_method(sel_getUid("setTableView:"),function(_8,_9,_a){
with(_8){
_tableView=_a;
}
}),new objj_method(sel_getUid("tableView"),function(_b,_c){
with(_b){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_d,_e,_f){
with(_d){
_f=+_f;
if(_width===_f){
return;
}
var _10=MIN(MAX(_f,objj_msgSend(_d,"minWidth")),objj_msgSend(_d,"maxWidth"));
if(_width===_10){
return;
}
var _11=_width;
_width=_10;
var _12=objj_msgSend(_d,"tableView");
if(_12){
var _13=objj_msgSend(objj_msgSend(_12,"tableColumns"),"indexOfObjectIdenticalTo:",_d);
_12._reloadAllRows=YES;
_12._dirtyTableColumnRangeIndex=_12._dirtyTableColumnRangeIndex<0?_13:MIN(_13,_12._dirtyTableColumnRangeIndex);
objj_msgSend(_12,"tile");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewColumnDidResizeNotification,_12,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_d,_11],["CPTableColumn","CPOldWidth"]));
}
}
}),new objj_method(sel_getUid("width"),function(_14,_15){
with(_14){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_16,_17,_18){
with(_16){
_18=+_18;
if(_minWidth===_18){
return;
}
_minWidth=_18;
var _19=objj_msgSend(_16,"width"),_1a=MAX(_19,objj_msgSend(_16,"minWidth"));
if(_19!==_1a){
objj_msgSend(_16,"setWidth:",_1a);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_1b,_1c){
with(_1b){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1d,_1e,_1f){
with(_1d){
_1f=+_1f;
if(_maxWidth===_1f){
return;
}
_maxWidth=_1f;
var _20=objj_msgSend(_1d,"width"),_21=MAX(_20,objj_msgSend(_1d,"maxWidth"));
if(_20!==_21){
objj_msgSend(_1d,"setWidth:",_21);
}
}
}),new objj_method(sel_getUid("maxWidth"),function(_22,_23){
with(_22){
return _maxWidth;
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_24,_25,_26){
with(_24){
_resizingMask=_26;
}
}),new objj_method(sel_getUid("resizingMask"),function(_27,_28){
with(_27){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_29,_2a){
with(_29){
var _2b=_CGRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_2b<objj_msgSend(_29,"minWidth")){
objj_msgSend(_29,"setMinWidth:",_2b);
}else{
if(_2b>objj_msgSend(_29,"maxWidth")){
objj_msgSend(_29,"setMaxWidth:",_2b);
}
}
if(_width!==_2b){
objj_msgSend(_29,"setWidth:",_2b);
}
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_2c,_2d,_2e){
with(_2c){
if(!_2e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Attempt to set nil header view on "+objj_msgSend(_2c,"description"));
}
_headerView=_2e;
var _2f=objj_msgSend(_tableView,"headerView");
objj_msgSend(_2f,"setNeedsLayout");
objj_msgSend(_2f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("headerView"),function(_30,_31){
with(_30){
return _headerView;
}
}),new objj_method(sel_getUid("setDataView:"),function(_32,_33,_34){
with(_32){
if(_dataView===_34){
return;
}
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_34;
_dataViewData[objj_msgSend(_34,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_34);
}
}),new objj_method(sel_getUid("dataView"),function(_35,_36){
with(_35){
return _dataView;
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_37,_38,_39){
with(_37){
return objj_msgSend(_37,"dataView");
}
}),new objj_method(sel_getUid("_newDataViewForRow:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(_3a,"dataViewForRow:",_3c),_3e=objj_msgSend(_3d,"UID");
var x=objj_msgSend(_3a,"tableView")._cachedDataViews[_3e];
if(x&&x.length){
return x.pop();
}
if(!_dataViewData[_3e]){
_dataViewData[_3e]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_3d);
}
var _40=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_3e]);
_40.identifier=_3e;
return _40;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_41,_42,_43){
with(_41){
_identifier=_43;
}
}),new objj_method(sel_getUid("identifier"),function(_44,_45){
with(_44){
return _identifier;
}
}),new objj_method(sel_getUid("setEditable:"),function(_46,_47,_48){
with(_46){
_isEditable=_48;
}
}),new objj_method(sel_getUid("isEditable"),function(_49,_4a){
with(_49){
return _isEditable;
}
}),new objj_method(sel_getUid("setSortDescriptorPrototype:"),function(_4b,_4c,_4d){
with(_4b){
_sortDescriptorPrototype=_4d;
}
}),new objj_method(sel_getUid("sortDescriptorPrototype"),function(_4e,_4f){
with(_4e){
return _sortDescriptorPrototype;
}
}),new objj_method(sel_getUid("setHidden:"),function(_50,_51,_52){
with(_50){
_isHidden=_52;
}
}),new objj_method(sel_getUid("isHidden"),function(_53,_54){
with(_53){
return _isHidden;
}
}),new objj_method(sel_getUid("setHeaderToolTip:"),function(_55,_56,_57){
with(_55){
_headerToolTip=_57;
}
}),new objj_method(sel_getUid("headerToolTip"),function(_58,_59){
with(_58){
return _headerToolTip;
}
})]);
var _5a="CPTableColumnIdentifierKey",_5b="CPTableColumnHeaderViewKey",_5c="CPTableColumnDataViewKey",_5d="CPTableColumnWidthKey",_5e="CPTableColumnMinWidthKey",_5f="CPTableColumnMaxWidthKey",_60="CPTableColumnResizingMaskKey";
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_61,_62,_63){
with(_61){
_61=objj_msgSendSuper({receiver:_61,super_class:objj_getClass("CPObject")},"init");
if(_61){
_dataViewData={};
_width=objj_msgSend(_63,"decodeFloatForKey:",_5d);
_minWidth=objj_msgSend(_63,"decodeFloatForKey:",_5e);
_maxWidth=objj_msgSend(_63,"decodeFloatForKey:",_5f);
objj_msgSend(_61,"setIdentifier:",objj_msgSend(_63,"decodeObjectForKey:",_5a));
objj_msgSend(_61,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_61,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _61;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_64,_65,_66){
with(_64){
objj_msgSend(_66,"encodeObject:forKey:",_identifier,_5a);
objj_msgSend(_66,"encodeObject:forKey:",_width,_5d);
objj_msgSend(_66,"encodeObject:forKey:",_minWidth,_5e);
objj_msgSend(_66,"encodeObject:forKey:",_maxWidth,_5f);
}
})]);
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setHeaderCell:"),function(_67,_68,_69){
with(_67){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("headerCell"),function(_6a,_6b){
with(_6a){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"headCell is not supported. -headerView instead.");
}
}),new objj_method(sel_getUid("setDataCell:"),function(_6c,_6d,_6e){
with(_6c){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("dataCell"),function(_6f,_70){
with(_6f){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCell is not supported. Use -dataCell instead.");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_71,_72,row){
with(_71){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
})]);
p;19;CPTableHeaderView.ji;15;CPTableColumn.ji;13;CPTableView.ji;8;CPView.jc;3366;
var _1=objj_allocateClassPair(CPView,"CPTableHeaderView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_resizedColumn"),new objj_ivar("_draggedColumn"),new objj_ivar("_draggedDistance"),new objj_ivar("_tableView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("resizedColumn"),function(_3,_4){
with(_3){
return _resizedColumn;
}
}),new objj_method(sel_getUid("draggedColumn"),function(_5,_6){
with(_5){
return _draggedColumn;
}
}),new objj_method(sel_getUid("draggedDistance"),function(_7,_8){
with(_7){
return _draggedDistance;
}
}),new objj_method(sel_getUid("tableView"),function(_9,_a){
with(_9){
return _tableView;
}
}),new objj_method(sel_getUid("setTableView:"),function(_b,_c,_d){
with(_b){
_tableView=_d;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"initWithFrame:",_10);
if(_e){
_resizedColumn=CPNotFound;
_draggedColumn=CPNotFound;
_draggedDistance=0;
}
return _e;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_11,_12,_13){
with(_11){
if(!CGRectContainsPoint(objj_msgSend(_11,"bounds"),_13)){
return CPNotFound;
}
var _14=0,_15=objj_msgSend(objj_msgSend(_tableView,"tableColumns"),"count"),_16=objj_msgSend(_tableView,"intercellSpacing"),_17=objj_msgSend(_tableView,"tableColumns"),_18=0,_19=_13.x;
for(;_14<_15;_14++){
var _1a=objj_msgSend(_17[_14],"width")+_16.width;
if(_19>=_18&&_19<_18+_1a){
return _14;
}
_18+=_1a;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("headerRectOfColumn:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=objj_msgSend(_tableView,"tableColumns"),_1f=objj_msgSend(_tableView,"intercellSpacing"),_20=objj_msgSend(_1b,"bounds");
if(_1d<0||_1d>objj_msgSend(_1e,"count")){
objj_msgSend(CPException,"raise:reason:","invalid","tried to get headerRectOfColumn: on invalid column");
}
_20.size.width=objj_msgSend(_1e[_1d],"width")+_1f.width;
while(--_1d>=0){
_20.origin.x+=objj_msgSend(_1e[_1d],"width")+_1f.width;
}
return _20;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_21,_22){
with(_21){
var _23=objj_msgSend(_tableView,"tableColumns"),_24=objj_msgSend(_23,"count"),_25=objj_msgSend(_21,"bounds"),_26=objj_msgSend(_tableView,"intercellSpacing");
for(i=0;i<_24;++i){
var _27=objj_msgSend(_23,"objectAtIndex:",i),_28=objj_msgSend(_27,"headerView");
_25.size.width=objj_msgSend(_27,"width")+_26.width;
objj_msgSend(_28,"setFrame:",_25);
_25.origin.x+=objj_msgSend(_27,"width")+_26.width;
objj_msgSend(_21,"addSubview:",_28);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(objj_msgSend(_tableView,"gridColor"),"setStroke");
var _2c=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_2d=_2d=objj_msgSend(_tableView,"columnIndexesInRect:",_2b),_2e=[];
objj_msgSend(_2d,"getIndexes:maxCount:inIndexRange:",_2e,-1,nil);
var _2f=0,_30=_2e.length;
for(;_2f<_30;++_2f){
var _31=objj_msgSend(_29,"headerRectOfColumn:",_2f);
CGContextBeginPath(_2c);
CGContextMoveToPoint(_2c,ROUND(_31.origin.x+_31.size.width)-0.5,ROUND(_31.origin.y)-0.5);
CGContextAddLineToPoint(_2c,ROUND(_31.origin.x+_31.size.width)-0.5,ROUND(_31.origin.y+_31.size.height)-0.5);
CGContextSetLineWidth(_2c,1);
CGContextStrokePath(_2c);
}
}
})]);
p;13;CPTableView.jI;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;44253;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
CPTableViewSelectionHighlightStyleRegular=0;
CPTableViewSelectionHighlightStyleSourceList=1;
CPTableViewGridNone=0;
CPTableViewSolidVerticalGridLineMask=1<<0;
CPTableViewSolidHorizontalGridLineMask=1<<1;
var _1b=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithTableView:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPView")},"init");
if(_1d){
_tableView=_1f;
}
return _1d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"frame"),_24=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_24,-(_23.origin.x),-(_23.origin.y));
objj_msgSend(_tableView,"_drawRect:",_22);
}
})]);
var _1b=objj_allocateClassPair(CPControl,"CPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_reloadAllRows"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_alternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_gridStyleMask"),new objj_ivar("_gridColor"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_tableDrawView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPControl")},"initWithFrame:",_27);
if(_25){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(_25,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_25,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_intercellSpacing={width:0,height:0};
_rowHeight=19;
objj_msgSend(_25,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_25,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_25,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_25);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_25);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_25,"addSubview:",_tableDrawView);
}
return _25;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_28,_29,_2a){
with(_28){
if(_dataSource===_2a){
return;
}
_dataSource=_2a;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_5;
}
objj_msgSend(_28,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2b,_2c){
with(_2b){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadDataForRowIndexes:columnIndexes:"),function(_2d,_2e,_2f,_30){
with(_2d){
objj_msgSend(_2d,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_31,_32){
with(_31){
if(!_dataSource){
return;
}
_reloadAllRows=YES;
_objectValues={};
objj_msgSend(_31,"noteNumberOfRowsChanged");
objj_msgSend(_31,"setNeedsLayout");
objj_msgSend(_31,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_33,_34,_35){
with(_33){
_doubleAction=_35;
}
}),new objj_method(sel_getUid("doubleAction"),function(_36,_37){
with(_36){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_38,_39,_3a){
with(_38){
_allowsColumnReordering=!!_3a;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_3b,_3c){
with(_3b){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_3d,_3e,_3f){
with(_3d){
_allowsColumnResizing=!!_3f;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_40,_41){
with(_40){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_42,_43,_44){
with(_42){
_allowsMultipleSelection=!!_44;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_45,_46){
with(_45){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_47,_48,_49){
with(_47){
_allowsEmptySelection=!!_49;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_4a,_4b){
with(_4a){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_4c,_4d,_4e){
with(_4c){
_allowsColumnSelection=!!_4e;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_4f,_50){
with(_4f){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_51,_52,_53){
with(_51){
if((_intercellSpacing.width==_53.width&&_intercellSpacing.height==_53.height)){
return;
}
_intercellSpacing={width:_53.width,height:_53.height};
objj_msgSend(_51,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_54,_55,_56){
with(_54){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_57,_58){
with(_57){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_59,_5a,_5b){
with(_59){
_5b=+_5b;
if(_rowHeight===_5b){
return;
}
_rowHeight=MAX(0,_5b);
objj_msgSend(_59,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_5c,_5d){
with(_5c){
return _rowHeight;
}
}),new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"),function(_5e,_5f,_60){
with(_5e){
_usesAlternatingRowBackgroundColors=_60;
}
}),new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"),function(_61,_62){
with(_61){
return _usesAlternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"),function(_63,_64,_65){
with(_63){
if(objj_msgSend(_alternatingRowBackgroundColors,"isEqual:",_65)){
return;
}
_alternatingRowBackgroundColors=_65;
objj_msgSend(_63,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternatingRowBackgroundColors"),function(_66,_67){
with(_66){
return _alternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("selectionHighlightStyle"),function(_68,_69){
with(_68){
return _selectionHighlightMask;
}
}),new objj_method(sel_getUid("setSelectionHighlightStyle:"),function(_6a,_6b,_6c){
with(_6a){
_selectionHighlightMask=_6c;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_6d,_6e,_6f){
with(_6d){
if(_gridColor===_6f){
return;
}
_gridColor=_6f;
objj_msgSend(_6d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridColor"),function(_70,_71){
with(_70){
return _gridColor;
}
}),new objj_method(sel_getUid("setGridStyleMask:"),function(_72,_73,_74){
with(_72){
if(_gridStyleMask===_74){
return;
}
_gridStyleMask=_74;
objj_msgSend(_72,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridStyleMask"),function(_75,_76){
with(_75){
return _gridStyleMask;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_tableColumns,"addObject:",_79);
objj_msgSend(_79,"setTableView:",_77);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_77,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_7a,_7b,_7c){
with(_7a){
if(objj_msgSend(_7c,"tableView")!==_7a){
return;
}
var _7d=objj_msgSend(_tableColumns,"indexOfObjectIdenticalTo:",_7c);
if(_7d===CPNotFound){
return;
}
objj_msgSend(_7c,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_7d);
var _7e=objj_msgSend(_7c,"UID");
if(_objectValues[_7e]){
_objectValues[_7e]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_7d;
}else{
_dirtyTableColumnRangeIndex=MIN(_7d,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_7a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_7f,_80,_81,_82){
with(_7f){
_81=+_81;
_82=+_82;
if(_81===_82){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_81,_82);
}else{
_dirtyTableColumnRangeIndex=MIN(_81,_82,_dirtyTableColumnRangeIndex);
}
if(_82>_81){
--_82;
}
var _83=_tableColumns[_81];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_81);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_83,_82);
objj_msgSend(_7f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_84,_85){
with(_84){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_86,_87,_88){
with(_86){
var _89=0,_8a=(_tableColumns.length);
for(;_89<_8a;++_89){
if(objj_msgSend(_tableColumns[_89],"identifier")===_88){
return _89;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_8b,_8c,_8d){
with(_8b){
var _8e=objj_msgSend(_8b,"columnWithIdentifier:",_8d);
if(_8e===CPNotFound){
return nil;
}
return _tableColumns[_8e];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_8f,_90,_91,_92){
with(_8f){
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_92){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_91);
}else{
_selectedColumnIndexes=objj_msgSend(_91,"copy");
}
objj_msgSend(_8f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_93,_94,_95,_96){
with(_93){
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_96){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_95);
}else{
_selectedRowIndexes=objj_msgSend(_95,"copy");
}
objj_msgSend(_93,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_97,_98){
with(_97){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_99,_9a){
with(_99){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_9d);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_a0);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_a3,_a4){
with(_a3){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_a5,_a6,_a7){
with(_a5){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_a7);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_a8,_a9,_aa){
with(_a8){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_aa);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_ab,_ac){
with(_ab){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_ad,_ae){
with(_ad){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_ad);
}
}),new objj_method(sel_getUid("cornerView"),function(_af,_b0){
with(_af){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(_b1,_b2,_b3){
with(_b1){
if(_cornerView===_b3){
return;
}
_cornerView=_b3;
var _b4=objj_msgSend(objj_msgSend(_b1,"superview"),"superview");
if(objj_msgSend(_b4,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_b4,"documentView")===_b1){
objj_msgSend(_b4,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("headerView"),function(_b5,_b6){
with(_b5){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_b7,_b8,_b9){
with(_b7){
if(_headerView===_b9){
return;
}
objj_msgSend(_headerView,"setTableView:",nil);
_headerView=_b9;
if(_headerView){
objj_msgSend(_headerView,"setTableView:",_b7);
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(_b7,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
var _ba=objj_msgSend(objj_msgSend(_b7,"superview"),"superview");
if(objj_msgSend(_ba,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))&&objj_msgSend(_ba,"documentView")===_b7){
objj_msgSend(_ba,"_updateCornerAndHeaderView");
}
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_bb,_bc){
with(_bb){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _bd=_dirtyTableColumnRangeIndex,_be=(_tableColumns.length),x=_bd===0?0:CPMaxRange(_tableColumnRanges[_bd-1]);
for(;_bd<_be;++_bd){
var _c0=_tableColumns[_bd];
if(objj_msgSend(_c0,"isHidden")){
_tableColumnRanges[_bd]=CPMakeRange(x,0);
}else{
var _c1=objj_msgSend(_tableColumns[_bd],"width");
_tableColumnRanges[_bd]=CPMakeRange(x,_c1);
x+=_c1;
}
}
_tableColumnRanges.length=_be;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_c2,_c3,_c4){
with(_c2){
_c4=+_c4;
if(_c4<0||_c4>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_c2,"_recalculateTableColumnRanges");
}
var _c5=_tableColumnRanges[_c4];
return {origin:{x:_c5.location,y:0},size:{width:_c5.length,height:CGRectGetHeight(objj_msgSend(_c2,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_c6,_c7,_c8){
with(_c6){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_c8*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_c6,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_c9,_ca,_cb){
with(_c9){
if(_numberOfRows<=0){
return CPMakeRange(0,0);
}
var _cc=objj_msgSend(_c9,"bounds");
if(!CGRectIntersectsRect(_cb,_cc)){
return CPMakeRange(0,0);
}
var _cd=objj_msgSend(_c9,"rowAtPoint:",_cb.origin);
if(_cd<0){
_cd=0;
}
var _ce=objj_msgSend(_c9,"rowAtPoint:",{x:0,y:(_cb.origin.y+_cb.size.height)});
if(_ce<0){
_ce=_numberOfRows-1;
}
return CPMakeRange(_cd,_ce-_cd+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_cf,_d0,_d1){
with(_cf){
var _d2=MAX(0,objj_msgSend(_cf,"columnAtPoint:",{x:_d1.origin.x,y:0})),_d3=objj_msgSend(_cf,"columnAtPoint:",{x:(_d1.origin.x+_d1.size.width),y:0});
if(_d3===CPNotFound){
_d3=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_d2,_d3-_d2+1));
}
var _d4=objj_msgSend(CPIndexSet,"indexSet");
for(;_d2<=_d3;++_d2){
var _d5=_tableColumns[_d2];
if(!objj_msgSend(_d5,"isHidden")){
objj_msgSend(_d4,"addIndex:",_d2);
}
}
return _d4;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_d6,_d7,_d8){
with(_d6){
var _d9=objj_msgSend(_d6,"bounds");
if(!(_d8.x>=(_d9.origin.x)&&_d8.y>=(_d9.origin.y)&&_d8.x<(_d9.origin.x+_d9.size.width)&&_d8.y<(_d9.origin.y+_d9.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_d6,"_recalculateTableColumnRanges");
}
var x=_d8.x,low=0,_dc=_tableColumnRanges.length-1;
while(low<=_dc){
var _dd=FLOOR(low+(_dc-low)/2),_de=_tableColumnRanges[_dd];
if(x<_de.location){
_dc=_dd-1;
}else{
if(x>=CPMaxRange(_de)){
low=_dd+1;
}else{
var _df=_tableColumnRanges.length;
while(_dd<_df&&objj_msgSend(_tableColumns[_dd],"isHidden")){
++_dd;
}
if(_dd<_df){
return _dd;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_e0,_e1,_e2){
with(_e0){
var y=_e2.y;
if(NO){
}
var row=FLOOR(y/(_rowHeight+_intercellSpacing.height));
if(row>=_numberOfRows){
return -1;
}
return row;
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_e5,_e6,_e7,_e8){
with(_e5){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_e5,"_recalculateTableColumnRanges");
}
var _e9=_tableColumnRanges[_e7],_ea=objj_msgSend(_e5,"rectOfRow:",_e8);
return {origin:{x:_e9.location,y:(_ea.origin.y)},size:{width:_e9.length,height:(_ea.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_eb,_ec){
with(_eb){
var _ed=objj_msgSend(_eb,"superview");
if(!_ed){
return;
}
var _ee=objj_msgSend(_ed,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_eb,"_recalculateTableColumnRanges");
}
var _ef=(_tableColumns.length);
while(_ef--&&objj_msgSend(_tableColumns[_ef],"isHidden")){
}
if(_ef>=0){
objj_msgSend(_tableColumns[_ef],"setWidth:",MAX(0,_ee.width-(objj_msgSend(_eb,"rectOfColumn:",_ef).origin.x)));
}
objj_msgSend(_eb,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_f0,_f1){
with(_f0){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_f0);
objj_msgSend(_f0,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_f2,_f3){
with(_f2){
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_f2,"_recalculateTableColumnRanges");
}
var _f4=_tableColumnRanges.length>0?CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject")):0,_f5=(_rowHeight+_intercellSpacing.height)*_numberOfRows,_f6=objj_msgSend(_f2,"superview");
if(objj_msgSend(_f6,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _f7=objj_msgSend(_f6,"bounds").size;
_f4=MAX(_f7.width,_f4);
_f5=MAX(_f7.height,_f5);
}
objj_msgSend(_f2,"setFrameSize:",{width:_f4,height:_f5});
objj_msgSend(_f2,"setNeedsLayout");
objj_msgSend(_f2,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f8,_f9,_fa){
with(_f8){
if(_delegate===_fa){
return;
}
var _fb=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_fb,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_f8);
}
}
_delegate=_fa;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_f8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_fb,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_f8);
}
}
}),new objj_method(sel_getUid("delegate"),function(_fc,_fd){
with(_fc){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_fe,_ff,_100,_101){
with(_fe){
var _102=objj_msgSend(_100,"UID"),_103=_objectValues[_102];
if(!_103){
_103=[];
_objectValues[_102]=_103;
}
var _104=_103[_101];
if(_104===undefined){
_104=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_fe,_100,_101);
_103[_101]=_104;
}
return _104;
}
}),new objj_method(sel_getUid("_exposedRect"),function(self,_cmd){
with(self){
var _107=objj_msgSend(self,"superview");
if(!objj_msgSend(_107,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_107,"bounds"),objj_msgSend(self,"frame")),_107);
}
}),new objj_method(sel_getUid("load"),function(self,_cmd){
with(self){
if(_reloadAllRows){
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_exposedRows,_exposedColumns);
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_reloadAllRows=NO;
}
var _10a=objj_msgSend(self,"_exposedRect"),_10b=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_10a)),_10c=objj_msgSend(self,"columnIndexesInRect:",_10a),_10d=objj_msgSend(_exposedRows,"copy"),_10e=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_10d,"removeIndexes:",_10b);
objj_msgSend(_10e,"removeIndexes:",_10c);
var _10f=objj_msgSend(_10b,"copy"),_110=objj_msgSend(_10c,"copy");
objj_msgSend(_10f,"removeIndexes:",_exposedRows);
objj_msgSend(_110,"removeIndexes:",_exposedColumns);
var _111=objj_msgSend(_10b,"copy"),_112=objj_msgSend(_10c,"copy");
objj_msgSend(_111,"removeIndexes:",_10f);
objj_msgSend(_112,"removeIndexes:",_110);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_111,_10e);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_10d,_112);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_10d,_10e);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_111,_110);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10f,_112);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_10f,_110);
_exposedRows=_10b;
_exposedColumns=_10c;
objj_msgSend(_tableDrawView,"setFrame:",_10a);
objj_msgSend(_tableDrawView,"display");
for(identifier in _cachedDataViews){
var _113=_cachedDataViews[identifier],_114=_113.length;
while(_114--){
objj_msgSend(_113[_114],"removeFromSuperview");
}
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(self,_cmd,rows,_118){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_118,"count")){
return;
}
var _119=[],_11a=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_119,-1,nil);
objj_msgSend(_118,"getIndexes:maxCount:inIndexRange:",_11a,-1,nil);
var _11b=0,_11c=_11a.length;
for(;_11b<_11c;++_11b){
var _11d=_11a[_11b],_11e=_tableColumns[_11d],_11f=objj_msgSend(_11e,"UID");
var _120=0,_121=_119.length;
for(;_120<_121;++_120){
var row=_119[_120],_123=_dataViewsForTableColumns[_11f][row];
_dataViewsForTableColumns[_11f][row]=nil;
objj_msgSend(self,"_enqueueReusableDataView:",_123);
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_cmd,rows,_127){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_127,"count")){
return;
}
var _128=[],_129=[],_12a=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_128,-1,nil);
objj_msgSend(_127,"getIndexes:maxCount:inIndexRange:",_12a,-1,nil);
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(self,"_recalculateTableColumnRanges");
}
var _12b=0,_12c=_12a.length;
for(;_12b<_12c;++_12b){
var _12d=_12a[_12b],_12e=_tableColumns[_12d],_12f=objj_msgSend(_12e,"UID");
if(!_dataViewsForTableColumns[_12f]){
_dataViewsForTableColumns[_12f]=[];
}
var _130=0,_131=_128.length;
for(;_130<_131;++_130){
var row=_128[_130],_133=objj_msgSend(self,"_newDataViewForRow:tableColumn:",row,_12e);
objj_msgSend(_133,"setFrame:",objj_msgSend(self,"frameOfDataViewAtColumn:row:",_12d,row));
objj_msgSend(_133,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_12e,row));
if(objj_msgSend(_133,"superview")!==self){
objj_msgSend(self,"addSubview:",_133);
}
_dataViewsForTableColumns[_12f][row]=_133;
}
}
}
}),new objj_method(sel_getUid("_newDataViewForRow:tableColumn:"),function(self,_cmd,aRow,_137){
with(self){
return objj_msgSend(_137,"_newDataViewForRow:",aRow);
}
}),new objj_method(sel_getUid("_enqueueReusableDataView:"),function(self,_cmd,_13a){
with(self){
var _13b=_13a.identifier;
if(!_cachedDataViews[_13b]){
_cachedDataViews[_13b]=[_13a];
}else{
_cachedDataViews[_13b].push(_13a);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_13e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_13e);
if(_headerView){
objj_msgSend(_headerView,"setFrameSize:",{width:(objj_msgSend(self,"frame").size.width),height:(objj_msgSend(_headerView,"frame").size.height)});
}
}
}),new objj_method(sel_getUid("exposedClipRect"),function(self,_cmd){
with(self){
var _141=objj_msgSend(self,"superview");
if(!objj_msgSend(_141,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_141,"bounds"),objj_msgSend(self,"frame")),_141);
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_cmd,_144){
with(self){
var _145=objj_msgSend(self,"_exposedRect");
objj_msgSend(self,"drawBackgroundInClipRect:",_145);
objj_msgSend(self,"highlightSelectionInClipRect:",_145);
objj_msgSend(self,"drawGridInClipRect:",_145);
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(self,_cmd,_148){
with(self){
if(!objj_msgSend(self,"usesAlternatingRowBackgroundColors")){
return;
}
var _149=objj_msgSend(self,"alternatingRowBackgroundColors"),_14a=objj_msgSend(_149,"count");
if(_14a===0){
return;
}
var _14b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(_14a===1){
CGContextSetFillColor(_14b,_149[0]);
CGContextFillRect(_14b,_148);
return;
}
var _14c=objj_msgSend(self,"rowsInRect:",_148),_14d=_14c.location,_14e=CPMaxRange(_14c)-1,_14f=MIN(_14c.length,_14a),_150=0;
while(_14f--){
var row=_14d%_14a+_14d+_14f,_152=nil;
CGContextBeginPath(_14b);
for(;row<=_14e;row+=_14a){
CGContextAddRect(_14b,CGRectIntersection(_148,_152=objj_msgSend(self,"rectOfRow:",row)));
}
if(row-_14a===_14e){
_150=(_152.origin.y+_152.size.height);
}
CGContextClosePath(_14b);
CGContextSetFillColor(_14b,_149[_14f]);
CGContextFillPath(_14b);
}
var _153=(_148.origin.y+_148.size.height);
if(_150>=_153||_rowHeight<=0){
return;
}
var _154=_rowHeight+_intercellSpacing.height,_152={origin:{x:(_148.origin.x),y:(_148.origin.y)+_150},size:{width:(_148.size.width),height:_154}};
for(row=_14e+1;_150<_153;++row){
CGContextSetFillColor(_14b,_149[row%_14a]);
CGContextFillRect(_14b,_152);
_150+=_154;
_152.origin.y+=_154;
}
}
}),new objj_method(sel_getUid("drawGridInClipRect:"),function(self,_cmd,_157){
with(self){
var _158=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_159=objj_msgSend(self,"gridStyleMask");
if(!(_159&(CPTableViewSolidHorizontalGridLineMask|CPTableViewSolidVerticalGridLineMask))){
return;
}
CGContextBeginPath(_158);
if(_159&CPTableViewSolidHorizontalGridLineMask){
var _15a=objj_msgSend(self,"rowsInRect:",_157);
row=_15a.location,lastRow=CPMaxRange(_15a)-1,rowY=0,minX=(_157.origin.x),maxX=(_157.origin.x+_157.size.width);
for(;row<=lastRow;++row){
var _15c=objj_msgSend(self,"rectOfRow:",row),rowY=(_15c.origin.y+_15c.size.height)-0.5;
CGContextMoveToPoint(_158,minX,rowY);
CGContextAddLineToPoint(_158,maxX,rowY);
}
if(_rowHeight>0){
var _15d=_rowHeight+_intercellSpacing.height,_15e=(_157.origin.y+_157.size.height);
while(rowY<_15e){
rowY+=_15d;
CGContextMoveToPoint(_158,minX,rowY);
CGContextAddLineToPoint(_158,maxX,rowY);
}
}
}
if(_159&CPTableViewSolidVerticalGridLineMask){
var _15f=objj_msgSend(self,"columnIndexesInRect:",_157),_160=[];
objj_msgSend(_15f,"getIndexes:maxCount:inIndexRange:",_160,-1,nil);
var _161=0,_162=_160.length,minY=(_157.origin.y),maxY=(_157.origin.y+_157.size.height);
for(;_161<_162;++_161){
var _165=objj_msgSend(self,"rectOfColumn:",_161),_166=(_165.origin.x+_165.size.width)-0.5;
CGContextMoveToPoint(_158,_166,minY);
CGContextAddLineToPoint(_158,_166,maxY);
}
}
CGContextClosePath(_158);
CGContextSetStrokeColor(_158,_gridColor);
CGContextStrokePath(_158);
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_cmd,_169){
with(self){
if(objj_msgSend(self,"selectionHighlightStyle")===CPTableViewSelectionHighlightStyleSourceList){
objj_msgSend(objj_msgSend(CPColor,"selectionColorSourceView"),"setFill");
}else{
objj_msgSend(objj_msgSend(CPColor,"selectionColor"),"setFill");
}
var _16a=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_16b=[],_16c=sel_getUid("rectOfRow:");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _16d=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_169)),_16e=objj_msgSend(_16d,"firstIndex"),_16f=CPMakeRange(_16e,objj_msgSend(_16d,"lastIndex")-_16e+1);
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_16b,-1,_16f);
}else{
if(objj_msgSend(_selectedColumnIndexes,"count")>=1){
_16c=sel_getUid("rectOfColumn:");
var _170=objj_msgSend(self,"columnIndexesInRect:",_169),_171=objj_msgSend(_170,"firstIndex"),_16f=CPMakeRange(_171,objj_msgSend(_170,"lastIndex")-_171+1);
objj_msgSend(_selectedColumnIndexes,"getIndexes:maxCount:inIndexRange:",_16b,-1,_16f);
}
}
var _172=objj_msgSend(_16b,"count");
if(!_172){
return;
}
CGContextBeginPath(_16a);
while(_172--){
CGContextAddRect(_16a,CGRectIntersection(objj_msgSend(self,_16c,_16b[_172]),_169));
}
CGContextClosePath(_16a);
CGContextFillPath(_16a);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_cmd,_177){
with(self){
var _178=objj_msgSend(self,"superview"),_179=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_178){
objj_msgSend(_179,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_178);
objj_msgSend(_179,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_178);
}
if(_177){
objj_msgSend(_177,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_177,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_179,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_177);
objj_msgSend(_179,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_177);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_cmd,_17c){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_cmd,_17f){
with(self){
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_cmd){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_cmd,_184){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_184);
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
_previouslySelectedRowIndexes=nil;
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_cmd,_188,_189){
with(self){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",objj_msgSend(self,"rowAtPoint:",_189));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_cmd,_18c,_18d,_18e){
with(self){
if(!objj_msgSend(_previouslySelectedRowIndexes,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(self,"_noteSelectionDidChange");
}
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_cmd,aRow){
with(self){
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"addIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
}else{
if(aRow>=0&&aRow<_numberOfRows){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_7&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_f){
newSelection=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,newSelection);
}
if(_implementedDelegateMethods&_11){
var _192=[];
objj_msgSend(newSelection,"getIndexes:maxCount:inIndexRange:",_192,-1,nil);
var _193=_192.length;
while(_193--){
var _194=_192[_193];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_194)){
objj_msgSend(newSelection,"removeIndex:",_194);
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(newSelection,"count")===0){
return;
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(!_previouslySelectedRowIndexes){
_previouslySelectedRowIndexes=objj_msgSend(_selectedRowIndexes,"copy");
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",newSelection,NO);
objj_msgSend(self,"_noteSelectionIsChanging");
}
}),new objj_method(sel_getUid("_noteSelectionIsChanging"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
}),new objj_method(sel_getUid("_noteSelectionDidChange"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,self,nil);
}
})]);
var _199="CPTableViewDataSourceKey",_19a="CPTableViewDelegateKey",_19b="CPTableViewHeaderViewKey",_19c="CPTableViewTableColumnsKey",_19d="CPTableViewRowHeightKey",_19e="CPTableViewIntercellSpacingKey",_19f="CPTableViewMultipleSelectionKey",_1a0="CPTableViewEmptySelectionKey";
var _1b=objj_getClass("CPTableView");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1a3){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"initWithCoder:",_1a3);
if(self){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=objj_msgSend(_1a3,"decodeBoolForKey:",_19f);
_allowsEmptySelection=objj_msgSend(_1a3,"decodeBoolForKey:",_1a0);
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(self,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(self,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=objj_msgSend(_1a3,"decodeObjectForKey:",_19c);
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=0;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_rowHeight=objj_msgSend(_1a3,"decodeFloatForKey:",_19d);
_intercellSpacing=objj_msgSend(_1a3,"decodeSizeForKey:",_19e);
objj_msgSend(self,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(self,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(self,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",self);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
objj_msgSend(self,"setDataSource:",objj_msgSend(_1a3,"decodeObjectForKey:",_199));
objj_msgSend(self,"setDelegate:",objj_msgSend(_1a3,"decodeObjectForKey:",_19a));
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",self);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(self,"addSubview:",_tableDrawView);
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1a6){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_1a6);
objj_msgSend(_1a6,"encodeObject:forKey:",_dataSource,_199);
objj_msgSend(_1a6,"encodeObject:forKey:",_delegate,_19a);
objj_msgSend(_1a6,"encodeFloat:forKey:",_rowHeight,_19d);
objj_msgSend(_1a6,"encodeSize:forKey:",_intercellSpacing,_19e);
objj_msgSend(_1a6,"encodeBool:forKey:",_allowsMultipleSelection,_19f);
objj_msgSend(_1a6,"encodeBool:forKey:",_allowsEmptySelection,_1a0);
objj_msgSend(_1a6,"encodeObject:forKey:",_tableColumns,_19c);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _1c=_1b.isa;
class_addMethods(_1c,[new objj_method(sel_getUid("selectionColor"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithHexString:","5f83b9");
}
}),new objj_method(sel_getUid("selectionColorSourceView"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","Resources/tableviewselection.png",CGSizeMake(6,22)));
}
})]);
p;11;CPTabView.ji;13;CPImageView.ji;15;CPTabViewItem.ji;8;CPView.jc;18608;
CPTopTabsBezelBorder=0;
CPNoTabsBezelBorder=4;
CPNoTabsLineBorder=5;
CPNoTabsNoBorder=6;
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil;
var _6=7,_7=7;
var _8=1,_9=2,_a=4,_b=8;
var _c=objj_allocateClassPair(CPView,"CPTabView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_labelsView"),new objj_ivar("_backgroundView"),new objj_ivar("_separatorView"),new objj_ivar("_auxiliaryView"),new objj_ivar("_contentView"),new objj_ivar("_tabViewItems"),new objj_ivar("_selectedTabViewItem"),new objj_ivar("_tabViewType"),new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"initWithFrame:",_10);
if(_e){
_tabViewType=CPTopTabsBezelBorder;
_tabViewItems=[];
}
return _e;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_11,_12){
with(_11){
if(_tabViewType!=CPTopTabsBezelBorder||_labelsView){
return;
}
objj_msgSend(_11,"_createBezelBorder");
objj_msgSend(_11,"layoutSubviews");
}
}),new objj_method(sel_getUid("_createBezelBorder"),function(_13,_14){
with(_13){
var _15=objj_msgSend(_13,"bounds");
_labelsView=objj_msgSend(objj_msgSend(_CPTabLabelsView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_15),0));
objj_msgSend(_labelsView,"setTabView:",_13);
objj_msgSend(_labelsView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_13,"addSubview:",_labelsView);
_backgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_backgroundView,"setBackgroundColor:",_5);
objj_msgSend(_backgroundView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_13,"addSubview:",_backgroundView);
_separatorView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_separatorView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_13,"class"),"bezelBorderColor"));
objj_msgSend(_separatorView,"setAutoresizingMask:",CPViewWidthSizable|CPViewMaxYMargin);
objj_msgSend(_13,"addSubview:",_separatorView);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_16,_17){
with(_16){
if(_tabViewType==CPTopTabsBezelBorder){
var _18=objj_msgSend(_16,"bounds"),_19=objj_msgSend(_CPTabLabelsView,"height");
_18.origin.y+=_19;
_18.size.height-=_19;
objj_msgSend(_backgroundView,"setFrame:",_18);
var _1a=5;
if(_auxiliaryView){
_1a=CGRectGetHeight(objj_msgSend(_auxiliaryView,"frame"));
objj_msgSend(_auxiliaryView,"setFrame:",CGRectMake(_6,_19,CGRectGetWidth(_18)-_6-_7,_1a));
}
objj_msgSend(_separatorView,"setFrame:",CGRectMake(_6,_19+_1a,CGRectGetWidth(_18)-_6-_7,1));
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_16,"contentRect"));
}
}),new objj_method(sel_getUid("addTabViewItem:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"insertTabViewItem:atIndex:",_1d,objj_msgSend(_tabViewItems,"count"));
}
}),new objj_method(sel_getUid("insertTabViewItem:atIndex:"),function(_1e,_1f,_20,_21){
with(_1e){
if(!_labelsView&&_tabViewType==CPTopTabsBezelBorder){
objj_msgSend(_1e,"_createBezelBorder");
}
objj_msgSend(_tabViewItems,"insertObject:atIndex:",_20,_21);
objj_msgSend(_labelsView,"tabView:didAddTabViewItem:",_1e,_20);
if(objj_msgSend(_tabViewItems,"count")==1){
objj_msgSend(_1e,"selectFirstTabViewItem:",_1e);
}
if(_delegateSelectors&_b){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_1e);
}
}
}),new objj_method(sel_getUid("removeTabViewItem:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_22,"indexOfTabViewItem:",_24);
objj_msgSend(_tabViewItems,"removeObjectIdenticalTo:",_24);
objj_msgSend(_labelsView,"tabView:didRemoveTabViewItemAtIndex:",_22,_25);
if(_delegateSelectors&_b){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_22);
}
}
}),new objj_method(sel_getUid("indexOfTabViewItem:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_tabViewItems,"indexOfObjectIdenticalTo:",_28);
}
}),new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"),function(_29,_2a,_2b){
with(_29){
var _2c=0,_2d=objj_msgSend(_tabViewItems,"count");
for(;_2c<_2d;++_2c){
if(objj_msgSend(objj_msgSend(_tabViewItems[_2c],"identifier"),"isEqual:",_2b)){
return _2c;
}
}
return _2c;
}
}),new objj_method(sel_getUid("numberOfTabViewItems"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_tabViewItems,"count");
}
}),new objj_method(sel_getUid("tabViewItemAtIndex:"),function(_30,_31,_32){
with(_30){
return _tabViewItems[_32];
}
}),new objj_method(sel_getUid("tabViewItems"),function(_33,_34){
with(_33){
return _tabViewItems;
}
}),new objj_method(sel_getUid("selectFirstTabViewItem:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_tabViewItems,"count");
if(_38){
objj_msgSend(_35,"selectTabViewItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("selectLastTabViewItem:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_tabViewItems,"count");
if(_3c){
objj_msgSend(_39,"selectTabViewItemAtIndex:",_3c-1);
}
}
}),new objj_method(sel_getUid("selectNextTabViewItem:"),function(_3d,_3e,_3f){
with(_3d){
if(!_selectedTabViewItem){
return;
}
var _40=objj_msgSend(_3d,"indexOfTabViewItem:",_selectedTabViewItem),_41=objj_msgSend(_tabViewItems,"count");
objj_msgSend(_3d,"selectTabViewItemAtIndex:",_40+1%_41);
}
}),new objj_method(sel_getUid("selectPreviousTabViewItem:"),function(_42,_43,_44){
with(_42){
if(!_selectedTabViewItem){
return;
}
var _45=objj_msgSend(_42,"indexOfTabViewItem:",_selectedTabViewItem),_46=objj_msgSend(_tabViewItems,"count");
objj_msgSend(_42,"selectTabViewItemAtIndex:",_45==0?_46:_45-1);
}
}),new objj_method(sel_getUid("selectTabViewItem:"),function(_47,_48,_49){
with(_47){
if((_delegateSelectors&_9)&&!objj_msgSend(_delegate,"tabView:shouldSelectTabViewItem:",_47,_49)){
return;
}
if(_delegateSelectors&_a){
objj_msgSend(_delegate,"tabView:willSelectTabViewItem:",_47,_49);
}
if(_selectedTabViewItem){
_selectedTabViewItem._tabState=CPBackgroundTab;
objj_msgSend(_labelsView,"tabView:didChangeStateOfTabViewItem:",_47,_selectedTabViewItem);
objj_msgSend(_contentView,"removeFromSuperview");
objj_msgSend(_auxiliaryView,"removeFromSuperview");
}
_selectedTabViewItem=_49;
_selectedTabViewItem._tabState=CPSelectedTab;
_contentView=objj_msgSend(_selectedTabViewItem,"view");
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_auxiliaryView=objj_msgSend(_selectedTabViewItem,"auxiliaryView");
objj_msgSend(_auxiliaryView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_47,"addSubview:",_contentView);
if(_auxiliaryView){
objj_msgSend(_47,"addSubview:",_auxiliaryView);
}
objj_msgSend(_labelsView,"tabView:didChangeStateOfTabViewItem:",_47,_selectedTabViewItem);
objj_msgSend(_47,"layoutSubviews");
if(_delegateSelectors&_8){
objj_msgSend(_delegate,"tabView:didSelectTabViewItem:",_47,_49);
}
}
}),new objj_method(sel_getUid("selectTabViewItemAtIndex:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(_4a,"selectTabViewItem:",_tabViewItems[_4c]);
}
}),new objj_method(sel_getUid("selectedTabViewItem"),function(_4d,_4e){
with(_4d){
return _selectedTabViewItem;
}
}),new objj_method(sel_getUid("setTabViewType:"),function(_4f,_50,_51){
with(_4f){
if(_tabViewType==_51){
return;
}
_tabViewType=_51;
if(_tabViewType==CPNoTabsBezelBorder||_tabViewType==CPNoTabsLineBorder||_tabViewType==CPNoTabsNoBorder){
objj_msgSend(_labelsView,"removeFromSuperview");
}else{
if(!objj_msgSend(_labelsView,"superview")){
objj_msgSend(_4f,"addSubview:",_labelsView);
}
}
if(_tabViewType==CPNoTabsLineBorder||_tabViewType==CPNoTabsNoBorder){
objj_msgSend(_backgroundView,"removeFromSuperview");
}else{
if(!objj_msgSend(_backgroundView,"superview")){
objj_msgSend(_4f,"addSubview:",_backgroundView);
}
}
objj_msgSend(_4f,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabViewType"),function(_52,_53){
with(_52){
return _tabViewType;
}
}),new objj_method(sel_getUid("contentRect"),function(_54,_55){
with(_54){
var _56=CGRectMakeCopy(objj_msgSend(_54,"bounds"));
if(_tabViewType==CPTopTabsBezelBorder){
var _57=objj_msgSend(_CPTabLabelsView,"height"),_58=_auxiliaryView?CGRectGetHeight(objj_msgSend(_auxiliaryView,"frame")):5,_59=1;
_56.origin.y+=_57+_58+_59;
_56.size.height-=_57+_58+_59*2;
_56.origin.x+=_6;
_56.size.width-=_6+_7;
}
return _56;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5a,_5b,_5c){
with(_5a){
if(_delegate==_5c){
return;
}
_delegate=_5c;
_delegateSelectors=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:shouldSelectTabViewItem:"))){
_delegateSelectors|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:willSelectTabViewItem:"))){
_delegateSelectors|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:didSelectTabViewItem:"))){
_delegateSelectors|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabViewDidChangeNumberOfTabViewItems:"))){
_delegateSelectors|=_b;
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_5d,_5e,_5f){
with(_5d){
var _60=objj_msgSend(_labelsView,"convertPoint:fromView:",objj_msgSend(_5f,"locationInWindow"),nil),_61=objj_msgSend(_labelsView,"representedTabViewItemAtPoint:",_60);
if(_61){
objj_msgSend(_5d,"selectTabViewItem:",_61);
}
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_62,_63){
with(_62){
if(_62!=CPTabView){
return;
}
var _64=objj_msgSend(CPBundle,"bundleForClass:",_62),_65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","",CGSizeMake(7,0)),_66=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBackgroundCenter.png"),CGSizeMake(1,1)),_67=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBorderLeft.png"),CGSizeMake(7,1)),_68=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBorder.png"),CGSizeMake(1,1)),_69=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_64,"pathForResource:","CPTabView/CPTabViewBezelBorderRight.png"),CGSizeMake(7,1));
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[_65,_65,_65,_67,_66,_69,_67,_68,_69]));
_4=objj_msgSend(CPColor,"colorWithPatternImage:",_68);
}
}),new objj_method(sel_getUid("bezelBorderColor"),function(_6a,_6b){
with(_6a){
return _4;
}
})]);
var _6c="CPTabViewItemsKey",_6d="CPTabViewSelectedItemKey",_6e="CPTabViewTypeKey",_6f="CPTabViewDelegateKey";
var _c=objj_getClass("CPTabView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("initWithCoder:"),function(_70,_71,_72){
with(_70){
if(_70=objj_msgSendSuper({receiver:_70,super_class:objj_getClass("CPView")},"initWithCoder:",_72)){
_tabViewType=objj_msgSend(_72,"decodeIntForKey:",_6e);
_tabViewItems=[];
objj_msgSend(_70,"_createBezelBorder");
var _73=objj_msgSend(_72,"decodeObjectForKey:",_6c);
for(var i=0;_73&&i<_73.length;i++){
objj_msgSend(_70,"insertTabViewItem:atIndex:",_73[i],i);
}
var _75=objj_msgSend(_72,"decodeObjectForKey:",_6d);
if(_75){
objj_msgSend(_70,"selectTabViewItem:",_75);
}
objj_msgSend(_70,"setDelegate:",objj_msgSend(_72,"decodeObjectForKey:",_6f));
}
return _70;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_76,_77,_78){
with(_76){
var _79=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_76,super_class:objj_getClass("CPView")},"encodeWithCoder:",_78);
_subviews=_79;
objj_msgSend(_78,"encodeObject:forKey:",_tabViewItems,_6c);
objj_msgSend(_78,"encodeObject:forKey:",_selectedTabViewItem,_6d);
objj_msgSend(_78,"encodeInt:forKey:",_tabViewType,_6e);
objj_msgSend(_78,"encodeConditionalObject:forKey:",_delegate,_6f);
}
})]);
var _7a=nil,_7b=10,_7c=15;
var _c=objj_allocateClassPair(CPView,"_CPTabLabelsView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_tabView"),new objj_ivar("_tabLabels")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_7d,_7e,_7f){
with(_7d){
_7d=objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPView")},"initWithFrame:",_7f);
if(_7d){
_tabLabels=[];
objj_msgSend(_7d,"setBackgroundColor:",_7a);
objj_msgSend(_7d,"setFrameSize:",CGSizeMake(CGRectGetWidth(_7f),26));
}
return _7d;
}
}),new objj_method(sel_getUid("setTabView:"),function(_80,_81,_82){
with(_80){
_tabView=_82;
}
}),new objj_method(sel_getUid("tabView"),function(_83,_84){
with(_83){
return _tabView;
}
}),new objj_method(sel_getUid("tabView:didAddTabViewItem:"),function(_85,_86,_87,_88){
with(_85){
var _89=objj_msgSend(objj_msgSend(_CPTabLabel,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_89,"setTabViewItem:",_88);
_tabLabels.push(_89);
objj_msgSend(_85,"addSubview:",_89);
objj_msgSend(_85,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabView:didRemoveTabViewItemAtIndex:"),function(_8a,_8b,_8c,_8d){
with(_8a){
var _8e=_tabLabels[_8d];
objj_msgSend(_tabLabels,"removeObjectAtIndex:",_8d);
objj_msgSend(_8e,"removeFromSuperview");
objj_msgSend(_8a,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabView:didChangeStateOfTabViewItem:"),function(_8f,_90,_91,_92){
with(_8f){
objj_msgSend(_tabLabels[objj_msgSend(_91,"indexOfTabViewItem:",_92)],"setTabState:",objj_msgSend(_92,"tabState"));
}
}),new objj_method(sel_getUid("representedTabViewItemAtPoint:"),function(_93,_94,_95){
with(_93){
var _96=0,_97=_tabLabels.length;
for(;_96<_97;++_96){
var _98=_tabLabels[_96];
if(CGRectContainsPoint(objj_msgSend(_98,"frame"),_95)){
return objj_msgSend(_98,"tabViewItem");
}
}
return nil;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_99,_9a){
with(_99){
var _9b=0,_9c=_tabLabels.length,_9d=((objj_msgSend(_99,"bounds").size.width)-(_9c-1)*_7b-2*_7c)/_9c,x=_7c;
for(;_9b<_9c;++_9b){
var _9f=_tabLabels[_9b],_a0={origin:{x:x,y:8},size:{width:_9d,height:18}};
objj_msgSend(_9f,"setFrame:",_a0);
x=(_a0.origin.x+_a0.size.width)+_7b;
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_a1,_a2,_a3){
with(_a1){
if(CGSizeEqualToSize(objj_msgSend(_a1,"frame").size,_a3)){
return;
}
objj_msgSendSuper({receiver:_a1,super_class:objj_getClass("CPView")},"setFrameSize:",_a3);
objj_msgSend(_a1,"layoutSubviews");
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_a4,_a5){
with(_a4){
if(_a4!=objj_msgSend(_CPTabLabelsView,"class")){
return;
}
var _a6=objj_msgSend(CPBundle,"bundleForClass:",_a4);
_7a=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a6,"pathForResource:","CPTabView/_CPTabLabelsViewLeft.png"),CGSizeMake(12,26)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a6,"pathForResource:","CPTabView/_CPTabLabelsViewCenter.png"),CGSizeMake(1,26)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a6,"pathForResource:","CPTabView/_CPTabLabelsViewRight.png"),CGSizeMake(12,26))],NO));
}
}),new objj_method(sel_getUid("height"),function(_a7,_a8){
with(_a7){
return 26;
}
})]);
var _a9=nil,_aa=nil;
var _c=objj_allocateClassPair(CPView,"_CPTabLabel"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_tabViewItem"),new objj_ivar("_labelField")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_ab,_ac,_ad){
with(_ab){
_ab=objj_msgSendSuper({receiver:_ab,super_class:objj_getClass("CPView")},"initWithFrame:",_ad);
if(_ab){
_labelField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_labelField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_labelField,"setFrame:",CGRectMake(5,0,CGRectGetWidth(_ad)-10,20));
objj_msgSend(_labelField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_labelField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",11));
objj_msgSend(_ab,"addSubview:",_labelField);
objj_msgSend(_ab,"setTabState:",CPBackgroundTab);
}
return _ab;
}
}),new objj_method(sel_getUid("setTabState:"),function(_ae,_af,_b0){
with(_ae){
objj_msgSend(_ae,"setBackgroundColor:",_b0==CPSelectedTab?_aa:_a9);
}
}),new objj_method(sel_getUid("setTabViewItem:"),function(_b1,_b2,_b3){
with(_b1){
_tabViewItem=_b3;
objj_msgSend(_b1,"update");
}
}),new objj_method(sel_getUid("tabViewItem"),function(_b4,_b5){
with(_b4){
return _tabViewItem;
}
}),new objj_method(sel_getUid("update"),function(_b6,_b7){
with(_b6){
objj_msgSend(_labelField,"setStringValue:",objj_msgSend(_tabViewItem,"label"));
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_b8,_b9){
with(_b8){
if(_b8!=objj_msgSend(_CPTabLabel,"class")){
return;
}
var _ba=objj_msgSend(CPBundle,"bundleForClass:",_b8);
_a9=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelBackgroundLeft.png"),CGSizeMake(6,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelBackgroundCenter.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelBackgroundRight.png"),CGSizeMake(6,18))],NO));
_aa=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelSelectedLeft.png"),CGSizeMake(3,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelSelectedCenter.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelSelectedRight.png"),CGSizeMake(3,18))],NO));
}
})]);
p;15;CPTabViewItem.jI;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;2688;
CPSelectedTab=0;
CPBackgroundTab=1;
CPPressedTab=2;
var _1=objj_allocateClassPair(CPObject,"CPTabViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_label"),new objj_ivar("_view"),new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_identifier=_7;
}
return _5;
}
}),new objj_method(sel_getUid("setLabel:"),function(_8,_9,_a){
with(_8){
_label=_a;
}
}),new objj_method(sel_getUid("label"),function(_b,_c){
with(_b){
return _label;
}
}),new objj_method(sel_getUid("tabState"),function(_d,_e){
with(_d){
return _tabState;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_f,_10,_11){
with(_f){
_identifier=_11;
}
}),new objj_method(sel_getUid("identifier"),function(_12,_13){
with(_12){
return _identifier;
}
}),new objj_method(sel_getUid("setView:"),function(_14,_15,_16){
with(_14){
_view=_16;
}
}),new objj_method(sel_getUid("view"),function(_17,_18){
with(_17){
return _view;
}
}),new objj_method(sel_getUid("setAuxiliaryView:"),function(_19,_1a,_1b){
with(_19){
_auxiliaryView=_1b;
}
}),new objj_method(sel_getUid("auxiliaryView"),function(_1c,_1d){
with(_1c){
return _auxiliaryView;
}
}),new objj_method(sel_getUid("tabView"),function(_1e,_1f){
with(_1e){
return _tabView;
}
})]);
var _20="CPTabViewItemIdentifierKey",_21="CPTabViewItemLabelKey",_22="CPTabViewItemViewKey",_23="CPTabViewItemAuxViewKey";
var _1=objj_getClass("CPTabViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_24,_25,_26){
with(_24){
_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPObject")},"init");
if(_24){
_identifier=objj_msgSend(_26,"decodeObjectForKey:",_20);
_label=objj_msgSend(_26,"decodeObjectForKey:",_21);
_view=objj_msgSend(_26,"decodeObjectForKey:",_22);
_auxiliaryView=objj_msgSend(_26,"decodeObjectForKey:",_23);
}
return _24;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_29,"encodeObject:forKey:",_identifier,_20);
objj_msgSend(_29,"encodeObject:forKey:",_label,_21);
objj_msgSend(_29,"encodeObject:forKey:",_view,_22);
objj_msgSend(_29,"encodeObject:forKey:",_auxiliaryView,_23);
}
})]);
p;13;CPTextField.ji;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;16064;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1="‚Ä¢";
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("string"),function(_4,_5){
with(_4){
return _4;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _2=objj_allocateClassPair(CPControl,"CPTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setStringValue:","");
objj_msgSend(_6,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_6,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
_isEditable=_b;
}
}),new objj_method(sel_getUid("isEditable"),function(_c,_d){
with(_c){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_e,_f,_10){
with(_e){
_isSelectable=_10;
}
}),new objj_method(sel_getUid("isSelectable"),function(_11,_12){
with(_11){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_13,_14,_15){
with(_13){
_isSecure=_15;
}
}),new objj_method(sel_getUid("isSecure"),function(_16,_17){
with(_16){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_18,_19,_1a){
with(_18){
if(_1a){
objj_msgSend(_18,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_18,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_1d,_1e,_1f){
with(_1d){
var _20=_1f===CPTextFieldRoundedBezel;
if(_20){
objj_msgSend(_1d,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_1d,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_23,_24,_25){
with(_23){
if(_25){
objj_msgSend(_23,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_23,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_28,_29,_2a){
with(_28){
if(_drawsBackground==_2a){
return;
}
_drawsBackground=_2a;
objj_msgSend(_28,"setNeedsLayout");
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_2b,_2c){
with(_2b){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_2d,_2e,_2f){
with(_2d){
if(_textFieldBackgroundColor==_2f){
return;
}
_textFieldBackgroundColor=_2f;
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_30,_31){
with(_30){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"isEditable")&&objj_msgSend(_32,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_34,_35){
with(_34){
objj_msgSend(_34,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_34,"_updatePlaceholderState");
objj_msgSend(_34,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_36,_37){
with(_36){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_36,"_updatePlaceholderState");
objj_msgSend(_36,"setNeedsLayout");
objj_msgSend(_36,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_36,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_38,"isEditable")&&objj_msgSend(_38,"isEnabled")){
return objj_msgSend(objj_msgSend(_38,"window"),"makeFirstResponder:",_38);
}else{
return objj_msgSend(objj_msgSend(_38,"nextResponder"),"mouseDown:",_3a);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_3b,_3c){
with(_3b){
return objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("_setStringValue:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPControl")},"setObjectValue:",String(_3f));
objj_msgSend(_3d,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_40,_41,_42){
with(_40){
objj_msgSendSuper({receiver:_40,super_class:objj_getClass("CPControl")},"setObjectValue:",_42);
objj_msgSend(_40,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_43,_44){
with(_43){
var _45=objj_msgSend(_43,"stringValue");
if((!_45||_45.length===0)&&!objj_msgSend(_43,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_43,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_43,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_46,_47,_48){
with(_46){
if(_placeholderString===_48){
return;
}
_placeholderString=_48;
if(objj_msgSend(_46,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_46,"setNeedsLayout");
objj_msgSend(_46,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_49,_4a){
with(_49){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4b,_4c){
with(_4b){
var _4d=objj_msgSend((objj_msgSend(_4b,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_4b,"currentValueForThemeAttribute:","font")),_4e=objj_msgSend(_4b,"currentValueForThemeAttribute:","content-inset"),_4f=objj_msgSend(_4b,"currentValueForThemeAttribute:","min-size"),_50=objj_msgSend(_4b,"currentValueForThemeAttribute:","max-size");
_4d.width=MAX(_4d.width+_4e.left+_4e.right,_4f.width);
_4d.height=MAX(_4d.height+_4e.top+_4e.bottom,_4f.height);
if(_50.width>=0){
_4d.width=MIN(_4d.width,_50.width);
}
if(_50.height>=0){
_4d.height=MIN(_4d.height,_50.height);
}
if(objj_msgSend(_4b,"isEditable")){
_4d.width=CGRectGetWidth(objj_msgSend(_4b,"frame"));
}
objj_msgSend(_4b,"setFrameSize:",_4d);
}
}),new objj_method(sel_getUid("selectText:"),function(_51,_52,_53){
with(_51){
}
}),new objj_method(sel_getUid("setDelegate:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_57,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_54);
objj_msgSend(_57,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_54);
objj_msgSend(_57,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_54);
}
_delegate=_56;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_57,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_54);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_57,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_54);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_57,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_54);
}
}
}),new objj_method(sel_getUid("delegate"),function(_58,_59){
with(_58){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemeAttribute:","content-inset");
if(!_5d){
return _5c;
}
_5c.origin.x+=_5d.left;
_5c.origin.y+=_5d.top;
_5c.size.width-=_5d.left+_5d.right;
_5c.size.height-=_5d.top+_5d.bottom;
return _5c;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_5e,_5f,_60){
with(_5e){
var _61=objj_msgSend(_5e,"currentValueForThemeAttribute:","bezel-inset");
if(((_61).top===0&&(_61).right===0&&(_61).bottom===0&&(_61).left===0)){
return _60;
}
_60.origin.x+=_61.left;
_60.origin.y+=_61.top;
_60.size.width-=_61.left+_61.right;
_60.size.height-=_61.top+_61.bottom;
return _60;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_62,_63,_64){
with(_62){
if(_64==="bezel-view"){
return objj_msgSend(_62,"bezelRectForBounds:",objj_msgSend(_62,"bounds"));
}else{
if(_64==="content-view"){
return objj_msgSend(_62,"contentRectForBounds:",objj_msgSend(_62,"bounds"));
}
}
return objj_msgSendSuper({receiver:_62,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_64);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_65,_66,_67){
with(_65){
if(_67==="bezel-view"){
var _68=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_68,"setHitTests:",NO);
return _68;
}else{
var _68=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _68;
}
return objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_67);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_69,_6a){
with(_69){
var _6b=objj_msgSend(_69,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_6b){
objj_msgSend(_6b,"setBackgroundColor:",objj_msgSend(_69,"currentValueForThemeAttribute:","bezel-color"));
}
var _6c=objj_msgSend(_69,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_6c){
objj_msgSend(_6c,"setHidden:",objj_msgSend(_69,"hasThemeState:",CPThemeStateEditing));
var _6d="";
if(objj_msgSend(_69,"hasThemeState:",CPTextFieldStatePlaceholder)){
_6d=objj_msgSend(_69,"placeholderString");
}else{
_6d=objj_msgSend(_69,"stringValue");
if(objj_msgSend(_69,"isSecure")){
_6d=_6e(_6d);
}
}
objj_msgSend(_6c,"setText:",_6d);
objj_msgSend(_6c,"setTextColor:",objj_msgSend(_69,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_6c,"setFont:",objj_msgSend(_69,"currentValueForThemeAttribute:","font"));
objj_msgSend(_6c,"setAlignment:",objj_msgSend(_69,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_6c,"setVerticalAlignment:",objj_msgSend(_69,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_6c,"setLineBreakMode:",objj_msgSend(_69,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_6c,"setTextShadowColor:",objj_msgSend(_69,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_6c,"setTextShadowOffset:",objj_msgSend(_69,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:"),function(_6f,_70,_71,_72,_73){
with(_6f){
return objj_msgSend(_6f,"textFieldWithStringValue:placeholder:width:theme:",_71,_72,_73,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("textFieldWithStringValue:placeholder:width:theme:"),function(_74,_75,_76,_77,_78,_79){
with(_74){
var _7a=objj_msgSend(objj_msgSend(_74,"alloc"),"initWithFrame:",CGRectMake(0,0,_78,29));
objj_msgSend(_7a,"setTheme:",_79);
objj_msgSend(_7a,"setStringValue:",_76);
objj_msgSend(_7a,"setPlaceholderString:",_77);
objj_msgSend(_7a,"setBordered:",YES);
objj_msgSend(_7a,"setBezeled:",YES);
objj_msgSend(_7a,"setEditable:",YES);
objj_msgSend(_7a,"sizeToFit");
return _7a;
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:"),function(_7b,_7c,_7d,_7e,_7f){
with(_7b){
return objj_msgSend(_7b,"roundedTextFieldWithStringValue:placeholder:width:theme:",_7d,_7e,_7f,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("roundedTextFieldWithStringValue:placeholder:width:theme:"),function(_80,_81,_82,_83,_84,_85){
with(_80){
var _86=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(0,0,_84,29));
objj_msgSend(_86,"setTheme:",_85);
objj_msgSend(_86,"setStringValue:",_82);
objj_msgSend(_86,"setPlaceholderString:",_83);
objj_msgSend(_86,"setBezelStyle:",CPTextFieldRoundedBezel);
objj_msgSend(_86,"setBordered:",YES);
objj_msgSend(_86,"setBezeled:",YES);
objj_msgSend(_86,"setEditable:",YES);
objj_msgSend(_86,"sizeToFit");
return _86;
}
}),new objj_method(sel_getUid("labelWithTitle:"),function(_87,_88,_89){
with(_87){
return objj_msgSend(_87,"labelWithTitle:theme:",_89,objj_msgSend(CPTheme,"defaultTheme"));
}
}),new objj_method(sel_getUid("labelWithTitle:theme:"),function(_8a,_8b,_8c,_8d){
with(_8a){
var _8e=objj_msgSend(objj_msgSend(_8a,"alloc"),"init");
objj_msgSend(_8e,"setStringValue:",_8c);
objj_msgSend(_8e,"sizeToFit");
return _8e;
}
}),new objj_method(sel_getUid("themeClass"),function(_8f,_90){
with(_8f){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_91,_92){
with(_91){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _6e=function(_93){
if(!_93){
return "";
}
return Array(_93.length).join(_1);
};
var _94="CPTextFieldIsEditableKey",_95="CPTextFieldIsSelectableKey",_96="CPTextFieldIsBorderedKey",_97="CPTextFieldIsBezeledKey",_98="CPTextFieldBezelStyleKey",_99="CPTextFieldDrawsBackgroundKey",_9a="CPTextFieldLineBreakModeKey",_9b="CPTextFieldBackgroundColorKey",_9c="CPTextFieldPlaceholderStringKey";
var _2=objj_getClass("CPTextField");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_9d,_9e,_9f){
with(_9d){
_9d=objj_msgSendSuper({receiver:_9d,super_class:objj_getClass("CPControl")},"initWithCoder:",_9f);
if(_9d){
objj_msgSend(_9d,"setEditable:",objj_msgSend(_9f,"decodeBoolForKey:",_94));
objj_msgSend(_9d,"setSelectable:",objj_msgSend(_9f,"decodeBoolForKey:",_95));
objj_msgSend(_9d,"setDrawsBackground:",objj_msgSend(_9f,"decodeBoolForKey:",_99));
objj_msgSend(_9d,"setTextFieldBackgroundColor:",objj_msgSend(_9f,"decodeObjectForKey:",_9b));
objj_msgSend(_9d,"setPlaceholderString:",objj_msgSend(_9f,"decodeObjectForKey:",_9c));
}
return _9d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_a2);
objj_msgSend(_a2,"encodeBool:forKey:",_isEditable,_94);
objj_msgSend(_a2,"encodeBool:forKey:",_isSelectable,_95);
objj_msgSend(_a2,"encodeBool:forKey:",_drawsBackground,_99);
objj_msgSend(_a2,"encodeObject:forKey:",_textFieldBackgroundColor,_9b);
objj_msgSend(_a2,"encodeObject:forKey:",_placeholderString,_9c);
}
})]);
p;9;CPTheme.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;10887;
var _1={},_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPTheme"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_name"),new objj_ivar("_attributes")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithName:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_name=_7;
_attributes=objj_msgSend(CPDictionary,"dictionary");
_1[_name]=_5;
}
return _5;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _name;
}
}),new objj_method(sel_getUid("_attributeWithName:forClass:"),function(_a,_b,_c,_d){
with(_a){
var _e=objj_msgSend(_attributes,"objectForKey:",_d);
if(!_e){
return nil;
}
return objj_msgSend(_e,"objectForKey:",_c);
}
}),new objj_method(sel_getUid("takeThemeFromObject:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(_11,"_themeAttributeDictionary"),_13=nil,_14=objj_msgSend(_12,"keyEnumerator"),_15=objj_msgSend(objj_msgSend(_11,"class"),"themeClass");
while(_13=objj_msgSend(_14,"nextObject")){
objj_msgSend(_f,"_recordAttribute:forClass:",objj_msgSend(_12,"objectForKey:",_13),_15);
}
}
}),new objj_method(sel_getUid("_recordAttribute:forClass:"),function(_16,_17,_18,_19){
with(_16){
if(!objj_msgSend(_18,"hasValues")){
return;
}
var _1a=objj_msgSend(_attributes,"objectForKey:",_19);
if(!_1a){
_1a=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_attributes,"setObject:forKey:",_1a,_19);
}
var _1b=objj_msgSend(_18,"name"),_1c=objj_msgSend(_1a,"objectForKey:",_1b);
if(_1c){
objj_msgSend(_1a,"setObject:forKey:",objj_msgSend(_1c,"attributeMergedWithAttribute:",_18),_1b);
}else{
objj_msgSend(_1a,"setObject:forKey:",_18,_1b);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("setDefaultTheme:"),function(_1d,_1e,_1f){
with(_1d){
_2=_1f;
}
}),new objj_method(sel_getUid("defaultTheme"),function(_20,_21){
with(_20){
return _2;
}
}),new objj_method(sel_getUid("themeNamed:"),function(_22,_23,_24){
with(_22){
return _1[_24];
}
})]);
var _25="CPThemeNameKey",_26="CPThemeAttributesKey";
var _3=objj_getClass("CPTheme");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTheme\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPObject")},"init");
if(_27){
_name=objj_msgSend(_29,"decodeObjectForKey:",_25);
_attributes=objj_msgSend(_29,"decodeObjectForKey:",_26);
_1[_name]=_27;
}
return _27;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2c,"encodeObject:forKey:",_name,_25);
objj_msgSend(_2c,"encodeObject:forKey:",_attributes,_26);
}
})]);
var _3=objj_allocateClassPair(CPKeyedUnarchiver,"_CPThemeKeyedUnarchiver"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_bundle")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initForReadingWithData:bundle:"),function(_2d,_2e,_2f,_30){
with(_2d){
_2d=objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_2f);
if(_2d){
_bundle=_30;
}
return _2d;
}
}),new objj_method(sel_getUid("bundle"),function(_31,_32){
with(_31){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_33,_34){
with(_33){
return YES;
}
})]);
var _35={},_36={},_37=0;
CPThemeState=function(_38){
var _39=_35[_38];
if(_39===undefined){
if(_38.indexOf("+")===-1){
_39=1<<_37++;
}else{
var _39=0,_3a=_38.split("+"),_3b=_3a.length;
while(_3b--){
var _3c=_3a[_3b],_3d=_35[_3c];
if(_3d===undefined){
_3d=1<<_37++;
_35[_3c]=_3d;
_36[_3d]=_3c;
}
_39|=_3d;
}
}
_35[_38]=_39;
_36[_39]=_38;
}
return _39;
};
CPThemeStateName=function(_3e){
var _3f=_36[_3e];
if(_3f!==undefined){
return _3f;
}
if(!(_3e&(_3e-1))){
return "";
}
var _40=1,_3f="";
for(;_40<_3e;_40<<=1){
if(_3e&_40){
_3f+=(_3f.length===0?"":"+")+_36[_40];
}
}
_36[_3e]=_3f;
return _3f;
};
_36[0]="normal";
CPThemeStateNormal=_35["normal"]=0;
CPThemeStateDisabled=CPThemeState("disabled");
CPThemeStateHighlighted=CPThemeState("highlighted");
CPThemeStateSelected=CPThemeState("selected");
CPThemeStateBezeled=CPThemeState("bezeled");
CPThemeStateBordered=CPThemeState("bordered");
CPThemeStateEditable=CPThemeState("editable");
CPThemeStateEditing=CPThemeState("editing");
CPThemeStateVertical=CPThemeState("vertical");
CPThemeStateDefault=CPThemeState("default");
CPThemeStateCircular=CPThemeState("circular");
var _3=objj_allocateClassPair(CPObject,"_CPThemeAttribute"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_name"),new objj_ivar("_defaultValue"),new objj_ivar("_values"),new objj_ivar("_cache"),new objj_ivar("_parentAttribute")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithName:defaultValue:"),function(_41,_42,_43,_44){
with(_41){
_41=objj_msgSendSuper({receiver:_41,super_class:objj_getClass("CPObject")},"init");
if(_41){
_cache={};
_name=_43;
_defaultValue=_44;
_values=objj_msgSend(CPDictionary,"dictionary");
}
return _41;
}
}),new objj_method(sel_getUid("name"),function(_45,_46){
with(_45){
return _name;
}
}),new objj_method(sel_getUid("defaultValue"),function(_47,_48){
with(_47){
return _defaultValue;
}
}),new objj_method(sel_getUid("hasValues"),function(_49,_4a){
with(_49){
return objj_msgSend(_values,"count")>0;
}
}),new objj_method(sel_getUid("isTrivial"),function(_4b,_4c){
with(_4b){
return (objj_msgSend(_values,"count")===1)&&(Number(objj_msgSend(_values,"allKeys")[0])===CPThemeStateNormal);
}
}),new objj_method(sel_getUid("setValue:"),function(_4d,_4e,_4f){
with(_4d){
_cache={};
if(_4f===undefined||_4f===nil){
_values=objj_msgSend(CPDictionary,"dictionary");
}else{
_values=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_4f,String(CPThemeStateNormal));
}
}
}),new objj_method(sel_getUid("setValue:forState:"),function(_50,_51,_52,_53){
with(_50){
_cache={};
if((_52===undefined)||(_52===nil)){
objj_msgSend(_values,"removeObjectForKey:",String(_53));
}else{
objj_msgSend(_values,"setObject:forKey:",_52,String(_53));
}
}
}),new objj_method(sel_getUid("value"),function(_54,_55){
with(_54){
return objj_msgSend(_54,"valueForState:",CPThemeStateNormal);
}
}),new objj_method(sel_getUid("valueForState:"),function(_56,_57,_58){
with(_56){
var _59=_cache[_58];
if(_59!==undefined){
return _59;
}
_59=objj_msgSend(_values,"objectForKey:",String(_58));
if((_59===undefined||_59===nil)&&_58!==CPThemeStateNormal){
if(_58&(_58-1)){
var _5a=0,_5b=objj_msgSend(_values,"allKeys"),_5c=_5b.length;
while(_5c--){
var _5d=Number(_5b[_5c]);
if((_5d&_58)===_5d){
var _5e=_5f[_5d];
if(_5e===undefined){
_5e=_60(_5d);
}
if(_5e>_5a){
_5a=_5e;
_59=objj_msgSend(_values,"objectForKey:",String(_5d));
}
}
}
}
if(_59===undefined||_59===nil){
_59=objj_msgSend(_values,"objectForKey:",String(CPThemeStateNormal));
}
}
if(_59===undefined||_59===nil){
_59=objj_msgSend(_parentAttribute,"valueForState:",_58);
}
if(_59===undefined||_59===nil){
_59=_defaultValue;
}
_cache[_58]=_59;
return _59;
}
}),new objj_method(sel_getUid("setParentAttribute:"),function(_61,_62,_63){
with(_61){
if(_parentAttribute===_63){
return;
}
_cache={};
_parentAttribute=_63;
}
}),new objj_method(sel_getUid("attributeMergedWithAttribute:"),function(_64,_65,_66){
with(_64){
var _67=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_name,_defaultValue);
_67._values=objj_msgSend(_values,"copy");
objj_msgSend(_67._values,"addEntriesFromDictionary:",_66._values);
return _67;
}
})]);
var _3=objj_getClass("_CPThemeAttribute");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPThemeAttribute\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_68,_69,_6a){
with(_68){
_68=objj_msgSendSuper({receiver:_68,super_class:objj_getClass("CPObject")},"init");
if(_68){
_cache={};
_name=objj_msgSend(_6a,"decodeObjectForKey:","name");
_values=objj_msgSend(CPDictionary,"dictionary");
if(objj_msgSend(_6a,"containsValueForKey:","value")){
var _6b=CPThemeStateNormal;
if(objj_msgSend(_6a,"containsValueForKey:","state")){
_6b=CPThemeState(objj_msgSend(_6a,"decodeObjectForKey:","state"));
}
objj_msgSend(_values,"setObject:forKey:",objj_msgSend(_6a,"decodeObjectForKey:","value"),_6b);
}else{
var _6c=objj_msgSend(_6a,"decodeObjectForKey:","values"),_6d=objj_msgSend(_6c,"allKeys"),_6e=_6d.length;
while(_6e--){
var key=_6d[_6e];
objj_msgSend(_values,"setObject:forKey:",objj_msgSend(_6c,"objectForKey:",key),CPThemeState(key));
}
}
}
return _68;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_72,"encodeObject:forKey:",_name,"name");
var _73=objj_msgSend(_values,"allKeys"),_74=_73.length;
if(_74===1){
var _75=_73[0];
if(Number(_75)!==CPThemeStateNormal){
objj_msgSend(_72,"encodeObject:forKey:",CPThemeStateName(Number(_75)),"state");
}
objj_msgSend(_72,"encodeObject:forKey:",objj_msgSend(_values,"objectForKey:",_75),"value");
}else{
var _76=objj_msgSend(CPDictionary,"dictionary");
while(_74--){
var key=_73[_74];
objj_msgSend(_76,"setObject:forKey:",objj_msgSend(_values,"objectForKey:",key),CPThemeStateName(Number(key)));
}
objj_msgSend(_72,"encodeObject:forKey:",_76,"values");
}
}
})]);
var _5f=[0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6];
var _60=function(_78){
var _79=0,_7a=_78;
while(_78){
++_79;
_78&=(_78-1);
}
_5f[_7a]=_79;
return _79;
};
_60.displayName="numberOfOnes";
CPThemeAttributeEncode=function(_7b,_7c){
var _7d=_7c._values,_7e=objj_msgSend(_7d,"count"),key="$a"+objj_msgSend(_7c,"name");
if(_7e===1){
var _80=objj_msgSend(_7d,"allKeys")[0];
if(Number(_80)===0){
objj_msgSend(_7b,"encodeObject:forKey:",objj_msgSend(_7d,"objectForKey:",_80),key);
return YES;
}
}
if(_7e>=1){
objj_msgSend(_7b,"encodeObject:forKey:",_7c,key);
return YES;
}
return NO;
};
CPThemeAttributeDecode=function(_81,_82,_83,_84,_85){
var key="$a"+_82;
if(!objj_msgSend(_81,"containsValueForKey:",key)){
var _87=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_82,_83);
}else{
var _87=objj_msgSend(_81,"decodeObjectForKey:",key);
if(!_87.isa||!objj_msgSend(_87,"isKindOfClass:",objj_msgSend(_CPThemeAttribute,"class"))){
var _88=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_82,_83);
objj_msgSend(_88,"setValue:",_87);
_87=_88;
}
}
if(_84&&_85){
objj_msgSend(_87,"setParentAttribute:",objj_msgSend(_84,"_attributeWithName:forClass:",_82,_85));
}
return _87;
};
p;14;CPThemeBlend.jI;21;Foundation/CPObject.jI;16;AppKit/CPTheme.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.jc;1452;
var _1=objj_allocateClassPair(CPObject,"CPThemeBlend"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_themes"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("themes"),function(_3,_4){
with(_3){
return _themes;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_bundle=objj_msgSend(objj_msgSend(CPBundle,"alloc"),"initWithPath:",_7+"/Info.plist");
}
return _5;
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_8,_9,_a){
with(_8){
_loadDelegate=_a;
objj_msgSend(_bundle,"loadWithDelegate:",_8);
}
}),new objj_method(sel_getUid("bundleDidFinishLoading:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_bundle,"objectForInfoDictionaryKey:","CPBundleReplacedFiles"),_f=0,_10=_e.length,_11=objj_msgSend(_bundle,"bundlePath");
while(_10--){
var _12=_e[_10];
if(objj_msgSend(_12,"pathExtension")==="keyedtheme"){
var _13=objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:",objj_msgSend(CPData,"dataWithString:",objj_files[_11+"/"+_12].contents),_bundle);
objj_msgSend(_13,"decodeObjectForKey:","root");
objj_msgSend(_13,"finishDecoding");
}
}
objj_msgSend(_loadDelegate,"blendDidFinishLoading:",_b);
}
})]);
p;11;CPToolbar.jI;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;17354;
CPToolbarDisplayModeDefault=0;
CPToolbarDisplayModeIconAndLabel=1;
CPToolbarDisplayModeIconOnly=2;
CPToolbarDisplayModeLabelOnly=3;
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"CPToolbar"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_identifier"),new objj_ivar("_displayMode"),new objj_ivar("_showsBaselineSeparator"),new objj_ivar("_allowsUserCustomization"),new objj_ivar("_isVisible"),new objj_ivar("_delegate"),new objj_ivar("_itemIdentifiers"),new objj_ivar("_identifiedItems"),new objj_ivar("_defaultItems"),new objj_ivar("_allowedItems"),new objj_ivar("_selectableItems"),new objj_ivar("_items"),new objj_ivar("_itemsSortedByVisibilityPriority"),new objj_ivar("_toolbarView"),new objj_ivar("_window")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_items=[];
_identifier=_9;
_isVisible=YES;
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_7,_identifier);
}
return _7;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("identifier"),function(_d,_e){
with(_d){
return _identifier;
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("isVisible"),function(_11,_12){
with(_11){
return _isVisible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_13,_14,_15){
with(_13){
if(_isVisible===_15){
return;
}
_isVisible=_15;
objj_msgSend(_window,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("_window"),function(_16,_17){
with(_16){
return _window;
}
}),new objj_method(sel_getUid("_setWindow:"),function(_18,_19,_1a){
with(_18){
_window=_1a;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1b,_1c,_1d){
with(_1b){
if(_delegate==_1d){
return;
}
_delegate=_1d;
objj_msgSend(_1b,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("_loadConfiguration"),function(_1e,_1f){
with(_1e){
}
}),new objj_method(sel_getUid("_toolbarView"),function(_20,_21){
with(_20){
if(!_toolbarView){
_toolbarView=objj_msgSend(objj_msgSend(_CPToolbarView,"alloc"),"initWithFrame:",CPRectMake(0,0,1200,59));
objj_msgSend(_toolbarView,"setToolbar:",_20);
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
return _toolbarView;
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_22,_23){
with(_22){
if(!_delegate){
return;
}
var _24=objj_msgSend(_itemIdentifiers,"count");
if(!_24){
_itemIdentifiers=objj_msgSend(objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_22),"mutableCopy");
_24=objj_msgSend(_itemIdentifiers,"count");
}
_items=[];
var _25=0;
for(;_25<_24;++_25){
var _26=_itemIdentifiers[_25],_27=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_26);
if(!_27){
_27=objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_22,_26,YES);
}
_27=objj_msgSend(_27,"copy");
if(_27==nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_26));
}
objj_msgSend(_items,"addObject:",_27);
}
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_28,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}),new objj_method(sel_getUid("items"),function(_29,_2a){
with(_29){
return _items;
}
}),new objj_method(sel_getUid("visibleItems"),function(_2b,_2c){
with(_2b){
return objj_msgSend(_toolbarView,"visibleItems");
}
}),new objj_method(sel_getUid("itemsSortedByVisibilityPriority"),function(_2d,_2e){
with(_2d){
return _itemsSortedByVisibilityPriority;
}
}),new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_2f,_30,_31,_32){
with(_2f){
var _33=objj_msgSend(_identifiedItems,"objectForKey:",_31);
if(!_33){
_33=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_31);
if(_delegate&&!_33){
_33=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_2f,_31,_32),"copy");
if(!_33){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_31));
}
}
objj_msgSend(_identifiedItems,"setObject:forKey:",_33,_31);
}
return _33;
}
}),new objj_method(sel_getUid("_itemsWithIdentifiers:"),function(_34,_35,_36){
with(_34){
var _37=[];
for(var i=0;i<_36.length;i++){
objj_msgSend(_37,"addObject:",objj_msgSend(_34,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_36[i],NO));
}
return _37;
}
}),new objj_method(sel_getUid("_defaultToolbarItems"),function(_39,_3a){
with(_39){
if(!_defaultItems){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
_defaultItems=objj_msgSend(_39,"_itemsWithIdentifiers:",objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_39));
}
}
return _defaultItems;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_3b,_3c){
with(_3b){
if(_3b!=objj_msgSend(CPToolbar,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("_addToolbar:forIdentifier:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=objj_msgSend(_1,"objectForKey:",_40);
if(!_41){
_41=[];
objj_msgSend(_1,"setObject:forKey:",_41,_40);
}
objj_msgSend(_41,"addObject:",_3f);
}
})]);
var _42="CPToolbarIdentifierKey",_43="CPToolbarDisplayModeKey",_44="CPToolbarShowsBaselineSeparatorKey",_45="CPToolbarAllowsUserCustomizationKey",_46="CPToolbarIsVisibleKey",_47="CPToolbarDelegateKey",_48="CPToolbarIdentifiedItemsKey",_49="CPToolbarDefaultItemsKey",_4a="CPToolbarAllowedItemsKey",_4b="CPToolbarSelectableItemsKey";
var _3=objj_getClass("CPToolbar");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbar\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
_4c=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPObject")},"init");
if(_4c){
_identifier=objj_msgSend(_4e,"decodeObjectForKey:",_42);
_displayMode=objj_msgSend(_4e,"decodeIntForKey:",_43);
_showsBaselineSeparator=objj_msgSend(_4e,"decodeBoolForKey:",_44);
_allowsUserCustomization=objj_msgSend(_4e,"decodeBoolForKey:",_45);
_isVisible=objj_msgSend(_4e,"decodeBoolForKey:",_46);
_identifiedItems=objj_msgSend(_4e,"decodeObjectForKey:",_48);
_defaultItems=objj_msgSend(_4e,"decodeObjectForKey:",_49);
_allowedItems=objj_msgSend(_4e,"decodeObjectForKey:",_4a);
_selectableItems=objj_msgSend(_4e,"decodeObjectForKey:",_4b);
_items=[];
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_4c,_identifier);
objj_msgSend(_4c,"setDelegate:",objj_msgSend(_4e,"decodeObjectForKey:",_47));
}
return _4c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_51,"encodeObject:forKey:",_identifier,_42);
objj_msgSend(_51,"encodeInt:forKey:",_displayMode,_43);
objj_msgSend(_51,"encodeBool:forKey:",_showsBaselineSeparator,_44);
objj_msgSend(_51,"encodeBool:forKey:",_allowsUserCustomization,_45);
objj_msgSend(_51,"encodeBool:forKey:",_isVisible,_46);
objj_msgSend(_51,"encodeObject:forKey:",_identifiedItems,_48);
objj_msgSend(_51,"encodeObject:forKey:",_defaultItems,_49);
objj_msgSend(_51,"encodeObject:forKey:",_allowedItems,_4a);
objj_msgSend(_51,"encodeObject:forKey:",_selectableItems,_4b);
objj_msgSend(_51,"encodeConditionalObject:forKey:",_delegate,_47);
}
})]);
var _52=nil,_53=nil,_54=nil;
var _55=5,_56=10,_57=20;
var _58=function(_59,_5a,_5b,_5c){
return {index:_59,view:_5a,label:_5b,minWidth:_5c};
};
var _3=objj_allocateClassPair(CPView,"_CPToolbarView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_toolbar"),new objj_ivar("_flexibleWidthIndexes"),new objj_ivar("_visibleFlexibleWidthIndexes"),new objj_ivar("_itemInfos"),new objj_ivar("_visibleItems"),new objj_ivar("_invisibleItems"),new objj_ivar("_additionalItemsButton"),new objj_ivar("_labelColor"),new objj_ivar("_labelShadowColor"),new objj_ivar("_minWidth")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5d,_5e,_5f){
with(_5d){
_5d=objj_msgSendSuper({receiver:_5d,super_class:objj_getClass("CPView")},"initWithFrame:",_5f);
if(_5d){
_minWidth=0;
_labelColor=objj_msgSend(CPColor,"blackColor");
_labelShadowColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.75);
_additionalItemsButton=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:pullsDown:",CGRectMake(0,0,10,15),YES);
objj_msgSend(_additionalItemsButton,"setBordered:",NO);
objj_msgSend(_additionalItemsButton,"setImagePosition:",CPImageOnly);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setShowsStateColumn:",NO);
objj_msgSend(_additionalItemsButton,"setAlternateImage:",_54);
}
return _5d;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_60,_61,_62){
with(_60){
_toolbar=_62;
}
}),new objj_method(sel_getUid("toolbar"),function(_63,_64){
with(_63){
return _toolbar;
}
}),new objj_method(sel_getUid("setLabelColor:"),function(_65,_66,_67){
with(_65){
if(_labelColor===_67){
return;
}
_labelColor=_67;
var _68=objj_msgSend(_toolbar,"items"),_69=objj_msgSend(_68,"count");
while(_69--){
objj_msgSend(objj_msgSend(_65,"labelForItem:",_68[_69]),"setTextColor:",_labelColor);
}
}
}),new objj_method(sel_getUid("setLabelShadowColor:"),function(_6a,_6b,_6c){
with(_6a){
if(_labelShadowColor===_6c){
return;
}
_labelShadowColor=_6c;
var _6d=objj_msgSend(_toolbar,"items"),_6e=objj_msgSend(_6d,"count");
while(_6e--){
objj_msgSend(objj_msgSend(_6a,"labelForItem:",_6d[_6e]),"setTextShadowColor:",_labelShadowColor);
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_6f,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_72,_73){
with(_72){
var _74=objj_msgSend(_toolbar,"items"),_75=CGRectGetWidth(objj_msgSend(_72,"bounds")),_76=_minWidth,_77=objj_msgSend(CPIndexSet,"indexSet"),_78=[];
_visibleItems=_74;
if(_75<_76){
_75-=_57;
_visibleItems=objj_msgSend(_visibleItems,"copy");
var _79=objj_msgSend(_toolbar,"itemsSortedByVisibilityPriority"),_7a=_79.length;
while(_76>_75){
var _7b=_79[_7a--];
_76-=objj_msgSend(_72,"minWidthForItem:",_7b)+_56;
objj_msgSend(_visibleItems,"removeObjectIdenticalTo:",_7b);
objj_msgSend(_78,"addObject:",_7b);
objj_msgSend(objj_msgSend(_72,"viewForItem:",_7b),"setHidden:",YES);
objj_msgSend(objj_msgSend(_72,"labelForItem:",_7b),"setHidden:",YES);
}
}
var _7c=_visibleItems.length,_7d=0;
while(_7c--){
var _7b=_visibleItems[_7c],_7e=objj_msgSend(_7b,"minSize"),_7f=objj_msgSend(_72,"viewForItem:",_7b);
if(_7e.width!=objj_msgSend(_7b,"maxSize").width){
objj_msgSend(_77,"addIndex:",_7c);
}else{
objj_msgSend(_7f,"setFrameSize:",CGSizeMake(objj_msgSend(_7b,"minSize").width,CGRectGetHeight(objj_msgSend(_7f,"frame"))));
}
objj_msgSend(_7f,"setHidden:",NO);
objj_msgSend(objj_msgSend(_72,"labelForItem:",_7b),"setHidden:",NO);
if(_7d<_7e.height){
_7d=_7e.height;
}
}
var _80=_75-_76,_81=0;
while(_80&&objj_msgSend(_77,"count")){
_81+=_80/objj_msgSend(_77,"count");
_80=0;
var _7c=CPNotFound;
while((_7c=objj_msgSend(_77,"indexGreaterThanIndex:",_7c))!=CPNotFound){
var _7b=_visibleItems[_7c];
_7f=objj_msgSend(_72,"viewForItem:",_7b),_82=objj_msgSend(_7f,"frame"),proposedWidth=objj_msgSend(_7b,"minSize").width+_81,constrainedWidth=MIN(proposedWidth,objj_msgSend(_7b,"maxSize").width);
if(constrainedWidth<proposedWidth){
objj_msgSend(_77,"removeIndex:",_7c);
_80+=proposedWidth-constrainedWidth;
}
objj_msgSend(_7f,"setFrameSize:",CGSizeMake(constrainedWidth,CGRectGetHeight(_82)));
}
}
var _7a=_visibleItems.length,x=_56,_84=[];
for(_7c=0;_7c<_7a;++_7c){
var _7b=_visibleItems[_7c],_7f=objj_msgSend(_72,"viewForItem:",_7b),_82=objj_msgSend(_7f,"frame"),_85=CGRectGetWidth(_82),_86=objj_msgSend(_72,"labelForItem:",_7b),_87=objj_msgSend(_86,"frame"),_88=CGRectGetWidth(_87),_89=MAX(objj_msgSend(_72,"minWidthForItem:",_7b),_85),_8a=CGRectGetHeight(_82);
objj_msgSend(_7f,"setFrame:",CGRectMake(x+(_89-_85)/2,_55+(_7d-_8a)/2,_85,_8a));
objj_msgSend(_86,"setFrameOrigin:",CGPointMake(x+(_89-_88)/2,_55+_7d+2));
x+=_89+_56;
if(objj_msgSend(_7b,"itemIdentifier")==CPToolbarSeparatorItemIdentifier){
_84.push(_7b);
}
}
for(_7c=0,_7a=_84.length;_7c<_7a;++_7c){
var _7f=objj_msgSend(_72,"viewForItem:",_84[_7c]),_8a=53;
objj_msgSend(_7f,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_7f,"frame")),(59-_8a)/2,CGRectGetWidth(objj_msgSend(_7f,"frame")),_8a));
}
if(objj_msgSend(_78,"count")){
var _7c=0,_7a=objj_msgSend(_74,"count");
_invisibleItems=[];
for(;_7c<_7a;++_7c){
var _7b=_74[_7c];
if(objj_msgSend(_78,"indexOfObjectIdenticalTo:",_7b)!=CPNotFound){
objj_msgSend(_invisibleItems,"addObject:",_7b);
}
}
objj_msgSend(_additionalItemsButton,"setFrameOrigin:",CGPointMake(_75+5,(CGRectGetHeight(objj_msgSend(_72,"bounds"))-CGRectGetHeight(objj_msgSend(_additionalItemsButton,"frame")))/2));
objj_msgSend(_72,"addSubview:",_additionalItemsButton);
objj_msgSend(_additionalItemsButton,"removeAllItems");
var _7c=0,_7a=objj_msgSend(_invisibleItems,"count");
objj_msgSend(_additionalItemsButton,"addItemWithTitle:","Additional Items");
objj_msgSend(objj_msgSend(_additionalItemsButton,"itemArray")[0],"setImage:",_53);
for(;_7c<_7a;++_7c){
var _7b=_invisibleItems[_7c];
objj_msgSend(_additionalItemsButton,"addItemWithTitle:",objj_msgSend(_7b,"label"));
var _8b=objj_msgSend(_additionalItemsButton,"itemArray")[_7c+1];
objj_msgSend(_8b,"setImage:",objj_msgSend(_7b,"image"));
objj_msgSend(_8b,"setTarget:",objj_msgSend(_7b,"target"));
objj_msgSend(_8b,"setAction:",objj_msgSend(_7b,"action"));
}
}else{
objj_msgSend(_additionalItemsButton,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("viewForItem:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_8e,"UID"));
if(!_8f){
return nil;
}
return _8f.view;
}
}),new objj_method(sel_getUid("labelForItem:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_92,"UID"));
if(!_93){
return nil;
}
return _93.label;
}
}),new objj_method(sel_getUid("minWidthForItem:"),function(_94,_95,_96){
with(_94){
var _97=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_96,"UID"));
if(!_97){
return 0;
}
return _97.minWidth;
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_98,_99){
with(_98){
var _9a=objj_msgSend(_98,"subviews"),_9b=_9a.length;
while(_9b--){
objj_msgSend(_9a[_9b],"removeFromSuperview");
}
var _9c=objj_msgSend(_toolbar,"items"),_9d=0;
_9b=_9c.length;
_itemInfos=objj_msgSend(CPDictionary,"dictionary");
_minWidth=_56;
for(;_9d<_9b;++_9d){
var _9e=_9c[_9d],_9f=objj_msgSend(_9e,"view");
if(!_9f){
_9f=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,32));
objj_msgSend(_9f,"setBordered:",NO);
objj_msgSend(_9f,"setImage:",objj_msgSend(_9e,"image"));
objj_msgSend(_9f,"setAlternateImage:",objj_msgSend(_9e,"alternateImage"));
objj_msgSend(_9f,"setTarget:",objj_msgSend(_9e,"target"));
objj_msgSend(_9f,"setAction:",objj_msgSend(_9e,"action"));
objj_msgSend(_9f,"setTag:",objj_msgSend(_9e,"tag"));
objj_msgSend(_9f,"setImagePosition:",CPImageOnly);
}
objj_msgSend(_98,"addSubview:",_9f);
var _a0=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_a0,"setStringValue:",objj_msgSend(_9e,"label"));
objj_msgSend(_a0,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_a0,"setTextColor:",_labelColor);
objj_msgSend(_a0,"setTextShadowColor:",_labelShadowColor);
objj_msgSend(_a0,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_a0,"sizeToFit");
objj_msgSend(_a0,"setTarget:",objj_msgSend(_9e,"target"));
objj_msgSend(_a0,"setAction:",objj_msgSend(_9e,"action"));
objj_msgSend(_98,"addSubview:",_a0);
var _a1=objj_msgSend(_9e,"minSize"),_a2=MAX(_a1.width,CGRectGetWidth(objj_msgSend(_a0,"frame")));
objj_msgSend(_itemInfos,"setObject:forKey:",_58(_9d,_9f,_a0,_a2),objj_msgSend(_9e,"UID"));
_minWidth+=_a2+_56;
}
objj_msgSend(_98,"layoutSubviews");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_a3,_a4){
with(_a3){
if(_a3!=objj_msgSend(_CPToolbarView,"class")){
return;
}
var _a5=objj_msgSend(CPBundle,"bundleForClass:",_a3);
_53=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),CPSizeMake(10,15));
_54=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"),CGSizeMake(10,15));
}
})]);
var _28=function(lhs,rhs){
var _a8=objj_msgSend(lhs,"visibilityPriority"),_a9=objj_msgSend(rhs,"visibilityPriority");
if(_a8==_a9){
return CPOrderedSame;
}
if(_a8>_a9){
return CPOrderedAscending;
}
return CPOrderedDescending;
};
p;15;CPToolbarItem.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;9830;
CPToolbarItemVisibilityPriorityStandard=0;
CPToolbarItemVisibilityPriorityLow=-1000;
CPToolbarItemVisibilityPriorityHigh=1000;
CPToolbarItemVisibilityPriorityUser=2000;
CPToolbarSeparatorItemIdentifier="CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier="CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier="CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier="CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier="CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier="CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier="CPToolbarPrintItemIdentifier";
var _1=objj_allocateClassPair(CPObject,"CPToolbarItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_itemIdentifier"),new objj_ivar("_toolbar"),new objj_ivar("_label"),new objj_ivar("_paletteLabel"),new objj_ivar("_toolTip"),new objj_ivar("_tag"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_view"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithItemIdentifier:","");
}
}),new objj_method(sel_getUid("initWithItemIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_itemIdentifier=_7;
_tag=0;
_isEnabled=YES;
_minSize=CGSizeMakeZero();
_maxSize=CGSizeMakeZero();
_visibilityPriority=CPToolbarItemVisibilityPriorityStandard;
}
return _5;
}
}),new objj_method(sel_getUid("itemIdentifier"),function(_8,_9){
with(_8){
return _itemIdentifier;
}
}),new objj_method(sel_getUid("toolbar"),function(_a,_b){
with(_a){
return _toolbar;
}
}),new objj_method(sel_getUid("label"),function(_c,_d){
with(_c){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_e,_f,_10){
with(_e){
_label=_10;
}
}),new objj_method(sel_getUid("paletteLabel"),function(_11,_12){
with(_11){
return _paletteLabel;
}
}),new objj_method(sel_getUid("setPaletteLabel:"),function(_13,_14,_15){
with(_13){
_paletteLabel=_15;
}
}),new objj_method(sel_getUid("toolTip"),function(_16,_17){
with(_16){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("toolTip"))){
return objj_msgSend(_view,"toolTip");
}
return _toolTip;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_18,_19,_1a){
with(_18){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(view,"setToolTip:",_1a);
}
_toolTip=_1a;
}
}),new objj_method(sel_getUid("tag"),function(_1b,_1c){
with(_1b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("tag"))){
return objj_msgSend(_view,"tag");
}
return _tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_1d,_1e,_1f){
with(_1d){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_1f);
}
_tag=_1f;
}
}),new objj_method(sel_getUid("target"),function(_20,_21){
with(_20){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("target"))?objj_msgSend(_view,"target"):nil;
}
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_22,_23,_24){
with(_22){
if(!_view){
_target=_24;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_view,"setTarget:",_24);
}
}
}
}),new objj_method(sel_getUid("action"),function(_25,_26){
with(_25){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("action"))?objj_msgSend(_view,"action"):nil;
}
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_27,_28,_29){
with(_27){
if(!_view){
_action=_29;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_view,"setAction:",_29);
}
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_2a,_2b){
with(_2a){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("isEnabled"))){
return objj_msgSend(_view,"isEnabled");
}
return _isEnabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_2c,_2d,_2e){
with(_2c){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_view,"setEnabled:",_2e);
}
_isEnabled=_2e;
}
}),new objj_method(sel_getUid("image"),function(_2f,_30){
with(_2f){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("image"))){
return objj_msgSend(_view,"image");
}
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_31,_32,_33){
with(_31){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setImage:"))){
objj_msgSend(_view,"setImage:",_33);
}
_image=_33;
if(!_image){
return;
}
if(_minSize.width==0&&_minSize.height==0&&_maxSize.width==0&&_maxSize.height==0){
var _34=objj_msgSend(_image,"size");
if(_34.width>0||_34.height>0){
objj_msgSend(_31,"setMinSize:",_34);
objj_msgSend(_31,"setMaxSize:",_34);
}
}
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAlternateImage:"))){
objj_msgSend(_view,"setAlternateImage:",_37);
}
_alternateImage=_37;
}
}),new objj_method(sel_getUid("alternateImage"),function(_38,_39){
with(_38){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("alternateIamge"))){
return objj_msgSend(_view,"alternateImage");
}
return _alternateImage;
}
}),new objj_method(sel_getUid("view"),function(_3a,_3b){
with(_3a){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_3c,_3d,_3e){
with(_3c){
if(_view==_3e){
return;
}
_view=_3e;
if(_view){
if(_tag!==0&&objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_tag);
}
_target=nil;
_action=nil;
}
}
}),new objj_method(sel_getUid("minSize"),function(_3f,_40){
with(_3f){
return _minSize;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_41,_42,_43){
with(_41){
_minSize=CGSizeMakeCopy(_43);
_maxSize=CGSizeMake(MAX(_minSize.width,_maxSize.width),MAX(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("maxSize"),function(_44,_45){
with(_44){
return _maxSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_46,_47,_48){
with(_46){
_maxSize=CGSizeMakeCopy(_48);
_minSize=CGSizeMake(MIN(_minSize.width,_maxSize.width),MIN(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("visibilityPriority"),function(_49,_4a){
with(_49){
return _visibilityPriority;
}
}),new objj_method(sel_getUid("setVisibilityPriority:"),function(_4b,_4c,_4d){
with(_4b){
_visibilityPriority=_4d;
}
})]);
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(objj_msgSend(objj_msgSend(_4e,"class"),"alloc"),"initWithItemIdentifier:",_itemIdentifier);
if(_view){
objj_msgSend(_50,"setView:",objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_view)));
}
objj_msgSend(_50,"setLabel:",_label);
objj_msgSend(_50,"setPaletteLabel:",_paletteLabel);
objj_msgSend(_50,"setToolTip:",objj_msgSend(_4e,"toolTip"));
objj_msgSend(_50,"setTag:",objj_msgSend(_4e,"tag"));
objj_msgSend(_50,"setTarget:",objj_msgSend(_4e,"target"));
objj_msgSend(_50,"setAction:",objj_msgSend(_4e,"action"));
objj_msgSend(_50,"setEnabled:",objj_msgSend(_4e,"isEnabled"));
objj_msgSend(_50,"setImage:",objj_msgSend(_4e,"image"));
objj_msgSend(_50,"setAlternateImage:",objj_msgSend(_4e,"alternateImage"));
objj_msgSend(_50,"setMinSize:",_minSize);
objj_msgSend(_50,"setMaxSize:",_maxSize);
objj_msgSend(_50,"setVisibilityPriority:",_visibilityPriority);
return _50;
}
})]);
var _51=nil,_52=nil;
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_separatorItemView"),function(_53,_54){
with(_53){
if(!_51){
_51=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,2,32));
sizes={};
sizes["CPToolbarItemSeparator"]=[CGSizeMake(2,26),CGSizeMake(2,1),CGSizeMake(2,26)];
objj_msgSend(_51,"setBackgroundColor:",_CPControlThreePartImagePattern(YES,sizes,"CPToolbarItem","Separator"));
}
return _51;
}
}),new objj_method(sel_getUid("_spaceItemView"),function(_55,_56){
with(_55){
if(!_52){
_52=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
return _52;
}
}),new objj_method(sel_getUid("_standardItemWithItemIdentifier:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_59);
switch(_59){
case CPToolbarSeparatorItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_separatorItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(2,0));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(2,100000));
return _5a;
case CPToolbarSpaceItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_spaceItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(32,32));
return _5a;
case CPToolbarFlexibleSpaceItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_spaceItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(10000,32));
return _5a;
case CPToolbarShowColorsItemIdentifier:
return nil;
case CPToolbarShowFontsItemIdentifier:
return nil;
case CPToolbarCustomizeToolbarItemIdentifier:
return nil;
case CPToolbarPrintItemIdentifier:
return nil;
}
return nil;
}
})]);
p;12;CPTreeNode.jI;21;Foundation/CPObject.jc;2368;
var _1=objj_allocateClassPair(CPObject,"CPTreeNode"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_representedObject"),new objj_ivar("_parentNode"),new objj_ivar("_childNodes")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("representedObject"),function(_3,_4){
with(_3){
return _representedObject;
}
}),new objj_method(sel_getUid("parentNode"),function(_5,_6){
with(_5){
return _parentNode;
}
}),new objj_method(sel_getUid("childNodes"),function(_7,_8){
with(_7){
return _childNodes;
}
}),new objj_method(sel_getUid("initWithRepresentedObject:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_representedObject=_b;
_childNodes=[];
}
return _9;
}
}),new objj_method(sel_getUid("isLeaf"),function(_c,_d){
with(_c){
return objj_msgSend(_childNodes,"count")<=0;
}
}),new objj_method(sel_getUid("mutableChildNodes"),function(_e,_f){
with(_e){
return objj_msgSend(_e,"mutableArrayValueForKey:","childNodes");
}
}),new objj_method(sel_getUid("insertObject:inChildNodesAtIndex:"),function(_10,_11,_12,_13){
with(_10){
_12._parentNode=_10;
objj_msgSend(_childNodes,"addObject:",_12);
}
}),new objj_method(sel_getUid("removeObjectFromChildNodesAtIndex:"),function(_14,_15,_16){
with(_14){
anObject._parentNode=nil;
objj_msgSend(_childNodes,"removeObjectAtIndex:",_16);
}
}),new objj_method(sel_getUid("replaceObjectFromChildNodesAtIndex:withObject:"),function(_17,_18,_19,_1a){
with(_17){
var _1b=objj_msgSend(_childNodes,"objectAtIndex:",_19);
_1b._parentNode=nil;
objj_msgSend(_childNodes,"replaceObjectAtIndex:withObject:",_19,_1a);
}
}),new objj_method(sel_getUid("objectInChildNodesAtIndex:"),function(_1c,_1d,_1e){
with(_1c){
return _childNodes[_1e];
}
}),new objj_method(sel_getUid("sortWithSortDescriptors:recursively:"),function(_1f,_20,_21,_22){
with(_1f){
objj_msgSend(_childNodes,"sortUsingDescriptors:",_21);
if(!_22){
return;
}
var _23=objj_msgSend(_childNodes,"count");
while(_23--){
objj_msgSend(_childNodes[_23],"sortWithSortDescriptors:recursively:",_21,YES);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("treeNodeWithRepresentedObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(objj_msgSend(_24,"alloc"),"initWithRepresentedObject:",_26);
}
})]);
p;8;CPView.jI;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.ji;18;_CPDisplayServer.jc;43451;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3={},_4=1<<0,_5=1<<1;
var _6=objj_allocateClassPair(CPResponder,"CPView"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("setupViewFlags"),function(_8,_9){
with(_8){
var _a=objj_msgSend(_8,"class"),_b=objj_msgSend(_a,"UID");
if(_3[_b]===undefined){
var _c=0;
if(objj_msgSend(_a,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_c|=_4;
}
if(objj_msgSend(_a,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_c|=_5;
}
_3[_b]=_c;
}
_viewClassFlags=_3[_b];
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPResponder")},"init");
if(_f){
var _12=(_11.size.width),_13=(_11.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_11.origin.x,y:_11.origin.y},size:{width:_11.size.width,height:_11.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_12,height:_13}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_f,"setupViewFlags");
objj_msgSend(_f,"_loadThemeAttributes");
}
return _f;
}
}),new objj_method(sel_getUid("superview"),function(_14,_15){
with(_14){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_16,_17){
with(_16){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_18,_19){
with(_18){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"_insertSubview:atIndex:",_1c,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
var _22=_21?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_21):CPNotFound;
if(_22===CPNotFound){
_22=(_20===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_20===CPWindowAbove){
++_22;
}
}
objj_msgSend(_1d,"_insertSubview:atIndex:",_1f,_22);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_23,_24,_25,_26){
with(_23){
var _27=_subviews.length;
objj_msgSend(objj_msgSend(_23,"window"),"_dirtyKeyViewLoop");
if(_25._superview==_23){
var _28=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_25);
if(_28===_26||_28===_27-1&&_26===_27){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_28);
if(_26>_28){
--_26;
}
--_27;
}else{
objj_msgSend(_25,"removeFromSuperview");
objj_msgSend(_25,"_setWindow:",_window);
objj_msgSend(_25,"viewWillMoveToSuperview:",_23);
_25._superview=_23;
}
if(_26===CPNotFound||_26>=_27){
_subviews.push(_25);
}else{
_subviews.splice(_26,0,_25);
}
objj_msgSend(_25,"setNextResponder:",_23);
objj_msgSend(_25,"viewDidMoveToSuperview");
objj_msgSend(_23,"didAddSubview:",_25);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_2c,_2d){
with(_2c){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_2c,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_2c);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_2c);
_superview=nil;
objj_msgSend(_2c,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30._superview!=_2e){
return;
}
var _32=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_30);
objj_msgSend(_30,"removeFromSuperview");
objj_msgSend(_2e,"_insertSubview:atIndex:",_31,_32);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_33,_34,_35){
with(_33){
if(_window===_35){
return;
}
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_33){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_33,"viewWillMoveToWindow:",_35);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_35,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_35;
var _36=objj_msgSend(_subviews,"count");
while(_36--){
objj_msgSend(_subviews[_36],"_setWindow:",_35);
}
objj_msgSend(_33,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_33,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_37,_38,_39){
with(_37){
var _3a=_37;
do{
if(_3a==_39){
return YES;
}
}while(_3a=objj_msgSend(_3a,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_3b,_3c){
with(_3b){
objj_msgSend(_3b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_3d,_3e){
with(_3d){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_48,_49){
with(_48){
var _4a=_48;
while(_4a&&!objj_msgSend(_4a,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_4a=objj_msgSend(_4a,"superview");
}
if(_4a){
return _4a._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_4b,_4c,_4d){
with(_4b){
_tag=_4d;
}
}),new objj_method(sel_getUid("tag"),function(_4e,_4f){
with(_4e){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_50,"tag")===_52){
return _50;
}
var _53=0,_54=_subviews.length;
for(;_53<_54;++_53){
var _55=objj_msgSend(_subviews[_53],"viewWithTag:",_52);
if(_55){
return _55;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_56,_57){
with(_56){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_58,_59,_5a){
with(_58){
if(((_frame.origin.x==_5a.origin.x&&_frame.origin.y==_5a.origin.y)&&(_frame.size.width==_5a.size.width&&_frame.size.height==_5a.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_58,"setFrameOrigin:",_5a.origin);
objj_msgSend(_58,"setFrameSize:",_5a.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_58);
}
}
}),new objj_method(sel_getUid("frame"),function(_5b,_5c){
with(_5b){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_5d,_5e){
with(_5d){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_5f,_60){
with(_5f){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setFrameOrigin:",CGPointMake(_63.x-_frame.size.width/2,_63.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_64,_65){
with(_64){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_66,_67,_68){
with(_66){
var _69=_frame.origin;
if(!_68||(_69.x==_68.x&&_69.y==_68.y)){
return;
}
_69.x=_68.x;
_69.y=_68.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_66);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=_frame.size;
if(!_6c||(_6d.width==_6c.width&&_6d.height==_6c.height)){
return;
}
var _6e={width:_6d.width,height:_6d.height};
_6d.width=_6c.width;
_6d.height=_6c.height;
if(YES){
_bounds.size.width=_6c.width;
_bounds.size.height=_6c.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_6a,"resizeSubviewsWithOldSize:",_6e);
}
objj_msgSend(_6a,"setNeedsLayout");
objj_msgSend(_6a,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6a);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_6f,_70,_71){
with(_6f){
if(((_bounds.origin.x==_71.origin.x&&_bounds.origin.y==_71.origin.y)&&(_bounds.size.width==_71.size.width&&_bounds.size.height==_71.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_6f,"setBoundsOrigin:",_71.origin);
objj_msgSend(_6f,"setBoundsSize:",_71.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6f);
}
}
}),new objj_method(sel_getUid("bounds"),function(_72,_73){
with(_72){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_74,_75,_76){
with(_74){
var _77=_bounds.origin;
if((_77.x==_76.x&&_77.y==_76.y)){
return;
}
_77.x=_76.x;
_77.y=_76.y;
if(_77.x!=0||_77.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_77.x,ty:-_77.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_74);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_78,_79,_7a){
with(_78){
var _7b=_bounds.size;
if((_7b.width==_7a.width&&_7b.height==_7a.height)){
return;
}
var _7c=_frame.size;
if(!(_7b.width==_7c.width&&_7b.height==_7c.height)){
var _7d=_bounds.origin;
_7d.x/=_7b.width/_7c.width;
_7d.y/=_7b.height/_7c.height;
}
_7b.width=_7a.width;
_7b.height=_7a.height;
if(!(_7b.width==_7c.width&&_7b.height==_7c.height)){
var _7d=_bounds.origin;
_7d.x*=_7b.width/_7c.width;
_7d.y*=_7b.height/_7c.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_78);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(_7e,"autoresizingMask");
if(_81==CPViewNotSizable){
return;
}
var _82=_superview._frame,_83={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_82.size.width)-_80.width)/(((_81&CPViewMinXMargin)?1:0)+(_81&CPViewWidthSizable?1:0)+(_81&CPViewMaxXMargin?1:0)),dY=((_82.size.height)-_80.height)/((_81&CPViewMinYMargin?1:0)+(_81&CPViewHeightSizable?1:0)+(_81&CPViewMaxYMargin?1:0));
if(_81&CPViewMinXMargin){
_83.origin.x+=dX;
}
if(_81&CPViewWidthSizable){
_83.size.width+=dX;
}
if(_81&CPViewMinYMargin){
_83.origin.y+=dY;
}
if(_81&CPViewHeightSizable){
_83.size.height+=dY;
}
objj_msgSend(_7e,"setFrame:",_83);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_86,_87,_88){
with(_86){
var _89=_subviews.length;
while(_89--){
objj_msgSend(_subviews[_89],"resizeWithOldSuperviewSize:",_88);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_8a,_8b,_8c){
with(_8a){
_autoresizesSubviews=!!_8c;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_8d,_8e){
with(_8d){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_8f,_90,_91){
with(_8f){
_autoresizingMask=_91;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_92,_93){
with(_92){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_94,_95){
with(_94){
return objj_msgSend(_94,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_96,_97,_98,_99){
with(_96){
_fullScreenModeState=_9a(_96);
var _9b=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_9b,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_9b,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _9c=objj_msgSend(_9b,"contentView");
objj_msgSend(_9c,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_9c,"addSubview:",_96);
objj_msgSend(_96,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_96,"setFrame:",CGRectMakeCopy(objj_msgSend(_9c,"bounds")));
objj_msgSend(_9b,"makeKeyAndOrderFront:",_96);
objj_msgSend(_9b,"makeFirstResponder:",_96);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_9d,_9e){
with(_9d){
objj_msgSend(_9d,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_9f,_a0,_a1){
with(_9f){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_9f,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_9f,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_9f,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_9f,"window"),"orderOut:",_9f);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_a2,_a3){
with(_a2){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_a4,_a5,_a6){
with(_a4){
_a6=!!_a6;
if(_isHidden===_a6){
return;
}
_isHidden=_a6;
if(_a6){
var _a7=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_a7,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_a4==_a7){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_a4,"nextValidKeyView"));
break;
}
}while(_a7=objj_msgSend(_a7,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_a8,_a9){
with(_a8){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_aa,_ab,_ac){
with(_aa){
if(_opacity==_ac){
return;
}
_opacity=_ac;
}
}),new objj_method(sel_getUid("alphaValue"),function(_ad,_ae){
with(_ad){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_af,_b0){
with(_af){
var _b1=_af;
while(_b1&&!objj_msgSend(_b1,"isHidden")){
_b1=objj_msgSend(_b1,"superview");
}
return _b1!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_b2,_b3,_b4){
with(_b2){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_b5,_b6){
with(_b5){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_b7,_b8,_b9){
with(_b7){
_hitTests=!!_b9;
}
}),new objj_method(sel_getUid("hitTest:"),function(_ba,_bb,_bc){
with(_ba){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_bc)){
return nil;
}
var _bd=nil,i=_subviews.length,_bf={x:_bc.x-(_frame.origin.x),y:_bc.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_bf={x:_bf.x*_inverseBoundsTransform.a+_bf.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_bf.x*_inverseBoundsTransform.b+_bf.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_bd=objj_msgSend(_subviews[i],"hitTest:",_bf)){
return _bd;
}
}
return _ba;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_c0,_c1){
with(_c0){
return !objj_msgSend(_c0,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_c2,_c3,_c4){
with(_c2){
if(objj_msgSend(_c2,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_c2,super_class:objj_getClass("CPResponder")},"mouseDown:",_c4);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_c5,_c6,_c7){
with(_c5){
if(_backgroundColor==_c7){
return;
}
_backgroundColor=_c7;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_c8,_c9){
with(_c8){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_ca,_cb,_cc,_cd){
with(_ca){
return CGPointApplyAffineTransform(_cc,_ce(_cd,_ca));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_cf,_d0,_d1,_d2){
with(_cf){
return CGPointApplyAffineTransform(_d1,_ce(_cf,_d2));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_d3,_d4,_d5,_d6){
with(_d3){
return CGSizeApplyAffineTransform(_d5,_ce(_d6,_d3));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_d7,_d8,_d9,_da){
with(_d7){
return CGSizeApplyAffineTransform(_d9,_ce(_d7,_da));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_db,_dc,_dd,_de){
with(_db){
return CGRectApplyAffineTransform(_dd,_ce(_de,_db));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_df,_e0,_e1,_e2){
with(_df){
return CGRectApplyAffineTransform(_e1,_ce(_df,_e2));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_e3,_e4,_e5){
with(_e3){
_e5=!!_e5;
if(_postsFrameChangedNotifications===_e5){
return;
}
_postsFrameChangedNotifications=_e5;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_e3);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_e6,_e7){
with(_e6){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_e8,_e9,_ea){
with(_e8){
_ea=!!_ea;
if(_postsBoundsChangedNotifications===_ea){
return;
}
_postsBoundsChangedNotifications=_ea;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_e8);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_eb,_ec){
with(_eb){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_ed,_ee,_ef,_f0,_f1,_f2,_f3,_f4,_f5){
with(_ed){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_ef,objj_msgSend(_ed,"convertPoint:toView:",_f0,nil),_f1,_f2,_f3,_f4,_f5);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f6,_f7,_f8,_f9,_fa,_fb,_fc,_fd,_fe){
with(_f6){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_f8,objj_msgSend(_f6,"convertPoint:toView:",_f9,nil),_fa,_fb,_fc,_fd,_fe);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_ff,_cmd,_101){
with(_ff){
if(!_101||!objj_msgSend(_101,"count")){
return;
}
var _102=objj_msgSend(_ff,"window");
objj_msgSend(_102,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_101);
objj_msgSend(_102,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_cmd){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_109){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_10c){
with(self){
if(_10c){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_10f){
with(self){
if(!(_viewClassFlags&_4)){
return;
}
if((_10f.size.width<=0||_10f.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_10f,_dirtyRect);
}else{
_dirtyRect={origin:{x:_10f.origin.x,y:_10f.origin.y},size:{width:_10f.size.width,height:_10f.size.height}};
}
_CPDisplayServerAddDisplayObject(self);
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_cmd){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_118){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_118);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_11b){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_11b,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_11e,_11f){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_11e);
objj_msgSend(self,"drawRect:",_11e);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _124=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_124.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_124,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_cmd){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_cmd){
with(self){
if(!(_viewClassFlags&_5)){
return;
}
_needsLayout=YES;
_CPDisplayServerAddLayoutObject(self);
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_cmd){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_cmd){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_cmd){
with(self){
var _133=_superview,_134=objj_msgSend(CPClipView,"class");
while(_133&&!objj_msgSend(_133,"isKindOfClass:",_134)){
_133=_133._superview;
}
return _133;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_137){
with(self){
var _138=objj_msgSend(self,"_enclosingClipView");
if(!_138){
return;
}
objj_msgSend(_138,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_137,_138));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_13b){
with(self){
var _13c=objj_msgSend(self,"visibleRect");
_13b=CGRectIntersection(_13b,_bounds);
if((_13b.size.width<=0||_13b.size.height<=0)||CGRectContainsRect(_13c,_13b)){
return NO;
}
var _13d=objj_msgSend(self,"_enclosingClipView");
if(!_13d){
return NO;
}
var _13e={x:_13c.origin.x,y:_13c.origin.y};
if((_13b.origin.x)<=(_13c.origin.x)){
_13e.x=(_13b.origin.x);
}else{
if((_13b.origin.x+_13b.size.width)>(_13c.origin.x+_13c.size.width)){
_13e.x+=(_13b.origin.x+_13b.size.width)-(_13c.origin.x+_13c.size.width);
}
}
if((_13b.origin.y)<=(_13c.origin.y)){
_13e.y=CGRectGetMinY(_13b);
}else{
if((_13b.origin.y+_13b.size.height)>(_13c.origin.y+_13c.size.height)){
_13e.y+=(_13b.origin.y+_13b.size.height)-(_13c.origin.y+_13c.size.height);
}
}
objj_msgSend(_13d,"scrollToPoint:",CGPointMake(_13e.x,_13e.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_141){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_141);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_144){
with(self){
return _144;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_147,_148){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _14b=_superview,_14c=objj_msgSend(CPScrollView,"class");
while(_14b&&!objj_msgSend(_14b,"isKindOfClass:",_14c)){
_14b=_14b._superview;
}
return _14b;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_14f,_150){
with(self){
objj_msgSend(_14f,"scrollToPoint:",_150);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_153){
with(self){
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_cmd){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _15e=objj_msgSend(self,"nextKeyView");
while(_15e&&!objj_msgSend(_15e,"canBecomeKeyView")){
_15e=objj_msgSend(_15e,"nextKeyView");
}
return _15e;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _163=objj_msgSend(self,"previousKeyView");
while(_163&&!objj_msgSend(_163,"canBecomeKeyView")){
_163=objj_msgSend(_163,"previousKeyView");
}
return _163;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_166){
with(self){
_previousKeyView=_166;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_16c){
with(self){
if(_layer==_16c){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_16c;
if(_layer){
var _16d=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_172){
with(self){
_wantsLayer=!!_172;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_179){
with(self){
return !!(_themeState&((typeof _179==="string")?CPThemeState(_179):_179));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_17c){
with(self){
var _17d=(typeof _17c==="string")?CPThemeState(_17c):_17c;
if(_themeState&_17d){
return NO;
}
_themeState|=_17d;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_180){
with(self){
var _181=((typeof _180==="string")?CPThemeState(_180):_180);
if(!(_themeState&_181)){
return NO;
}
_themeState&=~_181;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _184=objj_msgSend(self,"class"),_185=objj_msgSend(_184,"_themeAttributes"),_186=_185.length;
if(!_186){
return;
}
var _187=objj_msgSend(self,"theme"),_188=objj_msgSend(_184,"themeClass");
_themeAttributes={};
while(_186--){
var _189=_185[_186--],_18a=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_189,_185[_186]);
objj_msgSend(_18a,"setParentAttribute:",objj_msgSend(_187,"_attributeWithName:forClass:",_189,_188));
_themeAttributes[_189]=_18a;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_18d){
with(self){
if(_theme===_18d){
return;
}
_theme=_18d;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
if(!_themeAttributes){
return;
}
var _192=objj_msgSend(self,"theme"),_193=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _194 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_194)){
objj_msgSend(_themeAttributes[_194],"setParentAttribute:",objj_msgSend(_192,"_attributeWithName:forClass:",_194,_193));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _197=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _198=objj_msgSend(self,"theme");
for(var _199 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_199)){
objj_msgSend(_197,"setObject:forKey:",_themeAttributes[_199],_199);
}
}
}
return _197;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_19c,_19d,_19e){
with(self){
if(!_themeAttributes||!_themeAttributes[_19d]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_19d+"'");
}
var _19f=objj_msgSend(self,"currentValueForThemeAttribute:",_19d);
objj_msgSend(_themeAttributes[_19d],"setValue:forState:",_19c,_19e);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_19d)===_19f){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1a2,_1a3){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a3]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a3+"'");
}
var _1a4=objj_msgSend(self,"currentValueForThemeAttribute:",_1a3);
objj_msgSend(_themeAttributes[_1a3],"setValue:",_1a2);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1a3)===_1a4){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1a7,_1a8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a7]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a7+"'");
}
return objj_msgSend(_themeAttributes[_1a7],"valueForState:",_1a8);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1ab){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ab]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ab+"'");
}
return objj_msgSend(_themeAttributes[_1ab],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1ae){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ae]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ae+"'");
}
return objj_msgSend(_themeAttributes[_1ae],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1b1){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1b4){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1b7,_1b8,_1b9){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1ba=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1b7);
if(_1ba&&!(_1ba.size.width<=0||_1ba.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1b7]){
_ephemeralSubviewsForNames[_1b7]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1b7);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1b7]);
if(_ephemeralSubviewsForNames[_1b7]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1b7],_1b8,_ephemeralSubviewsForNames[_1b9]);
}
}
if(_ephemeralSubviewsForNames[_1b7]){
objj_msgSend(_ephemeralSubviewsForNames[_1b7],"setFrame:",_1ba);
}
}else{
if(_ephemeralSubviewsForNames[_1b7]){
objj_msgSend(_ephemeralSubviewsForNames[_1b7],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1b7]);
delete _ephemeralSubviewsForNames[_1b7];
}
}
return _ephemeralSubviewsForNames[_1b7];
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_cmd){
with(self){
if(!_2){
_2={};
}
var _1c1=objj_msgSend(self,"class"),_1c2=objj_msgSend(CPView,"class"),_1c3=[];
for(;_1c1&&_1c1!==_1c2;_1c1=objj_msgSend(_1c1,"superclass")){
var _1c4=_2[class_getName(_1c1)];
if(_1c4){
_1c3=_1c3.length?_1c3.concat(_1c4):_1c3;
_2[objj_msgSend(self,"className")]=_1c3;
break;
}
var _1c5=objj_msgSend(_1c1,"themeAttributes");
if(!_1c5){
continue;
}
var _1c6=objj_msgSend(_1c5,"allKeys"),_1c7=_1c6.length;
while(_1c7--){
var _1c8=_1c6[_1c7];
_1c3.push(objj_msgSend(_1c5,"objectForKey:",_1c8));
_1c3.push(_1c8);
}
}
return _1c3;
}
})]);
var _1c9="CPViewAutoresizingMask",_1ca="CPViewAutoresizesSubviews",_1cb="CPViewBackgroundColor",_1cc="CPViewBoundsKey",_1cd="CPViewFrameKey",_1ce="CPViewHitTestsKey",_1cf="CPViewIsHiddenKey",_1d0="CPViewOpacityKey",_1d1="CPViewSubviewsKey",_1d2="CPViewSuperviewKey",_1d3="CPViewTagKey",_1d4="CPViewThemeStateKey",_1d5="CPViewWindowKey",_1d6="CPViewNextKeyViewKey",_1d7="CPViewPreviousKeyViewKey";
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1da){
with(self){
_frame=objj_msgSend(_1da,"decodeRectForKey:",_1cd);
_bounds=objj_msgSend(_1da,"decodeRectForKey:",_1cc);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1da);
if(self){
_tag=objj_msgSend(_1da,"containsValueForKey:",_1d3)?objj_msgSend(_1da,"decodeIntForKey:",_1d3):-1;
_window=objj_msgSend(_1da,"decodeObjectForKey:",_1d5);
_subviews=objj_msgSend(_1da,"decodeObjectForKey:",_1d1)||[];
_superview=objj_msgSend(_1da,"decodeObjectForKey:",_1d2);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1da,"decodeIntForKey:",_1c9)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1da,"containsValueForKey:",_1ca)||objj_msgSend(_1da,"decodeBoolForKey:",_1ca);
_hitTests=!objj_msgSend(_1da,"containsValueForKey:",_1ce)||objj_msgSend(_1da,"decodeObjectForKey:",_1ce);
if(objj_msgSend(_1da,"containsValueForKey:",_1cf)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1da,"decodeBoolForKey:",_1cf));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1da,"containsValueForKey:",_1d0)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1da,"decodeIntForKey:",_1d0));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1da,"decodeObjectForKey:",_1cb));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1da,"decodeIntForKey:",_1d4));
_themeAttributes={};
var _1db=objj_msgSend(self,"class"),_1dc=objj_msgSend(_1db,"themeClass"),_1dd=objj_msgSend(_1db,"_themeAttributes"),_1de=_1dd.length;
while(_1de--){
var _1df=_1dd[_1de--];
_themeAttributes[_1df]=CPThemeAttributeDecode(_1da,_1df,_1dd[_1de],_theme,_1dc);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1e2){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1e2);
if(_tag!==-1){
objj_msgSend(_1e2,"encodeInt:forKey:",_tag,_1d3);
}
objj_msgSend(_1e2,"encodeRect:forKey:",_frame,_1cd);
objj_msgSend(_1e2,"encodeRect:forKey:",_bounds,_1cc);
if(_window!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_window,_1d5);
}
var _1e3=objj_msgSend(_subviews,"count"),_1e4=_subviews;
if(_1e3>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1e4=objj_msgSend(_1e4,"copy");
while(_1e3--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1e4[_1e3])){
_1e4.splice(_1e3,1);
}
}
}
if(_1e4.length>0){
objj_msgSend(_1e2,"encodeObject:forKey:",_1e4,_1d1);
}
if(_superview!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_superview,_1d2);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1e2,"encodeInt:forKey:",_autoresizingMask,_1c9);
}
if(!_autoresizesSubviews){
objj_msgSend(_1e2,"encodeBool:forKey:",_autoresizesSubviews,_1ca);
}
if(_backgroundColor!==nil){
objj_msgSend(_1e2,"encodeObject:forKey:",_backgroundColor,_1cb);
}
if(_hitTests!==YES){
objj_msgSend(_1e2,"encodeBool:forKey:",_hitTests,_1ce);
}
if(_opacity!==1){
objj_msgSend(_1e2,"encodeFloat:forKey:",_opacity,_1d0);
}
if(_isHidden){
objj_msgSend(_1e2,"encodeBool:forKey:",_isHidden,_1cf);
}
var _1e5=objj_msgSend(self,"nextKeyView");
if(_1e5!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_1e5,_1d6);
}
var _1e6=objj_msgSend(self,"previousKeyView");
if(_1e6!==nil){
objj_msgSend(_1e2,"encodeConditionalObject:forKey:",_1e6,_1d7);
}
objj_msgSend(_1e2,"encodeInt:forKey:",CPThemeStateName(_themeState),_1d4);
for(var _1e7 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1e7)){
CPThemeAttributeEncode(_1e2,_themeAttributes[_1e7]);
}
}
}
})]);
var _9a=function(_1e8){
var _1e9=_1e8._superview;
return {autoresizingMask:_1e8._autoresizingMask,frame:CGRectMakeCopy(_1e8._frame),index:(_1e9?objj_msgSend(_1e9._subviews,"indexOfObjectIdenticalTo:",_1e8):0),superview:_1e9};
};
var _ce=function(_1ea,_1eb){
var _1ec=CGAffineTransformMakeIdentity(),_1ed=YES,_1ee=nil,_1ef=nil;
if(_1ea){
var view=_1ea;
while(view&&view!=_1eb){
var _1f1=view._frame;
_1ec.tx+=(_1f1.origin.x);
_1ec.ty+=(_1f1.origin.y);
if(view._boundsTransform){
var tx=_1ec.tx*view._boundsTransform.a+_1ec.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1ec.ty=_1ec.tx*view._boundsTransform.b+_1ec.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1ec.tx=tx;
var a=_1ec.a*view._boundsTransform.a+_1ec.b*view._boundsTransform.c,b=_1ec.a*view._boundsTransform.b+_1ec.b*view._boundsTransform.d,c=_1ec.c*view._boundsTransform.a+_1ec.d*view._boundsTransform.c;
_1ec.d=_1ec.c*view._boundsTransform.b+_1ec.d*view._boundsTransform.d;
_1ec.a=a;
_1ec.b=b;
_1ec.c=c;
}
view=view._superview;
}
if(view===_1eb){
return _1ec;
}else{
if(_1ea&&_1eb){
_1ee=objj_msgSend(_1ea,"window");
_1ef=objj_msgSend(_1eb,"window");
if(_1ee&&_1ef&&_1ee!==_1ef){
_1ed=NO;
var _1f1=objj_msgSend(_1ee,"frame");
_1ec.tx+=(_1f1.origin.x);
_1ec.ty+=(_1f1.origin.y);
}
}
}
}
var view=_1eb;
while(view){
var _1f1=view._frame;
_1ec.tx-=(_1f1.origin.x);
_1ec.ty-=(_1f1.origin.y);
if(view._boundsTransform){
var tx=_1ec.tx*view._inverseBoundsTransform.a+_1ec.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1ec.ty=_1ec.tx*view._inverseBoundsTransform.b+_1ec.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1ec.tx=tx;
var a=_1ec.a*view._inverseBoundsTransform.a+_1ec.b*view._inverseBoundsTransform.c,b=_1ec.a*view._inverseBoundsTransform.b+_1ec.b*view._inverseBoundsTransform.d,c=_1ec.c*view._inverseBoundsTransform.a+_1ec.d*view._inverseBoundsTransform.c;
_1ec.d=_1ec.c*view._inverseBoundsTransform.b+_1ec.d*view._inverseBoundsTransform.d;
_1ec.a=a;
_1ec.b=b;
_1ec.c=c;
}
view=view._superview;
}
if(!_1ed){
var _1f1=objj_msgSend(_1ef,"frame");
_1ec.tx-=(_1f1.origin.x);
_1ec.ty-=(_1f1.origin.y);
}
return _1ec;
};
p;18;CPViewController.jI;20;AppKit/CPResponder.jc;3974;
var _1=objj_allocateClassPair(CPResponder,"CPViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_view"),new objj_ivar("_representedObject"),new objj_ivar("_title"),new objj_ivar("_cibName"),new objj_ivar("_cibBundle"),new objj_ivar("_cibExternalNameTable")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("representedObject"),function(_3,_4){
with(_3){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_5,_6,_7){
with(_5){
_representedObject=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
_title=_c;
}
}),new objj_method(sel_getUid("cibName"),function(_d,_e){
with(_d){
return _cibName;
}
}),new objj_method(sel_getUid("cibBundle"),function(_f,_10){
with(_f){
return _cibBundle;
}
}),new objj_method(sel_getUid("cibExternalNameTable"),function(_11,_12){
with(_11){
return _cibExternalNameTable;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
return objj_msgSend(_13,"initWithCibName:bundle:",nil,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:"),function(_15,_16,_17,_18){
with(_15){
return objj_msgSend(_15,"initWithCibName:bundle:externalNameTable:",_17,_18,nil);
}
}),new objj_method(sel_getUid("initWithCibName:bundle:owner:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
return objj_msgSend(_19,"initWithCibName:bundle:externalNameTable:",_1b,_1c,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1d,CPCibOwner));
}
}),new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("CPResponder")},"init");
if(_1e){
_cibName=_20;
_cibBundle=_21||objj_msgSend(CPBundle,"mainBundle");
_cibExternalNameTable=_22||objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1e,CPCibOwner);
}
return _1e;
}
}),new objj_method(sel_getUid("loadView"),function(_23,_24){
with(_23){
if(_view){
return;
}
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:",objj_msgSend(_cibBundle,"pathForResource:",_cibName+".cib"));
objj_msgSend(cib,"instantiateCibWithExternalNameTable:",_cibExternalNameTable);
}
}),new objj_method(sel_getUid("view"),function(_26,_27){
with(_26){
if(!_view){
var _28=objj_msgSend(_cibExternalNameTable,"objectForKey:",CPCibOwner);
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("viewControllerWillLoadCib:"))){
objj_msgSend(_28,"viewControllerWillLoadCib:",_26);
}
objj_msgSend(_26,"loadView");
if(_view===nil&&objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_26,"setView:",objj_msgSend(_28,"valueForKey:","view"));
}
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("viewControllerDidLoadCib:"))){
objj_msgSend(_28,"viewControllerDidLoadCib:",_26);
}
}
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_29,_2a,_2b){
with(_29){
_view=_2b;
}
})]);
var _2c="CPViewControllerViewKey",_2d="CPViewControllerTitleKey";
var _1=objj_getClass("CPViewController");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPViewController\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2e,_2f,_30){
with(_2e){
_2e=objj_msgSendSuper({receiver:_2e,super_class:objj_getClass("CPResponder")},"initWithCoder:",_30);
if(_2e){
_view=objj_msgSend(_30,"decodeObjectForKey:",_2c);
_title=objj_msgSend(_30,"decodeObjectForKey:",_2d);
}
return _2e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_31,_32,_33){
with(_31){
objj_msgSendSuper({receiver:_31,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_33);
objj_msgSend(_33,"encodeObject:forKey:",_view,_2c);
objj_msgSend(_33,"encodeObject:forKey:",_title,_2d);
}
})]);
p;11;CPWebView.jI;15;AppKit/CPView.jc;13060;
CPWebViewProgressStartedNotification="CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification="CPWebViewProgressFinishedNotification";
CPWebViewScrollAppKit=1;
CPWebViewScrollNative=2;
var _1=objj_allocateClassPair(CPView,"CPWebView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_scrollView"),new objj_ivar("_frameView"),new objj_ivar("_iframe"),new objj_ivar("_mainFrameURL"),new objj_ivar("_backwardStack"),new objj_ivar("_forwardStack"),new objj_ivar("_ignoreLoadStart"),new objj_ivar("_ignoreLoadEnd"),new objj_ivar("_downloadDelegate"),new objj_ivar("_frameLoadDelegate"),new objj_ivar("_policyDelegate"),new objj_ivar("_resourceLoadDelegate"),new objj_ivar("_UIDelegate"),new objj_ivar("_wso"),new objj_ivar("_url"),new objj_ivar("_html"),new objj_ivar("_loadCallback"),new objj_ivar("_scrollMode"),new objj_ivar("_scrollSize")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:frameName:groupName:"),function(_3,_4,_5,_6,_7){
with(_3){
if(_3=objj_msgSend(_3,"initWithFrame:",_5)){
_iframe.name=_6;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPView")},"initWithFrame:",_a)){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
_scrollMode=CPWebViewScrollNative;
objj_msgSend(_8,"_initDOMWithFrame:",_a);
}
return _8;
}
}),new objj_method(sel_getUid("_initDOMWithFrame:"),function(_b,_c,_d){
with(_b){
_ignoreLoadStart=YES;
_ignoreLoadEnd=YES;
_iframe=document.createElement("iframe");
_iframe.name="iframe_"+Math.floor(Math.random()*10000);
_iframe.style.width="100%";
_iframe.style.height="100%";
_iframe.style.borderWidth="0px";
objj_msgSend(_b,"setDrawsBackground:",YES);
_loadCallback=function(){
if(!_ignoreLoadStart){
objj_msgSend(_b,"_startedLoading");
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_iframe.src;
_mainFrameURL=_iframe.src;
objj_msgSend(_forwardStack,"removeAllObjects");
}else{
_ignoreLoadStart=NO;
}
if(!_ignoreLoadEnd){
objj_msgSend(_b,"_finishedLoading");
}else{
_ignoreLoadEnd=NO;
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(_iframe.addEventListener){
_iframe.addEventListener("load",_loadCallback,false);
}else{
if(_iframe.attachEvent){
_iframe.attachEvent("onload",_loadCallback);
}
}
_frameView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_b,"bounds"));
_scrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",objj_msgSend(_b,"bounds"));
objj_msgSend(_scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_scrollView,"setDocumentView:",_frameView);
_frameView._DOMElement.appendChild(_iframe);
objj_msgSend(_b,"_setScrollMode:",_scrollMode);
objj_msgSend(_b,"addSubview:",_scrollView);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_e,_f,_10){
with(_e){
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"setFrameSize:",_10);
objj_msgSend(_e,"_resizeWebFrame");
}
}),new objj_method(sel_getUid("_resizeWebFrame"),function(_11,_12){
with(_11){
if(_scrollMode===CPWebViewScrollAppKit){
if(_scrollSize){
objj_msgSend(_frameView,"setFrameSize:",_scrollSize);
}else{
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"bounds").size);
var win=null;
try{
win=objj_msgSend(_11,"DOMWindow");
}
catch(e){
}
if(win&&win.document){
var _14=win.document.body.scrollWidth,_15=win.document.body.scrollHeight;
_iframe.setAttribute("width",_14);
_iframe.setAttribute("height",_15);
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(_14,_15));
}else{
CPLog.warn("using default size 800*1600");
objj_msgSend(_frameView,"setFrameSize:",CGSizeMake(800,1600));
}
}
}
}
}),new objj_method(sel_getUid("setScrollMode:"),function(_16,_17,_18){
with(_16){
if(_scrollMode==_18){
return;
}
objj_msgSend(_16,"_setScrollMode:",_18);
}
}),new objj_method(sel_getUid("_setScrollMode:"),function(_19,_1a,_1b){
with(_19){
_scrollMode=_1b;
_ignoreLoadStart=YES;
_ignoreLoadEnd=YES;
var _1c=_iframe.parentNode;
_1c.removeChild(_iframe);
if(_scrollMode===CPWebViewScrollAppKit){
objj_msgSend(_scrollView,"setHasHorizontalScroller:",YES);
objj_msgSend(_scrollView,"setHasVerticalScroller:",YES);
_iframe.setAttribute("scrolling","no");
}else{
objj_msgSend(_scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(_scrollView,"setHasVerticalScroller:",NO);
_iframe.setAttribute("scrolling","auto");
objj_msgSend(_frameView,"setFrameSize:",objj_msgSend(_scrollView,"bounds").size);
}
_1c.appendChild(_iframe);
}
}),new objj_method(sel_getUid("loadHTMLString:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1d,"loadHTMLString:baseURL:",_1f,nil);
}
}),new objj_method(sel_getUid("loadHTMLString:baseURL:"),function(_20,_21,_22,URL){
with(_20){
objj_msgSend(_20,"_setScrollMode:",CPWebViewScrollAppKit);
objj_msgSend(_20,"_startedLoading");
_ignoreLoadStart=YES;
_ignoreLoadEnd=NO;
_url=null;
_html=_22;
objj_msgSend(_20,"_load");
}
}),new objj_method(sel_getUid("_loadMainFrameURL"),function(_24,_25){
with(_24){
objj_msgSend(_24,"_setScrollMode:",CPWebViewScrollNative);
objj_msgSend(_24,"_startedLoading");
_ignoreLoadStart=YES;
_ignoreLoadEnd=NO;
_url=_mainFrameURL;
_html=null;
objj_msgSend(_24,"_load");
}
}),new objj_method(sel_getUid("_load"),function(_26,_27){
with(_26){
if(_url){
_iframe.src=_url;
}else{
if(_html){
_iframe.src="";
window.setTimeout(function(){
var win=objj_msgSend(_26,"DOMWindow");
win.document.write(_html);
window.setTimeout(_loadCallback,1);
},0);
}
}
}
}),new objj_method(sel_getUid("_startedLoading"),function(_29,_2a){
with(_29){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressStartedNotification,_29);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didStartProvisionalLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didStartProvisionalLoadForFrame:",_29,nil);
}
}
}),new objj_method(sel_getUid("_finishedLoading"),function(_2b,_2c){
with(_2b){
objj_msgSend(_2b,"_resizeWebFrame");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressFinishedNotification,_2b);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didFinishLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didFinishLoadForFrame:",_2b,nil);
}
}
}),new objj_method(sel_getUid("mainFrameURL"),function(_2d,_2e){
with(_2d){
return _mainFrameURL;
}
}),new objj_method(sel_getUid("setMainFrameURL:"),function(_2f,_30,_31){
with(_2f){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_31;
objj_msgSend(_forwardStack,"removeAllObjects");
objj_msgSend(_2f,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("goBack"),function(_32,_33){
with(_32){
if(_backwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_forwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_backwardStack,"lastObject");
objj_msgSend(_backwardStack,"removeLastObject");
objj_msgSend(_32,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("goForward"),function(_34,_35){
with(_34){
if(_forwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_forwardStack,"lastObject");
objj_msgSend(_forwardStack,"removeLastObject");
objj_msgSend(_34,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("canGoBack"),function(_36,_37){
with(_36){
return (_backwardStack.length>0);
}
}),new objj_method(sel_getUid("canGoForward"),function(_38,_39){
with(_38){
return (_forwardStack.length>0);
}
}),new objj_method(sel_getUid("backForwardList"),function(_3a,_3b){
with(_3a){
return {back:_backwardStack,forward:_forwardStack};
}
}),new objj_method(sel_getUid("close"),function(_3c,_3d){
with(_3c){
_iframe.parentNode.removeChild(_iframe);
}
}),new objj_method(sel_getUid("DOMWindow"),function(_3e,_3f){
with(_3e){
return (_iframe.contentDocument&&_iframe.contentDocument.defaultView)||_iframe.contentWindow;
}
}),new objj_method(sel_getUid("windowScriptObject"),function(_40,_41){
with(_40){
var win=objj_msgSend(_40,"DOMWindow");
if(!_wso||win!=objj_msgSend(_wso,"window")){
if(win){
_wso=objj_msgSend(objj_msgSend(CPWebScriptObject,"alloc"),"initWithWindow:",win);
}else{
_wso=nil;
}
}
return _wso;
}
}),new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"objectByEvaluatingJavaScriptFromString:",_45);
return _46?String(_46):nil;
}
}),new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"),function(_47,_48,_49){
with(_47){
return objj_msgSend(objj_msgSend(_47,"windowScriptObject"),"evaluateWebScript:",_49);
}
}),new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var win=objj_msgSend(objj_msgSend(_4a,"windowScriptObject"),"window");
if(win){
return win.document.defaultView.getComputedStyle(_4c,_4d);
}
return nil;
}
}),new objj_method(sel_getUid("drawsBackground"),function(_4f,_50){
with(_4f){
return _iframe.style.backgroundColor!="";
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_51,_52,_53){
with(_51){
_iframe.style.backgroundColor=_53?"white":"";
}
}),new objj_method(sel_getUid("takeStringURLFrom:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_54,"setMainFrameURL:",objj_msgSend(_56,"stringValue"));
}
}),new objj_method(sel_getUid("goBack:"),function(_57,_58,_59){
with(_57){
objj_msgSend(_57,"goBack");
}
}),new objj_method(sel_getUid("goForward:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_5a,"goForward");
}
}),new objj_method(sel_getUid("stopLoading:"),function(_5d,_5e,_5f){
with(_5d){
}
}),new objj_method(sel_getUid("reload:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_60,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("print:"),function(_63,_64,_65){
with(_63){
try{
objj_msgSend(_63,"DOMWindow").print();
}
catch(e){
alert("Please click the webpage and select \"Print\" from the \"File\" menu");
}
}
}),new objj_method(sel_getUid("downloadDelegate"),function(_66,_67){
with(_66){
return _downloadDelegate;
}
}),new objj_method(sel_getUid("setDownloadDelegate:"),function(_68,_69,_6a){
with(_68){
_downloadDelegate=_6a;
}
}),new objj_method(sel_getUid("frameLoadDelegate"),function(_6b,_6c){
with(_6b){
return _frameLoadDelegate;
}
}),new objj_method(sel_getUid("setFrameLoadDelegate:"),function(_6d,_6e,_6f){
with(_6d){
_frameLoadDelegate=_6f;
}
}),new objj_method(sel_getUid("policyDelegate"),function(_70,_71){
with(_70){
return _policyDelegate;
}
}),new objj_method(sel_getUid("setPolicyDelegate:"),function(_72,_73,_74){
with(_72){
_policyDelegate=_74;
}
}),new objj_method(sel_getUid("resourceLoadDelegate"),function(_75,_76){
with(_75){
return _resourceLoadDelegate;
}
}),new objj_method(sel_getUid("setResourceLoadDelegate:"),function(_77,_78,_79){
with(_77){
_resourceLoadDelegate=_79;
}
}),new objj_method(sel_getUid("UIDelegate"),function(_7a,_7b){
with(_7a){
return _UIDelegate;
}
}),new objj_method(sel_getUid("setUIDelegate:"),function(_7c,_7d,_7e){
with(_7c){
_UIDelegate=_7e;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPWebScriptObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithWindow:"),function(_7f,_80,_81){
with(_7f){
if(_7f=objj_msgSendSuper({receiver:_7f,super_class:objj_getClass("CPObject")},"init")){
_window=_81;
}
return _7f;
}
}),new objj_method(sel_getUid("callWebScriptMethod:withArguments:"),function(_82,_83,_84,_85){
with(_82){
if(typeof _window[_84]=="function"){
try{
return _window[_84].apply(_85);
}
catch(e){
}
}
return undefined;
}
}),new objj_method(sel_getUid("evaluateWebScript:"),function(_86,_87,_88){
with(_86){
try{
return _window.eval(_88);
}
catch(e){
}
return undefined;
}
}),new objj_method(sel_getUid("window"),function(_89,_8a){
with(_89){
return _window;
}
})]);
var _1=objj_getClass("CPWebView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWebView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8b,_8c,_8d){
with(_8b){
_8b=objj_msgSendSuper({receiver:_8b,super_class:objj_getClass("CPView")},"initWithCoder:",_8d);
if(_8b){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
_scrollMode=CPWebViewScrollNative;
objj_msgSend(_8b,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
}
return _8b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8e,_8f,_90){
with(_8e){
var _91=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_8e,super_class:objj_getClass("CPView")},"encodeWithCoder:",_90);
_subviews=_91;
}
})]);
p;10;CPWindow.jI;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;10;CPScreen.ji;18;CPPlatformWindow.jc;51498;
CPBorderlessWindowMask=0;
CPTitledWindowMask=1<<0;
CPClosableWindowMask=1<<1;
CPMiniaturizableWindowMask=1<<2;
CPResizableWindowMask=1<<3;
CPTexturedBackgroundWindowMask=1<<8;
CPBorderlessBridgeWindowMask=1<<20;
CPHUDBackgroundWindowMask=1<<21;
CPWindowNotSizable=0;
CPWindowMinXMargin=1;
CPWindowWidthSizable=2;
CPWindowMaxXMargin=4;
CPWindowMinYMargin=8;
CPWindowHeightSizable=16;
CPWindowMaxYMargin=32;
CPBackgroundWindowLevel=-1;
CPNormalWindowLevel=0;
CPFloatingWindowLevel=3;
CPSubmenuWindowLevel=3;
CPTornOffMenuWindowLevel=3;
CPMainMenuWindowLevel=24;
CPStatusWindowLevel=25;
CPModalPanelWindowLevel=8;
CPPopUpMenuWindowLevel=101;
CPDraggingWindowLevel=500;
CPScreenSaverWindowLevel=1000;
CPWindowOut=0;
CPWindowAbove=1;
CPWindowBelow=2;
CPWindowWillCloseNotification="CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification="CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification="CPWindowDidResignMainNotification";
CPWindowDidMoveNotification="CPWindowDidMoveNotification";
CPWindowWillBeginSheetNotification="CPWindowWillBeginSheetNotification";
CPWindowDidEndSheetNotification="CPWindowDidEndSheetNotification";
CPWindowDidMiniaturizeNotification="CPWindowDidMiniaturizeNotification";
CPWindowWillMiniaturizeNotification="CPWindowWillMiniaturizeNotification";
CPWindowDidDeminiaturizeNotification="CPWindowDidDeminiaturizeNotification";
CPWindowShadowStyleStandard=0;
CPWindowShadowStyleMenu=1;
CPWindowShadowStylePanel=2;
var _1=20,_2=19,_3=10,_4=10,_5=5,_6=nil;
var _7=nil,_8=nil;
var _9=objj_allocateClassPair(CPResponder,"CPWindow"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isMiniaturized"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_shadowStyle"),new objj_ivar("_supportsMultipleDocuments"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession"),new objj_ivar("_sheetContext"),new objj_ivar("_parentView"),new objj_ivar("_isSheet")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPResponder")},"init");
if(_b){
var _f=objj_msgSend(objj_msgSend(_b,"class"),"_windowViewClassForStyleMask:",_e);
_frame=objj_msgSend(_f,"frameRectForContentRect:",_d);
objj_msgSend(_b,"_setSharesChromeWithPlatformWindow:",!objj_msgSend(CPPlatform,"isBrowser"));
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"));
}else{
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"initWithContentRect:",_frame));
objj_msgSend(_b,"platformWindow")._only=_b;
}
_isFullPlatformWindow=NO;
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_isSheet=NO;
_windowNumber=objj_msgSend(CPApp._windows,"count");
CPApp._windows[_windowNumber]=_b;
_styleMask=_e;
objj_msgSend(_b,"setLevel:",CPNormalWindowLevel);
_minSize=CGSizeMake(0,0);
_maxSize=CGSizeMake(1000000,1000000);
_windowView=objj_msgSend(objj_msgSend(_f,"alloc"),"initWithFrame:styleMask:",CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame)),_e);
objj_msgSend(_windowView,"_setWindow:",_b);
objj_msgSend(_windowView,"setNextResponder:",_b);
objj_msgSend(_b,"setMovableByWindowBackground:",_e&CPHUDBackgroundWindowMask);
objj_msgSend(_b,"setContentView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
_firstResponder=_b;
objj_msgSend(_b,"setNextResponder:",CPApp);
objj_msgSend(_b,"setHasShadow:",_e!==CPBorderlessWindowMask);
if(_e&CPBorderlessBridgeWindowMask){
objj_msgSend(_b,"setFullPlatformWindow:",YES);
}
_defaultButtonEnabled=YES;
_keyViewLoopIsDirty=YES;
}
return _b;
}
}),new objj_method(sel_getUid("platformWindow"),function(_10,_11){
with(_10){
return _platformWindow;
}
}),new objj_method(sel_getUid("setPlatformWindow:"),function(_12,_13,_14){
with(_12){
_platformWindow=_14;
}
}),new objj_method(sel_getUid("setSupportsMultipleDocuments:"),function(_15,_16,_17){
with(_15){
_17=!!_17;
_supportsMultipleDocuments=_17;
}
}),new objj_method(sel_getUid("supportsMultipleDocuments"),function(_18,_19){
with(_18){
return _supportsMultipleDocuments;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_1a,_1b){
with(_1a){
if(_initialFirstResponder){
objj_msgSend(_1a,"makeFirstResponder:",_initialFirstResponder);
}
_keyViewLoopIsDirty=!objj_msgSend(_1a,"_hasKeyViewLoop");
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_1c,_1d,_1e){
with(_1c){
if(_windowView===_1e){
return;
}
var _1f=_windowView;
_windowView=_1e;
if(_1f){
objj_msgSend(_1f,"_setWindow:",nil);
objj_msgSend(_1f,"noteToolbarChanged");
}
if(_windowView){
var _20=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_20.origin=objj_msgSend(_1c,"convertBaseToGlobal:",_20.origin);
objj_msgSend(_windowView,"_setWindow:",_1c);
objj_msgSend(_windowView,"setNextResponder:",_1c);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_1c,"setFrame:",objj_msgSend(_1c,"frameRectForContentRect:",_20));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_21,_22,_23){
with(_21){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_23=!!_23;
if(_isFullPlatformWindow===_23){
return;
}
_isFullPlatformWindow=_23;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_21,"contentRectForFrameRect:",objj_msgSend(_21,"frame")),objj_msgSend(_21,"hasShadow"),objj_msgSend(_21,"level"));
var _24=objj_msgSend(objj_msgSend(_21,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_25=objj_msgSend(objj_msgSend(_24,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_21,"_setWindowView:",_25);
objj_msgSend(_21,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_21,"setHasShadow:",NO);
objj_msgSend(_21,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_21,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _25=_fullPlatformWindowSession.windowView;
objj_msgSend(_21,"_setWindowView:",_25);
objj_msgSend(_21,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_21,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_21,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_21,"setFrame:",objj_msgSend(_25,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_26,_27){
with(_26){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_28,_29){
with(_28){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_2a,_2b,_2c){
with(_2a){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_2c);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_windowView,"frameRectForContentRect:",_2f);
}
}),new objj_method(sel_getUid("frame"),function(_30,_31){
with(_30){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_32,_33,_34,_35,_36){
with(_32){
if(_36){
var _37=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_32,_34);
objj_msgSend(_37,"startAnimation");
}else{
var _38=_frame.origin,_39=_34.origin;
if(!(_38.x==_39.x&&_38.y==_39.y)){
_38.x=_39.x;
_38.y=_39.y;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_32);
}
var _3a=_frame.size,_3b=_34.size;
if(!(_3a.width==_3b.width&&_3a.height==_3b.height)){
_3a.width=MIN(MAX(_3b.width,_minSize.width),_maxSize.width);
_3a.height=MIN(MAX(_3b.height,_minSize.height),_maxSize.height);
objj_msgSend(_windowView,"setFrameSize:",_3a);
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_3a.width+_2,height:_4+_3a.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_32);
}
}
if(objj_msgSend(_32,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentRect:",_frame);
}
}
}
}),new objj_method(sel_getUid("setFrame:display:"),function(_3c,_3d,_3e,_3f){
with(_3c){
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPResponder")},"setFrame:display:animate:",_3e,_3f,NO);
}
}),new objj_method(sel_getUid("setFrame:"),function(_40,_41,_42){
with(_40){
objj_msgSend(_40,"setFrame:display:animate:",_42,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_43,"setFrame:display:animate:",{origin:{x:_45.x,y:_45.y},size:{width:(_frame.size.width),height:(_frame.size.height)}},YES,NO);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_46,_47,_48){
with(_46){
objj_msgSend(_46,"setFrame:display:animate:",{origin:{x:(_frame.origin.x),y:(_frame.origin.y)},size:{width:_48.width,height:_48.height}},YES,NO);
}
}),new objj_method(sel_getUid("orderFront:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_platformWindow,"orderFront:",_49);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_49,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_4c,_4d,_4e){
with(_4c){
}
}),new objj_method(sel_getUid("orderOut:"),function(_4f,_50,_51){
with(_4f){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_4f);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_4f,nil);
if(objj_msgSend(CPApp,"keyWindow")==_4f){
objj_msgSend(_4f,"resignKeyWindow");
CPApp._keyWindow=nil;
}
if(objj_msgSend(_4f,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"orderOut:",_4f);
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_52,_53,_54,_55){
with(_52){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_54,_52,CPApp._windows[_55]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_56,_57,_58){
with(_56){
_level=_58;
if(objj_msgSend(_56,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_58);
}
}
}),new objj_method(sel_getUid("level"),function(_59,_5a){
with(_59){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_5b,_5c){
with(_5b){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_5d,_5e){
with(_5d){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_5f,_60,_61){
with(_5f){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_61);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_62,_63){
with(_62){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_64,_65,_66){
with(_64){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_66);
}
}),new objj_method(sel_getUid("setContentView:"),function(_67,_68,_69){
with(_67){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _6a=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_contentView=_69;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_67,"contentRectForFrameRect:",_6a));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_6b,_6c){
with(_6b){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_6d,_6e,_6f){
with(_6d){
objj_msgSend(_windowView,"setBackgroundColor:",_6f);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_70,_71){
with(_70){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_72,_73,_74){
with(_72){
if(CGSizeEqualToSize(_minSize,_74)){
return;
}
_minSize=CGSizeCreateCopy(_74);
var _75=CGSizeMakeCopy(objj_msgSend(_72,"frame").size),_76=NO;
if(_75.width<_minSize.width){
_75.width=_minSize.width;
_76=YES;
}
if(_75.height<_minSize.height){
_75.height=_minSize.height;
_76=YES;
}
if(_76){
objj_msgSend(_72,"setFrameSize:",_75);
}
}
}),new objj_method(sel_getUid("minSize"),function(_77,_78){
with(_77){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_79,_7a,_7b){
with(_79){
if(CGSizeEqualToSize(_maxSize,_7b)){
return;
}
_maxSize=CGSizeCreateCopy(_7b);
var _7c=CGSizeMakeCopy(objj_msgSend(_79,"frame").size),_7d=NO;
if(_7c.width>_maxSize.width){
_7c.width=_maxSize.width;
_7d=YES;
}
if(_7c.height>_maxSize.height){
_7c.height=_maxSize.height;
_7d=YES;
}
if(_7d){
objj_msgSend(_79,"setFrameSize:",_7c);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_7e,_7f){
with(_7e){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_80,_81){
with(_80){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_82,_83,_84){
with(_82){
if(_hasShadow===_84){
return;
}
_hasShadow=_84;
if(objj_msgSend(_82,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_platformWindow,"setHasShadow:",_84);
}
if(_hasShadow){
var _85=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_85)+_2,_3+CGRectGetHeight(_85)+_4));
if(!_6){
var _86=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_86,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}else{
if(_shadowView){
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setShadowStyle:"),function(_87,_88,_89){
with(_87){
_shadowStyle=_89;
objj_msgSend(objj_msgSend(_87,"platformWindow"),"setShadowStyle:",_shadowStyle);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_8a,_8b,_8c){
with(_8a){
_delegate=_8c;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _8d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_8d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_8a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_8d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_8a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_8d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_8a);
}
}
}),new objj_method(sel_getUid("delegate"),function(_8e,_8f){
with(_8e){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_90,_91,_92){
with(_90){
_windowController=_92;
}
}),new objj_method(sel_getUid("windowController"),function(_93,_94){
with(_93){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_95,_96,_97){
with(_95){
if(objj_msgSend(_delegate,"respondsToSelector:",_97)){
objj_msgSend(_delegate,"performSelector:",_97);
}else{
objj_msgSendSuper({receiver:_95,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_97);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_98,_99){
with(_98){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_9a,_9b,_9c){
with(_9a){
if(_firstResponder==_9c){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_9c||!objj_msgSend(_9c,"acceptsFirstResponder")||!objj_msgSend(_9c,"becomeFirstResponder")){
_firstResponder=_9a;
return NO;
}
_firstResponder=_9c;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_9d,_9e){
with(_9d){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_9f,_a0){
with(_9f){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_a1,_a2,_a3){
with(_a1){
_acceptsMouseMovedEvents=_a3;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_a4,_a5){
with(_a4){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_a6,_a7,_a8){
with(_a6){
_ignoresMouseEvents=_a8;
}
}),new objj_method(sel_getUid("title"),function(_a9,_aa){
with(_a9){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_ab,_ac,_ad){
with(_ab){
_title=_ad;
objj_msgSend(_windowView,"setTitle:",_ad);
objj_msgSend(_ab,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_ae,_af,_b0){
with(_ae){
objj_msgSend(_ae,"setRepresentedFilename:",_b0);
objj_msgSend(_ae,"setTitle:",objj_msgSend(_b0,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_b1,_b2,_b3){
with(_b1){
objj_msgSend(_b1,"setRepresentedURL:",_b3);
}
}),new objj_method(sel_getUid("representedFilename"),function(_b4,_b5){
with(_b4){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_b6,_b7,_b8){
with(_b6){
_representedURL=_b8;
}
}),new objj_method(sel_getUid("representedURL"),function(_b9,_ba){
with(_b9){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_bb,_bc){
with(_bb){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_bd,_be,_bf){
with(_bd){
_isMovableByWindowBackground=_bf;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_c0,_c1){
with(_c0){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_c2,_c3){
with(_c2){
var _c4=objj_msgSend(_c2,"frame").size,_c5=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(_platformWindow,"contentBounds").size:objj_msgSend(objj_msgSend(_c2,"screen"),"visibleFrame").size;
objj_msgSend(_c2,"setFrameOrigin:",CGPointMake((_c5.width-_c4.width)/2,(_c5.height-_c4.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_c6,_c7,_c8){
with(_c6){
var _c9=objj_msgSend(_c8,"type"),_ca=objj_msgSend(_c8,"locationInWindow");
switch(_c9){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_c6,"firstResponder"),"keyUp:",_c8);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_c6,"firstResponder"),"keyDown:",_c8);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_ca),"scrollWheel:",_c8);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_ca),"mouseUp:",_c8);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_c8);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_ca);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_c6,"makeFirstResponder:",_leftMouseDownView);
}
objj_msgSend(CPApp,"activateIgnoringOtherApps:",YES);
var _cb=objj_msgSend(_c8,"window");
if(objj_msgSend(_cb,"isKeyWindow")||objj_msgSend(_cb,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_c8);
}else{
objj_msgSend(_c6,"makeKeyAndOrderFront:",_c6);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_c8)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_c8);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_ca),"mouseDragged:",_c8);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_c8);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_c8);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_ca);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_c8);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_c8);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _cc=objj_msgSend(_windowView,"hitTest:",_ca);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_cc){
return objj_msgSend(_cc,"mouseMoved:",_c8);
}
var _cd=_cc,_ce=[];
while(_cd){
_ce.unshift(_cd);
_cd=objj_msgSend(_cd,"superview");
}
var _cf=MIN(_mouseEnteredStack.length,_ce.length);
while(_cf--){
if(_mouseEnteredStack[_cf]===_ce[_cf]){
break;
}
}
var _d0=_cf+1,_d1=_mouseEnteredStack.length;
if(_d0<_d1){
var _d2=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_ca,objj_msgSend(_c8,"modifierFlags"),objj_msgSend(_c8,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_d0<_d1;++_d0){
objj_msgSend(_mouseEnteredStack[_d0],"mouseExited:",_d2);
}
}
_d0=_cf+1;
_d1=_ce.length;
if(_d0<_d1){
var _d2=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_ca,objj_msgSend(_c8,"modifierFlags"),objj_msgSend(_c8,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_d0<_d1;++_d0){
objj_msgSend(_ce[_d0],"mouseEntered:",_d2);
}
}
_mouseEnteredStack=_ce;
objj_msgSend(_cc,"mouseMoved:",_c8);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_d3,_d4){
with(_d3){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_d5,_d6){
with(_d5){
if(_firstResponder!=_d5&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_d7,_d8){
with(_d7){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_d9,_da){
with(_d9){
return objj_msgSend(CPApp,"keyWindow")==_d9;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_db,_dc,_dd){
with(_db){
objj_msgSend(_db,"orderFront:",_db);
objj_msgSend(_db,"makeKeyWindow");
objj_msgSend(_db,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_de,_df){
with(_de){
if(!objj_msgSend(_de,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_de;
objj_msgSend(_de,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_e0,_e1){
with(_e0){
if(_firstResponder!=_e0&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_e0);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_e2,_e3,_e4,_e5,_e6,_e7,_e8,_e9,_ea){
with(_e2){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_e4,_e2,objj_msgSend(_e2,"convertBaseToGlobal:",_e5),_e6,_e7,_e8,_e9,_ea);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(_eb,_ec,_ed){
with(_eb){
if(!_ed){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_ed);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(_ee,_ef,_f0){
with(_ee){
if(!_f0){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_f0);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f1,_f2,_f3,_f4,_f5,_f6,_f7,_f8,_f9){
with(_f1){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_f3,_f1,objj_msgSend(_f1,"convertBaseToGlobal:",_f4),_f5,_f6,_f7,_f8,_f9);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_fa,_fb,_fc){
with(_fa){
if(!_fc){
return;
}
objj_msgSend(_fa,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_fc);
objj_msgSend(_fa,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_fd,_fe){
with(_fd){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_ff,_cmd){
with(_ff){
objj_msgSend(_ff,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(self,_cmd,_103){
with(self){
if(_isDocumentEdited==_103){
return;
}
_isDocumentEdited=_103;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(self,_cmd){
with(self){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(self,_cmd,_108){
with(self){
if(_isDocumentSaving==_108){
return;
}
_isDocumentSaving=_108;
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(self,_cmd){
with(self){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(self,_cmd){
with(self){
if(!objj_msgSend(self,"isMainWindow")){
return;
}
var _10d=objj_msgSend(CPApp,"mainMenu"),_10e=objj_msgSend(_10d,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_10e==CPNotFound){
return;
}
var item=objj_msgSend(_10d,"itemAtIndex:",_10e);
if(_isDocumentSaving){
_7=objj_msgSend(item,"image");
objj_msgSend(item,"setTitle:","Saving...");
objj_msgSend(item,"setImage:",_8);
objj_msgSend(item,"setEnabled:",NO);
}else{
objj_msgSend(item,"setTitle:","Save");
objj_msgSend(item,"setImage:",_7);
objj_msgSend(item,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("performMiniaturize:"),function(self,_cmd,_112){
with(self){
objj_msgSend(self,"miniaturize:",_112);
}
}),new objj_method(sel_getUid("miniaturize:"),function(self,_cmd,_115){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillMiniaturizeNotification,self);
objj_msgSend(objj_msgSend(self,"platformWindow"),"miniaturize:",_115);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMiniaturizeNotification,self);
_isMiniaturized=YES;
}
}),new objj_method(sel_getUid("deminiaturize:"),function(self,_cmd,_118){
with(self){
objj_msgSend(objj_msgSend(self,"platformWindow"),"deminiaturize:",_118);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidDeminiaturizeNotification,self);
_isMiniaturized=NO;
}
}),new objj_method(sel_getUid("isMiniaturized"),function(self,_cmd){
with(self){
return _isMiniaturized;
}
}),new objj_method(sel_getUid("performClose:"),function(self,_cmd,_11d){
with(self){
if(!(_styleMask&CPClosableWindowMask)){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",self)){
return;
}
}else{
if(objj_msgSend(self,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(self,"windowShouldClose:",self)){
return;
}
}
var _11e=objj_msgSend(_windowController,"document");
if(_11e){
objj_msgSend(_11e,"shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:",_windowController,self,sel_getUid("_document:shouldClose:contextInfo:"),nil);
}else{
objj_msgSend(self,"close");
}
}
}),new objj_method(sel_getUid("_document:shouldClose:contextInfo:"),function(self,_cmd,_121,_122,_123){
with(self){
if(_122){
objj_msgSend(self,"close");
}
}
}),new objj_method(sel_getUid("close"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillCloseNotification,self);
objj_msgSend(self,"orderOut:",nil);
}
}),new objj_method(sel_getUid("isMainWindow"),function(self,_cmd){
with(self){
return objj_msgSend(CPApp,"mainWindow")==self;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"isVisible")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("makeMainWindow"),function(self,_cmd){
with(self){
if(!objj_msgSend(self,"canBecomeMainWindow")){
return;
}
objj_msgSend(CPApp._mainWindow,"resignMainWindow");
CPApp._mainWindow=self;
objj_msgSend(self,"becomeMainWindow");
}
}),new objj_method(sel_getUid("becomeMainWindow"),function(self,_cmd){
with(self){
objj_msgSend(self,"_synchronizeMenuBarTitleWithWindowTitle");
objj_msgSend(self,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeMainNotification,self);
}
}),new objj_method(sel_getUid("resignMainWindow"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignMainNotification,self);
}
}),new objj_method(sel_getUid("toolbar"),function(self,_cmd){
with(self){
return _toolbar;
}
}),new objj_method(sel_getUid("setToolbar:"),function(self,_cmd,_134){
with(self){
if(_toolbar===_134){
return;
}
objj_msgSend(objj_msgSend(_134,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_134;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_cmd,_137){
with(self){
var _138=objj_msgSend(self,"toolbar");
objj_msgSend(_138,"setVisible:",!objj_msgSend(_138,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_cmd){
with(self){
var _13b=CGRectMakeCopy(objj_msgSend(self,"frame")),_13c;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_13c=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_13c=CGRectMakeCopy(objj_msgSend(self,"frame"));
_13c.origin=_13b.origin;
}
objj_msgSend(self,"setFrame:",_13c);
}
}),new objj_method(sel_getUid("_setFrame:delegate:duration:curve:"),function(self,_cmd,_13f,_140,_141,_142){
with(self){
var _143=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",self,_13f);
objj_msgSend(_143,"setDelegate:",_140);
objj_msgSend(_143,"setAnimationCurve:",_142);
objj_msgSend(_143,"setDuration:",_141);
objj_msgSend(_143,"startAnimation");
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_cmd){
with(self){
var _146=objj_msgSend(self,"attachedSheet");
var _147=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_148=CGRectMakeCopy(objj_msgSend(_146,"frame"));
_148.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_147);
_148.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_148))/2);
objj_msgSend(_146,"setFrameOrigin:",_148.origin);
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_cmd,_14b,_14c,_14d,_14e){
with(self){
var _14f=objj_msgSend(_14b,"frame");
_sheetContext={"sheet":_14b,"modalDelegate":_14c,"endSelector":_14d,"contextInfo":_14e,"frame":CGRectMakeCopy(_14f),"returnCode":-1,"opened":NO};
objj_msgSend(self,"_attachSheetWindow:",_14b);
}
}),new objj_method(sel_getUid("_attachSheetWindow:"),function(self,_cmd,_152){
with(self){
var _153=objj_msgSend(_152,"frame"),_154=objj_msgSend(self,"frame"),_155=objj_msgSend(_152,"contentView");
objj_msgSend(self,"_setUpMasksForView:",_155);
_152._isSheet=YES;
_152._parentView=self;
var _156=_154.origin.x+FLOOR((_154.size.width-_153.size.width)/2),_157=_154.origin.y+objj_msgSend(objj_msgSend(self,"contentView"),"frame").origin.y,_158=CGRectMake(_156,_157,_153.size.width,0),_159=CGRectMake(_156,_157,_153.size.width,_153.size.height);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillBeginSheetNotification,self);
objj_msgSend(CPApp,"runModalForWindow:",_152);
objj_msgSend(_152,"orderFront:",self);
objj_msgSend(_152,"setFrame:",_158);
_sheetContext["opened"]=YES;
objj_msgSend(_152,"_setFrame:delegate:duration:curve:",_159,self,0.2,CPAnimationEaseOut);
objj_msgSend(_152,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("_detachSheetWindow"),function(self,_cmd){
with(self){
var _15c=objj_msgSend(self,"attachedSheet"),_15d=objj_msgSend(_15c,"frame"),_15e=CGRectMakeCopy(_15d);
_15e.size.height=0;
_sheetContext["frame"]=_15d;
var _15f=objj_msgSend(_15c,"contentView");
objj_msgSend(self,"_setUpMasksForView:",_15f);
_sheetContext["opened"]=NO;
objj_msgSend(_15c,"_setFrame:delegate:duration:curve:",_15e,self,0.2,CPAnimationEaseIn);
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(self,_cmd,anim){
with(self){
var _163=_sheetContext["sheet"];
if(anim._window!=_163){
return;
}
var _164=objj_msgSend(_163,"contentView");
if(_sheetContext["opened"]===YES){
objj_msgSend(self,"_restoreMasksForView:",_164);
return;
}
objj_msgSend(CPApp,"stopModal");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidEndSheetNotification,self);
objj_msgSend(_163,"orderOut:",self);
var _165=_sheetContext["frame"];
objj_msgSend(_163,"setFrame:",_165);
objj_msgSend(self,"_restoreMasksForView:",_164);
var _166=_sheetContext["modalDelegate"],_167=_sheetContext["endSelector"];
if(_166!=nil&&_167!=nil){
objj_msgSend(_166,_167,_163,_sheetContext["returnCode"],_sheetContext["contextInfo"]);
}
_sheetContext=nil;
_163._parentView=nil;
}
}),new objj_method(sel_getUid("_setUpMasksForView:"),function(self,_cmd,_16a){
with(self){
var _16b=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_16a,"subviews"));
objj_msgSend(_16b,"addObject:",_16a);
for(var i=0,_16d=objj_msgSend(_16b,"count");i<_16d;i++){
var view=objj_msgSend(_16b,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_170=(mask&CPViewMinYMargin)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask|_170));
}
}
}),new objj_method(sel_getUid("_restoreMasksForView:"),function(self,_cmd,_173){
with(self){
var _174=objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_173,"subviews"));
objj_msgSend(_174,"addObject:",_173);
for(var i=0,_176=objj_msgSend(_174,"count");i<_176;i++){
var view=objj_msgSend(_174,"objectAtIndex:",i),mask=objj_msgSend(view,"autoresizingMask"),_179=(mask&128)?128:CPViewMinYMargin;
objj_msgSend(view,"setAutoresizingMask:",(mask&(~_179)));
}
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_cmd){
with(self){
if(_sheetContext===nil){
return nil;
}
return _sheetContext["sheet"];
}
}),new objj_method(sel_getUid("isSheet"),function(self,_cmd){
with(self){
return _isSheet;
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("keyDown:"),function(self,_cmd,_184){
with(self){
if(!objj_msgSend(self,"performKeyEquivalent:",_184)){
objj_msgSend(self,"interpretKeyEvents:",[_184]);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(self,_cmd,_187){
with(self){
if(_defaultButton&&_defaultButtonEnabled){
objj_msgSend(_defaultButton,"performClick:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(self,_cmd,_18a){
with(self){
objj_msgSend(self,"selectNextKeyView:",nil);
}
}),new objj_method(sel_getUid("_dirtyKeyViewLoop"),function(self,_cmd){
with(self){
if(_autorecalculatesKeyViewLoop){
_keyViewLoopIsDirty=YES;
}
}
}),new objj_method(sel_getUid("_hasKeyViewLoop"),function(self,_cmd){
with(self){
var _18f=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_18f);
for(var i=0,_191=objj_msgSend(_18f,"count");i<_191;i++){
if(_18f[i]._nextKeyView){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_cmd){
with(self){
var _194=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_194);
var _195=objj_msgSend(_194,"sortedArrayUsingFunction:context:",_196,_contentView),_197=objj_msgSend(_195,"count");
for(var i=0;i<_197;i++){
objj_msgSend(_195[i],"setNextKeyView:",_195[(i+1)%_197]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("_appendSubviewsOf:toArray:"),function(self,_cmd,_19b,_19c){
with(self){
var _19d=objj_msgSend(_19b,"subviews"),_19e=objj_msgSend(_19d,"count");
while(_19e--){
objj_msgSend(self,"_appendSubviewsOf:toArray:",_19d[_19e],_19c);
}
objj_msgSend(_19c,"addObject:",_19b);
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_cmd,_1a1){
with(self){
if(_autorecalculatesKeyViewLoop===_1a1){
return;
}
_autorecalculatesKeyViewLoop=_1a1;
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}else{
if(_autorecalculatesKeyViewLoop){
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_cmd){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_cmd,_1a6){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewFollowingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_cmd,_1a9){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewPrecedingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_cmd,_1ac){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_1ac,"nextValidKeyView"));
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_cmd,_1af){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_1af,"previousValidKeyView"));
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_cmd,_1b2){
with(self){
objj_msgSend(self,"setDefaultButton:",_1b2);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_cmd){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_cmd,_1b7){
with(self){
objj_msgSend(_defaultButton,"setDefaultButton:",NO);
_defaultButton=_1b7;
objj_msgSend(_defaultButton,"setDefaultButton:",YES);
}
}),new objj_method(sel_getUid("defaultButton"),function(self,_cmd){
with(self){
return _defaultButton;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButton"),function(self,_cmd){
with(self){
_defaultButtonEnabled=YES;
}
}),new objj_method(sel_getUid("enableKeyEquivalentForDefaultButtonCell"),function(self,_cmd){
with(self){
objj_msgSend(self,"enableKeyEquivalentForDefaultButton");
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButton"),function(self,_cmd){
with(self){
_defaultButtonEnabled=NO;
}
}),new objj_method(sel_getUid("disableKeyEquivalentForDefaultButtonCell"),function(self,_cmd){
with(self){
objj_msgSend(self,"disableKeyEquivalentForDefaultButton");
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(CPWindow,"class")){
return;
}
var _1c4=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_1c4,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_cmd,_1c7){
with(self){
if(_1c7&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_1c7===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}else{
if(_1c7&CPDocModalWindowMask){
return _CPDocModalWindowView;
}
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_cmd,_1ca){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_cmd,_1cd,_1ce){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_1ce),"frameRectForContentRect:",_1cd);
}
})]);
var _196=function(a,b,_1d1){
var _1d2=objj_msgSend(a,"convertRect:toView:",objj_msgSend(a,"bounds"),nil),_1d3=objj_msgSend(b,"convertRect:toView:",objj_msgSend(b,"bounds"),nil);
if(CGRectGetMinY(_1d2)<CGRectGetMinY(_1d3)){
return -1;
}else{
if(CGRectGetMinY(_1d2)==CGRectGetMinY(_1d3)&&CGRectGetMinX(_1d2)<CGRectGetMinX(_1d3)){
return -1;
}else{
if(CGRectGetMinX(_1d2)==CGRectGetMinX(_1d3)&&CGRectGetMinX(_1d2)==CGRectGetMinX(_1d3)){
return 0;
}else{
return 1;
}
}
}
};
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"),function(self,_cmd){
with(self){
if(!objj_msgSend(_windowController,"document")||!objj_msgSend(self,"isMainWindow")){
return;
}
objj_msgSend(CPMenu,"setMenuBarTitle:",_title);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_cmd,_1d8){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _1d9=objj_msgSend(_platformWindow,"contentBounds"),_1da=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_1d9)-_1d8.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_1d9)-_1d8.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_1da.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_1da.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_1da.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_1da.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_1da);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_cmd,_1df){
with(self){
_autoresizingMask=_1df;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_cmd){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_cmd,_1e4){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_1e4):objj_msgSend(self,"convertBaseToScreen:",_1e4);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_cmd,_1e7){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_1e7):objj_msgSend(self,"convertScreenToBase:",_1e7);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_cmd,_1ea){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _1ea;
}
var _1eb=objj_msgSend(self,"frame").origin;
return {x:_1ea.x+_1eb.x,y:_1ea.y+_1eb.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_cmd,_1ee){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _1ee;
}
var _1ef=objj_msgSend(self,"frame").origin;
return {x:_1ee.x-_1ef.x,y:_1ee.y-_1ef.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_cmd,_1f2){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1f2));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_cmd,_1f5){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1f5));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_cmd,_1f8){
with(self){
if(_1f8&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1f8;
}
}),new objj_method(sel_getUid("_sharesChromeWithPlatformWindow"),function(self,_cmd){
with(self){
return _sharesChromeWithPlatformWindow;
}
}),new objj_method(sel_getUid("undoManager"),function(self,_cmd){
with(self){
if(_delegateRespondsToWindowWillReturnUndoManagerSelector){
return objj_msgSend(_delegate,"windowWillReturnUndoManager:",self);
}
if(!_undoManager){
_undoManager=objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init");
}
return _undoManager;
}
}),new objj_method(sel_getUid("undo:"),function(self,_cmd,_1ff){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_cmd,_202){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_cmd,_205){
with(self){
return CGRectContainsPoint(_frame,_205);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setFullBridge:"),function(self,_cmd,_208){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_208);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_cmd){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_cmd,_20d){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_20d);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_cmd,_210){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_210);
}
})]);
var _211=function(_212,_213,_214){
return _212+(_213-_212)*_214;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_cmd,_217,_218){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_217;
_targetFrame=CGRectMakeCopy(_218);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_cmd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_cmd,_21d){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_21d);
var _21e=objj_msgSend(self,"currentValue");
if(_21e==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_211(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_21e),_211(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_21e)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_211(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_21e),_211(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_21e)));
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_21f,_220,_221,_222){
return {windowView:_21f,contentRect:_220,hasShadow:_221,level:_222};
};
CPStandardWindowShadowStyle=0;
CPMenuWindowShadowStyle=1;
CPPanelWindowShadowStyle=2;
CPCustomWindowShadowStyle=3;
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;23;_CPDocModalWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.jp;20;CPWindowController.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;7752;
var _1=objj_allocateClassPair(CPResponder,"CPWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window"),new objj_ivar("_document"),new objj_ivar("_shouldCloseDocument"),new objj_ivar("_cibOwner"),new objj_ivar("_windowCibName"),new objj_ivar("_windowCibPath"),new objj_ivar("_viewController"),new objj_ivar("_viewControllerContainerView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithWindow:",nil);
}
}),new objj_method(sel_getUid("initWithWindow:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
objj_msgSend(_5,"setWindow:",_7);
objj_msgSend(_5,"setShouldCloseDocument:",NO);
objj_msgSend(_5,"setNextResponder:",CPApp);
}
return _5;
}
}),new objj_method(sel_getUid("initWithWindowCibName:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithWindowCibName:owner:",_a,_8);
}
}),new objj_method(sel_getUid("initWithWindowCibName:owner:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSend(_b,"initWithWindow:",nil);
if(_b){
_cibOwner=_e;
_windowCibName=_d;
}
return _b;
}
}),new objj_method(sel_getUid("initWithWindowCibPath:owner:"),function(_f,_10,_11,_12){
with(_f){
_f=objj_msgSend(_f,"initWithWindow:",nil);
if(_f){
_cibOwner=_12;
_windowCibPath=_11;
}
return _f;
}
}),new objj_method(sel_getUid("loadWindow"),function(_13,_14){
with(_13){
if(_window){
return;
}
objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"loadCibFile:externalNameTable:",objj_msgSend(_13,"windowCibPath"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_cibOwner,CPCibOwner));
}
}),new objj_method(sel_getUid("showWindow:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(_15,"window");
if(objj_msgSend(_18,"respondsToSelector:",sel_getUid("becomesKeyOnlyIfNeeded"))&&objj_msgSend(_18,"becomesKeyOnlyIfNeeded")){
objj_msgSend(_18,"orderFront:",_17);
}else{
objj_msgSend(_18,"makeKeyAndOrderFront:",_17);
}
}
}),new objj_method(sel_getUid("isWindowLoaded"),function(_19,_1a){
with(_19){
return _window!==nil;
}
}),new objj_method(sel_getUid("window"),function(_1b,_1c){
with(_1b){
if(!_window){
objj_msgSend(_1b,"windowWillLoad");
objj_msgSend(_document,"windowControllerWillLoadCib:",_1b);
objj_msgSend(_1b,"loadWindow");
if(_window===nil&&objj_msgSend(_cibOwner,"isKindOfClass:",objj_msgSend(CPDocument,"class"))){
objj_msgSend(_1b,"setWindow:",objj_msgSend(_cibOwner,"valueForKey:","window"));
}
objj_msgSend(_1b,"windowDidLoad");
objj_msgSend(_document,"windowControllerDidLoadCib:",_1b);
objj_msgSend(_1b,"synchronizeWindowTitleWithDocumentName");
}
return _window;
}
}),new objj_method(sel_getUid("setWindow:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_window,"setWindowController:",nil);
_window=_1f;
objj_msgSend(_window,"setWindowController:",_1d);
objj_msgSend(_window,"setNextResponder:",_1d);
}
}),new objj_method(sel_getUid("windowDidLoad"),function(_20,_21){
with(_20){
}
}),new objj_method(sel_getUid("windowWillLoad"),function(_22,_23){
with(_22){
}
}),new objj_method(sel_getUid("setDocument:"),function(_24,_25,_26){
with(_24){
if(_document===_26){
return;
}
var _27=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_document){
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentWillSaveNotification,_document);
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentDidSaveNotification,_document);
objj_msgSend(_27,"removeObserver:name:object:",_24,CPDocumentDidFailToSaveNotification,_document);
}
_document=_26;
if(_document){
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentWillSave:"),CPDocumentWillSaveNotification,_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentDidSave:"),CPDocumentDidSaveNotification,_document);
objj_msgSend(_27,"addObserver:selector:name:object:",_24,sel_getUid("_documentDidFailToSave:"),CPDocumentDidFailToSaveNotification,_document);
objj_msgSend(_24,"setDocumentEdited:",objj_msgSend(_document,"isDocumentEdited"));
}
var _28=objj_msgSend(_document,"viewControllerForWindowController:",_24);
if(_28){
objj_msgSend(_24,"setViewController:",_28);
}
objj_msgSend(_24,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("setViewController:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(_29,"viewControllerContainerView")||objj_msgSend(objj_msgSend(_29,"window"),"contentView"),_2d=objj_msgSend(_viewController,"view"),_2e=_2d?objj_msgSend(_2d,"frame"):objj_msgSend(_2c,"bounds");
objj_msgSend(_2d,"removeFromSuperview");
_viewController=_2b;
_2d=objj_msgSend(_viewController,"view");
if(_2d){
objj_msgSend(_2d,"setFrame:",_2e);
objj_msgSend(_2c,"addSubview:",_2d);
}
}
}),new objj_method(sel_getUid("setViewControllerContainerView:"),function(_2f,_30,_31){
with(_2f){
_viewControllerContainerView=_31;
}
}),new objj_method(sel_getUid("viewControllerContainerView"),function(_32,_33){
with(_32){
return _viewControllerContainerView;
}
}),new objj_method(sel_getUid("setViewController:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_34,"viewControllerContainerView")||objj_msgSend(objj_msgSend(_34,"window"),"contentView"),_38=objj_msgSend(_viewController,"view"),_39=_38?objj_msgSend(_38,"frame"):objj_msgSend(_37,"bounds");
objj_msgSend(_38,"removeFromSuperview");
_viewController=_36;
_38=objj_msgSend(_viewController,"view");
if(_38){
objj_msgSend(_38,"setFrame:",_39);
objj_msgSend(_37,"addSubview:",_38);
}
}
}),new objj_method(sel_getUid("viewController"),function(_3a,_3b){
with(_3a){
return _viewController;
}
}),new objj_method(sel_getUid("_documentWillSave:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(objj_msgSend(_3c,"window"),"setDocumentSaving:",YES);
}
}),new objj_method(sel_getUid("_documentDidSave:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(objj_msgSend(_3f,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("_documentDidFailToSave:"),function(_42,_43,_44){
with(_42){
objj_msgSend(objj_msgSend(_42,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("document"),function(_45,_46){
with(_45){
return _document;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_47,_48,_49){
with(_47){
objj_msgSend(objj_msgSend(_47,"window"),"setDocumentEdited:",_49);
}
}),new objj_method(sel_getUid("close"),function(_4a,_4b){
with(_4a){
objj_msgSend(objj_msgSend(_4a,"window"),"close");
}
}),new objj_method(sel_getUid("setShouldCloseDocument:"),function(_4c,_4d,_4e){
with(_4c){
_shouldCloseDocument=_4e;
}
}),new objj_method(sel_getUid("shouldCloseDocument"),function(_4f,_50){
with(_4f){
return _shouldCloseDocument;
}
}),new objj_method(sel_getUid("owner"),function(_51,_52){
with(_51){
return _cibOwner;
}
}),new objj_method(sel_getUid("windowCibName"),function(_53,_54){
with(_53){
if(_windowCibName){
return _windowCibName;
}
return objj_msgSend(objj_msgSend(_windowCibPath,"lastPathComponent"),"stringByDeletingPathExtension");
}
}),new objj_method(sel_getUid("windowCibPath"),function(_55,_56){
with(_55){
if(_windowCibPath){
return _windowCibPath;
}
return objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"pathForResource:",_windowCibName+".cib");
}
}),new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"),function(_57,_58){
with(_57){
if(!_document||!_window){
return;
}
objj_msgSend(_window,"setTitle:",objj_msgSend(_57,"windowTitleForDocumentDisplayName:",objj_msgSend(_document,"displayName")));
}
}),new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"),function(_59,_5a,_5b){
with(_59){
return _5b;
}
})]);
p;18;OLDCPTableColumn.jI;23;Foundation/Foundation.jc;7151;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"CPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_headerView"),new objj_ivar("_tableView"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_resizingMask"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_dataViewForView"),new objj_ivar("_purgableInfosForDataView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
objj_msgSend(_3,"_init");
_identifier=_5;
_width=40;
_minWidth=8;
_maxWidth=1000;
var _6=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_6,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"whiteColor"),"text-color",CPThemeStateHighlighted);
objj_msgSend(_3,"setDataView:",_6);
_headerView=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_headerView,"setBackgroundColor:",objj_msgSend(CPColor,"greenColor"));
}
return _3;
}
}),new objj_method(sel_getUid("_init"),function(_7,_8){
with(_7){
_dataViewData={};
_dataViewForView={};
_purgableInfosForDataView={};
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_9,_a,_b){
with(_9){
_identifier=_b;
}
}),new objj_method(sel_getUid("identifier"),function(_c,_d){
with(_c){
return _identifier;
}
}),new objj_method(sel_getUid("setTableView:"),function(_e,_f,_10){
with(_e){
_tableView=_10;
}
}),new objj_method(sel_getUid("tableView"),function(_11,_12){
with(_11){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_13,_14,_15){
with(_13){
_width=_15;
}
}),new objj_method(sel_getUid("width"),function(_16,_17){
with(_16){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_18,_19,_1a){
with(_18){
if(_width<(_minWidth=_1a)){
objj_msgSend(_18,"setWidth:",_minWidth);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_1b,_1c){
with(_1b){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1d,_1e,_1f){
with(_1d){
if(_width>(_maxmimumWidth=_1f)){
objj_msgSend(_1d,"setWidth:",_maxWidth);
}
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_20,_21,_22){
with(_20){
_resizingMask=_22;
}
}),new objj_method(sel_getUid("resizingMask"),function(_23,_24){
with(_23){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_25,_26){
with(_25){
var _27=CPRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_27<_minWidth){
objj_msgSend(_25,"setMinWidth:",_27);
}else{
if(_27>_maxWidth){
objj_msgSend(_25,"setMaxWidth:",_27);
}
}
if(_width!=_27){
objj_msgSend(_25,"setWidth:",_27);
}
}
}),new objj_method(sel_getUid("setEditable:"),function(_28,_29,_2a){
with(_28){
_isEditable=_2a;
}
}),new objj_method(sel_getUid("isEditable"),function(_2b,_2c){
with(_2b){
return _isEditable;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_2d,_2e,_2f){
with(_2d){
_headerView=_2f;
}
}),new objj_method(sel_getUid("headerView"),function(_30,_31){
with(_30){
return _headerView;
}
}),new objj_method(sel_getUid("setDataCell:"),function(_32,_33,_34){
with(_32){
objj_msgSend(_32,"setDataView:",_34);
}
}),new objj_method(sel_getUid("setDataView:"),function(_35,_36,_37){
with(_35){
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_37;
_dataViewData[objj_msgSend(_37,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_37);
}
}),new objj_method(sel_getUid("dataCell"),function(_38,_39){
with(_38){
return _dataView;
}
}),new objj_method(sel_getUid("dataView"),function(_3a,_3b){
with(_3a){
return objj_msgSend(_3a,"dataCell");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_3c,_3d,_3e){
with(_3c){
return objj_msgSend(_3c,"dataView");
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_3f,_40,_41){
with(_3f){
return objj_msgSend(_3f,"dataCellForRow:",_41);
}
}),new objj_method(sel_getUid("_markView:inRow:asPurgable:"),function(_42,_43,_44,_45,_46){
with(_42){
var _47=objj_msgSend(_44,"UID"),_48=objj_msgSend(_dataViewForView[_47],"UID");
if(!_purgableInfosForDataView[_48]){
if(!_46){
return;
}
_purgableInfosForDataView[_48]={};
}
if(!_46){
if(_purgableInfosForDataView[_48][_47]){
CPLog.warn("removing unpurgable "+_purgableInfosForDataView[_48][_47]);
}
delete _purgableInfosForDataView[_48][_47];
}else{
_purgableInfosForDataView[_48][_47]={view:(_44),row:(_45)};
}
}
}),new objj_method(sel_getUid("_newDataViewForRow:avoidingRows:"),function(_49,_4a,_4b,_4c){
with(_49){
var _4d=objj_msgSend(_49,"dataViewForRow:",_4b),_4e=objj_msgSend(_4d,"UID"),_4f=_purgableInfosForDataView[_4e];
if(_4f){
for(var key in _4f){
var _51=_4f[key];
delete _4f[key];
return ((_51).view);
}
}
if(!_dataViewData[_4e]){
_dataViewData[_4e]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_4d);
}
var _52=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_4e]);
_dataViewForView[objj_msgSend(_52,"UID")]=_4d;
CPLog.warn("creating cell: %s",_52);
return _52;
}
}),new objj_method(sel_getUid("_purge"),function(_53,_54){
with(_53){
for(var _55 in _purgableInfosForDataView){
var _56=_purgableInfosForDataView[_55];
for(var key in _56){
var _58=((_56[key]).view);
if(!_58){
CPLog.info("key="+key+" view="+_58+" purgableInfos[key]="+_56[key]);
}else{
if(_58._superview){
objj_msgSend(_58,"setHidden:",YES);
}
}
}
}
}
})]);
var _59="CPTableColumnIdentifierKey",_5a="CPTableColumnHeaderViewKey",_5b="CPTableColumnDataViewKey",_5c="CPTableColumnWidthKey",_5d="CPTableColumnMinWidthKey",_5e="CPTableColumnMaxWidthKey",_5f="CPTableColumnResizingMaskKey";
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_60,"_init");
_identifier=objj_msgSend(_62,"decodeObjectForKey:",_59);
objj_msgSend(_60,"setHeaderView:",objj_msgSend(_62,"decodeObjectForKey:",_5a));
objj_msgSend(_60,"setDataView:",objj_msgSend(_62,"decodeObjectForKey:",_5b));
_width=objj_msgSend(_62,"decodeFloatForKey:",_5c);
_minWidth=objj_msgSend(_62,"decodeFloatForKey:",_5d);
_maxWidth=objj_msgSend(_62,"decodeFloatForKey:",_5e);
_resizingMask=objj_msgSend(_62,"decodeBoolForKey:",_5f);
return _60;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_65,"encodeObject:forKey:",_identifier,_59);
objj_msgSend(_65,"encodeObject:forKey:",_headerView,_5a);
objj_msgSend(_65,"encodeObject:forKey:",_dataView,_5b);
objj_msgSend(_65,"encodeObject:forKey:",_width,_5c);
objj_msgSend(_65,"encodeObject:forKey:",_minWidth,_5d);
objj_msgSend(_65,"encodeObject:forKey:",_maxWidth,_5e);
objj_msgSend(_65,"encodeObject:forKey:",_resizingMask,_5f);
}
})]);
p;16;OLDCPTableView.ji;11;CPControl.ji;15;CPTableColumn.ji;9;CPColor.ji;13;CPTextField.jc;28414;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<0,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4,_6=1<<5,_7=1<<6;
var _8=objj_allocateClassPair(CPControl,"CPTableView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_dataSource"),new objj_ivar("_delegate"),new objj_ivar("_tableColumns"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_rowHeight"),new objj_ivar("_intercellSpacing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_doubleAction"),new objj_ivar("_delegateSelectorsCache"),new objj_ivar("_numberOfRows"),new objj_ivar("_hasVariableHeightRows"),new objj_ivar("_columnHeight"),new objj_ivar("_rowHeights"),new objj_ivar("_rowMinYs"),new objj_ivar("_tableCells"),new objj_ivar("_tableColumnViews"),new objj_ivar("_dataViewCache"),new objj_ivar("_objectValueCache"),new objj_ivar("_visibleRows"),new objj_ivar("_visibleColumns"),new objj_ivar("_populatedRows"),new objj_ivar("_populatedColumns"),new objj_ivar("_previousSelectedRowIndexes"),new objj_ivar("_selectionStartRow"),new objj_ivar("_selectionModifier"),new objj_ivar("_currentlySelected"),new objj_ivar("_selectionViews"),new objj_ivar("_selectionViewsPool"),new objj_ivar("_scrollTimer")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
objj_msgSend(_a,"_init");
}
return _a;
}
}),new objj_method(sel_getUid("_init"),function(_d,_e){
with(_d){
_tableColumns=[];
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_rowHeight=17;
_intercellSpacing=CPSizeMake(3,2);
_allowsMultipleSelection=YES;
_allowsEmptySelection=YES;
_tableCells=[];
_tableColumnViews=[];
_dataViewCache={};
_objectValueCache=[];
_visibleRows=CPMakeRange(0,0);
_visibleColumns=CPMakeRange(0,0);
_rowHeights=[];
_rowMinYs=[];
}
}),new objj_method(sel_getUid("_columnHeight"),function(_f,_10){
with(_f){
return _columnHeight;
}
}),new objj_method(sel_getUid("newCellForRow:column:avoidingRows:"),function(_11,_12,_13,_14,_15){
with(_11){
var _16=objj_msgSend(_tableColumns[_14],"_newDataViewForRow:avoidingRows:",_13,_15);
objj_msgSend(_16,"setFrame:",CGRectMake(0,(_hasVariableHeightRows?_rowMinYs[_13]:(_13*(_rowHeight+_intercellSpacing.height))),objj_msgSend(_tableColumns[_14],"width"),(_hasVariableHeightRows?_rowHeights[_13]:_rowHeight)));
if(objj_msgSend(_16,"respondsToSelector:",sel_getUid("highlight:"))){
objj_msgSend(_16,"highlight:",objj_msgSend(_selectedRowIndexes,"containsIndex:",_13));
}
if(!_objectValueCache[_14]){
_objectValueCache[_14]=[];
}
if(_objectValueCache[_14][_13]===undefined){
_objectValueCache[_14][_13]=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_11,_tableColumns[_14],_13);
}
objj_msgSend(_16,"setObjectValue:",_objectValueCache[_14][_13]);
return _16;
}
}),new objj_method(sel_getUid("clearCells"),function(_17,_18){
with(_17){
var _19=CPMaxRange(_visibleColumns),_1a=CPMaxRange(_visibleRows);
for(var _1b=_visibleColumns.location;_1b<_19;_1b++){
var _1c=_tableColumns[_1b],_1d=_tableCells[_1b];
for(var row=_visibleRows.location;row<_1a;row++){
var _1f=_1d[row];
if(_1f){
_1d[row]=nil;
objj_msgSend(_1c,"_markView:inRow:asPurgable:",_1f,row,YES);
}else{
CPLog.warn("Missing cell? "+row+","+_1b);
}
}
}
_visibleColumns=CPMakeRange(0,0);
_visibleRows=CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("loadTableCellsInRect:"),function(_20,_21,_22){
with(_20){
if(!_dataSource){
return;
}
var _23=MAX(0,objj_msgSend(_20,"_rowAtY:",CGRectGetMinY(_22))-1),_24=MIN(_numberOfRows,objj_msgSend(_20,"_rowAtY:",CGRectGetMaxY(_22))+1),_25=CPMakeRange(_23,_24-_23),_26=MAX(0,objj_msgSend(_20,"_columnAtX:",CGRectGetMinX(_22))),_27=MIN(_tableColumns.length,objj_msgSend(_20,"_columnAtX:",CGRectGetMaxX(_22))+1),_28=CPMakeRange(_26,_27-_26);
if(CPEqualRanges(_visibleRows,_25)&&CPEqualRanges(_visibleColumns,_28)){
return;
}
var _29=CPUnionRange(_visibleRows,_25),_2a=CPUnionRange(_visibleColumns,_28);
if(_29.length*_2a.length<=(_visibleRows.length*_visibleColumns.length)+(_25.length*_28.length)){
var _2b=CPMaxRange(_2a),_2c=CPMaxRange(_29),_2d;
for(var _2e=_2a.location;_2e<_2b;++_2e){
var _2f=_tableColumns[_2e],_30=_tableCells[_2e],_31=CPLocationInRange(_2e,_28),_32=[];
for(var row=_29.location;row<_2c;++row){
if(_2d=_30[row]){
if(!_31||!CPLocationInRange(row,_25)){
_30[row]=nil;
objj_msgSend(_2f,"_markView:inRow:asPurgable:",_2d,row,YES);
}
}else{
_32.push(row);
}
}
while(_32.length>0){
var row=_32.pop();
_30[row]=objj_msgSend(_20,"newCellForRow:column:avoidingRows:",row,_2e,_25);
if(!_30[row]._superview){
objj_msgSend(_tableColumnViews[_2e],"addSubview:",_30[row]);
}else{
if(_30[row]._isHidden){
objj_msgSend(_30[row],"setHidden:",NO);
}
}
}
objj_msgSend(_2f,"_purge");
}
}else{
var _2b=CPMaxRange(_visibleColumns),_2c=CPMaxRange(_visibleRows),_2d;
for(var _2e=_visibleColumns.location;_2e<_2b;++_2e){
var _2f=_tableColumns[_2e],_30=_tableCells[_2e],_31=CPLocationInRange(_2e,_28);
for(var row=_visibleRows.location;row<_2c;++row){
if(_2d=_30[row]){
if(!_31||!CPLocationInRange(row,_25)){
_30[row]=nil;
objj_msgSend(_2f,"_markView:inRow:asPurgable:",_2d,row,YES);
}
}
}
}
var _2b=CPMaxRange(_28),_2c=CPMaxRange(_25);
for(var _2e=_28.location;_2e<_2b;++_2e){
var _2f=_tableColumns[_2e],_30=_tableCells[_2e];
for(var row=_25.location;row<_2c;++row){
_30[row]=objj_msgSend(_20,"newCellForRow:column:avoidingRows:",row,_2e,_25);
if(!_30[row]._superview){
objj_msgSend(_tableColumnViews[_2e],"addSubview:",_30[row]);
}else{
if(_30[row]._isHidden){
objj_msgSend(_30[row],"setHidden:",NO);
}
}
}
objj_msgSend(_2f,"_purge");
}
}
_visibleRows=_25;
_visibleColumns=_28;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_34,_35,_36){
with(_34){
if(_intercellSpacing.width!=_36.width){
var i=1,_38=_36.width-_intercellSpacing.width;
total=_38;
for(;i<_tableColumns.length;++i,total+=_38){
var _39=objj_msgSend(_tableColumnViews[i],"frame").origin;
objj_msgSend(_tableColumnViews[i],"setFrameOrigin:",CGPointMake(_39.x+total,_39.y));
}
}
if(_intercellSpacing.height!=_36.height){
var i=0;
for(;i<_tableColumns.length;++i,total+=_38){
objj_msgSend(_tableColumnViews[i],"setFrameSize:",CGSizeMake(objj_msgSend(_tableColumnViews[i],"width"),_numberOfRows*(_rowHeight+_intercellSpacing.height)));
var j=1,y=_rowHeight+_intercellSpacing.height;
for(;j<_numberOfRows;++i,y+=_rowHeight+_intercellSpacing.height){
if(!_tableCells[i][j]){
continue;
}
objj_msgSend(_tableCells[i][j],"setFrameOrigin:",CPPointMake(0,y));
}
}
}
_intercellSpacing=CPSizeCreateCopy(_36);
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_3c,_3d){
with(_3c){
return _intercellSpacing;
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_3e,_3f,_40){
with(_3e){
if(_rowHeight==_40){
return;
}
_rowHeight=_40;
if(_hasVariableHeightRows){
return;
}
for(var row=0;row<_numberOfRows;++row){
for(var _42=0;_42<_tableColumns.length;++_42){
objj_msgSend(_tableCells[_42][row],"setFrameOrigin:",CPPointMake(0,row*(_rowHeight+_intercellSpacing.height)));
}
}
}
}),new objj_method(sel_getUid("rowHeight"),function(_43,_44){
with(_43){
return _rowHeight;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_45,_46,_47){
with(_45){
var i=0,x=_tableColumns.length?CPRectGetMaxX(objj_msgSend(_45,"rectOfColumn:",_tableColumns.length-1))+_intercellSpacing.width:0,_4a=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(x,0,objj_msgSend(_47,"width"),objj_msgSend(_45,"_columnHeight"))),_4b=[];
objj_msgSend(_tableColumns,"addObject:",_47);
objj_msgSend(_tableColumnViews,"addObject:",_4a);
objj_msgSend(_45,"addSubview:",_4a);
objj_msgSend(_tableCells,"addObject:",_4b);
for(;i<_numberOfRows;++i){
_tableCells[_tableColumns.length-1][i]=nil;
}
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSend(_4c,"frame"),_50=objj_msgSend(_4e,"width")+_intercellSpacing.width,_51=objj_msgSend(_tableColumns,"indexOfObjectIdenticalTo:",_4e);
objj_msgSend(_tableColumnViews[i],"removeFromSuperview");
objj_msgSend(_tableCells,"removeObjectAtIndex:",_51);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_51);
objj_msgSend(_tableColumnViews,"removeObjectAtIndex:",_51);
for(;_51<_tableColumns.length;++_51){
objj_msgSend(_tableColumnViews[_51],"setFrameOrigin:",CPPointMake(CPRectGetMinX(objj_msgSend(_tableColumnViews[_51],"frame"))-_50,0));
}
objj_msgSend(_4c,"setFrameSize:",CPSizeMake(CPRectGetWidth(_4f)-_50,CPRectGetHeight(_4f)));
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_52,_53,_54,_55){
with(_52){
if(_54==_55){
return;
}
}
}),new objj_method(sel_getUid("tableColumns"),function(_56,_57){
with(_56){
return _tableColumns;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_58,_59,_5a){
with(_58){
for(var i=0;i<_tableColumns.length;i++){
if(objj_msgSend(_tableColumns[i],"isEqual:",_5a)){
return _tableColumns[i];
}
}
return nil;
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_5c,_5d){
with(_5c){
return _tableColumns.length;
}
}),new objj_method(sel_getUid("numberOfRows"),function(_5e,_5f){
with(_5e){
return _numberOfRows;
}
}),new objj_method(sel_getUid("tile"),function(_60,_61){
with(_60){
var _62=10;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_63,_64,_65){
with(_63){
if(!objj_msgSend(_65,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source doesn't support 'numberOfRowsInTableView:'");
}
if(!objj_msgSend(_65,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source doesn't support 'tableView:objectValueForTableColumn:row:'");
}
_dataSource=_65;
objj_msgSend(_63,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_66,_67){
with(_66){
return _dataSource;
}
}),new objj_method(sel_getUid("delegate"),function(_68,_69){
with(_68){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6a,_6b,_6c){
with(_6a){
if(_delegate===_6c){
return;
}
var _6d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_6d,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_6a);
}
_delegate=_6c;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidResize:"),CPTableViewColumnDidResizeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_6a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_6d,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_6a);
}
_delegateSelectorsCache=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayCell:forTableColumn:row:"))){
_delegateSelectorsCache|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_delegateSelectorsCache|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_delegateSelectorsCache|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_delegateSelectorsCache|=_4;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_delegateSelectorsCache|=_5;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_delegateSelectorsCache|=_6;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_delegateSelectorsCache|=_7;
_hasVariableHeightRows=YES;
}else{
_hasVariableHeightRows=NO;
}
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_6e,_6f){
with(_6e){
var _70=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_6e);
if(_numberOfRows!=_70){
_numberOfRows=_70;
objj_msgSend(_6e,"_recalculateColumnHeight");
}
}
}),new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"),function(_71,_72,_73){
with(_71){
objj_msgSend(_71,"_recalculateColumnHeight");
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_74,_75,_76){
with(_74){
return CPRectMake(0,(_hasVariableHeightRows?_rowMinYs[_76]:(_76*(_rowHeight+_intercellSpacing.height))),CPRectGetWidth(objj_msgSend(_74,"bounds")),(_hasVariableHeightRows?_rowHeights[_76]:_rowHeight));
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_77,_78,_79){
with(_77){
return objj_msgSend(_tableColumnViews[_79],"frame");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_7a,_7b){
with(_7a){
}
}),new objj_method(sel_getUid("_recalculateColumnHeight"),function(_7c,_7d){
with(_7c){
var _7e=_columnHeight;
if(_hasVariableHeightRows){
_rowMinYs[0]=0;
for(var row=0;row<_numberOfRows;row++){
_rowHeights[row]=objj_msgSend(_delegate,"tableView:heightOfRow:",_7c,row);
_rowMinYs[row+1]=_rowMinYs[row]+_rowHeights[row]+_intercellSpacing.height;
}
_columnHeight=_rowMinYs[_numberOfRows];
}else{
_columnHeight=_numberOfRows*(_rowHeight+_intercellSpacing.height);
}
var _80=_tableColumnViews.length;
while(_80--){
objj_msgSend(_tableColumnViews[_80],"setFrameSize:",CGSizeMake(objj_msgSend(_tableColumns[_80],"width"),_columnHeight));
}
objj_msgSend(_7c,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_7c,"frame")),_columnHeight));
}
}),new objj_method(sel_getUid("visibleRectInParent"),function(_81,_82){
with(_81){
var _83=objj_msgSend(_81,"superview");
if(!_83){
return objj_msgSend(_81,"bounds");
}
return objj_msgSend(_81,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_83,"bounds"),objj_msgSend(_81,"frame")),_83);
}
}),new objj_method(sel_getUid("reloadData"),function(_84,_85){
with(_84){
var _86=_numberOfRows;
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_84);
if(_86!=_numberOfRows){
objj_msgSend(_84,"_recalculateColumnHeight");
objj_msgSend(_84,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_84,"frame")),objj_msgSend(_84,"_columnHeight")));
}
_objectValueCache=[];
objj_msgSend(_84,"clearCells");
objj_msgSend(_84,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_87,_88){
with(_87){
objj_msgSend(_87,"loadTableCellsInRect:",objj_msgSend(_87,"visibleRectInParent"));
}
}),new objj_method(sel_getUid("displaySoon"),function(_89,_8a){
with(_89){
objj_msgSend(_scrollTimer,"invalidate");
_scrollTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.05,_89,sel_getUid("displayNow"),nil,NO);
}
}),new objj_method(sel_getUid("displayNow"),function(_8b,_8c){
with(_8b){
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_8d,_8e){
with(_8d){
objj_msgSend(objj_msgSend(objj_msgSend(_8d,"enclosingScrollView"),"contentView"),"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8d,sel_getUid("viewBoundsChanged:"),CPViewBoundsDidChangeNotification,objj_msgSend(objj_msgSend(_8d,"enclosingScrollView"),"contentView"));
}
}),new objj_method(sel_getUid("viewBoundsChanged:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"displayNow");
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_92,_93,_94){
with(_92){
if(_allowsMultipleSelection===_94){
return;
}
_allowsMultipleSelection=_94;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_95,_96){
with(_95){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_97,_98,_99){
with(_97){
if(_allowsEmptySelection===_99){
return;
}
_allowsEmptySelection=_99;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_9a,_9b){
with(_9a){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=objj_msgSend(_9c,"_rowAtY:",_9e.y);
if(_9f>=0&&_9f<_numberOfRows){
return _9f;
}else{
return CPNotFound;
}
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_a0,_a1,_a2){
with(_a0){
var _a3=objj_msgSend(_a0,"_columnAtX:",_a2.x);
if(_a3>=0&&_a3<_tableColumns.length){
return _a3;
}else{
return CPNotFound;
}
}
}),new objj_method(sel_getUid("_rowAtY:"),function(_a4,_a5,y){
with(_a4){
if(_hasVariableHeightRows){
var a=0,b=_numberOfRows;
if(y<_rowMinYs[0]){
return -1;
}
if(y>=_rowMinYs[_rowMinYs.length-1]){
return _numberOfRows;
}
while(true){
var _a9=a+Math.floor((b-a)/2);
if(y<_rowMinYs[_a9]){
b=_a9;
}else{
if(_a9<_numberOfRows-1&&y>=_rowMinYs[_a9+1]){
a=_a9;
}else{
return _a9;
}
}
}
}else{
return FLOOR(y/(_rowHeight+_intercellSpacing.height));
}
}
}),new objj_method(sel_getUid("_columnAtX:"),function(_aa,_ab,x){
with(_aa){
var a=0,b=_tableColumns.length;
var _af=objj_msgSend(_tableColumnViews[_tableColumns.length-1],"frame");
if(x<objj_msgSend(_tableColumnViews[0],"frame").origin.x){
return -1;
}
if(x>=_af.origin.x+_af.size.width){
return _tableColumns.length;
}
while(true){
var _b0=a+Math.floor((b-a)/2);
if(x<objj_msgSend(_tableColumnViews[_b0],"frame").origin.x){
b=_b0;
}else{
if(_b0<_tableColumns.length-1&&x>=objj_msgSend(_tableColumnViews[_b0+1],"frame").origin.x){
a=_b0;
}else{
return _b0;
}
}
}
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_b1,_b2,_b3,_b4){
with(_b1){
if(_b4){
_selectedRowIndexes=objj_msgSend(objj_msgSend(_selectedRowIndexes,"copy"),"addIndexes:",_b3);
}else{
if(objj_msgSend(_b3,"count")>0||_allowsEmptySelection){
_selectedRowIndexes=objj_msgSend(_b3,"copy");
}
}
objj_msgSend(_b1,"_drawSelection");
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_b5,_b6){
with(_b5){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_b7,_b8){
with(_b7){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("deselectAll:"),function(_b9,_ba,_bb){
with(_b9){
if(!_allowsEmptySelection||objj_msgSend(_selectedRowIndexes,"count")===0||((_delegateSelectorsCache&_4)&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",_b9))){
return;
}
objj_msgSend(_b9,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSet"),NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,_b9,nil);
}
}),new objj_method(sel_getUid("editColumn:row:withEvent:select:"),function(_bc,_bd,_be,_bf,_c0,_c1){
with(_bc){
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(_c2,_c3,_c4){
with(_c2){
var _c5;
if(_allowsMultipleSelection){
_c5=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(_c4,_selectionStartRow),ABS(_c4-_selectionStartRow)+1));
}else{
if(_c4>=0&&_c4<_numberOfRows){
_c5=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_c4);
}else{
_c5=objj_msgSend(CPIndexSet,"indexSet");
}
}
if(_allowsMultipleSelection&&_selectionModifier&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
var _c6=objj_msgSend(_c5,"copy"),_c7=objj_msgSend(_c5,"copy");
objj_msgSend(_c7,"removeIndexes:",_previousSelectedRowIndexes);
objj_msgSend(_c6,"removeIndexes:",_c7);
objj_msgSend(_c5,"addIndexes:",_previousSelectedRowIndexes);
objj_msgSend(_c5,"removeIndexes:",_c6);
}
if(!objj_msgSend(_c5,"isEqualToIndexSet:",_selectedRowIndexes)){
if((_delegateSelectorsCache&_4)&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",_c2)){
return;
}
if(_delegateSelectorsCache&_6){
_c5=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",_c2,_c5);
}else{
if(_delegateSelectorsCache&_2){
var _c8=[];
objj_msgSend(_c5,"getIndexes:maxCount:inIndexRange:",_c8,Number.MAX_VALUE,nil);
for(var i=0;i<_c8.length;i++){
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",_c2,_c8[i])){
objj_msgSend(_c5,"removeIndex:",_c8[i]);
}
}
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(_c5,"count")===0){
return;
}
if(!objj_msgSend(_c5,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(_c2,"selectRowIndexes:byExtendingSelection:",_c5,NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,_c2,nil);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_ca,_cb,_cc){
with(_ca){
objj_msgSend(_ca,"trackSelection:",_cc);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_cd,_ce,_cf){
with(_cd){
_doubleAction=_cf;
}
}),new objj_method(sel_getUid("doubleAction"),function(_d0,_d1){
with(_d0){
return _doubleAction;
}
}),new objj_method(sel_getUid("clickedColumn"),function(_d2,_d3){
with(_d2){
return _clickedColumn;
}
}),new objj_method(sel_getUid("clickedRow"),function(_d4,_d5){
with(_d4){
return _clickedRow;
}
}),new objj_method(sel_getUid("trackSelection:"),function(_d6,_d7,_d8){
with(_d6){
var _d9=objj_msgSend(_d8,"type"),_da=objj_msgSend(_d6,"convertPoint:fromView:",objj_msgSend(_d8,"locationInWindow"),nil),_db=MAX(0,MIN(_numberOfRows-1,objj_msgSend(_d6,"_rowAtY:",_da.y)));
if(_d9==CPLeftMouseUp){
_clickedRow=objj_msgSend(_d6,"rowAtPoint:",_da);
_clickedColumn=objj_msgSend(_d6,"columnAtPoint:",_da);
if(objj_msgSend(_d8,"clickCount")===2){
CPLog.warn("edit?!");
objj_msgSend(_d6,"sendAction:to:",_doubleAction,_target);
}else{
if(!objj_msgSend(_previousSelectedRowIndexes,"isEqualToIndexSet:",_selectedRowIndexes)){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionDidChangeNotification,_d6,nil);
}
objj_msgSend(_d6,"sendAction:to:",_action,_target);
}
return;
}
if(_d9==CPLeftMouseDown){
_previousSelectedRowIndexes=_selectedRowIndexes;
_selectionModifier=objj_msgSend(_d8,"modifierFlags");
if(_selectionModifier&CPShiftKeyMask){
_selectionStartRow=(ABS(objj_msgSend(_previousSelectedRowIndexes,"firstIndex")-_db)<ABS(objj_msgSend(_previousSelectedRowIndexes,"lastIndex")-_db))?objj_msgSend(_previousSelectedRowIndexes,"firstIndex"):objj_msgSend(_previousSelectedRowIndexes,"lastIndex");
}else{
_selectionStartRow=_db;
}
objj_msgSend(_d6,"_updateSelectionWithMouseAtRow:",_db);
}else{
if(_d9==CPLeftMouseDragged){
objj_msgSend(_d6,"_updateSelectionWithMouseAtRow:",_db);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_d6,sel_getUid("trackSelection:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_drawSelection"),function(_dc,_dd){
with(_dc){
if(!_currentlySelected){
_currentlySelected=objj_msgSend(CPIndexSet,"indexSet");
_selectionViews=[];
_selectionViewsPool=[];
}
var _de=objj_msgSend(_currentlySelected,"copy"),_df=[];
objj_msgSend(_de,"removeIndexes:",_selectedRowIndexes);
objj_msgSend(_de,"getIndexes:maxCount:inIndexRange:",_df,Number.MAX_VALUE,nil);
var _e0=objj_msgSend(_selectedRowIndexes,"copy"),_e1=[];
objj_msgSend(_e0,"removeIndexes:",_currentlySelected);
objj_msgSend(_e0,"getIndexes:maxCount:inIndexRange:",_e1,Number.MAX_VALUE,nil);
for(var i=0;i<_df.length;i++){
var row=_df[i];
for(var _e4=0;_e4<_tableColumns.length;_e4++){
if(objj_msgSend(_tableCells[_e4][row],"respondsToSelector:",sel_getUid("highlight:"))){
objj_msgSend(_tableCells[_e4][row],"highlight:",NO);
}
}
}
for(var i=0;i<_e1.length;i++){
var row=_e1[i];
for(var _e4=0;_e4<_tableColumns.length;_e4++){
if(objj_msgSend(_tableCells[_e4][row],"respondsToSelector:",sel_getUid("highlight:"))){
objj_msgSend(_tableCells[_e4][row],"highlight:",YES);
}
}
}
for(var i=0;i<_e1.length;i++){
var _e5=_e1[i],_e6;
if(_df.length>0){
_e6=_selectionViews[_df.pop()];
}else{
if(_selectionViewsPool.length>0){
_e6=_selectionViewsPool.pop();
objj_msgSend(_dc,"addSubview:positioned:relativeTo:",_e6,CPWindowBelow,nil);
}else{
_e6=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_e6,"setBackgroundColor:",objj_msgSend(CPColor,"alternateSelectedControlColor"));
objj_msgSend(_dc,"addSubview:positioned:relativeTo:",_e6,CPWindowBelow,nil);
}
}
_selectionViews[_e5]=_e6;
var _e7=objj_msgSend(_dc,"rectOfRow:",_e5);
_e7.size.height+=_intercellSpacing.height-1;
objj_msgSend(_e6,"setFrame:",_e7);
}
for(var i=0;i<_df.length;i++){
var row=_df[i],_e6=_selectionViews[row];
objj_msgSend(_e6,"removeFromSuperview");
_selectionViewsPool.push(_e6);
}
_currentlySelected=objj_msgSend(_selectedRowIndexes,"copy");
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_e8,_e9){
with(_e8){
}
})]);
var _ea="CPTableViewDataSourceKey",_eb="CPTableViewDelegateKey",_ec="CPTableViewHeaderViewKey",_ed="CPTableViewTableColumnsKey",_ee="CPTableViewRowHeightKey",_ef="CPTableViewIntercellSpacingKey",_f0="CPTableViewMultipleSelectionKey",_f1="CPTableViewEmptySelectionKey";
var _8=objj_getClass("CPTableView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_f2,_f3,_f4){
with(_f2){
if(_f2=objj_msgSendSuper({receiver:_f2,super_class:objj_getClass("CPControl")},"initWithCoder:",_f4)){
objj_msgSend(_f2,"_init");
_dataSource=objj_msgSend(_f4,"decodeObjectForKey:",_ea);
_delegate=objj_msgSend(_f4,"decodeObjectForKey:",_eb);
_rowHeight=objj_msgSend(_f4,"decodeFloatForKey:",_ee);
_intercellSpacing=objj_msgSend(_f4,"decodeSizeForKey:",_ef);
_allowsMultipleSelection=objj_msgSend(_f4,"decodeBoolForKey:",_f0);
_allowsEmptySelection=objj_msgSend(_f4,"decodeBoolForKey:",_f1);
var _f5=objj_msgSend(_f4,"decodeObjectForKey:",_ed);
for(var i=0;i<_f5.length;i++){
objj_msgSend(_f2,"addTableColumn:",_f5[i]);
}
}
return _f2;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f7,_f8,_f9){
with(_f7){
objj_msgSendSuper({receiver:_f7,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_f9);
objj_msgSend(_f9,"encodeObject:forKey:",_dataSource,_ea);
objj_msgSend(_f9,"encodeObject:forKey:",_delegate,_eb);
objj_msgSend(_f9,"encodeObject:forKey:",_tableColumns,_ed);
objj_msgSend(_f9,"encodeFloat:forKey:",_rowHeight,_ee);
objj_msgSend(_f9,"encodeSize:forKey:",_intercellSpacing,_ef);
objj_msgSend(_f9,"encodeBool:forKey:",_allowsMultipleSelection,_f0);
objj_msgSend(_f9,"encodeBool:forKey:",_allowsEmptySelection,_f1);
}
})]);
var _8=objj_getClass("CPColor");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _9=_8.isa;
class_addMethods(_9,[new objj_method(sel_getUid("alternateSelectedControlColor"),function(_fa,_fb){
with(_fa){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.22,0.46,0.84,1]);
}
}),new objj_method(sel_getUid("secondarySelectedControlColor"),function(_fc,_fd){
with(_fc){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0.83,0.83,0.83,1]);
}
})]);
