I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;18;CPPlatformWindow.jc;41168;
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
CPNormalWindowLevel=4;
CPFloatingWindowLevel=5;
CPSubmenuWindowLevel=6;
CPTornOffMenuWindowLevel=6;
CPMainMenuWindowLevel=8;
CPStatusWindowLevel=9;
CPModalPanelWindowLevel=10;
CPPopUpMenuWindowLevel=11;
CPDraggingWindowLevel=12;
CPScreenSaverWindowLevel=13;
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
class_addIvars(_9,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPResponder")},"init");
if(_b){
objj_msgSend(_b,"setPlatformWindow:",objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"));
_isFullPlatformWindow=NO;
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_windowNumber=objj_msgSend(CPApp._windows,"count");
CPApp._windows[_windowNumber]=_b;
_styleMask=_e;
_level=CPNormalWindowLevel;
_minSize=CGSizeMake(0,0);
_maxSize=CGSizeMake(1000000,1000000);
var _f=objj_msgSend(objj_msgSend(_b,"class"),"_windowViewClassForStyleMask:",_e);
_frame=objj_msgSend(_f,"frameRectForContentRect:",_d);
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
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_1b,_1c,_1d){
with(_1b){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_1d=!!_1d;
if(_isFullPlatformWindow===_1d){
return;
}
_isFullPlatformWindow=_1d;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_1b,"contentRectForFrameRect:",objj_msgSend(_1b,"frame")),objj_msgSend(_1b,"hasShadow"),objj_msgSend(_1b,"level"));
var _1e=objj_msgSend(objj_msgSend(_1b,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_1f=objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_1b,"_setWindowView:",_1f);
objj_msgSend(_1b,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_1b,"setHasShadow:",NO);
objj_msgSend(_1b,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_1b,"setFrame:",objj_msgSend(_platformWindow,"usableContentFrame"));
}else{
var _1f=_fullPlatformWindowSession.windowView;
objj_msgSend(_1b,"_setWindowView:",_1f);
objj_msgSend(_1b,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_1b,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_1b,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_1b,"setFrame:",objj_msgSend(_1f,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_20,_21){
with(_20){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_22,_23){
with(_22){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_26);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_27,_28,_29){
with(_27){
return objj_msgSend(_windowView,"frameRectForContentRect:",_29);
}
}),new objj_method(sel_getUid("frame"),function(_2a,_2b){
with(_2a){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_2c,_2d,_2e,_2f,_30){
with(_2c){
if(_30){
var _31=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_2c,_2e);
objj_msgSend(_31,"startAnimation");
}else{
objj_msgSend(_2c,"setFrameOrigin:",_2e.origin);
objj_msgSend(_2c,"setFrameSize:",_2e.size);
}
}
}),new objj_method(sel_getUid("setFrame:"),function(_32,_33,_34){
with(_32){
objj_msgSend(_32,"setFrame:display:animate:",_34,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_35,_36,_37){
with(_35){
var _38=_frame.origin;
if((_38.x==_37.x&&_38.y==_37.y)){
return;
}
_38.x=_37.x;
_38.y=_37.y;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_35);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_39,_3a,_3b){
with(_39){
_3b={width:MIN(MAX(_3b.width,_minSize.width),_maxSize.width),height:MIN(MAX(_3b.height,_minSize.height),_maxSize.height)};
if((_frame.size.width==_3b.width&&_frame.size.height==_3b.height)){
return;
}
_frame.size=_3b;
objj_msgSend(_windowView,"setFrameSize:",_3b);
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_3b.width+_2,height:_4+_3b.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_39);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_platformWindow,"orderFront:",_3c);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_3c,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_3f,_40,_41){
with(_3f){
}
}),new objj_method(sel_getUid("orderOut:"),function(_42,_43,_44){
with(_42){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_42);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_42,nil);
if(objj_msgSend(CPApp,"keyWindow")==_42){
objj_msgSend(_42,"resignKeyWindow");
CPApp._keyWindow=nil;
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_45,_46,_47,_48){
with(_45){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_47,_45,CPApp._windows[_48]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_49,_4a,_4b){
with(_49){
_level=_4b;
}
}),new objj_method(sel_getUid("level"),function(_4c,_4d){
with(_4c){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_4e,_4f){
with(_4e){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_50,_51){
with(_50){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_54);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_55,_56){
with(_55){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_57,_58,_59){
with(_57){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_59);
}
}),new objj_method(sel_getUid("setContentView:"),function(_5a,_5b,_5c){
with(_5a){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _5d=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_contentView=_5c;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_5a,"contentRectForFrameRect:",_5d));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_5e,_5f){
with(_5e){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_windowView,"setBackgroundColor:",_62);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_63,_64){
with(_63){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_65,_66,_67){
with(_65){
if(CGSizeEqualToSize(_minSize,_67)){
return;
}
_minSize=CGSizeCreateCopy(_67);
var _68=CGSizeMakeCopy(objj_msgSend(_65,"frame").size),_69=NO;
if(_68.width<_minSize.width){
_68.width=_minSize.width;
_69=YES;
}
if(_68.height<_minSize.height){
_68.height=_minSize.height;
_69=YES;
}
if(_69){
objj_msgSend(_65,"setFrameSize:",_68);
}
}
}),new objj_method(sel_getUid("minSize"),function(_6a,_6b){
with(_6a){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_6c,_6d,_6e){
with(_6c){
if(CGSizeEqualToSize(_maxSize,_6e)){
return;
}
_maxSize=CGSizeCreateCopy(_6e);
var _6f=CGSizeMakeCopy(objj_msgSend(_6c,"frame").size),_70=NO;
if(_6f.width>_maxSize.width){
_6f.width=_maxSize.width;
_70=YES;
}
if(_6f.height>_maxSize.height){
_6f.height=_maxSize.height;
_70=YES;
}
if(_70){
objj_msgSend(_6c,"setFrameSize:",_6f);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_71,_72){
with(_71){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_73,_74){
with(_73){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_75,_76,_77){
with(_75){
if(_hasShadow===_77){
return;
}
_hasShadow=_77;
if(_hasShadow){
var _78=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_78)+_2,_3+CGRectGetHeight(_78)+_4));
if(!_6){
var _79=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}else{
if(_shadowView){
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7a,_7b,_7c){
with(_7a){
_delegate=_7c;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _7d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_7d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_7a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_7d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_7a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_7d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_7a);
}
}
}),new objj_method(sel_getUid("delegate"),function(_7e,_7f){
with(_7e){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_80,_81,_82){
with(_80){
_windowController=_82;
}
}),new objj_method(sel_getUid("windowController"),function(_83,_84){
with(_83){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_85,_86,_87){
with(_85){
if(objj_msgSend(_delegate,"respondsToSelector:",_87)){
objj_msgSend(_delegate,"performSelector:",_87);
}else{
objj_msgSendSuper({receiver:_85,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_87);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_88,_89){
with(_88){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_8a,_8b,_8c){
with(_8a){
if(_firstResponder==_8c){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_8c||!objj_msgSend(_8c,"acceptsFirstResponder")||!objj_msgSend(_8c,"becomeFirstResponder")){
_firstResponder=_8a;
return NO;
}
_firstResponder=_8c;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_8d,_8e){
with(_8d){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_8f,_90){
with(_8f){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_91,_92,_93){
with(_91){
_acceptsMouseMovedEvents=_93;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_94,_95){
with(_94){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_96,_97,_98){
with(_96){
_ignoresMouseEvents=_98;
}
}),new objj_method(sel_getUid("title"),function(_99,_9a){
with(_99){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_9b,_9c,_9d){
with(_9b){
_title=_9d;
objj_msgSend(_windowView,"setTitle:",_9d);
objj_msgSend(_9b,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"setRepresentedFilename:",_a0);
objj_msgSend(_9e,"setTitle:",objj_msgSend(_a0,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_a1,_a2,_a3){
with(_a1){
objj_msgSend(_a1,"setRepresentedURL:",_a3);
}
}),new objj_method(sel_getUid("representedFilename"),function(_a4,_a5){
with(_a4){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_a6,_a7,_a8){
with(_a6){
_representedURL=_a8;
}
}),new objj_method(sel_getUid("representedURL"),function(_a9,_aa){
with(_a9){
return _representedURL;
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_ab,_ac,_ad){
with(_ab){
_isMovableByWindowBackground=_ad;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_ae,_af){
with(_ae){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_b0,_b1){
with(_b0){
var _b2=objj_msgSend(_b0,"frame").size,_b3=objj_msgSend(_platformWindow,"contentBounds").size;
objj_msgSend(_b0,"setFrameOrigin:",CGPointMake((_b3.width-_b2.width)/2,(_b3.height-_b2.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_b4,_b5,_b6){
with(_b4){
var _b7=objj_msgSend(_b6,"type"),_b8=objj_msgSend(_b6,"locationInWindow");
switch(_b7){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_b4,"firstResponder"),"keyUp:",_b6);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_b4,"firstResponder"),"keyDown:",_b6);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_b8),"scrollWheel:",_b6);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_b8),"mouseUp:",_b6);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_b6);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_b8);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_b4,"makeFirstResponder:",_leftMouseDownView);
}
var _b9=objj_msgSend(_b6,"window");
if(objj_msgSend(_b9,"isKeyWindow")||objj_msgSend(_b9,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_b6);
}else{
objj_msgSend(_b4,"makeKeyAndOrderFront:",_b4);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_b6)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_b6);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_b8),"mouseDragged:",_b6);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_b6);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_b6);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_b8);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_b6);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_b6);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _ba=objj_msgSend(_windowView,"hitTest:",_b8);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_ba){
return objj_msgSend(_ba,"mouseMoved:",_b6);
}
var _bb=_ba,_bc=[];
while(_bb){
_bc.unshift(_bb);
_bb=objj_msgSend(_bb,"superview");
}
var _bd=MIN(_mouseEnteredStack.length,_bc.length);
while(_bd--){
if(_mouseEnteredStack[_bd]===_bc[_bd]){
break;
}
}
var _be=_bd+1,_bf=_mouseEnteredStack.length;
if(_be<_bf){
var _c0=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_b8,objj_msgSend(_b6,"modifierFlags"),objj_msgSend(_b6,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_be<_bf;++_be){
objj_msgSend(_mouseEnteredStack[_be],"mouseExited:",_c0);
}
}
_be=_bd+1;
_bf=_bc.length;
if(_be<_bf){
var _c0=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_b8,objj_msgSend(_b6,"modifierFlags"),objj_msgSend(_b6,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_be<_bf;++_be){
objj_msgSend(_bc[_be],"mouseEntered:",_c0);
}
}
_mouseEnteredStack=_bc;
objj_msgSend(_ba,"mouseMoved:",_b6);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_c1,_c2){
with(_c1){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_c3,_c4){
with(_c3){
if(_firstResponder!=_c3&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_c5,_c6){
with(_c5){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_c7,_c8){
with(_c7){
return objj_msgSend(CPApp,"keyWindow")==_c7;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_c9,_ca,_cb){
with(_c9){
objj_msgSend(_c9,"orderFront:",_c9);
objj_msgSend(_c9,"makeKeyWindow");
objj_msgSend(_c9,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_cc,_cd){
with(_cc){
if(!objj_msgSend(_cc,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_cc;
objj_msgSend(_cc,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_ce,_cf){
with(_ce){
if(_firstResponder!=_ce&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_ce);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_d0,_d1,_d2,_d3,_d4,_d5,_d6,_d7,_d8){
with(_d0){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_d2,_d0,objj_msgSend(_d0,"convertBaseToBridge:",_d3),_d4,_d5,_d6,_d7,_d8);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(_d9,_da,_db){
with(_d9){
if(!_db){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_db);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(_dc,_dd,_de){
with(_dc){
if(!_de){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_de);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_df,_e0,_e1,_e2,_e3,_e4,_e5,_e6,_e7){
with(_df){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_e1,_df,objj_msgSend(_df,"convertBaseToBridge:",_e2),_e3,_e4,_e5,_e6,_e7);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_e8,_e9,_ea){
with(_e8){
if(!_ea){
return;
}
objj_msgSend(_e8,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_ea);
objj_msgSend(_e8,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_eb,_ec){
with(_eb){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_ed,_ee){
with(_ed){
objj_msgSend(_ed,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_ef,_f0,_f1){
with(_ef){
if(_isDocumentEdited==_f1){
return;
}
_isDocumentEdited=_f1;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_f2,_f3){
with(_f2){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(_f4,_f5,_f6){
with(_f4){
if(_isDocumentSaving==_f6){
return;
}
_isDocumentSaving=_f6;
objj_msgSend(_f4,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(_f7,_f8){
with(_f7){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(_f9,_fa){
with(_f9){
if(!objj_msgSend(_f9,"isMainWindow")){
return;
}
var _fb=objj_msgSend(CPApp,"mainMenu"),_fc=objj_msgSend(_fb,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_fc==CPNotFound){
return;
}
var _fd=objj_msgSend(_fb,"itemAtIndex:",_fc);
if(_isDocumentSaving){
_7=objj_msgSend(_fd,"image");
objj_msgSend(_fd,"setTitle:","Saving...");
objj_msgSend(_fd,"setImage:",_8);
objj_msgSend(_fd,"setEnabled:",NO);
}else{
objj_msgSend(_fd,"setTitle:","Save");
objj_msgSend(_fd,"setImage:",_7);
objj_msgSend(_fd,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("performClose:"),function(_fe,_ff,_100){
with(_fe){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",_fe)){
return;
}
}else{
if(objj_msgSend(_fe,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(_fe,"windowShouldClose:",_fe)){
return;
}
}
objj_msgSend(_fe,"close");
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
}),new objj_method(sel_getUid("setToolbar:"),function(self,_cmd,_111){
with(self){
if(_toolbar===_111){
return;
}
objj_msgSend(objj_msgSend(_111,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_111;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_cmd,_114){
with(self){
var _115=objj_msgSend(self,"toolbar");
objj_msgSend(_115,"setVisible:",!objj_msgSend(_115,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_cmd){
with(self){
var _118=CGRectMakeCopy(objj_msgSend(self,"frame")),_119;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_119=objj_msgSend(_platformWindow,"usableContentFrame");
}else{
_119=CGRectMakeCopy(objj_msgSend(self,"frame"));
_119.origin=_118.origin;
}
objj_msgSend(self,"setFrame:",_119);
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_cmd){
with(self){
var _11c=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_11d=CGRectMakeCopy(objj_msgSend(_attachedSheet,"frame"));
_11d.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_11c);
_11d.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_11d))/2);
objj_msgSend(_attachedSheet,"setFrameOrigin:",_11d.origin);
}
}),new objj_method(sel_getUid("_animateAttachedSheet"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_cmd,_122,_123,_124,_125){
with(self){
_attachedSheet=_122;
_122._isSheet=YES;
objj_msgSend(self,"_setAttachedSheetFrameOrigin");
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_122,self);
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
}),new objj_method(sel_getUid("keyDown:"),function(self,_cmd,_130){
with(self){
if(!objj_msgSend(self,"performKeyEquivalent:",_130)){
objj_msgSend(self,"interpretKeyEvents:",[_130]);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(self,_cmd,_133){
with(self){
if(_defaultButton&&_defaultButtonEnabled){
objj_msgSend(_defaultButton,"performClick:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(self,_cmd,_136){
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
var _13b=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_13b);
for(var i=0,_13d=objj_msgSend(_13b,"count");i<_13d;i++){
if(_13b[i]._nextKeyView){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_cmd){
with(self){
var _140=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_140);
var _141=objj_msgSend(_140,"sortedArrayUsingFunction:context:",_142,_contentView),_143=objj_msgSend(_141,"count");
for(var i=0;i<_143;i++){
objj_msgSend(_141[i],"setNextKeyView:",_141[(i+1)%_143]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("_appendSubviewsOf:toArray:"),function(self,_cmd,_147,_148){
with(self){
var _149=objj_msgSend(_147,"subviews"),_14a=objj_msgSend(_149,"count");
while(_14a--){
objj_msgSend(self,"_appendSubviewsOf:toArray:",_149[_14a],_148);
}
objj_msgSend(_148,"addObject:",_147);
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_cmd,_14d){
with(self){
if(_autorecalculatesKeyViewLoop===_14d){
return;
}
_autorecalculatesKeyViewLoop=_14d;
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_cmd){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_cmd,_152){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewFollowingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_cmd,_155){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewPrecedingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_cmd,_158){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_158,"nextValidKeyView"));
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_cmd,_15b){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_15b,"previousValidKeyView"));
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_cmd,_15e){
with(self){
objj_msgSend(self,"setDefaultButton:",_15e);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_cmd){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_cmd,_163){
with(self){
objj_msgSend(_defaultButton,"setDefaultButton:",NO);
_defaultButton=_163;
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
var _170=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_170,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_cmd,_173){
with(self){
if(_173&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_173===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_cmd,_176){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_cmd,_179,_17a){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_styleMask),"frameRectForContentRect:",_179);
}
})]);
var _142=function(a,b,_17d){
var _17e=objj_msgSend(a,"convertRect:toView:",objj_msgSend(a,"bounds"),nil),_17f=objj_msgSend(b,"convertRect:toView:",objj_msgSend(b,"bounds"),nil);
if(CGRectGetMinY(_17e)<CGRectGetMinY(_17f)){
return -1;
}else{
if(CGRectGetMinY(_17e)==CGRectGetMinY(_17f)&&CGRectGetMinX(_17e)<CGRectGetMinX(_17f)){
return -1;
}else{
if(CGRectGetMinX(_17e)==CGRectGetMinX(_17f)&&CGRectGetMinX(_17e)==CGRectGetMinX(_17f)){
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
class_addMethods(_9,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_cmd,_184){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"usableContentFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _185=objj_msgSend(_platformWindow,"contentBounds"),_186=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_185)-_184.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_185)-_184.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_186.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_186.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_186.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_186.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_186);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_cmd,_18b){
with(self){
_autoresizingMask=_18b;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_cmd){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_cmd,_190){
with(self){
var _191=objj_msgSend(self,"frame").origin;
return CGPointMake(_190.x+_191.x,_190.y+_191.y);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_cmd,_194){
with(self){
var _195=objj_msgSend(self,"frame").origin;
return CGPointMake(_194.x-_195.x,_194.y-_195.y);
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
}),new objj_method(sel_getUid("undo:"),function(self,_cmd,_19a){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_cmd,_19d){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_cmd,_1a0){
with(self){
return CGRectContainsPoint(_frame,_1a0);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setFullBridge:"),function(self,_cmd,_1a3){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1a3);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_cmd){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
})]);
var _1a6=function(_1a7,_1a8,_1a9){
return _1a7+(_1a8-_1a7)*_1a9;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_cmd,_1ac,_1ad){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_1ac;
_targetFrame=CGRectMakeCopy(_1ad);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_cmd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_cmd,_1b2){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_1b2);
var _1b3=objj_msgSend(self,"currentValue");
if(_1b3==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_1a6(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_1b3),_1a6(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_1b3)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_1a6(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_1b3),_1a6(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_1b3)));
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_1b4,_1b5,_1b6,_1b7){
return {windowView:_1b4,contentRect:_1b5,hasShadow:_1b6,level:_1b7};
};
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.j