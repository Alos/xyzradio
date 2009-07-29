I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;6761;
var _1=objj_allocateClassPair(CPResponder,"CPWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window"),new objj_ivar("_document"),new objj_ivar("_shouldCloseDocument"),new objj_ivar("_cibOwner"),new objj_ivar("_windowCibName"),new objj_ivar("_windowCibPath"),new objj_ivar("_isWindowLoading"),new objj_ivar("_shouldDisplayWindowWhenLoaded")]);
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
if(_7){
objj_msgSend(_5,"windowDidLoad");
}
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
if(objj_msgSend(_13,"isWindowLoaded")){
return YES;
}
if(!objj_msgSend(_13,"isWindowLoading")){
_isWindowLoading=YES;
objj_msgSend(_13,"windowWillLoad");
objj_msgSend(CPBundle,"loadCibFile:externalNameTable:loadDelegate:",objj_msgSend(_13,"windowCibPath"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_cibOwner,CPCibOwner),_13);
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_15,_16,_17){
with(_15){
if(_window===nil&&_document!==nil&&_cibOwner===_document){
objj_msgSend(_15,"setWindow:",objj_msgSend(_document,"valueForKey:","window"));
}
objj_msgSend(_15,"synchronizeWindowTitleWithDocumentName");
objj_msgSend(_15,"windowDidLoad");
if(_shouldDisplayWindowWhenLoaded){
objj_msgSend(_15,"showWindow:",_15);
}
}
}),new objj_method(sel_getUid("showWindow:"),function(_18,_19,_1a){
with(_18){
if(!objj_msgSend(_18,"loadWindow")){
_shouldDisplayWindowWhenLoaded=YES;
return;
}
var _1b=objj_msgSend(_18,"window");
if(objj_msgSend(_1b,"respondsToSelector:",sel_getUid("becomesKeyOnlyIfNeeded"))&&objj_msgSend(_1b,"becomesKeyOnlyIfNeeded")){
objj_msgSend(_1b,"orderFront:",_1a);
}else{
objj_msgSend(_1b,"makeKeyAndOrderFront:",_1a);
}
}
}),new objj_method(sel_getUid("isWindowLoaded"),function(_1c,_1d){
with(_1c){
return _window!==nil;
}
}),new objj_method(sel_getUid("isWindowLoading"),function(_1e,_1f){
with(_1e){
return _isWindowLoading;
}
}),new objj_method(sel_getUid("window"),function(_20,_21){
with(_20){
if(!_window){
objj_msgSend(_20,"loadWindow");
}
return _window;
}
}),new objj_method(sel_getUid("setWindow:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_window,"setWindowController:",nil);
_window=_24;
objj_msgSend(_window,"setWindowController:",_22);
objj_msgSend(_window,"setNextResponder:",_22);
}
}),new objj_method(sel_getUid("windowDidLoad"),function(_25,_26){
with(_25){
objj_msgSend(_document,"windowControllerDidLoadCib:",_25);
objj_msgSend(_25,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("windowWillLoad"),function(_27,_28){
with(_27){
objj_msgSend(_document,"windowControllerWillLoadCib:",_27);
}
}),new objj_method(sel_getUid("setDocument:"),function(_29,_2a,_2b){
with(_29){
if(_document===_2b){
return;
}
var _2c=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_document){
objj_msgSend(_2c,"removeObserver:name:object:",_29,CPDocumentWillSaveNotification,_document);
objj_msgSend(_2c,"removeObserver:name:object:",_29,CPDocumentDidSaveNotification,_document);
objj_msgSend(_2c,"removeObserver:name:object:",_29,CPDocumentDidFailToSaveNotification,_document);
}
_document=_2b;
if(_document){
objj_msgSend(_2c,"addObserver:selector:name:object:",_29,sel_getUid("_documentWillSave:"),CPDocumentWillSaveNotification,_document);
objj_msgSend(_2c,"addObserver:selector:name:object:",_29,sel_getUid("_documentDidSave:"),CPDocumentDidSaveNotification,_document);
objj_msgSend(_2c,"addObserver:selector:name:object:",_29,sel_getUid("_documentDidFailToSave:"),CPDocumentDidFailToSaveNotification,_document);
objj_msgSend(_29,"setDocumentEdited:",objj_msgSend(_document,"isDocumentEdited"));
}
objj_msgSend(_29,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("_documentWillSave:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(objj_msgSend(_2d,"window"),"setDocumentSaving:",YES);
}
}),new objj_method(sel_getUid("_documentDidSave:"),function(_30,_31,_32){
with(_30){
objj_msgSend(objj_msgSend(_30,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("_documentDidFailToSave:"),function(_33,_34,_35){
with(_33){
objj_msgSend(objj_msgSend(_33,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("document"),function(_36,_37){
with(_36){
return _document;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(objj_msgSend(_38,"window"),"setDocumentEdited:",_3a);
}
}),new objj_method(sel_getUid("close"),function(_3b,_3c){
with(_3b){
objj_msgSend(objj_msgSend(_3b,"window"),"close");
}
}),new objj_method(sel_getUid("setShouldCloseDocument:"),function(_3d,_3e,_3f){
with(_3d){
_shouldCloseDocument=_3f;
}
}),new objj_method(sel_getUid("shouldCloseDocument"),function(_40,_41){
with(_40){
return _shouldCloseDocument;
}
}),new objj_method(sel_getUid("owner"),function(_42,_43){
with(_42){
return _cibOwner;
}
}),new objj_method(sel_getUid("windowCibName"),function(_44,_45){
with(_44){
if(_windowCibName){
return _windowCibName;
}
return objj_msgSend(objj_msgSend(_windowCibPath,"lastPathComponent"),"stringByDeletingPathExtension");
}
}),new objj_method(sel_getUid("windowCibPath"),function(_46,_47){
with(_46){
if(_windowCibPath){
return _windowCibPath;
}
return objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_cibOwner,"class")),"pathForResource:",_windowCibName+".cib");
}
}),new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"),function(_48,_49){
with(_48){
if(!_document||!_window){
return;
}
objj_msgSend(_window,"setTitle:",objj_msgSend(_48,"windowTitleForDocumentDisplayName:",objj_msgSend(_document,"displayName")));
}
}),new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"),function(_4a,_4b,_4c){
with(_4a){
return _4c;
}
})]);
