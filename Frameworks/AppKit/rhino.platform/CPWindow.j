I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;10;CPScreen.ji;18;CPPlatformWindow.jc;44549;
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
var _1=20,_2=19,_3=10,_4=10,_5=5,_6=nil;
var _7=nil,_8=nil;
var _9=objj_allocateClassPair(CPResponder,"CPWindow"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession")]);
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
}),new objj_method(sel_getUid("awakeFromCib"),function(_15,_16){
with(_15){
if(_initialFirstResponder){
objj_msgSend(_15,"makeFirstResponder:",_initialFirstResponder);
}
_keyViewLoopIsDirty=!objj_msgSend(_15,"_hasKeyViewLoop");
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_17,_18,_19){
with(_17){
if(_windowView===_19){
return;
}
var _1a=_windowView;
_windowView=_19;
if(_1a){
objj_msgSend(_1a,"_setWindow:",nil);
objj_msgSend(_1a,"noteToolbarChanged");
}
if(_windowView){
var _1b=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_1b.origin=objj_msgSend(_17,"convertBaseToGlobal:",_1b.origin);
objj_msgSend(_windowView,"_setWindow:",_17);
objj_msgSend(_windowView,"setNextResponder:",_17);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_17,"setFrame:",objj_msgSend(_17,"frameRectForContentRect:",_1b));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_1c,_1d,_1e){
with(_1c){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_1e=!!_1e;
if(_isFullPlatformWindow===_1e){
return;
}
_isFullPlatformWindow=_1e;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_1c,"contentRectForFrameRect:",objj_msgSend(_1c,"frame")),objj_msgSend(_1c,"hasShadow"),objj_msgSend(_1c,"level"));
var _1f=objj_msgSend(objj_msgSend(_1c,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_20=objj_msgSend(objj_msgSend(_1f,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_1c,"_setWindowView:",_20);
objj_msgSend(_1c,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_1c,"setHasShadow:",NO);
objj_msgSend(_1c,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_1c,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _20=_fullPlatformWindowSession.windowView;
objj_msgSend(_1c,"_setWindowView:",_20);
objj_msgSend(_1c,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_1c,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_1c,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_1c,"setFrame:",objj_msgSend(_20,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_21,_22){
with(_21){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_23,_24){
with(_23){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_27);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(_windowView,"frameRectForContentRect:",_2a);
}
}),new objj_method(sel_getUid("frame"),function(_2b,_2c){
with(_2b){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_2d,_2e,_2f,_30,_31){
with(_2d){
if(_31){
var _32=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_2d,_2f);
objj_msgSend(_32,"startAnimation");
}else{
objj_msgSend(_2d,"setFrameOrigin:",_2f.origin);
objj_msgSend(_2d,"setFrameSize:",_2f.size);
}
}
}),new objj_method(sel_getUid("setFrame:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"setFrame:display:animate:",_35,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_36,_37,_38){
with(_36){
var _39=_frame.origin;
if((_39.x==_38.x&&_39.y==_38.y)){
return;
}
_39.x=_38.x;
_39.y=_38.y;
if(objj_msgSend(_36,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentOrigin:",_39);
}else{
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_36);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3a,_3b,_3c){
with(_3a){
_3c={width:MIN(MAX(_3c.width,_minSize.width),_maxSize.width),height:MIN(MAX(_3c.height,_minSize.height),_maxSize.height)};
if((_frame.size.width==_3c.width&&_frame.size.height==_3c.height)){
return;
}
_frame.size=_3c;
objj_msgSend(_windowView,"setFrameSize:",_3c);
if(objj_msgSend(_3a,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentSize:",_3c);
}
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_3c.width+_2,height:_4+_3c.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_3a);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_platformWindow,"orderFront:",_3d);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_3d,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_40,_41,_42){
with(_40){
}
}),new objj_method(sel_getUid("orderOut:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_43);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_43,nil);
if(objj_msgSend(CPApp,"keyWindow")==_43){
objj_msgSend(_43,"resignKeyWindow");
CPApp._keyWindow=nil;
}
if(objj_msgSend(_43,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"orderOut:",_43);
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_46,_47,_48,_49){
with(_46){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_48,_46,CPApp._windows[_49]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_4a,_4b,_4c){
with(_4a){
_level=_4c;
if(objj_msgSend(_4a,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_4c);
}
}
}),new objj_method(sel_getUid("level"),function(_4d,_4e){
with(_4d){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_4f,_50){
with(_4f){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_51,_52){
with(_51){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_55);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_56,_57){
with(_56){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_5a);
}
}),new objj_method(sel_getUid("setContentView:"),function(_5b,_5c,_5d){
with(_5b){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _5e=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_contentView=_5d;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_5b,"contentRectForFrameRect:",_5e));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_5f,_60){
with(_5f){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_windowView,"setBackgroundColor:",_63);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_64,_65){
with(_64){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_66,_67,_68){
with(_66){
if(CGSizeEqualToSize(_minSize,_68)){
return;
}
_minSize=CGSizeCreateCopy(_68);
var _69=CGSizeMakeCopy(objj_msgSend(_66,"frame").size),_6a=NO;
if(_69.width<_minSize.width){
_69.width=_minSize.width;
_6a=YES;
}
if(_69.height<_minSize.height){
_69.height=_minSize.height;
_6a=YES;
}
if(_6a){
objj_msgSend(_66,"setFrameSize:",_69);
}
}
}),new objj_method(sel_getUid("minSize"),function(_6b,_6c){
with(_6b){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_6d,_6e,_6f){
with(_6d){
if(CGSizeEqualToSize(_maxSize,_6f)){
return;
}
_maxSize=CGSizeCreateCopy(_6f);
var _70=CGSizeMakeCopy(objj_msgSend(_6d,"frame").size),_71=NO;
if(_70.width>_maxSize.width){
_70.width=_maxSize.width;
_71=YES;
}
if(_70.height>_maxSize.height){
_70.height=_maxSize.height;
_71=YES;
}
if(_71){
objj_msgSend(_6d,"setFrameSize:",_70);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_72,_73){
with(_72){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_74,_75){
with(_74){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_76,_77,_78){
with(_76){
if(_hasShadow===_78){
return;
}
_hasShadow=_78;
if(objj_msgSend(_76,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_platformWindow,"setHasShadow:",_78);
}
if(_hasShadow){
var _79=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_79)+_2,_3+CGRectGetHeight(_79)+_4));
if(!_6){
var _7a=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7a,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}else{
if(_shadowView){
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7b,_7c,_7d){
with(_7b){
_delegate=_7d;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _7e=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_7e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_7b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_7e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_7b);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_7e,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_7b);
}
}
}),new objj_method(sel_getUid("delegate"),function(_7f,_80){
with(_7f){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_81,_82,_83){
with(_81){
_windowController=_83;
}
}),new objj_method(sel_getUid("windowController"),function(_84,_85){
with(_84){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_86,_87,_88){
with(_86){
if(objj_msgSend(_delegate,"respondsToSelector:",_88)){
objj_msgSend(_delegate,"performSelector:",_88);
}else{
objj_msgSendSuper({receiver:_86,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_88);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_89,_8a){
with(_89){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_8b,_8c,_8d){
with(_8b){
if(_firstResponder==_8d){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_8d||!objj_msgSend(_8d,"acceptsFirstResponder")||!objj_msgSend(_8d,"becomeFirstResponder")){
_firstResponder=_8b;
return NO;
}
_firstResponder=_8d;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_8e,_8f){
with(_8e){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_90,_91){
with(_90){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_92,_93,_94){
with(_92){
_acceptsMouseMovedEvents=_94;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_95,_96){
with(_95){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_97,_98,_99){
with(_97){
_ignoresMouseEvents=_99;
}
}),new objj_method(sel_getUid("title"),function(_9a,_9b){
with(_9a){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_9c,_9d,_9e){
with(_9c){
_title=_9e;
objj_msgSend(_windowView,"setTitle:",_9e);
objj_msgSend(_9c,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_9f,_a0,_a1){
with(_9f){
objj_msgSend(_9f,"setRepresentedFilename:",_a1);
objj_msgSend(_9f,"setTitle:",objj_msgSend(_a1,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_a2,_a3,_a4){
with(_a2){
objj_msgSend(_a2,"setRepresentedURL:",_a4);
}
}),new objj_method(sel_getUid("representedFilename"),function(_a5,_a6){
with(_a5){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_a7,_a8,_a9){
with(_a7){
_representedURL=_a9;
}
}),new objj_method(sel_getUid("representedURL"),function(_aa,_ab){
with(_aa){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_ac,_ad){
with(_ac){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_ae,_af,_b0){
with(_ae){
_isMovableByWindowBackground=_b0;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_b1,_b2){
with(_b1){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_b3,_b4){
with(_b3){
var _b5=objj_msgSend(_b3,"frame").size,_b6=objj_msgSend(_platformWindow,"contentBounds").size;
objj_msgSend(_b3,"setFrameOrigin:",CGPointMake((_b6.width-_b5.width)/2,(_b6.height-_b5.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_b7,_b8,_b9){
with(_b7){
var _ba=objj_msgSend(_b9,"type"),_bb=objj_msgSend(_b9,"locationInWindow");
switch(_ba){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_b7,"firstResponder"),"keyUp:",_b9);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_b7,"firstResponder"),"keyDown:",_b9);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_bb),"scrollWheel:",_b9);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_bb),"mouseUp:",_b9);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_b9);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_bb);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_b7,"makeFirstResponder:",_leftMouseDownView);
}
var _bc=objj_msgSend(_b9,"window");
if(objj_msgSend(_bc,"isKeyWindow")||objj_msgSend(_bc,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_b9);
}else{
objj_msgSend(_b7,"makeKeyAndOrderFront:",_b7);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_b9)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_b9);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_bb),"mouseDragged:",_b9);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_b9);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_b9);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_bb);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_b9);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_b9);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _bd=objj_msgSend(_windowView,"hitTest:",_bb);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_bd){
return objj_msgSend(_bd,"mouseMoved:",_b9);
}
var _be=_bd,_bf=[];
while(_be){
_bf.unshift(_be);
_be=objj_msgSend(_be,"superview");
}
var _c0=MIN(_mouseEnteredStack.length,_bf.length);
while(_c0--){
if(_mouseEnteredStack[_c0]===_bf[_c0]){
break;
}
}
var _c1=_c0+1,_c2=_mouseEnteredStack.length;
if(_c1<_c2){
var _c3=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_bb,objj_msgSend(_b9,"modifierFlags"),objj_msgSend(_b9,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_c1<_c2;++_c1){
objj_msgSend(_mouseEnteredStack[_c1],"mouseExited:",_c3);
}
}
_c1=_c0+1;
_c2=_bf.length;
if(_c1<_c2){
var _c3=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_bb,objj_msgSend(_b9,"modifierFlags"),objj_msgSend(_b9,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_c1<_c2;++_c1){
objj_msgSend(_bf[_c1],"mouseEntered:",_c3);
}
}
_mouseEnteredStack=_bf;
objj_msgSend(_bd,"mouseMoved:",_b9);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_c4,_c5){
with(_c4){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_c6,_c7){
with(_c6){
if(_firstResponder!=_c6&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_c8,_c9){
with(_c8){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_ca,_cb){
with(_ca){
return objj_msgSend(CPApp,"keyWindow")==_ca;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_cc,_cd,_ce){
with(_cc){
objj_msgSend(_cc,"orderFront:",_cc);
objj_msgSend(_cc,"makeKeyWindow");
objj_msgSend(_cc,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_cf,_d0){
with(_cf){
if(!objj_msgSend(_cf,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_cf;
objj_msgSend(_cf,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_d1,_d2){
with(_d1){
if(_firstResponder!=_d1&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_d1);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_d3,_d4,_d5,_d6,_d7,_d8,_d9,_da,_db){
with(_d3){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_d5,_d3,objj_msgSend(_d3,"convertBaseToGlobal:",_d6),_d7,_d8,_d9,_da,_db);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(_dc,_dd,_de){
with(_dc){
if(!_de){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_de);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(_df,_e0,_e1){
with(_df){
if(!_e1){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_e1);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_e2,_e3,_e4,_e5,_e6,_e7,_e8,_e9,_ea){
with(_e2){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_e4,_e2,objj_msgSend(_e2,"convertBaseToGlobal:",_e5),_e6,_e7,_e8,_e9,_ea);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_eb,_ec,_ed){
with(_eb){
if(!_ed){
return;
}
objj_msgSend(_eb,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_ed);
objj_msgSend(_eb,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_ee,_ef){
with(_ee){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_f0,_f1){
with(_f0){
objj_msgSend(_f0,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_f2,_f3,_f4){
with(_f2){
if(_isDocumentEdited==_f4){
return;
}
_isDocumentEdited=_f4;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_f5,_f6){
with(_f5){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(_f7,_f8,_f9){
with(_f7){
if(_isDocumentSaving==_f9){
return;
}
_isDocumentSaving=_f9;
objj_msgSend(_f7,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(_fa,_fb){
with(_fa){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(_fc,_fd){
with(_fc){
if(!objj_msgSend(_fc,"isMainWindow")){
return;
}
var _fe=objj_msgSend(CPApp,"mainMenu"),_ff=objj_msgSend(_fe,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_ff==CPNotFound){
return;
}
var item=objj_msgSend(_fe,"itemAtIndex:",_ff);
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
}),new objj_method(sel_getUid("performClose:"),function(self,_cmd,_103){
with(self){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",self)){
return;
}
}else{
if(objj_msgSend(self,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(self,"windowShouldClose:",self)){
return;
}
}
objj_msgSend(self,"close");
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
}),new objj_method(sel_getUid("setToolbar:"),function(self,_cmd,_114){
with(self){
if(_toolbar===_114){
return;
}
objj_msgSend(objj_msgSend(_114,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_114;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_cmd,_117){
with(self){
var _118=objj_msgSend(self,"toolbar");
objj_msgSend(_118,"setVisible:",!objj_msgSend(_118,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_cmd){
with(self){
var _11b=CGRectMakeCopy(objj_msgSend(self,"frame")),_11c;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_11c=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_11c=CGRectMakeCopy(objj_msgSend(self,"frame"));
_11c.origin=_11b.origin;
}
objj_msgSend(self,"setFrame:",_11c);
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_cmd){
with(self){
var _11f=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_120=CGRectMakeCopy(objj_msgSend(_attachedSheet,"frame"));
_120.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_11f);
_120.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_120))/2);
objj_msgSend(_attachedSheet,"setFrameOrigin:",_120.origin);
}
}),new objj_method(sel_getUid("_animateAttachedSheet"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_cmd,_125,_126,_127,_128){
with(self){
_attachedSheet=_125;
_125._isSheet=YES;
objj_msgSend(self,"_setAttachedSheetFrameOrigin");
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_125,self);
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_cmd){
with(self){
return _attachedSheet;
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
}),new objj_method(sel_getUid("keyDown:"),function(self,_cmd,_133){
with(self){
if(!objj_msgSend(self,"performKeyEquivalent:",_133)){
objj_msgSend(self,"interpretKeyEvents:",[_133]);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(self,_cmd,_136){
with(self){
if(_defaultButton&&_defaultButtonEnabled){
objj_msgSend(_defaultButton,"performClick:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(self,_cmd,_139){
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
var _13e=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_13e);
for(var i=0,_140=objj_msgSend(_13e,"count");i<_140;i++){
if(_13e[i]._nextKeyView){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_cmd){
with(self){
var _143=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_143);
var _144=objj_msgSend(_143,"sortedArrayUsingFunction:context:",_145,_contentView),_146=objj_msgSend(_144,"count");
for(var i=0;i<_146;i++){
objj_msgSend(_144[i],"setNextKeyView:",_144[(i+1)%_146]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("_appendSubviewsOf:toArray:"),function(self,_cmd,_14a,_14b){
with(self){
var _14c=objj_msgSend(_14a,"subviews"),_14d=objj_msgSend(_14c,"count");
while(_14d--){
objj_msgSend(self,"_appendSubviewsOf:toArray:",_14c[_14d],_14b);
}
objj_msgSend(_14b,"addObject:",_14a);
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_cmd,_150){
with(self){
if(_autorecalculatesKeyViewLoop===_150){
return;
}
_autorecalculatesKeyViewLoop=_150;
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_cmd){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_cmd,_155){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewFollowingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_cmd,_158){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewPrecedingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_cmd,_15b){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_15b,"nextValidKeyView"));
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_cmd,_15e){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_15e,"previousValidKeyView"));
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_cmd,_161){
with(self){
objj_msgSend(self,"setDefaultButton:",_161);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_cmd){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_cmd,_166){
with(self){
objj_msgSend(_defaultButton,"setDefaultButton:",NO);
_defaultButton=_166;
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
var _173=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_173,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_cmd,_176){
with(self){
if(_176&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_176===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_cmd,_179){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_cmd,_17c,_17d){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_styleMask),"frameRectForContentRect:",_17c);
}
})]);
var _145=function(a,b,_180){
var _181=objj_msgSend(a,"convertRect:toView:",objj_msgSend(a,"bounds"),nil),_182=objj_msgSend(b,"convertRect:toView:",objj_msgSend(b,"bounds"),nil);
if(CGRectGetMinY(_181)<CGRectGetMinY(_182)){
return -1;
}else{
if(CGRectGetMinY(_181)==CGRectGetMinY(_182)&&CGRectGetMinX(_181)<CGRectGetMinX(_182)){
return -1;
}else{
if(CGRectGetMinX(_181)==CGRectGetMinX(_182)&&CGRectGetMinX(_181)==CGRectGetMinX(_182)){
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
class_addMethods(_9,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_cmd,_187){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _188=objj_msgSend(_platformWindow,"contentBounds"),_189=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_188)-_187.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_188)-_187.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_189.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_189.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_189.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_189.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_189);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_cmd,_18e){
with(self){
_autoresizingMask=_18e;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_cmd){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_cmd,_193){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_193):objj_msgSend(self,"convertBaseToScreen:",_193);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_cmd,_196){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_196):objj_msgSend(self,"convertScreenToBase:",_196);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_cmd,_199){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _199;
}
var _19a=objj_msgSend(self,"frame").origin;
return {x:_199.x+_19a.x,y:_199.y+_19a.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_cmd,_19d){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _19d;
}
var _19e=objj_msgSend(self,"frame").origin;
return {x:_19d.x-_19e.x,y:_19d.y-_19e.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_cmd,_1a1){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1a1));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_cmd,_1a4){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1a4));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_cmd,_1a7){
with(self){
if(_1a7&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1a7;
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
}),new objj_method(sel_getUid("undo:"),function(self,_cmd,_1ae){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_cmd,_1b1){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_cmd,_1b4){
with(self){
return CGRectContainsPoint(_frame,_1b4);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setFullBridge:"),function(self,_cmd,_1b7){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1b7);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_cmd){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_cmd,_1bc){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_1bc);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_cmd,_1bf){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_1bf);
}
})]);
var _1c0=function(_1c1,_1c2,_1c3){
return _1c1+(_1c2-_1c1)*_1c3;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_cmd,_1c6,_1c7){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_1c6;
_targetFrame=CGRectMakeCopy(_1c7);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_cmd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_cmd,_1cc){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_1cc);
var _1cd=objj_msgSend(self,"currentValue");
if(_1cd==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_1c0(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_1cd),_1c0(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_1cd)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_1c0(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_1cd),_1c0(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_1cd)));
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_1ce,_1cf,_1d0,_1d1){
return {windowView:_1ce,contentRect:_1cf,hasShadow:_1d0,level:_1d1};
};
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.j