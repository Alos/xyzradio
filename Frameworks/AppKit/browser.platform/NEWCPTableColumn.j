I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;6849;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"NEWCPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tableView"),new objj_ivar("_headerView"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_identifier"),new objj_ivar("_isEditable"),new objj_ivar("_sortDescriptorPrototype"),new objj_ivar("_isHidden"),new objj_ivar("_headerToolTip")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_dataViewData={};
_width=100;
_minWidth=10;
_maxWidth=1000000;
objj_msgSend(_3,"setIdentifier:",_5);
objj_msgSend(_3,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_3,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _3;
}
}),new objj_method(sel_getUid("setTableView:"),function(_6,_7,_8){
with(_6){
_tableView=_8;
}
}),new objj_method(sel_getUid("tableView"),function(_9,_a){
with(_9){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_b,_c,_d){
with(_b){
_d=+_d;
if(_width===_d){
return;
}
var _e=MIN(MAX(_d,objj_msgSend(_b,"minWidth")),objj_msgSend(_b,"maxWidth"));
if(_width===_e){
return;
}
var _f=_width;
_width=_e;
var _10=objj_msgSend(_b,"tableView");
if(_10){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewColumnDidResizeNotification,_10,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_b,_f],["CPTableColumn","CPOldWidth"]));
}
}
}),new objj_method(sel_getUid("width"),function(_11,_12){
with(_11){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_13,_14,_15){
with(_13){
_15=+_15;
if(_minWidth===_15){
return;
}
_minWidth=_15;
var _16=objj_msgSend(_13,"width"),_17=MAX(_16,objj_msgSend(_13,"minWidth"));
if(_16!==_17){
objj_msgSend(_13,"setWidth:",_17);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_18,_19){
with(_18){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1a,_1b,_1c){
with(_1a){
_1c=+_1c;
if(_maxWidth===_1c){
return;
}
_maxWidth=_1c;
var _1d=objj_msgSend(_1a,"width"),_1e=MAX(_1d,objj_msgSend(_1a,"maxWidth"));
if(_1d!==_1e){
objj_msgSend(_1a,"setWidth:",_1e);
}
}
}),new objj_method(sel_getUid("maxWidth"),function(_1f,_20){
with(_1f){
return _maxWidth;
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_21,_22,_23){
with(_21){
_resizingMask=_23;
}
}),new objj_method(sel_getUid("resizingMask"),function(_24,_25){
with(_24){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_26,_27){
with(_26){
var _28=_CGRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_28<objj_msgSend(_26,"minWidth")){
objj_msgSend(_26,"setMinWidth:",_28);
}else{
if(_28>objj_msgSend(_26,"maxWidth")){
objj_msgSend(_26,"setMaxWidth:",_28);
}
}
if(_width!==_28){
objj_msgSend(_26,"setWidth:",_28);
}
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_29,_2a,_2b){
with(_29){
if(!_2b){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Attempt to set nil header view on "+objj_msgSend(_29,"description"));
}
_headerView=_2b;
}
}),new objj_method(sel_getUid("headerView"),function(_2c,_2d){
with(_2c){
return _headerView;
}
}),new objj_method(sel_getUid("setDataView:"),function(_2e,_2f,_30){
with(_2e){
if(_dataView===_30){
return;
}
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_30;
_dataViewData[objj_msgSend(_30,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_30);
}
}),new objj_method(sel_getUid("dataView"),function(_31,_32){
with(_31){
return _dataView;
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(_33,"dataView");
}
}),new objj_method(sel_getUid("_newDataViewForRow:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_36,"dataViewForRow:",_38),_3a=objj_msgSend(_39,"UID");
var x=objj_msgSend(_36,"tableView")._cachedDataViews[_3a];
if(x&&x.length){
return x.pop();
}
if(!_dataViewData[_3a]){
_dataViewData[_3a]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_39);
}
var _3c=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_3a]);
_3c.identifier=_3a;
return _3c;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_3d,_3e,_3f){
with(_3d){
_identifier=_3f;
}
}),new objj_method(sel_getUid("identifier"),function(_40,_41){
with(_40){
return _identifier;
}
}),new objj_method(sel_getUid("setEditable:"),function(_42,_43,_44){
with(_42){
_isEditable=_44;
}
}),new objj_method(sel_getUid("isEditable"),function(_45,_46){
with(_45){
return _isEditable;
}
}),new objj_method(sel_getUid("setSortDescriptorPrototype:"),function(_47,_48,_49){
with(_47){
_sortDescriptorPrototype=_49;
}
}),new objj_method(sel_getUid("sortDescriptorPrototype"),function(_4a,_4b){
with(_4a){
return _sortDescriptorPrototype;
}
}),new objj_method(sel_getUid("setHidden:"),function(_4c,_4d,_4e){
with(_4c){
_isHidden=_4e;
}
}),new objj_method(sel_getUid("isHidden"),function(_4f,_50){
with(_4f){
return _isHidden;
}
}),new objj_method(sel_getUid("setHeaderToolTip:"),function(_51,_52,_53){
with(_51){
_headerToolTip=_53;
}
}),new objj_method(sel_getUid("headerToolTip"),function(_54,_55){
with(_54){
return _headerToolTip;
}
})]);
var _1=objj_getClass("NEWCPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"NEWCPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setHeaderCell:"),function(_56,_57,_58){
with(_56){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("headerCell"),function(_59,_5a){
with(_59){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"headCell is not supported. -headerView instead.");
}
}),new objj_method(sel_getUid("setDataCell:"),function(_5b,_5c,_5d){
with(_5b){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("dataCell"),function(_5e,_5f){
with(_5e){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCell is not supported. Use -dataCell instead.");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_60,_61,row){
with(_60){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
})]);
