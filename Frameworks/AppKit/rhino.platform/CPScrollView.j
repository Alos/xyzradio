i;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;16811;
var _1=objj_allocateClassPair(CPView,"CPScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_headerClipView"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll")]);
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
_headerClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"init");
objj_msgSend(_3,"addSubview:",_headerClipView);
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
_contentView=_c;
objj_msgSend(_contentView,"setDocumentView:",_d);
objj_msgSend(_a,"addSubview:",_contentView);
objj_msgSend(_a,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_e,_f){
with(_e){
return _contentView;
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_contentView,"setDocumentView:",_12);
objj_msgSend(_headerClipView,"setDocumentView:",objj_msgSend(_10,"_headerView"));
var _13=objj_msgSend(_10,"_cornerView");
if(_13){
objj_msgSend(_10,"addSubview:",_13);
}
objj_msgSend(_10,"reflectScrolledClipView:",_contentView);
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
objj_msgSend(_headerClipView,"setFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
--_recursionCount;
return;
}
var _18=objj_msgSend(_17,"frame"),_19=objj_msgSend(_14,"bounds"),_1a=objj_msgSend(_14,"headerClipViewFrame"),_1b=(_1a.size.height);
_19.origin.y+=_1b;
_19.size.height-=_1b;
var _1c={width:(_18.size.width)-(_19.size.width),height:(_18.size.height)-(_19.size.height)},_1d=(objj_msgSend(_verticalScroller,"frame").size.width),_1e=(objj_msgSend(_horizontalScroller,"frame").size.height),_1f=_1c.height>0,_20=_1c.width>0,_21=_hasVerticalScroller&&(!_autohidesScrollers||_1f),_22=_hasHorizontalScroller&&(!_autohidesScrollers||_20);
if(_21){
_1c.width+=_1d;
_20=_1c.width>0;
_22=_hasHorizontalScroller&&(!_autohidesScrollers||_20);
}
if(_22){
_1c.height+=_1e;
_1f=_1c.height>0;
_21=_hasVerticalScroller&&(!_autohidesScrollers||_1f);
}
objj_msgSend(_verticalScroller,"setHidden:",!_21);
objj_msgSend(_verticalScroller,"setEnabled:",_1f);
objj_msgSend(_horizontalScroller,"setHidden:",!_22);
objj_msgSend(_horizontalScroller,"setEnabled:",_20);
if(_21){
_19.size.width-=_1d;
}
if(_22){
_19.size.height-=_1e;
}
var _23=objj_msgSend(_contentView,"bounds").origin,_24=!objj_msgSend(_verticalScroller,"isHidden"),_25=!objj_msgSend(_horizontalScroller,"isHidden");
if(_21){
var _26=MAX((objj_msgSend(_14,"cornerViewFrame").size.height),_1b),_27=(objj_msgSend(_14,"bounds").size.height)-_26;
if(_22){
_27-=_1e;
}
objj_msgSend(_verticalScroller,"setFloatValue:",(_1c.height<=0)?0:_23.y/_1c.height);
objj_msgSend(_verticalScroller,"setKnobProportion:",(_19.size.height)/(_18.size.height));
objj_msgSend(_verticalScroller,"setFrame:",{origin:{x:(_19.origin.x+_19.size.width),y:_26},size:{width:_1d,height:_27}});
}else{
if(_24){
objj_msgSend(_verticalScroller,"setFloatValue:",0);
objj_msgSend(_verticalScroller,"setKnobProportion:",1);
}
}
if(_22){
objj_msgSend(_horizontalScroller,"setFloatValue:",(_1c.width<=0)?0:_23.x/_1c.width);
objj_msgSend(_horizontalScroller,"setKnobProportion:",(_19.size.width)/(_18.size.width));
objj_msgSend(_horizontalScroller,"setFrame:",{origin:{x:0,y:(_19.origin.y+_19.size.height)},size:{width:(_19.size.width),height:_1e}});
}else{
if(_25){
objj_msgSend(_horizontalScroller,"setFloatValue:",0);
objj_msgSend(_horizontalScroller,"setKnobProportion:",1);
}
}
objj_msgSend(_contentView,"setFrame:",_19);
objj_msgSend(_headerClipView,"setFrame:",_1a);
objj_msgSend(objj_msgSend(_14,"_cornerView"),"setFrame:",objj_msgSend(_14,"cornerViewFrame"));
--_recursionCount;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_28,_29,_2a){
with(_28){
if(_horizontalScroller===_2a){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_2a;
objj_msgSend(_horizontalScroller,"setTarget:",_28);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_28,"addSubview:",_horizontalScroller);
objj_msgSend(_28,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_2b,_2c){
with(_2b){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_2d,_2e,_2f){
with(_2d){
if(_hasHorizontalScroller===_2f){
return;
}
_hasHorizontalScroller=_2f;
if(_hasHorizontalScroller&&!_horizontalScroller){
objj_msgSend(_2d,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CGRectMake(0,0,(objj_msgSend(_2d,"bounds").size.width),objj_msgSend(CPScroller,"scrollerWidth"))));
}else{
if(!_hasHorizontalScroller&&_horizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",YES);
objj_msgSend(_2d,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_30,_31){
with(_30){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_32,_33,_34){
with(_32){
if(_verticalScroller===_34){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_34;
objj_msgSend(_verticalScroller,"setTarget:",_32);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_32,"addSubview:",_verticalScroller);
objj_msgSend(_32,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_35,_36){
with(_35){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_37,_38,_39){
with(_37){
if(_hasVerticalScroller===_39){
return;
}
_hasVerticalScroller=_39;
if(_hasVerticalScroller&&!_verticalScroller){
objj_msgSend(_37,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:objj_msgSend(CPScroller,"scrollerWidth"),height:(objj_msgSend(_37,"bounds").size.height)}}));
}else{
if(!_hasVerticalScroller&&_verticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_37,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasVerticalScroller"),function(_3a,_3b){
with(_3a){
return _hasVerticalScroller;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_3c,_3d,_3e){
with(_3c){
if(_autohidesScrollers==_3e){
return;
}
_autohidesScrollers=_3e;
objj_msgSend(_3c,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_3f,_40){
with(_3f){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("_headerView"),function(_41,_42){
with(_41){
var _43=objj_msgSend(_41,"documentView");
if(objj_msgSend(_43,"respondsToSelector:",sel_getUid("headerView"))){
return objj_msgSend(_43,"headerView");
}
return nil;
}
}),new objj_method(sel_getUid("_cornerView"),function(_44,_45){
with(_44){
var _46=objj_msgSend(_44,"documentView");
if(objj_msgSend(_46,"respondsToSelector:",sel_getUid("cornerView"))){
return objj_msgSend(_46,"cornerView");
}
}
}),new objj_method(sel_getUid("cornerViewFrame"),function(_47,_48){
with(_47){
var _49=objj_msgSend(_47,"_cornerView"),_4a=objj_msgSend(_49,"bounds"),_4b=objj_msgSend(_47,"bounds");
if(!_49){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
_4a.origin.x=CGRectGetMaxX(_4b)-CGRectGetWidth(_4a);
_4a.origin.y=0;
return _4a;
}
}),new objj_method(sel_getUid("headerClipViewFrame"),function(_4c,_4d){
with(_4c){
var _4e=objj_msgSend(_4c,"_headerView"),_4f=objj_msgSend(_4c,"_cornerView"),_50=objj_msgSend(_4c,"bounds");
if(!_4e){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
_50.size.height=objj_msgSend(_4e,"bounds").size.height;
if(_4f){
_50.size.width-=CGRectGetWidth(objj_msgSend(_4f,"bounds"));
}
return _50;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_53,"floatValue"),_55=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame");
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
contentBounds.origin.y=_54*((_55.size.height)-(contentBounds.size.height));
}
objj_msgSend(_contentView,"scrollToPoint:",contentBounds.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_58,"floatValue"),_5a=objj_msgSend(objj_msgSend(_56,"documentView"),"frame"),_5b=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_5b.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_5b.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_5b.origin.x-=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_5b.origin.x+=(_5b.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_5b.origin.x=_59*((_5a.size.width)-(_5b.size.width));
}
objj_msgSend(_contentView,"scrollToPoint:",_5b.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_5b.origin.x,0));
}
}),new objj_method(sel_getUid("tile"),function(_5c,_5d){
with(_5c){
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_5e,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_61,_62,_63){
with(_61){
objj_msgSend(_61,"setHorizonalLineScroll:",_63);
objj_msgSend(_61,"setVerticalLineScroll:",_63);
}
}),new objj_method(sel_getUid("lineScroll"),function(_64,_65){
with(_64){
return objj_msgSend(_64,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_66,_67,_68){
with(_66){
_horizontalLineScroll=_68;
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_69,_6a){
with(_69){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_6b,_6c,_6d){
with(_6b){
_verticalLineScroll=_6d;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_6e,_6f){
with(_6e){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_70,_71,_72){
with(_70){
objj_msgSend(_70,"setHorizontalPageScroll:",_72);
objj_msgSend(_70,"setVerticalPageScroll:",_72);
}
}),new objj_method(sel_getUid("pageScroll"),function(_73,_74){
with(_73){
return objj_msgSend(_73,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_75,_76,_77){
with(_75){
_horizontalPageScroll=_77;
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_78,_79){
with(_78){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_7a,_7b,_7c){
with(_7a){
_verticalPageScroll=_7c;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_7d,_7e){
with(_7d){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_7f,"documentView"),"frame"),_83=objj_msgSend(_contentView,"bounds");
_83.origin.x+=objj_msgSend(_81,"deltaX")*_horizontalLineScroll;
_83.origin.y+=objj_msgSend(_81,"deltaY")*_verticalLineScroll;
objj_msgSend(_contentView,"scrollToPoint:",_83.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_83.origin.x,0));
}
}),new objj_method(sel_getUid("keyDown:"),function(_84,_85,_86){
with(_84){
var _87=objj_msgSend(_86,"keyCode"),_88=objj_msgSend(objj_msgSend(_84,"documentView"),"frame"),_89=objj_msgSend(_contentView,"bounds");
switch(_87){
case 33:
_89.origin.y-=(_89.size.height)-_verticalPageScroll;
break;
case 34:
_89.origin.y+=(_89.size.height)-_verticalPageScroll;
break;
case 38:
_89.origin.y-=_verticalLineScroll;
break;
case 40:
_89.origin.y+=_verticalLineScroll;
break;
case 37:
_89.origin.x-=_horizontalLineScroll;
break;
case 49:
_89.origin.x+=_horizontalLineScroll;
break;
default:
return objj_msgSendSuper({receiver:_84,super_class:objj_getClass("CPView")},"keyDown:",_86);
}
objj_msgSend(_contentView,"scrollToPoint:",_89.origin);
objj_msgSend(_headerClipView,"scrollToPoint:",CGPointMake(_89.origin,0));
}
})]);
var _8a="CPScrollViewContentView",_8b="CPScrollViewVLineScroll",_8c="CPScrollViewHLineScroll",_8d="CPScrollViewVPageScroll",_8e="CPScrollViewHPageScroll",_8f="CPScrollViewHasVScroller",_90="CPScrollViewHasHScroller",_91="CPScrollViewVScroller",_92="CPScrollViewHScroller",_93="CPScrollViewAutohidesScroller";
var _1=objj_getClass("CPScrollView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScrollView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_94,_95,_96){
with(_94){
if(_94=objj_msgSendSuper({receiver:_94,super_class:objj_getClass("CPView")},"initWithCoder:",_96)){
_verticalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8b);
_verticalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8d);
_horizontalLineScroll=objj_msgSend(_96,"decodeFloatForKey:",_8c);
_horizontalPageScroll=objj_msgSend(_96,"decodeFloatForKey:",_8e);
_contentView=objj_msgSend(_96,"decodeObjectForKey:",_8a);
_verticalScroller=objj_msgSend(_96,"decodeObjectForKey:",_91);
_horizontalScroller=objj_msgSend(_96,"decodeObjectForKey:",_92);
_hasVerticalScroller=objj_msgSend(_96,"decodeBoolForKey:",_8f);
_hasHorizontalScroller=objj_msgSend(_96,"decodeBoolForKey:",_90);
_autohidesScrollers=objj_msgSend(_96,"decodeBoolForKey:",_93);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("reflectScrolledClipView:"),_94,_contentView,0,[CPDefaultRunLoopMode]);
}
return _94;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_97,_98,_99){
with(_97){
objj_msgSendSuper({receiver:_97,super_class:objj_getClass("CPView")},"encodeWithCoder:",_99);
objj_msgSend(_99,"encodeObject:forKey:",_contentView,_8a);
objj_msgSend(_99,"encodeObject:forKey:",_verticalScroller,_91);
objj_msgSend(_99,"encodeObject:forKey:",_horizontalScroller,_92);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalLineScroll,_8b);
objj_msgSend(_99,"encodeFloat:forKey:",_verticalPageScroll,_8d);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalLineScroll,_8c);
objj_msgSend(_99,"encodeFloat:forKey:",_horizontalPageScroll,_8e);
objj_msgSend(_99,"encodeBool:forKey:",_hasVerticalScroller,_8f);
objj_msgSend(_99,"encodeBool:forKey:",_hasHorizontalScroller,_90);
objj_msgSend(_99,"encodeBool:forKey:",_autohidesScrollers,_93);
}
})]);
