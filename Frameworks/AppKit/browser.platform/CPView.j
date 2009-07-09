I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;67384;
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
var _3=nil,_4=0,_5=1,_6=2,_7=3;
var _8={},_9=1<<0,_a=1<<1;
var _b=objj_allocateClassPair(CPResponder,"CPView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("setupViewFlags"),function(_d,_e){
with(_d){
var _f=objj_msgSend(_d,"class"),_10=objj_msgSend(_f,"UID");
if(_8[_10]===undefined){
var _11=0;
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_11|=_9;
}
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_11|=_a;
}
_8[_10]=_11;
}
_viewClassFlags=_8[_10];
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPResponder")},"init");
if(_14){
var _17=(_16.size.width),_18=(_16.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_17,height:_18}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_DOMElement=_3.cloneNode(false);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _19=_DOMElement.CPDOMDisplayContext[0];
if(!(_19>=0)){
_19=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_19]=0;
CPDOMDisplayServerInstructions[_19+1]=_DOMElement;
CPDOMDisplayServerInstructions[_19+2]=NULL;
CPDOMDisplayServerInstructions[_19+3]=(_16.origin.x);
CPDOMDisplayServerInstructions[_19+4]=(_16.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _19=_DOMElement.CPDOMDisplayContext[4];
if(!(_19>=0)){
_19=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_19]=4;
CPDOMDisplayServerInstructions[_19+1]=_DOMElement;
CPDOMDisplayServerInstructions[_19+2]=_17;
CPDOMDisplayServerInstructions[_19+3]=_18;
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_14,"setupViewFlags");
objj_msgSend(_14,"_loadThemeAttributes");
}
return _14;
}
}),new objj_method(sel_getUid("superview"),function(_1a,_1b){
with(_1a){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_1c,_1d){
with(_1c){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_1e,_1f){
with(_1e){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_20,"_insertSubview:atIndex:",_22,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_23,_24,_25,_26,_27){
with(_23){
var _28=_27?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_27):CPNotFound;
if(_28===CPNotFound){
_28=(_26===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_26===CPWindowAbove){
++_28;
}
}
objj_msgSend(_23,"_insertSubview:atIndex:",_25,_28);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=_subviews.length;
objj_msgSend(objj_msgSend(_29,"window"),"_dirtyKeyViewLoop");
if(_2b._superview==_29){
var _2e=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_2b);
if(_2e===_2c||_2e===_2d-1&&_2c===_2d){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_2e);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_2b._DOMElement;
if(_2c>_2e){
--_2c;
}
--_2d;
}else{
objj_msgSend(_2b,"removeFromSuperview");
objj_msgSend(_2b,"_setWindow:",_window);
objj_msgSend(_2b,"viewWillMoveToSuperview:",_29);
_2b._superview=_29;
}
if(_2c===CPNotFound||_2c>=_2d){
_subviews.push(_2b);
if(_2b._DOMElement.CPDOMDisplayContext){
_2b._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_2b._DOMElement;
}else{
_subviews.splice(_2c,0,_2b);
if(_2b._DOMElement.CPDOMDisplayContext){
_2b._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_2b._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_2c+1]._DOMElement;
}
objj_msgSend(_2b,"setNextResponder:",_29);
objj_msgSend(_2b,"viewDidMoveToSuperview");
objj_msgSend(_29,"didAddSubview:",_2b);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_2f,_30,_31){
with(_2f){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_32,_33){
with(_32){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_32,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_32);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_32);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_superview._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
_superview=nil;
objj_msgSend(_32,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_34,_35,_36,_37){
with(_34){
if(_36._superview!=_34){
return;
}
var _38=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_36);
objj_msgSend(_36,"removeFromSuperview");
objj_msgSend(_34,"_insertSubview:atIndex:",_37,_38);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_39,_3a,_3b){
with(_39){
if(_window===_3b){
return;
}
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_39){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_39,"viewWillMoveToWindow:",_3b);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_3b,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_3b;
var _3c=objj_msgSend(_subviews,"count");
while(_3c--){
objj_msgSend(_subviews[_3c],"_setWindow:",_3b);
}
objj_msgSend(_39,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_3d,_3e,_3f){
with(_3d){
var _40=_3d;
do{
if(_40==_3f){
return YES;
}
}while(_40=objj_msgSend(_40,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_41,_42){
with(_41){
objj_msgSend(_41,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_43,_44){
with(_43){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_48,_49,_4a){
with(_48){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_4b,_4c,_4d){
with(_4b){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_4e,_4f){
with(_4e){
var _50=_4e;
while(_50&&!objj_msgSend(_50,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_50=objj_msgSend(_50,"superview");
}
if(_50){
return _50._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_51,_52,_53){
with(_51){
_tag=_53;
}
}),new objj_method(sel_getUid("tag"),function(_54,_55){
with(_54){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_56,_57,_58){
with(_56){
if(objj_msgSend(_56,"tag")===_58){
return _56;
}
var _59=0,_5a=_subviews.length;
for(;_59<_5a;++_59){
var _5b=objj_msgSend(_subviews[_59],"viewWithTag:",_58);
if(_5b){
return _5b;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_5c,_5d){
with(_5c){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_5e,_5f,_60){
with(_5e){
if(((_frame.origin.x==_60.origin.x&&_frame.origin.y==_60.origin.y)&&(_frame.size.width==_60.size.width&&_frame.size.height==_60.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_5e,"setFrameOrigin:",_60.origin);
objj_msgSend(_5e,"setFrameSize:",_60.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5e);
}
}
}),new objj_method(sel_getUid("frame"),function(_61,_62){
with(_61){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setCenter:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_63,"setFrameOrigin:",CGPointMake(_65.x-_frame.size.width/2,_65.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_66,_67){
with(_66){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_68,_69,_6a){
with(_68){
var _6b=_frame.origin;
if(!_6a||(_6b.x==_6a.x&&_6b.y==_6a.y)){
return;
}
_6b.x=_6a.x;
_6b.y=_6a.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_68);
}
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _6c=_DOMElement.CPDOMDisplayContext[0];
if(!(_6c>=0)){
_6c=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_6c]=0;
CPDOMDisplayServerInstructions[_6c+1]=_DOMElement;
CPDOMDisplayServerInstructions[_6c+2]=_superview?_superview._boundsTransform:NULL;
CPDOMDisplayServerInstructions[_6c+3]=_6b.x;
CPDOMDisplayServerInstructions[_6c+4]=_6b.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6d,_6e,_6f){
with(_6d){
var _70=_frame.size;
if(!_6f||(_70.width==_6f.width&&_70.height==_6f.height)){
return;
}
var _71={width:_70.width,height:_70.height};
_70.width=_6f.width;
_70.height=_6f.height;
if(YES){
_bounds.size.width=_6f.width;
_bounds.size.height=_6f.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_6d,"resizeSubviewsWithOldSize:",_71);
}
objj_msgSend(_6d,"setNeedsLayout");
objj_msgSend(_6d,"setNeedsDisplay:",YES);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _72=_DOMElement.CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMElement;
CPDOMDisplayServerInstructions[_72+2]=_70.width;
CPDOMDisplayServerInstructions[_72+3]=_70.height;
if(_DOMContentsElement){
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _72=_DOMContentsElement.CPDOMDisplayContext[5];
if(!(_72>=0)){
_72=_DOMContentsElement.CPDOMDisplayContext[5]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=5;
CPDOMDisplayServerInstructions[_72+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_72+2]=_70.width;
CPDOMDisplayServerInstructions[_72+3]=_70.height;
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _72=_DOMContentsElement.CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMContentsElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_72+2]=_70.width;
CPDOMDisplayServerInstructions[_72+3]=_70.height;
}
if(_backgroundType!==_4){
var _73=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_72+2]=_70.width;
CPDOMDisplayServerInstructions[_72+3]=_70.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
}else{
if(_backgroundType===_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_72+2]=_70.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_72+3]=_70.height;
}else{
if(_backgroundType===_7){
var _74=_70.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_75=_70.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_72+2]=_74;
CPDOMDisplayServerInstructions[_72+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_72+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_72+3]=_75;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_72+2]=_74;
CPDOMDisplayServerInstructions[_72+3]=_75;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_72+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_72+3]=_75;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _72=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_72>=0)){
_72=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_72]=4;
CPDOMDisplayServerInstructions[_72+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_72+2]=_74;
CPDOMDisplayServerInstructions[_72+3]=_DOMImageSizes[7].height;
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6d);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_76,_77,_78){
with(_76){
if(((_bounds.origin.x==_78.origin.x&&_bounds.origin.y==_78.origin.y)&&(_bounds.size.width==_78.size.width&&_bounds.size.height==_78.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_76,"setBoundsOrigin:",_78.origin);
objj_msgSend(_76,"setBoundsSize:",_78.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_76);
}
}
}),new objj_method(sel_getUid("bounds"),function(_79,_7a){
with(_79){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=_bounds.origin;
if((_7e.x==_7d.x&&_7e.y==_7d.y)){
return;
}
_7e.x=_7d.x;
_7e.y=_7d.y;
if(_7e.x!=0||_7e.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_7e.x,ty:-_7e.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _7f=_subviews.length;
while(_7f--){
var _80=_subviews[_7f],_7e=_80._frame.origin;
if(!_80._DOMElement.CPDOMDisplayContext){
_80._DOMElement.CPDOMDisplayContext=[];
}
var _81=_80._DOMElement.CPDOMDisplayContext[0];
if(!(_81>=0)){
_81=_80._DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_81]=0;
CPDOMDisplayServerInstructions[_81+1]=_80._DOMElement;
CPDOMDisplayServerInstructions[_81+2]=_boundsTransform;
CPDOMDisplayServerInstructions[_81+3]=_7e.x;
CPDOMDisplayServerInstructions[_81+4]=_7e.y;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7b);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_82,_83,_84){
with(_82){
var _85=_bounds.size;
if((_85.width==_84.width&&_85.height==_84.height)){
return;
}
var _86=_frame.size;
if(!(_85.width==_86.width&&_85.height==_86.height)){
var _87=_bounds.origin;
_87.x/=_85.width/_86.width;
_87.y/=_85.height/_86.height;
}
_85.width=_84.width;
_85.height=_84.height;
if(!(_85.width==_86.width&&_85.height==_86.height)){
var _87=_bounds.origin;
_87.x*=_85.width/_86.width;
_87.y*=_85.height/_86.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_82);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_88,_89,_8a){
with(_88){
var _8b=objj_msgSend(_88,"autoresizingMask");
if(_8b==CPViewNotSizable){
return;
}
var _8c=_superview._frame,_8d={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_8c.size.width)-_8a.width)/(((_8b&CPViewMinXMargin)?1:0)+(_8b&CPViewWidthSizable?1:0)+(_8b&CPViewMaxXMargin?1:0)),dY=((_8c.size.height)-_8a.height)/((_8b&CPViewMinYMargin?1:0)+(_8b&CPViewHeightSizable?1:0)+(_8b&CPViewMaxYMargin?1:0));
if(_8b&CPViewMinXMargin){
_8d.origin.x+=dX;
}
if(_8b&CPViewWidthSizable){
_8d.size.width+=dX;
}
if(_8b&CPViewMinYMargin){
_8d.origin.y+=dY;
}
if(_8b&CPViewHeightSizable){
_8d.size.height+=dY;
}
objj_msgSend(_88,"setFrame:",_8d);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_90,_91,_92){
with(_90){
var _93=_subviews.length;
while(_93--){
objj_msgSend(_subviews[_93],"resizeWithOldSuperviewSize:",_92);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_94,_95,_96){
with(_94){
_autoresizesSubviews=!!_96;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_97,_98){
with(_97){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_99,_9a,_9b){
with(_99){
_autoresizingMask=_9b;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_9c,_9d){
with(_9c){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_9e,_9f){
with(_9e){
return objj_msgSend(_9e,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_a0,_a1,_a2,_a3){
with(_a0){
_fullScreenModeState=_a4(_a0);
var _a5=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_a5,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_a5,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _a6=objj_msgSend(_a5,"contentView");
objj_msgSend(_a6,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_a6,"addSubview:",_a0);
objj_msgSend(_a0,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a0,"setFrame:",CGRectMakeCopy(objj_msgSend(_a6,"bounds")));
objj_msgSend(_a5,"makeKeyAndOrderFront:",_a0);
objj_msgSend(_a5,"makeFirstResponder:",_a0);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_a7,_a8){
with(_a7){
objj_msgSend(_a7,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_a9,_aa,_ab){
with(_a9){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_a9,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_a9,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_a9,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_a9,"window"),"orderOut:",_a9);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_ac,_ad){
with(_ac){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_ae,_af,_b0){
with(_ae){
_b0=!!_b0;
if(_isHidden===_b0){
return;
}
_isHidden=_b0;
_DOMElement.style.display=_isHidden?"none":"block";
if(_b0){
var _b1=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_b1,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_ae==_b1){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_ae,"nextValidKeyView"));
break;
}
}while(_b1=objj_msgSend(_b1,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_b2,_b3){
with(_b2){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_b4,_b5,_b6){
with(_b4){
if(_opacity==_b6){
return;
}
_opacity=_b6;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_b6==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_b6*100+")";
}
}else{
_DOMElement.style.opacity=_b6;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_b7,_b8){
with(_b7){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_b9,_ba){
with(_b9){
var _bb=_b9;
while(_bb&&!objj_msgSend(_bb,"isHidden")){
_bb=objj_msgSend(_bb,"superview");
}
return _bb!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_bc,_bd,_be){
with(_bc){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_bf,_c0){
with(_bf){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_c1,_c2,_c3){
with(_c1){
_hitTests=!!_c3;
}
}),new objj_method(sel_getUid("hitTest:"),function(_c4,_c5,_c6){
with(_c4){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_c6)){
return nil;
}
var _c7=nil,i=_subviews.length,_c9={x:_c6.x-(_frame.origin.x),y:_c6.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_c9={x:_c9.x*_inverseBoundsTransform.a+_c9.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_c9.x*_inverseBoundsTransform.b+_c9.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_c7=objj_msgSend(_subviews[i],"hitTest:",_c9)){
return _c7;
}
}
return _c4;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_ca,_cb){
with(_ca){
return !objj_msgSend(_ca,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_cc,_cd,_ce){
with(_cc){
if(objj_msgSend(_cc,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_cc,super_class:objj_getClass("CPResponder")},"mouseDown:",_ce);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_cf,_d0,_d1){
with(_cf){
if(_backgroundColor==_d1){
return;
}
_backgroundColor=_d1;
var _d2=objj_msgSend(_backgroundColor,"patternImage"),_d3=0;
if(objj_msgSend(_d2,"isThreePartImage")){
_backgroundType=objj_msgSend(_d2,"isVertical")?_5:_6;
_d3=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_d2,"isNinePartImage")){
_backgroundType=_7;
_d3=9-_DOMImageParts.length;
}else{
_backgroundType=_4;
_d3=0-_DOMImageParts.length;
}
}
if(_d3>0){
while(_d3--){
var _d4=_3.cloneNode(false);
_d4.style.zIndex=-1000;
_DOMImageParts.push(_d4);
_DOMElement.appendChild(_d4);
}
}else{
_d3=-_d3;
while(_d3--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_4){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _d5=objj_msgSend(_d2,"imageSlices"),_d6=MIN(_DOMImageParts.length,_d5.length),_d7=_frame.size;
while(_d6--){
var _d8=_d5[_d6],_d9=_DOMImageSizes[_d6]=_d8?objj_msgSend(_d8,"size"):{width:0,height:0};
if(!_DOMImageParts[_d6].CPDOMDisplayContext){
_DOMImageParts[_d6].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[_d6].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[_d6].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[_d6];
CPDOMDisplayServerInstructions[_da+2]=_d9.width;
CPDOMDisplayServerInstructions[_da+3]=_d9.height;
_DOMImageParts[_d6].style.background=_d8?"url(\""+objj_msgSend(_d8,"filename")+"\")":"";
}
if(_backgroundType==_7){
var _db=_d7.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_dc=_d7.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_da+2]=_db;
CPDOMDisplayServerInstructions[_da+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_da+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_da+3]=_dc;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_da+2]=_db;
CPDOMDisplayServerInstructions[_da+3]=_dc;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_da+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_da+3]=_dc;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_da+2]=_db;
CPDOMDisplayServerInstructions[_da+3]=_DOMImageSizes[7].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=1;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[3].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[3].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[4].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[4].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_da+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[5].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[5].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=1;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[6].CPDOMDisplayContext){
_DOMImageParts[6].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[6].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[6].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=2;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[6];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[7].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[7].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=2;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=_DOMImageSizes[6].width;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[8].CPDOMDisplayContext){
_DOMImageParts[8].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[8].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[8].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=3;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[8];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
}else{
if(_backgroundType==_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_da+2]=_d7.width;
CPDOMDisplayServerInstructions[_da+3]=_d7.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=2;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
}else{
if(_backgroundType==_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_da>=0)){
_da=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_da]=4;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_da+2]=_d7.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_da+3]=_d7.height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=0;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_da+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _da=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_da>=0)){
_da=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_da]=1;
CPDOMDisplayServerInstructions[_da+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_da+2]=NULL;
CPDOMDisplayServerInstructions[_da+3]=0;
CPDOMDisplayServerInstructions[_da+4]=0;
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_dd,_de){
with(_dd){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_df,_e0,_e1,_e2){
with(_df){
return CGPointApplyAffineTransform(_e1,_e3(_e2,_df));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_e4,_e5,_e6,_e7){
with(_e4){
return CGPointApplyAffineTransform(_e6,_e3(_e4,_e7));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_e8,_e9,_ea,_eb){
with(_e8){
return CGSizeApplyAffineTransform(_ea,_e3(_eb,_e8));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_ec,_ed,_ee,_ef){
with(_ec){
return CGSizeApplyAffineTransform(_ee,_e3(_ec,_ef));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_f0,_f1,_f2,_f3){
with(_f0){
return CGRectApplyAffineTransform(_f2,_e3(_f3,_f0));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_f4,_f5,_f6,_f7){
with(_f4){
return CGRectApplyAffineTransform(_f6,_e3(_f4,_f7));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_f8,_f9,_fa){
with(_f8){
_fa=!!_fa;
if(_postsFrameChangedNotifications===_fa){
return;
}
_postsFrameChangedNotifications=_fa;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_f8);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_fb,_fc){
with(_fb){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_fd,_fe,_ff){
with(_fd){
_ff=!!_ff;
if(_postsBoundsChangedNotifications===_ff){
return;
}
_postsBoundsChangedNotifications=_ff;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_fd);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(self,_cmd){
with(self){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_104,_105,_106,_107,_108,_109,_10a){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_104,objj_msgSend(self,"convertPoint:toView:",_105,nil),_106,_107,_108,_109,_10a);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_10d,_10e,_10f,_110,_111,_112,_113){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_10d,objj_msgSend(self,"convertPoint:toView:",_10e,nil),_10f,_110,_111,_112,_113);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_116){
with(self){
if(!_116||!objj_msgSend(_116,"count")){
return;
}
var _117=objj_msgSend(self,"window");
objj_msgSend(_117,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_116);
objj_msgSend(_117,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
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
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_11e){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_121){
with(self){
if(_121){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}else{
var _122=CPDOMDisplayServerViewsContext[objj_msgSend(self,"UID")];
if(typeof _122!="undefined"){
CPDOMDisplayServerViewsContext[objj_msgSend(self,"UID")];
CPDOMDisplayServerViews[_122]=NULL;
}
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_125){
with(self){
if(!(_viewClassFlags&_9)){
return;
}
if((_125.size.width<=0||_125.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_125,_dirtyRect);
}else{
_dirtyRect={origin:{x:_125.origin.x,y:_125.origin.y},size:{width:_125.size.width,height:_125.size.height}};
}
var _126=objj_msgSend(self,"UID");
if(typeof (CPDOMDisplayServerViewsContext[_126])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_126]=self;
}
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
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_12f){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_12f);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_132){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_132,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_135,_136){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_135);
objj_msgSend(self,"drawRect:",_135);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _13b=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_13b.DOMElement;
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
if(_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMContentsElement;
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_13b,YES);
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
_needsLayout=YES;
if(!(_viewClassFlags&_a)){
return;
}
var _140=objj_msgSend(self,"UID");
if(typeof (CPDOMDisplayServerViewsContext[_140])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_140]=self;
}
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
var _14b=_superview,_14c=objj_msgSend(CPClipView,"class");
while(_14b&&!objj_msgSend(_14b,"isKindOfClass:",_14c)){
_14b=_14b._superview;
}
return _14b;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_14f){
with(self){
var _150=objj_msgSend(self,"_enclosingClipView");
if(!_150){
return;
}
objj_msgSend(_150,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_14f,_150));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_153){
with(self){
var _154=objj_msgSend(self,"visibleRect");
_153=CGRectIntersection(_153,_bounds);
if((_153.size.width<=0||_153.size.height<=0)||CGRectContainsRect(_154,_153)){
return NO;
}
var _155=objj_msgSend(self,"_enclosingClipView");
if(!_155){
return NO;
}
var _156={x:_154.origin.x,y:_154.origin.y};
if((_153.origin.x)<=(_154.origin.x)){
_156.x=(_153.origin.x);
}else{
if((_153.origin.x+_153.size.width)>(_154.origin.x+_154.size.width)){
_156.x+=(_153.origin.x+_153.size.width)-(_154.origin.x+_154.size.width);
}
}
if((_153.origin.y)<=(_154.origin.y)){
_156.y=CGRectGetMinY(_153);
}else{
if((_153.origin.y+_153.size.height)>(_154.origin.y+_154.size.height)){
_156.y+=(_153.origin.y+_153.size.height)-(_154.origin.y+_154.size.height);
}
}
objj_msgSend(_155,"scrollToPoint:",CGPointMake(_156.x,_156.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_159){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_159);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_15c){
with(self){
return _15c;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_15f,_160){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _163=_superview,_164=objj_msgSend(CPScrollView,"class");
while(_163&&!objj_msgSend(_163,"isKindOfClass:",_164)){
_163=_163._superview;
}
return _163;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_167,_168){
with(self){
objj_msgSend(_167,"scrollToPoint:",_168);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_16b){
with(self){
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _16e=_3.style;
_16e.overflow="hidden";
_16e.position="absolute";
_16e.visibility="visible";
_16e.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _175=objj_msgSend(self,"nextKeyView");
while(_175&&!objj_msgSend(_175,"canBecomeKeyView")){
_175=objj_msgSend(_175,"nextKeyView");
}
return _175;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _17a=objj_msgSend(self,"previousKeyView");
while(_17a&&!objj_msgSend(_17a,"canBecomeKeyView")){
_17a=objj_msgSend(_17a,"previousKeyView");
}
return _17a;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_17d){
with(self){
_previousKeyView=_17d;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_183){
with(self){
if(_layer==_183){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_183;
if(_layer){
var _184=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_189){
with(self){
_wantsLayer=!!_189;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_190){
with(self){
return !!(_themeState&((typeof _190==="string")?CPThemeState(_190):_190));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_193){
with(self){
var _194=(typeof _193==="string")?CPThemeState(_193):_193;
if(_themeState&_194){
return NO;
}
_themeState|=_194;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_197){
with(self){
var _198=((typeof _197==="string")?CPThemeState(_197):_197);
if(!(_themeState&_198)){
return NO;
}
_themeState&=~_198;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _19b=objj_msgSend(self,"class"),_19c=objj_msgSend(_19b,"_themeAttributes"),_19d=_19c.length;
if(!_19d){
return;
}
var _19e=objj_msgSend(self,"theme"),_19f=objj_msgSend(_19b,"themeClass");
_themeAttributes={};
while(_19d--){
var _1a0=_19c[_19d--],_1a1=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_1a0,_19c[_19d]);
objj_msgSend(_1a1,"setParentAttribute:",objj_msgSend(_19e,"_attributeWithName:forClass:",_1a0,_19f));
_themeAttributes[_1a0]=_1a1;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_1a4){
with(self){
if(_theme===_1a4){
return;
}
_theme=_1a4;
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
var _1a9=objj_msgSend(self,"theme"),_1aa=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _1ab in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1ab)){
objj_msgSend(_themeAttributes[_1ab],"setParentAttribute:",objj_msgSend(_1a9,"_attributeWithName:forClass:",_1ab,_1aa));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _1ae=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1af=objj_msgSend(self,"theme");
for(var _1b0 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1b0)){
objj_msgSend(_1ae,"setObject:forKey:",_themeAttributes[_1b0],_1b0);
}
}
}
return _1ae;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_1b3,_1b4,_1b5){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b4]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b4+"'");
}
var _1b6=objj_msgSend(self,"currentValueForThemeAttribute:",_1b4);
objj_msgSend(_themeAttributes[_1b4],"setValue:forState:",_1b3,_1b5);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b4)===_1b6){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1b9,_1ba){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ba]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ba+"'");
}
var _1bb=objj_msgSend(self,"currentValueForThemeAttribute:",_1ba);
objj_msgSend(_themeAttributes[_1ba],"setValue:",_1b9);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1ba)===_1bb){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1be,_1bf){
with(self){
if(!_themeAttributes||!_themeAttributes[_1be]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1be+"'");
}
return objj_msgSend(_themeAttributes[_1be],"valueForState:",_1bf);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1c2){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c2]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c2+"'");
}
return objj_msgSend(_themeAttributes[_1c2],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1c5){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c5]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c5+"'");
}
return objj_msgSend(_themeAttributes[_1c5],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1c8){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1cb){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1ce,_1cf,_1d0){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1d1=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1ce);
if(_1d1&&!(_1d1.size.width<=0||_1d1.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1ce]){
_ephemeralSubviewsForNames[_1ce]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1ce);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1ce]);
if(_ephemeralSubviewsForNames[_1ce]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1ce],_1cf,_ephemeralSubviewsForNames[_1d0]);
}
}
if(_ephemeralSubviewsForNames[_1ce]){
objj_msgSend(_ephemeralSubviewsForNames[_1ce],"setFrame:",_1d1);
}
}else{
if(_ephemeralSubviewsForNames[_1ce]){
objj_msgSend(_ephemeralSubviewsForNames[_1ce],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1ce]);
delete _ephemeralSubviewsForNames[_1ce];
}
}
return _ephemeralSubviewsForNames[_1ce];
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
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
var _1d8=objj_msgSend(self,"class"),_1d9=objj_msgSend(CPView,"class"),_1da=[];
for(;_1d8&&_1d8!==_1d9;_1d8=objj_msgSend(_1d8,"superclass")){
var _1db=_2[class_getName(_1d8)];
if(_1db){
_1da=_1da.length?_1da.concat(_1db):_1da;
_2[objj_msgSend(self,"className")]=_1da;
break;
}
var _1dc=objj_msgSend(_1d8,"themeAttributes");
if(!_1dc){
continue;
}
var _1dd=objj_msgSend(_1dc,"allKeys"),_1de=_1dd.length;
while(_1de--){
var _1df=_1dd[_1de];
_1da.push(objj_msgSend(_1dc,"objectForKey:",_1df));
_1da.push(_1df);
}
}
return _1da;
}
})]);
var _1e0="CPViewAutoresizingMask",_1e1="CPViewAutoresizesSubviews",_1e2="CPViewBackgroundColor",_1e3="CPViewBoundsKey",_1e4="CPViewFrameKey",_1e5="CPViewHitTestsKey",_1e6="CPViewIsHiddenKey",_1e7="CPViewOpacityKey",_1e8="CPViewSubviewsKey",_1e9="CPViewSuperviewKey",_1ea="CPViewTagKey",_1eb="CPViewThemeStateKey",_1ec="CPViewWindowKey",_1ed="CPViewNextKeyViewKey",_1ee="CPViewPreviousKeyViewKey";
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1f1){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_1f1,"decodeRectForKey:",_1e4);
_bounds=objj_msgSend(_1f1,"decodeRectForKey:",_1e3);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1f1);
if(self){
_tag=objj_msgSend(_1f1,"containsValueForKey:",_1ea)?objj_msgSend(_1f1,"decodeIntForKey:",_1ea):-1;
_window=objj_msgSend(_1f1,"decodeObjectForKey:",_1ec);
_subviews=objj_msgSend(_1f1,"decodeObjectForKey:",_1e8)||[];
_superview=objj_msgSend(_1f1,"decodeObjectForKey:",_1e9);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1f1,"decodeIntForKey:",_1e0)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1f1,"containsValueForKey:",_1e1)||objj_msgSend(_1f1,"decodeBoolForKey:",_1e1);
_hitTests=!objj_msgSend(_1f1,"containsValueForKey:",_1e5)||objj_msgSend(_1f1,"decodeObjectForKey:",_1e5);
_DOMImageParts=[];
_DOMImageSizes=[];
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1f2=_DOMElement.CPDOMDisplayContext[0];
if(!(_1f2>=0)){
_1f2=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_1f2]=0;
CPDOMDisplayServerInstructions[_1f2+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1f2+2]=NULL;
CPDOMDisplayServerInstructions[_1f2+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_1f2+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1f2=_DOMElement.CPDOMDisplayContext[4];
if(!(_1f2>=0)){
_1f2=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_1f2]=4;
CPDOMDisplayServerInstructions[_1f2+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1f2+2]=(_frame.size.width);
CPDOMDisplayServerInstructions[_1f2+3]=(_frame.size.height);
var _1f3=0,_1f4=_subviews.length;
for(;_1f3<_1f4;++_1f3){
if(_subviews[_1f3]._DOMElement.CPDOMDisplayContext){
_subviews[_1f3]._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_1f3]._DOMElement;
}
if(objj_msgSend(_1f1,"containsValueForKey:",_1e6)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1f1,"decodeBoolForKey:",_1e6));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1f1,"containsValueForKey:",_1e7)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1f1,"decodeIntForKey:",_1e7));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1f1,"decodeObjectForKey:",_1e2));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1f1,"decodeIntForKey:",_1eb));
_themeAttributes={};
var _1f5=objj_msgSend(self,"class"),_1f6=objj_msgSend(_1f5,"themeClass"),_1f7=objj_msgSend(_1f5,"_themeAttributes"),_1f4=_1f7.length;
while(_1f4--){
var _1f8=_1f7[_1f4--];
_themeAttributes[_1f8]=CPThemeAttributeDecode(_1f1,_1f8,_1f7[_1f4],_theme,_1f6);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1fb){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1fb);
if(_tag!==-1){
objj_msgSend(_1fb,"encodeInt:forKey:",_tag,_1ea);
}
objj_msgSend(_1fb,"encodeRect:forKey:",_frame,_1e4);
objj_msgSend(_1fb,"encodeRect:forKey:",_bounds,_1e3);
if(_window!==nil){
objj_msgSend(_1fb,"encodeConditionalObject:forKey:",_window,_1ec);
}
var _1fc=objj_msgSend(_subviews,"count"),_1fd=_subviews;
if(_1fc>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1fd=objj_msgSend(_1fd,"copy");
while(_1fc--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1fd[_1fc])){
_1fd.splice(_1fc,1);
}
}
}
if(_1fd.length>0){
objj_msgSend(_1fb,"encodeObject:forKey:",_1fd,_1e8);
}
if(_superview!==nil){
objj_msgSend(_1fb,"encodeConditionalObject:forKey:",_superview,_1e9);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1fb,"encodeInt:forKey:",_autoresizingMask,_1e0);
}
if(!_autoresizesSubviews){
objj_msgSend(_1fb,"encodeBool:forKey:",_autoresizesSubviews,_1e1);
}
if(_backgroundColor!==nil){
objj_msgSend(_1fb,"encodeObject:forKey:",_backgroundColor,_1e2);
}
if(_hitTests!==YES){
objj_msgSend(_1fb,"encodeBool:forKey:",_hitTests,_1e5);
}
if(_opacity!==1){
objj_msgSend(_1fb,"encodeFloat:forKey:",_opacity,_1e7);
}
if(_isHidden){
objj_msgSend(_1fb,"encodeBool:forKey:",_isHidden,_1e6);
}
var _1fe=objj_msgSend(self,"nextKeyView");
if(_1fe!==nil){
objj_msgSend(_1fb,"encodeConditionalObject:forKey:",_1fe,_1ed);
}
var _1ff=objj_msgSend(self,"previousKeyView");
if(_1ff!==nil){
objj_msgSend(_1fb,"encodeConditionalObject:forKey:",_1ff,_1ee);
}
objj_msgSend(_1fb,"encodeInt:forKey:",CPThemeStateName(_themeState),_1eb);
for(var _200 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_200)){
CPThemeAttributeEncode(_1fb,_themeAttributes[_200]);
}
}
}
})]);
var _a4=function(_201){
var _202=_201._superview;
return {autoresizingMask:_201._autoresizingMask,frame:CGRectMakeCopy(_201._frame),index:(_202?objj_msgSend(_202._subviews,"indexOfObjectIdenticalTo:",_201):0),superview:_202};
};
var _e3=function(_203,_204){
var _205=CGAffineTransformMakeIdentity(),_206=YES,_207=nil,_208=nil;
if(_203){
var view=_203;
while(view&&view!=_204){
var _20a=view._frame;
_205.tx+=(_20a.origin.x);
_205.ty+=(_20a.origin.y);
if(view._boundsTransform){
var tx=_205.tx*view._boundsTransform.a+_205.ty*view._boundsTransform.c+view._boundsTransform.tx;
_205.ty=_205.tx*view._boundsTransform.b+_205.ty*view._boundsTransform.d+view._boundsTransform.ty;
_205.tx=tx;
var a=_205.a*view._boundsTransform.a+_205.b*view._boundsTransform.c,b=_205.a*view._boundsTransform.b+_205.b*view._boundsTransform.d,c=_205.c*view._boundsTransform.a+_205.d*view._boundsTransform.c;
_205.d=_205.c*view._boundsTransform.b+_205.d*view._boundsTransform.d;
_205.a=a;
_205.b=b;
_205.c=c;
}
view=view._superview;
}
if(view===_204){
return _205;
}else{
if(_203&&_204){
_207=objj_msgSend(_203,"window");
_208=objj_msgSend(_204,"window");
if(_207&&_208&&_207!==_208){
_206=NO;
var _20a=objj_msgSend(_207,"frame");
_205.tx+=(_20a.origin.x);
_205.ty+=(_20a.origin.y);
}
}
}
}
var view=_204;
while(view){
var _20a=view._frame;
_205.tx-=(_20a.origin.x);
_205.ty-=(_20a.origin.y);
if(view._boundsTransform){
var tx=_205.tx*view._inverseBoundsTransform.a+_205.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_205.ty=_205.tx*view._inverseBoundsTransform.b+_205.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_205.tx=tx;
var a=_205.a*view._inverseBoundsTransform.a+_205.b*view._inverseBoundsTransform.c,b=_205.a*view._inverseBoundsTransform.b+_205.b*view._inverseBoundsTransform.d,c=_205.c*view._inverseBoundsTransform.a+_205.d*view._inverseBoundsTransform.c;
_205.d=_205.c*view._inverseBoundsTransform.b+_205.d*view._inverseBoundsTransform.d;
_205.a=a;
_205.b=b;
_205.c=c;
}
view=view._superview;
}
if(!_206){
var _20a=objj_msgSend(_208,"frame");
_205.tx-=(_20a.origin.x);
_205.ty-=(_20a.origin.y);
}
return _205;
};
