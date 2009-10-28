I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;49204;
CPMenuDidAddItemNotification="CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification="CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification="CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification="CPMenuDidEndTrackingNotification";
var _1=19;
var _2=NO,_3="",_4=nil,_5=1,_6=nil,_7=nil;
var _8=objj_allocateClassPair(CPObject,"CPMenu"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_supermenu"),new objj_ivar("_title"),new objj_ivar("_name"),new objj_ivar("_items"),new objj_ivar("_attachedMenu"),new objj_ivar("_autoenablesItems"),new objj_ivar("_showsStateColumn"),new objj_ivar("_delegate"),new objj_ivar("_highlightedIndex"),new objj_ivar("_menuWindow")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("menuBarHeight"),function(_a,_b){
with(_a){
if(_a==objj_msgSend(CPApp,"mainMenu")){
return _1;
}
return 0;
}
}),new objj_method(sel_getUid("initWithTitle:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_title=_e;
_items=[];
_autoenablesItems=YES;
_showsStateColumn=YES;
}
return _c;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithTitle:","");
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_11,_12,_13,_14){
with(_11){
var _15=objj_msgSend(_13,"menu");
if(_15){
if(_15!==_11){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Attempted to insert item into menu that was already in another menu.");
}else{
return;
}
}
objj_msgSend(_13,"setMenu:",_11);
objj_msgSend(_items,"insertObject:atIndex:",_13,_14);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidAddItemNotification,_11,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_14,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"),function(_16,_17,_18,_19,_1a,_1b){
with(_16){
var _1c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_18,_19,_1a);
objj_msgSend(_16,"insertItem:atIndex:",_1c,_1b);
return _1c;
}
}),new objj_method(sel_getUid("addItem:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1d,"insertItem:atIndex:",_1f,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"),function(_20,_21,_22,_23,_24){
with(_20){
return objj_msgSend(_20,"insertItemWithTitle:action:keyEquivalent:atIndex:",_22,_23,_24,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("removeItem:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_27));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_28,_29,_2a){
with(_28){
if(_2a<0||_2a>=_items.length){
return;
}
objj_msgSend(_items[_2a],"setMenu:",nil);
objj_msgSend(_items,"removeObjectAtIndex:",_2a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidRemoveItemNotification,_28,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_2a,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemChanged:"),function(_2b,_2c,_2d){
with(_2b){
if(objj_msgSend(_2d,"menu")!=_2b){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidChangeItemNotification,_2b,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2d),"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemWithTag:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"indexOfItemWithTag:",_30);
if(_31==CPNotFound){
return nil;
}
return _items[_31];
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(_32,"indexOfItemWithTitle:",_34);
if(_35==CPNotFound){
return nil;
}
return _items[_35];
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_36,_37,_38){
with(_36){
return objj_msgSend(_items,"objectAtIndex:",_38);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_39,_3a){
with(_39){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("itemArray"),function(_3b,_3c){
with(_3b){
return _items;
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_3f,"menu")!=_3d){
return CPNotFound;
}
return objj_msgSend(_items,"indexOfObjectIdenticalTo:",_3f);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_40,_41,_42){
with(_40){
var _43=0,_44=_items.length;
for(;_43<_44;++_43){
if(objj_msgSend(_items[_43],"title")===_42){
return _43;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_45,_46,_47){
with(_45){
var _48=0,_49=_items.length;
for(;_48<_49;++_48){
if(objj_msgSend(_items[_48],"tag")==_47){
return _48;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var _4e=0,_4f=_items.length;
for(;_4e<_4f;++_4e){
var _50=_items[_4e];
if(objj_msgSend(_50,"target")==_4c&&(!_4d||objj_msgSend(_50,"action")==_4d)){
return _4e;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_51,_52,_53){
with(_51){
var _54=0,_55=_items.length;
for(;_54<_55;++_54){
if(objj_msgSend(objj_msgSend(_items[_54],"representedObject"),"isEqual:",_53)){
return _54;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithSubmenu:"),function(_56,_57,_58){
with(_56){
var _59=0,_5a=_items.length;
for(;_59<_5a;++_59){
if(objj_msgSend(_items[_59],"submenu")==_58){
return _59;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setSubmenu:forItem:"),function(_5b,_5c,_5d,_5e){
with(_5b){
objj_msgSend(_5e,"setTarget:",_5e);
objj_msgSend(_5e,"setAction:",sel_getUid("submenuAction:"));
objj_msgSend(_5e,"setSubmenu:",_5d);
}
}),new objj_method(sel_getUid("submenuAction:"),function(_5f,_60,_61){
with(_5f){
}
}),new objj_method(sel_getUid("attachedMenu"),function(_62,_63){
with(_62){
return _attachedMenu;
}
}),new objj_method(sel_getUid("isAttached"),function(_64,_65){
with(_64){
return _isAttached;
}
}),new objj_method(sel_getUid("locationOfSubmenu:"),function(_66,_67,_68){
with(_66){
}
}),new objj_method(sel_getUid("supermenu"),function(_69,_6a){
with(_69){
return _supermenu;
}
}),new objj_method(sel_getUid("setSupermenu:"),function(_6b,_6c,_6d){
with(_6b){
_supermenu=_6d;
}
}),new objj_method(sel_getUid("isTornOff"),function(_6e,_6f){
with(_6e){
return !_supermenu||_6e==objj_msgSend(CPApp,"mainMenu");
}
}),new objj_method(sel_getUid("setAutoenablesItems:"),function(_70,_71,_72){
with(_70){
_autoenablesItems=_72;
}
}),new objj_method(sel_getUid("autoenablesItems"),function(_73,_74){
with(_73){
return _autoenablesItems;
}
}),new objj_method(sel_getUid("update"),function(_75,_76){
with(_75){
}
}),new objj_method(sel_getUid("setTitle:"),function(_77,_78,_79){
with(_77){
_title=_79;
}
}),new objj_method(sel_getUid("title"),function(_7a,_7b){
with(_7a){
return _title;
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_7c,_7d,_7e){
with(_7c){
_showsStateColumn=_7e;
}
}),new objj_method(sel_getUid("showsStateColumn"),function(_7f,_80){
with(_7f){
return _showsStateColumn;
}
}),new objj_method(sel_getUid("highlightedItem"),function(_81,_82){
with(_81){
return _highlightedIndex>=0?_items[_highlightedIndex]:nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_83,_84,_85){
with(_83){
_delegate=_85;
}
}),new objj_method(sel_getUid("delegate"),function(_86,_87){
with(_86){
return _delegate;
}
}),new objj_method(sel_getUid("cancelTracking"),function(_88,_89){
with(_88){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_fireCancelTrackingEvent"),_88,nil,0,[CPDefaultRunLoopMode]);
}
}),new objj_method(sel_getUid("_fireCancelTrackingEvent"),function(_8a,_8b){
with(_8a){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPAppKitDefined,{x:0,y:0},0,0,0,0,0,0,0));
}
}),new objj_method(sel_getUid("_setMenuWindow:"),function(_8c,_8d,_8e){
with(_8c){
_menuWindow=_8e;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_8f,_90,_91){
with(_8f){
if(_autoenablesItems){
objj_msgSend(_8f,"update");
}
var _92=0,_93=_items.length,_94=objj_msgSend(_91,"charactersIgnoringModifiers"),_95=objj_msgSend(_91,"modifierFlags");
for(;_92<_93;++_92){
var _96=_items[_92],_97=objj_msgSend(_96,"keyEquivalentModifierMask");
if((_95&(CPShiftKeyMask|CPAlternateKeyMask|CPCommandKeyMask|CPControlKeyMask))==_97&&objj_msgSend(_94,"caseInsensitiveCompare:",objj_msgSend(_96,"keyEquivalent"))==CPOrderedSame){
if(objj_msgSend(_96,"isEnabled")){
objj_msgSend(_8f,"performActionForItemAtIndex:",_92);
}else{
}
return YES;
}
if(objj_msgSend(objj_msgSend(_96,"submenu"),"performKeyEquivalent:",_91)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("performActionForItemAtIndex:"),function(_98,_99,_9a){
with(_98){
var _9b=_items[_9a];
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9b,"action"),objj_msgSend(_9b,"target"),_9b);
}
}),new objj_method(sel_getUid("_itemIsHighlighted:"),function(_9c,_9d,_9e){
with(_9c){
return _items[_highlightedIndex]==_9e;
}
}),new objj_method(sel_getUid("_highlightItemAtIndex:"),function(_9f,_a0,_a1){
with(_9f){
var _a2=_highlightedIndex;
_highlightedIndex=_a1;
if(_a2!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_a2],"_menuItemView"),"highlight:",NO);
}
if(_highlightedIndex!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",YES);
}
}
}),new objj_method(sel_getUid("_setMenuName:"),function(_a3,_a4,_a5){
with(_a3){
if(_name===_a5){
return;
}
_name=_a5;
if(_name==="CPMainMenu"){
objj_msgSend(CPApp,"setMainMenu:",_a3);
}
}
}),new objj_method(sel_getUid("_menuName"),function(_a6,_a7){
with(_a6){
return _name;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_a8,_a9){
with(_a8){
if(_name==="_CPMainMenu"){
objj_msgSend(_a8,"_setMenuName:","CPMainMenu");
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_aa,_ab){
with(_aa){
objj_msgSend(objj_msgSend(_aa,"class"),"setMenuBarAttributes:",objj_msgSend(CPDictionary,"dictionary"));
}
}),new objj_method(sel_getUid("menuBarVisible"),function(_ac,_ad){
with(_ac){
return _2;
}
}),new objj_method(sel_getUid("setMenuBarVisible:"),function(_ae,_af,_b0){
with(_ae){
if(_2==_b0){
return;
}
_2=_b0;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
return;
}
if(_b0){
if(!_7){
_7=objj_msgSend(objj_msgSend(_CPMenuBarWindow,"alloc"),"init");
}
objj_msgSend(_7,"setMenu:",objj_msgSend(CPApp,"mainMenu"));
objj_msgSend(_7,"setTitle:",_3);
objj_msgSend(_7,"setIconImage:",_4);
objj_msgSend(_7,"setIconImageAlphaValue:",_5);
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
objj_msgSend(_7,"orderFront:",_ae);
}else{
objj_msgSend(_7,"orderOut:",_ae);
}
}
}),new objj_method(sel_getUid("setMenuBarTitle:"),function(_b1,_b2,_b3){
with(_b1){
_3=_b3;
objj_msgSend(_7,"setTitle:",_3);
}
}),new objj_method(sel_getUid("menuBarTitle"),function(_b4,_b5){
with(_b4){
return _3;
}
}),new objj_method(sel_getUid("setMenuBarIconImage:"),function(_b6,_b7,_b8){
with(_b6){
_CPMenuBarImage=_b8;
objj_msgSend(_7,"setIconImage:",_b8);
}
}),new objj_method(sel_getUid("menuBarIconImage"),function(_b9,_ba){
with(_b9){
return _CPMenuBarImage;
}
}),new objj_method(sel_getUid("setMenuBarAttributes:"),function(_bb,_bc,_bd){
with(_bb){
if(_6==_bd){
return;
}
_6=objj_msgSend(_bd,"copy");
var _be=objj_msgSend(_bd,"objectForKey:","CPMenuBarTextColor"),_bf=objj_msgSend(_bd,"objectForKey:","CPMenuBarTitleColor"),_c0=objj_msgSend(_bd,"objectForKey:","CPMenuBarTextShadowColor"),_c1=objj_msgSend(_bd,"objectForKey:","CPMenuBarTitleShadowColor"),_c2=objj_msgSend(_bd,"objectForKey:","CPMenuBarHighlightColor"),_c3=objj_msgSend(_bd,"objectForKey:","CPMenuBarHighlightTextColor"),_c4=objj_msgSend(_bd,"objectForKey:","CPMenuBarHighlightTextShadowColor");
if(!_be&&_bf){
objj_msgSend(_6,"setObject:forKey:",_bf,"CPMenuBarTextColor");
}else{
if(_be&&!_bf){
objj_msgSend(_6,"setObject:forKey:",_be,"CPMenuBarTitleColor");
}else{
if(!_be&&!_bf){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTextColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTitleColor");
}
}
}
if(!_c0&&_c1){
objj_msgSend(_6,"setObject:forKey:",_c1,"CPMenuBarTextShadowColor");
}else{
if(_c0&&!_c1){
objj_msgSend(_6,"setObject:forKey:",_c0,"CPMenuBarTitleShadowColor");
}else{
if(!_c0&&!_c1){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTextShadowColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTitleShadowColor");
}
}
}
if(!_c2){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",94/255,130/255,186/255,1),"CPMenuBarHighlightColor");
}
if(!_c3){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarHighlightTextColor");
}
if(!_c4){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"blackColor"),"CPMenuBarHighlightTextShadowColor");
}
if(_7){
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"setTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextShadowColor"));
objj_msgSend(_7,"setTitleShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleShadowColor"));
objj_msgSend(_7,"setHighlightColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightColor"));
objj_msgSend(_7,"setHighlightTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextColor"));
objj_msgSend(_7,"setHighlightTextShadowColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarHighlightTextShadowColor"));
}
}
}),new objj_method(sel_getUid("menuBarAttributes"),function(_c5,_c6){
with(_c5){
return _6;
}
}),new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"),function(_c7,_c8,_c9){
with(_c7){
_5=_c9;
objj_msgSend(_7,"setIconImageAlphaValue:",_c9);
}
}),new objj_method(sel_getUid("menuBarHeight"),function(_ca,_cb){
with(_ca){
return _1;
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"),function(_cc,_cd,_ce,_cf,_d0){
with(_cc){
objj_msgSend(_cc,"popUpContextMenu:withEvent:forView:withFont:",_ce,_cf,_d0,nil);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"),function(_d1,_d2,_d3,_d4,_d5,_d6){
with(_d1){
objj_msgSend(_d1,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_d3,_d4,_d5,_d6,NO);
}
}),new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"),function(_d7,_d8,_d9,_da,_db,_dc,_dd){
with(_d7){
var _de=objj_msgSend(_d9,"delegate");
if(objj_msgSend(_de,"respondsToSelector:",sel_getUid("menuWillOpen:"))){
objj_msgSend(_de,"menuWillOpen:",_d9);
}
if(!_dc){
_dc=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
var _df=objj_msgSend(_db,"window"),_e0=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_d9,_dc);
objj_msgSend(_e0,"setDelegate:",_d7);
objj_msgSend(_e0,"setBackgroundStyle:",_dd?_CPMenuWindowMenuBarBackgroundStyle:_CPMenuWindowPopUpBackgroundStyle);
objj_msgSend(_e0,"setFrameOrigin:",objj_msgSend(objj_msgSend(_da,"window"),"convertBaseToGlobal:",objj_msgSend(_da,"locationInWindow")));
objj_msgSend(_e0,"orderFront:",_d7);
objj_msgSend(_e0,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_da,_d7,sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"),function(_e1,_e2,_e3,_e4){
with(_e1){
var _e5=objj_msgSend(_e3,"menu");
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_e3);
if(objj_msgSend(_e4,"isEnabled")){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_e4,"action"),objj_msgSend(_e4,"target"),_e4);
}
}
})]);
var _e6="CPMenuTitleKey",_e7="CPMenuNameKey",_e8="CPMenuItemsKey",_e9="CPMenuShowsStateColumnKey";
var _8=objj_getClass("CPMenu");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenu\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_ea,_eb,_ec){
with(_ea){
_ea=objj_msgSendSuper({receiver:_ea,super_class:objj_getClass("CPObject")},"init");
if(_ea){
_title=objj_msgSend(_ec,"decodeObjectForKey:",_e6);
_items=objj_msgSend(_ec,"decodeObjectForKey:",_e8);
objj_msgSend(_ea,"_setMenuName:",objj_msgSend(_ec,"decodeObjectForKey:",_e7));
_showsStateColumn=!objj_msgSend(_ec,"containsValueForKey:",_e9)||objj_msgSend(_ec,"decodeBoolForKey:",_e9);
}
return _ea;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ed,_ee,_ef){
with(_ed){
objj_msgSend(_ef,"encodeObject:forKey:",_title,_e6);
if(_name){
objj_msgSend(_ef,"encodeObject:forKey:",_name,_e7);
}
objj_msgSend(_ef,"encodeObject:forKey:",_items,_e8);
if(!_showsStateColumn){
objj_msgSend(_ef,"encodeBool:forKey:",_showsStateColumn,_e9);
}
}
})]);
var _f0=[],_f1=5,_f2=[],_f3=-1,_f4=1,_f5=0;
_CPMenuWindowMenuBarBackgroundStyle=0;
_CPMenuWindowPopUpBackgroundStyle=1;
_CPMenuWindowAttachedMenuBackgroundStyle=2;
var _f6=500,_f7=5,_f8=1,_f9=1,_fa=5,_fb=16;
var _8=objj_allocateClassPair(CPWindow,"_CPMenuWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuView"),new objj_ivar("_menuClipView"),new objj_ivar("_lastMouseOverMenuView"),new objj_ivar("_moreAboveView"),new objj_ivar("_moreBelowView"),new objj_ivar("_sessionDelegate"),new objj_ivar("_didEndSelector"),new objj_ivar("_startTime"),new objj_ivar("_scrollingState"),new objj_ivar("_lastGlobalLocation"),new objj_ivar("_isShowingTopScrollIndicator"),new objj_ivar("_isShowingBottomScrollIndicator"),new objj_ivar("_trackingCanceled"),new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_fc,_fd){
with(_fc){
_fc=objj_msgSendSuper({receiver:_fc,super_class:objj_getClass("CPWindow")},"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessWindowMask);
if(_fc){
objj_msgSend(_fc,"setLevel:",CPPopUpMenuWindowLevel);
objj_msgSend(_fc,"setHasShadow:",YES);
objj_msgSend(_fc,"setShadowStyle:",CPMenuWindowShadowStyle);
objj_msgSend(_fc,"setAcceptsMouseMovedEvents:",YES);
_unconstrainedFrame=CGRectMakeZero();
var _fe=objj_msgSend(_fc,"contentView");
_menuView=objj_msgSend(objj_msgSend(_CPMenuView,"alloc"),"initWithFrame:",CGRectMakeZero());
_menuClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",CGRectMake(_f8,_f7,0,0));
objj_msgSend(_menuClipView,"setDocumentView:",_menuView);
objj_msgSend(_fe,"addSubview:",_menuClipView);
_moreAboveView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreAboveView,"setImage:",_CPMenuWindowMoreAboveImage);
objj_msgSend(_moreAboveView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreAboveImage,"size"));
objj_msgSend(_fe,"addSubview:",_moreAboveView);
_moreBelowView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreBelowView,"setImage:",_CPMenuWindowMoreBelowImage);
objj_msgSend(_moreBelowView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreBelowImage,"size"));
objj_msgSend(_fe,"addSubview:",_moreBelowView);
objj_msgSend(_fc,"setShadowStyle:",CPWindowShadowStyleMenu);
}
return _fc;
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(_ff,_cmd){
with(_ff){
return _f8;
}
}),new objj_method(sel_getUid("setFont:"),function(self,_cmd,_103){
with(self){
objj_msgSend(_menuView,"setFont:",_103);
}
}),new objj_method(sel_getUid("setBackgroundStyle:"),function(self,_cmd,_106){
with(self){
var _107=_f2[_106];
if(!_107){
var _108=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(self,"class"));
if(_106==_CPMenuWindowPopUpBackgroundStyle){
_107=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}else{
if(_106==_CPMenuWindowMenuBarBackgroundStyle){
_107=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_108,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}
}
_f2[_106]=_107;
}
objj_msgSend(self,"setBackgroundColor:",_107);
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_10b){
with(self){
objj_msgSend(_10b,"_setMenuWindow:",self);
objj_msgSend(_menuView,"setMenu:",_10b);
var _10c=objj_msgSend(_menuView,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(_f8+_10c.width+_f9,_f7+_10c.height+_fa));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,0));
objj_msgSend(_menuClipView,"setFrame:",CGRectMake(_f8,_f7,_10c.width,_10c.height));
}
}),new objj_method(sel_getUid("setMinWidth:"),function(self,_cmd,_10f){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(MAX(size.width,_10f),size.height));
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_113){
with(self){
return objj_msgSend(_menuView,"convertRect:toView:",objj_msgSend(_menuView,"rectForItemAtIndex:",_113),nil);
}
}),new objj_method(sel_getUid("orderFront:"),function(self,_cmd,_116){
with(self){
objj_msgSend(self,"constrainToScreen");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"orderFront:",_116);
}
}),new objj_method(sel_getUid("constrainToScreen"),function(self,_cmd){
with(self){
_unconstrainedFrame=CGRectMakeCopy(objj_msgSend(self,"frame"));
var _119=objj_msgSend(CPPlatform,"isBrowser"),_11a=CGRectInset(_119?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5),_11b=CGRectIntersection(_unconstrainedFrame,_11a);
_11b.origin.x=CGRectGetMinX(_unconstrainedFrame);
_11b.size.width=CGRectGetWidth(_unconstrainedFrame);
if(CGRectGetWidth(_11b)>CGRectGetWidth(_11a)){
_11b.size.width=CGRectGetWidth(_11a);
}
if(CGRectGetMaxX(_11b)>CGRectGetMaxX(_11a)){
_11b.origin.x-=CGRectGetMaxX(_11b)-CGRectGetMaxX(_11a);
}
if(CGRectGetMinX(_11b)<CGRectGetMinX(_11a)){
_11b.origin.x=CGRectGetMinX(_11a);
}
var _11c=objj_msgSend(self,"convertBaseToGlobal:",CGPointMake(_f8,_f7));
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"setFrame:",_11b);
var _11d=_11c.y<CGRectGetMinY(_11b)+_f7,_11e=_11c.y+CGRectGetHeight(objj_msgSend(_menuView,"frame"))>CGRectGetMaxY(_11b)-_fa,_11f=_f7,_120=_fa,_121=objj_msgSend(self,"contentView"),_122=objj_msgSend(_121,"bounds");
if(_11d){
_11f+=_fb;
var _123=objj_msgSend(_moreAboveView,"frame");
objj_msgSend(_moreAboveView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_122)-CGRectGetWidth(_123))/2,(_f7+_fb-CGRectGetHeight(_123))/2));
}
objj_msgSend(_moreAboveView,"setHidden:",!_11d);
if(_11e){
_120+=_fb;
objj_msgSend(_moreBelowView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_122)-CGRectGetWidth(objj_msgSend(_moreBelowView,"frame")))/2,CGRectGetHeight(_122)-_fb-_fa));
}
objj_msgSend(_moreBelowView,"setHidden:",!_11e);
var _124=CGRectMake(_f8,_11f,CGRectGetWidth(_11b)-_f8-_f9,CGRectGetHeight(_11b)-_11f-_120);
objj_msgSend(_menuClipView,"setFrame:",_124);
objj_msgSend(_menuView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_124),CGRectGetHeight(objj_msgSend(_menuView,"frame"))));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,objj_msgSend(self,"convertBaseToGlobal:",_124.origin).y-_11c.y));
}
}),new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"),function(self,_cmd,_127,_128,_129){
with(self){
CPApp._activeMenu=objj_msgSend(_menuView,"menu");
_startTime=objj_msgSend(_127,"timestamp");
_scrollingState=_f5;
_trackingCanceled=NO;
_sessionDelegate=_128;
_didEndSelector=_129;
objj_msgSend(self,"trackEvent:",_127);
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_12c){
with(self){
var type=objj_msgSend(_12c,"type"),menu=objj_msgSend(_menuView,"menu");
if(type===CPAppKitDefined){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _12f=objj_msgSend(objj_msgSend(_menuView,"menu"),"highlightedItem");
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
objj_msgSend(self,"orderOut:",self);
var _130=objj_msgSend(menu,"delegate");
if(objj_msgSend(_130,"respondsToSelector:",sel_getUid("menuDidClose:"))){
objj_msgSend(_130,"menuDidClose:",menu);
}
if(_sessionDelegate&&_didEndSelector){
objj_msgSend(_sessionDelegate,_didEndSelector,self,_12f);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPMenuDidEndTrackingNotification,menu);
objj_msgSend(_menuView,"setMenu:",nil);
CPApp._activeMenu=nil;
return;
}
var _131=objj_msgSend(_12c,"window"),_132=_131?objj_msgSend(_131,"convertBaseToGlobal:",objj_msgSend(_12c,"locationInWindow")):objj_msgSend(_12c,"locationInWindow");
if(type===CPPeriodic){
var _133=CGRectInset(objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5);
if(_scrollingState==_f3){
if(CGRectGetMinY(_unconstrainedFrame)<CGRectGetMinY(_133)){
_unconstrainedFrame.origin.y+=10;
}
}else{
if(_scrollingState==_f4){
if(CGRectGetMaxY(_unconstrainedFrame)>CGRectGetHeight(_133)){
_unconstrainedFrame.origin.y-=10;
}
}
}
objj_msgSend(self,"setFrame:",_unconstrainedFrame);
objj_msgSend(self,"constrainToScreen");
_132=_lastGlobalLocation;
}
_lastGlobalLocation=_132;
var _134=objj_msgSend(self,"convertGlobalToBase:",_132),_135=objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",_134,nil)),_136=objj_msgSend(objj_msgSend(menu,"itemAtIndex:",_135),"view");
if(_136){
if(!_lastMouseOverMenuView){
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
}
if(_lastMouseOverMenuView!=_136){
objj_msgSend(_136,"mouseExited:",_12c);
objj_msgSend(_lastMouseOverMenuView,"mouseEntered:",_12c);
_lastMouseOverMenuView=_136;
}
objj_msgSend(self,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",type,_134,objj_msgSend(_12c,"modifierFlags"),objj_msgSend(_12c,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_12c,"clickCount"),objj_msgSend(_12c,"pressure")));
}else{
if(_lastMouseOverMenuView){
objj_msgSend(_lastMouseOverMenuView,"mouseExited:",_12c);
_lastMouseOverMenuView=nil;
}
objj_msgSend(menu,"_highlightItemAtIndex:",objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",objj_msgSend(self,"convertGlobalToBase:",_132),nil)));
if(type==CPMouseMoved||type==CPLeftMouseDragged||type==CPLeftMouseDown){
var _137=objj_msgSend(self,"frame"),_138=_scrollingState;
_scrollingState=_f5;
if(_132.y<CGRectGetMinY(_137)+_f7+_fb){
_scrollingState=_f3;
}else{
if(_132.y>CGRectGetMaxY(_137)-_fa-_fb){
_scrollingState=_f4;
}
}
if(_scrollingState!=_138){
if(_scrollingState==_f5){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}else{
if(_138==_f5){
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.04);
}
}
}
}else{
if(type==CPLeftMouseUp&&(objj_msgSend(_12c,"timestamp")-_startTime>_f6)){
objj_msgSend(menu,"cancelTracking");
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask|CPAppKitDefinedMask,nil,nil,YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("menuWindowWithMenu:font:"),function(self,_cmd,_13b,_13c){
with(self){
var _13d=nil;
if(_f0.length){
_13d=_f0.pop();
}else{
_13d=objj_msgSend(objj_msgSend(_CPMenuWindow,"alloc"),"init");
}
objj_msgSend(_13d,"setFont:",_13c);
objj_msgSend(_13d,"setMenu:",_13b);
return _13d;
}
}),new objj_method(sel_getUid("poolMenuWindow:"),function(self,_cmd,_140){
with(self){
if(!_140||_f0.length>=_f1){
return;
}
_f0.push(_140);
}
}),new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuWindow,"class")){
return;
}
var _143=objj_msgSend(CPBundle,"bundleForClass:",self);
_CPMenuWindowMoreAboveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_143,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreAbove.png"),CGSizeMake(38,18));
_CPMenuWindowMoreBelowImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_143,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreBelow.png"),CGSizeMake(38,18));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPMenuView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuItemViews"),new objj_ivar("_visibleMenuItemInfos"),new objj_ivar("_font")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("setFont:"),function(self,_cmd,_146){
with(self){
_font=_146;
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_149){
with(self){
return objj_msgSend(_menuItemViews[_149==CPNotFound?0:_149],"frame");
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(self,_cmd,_14c){
with(self){
var x=_14c.x,_14e=objj_msgSend(self,"bounds");
if(x<CGRectGetMinX(_14e)||x>CGRectGetMaxX(_14e)){
return CPNotFound;
}
var y=_14c.y,low=0,high=_visibleMenuItemInfos.length-1;
while(low<=high){
var _152=FLOOR(low+(high-low)/2),info=_visibleMenuItemInfos[_152];
frame=objj_msgSend(info.view,"frame");
if(y<CGRectGetMinY(frame)){
high=_152-1;
}else{
if(y>CGRectGetMaxY(frame)){
low=_152+1;
}else{
return info.index;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_156){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView")},"setMenu:",_156);
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
_menuItemViews=[];
_visibleMenuItemInfos=[];
var menu=objj_msgSend(self,"menu");
if(!menu){
return;
}
var _158=objj_msgSend(menu,"itemArray"),_159=0,_15a=objj_msgSend(_158,"count"),_15b=0,y=0,_15d=objj_msgSend(menu,"showsStateColumn");
for(;_159<_15a;++_159){
var item=_158[_159],view=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(view);
if(objj_msgSend(item,"isHidden")){
continue;
}
_visibleMenuItemInfos.push({view:view,index:_159});
objj_msgSend(view,"setFont:",_font);
objj_msgSend(view,"setShowsStateColumn:",_15d);
objj_msgSend(view,"synchronizeWithMenuItem");
objj_msgSend(view,"setFrameOrigin:",CGPointMake(0,y));
objj_msgSend(self,"addSubview:",view);
var size=objj_msgSend(view,"minSize"),_161=size.width;
if(_15b<_161){
_15b=_161;
}
y+=size.height;
}
for(_159=0;_159<_15a;++_159){
var view=_menuItemViews[_159];
objj_msgSend(view,"setFrameSize:",CGSizeMake(_15b,CGRectGetHeight(objj_msgSend(view,"frame"))));
}
objj_msgSend(self,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setFrameSize:",CGSizeMake(_15b,y));
objj_msgSend(self,"setAutoresizesSubviews:",YES);
}
})]);
var _1=29,_162=10,_163=10,_164=10;
var _165=nil,_166=nil;
var _8=objj_allocateClassPair(CPPanel,"_CPMenuBarWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menu"),new objj_ivar("_highlightView"),new objj_ivar("_menuItemViews"),new objj_ivar("_trackingMenuItem"),new objj_ivar("_iconImageView"),new objj_ivar("_titleField"),new objj_ivar("_textColor"),new objj_ivar("_titleColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_titleShadowColor"),new objj_ivar("_highlightColor"),new objj_ivar("_highlightTextColor"),new objj_ivar("_highlightTextShadowColor")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(self,_cmd){
with(self){
var _169=objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds");
_169.size.height=_1;
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",_169,CPBorderlessWindowMask);
if(self){
objj_msgSend(self,"setLevel:",-1);
objj_msgSend(self,"setAutoresizingMask:",CPWindowWidthSizable);
var _16a=objj_msgSend(self,"contentView");
objj_msgSend(_16a,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setBecomesKeyOnlyIfNeeded:",YES);
_iconImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_16a,"addSubview:",_iconImageView);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_16a,"addSubview:",_titleField);
}
return self;
}
}),new objj_method(sel_getUid("setTitle:"),function(self,_cmd,_16d){
with(self){
objj_msgSend(_titleField,"setStringValue:",_16d);
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImage:"),function(self,_cmd,_170){
with(self){
objj_msgSend(_iconImageView,"setImage:",_170);
objj_msgSend(_iconImageView,"setHidden:",_170==nil);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImageAlphaValue:"),function(self,_cmd,_173){
with(self){
objj_msgSend(_iconImageView,"setAlphaValue:",_173);
}
}),new objj_method(sel_getUid("setColor:"),function(self,_cmd,_176){
with(self){
if(!_176){
if(!_165){
_165=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuBarWindow,"class")),"pathForResource:","_CPMenuBarWindow/_CPMenuBarWindowBackground.png"),CGSizeMake(1,18)));
}
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_165);
}else{
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_176);
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(self,_cmd,_179){
with(self){
if(_textColor==_179){
return;
}
_textColor=_179;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextColor:"),_textColor);
}
}),new objj_method(sel_getUid("setTitleColor:"),function(self,_cmd,_17c){
with(self){
if(_titleColor==_17c){
return;
}
_titleColor=_17c;
objj_msgSend(_titleField,"setTextColor:",_17c?_17c:objj_msgSend(CPColor,"blackColor"));
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(self,_cmd,_17f){
with(self){
if(_textShadowColor==_17f){
return;
}
_textShadowColor=_17f;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextShadowColor:"),_textShadowColor);
}
}),new objj_method(sel_getUid("setTitleShadowColor:"),function(self,_cmd,_182){
with(self){
if(_titleShadowColor==_182){
return;
}
_titleShadowColor=_182;
objj_msgSend(_titleField,"setTextShadowColor:",_182?_182:objj_msgSend(CPColor,"whiteColor"));
}
}),new objj_method(sel_getUid("setHighlightColor:"),function(self,_cmd,_185){
with(self){
if(_highlightColor==_185){
return;
}
_highlightColor=_185;
}
}),new objj_method(sel_getUid("setHighlightTextColor:"),function(self,_cmd,_188){
with(self){
if(_highlightTextColor==_188){
return;
}
_highlightTextColor=_188;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateColor:"),_highlightTextColor);
}
}),new objj_method(sel_getUid("setHighlightTextShadowColor:"),function(self,_cmd,_18b){
with(self){
if(_highlightTextShadowColor==_18b){
return;
}
_highlightTextShadowColor=_18b;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateShadowColor:"),_highlightTextShadowColor);
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_18e){
with(self){
if(_menu==_18e){
return;
}
var _18f=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_18f,"removeObserver:name:object:",self,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_18f,"removeObserver:name:object:",self,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_18f,"removeObserver:name:object:",self,CPMenuDidRemoveItemNotification,_menu);
var _190=objj_msgSend(_menu,"itemArray"),_191=_190.length;
while(_191--){
objj_msgSend(objj_msgSend(_190[_191],"_menuItemView"),"removeFromSuperview");
}
}
_menu=_18e;
if(_menu){
objj_msgSend(_18f,"addObserver:selector:name:object:",self,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_18f,"addObserver:selector:name:object:",self,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_18f,"addObserver:selector:name:object:",self,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
_menuItemViews=[];
var _192=objj_msgSend(self,"contentView"),_190=objj_msgSend(_menu,"itemArray"),_191=_190.length;
for(index=0;index<_191;++index){
var item=_190[index],_194=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(_194);
objj_msgSend(_194,"setShowsStateColumn:",NO);
objj_msgSend(_194,"setBelongsToMenuBar:",YES);
objj_msgSend(_194,"setFont:",_166);
objj_msgSend(_194,"setTextColor:",_textColor);
objj_msgSend(_194,"setHidden:",objj_msgSend(item,"isHidden"));
objj_msgSend(_194,"synchronizeWithMenuItem");
objj_msgSend(_192,"addSubview:",_194);
}
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(self,_cmd,_197){
with(self){
var _198=objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(objj_msgSend(_197,"userInfo"),"objectForKey:","CPMenuItemIndex")),_199=objj_msgSend(_198,"_menuItemView");
objj_msgSend(_199,"setHidden:",objj_msgSend(_198,"isHidden"));
objj_msgSend(_199,"synchronizeWithMenuItem");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(self,_cmd,_19c){
with(self){
var _19d=objj_msgSend(objj_msgSend(_19c,"userInfo"),"objectForKey:","CPMenuItemIndex"),_19e=objj_msgSend(_menu,"itemAtIndex:",_19d),_19f=objj_msgSend(_19e,"_menuItemView");
objj_msgSend(_menuItemViews,"insertObject:atIndex:",_19f,_19d);
objj_msgSend(_19f,"setShowsStateColumn:",NO);
objj_msgSend(_19f,"setBelongsToMenuBar:",YES);
objj_msgSend(_19f,"setFont:",_166);
objj_msgSend(_19f,"setTextColor:",_textColor);
objj_msgSend(_19f,"setHidden:",objj_msgSend(_19e,"isHidden"));
objj_msgSend(_19f,"synchronizeWithMenuItem");
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:",_19f);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(self,_cmd,_1a2){
with(self){
var _1a3=objj_msgSend(objj_msgSend(_1a2,"userInfo"),"objectForKey:","CPMenuItemIndex"),_1a4=objj_msgSend(_menuItemViews,"objectAtIndex:",_1a3);
objj_msgSend(_menuItemViews,"removeObjectAtIndex:",_1a3);
objj_msgSend(_1a4,"removeFromSuperview");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("frameForMenuItem:"),function(self,_cmd,_1a7){
with(self){
var _1a8=objj_msgSend(objj_msgSend(_1a7,"_menuItemView"),"frame");
_1a8.origin.x-=5;
_1a8.origin.y=0;
_1a8.size.width+=10;
_1a8.size.height=_1;
return _1a8;
}
}),new objj_method(sel_getUid("menuItemAtPoint:"),function(self,_cmd,_1ab){
with(self){
var _1ac=objj_msgSend(_menu,"itemArray"),_1ad=_1ac.length;
while(_1ad--){
var item=_1ac[_1ad];
if(objj_msgSend(item,"isHidden")||objj_msgSend(item,"isSeparatorItem")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(self,"frameForMenuItem:",item),_1ab)){
return item;
}
}
return nil;
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_cmd,_1b1){
with(self){
_trackingMenuItem=objj_msgSend(self,"menuItemAtPoint:",objj_msgSend(_1b1,"locationInWindow"));
if(!objj_msgSend(_trackingMenuItem,"isEnabled")){
return;
}
if(objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"eventOnSubmenu:",_1b1)){
return objj_msgSend(self,"showMenu:",_1b1);
}
if(objj_msgSend(_trackingMenuItem,"isEnabled")){
objj_msgSend(self,"trackEvent:",_1b1);
}
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_1b4){
with(self){
var type=objj_msgSend(_1b4,"type");
if(type===CPPeriodic){
return objj_msgSend(self,"showMenu:",_1b4);
}
var _1b6=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_1b7=objj_msgSend(_trackingMenuItem,"_menuItemView"),_1b8=CGRectContainsPoint(_1b6,objj_msgSend(_1b4,"locationInWindow"));
if(type==CPLeftMouseDown){
if(objj_msgSend(_trackingMenuItem,"submenu")!=nil){
var _1b9=objj_msgSend(_trackingMenuItem,"action");
if(!_1b9||_1b9===sel_getUid("submenuAction:")){
return objj_msgSend(self,"showMenu:",_1b4);
}
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.5);
}
objj_msgSend(_1b7,"highlight:",_1b8);
}else{
if(type==CPLeftMouseDragged){
if(!_1b8&&objj_msgSend(_trackingMenuItem,"submenu")){
return objj_msgSend(self,"showMenu:",_1b4);
}
objj_msgSend(_1b7,"highlight:",_1b8);
}else{
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(_1b7,"highlight:",NO);
if(_1b8){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_trackingMenuItem,"action"),objj_msgSend(_trackingMenuItem,"target"),_trackingMenuItem);
}
return;
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("showMenu:"),function(self,_cmd,_1bc){
with(self){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _1bd=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_1be=objj_msgSend(_trackingMenuItem,"_menuItemView");
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_1bd);
objj_msgSend(_highlightView,"setBackgroundColor:",_highlightColor?_highlightColor:objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",95/255,131/255,185/255,1));
}else{
objj_msgSend(_highlightView,"setFrame:",_1bd);
}
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_1be);
objj_msgSend(_1be,"activate:",YES);
var _1bf=objj_msgSend(_trackingMenuItem,"submenu");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("menuDidEndTracking:"),CPMenuDidEndTrackingNotification,_1bf);
objj_msgSend(CPMenu,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_1bf,objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,CGPointMake(CGRectGetMinX(_1bd),CGRectGetMaxY(_1bd)),objj_msgSend(_1bc,"modifierFlags"),objj_msgSend(_1bc,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_1bc,"clickCount"),objj_msgSend(_1bc,"pressure")),objj_msgSend(self,"contentView"),nil,YES);
}
}),new objj_method(sel_getUid("menuDidEndTracking:"),function(self,_cmd,_1c2){
with(self){
objj_msgSend(_highlightView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"activate:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",self,CPMenuDidEndTrackingNotification,objj_msgSend(_1c2,"object"));
}
}),new objj_method(sel_getUid("tile"),function(self,_cmd){
with(self){
var _1c5=objj_msgSend(_menu,"itemArray"),_1c6=0,_1c7=_1c5.length,x=_163,y=0,_1ca=YES;
for(;_1c6<_1c7;++_1c6){
var item=_1c5[_1c6];
if(objj_msgSend(item,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(self,"frame"))-_164;
_1ca=NO;
continue;
}
if(objj_msgSend(item,"isHidden")){
continue;
}
var _1cc=objj_msgSend(item,"_menuItemView"),_1cd=objj_msgSend(_1cc,"frame");
if(_1ca){
objj_msgSend(_1cc,"setFrameOrigin:",CGPointMake(x,(_1-1-CGRectGetHeight(_1cd))/2));
x+=CGRectGetWidth(objj_msgSend(_1cc,"frame"))+_162;
}else{
objj_msgSend(_1cc,"setFrameOrigin:",CGPointMake(x-CGRectGetWidth(_1cd),(_1-1-CGRectGetHeight(_1cd))/2));
x=CGRectGetMinX(objj_msgSend(_1cc,"frame"))-_162;
}
}
var _1ce=objj_msgSend(objj_msgSend(self,"contentView"),"bounds"),_1cf=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1ce)-CGRectGetWidth(_1cf))/2,(CGRectGetHeight(_1ce)-CGRectGetHeight(_1cf))/2));
}else{
var _1d0=objj_msgSend(_iconImageView,"frame"),_1d1=CGRectGetWidth(_1d0),_1d2=_1d1+CGRectGetWidth(_1cf);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1ce)-_1d2)/2,(CGRectGetHeight(_1ce)-CGRectGetHeight(_1d0))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1ce)-_1d2)/2+_1d1,(CGRectGetHeight(_1ce)-CGRectGetHeight(_1cf))/2));
}
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(self,_cmd,_1d5,_1d6,_1d7){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"setFrame:display:animate:",_1d5,_1d6,_1d7);
if(!(size.width==_1d5.size.width&&size.height==_1d5.size.height)){
objj_msgSend(self,"tile");
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuBarWindow,"class")){
return;
}
var _1db=objj_msgSend(CPBundle,"bundleForClass:",self);
_166=objj_msgSend(CPFont,"systemFontOfSize:",11);
}
})]);
