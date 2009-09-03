I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;48259;
CPMenuDidAddItemNotification="CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification="CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification="CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification="CPMenuDidEndTrackingNotification";
var _1=19;
var _2=NO,_3="",_4=nil,_5=1,_6=nil,_7=nil;
var _8=objj_allocateClassPair(CPObject,"CPMenu"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_supermenu"),new objj_ivar("_title"),new objj_ivar("_items"),new objj_ivar("_attachedMenu"),new objj_ivar("_autoenablesItems"),new objj_ivar("_showsStateColumn"),new objj_ivar("_delegate"),new objj_ivar("_highlightedIndex"),new objj_ivar("_menuWindow")]);
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
}),new objj_method(sel_getUid("menuWithTag:"),function(_2e,_2f,_30){
with(_2e){
var _31=objj_msgSend(_2e,"indexOfItemWithTag:",_30);
if(_31==CPNotFound){
return nil;
}
return _items[_31];
}
}),new objj_method(sel_getUid("menuWithTitle:"),function(_32,_33,_34){
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
objj_msgSend(_menuWindow,"cancelTracking");
}
}),new objj_method(sel_getUid("_setMenuWindow:"),function(_8a,_8b,_8c){
with(_8a){
_menuWindow=_8c;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_8d,_8e,_8f){
with(_8d){
if(_autoenablesItems){
objj_msgSend(_8d,"update");
}
var _90=0,_91=_items.length,_92=objj_msgSend(_8f,"charactersIgnoringModifiers"),_93=objj_msgSend(_8f,"modifierFlags");
for(;_90<_91;++_90){
var _94=_items[_90],_95=objj_msgSend(_94,"keyEquivalentModifierMask");
if((_93&(CPShiftKeyMask|CPAlternateKeyMask|CPCommandKeyMask|CPControlKeyMask))==_95&&objj_msgSend(_92,"caseInsensitiveCompare:",objj_msgSend(_94,"keyEquivalent"))==CPOrderedSame){
if(objj_msgSend(_94,"isEnabled")){
objj_msgSend(_8d,"performActionForItemAtIndex:",_90);
}else{
}
return YES;
}
if(objj_msgSend(objj_msgSend(_94,"submenu"),"performKeyEquivalent:",_8f)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("performActionForItemAtIndex:"),function(_96,_97,_98){
with(_96){
var _99=_items[_98];
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_99,"action"),objj_msgSend(_99,"target"),_99);
}
}),new objj_method(sel_getUid("_itemIsHighlighted:"),function(_9a,_9b,_9c){
with(_9a){
return _items[_highlightedIndex]==_9c;
}
}),new objj_method(sel_getUid("_highlightItemAtIndex:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=_highlightedIndex;
_highlightedIndex=_9f;
if(_a0!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_a0],"_menuItemView"),"highlight:",NO);
}
if(_highlightedIndex!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",YES);
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(_a1,_a2){
with(_a1){
objj_msgSend(objj_msgSend(_a1,"class"),"setMenuBarAttributes:",objj_msgSend(CPDictionary,"dictionary"));
}
}),new objj_method(sel_getUid("menuBarVisible"),function(_a3,_a4){
with(_a3){
return _2;
}
}),new objj_method(sel_getUid("setMenuBarVisible:"),function(_a5,_a6,_a7){
with(_a5){
if(_2==_a7){
return;
}
_2=_a7;
if(_a7){
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
objj_msgSend(_7,"orderFront:",_a5);
}else{
objj_msgSend(_7,"orderOut:",_a5);
}
objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"resizeEvent:",nil);
}
}),new objj_method(sel_getUid("setMenuBarTitle:"),function(_a8,_a9,_aa){
with(_a8){
_3=_aa;
objj_msgSend(_7,"setTitle:",_3);
}
}),new objj_method(sel_getUid("menuBarTitle"),function(_ab,_ac){
with(_ab){
return _3;
}
}),new objj_method(sel_getUid("setMenuBarIconImage:"),function(_ad,_ae,_af){
with(_ad){
_CPMenuBarImage=_af;
objj_msgSend(_7,"setIconImage:",_af);
}
}),new objj_method(sel_getUid("menuBarIconImage"),function(_b0,_b1){
with(_b0){
return _CPMenuBarImage;
}
}),new objj_method(sel_getUid("setMenuBarAttributes:"),function(_b2,_b3,_b4){
with(_b2){
if(_6==_b4){
return;
}
_6=objj_msgSend(_b4,"copy");
var _b5=objj_msgSend(_b4,"objectForKey:","CPMenuBarTextColor"),_b6=objj_msgSend(_b4,"objectForKey:","CPMenuBarTitleColor"),_b7=objj_msgSend(_b4,"objectForKey:","CPMenuBarTextShadowColor"),_b8=objj_msgSend(_b4,"objectForKey:","CPMenuBarTitleShadowColor"),_b9=objj_msgSend(_b4,"objectForKey:","CPMenuBarHighlightColor"),_ba=objj_msgSend(_b4,"objectForKey:","CPMenuBarHighlightTextColor"),_bb=objj_msgSend(_b4,"objectForKey:","CPMenuBarHighlightTextShadowColor");
if(!_b5&&_b6){
objj_msgSend(_6,"setObject:forKey:",_b6,"CPMenuBarTextColor");
}else{
if(_b5&&!_b6){
objj_msgSend(_6,"setObject:forKey:",_b5,"CPMenuBarTitleColor");
}else{
if(!_b5&&!_b6){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTextColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",0.051,0.2,0.275,1),"CPMenuBarTitleColor");
}
}
}
if(!_b7&&_b8){
objj_msgSend(_6,"setObject:forKey:",_b8,"CPMenuBarTextShadowColor");
}else{
if(_b7&&!_b8){
objj_msgSend(_6,"setObject:forKey:",_b7,"CPMenuBarTitleShadowColor");
}else{
if(!_b7&&!_b8){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTextShadowColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarTitleShadowColor");
}
}
}
if(!_b9){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",94/255,130/255,186/255,1),"CPMenuBarHighlightColor");
}
if(!_ba){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"whiteColor"),"CPMenuBarHighlightTextColor");
}
if(!_bb){
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
}),new objj_method(sel_getUid("menuBarAttributes"),function(_bc,_bd){
with(_bc){
return _6;
}
}),new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"),function(_be,_bf,_c0){
with(_be){
_5=_c0;
objj_msgSend(_7,"setIconImageAlphaValue:",_c0);
}
}),new objj_method(sel_getUid("menuBarHeight"),function(_c1,_c2){
with(_c1){
return _1;
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"),function(_c3,_c4,_c5,_c6,_c7){
with(_c3){
objj_msgSend(_c3,"popUpContextMenu:withEvent:forView:withFont:",_c5,_c6,_c7,nil);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"),function(_c8,_c9,_ca,_cb,_cc,_cd){
with(_c8){
objj_msgSend(_c8,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_ca,_cb,_cc,_cd,NO);
}
}),new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"),function(_ce,_cf,_d0,_d1,_d2,_d3,_d4){
with(_ce){
var _d5=objj_msgSend(_d0,"delegate");
if(objj_msgSend(_d5,"respondsToSelector:",sel_getUid("menuWillOpen:"))){
objj_msgSend(_d5,"menuWillOpen:",_d0);
}
if(!_d3){
_d3=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
var _d6=objj_msgSend(_d2,"window"),_d7=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_d0,_d3);
objj_msgSend(_d7,"setDelegate:",_ce);
objj_msgSend(_d7,"setBackgroundStyle:",_d4?_CPMenuWindowMenuBarBackgroundStyle:_CPMenuWindowPopUpBackgroundStyle);
objj_msgSend(_d7,"setFrameOrigin:",objj_msgSend(objj_msgSend(_d1,"window"),"convertBaseToGlobal:",objj_msgSend(_d1,"locationInWindow")));
objj_msgSend(_d7,"orderFront:",_ce);
objj_msgSend(_d7,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_d1,_ce,sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"),function(_d8,_d9,_da,_db){
with(_d8){
var _dc=objj_msgSend(_da,"menu");
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_da);
if(objj_msgSend(_db,"isEnabled")){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_db,"action"),objj_msgSend(_db,"target"),_db);
}
}
})]);
var _dd="CPMenuTitleKey",_de="CPMenuItemsKey",_df="CPMenuShowsStateColumnKey";
var _8=objj_getClass("CPMenu");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenu\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_e0,_e1,_e2){
with(_e0){
_e0=objj_msgSendSuper({receiver:_e0,super_class:objj_getClass("CPObject")},"init");
if(_e0){
_title=objj_msgSend(_e2,"decodeObjectForKey:",_dd);
_items=objj_msgSend(_e2,"decodeObjectForKey:",_de);
_showsStateColumn=!objj_msgSend(_e2,"containsValueForKey:",_df)||objj_msgSend(_e2,"decodeBoolForKey:",_df);
}
return _e0;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e3,_e4,_e5){
with(_e3){
objj_msgSend(_e5,"encodeObject:forKey:",_title,_dd);
objj_msgSend(_e5,"encodeObject:forKey:",_items,_de);
if(!_showsStateColumn){
objj_msgSend(_e5,"encodeBool:forKey:",_showsStateColumn,_df);
}
}
})]);
var _e6=[],_e7=5,_e8=[],_e9=-1,_ea=1,_eb=0;
_CPMenuWindowMenuBarBackgroundStyle=0;
_CPMenuWindowPopUpBackgroundStyle=1;
_CPMenuWindowAttachedMenuBackgroundStyle=2;
var _ec=500,_ed=5,_ee=1,_ef=1,_f0=5,_f1=16;
var _8=objj_allocateClassPair(CPWindow,"_CPMenuWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuView"),new objj_ivar("_menuClipView"),new objj_ivar("_lastMouseOverMenuView"),new objj_ivar("_moreAboveView"),new objj_ivar("_moreBelowView"),new objj_ivar("_sessionDelegate"),new objj_ivar("_didEndSelector"),new objj_ivar("_startTime"),new objj_ivar("_scrollingState"),new objj_ivar("_lastGlobalLocation"),new objj_ivar("_isShowingTopScrollIndicator"),new objj_ivar("_isShowingBottomScrollIndicator"),new objj_ivar("_trackingCanceled"),new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_f2,_f3){
with(_f2){
_f2=objj_msgSendSuper({receiver:_f2,super_class:objj_getClass("CPWindow")},"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessWindowMask);
if(_f2){
objj_msgSend(_f2,"setLevel:",CPPopUpMenuWindowLevel);
objj_msgSend(_f2,"setHasShadow:",YES);
objj_msgSend(_f2,"setAcceptsMouseMovedEvents:",YES);
_unconstrainedFrame=CGRectMakeZero();
var _f4=objj_msgSend(_f2,"contentView");
_menuView=objj_msgSend(objj_msgSend(_CPMenuView,"alloc"),"initWithFrame:",CGRectMakeZero());
_menuClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",CGRectMake(_ee,_ed,0,0));
objj_msgSend(_menuClipView,"setDocumentView:",_menuView);
objj_msgSend(_f4,"addSubview:",_menuClipView);
_moreAboveView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreAboveView,"setImage:",_CPMenuWindowMoreAboveImage);
objj_msgSend(_moreAboveView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreAboveImage,"size"));
objj_msgSend(_f4,"addSubview:",_moreAboveView);
_moreBelowView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreBelowView,"setImage:",_CPMenuWindowMoreBelowImage);
objj_msgSend(_moreBelowView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreBelowImage,"size"));
objj_msgSend(_f4,"addSubview:",_moreBelowView);
}
return _f2;
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(_f5,_f6){
with(_f5){
return _ee;
}
}),new objj_method(sel_getUid("setFont:"),function(_f7,_f8,_f9){
with(_f7){
objj_msgSend(_menuView,"setFont:",_f9);
}
}),new objj_method(sel_getUid("setBackgroundStyle:"),function(_fa,_fb,_fc){
with(_fa){
var _fd=_e8[_fc];
if(!_fd){
var _fe=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_fa,"class"));
if(_fc==_CPMenuWindowPopUpBackgroundStyle){
_fd=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}else{
if(_fc==_CPMenuWindowMenuBarBackgroundStyle){
_fd=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_fe,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}
}
_e8[_fc]=_fd;
}
objj_msgSend(_fa,"setBackgroundColor:",_fd);
}
}),new objj_method(sel_getUid("setMenu:"),function(_ff,_cmd,_101){
with(_ff){
objj_msgSend(_101,"_setMenuWindow:",_ff);
objj_msgSend(_menuView,"setMenu:",_101);
var _102=objj_msgSend(_menuView,"frame").size;
objj_msgSend(_ff,"setFrameSize:",CGSizeMake(_ee+_102.width+_ef,_ed+_102.height+_f0));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,0));
objj_msgSend(_menuClipView,"setFrame:",CGRectMake(_ee,_ed,_102.width,_102.height));
}
}),new objj_method(sel_getUid("setMinWidth:"),function(self,_cmd,_105){
with(self){
var size=objj_msgSend(self,"frame").size;
objj_msgSend(self,"setFrameSize:",CGSizeMake(MAX(size.width,_105),size.height));
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_109){
with(self){
return objj_msgSend(_menuView,"convertRect:toView:",objj_msgSend(_menuView,"rectForItemAtIndex:",_109),nil);
}
}),new objj_method(sel_getUid("orderFront:"),function(self,_cmd,_10c){
with(self){
objj_msgSend(self,"constrainToScreen");
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"orderFront:",_10c);
}
}),new objj_method(sel_getUid("constrainToScreen"),function(self,_cmd){
with(self){
_unconstrainedFrame=CGRectMakeCopy(objj_msgSend(self,"frame"));
var _10f=objj_msgSend(CPPlatform,"isBrowser"),_110=CGRectInset(_10f?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5),_111=CGRectIntersection(_unconstrainedFrame,_110);
_111.origin.x=CGRectGetMinX(_unconstrainedFrame);
_111.size.width=CGRectGetWidth(_unconstrainedFrame);
if(CGRectGetWidth(_111)>CGRectGetWidth(_110)){
_111.size.width=CGRectGetWidth(_110);
}
if(CGRectGetMaxX(_111)>CGRectGetMaxX(_110)){
_111.origin.x-=CGRectGetMaxX(_111)-CGRectGetMaxX(_110);
}
if(CGRectGetMinX(_111)<CGRectGetMinX(_110)){
_111.origin.x=CGRectGetMinX(_110);
}
var _112=objj_msgSend(self,"convertBaseToGlobal:",CGPointMake(_ee,_ed));
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"setFrame:",_111);
var _113=_112.y<CGRectGetMinY(_111)+_ed,_114=_112.y+CGRectGetHeight(objj_msgSend(_menuView,"frame"))>CGRectGetMaxY(_111)-_f0,_115=_ed,_116=_f0,_117=objj_msgSend(self,"contentView"),_118=objj_msgSend(_117,"bounds");
if(_113){
_115+=_f1;
var _119=objj_msgSend(_moreAboveView,"frame");
objj_msgSend(_moreAboveView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_118)-CGRectGetWidth(_119))/2,(_ed+_f1-CGRectGetHeight(_119))/2));
}
objj_msgSend(_moreAboveView,"setHidden:",!_113);
if(_114){
_116+=_f1;
objj_msgSend(_moreBelowView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_118)-CGRectGetWidth(objj_msgSend(_moreBelowView,"frame")))/2,CGRectGetHeight(_118)-_f1-_f0));
}
objj_msgSend(_moreBelowView,"setHidden:",!_114);
var _11a=CGRectMake(_ee,_115,CGRectGetWidth(_111)-_ee-_ef,CGRectGetHeight(_111)-_115-_116);
objj_msgSend(_menuClipView,"setFrame:",_11a);
objj_msgSend(_menuView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_11a),CGRectGetHeight(objj_msgSend(_menuView,"frame"))));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,objj_msgSend(self,"convertBaseToGlobal:",_11a.origin).y-_112.y));
}
}),new objj_method(sel_getUid("cancelTracking"),function(self,_cmd){
with(self){
_trackingCanceled=YES;
}
}),new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"),function(self,_cmd,_11f,_120,_121){
with(self){
_startTime=objj_msgSend(_11f,"timestamp");
_scrollingState=_eb;
_trackingCanceled=NO;
_sessionDelegate=_120;
_didEndSelector=_121;
objj_msgSend(self,"trackEvent:",_11f);
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_124){
with(self){
var type=objj_msgSend(_124,"type"),_126=objj_msgSend(_124,"window"),_127=_126?objj_msgSend(_126,"convertBaseToGlobal:",objj_msgSend(_124,"locationInWindow")):objj_msgSend(_124,"locationInWindow");
if(type===CPPeriodic){
var _128=CGRectInset(objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(self,"platformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame"),5,5);
if(_scrollingState==_e9){
if(CGRectGetMinY(_unconstrainedFrame)<CGRectGetMinY(_128)){
_unconstrainedFrame.origin.y+=10;
}
}else{
if(_scrollingState==_ea){
if(CGRectGetMaxY(_unconstrainedFrame)>CGRectGetHeight(_128)){
_unconstrainedFrame.origin.y-=10;
}
}
}
objj_msgSend(self,"setFrame:",_unconstrainedFrame);
objj_msgSend(self,"constrainToScreen");
_127=_lastGlobalLocation;
}
_lastGlobalLocation=_127;
var menu=objj_msgSend(_menuView,"menu"),_12a=objj_msgSend(self,"convertGlobalToBase:",_127),_12b=objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",_12a,nil)),_12c=objj_msgSend(objj_msgSend(menu,"itemAtIndex:",_12b),"view");
if(_12c){
if(!_lastMouseOverMenuView){
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
}
if(_lastMouseOverMenuView!=_12c){
objj_msgSend(_12c,"mouseExited:",_124);
objj_msgSend(_lastMouseOverMenuView,"mouseEntered:",_124);
_lastMouseOverMenuView=_12c;
}
objj_msgSend(self,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",type,_12a,objj_msgSend(_124,"modifierFlags"),objj_msgSend(_124,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_124,"clickCount"),objj_msgSend(_124,"pressure")));
}else{
if(_lastMouseOverMenuView){
objj_msgSend(_lastMouseOverMenuView,"mouseExited:",_124);
_lastMouseOverMenuView=nil;
}
objj_msgSend(menu,"_highlightItemAtIndex:",objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",objj_msgSend(self,"convertGlobalToBase:",_127),nil)));
if(type==CPMouseMoved||type==CPLeftMouseDragged||type==CPLeftMouseDown){
var _12d=objj_msgSend(self,"frame"),_12e=_scrollingState;
_scrollingState=_eb;
if(_127.y<CGRectGetMinY(_12d)+_ed+_f1){
_scrollingState=_e9;
}else{
if(_127.y>CGRectGetMaxY(_12d)-_f0-_f1){
_scrollingState=_ea;
}
}
if(_scrollingState!=_12e){
if(_scrollingState==_eb){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}else{
if(_12e==_eb){
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.04);
}
}
}
}else{
if(type==CPLeftMouseUp&&(objj_msgSend(_124,"timestamp")-_startTime>_ec)){
if(_scrollingState!=_eb){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}
objj_msgSend(self,"cancelTracking");
}
}
}
if(_trackingCanceled){
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
return;
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("menuWindowWithMenu:font:"),function(self,_cmd,_133,_134){
with(self){
var _135=nil;
if(_e6.length){
_135=_e6.pop();
}else{
_135=objj_msgSend(objj_msgSend(_CPMenuWindow,"alloc"),"init");
}
objj_msgSend(_135,"setFont:",_134);
objj_msgSend(_135,"setMenu:",_133);
return _135;
}
}),new objj_method(sel_getUid("poolMenuWindow:"),function(self,_cmd,_138){
with(self){
if(!_138||_e6.length>=_e7){
return;
}
_e6.push(_138);
}
}),new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuWindow,"class")){
return;
}
var _13b=objj_msgSend(CPBundle,"bundleForClass:",self);
_CPMenuWindowMoreAboveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_13b,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreAbove.png"),CGSizeMake(38,18));
_CPMenuWindowMoreBelowImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_13b,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreBelow.png"),CGSizeMake(38,18));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPMenuView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuItemViews"),new objj_ivar("_visibleMenuItemInfos"),new objj_ivar("_font")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("setFont:"),function(self,_cmd,_13e){
with(self){
_font=_13e;
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_141){
with(self){
return objj_msgSend(_menuItemViews[_141==CPNotFound?0:_141],"frame");
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(self,_cmd,_144){
with(self){
var x=_144.x,_146=objj_msgSend(self,"bounds");
if(x<CGRectGetMinX(_146)||x>CGRectGetMaxX(_146)){
return CPNotFound;
}
var y=_144.y,low=0,high=_visibleMenuItemInfos.length-1;
while(low<=high){
var _14a=FLOOR(low+(high-low)/2),info=_visibleMenuItemInfos[_14a];
frame=objj_msgSend(info.view,"frame");
if(y<CGRectGetMinY(frame)){
high=_14a-1;
}else{
if(y>CGRectGetMaxY(frame)){
low=_14a+1;
}else{
return info.index;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_14e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView")},"setMenu:",_14e);
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
_menuItemViews=[];
_visibleMenuItemInfos=[];
var menu=objj_msgSend(self,"menu");
if(!menu){
return;
}
var _150=objj_msgSend(menu,"itemArray"),_151=0,_152=objj_msgSend(_150,"count"),_153=0,y=0,_155=objj_msgSend(menu,"showsStateColumn");
for(;_151<_152;++_151){
var item=_150[_151],view=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(view);
if(objj_msgSend(item,"isHidden")){
continue;
}
_visibleMenuItemInfos.push({view:view,index:_151});
objj_msgSend(view,"setFont:",_font);
objj_msgSend(view,"setShowsStateColumn:",_155);
objj_msgSend(view,"synchronizeWithMenuItem");
objj_msgSend(view,"setFrameOrigin:",CGPointMake(0,y));
objj_msgSend(self,"addSubview:",view);
var size=objj_msgSend(view,"minSize"),_159=size.width;
if(_153<_159){
_153=_159;
}
y+=size.height;
}
for(_151=0;_151<_152;++_151){
var view=_menuItemViews[_151];
objj_msgSend(view,"setFrameSize:",CGSizeMake(_153,CGRectGetHeight(objj_msgSend(view,"frame"))));
}
objj_msgSend(self,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setFrameSize:",CGSizeMake(_153,y));
objj_msgSend(self,"setAutoresizesSubviews:",YES);
}
})]);
var _1=29,_15a=10,_15b=10,_15c=10;
var _15d=nil,_15e=nil;
var _8=objj_allocateClassPair(CPPanel,"_CPMenuBarWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menu"),new objj_ivar("_highlightView"),new objj_ivar("_menuItemViews"),new objj_ivar("_trackingMenuItem"),new objj_ivar("_iconImageView"),new objj_ivar("_titleField"),new objj_ivar("_textColor"),new objj_ivar("_titleColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_titleShadowColor"),new objj_ivar("_highlightColor"),new objj_ivar("_highlightTextColor"),new objj_ivar("_highlightTextShadowColor")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(self,_cmd){
with(self){
var _161=objj_msgSend(CPPlatform,"isBrowser")?objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"):objj_msgSend(objj_msgSend(self,"screen"),"visibleFrame");
_161.size.height=_1;
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",_161,CPBorderlessWindowMask);
if(self){
objj_msgSend(self,"setLevel:",-1);
objj_msgSend(self,"setAutoresizingMask:",CPWindowWidthSizable);
var _162=objj_msgSend(self,"contentView");
objj_msgSend(_162,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setBecomesKeyOnlyIfNeeded:",YES);
_iconImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_162,"addSubview:",_iconImageView);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_162,"addSubview:",_titleField);
}
return self;
}
}),new objj_method(sel_getUid("setTitle:"),function(self,_cmd,_165){
with(self){
var _166=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPBundleName");
if(!objj_msgSend(_166,"length")){
document.title=_165;
}else{
if(objj_msgSend(_165,"length")){
document.title=_165+" - "+_166;
}else{
document.title=_166;
}
}
objj_msgSend(_titleField,"setStringValue:",_165);
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImage:"),function(self,_cmd,_169){
with(self){
objj_msgSend(_iconImageView,"setImage:",_169);
objj_msgSend(_iconImageView,"setHidden:",_169==nil);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImageAlphaValue:"),function(self,_cmd,_16c){
with(self){
objj_msgSend(_iconImageView,"setAlphaValue:",_16c);
}
}),new objj_method(sel_getUid("setColor:"),function(self,_cmd,_16f){
with(self){
if(!_16f){
if(!_15d){
_15d=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuBarWindow,"class")),"pathForResource:","_CPMenuBarWindow/_CPMenuBarWindowBackground.png"),CGSizeMake(1,18)));
}
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_15d);
}else{
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_16f);
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(self,_cmd,_172){
with(self){
if(_textColor==_172){
return;
}
_textColor=_172;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextColor:"),_textColor);
}
}),new objj_method(sel_getUid("setTitleColor:"),function(self,_cmd,_175){
with(self){
if(_titleColor==_175){
return;
}
_titleColor=_175;
objj_msgSend(_titleField,"setTextColor:",_175?_175:objj_msgSend(CPColor,"blackColor"));
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(self,_cmd,_178){
with(self){
if(_textShadowColor==_178){
return;
}
_textShadowColor=_178;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextShadowColor:"),_textShadowColor);
}
}),new objj_method(sel_getUid("setTitleShadowColor:"),function(self,_cmd,_17b){
with(self){
if(_titleShadowColor==_17b){
return;
}
_titleShadowColor=_17b;
objj_msgSend(_titleField,"setTextShadowColor:",_17b?_17b:objj_msgSend(CPColor,"whiteColor"));
}
}),new objj_method(sel_getUid("setHighlightColor:"),function(self,_cmd,_17e){
with(self){
if(_highlightColor==_17e){
return;
}
_highlightColor=_17e;
}
}),new objj_method(sel_getUid("setHighlightTextColor:"),function(self,_cmd,_181){
with(self){
if(_highlightTextColor==_181){
return;
}
_highlightTextColor=_181;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateColor:"),_highlightTextColor);
}
}),new objj_method(sel_getUid("setHighlightTextShadowColor:"),function(self,_cmd,_184){
with(self){
if(_highlightTextShadowColor==_184){
return;
}
_highlightTextShadowColor=_184;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setActivateShadowColor:"),_highlightTextShadowColor);
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_187){
with(self){
if(_menu==_187){
return;
}
var _188=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_188,"removeObserver:name:object:",self,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_188,"removeObserver:name:object:",self,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_188,"removeObserver:name:object:",self,CPMenuDidRemoveItemNotification,_menu);
var _189=objj_msgSend(_menu,"itemArray"),_18a=_189.length;
while(_18a--){
objj_msgSend(objj_msgSend(_189[_18a],"_menuItemView"),"removeFromSuperview");
}
}
_menu=_187;
if(_menu){
objj_msgSend(_188,"addObserver:selector:name:object:",self,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_188,"addObserver:selector:name:object:",self,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_188,"addObserver:selector:name:object:",self,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
_menuItemViews=[];
var _18b=objj_msgSend(self,"contentView"),_189=objj_msgSend(_menu,"itemArray"),_18a=_189.length;
for(index=0;index<_18a;++index){
var item=_189[index],_18d=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(_18d);
objj_msgSend(_18d,"setShowsStateColumn:",NO);
objj_msgSend(_18d,"setBelongsToMenuBar:",YES);
objj_msgSend(_18d,"setFont:",_15e);
objj_msgSend(_18d,"setTextColor:",_textColor);
objj_msgSend(_18d,"setHidden:",objj_msgSend(item,"isHidden"));
objj_msgSend(_18d,"synchronizeWithMenuItem");
objj_msgSend(_18b,"addSubview:",_18d);
}
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(self,_cmd,_190){
with(self){
var _191=objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(objj_msgSend(_190,"userInfo"),"objectForKey:","CPMenuItemIndex")),_192=objj_msgSend(_191,"_menuItemView");
objj_msgSend(_192,"setHidden:",objj_msgSend(_191,"isHidden"));
objj_msgSend(_192,"synchronizeWithMenuItem");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(self,_cmd,_195){
with(self){
var _196=objj_msgSend(objj_msgSend(_195,"userInfo"),"objectForKey:","CPMenuItemIndex"),_197=objj_msgSend(_menu,"itemAtIndex:",_196),_198=objj_msgSend(_197,"_menuItemView");
objj_msgSend(_menuItemViews,"insertObject:atIndex:",_198,_196);
objj_msgSend(_198,"setShowsStateColumn:",NO);
objj_msgSend(_198,"setBelongsToMenuBar:",YES);
objj_msgSend(_198,"setFont:",_15e);
objj_msgSend(_198,"setTextColor:",_textColor);
objj_msgSend(_198,"setHidden:",objj_msgSend(_197,"isHidden"));
objj_msgSend(_198,"synchronizeWithMenuItem");
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:",_198);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(self,_cmd,_19b){
with(self){
var _19c=objj_msgSend(objj_msgSend(_19b,"userInfo"),"objectForKey:","CPMenuItemIndex"),_19d=objj_msgSend(_menuItemViews,"objectAtIndex:",_19c);
objj_msgSend(_menuItemViews,"removeObjectAtIndex:",_19c);
objj_msgSend(_19d,"removeFromSuperview");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("frameForMenuItem:"),function(self,_cmd,_1a0){
with(self){
var _1a1=objj_msgSend(objj_msgSend(_1a0,"_menuItemView"),"frame");
_1a1.origin.x-=5;
_1a1.origin.y=0;
_1a1.size.width+=10;
_1a1.size.height=_1;
return _1a1;
}
}),new objj_method(sel_getUid("menuItemAtPoint:"),function(self,_cmd,_1a4){
with(self){
var _1a5=objj_msgSend(_menu,"itemArray"),_1a6=_1a5.length;
while(_1a6--){
var item=_1a5[_1a6];
if(objj_msgSend(item,"isHidden")||objj_msgSend(item,"isSeparatorItem")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(self,"frameForMenuItem:",item),_1a4)){
return item;
}
}
return nil;
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_cmd,_1aa){
with(self){
_trackingMenuItem=objj_msgSend(self,"menuItemAtPoint:",objj_msgSend(_1aa,"locationInWindow"));
if(!objj_msgSend(_trackingMenuItem,"isEnabled")){
return;
}
if(objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"eventOnSubmenu:",_1aa)){
return objj_msgSend(self,"showMenu:",_1aa);
}
if(objj_msgSend(_trackingMenuItem,"isEnabled")){
objj_msgSend(self,"trackEvent:",_1aa);
}
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_1ad){
with(self){
var type=objj_msgSend(_1ad,"type");
if(type===CPPeriodic){
return objj_msgSend(self,"showMenu:",_1ad);
}
var _1af=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_1b0=objj_msgSend(_trackingMenuItem,"_menuItemView"),_1b1=CGRectContainsPoint(_1af,objj_msgSend(_1ad,"locationInWindow"));
if(type==CPLeftMouseDown){
if(objj_msgSend(_trackingMenuItem,"submenu")!=nil){
var _1b2=objj_msgSend(_trackingMenuItem,"action");
if(!_1b2||_1b2===sel_getUid("submenuAction:")){
return objj_msgSend(self,"showMenu:",_1ad);
}
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.5);
}
objj_msgSend(_1b0,"highlight:",_1b1);
}else{
if(type==CPLeftMouseDragged){
if(!_1b1&&objj_msgSend(_trackingMenuItem,"submenu")){
return objj_msgSend(self,"showMenu:",_1ad);
}
objj_msgSend(_1b0,"highlight:",_1b1);
}else{
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(_1b0,"highlight:",NO);
if(_1b1){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_trackingMenuItem,"action"),objj_msgSend(_trackingMenuItem,"target"),_trackingMenuItem);
}
return;
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("showMenu:"),function(self,_cmd,_1b5){
with(self){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _1b6=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_1b7=objj_msgSend(_trackingMenuItem,"_menuItemView");
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_1b6);
objj_msgSend(_highlightView,"setBackgroundColor:",_highlightColor?_highlightColor:objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",95/255,131/255,185/255,1));
}else{
objj_msgSend(_highlightView,"setFrame:",_1b6);
}
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_1b7);
objj_msgSend(_1b7,"activate:",YES);
var _1b8=objj_msgSend(_trackingMenuItem,"submenu");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("menuDidEndTracking:"),CPMenuDidEndTrackingNotification,_1b8);
objj_msgSend(CPMenu,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_1b8,objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,CGPointMake(CGRectGetMinX(_1b6),CGRectGetMaxY(_1b6)),objj_msgSend(_1b5,"modifierFlags"),objj_msgSend(_1b5,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_1b5,"clickCount"),objj_msgSend(_1b5,"pressure")),objj_msgSend(self,"contentView"),nil,YES);
}
}),new objj_method(sel_getUid("menuDidEndTracking:"),function(self,_cmd,_1bb){
with(self){
objj_msgSend(_highlightView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"activate:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",self,CPMenuDidEndTrackingNotification,objj_msgSend(_1bb,"object"));
}
}),new objj_method(sel_getUid("tile"),function(self,_cmd){
with(self){
var _1be=objj_msgSend(_menu,"itemArray"),_1bf=0,_1c0=_1be.length,x=_15b,y=0,_1c3=YES;
for(;_1bf<_1c0;++_1bf){
var item=_1be[_1bf];
if(objj_msgSend(item,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(self,"frame"))-_15c;
_1c3=NO;
continue;
}
if(objj_msgSend(item,"isHidden")){
continue;
}
var _1c5=objj_msgSend(item,"_menuItemView"),_1c6=objj_msgSend(_1c5,"frame");
if(_1c3){
objj_msgSend(_1c5,"setFrameOrigin:",CGPointMake(x,(_1-1-CGRectGetHeight(_1c6))/2));
x+=CGRectGetWidth(objj_msgSend(_1c5,"frame"))+_15a;
}else{
objj_msgSend(_1c5,"setFrameOrigin:",CGPointMake(x-CGRectGetWidth(_1c6),(_1-1-CGRectGetHeight(_1c6))/2));
x=CGRectGetMinX(objj_msgSend(_1c5,"frame"))-_15a;
}
}
var _1c7=objj_msgSend(objj_msgSend(self,"contentView"),"bounds"),_1c8=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1c7)-CGRectGetWidth(_1c8))/2,(CGRectGetHeight(_1c7)-CGRectGetHeight(_1c8))/2));
}else{
var _1c9=objj_msgSend(_iconImageView,"frame"),_1ca=CGRectGetWidth(_1c9),_1cb=_1ca+CGRectGetWidth(_1c8);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1c7)-_1cb)/2,(CGRectGetHeight(_1c7)-CGRectGetHeight(_1c9))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1c7)-_1cb)/2+_1ca,(CGRectGetHeight(_1c7)-CGRectGetHeight(_1c8))/2));
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_1ce){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"setFrameSize:",_1ce);
objj_msgSend(self,"tile");
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuBarWindow,"class")){
return;
}
var _1d1=objj_msgSend(CPBundle,"bundleForClass:",self);
_15e=objj_msgSend(CPFont,"systemFontOfSize:",11);
}
})]);
