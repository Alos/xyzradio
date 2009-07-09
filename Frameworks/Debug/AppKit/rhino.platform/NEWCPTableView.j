I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.jc;38266;




var CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_ = 1 << 2,

    CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_ = 1 << 3,
    CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_ = 1 << 4,
    CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_ = 1 << 5,
    CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_ = 1 << 6,

    CPTableViewDataSource_tableView_sortDescriptorsDidChange_ = 1 << 7;

var CPTableViewDelegate_selectionShouldChangeInTableView_ = 1 << 0,
    CPTableViewDelegate_tableView_dataViewForTableColumn_row_ = 1 << 1,
    CPTableViewDelegate_tableView_didClickTableColumn_ = 1 << 2,
    CPTableViewDelegate_tableView_didDragTableColumn_ = 1 << 3,
    CPTableViewDelegate_tableView_heightOfRow_ = 1 << 4,
    CPTableViewDelegate_tableView_isGroupRow_ = 1 << 5,
    CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_ = 1 << 6,
    CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_ = 1 << 7,
    CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_ = 1 << 8,
    CPTableViewDelegate_tableView_shouldEditTableColumn_row_ = 1 << 9,
    CPTableViewDelegate_tableView_shouldSelectRow_ = 1 << 10,
    CPTableViewDelegate_tableView_shouldSelectTableColumn_ = 1 << 11,
    CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_ = 1 << 12,
    CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_ = 1 << 13,
    CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_ = 1 << 14,
    CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_ = 1 << 15,
    CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_ = 1 << 16,
    CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_ = 1 << 17,
    CPTableViewDelegate_tableViewSelectionDidChange_ = 1 << 18,
    CPTableViewDelegate_tableViewSelectionIsChanging_ = 1 << 19;
{var the_class = objj_allocateClassPair(CPControl, "NEWCPTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_implementedDataSourceMethods"), new objj_ivar("_delegate"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_tableColumns"), new objj_ivar("_tableColumnRanges"), new objj_ivar("_dirtyTableColumnRangeIndex"), new objj_ivar("_numberOfHiddenColumns"), new objj_ivar("_objectValues"), new objj_ivar("_exposedRows"), new objj_ivar("_exposedColumns"), new objj_ivar("_dataViewsForTableColumns"), new objj_ivar("_cachedDataViews"), new objj_ivar("_allowsColumnReordering"), new objj_ivar("_allowsColumnResizing"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_intercellSpacing"), new objj_ivar("_rowHeight"), new objj_ivar("_usesAlternatingRowBackgroundColors"), new objj_ivar("_selectionHighlightMask"), new objj_ivar("_currentHighlightedTableColumn"), new objj_ivar("_numberOfRows"), new objj_ivar("_headerView"), new objj_ivar("_selectedColumnIndexes"), new objj_ivar("_selectedRowIndexes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $NEWCPTableView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _allowsColumnReordering = YES;
        _allowsColumnResizing = YES;
        _allowsMultipleSelection = NO;
        _allowsEmptySelection = YES;
        _allowsColumnSelection = NO;
        _tableViewFlags = 0;
        _tableColumns = [];
        _tableColumnRanges = [];
        _dirtyTableColumnRangeIndex = CPNotFound;
        _numberOfHiddenColumns = 0;
        _objectValues = { };
        _dataViewsForTableColumns = { };
        _dataViews= [];
        _numberOfRows = 0;
        _exposedRows = objj_msgSend(CPIndexSet, "indexSet");
        _exposedColumns = objj_msgSend(CPIndexSet, "indexSet");
        _cachedDataViews = { };
        _intercellSpacing = { width:0.0, height:0.0 };
        _rowHeight = 24.0;
        _headerView = objj_msgSend(objj_msgSend(CPTableHeaderView, "alloc"), "initWithFrame:", CGRectMake(0, 0, objj_msgSend(self, "bounds").size.width, _rowHeight));
        objj_msgSend(_headerView, "setTableView:", self);
        _selectedColumnIndexes = objj_msgSend(CPIndexSet, "indexSet");
        _selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    }
    return self;
}
}), new objj_method(sel_getUid("setDataSource:"), function $NEWCPTableView__setDataSource_(self, _cmd, aDataSource)
{ with(self)
{
    if (_dataSource === aDataSource)
        return;
    _dataSource = aDataSource;
    _implementedDataSourceMethods = 0;
    if (!_dataSource)
        return;
    if (!objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("numberOfRowsInTableView:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, objj_msgSend(aDataSource, "description") + " does not implement numberOfRowsInTableView:.");
    if (!objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:objectValueForTableColumn:row:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, objj_msgSend(aDataSource, "description") + " does not implement tableView:objectValueForTableColumn:row:");
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:setObjectValue:forTableColumn:row:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_setObjectValue_forTableColumn_row_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:setObjectValue:forTableColumn:row:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_acceptDrop_row_dropOperation_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_namesOfPromisedFilesDroppedAtDestination_forDraggedRowsWithIndexes_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_validateDrop_proposedRow_proposedDropOperation_;
    if (objj_msgSend(_dataSource, "respondsToSelector:", sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:")))
        _implementedDataSourceMethods |= CPTableViewDataSource_tableView_writeRowsWithIndexes_toPasteboard_;
    objj_msgSend(self, "reloadData");
}
}), new objj_method(sel_getUid("dataSource"), function $NEWCPTableView__dataSource(self, _cmd)
{ with(self)
{
    return _dataSource;
}
}), new objj_method(sel_getUid("reloadData"), function $NEWCPTableView__reloadData(self, _cmd)
{ with(self)
{
    if (!_dataSource)
        return;
    _objectValues = { };
    objj_msgSend(self, "noteNumberOfRowsChanged");
objj_msgSend(self, "_sizeToParent");
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("setDoubleAction:"), function $NEWCPTableView__setDoubleAction_(self, _cmd, anAction)
{ with(self)
{
    _doubleAction = anAction;
}
}), new objj_method(sel_getUid("doubleAction"), function $NEWCPTableView__doubleAction(self, _cmd)
{ with(self)
{
    return _doubleAction;
}
}), new objj_method(sel_getUid("setAllowsColumnReordering:"), function $NEWCPTableView__setAllowsColumnReordering_(self, _cmd, shouldAllowColumnReordering)
{ with(self)
{
    _allowsColumnReordering = !!shouldAllowColumnReordering;
}
}), new objj_method(sel_getUid("allowsColumnReordering"), function $NEWCPTableView__allowsColumnReordering(self, _cmd)
{ with(self)
{
    return _allowsColumnReordering;
}
}), new objj_method(sel_getUid("setAllowsColumnResizing:"), function $NEWCPTableView__setAllowsColumnResizing_(self, _cmd, shouldAllowColumnResizing)
{ with(self)
{
    _allowsColumnResizing = !!shouldAllowColumnResizing;
}
}), new objj_method(sel_getUid("allowsColumnResizing"), function $NEWCPTableView__allowsColumnResizing(self, _cmd)
{ with(self)
{
    return _allowsColumnResizing;
}
}), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function $NEWCPTableView__setAllowsMultipleSelection_(self, _cmd, shouldAllowMultipleSelection)
{ with(self)
{
    _allowsMultipleSelection = !!shouldAllowMultipleSelection;
}
}), new objj_method(sel_getUid("allowsMultipleSelection"), function $NEWCPTableView__allowsMultipleSelection(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
}), new objj_method(sel_getUid("setAllowsEmptySelection:"), function $NEWCPTableView__setAllowsEmptySelection_(self, _cmd, shouldAllowEmptySelection)
{ with(self)
{
    _allowsEmptySelection = !!shouldAllowEmptySelection;
}
}), new objj_method(sel_getUid("allowsEmptySelection"), function $NEWCPTableView__allowsEmptySelection(self, _cmd)
{ with(self)
{
    return _allowsEmptySelection;
}
}), new objj_method(sel_getUid("setAllowsColumnSelection:"), function $NEWCPTableView__setAllowsColumnSelection_(self, _cmd, shouldAllowColumnSelection)
{ with(self)
{
    _allowsColumnSelection = !!shouldAllowColumnSelection;
}
}), new objj_method(sel_getUid("allowsColumnSelection"), function $NEWCPTableView__allowsColumnSelection(self, _cmd)
{ with(self)
{
    return _allowsColumnSelection;
}
}), new objj_method(sel_getUid("setIntercellSpacing:"), function $NEWCPTableView__setIntercellSpacing_(self, _cmd, aSize)
{ with(self)
{
    if ((_intercellSpacing.width == aSize.width && _intercellSpacing.height == aSize.height))
        return;
    _intercellSpacing = { width:aSize.width, height:aSize.height };
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("setThemeState:"), function $NEWCPTableView__setThemeState_(self, _cmd, astae)
{ with(self)
{
}
}), new objj_method(sel_getUid("intercellSpacing"), function $NEWCPTableView__intercellSpacing(self, _cmd)
{ with(self)
{
    return { width:_intercellSpacing.width, height:_intercellSpacing.height };
}
}), new objj_method(sel_getUid("setRowHeight:"), function $NEWCPTableView__setRowHeight_(self, _cmd, aRowHeight)
{ with(self)
{
    aRowHeight = +aRowHeight;
    if (_rowHeight === aRowHeight)
        return;
    _rowHeight = aRowHeight;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("rowHeight"), function $NEWCPTableView__rowHeight(self, _cmd)
{ with(self)
{
    return _rowHeight;
}
}), new objj_method(sel_getUid("addTableColumn:"), function $NEWCPTableView__addTableColumn_(self, _cmd, aTableColumn)
{ with(self)
{
    objj_msgSend(_tableColumns, "addObject:", aTableColumn);
    objj_msgSend(aTableColumn, "setTableView:", self);
    if (_dirtyTableColumnRangeIndex < 0)
        _dirtyTableColumnRangeIndex = (_tableColumns.length) - 1;
    else
        _dirtyTableColumnRangeIndex = MIN((_tableColumns.length) - 1, _dirtyTableColumnRangeIndex);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("removeTableColumn:"), function $NEWCPTableView__removeTableColumn_(self, _cmd, aTableColumn)
{ with(self)
{
    if (objj_msgSend(aTableColumn, "tableView") !== self)
        return;
    var index = objj_msgSend(_tableColumns, "indeOfObjectIdenticalTo:", aTableColumn);
    if (index === CPNotFound)
        return;
    objj_msgSend(aTableColumn, "setTableView:", nil);
    objj_msgSend(_tableColumns, "removeObjectAtIndex:", index);
    var tableColumnUID = objj_msgSend(aTableColumn, "UID");
    if (_objectValues[tableColumnUID])
        _objectValues[tableColumnUID] = nil;
    if (_dirtyTableColumnRangeIndex < 0)
        _dirtyTableColumnRangeIndex = index;
    else
        _dirtyTableColumnRangeIndex = MIN(index, _dirtyTableColumnRangeIndex);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("moveColumn:toColumn:"), function $NEWCPTableView__moveColumn_toColumn_(self, _cmd, fromIndex, toIndex)
{ with(self)
{
    fromIndex = +fromIndex;
    toIndex = +toIndex;
    if (fromIndex === toIndex)
        return;
    if (_dirtyTableColumnRangeIndex < 0)
        _dirtyTableColumnRangeIndex = MIN(fromIndex, toIndex);
    else
        _dirtyTableColumnRangeIndex = MIN(fromIndex, toIndex, _dirtyTableColumnRangeIndex);
    if (toIndex > fromIndex)
        --toIndex;
    var tableColumn = _tableColumns[fromIndex];
    objj_msgSend(_tableColumns, "removeObjectAtIndex:", fromIndex);
    objj_msgSend(_tableColumns, "insertObject:atIndex:", tableColumn, toIndex);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("tableColumns"), function $NEWCPTableView__tableColumns(self, _cmd)
{ with(self)
{
    return _tableColumns;
}
}), new objj_method(sel_getUid("columnWithIdentifier:"), function $NEWCPTableView__columnWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    var index = 0,
        count = (_tableColumns.length);
    for (; index < count; ++index)
        if (objj_msgSend(_tableColumns, "identifier") === anIdentifier)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("tableColumnWithIdentifier:"), function $NEWCPTableView__tableColumnWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    var index = objj_msgSend(self, "columnWithIdentifier:", anIdentifier);
    if (index === CPNotFound)
        return nil;
    return _tableColumns[index];
}
}), new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"), function $NEWCPTableView__selectColumnIndexes_byExtendingSelection_(self, _cmd, columns, shouldExtendSelection)
{ with(self)
{
    if (shouldExtendSelection)
        objj_msgSend(_selectedColumnIndexes, "addIndexes:", columns);
    else
        _selectedColumnIndexes = objj_msgSend(columns, "copy");
}
}), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function $NEWCPTableView__selectRowIndexes_byExtendingSelection_(self, _cmd, rows, shouldExtendSelection)
{ with(self)
{
    if (shouldExtendSelection)
        objj_msgSend(_selectedRowIndexes, "addIndexes:", rows);
    else
        _selectedRowIndexes = objj_msgSend(rows, "copy");
}
}), new objj_method(sel_getUid("selectedColumnIndexes"), function $NEWCPTableView__selectedColumnIndexes(self, _cmd)
{ with(self)
{
    return _selectedColumnIndexes;
}
}), new objj_method(sel_getUid("selectedRowIndexes"), function $NEWCPTableView__selectedRowIndexes(self, _cmd)
{ with(self)
{
    return _selectedRowIndexes;
}
}), new objj_method(sel_getUid("deselectColumn:"), function $NEWCPTableView__deselectColumn_(self, _cmd, aColumn)
{ with(self)
{
    objj_msgSend(_selectedColumnIndexes, "removeIndex:", aColumn);
}
}), new objj_method(sel_getUid("deselectRow:"), function $NEWCPTableView__deselectRow_(self, _cmd, aRow)
{ with(self)
{
    objj_msgSend(_selectedRowIndexes, "removeIndex:", aRow);
}
}), new objj_method(sel_getUid("numberOfSelectedColumns"), function $NEWCPTableView__numberOfSelectedColumns(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectedColumnIndexes, "count");
}
}), new objj_method(sel_getUid("numberOfSelectedRows"), function $NEWCPTableView__numberOfSelectedRows(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectedRowIndexes, "count");
}
}), new objj_method(sel_getUid("isColumnSelected:"), function $NEWCPTableView__isColumnSelected_(self, _cmd, aColumn)
{ with(self)
{
    return objj_msgSend(_selectedColumnIndexes, "containsIndex:", aColumn);
}
}), new objj_method(sel_getUid("isRowSelected:"), function $NEWCPTableView__isRowSelected_(self, _cmd, aRow)
{ with(self)
{
    return objj_msgSend(_selectedRowIndexes, "containsIndex:", aRow);
}
}), new objj_method(sel_getUid("numberOfColumns"), function $NEWCPTableView__numberOfColumns(self, _cmd)
{ with(self)
{
    return (_tableColumns.length);
}
}), new objj_method(sel_getUid("numberOfRows"), function $NEWCPTableView__numberOfRows(self, _cmd)
{ with(self)
{
    if (!_dataSource)
        return 0;
    return objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
}
}), new objj_method(sel_getUid("headerView"), function $NEWCPTableView__headerView(self, _cmd)
{ with(self)
{
    return _headerView;
}
}), new objj_method(sel_getUid("setHeaderView:"), function $NEWCPTableView__setHeaderView_(self, _cmd, aHeaderView)
{ with(self)
{
    _headerView = aHeaderView;
    objj_msgSend(_headerView, "setTableView:", self);
}
}), new objj_method(sel_getUid("_recalculateTableColumnRanges"), function $NEWCPTableView___recalculateTableColumnRanges(self, _cmd)
{ with(self)
{
    if (_dirtyTableColumnRangeIndex < 0)
        return;
    var index = _dirtyTableColumnRangeIndex,
        count = (_tableColumns.length),
        x = index === 0 ? 0.0 : CPMaxRange(_tableColumnRanges[index - 1]);
    for (; index < count; ++index)
    {
        var tableColumn = _tableColumns[index];
        if (objj_msgSend(tableColumn, "isHidden"))
            _tableColumnRanges[index] = CPMakeRange(x, 0.0);
        else
        {
            var width = objj_msgSend(_tableColumns[index], "width");
            _tableColumnRanges[index] = CPMakeRange(x, width);
            x += width;
        }
    }
    _tableColumnRanges.length = count;
    _dirtyTableColumnRangeIndex = CPNotFound;
}
}), new objj_method(sel_getUid("rectOfColumn:"), function $NEWCPTableView__rectOfColumn_(self, _cmd, aColumnIndex)
{ with(self)
{
    aColumnIndex = +aColumnIndex;
    if (aColumnIndex < 0 || aColumnIndex >= (_tableColumns.length))
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    if (_dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var range = _tableColumnRanges[aColumnIndex];
    return { origin: { x:range.location, y:0.0 }, size: { width:range.length, height:CGRectGetHeight(objj_msgSend(self, "bounds")) } };
}
}), new objj_method(sel_getUid("rectOfRow:"), function $NEWCPTableView__rectOfRow_(self, _cmd, aRowIndex)
{ with(self)
{
    if (NO)
        return NULL;
    return { origin: { x:0.0, y:(aRowIndex * (_rowHeight + _intercellSpacing.height)) }, size: { width:(objj_msgSend(self, "bounds").size.width), height:_rowHeight } };
}
}), new objj_method(sel_getUid("rowsInRect:"), function $NEWCPTableView__rowsInRect_(self, _cmd, aRect)
{ with(self)
{
    var bounds = nil,
        firstRow = objj_msgSend(self, "rowAtPoint:", aRect.origin),
        lastRow = objj_msgSend(self, "rowAtPoint:", { x:0.0, y:(aRect.origin.y + aRect.size.height) });
    if (firstRow < 0)
    {
        bounds = objj_msgSend(self, "bounds");
        if ((aRect.origin.y) < (bounds.origin.y))
            firstRow = 0;
        else
            firstRow = _numberOfRows - 1;
    }
    if (lastRow < 0)
    {
        if (!bounds)
            bounds = objj_msgSend(self, "bounds");
        if ((aRect.origin.y + aRect.size.height) < (bounds.origin.y))
            lastRow = 0;
        else
            lastRow = _numberOfRows - 1;
    }
    return CPMakeRange(firstRow, lastRow - firstRow + 1);
}
}), new objj_method(sel_getUid("columnIndexesInRect:"), function $NEWCPTableView__columnIndexesInRect_(self, _cmd, aRect)
{ with(self)
{
    var column = MAX(0, objj_msgSend(self, "columnAtPoint:", { x:aRect.origin.x, y:0.0 })),
        lastColumn = objj_msgSend(self, "columnAtPoint:", { x:(aRect.origin.x + aRect.size.width), y:0.0 });
    if (lastColumn === CPNotFound)
        lastColumn = (_tableColumns.length) - 1;
    if (_numberOfHiddenColumns <= 0)
        return objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(column, lastColumn - column + 1));
    var indexSet = objj_msgSend(CPIndexSet, "indexSet");
    for (; column <= lastColumn; ++column)
    {
        var tableColumn = _tableColumns[column];
        if (!objj_msgSend(tableColumn, "isHidden"))
            objj_msgSend(indexSet, "addIndex:", column);
    }
    return indexSet;
}
}), new objj_method(sel_getUid("columnAtPoint:"), function $NEWCPTableView__columnAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    if (!(aPoint.x >= (bounds.origin.x) && aPoint.y >= (bounds.origin.y) && aPoint.x < (bounds.origin.x + bounds.size.width) && aPoint.y < (bounds.origin.y + bounds.size.height)))
        return CPNotFound;
    if (_dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var x = aPoint.x,
        low = 0,
        high = _tableColumnRanges.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            range = _tableColumnRanges[middle];
        if (x < range.location)
            high = middle - 1;
        else if (x >= CPMaxRange(range))
            low = middle + 1;
        else
        {
            var numberOfColumns = _tableColumnRanges.length;
            while (middle < numberOfColumns && objj_msgSend(_tableColumns[middle], "isHidden"))
                ++middle;
            if (middle < numberOfColumns)
                return middle;
            return CPNotFound;
        }
   }
   return CPNotFound;
}
}), new objj_method(sel_getUid("rowAtPoint:"), function $NEWCPTableView__rowAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var y = aPoint.y;
    if (NO)
    {
    }
    return FLOOR(y / (_rowHeight + _intercellSpacing.height));
}
}), new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"), function $NEWCPTableView__frameOfDataViewAtColumn_row_(self, _cmd, aColumnIndex, aRowIndex)
{ with(self)
{
    var tableColumnRange = _tableColumns[aColumnIndex],
        rectOfRow = objj_msgSend(self, "rectOfRow:", aRowIndex);
    return { origin: { x:tableColumnRange.location, y:(rectOfRow.origin.y) }, size: { width:tableColumnRange.length, height:(rectOfRow.size.height) } };
}
}), new objj_method(sel_getUid("sizeLastColumnToFit"), function $NEWCPTableView__sizeLastColumnToFit(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview)
        return;
    var superviewSize = objj_msgSend(superview, "bounds").size;
    if (_dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    var count = (_tableColumns.length);
    while (count-- && objj_msgSend(_tableColumns[count], "isHidden")) ;
    if (count >= 0)
    {
        var difference = superviewSize.width - CPMaxRange(_tableColumnRanges[count]),
            tableColumn = _tableColumns[count];
        objj_msgSend(tableColumn, "setWidth:", MAX(0.0, objj_msgSend(tableColumn, "width") + difference));
    }
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("noteNumberOfRowsChanged"), function $NEWCPTableView__noteNumberOfRowsChanged(self, _cmd)
{ with(self)
{
    _numberOfRows = objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("_sizeToParent"), function $NEWCPTableView___sizeToParent(self, _cmd)
{ with(self)
{
    var superviewSize = objj_msgSend(objj_msgSend(self, "superview"), "bounds").size;
    if (_dirtyTableColumnRangeIndex !== CPNotFound)
        objj_msgSend(self, "_recalculateTableColumnRanges");
    if (_tableColumnRanges.length > 0)
        var naturalWidth = CPMaxRange(objj_msgSend(_tableColumnRanges, "lastObject"));
    else
        var naturalWidth = 0.0;
    objj_msgSend(self, "setFrameSize:", { width:MAX(superviewSize.width, naturalWidth), height:MAX(superviewSize.height, (_rowHeight + _intercellSpacing.height) * _numberOfRows) });
}
}), new objj_method(sel_getUid("setDelegate:"), function $NEWCPTableView__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate === aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidMoveNotification, self);
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidResizeNotification, self);
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionDidChangeNotification, self);
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
            objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionIsChangingNotification, self);
    }
    _delegate = aDelegate;
    _implementedDelegateMethods = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("selectionShouldChangeInTableView:")))
        _implementedDelegateMethods |= CPTableViewDelegate_selectionShouldChangeInTableView_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:dataViewForTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_dataViewForTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:didClickTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_didClickTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:didDragTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_didDragTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:heightOfRow:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_heightOfRow_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:isGroupRow:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_isGroupRow_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:mouseDownInHeaderOfTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_mouseDownInHeaderOfTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_nextTypeSelectMatchFromRow_toRow_forString_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:selectionIndexesForProposedSelection:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_selectionIndexesForProposedSelection_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldEditTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldEditTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectRow:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectRow_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectTableColumn:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldSelectTableColumn_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldShowViewExpansionForTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldTrackView:forTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTrackView_forTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_shouldTypeSelectForEvent_withCurrentSearchString_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_toolTipForView_rect_tableColumn_row_mouseLocation_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:typeSelectStringForTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_typeSelectStringForTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:willDisplayView:forTableColumn:row:")))
        _implementedDelegateMethods |= CPTableViewDelegate_tableView_willDisplayView_forTableColumn_row_;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function $NEWCPTableView__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("_objectValueForTableColumn:row:"), function $NEWCPTableView___objectValueForTableColumn_row_(self, _cmd, aTableColumn, aRowIndex)
{ with(self)
{
    var tableColumnUID = objj_msgSend(aTableColumn, "UID"),
        tableColumnObjectValues = _objectValues[tableColumnUID];
    if (!tableColumnObjectValues)
    {
        tableColumnObjectValues = [];
        _objectValues[tableColumnUID] = tableColumnObjectValues;
    }
    var objectValue = tableColumnObjectValues[aRowIndex];
    if (objectValue === undefined)
    {
        objectValue = objj_msgSend(_dataSource, "tableView:objectValueForTableColumn:row:", self, aTableColumn, aRowIndex);
        tableColumnObjectValues[aRowIndex] = objectValue;
    }
    return objectValue;
}
}), new objj_method(sel_getUid("_exposedRect"), function $NEWCPTableView___exposedRect(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
        return objj_msgSend(self, "bounds");
    return objj_msgSend(self, "convertRect:fromView:", CGRectIntersection(objj_msgSend(superview, "bounds"), objj_msgSend(self, "frame")), superview);
}
}), new objj_method(sel_getUid("load"), function $NEWCPTableView__load(self, _cmd)
{ with(self)
{
    if (!_dataSource)
    {
        return;
    }
    if (window.console && window.console.profile)
        console.profile("cell-load");
    var exposedRect = objj_msgSend(self, "_exposedRect"),
        exposedRows = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", objj_msgSend(self, "rowsInRect:", exposedRect)),
        exposedColumns = objj_msgSend(self, "columnIndexesInRect:", exposedRect),
        obscuredRows = objj_msgSend(_exposedRows, "copy"),
        obscuredColumns = objj_msgSend(_exposedColumns, "copy");
    objj_msgSend(obscuredRows, "removeIndexes:", exposedRows);
    objj_msgSend(obscuredColumns, "removeIndexes:", exposedColumns);
    var newlyExposedRows = objj_msgSend(exposedRows, "copy"),
        newlyExposedColumns = objj_msgSend(exposedColumns, "copy");
    objj_msgSend(newlyExposedRows, "removeIndexes:", _exposedRows);
    objj_msgSend(newlyExposedColumns, "removeIndexes:", _exposedColumns);
    var previouslyExposedRows = objj_msgSend(exposedRows, "copy"),
        previouslyExposedColumns = objj_msgSend(exposedColumns, "copy");
    objj_msgSend(previouslyExposedRows, "removeIndexes:", newlyExposedRows);
    objj_msgSend(previouslyExposedColumns, "removeIndexes:", newlyExposedColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", previouslyExposedRows, obscuredColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", obscuredRows, previouslyExposedColumns);
    objj_msgSend(self, "_unloadDataViewsInRows:columns:", obscuredRows, obscuredColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", previouslyExposedRows, newlyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", newlyExposedRows, previouslyExposedColumns);
    objj_msgSend(self, "_loadDataViewsInRows:columns:", newlyExposedRows, newlyExposedColumns);
    _exposedRows = exposedRows;
    _exposedColumns = exposedColumns;
    if (window.console && window.console.profile)
        console.profileEnd("cell-load");
}
}), new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"), function $NEWCPTableView___unloadDataViewsInRows_columns_(self, _cmd, rows, columns)
{ with(self)
{
    if (!objj_msgSend(rows, "count") || !objj_msgSend(columns, "count"))
        return;
    var rowArray = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = _tableColumns[column],
            tableColumnUID = objj_msgSend(tableColumn, "UID");
        var rowIndex = 0,
            rowsCount = rowArray.length;
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = _dataViewsForTableColumns[tableColumnUID][row];
            _dataViewsForTableColumns[tableColumnUID][row] = nil;
if (!_cachedDataViews[dataView.identifier])
_cachedDataViews[dataView.identifier] = [dataView];
else
_cachedDataViews[dataView.identifier].push(dataView);
        }
    }
}
}), new objj_method(sel_getUid("_loadDataViewsInRows:columns:"), function $NEWCPTableView___loadDataViewsInRows_columns_(self, _cmd, rows, columns)
{ with(self)
{
    if (!objj_msgSend(rows, "count") || !objj_msgSend(columns, "count"))
        return;
    var rowArray = [],
        rowRects = [],
        columnArray = [];
    objj_msgSend(rows, "getIndexes:maxCount:inIndexRange:", rowArray, -1, nil);
    objj_msgSend(columns, "getIndexes:maxCount:inIndexRange:", columnArray, -1, nil);
    var columnIndex = 0,
        columnsCount = columnArray.length;
    for (; columnIndex < columnsCount; ++columnIndex)
    {
        var column = columnArray[columnIndex],
            tableColumn = _tableColumns[column],
            tableColumnUID = objj_msgSend(tableColumn, "UID"),
            tableColumnRange = _tableColumnRanges[column];
    if (!_dataViewsForTableColumns[tableColumnUID])
        _dataViewsForTableColumns[tableColumnUID] = [];
        var rowIndex = 0,
            rowsCount = rowArray.length;
        for (; rowIndex < rowsCount; ++rowIndex)
        {
            var row = rowArray[rowIndex],
                dataView = objj_msgSend(tableColumn, "_newDataViewForRow:", row),
                rectOfRow = rowRects[row];
            if (!rectOfRow)
                rectOfRow = rowRects[row] = objj_msgSend(self, "rectOfRow:", row);
            objj_msgSend(dataView, "setFrame:", { origin: { x:tableColumnRange.location, y:(rectOfRow.origin.y) }, size: { width:tableColumnRange.length, height:(rectOfRow.size.height) } });
            objj_msgSend(dataView, "setObjectValue:", objj_msgSend(self, "_objectValueForTableColumn:row:", tableColumn, row));
            if (objj_msgSend(dataView, "superview") !== self)
                objj_msgSend(self, "addSubview:", dataView);
            _dataViewsForTableColumns[tableColumnUID][row] = dataView;
        }
    }
}
}), new objj_method(sel_getUid("setFrameSize:"), function $NEWCPTableView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(_headerView, "setFrameSize:", CGSizeMake(aSize.width, objj_msgSend(_headerView, "frame").size.height));
}
}), new objj_method(sel_getUid("layoutSubviews"), function $NEWCPTableView__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "load");
}
}), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $NEWCPTableView__viewWillMoveToSuperview_(self, _cmd, aView)
{ with(self)
{
    var superview = objj_msgSend(self, "superview"),
        defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (superview)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, superview);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, superview);
    }
    if (aView)
    {
        objj_msgSend(aView, "setPostsFrameChangedNotifications:", YES);
        objj_msgSend(aView, "setPostsBoundsChangedNotifications:", YES);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewFrameChanged:"), CPViewFrameDidChangeNotification, aView);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("superviewBoundsChanged:"), CPViewBoundsDidChangeNotification, aView);
    }
}
}), new objj_method(sel_getUid("superviewBoundsChanged:"), function $NEWCPTableView__superviewBoundsChanged_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("superviewFrameChanged:"), function $NEWCPTableView__superviewFrameChanged_(self, _cmd, aNotification)
{ with(self)
{
}
})]);
}

