I;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;17615;
var _1="CPMainCibFile",_2="Main cib file base name";
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _3=objj_allocateClassPair(CPResponder,"CPApplication"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString")]);
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
if(_documentController){
objj_msgSend(_documentController,"newDocument:",_16);
}
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_16);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("run"),function(_1d,_1e){
with(_1d){
objj_msgSend(_1d,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"runModalSession:",objj_msgSend(_1f,"beginModalSessionForWindow:",_21));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_22,_23,_24){
with(_22){
if(!_currentSession){
return;
}
_currentSession._state=_24;
_currentSession=_currentSession._previous;
objj_msgSend(_22,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_25,_26){
with(_25){
var _27=_eventListeners.length;
while(_27--){
if(_eventListeners[_27]._callback===_28){
_eventListeners.splice(_27,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_29,_2a){
with(_29){
objj_msgSend(_29,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_2b,_2c){
with(_2b){
objj_msgSend(_2b,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_2d,_2e,_2f){
with(_2d){
return _30(_2f,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_31,_32,_33){
with(_31){
_33._previous=_currentSession;
_currentSession=_33;
var _34=_33._window;
objj_msgSend(_34,"center");
objj_msgSend(_34,"makeKeyAndOrderFront:",_31);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_28,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_35,_36){
with(_35){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_37,_38,_39){
with(_37){
if(objj_msgSend(_mainMenu,"performKeyEquivalent:",_39)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendEvent:"),function(_3a,_3b,_3c){
with(_3a){
if(objj_msgSend(_3c,"type")==CPKeyDown&&objj_msgSend(_3c,"modifierFlags")&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(objj_msgSend(_3c,"characters"),"length")>0&&objj_msgSend(_3a,"_handleKeyEquivalent:",_3c)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_3c,"type"))){
_eventListeners.pop()._callback(_3c);
}
return;
}
objj_msgSend(objj_msgSend(_3c,"window"),"sendEvent:",_3c);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_delegate,"respondsToSelector:",_3f)){
objj_msgSend(_delegate,"performSelector:",_3f);
}else{
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_3f);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_40,_41){
with(_40){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_42,_43){
with(_42){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_44,_45,_46){
with(_44){
return _windows[_46];
}
}),new objj_method(sel_getUid("windows"),function(_47,_48){
with(_47){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_49,_4a){
with(_49){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_4b,_4c,_4d){
with(_4b){
_mainMenu=_4d;
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_4e);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_51,_52,_53){
with(_51){
objj_msgSend(_51,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_54,_55,_56){
with(_54){
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_57,_58,_59,_5a){
with(_57){
if(!_59){
return NO;
}
if(objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPResponder")},"tryToPerform:with:",_59,_5a)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_59)){
objj_msgSend(_delegate,"performSelector:withObject:",_59,_5a);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_5b,_5c,_5d,_5e,_5f){
with(_5b){
var _60=objj_msgSend(_5b,"targetForAction:to:from:",_5d,_5e,_5f);
if(!_60){
return NO;
}
objj_msgSend(_60,"performSelector:withObject:",_5d,_5f);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_61,_62,_63,_64,_65){
with(_61){
if(!_63){
return nil;
}
if(_64){
return _64;
}
return objj_msgSend(_61,"targetForAction:",_63);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_66,_67,_68,_69){
with(_66){
var _6a=objj_msgSend(_68,"firstResponder"),_6b=YES;
while(_6a){
if(objj_msgSend(_6a,"respondsToSelector:",_69)){
return _6a;
}
if(_6a==_68){
_6b=NO;
}
_6a=objj_msgSend(_6a,"nextResponder");
}
if(_6b&&objj_msgSend(_68,"respondsToSelector:",_69)){
return _68;
}
var _6c=objj_msgSend(_68,"delegate");
if(objj_msgSend(_6c,"respondsToSelector:",_69)){
return _6c;
}
var _6d=objj_msgSend(_68,"windowController");
if(objj_msgSend(_6d,"respondsToSelector:",_69)){
return _6d;
}
var _6e=objj_msgSend(_6d,"document");
if(_6e!=_6c&&objj_msgSend(_6e,"respondsToSelector:",_69)){
return _6e;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_6f,_70,_71){
with(_6f){
if(!_71){
return nil;
}
var _72=objj_msgSend(_6f,"_targetForWindow:action:",objj_msgSend(_6f,"keyWindow"),_71);
if(_72){
return _72;
}
_72=objj_msgSend(_6f,"_targetForWindow:action:",objj_msgSend(_6f,"mainWindow"),_71);
if(_72){
return _72;
}
if(objj_msgSend(_6f,"respondsToSelector:",_71)){
return _6f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_71)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_71)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_73,_74,_75,_76,_77,_78,_79){
with(_73){
_eventListeners.push(_7a(_76,_75));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_7b,_7c,_7d,_7e,_7f,_80,_81,_82){
with(_7b){
_eventListeners.push(_7a(_7f,function(_83){
objj_msgSend(_7d,_7e,_83);
}));
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_84,_85,_86,_87,_88,_89,_8a){
with(_84){
objj_msgSend(_87,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_86,_88,_89,_8a);
}
}),new objj_method(sel_getUid("arguments"),function(_8b,_8c){
with(_8b){
if(_fullArgsString!=window.location.hash){
objj_msgSend(_8b,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_8d,_8e,_8f){
with(_8d){
if(!_8f||_8f.length==0){
_args=[];
window.location.hash="#";
return;
}
if(objj_msgSend(_8f,"class")!=CPArray){
_8f=objj_msgSend(CPArray,"arrayWithObject:",_8f);
}
_args=_8f;
var _90=objj_msgSend(_args,"copy");
for(var i=0,_92=_90.length;i<_92;i++){
_90[i]=encodeURIComponent(_90[i]);
}
var _93=objj_msgSend(_90,"componentsJoinedByString:","/");
window.location.hash="#"+_93;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_94,_95){
with(_94){
_fullArgsString=window.location.hash;
var _96=_fullArgsString.replace("#","").split("/").slice(0);
for(var i=0,_98=_96.length;i<_98;i++){
_96[i]=decodeURIComponent(_96[i]);
}
_args=_96;
}
}),new objj_method(sel_getUid("namedArguments"),function(_99,_9a){
with(_99){
return _namedArgs;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedApplication"),function(_9b,_9c){
with(_9b){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _30=function(_9d,_9e){
return {_window:_9d,_state:CPRunContinuesResponse,_previous:nil};
};
var _7a=function(_9f,_a0){
return {_mask:_9f,_callback:_a0};
};
var _28=function(_a1){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_28,CPAnyEventMask,nil,0,NO);
var _a2=objj_msgSend(_a1,"window"),_a3=CPApp._currentSession;
if(_a2==_a3._window||objj_msgSend(_a2,"worksWhenModal")){
objj_msgSend(_a2,"sendEvent:",_a1);
}
};
CPApplicationMain=function(_a4,_a5){
var _a6=objj_msgSend(CPBundle,"mainBundle"),_a7=objj_msgSend(_a6,"principalClass");
if(!_a7){
_a7=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_a7,"sharedApplication");
if(!_a4){
var _a4=objj_msgSend(CPApp,"arguments");
if(objj_msgSend(_a4,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
}
if(!_a5){
var _a8=window.location.search.substring(1).split("&");
_a5=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_a8.length;i++){
var _aa=_a8[i].indexOf("=");
if(_aa==-1){
objj_msgSend(_a5,"setObject:forKey:","",_a8[i]);
}else{
objj_msgSend(_a5,"setObject:forKey:",_a8[i].substring(_aa+1),_a8[i].substring(0,_aa));
}
}
}
CPApp._args=_a4;
CPApp._namedArgs=_a5;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _ab=nil;
var _3=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("actions"),function(_ac,_ad){
with(_ac){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_ae,_af){
with(_ae){
if(!_ab){
_ab=objj_msgSend(_ae,"actions");
}
while(_ab.length){
var _b0=_ab.shift();
if(objj_msgSend(_ae,_b0)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_b1,_b2){
with(_b1){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_b3,_b4){
with(_b3){
var _b5=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:","Aristo.blend"));
objj_msgSend(_b5,"loadWithDelegate:",_b3);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(_b6,_b7,_b8){
with(_b6){
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo"));
objj_msgSend(_b6,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(_b9,_ba){
with(_b9){
var _bb=objj_msgSend(CPBundle,"mainBundle"),_bc=objj_msgSend(_bb,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_bb,"objectForInfoDictionaryKey:",_2);
if(_bc){
objj_msgSend(_bb,"loadCibFile:externalNameTable:loadDelegate:",_bc,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),_b9);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_bd,_be,_bf){
with(_bd){
objj_msgSend(_bd,"performActions");
}
})]);
