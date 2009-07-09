I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;33425;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
var _1b=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithTableView:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPView")},"init");
if(_1d){
_tableView=_1f;
}
return _1d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"frame"),_24=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_24,-(_23.origin.x),-(_23.origin.y));
objj_msgSend(_tableView,"_drawRect:",_22);
}
})]);
var _1b=objj_allocateClassPair(CPControl,"CPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_tableDrawView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPControl")},"initWithFrame:",_27);
if(_25){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_tableViewFlags=0;
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_intercellSpacing={width:0,height:0};
_rowHeight=24;
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_25,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_25);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_25);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"yellowColor"));
objj_msgSend(_25,"addSubview:",_tableDrawView);
}
return _25;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_28,_29,_2a){
with(_28){
if(_dataSource===_2a){
return;
}
_dataSource=_2a;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_5;
}
objj_msgSend(_28,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2b,_2c){
with(_2b){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadData"),function(_2d,_2e){
with(_2d){
if(!_dataSource){
return;
}
_objectValues={};
objj_msgSend(_2d,"noteNumberOfRowsChanged");
objj_msgSend(_2d,"_sizeToParent");
objj_msgSend(_2d,"layoutSubviews");
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_2f,_30,_31){
with(_2f){
_doubleAction=_31;
}
}),new objj_method(sel_getUid("doubleAction"),function(_32,_33){
with(_32){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_34,_35,_36){
with(_34){
_allowsColumnReordering=!!_36;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_37,_38){
with(_37){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_39,_3a,_3b){
with(_39){
_allowsColumnResizing=!!_3b;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_3c,_3d){
with(_3c){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_3e,_3f,_40){
with(_3e){
_allowsMultipleSelection=!!_40;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_41,_42){
with(_41){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_43,_44,_45){
with(_43){
_allowsEmptySelection=!!_45;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_46,_47){
with(_46){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_48,_49,_4a){
with(_48){
_allowsColumnSelection=!!_4a;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_4b,_4c){
with(_4b){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_4d,_4e,_4f){
with(_4d){
if((_intercellSpacing.width==_4f.width&&_intercellSpacing.height==_4f.height)){
return;
}
_intercellSpacing={width:_4f.width,height:_4f.height};
objj_msgSend(_4d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_50,_51,_52){
with(_50){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_53,_54){
with(_53){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_55,_56,_57){
with(_55){
_57=+_57;
if(_rowHeight===_57){
return;
}
_rowHeight=_57;
objj_msgSend(_55,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_58,_59){
with(_58){
return _rowHeight;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_5a,_5b,_5c){
with(_5a){
objj_msgSend(_tableColumns,"addObject:",_5c);
objj_msgSend(_5c,"setTableView:",_5a);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_5a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_5d,_5e,_5f){
with(_5d){
if(objj_msgSend(_5f,"tableView")!==_5d){
return;
}
var _60=objj_msgSend(_tableColumns,"indeOfObjectIdenticalTo:",_5f);
if(_60===CPNotFound){
return;
}
objj_msgSend(_5f,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_60);
var _61=objj_msgSend(_5f,"UID");
if(_objectValues[_61]){
_objectValues[_61]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_60;
}else{
_dirtyTableColumnRangeIndex=MIN(_60,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_5d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_62,_63,_64,_65){
with(_62){
_64=+_64;
_65=+_65;
if(_64===_65){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_64,_65);
}else{
_dirtyTableColumnRangeIndex=MIN(_64,_65,_dirtyTableColumnRangeIndex);
}
if(_65>_64){
--_65;
}
var _66=_tableColumns[_64];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_64);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_66,_65);
objj_msgSend(_62,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_67,_68){
with(_67){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_69,_6a,_6b){
with(_69){
var _6c=0,_6d=(_tableColumns.length);
for(;_6c<_6d;++_6c){
if(objj_msgSend(_tableColumns,"identifier")===_6b){
return _6c;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_6e,"columnWithIdentifier:",_70);
if(_71===CPNotFound){
return nil;
}
return _tableColumns[_71];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_72,_73,_74,_75){
with(_72){
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_75){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_74);
}else{
_selectedColumnIndexes=objj_msgSend(_74,"copy");
}
objj_msgSend(_72,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_76,_77,_78,_79){
with(_76){
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_79){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_78);
}else{
_selectedRowIndexes=objj_msgSend(_78,"copy");
}
objj_msgSend(_76,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_7a,_7b){
with(_7a){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_7c,_7d){
with(_7c){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_7e,_7f,_80){
with(_7e){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_80);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_81,_82,_83){
with(_81){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_83);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_84,_85){
with(_84){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_86,_87){
with(_86){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_88,_89,_8a){
with(_88){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_8a);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_8b,_8c,_8d){
with(_8b){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_8d);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_8e,_8f){
with(_8e){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_90,_91){
with(_90){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_90);
}
}),new objj_method(sel_getUid("cornerView"),function(_92,_93){
with(_92){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(_94,_95,_96){
with(_94){
_cornerView=_96;
}
}),new objj_method(sel_getUid("headerView"),function(_97,_98){
with(_97){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_99,_9a,_9b){
with(_99){
_headerView=_9b;
objj_msgSend(_headerView,"setTableView:",_99);
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_9c,_9d){
with(_9c){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _9e=_dirtyTableColumnRangeIndex,_9f=(_tableColumns.length),x=_9e===0?0:CPMaxRange(_tableColumnRanges[_9e-1]);
for(;_9e<_9f;++_9e){
var _a1=_tableColumns[_9e];
if(objj_msgSend(_a1,"isHidden")){
_tableColumnRanges[_9e]=CPMakeRange(x,0);
}else{
var _a2=objj_msgSend(_tableColumns[_9e],"width");
_tableColumnRanges[_9e]=CPMakeRange(x,_a2);
x+=_a2;
}
}
_tableColumnRanges.length=_9f;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_a3,_a4,_a5){
with(_a3){
_a5=+_a5;
if(_a5<0||_a5>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_a3,"_recalculateTableColumnRanges");
}
var _a6=_tableColumnRanges[_a5];
return {origin:{x:_a6.location,y:0},size:{width:_a6.length,height:CGRectGetHeight(objj_msgSend(_a3,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_a7,_a8,_a9){
with(_a7){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_a9*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_a7,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_aa,_ab,_ac){
with(_aa){
var _ad=nil,_ae=objj_msgSend(_aa,"rowAtPoint:",_ac.origin),_af=objj_msgSend(_aa,"rowAtPoint:",{x:0,y:(_ac.origin.y+_ac.size.height)});
if(_ae<0){
_ad=objj_msgSend(_aa,"bounds");
if((_ac.origin.y)<(_ad.origin.y)){
_ae=0;
}else{
_ae=_numberOfRows-1;
}
}
if(_af<0){
if(!_ad){
_ad=objj_msgSend(_aa,"bounds");
}
if((_ac.origin.y+_ac.size.height)<(_ad.origin.y)){
_af=0;
}else{
_af=_numberOfRows-1;
}
}
return CPMakeRange(_ae,_af-_ae+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_b0,_b1,_b2){
with(_b0){
var _b3=MAX(0,objj_msgSend(_b0,"columnAtPoint:",{x:_b2.origin.x,y:0})),_b4=objj_msgSend(_b0,"columnAtPoint:",{x:(_b2.origin.x+_b2.size.width),y:0});
if(_b4===CPNotFound){
_b4=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_b3,_b4-_b3+1));
}
var _b5=objj_msgSend(CPIndexSet,"indexSet");
for(;_b3<=_b4;++_b3){
var _b6=_tableColumns[_b3];
if(!objj_msgSend(_b6,"isHidden")){
objj_msgSend(_b5,"addIndex:",_b3);
}
}
return _b5;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_b7,_b8,_b9){
with(_b7){
var _ba=objj_msgSend(_b7,"bounds");
if(!(_b9.x>=(_ba.origin.x)&&_b9.y>=(_ba.origin.y)&&_b9.x<(_ba.origin.x+_ba.size.width)&&_b9.y<(_ba.origin.y+_ba.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_b7,"_recalculateTableColumnRanges");
}
var x=_b9.x,low=0,_bd=_tableColumnRanges.length-1;
while(low<=_bd){
var _be=FLOOR(low+(_bd-low)/2),_bf=_tableColumnRanges[_be];
if(x<_bf.location){
_bd=_be-1;
}else{
if(x>=CPMaxRange(_bf)){
low=_be+1;
}else{
var _c0=_tableColumnRanges.length;
while(_be<_c0&&objj_msgSend(_tableColumns[_be],"isHidden")){
++_be;
}
if(_be<_c0){
return _be;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_c1,_c2,_c3){
with(_c1){
var y=_c3.y;
if(NO){
}
return FLOOR(y/(_rowHeight+_intercellSpacing.height));
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_c5,_c6,_c7,_c8){
with(_c5){
var _c9=_tableColumns[_c7],_ca=objj_msgSend(_c5,"rectOfRow:",_c8);
return {origin:{x:_c9.location,y:(_ca.origin.y)},size:{width:_c9.length,height:(_ca.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_cb,_cc){
with(_cb){
var _cd=objj_msgSend(_cb,"superview");
if(!_cd){
return;
}
var _ce=objj_msgSend(_cd,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_cb,"_recalculateTableColumnRanges");
}
var _cf=(_tableColumns.length);
while(_cf--&&objj_msgSend(_tableColumns[_cf],"isHidden")){
}
if(_cf>=0){
var _d0=_ce.width-CPMaxRange(_tableColumnRanges[_cf]),_d1=_tableColumns[_cf];
objj_msgSend(_d1,"setWidth:",MAX(0,objj_msgSend(_d1,"width")+_d0));
}
objj_msgSend(_cb,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_d2,_d3){
with(_d2){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_d2);
objj_msgSend(_d2,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_sizeToParent"),function(_d4,_d5){
with(_d4){
var _d6=objj_msgSend(objj_msgSend(_d4,"superview"),"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_d4,"_recalculateTableColumnRanges");
}
if(_tableColumnRanges.length>0){
var _d7=CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject"));
}else{
var _d7=0;
}
objj_msgSend(_d4,"setFrameSize:",{width:MAX(_d6.width,_d7),height:MAX(_d6.height,(_rowHeight+_intercellSpacing.height)*_numberOfRows)});
}
}),new objj_method(sel_getUid("setDelegate:"),function(_d8,_d9,_da){
with(_d8){
if(_delegate===_da){
return;
}
var _db=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_db,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_d8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_db,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_d8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_db,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_d8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_db,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_d8);
}
}
_delegate=_da;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_db,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_d8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_db,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_d8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_db,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_d8);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_db,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_d8);
}
}
}),new objj_method(sel_getUid("delegate"),function(_dc,_dd){
with(_dc){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_de,_df,_e0,_e1){
with(_de){
var _e2=objj_msgSend(_e0,"UID"),_e3=_objectValues[_e2];
if(!_e3){
_e3=[];
_objectValues[_e2]=_e3;
}
var _e4=_e3[_e1];
if(_e4===undefined){
_e4=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_de,_e0,_e1);
_e3[_e1]=_e4;
}
return _e4;
}
}),new objj_method(sel_getUid("_exposedRect"),function(_e5,_e6){
with(_e5){
var _e7=objj_msgSend(_e5,"superview");
if(!objj_msgSend(_e7,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(_e5,"bounds");
}
return objj_msgSend(_e5,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_e7,"bounds"),objj_msgSend(_e5,"frame")),_e7);
}
}),new objj_method(sel_getUid("load"),function(_e8,_e9){
with(_e8){
if(!_dataSource){
return;
}
if(window.console&&window.console.profile){
console.profile("cell-load");
}
var _ea=objj_msgSend(_e8,"_exposedRect"),_eb=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(_e8,"rowsInRect:",_ea)),_ec=objj_msgSend(_e8,"columnIndexesInRect:",_ea),_ed=objj_msgSend(_exposedRows,"copy"),_ee=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_ed,"removeIndexes:",_eb);
objj_msgSend(_ee,"removeIndexes:",_ec);
var _ef=objj_msgSend(_eb,"copy"),_f0=objj_msgSend(_ec,"copy");
objj_msgSend(_ef,"removeIndexes:",_exposedRows);
objj_msgSend(_f0,"removeIndexes:",_exposedColumns);
var _f1=objj_msgSend(_eb,"copy"),_f2=objj_msgSend(_ec,"copy");
objj_msgSend(_f1,"removeIndexes:",_ef);
objj_msgSend(_f2,"removeIndexes:",_f0);
objj_msgSend(_e8,"_unloadDataViewsInRows:columns:",_f1,_ee);
objj_msgSend(_e8,"_unloadDataViewsInRows:columns:",_ed,_f2);
objj_msgSend(_e8,"_unloadDataViewsInRows:columns:",_ed,_ee);
objj_msgSend(_e8,"_loadDataViewsInRows:columns:",_f1,_f0);
objj_msgSend(_e8,"_loadDataViewsInRows:columns:",_ef,_f2);
objj_msgSend(_e8,"_loadDataViewsInRows:columns:",_ef,_f0);
_exposedRows=_eb;
_exposedColumns=_ec;
objj_msgSend(_tableDrawView,"setFrame:",_ea);
objj_msgSend(_tableDrawView,"display");
if(window.console&&window.console.profile){
console.profileEnd("cell-load");
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(_f3,_f4,_f5,_f6){
with(_f3){
if(!objj_msgSend(_f5,"count")||!objj_msgSend(_f6,"count")){
return;
}
var _f7=[],_f8=[];
objj_msgSend(_f5,"getIndexes:maxCount:inIndexRange:",_f7,-1,nil);
objj_msgSend(_f6,"getIndexes:maxCount:inIndexRange:",_f8,-1,nil);
var _f9=0,_fa=_f8.length;
for(;_f9<_fa;++_f9){
var _fb=_f8[_f9],_fc=_tableColumns[_fb],_fd=objj_msgSend(_fc,"UID");
var _fe=0,_ff=_f7.length;
for(;_fe<_ff;++_fe){
var row=_f7[_fe],_101=_dataViewsForTableColumns[_fd][row];
_dataViewsForTableColumns[_fd][row]=nil;
if(!_cachedDataViews[_101.identifier]){
_cachedDataViews[_101.identifier]=[_101];
}else{
_cachedDataViews[_101.identifier].push(_101);
}
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_cmd,rows,_105){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_105,"count")){
return;
}
var _106=[],_107=[],_108=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_106,-1,nil);
objj_msgSend(_105,"getIndexes:maxCount:inIndexRange:",_108,-1,nil);
var _109=0,_10a=_108.length;
for(;_109<_10a;++_109){
var _10b=_108[_109],_10c=_tableColumns[_10b],_10d=objj_msgSend(_10c,"UID"),_10e=_tableColumnRanges[_10b];
if(!_dataViewsForTableColumns[_10d]){
_dataViewsForTableColumns[_10d]=[];
}
var _10f=0,_110=_106.length;
for(;_10f<_110;++_10f){
var row=_106[_10f],_112=objj_msgSend(_10c,"_newDataViewForRow:",row),_113=_107[row];
if(!_113){
_113=_107[row]=objj_msgSend(self,"rectOfRow:",row);
}
objj_msgSend(_112,"setFrame:",{origin:{x:_10e.location,y:(_113.origin.y)},size:{width:_10e.length,height:(_113.size.height)}});
objj_msgSend(_112,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_10c,row));
if(objj_msgSend(_112,"superview")!==self){
objj_msgSend(self,"addSubview:",_112);
}
_dataViewsForTableColumns[_10d][row]=_112;
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_116){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_116);
objj_msgSend(_headerView,"setFrameSize:",CGSizeMake(_116.width,objj_msgSend(_headerView,"frame").size.height));
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_cmd,_119){
with(self){
objj_msgSend(self,"highlightSelectionInClipRect:",objj_msgSend(self,"_exposedRect"));
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_cmd,_11c){
with(self){
objj_msgSend(objj_msgSend(CPColor,"alternateSelectedControlColor"),"set");
var _11d=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _11e=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_11c)),_11f=CPMakeRange(objj_msgSend(_11e,"firstIndex"),objj_msgSend(_11e,"lastIndex")-objj_msgSend(_11e,"firstIndex")+1),_120=[];
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_120,-1,_11f);
var _121=0,_122=_120.length;
for(;_121<_122;++_121){
CGContextFillRect(_11d,objj_msgSend(self,"rectOfRow:",_120[_121]));
}
}else{
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_cmd,_127){
with(self){
var _128=objj_msgSend(self,"superview"),_129=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_128){
objj_msgSend(_129,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_128);
objj_msgSend(_129,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_128);
}
if(_127){
objj_msgSend(_127,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_127,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_129,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_127);
objj_msgSend(_129,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_127);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_cmd,_12c){
with(self){
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_cmd,_12f){
with(self){
objj_msgSend(self,"_sizeToParent");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_cmd){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_cmd,_134){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_134);
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_cmd,_138,_139){
with(self){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",objj_msgSend(self,"rowAtPoint:",_139));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_cmd,_13c,_13d,_13e){
with(self){
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_cmd,aRow){
with(self){
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"addIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
}else{
if(aRow>=0&&aRow<_numberOfRows){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_7&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_f){
newSelection=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,newSelection);
}
if(_implementedDelegateMethods&_11){
var _142=[];
objj_msgSend(newSelection,"getIndexes:maxCount:inIndexRange:",_142,-1,nil);
var _143=_142.length;
while(_143--){
var _144=_142[_143];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_144)){
objj_msgSend(newSelection,"removeIndex:",_144);
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(newSelection,"count")===0){
return;
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",newSelection,NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
})]);
var _145="CPTableViewDataSourceKey",_146="CPTableViewDelegateKey",_147="CPTableViewHeaderViewKey",_148="CPTableViewTableColumnsKey",_149="CPTableViewRowHeightKey",_14a="CPTableViewIntercellSpacingKey",_14b="CPTableViewMultipleSelectionKey",_14c="CPTableViewEmptySelectionKey";
var _1b=objj_getClass("CPTableView");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_14f){
with(self){
objj_msgSend(self,"init");
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"initWithCoder:",_14f);
if(self){
_dataSource=objj_msgSend(_14f,"decodeObjectForKey:",_145);
_delegate=objj_msgSend(_14f,"decodeObjectForKey:",_146);
_rowHeight=objj_msgSend(_14f,"decodeFloatForKey:",_149);
_intercellSpacing=objj_msgSend(_14f,"decodeSizeForKey:",_14a);
_allowsMultipleSelection=objj_msgSend(_14f,"decodeBoolForKey:",_14b);
_allowsEmptySelection=objj_msgSend(_14f,"decodeBoolForKey:",_14c);
_tableColumns=objj_msgSend(_14f,"decodeObjectForKey:",_148);
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_dirtyTableColumnRangeIndex=0;
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_152){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_152);
objj_msgSend(_152,"encodeObject:forKey:",_dataSource,_145);
objj_msgSend(_152,"encodeObject:forKey:",_delegate,_146);
objj_msgSend(_152,"encodeFloat:forKey:",_rowHeight,_149);
objj_msgSend(_152,"encodeSize:forKey:",_intercellSpacing,_14a);
objj_msgSend(_152,"encodeBool:forKey:",_allowsMultipleSelection,_14b);
objj_msgSend(_152,"encodeBool:forKey:",_allowsEmptySelection,_14c);
objj_msgSend(_152,"encodeObject:forKey:",_tableColumns,_148);
}
})]);
