I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;42884;
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
var _3=objj_allocateClassPair(CPResponder,"CPView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPResponder")},"init");
if(_7){
var _a=(_9.size.width),_b=(_9.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_9.origin.x,y:_9.origin.y},size:{width:_9.size.width,height:_9.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_a,height:_b}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_7,"_loadThemeAttributes");
}
return _7;
}
}),new objj_method(sel_getUid("superview"),function(_c,_d){
with(_c){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_e,_f){
with(_e){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_10,_11){
with(_10){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"_insertSubview:atIndex:",_14,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_15,_16,_17,_18,_19){
with(_15){
var _1a=_19?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_19):CPNotFound;
if(_1a===CPNotFound){
_1a=(_18===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_18===CPWindowAbove){
++_1a;
}
}
objj_msgSend(_15,"_insertSubview:atIndex:",_17,_1a);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_1b,_1c,_1d,_1e){
with(_1b){
var _1f=_subviews.length;
objj_msgSend(objj_msgSend(_1b,"window"),"_dirtyKeyViewLoop");
if(_1d._superview==_1b){
var _20=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_1d);
if(_20===_1e||_20===_1f-1&&_1e===_1f){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_20);
if(_1e>_20){
--_1e;
}
--_1f;
}else{
objj_msgSend(_1d,"removeFromSuperview");
objj_msgSend(_1d,"_setWindow:",_window);
objj_msgSend(_1d,"viewWillMoveToSuperview:",_1b);
_1d._superview=_1b;
}
if(_1e===CPNotFound||_1e>=_1f){
_subviews.push(_1d);
}else{
_subviews.splice(_1e,0,_1d);
}
objj_msgSend(_1d,"setNextResponder:",_1b);
objj_msgSend(_1d,"viewDidMoveToSuperview");
objj_msgSend(_1b,"didAddSubview:",_1d);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_21,_22,_23){
with(_21){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_24,_25){
with(_24){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_24,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_24);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_24);
_superview=nil;
objj_msgSend(_24,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_26,_27,_28,_29){
with(_26){
if(_28._superview!=_26){
return;
}
var _2a=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_28);
objj_msgSend(_28,"removeFromSuperview");
objj_msgSend(_26,"_insertSubview:atIndex:",_29,_2a);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_2b,_2c,_2d){
with(_2b){
if(_window===_2d){
return;
}
objj_msgSend(objj_msgSend(_2b,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_2b){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_2b,"viewWillMoveToWindow:",_2d);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_2d,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_2d;
var _2e=objj_msgSend(_subviews,"count");
while(_2e--){
objj_msgSend(_subviews[_2e],"_setWindow:",_2d);
}
objj_msgSend(_2b,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_2b,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_2f,_30,_31){
with(_2f){
var _32=_2f;
do{
if(_32==_31){
return YES;
}
}while(_32=objj_msgSend(_32,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_33,_34){
with(_33){
objj_msgSend(_33,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_35,_36){
with(_35){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_37,_38,_39){
with(_37){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_3a,_3b,_3c){
with(_3a){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_3d,_3e,_3f){
with(_3d){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_40,_41){
with(_40){
var _42=_40;
while(_42&&!objj_msgSend(_42,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_42=objj_msgSend(_42,"superview");
}
if(_42){
return _42._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_43,_44,_45){
with(_43){
_tag=_45;
}
}),new objj_method(sel_getUid("tag"),function(_46,_47){
with(_46){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_48,_49,_4a){
with(_48){
if(objj_msgSend(_48,"tag")===_4a){
return _48;
}
var _4b=0,_4c=_subviews.length;
for(;_4b<_4c;++_4b){
var _4d=objj_msgSend(_subviews[_4b],"viewWithTag:",_4a);
if(_4d){
return _4d;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_4e,_4f){
with(_4e){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_50,_51,_52){
with(_50){
if(((_frame.origin.x==_52.origin.x&&_frame.origin.y==_52.origin.y)&&(_frame.size.width==_52.size.width&&_frame.size.height==_52.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_50,"setFrameOrigin:",_52.origin);
objj_msgSend(_50,"setFrameSize:",_52.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_50);
}
}
}),new objj_method(sel_getUid("frame"),function(_53,_54){
with(_53){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_55,_56){
with(_55){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_57,_58){
with(_57){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"setFrameOrigin:",CGPointMake(_5b.x-_frame.size.width/2,_5b.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_5c,_5d){
with(_5c){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_5e,_5f,_60){
with(_5e){
var _61=_frame.origin;
if(!_60||(_61.x==_60.x&&_61.y==_60.y)){
return;
}
_61.x=_60.x;
_61.y=_60.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5e);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_62,_63,_64){
with(_62){
var _65=_frame.size;
if(!_64||(_65.width==_64.width&&_65.height==_64.height)){
return;
}
var _66={width:_65.width,height:_65.height};
_65.width=_64.width;
_65.height=_64.height;
if(YES){
_bounds.size.width=_64.width;
_bounds.size.height=_64.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_62,"resizeSubviewsWithOldSize:",_66);
}
objj_msgSend(_62,"setNeedsLayout");
objj_msgSend(_62,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_62);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_67,_68,_69){
with(_67){
if(((_bounds.origin.x==_69.origin.x&&_bounds.origin.y==_69.origin.y)&&(_bounds.size.width==_69.size.width&&_bounds.size.height==_69.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_67,"setBoundsOrigin:",_69.origin);
objj_msgSend(_67,"setBoundsSize:",_69.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_67);
}
}
}),new objj_method(sel_getUid("bounds"),function(_6a,_6b){
with(_6a){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=_bounds.origin;
if((_6f.x==_6e.x&&_6f.y==_6e.y)){
return;
}
_6f.x=_6e.x;
_6f.y=_6e.y;
if(_6f.x!=0||_6f.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_6f.x,ty:-_6f.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6c);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_70,_71,_72){
with(_70){
var _73=_bounds.size;
if((_73.width==_72.width&&_73.height==_72.height)){
return;
}
var _74=_frame.size;
if(!(_73.width==_74.width&&_73.height==_74.height)){
var _75=_bounds.origin;
_75.x/=_73.width/_74.width;
_75.y/=_73.height/_74.height;
}
_73.width=_72.width;
_73.height=_72.height;
if(!(_73.width==_74.width&&_73.height==_74.height)){
var _75=_bounds.origin;
_75.x*=_73.width/_74.width;
_75.y*=_73.height/_74.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_70);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"autoresizingMask");
if(_79==CPViewNotSizable){
return;
}
var _7a=_superview._frame,_7b={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_7a.size.width)-_78.width)/(((_79&CPViewMinXMargin)?1:0)+(_79&CPViewWidthSizable?1:0)+(_79&CPViewMaxXMargin?1:0)),dY=((_7a.size.height)-_78.height)/((_79&CPViewMinYMargin?1:0)+(_79&CPViewHeightSizable?1:0)+(_79&CPViewMaxYMargin?1:0));
if(_79&CPViewMinXMargin){
_7b.origin.x+=dX;
}
if(_79&CPViewWidthSizable){
_7b.size.width+=dX;
}
if(_79&CPViewMinYMargin){
_7b.origin.y+=dY;
}
if(_79&CPViewHeightSizable){
_7b.size.height+=dY;
}
objj_msgSend(_76,"setFrame:",_7b);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_7e,_7f,_80){
with(_7e){
var _81=_subviews.length;
while(_81--){
objj_msgSend(_subviews[_81],"resizeWithOldSuperviewSize:",_80);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_82,_83,_84){
with(_82){
_autoresizesSubviews=!!_84;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_85,_86){
with(_85){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_87,_88,_89){
with(_87){
_autoresizingMask=_89;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_8a,_8b){
with(_8a){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_8c,_8d){
with(_8c){
return objj_msgSend(_8c,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_8e,_8f,_90,_91){
with(_8e){
_fullScreenModeState=_92(_8e);
var _93=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_93,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_93,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _94=objj_msgSend(_93,"contentView");
objj_msgSend(_94,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_94,"addSubview:",_8e);
objj_msgSend(_8e,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_8e,"setFrame:",CGRectMakeCopy(objj_msgSend(_94,"bounds")));
objj_msgSend(_93,"makeKeyAndOrderFront:",_8e);
objj_msgSend(_93,"makeFirstResponder:",_8e);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_95,_96){
with(_95){
objj_msgSend(_95,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_97,_98,_99){
with(_97){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_97,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_97,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_97,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_97,"window"),"orderOut:",_97);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_9a,_9b){
with(_9a){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_9c,_9d,_9e){
with(_9c){
_9e=!!_9e;
if(_isHidden===_9e){
return;
}
_isHidden=_9e;
if(_9e){
var _9f=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_9f,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_9c==_9f){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_9c,"nextValidKeyView"));
break;
}
}while(_9f=objj_msgSend(_9f,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_a0,_a1){
with(_a0){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_a2,_a3,_a4){
with(_a2){
if(_opacity==_a4){
return;
}
_opacity=_a4;
}
}),new objj_method(sel_getUid("alphaValue"),function(_a5,_a6){
with(_a5){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_a7,_a8){
with(_a7){
var _a9=_a7;
while(_a9&&!objj_msgSend(_a9,"isHidden")){
_a9=objj_msgSend(_a9,"superview");
}
return _a9!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_aa,_ab,_ac){
with(_aa){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_ad,_ae){
with(_ad){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_af,_b0,_b1){
with(_af){
_hitTests=!!_b1;
}
}),new objj_method(sel_getUid("hitTest:"),function(_b2,_b3,_b4){
with(_b2){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_b4)){
return nil;
}
var _b5=nil,i=_subviews.length,_b7={x:_b4.x-(_frame.origin.x),y:_b4.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_b7={x:_b7.x*_inverseBoundsTransform.a+_b7.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_b7.x*_inverseBoundsTransform.b+_b7.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_b5=objj_msgSend(_subviews[i],"hitTest:",_b7)){
return _b5;
}
}
return _b2;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_b8,_b9){
with(_b8){
return !objj_msgSend(_b8,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_ba,_bb,_bc){
with(_ba){
if(objj_msgSend(_ba,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_ba,super_class:objj_getClass("CPResponder")},"mouseDown:",_bc);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_bd,_be,_bf){
with(_bd){
if(_backgroundColor==_bf){
return;
}
_backgroundColor=_bf;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_c0,_c1){
with(_c0){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_c2,_c3,_c4,_c5){
with(_c2){
return CGPointApplyAffineTransform(_c4,_c6(_c5,_c2));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_c7,_c8,_c9,_ca){
with(_c7){
return CGPointApplyAffineTransform(_c9,_c6(_c7,_ca));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_cb,_cc,_cd,_ce){
with(_cb){
return CGSizeApplyAffineTransform(_cd,_c6(_ce,_cb));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_cf,_d0,_d1,_d2){
with(_cf){
return CGSizeApplyAffineTransform(_d1,_c6(_cf,_d2));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_d3,_d4,_d5,_d6){
with(_d3){
return CGRectApplyAffineTransform(_d5,_c6(_d6,_d3));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_d7,_d8,_d9,_da){
with(_d7){
return CGRectApplyAffineTransform(_d9,_c6(_d7,_da));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_db,_dc,_dd){
with(_db){
_dd=!!_dd;
if(_postsFrameChangedNotifications===_dd){
return;
}
_postsFrameChangedNotifications=_dd;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_db);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_de,_df){
with(_de){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_e0,_e1,_e2){
with(_e0){
_e2=!!_e2;
if(_postsBoundsChangedNotifications===_e2){
return;
}
_postsBoundsChangedNotifications=_e2;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_e0);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_e3,_e4){
with(_e3){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_e5,_e6,_e7,_e8,_e9,_ea,_eb,_ec,_ed){
with(_e5){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_e7,objj_msgSend(_e5,"convertPoint:toView:",_e8,nil),_e9,_ea,_eb,_ec,_ed);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_ee,_ef,_f0,_f1,_f2,_f3,_f4,_f5,_f6){
with(_ee){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_f0,objj_msgSend(_ee,"convertPoint:toView:",_f1,nil),_f2,_f3,_f4,_f5,_f6);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_f7,_f8,_f9){
with(_f7){
if(!_f9||!objj_msgSend(_f9,"count")){
return;
}
var _fa=objj_msgSend(_f7,"window");
objj_msgSend(_fa,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_f9);
objj_msgSend(_fa,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_fb,_fc){
with(_fb){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_fd,_fe){
with(_fd){
objj_msgSend(objj_msgSend(_fd,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(_ff,_cmd,_101){
with(_ff){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_104){
with(self){
if(_104){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_107){
with(self){
if((_107.size.width<=0||_107.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_107,_dirtyRect);
}else{
_dirtyRect={origin:{x:_107.origin.x,y:_107.origin.y},size:{width:_107.size.width,height:_107.size.height}};
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
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_110){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_110);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_113){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_113,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_116,_117){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_116);
objj_msgSend(self,"drawRect:",_116);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _11c=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_11c.DOMElement;
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
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_11c,YES);
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
var _12b=_superview,_12c=objj_msgSend(CPClipView,"class");
while(_12b&&!objj_msgSend(_12b,"isKindOfClass:",_12c)){
_12b=_12b._superview;
}
return _12b;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_12f){
with(self){
var _130=objj_msgSend(self,"_enclosingClipView");
if(!_130){
return;
}
objj_msgSend(_130,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_12f,_130));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_133){
with(self){
var _134=objj_msgSend(self,"visibleRect");
_133=CGRectIntersection(_133,_bounds);
if((_133.size.width<=0||_133.size.height<=0)||CGRectContainsRect(_134,_133)){
return NO;
}
var _135=objj_msgSend(self,"_enclosingClipView");
if(!_135){
return NO;
}
var _136={x:_134.origin.x,y:_134.origin.y};
if((_133.origin.x)<=(_134.origin.x)){
_136.x=(_133.origin.x);
}else{
if((_133.origin.x+_133.size.width)>(_134.origin.x+_134.size.width)){
_136.x+=(_133.origin.x+_133.size.width)-(_134.origin.x+_134.size.width);
}
}
if((_133.origin.y)<=(_134.origin.y)){
_136.y=CGRectGetMinY(_133);
}else{
if((_133.origin.y+_133.size.height)>(_134.origin.y+_134.size.height)){
_136.y+=(_133.origin.y+_133.size.height)-(_134.origin.y+_134.size.height);
}
}
objj_msgSend(_135,"scrollToPoint:",CGPointMake(_136.x,_136.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_139){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_139);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_13c){
with(self){
return _13c;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_13f,_140){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _143=_superview,_144=objj_msgSend(CPScrollView,"class");
while(_143&&!objj_msgSend(_143,"isKindOfClass:",_144)){
_143=_143._superview;
}
return _143;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_147,_148){
with(self){
objj_msgSend(_147,"scrollToPoint:",_148);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_14b){
with(self){
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
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
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _156=objj_msgSend(self,"nextKeyView");
while(_156&&!objj_msgSend(_156,"canBecomeKeyView")){
_156=objj_msgSend(_156,"nextKeyView");
}
return _156;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _15b=objj_msgSend(self,"previousKeyView");
while(_15b&&!objj_msgSend(_15b,"canBecomeKeyView")){
_15b=objj_msgSend(_15b,"previousKeyView");
}
return _15b;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_15e){
with(self){
_previousKeyView=_15e;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_164){
with(self){
if(_layer==_164){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_164;
if(_layer){
var _165=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_16a){
with(self){
_wantsLayer=!!_16a;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_171){
with(self){
return !!(_themeState&((typeof _171==="string")?CPThemeState(_171):_171));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_174){
with(self){
var _175=(typeof _174==="string")?CPThemeState(_174):_174;
if(_themeState&_175){
return NO;
}
_themeState|=_175;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_178){
with(self){
var _179=((typeof _178==="string")?CPThemeState(_178):_178);
if(!(_themeState&_179)){
return NO;
}
_themeState&=~_179;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _17c=objj_msgSend(self,"class"),_17d=objj_msgSend(_17c,"_themeAttributes"),_17e=_17d.length;
if(!_17e){
return;
}
var _17f=objj_msgSend(self,"theme"),_180=objj_msgSend(_17c,"themeClass");
_themeAttributes={};
while(_17e--){
var _181=_17d[_17e--],_182=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_181,_17d[_17e]);
objj_msgSend(_182,"setParentAttribute:",objj_msgSend(_17f,"_attributeWithName:forClass:",_181,_180));
_themeAttributes[_181]=_182;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_185){
with(self){
if(_theme===_185){
return;
}
_theme=_185;
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
var _18a=objj_msgSend(self,"theme"),_18b=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _18c in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_18c)){
objj_msgSend(_themeAttributes[_18c],"setParentAttribute:",objj_msgSend(_18a,"_attributeWithName:forClass:",_18c,_18b));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _18f=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _190=objj_msgSend(self,"theme");
for(var _191 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_191)){
objj_msgSend(_18f,"setObject:forKey:",_themeAttributes[_191],_191);
}
}
}
return _18f;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_194,_195,_196){
with(self){
if(!_themeAttributes||!_themeAttributes[_195]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_195+"'");
}
var _197=objj_msgSend(self,"currentValueForThemeAttribute:",_195);
objj_msgSend(_themeAttributes[_195],"setValue:forState:",_194,_196);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_195)===_197){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_19a,_19b){
with(self){
if(!_themeAttributes||!_themeAttributes[_19b]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_19b+"'");
}
var _19c=objj_msgSend(self,"currentValueForThemeAttribute:",_19b);
objj_msgSend(_themeAttributes[_19b],"setValue:",_19a);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_19b)===_19c){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_19f,_1a0){
with(self){
if(!_themeAttributes||!_themeAttributes[_19f]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_19f+"'");
}
return objj_msgSend(_themeAttributes[_19f],"valueForState:",_1a0);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1a3){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a3]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a3+"'");
}
return objj_msgSend(_themeAttributes[_1a3],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1a6){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a6]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a6+"'");
}
return objj_msgSend(_themeAttributes[_1a6],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1a9){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1ac){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1af,_1b0,_1b1){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1b2=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1af);
if(_1b2&&!(_1b2.size.width<=0||_1b2.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1af]){
_ephemeralSubviewsForNames[_1af]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1af);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1af]);
if(_ephemeralSubviewsForNames[_1af]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1af],_1b0,_ephemeralSubviewsForNames[_1b1]);
}
}
if(_ephemeralSubviewsForNames[_1af]){
objj_msgSend(_ephemeralSubviewsForNames[_1af],"setFrame:",_1b2);
}
}else{
if(_ephemeralSubviewsForNames[_1af]){
objj_msgSend(_ephemeralSubviewsForNames[_1af],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1af]);
delete _ephemeralSubviewsForNames[_1af];
}
}
return _ephemeralSubviewsForNames[_1af];
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
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
var _1b9=objj_msgSend(self,"class"),_1ba=objj_msgSend(CPView,"class"),_1bb=[];
for(;_1b9&&_1b9!==_1ba;_1b9=objj_msgSend(_1b9,"superclass")){
var _1bc=_2[class_getName(_1b9)];
if(_1bc){
_1bb=_1bb.length?_1bb.concat(_1bc):_1bb;
_2[objj_msgSend(self,"className")]=_1bb;
break;
}
var _1bd=objj_msgSend(_1b9,"themeAttributes");
if(!_1bd){
continue;
}
var _1be=objj_msgSend(_1bd,"allKeys"),_1bf=_1be.length;
while(_1bf--){
var _1c0=_1be[_1bf];
_1bb.push(objj_msgSend(_1bd,"objectForKey:",_1c0));
_1bb.push(_1c0);
}
}
return _1bb;
}
})]);
var _1c1="CPViewAutoresizingMask",_1c2="CPViewAutoresizesSubviews",_1c3="CPViewBackgroundColor",_1c4="CPViewBoundsKey",_1c5="CPViewFrameKey",_1c6="CPViewHitTestsKey",_1c7="CPViewIsHiddenKey",_1c8="CPViewOpacityKey",_1c9="CPViewSubviewsKey",_1ca="CPViewSuperviewKey",_1cb="CPViewTagKey",_1cc="CPViewThemeStateKey",_1cd="CPViewWindowKey",_1ce="CPViewNextKeyViewKey",_1cf="CPViewPreviousKeyViewKey";
var _3=objj_getClass("CPView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1d2){
with(self){
_frame=objj_msgSend(_1d2,"decodeRectForKey:",_1c5);
_bounds=objj_msgSend(_1d2,"decodeRectForKey:",_1c4);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1d2);
if(self){
_tag=objj_msgSend(_1d2,"containsValueForKey:",_1cb)?objj_msgSend(_1d2,"decodeIntForKey:",_1cb):-1;
_window=objj_msgSend(_1d2,"decodeObjectForKey:",_1cd);
_subviews=objj_msgSend(_1d2,"decodeObjectForKey:",_1c9)||[];
_superview=objj_msgSend(_1d2,"decodeObjectForKey:",_1ca);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1d2,"decodeIntForKey:",_1c1)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1d2,"containsValueForKey:",_1c2)||objj_msgSend(_1d2,"decodeBoolForKey:",_1c2);
_hitTests=!objj_msgSend(_1d2,"containsValueForKey:",_1c6)||objj_msgSend(_1d2,"decodeObjectForKey:",_1c6);
if(objj_msgSend(_1d2,"containsValueForKey:",_1c7)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1d2,"decodeBoolForKey:",_1c7));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1d2,"containsValueForKey:",_1c8)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1d2,"decodeIntForKey:",_1c8));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1d2,"decodeObjectForKey:",_1c3));
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1d2,"decodeIntForKey:",_1cc));
_themeAttributes={};
var _1d3=objj_msgSend(self,"class"),_1d4=objj_msgSend(_1d3,"themeClass"),_1d5=objj_msgSend(_1d3,"_themeAttributes"),_1d6=_1d5.length;
while(_1d6--){
var _1d7=_1d5[_1d6--];
_themeAttributes[_1d7]=CPThemeAttributeDecode(_1d2,_1d7,_1d5[_1d6],_theme,_1d4);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1da){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1da);
if(_tag!==-1){
objj_msgSend(_1da,"encodeInt:forKey:",_tag,_1cb);
}
objj_msgSend(_1da,"encodeRect:forKey:",_frame,_1c5);
objj_msgSend(_1da,"encodeRect:forKey:",_bounds,_1c4);
if(_window!==nil){
objj_msgSend(_1da,"encodeConditionalObject:forKey:",_window,_1cd);
}
var _1db=objj_msgSend(_subviews,"count"),_1dc=_subviews;
if(_1db>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1dc=objj_msgSend(_1dc,"copy");
while(_1db--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1dc[_1db])){
_1dc.splice(_1db,1);
}
}
}
if(_1dc.length>0){
objj_msgSend(_1da,"encodeObject:forKey:",_1dc,_1c9);
}
if(_superview!==nil){
objj_msgSend(_1da,"encodeConditionalObject:forKey:",_superview,_1ca);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1da,"encodeInt:forKey:",_autoresizingMask,_1c1);
}
if(!_autoresizesSubviews){
objj_msgSend(_1da,"encodeBool:forKey:",_autoresizesSubviews,_1c2);
}
if(_backgroundColor!==nil){
objj_msgSend(_1da,"encodeObject:forKey:",_backgroundColor,_1c3);
}
if(_hitTests!==YES){
objj_msgSend(_1da,"encodeBool:forKey:",_hitTests,_1c6);
}
if(_opacity!==1){
objj_msgSend(_1da,"encodeFloat:forKey:",_opacity,_1c8);
}
if(_isHidden){
objj_msgSend(_1da,"encodeBool:forKey:",_isHidden,_1c7);
}
var _1dd=objj_msgSend(self,"nextKeyView");
if(_1dd!==nil){
objj_msgSend(_1da,"encodeConditionalObject:forKey:",_1dd,_1ce);
}
var _1de=objj_msgSend(self,"previousKeyView");
if(_1de!==nil){
objj_msgSend(_1da,"encodeConditionalObject:forKey:",_1de,_1cf);
}
objj_msgSend(_1da,"encodeInt:forKey:",CPThemeStateName(_themeState),_1cc);
for(var _1df in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1df)){
CPThemeAttributeEncode(_1da,_themeAttributes[_1df]);
}
}
}
})]);
var _92=function(_1e0){
var _1e1=_1e0._superview;
return {autoresizingMask:_1e0._autoresizingMask,frame:CGRectMakeCopy(_1e0._frame),index:(_1e1?objj_msgSend(_1e1._subviews,"indexOfObjectIdenticalTo:",_1e0):0),superview:_1e1};
};
var _c6=function(_1e2,_1e3){
var _1e4=CGAffineTransformMakeIdentity(),_1e5=YES,_1e6=nil,_1e7=nil;
if(_1e2){
var view=_1e2;
while(view&&view!=_1e3){
var _1e9=view._frame;
_1e4.tx+=(_1e9.origin.x);
_1e4.ty+=(_1e9.origin.y);
if(view._boundsTransform){
var tx=_1e4.tx*view._boundsTransform.a+_1e4.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1e4.ty=_1e4.tx*view._boundsTransform.b+_1e4.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1e4.tx=tx;
var a=_1e4.a*view._boundsTransform.a+_1e4.b*view._boundsTransform.c,b=_1e4.a*view._boundsTransform.b+_1e4.b*view._boundsTransform.d,c=_1e4.c*view._boundsTransform.a+_1e4.d*view._boundsTransform.c;
_1e4.d=_1e4.c*view._boundsTransform.b+_1e4.d*view._boundsTransform.d;
_1e4.a=a;
_1e4.b=b;
_1e4.c=c;
}
view=view._superview;
}
if(view===_1e3){
return _1e4;
}else{
if(_1e2&&_1e3){
_1e6=objj_msgSend(_1e2,"window");
_1e7=objj_msgSend(_1e3,"window");
if(_1e6&&_1e7&&_1e6!==_1e7){
_1e5=NO;
var _1e9=objj_msgSend(_1e6,"frame");
_1e4.tx+=(_1e9.origin.x);
_1e4.ty+=(_1e9.origin.y);
}
}
}
}
var view=_1e3;
while(view){
var _1e9=view._frame;
_1e4.tx-=(_1e9.origin.x);
_1e4.ty-=(_1e9.origin.y);
if(view._boundsTransform){
var tx=_1e4.tx*view._inverseBoundsTransform.a+_1e4.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1e4.ty=_1e4.tx*view._inverseBoundsTransform.b+_1e4.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1e4.tx=tx;
var a=_1e4.a*view._inverseBoundsTransform.a+_1e4.b*view._inverseBoundsTransform.c,b=_1e4.a*view._inverseBoundsTransform.b+_1e4.b*view._inverseBoundsTransform.d,c=_1e4.c*view._inverseBoundsTransform.a+_1e4.d*view._inverseBoundsTransform.c;
_1e4.d=_1e4.c*view._inverseBoundsTransform.b+_1e4.d*view._inverseBoundsTransform.d;
_1e4.a=a;
_1e4.b=b;
_1e4.c=c;
}
view=view._superview;
}
if(!_1e5){
var _1e9=objj_msgSend(_1e7,"frame");
_1e4.tx-=(_1e9.origin.x);
_1e4.ty-=(_1e9.origin.y);
}
return _1e4;
};
