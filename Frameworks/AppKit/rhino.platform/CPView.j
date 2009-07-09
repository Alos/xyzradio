I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;43151;
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
}),new objj_method(sel_getUid("setCenter:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"setFrameOrigin:",CGPointMake(_5f.x-_frame.size.width/2,_5f.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_60,_61){
with(_60){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_62,_63,_64){
with(_62){
var _65=_frame.origin;
if(!_64||(_65.x==_64.x&&_65.y==_64.y)){
return;
}
_65.x=_64.x;
_65.y=_64.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_62);
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_66,_67,_68){
with(_66){
var _69=_frame.size;
if(!_68||(_69.width==_68.width&&_69.height==_68.height)){
return;
}
var _6a={width:_69.width,height:_69.height};
_69.width=_68.width;
_69.height=_68.height;
if(YES){
_bounds.size.width=_68.width;
_bounds.size.height=_68.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_66,"resizeSubviewsWithOldSize:",_6a);
}
objj_msgSend(_66,"setNeedsLayout");
objj_msgSend(_66,"setNeedsDisplay:",YES);
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_66);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_6b,_6c,_6d){
with(_6b){
if(((_bounds.origin.x==_6d.origin.x&&_bounds.origin.y==_6d.origin.y)&&(_bounds.size.width==_6d.size.width&&_bounds.size.height==_6d.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_6b,"setBoundsOrigin:",_6d.origin);
objj_msgSend(_6b,"setBoundsSize:",_6d.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6b);
}
}
}),new objj_method(sel_getUid("bounds"),function(_6e,_6f){
with(_6e){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_70,_71,_72){
with(_70){
var _73=_bounds.origin;
if((_73.x==_72.x&&_73.y==_72.y)){
return;
}
_73.x=_72.x;
_73.y=_72.y;
if(_73.x!=0||_73.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_73.x,ty:-_73.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_70);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_74,_75,_76){
with(_74){
var _77=_bounds.size;
if((_77.width==_76.width&&_77.height==_76.height)){
return;
}
var _78=_frame.size;
if(!(_77.width==_78.width&&_77.height==_78.height)){
var _79=_bounds.origin;
_79.x/=_77.width/_78.width;
_79.y/=_77.height/_78.height;
}
_77.width=_76.width;
_77.height=_76.height;
if(!(_77.width==_78.width&&_77.height==_78.height)){
var _79=_bounds.origin;
_79.x*=_77.width/_78.width;
_79.y*=_77.height/_78.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_74);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_7a,_7b,_7c){
with(_7a){
var _7d=objj_msgSend(_7a,"autoresizingMask");
if(_7d==CPViewNotSizable){
return;
}
var _7e=_superview._frame,_7f={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_7e.size.width)-_7c.width)/(((_7d&CPViewMinXMargin)?1:0)+(_7d&CPViewWidthSizable?1:0)+(_7d&CPViewMaxXMargin?1:0)),dY=((_7e.size.height)-_7c.height)/((_7d&CPViewMinYMargin?1:0)+(_7d&CPViewHeightSizable?1:0)+(_7d&CPViewMaxYMargin?1:0));
if(_7d&CPViewMinXMargin){
_7f.origin.x+=dX;
}
if(_7d&CPViewWidthSizable){
_7f.size.width+=dX;
}
if(_7d&CPViewMinYMargin){
_7f.origin.y+=dY;
}
if(_7d&CPViewHeightSizable){
_7f.size.height+=dY;
}
objj_msgSend(_7a,"setFrame:",_7f);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_82,_83,_84){
with(_82){
var _85=_subviews.length;
while(_85--){
objj_msgSend(_subviews[_85],"resizeWithOldSuperviewSize:",_84);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_86,_87,_88){
with(_86){
_autoresizesSubviews=!!_88;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_89,_8a){
with(_89){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_8b,_8c,_8d){
with(_8b){
_autoresizingMask=_8d;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_8e,_8f){
with(_8e){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_90,_91){
with(_90){
return objj_msgSend(_90,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_92,_93,_94,_95){
with(_92){
_fullScreenModeState=_96(_92);
var _97=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_97,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_97,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _98=objj_msgSend(_97,"contentView");
objj_msgSend(_98,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_98,"addSubview:",_92);
objj_msgSend(_92,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_92,"setFrame:",CGRectMakeCopy(objj_msgSend(_98,"bounds")));
objj_msgSend(_97,"makeKeyAndOrderFront:",_92);
objj_msgSend(_97,"makeFirstResponder:",_92);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_99,_9a){
with(_99){
objj_msgSend(_99,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_9b,_9c,_9d){
with(_9b){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_9b,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_9b,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_9b,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_9b,"window"),"orderOut:",_9b);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_9e,_9f){
with(_9e){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_a0,_a1,_a2){
with(_a0){
_a2=!!_a2;
if(_isHidden===_a2){
return;
}
_isHidden=_a2;
if(_a2){
var _a3=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_a3,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_a0==_a3){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_a0,"nextValidKeyView"));
break;
}
}while(_a3=objj_msgSend(_a3,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_a4,_a5){
with(_a4){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_a6,_a7,_a8){
with(_a6){
if(_opacity==_a8){
return;
}
_opacity=_a8;
}
}),new objj_method(sel_getUid("alphaValue"),function(_a9,_aa){
with(_a9){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_ab,_ac){
with(_ab){
var _ad=_ab;
while(_ad&&!objj_msgSend(_ad,"isHidden")){
_ad=objj_msgSend(_ad,"superview");
}
return _ad!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_ae,_af,_b0){
with(_ae){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_b1,_b2){
with(_b1){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_b3,_b4,_b5){
with(_b3){
_hitTests=!!_b5;
}
}),new objj_method(sel_getUid("hitTest:"),function(_b6,_b7,_b8){
with(_b6){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_b8)){
return nil;
}
var _b9=nil,i=_subviews.length,_bb={x:_b8.x-(_frame.origin.x),y:_b8.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_bb={x:_bb.x*_inverseBoundsTransform.a+_bb.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_bb.x*_inverseBoundsTransform.b+_bb.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_b9=objj_msgSend(_subviews[i],"hitTest:",_bb)){
return _b9;
}
}
return _b6;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_bc,_bd){
with(_bc){
return !objj_msgSend(_bc,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_be,_bf,_c0){
with(_be){
if(objj_msgSend(_be,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_be,super_class:objj_getClass("CPResponder")},"mouseDown:",_c0);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_c1,_c2,_c3){
with(_c1){
if(_backgroundColor==_c3){
return;
}
_backgroundColor=_c3;
}
}),new objj_method(sel_getUid("backgroundColor"),function(_c4,_c5){
with(_c4){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_c6,_c7,_c8,_c9){
with(_c6){
return CGPointApplyAffineTransform(_c8,_ca(_c9,_c6));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_cb,_cc,_cd,_ce){
with(_cb){
return CGPointApplyAffineTransform(_cd,_ca(_cb,_ce));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_cf,_d0,_d1,_d2){
with(_cf){
return CGSizeApplyAffineTransform(_d1,_ca(_d2,_cf));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_d3,_d4,_d5,_d6){
with(_d3){
return CGSizeApplyAffineTransform(_d5,_ca(_d3,_d6));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_d7,_d8,_d9,_da){
with(_d7){
return CGRectApplyAffineTransform(_d9,_ca(_da,_d7));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_db,_dc,_dd,_de){
with(_db){
return CGRectApplyAffineTransform(_dd,_ca(_db,_de));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_df,_e0,_e1){
with(_df){
_e1=!!_e1;
if(_postsFrameChangedNotifications===_e1){
return;
}
_postsFrameChangedNotifications=_e1;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_df);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_e2,_e3){
with(_e2){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_e4,_e5,_e6){
with(_e4){
_e6=!!_e6;
if(_postsBoundsChangedNotifications===_e6){
return;
}
_postsBoundsChangedNotifications=_e6;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_e4);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_e7,_e8){
with(_e7){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_e9,_ea,_eb,_ec,_ed,_ee,_ef,_f0,_f1){
with(_e9){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_eb,objj_msgSend(_e9,"convertPoint:toView:",_ec,nil),_ed,_ee,_ef,_f0,_f1);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f2,_f3,_f4,_f5,_f6,_f7,_f8,_f9,_fa){
with(_f2){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_f4,objj_msgSend(_f2,"convertPoint:toView:",_f5,nil),_f6,_f7,_f8,_f9,_fa);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_fb,_fc,_fd){
with(_fb){
if(!_fd||!objj_msgSend(_fd,"count")){
return;
}
var _fe=objj_msgSend(_fb,"window");
objj_msgSend(_fe,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_fd);
objj_msgSend(_fe,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_ff,_cmd){
with(_ff){
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
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_105){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_108){
with(self){
if(_108){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_10b){
with(self){
if((_10b.size.width<=0||_10b.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_10b,_dirtyRect);
}else{
_dirtyRect={origin:{x:_10b.origin.x,y:_10b.origin.y},size:{width:_10b.size.width,height:_10b.size.height}};
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
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_114){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_114);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_117){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_117,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_11a,_11b){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_11a);
objj_msgSend(self,"drawRect:",_11a);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _120=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_120.DOMElement;
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
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_120,YES);
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
var _12f=_superview,_130=objj_msgSend(CPClipView,"class");
while(_12f&&!objj_msgSend(_12f,"isKindOfClass:",_130)){
_12f=_12f._superview;
}
return _12f;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_133){
with(self){
var _134=objj_msgSend(self,"_enclosingClipView");
if(!_134){
return;
}
objj_msgSend(_134,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_133,_134));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_137){
with(self){
var _138=objj_msgSend(self,"visibleRect");
_137=CGRectIntersection(_137,_bounds);
if((_137.size.width<=0||_137.size.height<=0)||CGRectContainsRect(_138,_137)){
return NO;
}
var _139=objj_msgSend(self,"_enclosingClipView");
if(!_139){
return NO;
}
var _13a={x:_138.origin.x,y:_138.origin.y};
if((_137.origin.x)<=(_138.origin.x)){
_13a.x=(_137.origin.x);
}else{
if((_137.origin.x+_137.size.width)>(_138.origin.x+_138.size.width)){
_13a.x+=(_137.origin.x+_137.size.width)-(_138.origin.x+_138.size.width);
}
}
if((_137.origin.y)<=(_138.origin.y)){
_13a.y=CGRectGetMinY(_137);
}else{
if((_137.origin.y+_137.size.height)>(_138.origin.y+_138.size.height)){
_13a.y+=(_137.origin.y+_137.size.height)-(_138.origin.y+_138.size.height);
}
}
objj_msgSend(_139,"scrollToPoint:",CGPointMake(_13a.x,_13a.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_13d){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_13d);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_140){
with(self){
return _140;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_143,_144){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _147=_superview,_148=objj_msgSend(CPScrollView,"class");
while(_147&&!objj_msgSend(_147,"isKindOfClass:",_148)){
_147=_147._superview;
}
return _147;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_14b,_14c){
with(self){
objj_msgSend(_14b,"scrollToPoint:",_14c);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_14f){
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
var _158=objj_msgSend(self,"nextKeyView");
while(_158&&!objj_msgSend(_158,"canBecomeKeyView")){
_158=objj_msgSend(_158,"nextKeyView");
}
return _158;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _15d=objj_msgSend(self,"previousKeyView");
while(_15d&&!objj_msgSend(_15d,"canBecomeKeyView")){
_15d=objj_msgSend(_15d,"previousKeyView");
}
return _15d;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_160){
with(self){
_previousKeyView=_160;
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
class_addMethods(_6,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_166){
with(self){
if(_layer==_166){
return;
}
if(_layer){
_layer._owningView=nil;
}
_layer=_166;
if(_layer){
var _167=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_16c){
with(self){
_wantsLayer=!!_16c;
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
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_173){
with(self){
return !!(_themeState&((typeof _173==="string")?CPThemeState(_173):_173));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_176){
with(self){
var _177=(typeof _176==="string")?CPThemeState(_176):_176;
if(_themeState&_177){
return NO;
}
_themeState|=_177;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_17a){
with(self){
var _17b=((typeof _17a==="string")?CPThemeState(_17a):_17a);
if(!(_themeState&_17b)){
return NO;
}
_themeState&=~_17b;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _17e=objj_msgSend(self,"class"),_17f=objj_msgSend(_17e,"_themeAttributes"),_180=_17f.length;
if(!_180){
return;
}
var _181=objj_msgSend(self,"theme"),_182=objj_msgSend(_17e,"themeClass");
_themeAttributes={};
while(_180--){
var _183=_17f[_180--],_184=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_183,_17f[_180]);
objj_msgSend(_184,"setParentAttribute:",objj_msgSend(_181,"_attributeWithName:forClass:",_183,_182));
_themeAttributes[_183]=_184;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_187){
with(self){
if(_theme===_187){
return;
}
_theme=_187;
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
var _18c=objj_msgSend(self,"theme"),_18d=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _18e in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_18e)){
objj_msgSend(_themeAttributes[_18e],"setParentAttribute:",objj_msgSend(_18c,"_attributeWithName:forClass:",_18e,_18d));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _191=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _192=objj_msgSend(self,"theme");
for(var _193 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_193)){
objj_msgSend(_191,"setObject:forKey:",_themeAttributes[_193],_193);
}
}
}
return _191;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_196,_197,_198){
with(self){
if(!_themeAttributes||!_themeAttributes[_197]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_197+"'");
}
var _199=objj_msgSend(self,"currentValueForThemeAttribute:",_197);
objj_msgSend(_themeAttributes[_197],"setValue:forState:",_196,_198);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_197)===_199){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_19c,_19d){
with(self){
if(!_themeAttributes||!_themeAttributes[_19d]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_19d+"'");
}
var _19e=objj_msgSend(self,"currentValueForThemeAttribute:",_19d);
objj_msgSend(_themeAttributes[_19d],"setValue:",_19c);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_19d)===_19e){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1a1,_1a2){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a1]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a1+"'");
}
return objj_msgSend(_themeAttributes[_1a1],"valueForState:",_1a2);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1a5){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a5]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a5+"'");
}
return objj_msgSend(_themeAttributes[_1a5],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1a8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1a8]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1a8+"'");
}
return objj_msgSend(_themeAttributes[_1a8],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1ab){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1ae){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1b1,_1b2,_1b3){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1b4=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1b1);
if(_1b4&&!(_1b4.size.width<=0||_1b4.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1b1]){
_ephemeralSubviewsForNames[_1b1]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1b1);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1b1]);
if(_ephemeralSubviewsForNames[_1b1]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1b1],_1b2,_ephemeralSubviewsForNames[_1b3]);
}
}
if(_ephemeralSubviewsForNames[_1b1]){
objj_msgSend(_ephemeralSubviewsForNames[_1b1],"setFrame:",_1b4);
}
}else{
if(_ephemeralSubviewsForNames[_1b1]){
objj_msgSend(_ephemeralSubviewsForNames[_1b1],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1b1]);
delete _ephemeralSubviewsForNames[_1b1];
}
}
return _ephemeralSubviewsForNames[_1b1];
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
var _1bb=objj_msgSend(self,"class"),_1bc=objj_msgSend(CPView,"class"),_1bd=[];
for(;_1bb&&_1bb!==_1bc;_1bb=objj_msgSend(_1bb,"superclass")){
var _1be=_2[class_getName(_1bb)];
if(_1be){
_1bd=_1bd.length?_1bd.concat(_1be):_1bd;
_2[objj_msgSend(self,"className")]=_1bd;
break;
}
var _1bf=objj_msgSend(_1bb,"themeAttributes");
if(!_1bf){
continue;
}
var _1c0=objj_msgSend(_1bf,"allKeys"),_1c1=_1c0.length;
while(_1c1--){
var _1c2=_1c0[_1c1];
_1bd.push(objj_msgSend(_1bf,"objectForKey:",_1c2));
_1bd.push(_1c2);
}
}
return _1bd;
}
})]);
var _1c3="CPViewAutoresizingMask",_1c4="CPViewAutoresizesSubviews",_1c5="CPViewBackgroundColor",_1c6="CPViewBoundsKey",_1c7="CPViewFrameKey",_1c8="CPViewHitTestsKey",_1c9="CPViewIsHiddenKey",_1ca="CPViewOpacityKey",_1cb="CPViewSubviewsKey",_1cc="CPViewSuperviewKey",_1cd="CPViewTagKey",_1ce="CPViewThemeStateKey",_1cf="CPViewWindowKey",_1d0="CPViewNextKeyViewKey",_1d1="CPViewPreviousKeyViewKey";
var _6=objj_getClass("CPView");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1d4){
with(self){
_frame=objj_msgSend(_1d4,"decodeRectForKey:",_1c7);
_bounds=objj_msgSend(_1d4,"decodeRectForKey:",_1c6);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1d4);
if(self){
_tag=objj_msgSend(_1d4,"containsValueForKey:",_1cd)?objj_msgSend(_1d4,"decodeIntForKey:",_1cd):-1;
_window=objj_msgSend(_1d4,"decodeObjectForKey:",_1cf);
_subviews=objj_msgSend(_1d4,"decodeObjectForKey:",_1cb)||[];
_superview=objj_msgSend(_1d4,"decodeObjectForKey:",_1cc);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1d4,"decodeIntForKey:",_1c3)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1d4,"containsValueForKey:",_1c4)||objj_msgSend(_1d4,"decodeBoolForKey:",_1c4);
_hitTests=!objj_msgSend(_1d4,"containsValueForKey:",_1c8)||objj_msgSend(_1d4,"decodeObjectForKey:",_1c8);
if(objj_msgSend(_1d4,"containsValueForKey:",_1c9)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1d4,"decodeBoolForKey:",_1c9));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1d4,"containsValueForKey:",_1ca)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1d4,"decodeIntForKey:",_1ca));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1d4,"decodeObjectForKey:",_1c5));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1d4,"decodeIntForKey:",_1ce));
_themeAttributes={};
var _1d5=objj_msgSend(self,"class"),_1d6=objj_msgSend(_1d5,"themeClass"),_1d7=objj_msgSend(_1d5,"_themeAttributes"),_1d8=_1d7.length;
while(_1d8--){
var _1d9=_1d7[_1d8--];
_themeAttributes[_1d9]=CPThemeAttributeDecode(_1d4,_1d9,_1d7[_1d8],_theme,_1d6);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1dc){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1dc);
if(_tag!==-1){
objj_msgSend(_1dc,"encodeInt:forKey:",_tag,_1cd);
}
objj_msgSend(_1dc,"encodeRect:forKey:",_frame,_1c7);
objj_msgSend(_1dc,"encodeRect:forKey:",_bounds,_1c6);
if(_window!==nil){
objj_msgSend(_1dc,"encodeConditionalObject:forKey:",_window,_1cf);
}
var _1dd=objj_msgSend(_subviews,"count"),_1de=_subviews;
if(_1dd>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_1de=objj_msgSend(_1de,"copy");
while(_1dd--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_1de[_1dd])){
_1de.splice(_1dd,1);
}
}
}
if(_1de.length>0){
objj_msgSend(_1dc,"encodeObject:forKey:",_1de,_1cb);
}
if(_superview!==nil){
objj_msgSend(_1dc,"encodeConditionalObject:forKey:",_superview,_1cc);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1dc,"encodeInt:forKey:",_autoresizingMask,_1c3);
}
if(!_autoresizesSubviews){
objj_msgSend(_1dc,"encodeBool:forKey:",_autoresizesSubviews,_1c4);
}
if(_backgroundColor!==nil){
objj_msgSend(_1dc,"encodeObject:forKey:",_backgroundColor,_1c5);
}
if(_hitTests!==YES){
objj_msgSend(_1dc,"encodeBool:forKey:",_hitTests,_1c8);
}
if(_opacity!==1){
objj_msgSend(_1dc,"encodeFloat:forKey:",_opacity,_1ca);
}
if(_isHidden){
objj_msgSend(_1dc,"encodeBool:forKey:",_isHidden,_1c9);
}
var _1df=objj_msgSend(self,"nextKeyView");
if(_1df!==nil){
objj_msgSend(_1dc,"encodeConditionalObject:forKey:",_1df,_1d0);
}
var _1e0=objj_msgSend(self,"previousKeyView");
if(_1e0!==nil){
objj_msgSend(_1dc,"encodeConditionalObject:forKey:",_1e0,_1d1);
}
objj_msgSend(_1dc,"encodeInt:forKey:",CPThemeStateName(_themeState),_1ce);
for(var _1e1 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1e1)){
CPThemeAttributeEncode(_1dc,_themeAttributes[_1e1]);
}
}
}
})]);
var _96=function(_1e2){
var _1e3=_1e2._superview;
return {autoresizingMask:_1e2._autoresizingMask,frame:CGRectMakeCopy(_1e2._frame),index:(_1e3?objj_msgSend(_1e3._subviews,"indexOfObjectIdenticalTo:",_1e2):0),superview:_1e3};
};
var _ca=function(_1e4,_1e5){
var _1e6=CGAffineTransformMakeIdentity(),_1e7=YES,_1e8=nil,_1e9=nil;
if(_1e4){
var view=_1e4;
while(view&&view!=_1e5){
var _1eb=view._frame;
_1e6.tx+=(_1eb.origin.x);
_1e6.ty+=(_1eb.origin.y);
if(view._boundsTransform){
var tx=_1e6.tx*view._boundsTransform.a+_1e6.ty*view._boundsTransform.c+view._boundsTransform.tx;
_1e6.ty=_1e6.tx*view._boundsTransform.b+_1e6.ty*view._boundsTransform.d+view._boundsTransform.ty;
_1e6.tx=tx;
var a=_1e6.a*view._boundsTransform.a+_1e6.b*view._boundsTransform.c,b=_1e6.a*view._boundsTransform.b+_1e6.b*view._boundsTransform.d,c=_1e6.c*view._boundsTransform.a+_1e6.d*view._boundsTransform.c;
_1e6.d=_1e6.c*view._boundsTransform.b+_1e6.d*view._boundsTransform.d;
_1e6.a=a;
_1e6.b=b;
_1e6.c=c;
}
view=view._superview;
}
if(view===_1e5){
return _1e6;
}else{
if(_1e4&&_1e5){
_1e8=objj_msgSend(_1e4,"window");
_1e9=objj_msgSend(_1e5,"window");
if(_1e8&&_1e9&&_1e8!==_1e9){
_1e7=NO;
var _1eb=objj_msgSend(_1e8,"frame");
_1e6.tx+=(_1eb.origin.x);
_1e6.ty+=(_1eb.origin.y);
}
}
}
}
var view=_1e5;
while(view){
var _1eb=view._frame;
_1e6.tx-=(_1eb.origin.x);
_1e6.ty-=(_1eb.origin.y);
if(view._boundsTransform){
var tx=_1e6.tx*view._inverseBoundsTransform.a+_1e6.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_1e6.ty=_1e6.tx*view._inverseBoundsTransform.b+_1e6.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_1e6.tx=tx;
var a=_1e6.a*view._inverseBoundsTransform.a+_1e6.b*view._inverseBoundsTransform.c,b=_1e6.a*view._inverseBoundsTransform.b+_1e6.b*view._inverseBoundsTransform.d,c=_1e6.c*view._inverseBoundsTransform.a+_1e6.d*view._inverseBoundsTransform.c;
_1e6.d=_1e6.c*view._inverseBoundsTransform.b+_1e6.d*view._inverseBoundsTransform.d;
_1e6.a=a;
_1e6.b=b;
_1e6.c=c;
}
view=view._superview;
}
if(!_1e7){
var _1eb=objj_msgSend(_1e9,"frame");
_1e6.tx-=(_1eb.origin.x);
_1e6.ty-=(_1eb.origin.y);
}
return _1e6;
};
