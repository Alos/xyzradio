i;15;CPTableColumn.ji;13;CPTableView.ji;8;CPView.jc;3886;
{var the_class = objj_allocateClassPair(CPView, "CPTableHeaderView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_resizedColumn"), new objj_ivar("_draggedColumn"), new objj_ivar("_draggedDistance"), new objj_ivar("_tableView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("resizedColumn"), function $CPTableHeaderView__resizedColumn(self, _cmd)
{ with(self)
{
return _resizedColumn;
}
}),
new objj_method(sel_getUid("draggedColumn"), function $CPTableHeaderView__draggedColumn(self, _cmd)
{ with(self)
{
return _draggedColumn;
}
}),
new objj_method(sel_getUid("draggedDistance"), function $CPTableHeaderView__draggedDistance(self, _cmd)
{ with(self)
{
return _draggedDistance;
}
}),
new objj_method(sel_getUid("tableView"), function $CPTableHeaderView__tableView(self, _cmd)
{ with(self)
{
return _tableView;
}
}),
new objj_method(sel_getUid("setTableView:"), function $CPTableHeaderView__setTableView_(self, _cmd, newValue)
{ with(self)
{
_tableView = newValue;
}
}), new objj_method(sel_getUid("initWithFrame:"), function $CPTableHeaderView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _resizedColumn = CPNotFound;
        _draggedColumn = CPNotFound;
        _draggedDistance = 0.0;
    }
    return self;
}
}), new objj_method(sel_getUid("columnAtPoint:"), function $CPTableHeaderView__columnAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    if (!CGRectContainsPoint(objj_msgSend(self, "bounds"), aPoint))
        return CPNotFound;
    var index = 0,
        count = objj_msgSend(objj_msgSend(_tableView, "tableColumns"), "count"),
        tableSpacing = objj_msgSend(_tableView, "intercellSpacing"),
        tableColumns = objj_msgSend(_tableView, "tableColumns"),
        leftOffset = 0,
        pointX = aPoint.x;
    for (; index < count; index++)
    {
        var width = objj_msgSend(tableColumns[index], "width") + tableSpacing.width;
        if (pointX >= leftOffset && pointX < leftOffset + width)
            return index;
        leftOffset += width;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("headerRectOfColumn:"), function $CPTableHeaderView__headerRectOfColumn_(self, _cmd, aColumnIndex)
{ with(self)
{
    var tableColumns = objj_msgSend(_tableView, "tableColumns"),
        tableSpacing = objj_msgSend(_tableView, "intercellSpacing"),
        bounds = objj_msgSend(self, "bounds");
    if (aColumnIndex < 0 || aColumnIndex > objj_msgSend(tableColumns, "count"))
        objj_msgSend(CPException, "raise:reason:", "invalid", "tried to get headerRectOfColumn: on invalid column");
    bounds.size.width = objj_msgSend(tableColumns[aColumnIndex], "width") + tableSpacing.width;
    while (--aColumnIndex >= 0)
        bounds.origin.x += objj_msgSend(tableColumns[aColumnIndex], "width") + tableSpacing.width;
    return bounds;
}
}), new objj_method(sel_getUid("layoutSubviews"), function $CPTableHeaderView__layoutSubviews(self, _cmd)
{ with(self)
{
    var tableColumns = objj_msgSend(_tableView, "tableColumns"),
        count = objj_msgSend(tableColumns, "count"),
        columnRect = objj_msgSend(self, "bounds"),
        spacing = objj_msgSend(_tableView, "intercellSpacing");
    for (i = 0; i < count; ++i)
    {
        var column = objj_msgSend(tableColumns, "objectAtIndex:", i),
            headerView = objj_msgSend(column, "headerView");
        columnRect.size.width = objj_msgSend(column, "width") + spacing.width;
        objj_msgSend(headerView, "setFrame:", columnRect);
        columnRect.origin.x += objj_msgSend(column, "width") + spacing.width;
        objj_msgSend(self, "addSubview:", headerView);
    }
}
})]);
}

