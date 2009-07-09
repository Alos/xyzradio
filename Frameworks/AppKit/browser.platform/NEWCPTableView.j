I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.jc;25409;
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
var _1b=objj_allocateClassPair(CPControl,"NEWCPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPControl")},"initWithFrame:",_1f);
if(_1d){
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
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_1d,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_1d);
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
}
return _1d;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_20,_21,_22){
with(_20){
if(_dataSource===_22){
return;
}
_dataSource=_22;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_22,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_22,"description")+" does not implement tableView:objectValueForTableColumn:row:");
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
objj_msgSend(_20,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_23,_24){
with(_23){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadData"),function(_25,_26){
with(_25){
if(!_dataSource){
return;
}
_objectValues={};
objj_msgSend(_25,"noteNumberOfRowsChanged");
objj_msgSend(_25,"_sizeToParent");
objj_msgSend(_25,"layoutSubviews");
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_27,_28,_29){
with(_27){
_doubleAction=_29;
}
}),new objj_method(sel_getUid("doubleAction"),function(_2a,_2b){
with(_2a){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_2c,_2d,_2e){
with(_2c){
_allowsColumnReordering=!!_2e;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_2f,_30){
with(_2f){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_31,_32,_33){
with(_31){
_allowsColumnResizing=!!_33;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_34,_35){
with(_34){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_36,_37,_38){
with(_36){
_allowsMultipleSelection=!!_38;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_39,_3a){
with(_39){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_3b,_3c,_3d){
with(_3b){
_allowsEmptySelection=!!_3d;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_3e,_3f){
with(_3e){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_40,_41,_42){
with(_40){
_allowsColumnSelection=!!_42;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_43,_44){
with(_43){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_45,_46,_47){
with(_45){
if((_intercellSpacing.width==_47.width&&_intercellSpacing.height==_47.height)){
return;
}
_intercellSpacing={width:_47.width,height:_47.height};
objj_msgSend(_45,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_48,_49,_4a){
with(_48){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_4b,_4c){
with(_4b){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_4d,_4e,_4f){
with(_4d){
_4f=+_4f;
if(_rowHeight===_4f){
return;
}
_rowHeight=_4f;
objj_msgSend(_4d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_50,_51){
with(_50){
return _rowHeight;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_52,_53,_54){
with(_52){
objj_msgSend(_tableColumns,"addObject:",_54);
objj_msgSend(_54,"setTableView:",_52);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_52,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_55,_56,_57){
with(_55){
if(objj_msgSend(_57,"tableView")!==_55){
return;
}
var _58=objj_msgSend(_tableColumns,"indeOfObjectIdenticalTo:",_57);
if(_58===CPNotFound){
return;
}
objj_msgSend(_57,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_58);
var _59=objj_msgSend(_57,"UID");
if(_objectValues[_59]){
_objectValues[_59]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_58;
}else{
_dirtyTableColumnRangeIndex=MIN(_58,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_55,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_5a,_5b,_5c,_5d){
with(_5a){
_5c=+_5c;
_5d=+_5d;
if(_5c===_5d){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_5c,_5d);
}else{
_dirtyTableColumnRangeIndex=MIN(_5c,_5d,_dirtyTableColumnRangeIndex);
}
if(_5d>_5c){
--_5d;
}
var _5e=_tableColumns[_5c];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_5c);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_5e,_5d);
objj_msgSend(_5a,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_5f,_60){
with(_5f){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_61,_62,_63){
with(_61){
var _64=0,_65=(_tableColumns.length);
for(;_64<_65;++_64){
if(objj_msgSend(_tableColumns,"identifier")===_63){
return _64;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_66,_67,_68){
with(_66){
var _69=objj_msgSend(_66,"columnWithIdentifier:",_68);
if(_69===CPNotFound){
return nil;
}
return _tableColumns[_69];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_6a,_6b,_6c,_6d){
with(_6a){
if(_6d){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_6c);
}else{
_selectedColumnIndexes=objj_msgSend(_6c,"copy");
}
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_6e,_6f,_70,_71){
with(_6e){
if(_71){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_70);
}else{
_selectedRowIndexes=objj_msgSend(_70,"copy");
}
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_72,_73){
with(_72){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_74,_75){
with(_74){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_78);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_79,_7a,_7b){
with(_79){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_7b);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_7c,_7d){
with(_7c){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_7e,_7f){
with(_7e){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_80,_81,_82){
with(_80){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_82);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_83,_84,_85){
with(_83){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_85);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_86,_87){
with(_86){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_88,_89){
with(_88){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_88);
}
}),new objj_method(sel_getUid("headerView"),function(_8a,_8b){
with(_8a){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_8c,_8d,_8e){
with(_8c){
_headerView=_8e;
objj_msgSend(_headerView,"setTableView:",_8c);
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_8f,_90){
with(_8f){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _91=_dirtyTableColumnRangeIndex,_92=(_tableColumns.length),x=_91===0?0:CPMaxRange(_tableColumnRanges[_91-1]);
for(;_91<_92;++_91){
var _94=_tableColumns[_91];
if(objj_msgSend(_94,"isHidden")){
_tableColumnRanges[_91]=CPMakeRange(x,0);
}else{
var _95=objj_msgSend(_tableColumns[_91],"width");
_tableColumnRanges[_91]=CPMakeRange(x,_95);
x+=_95;
}
}
_tableColumnRanges.length=_92;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_96,_97,_98){
with(_96){
_98=+_98;
if(_98<0||_98>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_96,"_recalculateTableColumnRanges");
}
var _99=_tableColumnRanges[_98];
return {origin:{x:_99.location,y:0},size:{width:_99.length,height:CGRectGetHeight(objj_msgSend(_96,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_9a,_9b,_9c){
with(_9a){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_9c*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_9a,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=nil,_a1=objj_msgSend(_9d,"rowAtPoint:",_9f.origin),_a2=objj_msgSend(_9d,"rowAtPoint:",{x:0,y:(_9f.origin.y+_9f.size.height)});
if(_a1<0){
_a0=objj_msgSend(_9d,"bounds");
if((_9f.origin.y)<(_a0.origin.y)){
_a1=0;
}else{
_a1=_numberOfRows-1;
}
}
if(_a2<0){
if(!_a0){
_a0=objj_msgSend(_9d,"bounds");
}
if((_9f.origin.y+_9f.size.height)<(_a0.origin.y)){
_a2=0;
}else{
_a2=_numberOfRows-1;
}
}
return CPMakeRange(_a1,_a2-_a1+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_a3,_a4,_a5){
with(_a3){
var _a6=MAX(0,objj_msgSend(_a3,"columnAtPoint:",{x:_a5.origin.x,y:0})),_a7=objj_msgSend(_a3,"columnAtPoint:",{x:(_a5.origin.x+_a5.size.width),y:0});
if(_a7===CPNotFound){
_a7=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_a6,_a7-_a6+1));
}
var _a8=objj_msgSend(CPIndexSet,"indexSet");
for(;_a6<=_a7;++_a6){
var _a9=_tableColumns[_a6];
if(!objj_msgSend(_a9,"isHidden")){
objj_msgSend(_a8,"addIndex:",_a6);
}
}
return _a8;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_aa,_ab,_ac){
with(_aa){
var _ad=objj_msgSend(_aa,"bounds");
if(!(_ac.x>=(_ad.origin.x)&&_ac.y>=(_ad.origin.y)&&_ac.x<(_ad.origin.x+_ad.size.width)&&_ac.y<(_ad.origin.y+_ad.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_aa,"_recalculateTableColumnRanges");
}
var x=_ac.x,low=0,_b0=_tableColumnRanges.length-1;
while(low<=_b0){
var _b1=FLOOR(low+(_b0-low)/2),_b2=_tableColumnRanges[_b1];
if(x<_b2.location){
_b0=_b1-1;
}else{
if(x>=CPMaxRange(_b2)){
low=_b1+1;
}else{
var _b3=_tableColumnRanges.length;
while(_b1<_b3&&objj_msgSend(_tableColumns[_b1],"isHidden")){
++_b1;
}
if(_b1<_b3){
return _b1;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_b4,_b5,_b6){
with(_b4){
var y=_b6.y;
if(NO){
}
return FLOOR(y/(_rowHeight+_intercellSpacing.height));
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_b8,_b9,_ba,_bb){
with(_b8){
var _bc=_tableColumns[_ba],_bd=objj_msgSend(_b8,"rectOfRow:",_bb);
return {origin:{x:_bc.location,y:(_bd.origin.y)},size:{width:_bc.length,height:(_bd.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_be,_bf){
with(_be){
var _c0=objj_msgSend(_be,"superview");
if(!_c0){
return;
}
var _c1=objj_msgSend(_c0,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_be,"_recalculateTableColumnRanges");
}
var _c2=(_tableColumns.length);
while(_c2--&&objj_msgSend(_tableColumns[_c2],"isHidden")){
}
if(_c2>=0){
var _c3=_c1.width-CPMaxRange(_tableColumnRanges[_c2]),_c4=_tableColumns[_c2];
objj_msgSend(_c4,"setWidth:",MAX(0,objj_msgSend(_c4,"width")+_c3));
}
objj_msgSend(_be,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_c5,_c6){
with(_c5){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_c5);
objj_msgSend(_c5,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_sizeToParent"),function(_c7,_c8){
with(_c7){
var _c9=objj_msgSend(objj_msgSend(_c7,"superview"),"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_c7,"_recalculateTableColumnRanges");
}
if(_tableColumnRanges.length>0){
var _ca=CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject"));
}else{
var _ca=0;
}
objj_msgSend(_c7,"setFrameSize:",{width:MAX(_c9.width,_ca),height:MAX(_c9.height,(_rowHeight+_intercellSpacing.height)*_numberOfRows)});
}
}),new objj_method(sel_getUid("setDelegate:"),function(_cb,_cc,_cd){
with(_cb){
if(_delegate===_cd){
return;
}
var _ce=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_ce,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_cb);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_ce,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_cb);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_ce,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_cb);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_ce,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_cb);
}
}
_delegate=_cd;
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
objj_msgSend(_ce,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_cb);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_ce,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_cb);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_ce,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_cb);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_ce,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_cb);
}
}
}),new objj_method(sel_getUid("delegate"),function(_cf,_d0){
with(_cf){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_d1,_d2,_d3,_d4){
with(_d1){
var _d5=objj_msgSend(_d3,"UID"),_d6=_objectValues[_d5];
if(!_d6){
_d6=[];
_objectValues[_d5]=_d6;
}
var _d7=_d6[_d4];
if(_d7===undefined){
_d7=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_d1,_d3,_d4);
_d6[_d4]=_d7;
}
return _d7;
}
}),new objj_method(sel_getUid("_exposedRect"),function(_d8,_d9){
with(_d8){
var _da=objj_msgSend(_d8,"superview");
if(!objj_msgSend(_da,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(_d8,"bounds");
}
return objj_msgSend(_d8,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_da,"bounds"),objj_msgSend(_d8,"frame")),_da);
}
}),new objj_method(sel_getUid("load"),function(_db,_dc){
with(_db){
if(!_dataSource){
return;
}
if(window.console&&window.console.profile){
console.profile("cell-load");
}
var _dd=objj_msgSend(_db,"_exposedRect"),_de=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(_db,"rowsInRect:",_dd)),_df=objj_msgSend(_db,"columnIndexesInRect:",_dd),_e0=objj_msgSend(_exposedRows,"copy"),_e1=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_e0,"removeIndexes:",_de);
objj_msgSend(_e1,"removeIndexes:",_df);
var _e2=objj_msgSend(_de,"copy"),_e3=objj_msgSend(_df,"copy");
objj_msgSend(_e2,"removeIndexes:",_exposedRows);
objj_msgSend(_e3,"removeIndexes:",_exposedColumns);
var _e4=objj_msgSend(_de,"copy"),_e5=objj_msgSend(_df,"copy");
objj_msgSend(_e4,"removeIndexes:",_e2);
objj_msgSend(_e5,"removeIndexes:",_e3);
objj_msgSend(_db,"_unloadDataViewsInRows:columns:",_e4,_e1);
objj_msgSend(_db,"_unloadDataViewsInRows:columns:",_e0,_e5);
objj_msgSend(_db,"_unloadDataViewsInRows:columns:",_e0,_e1);
objj_msgSend(_db,"_loadDataViewsInRows:columns:",_e4,_e3);
objj_msgSend(_db,"_loadDataViewsInRows:columns:",_e2,_e5);
objj_msgSend(_db,"_loadDataViewsInRows:columns:",_e2,_e3);
_exposedRows=_de;
_exposedColumns=_df;
if(window.console&&window.console.profile){
console.profileEnd("cell-load");
}
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(_e6,_e7,_e8,_e9){
with(_e6){
if(!objj_msgSend(_e8,"count")||!objj_msgSend(_e9,"count")){
return;
}
var _ea=[],_eb=[];
objj_msgSend(_e8,"getIndexes:maxCount:inIndexRange:",_ea,-1,nil);
objj_msgSend(_e9,"getIndexes:maxCount:inIndexRange:",_eb,-1,nil);
var _ec=0,_ed=_eb.length;
for(;_ec<_ed;++_ec){
var _ee=_eb[_ec],_ef=_tableColumns[_ee],_f0=objj_msgSend(_ef,"UID");
var _f1=0,_f2=_ea.length;
for(;_f1<_f2;++_f1){
var row=_ea[_f1],_f4=_dataViewsForTableColumns[_f0][row];
_dataViewsForTableColumns[_f0][row]=nil;
if(!_cachedDataViews[_f4.identifier]){
_cachedDataViews[_f4.identifier]=[_f4];
}else{
_cachedDataViews[_f4.identifier].push(_f4);
}
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(_f5,_f6,_f7,_f8){
with(_f5){
if(!objj_msgSend(_f7,"count")||!objj_msgSend(_f8,"count")){
return;
}
var _f9=[],_fa=[],_fb=[];
objj_msgSend(_f7,"getIndexes:maxCount:inIndexRange:",_f9,-1,nil);
objj_msgSend(_f8,"getIndexes:maxCount:inIndexRange:",_fb,-1,nil);
var _fc=0,_fd=_fb.length;
for(;_fc<_fd;++_fc){
var _fe=_fb[_fc],_ff=_tableColumns[_fe],_100=objj_msgSend(_ff,"UID"),_101=_tableColumnRanges[_fe];
if(!_dataViewsForTableColumns[_100]){
_dataViewsForTableColumns[_100]=[];
}
var _102=0,_103=_f9.length;
for(;_102<_103;++_102){
var row=_f9[_102],_105=objj_msgSend(_ff,"_newDataViewForRow:",row),_106=_fa[row];
if(!_106){
_106=_fa[row]=objj_msgSend(_f5,"rectOfRow:",row);
}
objj_msgSend(_105,"setFrame:",{origin:{x:_101.location,y:(_106.origin.y)},size:{width:_101.length,height:(_106.size.height)}});
objj_msgSend(_105,"setObjectValue:",objj_msgSend(_f5,"_objectValueForTableColumn:row:",_ff,row));
if(objj_msgSend(_105,"superview")!==_f5){
objj_msgSend(_f5,"addSubview:",_105);
}
_dataViewsForTableColumns[_100][row]=_105;
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_109){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_109);
objj_msgSend(_headerView,"setFrameSize:",CGSizeMake(_109.width,objj_msgSend(_headerView,"frame").size.height));
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_cmd,_10e){
with(self){
var _10f=objj_msgSend(self,"superview"),_110=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_10f){
objj_msgSend(_110,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_10f);
objj_msgSend(_110,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_10f);
}
if(_10e){
objj_msgSend(_10e,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_10e,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_110,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_10e);
objj_msgSend(_110,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_10e);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_cmd,_113){
with(self){
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_cmd,_116){
with(self){
}
})]);
