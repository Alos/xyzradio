i;11;CPControl.jc;15280;
CPScrollerNoPart=0;
CPScrollerDecrementPage=1;
CPScrollerKnob=2;
CPScrollerIncrementPage=3;
CPScrollerDecrementLine=4;
CPScrollerIncrementLine=5;
CPScrollerKnobSlot=6;
CPScrollerIncrementArrow=0;
CPScrollerDecrementArrow=1;
CPNoScrollerParts=0;
CPOnlyScrollerArrows=1;
CPAllScrollerParts=2;
var _1=[CPScrollerKnobSlot,CPScrollerDecrementLine,CPScrollerIncrementLine,CPScrollerKnob],_2={},_3={};
_2[CPScrollerDecrementLine]="decrement-line";
_2[CPScrollerIncrementLine]="increment-line";
_2[CPScrollerKnobSlot]="knob-slot";
_2[CPScrollerKnob]="knob";
var _4=objj_allocateClassPair(CPControl,"CPScroller"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_controlSize"),new objj_ivar("_usableParts"),new objj_ivar("_partRects"),new objj_ivar("_isVertical"),new objj_ivar("_knobProportion"),new objj_ivar("_hitPart"),new objj_ivar("_trackingPart"),new objj_ivar("_trackingFloatValue"),new objj_ivar("_trackingStartPoint")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("isVertical"),function(_6,_7){
with(_6){
return _isVertical;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPControl")},"initWithFrame:",_a);
if(_8){
_controlSize=CPRegularControlSize;
_partRects=[];
objj_msgSend(_8,"setFloatValue:knobProportion:",0,1);
_hitPart=CPScrollerNoPart;
objj_msgSend(_8,"_recalculateIsVertical");
}
return _8;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_b,_c,_d){
with(_b){
if(_controlSize==_d){
return;
}
_controlSize=_d;
objj_msgSend(_b,"setNeedsLayout");
objj_msgSend(_b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("controlSize"),function(_e,_f){
with(_e){
return _controlSize;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPControl")},"setFloatValue:",MIN(1,MAX(0,_12)));
objj_msgSend(_10,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setFloatValue:knobProportion:"),function(_13,_14,_15,_16){
with(_13){
_knobProportion=MIN(1,MAX(0.0001,_16));
objj_msgSend(_13,"setFloatValue:",_15);
}
}),new objj_method(sel_getUid("knobProportion"),function(_17,_18){
with(_17){
return _knobProportion;
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(_19,_1a,_1b){
with(_19){
var _1c=_themeState;
if(_2[_hitPart]+"-color"!==_1b){
_1c&=~CPThemeStateHighlighted;
}
return objj_msgSend(_19,"valueForThemeAttribute:inState:",_1b,_1c);
}
}),new objj_method(sel_getUid("rectForPart:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f==CPScrollerNoPart){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
return _partRects[_1f];
}
}),new objj_method(sel_getUid("testPart:"),function(_20,_21,_22){
with(_20){
_22=objj_msgSend(_20,"convertPoint:fromView:",_22,nil);
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerKnob),_22)){
return CPScrollerKnob;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerDecrementPage),_22)){
return CPScrollerDecrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerIncrementPage),_22)){
return CPScrollerIncrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerDecrementLine),_22)){
return CPScrollerDecrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerIncrementLine),_22)){
return CPScrollerIncrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerKnobSlot),_22)){
return CPScrollerKnobSlot;
}
return CPScrollerNoPart;
}
}),new objj_method(sel_getUid("checkSpaceForParts"),function(_23,_24){
with(_23){
var _25=objj_msgSend(_23,"bounds");
if(_knobProportion===1){
_usableParts=CPNoScrollerParts;
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:_25.origin.x,y:_25.origin.y},size:{width:_25.size.width,height:_25.size.height}};
return;
}
_usableParts=CPAllScrollerParts;
var _26=objj_msgSend(_23,"currentValueForThemeAttribute:","knob-inset"),_27=objj_msgSend(_23,"currentValueForThemeAttribute:","track-inset"),_28=(_25.size.width),_29=(_25.size.height);
if(objj_msgSend(_23,"isVertical")){
var _2a=objj_msgSend(_23,"currentValueForThemeAttribute:","decrement-line-size"),_2b=objj_msgSend(_23,"currentValueForThemeAttribute:","increment-line-size"),_2c=_2a.height+_27.top,_2d=_2b.height+_27.bottom,_2e=_29-_2c-_2d,_2f=objj_msgSend(_23,"currentValueForThemeAttribute:","minimum-knob-length"),_30=_28-_26.left-_26.right,_31=MAX(_2f,(_2e*_knobProportion)),_32=_2c+(_2e-_31)*objj_msgSend(_23,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:_2c},size:{width:_28,height:_32-_2c}};
_partRects[CPScrollerKnob]={origin:{x:_26.left,y:_32},size:{width:_30,height:_31}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:_32+_31},size:{width:_28,height:_29-(_32+_31)-_2d}};
_partRects[CPScrollerKnobSlot]={origin:{x:_27.left,y:_2c},size:{width:_28-_27.left-_27.right,height:_2e}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_2a.width,height:_2a.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:_29-_2b.height},size:{width:_2b.width,height:_2b.height}};
}else{
var _2a=objj_msgSend(_23,"currentValueForThemeAttribute:","decrement-line-size"),_2b=objj_msgSend(_23,"currentValueForThemeAttribute:","increment-line-size"),_33=_2a.width+_27.left,_34=_2b.width+_27.right;
slotWidth=_28-_33-_34,_2f=objj_msgSend(_23,"currentValueForThemeAttribute:","minimum-knob-length"),_30=MAX(_2f,(slotWidth*_knobProportion)),_31=_29-_26.top-_26.bottom,_32=_33+(slotWidth-_30)*objj_msgSend(_23,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:_33,y:0},size:{width:_32-_33,height:_29}};
_partRects[CPScrollerKnob]={origin:{x:_32,y:_26.top},size:{width:_30,height:_31}};
_partRects[CPScrollerIncrementPage]={origin:{x:_32+_30,y:0},size:{width:_28-(_32+_30)-_34,height:_29}};
_partRects[CPScrollerKnobSlot]={origin:{x:_33,y:_27.top},size:{width:slotWidth,height:_29-_27.top-_27.bottom}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_2a.width,height:_2a.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:_28-_2b.width,y:0},size:{width:_2b.width,height:_2b.height}};
}
}
}),new objj_method(sel_getUid("usableParts"),function(_35,_36){
with(_35){
return _usableParts;
}
}),new objj_method(sel_getUid("drawArrow:highlight:"),function(_37,_38,_39,_3a){
with(_37){
}
}),new objj_method(sel_getUid("drawKnob"),function(_3b,_3c){
with(_3b){
}
}),new objj_method(sel_getUid("drawKnobSlot"),function(_3d,_3e){
with(_3d){
}
}),new objj_method(sel_getUid("createViewForPart:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_42,"setHitTests:",NO);
return _42;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_43,_44,_45){
with(_43){
return _partRects[_45];
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_46,_47,_48){
with(_46){
var _49=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_49,"setHitTests:",NO);
return _49;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_4a,_4b){
with(_4a){
objj_msgSend(_4a,"checkSpaceForParts");
var _4c=0,_4d=_1.length;
for(;_4c<_4d;++_4c){
var _4e=_1[_4c];
if(_4c===0){
view=objj_msgSend(_4a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4e,CPWindowBelow,_1[_4c+1]);
}else{
view=objj_msgSend(_4a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4e,CPWindowAbove,_1[_4c-1]);
}
if(view){
objj_msgSend(view,"setBackgroundColor:",objj_msgSend(_4a,"currentValueForThemeAttribute:",_2[_4e]+"-color"));
}
}
}
}),new objj_method(sel_getUid("drawParts"),function(_4f,_50){
with(_4f){
objj_msgSend(_4f,"drawKnobSlot");
objj_msgSend(_4f,"drawKnob");
objj_msgSend(_4f,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
objj_msgSend(_4f,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
}
}),new objj_method(sel_getUid("hitPart"),function(_51,_52){
with(_51){
return _hitPart;
}
}),new objj_method(sel_getUid("trackKnob:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(_55,"type");
if(_56===CPLeftMouseUp){
_hitPart=CPScrollerNoPart;
return;
}
if(_56===CPLeftMouseDown){
_trackingFloatValue=objj_msgSend(_53,"floatValue");
_trackingStartPoint=objj_msgSend(_53,"convertPoint:fromView:",objj_msgSend(_55,"locationInWindow"),nil);
}else{
if(_56===CPLeftMouseDragged){
var _57=objj_msgSend(_53,"rectForPart:",CPScrollerKnob),_58=objj_msgSend(_53,"rectForPart:",CPScrollerKnobSlot),_59=!objj_msgSend(_53,"isVertical")?((_58.size.width)-(_57.size.width)):((_58.size.height)-(_57.size.height));
if(_59<=0){
objj_msgSend(_53,"setFloatValue:",0);
}else{
var _5a=objj_msgSend(_53,"convertPoint:fromView:",objj_msgSend(_55,"locationInWindow"),nil);
delta=!objj_msgSend(_53,"isVertical")?_5a.x-_trackingStartPoint.x:_5a.y-_trackingStartPoint.y;
objj_msgSend(_53,"setFloatValue:",_trackingFloatValue+delta/_59);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_53,sel_getUid("trackKnob:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
objj_msgSend(_53,"sendAction:to:",objj_msgSend(_53,"action"),objj_msgSend(_53,"target"));
}
}),new objj_method(sel_getUid("trackScrollButtons:"),function(_5b,_5c,_5d){
with(_5b){
var _5e=objj_msgSend(_5d,"type");
if(_5e===CPLeftMouseUp){
objj_msgSend(_5b,"highlight:",NO);
objj_msgSend(CPEvent,"stopPeriodicEvents");
_hitPart=CPScrollerNoPart;
return;
}
if(_5e===CPLeftMouseDown){
_trackingPart=objj_msgSend(_5b,"hitPart");
_trackingStartPoint=objj_msgSend(_5b,"convertPoint:fromView:",objj_msgSend(_5d,"locationInWindow"),nil);
if(objj_msgSend(_5d,"modifierFlags")&CPAlternateKeyMask){
if(_trackingPart==CPScrollerDecrementLine){
_hitPart=CPScrollerDecrementPage;
}else{
if(_trackingPart==CPScrollerIncrementLine){
_hitPart=CPScrollerIncrementPage;
}else{
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _5f=objj_msgSend(_5b,"rectForPart:",CPScrollerKnob),_60=!objj_msgSend(_5b,"isVertical")?(_5f.size.width):(_5f.size.height),_61=objj_msgSend(_5b,"rectForPart:",CPScrollerKnobSlot),_62=(!objj_msgSend(_5b,"isVertical")?(_61.size.width):(_61.size.height))-_60;
objj_msgSend(_5b,"setFloatValue:",((!objj_msgSend(_5b,"isVertical")?_trackingStartPoint.x-(_61.origin.x):_trackingStartPoint.y-(_61.origin.y))-_60/2)/_62);
_hitPart=CPScrollerKnob;
objj_msgSend(_5b,"sendAction:to:",objj_msgSend(_5b,"action"),objj_msgSend(_5b,"target"));
return objj_msgSend(_5b,"trackKnob:",_5d);
}
}
}
}
objj_msgSend(_5b,"highlight:",YES);
objj_msgSend(_5b,"sendAction:to:",objj_msgSend(_5b,"action"),objj_msgSend(_5b,"target"));
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.5,0.04);
}else{
if(_5e===CPLeftMouseDragged){
_trackingStartPoint=objj_msgSend(_5b,"convertPoint:fromView:",objj_msgSend(_5d,"locationInWindow"),nil);
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _63=objj_msgSend(_5b,"testPart:",objj_msgSend(_5d,"locationInWindow"));
if(_63==CPScrollerDecrementPage||_63==CPScrollerIncrementPage){
_trackingPart=_63;
_hitPart=_63;
}
}
objj_msgSend(_5b,"highlight:",CGRectContainsPoint(objj_msgSend(_5b,"rectForPart:",_trackingPart),_trackingStartPoint));
}else{
if(_5e==CPPeriodic&&CGRectContainsPoint(objj_msgSend(_5b,"rectForPart:",_trackingPart),_trackingStartPoint)){
objj_msgSend(_5b,"sendAction:to:",objj_msgSend(_5b,"action"),objj_msgSend(_5b,"target"));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_5b,sel_getUid("trackScrollButtons:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_recalculateIsVertical"),function(_64,_65){
with(_64){
var _66=objj_msgSend(_64,"bounds"),_67=(_66.size.width),_68=(_66.size.height);
_isVertical=_67<_68?1:(_67>_68?0:-1);
if(_isVertical===1){
objj_msgSend(_64,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_64,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_69,_6a,_6b){
with(_69){
objj_msgSendSuper({receiver:_69,super_class:objj_getClass("CPControl")},"setFrameSize:",_6b);
objj_msgSend(_69,"_recalculateIsVertical");
objj_msgSend(_69,"checkSpaceForParts");
objj_msgSend(_69,"setNeedsLayout");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6c,_6d,_6e){
with(_6c){
if(!objj_msgSend(_6c,"isEnabled")){
return;
}
_hitPart=objj_msgSend(_6c,"testPart:",objj_msgSend(_6e,"locationInWindow"));
switch(_hitPart){
case CPScrollerKnob:
return objj_msgSend(_6c,"trackKnob:",_6e);
case CPScrollerDecrementLine:
case CPScrollerIncrementLine:
case CPScrollerDecrementPage:
case CPScrollerIncrementPage:
return objj_msgSend(_6c,"trackScrollButtons:",_6e);
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("themeClass"),function(_6f,_70){
with(_6f){
return "scroller";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_71,_72){
with(_71){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[nil,nil,nil,nil,{width:0,height:0},{width:0,height:0},{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},{width:0,height:0}],["knob-slot-color","decrement-line-color","increment-line-color","knob-color","decrement-line-size","increment-line-size","track-inset","knob-inset","minimum-knob-length"]);
}
}),new objj_method(sel_getUid("scrollerWidth"),function(_73,_74){
with(_73){
return 17;
}
}),new objj_method(sel_getUid("scrollerWidthForControlSize:"),function(_75,_76,_77){
with(_75){
return 17;
}
})]);
var _78="CPScrollerControlSize",_79="CPScrollerKnobProportion";
var _4=objj_getClass("CPScroller");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScroller\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_7a,_7b,_7c){
with(_7a){
if(_7a=objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPControl")},"initWithCoder:",_7c)){
_controlSize=CPRegularControlSize;
if(objj_msgSend(_7c,"containsValueForKey:",_78)){
_controlSize=objj_msgSend(_7c,"decodeIntForKey:",_78);
}
_knobProportion=1;
if(objj_msgSend(_7c,"containsValueForKey:",_79)){
_knobProportion=objj_msgSend(_7c,"decodeFloatForKey:",_79);
}
_partRects=[];
_hitPart=CPScrollerNoPart;
objj_msgSend(_7a,"_recalculateIsVertical");
}
return _7a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7d,_7e,_7f){
with(_7d){
objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_7f);
objj_msgSend(_7f,"encodeInt:forKey:",_controlSize,_78);
objj_msgSend(_7f,"encodeFloat:forKey:",_knobProportion,_79);
}
})]);
