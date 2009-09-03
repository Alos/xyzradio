I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.ji;18;CPPlatformWindow.jc;23286;
var _1="dblclick",_2="mousedown",_3="mouseup",_4="mousemove",_5="mousedrag",_6="keyup",_7="keydown",_8="keypress",_9="copy",_a="paste",_b="resize",_c="mousewheel",_d="touchstart",_e="touchmove",_f="touchend",_10="touchcancel";
var _11=[];
_11["INPUT"]=YES;
_11["SELECT"]=YES;
_11["TEXTAREA"]=YES;
_11["OPTION"]=YES;
var _12,_13;
var _14={},_15={},_16={"8":1,"9":1,"16":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _17=17;
var _18=objj_getClass("CPPlatformWindow");
if(!_18){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPlatformWindow\""));
}
var _19=_18.isa;
class_addMethods(_18,[new objj_method(sel_getUid("_init"),function(_1a,_1b){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_DOMWindow=window;
_contentRect={origin:{x:0,y:0},size:{width:0,height:0}};
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1a,"registerDOMWindow");
objj_msgSend(_1a,"updateFromNativeContentRect");
_charCodes={};
}
return _1a;
}
}),new objj_method(sel_getUid("nativeContentRect"),function(_1c,_1d){
with(_1c){
if(!_DOMWindow){
return objj_msgSend(_1c,"contentRect");
}
if(_DOMWindow.cpFrame){
return _DOMWindow.cpFrame();
}
var _1e={origin:{x:0,y:0},size:{width:0,height:0}};
if(window.screenTop){
_1e.origin={x:_DOMWindow.screenLeft,y:_DOMWindow.screenTop};
}else{
if(window.screenX){
_1e.origin={x:_DOMWindow.screenX,y:_DOMWindow.screenY};
}
}
if(_DOMWindow.innerWidth){
_1e.size={width:_DOMWindow.innerWidth,height:_DOMWindow.innerHeight};
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_1e.size={width:_DOMWindow.document.documentElement.clientWidth,height:_DOMWindow.document.documentElement.clientHeight};
}else{
_1e.size={width:_DOMWindow.document.body.clientWidth,height:_DOMWindow.document.body.clientHeight};
}
}
return _1e;
}
}),new objj_method(sel_getUid("updateNativeContentOrigin"),function(_1f,_20){
with(_1f){
if(!_DOMWindow){
return;
}
if(_DOMWindow.cpSetFrame){
return _DOMWindow.cpSetFrame(objj_msgSend(_1f,"contentRect"));
}
var _21=objj_msgSend(_1f,"contentRect").origin,_22=objj_msgSend(_1f,"nativeContentRect").origin;
_DOMWindow.moveBy(_21.x-_22.x,_21.y-_22.y);
}
}),new objj_method(sel_getUid("updateNativeContentSize"),function(_23,_24){
with(_23){
if(!_DOMWindow){
return;
}
if(_DOMWindow.cpSetFrame){
return _DOMWindow.cpSetFrame(objj_msgSend(_23,"contentRect"));
}
var _25=objj_msgSend(_23,"contentRect").size,_26=objj_msgSend(_23,"nativeContentRect").size;
_DOMWindow.resizeBy(_25.width-_26.width,_25.height-_26.height);
}
}),new objj_method(sel_getUid("orderBack:"),function(_27,_28,_29){
with(_27){
if(_DOMWindow){
_DOMWindow.blur();
}
}
}),new objj_method(sel_getUid("registerDOMWindow"),function(_2a,_2b){
with(_2a){
var _2c=_DOMWindow.document;
_DOMBodyElement=_2c.getElementsByTagName("body")[0];
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.style["-khtml-user-select"]="none";
}
_DOMBodyElement.webkitTouchCallout="none";
_DOMFocusElement=_2c.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=_2c.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
var _2d=objj_msgSend(_2a,"class"),_2e=class_getMethodImplementation(_2d,sel_getUid("dragEvent:")),_2f=function(_30){
_2e(_2a,nil,_30);
},_31=sel_getUid("resizeEvent:"),_32=class_getMethodImplementation(_2d,_31),_33=function(_34){
_32(_2a,nil,_34);
},_35=sel_getUid("keyEvent:"),_36=class_getMethodImplementation(_2d,_35),_37=function(_38){
_36(_2a,nil,_38);
},_39=sel_getUid("mouseEvent:"),_3a=class_getMethodImplementation(_2d,_39),_3b=function(_3c){
_3a(_2a,nil,_3c);
},_3d=sel_getUid("scrollEvent:"),_3e=class_getMethodImplementation(_2d,_3d),_3f=function(_40){
_3e(_2a,nil,_40);
},_41=sel_getUid("touchEvent:"),_42=class_getMethodImplementation(_2d,_41),_43=function(_44){
_42(_2a,nil,_44);
};
if(_2c.addEventListener){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_2c.addEventListener("dragstart",_2f,NO);
_2c.addEventListener("drag",_2f,NO);
_2c.addEventListener("dragend",_2f,NO);
_2c.addEventListener("dragover",_2f,NO);
_2c.addEventListener("dragleave",_2f,NO);
_2c.addEventListener("drop",_2f,NO);
}
_2c.addEventListener("mouseup",_3b,NO);
_2c.addEventListener("mousedown",_3b,NO);
_2c.addEventListener("mousemove",_3b,NO);
_2c.addEventListener("keyup",_37,NO);
_2c.addEventListener("keydown",_37,NO);
_2c.addEventListener("keypress",_37,NO);
_2c.addEventListener("touchstart",_43,NO);
_2c.addEventListener("touchend",_43,NO);
_2c.addEventListener("touchmove",_43,NO);
_2c.addEventListener("touchcancel",_43,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.addEventListener("mousewheel",_3f,NO);
_DOMWindow.addEventListener("resize",_33,NO);
_DOMWindow.addEventListener("unload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
_2c.removeEventListener("mouseup",_3b,NO);
_2c.removeEventListener("mousedown",_3b,NO);
_2c.removeEventListener("mousemove",_3b,NO);
_2c.removeEventListener("keyup",_37,NO);
_2c.removeEventListener("keydown",_37,NO);
_2c.removeEventListener("keypress",_37,NO);
_2c.removeEventListener("touchstart",_43,NO);
_2c.removeEventListener("touchend",_43,NO);
_2c.removeEventListener("touchmove",_43,NO);
_DOMWindow.removeEventListener("resize",_33,NO);
_DOMWindow.removeEventListener("DOMMouseScroll",_3f,NO);
_DOMWindow.removeEventListener("mousewheel",_3f,NO);
_2a._DOMWindow=nil;
},NO);
}else{
_2c.attachEvent("onmouseup",_3b);
_2c.attachEvent("onmousedown",_3b);
_2c.attachEvent("onmousemove",_3b);
_2c.attachEvent("ondblclick",_3b);
_2c.attachEvent("onkeyup",_37);
_2c.attachEvent("onkeydown",_37);
_2c.attachEvent("onkeypress",_37);
_DOMWindow.attachEvent("onresize",_33);
_DOMWindow.onmousewheel=_3f;
_2c.onmousewheel=_3f;
_2c.body.ondrag=function(){
return NO;
};
_2c.body.onselectstart=function(){
return _DOMWindow.event.srcElement===_DOMPasteboardElement;
};
_DOMWindow.attachEvent("onbeforeunload",function(){
objj_msgSend(_2a,"updateFromNativeContentRect");
_2c.removeEvent("onmouseup",_3b);
_2c.removeEvent("onmousedown",_3b);
_2c.removeEvent("onmousemove",_3b);
_2c.removeEvent("ondblclick",_3b);
_2c.removeEvent("onkeyup",_37);
_2c.removeEvent("onkeydown",_37);
_2c.removeEvent("onkeypress",_37);
_DOMWindow.removeEvent("onresize",_33);
_DOMWindow.onmousewheel=NULL;
_2c.onmousewheel=NULL;
_2c.body.ondrag=NULL;
_2c.body.onselectstart=NULL;
_2a._DOMWindow=nil;
},NO);
}
}
}),new objj_method(sel_getUid("orderFront:"),function(_45,_46,_47){
with(_45){
if(_DOMWindow){
return _DOMWindow.focus();
}
_DOMWindow=window.open("","_blank","menubar=no,location=no,resizable=yes,scrollbars=no,status=no,left="+(_contentRect.origin.x)+",top="+(_contentRect.origin.y)+",width="+(_contentRect.size.width)+",height="+(_contentRect.size.height));
_DOMWindow.document.write("<html><head></head><body style = 'background-color:transparent;'></body></html>");
_DOMWindow.document.close();
if(!objj_msgSend(CPPlatform,"isBrowser")){
_DOMWindow.cpSetLevel(_level);
_DOMWindow.cpSetHasShadow(_hasShadow);
}
objj_msgSend(_45,"registerDOMWindow");
}
}),new objj_method(sel_getUid("orderOut:"),function(_48,_49,_4a){
with(_48){
if(!_DOMWindow){
return;
}
_DOMWindow.close();
}
}),new objj_method(sel_getUid("dragEvent:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=_4d.type,_4f=objj_msgSend(CPDragServer,"sharedDragServer"),_50={x:_4d.clientX,y:_4d.clientY},_51=objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
objj_msgSend(_51,"_setDataTransfer:",_4d.dataTransfer);
if(_4d.type==="dragstart"){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
objj_msgSend(_51,"_setPasteboard:",objj_msgSend(_4f,"draggingPasteboard"));
var _52=objj_msgSend(_4f,"draggedWindow"),_53=objj_msgSend(_52,"frame"),_54=_52._DOMElement;
_54.style.left=-(_53.size.width)+"px";
_54.style.top=-(_53.size.height)+"px";
document.getElementsByTagName("body")[0].appendChild(_54);
var _55=objj_msgSend(_4f,"draggingOffset");
_4d.dataTransfer.setDragImage(_54,_55.width,_55.height);
objj_msgSend(_4f,"draggingStartedInPlatformWindow:location:",_4b,objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="drag"){
objj_msgSend(_4f,"draggingSourceUpdatedWithLocation:",objj_msgSend(CPPlatform,"isBrowser")?_50:{x:_4d.screenX,y:_4d.screenY});
}else{
if(_4e==="dragover"||_4e==="dragleave"){
if(_4d.preventDefault){
_4d.preventDefault();
}
var _56="none",_57=objj_msgSend(_4f,"draggingUpdatedInPlatformWindow:location:",_4b,_50);
if(_57===CPDragOperationMove||_57===CPDragOperationGeneric||_57===CPDragOperationPrivate){
_56="move";
}else{
if(_57===CPDragOperationCopy){
_56="copy";
}else{
if(_57===CPDragOperationLink){
_56="link";
}
}
}
_4d.dataTransfer.dropEffect=_56;
}else{
if(_4e==="dragend"){
objj_msgSend(_4f,"draggingEndedInPlatformWindow:",_4b);
}else{
objj_msgSend(_4f,"performDragOperationInPlatformWindow:",_4b);
if(_4d.preventDefault){
_4d.preventDefault();
}
if(_4d.stopPropagation){
_4d.stopPropagation();
}
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyEvent:"),function(_58,_59,_5a){
with(_58){
var _5b,_5c=_5a.timeStamp?_5a.timeStamp:new Date(),_5d=(_5a.target||_5a.srcElement),_5e=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_5f=(_5a.shiftKey?CPShiftKeyMask:0)|(_5a.ctrlKey?CPControlKeyMask:0)|(_5a.altKey?CPAlternateKeyMask:0)|(_5a.metaKey?CPCommandKeyMask:0);
if(_11[_5d.tagName]&&_5d!=_DOMFocusElement&&_5d!=_DOMPasteboardElement){
return;
}
StopDOMEventPropagation=!(_5f&(CPControlKeyMask|CPCommandKeyMask))||_15[String.fromCharCode(_5a.keyCode||_5a.charCode).toLowerCase()]||_14[_5a.keyCode];
var _60=NO,_61=NO;
switch(_5a.type){
case "keydown":
_keyCode=_5a.keyCode;
var _62=String.fromCharCode(_keyCode).toLowerCase();
if(_62=="v"&&(_5f&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_60=YES;
}else{
if((_62=="c"||_62=="x")&&(_5f&CPPlatformActionKeyMask)){
_61=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_16[_keyCode]&&(_keyCode==_17||!(_5f&CPControlKeyMask))){
return;
}
}
}
}
case "keypress":
if((_5a.target||_5a.srcElement)==_DOMPasteboardElement){
return;
}
var _63=_keyCode,_64=_5a.keyCode||_5a.charCode,_65=(_charCodes[_63]!=nil);
_charCodes[_63]=_64;
var _62=String.fromCharCode(_64),_66=_62.toLowerCase();
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_5f,_5c,_5e,nil,_62,_66,_65,_63);
if(_60){
_pasteboardKeyDownEvent=_5b;
window.setNativeTimeout(function(){
objj_msgSend(_58,"_checkPasteboardElement");
},0);
return;
}
break;
case "keyup":
var _63=_5a.keyCode,_64=_charCodes[_63];
_charCodes[_63]=nil;
var _62=String.fromCharCode(_64),_66=_62.toLowerCase();
if(!(_5f&CPShiftKeyMask)){
_62=_66;
}
_5b=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_5f,_5c,_5e,nil,_62,_66,NO,_63);
break;
}
if(_5b){
_5b._DOMEvent=_5a;
objj_msgSend(CPApp,"sendEvent:",_5b);
if(_61){
var _67=objj_msgSend(CPPasteboard,"generalPasteboard"),_68=objj_msgSend(_67,"types");
if(_68.length){
if(objj_msgSend(_68,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_67,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_67,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setNativeTimeout(function(){
objj_msgSend(_58,"_clearPasteboardElement");
},0);
}
return;
}
}
if(StopDOMEventPropagation){
_13(_5a,_58);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("scrollEvent:"),function(_69,_6a,_6b){
with(_69){
if(!_6b){
_6b=window.event;
}
if(CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15)){
var x=0,y=0,_6e=_6b.target;
while(_6e.nodeType!==1){
_6e=_6e.parentNode;
}
if(_6e.offsetParent){
do{
x+=_6e.offsetLeft;
y+=_6e.offsetTop;
}while(_6e=_6e.offsetParent);
}
var _6f={x:(x+((_6b.clientX-8)/15)),y:(y+((_6b.clientY-8)/15))};
}else{
var _6f={x:_6b.clientX,y:_6b.clientY};
}
var _70=0,_71=0,_72=0,_73=_6b.timeStamp?_6b.timeStamp:new Date(),_74=(_6b.shiftKey?CPShiftKeyMask:0)|(_6b.ctrlKey?CPControlKeyMask:0)|(_6b.altKey?CPAlternateKeyMask:0)|(_6b.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
var _75=objj_msgSend(_69,"hitTest:",_6f);
if(!_75){
return;
}
var _72=objj_msgSend(_75,"windowNumber");
_6f=objj_msgSend(_75,"convertBridgeToBase:",_6f);
if(typeof _6b.wheelDeltaX!="undefined"){
_70=_6b.wheelDeltaX/120;
_71=_6b.wheelDeltaY/120;
}else{
if(_6b.wheelDelta){
_71=_6b.wheelDelta/120;
}else{
if(_6b.detail){
_71=-_6b.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_70=-_70;
_71=-_71;
}
var _76=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_6f,_74,_73,_72,nil,-1,1,0);
_76._DOMEvent=_6b;
_76._deltaX=_70;
_76._deltaY=_71;
objj_msgSend(CPApp,"sendEvent:",_76);
if(StopDOMEventPropagation){
_13(_6b,_69);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("resizeEvent:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_77,"contentRect").size;
objj_msgSend(_77,"updateFromNativeContentRect");
var _7b=_windowLevels,_7c=_windowLayers,_7d=_7b.length;
while(_7d--){
var _7e=objj_msgSend(_7c,"objectForKey:",_7b[_7d])._windows,_7f=_7e.length;
while(_7f--){
objj_msgSend(_7e[_7f],"resizeWithOldPlatformWindowSize:",_7a);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("touchEvent:"),function(_80,_81,_82){
with(_80){
if(_82.touches&&(_82.touches.length==1||(_82.touches.length==0&&_82.changedTouches.length==1))){
var _83={};
switch(_82.type){
case CPDOMEventTouchStart:
_83.type=CPDOMEventMouseDown;
break;
case CPDOMEventTouchEnd:
_83.type=CPDOMEventMouseUp;
break;
case CPDOMEventTouchMove:
_83.type=CPDOMEventMouseMoved;
break;
case CPDOMEventTouchCancel:
_83.type=CPDOMEventMouseUp;
break;
}
var _84=_82.touches.length?_82.touches[0]:_82.changedTouches[0];
_83.clientX=_84.clientX;
_83.clientY=_84.clientY;
_83.timestamp=_82.timestamp;
_83.target=_82.target;
_83.shiftKey=_83.ctrlKey=_83.altKey=_83.metaKey=false;
_83.preventDefault=function(){
if(_82.preventDefault){
_82.preventDefault();
}
};
_83.stopPropagation=function(){
if(_82.stopPropagation){
_82.stopPropagation();
}
};
objj_msgSend(_80,"_bridgeMouseEvent:",_83);
return;
}else{
if(_82.preventDefault){
_82.preventDefault();
}
if(_82.stopPropagation){
_82.stopPropagation();
}
}
}
}),new objj_method(sel_getUid("mouseEvent:"),function(_85,_86,_87){
with(_85){
var _88=_overriddenEventType||_87.type;
if(_88==="dblclick"){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_85,"_bridgeMouseEvent:",_87);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_85,"_bridgeMouseEvent:",_87);
_overriddenEventType=nil;
return;
}
var _89,_8a={x:_87.clientX,y:_87.clientY},_8b=_87.timeStamp?_87.timeStamp:new Date(),_8c=(_87.target||_87.srcElement),_8d=0,_8e=(_87.shiftKey?CPShiftKeyMask:0)|(_87.ctrlKey?CPControlKeyMask:0)|(_87.altKey?CPAlternateKeyMask:0)|(_87.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
if(_mouseDownWindow){
_8d=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _8f=objj_msgSend(_85,"hitTest:",_8a);
if((_87.type===CPDOMEventMouseDown)&&_8f){
_mouseDownWindow=_8f;
}
_8d=objj_msgSend(_8f,"windowNumber");
}
if(_8d){
_8a=objj_msgSend(CPApp._windows[_8d],"convertPlatformWindowToBase:",_8a);
}
if(_88==="mouseup"){
if(_mouseIsDown){
_89=_90(_87,CPLeftMouseUp,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseUp,_8b,_8a),0);
_mouseIsDown=NO;
_lastMouseUp=_89;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
}else{
if(_88==="mousedown"){
if(_11[_8c.tagName]&&_8c!=_DOMFocusElement){
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","false");
_DOMBodyElement.style["-khtml-user-drag"]="none";
}
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0));
return;
}else{
if(objj_msgSend(CPPlatform,"supportsDragAndDrop")){
_DOMBodyElement.setAttribute("draggable","true");
_DOMBodyElement.style["-khtml-user-drag"]="element";
}
}
_89=_90(_87,CPLeftMouseDown,_8a,_8e,_8b,_8d,nil,-1,_12(_lastMouseDown,_8b,_8a),0);
_mouseIsDown=YES;
_lastMouseDown=_89;
}else{
if(_DOMEventMode){
return;
}
_89=_90(_87,_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_8a,_8e,_8b,_8d,nil,-1,1,0);
}
}
if(_89){
_89._DOMEvent=_87;
objj_msgSend(CPApp,"sendEvent:",_89);
}
if(StopDOMEventPropagation&&(!objj_msgSend(CPPlatform,"supportsDragAndDrop")||_88!=="mousedown"&&!objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"isDragging"))){
_13(_87,_85);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_91,_92,_93,_94){
with(_91){
var _95=objj_msgSend(_windowLayers,"objectForKey:",_93);
if(!_95&&_94){
_95=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_93);
objj_msgSend(_windowLayers,"setObject:forKey:",_95,_93);
var low=0,_97=_windowLevels.length-1,_98;
while(low<=_97){
_98=FLOOR((low+_97)/2);
if(_windowLevels[_98]>_93){
_97=_98-1;
}else{
low=_98+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_93,_windowLevels[_98]>_93?_98:_98+1);
_95._DOMElement.style.zIndex=_93;
_DOMBodyElement.appendChild(_95._DOMElement);
}
return _95;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_99,_9a,_9b,_9c,_9d){
with(_99){
var _9e=objj_msgSend(_99,"layerAtLevel:create:",objj_msgSend(_9c,"level"),_9b!=CPWindowOut);
if(_9b==CPWindowOut){
return objj_msgSend(_9e,"removeWindow:",_9c);
}
objj_msgSend(_9e,"insertWindow:atIndex:",_9c,(_9d?(_9b==CPWindowAbove?_9d._index+1:_9d._index):CPNotFound));
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_9f,_a0,_a1,_a2){
with(_9f){
var _a3=_windowLevels,_a4=_windowLayers,_a5=_a3.length;
while(_a5--){
if(_a3[_a5]>=CPDraggingWindowLevel){
continue;
}
var _a6=objj_msgSend(_a4,"objectForKey:",_a3[_a5])._windows,_a7=_a6.length;
while(_a7--){
var _a8=_a6[_a7];
if(objj_msgSend(_a8,"_sharesChromeWithPlatformWindow")){
return objj_msgSend(_a8,"_dragHitTest:pasteboard:",_a1,_a2);
}
if(objj_msgSend(_a8,"containsPoint:",_a1)){
return objj_msgSend(_a8,"_dragHitTest:pasteboard:",_a1,_a2);
}
}
}
return nil;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_a9,_aa,_ab){
with(_a9){
StopDOMEventPropagation=!_ab;
}
}),new objj_method(sel_getUid("hitTest:"),function(_ac,_ad,_ae){
with(_ac){
if(_ac._only){
return _ac._only;
}
var _af=_windowLevels,_b0=_windowLayers,_b1=_af.length,_b2=nil;
while(_b1--&&!_b2){
var _b3=objj_msgSend(_b0,"objectForKey:",_af[_b1])._windows,_b4=_b3.length;
while(_b4--&&!_b2){
var _b5=_b3[_b4];
if(!_b5._ignoresMouseEvents&&objj_msgSend(_b5,"containsPoint:",_ae)){
_b2=_b5;
}
}
}
return _b2;
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_b6,_b7){
with(_b6){
var _b8=_DOMPasteboardElement.value;
if(objj_msgSend(_b8,"length")){
var _b9=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_b9,"_stateUID")!=_b8){
objj_msgSend(_b9,"declareTypes:owner:",[CPStringPboardType],_b6);
objj_msgSend(_b9,"setString:forType:",_b8,CPStringPboardType);
}
}
objj_msgSend(_b6,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_ba,_bb){
with(_ba){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
class_addMethods(_19,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_bc,_bd,_be){
with(_bc){
for(var i=_be.length;i>0;i--){
_15[""+_be[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_c0,_c1,_c2){
with(_c0){
_15[_c2.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_c3,_c4){
with(_c3){
_15={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_c5,_c6,_c7){
with(_c5){
for(var i=_c7.length;i>0;i--){
_14[_c7[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_c9,_ca,_cb){
with(_c9){
_14[_cb]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_cc,_cd){
with(_cc){
_14={};
}
})]);
var _ce=objj_msgSend(CPEvent,"class");
var _90=function(_cf,_d0,_d1,_d2,_d3,_d4,_d5,_d6,_d7,_d8){
_cf.isa=_ce;
_cf._type=_d0;
_cf._location=_d1;
_cf._modifierFlags=_d2;
_cf._timestamp=_d3;
_cf._windowNumber=_d4;
_cf._window=nil;
_cf._context=_d5;
_cf._eventNumber=_d6;
_cf._clickCount=_d7;
_cf._pressure=_d8;
return _cf;
};
var _d9=5,_da=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _12=function(_db,_dc,_dd){
if(!_db){
return 1;
}
var _de=objj_msgSend(_db,"locationInWindow");
return (_dc-objj_msgSend(_db,"timestamp")<_da&&ABS(_de.x-_dd.x)<_d9&&ABS(_de.y-_dd.y)<_d9)?objj_msgSend(_db,"clickCount")+1:1;
};
var _13=function(_df,_e0){
_df.cancelBubble=true;
_df.returnValue=false;
if(_df.preventDefault){
_df.preventDefault();
}
if(_df.stopPropagation){
_df.stopPropagation();
}
if(_df.type===CPDOMEventMouseDown){
_e0._DOMFocusElement.focus();
_e0._DOMFocusElement.blur();
}
};
CPWindowObjectList=function(){
var _e1=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_e2=_e1._windowLevels,_e3=_e1._windowLayers,_e4=_e2.length,_e5=[];
while(_e4--){
var _e6=objj_msgSend(_e3,"objectForKey:",_e2[_e4])._windows,_e7=_e6.length;
while(_e7--){
_e5.push(_e6[_e7]);
}
}
return _e5;
};
CPWindowList=function(){
var _e8=objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),_e9=_e8._windowLevels,_ea=_e8._windowLayers,_eb=_e9.length,_ec=[];
while(_eb--){
var _ed=objj_msgSend(_ea,"objectForKey:",_e9[_eb])._windows,_ee=_ed.length;
while(_ee--){
_ec.push(objj_msgSend(_ed[_ee],"windowNumber"));
}
}
return _ec;
};
