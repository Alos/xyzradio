I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;67648;
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
var _3=nil,_4=0,_5=1,_6=2,_7=3,_8={},_9={};
var _a=objj_allocateClassPair(CPResponder,"CPView"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
return objj_msgSend(_c,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPResponder")},"init");
if(_e){
var _11=(_10.size.width),_12=(_10.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_10.origin.x,y:_10.origin.y},size:{width:_10.size.width,height:_10.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_11,height:_12}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_DOMElement=_3.cloneNode(false);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _13=_DOMElement.CPDOMDisplayContext[0];
if(!(_13>=0)){
_13=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_13]=0;
CPDOMDisplayServerInstructions[_13+1]=_DOMElement;
CPDOMDisplayServerInstructions[_13+2]=NULL;
CPDOMDisplayServerInstructions[_13+3]=(_10.origin.x);
CPDOMDisplayServerInstructions[_13+4]=(_10.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _13=_DOMElement.CPDOMDisplayContext[4];
if(!(_13>=0)){
_13=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_13]=4;
CPDOMDisplayServerInstructions[_13+1]=_DOMElement;
CPDOMDisplayServerInstructions[_13+2]=_11;
CPDOMDisplayServerInstructions[_13+3]=_12;
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_e,"_loadThemeAttributes");
}
return _e;
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
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
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
if(_25._DOMElement.CPDOMDisplayContext){
_25._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
}else{
_subviews.splice(_26,0,_25);
if(_25._DOMElement.CPDOMDisplayContext){
_25._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_26+1]._DOMElement;
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
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_superview._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
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
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _6a=_DOMElement.CPDOMDisplayContext[0];
if(!(_6a>=0)){
_6a=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_6a]=0;
CPDOMDisplayServerInstructions[_6a+1]=_DOMElement;
CPDOMDisplayServerInstructions[_6a+2]=_superview?_superview._boundsTransform:NULL;
CPDOMDisplayServerInstructions[_6a+3]=_69.x;
CPDOMDisplayServerInstructions[_6a+4]=_69.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=_frame.size;
if(!_6d||(_6e.width==_6d.width&&_6e.height==_6d.height)){
return;
}
var _6f={width:_6e.width,height:_6e.height};
_6e.width=_6d.width;
_6e.height=_6d.height;
if(YES){
_bounds.size.width=_6d.width;
_bounds.size.height=_6d.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_6b,"resizeSubviewsWithOldSize:",_6f);
}
objj_msgSend(_6b,"setNeedsLayout");
objj_msgSend(_6b,"setNeedsDisplay:",YES);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _70=_DOMElement.CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMElement;
CPDOMDisplayServerInstructions[_70+2]=_6e.width;
CPDOMDisplayServerInstructions[_70+3]=_6e.height;
if(_DOMContentsElement){
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _70=_DOMContentsElement.CPDOMDisplayContext[5];
if(!(_70>=0)){
_70=_DOMContentsElement.CPDOMDisplayContext[5]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=5;
CPDOMDisplayServerInstructions[_70+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_70+2]=_6e.width;
CPDOMDisplayServerInstructions[_70+3]=_6e.height;
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _70=_DOMContentsElement.CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMContentsElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_70+2]=_6e.width;
CPDOMDisplayServerInstructions[_70+3]=_6e.height;
}
if(_backgroundType!==_4){
var _71=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_70+2]=_6e.width;
CPDOMDisplayServerInstructions[_70+3]=_6e.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
}else{
if(_backgroundType===_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_70+2]=_6e.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_70+3]=_6e.height;
}else{
if(_backgroundType===_7){
var _72=_6e.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_73=_6e.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_70+2]=_72;
CPDOMDisplayServerInstructions[_70+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_70+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_70+3]=_73;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_70+2]=_72;
CPDOMDisplayServerInstructions[_70+3]=_73;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_70+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_70+3]=_73;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _70=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_70>=0)){
_70=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_70]=4;
CPDOMDisplayServerInstructions[_70+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_70+2]=_72;
CPDOMDisplayServerInstructions[_70+3]=_DOMImageSizes[7].height;
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6b);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_74,_75,_76){
with(_74){
if(((_bounds.origin.x==_76.origin.x&&_bounds.origin.y==_76.origin.y)&&(_bounds.size.width==_76.size.width&&_bounds.size.height==_76.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_74,"setBoundsOrigin:",_76.origin);
objj_msgSend(_74,"setBoundsSize:",_76.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_74);
}
}
}),new objj_method(sel_getUid("bounds"),function(_77,_78){
with(_77){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_79,_7a,_7b){
with(_79){
var _7c=_bounds.origin;
if((_7c.x==_7b.x&&_7c.y==_7b.y)){
return;
}
_7c.x=_7b.x;
_7c.y=_7b.y;
if(_7c.x!=0||_7c.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_7c.x,ty:-_7c.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _7d=_subviews.length;
while(_7d--){
var _7e=_subviews[_7d],_7c=_7e._frame.origin;
if(!_7e._DOMElement.CPDOMDisplayContext){
_7e._DOMElement.CPDOMDisplayContext=[];
}
var _7f=_7e._DOMElement.CPDOMDisplayContext[0];
if(!(_7f>=0)){
_7f=_7e._DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_7f]=0;
CPDOMDisplayServerInstructions[_7f+1]=_7e._DOMElement;
CPDOMDisplayServerInstructions[_7f+2]=_boundsTransform;
CPDOMDisplayServerInstructions[_7f+3]=_7c.x;
CPDOMDisplayServerInstructions[_7f+4]=_7c.y;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_79);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_80,_81,_82){
with(_80){
var _83=_bounds.size;
if((_83.width==_82.width&&_83.height==_82.height)){
return;
}
var _84=_frame.size;
if(!(_83.width==_84.width&&_83.height==_84.height)){
var _85=_bounds.origin;
_85.x/=_83.width/_84.width;
_85.y/=_83.height/_84.height;
}
_83.width=_82.width;
_83.height=_82.height;
if(!(_83.width==_84.width&&_83.height==_84.height)){
var _85=_bounds.origin;
_85.x*=_83.width/_84.width;
_85.y*=_83.height/_84.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_80);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_86,_87,_88){
with(_86){
var _89=objj_msgSend(_86,"autoresizingMask");
if(_89==CPViewNotSizable){
return;
}
var _8a=_superview._frame,_8b={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_8a.size.width)-_88.width)/(((_89&CPViewMinXMargin)?1:0)+(_89&CPViewWidthSizable?1:0)+(_89&CPViewMaxXMargin?1:0)),dY=((_8a.size.height)-_88.height)/((_89&CPViewMinYMargin?1:0)+(_89&CPViewHeightSizable?1:0)+(_89&CPViewMaxYMargin?1:0));
if(_89&CPViewMinXMargin){
_8b.origin.x+=dX;
}
if(_89&CPViewWidthSizable){
_8b.size.width+=dX;
}
if(_89&CPViewMinYMargin){
_8b.origin.y+=dY;
}
if(_89&CPViewHeightSizable){
_8b.size.height+=dY;
}
objj_msgSend(_86,"setFrame:",_8b);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_8e,_8f,_90){
with(_8e){
var _91=_subviews.length;
while(_91--){
objj_msgSend(_subviews[_91],"resizeWithOldSuperviewSize:",_90);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_92,_93,_94){
with(_92){
_autoresizesSubviews=!!_94;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_95,_96){
with(_95){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_97,_98,_99){
with(_97){
_autoresizingMask=_99;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_9a,_9b){
with(_9a){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_9c,_9d){
with(_9c){
return objj_msgSend(_9c,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_9e,_9f,_a0,_a1){
with(_9e){
_fullScreenModeState=_a2(_9e);
var _a3=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_a3,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_a3,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _a4=objj_msgSend(_a3,"contentView");
objj_msgSend(_a4,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_a4,"addSubview:",_9e);
objj_msgSend(_9e,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_9e,"setFrame:",CGRectMakeCopy(objj_msgSend(_a4,"bounds")));
objj_msgSend(_a3,"makeKeyAndOrderFront:",_9e);
objj_msgSend(_a3,"makeFirstResponder:",_9e);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_a5,_a6){
with(_a5){
objj_msgSend(_a5,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_a7,_a8,_a9){
with(_a7){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_a7,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_a7,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_a7,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_a7,"window"),"orderOut:",_a7);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_aa,_ab){
with(_aa){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_ac,_ad,_ae){
with(_ac){
_ae=!!_ae;
if(_isHidden===_ae){
return;
}
_isHidden=_ae;
_DOMElement.style.display=_isHidden?"none":"block";
if(_ae){
var _af=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_af,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_ac==_af){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_ac,"nextValidKeyView"));
break;
}
}while(_af=objj_msgSend(_af,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_b0,_b1){
with(_b0){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_b2,_b3,_b4){
with(_b2){
if(_opacity==_b4){
return;
}
_opacity=_b4;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_b4==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_b4*100+")";
}
}else{
_DOMElement.style.opacity=_b4;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_b5,_b6){
with(_b5){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_b7,_b8){
with(_b7){
var _b9=_b7;
while(_b9&&!objj_msgSend(_b9,"isHidden")){
_b9=objj_msgSend(_b9,"superview");
}
return _b9!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_ba,_bb,_bc){
with(_ba){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_bd,_be){
with(_bd){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_bf,_c0,_c1){
with(_bf){
_hitTests=!!_c1;
}
}),new objj_method(sel_getUid("hitTest:"),function(_c2,_c3,_c4){
with(_c2){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_c4)){
return nil;
}
var _c5=nil,i=_subviews.length,_c7={x:_c4.x-(_frame.origin.x),y:_c4.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_c7={x:_c7.x*_inverseBoundsTransform.a+_c7.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_c7.x*_inverseBoundsTransform.b+_c7.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_c5=objj_msgSend(_subviews[i],"hitTest:",_c7)){
return _c5;
}
}
return _c2;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_c8,_c9){
with(_c8){
return !objj_msgSend(_c8,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_ca,_cb,_cc){
with(_ca){
if(objj_msgSend(_ca,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_ca,super_class:objj_getClass("CPResponder")},"mouseDown:",_cc);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_cd,_ce,_cf){
with(_cd){
if(_backgroundColor==_cf){
return;
}
_backgroundColor=_cf;
var _d0=objj_msgSend(_backgroundColor,"patternImage"),_d1=0;
if(objj_msgSend(_d0,"isThreePartImage")){
_backgroundType=objj_msgSend(_d0,"isVertical")?_5:_6;
_d1=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_d0,"isNinePartImage")){
_backgroundType=_7;
_d1=9-_DOMImageParts.length;
}else{
_backgroundType=_4;
_d1=0-_DOMImageParts.length;
}
}
if(_d1>0){
while(_d1--){
var _d2=_3.cloneNode(false);
_d2.style.zIndex=-1000;
_DOMImageParts.push(_d2);
_DOMElement.appendChild(_d2);
}
}else{
_d1=-_d1;
while(_d1--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_4){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _d3=objj_msgSend(_d0,"imageSlices"),_d4=MIN(_DOMImageParts.length,_d3.length),_d5=_frame.size;
while(_d4--){
var _d6=_d3[_d4],_d7=_DOMImageSizes[_d4]=_d6?objj_msgSend(_d6,"size"):{width:0,height:0};
if(!_DOMImageParts[_d4].CPDOMDisplayContext){
_DOMImageParts[_d4].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[_d4].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[_d4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[_d4];
CPDOMDisplayServerInstructions[_d8+2]=_d7.width;
CPDOMDisplayServerInstructions[_d8+3]=_d7.height;
_DOMImageParts[_d4].style.background=_d6?"url(\""+objj_msgSend(_d6,"filename")+"\")":"";
}
if(_backgroundType==_7){
var _d9=_d5.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_da=_d5.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d8+2]=_d9;
CPDOMDisplayServerInstructions[_d8+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_d8+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_d8+3]=_da;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_d8+2]=_d9;
CPDOMDisplayServerInstructions[_d8+3]=_da;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_d8+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_d8+3]=_da;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_d8+2]=_d9;
CPDOMDisplayServerInstructions[_d8+3]=_DOMImageSizes[7].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=1;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[3].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[3].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[4].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[4].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_d8+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[5].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[5].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=1;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[6].CPDOMDisplayContext){
_DOMImageParts[6].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[6].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[6].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=2;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[6];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[7].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[7].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=2;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=_DOMImageSizes[6].width;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[8].CPDOMDisplayContext){
_DOMImageParts[8].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[8].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[8].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=3;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[8];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
}else{
if(_backgroundType==_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d8+2]=_d5.width;
CPDOMDisplayServerInstructions[_d8+3]=_d5.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=2;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
}else{
if(_backgroundType==_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_d8>=0)){
_d8=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_d8]=4;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d8+2]=_d5.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_d8+3]=_d5.height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=0;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_d8+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _d8=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_d8>=0)){
_d8=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_d8]=1;
CPDOMDisplayServerInstructions[_d8+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_d8+2]=NULL;
CPDOMDisplayServerInstructions[_d8+3]=0;
CPDOMDisplayServerInstructions[_d8+4]=0;
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_db,_dc){
with(_db){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_dd,_de,_df,_e0){
with(_dd){
return CGPointApplyAffineTransform(_df,_e1(_e0,_dd));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_e2,_e3,_e4,_e5){
with(_e2){
return CGPointApplyAffineTransform(_e4,_e1(_e2,_e5));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_e6,_e7,_e8,_e9){
with(_e6){
return CGSizeApplyAffineTransform(_e8,_e1(_e9,_e6));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_ea,_eb,_ec,_ed){
with(_ea){
return CGSizeApplyAffineTransform(_ec,_e1(_ea,_ed));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_ee,_ef,_f0,_f1){
with(_ee){
return CGRectApplyAffineTransform(_f0,_e1(_f1,_ee));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_f2,_f3,_f4,_f5){
with(_f2){
return CGRectApplyAffineTransform(_f4,_e1(_f2,_f5));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_f6,_f7,_f8){
with(_f6){
_f8=!!_f8;
if(_postsFrameChangedNotifications===_f8){
return;
}
_postsFrameChangedNotifications=_f8;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_f6);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_f9,_fa){
with(_f9){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_fb,_fc,_fd){
with(_fb){
_fd=!!_fd;
if(_postsBoundsChangedNotifications===_fd){
return;
}
_postsBoundsChangedNotifications=_fd;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_fb);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_fe,_ff){
with(_fe){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_102,_103,_104,_105,_106,_107,_108){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_102,objj_msgSend(self,"convertPoint:toView:",_103,nil),_104,_105,_106,_107,_108);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_10b,_10c,_10d,_10e,_10f,_110,_111){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_10b,objj_msgSend(self,"convertPoint:toView:",_10c,nil),_10d,_10e,_10f,_110,_111);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_114){
with(self){
if(!_114||!objj_msgSend(_114,"count")){
return;
}
var _115=objj_msgSend(self,"window");
objj_msgSend(_115,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_114);
objj_msgSend(_115,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
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
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_11c){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_11f){
with(self){
if(_11f){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}else{
var _120=CPDOMDisplayServerViewsContext[objj_msgSend(self,"UID")];
if(typeof _120!="undefined"){
CPDOMDisplayServerViewsContext[objj_msgSend(self,"UID")];
CPDOMDisplayServerViews[_120]=NULL;
}
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_123){
with(self){
var UID=objj_msgSend(objj_msgSend(self,"class"),"UID"),_125=_8[UID];
if(!_125&&typeof _125==="undefined"){
_125=objj_msgSend(self,"methodForSelector:",sel_getUid("drawRect:"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"));
_8[UID]=_125;
}
if(!_125){
return;
}
if((_123.size.width<=0||_123.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_123,_dirtyRect);
}else{
_dirtyRect={origin:{x:_123.origin.x,y:_123.origin.y},size:{width:_123.size.width,height:_123.size.height}};
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
var UID=objj_msgSend(objj_msgSend(self,"class"),"UID"),_141=_9[UID];
if(_141===undefined){
_141=objj_msgSend(self,"methodForSelector:",sel_getUid("layoutSubviews"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"));
_9[UID]=_141;
}
if(!_141){
return;
}
if(_needsLayout){
var _142=objj_msgSend(self,"UID");
if(typeof (CPDOMDisplayServerViewsContext[_142])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_142]=self;
}
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
var _14d=_superview,_14e=objj_msgSend(CPClipView,"class");
while(_14d&&!objj_msgSend(_14d,"isKindOfClass:",_14e)){
_14d=_14d._superview;
}
return _14d;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_151){
with(self){
var _152=objj_msgSend(self,"_enclosingClipView");
if(!_152){
return;
}
objj_msgSend(_152,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_151,_152));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_155){
with(self){
var _156=objj_msgSend(self,"visibleRect");
_155=CGRectIntersection(_155,_bounds);
if((_155.size.width<=0||_155.size.height<=0)||CGRectContainsRect(_156,_155)){
return NO;
}
var _157=objj_msgSend(self,"_enclosingClipView");
if(!_157){
return NO;
}
var _158={x:_156.origin.x,y:_156.origin.y};
if((_155.origin.x)<=(_156.origin.x)){
_158.x=(_155.origin.x);
}else{
if((_155.origin.x+_155.size.width)>(_156.origin.x+_156.size.width)){
_158.x+=(_155.origin.x+_155.size.width)-(_156.origin.x+_156.size.width);
}
}
if((_155.origin.y)<=(_156.origin.y)){
_158.y=CGRectGetMinY(_155);
}else{
if((_155.origin.y+_155.size.height)>(_156.origin.y+_156.size.height)){
_158.y+=(_155.origin.y+_155.size.height)-(_156.origin.y+_156.size.height);
}
}
objj_msgSend(_157,"scrollToPoint:",CGPointMake(_158.x,_158.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_15b){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_15b);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_15e){
with(self){
return _15e;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_161,_162){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _165=_superview,_166=objj_msgSend(CPScrollView,"class");
while(_165&&!objj_msgSend(_165,"isKindOfClass:",_166)){
_165=_165._superview;
}
return _165;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_169,_16a){
with(self){
objj_msgSend(_169,"scrollToPoint:",_16a);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_16d){
with(self){
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _170=_3.style;
_170.overflow="hidden";
_170.position="absolute";
_170.visibility="visible";
_170.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_cmd){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _179=objj_msgSend(self,"nextKeyView");
while(_179&&!objj_msgSend(_179,"canBecomeKeyView")){
_179=objj_msgSend(_179,"nextKeyView");
}
return _179;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _17e=objj_msgSend(self,"previousKeyView");
while(_17e&&!objj_msgSend(_17e,"canBecomeKeyView")){
_17e=objj_msgSend(_17e,"previousKeyView");
}
return _17e;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_181){
with(self){
_previousKeyView=_181;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_187){
with(self){
if(_layer==_187){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_187;
if(_layer){
var _188=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_18d){
with(self){
_wantsLayer=!!_18d;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_194){
with(self){
return !!(_themeState&((typeof _194==="string")?CPThemeState(_194):_194));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_197){
with(self){
var _198=(typeof _197==="string")?CPThemeState(_197):_197;
if(_themeState&_198){
return NO;
}
_themeState|=_198;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_19b){
with(self){
var _19c=((typeof _19b==="string")?CPThemeState(_19b):_19b);
if(!(_themeState&_19c)){
return NO;
}
_themeState&=~_19c;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _19f=objj_msgSend(self,"class"),_1a0=objj_msgSend(_19f,"_themeAttributes"),_1a1=_1a0.length;
if(!_1a1){
return;
}
var _1a2=objj_msgSend(self,"theme"),_1a3=objj_msgSend(_19f,"themeClass");
_themeAttributes={};
while(_1a1--){
var _1a4=_1a0[_1a1--],_1a5=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_1a4,_1a0[_1a1]);
objj_msgSend(_1a5,"setParentAttribute:",objj_msgSend(_1a2,"_attributeWithName:forClass:",_1a4,_1a3));
_themeAttributes[_1a4]=_1a5;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_1a8){
with(self){
if(_theme===_1a8){
return;
}
_theme=_1a8;
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
var _1ad=objj_msgSend(self,"theme"),_1ae=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _1af in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1af)){
objj_msgSend(_themeAttributes[_1af],"setParentAttribute:",objj_msgSend(_1ad,"_attributeWithName:forClass:",_1af,_1ae));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _1b2=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1b3=objj_msgSend(self,"theme");
for(var _1b4 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1b4)){
objj_msgSend(_1b2,"setObject:forKey:",_themeAttributes[_1b4],_1b4);
}
}
}
return _1b2;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_1b7,_1b8,_1b9){
with(self){
if(!_themeAttributes||!_themeAttributes[_1b8]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1b8+"'");
}
var _1ba=objj_msgSend(self,"currentValueForThemeAttribute:",_1b8);
objj_msgSend(_themeAttributes[_1b8],"setValue:forState:",_1b7,_1b9);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1b8)===_1ba){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1bd,_1be){
with(self){
if(!_themeAttributes||!_themeAttributes[_1be]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1be+"'");
}
var _1bf=objj_msgSend(self,"currentValueForThemeAttribute:",_1be);
objj_msgSend(_themeAttributes[_1be],"setValue:",_1bd);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1be)===_1bf){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1c2,_1c3){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c2]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c2+"'");
}
return objj_msgSend(_themeAttributes[_1c2],"valueForState:",_1c3);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1c6){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c6]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c6+"'");
}
return objj_msgSend(_themeAttributes[_1c6],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1c9){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c9]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c9+"'");
}
return objj_msgSend(_themeAttributes[_1c9],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1cc){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1cf){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1d2,_1d3,_1d4){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1d5=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1d2);
if(_1d5&&!(_1d5.size.width<=0||_1d5.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1d2]){
_ephemeralSubviewsForNames[_1d2]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1d2);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1d2]);
if(_ephemeralSubviewsForNames[_1d2]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1d2],_1d3,_ephemeralSubviewsForNames[_1d4]);
}
}
if(_ephemeralSubviewsForNames[_1d2]){
objj_msgSend(_ephemeralSubviewsForNames[_1d2],"setFrame:",_1d5);
}
}else{
if(_ephemeralSubviewsForNames[_1d2]){
objj_msgSend(_ephemeralSubviewsForNames[_1d2],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1d2]);
delete _ephemeralSubviewsForNames[_1d2];
}
}
return _ephemeralSubviewsForNames[_1d2];
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
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
var _1dc=objj_msgSend(self,"class"),_1dd=objj_msgSend(CPView,"class"),_1de=[];
for(;_1dc&&_1dc!==_1dd;_1dc=objj_msgSend(_1dc,"superclass")){
var _1df=_2[class_getName(_1dc)];
if(_1df){
_1de=_1de.length?_1de.concat(_1df):_1de;
_2[objj_msgSend(self,"className")]=_1de;
break;
}
var _1e0=objj_msgSend(_1dc,"themeAttributes");
if(!_1e0){
continue;
}
var _1e1=objj_msgSend(_1e0,"allKeys"),_1e2=_1e1.length;
while(_1e2--){
var _1e3=_1e1[_1e2];
_1de.push(objj_msgSend(_1e0,"objectForKey:",_1e3));
_1de.push(_1e3);
}
}
return _1de;
}
})]);
var _1e4="CPViewAutoresizingMask",_1e5="CPViewAutoresizesSubviews",_1e6="CPViewBackgroundColor",_1e7="CPViewBoundsKey",_1e8="CPViewFrameKey",_1e9="CPViewHitTestsKey",_1ea="CPViewIsHiddenKey",_1eb="CPViewOpacityKey",_1ec="CPViewSubviewsKey",_1ed="CPViewSuperviewKey",_1ee="CPViewTagKey",_1ef="CPViewThemeStateKey",_1f0="CPViewWindowKey",_1f1="CPViewNextKeyViewKey",_1f2="CPViewPreviousKeyViewKey";
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1f5){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_1f5,"decodeRectForKey:",_1e8);
_bounds=objj_msgSend(_1f5,"decodeRectForKey:",_1e7);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1f5);
if(self){
_tag=objj_msgSend(_1f5,"containsValueForKey:",_1ee)?objj_msgSend(_1f5,"decodeIntForKey:",_1ee):-1;
_window=objj_msgSend(_1f5,"decodeObjectForKey:",_1f0);
_subviews=objj_msgSend(_1f5,"decodeObjectForKey:",_1ec)||[];
_superview=objj_msgSend(_1f5,"decodeObjectForKey:",_1ed);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1f5,"decodeIntForKey:",_1e4)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1f5,"containsValueForKey:",_1e5)||objj_msgSend(_1f5,"decodeBoolForKey:",_1e5);
_hitTests=!objj_msgSend(_1f5,"containsValueForKey:",_1e9)||objj_msgSend(_1f5,"decodeObjectForKey:",_1e9);
_DOMImageParts=[];
_DOMImageSizes=[];
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1f6=_DOMElement.CPDOMDisplayContext[0];
if(!(_1f6>=0)){
_1f6=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_1f6]=0;
CPDOMDisplayServerInstructions[_1f6+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1f6+2]=NULL;
CPDOMDisplayServerInstructions[_1f6+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_1f6+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1f6=_DOMElement.CPDOMDisplayContext[4];
if(!(_1f6>=0)){
_1f6=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_1f6]=4;
CPDOMDisplayServerInstructions[_1f6+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1f6+2]=(_frame.size.width);
CPDOMDisplayServerInstructions[_1f6+3]=(_frame.size.height);
var _1f7=0,_1f8=_subviews.length;
for(;_1f7<_1f8;++_1f7){
if(_subviews[_1f7]._DOMElement.CPDOMDisplayContext){
_subviews[_1f7]._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_1f7]._DOMElement;
}
if(objj_msgSend(_1f5,"containsValueForKey:",_1ea)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1f5,"decodeBoolForKey:",_1ea));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1f5,"containsValueForKey:",_1eb)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1f5,"decodeIntForKey:",_1eb));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1f5,"decodeObjectForKey:",_1e6));
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1f5,"decodeIntForKey:",_1ef));
_themeAttributes={};
var _1f9=objj_msgSend(self,"class"),_1fa=objj_msgSend(_1f9,"themeClass"),_1fb=objj_msgSend(_1f9,"_themeAttributes"),_1f8=_1fb.length;
while(_1f8--){
var _1fc=_1fb[_1f8--];
_themeAttributes[_1fc]=CPThemeAttributeDecode(_1f5,_1fc,_1fb[_1f8],_theme,_1fa);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_1ff){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_1ff);
if(_tag!==-1){
objj_msgSend(_1ff,"encodeInt:forKey:",_tag,_1ee);
}
objj_msgSend(_1ff,"encodeRect:forKey:",_frame,_1e8);
objj_msgSend(_1ff,"encodeRect:forKey:",_bounds,_1e7);
if(_window!==nil){
objj_msgSend(_1ff,"encodeConditionalObject:forKey:",_window,_1f0);
}
var _200=objj_msgSend(_subviews,"count"),_201=_subviews;
if(_200>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_201=objj_msgSend(_201,"copy");
while(_200--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_201[_200])){
_201.splice(_200,1);
}
}
}
if(_201.length>0){
objj_msgSend(_1ff,"encodeObject:forKey:",_201,_1ec);
}
if(_superview!==nil){
objj_msgSend(_1ff,"encodeConditionalObject:forKey:",_superview,_1ed);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_1ff,"encodeInt:forKey:",_autoresizingMask,_1e4);
}
if(!_autoresizesSubviews){
objj_msgSend(_1ff,"encodeBool:forKey:",_autoresizesSubviews,_1e5);
}
if(_backgroundColor!==nil){
objj_msgSend(_1ff,"encodeObject:forKey:",_backgroundColor,_1e6);
}
if(_hitTests!==YES){
objj_msgSend(_1ff,"encodeBool:forKey:",_hitTests,_1e9);
}
if(_opacity!==1){
objj_msgSend(_1ff,"encodeFloat:forKey:",_opacity,_1eb);
}
if(_isHidden){
objj_msgSend(_1ff,"encodeBool:forKey:",_isHidden,_1ea);
}
var _202=objj_msgSend(self,"nextKeyView");
if(_202!==nil){
objj_msgSend(_1ff,"encodeConditionalObject:forKey:",_202,_1f1);
}
var _203=objj_msgSend(self,"previousKeyView");
if(_203!==nil){
objj_msgSend(_1ff,"encodeConditionalObject:forKey:",_203,_1f2);
}
objj_msgSend(_1ff,"encodeInt:forKey:",CPThemeStateName(_themeState),_1ef);
for(var _204 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_204)){
CPThemeAttributeEncode(_1ff,_themeAttributes[_204]);
}
}
}
})]);
var _a2=function(_205){
var _206=_205._superview;
return {autoresizingMask:_205._autoresizingMask,frame:CGRectMakeCopy(_205._frame),index:(_206?objj_msgSend(_206._subviews,"indexOfObjectIdenticalTo:",_205):0),superview:_206};
};
var _e1=function(_207,_208){
var _209=CGAffineTransformMakeIdentity(),_20a=YES,_20b=nil,_20c=nil;
if(_207){
var view=_207;
while(view&&view!=_208){
var _20e=view._frame;
_209.tx+=(_20e.origin.x);
_209.ty+=(_20e.origin.y);
if(view._boundsTransform){
var tx=_209.tx*view._boundsTransform.a+_209.ty*view._boundsTransform.c+view._boundsTransform.tx;
_209.ty=_209.tx*view._boundsTransform.b+_209.ty*view._boundsTransform.d+view._boundsTransform.ty;
_209.tx=tx;
var a=_209.a*view._boundsTransform.a+_209.b*view._boundsTransform.c,b=_209.a*view._boundsTransform.b+_209.b*view._boundsTransform.d,c=_209.c*view._boundsTransform.a+_209.d*view._boundsTransform.c;
_209.d=_209.c*view._boundsTransform.b+_209.d*view._boundsTransform.d;
_209.a=a;
_209.b=b;
_209.c=c;
}
view=view._superview;
}
if(view===_208){
return _209;
}else{
if(_207&&_208){
_20b=objj_msgSend(_207,"window");
_20c=objj_msgSend(_208,"window");
if(_20b&&_20c&&_20b!==_20c){
_20a=NO;
var _20e=objj_msgSend(_20b,"frame");
_209.tx+=(_20e.origin.x);
_209.ty+=(_20e.origin.y);
}
}
}
}
var view=_208;
while(view){
var _20e=view._frame;
_209.tx-=(_20e.origin.x);
_209.ty-=(_20e.origin.y);
if(view._boundsTransform){
var tx=_209.tx*view._inverseBoundsTransform.a+_209.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_209.ty=_209.tx*view._inverseBoundsTransform.b+_209.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_209.tx=tx;
var a=_209.a*view._inverseBoundsTransform.a+_209.b*view._inverseBoundsTransform.c,b=_209.a*view._inverseBoundsTransform.b+_209.b*view._inverseBoundsTransform.d,c=_209.c*view._inverseBoundsTransform.a+_209.d*view._inverseBoundsTransform.c;
_209.d=_209.c*view._inverseBoundsTransform.b+_209.d*view._inverseBoundsTransform.d;
_209.a=a;
_209.b=b;
_209.c=c;
}
view=view._superview;
}
if(!_20a){
var _20e=objj_msgSend(_20c,"frame");
_209.tx-=(_20e.origin.x);
_209.ty-=(_20e.origin.y);
}
return _209;
};
