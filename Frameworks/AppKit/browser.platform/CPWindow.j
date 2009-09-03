I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.ji;10;CPScreen.ji;18;CPPlatformWindow.jc;47822;
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
class_addIvars(_9,[new objj_ivar("_platformWindow"),new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseEnteredStack"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_initialFirstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_ignoresMouseEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_inclusiveRegisteredDraggedTypes"),new objj_ivar("_defaultButton"),new objj_ivar("_defaultButtonEnabled"),new objj_ivar("_autorecalculatesKeyViewLoop"),new objj_ivar("_keyViewLoopIsDirty"),new objj_ivar("_sharesChromeWithPlatformWindow"),new objj_ivar("_DOMElement"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"),new objj_ivar("_isFullPlatformWindow"),new objj_ivar("_fullPlatformWindowSession")]);
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
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.zIndex=0;
if(!objj_msgSend(_b,"_sharesChromeWithPlatformWindow")){
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _10=_DOMElement.CPDOMDisplayContext[0];
if(!(_10>=0)){
_10=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_10]=0;
CPDOMDisplayServerInstructions[_10+1]=_DOMElement;
CPDOMDisplayServerInstructions[_10+2]=NULL;
CPDOMDisplayServerInstructions[_10+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_10+4]=(_frame.origin.y);
}
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _10=_DOMElement.CPDOMDisplayContext[4];
if(!(_10>=0)){
_10=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_10]=4;
CPDOMDisplayServerInstructions[_10+1]=_DOMElement;
CPDOMDisplayServerInstructions[_10+2]=1;
CPDOMDisplayServerInstructions[_10+3]=1;
if(_windowView._DOMElement.CPDOMDisplayContext){
_windowView._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_windowView._DOMElement;
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
}),new objj_method(sel_getUid("platformWindow"),function(_11,_12){
with(_11){
return _platformWindow;
}
}),new objj_method(sel_getUid("setPlatformWindow:"),function(_13,_14,_15){
with(_13){
_platformWindow=_15;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_16,_17){
with(_16){
if(_initialFirstResponder){
objj_msgSend(_16,"makeFirstResponder:",_initialFirstResponder);
}
_keyViewLoopIsDirty=!objj_msgSend(_16,"_hasKeyViewLoop");
}
}),new objj_method(sel_getUid("_setWindowView:"),function(_18,_19,_1a){
with(_18){
if(_windowView===_1a){
return;
}
var _1b=_windowView;
_windowView=_1a;
if(_1b){
objj_msgSend(_1b,"_setWindow:",nil);
objj_msgSend(_1b,"noteToolbarChanged");
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_1b._DOMElement;
}
if(_windowView){
if(_windowView._DOMElement.CPDOMDisplayContext){
_windowView._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_windowView._DOMElement;
var _1c=objj_msgSend(_contentView,"convertRect:toView:",objj_msgSend(_contentView,"bounds"),nil);
_1c.origin=objj_msgSend(_18,"convertBaseToGlobal:",_1c.origin);
objj_msgSend(_windowView,"_setWindow:",_18);
objj_msgSend(_windowView,"setNextResponder:",_18);
objj_msgSend(_windowView,"addSubview:",_contentView);
objj_msgSend(_windowView,"setTitle:",_title);
objj_msgSend(_windowView,"noteToolbarChanged");
objj_msgSend(_18,"setFrame:",objj_msgSend(_18,"frameRectForContentRect:",_1c));
}
}
}),new objj_method(sel_getUid("setFullPlatformWindow:"),function(_1d,_1e,_1f){
with(_1d){
if(!objj_msgSend(_platformWindow,"supportsFullPlatformWindows")){
return;
}
_1f=!!_1f;
if(_isFullPlatformWindow===_1f){
return;
}
_isFullPlatformWindow=_1f;
if(_isFullPlatformWindow){
_fullPlatformWindowSession=_CPWindowFullPlatformWindowSessionMake(_windowView,objj_msgSend(_1d,"contentRectForFrameRect:",objj_msgSend(_1d,"frame")),objj_msgSend(_1d,"hasShadow"),objj_msgSend(_1d,"level"));
var _20=objj_msgSend(objj_msgSend(_1d,"class"),"_windowViewClassForFullPlatformWindowStyleMask:",_styleMask),_21=objj_msgSend(objj_msgSend(_20,"alloc"),"initWithFrame:styleMask:",CGRectMakeZero(),_styleMask);
objj_msgSend(_1d,"_setWindowView:",_21);
objj_msgSend(_1d,"setLevel:",CPBackgroundWindowLevel);
objj_msgSend(_1d,"setHasShadow:",NO);
objj_msgSend(_1d,"setAutoresizingMask:",CPWindowWidthSizable|CPWindowHeightSizable);
objj_msgSend(_1d,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}else{
var _21=_fullPlatformWindowSession.windowView;
objj_msgSend(_1d,"_setWindowView:",_21);
objj_msgSend(_1d,"setLevel:",_fullPlatformWindowSession.level);
objj_msgSend(_1d,"setHasShadow:",_fullPlatformWindowSession.hasShadow);
objj_msgSend(_1d,"setAutoresizingMask:",CPWindowNotSizable);
objj_msgSend(_1d,"setFrame:",objj_msgSend(_21,"frameRectForContentRect:",_fullPlatformWindowSession.contentRect));
}
}
}),new objj_method(sel_getUid("isFullPlatformWindow"),function(_22,_23){
with(_22){
return _isFullPlatformWindow;
}
}),new objj_method(sel_getUid("styleMask"),function(_24,_25){
with(_24){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_windowView,"contentRectForFrameRect:",_28);
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(_windowView,"frameRectForContentRect:",_2b);
}
}),new objj_method(sel_getUid("frame"),function(_2c,_2d){
with(_2c){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_2e,_2f,_30,_31,_32){
with(_2e){
if(_32){
var _33=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_2e,_30);
objj_msgSend(_33,"startAnimation");
}else{
objj_msgSend(_2e,"setFrameOrigin:",_30.origin);
objj_msgSend(_2e,"setFrameSize:",_30.size);
}
}
}),new objj_method(sel_getUid("setFrame:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"setFrame:display:animate:",_36,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_37,_38,_39){
with(_37){
var _3a=_frame.origin;
if((_3a.x==_39.x&&_3a.y==_39.y)){
return;
}
_3a.x=_39.x;
_3a.y=_39.y;
if(objj_msgSend(_37,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentOrigin:",_3a);
}else{
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _3b=_DOMElement.CPDOMDisplayContext[0];
if(!(_3b>=0)){
_3b=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_3b]=0;
CPDOMDisplayServerInstructions[_3b+1]=_DOMElement;
CPDOMDisplayServerInstructions[_3b+2]=NULL;
CPDOMDisplayServerInstructions[_3b+3]=_3a.x;
CPDOMDisplayServerInstructions[_3b+4]=_3a.y;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidMoveNotification,_37);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3c,_3d,_3e){
with(_3c){
_3e={width:MIN(MAX(_3e.width,_minSize.width),_maxSize.width),height:MIN(MAX(_3e.height,_minSize.height),_maxSize.height)};
if((_frame.size.width==_3e.width&&_frame.size.height==_3e.height)){
return;
}
_frame.size=_3e;
objj_msgSend(_windowView,"setFrameSize:",_3e);
if(objj_msgSend(_3c,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setContentSize:",_3e);
}
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_3e.width+_2,height:_4+_3e.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_3c);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_platformWindow,"orderFront:",_3f);
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_3f,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_42,_43,_44){
with(_42){
}
}),new objj_method(sel_getUid("orderOut:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_45);
}
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowOut,_45,nil);
if(objj_msgSend(CPApp,"keyWindow")==_45){
objj_msgSend(_45,"resignKeyWindow");
CPApp._keyWindow=nil;
}
if(objj_msgSend(_45,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"orderOut:",_45);
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_48,_49,_4a,_4b){
with(_48){
objj_msgSend(_platformWindow,"order:window:relativeTo:",_4a,_48,CPApp._windows[_4b]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_4c,_4d,_4e){
with(_4c){
_level=_4e;
if(objj_msgSend(_4c,"_sharesChromeWithPlatformWindow")){
objj_msgSend(_platformWindow,"setLevel:",_4e);
}
}
}),new objj_method(sel_getUid("level"),function(_4f,_50){
with(_4f){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_51,_52){
with(_51){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_53,_54){
with(_53){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_57);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_58,_59){
with(_58){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_5c);
}
}),new objj_method(sel_getUid("setContentView:"),function(_5d,_5e,_5f){
with(_5d){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
var _60=CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
_contentView=_5f;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_5d,"contentRectForFrameRect:",_60));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_61,_62){
with(_61){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_windowView,"setBackgroundColor:",_65);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_66,_67){
with(_66){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_68,_69,_6a){
with(_68){
if(CGSizeEqualToSize(_minSize,_6a)){
return;
}
_minSize=CGSizeCreateCopy(_6a);
var _6b=CGSizeMakeCopy(objj_msgSend(_68,"frame").size),_6c=NO;
if(_6b.width<_minSize.width){
_6b.width=_minSize.width;
_6c=YES;
}
if(_6b.height<_minSize.height){
_6b.height=_minSize.height;
_6c=YES;
}
if(_6c){
objj_msgSend(_68,"setFrameSize:",_6b);
}
}
}),new objj_method(sel_getUid("minSize"),function(_6d,_6e){
with(_6d){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_6f,_70,_71){
with(_6f){
if(CGSizeEqualToSize(_maxSize,_71)){
return;
}
_maxSize=CGSizeCreateCopy(_71);
var _72=CGSizeMakeCopy(objj_msgSend(_6f,"frame").size),_73=NO;
if(_72.width>_maxSize.width){
_72.width=_maxSize.width;
_73=YES;
}
if(_72.height>_maxSize.height){
_72.height=_maxSize.height;
_73=YES;
}
if(_73){
objj_msgSend(_6f,"setFrameSize:",_72);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_74,_75){
with(_74){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_76,_77){
with(_76){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_78,_79,_7a){
with(_78){
if(_hasShadow===_7a){
return;
}
_hasShadow=_7a;
if(objj_msgSend(_78,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_platformWindow,"setHasShadow:",_7a);
}
if(_hasShadow){
var _7b=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_7b)+_2,_3+CGRectGetHeight(_7b)+_4));
if(!_6){
var _7c=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7c,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
if(_shadowView._DOMElement.CPDOMDisplayContext){
_shadowView._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_shadowView._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_windowView._DOMElement;
}else{
if(_shadowView){
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_shadowView._DOMElement;
_shadowView=nil;
}
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7d,_7e,_7f){
with(_7d){
_delegate=_7f;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _80=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_80,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_7d);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_80,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_7d);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidMove:"))){
objj_msgSend(_80,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidMove:"),CPWindowDidMoveNotification,_7d);
}
}
}),new objj_method(sel_getUid("delegate"),function(_81,_82){
with(_81){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_83,_84,_85){
with(_83){
_windowController=_85;
}
}),new objj_method(sel_getUid("windowController"),function(_86,_87){
with(_86){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_88,_89,_8a){
with(_88){
if(objj_msgSend(_delegate,"respondsToSelector:",_8a)){
objj_msgSend(_delegate,"performSelector:",_8a);
}else{
objj_msgSendSuper({receiver:_88,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_8a);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_8b,_8c){
with(_8b){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_8d,_8e,_8f){
with(_8d){
if(_firstResponder==_8f){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_8f||!objj_msgSend(_8f,"acceptsFirstResponder")||!objj_msgSend(_8f,"becomeFirstResponder")){
_firstResponder=_8d;
return NO;
}
_firstResponder=_8f;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_90,_91){
with(_90){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_92,_93){
with(_92){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_94,_95,_96){
with(_94){
_acceptsMouseMovedEvents=_96;
}
}),new objj_method(sel_getUid("ignoresMouseEvents"),function(_97,_98){
with(_97){
return _ignoresMouseEvents;
}
}),new objj_method(sel_getUid("setIgnoresMouseEvents:"),function(_99,_9a,_9b){
with(_99){
_ignoresMouseEvents=_9b;
}
}),new objj_method(sel_getUid("title"),function(_9c,_9d){
with(_9c){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_9e,_9f,_a0){
with(_9e){
_title=_a0;
objj_msgSend(_windowView,"setTitle:",_a0);
objj_msgSend(_9e,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_a1,_a2,_a3){
with(_a1){
objj_msgSend(_a1,"setRepresentedFilename:",_a3);
objj_msgSend(_a1,"setTitle:",objj_msgSend(_a3,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_a4,_a5,_a6){
with(_a4){
objj_msgSend(_a4,"setRepresentedURL:",_a6);
}
}),new objj_method(sel_getUid("representedFilename"),function(_a7,_a8){
with(_a7){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_a9,_aa,_ab){
with(_a9){
_representedURL=_ab;
}
}),new objj_method(sel_getUid("representedURL"),function(_ac,_ad){
with(_ac){
return _representedURL;
}
}),new objj_method(sel_getUid("screen"),function(_ae,_af){
with(_ae){
return objj_msgSend(objj_msgSend(CPScreen,"alloc"),"init");
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_b0,_b1,_b2){
with(_b0){
_isMovableByWindowBackground=_b2;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_b3,_b4){
with(_b3){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_b5,_b6){
with(_b5){
var _b7=objj_msgSend(_b5,"frame").size,_b8=objj_msgSend(_platformWindow,"contentBounds").size;
objj_msgSend(_b5,"setFrameOrigin:",CGPointMake((_b8.width-_b7.width)/2,(_b8.height-_b7.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_b9,_ba,_bb){
with(_b9){
var _bc=objj_msgSend(_bb,"type"),_bd=objj_msgSend(_bb,"locationInWindow");
switch(_bc){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_b9,"firstResponder"),"keyUp:",_bb);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_b9,"firstResponder"),"keyDown:",_bb);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_bd),"scrollWheel:",_bb);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_bd),"mouseUp:",_bb);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_bb);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_bd);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_b9,"makeFirstResponder:",_leftMouseDownView);
}
var _be=objj_msgSend(_bb,"window");
if(objj_msgSend(_be,"isKeyWindow")||objj_msgSend(_be,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_bb);
}else{
objj_msgSend(_b9,"makeKeyAndOrderFront:",_b9);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_bb)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_bb);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_bd),"mouseDragged:",_bb);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_bb);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_bb);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_bd);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_bb);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_bb);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
if(!_mouseEnteredStack){
_mouseEnteredStack=[];
}
var _bf=objj_msgSend(_windowView,"hitTest:",_bd);
if(objj_msgSend(_mouseEnteredStack,"count")&&objj_msgSend(_mouseEnteredStack,"lastObject")===_bf){
return objj_msgSend(_bf,"mouseMoved:",_bb);
}
var _c0=_bf,_c1=[];
while(_c0){
_c1.unshift(_c0);
_c0=objj_msgSend(_c0,"superview");
}
var _c2=MIN(_mouseEnteredStack.length,_c1.length);
while(_c2--){
if(_mouseEnteredStack[_c2]===_c1[_c2]){
break;
}
}
var _c3=_c2+1,_c4=_mouseEnteredStack.length;
if(_c3<_c4){
var _c5=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_bd,objj_msgSend(_bb,"modifierFlags"),objj_msgSend(_bb,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_c3<_c4;++_c3){
objj_msgSend(_mouseEnteredStack[_c3],"mouseExited:",_c5);
}
}
_c3=_c2+1;
_c4=_c1.length;
if(_c3<_c4){
var _c5=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_bd,objj_msgSend(_bb,"modifierFlags"),objj_msgSend(_bb,"timestamp"),_windowNumber,nil,-1,1,0);
for(;_c3<_c4;++_c3){
objj_msgSend(_c1[_c3],"mouseEntered:",_c5);
}
}
_mouseEnteredStack=_c1;
objj_msgSend(_bf,"mouseMoved:",_bb);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_c6,_c7){
with(_c6){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_c8,_c9){
with(_c8){
if(_firstResponder!=_c8&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_ca,_cb){
with(_ca){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_cc,_cd){
with(_cc){
return objj_msgSend(CPApp,"keyWindow")==_cc;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_ce,_cf,_d0){
with(_ce){
objj_msgSend(_ce,"orderFront:",_ce);
objj_msgSend(_ce,"makeKeyWindow");
objj_msgSend(_ce,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_d1,_d2){
with(_d1){
if(!objj_msgSend(_d1,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_d1;
objj_msgSend(_d1,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_d3,_d4){
with(_d3){
if(_firstResponder!=_d3&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_d3);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_d5,_d6,_d7,_d8,_d9,_da,_db,_dc,_dd){
with(_d5){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_d7,_d5,objj_msgSend(_d5,"convertBaseToGlobal:",_d8),_d9,_da,_db,_dc,_dd);
}
}),new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"),function(_de,_df,_e0){
with(_de){
if(!_e0){
return;
}
if(!_inclusiveRegisteredDraggedTypes){
_inclusiveRegisteredDraggedTypes=objj_msgSend(CPCountedSet,"set");
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"unionSet:",_e0);
}
}),new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"),function(_e1,_e2,_e3){
with(_e1){
if(!_e3){
return;
}
objj_msgSend(_inclusiveRegisteredDraggedTypes,"minusSet:",_e3);
if(objj_msgSend(_inclusiveRegisteredDraggedTypes,"count")===0){
_inclusiveRegisteredDraggedTypes=nil;
}
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_e4,_e5,_e6,_e7,_e8,_e9,_ea,_eb,_ec){
with(_e4){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_e6,_e4,objj_msgSend(_e4,"convertBaseToGlobal:",_e7),_e8,_e9,_ea,_eb,_ec);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_ed,_ee,_ef){
with(_ed){
if(!_ef){
return;
}
objj_msgSend(_ed,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_ef);
objj_msgSend(_ed,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_f0,_f1){
with(_f0){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_f2,_f3){
with(_f2){
objj_msgSend(_f2,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_f4,_f5,_f6){
with(_f4){
if(_isDocumentEdited==_f6){
return;
}
_isDocumentEdited=_f6;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_f7,_f8){
with(_f7){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(_f9,_fa,_fb){
with(_f9){
if(_isDocumentSaving==_fb){
return;
}
_isDocumentSaving=_fb;
objj_msgSend(_f9,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(_fc,_fd){
with(_fc){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(_fe,_ff){
with(_fe){
if(!objj_msgSend(_fe,"isMainWindow")){
return;
}
var _100=objj_msgSend(CPApp,"mainMenu"),_101=objj_msgSend(_100,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_101==CPNotFound){
return;
}
var item=objj_msgSend(_100,"itemAtIndex:",_101);
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
}),new objj_method(sel_getUid("performClose:"),function(self,_cmd,_105){
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
}),new objj_method(sel_getUid("setToolbar:"),function(self,_cmd,_116){
with(self){
if(_toolbar===_116){
return;
}
objj_msgSend(objj_msgSend(_116,"_window"),"setToolbar:",nil);
objj_msgSend(_toolbar,"_setWindow:",nil);
_toolbar=_116;
objj_msgSend(_toolbar,"_setWindow:",self);
objj_msgSend(self,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("toggleToolbarShown:"),function(self,_cmd,_119){
with(self){
var _11a=objj_msgSend(self,"toolbar");
objj_msgSend(_11a,"setVisible:",!objj_msgSend(_11a,"isVisible"));
}
}),new objj_method(sel_getUid("_noteToolbarChanged"),function(self,_cmd){
with(self){
var _11d=CGRectMakeCopy(objj_msgSend(self,"frame")),_11e;
objj_msgSend(_windowView,"noteToolbarChanged");
if(_isFullPlatformWindow){
_11e=objj_msgSend(_platformWindow,"visibleFrame");
}else{
_11e=CGRectMakeCopy(objj_msgSend(self,"frame"));
_11e.origin=_11d.origin;
}
objj_msgSend(self,"setFrame:",_11e);
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(self,_cmd){
with(self){
var _121=objj_msgSend(objj_msgSend(self,"contentView"),"frame"),_122=CGRectMakeCopy(objj_msgSend(_attachedSheet,"frame"));
_122.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_121);
_122.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_122))/2);
objj_msgSend(_attachedSheet,"setFrameOrigin:",_122.origin);
}
}),new objj_method(sel_getUid("_animateAttachedSheet"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_cmd,_127,_128,_129,_12a){
with(self){
_attachedSheet=_127;
_127._isSheet=YES;
objj_msgSend(self,"_setAttachedSheetFrameOrigin");
objj_msgSend(_platformWindow,"order:window:relativeTo:",CPWindowAbove,_127,self);
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
}),new objj_method(sel_getUid("keyDown:"),function(self,_cmd,_135){
with(self){
if(!objj_msgSend(self,"performKeyEquivalent:",_135)){
objj_msgSend(self,"interpretKeyEvents:",[_135]);
}
}
}),new objj_method(sel_getUid("insertNewline:"),function(self,_cmd,_138){
with(self){
if(_defaultButton&&_defaultButtonEnabled){
objj_msgSend(_defaultButton,"performClick:",nil);
}
}
}),new objj_method(sel_getUid("insertTab:"),function(self,_cmd,_13b){
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
var _140=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_140);
for(var i=0,_142=objj_msgSend(_140,"count");i<_142;i++){
if(_140[i]._nextKeyView){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("recalculateKeyViewLoop"),function(self,_cmd){
with(self){
var _145=[];
objj_msgSend(self,"_appendSubviewsOf:toArray:",_contentView,_145);
var _146=objj_msgSend(_145,"sortedArrayUsingFunction:context:",_147,_contentView),_148=objj_msgSend(_146,"count");
for(var i=0;i<_148;i++){
objj_msgSend(_146[i],"setNextKeyView:",_146[(i+1)%_148]);
}
_keyViewLoopIsDirty=NO;
}
}),new objj_method(sel_getUid("_appendSubviewsOf:toArray:"),function(self,_cmd,_14c,_14d){
with(self){
var _14e=objj_msgSend(_14c,"subviews"),_14f=objj_msgSend(_14e,"count");
while(_14f--){
objj_msgSend(self,"_appendSubviewsOf:toArray:",_14e[_14f],_14d);
}
objj_msgSend(_14d,"addObject:",_14c);
}
}),new objj_method(sel_getUid("setAutorecalculatesKeyViewLoop:"),function(self,_cmd,_152){
with(self){
if(_autorecalculatesKeyViewLoop===_152){
return;
}
_autorecalculatesKeyViewLoop=_152;
objj_msgSend(self,"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("autorecalculatesKeyViewLoop"),function(self,_cmd){
with(self){
return _autorecalculatesKeyViewLoop;
}
}),new objj_method(sel_getUid("selectNextKeyView:"),function(self,_cmd,_157){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewFollowingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectPreviousKeyView:"),function(self,_cmd,_15a){
with(self){
if(objj_msgSend(_firstResponder,"isKindOfClass:",objj_msgSend(CPView,"class"))){
objj_msgSend(self,"selectKeyViewPrecedingView:",_firstResponder);
}
}
}),new objj_method(sel_getUid("selectKeyViewFollowingView:"),function(self,_cmd,_15d){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_15d,"nextValidKeyView"));
}
}),new objj_method(sel_getUid("selectKeyViewPrecedingView:"),function(self,_cmd,_160){
with(self){
if(_keyViewLoopIsDirty){
objj_msgSend(self,"recalculateKeyViewLoop");
}
objj_msgSend(self,"makeFirstResponder:",objj_msgSend(_160,"previousValidKeyView"));
}
}),new objj_method(sel_getUid("setDefaultButtonCell:"),function(self,_cmd,_163){
with(self){
objj_msgSend(self,"setDefaultButton:",_163);
}
}),new objj_method(sel_getUid("defaultButtonCell"),function(self,_cmd){
with(self){
return objj_msgSend(self,"defaultButton");
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(self,_cmd,_168){
with(self){
objj_msgSend(_defaultButton,"setDefaultButton:",NO);
_defaultButton=_168;
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
var _175=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_175,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("_windowViewClassForStyleMask:"),function(self,_cmd,_178){
with(self){
if(_178&CPHUDBackgroundWindowMask){
return _CPHUDWindowView;
}else{
if(_178===CPBorderlessWindowMask){
return _CPBorderlessWindowView;
}
}
return _CPStandardWindowView;
}
}),new objj_method(sel_getUid("_windowViewClassForFullPlatformWindowStyleMask:"),function(self,_cmd,_17b){
with(self){
return _CPBorderlessBridgeWindowView;
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_cmd,_17e,_17f){
with(self){
return objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"_windowViewClassForStyleMask:",_styleMask),"frameRectForContentRect:",_17e);
}
})]);
var _147=function(a,b,_182){
var _183=objj_msgSend(a,"convertRect:toView:",objj_msgSend(a,"bounds"),nil),_184=objj_msgSend(b,"convertRect:toView:",objj_msgSend(b,"bounds"),nil);
if(CGRectGetMinY(_183)<CGRectGetMinY(_184)){
return -1;
}else{
if(CGRectGetMinY(_183)==CGRectGetMinY(_184)&&CGRectGetMinX(_183)<CGRectGetMinX(_184)){
return -1;
}else{
if(CGRectGetMinX(_183)==CGRectGetMinX(_184)&&CGRectGetMinX(_183)==CGRectGetMinX(_184)){
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
class_addMethods(_9,[new objj_method(sel_getUid("resizeWithOldPlatformWindowSize:"),function(self,_cmd,_189){
with(self){
if(objj_msgSend(self,"isFullPlatformWindow")){
return objj_msgSend(self,"setFrame:",objj_msgSend(_platformWindow,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _18a=objj_msgSend(_platformWindow,"contentBounds"),_18b=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_18a)-_189.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_18a)-_189.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_18b.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_18b.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_18b.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_18b.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_18b);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_cmd,_190){
with(self){
_autoresizingMask=_190;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_cmd){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToGlobal:"),function(self,_cmd,_195){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertBaseToPlatformWindow:",_195):objj_msgSend(self,"convertBaseToScreen:",_195);
}
}),new objj_method(sel_getUid("convertGlobalToBase:"),function(self,_cmd,_198){
with(self){
return objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(self,"convertPlatformWindowToBase:",_198):objj_msgSend(self,"convertScreenToBase:",_198);
}
}),new objj_method(sel_getUid("convertBaseToPlatformWindow:"),function(self,_cmd,_19b){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _19b;
}
var _19c=objj_msgSend(self,"frame").origin;
return {x:_19b.x+_19c.x,y:_19b.y+_19c.y};
}
}),new objj_method(sel_getUid("convertPlatformWindowToBase:"),function(self,_cmd,_19f){
with(self){
if(objj_msgSend(self,"_sharesChromeWithPlatformWindow")){
return _19f;
}
var _1a0=objj_msgSend(self,"frame").origin;
return {x:_19f.x-_1a0.x,y:_19f.y-_1a0.y};
}
}),new objj_method(sel_getUid("convertScreenToBase:"),function(self,_cmd,_1a3){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",objj_msgSend(_platformWindow,"convertScreenToBase:",_1a3));
}
}),new objj_method(sel_getUid("convertBaseToScreen:"),function(self,_cmd,_1a6){
with(self){
return objj_msgSend(_platformWindow,"convertBaseToScreen:",objj_msgSend(self,"convertBaseToPlatformWindow:",_1a6));
}
}),new objj_method(sel_getUid("_setSharesChromeWithPlatformWindow:"),function(self,_cmd,_1a9){
with(self){
if(_1a9&&objj_msgSend(CPPlatform,"isBrowser")){
return;
}
_sharesChromeWithPlatformWindow=_1a9;
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
}),new objj_method(sel_getUid("undo:"),function(self,_cmd,_1b0){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_cmd,_1b3){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
}),new objj_method(sel_getUid("containsPoint:"),function(self,_cmd,_1b6){
with(self){
return CGRectContainsPoint(_frame,_1b6);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setFullBridge:"),function(self,_cmd,_1b9){
with(self){
objj_msgSend(self,"setFullPlatformWindow:",_1b9);
}
}),new objj_method(sel_getUid("isFullBridge"),function(self,_cmd){
with(self){
return objj_msgSend(self,"isFullPlatformWindow");
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_cmd,_1be){
with(self){
return objj_msgSend(self,"convertBaseToPlatformWindow:",_1be);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_cmd,_1c1){
with(self){
return objj_msgSend(self,"convertPlatformWindowToBase:",_1c1);
}
})]);
var _1c2=function(_1c3,_1c4,_1c5){
return _1c3+(_1c4-_1c3)*_1c5;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_cmd,_1c8,_1c9){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_1c8;
_targetFrame=CGRectMakeCopy(_1c9);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_cmd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_cmd,_1ce){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_1ce);
var _1cf=objj_msgSend(self,"currentValue");
if(_1cf==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_1c2(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_1cf),_1c2(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_1cf)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_1c2(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_1cf),_1c2(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_1cf)));
}
})]);
_CPWindowFullPlatformWindowSessionMake=function(_1d0,_1d1,_1d2,_1d3){
return {windowView:_1d0,contentRect:_1d1,hasShadow:_1d2,level:_1d3};
};
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;8;CPView.j