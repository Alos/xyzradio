i;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;14592;
var _1=objj_allocateClassPair(CPView,"CPScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
objj_msgSend(_3,"setHasVerticalScroller:",YES);
objj_msgSend(_3,"setHasHorizontalScroller:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("contentSize"),function(_6,_7){
with(_6){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_8,_9){
with(_8){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setContentView:"),function(_a,_b,_c){
with(_a){
if(!_c){
return;
}
var _d=objj_msgSend(_c,"documentView");
if(_d){
objj_msgSend(_d,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
var _e=objj_msgSend(_a,"contentSize");
_contentView=_c;
objj_msgSend(_contentView,"setFrame:",CGRectMake(0,0,_e.width,_e.height));
objj_msgSend(_contentView,"setDocumentView:",_d);
objj_msgSend(_a,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_f,_10){
with(_f){
return _contentView;
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_contentView,"setDocumentView:",_13);
objj_msgSend(_11,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_14,_15,_16){
with(_14){
if(_contentView!==_16){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _17=objj_msgSend(_14,"documentView");
if(!_17){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}else{
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_14,"bounds"));
--_recursionCount;
return;
}
var _18=objj_msgSend(_17,"frame"),_19=objj_msgSend(_14,"bounds"),_1a=objj_msgSend(_contentView,"bounds").origin,_1b={width:CPRectGetWidth(_18)-CPRectGetWidth(_19),height:CPRectGetHeight(_18)-CPRectGetHeight(_19)},_1c=(!_autohidesScrollers||_1b.height>0)&&_hasVerticalScroller,_1d=(!_autohidesScrollers||_1b.width>0)&&_hasHorizontalScroller,_1e=!objj_msgSend(_verticalScroller,"isHidden"),_1f=!objj_msgSend(_horizontalScroller,"isHidden"),_20=(objj_msgSend(_verticalScroller,"frame").size.width);
horizontalScrollerHeight=(objj_msgSend(_horizontalScroller,"frame").size.height);
if(_autohidesScrollers){
if(_1c){
_1d=(!_autohidesScrollers||_1b.width>-_20)&&_hasHorizontalScroller;
}
if(_1d){
_1c=(!_autohidesScrollers||_1b.height>-horizontalScrollerHeight)&&_hasVerticalScroller;
}
}
objj_msgSend(_verticalScroller,"setHidden:",!_1c);
objj_msgSend(_verticalScroller,"setEnabled:",_1b.height>0);
objj_msgSend(_horizontalScroller,"setHidden:",!_1d);
objj_msgSend(_horizontalScroller,"setEnabled:",_1b.width>0);
if(_1c){
var _21=CPRectGetHeight(_19);
if(_1d){
_21-=horizontalScrollerHeight;
}
_1b.width+=_20;
_19.size.width-=_20;
objj_msgSend(_verticalScroller,"setFloatValue:knobProportion:",(_1b.height<=0)?0:_1a.y/_1b.height,CPRectGetHeight(_19)/CPRectGetHeight(_18));
objj_msgSend(_verticalScroller,"setFrame:",CPRectMake(CPRectGetMaxX(_19),0,_20,_21));
}else{
if(_1e){
objj_msgSend(_verticalScroller,"setFloatValue:knobProportion:",0,1);
}
}
if(_1d){
_1b.height+=horizontalScrollerHeight;
_19.size.height-=horizontalScrollerHeight;
objj_msgSend(_horizontalScroller,"setFloatValue:knobProportion:",(_1b.width<=0)?0:_1a.x/_1b.width,CPRectGetWidth(_19)/CPRectGetWidth(_18));
objj_msgSend(_horizontalScroller,"setFrame:",CPRectMake(0,CPRectGetMaxY(_19),CPRectGetWidth(_19),horizontalScrollerHeight));
}else{
if(_1f){
objj_msgSend(_horizontalScroller,"setFloatValue:knobProportion:",0,1);
}
}
objj_msgSend(_contentView,"setFrame:",_19);
--_recursionCount;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_22,_23,_24){
with(_22){
if(_horizontalScroller===_24){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_24;
objj_msgSend(_horizontalScroller,"setTarget:",_22);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_22,"addSubview:",_horizontalScroller);
objj_msgSend(_22,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_25,_26){
with(_25){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_27,_28,_29){
with(_27){
if(_hasHorizontalScroller===_29){
return;
}
_hasHorizontalScroller=_29;
if(_hasHorizontalScroller&&!_horizontalScroller){
objj_msgSend(_27,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,CPRectGetWidth(objj_msgSend(_27,"bounds")),objj_msgSend(CPScroller,"scrollerWidth"))));
}else{
if(!_hasHorizontalScroller&&_horizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",YES);
objj_msgSend(_27,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_2a,_2b){
with(_2a){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_2c,_2d,_2e){
with(_2c){
if(_verticalScroller===_2e){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_2e;
objj_msgSend(_verticalScroller,"setTarget:",_2c);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_2c,"addSubview:",_verticalScroller);
objj_msgSend(_2c,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_2f,_30){
with(_2f){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_31,_32,_33){
with(_31){
if(_hasVerticalScroller===_33){
return;
}
_hasVerticalScroller=_33;
if(_hasVerticalScroller&&!_verticalScroller){
objj_msgSend(_31,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CPRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CPRectGetHeight(objj_msgSend(_31,"bounds")))));
}else{
if(!_hasVerticalScroller&&_verticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_31,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_34,_35){
with(_34){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_36,_37,_38){
with(_36){
if(_autohidesScrollers==_38){
return;
}
_autohidesScrollers=_38;
objj_msgSend(_36,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_39,_3a){
with(_39){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_3d,"floatValue"),_3f=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame");
contentBounds=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
contentBounds.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
contentBounds.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
contentBounds.origin.y-=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
contentBounds.origin.y+=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
contentBounds.origin.y=_3e*((_3f.size.height)-(contentBounds.size.height));
}
objj_msgSend(_contentView,"scrollToPoint:",contentBounds.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_40,_41,_42){
with(_40){
var _43=objj_msgSend(_42,"floatValue"),_44=objj_msgSend(objj_msgSend(_40,"documentView"),"frame"),_45=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_45.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_45.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_45.origin.x-=(_45.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_45.origin.x+=(_45.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_45.origin.x=_43*((_44.size.width)-(_45.size.width));
}
objj_msgSend(_contentView,"scrollToPoint:",_45.origin);
}
}),new objj_method(sel_getUid("tile"),function(_46,_47){
with(_46){
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"setHorizonalLineScroll:",_4d);
objj_msgSend(_4b,"setVerticalLineScroll:",_4d);
}
}),new objj_method(sel_getUid("lineScroll"),function(_4e,_4f){
with(_4e){
return objj_msgSend(_4e,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_50,_51,_52){
with(_50){
_horizontalLineScroll=_52;
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_53,_54){
with(_53){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_55,_56,_57){
with(_55){
_verticalLineScroll=_57;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_58,_59){
with(_58){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_5a,"setHorizontalPageScroll:",_5c);
objj_msgSend(_5a,"setVerticalPageScroll:",_5c);
}
}),new objj_method(sel_getUid("pageScroll"),function(_5d,_5e){
with(_5d){
return objj_msgSend(_5d,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_5f,_60,_61){
with(_5f){
_horizontalPageScroll=_61;
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_62,_63){
with(_62){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_64,_65,_66){
with(_64){
_verticalPageScroll=_66;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_67,_68){
with(_67){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_69,_6a,_6b){
with(_69){
var _6c=objj_msgSend(objj_msgSend(_69,"documentView"),"frame"),_6d=objj_msgSend(_contentView,"bounds");
_6d.origin.x+=objj_msgSend(_6b,"deltaX")*_horizontalLineScroll;
_6d.origin.y+=objj_msgSend(_6b,"deltaY")*_verticalLineScroll;
objj_msgSend(_contentView,"scrollToPoint:",_6d.origin);
}
}),new objj_method(sel_getUid("keyDown:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_70,"keyCode"),_72=objj_msgSend(objj_msgSend(_6e,"documentView"),"frame"),_73=objj_msgSend(_contentView,"bounds");
switch(_71){
case 33:
_73.origin.y-=(_73.size.height)-_verticalPageScroll;
break;
case 34:
_73.origin.y+=(_73.size.height)-_verticalPageScroll;
break;
case 38:
_73.origin.y-=_verticalLineScroll;
break;
case 40:
_73.origin.y+=_verticalLineScroll;
break;
case 37:
_73.origin.x-=_horizontalLineScroll;
break;
case 49:
_73.origin.x+=_horizontalLineScroll;
break;
default:
return objj_msgSendSuper({receiver:_6e,super_class:objj_getClass("CPView")},"keyDown:",_70);
}
objj_msgSend(_contentView,"scrollToPoint:",_73.origin);
}
})]);
var _74="CPScrollViewContentView",_75="CPScrollViewVLineScroll",_76="CPScrollViewHLineScroll",_77="CPScrollViewVPageScroll",_78="CPScrollViewHPageScroll",_79="CPScrollViewHasVScroller",_7a="CPScrollViewHasHScroller",_7b="CPScrollViewVScroller",_7c="CPScrollViewHScroller",_7d="CPScrollViewAutohidesScroller";
var _1=objj_getClass("CPScrollView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScrollView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7e,_7f,_80){
with(_7e){
if(_7e=objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPView")},"initWithCoder:",_80)){
_verticalLineScroll=objj_msgSend(_80,"decodeFloatForKey:",_75);
_verticalPageScroll=objj_msgSend(_80,"decodeFloatForKey:",_77);
_horizontalLineScroll=objj_msgSend(_80,"decodeFloatForKey:",_76);
_horizontalPageScroll=objj_msgSend(_80,"decodeFloatForKey:",_78);
_contentView=objj_msgSend(_80,"decodeObjectForKey:",_74);
_verticalScroller=objj_msgSend(_80,"decodeObjectForKey:",_7b);
_horizontalScroller=objj_msgSend(_80,"decodeObjectForKey:",_7c);
_hasVerticalScroller=objj_msgSend(_80,"decodeBoolForKey:",_79);
_hasHorizontalScroller=objj_msgSend(_80,"decodeBoolForKey:",_7a);
_autohidesScrollers=objj_msgSend(_80,"decodeBoolForKey:",_7d);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("reflectScrolledClipView:"),_7e,_contentView,0,[CPDefaultRunLoopMode]);
}
return _7e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_81,_82,_83){
with(_81){
objj_msgSendSuper({receiver:_81,super_class:objj_getClass("CPView")},"encodeWithCoder:",_83);
objj_msgSend(_83,"encodeObject:forKey:",_contentView,_74);
objj_msgSend(_83,"encodeObject:forKey:",_verticalScroller,_7b);
objj_msgSend(_83,"encodeObject:forKey:",_horizontalScroller,_7c);
objj_msgSend(_83,"encodeFloat:forKey:",_verticalLineScroll,_75);
objj_msgSend(_83,"encodeFloat:forKey:",_verticalPageScroll,_77);
objj_msgSend(_83,"encodeFloat:forKey:",_horizontalLineScroll,_76);
objj_msgSend(_83,"encodeFloat:forKey:",_horizontalPageScroll,_78);
objj_msgSend(_83,"encodeBool:forKey:",_hasVerticalScroller,_79);
objj_msgSend(_83,"encodeBool:forKey:",_hasHorizontalScroller,_7a);
objj_msgSend(_83,"encodeBool:forKey:",_autohidesScrollers,_7d);
}
})]);
