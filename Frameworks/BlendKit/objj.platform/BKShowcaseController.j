I;16;AppKit/CPTheme.jI;15;AppKit/CPView.jc;15346;
var _1=176;
var _2="BKLearnMoreToolbarItemIdentifier",_3="BKStateToolbarItemIdentifier",_4="BKBackgroundColorToolbarItemIdentifier";
var _5=objj_allocateClassPair(CPObject,"BKShowcaseController"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_themeDescriptorClasses"),new objj_ivar("_themesCollectionView"),new objj_ivar("_themedObjectsCollectionView")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_7,_8,_9){
with(_7){
_themeDescriptorClasses=objj_msgSend(BKThemeDescriptor,"allThemeDescriptorClasses");
var _a=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_b=objj_msgSend(objj_msgSend(CPToolbar,"alloc"),"initWithIdentifier:","Toolbar");
objj_msgSend(_b,"setDelegate:",_7);
objj_msgSend(_a,"setToolbar:",_b);
var _c=objj_msgSend(_a,"contentView"),_d=objj_msgSend(_c,"bounds"),_e=objj_msgSend(objj_msgSend(CPSplitView,"alloc"),"initWithFrame:",_d);
objj_msgSend(_e,"setIsPaneSplitter:",YES);
objj_msgSend(_e,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_c,"addSubview:",_e);
var _f=objj_msgSend(CPTextField,"labelWithTitle:","THEMES");
objj_msgSend(_f,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",11));
objj_msgSend(_f,"setTextColor:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",93/255,93/255,93/255,1));
objj_msgSend(_f,"setTextShadowColor:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",225/255,255/255,255/255,0.7));
objj_msgSend(_f,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_f,"sizeToFit");
objj_msgSend(_f,"setFrameOrigin:",CGPointMake(5,4));
var _10=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_10,"setView:",objj_msgSend(objj_msgSend(BKThemeDescriptorCell,"alloc"),"init"));
_themesCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1,CGRectGetHeight(_d)));
objj_msgSend(_themesCollectionView,"setDelegate:",_7);
objj_msgSend(_themesCollectionView,"setItemPrototype:",_10);
objj_msgSend(_themesCollectionView,"setMinItemSize:",CGSizeMake(20,36));
objj_msgSend(_themesCollectionView,"setMaxItemSize:",CGSizeMake(10000000,36));
objj_msgSend(_themesCollectionView,"setMaxNumberOfColumns:",1);
objj_msgSend(_themesCollectionView,"setContent:",_themeDescriptorClasses);
objj_msgSend(_themesCollectionView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_themesCollectionView,"setVerticalMargin:",0);
objj_msgSend(_themesCollectionView,"setSelectable:",YES);
objj_msgSend(_themesCollectionView,"setFrameOrigin:",CGPointMake(0,20));
objj_msgSend(_themesCollectionView,"setAutoresizingMask:",CPViewWidthSizable);
var _11=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,_1,CGRectGetHeight(_d))),_c=objj_msgSend(_11,"contentView");
objj_msgSend(_11,"setAutohidesScrollers:",YES);
objj_msgSend(_11,"setDocumentView:",_themesCollectionView);
objj_msgSend(_c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",212/255,221/255,230/255,1));
objj_msgSend(_c,"addSubview:",_f);
objj_msgSend(_e,"addSubview:",_11);
_themedObjectsCollectionView=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_d)-_1-1,10));
var _12=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_12,"setView:",objj_msgSend(objj_msgSend(BKShowcaseCell,"alloc"),"init"));
objj_msgSend(_themedObjectsCollectionView,"setItemPrototype:",_12);
objj_msgSend(_themedObjectsCollectionView,"setVerticalMargin:",20);
objj_msgSend(_themedObjectsCollectionView,"setAutoresizingMask:",CPViewWidthSizable);
var _11=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(_1+1,0,CGRectGetWidth(_d)-_1-1,CGRectGetHeight(_d)));
objj_msgSend(_11,"setHasHorizontalScroller:",NO);
objj_msgSend(_11,"setAutohidesScrollers:",YES);
objj_msgSend(_11,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_11,"setDocumentView:",_themedObjectsCollectionView);
objj_msgSend(_e,"addSubview:",_11);
objj_msgSend(_themesCollectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",0));
objj_msgSend(_a,"setFullBridge:",YES);
objj_msgSend(_a,"makeKeyAndOrderFront:",_7);
}
}),new objj_method(sel_getUid("collectionViewDidChangeSelection:"),function(_13,_14,_15){
with(_13){
var _16=_themeDescriptorClasses[objj_msgSend(objj_msgSend(_15,"selectionIndexes"),"firstIndex")],_17=objj_msgSend(_16,"itemSize");
_17.width=MAX(100,_17.width+20);
_17.height=MAX(100,_17.height+30);
objj_msgSend(_themedObjectsCollectionView,"setMinItemSize:",_17);
objj_msgSend(_themedObjectsCollectionView,"setMaxItemSize:",_17);
objj_msgSend(_themedObjectsCollectionView,"setContent:",objj_msgSend(_16,"themedObjectTemplates"));
objj_msgSend(BKShowcaseCell,"setBackgroundColor:",objj_msgSend(_16,"showcaseBackgroundColor"));
}
}),new objj_method(sel_getUid("hasLearnMoreURL"),function(_18,_19){
with(_18){
return objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","BKLearnMoreURL");
}
}),new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"),function(_1a,_1b,_1c){
with(_1a){
return [_2,CPToolbarSpaceItemIdentifier,CPToolbarFlexibleSpaceItemIdentifier,_4,_3];
}
}),new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"),function(_1d,_1e,_1f){
with(_1d){
var _20=[CPToolbarFlexibleSpaceItemIdentifier,_4,_3];
if(objj_msgSend(_1d,"hasLearnMoreURL")){
_20=[_2].concat(_20);
}
return _20;
}
}),new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_21,_22,_23,_24,_25){
with(_21){
var _26=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_24);
objj_msgSend(_26,"setTarget:",_21);
if(_24===_3){
var _27=objj_msgSend(CPPopUpButton,"buttonWithTitle:","Enabled");
objj_msgSend(_27,"addItemWithTitle:","Disabled");
objj_msgSend(_26,"setView:",_27);
objj_msgSend(_26,"setTarget:",nil);
objj_msgSend(_26,"setAction:",sel_getUid("changeState:"));
objj_msgSend(_26,"setLabel:","State");
var _28=CGRectGetWidth(objj_msgSend(_27,"frame"));
objj_msgSend(_26,"setMinSize:",CGSizeMake(_28+20,32));
objj_msgSend(_26,"setMaxSize:",CGSizeMake(_28+20,32));
}else{
if(_24===_4){
var _27=objj_msgSend(CPPopUpButton,"buttonWithTitle:","Window Background");
objj_msgSend(_27,"addItemWithTitle:","Light Checkers");
objj_msgSend(_27,"addItemWithTitle:","Dark Checkers");
objj_msgSend(_27,"addItemWithTitle:","White");
objj_msgSend(_27,"addItemWithTitle:","Black");
objj_msgSend(_27,"addItemWithTitle:","More Choices...");
var _29=objj_msgSend(_27,"itemArray");
objj_msgSend(_29[0],"setRepresentedObject:",objj_msgSend(BKThemeDescriptor,"windowBackgroundColor"));
objj_msgSend(_29[1],"setRepresentedObject:",objj_msgSend(BKThemeDescriptor,"lightCheckersColor"));
objj_msgSend(_29[2],"setRepresentedObject:",objj_msgSend(BKThemeDescriptor,"darkCheckersColor"));
objj_msgSend(_29[3],"setRepresentedObject:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_29[4],"setRepresentedObject:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_26,"setView:",_27);
objj_msgSend(_26,"setTarget:",nil);
objj_msgSend(_26,"setAction:",sel_getUid("changeColor:"));
objj_msgSend(_26,"setLabel:","Background Color");
var _28=CGRectGetWidth(objj_msgSend(_27,"frame"));
objj_msgSend(_26,"setMinSize:",CGSizeMake(_28,32));
objj_msgSend(_26,"setMaxSize:",CGSizeMake(_28,32));
}else{
if(_24===_2){
var _2a=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","BKLearnMoreButtonTitle");
if(!_2a){
_2a=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPBundleName")||"Home Page";
}
var _2b=objj_msgSend(CPButton,"buttonWithTitle:",_2a);
objj_msgSend(_2b,"setDefaultButton:",YES);
objj_msgSend(_26,"setView:",_2b);
objj_msgSend(_26,"setLabel:","Learn More");
objj_msgSend(_26,"setTarget:",nil);
objj_msgSend(_26,"setAction:",sel_getUid("learnMore:"));
var _28=CGRectGetWidth(objj_msgSend(_2b,"frame"));
objj_msgSend(_26,"setMinSize:",CGSizeMake(_28,32));
objj_msgSend(_26,"setMaxSize:",CGSizeMake(_28,32));
}
}
}
return _26;
}
}),new objj_method(sel_getUid("learnMore:"),function(_2c,_2d,_2e){
with(_2c){
window.location.href=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","BKLearnMoreURL");
}
}),new objj_method(sel_getUid("selectedThemeDescriptor"),function(_2f,_30){
with(_2f){
return _themeDescriptorClasses[objj_msgSend(objj_msgSend(_themesCollectionView,"selectionIndexes"),"firstIndex")];
}
}),new objj_method(sel_getUid("changeState:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(objj_msgSend(_31,"selectedThemeDescriptor"),"themedObjectTemplates"),_35=objj_msgSend(_34,"count");
while(_35--){
var _36=objj_msgSend(_34[_35],"valueForKey:","themedObject");
if(objj_msgSend(_36,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_36,"setEnabled:",objj_msgSend(_33,"title")==="Enabled"?YES:NO);
}
}
}
}),new objj_method(sel_getUid("changeColor:"),function(_37,_38,_39){
with(_37){
var _3a=nil;
if(objj_msgSend(_39,"isKindOfClass:",objj_msgSend(CPColorPanel,"class"))){
_3a=objj_msgSend(_39,"color");
}else{
if(objj_msgSend(_39,"titleOfSelectedItem")==="More Choices..."){
objj_msgSend(_39,"addItemWithTitle:","Other");
objj_msgSend(_39,"selectItemWithTitle:","Other");
objj_msgSend(CPApp,"orderFrontColorPanel:",_37);
}else{
_3a=objj_msgSend(objj_msgSend(_39,"selectedItem"),"representedObject");
objj_msgSend(_39,"removeItemWithTitle:","Other");
}
}
if(_3a){
objj_msgSend(objj_msgSend(_37,"selectedThemeDescriptor"),"setShowcaseBackgroundColor:",_3a);
objj_msgSend(BKShowcaseCell,"setBackgroundColor:",_3a);
}
}
})]);
var _3b=nil;
var _5=objj_allocateClassPair(CPView,"BKThemeDescriptorCell"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_label")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("setRepresentedObject:"),function(_3c,_3d,_3e){
with(_3c){
if(!_label){
_label=objj_msgSend(CPTextField,"labelWithTitle:","hello");
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_label,"setFrame:",CGRectMake(10,0,CGRectGetWidth(objj_msgSend(_3c,"bounds"))-20,CGRectGetHeight(objj_msgSend(_3c,"bounds"))));
objj_msgSend(_label,"setVerticalAlignment:",CPCenterVerticalTextAlignment);
objj_msgSend(_label,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_3c,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",objj_msgSend(_3e,"themeName")+" ("+objj_msgSend(objj_msgSend(_3e,"themedObjectTemplates"),"count")+")");
}
}),new objj_method(sel_getUid("setSelected:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_3f,"setBackgroundColor:",_41?objj_msgSend(objj_msgSend(_3f,"class"),"selectionColor"):nil);
objj_msgSend(_label,"setTextShadowOffset:",_41?CGSizeMake(0,1):CGSizeMakeZero());
objj_msgSend(_label,"setTextShadowColor:",_41?objj_msgSend(CPColor,"blackColor"):nil);
objj_msgSend(_label,"setFont:",_41?objj_msgSend(CPFont,"boldSystemFontOfSize:",11):objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_label,"setTextColor:",_41?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(CPColor,"blackColor"));
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("selectionColor"),function(_42,_43){
with(_42){
if(!_3b){
_3b=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(BKThemeDescriptorCell,"class")),"pathForResource:","selection.png"),CGSizeMake(1,36)));
}
return _3b;
}
})]);
var _44=nil;
var _45="BKShowcaseCellBackgroundColorDidChangeNotification";
var _5=objj_allocateClassPair(CPView,"BKShowcaseCell"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_backgroundView"),new objj_ivar("_view"),new objj_ivar("_label")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("init"),function(_46,_47){
with(_46){
_46=objj_msgSendSuper({receiver:_46,super_class:objj_getClass("CPView")},"init");
if(_46){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_46,sel_getUid("showcaseBackgroundDidChange:"),_45,nil);
}
return _46;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_48,_49,_4a){
with(_48){
_48=objj_msgSendSuper({receiver:_48,super_class:objj_getClass("CPView")},"initWithCoder:",_4a);
if(_48){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_48,sel_getUid("showcaseBackgroundDidChange:"),_45,nil);
}
return _48;
}
}),new objj_method(sel_getUid("showcaseBackgroundDidChange:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_backgroundView,"setBackgroundColor:",objj_msgSend(BKShowcaseCell,"backgroundColor"));
}
}),new objj_method(sel_getUid("setSelected:"),function(_4e,_4f,_50){
with(_4e){
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_51,_52,_53){
with(_51){
if(!_label){
_label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_label,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_label,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",11));
objj_msgSend(_51,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",objj_msgSend(_53,"valueForKey:","label"));
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_51,"bounds"))-CGRectGetHeight(objj_msgSend(_label,"frame")),CGRectGetWidth(objj_msgSend(_51,"bounds")),CGRectGetHeight(objj_msgSend(_label,"frame"))));
if(!_backgroundView){
_backgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"init");
objj_msgSend(_51,"addSubview:",_backgroundView);
}
objj_msgSend(_backgroundView,"setFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_51,"bounds")),CGRectGetMinY(objj_msgSend(_label,"frame"))));
objj_msgSend(_backgroundView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
if(_view){
objj_msgSend(_view,"removeFromSuperview");
}
_view=objj_msgSend(_53,"valueForKey:","themedObject");
objj_msgSend(_view,"setTheme:",nil);
objj_msgSend(_view,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_view,"setFrameOrigin:",CGPointMake((CGRectGetWidth(objj_msgSend(_backgroundView,"bounds"))-CGRectGetWidth(objj_msgSend(_view,"frame")))/2,(CGRectGetHeight(objj_msgSend(_backgroundView,"bounds"))-CGRectGetHeight(objj_msgSend(_view,"frame")))/2));
objj_msgSend(_backgroundView,"addSubview:",_view);
objj_msgSend(_backgroundView,"setBackgroundColor:",objj_msgSend(BKShowcaseCell,"backgroundColor"));
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("setBackgroundColor:"),function(_54,_55,_56){
with(_54){
if(_44===_56){
return;
}
_44=_56;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_45,nil);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_57,_58){
with(_57){
return _44;
}
})]);
