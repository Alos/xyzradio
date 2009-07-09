I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;9467;






CPTableColumnNoResizing = 0;




CPTableColumnAutoresizingMask = 1;




CPTableColumnUserResizingMask = 2;

{var the_class = objj_allocateClassPair(CPObject, "NEWCPTableColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tableView"), new objj_ivar("_headerView"), new objj_ivar("_dataView"), new objj_ivar("_dataViewData"), new objj_ivar("_width"), new objj_ivar("_minWidth"), new objj_ivar("_maxWidth"), new objj_ivar("_identifier"), new objj_ivar("_isEditable"), new objj_ivar("_sortDescriptorPrototype"), new objj_ivar("_isHidden"), new objj_ivar("_headerToolTip")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function $NEWCPTableColumn__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _dataViewData = { };

        _width = 100.0;
        _minWidth = 10.0;
        _maxWidth = 1000000.0;

        objj_msgSend(self, "setIdentifier:", anIdentifier);
        objj_msgSend(self, "setHeaderView:", objj_msgSend(CPTextField, "new"));
        objj_msgSend(self, "setDataView:", objj_msgSend(CPTextField, "new"));
    }

    return self
}
}), new objj_method(sel_getUid("setTableView:"), function $NEWCPTableColumn__setTableView_(self, _cmd, aTableView)
{ with(self)
{
    _tableView = aTableView;
}
}), new objj_method(sel_getUid("tableView"), function $NEWCPTableColumn__tableView(self, _cmd)
{ with(self)
{
    return _tableView;
}
}), new objj_method(sel_getUid("setWidth:"), function $NEWCPTableColumn__setWidth_(self, _cmd, aWidth)
{ with(self)
{
    aWidth = +aWidth;

    if (_width === aWidth)
        return;

    var newWidth = MIN(MAX(aWidth, objj_msgSend(self, "minWidth")), objj_msgSend(self, "maxWidth"));

    if (_width === newWidth)
        return;

    var oldWidth = _width;

    _width = newWidth;

    var tableView = objj_msgSend(self, "tableView");

    if (tableView)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewColumnDidResizeNotification, tableView, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, oldWidth], ["CPTableColumn", "CPOldWidth"]));
}
}), new objj_method(sel_getUid("width"), function $NEWCPTableColumn__width(self, _cmd)
{ with(self)
{
    return _width;
}
}), new objj_method(sel_getUid("setMinWidth:"), function $NEWCPTableColumn__setMinWidth_(self, _cmd, aMinWidth)
{ with(self)
{
    aMinWidth = +aMinWidth;

    if (_minWidth === aMinWidth)
        return;

    _minWidth = aMinWidth;

    var width = objj_msgSend(self, "width"),
        newWidth = MAX(width, objj_msgSend(self, "minWidth"));

    if (width !== newWidth)
        objj_msgSend(self, "setWidth:", newWidth);
}
}), new objj_method(sel_getUid("minWidth"), function $NEWCPTableColumn__minWidth(self, _cmd)
{ with(self)
{
    return _minWidth;
}
}), new objj_method(sel_getUid("setMaxWidth:"), function $NEWCPTableColumn__setMaxWidth_(self, _cmd, aMaxWidth)
{ with(self)
{
    aMaxWidth = +aMaxWidth;

    if (_maxWidth === aMaxWidth)
        return;

    _maxWidth = aMaxWidth;

    var width = objj_msgSend(self, "width"),
        newWidth = MAX(width, objj_msgSend(self, "maxWidth"));

    if (width !== newWidth)
        objj_msgSend(self, "setWidth:", newWidth);
}
}), new objj_method(sel_getUid("maxWidth"), function $NEWCPTableColumn__maxWidth(self, _cmd)
{ with(self)
{
    return _maxWidth;
}
}), new objj_method(sel_getUid("setResizingMask:"), function $NEWCPTableColumn__setResizingMask_(self, _cmd, aResizingMask)
{ with(self)
{
    _resizingMask = aResizingMask;
}
}), new objj_method(sel_getUid("resizingMask"), function $NEWCPTableColumn__resizingMask(self, _cmd)
{ with(self)
{
    return _resizingMask;
}
}), new objj_method(sel_getUid("sizeToFit"), function $NEWCPTableColumn__sizeToFit(self, _cmd)
{ with(self)
{
    var width = _CGRectGetWidth(objj_msgSend(_headerView, "frame"));

    if (width < objj_msgSend(self, "minWidth"))
        objj_msgSend(self, "setMinWidth:", width);
    else if (width > objj_msgSend(self, "maxWidth"))
        objj_msgSend(self, "setMaxWidth:", width)

    if (_width !== width)
        objj_msgSend(self, "setWidth:", width);
}
}), new objj_method(sel_getUid("setHeaderView:"), function $NEWCPTableColumn__setHeaderView_(self, _cmd, aView)
{ with(self)
{
    if (!aView)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Attempt to set nil header view on " + objj_msgSend(self, "description"));

    _headerView = aView;
}
}), new objj_method(sel_getUid("headerView"), function $NEWCPTableColumn__headerView(self, _cmd)
{ with(self)
{
    return _headerView;
}
}), new objj_method(sel_getUid("setDataView:"), function $NEWCPTableColumn__setDataView_(self, _cmd, aView)
{ with(self)
{
    if (_dataView === aView)
        return;

    if (_dataView)
        _dataViewData[objj_msgSend(_dataView, "UID")] = nil;

    _dataView = aView;
    _dataViewData[objj_msgSend(aView, "UID")] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aView);
}
}), new objj_method(sel_getUid("dataView"), function $NEWCPTableColumn__dataView(self, _cmd)
{ with(self)
{
    return _dataView;
}
}), new objj_method(sel_getUid("dataViewForRow:"), function $NEWCPTableColumn__dataViewForRow_(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataView");
}
}), new objj_method(sel_getUid("_newDataViewForRow:"), function $NEWCPTableColumn___newDataViewForRow_(self, _cmd, aRowIndex)
{ with(self)
{
    var dataView = objj_msgSend(self, "dataViewForRow:", aRowIndex),
        dataViewUID = objj_msgSend(dataView, "UID");
var x = objj_msgSend(self, "tableView")._cachedDataViews[dataViewUID];
if (x && x.length)
return x.pop();
    if (!_dataViewData[dataViewUID])
        _dataViewData[dataViewUID] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", dataView);
    var newDataView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _dataViewData[dataViewUID]);
newDataView.identifier = dataViewUID;
    return newDataView;
}
}), new objj_method(sel_getUid("setIdentifier:"), function $NEWCPTableColumn__setIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
}), new objj_method(sel_getUid("identifier"), function $NEWCPTableColumn__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
}), new objj_method(sel_getUid("setEditable:"), function $NEWCPTableColumn__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
}), new objj_method(sel_getUid("isEditable"), function $NEWCPTableColumn__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
}), new objj_method(sel_getUid("setSortDescriptorPrototype:"), function $NEWCPTableColumn__setSortDescriptorPrototype_(self, _cmd, aSortDescriptor)
{ with(self)
{
    _sortDescriptorPrototype = aSortDescriptor;
}
}), new objj_method(sel_getUid("sortDescriptorPrototype"), function $NEWCPTableColumn__sortDescriptorPrototype(self, _cmd)
{ with(self)
{
    return _sortDescriptorPrototype;
}
}), new objj_method(sel_getUid("setHidden:"), function $NEWCPTableColumn__setHidden_(self, _cmd, shouldBeHidden)
{ with(self)
{
    _isHidden = shouldBeHidden;
}
}), new objj_method(sel_getUid("isHidden"), function $NEWCPTableColumn__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("setHeaderToolTip:"), function $NEWCPTableColumn__setHeaderToolTip_(self, _cmd, aToolTip)
{ with(self)
{
    _headerToolTip = aToolTip;
}
}), new objj_method(sel_getUid("headerToolTip"), function $NEWCPTableColumn__headerToolTip(self, _cmd)
{ with(self)
{
    return _headerToolTip;
}
})]);
}
{
var the_class = objj_getClass("NEWCPTableColumn")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"NEWCPTableColumn\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setHeaderCell:"), function $NEWCPTableColumn__setHeaderCell_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
}), new objj_method(sel_getUid("headerCell"), function $NEWCPTableColumn__headerCell(self, _cmd)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "headCell is not supported. -headerView instead.");
}
}), new objj_method(sel_getUid("setDataCell:"), function $NEWCPTableColumn__setDataCell_(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
}), new objj_method(sel_getUid("dataCell"), function $NEWCPTableColumn__dataCell(self, _cmd)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataCell is not supported. Use -dataCell instead.");
}
}), new objj_method(sel_getUid("dataCellForRow:"), function $NEWCPTableColumn__dataCellForRow_(self, _cmd, row)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
})]);
}

