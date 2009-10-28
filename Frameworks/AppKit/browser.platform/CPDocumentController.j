I;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.ji;13;CPOpenPanel.jc;5744;
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
