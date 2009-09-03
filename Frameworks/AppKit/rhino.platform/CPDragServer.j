I;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;11922;
CPDragOperationNone=0,CPDragOperationCopy=1<<1,CPDragOperationLink=1<<1,CPDragOperationGeneric=1<<2,CPDragOperationPrivate=1<<3,CPDragOperationMove=1<<4,CPDragOperationDelete=1<<5,CPDragOperationEvery=-1;
var _1=nil,_2=nil;
var _3=nil;
var _4=nil;
var _5=nil;
var _6=objj_allocateClassPair(CPObject,"CPDraggingInfo"),_7=_6.isa;
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("draggingPasteboard"),function(_8,_9){
with(_8){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
return objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
}
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingPasteboard");
}
}),new objj_method(sel_getUid("draggingSource"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingSource");
}
}),new objj_method(sel_getUid("draggingLocation"),function(_c,_d){
with(_c){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingLocation");
}
}),new objj_method(sel_getUid("draggingDestinationWindow"),function(_e,_f){
with(_e){
return (objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"),"isKindOfClass:",objj_msgSend(CPWindow,"class"))?objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"):objj_msgSend(objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggingDestination"),"window"));
}
}),new objj_method(sel_getUid("draggedImage"),function(_10,_11){
with(_10){
return objj_msgSend(objj_msgSend(_10,"draggedView"),"image");
}
}),new objj_method(sel_getUid("draggedImageLocation"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"draggedViewLocation");
}
}),new objj_method(sel_getUid("draggedView"),function(_14,_15){
with(_14){
return objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"draggedView");
}
}),new objj_method(sel_getUid("draggedViewLocation"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPDragServer,"sharedDragServer");
return objj_msgSend((objj_msgSend(objj_msgSend(_18,"draggingDestination"),"isKindOfClass:",objj_msgSend(CPWindow,"class"))?objj_msgSend(_18,"draggingDestination"):objj_msgSend(objj_msgSend(_18,"draggingDestination"),"window")),"convertPlatformWindowToBase:",objj_msgSend(objj_msgSend(_18,"draggedView"),"frame").origin);
}
})]);
var _19=1<<0,_1a=1<<1,_1b=1<<2,_1c=1<<3;
var _6=objj_allocateClassPair(CPObject,"CPDragServer"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_isDragging"),new objj_ivar("_draggedWindow"),new objj_ivar("_draggedView"),new objj_ivar("_imageView"),new objj_ivar("_isDraggingImage"),new objj_ivar("_draggingOffset"),new objj_ivar("_draggingPasteboard"),new objj_ivar("_draggingSource"),new objj_ivar("_implementedDraggingSourceMethods"),new objj_ivar("_draggingLocation"),new objj_ivar("_draggingDestination")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("isDragging"),function(_1d,_1e){
with(_1d){
return _isDragging;
}
}),new objj_method(sel_getUid("draggedWindow"),function(_1f,_20){
with(_1f){
return _draggedWindow;
}
}),new objj_method(sel_getUid("draggedView"),function(_21,_22){
with(_21){
return _draggedView;
}
}),new objj_method(sel_getUid("draggingOffset"),function(_23,_24){
with(_23){
return _draggingOffset;
}
}),new objj_method(sel_getUid("draggingPasteboard"),function(_25,_26){
with(_25){
return _draggingPasteboard;
}
}),new objj_method(sel_getUid("draggingSource"),function(_27,_28){
with(_27){
return _draggingSource;
}
}),new objj_method(sel_getUid("init"),function(_29,_2a){
with(_29){
_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("CPObject")},"init");
if(_29){
_draggedWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",{origin:{x:0,y:0},size:{width:0,height:0}},CPBorderlessWindowMask);
objj_msgSend(_draggedWindow,"setLevel:",CPDraggingWindowLevel);
}
return _29;
}
}),new objj_method(sel_getUid("draggingLocation"),function(_2b,_2c){
with(_2b){
return _draggingLocation;
}
}),new objj_method(sel_getUid("draggingStartedInPlatformWindow:location:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(_isDraggingImage){
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:beganAt:"))){
objj_msgSend(_draggingSource,"draggedImage:beganAt:",objj_msgSend(_draggedView,"image"),_30);
}
}else{
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:beganAt:"))){
objj_msgSend(_draggingSource,"draggedView:beganAt:",_draggedView,_30);
}
}
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"orderFront:",_2d);
}
}
}),new objj_method(sel_getUid("draggingSourceUpdatedWithLocation:"),function(_31,_32,_33){
with(_31){
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"setFrameOrigin:",{x:_33.x-_draggingOffset.width,y:_33.y-_draggingOffset.height});
}
if(_implementedDraggingSourceMethods&_19){
objj_msgSend(_draggingSource,"draggedImage:movedTo:",objj_msgSend(_draggedView,"image"),_33);
}else{
if(_implementedDraggingSourceMethods&_1b){
objj_msgSend(_draggingSource,"draggedView:movedTo:",_draggedView,_33);
}
}
}
}),new objj_method(sel_getUid("draggingUpdatedInPlatformWindow:location:"),function(_34,_35,_36,_37){
with(_34){
var _38=CPDragOperationCopy;
var _39=objj_msgSend(_36,"_dragHitTest:pasteboard:",_37,objj_msgSend(_5,"draggingPasteboard"));
if(_39){
_draggingLocation=objj_msgSend((objj_msgSend(_39,"isKindOfClass:",objj_msgSend(CPWindow,"class"))?_39:objj_msgSend(_39,"window")),"convertPlatformWindowToBase:",_37);
}
if(_39!==_draggingDestination){
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingExited:"))){
objj_msgSend(_draggingDestination,"draggingExited:",_5);
}
_draggingDestination=_39;
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingEntered:"))){
_38=objj_msgSend(_draggingDestination,"draggingEntered:",_5);
}
}else{
if(_draggingDestination&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("draggingUpdated:"))){
_38=objj_msgSend(_draggingDestination,"draggingUpdated:",_5);
}
}
if(!_draggingDestination){
_38=CPDragOperationNone;
}
return _38;
}
}),new objj_method(sel_getUid("draggingEndedInPlatformWindow:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_draggedView,"removeFromSuperview");
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_draggedWindow,"orderOut:",_3a);
}
if(_implementedDraggingSourceMethods&_1a){
objj_msgSend(_draggingSource,"draggedImage:endedAt:operation:",objj_msgSend(_draggedView,"image"),_draggingLocation,NO);
}else{
if(_implementedDraggingSourceMethods&_1c){
objj_msgSend(_draggingSource,"draggedView:endedAt:operation:",_draggedView,_draggingLocation,NO);
}
}
_isDragging=NO;
}
}),new objj_method(sel_getUid("performDragOperationInPlatformWindow:"),function(_3d,_3e,_3f){
with(_3d){
if(_draggingDestination&&(!objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("prepareForDragOperation:"))||objj_msgSend(_draggingDestination,"prepareForDragOperation:",_5))&&(!objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("performDragOperation:"))||objj_msgSend(_draggingDestination,"performDragOperation:",_5))&&objj_msgSend(_draggingDestination,"respondsToSelector:",sel_getUid("concludeDragOperation:"))){
objj_msgSend(_draggingDestination,"concludeDragOperation:",_5);
}
}
}),new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_40,_41,_42,_43,_44,_45,_46,_47,_48,_49){
with(_40){
_isDragging=YES;
_draggedView=_42;
_draggingPasteboard=_47||objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
_draggingSource=_48;
_draggingDestination=nil;
var _4a=objj_msgSend(_46,"window"),_4b=objj_msgSend(_46,"locationInWindow");
if(_4b){
if(_4a){
_4b=objj_msgSend(_4a,"convertBaseToGlobal:",_4b);
}
_draggingOffset={width:_4b.x-_44.x,height:_4b.y-_44.y};
}else{
_draggingOffset=_CGSizeMakerZero();
}
if(objj_msgSend(CPPlatform,"isBrowser")){
objj_msgSend(_draggedWindow,"setPlatformWindow:",objj_msgSend(_43,"platformWindow"));
}
objj_msgSend(_42,"setFrameOrigin:",{x:0,y:0});
var _4c=objj_msgSend(CPEvent,"mouseLocation");
objj_msgSend(_draggedWindow,"setFrameOrigin:",{x:_4c.x-_draggingOffset.width,y:_4c.y-_draggingOffset.height});
objj_msgSend(_draggedWindow,"setFrameSize:",objj_msgSend(_42,"frame").size);
objj_msgSend(objj_msgSend(_draggedWindow,"contentView"),"addSubview:",_42);
_implementedDraggingSourceMethods=0;
if(_draggedView===_imageView){
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:movedTo:"))){
_implementedDraggingSourceMethods|=_19;
}
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedImage:endAt:operation:"))){
_implementedDraggingSourceMethods|=_1a;
}
}else{
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:movedTo:"))){
_implementedDraggingSourceMethods|=_1b;
}
if(objj_msgSend(_draggingSource,"respondsToSelector:",sel_getUid("draggedView:endedAt:operation:"))){
_implementedDraggingSourceMethods|=_1c;
}
}
if(!objj_msgSend(CPPlatform,"supportsDragAndDrop")){
objj_msgSend(_40,"draggingStartedInPlatformWindow:location:",objj_msgSend(_43,"platformWindow"),_4c);
objj_msgSend(_40,"trackDragging:",_46);
}
}
}),new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_4d,_4e,_4f,_50,_51,_52,_53,_54,_55,_56){
with(_4d){
_isDraggingImage=YES;
var _57=objj_msgSend(_4f,"size");
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:_57.width,height:_57.height}});
}
objj_msgSend(_imageView,"setImage:",_4f);
objj_msgSend(_4d,"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_imageView,_50,_51,_52,_53,_54,_55,_56);
}
}),new objj_method(sel_getUid("trackDragging:"),function(_58,_59,_5a){
with(_58){
var _5b=objj_msgSend(_5a,"type"),_5c=objj_msgSend(_draggedWindow,"platformWindow"),_5d=objj_msgSend(objj_msgSend(_5a,"window"),"convertBaseToPlatformWindow:",objj_msgSend(_5a,"locationInWindow"));
if(_5b===CPLeftMouseUp){
objj_msgSend(_58,"performDragOperationInPlatformWindow:",_5c);
objj_msgSend(_58,"draggingEndedInPlatformWindow:",_5c);
return;
}
objj_msgSend(_58,"draggingSourceUpdatedWithLocation:",_5d);
objj_msgSend(_58,"draggingUpdatedInPlatformWindow:location:",_5c,_5d);
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_58,sel_getUid("trackDragging:"),CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,0,NO);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(_5e,_5f){
with(_5e){
if(_5e!==objj_msgSend(CPDragServer,"class")){
return;
}
_5=objj_msgSend(objj_msgSend(CPDraggingInfo,"alloc"),"init");
}
}),new objj_method(sel_getUid("sharedDragServer"),function(_60,_61){
with(_60){
if(!_3){
_3=objj_msgSend(objj_msgSend(CPDragServer,"alloc"),"init");
}
return _3;
}
})]);
var _6=objj_getClass("CPWindow");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_62,_63,_64,_65){
with(_62){
if(!_inclusiveRegisteredDraggedTypes){
return nil;
}
var _66=objj_msgSend(_62,"convertPlatformWindowToBase:",_64),_67=objj_msgSend(_windowView,"hitTest:",_66);
while(_67&&!objj_msgSend(_65,"availableTypeFromArray:",objj_msgSend(_67,"registeredDraggedTypes"))){
_67=objj_msgSend(_67,"superview");
}
if(_67){
return _67;
}
if(objj_msgSend(_65,"availableTypeFromArray:",objj_msgSend(_62,"registeredDraggedTypes"))){
return _62;
}
return nil;
}
})]);
