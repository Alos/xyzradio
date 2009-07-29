I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;9241;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_document"), new objj_ivar("_shouldCloseDocument"), new objj_ivar("_cibOwner"), new objj_ivar("_windowCibName"), new objj_ivar("_windowCibPath"), new objj_ivar("_isWindowLoading"), new objj_ivar("_shouldDisplayWindowWhenLoaded")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPWindowController__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithWindow:", nil);
}
}), new objj_method(sel_getUid("initWithWindow:"), function $CPWindowController__initWithWindow_(self, _cmd, aWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        objj_msgSend(self, "setWindow:", aWindow);
        objj_msgSend(self, "setShouldCloseDocument:", NO);
        objj_msgSend(self, "setNextResponder:", CPApp);
        if (aWindow)
            objj_msgSend(self, "windowDidLoad");
    }
    return self;
}
}), new objj_method(sel_getUid("initWithWindowCibName:"), function $CPWindowController__initWithWindowCibName_(self, _cmd, aWindowCibName)
{ with(self)
{
    return objj_msgSend(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
}), new objj_method(sel_getUid("initWithWindowCibName:owner:"), function $CPWindowController__initWithWindowCibName_owner_(self, _cmd, aWindowCibName, anOwner)
{ with(self)
{
    self = objj_msgSend(self, "initWithWindow:", nil);
    if (self)
    {
        _cibOwner = anOwner;
        _windowCibName = aWindowCibName;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithWindowCibPath:owner:"), function $CPWindowController__initWithWindowCibPath_owner_(self, _cmd, aWindowCibPath, anOwner)
{ with(self)
{
    self = objj_msgSend(self, "initWithWindow:", nil);
    if (self)
    {
        _cibOwner = anOwner;
        _windowCibPath = aWindowCibPath;
    }
    return self;
}
}), new objj_method(sel_getUid("loadWindow"), function $CPWindowController__loadWindow(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isWindowLoaded"))
        return YES;
    if (!objj_msgSend(self, "isWindowLoading"))
    {
        _isWindowLoading = YES;
        objj_msgSend(self, "windowWillLoad");
        objj_msgSend(CPBundle, "loadCibFile:externalNameTable:loadDelegate:", objj_msgSend(self, "windowCibPath"), objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", _cibOwner, CPCibOwner), self);
    }
    return NO;
}
}), new objj_method(sel_getUid("cibDidFinishLoading:"), function $CPWindowController__cibDidFinishLoading_(self, _cmd, aCib)
{ with(self)
{
    if (_window === nil && _document !== nil && _cibOwner === _document)
        objj_msgSend(self, "setWindow:", objj_msgSend(_document, "valueForKey:", "window"));
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
    objj_msgSend(self, "windowDidLoad");
    if (_shouldDisplayWindowWhenLoaded)
        objj_msgSend(self, "showWindow:", self);
}
}), new objj_method(sel_getUid("showWindow:"), function $CPWindowController__showWindow_(self, _cmd, aSender)
{ with(self)
{
    if (!objj_msgSend(self, "loadWindow"))
    {
        _shouldDisplayWindowWhenLoaded = YES;
        return;
    }
    var theWindow = objj_msgSend(self, "window");
 if (objj_msgSend(theWindow, "respondsToSelector:", sel_getUid("becomesKeyOnlyIfNeeded")) && objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
        objj_msgSend(theWindow, "orderFront:", aSender);
    else
        objj_msgSend(theWindow, "makeKeyAndOrderFront:", aSender);
}
}), new objj_method(sel_getUid("isWindowLoaded"), function $CPWindowController__isWindowLoaded(self, _cmd)
{ with(self)
{
    return _window !== nil;
}
}), new objj_method(sel_getUid("isWindowLoading"), function $CPWindowController__isWindowLoading(self, _cmd)
{ with(self)
{
    return _isWindowLoading;
}
}), new objj_method(sel_getUid("window"), function $CPWindowController__window(self, _cmd)
{ with(self)
{
    if (!_window)
         objj_msgSend(self, "loadWindow");
    return _window;
}
}), new objj_method(sel_getUid("setWindow:"), function $CPWindowController__setWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(_window, "setWindowController:", nil);
    _window = aWindow;
    objj_msgSend(_window, "setWindowController:", self);
    objj_msgSend(_window, "setNextResponder:", self);
}
}), new objj_method(sel_getUid("windowDidLoad"), function $CPWindowController__windowDidLoad(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerDidLoadCib:", self);
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
}), new objj_method(sel_getUid("windowWillLoad"), function $CPWindowController__windowWillLoad(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerWillLoadCib:", self);
}
}), new objj_method(sel_getUid("setDocument:"), function $CPWindowController__setDocument_(self, _cmd, aDocument)
{ with(self)
{
    if (_document === aDocument)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_document)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidFailToSaveNotification, _document);
    }
    _document = aDocument;
    if (_document)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentWillSave:"), CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidSave:"), CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, _document);
        objj_msgSend(self, "setDocumentEdited:", objj_msgSend(_document, "isDocumentEdited"));
    }
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
}), new objj_method(sel_getUid("_documentWillSave:"), function $CPWindowController___documentWillSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", YES);
}
}), new objj_method(sel_getUid("_documentDidSave:"), function $CPWindowController___documentDidSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
}), new objj_method(sel_getUid("_documentDidFailToSave:"), function $CPWindowController___documentDidFailToSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
}), new objj_method(sel_getUid("document"), function $CPWindowController__document(self, _cmd)
{ with(self)
{
    return _document;
}
}), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindowController__setDocumentEdited_(self, _cmd, isEdited)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentEdited:", isEdited);
}
}), new objj_method(sel_getUid("close"), function $CPWindowController__close(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "close");
}
}), new objj_method(sel_getUid("setShouldCloseDocument:"), function $CPWindowController__setShouldCloseDocument_(self, _cmd, shouldCloseDocument)
{ with(self)
{
    _shouldCloseDocument = shouldCloseDocument;
}
}), new objj_method(sel_getUid("shouldCloseDocument"), function $CPWindowController__shouldCloseDocument(self, _cmd)
{ with(self)
{
    return _shouldCloseDocument;
}
}), new objj_method(sel_getUid("owner"), function $CPWindowController__owner(self, _cmd)
{ with(self)
{
    return _cibOwner;
}
}), new objj_method(sel_getUid("windowCibName"), function $CPWindowController__windowCibName(self, _cmd)
{ with(self)
{
    if (_windowCibName)
        return _windowCibName;
    return objj_msgSend(objj_msgSend(_windowCibPath, "lastPathComponent"), "stringByDeletingPathExtension");
}
}), new objj_method(sel_getUid("windowCibPath"), function $CPWindowController__windowCibPath(self, _cmd)
{ with(self)
{
    if (_windowCibPath)
        return _windowCibPath;
    return objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_cibOwner, "class")), "pathForResource:", _windowCibName + ".cib");
}
}), new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"), function $CPWindowController__synchronizeWindowTitleWithDocumentName(self, _cmd)
{ with(self)
{
    if (!_document || !_window)
        return;
    objj_msgSend(_window, "setTitle:", objj_msgSend(self, "windowTitleForDocumentDisplayName:", objj_msgSend(_document, "displayName")));
}
}), new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"), function $CPWindowController__windowTitleForDocumentDisplayName_(self, _cmd, aDisplayName)
{ with(self)
{
    return aDisplayName;
}
})]);
}

