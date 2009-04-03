@STATIC;1.0;p;17;_CPCibConnector.jI;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;4378;


var _CPCibConnectorSourceKey = "_CPCibConnectorSourceKey",
    _CPCibConnectorDestinationKey = "_CPCibConnectorDestinationKey",
    _CPCibConnectorLabelKey = "_CPCibConnectorLabelKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_source"), new objj_ivar("_destination"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("replaceObject:withObject:"), function $_CPCibConnector__replaceObject_withObject_(self, _cmd, anObject, anotherObject)
{ with(self)
{
    if (_source == anObject)
        _source = anotherObject;

    else if (_destination == anObject)
        _destination = anotherObject;
}
});
class_addMethods(the_class, instance_methods);
}

{
var the_class = objj_getClass("_CPCibConnector")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibConnector\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $_CPCibConnector__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _source = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibConnectorSourceKey);
        _destination = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibConnectorDestinationKey);
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibConnectorLabelKey);




    }

    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $_CPCibConnector__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _source, _CPCibConnectorSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _destination, _CPCibConnectorDestinationKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, _CPCibConnectorLabelKey);
}
});
class_addMethods(the_class, instance_methods);
}

{var the_class = objj_allocateClassPair(_CPCibConnector, "_CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("establishConnection"), function $_CPCibControlConnector__establishConnection(self, _cmd)
{ with(self)
{





    var selectorName = _label;

    if (!objj_msgSend(selectorName, "hasSuffix:", ":"))
        selectorName += ':';

    var selector = CPSelectorFromString(selectorName);

    if (!selector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-["+objj_msgSend(self, "className")+' '+_cmd+"] selector "+selectorName+" does not exist.");

    if (objj_msgSend(_source, "respondsToSelector:", sel_registerName("setAction:")))
        objj_msgSend(_source, sel_registerName("setAction:"), selector);

    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-["+objj_msgSend(self, "className")+' '+_cmd+"] "+objj_msgSend(_source, "description")+" does not respond to setAction:");

    if (objj_msgSend(_source, "respondsToSelector:", sel_registerName("setTarget:")))
        objj_msgSend(_source, sel_registerName("setTarget:"), _destination);

    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-["+objj_msgSend(self, "className")+' '+_cmd+"] "+objj_msgSend(_source, "description")+" does not respond to setTarget:");
}
});
class_addMethods(the_class, instance_methods);
}

{var the_class = objj_allocateClassPair(_CPCibConnector, "_CPCibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("establishConnection"), function $_CPCibOutletConnector__establishConnection(self, _cmd)
{ with(self)
{




    objj_msgSend(_source, "setValue:forKey:", _destination, _label);
}
});
class_addMethods(the_class, instance_methods);
}

p;20;_CPCibCustomObject.jI;21;Foundation/CPObject.jc;1660;


var _CPCibCustomObjectClassName = "_CPCibCustomObjectClassName";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

{
var the_class = objj_getClass("_CPCibCustomObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomObject\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $_CPCibCustomObject__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomObjectClassName);

    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $_CPCibCustomObject__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomObjectClassName);
}
});
instance_methods[2] = new objj_method(sel_registerName("_cibInstantiate"), function $_CPCibCustomObject___cibInstantiate(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);

    if (!theClass)
        CPLog("Unknown class \"" + _className + "\" in cib file");

    return objj_msgSend(objj_msgSend(theClass, "alloc"), "init");
}
});
class_addMethods(the_class, instance_methods);
}

p;18;_CPCibCustomView.ji;8;CPView.jc;2736;
{var the_class = objj_allocateClassPair(CPView, "_CPCibCustomView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}
var _CPCibCustomViewClassNameKey = "_CPCibCustomViewClassNameKey";
{
var the_class = objj_getClass("_CPCibCustomView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomView\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $_CPCibCustomView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomViewClassNameKey);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $_CPCibCustomView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomViewClassNameKey);
}
});
instance_methods[2] = new objj_method(sel_registerName("_cibInstantiate"), function $_CPCibCustomView___cibInstantiate(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);
    if (!theClass)
    {
        CPLog("Unknown class \"" + _className + "\" in cib file, using CPView instead.");
        theClass = objj_msgSend(CPView, "class");
    }
    var view = objj_msgSend(objj_msgSend(theClass, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
    if (view)
    {
        objj_msgSend(view, "setBounds:", objj_msgSend(self, "bounds"));
        var subviews = objj_msgSend(self, "subviews"),
            index = 0,
            count = subviews.length;
        for (; index < count; ++index)
            objj_msgSend(view, "addSubview:", subviews[index]);
        objj_msgSend(view, "setAutoresizingMask:", objj_msgSend(self, "autoresizingMask"));
        objj_msgSend(view, "setAutoresizesSubviews:", objj_msgSend(self, "autoresizesSubviews"));
        objj_msgSend(view, "setHitTests:", objj_msgSend(self, "hitTests"));
        objj_msgSend(view, "setHidden:", objj_msgSend(self, "isHidden"));
        objj_msgSend(view, "setAlphaValue:", objj_msgSend(self, "alphaValue"));
        objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    }
    return view;
}
});
class_addMethods(the_class, instance_methods);
}

p;23;_CPCibKeyedUnarchiver.jI;30;Foundation/CPKeyedUnarchiver.jc;1503;


{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPCibKeyedUnarchiver"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initForReadingWithData:"), function $_CPCibKeyedUnarchiver__initForReadingWithData_(self, _cmd, data)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);

    if (self)
        objj_msgSend(self, "setDelegate:", self);

    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("unarchiver:didDecodeObject:"), function $_CPCibKeyedUnarchiver__unarchiver_didDecodeObject_(self, _cmd, aKeyedUnarchiver, anObject)
{ with(self)
{
    if (objj_msgSend(anObject, "respondsToSelector:", sel_registerName("_cibInstantiate")))
        return objj_msgSend(anObject, "_cibInstantiate");

    return anObject;
}
});
instance_methods[2] = new objj_method(sel_registerName("replaceObjectAtUID:withObject:"), function $_CPCibKeyedUnarchiver__replaceObjectAtUID_withObject_(self, _cmd, aUID, anObject)
{ with(self)
{
    _objects[aUID] = anObject;
}
});
instance_methods[3] = new objj_method(sel_registerName("objectAtUID:"), function $_CPCibKeyedUnarchiver__objectAtUID_(self, _cmd, aUID)
{ with(self)
{
    return _objects[aUID];
}
});
class_addMethods(the_class, instance_methods);
}

p;15;_CPCibLoading.jI;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;1994;
var CPCibOwner = "CPCibOwner";
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("awakeFromCib"), function $CPObject__awakeFromCib(self, _cmd)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
}
{
var the_class = objj_getClass("CPBundle")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPBundle\""));
var meta_class = the_class.isa;var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("loadCibFile:externalNameTable:"), function $CPBundle__loadCibFile_externalNameTable_(self, _cmd, aPath, aNameTable)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfFile:", aPath), "instantiateCibWithExternalNameTable:", aNameTable);
}
});
class_methods[1] = new objj_method(sel_registerName("loadCibNamed:owner:"), function $CPBundle__loadCibNamed_owner_(self, _cmd, aName, anOwner)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class"));
    var path = objj_msgSend(bundle, "pathForResource:", aName);
    return objj_msgSend(CPBundle, "loadCibFile:externalNameTable:", aPath, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anOwner, CPCibOwner));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("loadCibFile:externalNameTable:"), function $CPBundle__loadCibFile_externalNameTable_(self, _cmd, aPath, aNameTable)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfFile:", aPath), "instantiateCibWithExternalNameTable:", aNameTable);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;18;_CPCibObjectData.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;17;_CPCibConnector.jc;6330;
{var the_class = objj_allocateClassPair(CPObject, "_CPCibObjectData"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namesKeys"), new objj_ivar("_namesValues"), new objj_ivar("_accessibilityConnectors"), new objj_ivar("_accessibilityOidsKeys"), new objj_ivar("_accessibilityOidsValues"), new objj_ivar("_classesKeys"), new objj_ivar("_classesValues"), new objj_ivar("_connections"), new objj_ivar("_fontManager"), new objj_ivar("_framework"), new objj_ivar("_nextOid"), new objj_ivar("_objectsKeys"), new objj_ivar("_objectsValues"), new objj_ivar("_oidKeys"), new objj_ivar("_oidValues"), new objj_ivar("_fileOwner"), new objj_ivar("_visibleWindows")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("topLevelObjects"), function $_CPCibObjectData__topLevelObjects(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_objectsValues, "count"),
        topLevelObjects = [];
    while (count--)
    {
        var eachObject = _objectsValues[count];
        if (eachObject == _fileOwner)
        {
            var anObject = _objectsKeys[count];
            if (anObject != _fileOwner)
                topLevelObjects.push(anObject);
        }
    }
    return topLevelObjects;
}
});
class_addMethods(the_class, instance_methods);
}
var _CPCibObjectDataNamesKeysKey = "_CPCibObjectDataNamesKeysKey",
    _CPCibObjectDataNamesValuesKey = "_CPCibObjectDataNamesValuesKey",
    _CPCibObjectDataAccessibilityConnectorsKey = "_CPCibObjectDataAccessibilityConnectors",
    _CPCibObjectDataAccessibilityOidsKeysKey = "_CPCibObjectDataAccessibilityOidsKeys",
    _CPCibObjectDataAccessibilityOidsValuesKey = "_CPCibObjectDataAccessibilityOidsValues",
    _CPCibObjectDataClassesKeysKey = "_CPCibObjectDataClassesKeysKey",
    _CPCibObjectDataClassesValuesKey = "_CPCibObjectDataClassesValuesKey",
    _CPCibObjectDataConnectionsKey = "_CPCibObjectDataConnectionsKey",
    _CPCibObjectDataFontManagerKey = "_CPCibObjectDataFontManagerKey",
    _CPCibObjectDataFrameworkKey = "_CPCibObjectDataFrameworkKey",
    _CPCibObjectDataNextOidKey = "_CPCibObjectDataNextOidKey",
    _CPCibObjectDataObjectsKeysKey = "_CPCibObjectDataObjectsKeysKey",
    _CPCibObjectDataObjectsValuesKey = "_CPCibObjectDataObjectsValuesKey",
    _CPCibObjectDataOidKeysKey = "_CPCibObjectDataOidKeysKey",
    _CPCibObjectDataOidValuesKey = "_CPCibObjectDataOidValuesKey",
    _CPCibObjectDataFileOwnerKey = "_CPCibObjectDataFileOwnerKey",
    _CPCibObjectDataVisibleWindowsKey = "_CPCibObjectDataVisibleWindowsKey";
{
var the_class = objj_getClass("_CPCibObjectData")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibObjectData\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $_CPCibObjectData__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _namesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesKeysKey);
        _namesValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataNamesValuesKey);
        _classesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesKeysKey);
        _classesValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataClassesValuesKey);
        _connections = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataConnectionsKey);
        _framework = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataFrameworkKey);
        _nextOid = objj_msgSend(aCoder, "decodeIntForKey:", _CPCibObjectDataNextOidKey);
        _objectsKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsKeysKey);
        _objectsValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataObjectsValuesKey);
        _oidKeys = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidKeysKey);
        _oidValues = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataOidValuesKey);
        _fileOwner = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataFileOwnerKey);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $_CPCibObjectData__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _namesKeys, _CPCibObjectDataNamesKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _namesValues, _CPCibObjectDataNamesValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _classesKeys, _CPCibObjectDataClassesKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _classesValues, _CPCibObjectDataClassesValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _connections, _CPCibObjectDataConnectionsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _framework, _CPCibObjectDataFrameworkKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _nextOid, _CPCibObjectDataNextOidKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _objectsKeys, _CPCibObjectDataObjectsKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _objectsValues, _CPCibObjectDataObjectsValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _oidKeys, _CPCibObjectDataOidKeysKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _oidValues, _CPCibObjectDataOidValuesKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _fileOwner, _CPCibObjectDataFileOwnerKey);
}
});
instance_methods[2] = new objj_method(sel_registerName("establishConnectionsWithExternalNameTable:"), function $_CPCibObjectData__establishConnectionsWithExternalNameTable_(self, _cmd, anExternalNameTable)
{ with(self)
{
    var index = 0,
        count = _connections.length,
        cibOwner = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibOwner);
    for (; index < count; ++index)
    {
        var connection = _connections[index];
        objj_msgSend(connection, "replaceObject:withObject:", _fileOwner, cibOwner);
        objj_msgSend(connection, "establishConnection");
    }
}
});
class_addMethods(the_class, instance_methods);
}

p;22;_CPCibWindowTemplate.jI;21;Foundation/CPObject.jc;3880;


var _CPCibWindowTemplateMinSizeKey = "_CPCibWindowTemplateMinSizeKey",
    _CPCibWindowTemplateMaxSizeKey = "_CPCibWindowTemplateMaxSizeKey",

    _CPCibWindowTemplateViewClassKey = "_CPCibWindowTemplateWindowClassKey",

    _CPCibWindowTemplateWindowRectKey = "_CPCibWindowTemplateWindowRectKey",
    _CPCibWindowTemplateWindowStyleMaskKey = "_CPCibWindowTempatStyleMaskKey",
    _CPCibWindowTemplateWindowTitleKey = "_CPCibWindowTemplateWindowTitleKey",
    _CPCibWindowTemplateWindowViewKey = "_CPCibWindowTemplateWindowViewKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibWindowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_viewClass"), new objj_ivar("_windowClass"), new objj_ivar("_windowRect"), new objj_ivar("_windowStyleMask"), new objj_ivar("_windowTitle"), new objj_ivar("_windowView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $_CPCibWindowTemplate__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _minSize = objj_msgSend(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMinSizeKey);
        _maxSize = objj_msgSend(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMaxSizeKey);

        _viewClass = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateViewClassKey);

        _windowClass = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateViewClassKey);
        _windowRect = objj_msgSend(aCoder, "decodeRectForKey:", _CPCibWindowTemplateWindowRectKey);
        _windowStyleMask = objj_msgSend(aCoder, "decodeIntForKey:", _CPCibWindowTemplateWindowStyleMaskKey);

        _windowTitle = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowTitleKey);
        _windowView = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowViewKey);
    }

    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $_CPCibWindowTemplate__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeSize:forKey:", _minSize, _CPCibWindowTemplateMinSizeKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", _maxSize, _CPCibWindowTemplateMaxSizeKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _viewClass, _CPCibWindowTemplateViewClassKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowClass, _CPCibWindowTemplateViewClassKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _windowRect, _CPCibWindowTemplateWindowRectKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _windowStyleMask, _CPCibWindowTemplateWindowStyleMaskKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowTitle, _CPCibWindowTemplateWindowTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _windowView, _CPCibWindowTemplateWindowViewKey);
}
});
instance_methods[2] = new objj_method(sel_registerName("_cibInstantiate"), function $_CPCibWindowTemplate___cibInstantiate(self, _cmd)
{ with(self)
{
    var windowClass = CPClassFromString(_windowClass);





    var theWindow = objj_msgSend(objj_msgSend(windowClass, "alloc"), "initWithContentRect:styleMask:", _windowRect, CPHUDBackgroundWindowMask|CPClosableWindowMask);





    objj_msgSend(theWindow, "setLevel:", CPFloatingWindowLevel);


    objj_msgSend(theWindow, "setTitle:", _windowTitle);


    objj_msgSend(_windowView, "setAutoresizesSubviews:", NO);

    objj_msgSend(theWindow, "setContentView:", _windowView);

    objj_msgSend(_windowView, "setAutoresizesSubviews:", YES);

    return theWindow;
}
});
class_addMethods(the_class, instance_methods);
}

p;22;_CPImageAndTitleView.jI;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;9410;
{var the_class = objj_allocateClassPair(CPView, "_CPImageAndTitleView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alignment"), new objj_ivar("_textColor"), new objj_ivar("_font"), new objj_ivar("_imagePosition"), new objj_ivar("_imageScalng"), new objj_ivar("_image"), new objj_ivar("_title"), new objj_ivar("_titleSize"), new objj_ivar("_titleField")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPImageAndTitleView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _alignment = CPCenterTextAlignment;
        _textColor = nil;
        _font = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);
        _imagePosition = CPNoImage;
        _imageScaling = CPScaleNone;
        _titleSize = CGSizeMakeZero();
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setAlignment:"), function $_CPImageAndTitleView__setAlignment_(self, _cmd, anAlignment)
{ with(self)
{
    _alignment = anAlignment;
    objj_msgSend(_titleField, "setAlignment:", anAlignment);
}
});
instance_methods[2] = new objj_method(sel_registerName("alignment"), function $_CPImageAndTitleView__alignment(self, _cmd)
{ with(self)
{
    return _alignment;
}
});
instance_methods[3] = new objj_method(sel_registerName("setImagePosition:"), function $_CPImageAndTitleView__setImagePosition_(self, _cmd, anImagePosition)
{ with(self)
{
    if (_imagePosition == anImagePosition)
        return;
    _imagePosition = anImagePosition;
    if (_imagePosition == CPImageOnly)
        objj_msgSend(_titleField, "setHidden:", YES);
    else
        objj_msgSend(_titleField, "setHidden:", NO);
    objj_msgSend(self, "tile");
}
});
instance_methods[4] = new objj_method(sel_registerName("imagePosition"), function $_CPImageAndTitleView__imagePosition(self, _cmd)
{ with(self)
{
    return _imagePosition;
}
});
instance_methods[5] = new objj_method(sel_registerName("setImageScaling:"), function $_CPImageAndTitleView__setImageScaling_(self, _cmd, anImageScaling)
{ with(self)
{
    if (_imageScaling == anImageScaling)
        return;
    _imageScaling = anImageScaling;
    objj_msgSend(self, "tile");
}
});
instance_methods[6] = new objj_method(sel_registerName("imageScaling"), function $_CPImageAndTitleView__imageScaling(self, _cmd)
{ with(self)
{
    return _imageScaling;
}
});
instance_methods[7] = new objj_method(sel_registerName("setTextAlignment:"), function $_CPImageAndTitleView__setTextAlignment_(self, _cmd, aTextAlignment)
{ with(self)
{
    if (_alignment == aTextAlignment)
        return;
    _alignment = aTextAlignment;
    objj_msgSend(_titleField, "setTextAlignment:", aTextAlignment);
}
});
instance_methods[8] = new objj_method(sel_registerName("textAlignment"), function $_CPImageAndTitleView__textAlignment(self, _cmd)
{ with(self)
{
    return _alignment;
}
});
instance_methods[9] = new objj_method(sel_registerName("setTextColor:"), function $_CPImageAndTitleView__setTextColor_(self, _cmd, aTextColor)
{ with(self)
{
    if (_textColor == aTextColor)
        return;
    _textColor = aTextColor;
    objj_msgSend(_titleField, "setTextColor:", aTextColor);
}
});
instance_methods[10] = new objj_method(sel_registerName("textColor"), function $_CPImageAndTitleView__textColor(self, _cmd)
{ with(self)
{
    return _textColor;
}
});
instance_methods[11] = new objj_method(sel_registerName("setFont:"), function $_CPImageAndTitleView__setFont_(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(_titleField, "setFont:", aFont);
    objj_msgSend(self, "updateTitleSize");
    objj_msgSend(self, "tile");
}
});
instance_methods[12] = new objj_method(sel_registerName("font"), function $_CPImageAndTitleView__font(self, _cmd)
{ with(self)
{
    return _font;
}
});
instance_methods[13] = new objj_method(sel_registerName("setImage:"), function $_CPImageAndTitleView__setImage_(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    var oldSize = objj_msgSend(_image, "size"),
        newSize = objj_msgSend(anImage, "size");
    _image = anImage;
    if (anImage)
    {
        if (oldSize && CGSizeEqualToSize(newSize, oldSize))
            return;
    }
    else
    {
    }
    objj_msgSend(self, "tile");
}
});
instance_methods[14] = new objj_method(sel_registerName("image"), function $_CPImageAndTitleView__image(self, _cmd)
{ with(self)
{
    return _image;
}
});
instance_methods[15] = new objj_method(sel_registerName("setTitle:"), function $_CPImageAndTitleView__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (_title == aTitle)
        return;
    _title = aTitle;
    if (objj_msgSend(_title, "length"))
    {
        if (!_titleField)
        {
            _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(_titleField, "setEditable:", NO);
            objj_msgSend(_titleField, "setFont:", _font);
            objj_msgSend(_titleField, "setAlignment:", _alignment);
            objj_msgSend(_titleField, "setTextColor:", _textColor);
            objj_msgSend(_titleField, "setHidden:", _imagePosition==CPImageOnly);
            objj_msgSend(self, "addSubview:", _titleField);
        }
        objj_msgSend(_titleField, "setStringValue:", _title);
        objj_msgSend(self, "updateTitleSize");
    }
    else
    {
        objj_msgSend(_titleField, "removeFromSuperview");
        _titleField = nil;
    }
    objj_msgSend(self, "tile");
}
});
instance_methods[16] = new objj_method(sel_registerName("title"), function $_CPImageAndTitleView__title(self, _cmd)
{ with(self)
{
    return _title;
}
});
instance_methods[17] = new objj_method(sel_registerName("updateTitleSize"), function $_CPImageAndTitleView__updateTitleSize(self, _cmd)
{ with(self)
{
    if (!_titleField)
        return;
    var size = _titleSize;
    objj_msgSend(_titleField, "sizeToFit");
    _titleSize = CGSizeMakeCopy(objj_msgSend(_titleField, "frame").size);
    objj_msgSend(_titleField, "setFrameSize:", size);
}
});
instance_methods[18] = new objj_method(sel_registerName("tile"), function $_CPImageAndTitleView__tile(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "bounds").size,
        centerX = size.width / 2.0,
        centerY = size.height / 2.0,
        titleHeight = _titleField ? _titleSize.height : 0.0,
        titleRect = CGRectMake(0.0, centerY - titleHeight / 2.0, size.width, titleHeight);
    if (_imagePosition != CPNoImage && _image)
    {
        var imageSize = objj_msgSend(_image, "size"),
            imageWidth = imageSize.width,
            imageHeight = imageSize.height;
        if (_imageScaling == CPScaleToFit)
        {
            imageWidth = size.width;
            imageHeight = size.height;
        }
        else if (_imageScaling == CPScaleProportionally)
        {
            var scale = MIN(MIN(size.width, imageWidth) / imageWidth, MIN(size.height, imageHeight) / imageHeight);
            imageWidth *= scale;
            imageHeight *= scale;
        }
        if (_imagePosition == CPImageBelow)
        {
            titleRect.origin.y = (size.height - imageHeight - titleHeight) / 2.0;
        }
        else if (_imagePosition == CPImageAbove)
        {
            titleRect.origin.y = imageHeight + (size.height - imageHeight - titleHeight) / 2.0;
        }
        else if (_imagePosition == CPImageLeft)
        {
            titleRect.origin.x += imageWidth;
            titleRect.size.width -= imageWidth;
        }
        else if (_imagePosition == CPImageRight)
        {
            titleRect.size.width -= imageWidth;
        }
        else if(_imagePosition == CPImageOnly)
        {
        }
    }
    objj_msgSend(_titleField, "setFrame:", titleRect);
}
});
instance_methods[19] = new objj_method(sel_registerName("sizeToFit"), function $_CPImageAndTitleView__sizeToFit(self, _cmd)
{ with(self)
{
    var size = CGSizeMakeZero();
    if (_imagePosition != CPNoImage && _image)
    {
        var imageSize = objj_msgSend(_image, "size");
        size.width += imageSize.width;
        size.height += imageSize.height;
    }
    if (_imagePosition != CPImageOnly && objj_msgSend(_title, "length"))
    {
        if (_imagePosition == CPImageLeft || _imagePosition == CPImageRight)
        {
            size.width += _titleSize.width;
            size.height = MAX(size.height, _titleSize.height);
        }
        else if (_imagePosition == CPImageAbove || _imagePosition == CPImageBelow)
        {
            size.width = MAX(size.width, _titleSize.width);
            size.height += _titleSize.height;
        }
        else
        {
            size.width = MAX(size.width, _titleSize.width);
            size.height = MAX(size.height, _titleSize.height);
        }
    }
    objj_msgSend(self, "setFrameSize:", size);
}
});
instance_methods[20] = new objj_method(sel_registerName("resizeSubviewsWithOldSize:"), function $_CPImageAndTitleView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "tile");
}
});
class_addMethods(the_class, instance_methods);
}

p;15;_CPWindowView.ji;8;CPView.ji;13;CPImageView.jc;12551;
var _CPWindowViewResizeIndicatorImage = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_styleMask"), new objj_ivar("_resizeIndicator"), new objj_ivar("_resizeIndicatorOffset"), new objj_ivar("_title")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPWindowView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPWindowView, "class"))
        return;
    _CPWindowViewResizeIndicatorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", self), "pathForResource:", "_CPWindowView/_CPWindowViewResizeIndicator.png"), CGSizeMake(12.0,12.0));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:forStyleMask:"), function $_CPWindowView__initWithFrame_forStyleMask_(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    if (aStyleMask & CPHUDBackgroundWindowMask)
        self = objj_msgSend(_CPHUDWindowView, "alloc");
    self._styleMask = aStyleMask;
    return objj_msgSend(self, "initWithFrame:", aFrame);
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithFrame:"), function $_CPWindowView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _resizeIndicatorOffset = CGSizeMake(0.0, 0.0);
        objj_msgSend(self, "setShowsResizeIndicator:", !(_styleMask&CPBorderlessBridgeWindowMask)&&(_styleMask&CPResizableWindowMask));
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("setTitle:"), function $_CPWindowView__setTitle_(self, _cmd, aTitle)
{ with(self)
{}
});
instance_methods[3] = new objj_method(sel_registerName("title"), function $_CPWindowView__title(self, _cmd)
{ with(self)
{
    return nil;
}
});
instance_methods[4] = new objj_method(sel_registerName("acceptsFirstMouse:"), function $_CPWindowView__acceptsFirstMouse_(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
});
instance_methods[5] = new objj_method(sel_registerName("mouseDown:"), function $_CPWindowView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
    if ((_styleMask & CPResizableWindowMask) && _resizeIndicator)
    {
        var frame = objj_msgSend(_resizeIndicator, "frame");
        if (CGRectContainsPoint(frame, objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
            return objj_msgSend(theWindow, "trackResizeWithEvent:", anEvent);
    }
    if (objj_msgSend(theWindow, "isMovableByWindowBackground"))
        objj_msgSend(theWindow, "trackMoveWithEvent:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "mouseDown:", anEvent);
}
});
instance_methods[6] = new objj_method(sel_registerName("setShowsResizeIndicator:"), function $_CPWindowView__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    if (shouldShowResizeIndicator)
    {
        var size = objj_msgSend(_CPWindowViewResizeIndicatorImage, "size"),
            boundsSize = objj_msgSend(self, "frame").size;
        _resizeIndicator = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(boundsSize.width-size.width-_resizeIndicatorOffset.width,boundsSize.height-size.height-_resizeIndicatorOffset.height,size.width,size.height));
        objj_msgSend(_resizeIndicator, "setImage:", _CPWindowViewResizeIndicatorImage);
        objj_msgSend(_resizeIndicator, "setAutoresizingMask:", CPViewMinXMargin|CPViewMinYMargin);
        objj_msgSend(self, "addSubview:positioned:relativeTo:", _resizeIndicator, CPWindowAbove, nil);
    }
    else
    {
        objj_msgSend(_resizeIndicator, "removeFromSuperview");
        _resizeIndicator = nil;
    }
}
});
instance_methods[7] = new objj_method(sel_registerName("showsResizeIndicator"), function $_CPWindowView__showsResizeIndicator(self, _cmd)
{ with(self)
{
    return _resizeIndicator != nil;
}
});
instance_methods[8] = new objj_method(sel_registerName("setResizeIndicatorOffset:"), function $_CPWindowView__setResizeIndicatorOffset_(self, _cmd, anOffset)
{ with(self)
{
    if (CGSizeEqualToSize(_resizeIndicatorOffset, anOffset))
        return;
    _resizeIndicatorOffset = anOffset;
    if (!_resizeIndicator)
        return;
    var size = objj_msgSend(_resizeIndicator, "frame").size,
        boundsSize = objj_msgSend(self, "frame").size;
    objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width-size.width-anOffset.width,boundsSize.height-size.height-anOffset.height));
}
});
instance_methods[9] = new objj_method(sel_registerName("resizeIndicatorOffset"), function $_CPWindowView__resizeIndicatorOffset(self, _cmd)
{ with(self)
{
    return _resizeIndicatorOffset;
}
});
instance_methods[10] = new objj_method(sel_registerName("setTitle:"), function $_CPWindowView__setTitle_(self, _cmd, title)
{ with(self)
{
    _title = title;
}
});
instance_methods[11] = new objj_method(sel_registerName("title"), function $_CPWindowView__title(self, _cmd)
{ with(self)
{
    return _title;
}
});
instance_methods[12] = new objj_method(sel_registerName("windowDidChangeDocumentEdited"), function $_CPWindowView__windowDidChangeDocumentEdited(self, _cmd)
{ with(self)
{}
});
instance_methods[13] = new objj_method(sel_registerName("windowDidChangeDocumentSaving"), function $_CPWindowView__windowDidChangeDocumentSaving(self, _cmd)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var _CPHUDWindowViewTopImage = nil,
    _CPHUDWindowViewTopLeftImage = nil,
    _CPHUDWindowViewTopRightImage = nil,
    _CPHUDWindowViewLeftImage = nil,
    _CPHUDWindowViewRightImage = nil,
    _CPHUDWindowViewCenterImage = nil,
    _CPHUDWindowViewBottomImage = nil,
    _CPHUDWindowViewBottomLeftImage = nil,
    _CPHUDWindowViewBottomRightImage = nil,
    _CPHUDWindowViewBackgroundColor = nil,
    CPHUDCloseButtonImage = nil;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPHUDWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_titleField"), new objj_ivar("_closeButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPHUDWindowView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPHUDWindowView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPHUDWindowViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowTopLeft.png"), CPSizeMake(15.0,86.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowTopCenter.png"), CPSizeMake(1.0,86.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowTopRight.png"), CPSizeMake(15.0,86.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCenterLeft.png"), CPSizeMake(15.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCenter.png"), CPSizeMake(1.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCenterRight.png"), CPSizeMake(15.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowBottomLeft.png"), CPSizeMake(15.0,39.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowBottomCenter.png"), CPSizeMake(1.0,39.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowBottomRight.png"), CPSizeMake(15.0,39.0))]));
    _CPHUDWindowViewCloseImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowClose.png"), CPSizeMake(20.0,20.0));
    _CPHUDWindowViewCloseActiveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCloseActive.png"), CPSizeMake(20.0,20.0));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("hitTest:"), function $_CPHUDWindowView__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    var view = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "hitTest:", aPoint);
    if (view == _titleField)
        return self;
    return view;
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithFrame:"), function $_CPHUDWindowView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "initWithFrame:", aFrame);
    if (self)
    {
        var bounds = objj_msgSend(self, "bounds");
        objj_msgSend(self, "setBackgroundColor:", _CPHUDWindowViewBackgroundColor);
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(_titleField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_titleField, "setTextShadow:", objj_msgSend(CPShadow, "shadowWithOffset:blurRadius:color:", CPSizeMake(0.0,1.0), 2.0, objj_msgSend(CPColor, "blackColor")));
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin);
        objj_msgSend(self, "addSubview:", _titleField);
        if (_styleMask & CPClosableWindowMask)
        {
            var closeSize = objj_msgSend(_CPHUDWindowViewCloseImage, "size");
            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPRectMake(10.0,7.0,closeSize.width,closeSize.height));
            objj_msgSend(_closeButton, "setBordered:", NO);
            objj_msgSend(_closeButton, "setImage:", _CPHUDWindowViewCloseImage);
            objj_msgSend(_closeButton, "setAlternateImage:", _CPHUDWindowViewCloseActiveImage);
            objj_msgSend(_closeButton, "setTarget:", self);
            objj_msgSend(_closeButton, "setAction:", sel_registerName("close:"));
            objj_msgSend(self, "addSubview:", _closeButton);
        }
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(8.0,12.0));
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("close:"), function $_CPHUDWindowView__close_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "performClose:", self);
}
});
instance_methods[3] = new objj_method(sel_registerName("setTitle:"), function $_CPHUDWindowView__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
    objj_msgSend(_titleField, "sizeToFit");
    var size = objj_msgSend(_titleField, "frame").size;
    objj_msgSend(_titleField, "setFrameOrigin:", CPPointMake((CPRectGetWidth(objj_msgSend(self, "frame"))-size.width)/2.0,(26.0-size.height)/2.0));
}
});
instance_methods[4] = new objj_method(sel_registerName("title"), function $_CPHUDWindowView__title(self, _cmd)
{ with(self)
{
    return objj_msgSend(_titleField, "stringValue");
}
});
instance_methods[5] = new objj_method(sel_registerName("setFrameSize:"), function $_CPHUDWindowView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "setFrameSize:", aSize);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;8;AppKit.ji;9;CALayer.ji;13;CPAnimation.ji;15;CPApplication.ji;10;CPButton.ji;12;CPClipView.ji;18;CPCollectionView.ji;9;CPColor.ji;14;CPColorPanel.ji;13;CPColorWell.ji;17;CPCompatibility.ji;11;CPControl.ji;10;CPCookie.ji;12;CPDocument.ji;22;CPDocumentController.ji;9;CPEvent.ji;8;CPFont.ji;15;CPFontManager.ji;12;CPGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPMenu.ji;12;CPMenuItem.ji;9;CPPanel.ji;14;CPPasteboard.ji;15;CPPopUpButton.ji;21;CPProgressIndicator.ji;13;CPResponder.ji;12;CPScroller.ji;14;CPScrollView.ji;19;CPSecureTextField.ji;20;CPSegmentedControl.ji;10;CPShadow.ji;10;CPSlider.ji;13;CPSplitView.ji;13;CPTextField.ji;11;CPToolbar.ji;15;CPToolbarItem.ji;8;CPView.ji;11;CPWebView.ji;10;CPWindow.ji;20;CPWindowController.jp;13;CAAnimation.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;6297;
{var the_class = objj_allocateClassPair(CPObject, "CAAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isRemovedOnCompletion")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("animation"), function $CAAnimation__animation(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CAAnimation__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _isRemovedOnCompletion = YES;
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("shouldArchiveValueForKey:"), function $CAAnimation__shouldArchiveValueForKey_(self, _cmd, aKey)
{ with(self)
{
    return YES;
}
});
class_methods[1] = new objj_method(sel_registerName("defaultValueForKey:"), function $CAAnimation__defaultValueForKey_(self, _cmd, aKey)
{ with(self)
{
    return nil;
}
});
instance_methods[2] = new objj_method(sel_registerName("setRemovedOnCompletion:"), function $CAAnimation__setRemovedOnCompletion_(self, _cmd, isRemovedOnCompletion)
{ with(self)
{
    _isRemovedOnCompletion = isRemovedOnCompletion;
}
});
instance_methods[3] = new objj_method(sel_registerName("removedOnCompletion"), function $CAAnimation__removedOnCompletion(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
});
instance_methods[4] = new objj_method(sel_registerName("isRemovedOnCompletion"), function $CAAnimation__isRemovedOnCompletion(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
});
instance_methods[5] = new objj_method(sel_registerName("timingFunction"), function $CAAnimation__timingFunction(self, _cmd)
{ with(self)
{
    return nil;
}
});
instance_methods[6] = new objj_method(sel_registerName("setDelegate:"), function $CAAnimation__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
});
instance_methods[7] = new objj_method(sel_registerName("delegate"), function $CAAnimation__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[8] = new objj_method(sel_registerName("runActionForKey:object:arguments:"), function $CAAnimation__runActionForKey_object_arguments_(self, _cmd, aKey, anObject, arguments)
{ with(self)
{
    objj_msgSend(anObject, "addAnimation:forKey:", self, aKey);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{var the_class = objj_allocateClassPair(CAAnimation, "CAPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_isCumulative"), new objj_ivar("_isAdditive")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("animationWithKeyPath:"), function $CAPropertyAnimation__animationWithKeyPath_(self, _cmd, aKeyPath)
{ with(self)
{
    var animation = objj_msgSend(self, "animation");
    objj_msgSend(animation, "setKeypath:", aKeyPath);
    return animation;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setKeyPath:"), function $CAPropertyAnimation__setKeyPath_(self, _cmd, aKeyPath)
{ with(self)
{
    _keyPath = aKeyPath;
}
});
instance_methods[1] = new objj_method(sel_registerName("keyPath"), function $CAPropertyAnimation__keyPath(self, _cmd)
{ with(self)
{
    return _keyPath;
}
});
instance_methods[2] = new objj_method(sel_registerName("setCumulative:"), function $CAPropertyAnimation__setCumulative_(self, _cmd, isCumulative)
{ with(self)
{
    _isCumulative = isCumulative;
}
});
instance_methods[3] = new objj_method(sel_registerName("cumulative"), function $CAPropertyAnimation__cumulative(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
});
instance_methods[4] = new objj_method(sel_registerName("isCumulative"), function $CAPropertyAnimation__isCumulative(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
});
instance_methods[5] = new objj_method(sel_registerName("setAdditive:"), function $CAPropertyAnimation__setAdditive_(self, _cmd, isAdditive)
{ with(self)
{
    _isAdditive = isAdditive;
}
});
instance_methods[6] = new objj_method(sel_registerName("additive"), function $CAPropertyAnimation__additive(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
});
instance_methods[7] = new objj_method(sel_registerName("isAdditive"), function $CAPropertyAnimation__isAdditive(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{var the_class = objj_allocateClassPair(CAPropertyAnimation, "CABasicAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fromValue"), new objj_ivar("_toValue"), new objj_ivar("_byValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setFromValue:"), function $CABasicAnimation__setFromValue_(self, _cmd, aValue)
{ with(self)
{
    _fromValue = aValue;
}
});
instance_methods[1] = new objj_method(sel_registerName("fromValue"), function $CABasicAnimation__fromValue(self, _cmd)
{ with(self)
{
    return _fromValue;
}
});
instance_methods[2] = new objj_method(sel_registerName("setToValue:"), function $CABasicAnimation__setToValue_(self, _cmd, aValue)
{ with(self)
{
    _toValue = aValue;
}
});
instance_methods[3] = new objj_method(sel_registerName("toValue"), function $CABasicAnimation__toValue(self, _cmd)
{ with(self)
{
    return _toValue;
}
});
instance_methods[4] = new objj_method(sel_registerName("setByValue:"), function $CABasicAnimation__setByValue_(self, _cmd, aValue)
{ with(self)
{
    _byValue = aValue;
}
});
instance_methods[5] = new objj_method(sel_registerName("byValue"), function $CABasicAnimation__byValue(self, _cmd)
{ with(self)
{
    return _byValue;
}
});
class_addMethods(the_class, instance_methods);
}

p;16;CABackingStore.ji;12;CGGeometry.ji;17;CPCompatibility.jc;841;
CABackingStoreGetContext= function(aBackingStore)
{
    return aBackingStore.context;
}
if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
CABackingStoreCreate = function()
{
    var DOMElement = document.createElement("canvas");
    DOMElement.style.position = "absolute";
    return { context:DOMElement.getContext("2d"), buffer:DOMElement, _image:DOMElement };
}
CABackingStoreSetSize = function(aBackingStore, aSize)
{
    var buffer = aBackingStore.buffer;
    buffer.width = aSize.width;
    buffer.height = aSize.height;
    buffer.style.width = aSize.width + "px";;
    buffer.style.height = aSize.height + "px";;
}
}
else
{
CABackingStoreCreate = function()
{
    var context = CGBitmapGraphicsContextCreate();
    context.buffer = "";
    return { context:context };
}
CABackingStoreSetSize = function(aBackingStore, aSize)
{
}
}

p;14;CAFlashLayer.ji;9;CALayer.ji;14;CPFlashMovie.jc;1207;
{var the_class = objj_allocateClassPair(CALayer, "CAFlashLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setFlashMovie:"), function $CAFlashLayer__setFlashMovie_(self, _cmd, aFlashMovie)
{ with(self)
{
    if (_flashMovie == aFlashMovie)
        return;
    _flashMovie = aFlashMovie;
    _DOMElement.innerHTML = "<object width = \"100%\" height = \"100%\"><param name = \"movie\" value = \"" +
                            aFlashMovie._fileName +
                            "\"></param><param name = \"wmode\" value = \"transparent\"></param><embed src = \"" +
                            aFlashMovie._fileName + "\" type = \"application/x-shockwave-flash\" wmode = \"transparent\" width = \"100%\" height = \"100%\"></embed></object>";
}
});
instance_methods[1] = new objj_method(sel_registerName("flashMovie"), function $CAFlashLayer__flashMovie(self, _cmd)
{ with(self)
{
    return _flashMovie;
}
});
class_addMethods(the_class, instance_methods);
}

p;9;CALayer.jI;21;Foundation/CPObject.jI;23;AppKit/CABackingStore.jI;18;AppKit/CGContext.jI;19;AppKit/CGGeometry.ji;12;CGGeometry.jc;38129;
CGAffineTransformMake= function(a, b, c, d, tx, ty) { return { a:a, b:b, c:c, d:d, tx:tx, ty:ty }; }
CGAffineTransformMakeIdentity= function() { return { a:1.0, b:0.0, c:0.0, d:1.0, tx:0.0, ty:0.0 }; }
CGAffineTransformMakeCopy= function(anAffineTransform) { return { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty }; }
CGAffineTransformMakeScale= function(sx, sy) { return { a:sx, b:0.0, c:0.0, d:sy, tx:0.0, ty:0.0 }; }
CGAffineTransformMakeTranslation= function(tx, ty) { return { a:1.0, b:0.0, c:0.0, d:1.0, tx:tx, ty:ty }; }
CGAffineTransformTranslate= function(aTransform, tx, ty) { return { a:aTransform.a, b:aTransform.b, c:aTransform.c, d:aTransform.d, tx:aTransform.tx + aTransform.a * tx + aTransform.c * ty, ty:aTransform.ty + aTransform.b * tx + aTransform.d * ty }; }
CGAffineTransformScale= function(aTransform, sx, sy) { return { a:aTransform.a * sx, b:aTransform.b * sx, c:aTransform.c * sy, d:aTransform.d * sy, tx:aTransform.tx, ty:aTransform.ty }; }
CGAffineTransformConcat= function(lhs, rhs) { return { a:lhs.a * rhs.a + lhs.b * rhs.c, b:lhs.a * rhs.b + lhs.b * rhs.d, c:lhs.c * rhs.a + lhs.d * rhs.c, d:lhs.c * rhs.b + lhs.d * rhs.d, tx:lhs.tx * rhs.a + lhs.ty * rhs.c + rhs.tx, ty:lhs.tx * rhs.b + lhs.ty * rhs.d + rhs.ty }; }
CGPointApplyAffineTransform= function(aPoint, aTransform) { return { x:aPoint.x * aTransform.a + aPoint.y * aTransform.c + aTransform.tx, y:aPoint.x * aTransform.b + aPoint.y * aTransform.d + aTransform.ty }; }
CGSizeApplyAffineTransform= function(aSize, aTransform) { return { width:aSize.width * aTransform.a + aSize.height * aTransform.c, height:aSize.width * aTransform.b + aSize.height * aTransform.d }; }
CGAffineTransformIsIdentity= function(aTransform) { return (aTransform.a == 1 && aTransform.b == 0 && aTransform.c == 0 && aTransform.d == 1 && aTransform.tx == 0 && aTransform.ty == 0); }
CGAffineTransformEqualToTransform= function(lhs, rhs) { return (lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c && lhs.d == rhs.d && lhs.tx == rhs.tx && lhs.ty == rhs.ty); }
CGStringCreateWithCGAffineTransform= function(aTransform) { return (" [[ " + aTransform.a + ", " + aTransform.b + ", 0 ], [ " + aTransform.c + ", " + aTransform.d + ", 0 ], [ " + aTransform.tx + ", " + aTransform.ty + ", 1]]"); }
CGAffineTransformCreateCopy= function(aTransform)
{
    return { a:aTransform.a, b:aTransform.b, c:aTransform.c, d:aTransform.d, tx:aTransform.tx, ty:aTransform.ty };
}
CGAffineTransformMakeRotation= function(anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return { a:cos, b:sin, c:-sin, d:cos, tx:0.0, ty:0.0 };
}
CGAffineTransformRotate= function(aTransform, anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return {
            a:aTransform.a * cos + aTransform.c * sin,
            b:aTransform.b * cos + aTransform.d * sin,
            c:aTransform.c * cos - aTransform.a * sin,
            d:aTransform.d * cos - aTransform.b * sin,
            tx:aTransform.tx,
            ty:aTransform.ty
        };
}
CGAffineTransformInvert= function(aTransform)
{
    var determinant = 1 / (aTransform.a * aTransform.d - aTransform.b * aTransform.c);
    return {
        a:determinant * aTransform.d,
        b:-determinant * aTransform.b,
        c:-determinant * aTransform.c,
        d:determinant * aTransform.a,
        tx:determinant * (aTransform.c * aTransform.ty - aTransform.d * aTransform.tx),
        ty:determinant * (aTransform.b * aTransform.tx - aTransform.a * aTransform.ty)
    };
}
CGRectApplyAffineTransform= function(aRect, anAffineTransform)
{
    var top = (aRect.origin.y),
        left = (aRect.origin.x),
        right = (aRect.origin.x + aRect.size.width),
        bottom = (aRect.origin.y + aRect.size.height),
        topLeft = CGPointApplyAffineTransform({ x:left, y:top }, anAffineTransform),
        topRight = CGPointApplyAffineTransform({ x:right, y:top }, anAffineTransform),
        bottomLeft = CGPointApplyAffineTransform({ x:left, y:bottom }, anAffineTransform),
        bottomRight = CGPointApplyAffineTransform({ x:right, y:bottom }, anAffineTransform),
        minX = MIN(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        maxX = MAX(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        minY = MIN(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y),
        maxY = MAX(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y);
    return { origin: { x:minX, y:minY }, size: { width:(maxX - minX), height:(maxY - minY) } };
}
CPStringFromCGAffineTransform= function(anAffineTransform)
{
    return '{' + anAffineTransform.a + ", " + anAffineTransform.b + ", " + anAffineTransform.c + ", " + anAffineTransform.d + ", " + anAffineTransform.tx + ", " + anAffineTransform.ty + '}';
}
var CALayerGeometryBoundsMask = 1,
    CALayerGeometryPositionMask = 2,
    CALayerGeometryAnchorPointMask = 4,
    CALayerGeometryAffineTransformMask = 8,
    CALayerGeometryParentSublayerTransformMask = 16;
var USE_BUFFER = NO;
var CALayerFrameOriginUpdateMask = 1,
    CALayerFrameSizeUpdateMask = 2,
    CALayerZPositionUpdateMask = 4,
    CALayerDisplayUpdateMask = 8,
    CALayerCompositeUpdateMask = 16,
    CALayerDOMUpdateMask = CALayerZPositionUpdateMask | CALayerFrameOriginUpdateMask | CALayerFrameSizeUpdateMask;
var CALayerRegisteredRunLoopUpdates = nil;
{var the_class = objj_allocateClassPair(CPObject, "CALayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_position"), new objj_ivar("_zPosition"), new objj_ivar("_anchorPoint"), new objj_ivar("_affineTransform"), new objj_ivar("_sublayerTransform"), new objj_ivar("_sublayerTransformForSublayers"), new objj_ivar("_backingStoreFrame"), new objj_ivar("_standardBackingStoreFrame"), new objj_ivar("_hasSublayerTransform"), new objj_ivar("_hasCustomBackingStoreFrame"), new objj_ivar("_opacity"), new objj_ivar("_isHidden"), new objj_ivar("_backgroundColor"), new objj_ivar("_superlayer"), new objj_ivar("_sublayers"), new objj_ivar("_runLoopUpdateMask"), new objj_ivar("_needsDisplayOnBoundsChange"), new objj_ivar("_delegate"), new objj_ivar("_delegateRespondsToDisplayLayerSelector"), new objj_ivar("_delegateRespondsToDrawLayerInContextSelector"), new objj_ivar("_DOMElement"), new objj_ivar("_DOMContentsElement"), new objj_ivar("_contents"), new objj_ivar("_context"), new objj_ivar("_owningView"), new objj_ivar("_transformToLayer"), new objj_ivar("_transformFromLayer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("layer"), function $CALayer__layer(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "init");
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CALayer__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _frame = CGRectMakeZero();

        _backingStoreFrame = CGRectMakeZero();
        _standardBackingStoreFrame = CGRectMakeZero();

        _bounds = CGRectMakeZero();
        _position = CGPointMakeZero();
        _zPosition = 0.0;
        _anchorPoint = CGPointMake(0.5, 0.5);
        _affineTransform = CGAffineTransformMakeIdentity();
        _sublayerTransform = CGAffineTransformMakeIdentity();

        _transformToLayer = CGAffineTransformMakeIdentity();
        _transformFromLayer = CGAffineTransformMakeIdentity();

        _opacity = 1.0;
        _isHidden = NO;
        _masksToBounds = NO;

        _sublayers = [];

        _DOMElement = document.createElement("div");

        _DOMElement.style.overflow = "visible";
        _DOMElement.style.position = "absolute";
        _DOMElement.style.visibility = "visible";
        _DOMElement.style.top = "0px";
        _DOMElement.style.left = "0px";
        _DOMElement.style.zIndex = 0;
        _DOMElement.style.width = "0px";
        _DOMElement.style.height = "0px";
    }

    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setBounds:"), function $CALayer__setBounds_(self, _cmd, aBounds)
{ with(self)
{
    if (CGRectEqualToRect(_bounds, aBounds))
        return;

    var oldOrigin = _bounds.origin;

    _bounds = { origin: { x:aBounds.origin.x, y:aBounds.origin.y }, size: { width:aBounds.size.width, height:aBounds.size.height } };

    if (_hasSublayerTransform)
        _CALayerUpdateSublayerTransformForSublayers(self);
    _CALayerRecalculateGeometry(self, CALayerGeometryBoundsMask);
}
});
instance_methods[2] = new objj_method(sel_registerName("bounds"), function $CALayer__bounds(self, _cmd)
{ with(self)
{
    return _bounds;
}
});
instance_methods[3] = new objj_method(sel_registerName("setPosition:"), function $CALayer__setPosition_(self, _cmd, aPosition)
{ with(self)
{
    if (CGPointEqualToPoint(_position, aPosition))
        return;
    _position = { x:aPosition.x, y:aPosition.y };
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask);
}
});
instance_methods[4] = new objj_method(sel_registerName("position"), function $CALayer__position(self, _cmd)
{ with(self)
{
    return _position;
}
});
instance_methods[5] = new objj_method(sel_registerName("setZPosition:"), function $CALayer__setZPosition_(self, _cmd, aZPosition)
{ with(self)
{
    if (_zPosition == aZPosition)
        return;
    _zPosition = aZPosition;
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerZPositionUpdateMask);
}
});
instance_methods[6] = new objj_method(sel_registerName("setAnchorPoint:"), function $CALayer__setAnchorPoint_(self, _cmd, anAnchorPoint)
{ with(self)
{
    anAnchorPoint = { x:anAnchorPoint.x, y:anAnchorPoint.y };
    anAnchorPoint.x = MIN(1.0, MAX(0.0, anAnchorPoint.x));
    anAnchorPoint.y = MIN(1.0, MAX(0.0, anAnchorPoint.y));
    if (CGPointEqualToPoint(_anchorPoint, anAnchorPoint))
        return;
    _anchorPoint = anAnchorPoint;
    if (_hasSublayerTransform)
        _CALayerUpdateSublayerTransformForSublayers(self);
    if (_owningView)
        _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryAnchorPointMask);
}
});
instance_methods[7] = new objj_method(sel_registerName("anchorPoint"), function $CALayer__anchorPoint(self, _cmd)
{ with(self)
{
    return _anchorPoint;
}
});
instance_methods[8] = new objj_method(sel_registerName("setAffineTransform:"), function $CALayer__setAffineTransform_(self, _cmd, anAffineTransform)
{ with(self)
{
    if (CGAffineTransformEqualToTransform(_affineTransform, anAffineTransform))
        return;
    _affineTransform = { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty };
    _CALayerRecalculateGeometry(self, CALayerGeometryAffineTransformMask);
}
});
instance_methods[9] = new objj_method(sel_registerName("affineTransform"), function $CALayer__affineTransform(self, _cmd)
{ with(self)
{
    return _affineTransform;
}
});
instance_methods[10] = new objj_method(sel_registerName("setSublayerTransform:"), function $CALayer__setSublayerTransform_(self, _cmd, anAffineTransform)
{ with(self)
{
    if (CGAffineTransformEqualToTransform(_sublayerTransform, anAffineTransform))
        return;
    var hadSublayerTransform = _hasSublayerTransform;
    _sublayerTransform = { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty };
    _hasSublayerTransform = !(_sublayerTransform.a == 1 && _sublayerTransform.b == 0 && _sublayerTransform.c == 0 && _sublayerTransform.d == 1 && _sublayerTransform.tx == 0 && _sublayerTransform.ty == 0);
    if (_hasSublayerTransform)
    {
        _CALayerUpdateSublayerTransformForSublayers(self);
        var index = _sublayers.length;
        while (index--)
            _CALayerRecalculateGeometry(_sublayers[index], CALayerGeometryParentSublayerTransformMask);
    }
}
});
instance_methods[11] = new objj_method(sel_registerName("sublayerTransform"), function $CALayer__sublayerTransform(self, _cmd)
{ with(self)
{
    return _sublayerTransform;
}
});
instance_methods[12] = new objj_method(sel_registerName("transformToLayer"), function $CALayer__transformToLayer(self, _cmd)
{ with(self)
{
    return _transformToLayer;
}
});
instance_methods[13] = new objj_method(sel_registerName("setFrame:"), function $CALayer__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    alert("FIXME IMPLEMENT");
}
});
instance_methods[14] = new objj_method(sel_registerName("frame"), function $CALayer__frame(self, _cmd)
{ with(self)
{
    if (!_frame)
        _frame = objj_msgSend(self, "convertRect:toLayer:", _bounds, _superlayer);
    return _frame;
}
});
instance_methods[15] = new objj_method(sel_registerName("backingStoreFrame"), function $CALayer__backingStoreFrame(self, _cmd)
{ with(self)
{
    return _backingStoreFrame;
}
});
instance_methods[16] = new objj_method(sel_registerName("setBackingStoreFrame:"), function $CALayer__setBackingStoreFrame_(self, _cmd, aFrame)
{ with(self)
{
    _hasCustomBackingStoreFrame = (aFrame != nil);
    if (aFrame == nil)
        aFrame = CGRectMakeCopy(_standardBackingStoreFrame);
    else
    {
        if (_superlayer)
        {
            aFrame = objj_msgSend(_superlayer, "convertRect:toLayer:", aFrame, nil);
            var bounds = objj_msgSend(_superlayer, "bounds"),
                frame = objj_msgSend(_superlayer, "convertRect:toLayer:", bounds, nil);
            aFrame.origin.x -= (frame.origin.x);
            aFrame.origin.y -= (frame.origin.y);
        }
        else
            aFrame = CGRectMakeCopy(aFrame);
    }
    if (!CGPointEqualToPoint(_backingStoreFrame.origin, aFrame.origin))
        objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerFrameOriginUpdateMask);
    if (!CGSizeEqualToSize(_backingStoreFrame.size, aFrame.size))
        objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerFrameSizeUpdateMask);
    _backingStoreFrame = aFrame;
}
});
instance_methods[17] = new objj_method(sel_registerName("contents"), function $CALayer__contents(self, _cmd)
{ with(self)
{
    return _contents;
}
});
instance_methods[18] = new objj_method(sel_registerName("setContents:"), function $CALayer__setContents_(self, _cmd, contents)
{ with(self)
{
    if (_contents == contents)
        return;
    _contents = contents;
    objj_msgSend(self, "composite");
}
});
instance_methods[19] = new objj_method(sel_registerName("composite"), function $CALayer__composite(self, _cmd)
{ with(self)
{
    if (USE_BUFFER && !_contents || !_context)
        return;
    CGContextClearRect(_context, { origin: { x:0.0, y:0.0 }, size: { width:(_backingStoreFrame.size.width), height:(_backingStoreFrame.size.height) } });
    var transform = _transformFromLayer;
    if (_superlayer)
    {
        var superlayerTransform = _CALayerGetTransform(_superlayer, nil),
            superlayerOrigin = CGPointApplyAffineTransform(_superlayer._bounds.origin, superlayerTransform);
        transform = CGAffineTransformConcat(transform, superlayerTransform);
        transform.tx -= superlayerOrigin.x;
        transform.ty -= superlayerOrigin.y;
    }
    transform.tx -= (_backingStoreFrame.origin.x);
    transform.ty -= (_backingStoreFrame.origin.y);
    CGContextSaveGState(_context);
    CGContextConcatCTM(_context, transform);
    if (USE_BUFFER)
    {
        _context.drawImage(_contents.buffer, (_bounds.origin.x), (_bounds.origin.y));
    }
    else
        objj_msgSend(self, "drawInContext:", _context);
    CGContextRestoreGState(_context);
}
});
instance_methods[20] = new objj_method(sel_registerName("display"), function $CALayer__display(self, _cmd)
{ with(self)
{
    if (!_context)
    {
        _context = CGBitmapGraphicsContextCreate();
        _DOMContentsElement = _context.DOMElement;
        _DOMContentsElement.style.zIndex = -100;
        _DOMContentsElement.style.overflow = "hidden";
        _DOMContentsElement.style.position = "absolute";
        _DOMContentsElement.style.visibility = "visible";
        _DOMContentsElement.width = ROUND((_backingStoreFrame.size.width));
        _DOMContentsElement.height = ROUND((_backingStoreFrame.size.height));
        _DOMContentsElement.style.top = "0px";
        _DOMContentsElement.style.left = "0px";
        _DOMContentsElement.style.width = ROUND((_backingStoreFrame.size.width)) + "px";
        _DOMContentsElement.style.height = ROUND((_backingStoreFrame.size.height)) + "px";
        _DOMElement.appendChild(_DOMContentsElement);
    }
    if (USE_BUFFER)
    {
        if (_delegateRespondsToDisplayLayerSelector)
            return objj_msgSend(_delegate, "displayInLayer:", self);
        if ((_backingStoreFrame.size.width) == 0.0 || (_backingStoreFrame.size.height) == 0.0)
            return;
        if (!_contents)
            _contents = CABackingStoreCreate();
        CABackingStoreSetSize(_contents, _bounds.size);
        objj_msgSend(self, "drawInContext:", CABackingStoreGetContext(_contents));
    }
    objj_msgSend(self, "composite");
}
});
instance_methods[21] = new objj_method(sel_registerName("drawInContext:"), function $CALayer__drawInContext_(self, _cmd, aContext)
{ with(self)
{
    if (_backgroundColor)
    {
        CGContextSetFillColor(aContext, _backgroundColor);
        CGContextFillRect(aContext, _bounds);
    }
    if (_delegateRespondsToDrawLayerInContextSelector)
        objj_msgSend(_delegate, "drawLayer:inContext:", self, aContext);
}
});
instance_methods[22] = new objj_method(sel_registerName("opacity"), function $CALayer__opacity(self, _cmd)
{ with(self)
{
    return _opacity;
}
});
instance_methods[23] = new objj_method(sel_registerName("setOpacity:"), function $CALayer__setOpacity_(self, _cmd, anOpacity)
{ with(self)
{
    if (_opacity == anOpacity)
        return;
    _opacity = anOpacity;
    _DOMElement.style.opacity = anOpacity;
    _DOMElement.style.filter = "alpha(opacity=" + anOpacity * 100 + ")";
}
});
instance_methods[24] = new objj_method(sel_registerName("setHidden:"), function $CALayer__setHidden_(self, _cmd, isHidden)
{ with(self)
{
    _isHidden = isHidden;
    _DOMElement.style.display = isHidden ? "none" : "block";
}
});
instance_methods[25] = new objj_method(sel_registerName("hidden"), function $CALayer__hidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
});
instance_methods[26] = new objj_method(sel_registerName("isHidden"), function $CALayer__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
});
instance_methods[27] = new objj_method(sel_registerName("setMasksToBounds:"), function $CALayer__setMasksToBounds_(self, _cmd, masksToBounds)
{ with(self)
{
    if (_masksToBounds == masksToBounds)
        return;
    _masksToBounds = masksToBounds;
    _DOMElement.style.overflow = _masksToBounds ? "hidden" : "visible";
}
});
instance_methods[28] = new objj_method(sel_registerName("setBackgroundColor:"), function $CALayer__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    _backgroundColor = aColor;
    objj_msgSend(self, "setNeedsDisplay");
}
});
instance_methods[29] = new objj_method(sel_registerName("backgroundColor"), function $CALayer__backgroundColor(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
});
instance_methods[30] = new objj_method(sel_registerName("sublayers"), function $CALayer__sublayers(self, _cmd)
{ with(self)
{
    return _sublayers;
}
});
instance_methods[31] = new objj_method(sel_registerName("superlayer"), function $CALayer__superlayer(self, _cmd)
{ with(self)
{
    return _superlayer;
}
});
instance_methods[32] = new objj_method(sel_registerName("addSublayer:"), function $CALayer__addSublayer_(self, _cmd, aLayer)
{ with(self)
{
    objj_msgSend(self, "insertSublayer:atIndex:", aLayer, _sublayers.length);
    return;
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "addObject:", aLayer);
    _DOMElement.appendChild(aLayer._DOMElement);
}
});
instance_methods[33] = new objj_method(sel_registerName("removeFromSuperlayer"), function $CALayer__removeFromSuperlayer(self, _cmd)
{ with(self)
{
    if (_owningView)
        objj_msgSend(_owningView, "setLayer:", nil);
    if (!_superlayer)
        return;
    _superlayer._DOMElement.removeChild(_DOMElement);
    objj_msgSend(_superlayer._sublayers, "removeObject:", self);
    _superlayer = nil;
}
});
instance_methods[34] = new objj_method(sel_registerName("insertSublayer:atIndex:"), function $CALayer__insertSublayer_atIndex_(self, _cmd, aLayer, anIndex)
{ with(self)
{
    if (!aLayer)
        return;
    var superlayer = objj_msgSend(aLayer, "superlayer");
    if (superlayer == self)
    {
        var index = objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aLayer);
        if (index == anIndex)
            return;
        objj_msgSend(_sublayers, "removeObjectAtIndex:", index);
        if (index < anIndex)
            --anIndex;
    }
    else if (superlayer != nil)
        objj_msgSend(aLayer, "removeFromSuperlayer");
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "insertObject:atIndex:", aLayer, anIndex);
    if (anIndex >= _sublayers.length - 1)
        _DOMElement.appendChild(aLayer._DOMElement);
    else
        _DOMElement.insertBefore(aLayer._DOMElement, _sublayers[anIndex+1]._DOMElement);
    aLayer._superlayer = self;
    if (self != superlayer)
        _CALayerRecalculateGeometry(aLayer, 0xFFFFFFF);
}
});
instance_methods[35] = new objj_method(sel_registerName("insertSublayer:below:"), function $CALayer__insertSublayer_below_(self, _cmd, aLayer, aSublayer)
{ with(self)
{
    var index = aSublayer ? objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer) : 0;
    objj_msgSend(self, "insertSublayer:atIndex:", aLayer, index==CPNotFound?_sublayers.length:index);
}
});
instance_methods[36] = new objj_method(sel_registerName("insertSublayer:above:"), function $CALayer__insertSublayer_above_(self, _cmd, aLayer, aSublayer)
{ with(self)
{
    var index = aSublayer ? objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer) : _sublayers.length;
    if (index == CPNotFound)
        objj_msgSend(CPException, "raise:reason:", "CALayerNotFoundException", "aSublayer is not a sublayer of this layer");
    objj_msgSend(_sublayers, "insertObject:atIndex:", aLayer, index==CPNotFound?_sublayers.length:index+1);
}
});
instance_methods[37] = new objj_method(sel_registerName("replaceSublayer:with:"), function $CALayer__replaceSublayer_with_(self, _cmd, aSublayer, aLayer)
{ with(self)
{
    if (aSublayer == aLayer)
        return;
    if (aSublayer._superlayer != self)
    {
        alert("EXCEPTION");
        return;
    }
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "replaceObjectAtIndex:withObject:", objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer), aLayer);
    _DOMElement.replaceChild(aSublayer._DOMElement, aLayer._DOMElement);
}
});
class_methods[1] = new objj_method(sel_registerName("runLoopUpdateLayers"), function $CALayer__runLoopUpdateLayers(self, _cmd)
{ with(self)
{if (window.oops) {alert(window.latest); objj_debug_print_backtrace();}
    window.loop = true;
    for (hash in CALayerRegisteredRunLoopUpdates)
    {
        var layer = CALayerRegisteredRunLoopUpdates[hash],
            mask = layer._runLoopUpdateMask;
        if (mask & CALayerDOMUpdateMask)
            _CALayerUpdateDOM(layer, mask);
        if (mask & CALayerDisplayUpdateMask)
            objj_msgSend(layer, "display");
        else if (mask & CALayerFrameSizeUpdateMask || mask & CALayerCompositeUpdateMask)
            objj_msgSend(layer, "composite");
        layer._runLoopUpdateMask = 0;
    }
    window.loop= false;
    CALayerRegisteredRunLoopUpdates = nil;
}
});
instance_methods[38] = new objj_method(sel_registerName("registerRunLoopUpdateWithMask:"), function $CALayer__registerRunLoopUpdateWithMask_(self, _cmd, anUpdateMask)
{ with(self)
{
    if (CALayerRegisteredRunLoopUpdates == nil)
    {
        CALayerRegisteredRunLoopUpdates = {};
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_registerName("runLoopUpdateLayers"), CALayer, nil, 0, [CPDefaultRunLoopMode]);
    }
    _runLoopUpdateMask |= anUpdateMask;
    CALayerRegisteredRunLoopUpdates[objj_msgSend(self, "hash")] = self;
}
});
instance_methods[39] = new objj_method(sel_registerName("setNeedsComposite"), function $CALayer__setNeedsComposite(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerCompositeUpdateMask);
}
});
instance_methods[40] = new objj_method(sel_registerName("setNeedsDisplay"), function $CALayer__setNeedsDisplay(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerDisplayUpdateMask);
}
});
instance_methods[41] = new objj_method(sel_registerName("setNeedsDisplayOnBoundsChange:"), function $CALayer__setNeedsDisplayOnBoundsChange_(self, _cmd, needsDisplayOnBoundsChange)
{ with(self)
{
    _needsDisplayOnBoundsChange = needsDisplayOnBoundsChange;
}
});
instance_methods[42] = new objj_method(sel_registerName("needsDisplayOnBoundsChange"), function $CALayer__needsDisplayOnBoundsChange(self, _cmd)
{ with(self)
{
    return _needsDisplayOnBoundsChange;
}
});
instance_methods[43] = new objj_method(sel_registerName("setNeedsDisplayInRect:"), function $CALayer__setNeedsDisplayInRect_(self, _cmd, aRect)
{ with(self)
{
    _dirtyRect = aRect;
    objj_msgSend(self, "display");
}
});
instance_methods[44] = new objj_method(sel_registerName("convertPoint:fromLayer:"), function $CALayer__convertPoint_fromLayer_(self, _cmd, aPoint, aLayer)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(aLayer, self));
}
});
instance_methods[45] = new objj_method(sel_registerName("convertPoint:toLayer:"), function $CALayer__convertPoint_toLayer_(self, _cmd, aPoint, aLayer)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(self, aLayer));
}
});
instance_methods[46] = new objj_method(sel_registerName("convertRect:fromLayer:"), function $CALayer__convertRect_fromLayer_(self, _cmd, aRect, aLayer)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(aLayer, self));
}
});
instance_methods[47] = new objj_method(sel_registerName("convertRect:toLayer:"), function $CALayer__convertRect_toLayer_(self, _cmd, aRect, aLayer)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(self, aLayer));
}
});
instance_methods[48] = new objj_method(sel_registerName("containsPoint:"), function $CALayer__containsPoint_(self, _cmd, aPoint)
{ with(self)
{
    return (aPoint.x >= (_bounds.origin.x) && aPoint.y >= (_bounds.origin.y) && aPoint.x < (_bounds.origin.x + _bounds.size.width) && aPoint.y < (_bounds.origin.y + _bounds.size.height));
}
});
instance_methods[49] = new objj_method(sel_registerName("hitTest:"), function $CALayer__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    if (_isHidden)
        return nil;
    var point = CGPointApplyAffineTransform(aPoint, _transformToLayer);
    if (!(point.x >= (_bounds.origin.x) && point.y >= (_bounds.origin.y) && point.x < (_bounds.origin.x + _bounds.size.width) && point.y < (_bounds.origin.y + _bounds.size.height)))
        return nil;
    var layer = nil,
        index = _sublayers.length;
    while (index--)
        if (layer = objj_msgSend(_sublayers[index], "hitTest:", point))
            return layer;
    return self;
}
});
instance_methods[50] = new objj_method(sel_registerName("setDelegate:"), function $CALayer__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _delegateRespondsToDisplayLayerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("displayLayer:"));
    _delegateRespondsToDrawLayerInContextSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("drawLayer:inContext:"));
    if (_delegateRespondsToDisplayLayerSelector || _delegateRespondsToDrawLayerInContextSelector)
        objj_msgSend(self, "setNeedsDisplay");
}
});
instance_methods[51] = new objj_method(sel_registerName("delegate"), function $CALayer__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[52] = new objj_method(sel_registerName("_setOwningView:"), function $CALayer___setOwningView_(self, _cmd, anOwningView)
{ with(self)
{
    _owningView = anOwningView;
    if (_owningView)
    {
        _owningView = anOwningView;
        _bounds.size = CGSizeMakeCopy(objj_msgSend(_owningView, "bounds").size);
        _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    }
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
}
});
instance_methods[53] = new objj_method(sel_registerName("_owningViewBoundsChanged"), function $CALayer___owningViewBoundsChanged(self, _cmd)
{ with(self)
{
    _bounds.size = CGSizeMakeCopy(objj_msgSend(_owningView, "bounds").size);
    _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
}
});
instance_methods[54] = new objj_method(sel_registerName("_update"), function $CALayer___update(self, _cmd)
{ with(self)
{
    window.loop = true;
    var mask = _runLoopUpdateMask;
    if (mask & CALayerDOMUpdateMask)
        _CALayerUpdateDOM(self, mask);
    if (mask & CALayerDisplayUpdateMask)
        objj_msgSend(self, "display");
    else if (mask & CALayerFrameSizeUpdateMask || mask & CALayerCompositeUpdateMask)
        objj_msgSend(self, "composite");
    _runLoopUpdateMask = 0;
    window.loop = false;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
_CALayerUpdateSublayerTransformForSublayers= function(aLayer)
{
    var bounds = aLayer._bounds,
        anchorPoint = aLayer._anchorPoint,
        translateX = (bounds.size.width) * anchorPoint.x,
        translateY = (bounds.size.height) * anchorPoint.y;
    aLayer._sublayerTransformForSublayers = CGAffineTransformConcat(
        CGAffineTransformMakeTranslation(-translateX, -translateY),
        CGAffineTransformConcat(aLayer._sublayerTransform,
        CGAffineTransformMakeTranslation(translateX, translateY)));
}
_CALayerUpdateDOM= function(aLayer, aMask)
{
    var DOMElementStyle = aLayer._DOMElement.style;
    if (aMask & CALayerZPositionUpdateMask)
        DOMElementStyle.zIndex = aLayer._zPosition;
    var frame = aLayer._backingStoreFrame;
    if (aMask & CALayerFrameOriginUpdateMask)
    {
        DOMElementStyle.top = ROUND((frame.origin.y)) + "px";
        DOMElementStyle.left = ROUND((frame.origin.x)) + "px";
    }
    if (aMask & CALayerFrameSizeUpdateMask)
    {
        var width = MAX(0.0, ROUND((frame.size.width))),
            height = MAX(0.0, ROUND((frame.size.height))),
            DOMContentsElement = aLayer._DOMContentsElement;
        DOMElementStyle.width = width + "px";
        DOMElementStyle.height = height + "px";
        if (DOMContentsElement)
        {
            DOMContentsElement.width = width;
            DOMContentsElement.height = height;
            DOMContentsElement.style.width = width + "px";
            DOMContentsElement.style.height = height + "px";
        }
    }
}
_CALayerRecalculateGeometry= function(aLayer, aGeometryChange)
{
    var bounds = aLayer._bounds,
        superlayer = aLayer._superlayer,
        width = (bounds.size.width),
        height = (bounds.size.height),
        position = aLayer._position,
        anchorPoint = aLayer._anchorPoint,
        affineTransform = aLayer._affineTransform,
        backingStoreFrameSize = { width:aLayer._backingStoreFrame.width, height:aLayer._backingStoreFrame.height },
        hasCustomBackingStoreFrame = aLayer._hasCustomBackingStoreFrame;
    aLayer._transformFromLayer = CGAffineTransformConcat(
        CGAffineTransformMakeTranslation(-width * anchorPoint.x - (aLayer._bounds.origin.x), -height * anchorPoint.y - (aLayer._bounds.origin.y)),
        CGAffineTransformConcat(affineTransform,
        CGAffineTransformMakeTranslation(position.x, position.y)));
    if (superlayer && superlayer._hasSublayerTransform)
    {
        var tx = aLayer._transformFromLayer.tx * superlayer._sublayerTransformForSublayers.a + aLayer._transformFromLayer.ty * superlayer._sublayerTransformForSublayers.c + superlayer._sublayerTransformForSublayers.tx;aLayer._transformFromLayer.ty = aLayer._transformFromLayer.tx * superlayer._sublayerTransformForSublayers.b + aLayer._transformFromLayer.ty * superlayer._sublayerTransformForSublayers.d + superlayer._sublayerTransformForSublayers.ty;aLayer._transformFromLayer.tx = tx;var a = aLayer._transformFromLayer.a * superlayer._sublayerTransformForSublayers.a + aLayer._transformFromLayer.b * superlayer._sublayerTransformForSublayers.c, b = aLayer._transformFromLayer.a * superlayer._sublayerTransformForSublayers.b + aLayer._transformFromLayer.b * superlayer._sublayerTransformForSublayers.d, c = aLayer._transformFromLayer.c * superlayer._sublayerTransformForSublayers.a + aLayer._transformFromLayer.d * superlayer._sublayerTransformForSublayers.c;aLayer._transformFromLayer.d = aLayer._transformFromLayer.c * superlayer._sublayerTransformForSublayers.b + aLayer._transformFromLayer.d * superlayer._sublayerTransformForSublayers.d;aLayer._transformFromLayer.a = a;aLayer._transformFromLayer.b = b;aLayer._transformFromLayer.c = c;;
    }
    aLayer._transformToLayer = CGAffineTransformInvert(aLayer._transformFromLayer);
    aLayer._frame = nil;
    aLayer._standardBackingStoreFrame = objj_msgSend(aLayer, "convertRect:toLayer:", bounds, nil);
    if (superlayer)
    {
        var bounds = objj_msgSend(superlayer, "bounds"),
            frame = objj_msgSend(superlayer, "convertRect:toLayer:", bounds, nil);
        aLayer._standardBackingStoreFrame.origin.x -= (frame.origin.x);
        aLayer._standardBackingStoreFrame.origin.y -= (frame.origin.y);
    }
    var origin = aLayer._standardBackingStoreFrame.origin,
        size = aLayer._standardBackingStoreFrame.size;
    origin.x = FLOOR(origin.x);
    origin.y = FLOOR(origin.y);
    size.width = CEIL(size.width) + 1.0;
    size.height = CEIL(size.height) + 1.0;
    if (!hasCustomBackingStoreFrame)
    {
        var backingStoreFrame = CGRectMakeCopy(aLayer._standardBackingStoreFrame);
        if (ROUND((backingStoreFrame.origin.x)) != ROUND((aLayer._backingStoreFrame.origin.x)) ||
            ROUND((backingStoreFrame.origin.y)) != ROUND((aLayer._backingStoreFrame.origin.y)))
            objj_msgSend(aLayer, "registerRunLoopUpdateWithMask:", CALayerFrameOriginUpdateMask);
        if (((backingStoreFrame.size.width) != ROUND((aLayer._backingStoreFrame.size.width)) ||
            (backingStoreFrame.size.height) != ROUND((aLayer._backingStoreFrame.size.height))))
            objj_msgSend(aLayer, "registerRunLoopUpdateWithMask:", CALayerFrameSizeUpdateMask);
        aLayer._backingStoreFrame = backingStoreFrame;
    }
    if (aGeometryChange & CALayerGeometryBoundsMask && aLayer._needsDisplayOnBoundsChange)
        objj_msgSend(aLayer, "setNeedsDisplay");
    else if (hasCustomBackingStoreFrame || (aGeometryChange & ~(CALayerGeometryPositionMask | CALayerGeometryAnchorPointMask)))
        objj_msgSend(aLayer, "setNeedsComposite");
    var sublayers = aLayer._sublayers,
        index = 0,
        count = sublayers.length;
    for (; index < count; ++index)
        _CALayerRecalculateGeometry(sublayers[index], aGeometryChange);
}
_CALayerGetTransform= function(fromLayer, toLayer)
{
    var transform = CGAffineTransformMakeIdentity();
    if (fromLayer)
    {
        var layer = fromLayer;
        while (layer && layer != toLayer)
        {
            var transformFromLayer = layer._transformFromLayer;
            var tx = transform.tx * transformFromLayer.a + transform.ty * transformFromLayer.c + transformFromLayer.tx;transform.ty = transform.tx * transformFromLayer.b + transform.ty * transformFromLayer.d + transformFromLayer.ty;transform.tx = tx;var a = transform.a * transformFromLayer.a + transform.b * transformFromLayer.c, b = transform.a * transformFromLayer.b + transform.b * transformFromLayer.d, c = transform.c * transformFromLayer.a + transform.d * transformFromLayer.c;transform.d = transform.c * transformFromLayer.b + transform.d * transformFromLayer.d;transform.a = a;transform.b = b;transform.c = c;;
            layer = layer._superlayer;
        }
        if (layer == toLayer)
            return transform;
    }
    var layers = [],
        layer = toLayer;
    while (layer)
    {
        layers.push(layer);
        layer = layer._superlayer;
    }
    var index = layers.length;
    while (index--)
    {
        var transformToLayer = layers[index]._transformToLayer;
        var tx = transform.tx * transformToLayer.a + transform.ty * transformToLayer.c + transformToLayer.tx;transform.ty = transform.tx * transformToLayer.b + transform.ty * transformToLayer.d + transformToLayer.ty;transform.tx = tx;var a = transform.a * transformToLayer.a + transform.b * transformToLayer.c, b = transform.a * transformToLayer.b + transform.b * transformToLayer.d, c = transform.c * transformToLayer.a + transform.d * transformToLayer.c;transform.d = transform.c * transformToLayer.b + transform.d * transformToLayer.d;transform.a = a;transform.b = b;transform.c = c;;
    }
    return transform;
}

p;23;CAMediaTimingFunction.jI;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;3236;
kCAMediaTimingFunctionLinear = "kCAMediaTimingFunctionLinear";
kCAMediaTimingFunctionEaseIn = "kCAMediaTimingFunctionEaseIn";
kCAMediaTimingFunctionEaseOut = "kCAMediaTimingFunctionEaseOut";
kCAMediaTimingFunctionEaseInEaseOut = "kCAMediaTimingFunctionEaseInEaseOut";
var CAMediaNamedTimingFunctions = nil;
{var the_class = objj_allocateClassPair(CPObject, "CAMediaTimingFunction"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_c1x"), new objj_ivar("_c1y"), new objj_ivar("_c2x"), new objj_ivar("_c2y")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("functionWithName:"), function $CAMediaTimingFunction__functionWithName_(self, _cmd, aName)
{ with(self)
{
    if (!CAMediaNamedTimingFunctions)
    {
        CAMediaNamedTimingFunctions = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.0, 0.0, 1.0, 1.0), kCAMediaTimingFunctionLinear);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.42, 0.0, 1.0, 1.0), kCAMediaTimingFunctionEaseIn);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.0, 0.0, 0.58, 1.0), kCAMediaTimingFunctionEaseOut);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.42, 0.0, 0.58, 1.0), kCAMediaTimingFunctionEaseInEaseOut);
    }
    return objj_msgSend(CAMediaNamedTimingFunctions, "objectForKey:", aName);
}
});
class_methods[1] = new objj_method(sel_registerName("functionWithControlPoints::::"), function $CAMediaTimingFunction__functionWithControlPoints____(self, _cmd, c1x, c1y, c2x, c2y)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithControlPoints::::", c1x, c1y, c2x, c2y);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithControlPoints::::"), function $CAMediaTimingFunction__initWithControlPoints____(self, _cmd, c1x, c1y, c2x, c2y)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _c1x = c1x;
        _c1y = c1y;
        _c2x = c2x;
        _c2y = c2y;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("getControlPointAtIndex:values:"), function $CAMediaTimingFunction__getControlPointAtIndex_values_(self, _cmd, anIndex, reference)
{ with(self)
{
    if (anIndex == 0)
    {
        reference[0] = 0;
        reference[1] = 0;
    }
    else if (anIndex == 1)
    {
        reference[0] = _c1x;
        reference[1] = _c1y;
    }
    else if (anIndex == 2)
    {
        reference[0] = _c2x;
        reference[1] = _c2y;
    }
    else
    {
        reference[0] = 1.0;
        reference[0] = 1.0;
    }
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;19;CGAffineTransform.ji;12;CGGeometry.jc;4830;
CGAffineTransformMake= function(a, b, c, d, tx, ty) { return { a:a, b:b, c:c, d:d, tx:tx, ty:ty }; }
CGAffineTransformMakeIdentity= function() { return { a:1.0, b:0.0, c:0.0, d:1.0, tx:0.0, ty:0.0 }; }
CGAffineTransformMakeCopy= function(anAffineTransform) { return { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty }; }
CGAffineTransformMakeScale= function(sx, sy) { return { a:sx, b:0.0, c:0.0, d:sy, tx:0.0, ty:0.0 }; }
CGAffineTransformMakeTranslation= function(tx, ty) { return { a:1.0, b:0.0, c:0.0, d:1.0, tx:tx, ty:ty }; }
CGAffineTransformTranslate= function(aTransform, tx, ty) { return { a:aTransform.a, b:aTransform.b, c:aTransform.c, d:aTransform.d, tx:aTransform.tx + aTransform.a * tx + aTransform.c * ty, ty:aTransform.ty + aTransform.b * tx + aTransform.d * ty }; }
CGAffineTransformScale= function(aTransform, sx, sy) { return { a:aTransform.a * sx, b:aTransform.b * sx, c:aTransform.c * sy, d:aTransform.d * sy, tx:aTransform.tx, ty:aTransform.ty }; }
CGAffineTransformConcat= function(lhs, rhs) { return { a:lhs.a * rhs.a + lhs.b * rhs.c, b:lhs.a * rhs.b + lhs.b * rhs.d, c:lhs.c * rhs.a + lhs.d * rhs.c, d:lhs.c * rhs.b + lhs.d * rhs.d, tx:lhs.tx * rhs.a + lhs.ty * rhs.c + rhs.tx, ty:lhs.tx * rhs.b + lhs.ty * rhs.d + rhs.ty }; }
CGPointApplyAffineTransform= function(aPoint, aTransform) { return { x:aPoint.x * aTransform.a + aPoint.y * aTransform.c + aTransform.tx, y:aPoint.x * aTransform.b + aPoint.y * aTransform.d + aTransform.ty }; }
CGSizeApplyAffineTransform= function(aSize, aTransform) { return { width:aSize.width * aTransform.a + aSize.height * aTransform.c, height:aSize.width * aTransform.b + aSize.height * aTransform.d }; }
CGAffineTransformIsIdentity= function(aTransform) { return (aTransform.a == 1 && aTransform.b == 0 && aTransform.c == 0 && aTransform.d == 1 && aTransform.tx == 0 && aTransform.ty == 0); }
CGAffineTransformEqualToTransform= function(lhs, rhs) { return (lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c && lhs.d == rhs.d && lhs.tx == rhs.tx && lhs.ty == rhs.ty); }
CGStringCreateWithCGAffineTransform= function(aTransform) { return (" [[ " + aTransform.a + ", " + aTransform.b + ", 0 ], [ " + aTransform.c + ", " + aTransform.d + ", 0 ], [ " + aTransform.tx + ", " + aTransform.ty + ", 1]]"); }
CGAffineTransformCreateCopy= function(aTransform)
{
    return { a:aTransform.a, b:aTransform.b, c:aTransform.c, d:aTransform.d, tx:aTransform.tx, ty:aTransform.ty };
}
CGAffineTransformMakeRotation= function(anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return { a:cos, b:sin, c:-sin, d:cos, tx:0.0, ty:0.0 };
}
CGAffineTransformRotate= function(aTransform, anAngle)
{
    var sin = SIN(anAngle),
        cos = COS(anAngle);
    return {
            a:aTransform.a * cos + aTransform.c * sin,
            b:aTransform.b * cos + aTransform.d * sin,
            c:aTransform.c * cos - aTransform.a * sin,
            d:aTransform.d * cos - aTransform.b * sin,
            tx:aTransform.tx,
            ty:aTransform.ty
        };
}
CGAffineTransformInvert= function(aTransform)
{
    var determinant = 1 / (aTransform.a * aTransform.d - aTransform.b * aTransform.c);
    return {
        a:determinant * aTransform.d,
        b:-determinant * aTransform.b,
        c:-determinant * aTransform.c,
        d:determinant * aTransform.a,
        tx:determinant * (aTransform.c * aTransform.ty - aTransform.d * aTransform.tx),
        ty:determinant * (aTransform.b * aTransform.tx - aTransform.a * aTransform.ty)
    };
}
CGRectApplyAffineTransform= function(aRect, anAffineTransform)
{
    var top = (aRect.origin.y),
        left = (aRect.origin.x),
        right = (aRect.origin.x + aRect.size.width),
        bottom = (aRect.origin.y + aRect.size.height),
        topLeft = CGPointApplyAffineTransform({ x:left, y:top }, anAffineTransform),
        topRight = CGPointApplyAffineTransform({ x:right, y:top }, anAffineTransform),
        bottomLeft = CGPointApplyAffineTransform({ x:left, y:bottom }, anAffineTransform),
        bottomRight = CGPointApplyAffineTransform({ x:right, y:bottom }, anAffineTransform),
        minX = MIN(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        maxX = MAX(topLeft.x, topRight.x, bottomLeft.x, bottomRight.x),
        minY = MIN(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y),
        maxY = MAX(topLeft.y, topRight.y, bottomLeft.y, bottomRight.y);
    return { origin: { x:minX, y:minY }, size: { width:(maxX - minX), height:(maxY - minY) } };
}
CPStringFromCGAffineTransform= function(anAffineTransform)
{
    return '{' + anAffineTransform.a + ", " + anAffineTransform.b + ", " + anAffineTransform.c + ", " + anAffineTransform.d + ", " + anAffineTransform.tx + ", " + anAffineTransform.ty + '}';
}

p;9;CGColor.ji;14;CGColorSpace.jc;3014;
var CFTypeGlobalCount = 0;
CFHashCode= function(aCFObject)
{
    if (!aCFObject.hash)
        aCFObject.hash = ++CFTypeGlobalCount;
    return aCFObject;
}
kCGColorWhite = "kCGColorWhite";
kCGColorBlack = "kCGColorBlack";
kCGColorClear = "kCGColorClear";
var _CGColorMap = { };
CGColorGetConstantColor= function(aColorName)
{
    alert("FIX ME");
}
CGColorRetain= function(aColor)
{
    return aColor;
}
CGColorRelease= function()
{
}
CGColorCreate= function(aColorSpace, components)
{
    if (!aColorSpace || !components)
        return NULL;
    var components = components.slice();
    CGColorSpaceStandardizeComponents(aColorSpace, components);
    var UID = CFHashCode(aColorSpace) + components.join("");
    if (_CGColorMap[UID])
        return _CGColorMap[UID];
    return _CGColorMap[UID] = { colorspace:aColorSpace, pattern:NULL, components:components };
}
CGColorCreateCopy= function(aColor)
{
    return aColor;
}
CGColorCreateGenericGray= function(gray, alpha)
{
    return CGColorCreate(0, [gray,alpha]);
}
CGColorCreateGenericRGB= function(red, green, blue, alpha)
{
    return CGColorCreate(0, [red,green,blue,alpha]);
}
CGColorCreateGenericCMYK= function(cyan, magenta, yellow, black, alpha)
{
    return CGColorCreate(0, [cyan,magenta,yellow,black,alpha]);
}
CGColorCreateCopyWithAlpha= function(aColor, anAlpha)
{
    var components = aColor.components;
    if (!aColor || anAlpha == components[components.length-1])
     return aColor;
    if (aColor.pattern)
        var copy = CGColorCreateWithPattern(aColor.colorspace, aColor.pattern, components);
    else
        var copy = CGColorCreate(aColor.colorspace, components);
    copy.components[components.length-1] = anAlpha;
    return copy;
}
CGColorCreateWithPattern= function(aColorSpace, aPattern, components)
{
    if (!aColorSpace || !aPattern || !components)
        return NULL;
    return { colorspace:aColorSpace, pattern:aPattern, components:components.slice() };
}
CGColorEqualToColor= function(lhs, rhs)
{
    if (lhs == rhs)
        return true;
    if (!lhs || !rhs)
        return false;
    var lhsComponents = lhs.components,
        rhsComponents = rhs.components,
        lhsComponentCount = lhsComponents.length;
    if (lhsComponentCount != rhsComponents.length)
        return false;
    while (lhsComponentCount--)
        if (lhsComponents[lhsComponentCount] != rhsComponents[lhsComponentCount])
            return false;
    if (lhs.pattern != rhs.pattern)
        return false;
    if (CGColorSpaceEqualToColorSpace(lhs.colorspace, rhs.colorspace))
        return false;
    return true;
}
CGColorGetAlpha= function(aColor)
{
    var components = aColor.components;
    return components[components.length-1];
}
CGColorGetColorSpace= function(aColor)
{
    return aColor.colorspace;
}
CGColorGetComponents= function(aColor)
{
    return aColor.components;
}
CGColorGetNumberOfComponents= function(aColor)
{
    return aColor.components.length;
}
CGColorGetPattern= function(aColor)
{
    return aColor.pattern;
}

p;14;CGColorSpace.jc;4672;kCGColorSpaceModelUnknown = -1;
kCGColorSpaceModelMonochrome = 0;
kCGColorSpaceModelRGB = 1;
kCGColorSpaceModelCMYK = 2;
kCGColorSpaceModelLab = 3;
kCGColorSpaceModelDeviceN = 4;
kCGColorSpaceModelIndexed = 5;
kCGColorSpaceModelPattern = 6;
kCGColorSpaceGenericGray = "CGColorSpaceGenericGray";
kCGColorSpaceGenericRGB = "CGColorSpaceGenericRGB";
kCGColorSpaceGenericCMYK = "CGColorSpaceGenericCMYK";
kCGColorSpaceGenericRGBLinear = "CGColorSpaceGenericRGBLinear";
kCGColorSpaceGenericRGBHDR = "CGColorSpaceGenericRGBHDR";
kCGColorSpaceAdobeRGB1998 = "CGColorSpaceAdobeRGB1998";
kCGColorSpaceSRGB = "CGColorSpaceSRGB";
var _CGNamedColorSpaces = {};
CGColorSpaceCreateCalibratedGray= function(aWhitePoint, aBlackPoint, gamma)
{
    return { model:kCGColorSpaceModelMonochrome, count:1, base:NULL };
}
CGColorSpaceCreateCalibratedRGB= function(aWhitePoint, aBlackPoint, gamma)
{
    return { model:kCGColorSpaceModelRGB, count:1, base:NULL };
}
CGColorSpaceCreateICCBased= function(aComponentCount, range, profile, alternate)
{
    return NULL;
}
CGColorSpaceCreateLab= function(aWhitePoint, aBlackPoint, aRange)
{
    return NULL;
}
CGColorSpaceCreateDeviceCMYK= function()
{
    return CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK);
}
CGColorSpaceCreateDeviceGray= function()
{
    return CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
}
CGColorSpaceCreateDeviceRGB= function()
{
    return CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
}
CGColorSpaceCreateWithPlatformColorSpace= function()
{
    return NULL;
}
CGColorSpaceCreateIndexed= function(aBaseColorSpace, lastIndex, colorTable)
{
    return NULL;
}
CGColorSpaceCreatePattern= function(aBaseColorSpace)
{
    if (aBaseColorSpace)
        return { model:kCGColorSpaceModelPattern, count:aBaseColorSpace.count, base:aBaseColorSpace };
    return { model:kCGColorSpaceModelPattern, count:0, base:NULL };
}
CGColorSpaceCreateWithName= function(aName)
{
    var colorSpace = _CGNamedColorSpaces[aName];
    if (colorSpace)
        return colorSpace;
    switch (aName)
    {
        case kCGColorSpaceGenericGray: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelMonochrome, count:1, base:NULL };
        case kCGColorSpaceGenericRGB: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelRGB, count:3, base:NULL };
        case kCGColorSpaceGenericCMYK: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelCMYK, count:4, base:NULL };
        case kCGColorSpaceGenericRGBLinear: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelRGB, count:3, base:NULL };
        case kCGColorSpaceGenericRGBHDR: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelRGB, count:3, base:NULL };
        case kCGColorSpaceAdobeRGB1998: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelRGB, count:3, base:NULL };
        case kCGColorSpaceSRGB: return _CGNamedColorSpaces[aName] = { model:kCGColorSpaceModelRGB, count:3, base:NULL };
    }
    return NULL;
}
CGColorSpaceCopyICCProfile= function(aColorSpace)
{
    return NULL;
}
CGColorSpaceGetNumberOfComponents= function(aColorSpace)
{
    return aColorSpace.count;
}
CGColorSpaceGetTypeID= function(aColorSpace)
{
}
CGColorSpaceGetModel= function(aColorSpace)
{
    return aColorSpace.model;
}
CGColorSpaceGetBaseColorSpace= function(aColorSpace)
{
}
CGColorSpaceGetColorTableCount= function(aColorSpace)
{
}
CGColorSpaceGetColorTable= function(aColorSpace)
{
}
CGColorSpaceRelease= function(aColorSpace)
{
}
CGColorSpaceRetain= function(aColorSpace)
{
    return aColorSpace;
}
CGColorSpaceStandardizeComponents= function(aColorSpace, components)
{
    var count = aColorSpace.count;
    { if (count > components.length) { components[count] = 1; return; } var component = components[count]; if (component < 0) components[count] = 0; else if (component > 1) components[count] = 1; else components[count] = ROUND(component * 1000) / 1000; };
    if (aColorSpace.base)
        aColorSpace = aColorSpace.base;
    switch (aColorSpace.model)
    {
        case kCGColorSpaceModelMonochrome:
        case kCGColorSpaceModelRGB:
        case kCGColorSpaceModelCMYK:
        case kCGColorSpaceModelDeviceN: while (count--)
                                                { if (count > components.length) { components[count] = 1; return; } var component = components[count]; if (component < 0) components[count] = 0; else if (component > 1) components[count] = 1; else components[count] = ROUND(component * 255) / 255; };
                                            break;
        case kCGColorSpaceModelIndexed:
        case kCGColorSpaceModelLab:
        case kCGColorSpaceModelPattern: break;
    }
}

p;11;CGContext.ji;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;30654;
kCGLineCapButt = 0;
kCGLineCapRound = 1;
kCGLineCapSquare = 2;
kCGLineJoinMiter = 0;
kCGLineJoinRound = 1;
kCGLineJoinBevel = 2;
kCGPathFill = 0;
kCGPathEOFill = 1;
kCGPathStroke = 2;
kCGPathFillStroke = 3;
kCGPathEOFillStroke = 4;
kCGBlendModeNormal = 0;
kCGBlendModeMultiply = 1;
kCGBlendModeScreen = 2;
kCGBlendModeOverlay = 3;
kCGBlendModeDarken = 4;
kCGBlendModeLighten = 5;
kCGBlendModeColorDodge = 6;
kCGBlendModeColorBurn = 7;
kCGBlendModeSoftLight = 8;
kCGBlendModeHardLight = 9;
kCGBlendModeDifference = 10;
kCGBlendModeExclusion = 11;
kCGBlendModeHue = 12;
kCGBlendModeSaturation = 13;
kCGBlendModeColor = 14;
kCGBlendModeLuminosity = 15;
kCGBlendModeClear = 16;
kCGBlendModeCopy = 17;
kCGBlendModeSourceIn = 18;
kCGBlendModeSourceOut = 19;
kCGBlendModeSourceAtop = 20;
kCGBlendModeDestinationOver = 21;
kCGBlendModeDestinationIn = 22;
kCGBlendModeDestinationOut = 23;
kCGBlendModeDestinationAtop = 24;
kCGBlendModeXOR = 25;
kCGBlendModePlusDarker = 26;
kCGBlendModePlusLighter = 27;
CGContextRelease= function()
{
}
CGContextRetain= function(aContext)
{
    return aContext;
}
if (!CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
CGGStateCreate= function()
{
    return { strokeStyle:"#000", fillStyle:"#ccc", lineWidth:1.0, lineJoin:kCGLineJoinMiter, lineCap:kCGLineCapButt, miterLimit:10.0, globalAlpha:1.0,
        blendMode:kCGBlendModeNormal,
        shadowOffset:{ width:0.0, height:0.0 }, shadowBlur:0.0, shadowColor:NULL, CTM:{ a:1.0, b:0.0, c:0.0, d:1.0, tx:0.0, ty:0.0 } };
}
CGGStateCreateCopy= function(aGState)
{
    return { strokeStyle:aGState.strokeStyle, fillStyle:aGState.fillStyle, lineWidth:aGState.lineWidth,
        lineJoin:aGState.lineJoin, lineCap:aGState.lineCap, miterLimit:aGState.miterLimit, globalAlpha:aGState.globalAlpha,
        blendMode:aGState.blendMode,
        shadowOffset:aGState.shadowOffset, shadowBlur:aGState.shadowBlur, shadowColor:aGState.shadowColor, CTM:{ a:aGState.CTM.a, b:aGState.CTM.b, c:aGState.CTM.c, d:aGState.CTM.d, tx:aGState.CTM.tx, ty:aGState.CTM.ty } };
}
CGBitmapGraphicsContextCreate= function()
{
    return { DOMElement:document.createElement("div"), path:NULL, gState:CGGStateCreate(), gStateStack:[] };
}
CGContextSaveGState= function(aContext)
{
    aContext.gStateStack.push(CGGStateCreateCopy(aContext.gState));
}
CGContextRestoreGState= function(aContext)
{
    aContext.gState = aContext.gStateStack.pop();
}
CGContextSetLineCap= function(aContext, aLineCap)
{
    aContext.gState.lineCap = aLineCap;
}
CGContextSetLineJoin= function(aContext, aLineJoin)
{
    aContext.gState.lineJoin = aLineJoin;
}
CGContextSetLineWidth= function(aContext, aLineWidth)
{
    aContext.gState.lineWidth = aLineWidth;
}
CGContextSetMiterLimit= function(aContext, aMiterLimit)
{
    aContext.gState.miterLimit = aMiterLimit;
}
CGContextSetBlendMode= function(aContext, aBlendMode)
{
    aContext.gState.blendMode = aBlendMode;
}
CGContextAddArc= function(aContext, x, y, radius, startAngle, endAngle, clockwise)
{
    CGPathAddArc(aContext.path, aContext.gState.CTM, x, y, radius, startAngle, endAngle, clockwise);
}
CGContextAddArcToPoint= function(aContext, x1, y1, x2, y2, radius)
{
    CGPathAddArcToPoint(aContext.path, aContext.gState.CTM, x1, y1, x2, y2, radius);
}
CGContextAddCurveToPoint= function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
{
    CGPathAddCurveToPoint(aContext.path, aContext.gState.CTM, cp1x, cp1y, cp2x, cp2y, x, y);
}
CGContextAddLines= function(aContext, points, count)
{
    CGPathAddLines(aContext.path, aContext.gState.CTM, points, count);
}
CGContextAddLineToPoint= function(aContext, x, y)
{
    CGPathAddLineToPoint(aContext.path, aContext.gState.CTM, x, y);
}
CGContextAddPath= function(aContext, aPath)
{
    if (!aContext || CGPathIsEmpty(aPath))
        return;
    if (!aContext.path)
        aContext.path = CGPathCreateMutable();
    CGPathAddPath(aContext.path, aContext.gState.CTM, aPath);
}
CGContextAddQuadCurveToPoint= function(aContext, cpx, cpy, x, y)
{
    CGPathAddQuadCurveToPoint(aContext.path, aContext.gState.CTM, cpx, cpy, x, y);
}
CGContextAddRect= function(aContext, aRect)
{
    CGPathAddRect(aContext.path, aContext.gState.CTM, aRect);
}
CGContextAddRects= function(aContext, rects, count)
{
    CGPathAddRects(aContext.path, aContext.gState.CTM, rects, count);
}
CGContextBeginPath= function(aContext)
{
    aContext.path = CGPathCreateMutable();
}
CGContextClosePath= function(aContext)
{
    CGPathCloseSubpath(aContext.path);
}
CGContextMoveToPoint= function(aContext, x, y)
{
    if (!aContext.path)
        aContext.path = CGPathCreateMutable();
    CGPathMoveToPoint(aContext.path, aContext.gState.CTM, x, y);
}
CGContextFillRect= function(aContext, aRect)
{
    CGContextFillRects(aContext, [aRect], 1);
}
CGContextFillRects= function(aContext, rects, count)
{
    if (arguments["count"] == NULL)
        var count = rects.length;
    CGContextBeginPath(aContext);
    CGContextAddRects(aContext, rects, count);
    CGContextClosePath(aContext);
    CGContextDrawPath(aContext, kCGPathFill);
}
CGContextStrokeRect= function(aContext, aRect)
{
    CGContextBeginPath(aContext);
    CGContextAddRect(aContext, aRect);
    CGContextClosePath(aContext);
    CGContextDrawPath(aContext, kCGPathStroke);
}
CGContextStrokeRectWithWidth= function(aContext, aRect, aWidth)
{
    CGContextSaveGState(aContext);
    CGContextSetLineWidth(aContext, aWidth);
    CGContextStrokeRect(aContext, aRect);
    CGContextRestoreGState(aContext);
}
CGContextConcatCTM= function(aContext, aTransform)
{
    var CTM = aContext.gState.CTM;
    var tx = CTM.tx * aTransform.a + CTM.ty * aTransform.c + aTransform.tx;CTM.ty = CTM.tx * aTransform.b + CTM.ty * aTransform.d + aTransform.ty;CTM.tx = tx;var a = CTM.a * aTransform.a + CTM.b * aTransform.c, b = CTM.a * aTransform.b + CTM.b * aTransform.d, c = CTM.c * aTransform.a + CTM.d * aTransform.c;CTM.d = CTM.c * aTransform.b + CTM.d * aTransform.d;CTM.a = a;CTM.b = b;CTM.c = c;;
}
CGContextGetCTM= function(aContext)
{
    return aContext.gState.CTM;
}
CGContextRotateCTM= function(aContext, anAngle)
{
    var gState = aContext.gState;
    gState.CTM = CGAffineTransformRotate(gState.CTM, anAngle);
}
CGContextScaleCTM= function(aContext, sx, sy)
{
    var gState = aContext.gState;
    gState.CTM = { a:gState.CTM.a * sx, b:gState.CTM.b * sx, c:gState.CTM.c * sy, d:gState.CTM.d * sy, tx:gState.CTM.tx, ty:gState.CTM.ty };
}
CGContextTranslateCTM= function(aContext, tx, ty)
{
    var gState = aContext.gState;
    gState.CTM = { a:gState.CTM.a, b:gState.CTM.b, c:gState.CTM.c, d:gState.CTM.d, tx:gState.CTM.tx + gState.CTM.a * tx + gState.CTM.c * ty, ty:gState.CTM.ty + gState.CTM.b * tx + gState.CTM.d * ty };
}
CGContextSetShadow= function(aContext, aSize, aBlur)
{
    var gState = aContext.gState;
    gState.shadowOffset = { width:aSize.width, height:aSize.height };
    gState.shadowBlur = aBlur;
    gState.shadowColor = objj_msgSend(CPColor, "shadowColor");
}
CGContextSetShadowWithColor= function(aContext, aSize, aBlur, aColor)
{
    var gState = aContext.gState;
    gState.shadowOffset = { width:aSize.width, height:aSize.height };
    gState.shadowBlur = aBlur;
    gState.shadowColor = aColor;
}
}
CGContextEOFillPath= function(aContext)
{
    CGContextDrawPath(aContext, kCGPathEOFill);
}
CGContextFillPath= function(aContext)
{
    CGContextDrawPath(aContext, kCGPathFill);
}
var KAPPA = 4.0 * ((SQRT2 - 1.0) / 3.0);
CGContextAddEllipseInRect= function(aContext, aRect)
{
 CGContextBeginPath(aContext);
 if ((aRect.size.width) == (aRect.size.height))
     CGContextAddArc(aContext, (aRect.origin.x + (aRect.size.width) / 2.0), (aRect.origin.y + (aRect.size.height) / 2.0), (aRect.size.width) / 2.0, 0.0, 2 * PI, YES);
 else
 {
     var axis = { width:(aRect.size.width) / 2.0, height:(aRect.size.height) / 2.0 },
         center = { x:(aRect.origin.x) + axis.width, y:(aRect.origin.y) + axis.height };
     CGContextMoveToPoint(aContext, center.x, center.y - axis.height);
     CGContextAddCurveToPoint(aContext, center.x + (KAPPA * axis.width), center.y - axis.height, center.x + axis.width, center.y - (KAPPA * axis.height), center.x + axis.width, center.y);
     CGContextAddCurveToPoint(aContext, center.x + axis.width, center.y + (KAPPA * axis.height), center.x + (KAPPA * axis.width), center.y + axis.height, center.x, center.y + axis.height);
     CGContextAddCurveToPoint(aContext, center.x - (KAPPA * axis.width), center.y + axis.height, center.x - axis.width, center.y + (KAPPA * axis.height), center.x - axis.width, center.y);
     CGContextAddCurveToPoint(aContext, center.x - axis.width, center.y - (KAPPA * axis.height), center.x - (KAPPA * axis.width), center.y - axis.height, center.x, center.y - axis.height);
 }
 CGContextClosePath(aContext);
}
CGContextFillEllipseInRect= function(aContext, aRect)
{
    CGContextAddEllipseInRect(aContext, aRect);
    CGContextFillPath(aContext);
}
CGContextStrokeEllipseInRect= function(aContext, aRect)
{
    CGContextAddEllipseInRect(aContext, aRect);
    CGContextStrokePath(aContext);
}
CGContextStrokePath= function(aContext)
{
    CGContextDrawPath(aContext, kCGPathStroke);
}
CGContextStrokeLineSegments= function(aContext, points, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = points.length;
    CGContextBeginPath(aContext);
    for (; i < count; i += 2)
    {
        CGContextMoveToPoint(aContext, points[i].x, points[i].y);
        CGContextAddLineToPoint(aContext, points[i+1].x, points[i+1].y);
    }
    CGContextStrokePath(aContext);
}
CGContextSetFillColor= function(aContext, aColor)
{
    if (aColor)
        aContext.gState.fillStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetStrokeColor= function(aContext, aColor)
{
    if (aColor)
        aContext.gState.strokeStyle = objj_msgSend(aColor, "cssString");
}
CGContextFillRoundedRectangleInRect= function(aContext, aRect, aRadius, ne, se, sw, nw)
{
    var xMin = (aRect.origin.x),
        xMax = (aRect.origin.x + aRect.size.width),
        yMin = (aRect.origin.y),
        yMax = (aRect.origin.y + aRect.size.height);
    CGContextBeginPath(aContext);
    CGContextMoveToPoint(aContext, xMin + aRadius, yMin);
 if (ne)
 {
  CGContextAddLineToPoint(aContext, xMax - aRadius, yMin);
  CGContextAddCurveToPoint(aContext, xMax - aRadius, yMin, xMax, yMin, xMax, yMin + aRadius);
 }
 else
  CGContextAddLineToPoint(aContext, xMax, yMin);
 if (se)
 {
  CGContextAddLineToPoint(aContext, xMax, yMax - aRadius);
  CGContextAddCurveToPoint(aContext, xMax, yMax - aRadius, xMax, yMax, xMax - aRadius, yMax);
 }
 else
  CGContextAddLineToPoint(aContext, xMax, yMax);
 if (sw)
 {
  CGContextAddLineToPoint(aContext, xMin + aRadius, yMax);
  CGContextAddCurveToPoint(aContext, xMin + aRadius, yMax, xMin, yMax, xMin, yMax - aRadius);
 }
 else
  CGContextAddLineToPoint(aContext, xMin, yMax);
 if (nw)
 {
  CGContextAddLineToPoint(aContext, xMin, yMin + aRadius);
  CGContextAddCurveToPoint(aContext, xMin, yMin + aRadius, xMin, yMin, xMin + aRadius, yMin);
 } else
  CGContextAddLineToPoint(aContext, xMin, yMin);
 CGContextClosePath(aContext);
    CGContextFillPath(aContext);
}
if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
var CANVAS_LINECAP_TABLE = ["butt","round","square"],
    CANVAS_LINEJOIN_TABLE = ["miter","round","bevel"],
    CANVAS_COMPOSITE_TABLE = ["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState= function(aContext)
{
    aContext.save();
}
CGContextRestoreGState= function(aContext)
{
    aContext.restore();
}
CGContextSetLineCap= function(aContext, aLineCap)
{
    aContext.lineCap = CANVAS_LINECAP_TABLE[aLineCap];
}
CGContextSetLineJoin= function(aContext, aLineJoin)
{
    aContext.lineJoin = CANVAS_LINEJOIN_TABLE[aLineJoin];
}
CGContextSetLineWidth= function(aContext, aLineWidth)
{
    aContext.lineWidth = aLineWidth;
}
CGContextSetMiterLimit= function(aContext, aMiterLimit)
{
    aContext.miterLimit = aMiterLimit;
}
CGContextSetBlendMode= function(aContext, aBlendMode)
{
    aContext.globalCompositeOperation = CANVAS_COMPOSITE_TABLE[aBlendMode];
}
CGContextAddArc= function(aContext, x, y, radius, startAngle, endAngle, clockwise)
{
    aContext.arc(x, y, radius, startAngle, endAngle, !clockwise);
}
CGContextAddArcToPoint= function(aContext, x1, y1, x2, y2, radius)
{
    aContext.arcTo(x1, y1, x2, y2, radius);
}
CGContextAddCurveToPoint= function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
{
    aContext.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y);
}
CGContextAddLineToPoint= function(aContext, x, y)
{
    aContext.lineTo(x, y);
}
CGContextAddPath= function(aContext, aPath)
{
    if (!aContext || CGPathIsEmpty(aPath))
        return;
    var elements = aPath.elements,
        i = 0,
        count = aPath.count;
    for (; i < count; ++i)
    {
        var element = elements[i],
            type = element.type;
        switch (type)
        {
            case kCGPathElementMoveToPoint: aContext.moveTo(element.x, element.y);
                                                    break;
            case kCGPathElementAddLineToPoint: aContext.lineTo(element.x, element.y);
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: aContext.quadraticCurveTo(element.cpx, element.cpy, element.x, element.y);
                                                    break;
            case kCGPathElementAddCurveToPoint: aContext.bezierCurveTo(element.cp1x, element.cp1y, element.cp2x, element.cp2y, element.x, element.y);
                                                    break;
            case kCGPathElementCloseSubpath: aContext.closePath();
                                                    break;
            case kCGPathElementAddArc: aContext.arc(element.x, element.y, element.radius, element.startAngle, element.endAngle, element.clockwise);
                                                    break;
            case kCGPathElementAddArcTo:
                                                    break;
        }
    }
}
CGContextAddRect= function(aContext, aRect)
{
    aContext.rect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextAddRects= function(aContext, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        aContext.rect((rect.origin.x), (rect.origin.y), (rect.size.width), (rect.size.height));
    }
}
CGContextBeginPath= function(aContext)
{
    aContext.beginPath();
}
CGContextClosePath= function(aContext)
{
    aContext.closePath();
}
CGContextMoveToPoint= function(aContext, x, y)
{
    aContext.moveTo(x, y);
}
CGContextClearRect= function(aContext, aRect)
{
    aContext.clearRect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextDrawPath= function(aContext, aMode)
{
    if (aMode == kCGPathFill || aMode == kCGPathFillStroke)
        aContext.fill();
    else if (aMode == kCGPathEOFill || aMode == kCGPathEOFillStroke)
        alert("not implemented!!!");
    if (aMode == kCGPathStroke || aMode == kCGPathFillStroke || aMode == kCGPathEOFillStroke)
        aContext.stroke();
}
CGContextFillRect= function(aContext, aRect)
{
    aContext.fillRect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextFillRects= function(aContext, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        aContext.fillRect((rect.origin.x), (rect.origin.y), (rect.size.width), (rect.size.height));
    }
}
CGContextStrokeRect= function(aContext, aRect)
{
    aContext.strokeRect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
CGContextClip= function(aContext)
{
    aContext.clip();
}
CGContextClipToRect= function(aContext, aRect)
{
    aContext.beginPath();
    aContext.rect((aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
    aContext.closePath();
    aContext.clip();
}
CGContextClipToRects= function(aContext, rects, count)
{
    if (arguments["count"] == NULL)
        var count = rects.length;
    aContext.beginPath();
    CGContextAddRects(aContext, rects, count);
    aContext.clip();
}
CGContextSetAlpha= function(aContext, anAlpha)
{
    aContext.globalAlpha = anAlpha;
}
CGContextSetFillColor= function(aContext, aColor)
{
    aContext.fillStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetStrokeColor= function(aContext, aColor)
{
    aContext.strokeStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetShadow= function(aContext, aSize, aBlur)
{
    aContext.shadowOffsetX = aSize.width;
    aContext.shadowOffsetY = aSize.height;
    aContext.shadowBlur = aBlur;
}
CGContextSetShadowWithColor= function(aContext, aSize, aBlur, aColor)
{
    aContext.shadowOffsetX = aSize.width;
    aContext.shadowOffsetY = aSize.height;
    aContext.shadowBlur = aBlur;
    aContext.shadowColor = objj_msgSend(aColor, "cssString");
}
CGContextRotateCTM= function(aContext, anAngle)
{
    aContext.rotate(anAngle);
}
CGContextScaleCTM= function(aContext, sx, sy)
{
    aContext.scale(sx, sy);
}
CGContextTranslateCTM= function(aContext, tx, ty)
{
    aContext.translate(tx, ty);
}
eigen= function(anAffineTransform)
{
    alert("IMPLEMENT ME!");
}
CGContextConcatCTM= function(aContext, anAffineTransform)
{
    var a = anAffineTransform.a,
        b = anAffineTransform.b,
        c = anAffineTransform.c,
        d = anAffineTransform.d,
        tx = anAffineTransform.tx,
        ty = anAffineTransform.ty,
        sx = 1.0,
        sy = 1.0,
        a1 = 0.0,
        a2 = 0.0;
    if (b == 0.0 && c == 0.0)
    {
        sx = a;
        sy = d;
    }
    else if (a * b == -c * d)
    {
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0, a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0, cos = COS(a2), sin = SIN(a2); if (cos == 0) { sx = -c / sin; sy = b / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin); }
    }
    else if (a * c == -b * d)
    {
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0; a1 = (Math.atan2(sign * b, sign * a) + Math.atan2(-c, d)) / 2.0, cos = COS(a1), sin = SIN(a1); if (cos == 0) { sx = b / sin; sy = -c / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); }
    }
    else
    {
        var transpose = CGAffineTransformMake(a, c, b, d, 0.0, 0.0),
            u = eigen(CGAffineTransformConcat(anAffineTransform, transpose)),
            v = eigen(CGAffineTransformConcat(transpose, anAffineTransform)),
            U = CGAffineTransformMake(u.vector_1.x, u.vector_2.x, u.vector_1.y, u.vector_2.y, 0.0, 0.0),
            VT = CGAffineTransformMake(v.vector_1.x, v.vector_1.y, v.vector_2.x, v.vector_2.y, 0.0, 0.0),
            S = CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U), anAffineTransform), CGAffineTransformInvert(VT));
        a = VT.a;
        b = VT.b;
        c = VT.c;
        d = VT.d;
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0, a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0, cos = COS(a2), sin = SIN(a2); if (cos == 0) { sx = -c / sin; sy = b / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin); }
        S.a *= sx;
        S.d *= sy;
        a = U.a;
        b = U.b;
        c = U.c;
        d = U.d;
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0; a1 = (Math.atan2(sign * b, sign * a) + Math.atan2(-c, d)) / 2.0, cos = COS(a1), sin = SIN(a1); if (cos == 0) { sx = b / sin; sy = -c / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); }
        sx = S.a * sx;
        sy = S.d * sy;
    }
    if (tx != 0 || ty != 0)
        CGContextTranslateCTM(aContext, tx, ty);
    if (a1 != 0.0)
        CGContextRotateCTM(aContext, a1);
    if (sx != 1.0 || sy != 1.0)
        CGContextScaleCTM(aContext, sx, sy);
    if (a2 != 0.0)
        CGContextRotateCTM(aContext, a2);
}
CGContextDrawImage= function(aContext, aRect, anImage)
{
    aContext.drawImage(anImage._image, (aRect.origin.x), (aRect.origin.y), (aRect.size.width), (aRect.size.height));
}
to_string= function(aColor)
{
    return "rgba(" + ROUND(aColor.components[0] * 255) + ", " + ROUND(aColor.components[1] * 255) + ", " + ROUND(255 * aColor.components[2]) + ", " + aColor.components[3] + ")";
}
CGContextDrawLinearGradient= function(aContext, aGradient, aStartPoint, anEndPoint, options)
{
    var colors = aGradient.colors,
        count = colors.length,
        linearGradient = aContext.createLinearGradient(aStartPoint.x, aStartPoint.y, anEndPoint.x, anEndPoint.y);
    while (count--)
        linearGradient.addColorStop(aGradient.locations[count], to_string(colors[count]));
    aContext.fillStyle = linearGradient;
    aContext.fill();
}
CGBitmapGraphicsContextCreate= function()
{
    var DOMElement = document.createElement("canvas"),
        context = DOMElement.getContext("2d");
    context.DOMElement = DOMElement;
    return context;
}
}
else if (CPFeatureIsCompatible(CPVMLFeature))
{
var VML_TRUTH_TABLE = ["f","t"],
    VML_LINECAP_TABLE = ["flat","round","square"],
    VML_LINEJOIN_TABLE = ["miter","round","bevel"],
    VML_ELEMENT_TABLE = [" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _CGBitmapGraphicsContextCreate = CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate= function()
{
    document.namespaces.add("cg_vml_", "urn:schemas-microsoft-com:vml");
    document.createStyleSheet().cssText = "cg_vml_\\:*{behavior:url(#default#VML)}";
    CGBitmapGraphicsContextCreate = _CGBitmapGraphicsContextCreate;
    return _CGBitmapGraphicsContextCreate();
}
CGContextClearRect= function(aContext, aRect)
{
    if (aContext.buffer != nil)
        aContext.buffer = "";
    else
        aContext.DOMElement.innerHTML = "";
    aContext.path = NULL;
}
var W = 10.0,
    H = 10.0,
    Z = 10.0,
    Z_2 = Z / 2.0;
CGContextDrawImage= function(aContext, aRect, anImage)
{
    var string = "";
    if (anImage.buffer != nil)
        string = anImage.buffer;
    else
    {
        var ctm = aContext.gState.CTM,
            origin = CGPointApplyAffineTransform(aRect.origin, ctm),
            similarity = ctm.a == ctm.d && ctm.b == -ctm.c,
            vml = ["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
        {
            var transformedRect = CGRectApplyAffineTransform(aRect, ctm);
            vml.push( ";padding:0 ", ROUND((transformedRect.origin.x + transformedRect.size.width)), "px ", ROUND((transformedRect.origin.y + transformedRect.size.height)),
                        "px 0;filter:progid:DXImageTransform.Microsoft.Matrix(",
                        "M11='", ctm.a, "',M12='", ctm.c, "',M21='", ctm.b, "',M22='", ctm.d, "',",
                        "Dx='", ROUND(origin.x), "', Dy='", ROUND(origin.y), "', sizingmethod='clip');");
        }
        vml.push( "\"><cg_vml_:image src=\"", anImage._image.src,
                    "\" style=\"width:", (aRect.size.width), "px;height:", (aRect.size.height),
                    "px;\"/></g_vml_:group>");
        string = vml.join("");
    }
    if (aContext.buffer != nil)
        aContext.buffer += string;
    else
        aContext.DOMElement.insertAdjacentHTML("BeforeEnd", string);
}
CGContextDrawPath= function(aContext, aMode)
{
    if (!aContext || CGPathIsEmpty(aContext.path))
        return;
var opacity = 1.0;
    var elements = aContext.path.elements,
        i = 0,
        count = aContext.path.count,
        gState = aContext.gState,
        fill = (aMode == kCGPathFill || aMode == kCGPathFillStroke) ? 1 : 0,
        stroke = (aMode == kCGPathStroke || aMode == kCGPathFillStroke) ? 1 : 0,
        vml = ["<cg_vml_:shape"," fillcolor=\"",gState.fillStyle,"\" filled=\"",VML_TRUTH_TABLE[fill],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",VML_TRUTH_TABLE[stroke],"\" strokeweight=\"",gState.lineWidth,"\" strokecolor=\"",gState.strokeStyle,"\" path=\""];
    for (; i < count; ++i)
    {
        var element = elements[i],
            type = element.type;
        switch(type)
        {
            case kCGPathElementMoveToPoint:
            case kCGPathElementAddLineToPoint: vml.push(VML_ELEMENT_TABLE[type], (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: vml.push(VML_ELEMENT_TABLE[type],
                                                        (ROUND(Z * (element.cpx) - Z_2)), ',', (ROUND(Z * (element.cpy) - Z_2)), ',',
                                                        (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementAddCurveToPoint: vml.push(VML_ELEMENT_TABLE[type],
                                                        (ROUND(Z * (element.cp1x) - Z_2)), ',', (ROUND(Z * (element.cp1y) - Z_2)), ',',
                                                        (ROUND(Z * (element.cp2x) - Z_2)), ',', (ROUND(Z * (element.cp2y) - Z_2)), ',',
                                                        (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementCloseSubpath: vml.push(VML_ELEMENT_TABLE[type]);
                                                    break;
            case kCGPathElementAddArc: var x = element.x,
                                                        y = element.y,
                                                        radius = element.radius,
                                                        clockwise = element.clockwise ? 1 : 0,
                                                        endAngle = element.endAngle,
                                                        startAngle = element.startAngle,
                                                        start = { x:x + radius * COS(startAngle), y:y + radius * SIN(startAngle) };
                                                    if (startAngle == endAngle && !clockwise)
                                                    {
                                                        vml.push(VML_ELEMENT_TABLE[kCGPathElementMoveToPoint], (ROUND(Z * (start.x) - Z_2)), ',', (ROUND(Z * (start.y) - Z_2)));
                                                        continue;
                                                    }
                                                    var end = { x:x + radius * COS(endAngle), y:y + radius * SIN(endAngle) };
                                                    if (clockwise && startAngle != endAngle && (start.x == end.x && start.y == end.y))
                                                        if (start.x >= x)
                                                        {
                                                            if (start.y < y)
                                                                start.x += 0.125;
                                                            else
                                                                start.y += 0.125;
                                                        }
                                                        else
                                                        {
                                                            if (end.y <= y)
                                                                end.x += 0.125;
                                                            else
                                                                end.y += 0.125;
                                                        }
                                                    vml.push(VML_ELEMENT_TABLE[type][clockwise],
                                                        (ROUND(Z * (x - radius) - Z_2)), ',', (ROUND(Z * (y - radius) - Z_2)), " ",
                                                        (ROUND(Z * (x + radius) - Z_2)), ',', (ROUND(Z * (y + radius) - Z_2)), " ",
                                                        (ROUND(Z * (start.x) - Z_2)), ',', (ROUND(Z * (start.y) - Z_2)), " ",
                                                        (ROUND(Z * (end.x) - Z_2)), ',', (ROUND(Z * (end.y) - Z_2)));
                                                    break;
            case kCGPathElementAddArcTo: break;
        }
    }
    vml.push("\">");
    if (fill)
        vml.push("<cg_vml_:fill color=\"", gState.fillStyle, "\" opacity=\"", opacity, "\" />");
    if (stroke)
        vml.push( "<cg_vml_:stroke opacity=\"", opacity,
                    "\" joinstyle=\"", VML_LINEJOIN_TABLE[gState.lineJoin],
                    "\" miterlimit=\"", gState.miterLimit,
                    "\" endcap=\"", VML_LINECAP_TABLE[gState.lineCap],
                    "\" weight=\"", gState.lineWidth, "",
                    "px\" color=\"", gState.strokeStyle,"\" />");
    var shadowColor = gState.shadowColor;
    if (shadowColor)
    {
        var shadowOffset = gState.shadowOffset;
        vml.push("<cg_vml_:shadow on=\"t\" offset=\"",
            shadowOffset.width, "pt ", shadowOffset.height, "pt\" opacity=\"", objj_msgSend(shadowColor, "alphaComponent"), "\" color=black />");
    }
    vml.push("</cg_vml_:shape>");
    aContext.path = NULL;
    if (aContext.buffer != nil)
        aContext.buffer += vml.join("");
    else
        aContext.DOMElement.insertAdjacentHTML("BeforeEnd", vml.join(""));
}
}

p;17;CGContextCanvas.jc;11021;var CANVAS_LINECAP_TABLE = ["butt","round","square"],
    CANVAS_LINEJOIN_TABLE = ["miter","round","bevel"],
    CANVAS_COMPOSITE_TABLE = ["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState= function(aContext)
{
    aContext.save();
}
CGContextRestoreGState= function(aContext)
{
    aContext.restore();
}
CGContextSetLineCap= function(aContext, aLineCap)
{
    aContext.lineCap = CANVAS_LINECAP_TABLE[aLineCap];
}
CGContextSetLineJoin= function(aContext, aLineJoin)
{
    aContext.lineJoin = CANVAS_LINEJOIN_TABLE[aLineJoin];
}
CGContextSetLineWidth= function(aContext, aLineWidth)
{
    aContext.lineWidth = aLineWidth;
}
CGContextSetMiterLimit= function(aContext, aMiterLimit)
{
    aContext.miterLimit = aMiterLimit;
}
CGContextSetBlendMode= function(aContext, aBlendMode)
{
    aContext.globalCompositeOperation = CANVAS_COMPOSITE_TABLE[aBlendMode];
}
CGContextAddArc= function(aContext, x, y, radius, startAngle, endAngle, clockwise)
{
    aContext.arc(x, y, radius, startAngle, endAngle, !clockwise);
}
CGContextAddArcToPoint= function(aContext, x1, y1, x2, y2, radius)
{
    aContext.arcTo(x1, y1, x2, y2, radius);
}
CGContextAddCurveToPoint= function(aContext, cp1x, cp1y, cp2x, cp2y, x, y)
{
    aContext.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y);
}
CGContextAddLineToPoint= function(aContext, x, y)
{
    aContext.lineTo(x, y);
}
CGContextAddPath= function(aContext, aPath)
{
    if (!aContext || CGPathIsEmpty(aPath))
        return;
    var elements = aPath.elements,
        i = 0,
        count = aPath.count;
    for (; i < count; ++i)
    {
        var element = elements[i],
            type = element.type;
        switch (type)
        {
            case kCGPathElementMoveToPoint: aContext.moveTo(element.x, element.y);
                                                    break;
            case kCGPathElementAddLineToPoint: aContext.lineTo(element.x, element.y);
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: aContext.quadraticCurveTo(element.cpx, element.cpy, element.x, element.y);
                                                    break;
            case kCGPathElementAddCurveToPoint: aContext.bezierCurveTo(element.cp1x, element.cp1y, element.cp2x, element.cp2y, element.x, element.y);
                                                    break;
            case kCGPathElementCloseSubpath: aContext.closePath();
                                                    break;
            case kCGPathElementAddArc: aContext.arc(element.x, element.y, element.radius, element.startAngle, element.endAngle, element.clockwise);
                                                    break;
            case kCGPathElementAddArcTo:
                                                    break;
        }
    }
}
CGContextAddRect= function(aContext, aRect)
{
    aContext.rect(_CGRectGetMinX(aRect), _CGRectGetMinY(aRect), _CGRectGetWidth(aRect), _CGRectGetHeight(aRect));
}
CGContextAddRects= function(aContext, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        aContext.rect(_CGRectGetMinX(rect), _CGRectGetMinY(rect), _CGRectGetWidth(rect), _CGRectGetHeight(rect));
    }
}
CGContextBeginPath= function(aContext)
{
    aContext.beginPath();
}
CGContextClosePath= function(aContext)
{
    aContext.closePath();
}
CGContextMoveToPoint= function(aContext, x, y)
{
    aContext.moveTo(x, y);
}
CGContextClearRect= function(aContext, aRect)
{
    aContext.clearRect(_CGRectGetMinX(aRect), _CGRectGetMinY(aRect), _CGRectGetWidth(aRect), _CGRectGetHeight(aRect));
}
CGContextDrawPath= function(aContext, aMode)
{
    if (aMode == kCGPathFill || aMode == kCGPathFillStroke)
        aContext.fill();
    else if (aMode == kCGPathEOFill || aMode == kCGPathEOFillStroke)
        alert("not implemented!!!");
    if (aMode == kCGPathStroke || aMode == kCGPathFillStroke || aMode == kCGPathEOFillStroke)
        aContext.stroke();
}
CGContextFillRect= function(aContext, aRect)
{
    aContext.fillRect(_CGRectGetMinX(aRect), _CGRectGetMinY(aRect), _CGRectGetWidth(aRect), _CGRectGetHeight(aRect));
}
CGContextFillRects= function(aContext, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        aContext.fillRect(_CGRectGetMinX(rect), _CGRectGetMinY(rect), _CGRectGetWidth(rect), _CGRectGetHeight(rect));
    }
}
CGContextStrokeRect= function(aContext, aRect)
{
    aContext.strokeRect(_CGRectGetMinX(aRect), _CGRectGetMinY(aRect), _CGRectGetWidth(aRect), _CGRectGetHeight(aRect));
}
CGContextClip= function(aContext)
{
    aContext.clip();
}
CGContextClipToRect= function(aContext, aRect)
{
    aContext.beginPath();
    aContext.rect(_CGRectGetMinX(aRect), _CGRectGetMinY(aRect), _CGRectGetWidth(aRect), _CGRectGetHeight(aRect));
    aContext.closePath();
    aContext.clip();
}
CGContextClipToRects= function(aContext, rects, count)
{
    if (arguments["count"] == NULL)
        var count = rects.length;
    aContext.beginPath();
    CGContextAddRects(aContext, rects, count);
    aContext.clip();
}
CGContextSetAlpha= function(aContext, anAlpha)
{
    aContext.globalAlpha = anAlpha;
}
CGContextSetFillColor= function(aContext, aColor)
{
    aContext.fillStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetStrokeColor= function(aContext, aColor)
{
    aContext.strokeStyle = objj_msgSend(aColor, "cssString");
}
CGContextSetShadow= function(aContext, aSize, aBlur)
{
    aContext.shadowOffsetX = aSize.width;
    aContext.shadowOffsetY = aSize.height;
    aContext.shadowBlur = aBlur;
}
CGContextSetShadowWithColor= function(aContext, aSize, aBlur, aColor)
{
    aContext.shadowOffsetX = aSize.width;
    aContext.shadowOffsetY = aSize.height;
    aContext.shadowBlur = aBlur;
    aContext.shadowColor = objj_msgSend(aColor, "cssString");
}
CGContextRotateCTM= function(aContext, anAngle)
{
    aContext.rotate(anAngle);
}
CGContextScaleCTM= function(aContext, sx, sy)
{
    aContext.scale(sx, sy);
}
CGContextTranslateCTM= function(aContext, tx, ty)
{
    aContext.translate(tx, ty);
}
eigen= function(anAffineTransform)
{
    alert("IMPLEMENT ME!");
}
CGContextConcatCTM= function(aContext, anAffineTransform)
{
    var a = anAffineTransform.a,
        b = anAffineTransform.b,
        c = anAffineTransform.c,
        d = anAffineTransform.d,
        tx = anAffineTransform.tx,
        ty = anAffineTransform.ty,
        sx = 1.0,
        sy = 1.0,
        a1 = 0.0,
        a2 = 0.0;
    if (b == 0.0 && c == 0.0)
    {
        sx = a;
        sy = d;
    }
    else if (a * b == -c * d)
    {
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0, a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0, cos = COS(a2), sin = SIN(a2); if (cos == 0) { sx = -c / sin; sy = b / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin); }
    }
    else if (a * c == -b * d)
    {
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0; a1 = (Math.atan2(sign * b, sign * a) + Math.atan2(-c, d)) / 2.0, cos = COS(a1), sin = SIN(a1); if (cos == 0) { sx = b / sin; sy = -c / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); }
    }
    else
    {
        var transpose = CGAffineTransformMake(a, c, b, d, 0.0, 0.0),
            u = eigen(CGAffineTransformConcat(anAffineTransform, transpose)),
            v = eigen(CGAffineTransformConcat(transpose, anAffineTransform)),
            U = CGAffineTransformMake(u.vector_1.x, u.vector_2.x, u.vector_1.y, u.vector_2.y, 0.0, 0.0),
            VT = CGAffineTransformMake(v.vector_1.x, v.vector_1.y, v.vector_2.x, v.vector_2.y, 0.0, 0.0),
            S = CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U), anAffineTransform), CGAffineTransformInvert(VT));
        a = VT.a;
        b = VT.b;
        c = VT.c;
        d = VT.d;
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0, a2 = (ATAN2(b, d) + ATAN2(-sign * c, sign * a)) / 2.0, cos = COS(a2), sin = SIN(a2); if (cos == 0) { sx = -c / sin; sy = b / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * b / sin) / (abs_cos + abs_sin); }
        S.a *= sx;
        S.d *= sy;
        a = U.a;
        b = U.b;
        c = U.c;
        d = U.d;
        var sign = (a * d < 0.0 || b * c > 0.0) ? -1.0 : 1.0; a1 = (Math.atan2(sign * b, sign * a) + Math.atan2(-c, d)) / 2.0, cos = COS(a1), sin = SIN(a1); if (cos == 0) { sx = b / sin; sy = -c / sin; } else if (sin == 0) { sx = a / cos; sy = d / cos; } else { abs_cos = ABS(cos); abs_sin = ABS(sin); sx = (abs_cos * a / cos + abs_sin * b / sin) / (abs_cos + abs_sin); sy = (abs_cos * d / cos + abs_sin * -c / sin) / (abs_cos + abs_sin); }
        sx = S.a * sx;
        sy = S.d * sy;
    }
    if (tx != 0 || ty != 0)
        CGContextTranslateCTM(aContext, tx, ty);
    if (a1 != 0.0)
        CGContextRotateCTM(aContext, a1);
    if (sx != 1.0 || sy != 1.0)
        CGContextScaleCTM(aContext, sx, sy);
    if (a2 != 0.0)
        CGContextRotateCTM(aContext, a2);
}
CGContextDrawImage= function(aContext, aRect, anImage)
{
    aContext.drawImage(anImage._image, _CGRectGetMinX(aRect), _CGRectGetMinY(aRect), _CGRectGetWidth(aRect), _CGRectGetHeight(aRect));
}
to_string= function(aColor)
{
    return "rgba(" + ROUND(aColor.components[0] * 255) + ", " + ROUND(aColor.components[1] * 255) + ", " + ROUND(255 * aColor.components[2]) + ", " + aColor.components[3] + ")";
}
CGContextDrawLinearGradient= function(aContext, aGradient, aStartPoint, anEndPoint, options)
{
    var colors = aGradient.colors,
        count = colors.length,
        linearGradient = aContext.createLinearGradient(aStartPoint.x, aStartPoint.y, anEndPoint.x, anEndPoint.y);
    while (count--)
        linearGradient.addColorStop(aGradient.locations[count], to_string(colors[count]));
    aContext.fillStyle = linearGradient;
    aContext.fill();
}
CGBitmapGraphicsContextCreate= function()
{
    var DOMElement = document.createElement("canvas"),
        context = DOMElement.getContext("2d");
    context.DOMElement = DOMElement;
    return context;
}

p;14;CGContextVML.jc;8526;var VML_TRUTH_TABLE = ["f","t"],
    VML_LINECAP_TABLE = ["flat","round","square"],
    VML_LINEJOIN_TABLE = ["miter","round","bevel"],
    VML_ELEMENT_TABLE = [" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _CGBitmapGraphicsContextCreate = CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate= function()
{
    document.namespaces.add("cg_vml_", "urn:schemas-microsoft-com:vml");
    document.createStyleSheet().cssText = "cg_vml_\\:*{behavior:url(#default#VML)}";
    CGBitmapGraphicsContextCreate = _CGBitmapGraphicsContextCreate;
    return _CGBitmapGraphicsContextCreate();
}
CGContextClearRect= function(aContext, aRect)
{
    if (aContext.buffer != nil)
        aContext.buffer = "";
    else
        aContext.DOMElement.innerHTML = "";
    aContext.path = NULL;
}
var W = 10.0,
    H = 10.0,
    Z = 10.0,
    Z_2 = Z / 2.0;
CGContextDrawImage= function(aContext, aRect, anImage)
{
    var string = "";
    if (anImage.buffer != nil)
        string = anImage.buffer;
    else
    {
        var ctm = aContext.gState.CTM,
            origin = CGPointApplyAffineTransform(aRect.origin, ctm),
            similarity = ctm.a == ctm.d && ctm.b == -ctm.c,
            vml = ["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
        {
            var transformedRect = CGRectApplyAffineTransform(aRect, ctm);
            vml.push( ";padding:0 ", ROUND(_CGRectGetMaxX(transformedRect)), "px ", ROUND(_CGRectGetMaxY(transformedRect)),
                        "px 0;filter:progid:DXImageTransform.Microsoft.Matrix(",
                        "M11='", ctm.a, "',M12='", ctm.c, "',M21='", ctm.b, "',M22='", ctm.d, "',",
                        "Dx='", ROUND(origin.x), "', Dy='", ROUND(origin.y), "', sizingmethod='clip');");
        }
        vml.push( "\"><cg_vml_:image src=\"", anImage._image.src,
                    "\" style=\"width:", _CGRectGetWidth(aRect), "px;height:", _CGRectGetHeight(aRect),
                    "px;\"/></g_vml_:group>");
        string = vml.join("");
    }
    if (aContext.buffer != nil)
        aContext.buffer += string;
    else
        aContext.DOMElement.insertAdjacentHTML("BeforeEnd", string);
}
CGContextDrawPath= function(aContext, aMode)
{
    if (!aContext || CGPathIsEmpty(aContext.path))
        return;
var opacity = 1.0;
    var elements = aContext.path.elements,
        i = 0,
        count = aContext.path.count,
        gState = aContext.gState,
        fill = (aMode == kCGPathFill || aMode == kCGPathFillStroke) ? 1 : 0,
        stroke = (aMode == kCGPathStroke || aMode == kCGPathFillStroke) ? 1 : 0,
        vml = ["<cg_vml_:shape"," fillcolor=\"",gState.fillStyle,"\" filled=\"",VML_TRUTH_TABLE[fill],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",VML_TRUTH_TABLE[stroke],"\" strokeweight=\"",gState.lineWidth,"\" strokecolor=\"",gState.strokeStyle,"\" path=\""];
    for (; i < count; ++i)
    {
        var element = elements[i],
            type = element.type;
        switch(type)
        {
            case kCGPathElementMoveToPoint:
            case kCGPathElementAddLineToPoint: vml.push(VML_ELEMENT_TABLE[type], (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementAddQuadCurveToPoint: vml.push(VML_ELEMENT_TABLE[type],
                                                        (ROUND(Z * (element.cpx) - Z_2)), ',', (ROUND(Z * (element.cpy) - Z_2)), ',',
                                                        (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementAddCurveToPoint: vml.push(VML_ELEMENT_TABLE[type],
                                                        (ROUND(Z * (element.cp1x) - Z_2)), ',', (ROUND(Z * (element.cp1y) - Z_2)), ',',
                                                        (ROUND(Z * (element.cp2x) - Z_2)), ',', (ROUND(Z * (element.cp2y) - Z_2)), ',',
                                                        (ROUND(Z * (element.x) - Z_2)), ',', (ROUND(Z * (element.y) - Z_2)));
                                                    break;
            case kCGPathElementCloseSubpath: vml.push(VML_ELEMENT_TABLE[type]);
                                                    break;
            case kCGPathElementAddArc: var x = element.x,
                                                        y = element.y,
                                                        radius = element.radius,
                                                        clockwise = element.clockwise ? 1 : 0,
                                                        endAngle = element.endAngle,
                                                        startAngle = element.startAngle,
                                                        start = _CGPointMake(x + radius * COS(startAngle), y + radius * SIN(startAngle));
                                                    if (startAngle == endAngle && !clockwise)
                                                    {
                                                        vml.push(VML_ELEMENT_TABLE[kCGPathElementMoveToPoint], (ROUND(Z * (start.x) - Z_2)), ',', (ROUND(Z * (start.y) - Z_2)));
                                                        continue;
                                                    }
                                                    var end = _CGPointMake(x + radius * COS(endAngle), y + radius * SIN(endAngle));
                                                    if (clockwise && startAngle != endAngle && _CGPointEqualToPoint(start, end))
                                                        if (start.x >= x)
                                                        {
                                                            if (start.y < y)
                                                                start.x += 0.125;
                                                            else
                                                                start.y += 0.125;
                                                        }
                                                        else
                                                        {
                                                            if (end.y <= y)
                                                                end.x += 0.125;
                                                            else
                                                                end.y += 0.125;
                                                        }
                                                    vml.push(VML_ELEMENT_TABLE[type][clockwise],
                                                        (ROUND(Z * (x - radius) - Z_2)), ',', (ROUND(Z * (y - radius) - Z_2)), " ",
                                                        (ROUND(Z * (x + radius) - Z_2)), ',', (ROUND(Z * (y + radius) - Z_2)), " ",
                                                        (ROUND(Z * (start.x) - Z_2)), ',', (ROUND(Z * (start.y) - Z_2)), " ",
                                                        (ROUND(Z * (end.x) - Z_2)), ',', (ROUND(Z * (end.y) - Z_2)));
                                                    break;
            case kCGPathElementAddArcTo: break;
        }
    }
    vml.push("\">");
    if (fill)
        vml.push("<cg_vml_:fill color=\"", gState.fillStyle, "\" opacity=\"", opacity, "\" />");
    if (stroke)
        vml.push( "<cg_vml_:stroke opacity=\"", opacity,
                    "\" joinstyle=\"", VML_LINEJOIN_TABLE[gState.lineJoin],
                    "\" miterlimit=\"", gState.miterLimit,
                    "\" endcap=\"", VML_LINECAP_TABLE[gState.lineCap],
                    "\" weight=\"", gState.lineWidth, "",
                    "px\" color=\"", gState.strokeStyle,"\" />");
    var shadowColor = gState.shadowColor;
    if (shadowColor)
    {
        var shadowOffset = gState.shadowOffset;
        vml.push("<cg_vml_:shadow on=\"t\" offset=\"",
            shadowOffset.width, "pt ", shadowOffset.height, "pt\" opacity=\"", objj_msgSend(shadowColor, "alphaComponent"), "\" color=black />");
    }
    vml.push("</cg_vml_:shape>");
    aContext.path = NULL;
    if (aContext.buffer != nil)
        aContext.buffer += vml.join("");
    else
        aContext.DOMElement.insertAdjacentHTML("BeforeEnd", vml.join(""));
}

p;12;CGGeometry.jc;6734;CGPointMake= function(x, y) { return { x:x, y:y }; }
CGPointMakeZero= function() { return { x:0.0, y:0.0 }; }
CGPointMakeCopy= function(aPoint) { return { x:aPoint.x, y:aPoint.y }; }
CGPointCreateCopy= function(aPoint) { return { x:aPoint.x, y:aPoint.y }; }
CGPointEqualToPoint= function(lhsPoint, rhsPoint) { return (lhsPoint.x == rhsPoint.x && lhsPoint.y == rhsPoint.y); }
CGStringFromPoint= function(aPoint) { return ("{" + aPoint.x + ", " + aPoint.y + "}"); }
CGSizeMake= function(width, height) { return { width:width, height:height }; }
CGSizeMakeZero= function() { return { width:0.0, height:0.0 }; }
CGSizeMakeCopy= function(aSize) { return { width:aSize.width, height:aSize.height }; }
CGSizeCreateCopy= function(aSize) { return { width:aSize.width, height:aSize.height }; }
CGSizeEqualToSize= function(lhsSize, rhsSize) { return (lhsSize.width == rhsSize.width && lhsSize.height == rhsSize.height); }
CGStringFromSize= function(aSize) { return ("{" + aSize.width + ", " + aSize.height + "}"); }
CGRectMake= function(x, y, width, height) { return { origin: { x:x, y:y }, size: { width:width, height:height } }; }
CGRectMakeZero= function() { return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } }; }
CGRectMakeCopy= function(aRect) { return { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } }; }
CGRectCreateCopy= function(aRect) { return { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } }; }
CGRectEqualToRect= function(lhsRect, rhsRect) { return ((lhsRect.origin.x == rhsRect.origin.x && lhsRect.origin.y == rhsRect.origin.y) && (lhsRect.size.width == rhsRect.size.width && lhsRect.size.height == rhsRect.size.height)); }
CGStringFromRect= function(aRect) { return ("{" + ("{" + aRect.origin.x + ", " + aRect.origin.y + "}") + ", " + ("{" + aRect.size.width + ", " + aRect.size.height + "}") + "}"); }
CGRectOffset= function(aRect, dX, dY) { return { origin: { x:aRect.origin.x + dX, y:aRect.origin.y + dY }, size: { width:aRect.size.width, height:aRect.size.height } }; }
CGRectInset= function(aRect, dX, dY) { return { origin: { x:aRect.origin.x + dX, y:aRect.origin.y + dY }, size: { width:aRect.size.width - 2 * dX, height:aRect.size.height - 2 * dY } }; }
CGRectGetHeight= function(aRect) { return (aRect.size.height); }
CGRectGetMaxX= function(aRect) { return (aRect.origin.x + aRect.size.width); }
CGRectGetMaxY= function(aRect) { return (aRect.origin.y + aRect.size.height); }
CGRectGetMidX= function(aRect) { return (aRect.origin.x + (aRect.size.width) / 2.0); }
CGRectGetMidY= function(aRect) { return (aRect.origin.y + (aRect.size.height) / 2.0); }
CGRectGetMinX= function(aRect) { return (aRect.origin.x); }
CGRectGetMinY= function(aRect) { return (aRect.origin.y); }
CGRectGetWidth= function(aRect) { return (aRect.size.width); }
CGRectIsEmpty= function(aRect) { return (aRect.size.width <= 0.0 || aRect.size.height <= 0.0); }
CGRectIsNull= function(aRect) { return (aRect.size.width <= 0.0 || aRect.size.height <= 0.0); }
CGRectContainsPoint= function(aRect, aPoint) { return (aPoint.x >= (aRect.origin.x) && aPoint.y >= (aRect.origin.y) && aPoint.x < (aRect.origin.x + aRect.size.width) && aPoint.y < (aRect.origin.y + aRect.size.height)); }
CGRectContainsRect= function(lhsRect, rhsRect)
{
    var union = CGRectUnion(lhsRect, rhsRect);
    return ((union.origin.x == lhsRect.origin.x && union.origin.y == lhsRect.origin.y) && (union.size.width == lhsRect.size.width && union.size.height == lhsRect.size.height));
}
CGRectIntersectsRect= function(lhsRect, rhsRect)
{
    var intersection = CGRectIntersection(lhsRect, rhsRect);
    return !(intersection.size.width <= 0.0 || intersection.size.height <= 0.0);
}
CGRectIntegral= function(aRect)
{
    aRect = CGRectStandardize(aRect);
    var x = FLOOR((aRect.origin.x)),
        y = FLOOR((aRect.origin.y));
    aRect.size.width = CEIL((aRect.origin.x + aRect.size.width)) - x;
    aRect.size.height = CEIL((aRect.origin.y + aRect.size.height)) - y;
    aRect.origin.x = x;
    aRect.origin.y = y;
    return aRect;
}
CGRectIntersection= function(lhsRect, rhsRect)
{
    var intersection = { origin: { x:MAX((lhsRect.origin.x), (rhsRect.origin.x)), y:MAX((lhsRect.origin.y), (rhsRect.origin.y)) }, size: { width:0, height:0 } };
    intersection.size.width = MIN((lhsRect.origin.x + lhsRect.size.width), (rhsRect.origin.x + rhsRect.size.width)) - (intersection.origin.x);
    intersection.size.height = MIN((lhsRect.origin.y + lhsRect.size.height), (rhsRect.origin.y + rhsRect.size.height)) - (intersection.origin.y);
    return (intersection.size.width <= 0.0 || intersection.size.height <= 0.0) ? { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } } : intersection;
}
CGRectStandardize= function(aRect)
{
    var width = (aRect.size.width),
        height = (aRect.size.height),
        standardized = aRect;
    if (width < 0.0)
    {
        if (standardized == aRect)
            standardized = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
        standardized.origin.x += width;
        standardized.size.width = -width;
    }
    if (height < 0.0)
    {
        if (standardized == aRect)
            standardized = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
        standardized.origin.y += height;
        standardized.size.height = -height;
    }
    return standardized;
}
CGRectUnion= function(lhsRect, rhsRect)
{
    var minX = MIN((lhsRect.origin.x), (rhsRect.origin.x)),
        minY = MIN((lhsRect.origin.y), (rhsRect.origin.y)),
        maxX = MAX((lhsRect.origin.x + lhsRect.size.width), (rhsRect.origin.x + rhsRect.size.width)),
        maxY = MAX((lhsRect.origin.y + lhsRect.size.height), (rhsRect.origin.y + rhsRect.size.height));
    return { origin: { x:minX, y:minY }, size: { width:maxX - minX, height:maxY - minY } };
}
CGPointFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { x:parseInt(aString.substr(1, comma - 1)), y:parseInt(aString.substring(comma + 1, aString.length)) };
}
CGSizeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { width:parseInt(aString.substr(1, comma - 1)), height:parseInt(aString.substring(comma + 1, aString.length)) };
}
CGRectFromString= function(aString)
{
    var comma = aString.indexOf(',', aString.indexOf(',') + 1);
    return { origin:CGPointFromString(aString.substr(1, comma - 1)), size:CGSizeFromString(aString.substring(comma + 2, aString.length)) };
}
CGPointFromEvent= function(anEvent)
{
    return { x:anEvent.clientX, y:anEvent.clientY };
}

p;12;CGGradient.ji;9;CGColor.ji;14;CGColorSpace.jc;750;
kCGGradientDrawsBeforeStartLocation = 1 << 0;
kCGGradientDrawsAfterEndLocation = 1 << 1;
CGGradientCreateWithColorComponents= function(aColorSpace, components, locations, count)
{
    if (arguments["count"] == NULL)
        var count = locations.length;
    var colors = [];
    while (count--)
    {
        var offset = count * 4;
        colors[count] = CGColorCreate(aColorSpace, components.slice(offset, offset + 4));
    }
    return CGGradientCreateWithColors(aColorSpace, colors, locations);
}
CGGradientCreateWithColors= function(aColorSpace, colors, locations)
{
    return { colorspace:aColorSpace, colors:colors, locations:locations };
}
CGGradientRelease= function()
{
}
CGGradientRetain= function(aGradient)
{
    return aGradient;
}

p;8;CGPath.ji;12;CGGeometry.ji;19;CGAffineTransform.jc;8082;
kCGPathElementMoveToPoint = 0;
kCGPathElementAddLineToPoint = 1;
kCGPathElementAddQuadCurveToPoint = 2;
kCGPathElementAddCurveToPoint = 3;
kCGPathElementCloseSubpath = 4;
kCGPathElementAddArc = 5;
kCGPathElementAddArcToPoint = 6;
CGPathCreateMutable= function()
{
    return { count:0, start:NULL, current:NULL, elements:[] };
}
CGPathCreateMutableCopy= function(aPath)
{
    var path = CGPathCreateMutable();
    CGPathAddPath(path, aPath);
    return path;
}
CGPathCreateCopy= function(aPath)
{
    return CGPathCreateMutableCopy(aPath);
}
CGPathRelease= function(aPath)
{
}
CGPathRetain= function(aPath)
{
    return aPath;
}
CGPathAddArc= function(aPath, aTransform, x, y, aRadius, aStartAngle, anEndAngle, isClockwise)
{
    if (aTransform && !(aTransform.a == 1 && aTransform.b == 0 && aTransform.c == 0 && aTransform.d == 1 && aTransform.tx == 0 && aTransform.ty == 0))
    {
        var center = { x:x, y:y },
            end = { x:COS(anEndAngle), y:SIN(anEndAngle) },
            start = { x:COS(aStartAngle), y:SIN(aStartAngle) };
        end = { x:end.x * aTransform.a + end.y * aTransform.c + aTransform.tx, y:end.x * aTransform.b + end.y * aTransform.d + aTransform.ty };
        start = { x:start.x * aTransform.a + start.y * aTransform.c + aTransform.tx, y:start.x * aTransform.b + start.y * aTransform.d + aTransform.ty };
        center = { x:center.x * aTransform.a + center.y * aTransform.c + aTransform.tx, y:center.x * aTransform.b + center.y * aTransform.d + aTransform.ty };
        x = center.x;
        y = center.y;
        var oldEndAngle = anEndAngle,
            oldStartAngle = aStartAngle;
        anEndAngle = ATAN2(end.y - aTransform.ty, end.x - aTransform.tx);
        aStartAngle = ATAN2(start.y - aTransform.ty, start.x - aTransform.tx);
        if (anEndAngle == aStartAngle && oldEndAngle != oldStartAngle)
            if (oldStartAngle > oldEndAngle)
                anEndAngle = anEndAngle - PI2;
            else
                aStartAngle = aStartAngle - PI2;
        aRadius = { width:aRadius, height:0 };
        aRadius = { width:aRadius.width * aTransform.a + aRadius.height * aTransform.c, height:aRadius.width * aTransform.b + aRadius.height * aTransform.d };
        aRadius = SQRT(aRadius.width * aRadius.width + aRadius.height * aRadius.height);
    }
    aPath.current = { x:x + aRadius * COS(anEndAngle), y:y + aRadius * SIN(anEndAngle) };
    aPath.elements[aPath.count++] = { type:kCGPathElementAddArc, x:x, y:y, radius:aRadius, startAngle:aStartAngle, endAngle:anEndAngle };
}
CGPathAddArcToPoint= function(aPath, aTransform, x1, y1, x2, y2, aRadius)
{
}
CGPathAddCurveToPoint= function(aPath, aTransform, cp1x, cp1y, cp2x, cp2y, x, y)
{
    var cp1 = { x:cp1x, y:cp1y },
        cp2 = { x:cp2x, y:cp2y },
        end = { x:x, y:y };
    if (aTransform)
    {
        cp1 = { x:cp1.x * aTransform.a + cp1.y * aTransform.c + aTransform.tx, y:cp1.x * aTransform.b + cp1.y * aTransform.d + aTransform.ty };
        cp2 = { x:cp2.x * aTransform.a + cp2.y * aTransform.c + aTransform.tx, y:cp2.x * aTransform.b + cp2.y * aTransform.d + aTransform.ty };
        end = { x:end.x * aTransform.a + end.y * aTransform.c + aTransform.tx, y:end.x * aTransform.b + end.y * aTransform.d + aTransform.ty };
    }
   aPath.current = end;
   aPath.elements[aPath.count++] = { type:kCGPathElementAddCurveToPoint, cp1x:cp1.x, cp1y:cp1.y, cp2x:cp2.x, cp2y:cp2.y, x:end.x, y:end.y };
}
CGPathAddLines= function(aPath, aTransform, points, count)
{
    var i = 1;
    if (arguments["count"] == NULL)
        var count = points.length;
    if (!aPath || count < 2)
        return;
    CGPathMoveToPoint(aPath, aTransform, points[0].x, points[0].y);
    for (; i < count; ++i)
        CGPathAddLineToPoint(aPath, aTransform, points[i].x, points[i].y);
}
CGPathAddLineToPoint= function(aPath, aTransform, x, y)
{
    var point = { x:x, y:y };
    if (aTransform != NULL)
        point = { x:point.x * aTransform.a + point.y * aTransform.c + aTransform.tx, y:point.x * aTransform.b + point.y * aTransform.d + aTransform.ty };
    aPath.elements[aPath.count++] = { type: kCGPathElementAddLineToPoint, x:point.x, y:point.y };
    aPath.current = point;
}
CGPathAddPath= function(aPath, aTransform, anotherPath)
{
    var i = 0,
        count = anotherPath.count;
    for (; i < count; ++i)
    {
        var element = anotherPath[i];
        aPath.elements[aPath.count++] = { type:element.type, points:element.point.slice() };
        if (element.type == kCGPathElementAddArc || element.type == kCGPathElementAddArcToPoint)
            aPath.elements[aPath.count-1].radius = element.radius;
    }
    aPath.current = anotherPath.current;
}
CGPathAddQuadCurveToPoint= function(aPath, aTransform, cpx, cpy, x, y)
{
    var cp = { x:cpx, y:cpy },
        end = { x:x, y:y };
    if (aTransform)
    {
        cp = { x:control.x * aTransform.a + control.y * aTransform.c + aTransform.tx, y:control.x * aTransform.b + control.y * aTransform.d + aTransform.ty };
        end = { x:end.x * aTransform.a + end.y * aTransform.c + aTransform.tx, y:end.x * aTransform.b + end.y * aTransform.d + aTransform.ty };
    }
    aPath.elements[aPath.count++] = { type:kCGPathElementAddQuadCurveToPoint, cpx:cp.x, cpy:cp.y, x:end.x, y:end.y }
    aPath.current = end;
}
CGPathAddRect= function(aPath, aTransform, aRect)
{
    CGPathAddRects(aPath, aTransform, [aRect], 1);
}
CGPathAddRects= function(aPath, aTransform, rects, count)
{
    var i = 0;
    if (arguments["count"] == NULL)
        var count = rects.length;
    for (; i < count; ++i)
    {
        var rect = rects[i];
        CGPathMoveToPoint(aPath, aTransform, (rect.origin.x), (rect.origin.y));
        CGPathAddLineToPoint(aPath, aTransform, (rect.origin.x + rect.size.width), (rect.origin.y));
        CGPathAddLineToPoint(aPath, aTransform, (rect.origin.x + rect.size.width), (rect.origin.y + rect.size.height));
        CGPathAddLineToPoint(aPath, aTransform, (rect.origin.x), (rect.origin.y + rect.size.height));
        CGPathCloseSubpath(aPath);
    }
}
CGPathMoveToPoint= function(aPath, aTransform, x, y)
{
    var point = { x:x, y:y },
        count = aPath.count;
    if (aTransform != NULL)
        point = { x:point.x * aTransform.a + point.y * aTransform.c + aTransform.tx, y:point.x * aTransform.b + point.y * aTransform.d + aTransform.ty };
    aPath.start = point;
    aPath.current = point;
    var previous = aPath.elements[count-1];
    if (count != 0 && previous.type == kCGPathElementMoveToPoint)
    {
        previous.x = point.x;
        previous.y = point.y;
    }
    else
        aPath.elements[aPath.count++] = { type:kCGPathElementMoveToPoint, x:point.x, y:point.y };
}
CGPathCloseSubpath= function(aPath)
{
    var count = aPath.count;
    if (count == 0 || aPath.elements[count-1].type == kCGPathElementCloseSubpath)
        return;
    aPath.elements[aPath.count++] = { type:kCGPathElementCloseSubpath, points:[aPath.start] };
}
CGPathEqualToPath= function(aPath, anotherPath)
{
    if (aPath == anotherPath)
        return YES;
    if (aPath.count != anotherPath.count || !(aPath.start.x == anotherPath.start.x && aPath.start.y == anotherPath.start.y) || !(aPath.current.x == anotherPath.current.x && aPath.current.y == anotherPath.current.y))
        return NO;
    var i = 0,
        count = aPath.count;
    for (; i < count; ++i)
    {
        var element = aPath[i],
            anotherElement = anotherPath[i];
        if (element.type != anotherElement.type)
            return NO;
        if ((element.type == kCGPathElementAddArc || element.type == kCGPathElementAddArcToPoint) &&
            element.radius != anotherElement.radius)
            return NO;
        var j = element.points.length;
        while (j--)
            if (!(element.points[j].x == anotherElement.points[j].x && element.points[j].y == anotherElement.points[j].y))
                return NO;
    }
    return YES;
}
CGPathGetCurrentPoint= function(aPath)
{
    return { x:aPath.current.x, y:aPath.current.y };
}
CGPathIsEmpty= function(aPath)
{
    return !aPath || aPath.count == 0;
}

p;13;CPAnimation.jI;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;6172;
CPAnimationEaseInOut = 0;
CPAnimationEaseIn = 1;
CPAnimationEaseOut = 2;
CPAnimationLinear = 3;
ACTUAL_FRAME_RATE = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_startTime"), new objj_ivar("_duration"), new objj_ivar("_animationCurve"), new objj_ivar("_timingFunction"), new objj_ivar("_frameRate"), new objj_ivar("_progress"), new objj_ivar("_delegate"), new objj_ivar("_timer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithDuration:animationCurve:"), function $CPAnimation__initWithDuration_animationCurve_(self, _cmd, aDuration, anAnimationCurve)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _duration = MAX(0.0, aDuration);
        _animationCurve = anAnimationCurve;
        _frameRate = 60.0;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setAnimationCurve:"), function $CPAnimation__setAnimationCurve_(self, _cmd, anAnimationCurve)
{ with(self)
{
    _animationCurve = anAnimationCurve;
    var timingFunctionName = kCAMediaTimingFunctionLinear;
    switch (_animationCurve)
    {
        case CPAnimationEaseInOut: timingFunctionName = kCAMediaTimingFunctionEaseInEaseOut;
                                    break;
        case CPAnimationEaseIn: timingFunctionName = kCAMediaTimingFunctionEaseIn;
                                    break;
        case CPAnimationEaseOut: timingFunctionName = kCAMediaTimingFunctionEaseOut;
                                    break;
        default: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for animation curve");
                                    break;
    }
    _timingFunction = objj_msgSend(CAMediaTimingFunction, "functionWithName:", timingFunctionName);
}
});
instance_methods[2] = new objj_method(sel_registerName("animationCurve"), function $CPAnimation__animationCurve(self, _cmd)
{ with(self)
{
    return _animationCurve;
}
});
instance_methods[3] = new objj_method(sel_registerName("setDuration:"), function $CPAnimation__setDuration_(self, _cmd, aDuration)
{ with(self)
{
    if (aDuration < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aDuration can't be negative");
    _duration = aDuration;
}
});
instance_methods[4] = new objj_method(sel_registerName("duration"), function $CPAnimation__duration(self, _cmd)
{ with(self)
{
    return _duration;
}
});
instance_methods[5] = new objj_method(sel_registerName("setFrameRate:"), function $CPAnimation__setFrameRate_(self, _cmd, frameRate)
{ with(self)
{
    if (frameRate < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "frameRate can't be negative");
    _frameRate = frameRate;
}
});
instance_methods[6] = new objj_method(sel_registerName("frameRate"), function $CPAnimation__frameRate(self, _cmd)
{ with(self)
{
    return _frameRate;
}
});
instance_methods[7] = new objj_method(sel_registerName("delegate"), function $CPAnimation__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[8] = new objj_method(sel_registerName("setDelegate:"), function $CPAnimation__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
});
instance_methods[9] = new objj_method(sel_registerName("startAnimation"), function $CPAnimation__startAnimation(self, _cmd)
{ with(self)
{
    if (_timer || _delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("animationShouldStart")) && !objj_msgSend(_delegate, "animationShouldStart:", self))
        return;
    _progress = 0.0;
    ACTUAL_FRAME_RATE = 0;
    _startTime = new Date();
    _timer = window.setInterval(function() {
        objj_msgSend(self, "animationTimerDidFire:", _timer);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
    }, 1);
}
});
instance_methods[10] = new objj_method(sel_registerName("animationTimerDidFire:"), function $CPAnimation__animationTimerDidFire_(self, _cmd, aTimer)
{ with(self)
{
    var elapsed = new Date() - _startTime,
        progress = MIN(1.0, 1.0 - (_duration - elapsed / 1000.0) / _duration);
    ++ACTUAL_FRAME_RATE;
    objj_msgSend(self, "setCurrentProgress:", progress);
    if (progress == 1.0)
    {
        window.clearTimeout(_timer);
        _timer = nil;
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("animationDidEnd:")))
            objj_msgSend(_delegate, "animationDidEnd:", self);
    }
}
});
instance_methods[11] = new objj_method(sel_registerName("stopAnimation"), function $CPAnimation__stopAnimation(self, _cmd)
{ with(self)
{
    if (!_timer)
        return;
    window.clearTimeout(_timer);
    _timer = nil;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("animationDidStop:")))
        objj_msgSend(_delegate, "animationDidStop:", self);
}
});
instance_methods[12] = new objj_method(sel_registerName("isAnimating"), function $CPAnimation__isAnimating(self, _cmd)
{ with(self)
{
    return _timer;
}
});
instance_methods[13] = new objj_method(sel_registerName("setCurrentProgress:"), function $CPAnimation__setCurrentProgress_(self, _cmd, aProgress)
{ with(self)
{
    _progress = aProgress;
}
});
instance_methods[14] = new objj_method(sel_registerName("currentProgress"), function $CPAnimation__currentProgress(self, _cmd)
{ with(self)
{
    return _progress;
}
});
instance_methods[15] = new objj_method(sel_registerName("currentValue"), function $CPAnimation__currentValue(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("animation:valueForProgress:")))
        return objj_msgSend(_delegate, "animation:valueForProgress:", self, _progress);
    if (_animationCurve == CPAnimationLinear)
        return _progress;
    alert("IMPLEMENT ANIMATION CURVES!!!");
}
});
class_addMethods(the_class, instance_methods);
}

p;15;CPApplication.jI;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.jc;20024;
CPApp = nil;
CPApplicationWillFinishLaunchingNotification = "CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification = "CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse = -1000;
CPRunAbortedResponse = -1001;
CPRunContinuesResponse = -1002;
{var the_class = objj_allocateClassPair(CPResponder, "CPApplication"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_eventListeners"), new objj_ivar("_currentEvent"), new objj_ivar("_windows"), new objj_ivar("_keyWindow"), new objj_ivar("_mainWindow"), new objj_ivar("_mainMenu"), new objj_ivar("_documentController"), new objj_ivar("_currentSession"), new objj_ivar("_delegate"), new objj_ivar("_namedArgs"), new objj_ivar("_args")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("sharedApplication"), function $CPApplication__sharedApplication(self, _cmd)
{ with(self)
{
    if (!CPApp)
        CPApp = objj_msgSend(objj_msgSend(CPApplication, "alloc"), "init");
    return CPApp;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CPApplication__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _eventListeners = [];
        _windows = [];
        objj_msgSend(_windows, "addObject:", nil);
        _mainMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "MainMenu");
        objj_msgSend(_mainMenu, "setAutoenablesItems:", NO);
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPApplication, "class")),
            newMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "New", sel_registerName("newDocument:"), "N");
        objj_msgSend(newMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/New.png"), CGSizeMake(16.0,16.0)));
        objj_msgSend(newMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/NewHighlighted.png"), CGSizeMake(16.0,16.0)));
        objj_msgSend(_mainMenu, "addItem:", newMenuItem);
        var openMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Open", sel_registerName("openDocument:"), "O");
        objj_msgSend(openMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/Open.png"), CGSizeMake(16.0,16.0)));
        objj_msgSend(openMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/OpenHighlighted.png"), CGSizeMake(16.0,16.0)));
        objj_msgSend(_mainMenu, "addItem:", openMenuItem);
        var saveMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "Save"),
            saveMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save", sel_registerName("saveDocument:"), "");
        objj_msgSend(saveMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/Save.png"), CGSizeMake(16.0,16.0)));
        objj_msgSend(saveMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/SaveHighlighted.png"), CGSizeMake(16.0,16.0)));
        objj_msgSend(saveMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save", sel_registerName("saveDocument:"), "S"));
        objj_msgSend(saveMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save As", sel_registerName("saveDocumentAs:"), ""));
        objj_msgSend(saveMenuItem, "setSubmenu:", saveMenu);
        objj_msgSend(_mainMenu, "addItem:", saveMenuItem);
        var editMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Edit", nil, ""),
            editMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "Edit"),
            undoMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Undo", sel_registerName("undo:"), CPUndoKeyEquivalent),
            redoMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Redo", sel_registerName("redo:"), CPRedoKeyEquivalent);
        objj_msgSend(undoMenuItem, "setKeyEquivalentModifierMask:", CPUndoKeyEquivalentModifierMask);
        objj_msgSend(redoMenuItem, "setKeyEquivalentModifierMask:", CPRedoKeyEquivalentModifierMask);
        objj_msgSend(editMenu, "addItem:", undoMenuItem);
        objj_msgSend(editMenu, "addItem:", redoMenuItem);
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Cut", sel_registerName("cut:"), "X")),
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Copy", sel_registerName("copy:"), "C")),
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Paste", sel_registerName("paste:"), "V"));
        objj_msgSend(editMenuItem, "setSubmenu:", editMenu);
        objj_msgSend(editMenuItem, "setHidden:", YES);
        objj_msgSend(_mainMenu, "addItem:", editMenuItem);
        objj_msgSend(_mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setDelegate:"), function $CPApplication__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPApplicationWillFinishLaunchingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPApplicationDidFinishLaunchingNotification, self);
    }
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("applicationWillFinishLaunching:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_registerName("applicationWillFinishLaunching:"), CPApplicationWillFinishLaunchingNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("applicationDidFinishLaunching:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_registerName("applicationDidFinishLaunching:"), CPApplicationDidFinishLaunchingNotification, self);
}
});
instance_methods[2] = new objj_method(sel_registerName("delegate"), function $CPApplication__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[3] = new objj_method(sel_registerName("finishLaunching"), function $CPApplication__finishLaunching(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "mainBundle"),
        types = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPBundleDocumentTypes");
    if (objj_msgSend(types, "count") > 0)
        _documentController = objj_msgSend(CPDocumentController, "sharedDocumentController");
    var delegateClassName = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPApplicationDelegateClass");
    if (delegateClassName)
    {
        var delegateClass = objj_getClass(delegateClassName);
        if (delegateClass)
            if (objj_msgSend(_documentController, "class") == delegateClass)
                objj_msgSend(self, "setDelegate:", _documentController);
            else
                objj_msgSend(self, "setDelegate:", objj_msgSend(objj_msgSend(delegateClass, "alloc"), "init"));
    }
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPApplicationWillFinishLaunchingNotification, self);
    if (_documentController)
        objj_msgSend(_documentController, "newDocument:", self);
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPApplicationDidFinishLaunchingNotification, self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
}
});
instance_methods[4] = new objj_method(sel_registerName("run"), function $CPApplication__run(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "finishLaunching");
}
});
instance_methods[5] = new objj_method(sel_registerName("runModalForWindow:"), function $CPApplication__runModalForWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(self, "runModalSession:", objj_msgSend(self, "beginModalSessionForWindow:", aWindow));
}
});
instance_methods[6] = new objj_method(sel_registerName("stopModalWithCode:"), function $CPApplication__stopModalWithCode_(self, _cmd, aCode)
{ with(self)
{
    if (!_currentSession)
    {
        return;
    }
    _currentSession._state = aCode;
    _currentSession = _currentSession._previous;
    if (aCode == CPRunAbortedResponse)
        objj_msgSend(self, "_removeRunModalLoop");
}
});
instance_methods[7] = new objj_method(sel_registerName("_removeRunModalLoop"), function $CPApplication___removeRunModalLoop(self, _cmd)
{ with(self)
{
    var count = _eventListeners.length;
    while (count--)
        if (_eventListeners[count]._callback == _CPRunModalLoop)
        {
            _eventListeners.splice(count, 1);
            return;
        }
}
});
instance_methods[8] = new objj_method(sel_registerName("stopModal"), function $CPApplication__stopModal(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "stopModalWithCode:", CPRunStoppedResponse)
}
});
instance_methods[9] = new objj_method(sel_registerName("abortModal"), function $CPApplication__abortModal(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "stopModalWithCode:", CPRunAbortedResponse);
}
});
instance_methods[10] = new objj_method(sel_registerName("beginModalSessionForWindow:"), function $CPApplication__beginModalSessionForWindow_(self, _cmd, aWindow)
{ with(self)
{
    return _CPModalSessionMake(aWindow, 0);
}
});
instance_methods[11] = new objj_method(sel_registerName("runModalSession:"), function $CPApplication__runModalSession_(self, _cmd, aModalSession)
{ with(self)
{
    aModalSession._previous = _currentSession;
    _currentSession = aModalSession;
    var theWindow = aModalSession._window;
    objj_msgSend(theWindow, "center");
    objj_msgSend(theWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, NO);
}
});
instance_methods[12] = new objj_method(sel_registerName("modalWindow"), function $CPApplication__modalWindow(self, _cmd)
{ with(self)
{
    if (!_currentSession)
        return nil;
    return _currentSession._window;
}
});
instance_methods[13] = new objj_method(sel_registerName("_handleKeyEquivalent:"), function $CPApplication___handleKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(_mainMenu, "performKeyEquivalent:", anEvent))
        return YES;
    return NO;
}
});
instance_methods[14] = new objj_method(sel_registerName("sendEvent:"), function $CPApplication__sendEvent_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPKeyDown &&
        objj_msgSend(anEvent, "modifierFlags") & (CPCommandKeyMask | CPControlKeyMask) &&
        objj_msgSend(objj_msgSend(anEvent, "characters"), "length") > 0 &&
        objj_msgSend(self, "_handleKeyEquivalent:", anEvent))
        return;
    if (_eventListeners.length)
    {
        if (_eventListeners[_eventListeners.length-1]._mask & (1 << objj_msgSend(anEvent, "type")))
            _eventListeners.pop()._callback(anEvent);
        return;
    }
    objj_msgSend(objj_msgSend(anEvent, "window"), "sendEvent:", anEvent);
}
});
instance_methods[15] = new objj_method(sel_registerName("doCommandBySelector:"), function $CPApplication__doCommandBySelector_(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
});
instance_methods[16] = new objj_method(sel_registerName("keyWindow"), function $CPApplication__keyWindow(self, _cmd)
{ with(self)
{
    return _keyWindow;
}
});
instance_methods[17] = new objj_method(sel_registerName("mainWindow"), function $CPApplication__mainWindow(self, _cmd)
{ with(self)
{
    return _mainWindow;
}
});
instance_methods[18] = new objj_method(sel_registerName("windowWithWindowNumber:"), function $CPApplication__windowWithWindowNumber_(self, _cmd, aWindowNumber)
{ with(self)
{
    return _windows[aWindowNumber];
}
});
instance_methods[19] = new objj_method(sel_registerName("windows"), function $CPApplication__windows(self, _cmd)
{ with(self)
{
    return _windows;
}
});
instance_methods[20] = new objj_method(sel_registerName("mainMenu"), function $CPApplication__mainMenu(self, _cmd)
{ with(self)
{
    return _mainMenu;
}
});
instance_methods[21] = new objj_method(sel_registerName("setMainMenu:"), function $CPApplication__setMainMenu_(self, _cmd, aMenu)
{ with(self)
{
    _mainMenu = aMenu;
}
});
instance_methods[22] = new objj_method(sel_registerName("tryToPerform:with:"), function $CPApplication__tryToPerform_with_(self, _cmd, anAction, anObject)
{ with(self)
{
    if (!anAction)
        return NO;
    if (objj_msgSend(self, "tryToPerform:with:", anAction, anObject))
        return YES;
    if(objj_msgSend(_delegate, "respondsToSelector:", aSelector))
    {
        objj_msgSend(_delegate, "performSelector:withObject:", aSelector, anObject);
        return YES;
    }
    return NO;
}
});
instance_methods[23] = new objj_method(sel_registerName("sendAction:to:from:"), function $CPApplication__sendAction_to_from_(self, _cmd, anAction, aTarget, aSender)
{ with(self)
{
    var target = objj_msgSend(self, "targetForAction:to:from:", anAction, aTarget, aSender);
    if (!target)
        return NO;
    objj_msgSend(target, "performSelector:withObject:", anAction, aSender);
    return YES;
}
});
instance_methods[24] = new objj_method(sel_registerName("targetForAction:to:from:"), function $CPApplication__targetForAction_to_from_(self, _cmd, anAction, aTarget, aSender)
{ with(self)
{
    if (!anAction)
        return nil;
    if (aTarget)
        return aTarget;
    return objj_msgSend(self, "targetForAction:", anAction);
}
});
instance_methods[25] = new objj_method(sel_registerName("_targetForWindow:action:"), function $CPApplication___targetForWindow_action_(self, _cmd, aWindow, anAction)
{ with(self)
{
    var responder = objj_msgSend(aWindow, "firstResponder"),
        checkWindow = YES;
    while (responder)
    {
        if (objj_msgSend(responder, "respondsToSelector:", anAction))
            return responder;
        if (responder == aWindow)
            checkWindow = NO;
        responder = objj_msgSend(responder, "nextResponder");
    }
    if (checkWindow && objj_msgSend(aWindow, "respondsToSelector:", anAction))
        return aWindow;
    var delegate = objj_msgSend(aWindow, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", anAction))
        return delegate;
    var windowController = objj_msgSend(aWindow, "windowController");
    if (objj_msgSend(windowController, "respondsToSelector:", anAction))
        return windowController;
    var theDocument = objj_msgSend(windowController, "document");
    if (theDocument != delegate && objj_msgSend(theDocument, "respondsToSelector:", anAction))
        return theDocument;
    return nil;
}
});
instance_methods[26] = new objj_method(sel_registerName("targetForAction:"), function $CPApplication__targetForAction_(self, _cmd, anAction)
{ with(self)
{
    if (!anAction)
        return nil;
    var target = objj_msgSend(self, "_targetForWindow:action:", objj_msgSend(self, "keyWindow"), anAction);
    if (target)
        return target;
    target = objj_msgSend(self, "_targetForWindow:action:", objj_msgSend(self, "mainWindow"), anAction);
    if (target)
        return target;
    if (objj_msgSend(self, "respondsToSelector:", anAction))
        return self;
    if (objj_msgSend(_delegate, "respondsToSelector:", anAction))
        return _delegate;
    if (objj_msgSend(_documentController, "respondsToSelector:", anAction))
        return _documentController;
    return nil;
}
});
instance_methods[27] = new objj_method(sel_registerName("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function $CPApplication__setCallback_forNextEventMatchingMask_untilDate_inMode_dequeue_(self, _cmd, aCallback, aMask, anExpiration, aMode, shouldDequeue)
{ with(self)
{
    _eventListeners.push(_CPEventListenerMake(aMask, aCallback));
    if (_eventListeners.length == 3) objj_debug_print_backtrace();
}
});
instance_methods[28] = new objj_method(sel_registerName("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function $CPApplication__setTarget_selector_forNextEventMatchingMask_untilDate_inMode_dequeue_(self, _cmd, aTarget, aSelector, aMask, anExpiration, aMode, shouldDequeue)
{ with(self)
{
    _eventListeners.push(_CPEventListenerMake(aMask, function (anEvent) { objj_msgSend(aTarget, aSelector, anEvent); }));
}
});
instance_methods[29] = new objj_method(sel_registerName("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"), function $CPApplication__beginSheet_modalForWindow_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aWindow, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(aWindow, "_attachSheet:modalDelegate:didEndSelector:contextInfo:", aSheet, aModalDelegate, aDidEndSelector, aContextInfo);
}
});
instance_methods[30] = new objj_method(sel_registerName("arguments"), function $CPApplication__arguments(self, _cmd)
{ with(self)
{
    return _args;
}
});
instance_methods[31] = new objj_method(sel_registerName("namedArguments"), function $CPApplication__namedArguments(self, _cmd)
{ with(self)
{
    return _namedArgs;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var _CPModalSessionMake = function(aWindow, aStopCode)
{
    return { _window:aWindow, _state:CPRunContinuesResponse , _previous:nil };
}
var _CPEventListenerMake = function(anEventMask, aCallback)
{
    return { _mask:anEventMask, _callback:aCallback };
}
var _CPRunModalLoop = function(anEvent)
{
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, NO);
    var theWindow = objj_msgSend(anEvent, "window"),
        modalSession = CPApp._currentSession;
    if (theWindow == modalSession._window || objj_msgSend(theWindow, "worksWhenModal"))
        objj_msgSend(theWindow, "sendEvent:", anEvent);
    if (modalSession._state != CPRunContinuesResponse)
        objj_msgSend(CPApp, "_removeRunModalLoop");
}
CPApplicationMain= function(args, namedArgs)
{
    var mainBundle = objj_msgSend(CPBundle, "mainBundle"),
        principalClass = objj_msgSend(mainBundle, "principalClass");
    if (!principalClass)
        principalClass = objj_msgSend(CPApplication, "class");
    objj_msgSend(principalClass, "sharedApplication");
    CPApp._args = args;
    CPApp._namedArgs = namedArgs;
    objj_msgSend(CPApp, "run");
}

p;10;CPButton.ji;22;_CPImageAndTitleView.ji;12;CGGeometry.ji;11;CPControl.jc;21541;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
CPNoImage = 0;
CPImageOnly = 1;
CPImageLeft = 2;
CPImageRight = 3;
CPImageBelow = 4;
CPImageAbove = 5;
CPImageOverlaps = 6;
CPOnState = 1;
CPOffState = 0;
CPMixedState = -1;
CPRoundedBezelStyle = 1;
CPRegularSquareBezelStyle = 2;
CPThickSquareBezelStyle = 3;
CPThickerSquareBezelStyle = 4;
CPDisclosureBezelStyle = 5;
CPShadowlessSquareBezelStyle = 6;
CPCircularBezelStyle = 7;
CPTexturedSquareBezelStyle = 8;
CPHelpButtonBezelStyle = 9;
CPSmallSquareBezelStyle = 10;
CPTexturedRoundedBezelStyle = 11;
CPRoundRectBezelStyle = 12;
CPRecessedBezelStyle = 13;
CPRoundedDisclosureBezelStyle = 14;
CPHUDBezelStyle = -1;
CPMomentaryLightButton = 0;
CPPushOnPushOffButton = 1;
CPToggleButton = 2;
CPSwitchButton = 3;
CPRadioButton = 4;
CPMomentaryChangeButton = 5;
CPOnOffButton = 6;
CPMomentaryPushInButton = 7;
CPMomentaryPushButton = 0;
CPMomentaryLight = 7;
var CPHUDBezelStyleTextColor = nil;
var _CPButtonClassName = nil,
    _CPButtonBezelStyleSizes = {},
    _CPButtonBezelStyleIdentifiers = {},
    _CPButtonBezelStyleHighlightedIdentifier = "Highlighted";
{var the_class = objj_allocateClassPair(CPControl, "CPButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_allowsMixedState"), new objj_ivar("_isHighlighted"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_imagePosition"), new objj_ivar("_imageScalng"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize"), new objj_ivar("_bezelBorderNeedsUpdate"), new objj_ivar("_imageAndTitleView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPButton__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPButton, "class"))
        return;
    _CPButtonClassName = objj_msgSend(CPButton, "className");
    _CPButtonBezelStyleIdentifiers[CPRoundedBezelStyle] = "Rounded";
    _CPButtonBezelStyleIdentifiers[CPRegularSquareBezelStyle] = "RegularSquare";
    _CPButtonBezelStyleIdentifiers[CPThickSquareBezelStyle] = "ThickSquare";
    _CPButtonBezelStyleIdentifiers[CPThickerSquareBezelStyle] = "ThickerSquare";
    _CPButtonBezelStyleIdentifiers[CPDisclosureBezelStyle] = "Disclosure";
    _CPButtonBezelStyleIdentifiers[CPShadowlessSquareBezelStyle] = "ShadowlessSquare";
    _CPButtonBezelStyleIdentifiers[CPCircularBezelStyle] = "Circular";
    _CPButtonBezelStyleIdentifiers[CPTexturedSquareBezelStyle] = "TexturedSquare";
    _CPButtonBezelStyleIdentifiers[CPHelpButtonBezelStyle] = "HelpButton";
    _CPButtonBezelStyleIdentifiers[CPSmallSquareBezelStyle] = "SmallSquare";
    _CPButtonBezelStyleIdentifiers[CPTexturedRoundedBezelStyle] = "TexturedRounded";
    _CPButtonBezelStyleIdentifiers[CPRoundRectBezelStyle] = "RoundRect";
    _CPButtonBezelStyleIdentifiers[CPRecessedBezelStyle] = "Recessed";
    _CPButtonBezelStyleIdentifiers[CPRoundedDisclosureBezelStyle] = "RoundedDisclosure";
    _CPButtonBezelStyleIdentifiers[CPHUDBezelStyle] = "HUD";
    var regularIdentifier = _CPControlIdentifierForControlSize(CPRegularControlSize),
        smallIdentifier = _CPControlIdentifierForControlSize(CPSmallControlSize),
        miniIdentifier = _CPControlIdentifierForControlSize(CPMiniControlSize);
    var prefix = _CPButtonClassName + _CPButtonBezelStyleIdentifiers[CPRoundRectBezelStyle];
    _CPButtonBezelStyleSizes[prefix+regularIdentifier] = [{width:10.0,height:18.0},{width:1.0,height:18.0},{width:10.0,height:18.0}];
    _CPButtonBezelStyleSizes[prefix+regularIdentifier+_CPButtonBezelStyleHighlightedIdentifier] = [{width:10.0,height:18.0},{width:1.0,height:18.0},{width:10.0,height:18.0}];
    var prefix = _CPButtonClassName + _CPButtonBezelStyleIdentifiers[CPHUDBezelStyle];
    _CPButtonBezelStyleSizes[prefix+regularIdentifier] = [{width:13.0,height:20.0},{width:1.0,height:20.0},{width:13.0,height:20.0}];
    _CPButtonBezelStyleSizes[prefix+regularIdentifier+_CPButtonBezelStyleHighlightedIdentifier] = [{width:13.0,height:20.0},{width:1.0,height:20.0},{width:13.0,height:20.0}];
    CPHUDBezelStyleTextColor = objj_msgSend(CPColor, "whiteColor");
    var prefix = _CPButtonClassName + _CPButtonBezelStyleIdentifiers[CPTexturedRoundedBezelStyle];
    _CPButtonBezelStyleSizes[prefix+regularIdentifier] = [{width:7.0,height:20.0},{width:1.0,height:20.0},{width:7.0,height:20.0}];
    _CPButtonBezelStyleSizes[prefix+regularIdentifier+_CPButtonBezelStyleHighlightedIdentifier] = [{width:7.0,height:20.0},{width:1.0,height:20.0},{width:7.0,height:20.0}];
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setButtonType:"), function $CPButton__setButtonType_(self, _cmd, aButtonType)
{ with(self)
{
    if (aButtonType == CPSwitchButton)
    {
        objj_msgSend(self, "setBordered:", NO);
        objj_msgSend(self, "setImage:", nil);
        objj_msgSend(self, "setAlternateImage:", nil);
        objj_msgSend(self, "setAlignment:", CPLeftTextAlignment);
    }
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithFrame:"), function $CPButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _imagePosition = CPNoImage;
        _imageScaling = CPScaleNone;
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setBezelStyle:", CPRoundRectBezelStyle);
        objj_msgSend(self, "setBordered:", YES);
        objj_msgSend(self, "setAlignment:", CPCenterTextAlignment);
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("setImagePosition:"), function $CPButton__setImagePosition_(self, _cmd, anImagePosition)
{ with(self)
{
    if (_imagePosition == anImagePosition)
        return;
    _imagePosition = anImagePosition;
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[3] = new objj_method(sel_registerName("imagePosition"), function $CPButton__imagePosition(self, _cmd)
{ with(self)
{
    return _imagePosition;
}
});
instance_methods[4] = new objj_method(sel_registerName("setImageScaling:"), function $CPButton__setImageScaling_(self, _cmd, anImageScaling)
{ with(self)
{
    if (_imageScaling == anImageScaling)
        return;
    _imageScaling = anImageScaling;
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[5] = new objj_method(sel_registerName("imageScaling"), function $CPButton__imageScaling(self, _cmd)
{ with(self)
{
    return _imageScaling;
}
});
instance_methods[6] = new objj_method(sel_registerName("setTextColor:"), function $CPButton__setTextColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setTextColor:", aColor);
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[7] = new objj_method(sel_registerName("setFont:"), function $CPButton__setFont_(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFont:", aFont);
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[8] = new objj_method(sel_registerName("allowsMixedState"), function $CPButton__allowsMixedState(self, _cmd)
{ with(self)
{
    return _allowsMixedState;
}
});
instance_methods[9] = new objj_method(sel_registerName("setAllowsMixedState:"), function $CPButton__setAllowsMixedState_(self, _cmd, aFlag)
{ with(self)
{
    _allowsMixedState = aFlag;
}
});
instance_methods[10] = new objj_method(sel_registerName("setNextState"), function $CPButton__setNextState(self, _cmd)
{ with(self)
{
    if (_state == CPOffState)
        _state = CPOnState;
    else
        _state = (_state >= CPOnState && _allowsMixedState) ? CPMixedState : CPOffState;
}
});
instance_methods[11] = new objj_method(sel_registerName("setState:"), function $CPButton__setState_(self, _cmd, aState)
{ with(self)
{
    _state = aState;
}
});
instance_methods[12] = new objj_method(sel_registerName("state"), function $CPButton__state(self, _cmd)
{ with(self)
{
    return _state;
}
});
instance_methods[13] = new objj_method(sel_registerName("setAlignment:"), function $CPButton__setAlignment_(self, _cmd, anAlignment)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setAlignment:", anAlignment);
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[14] = new objj_method(sel_registerName("setImage:"), function $CPButton__setImage_(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[15] = new objj_method(sel_registerName("image"), function $CPButton__image(self, _cmd)
{ with(self)
{
    return _image;
}
});
instance_methods[16] = new objj_method(sel_registerName("setAlternateImage:"), function $CPButton__setAlternateImage_(self, _cmd, anImage)
{ with(self)
{
    _alternateImage = anImage;
}
});
instance_methods[17] = new objj_method(sel_registerName("alternateImage"), function $CPButton__alternateImage(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
});
instance_methods[18] = new objj_method(sel_registerName("setTitle:"), function $CPButton__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (_title == aTitle)
        return;
    _title = aTitle;
    objj_msgSend(self, "drawContentsWithHighlight:", _isHighlighted);
}
});
instance_methods[19] = new objj_method(sel_registerName("title"), function $CPButton__title(self, _cmd)
{ with(self)
{
    return _title;
}
});
instance_methods[20] = new objj_method(sel_registerName("tile"), function $CPButton__tile(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "bounds").size;
    if (_isBordered)
    {
        var imageAndTitleSize = CGSizeMakeCopy(size);
        if (_bezelStyle == CPHUDBezelStyle)
            imageAndTitleSize.height -= 4.0;
        else if (_bezelStyle == CPRoundRectBezelStyle)
            imageAndTitleSize.height -= 2.0;
        else if (_bezelStyle == CPTexturedRoundedBezelStyle)
            imageAndTitleSize.height -= 2.0;
        objj_msgSend(_imageAndTitleView, "setFrameSize:", imageAndTitleSize);
    }
    else
        objj_msgSend(_imageAndTitleView, "setFrameSize:", size);
}
});
instance_methods[21] = new objj_method(sel_registerName("sizeToFit"), function $CPButton__sizeToFit(self, _cmd)
{ with(self)
{
    objj_msgSend(_imageAndTitleView, "sizeToFit");
    var frame = objj_msgSend(_imageAndTitleView, "frame"),
        height = CGRectGetHeight(frame);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame),height));
}
});
instance_methods[22] = new objj_method(sel_registerName("setFrameSize:"), function $CPButton__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(self, "tile");
}
});
instance_methods[23] = new objj_method(sel_registerName("highlight:"), function $CPButton__highlight_(self, _cmd, aFlag)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", aFlag);
    objj_msgSend(self, "drawContentsWithHighlight:", aFlag);
}
});
instance_methods[24] = new objj_method(sel_registerName("setTag:"), function $CPButton__setTag_(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
});
instance_methods[25] = new objj_method(sel_registerName("tag"), function $CPButton__tag(self, _cmd)
{ with(self)
{
    return _tag;
}
});
instance_methods[26] = new objj_method(sel_registerName("mouseDown:"), function $CPButton__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    _isHighlighted = YES;
    objj_msgSend(self, "highlight:", _isHighlighted);
}
});
instance_methods[27] = new objj_method(sel_registerName("mouseDragged:"), function $CPButton__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    _isHighlighted = CGRectContainsPoint(objj_msgSend(self, "bounds"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
    objj_msgSend(self, "highlight:", _isHighlighted);
}
});
instance_methods[28] = new objj_method(sel_registerName("mouseUp:"), function $CPButton__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    _isHighlighted = NO;
    objj_msgSend(self, "highlight:", _isHighlighted);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "mouseUp:", anEvent);
}
});
instance_methods[29] = new objj_method(sel_registerName("setControlSize:"), function $CPButton__setControlSize_(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "drawBezelWithHighlight:", _isHighlighted);
    objj_msgSend(self, "_updateTextAttributes");
}
});
instance_methods[30] = new objj_method(sel_registerName("controlSize"), function $CPButton__controlSize(self, _cmd)
{ with(self)
{
    return _controlSize;
}
});
instance_methods[31] = new objj_method(sel_registerName("setBordered:"), function $CPButton__setBordered_(self, _cmd, isBordered)
{ with(self)
{
    if (_isBordered == isBordered)
        return;
    _isBordered = isBordered;
    objj_msgSend(self, "updateBackgroundColors");
    objj_msgSend(self, "drawBezelWithHighlight:", _isHighlighted);
    objj_msgSend(self, "tile");
}
});
instance_methods[32] = new objj_method(sel_registerName("isBordered"), function $CPButton__isBordered(self, _cmd)
{ with(self)
{
    return _isBordered;
}
});
instance_methods[33] = new objj_method(sel_registerName("setBezelStyle:"), function $CPButton__setBezelStyle_(self, _cmd, aBezelStyle)
{ with(self)
{
    if (aBezelStyle == CPRoundedBezelStyle ||
        aBezelStyle == CPRoundedBezelStyle ||
        aBezelStyle == CPRegularSquareBezelStyle ||
        aBezelStyle == CPThickSquareBezelStyle ||
        aBezelStyle == CPThickerSquareBezelStyle ||
        aBezelStyle == CPDisclosureBezelStyle ||
        aBezelStyle == CPShadowlessSquareBezelStyle ||
        aBezelStyle == CPCircularBezelStyle ||
        aBezelStyle == CPTexturedSquareBezelStyle ||
        aBezelStyle == CPHelpButtonBezelStyle ||
        aBezelStyle == CPSmallSquareBezelStyle ||
        aBezelStyle == CPRecessedBezelStyle ||
        aBezelStyle == CPRoundedDisclosureBezelStyle)
        aBezelStyle = CPRoundRectBezelStyle;
    if (_bezelStyle == aBezelStyle)
        return;
    _bezelStyle = aBezelStyle;
    objj_msgSend(self, "updateBackgroundColors");
    objj_msgSend(self, "drawBezelWithHighlight:", _isHighlighted);
    objj_msgSend(self, "_updateTextAttributes");
    objj_msgSend(self, "tile");
}
});
instance_methods[34] = new objj_method(sel_registerName("bezelStyle"), function $CPButton__bezelStyle(self, _cmd)
{ with(self)
{
    return _bezelStyle;
}
});
instance_methods[35] = new objj_method(sel_registerName("updateBackgroundColors"), function $CPButton__updateBackgroundColors(self, _cmd)
{ with(self)
{
    if (_isBordered)
    {
        objj_msgSend(self, "setBackgroundColor:forName:", _CPControlThreePartImagePattern(NO,_CPButtonBezelStyleSizes,_CPButtonClassName,_CPButtonBezelStyleIdentifiers[_bezelStyle],_CPControlIdentifierForControlSize(_controlSize)), CPControlNormalBackgroundColor);
        objj_msgSend(self, "setBackgroundColor:forName:", _CPControlThreePartImagePattern(NO,_CPButtonBezelStyleSizes,_CPButtonClassName,_CPButtonBezelStyleIdentifiers[_bezelStyle],_CPControlIdentifierForControlSize(_controlSize),_CPButtonBezelStyleHighlightedIdentifier), CPControlHighlightedBackgroundColor);
    }
    else
    {
        objj_msgSend(self, "setBackgroundColor:forName:", nil, CPControlNormalBackgroundColor);
        objj_msgSend(self, "setBackgroundColor:forName:", nil, CPControlHighlightedBackgroundColor);
    }
}
});
instance_methods[36] = new objj_method(sel_registerName("drawBezelWithHighlight:"), function $CPButton__drawBezelWithHighlight_(self, _cmd, shouldHighlight)
{ with(self)
{
    _bezelBorderNeedsUpdate = !objj_msgSend(self, "window");
    if (_bezelBorderNeedsUpdate)
        return;
    objj_msgSend(self, "setBackgroundColorWithName:", shouldHighlight?CPControlHighlightedBackgroundColor:CPControlNormalBackgroundColor);
}
});
instance_methods[37] = new objj_method(sel_registerName("drawContentsWithHighlight:"), function $CPButton__drawContentsWithHighlight_(self, _cmd, isHighlighted)
{ with(self)
{
    if (!_title && !_image && !_alternateTitle && !_alternateImage && !_imageAndTitleView)
        return;
    if (!_imageAndTitleView)
    {
        _imageAndTitleView = objj_msgSend(objj_msgSend(_CPImageAndTitleView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _imageAndTitleView);
        objj_msgSend(self, "tile");
    }
    objj_msgSend(_imageAndTitleView, "setFont:", objj_msgSend(self, "font"));
    objj_msgSend(_imageAndTitleView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_imageAndTitleView, "setAlignment:", objj_msgSend(self, "alignment"));
    objj_msgSend(_imageAndTitleView, "setImagePosition:", _imagePosition);
    objj_msgSend(_imageAndTitleView, "setImageScaling:", _imageScaling);
    objj_msgSend(_imageAndTitleView, "setTitle:", isHighlighted&&_alternateTitle?_alternateTitle:_title);
    objj_msgSend(_imageAndTitleView, "setImage:", isHighlighted&&_alternateImage?_alternateImage:_image);
}
});
instance_methods[38] = new objj_method(sel_registerName("viewDidMoveToWindow"), function $CPButton__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
    if (_bezelBorderNeedsUpdate)
        objj_msgSend(self, "drawBezelWithHighlight:", _isHighlighted);
}
});
instance_methods[39] = new objj_method(sel_registerName("_updateTextAttributes"), function $CPButton___updateTextAttributes(self, _cmd)
{ with(self)
{
    if (_bezelStyle == CPHUDBezelStyle)
        objj_msgSend(self, "setTextColor:", CPHUDBezelStyleTextColor);
    if (_controlSize == CPRegularControlSize)
        objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPButtonImageKey = "CPButtonImageKey",
    CPButtonAlternateImageKey = "CPButtonAlternateImageKey",
    CPButtonTitleKey = "CPButtonTitleKey",
    CPButtonAlteranteTitleKey = "CPButtonAlternateTitleKey",
    CPButtonImageAndTitleViewKey = "CPButtonImageAndTitleViewKey",
    CPButtonImagePositionKey = "CPButtonImagePositionKey",
    CPButtonImageScalingKey = "CPButtonImageScalingKey",
    CPButtonIsBorderedKey = "CPButtonIsBorderedKey",
    CPButtonBezelStyleKey = "CPButtonBezelStyleKey",
    CPButtonImageAndTitleViewKey = "CPButtonImageAndTitleViewKey";
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPButton__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonImageKey));
        objj_msgSend(self, "setAlternateImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateImageKey));
        objj_msgSend(self, "setTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonTitleKey));
        objj_msgSend(self, "setImagePosition:", objj_msgSend(aCoder, "decodeIntForKey:", CPButtonImagePositionKey));
        objj_msgSend(self, "setImageScaling:", objj_msgSend(aCoder, "decodeIntForKey:", CPButtonImageScalingKey));
        objj_msgSend(self, "setBezelStyle:", objj_msgSend(aCoder, "decodeIntForKey:", CPButtonBezelStyleKey));
        objj_msgSend(self, "setBordered:", objj_msgSend(aCoder, "decodeBoolForKey:", CPButtonIsBorderedKey));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPButton__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = objj_msgSend(_subviews, "copy");
    objj_msgSend(_subviews, "removeObjectIdenticalTo:", _imageAndTitleView);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPButtonImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPButtonAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPButtonTitleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _imagePosition, CPButtonImagePositionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _imageScaling, CPButtonImageScalingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isBordered, CPButtonIsBorderedKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _bezelStyle, CPButtonBezelStyleKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;7;CPCib.jI;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibCustomObject.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;22;_CPCibWindowTemplate.jc;2107;
CPCibOwner = "CPCibOwner",
CPCibTopLevelObjects = "CPCibTopLevelObjects";
var CPCibObjectDataKey = "CPCibObjectDataKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithContentsOfURL:"), function $CPCib__initWithContentsOfURL_(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _data = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:error:", objj_msgSend(CPURLRequest, "requestWithURL:", aURL), nil, nil);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("instantiateCibWithExternalNameTable:"), function $CPCib__instantiateCibWithExternalNameTable_(self, _cmd, anExternalNameTable)
{ with(self)
{
    var unarchiver = objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver, "alloc"), "initForReadingWithData:", _data),
        objectData = objj_msgSend(unarchiver, "decodeObjectForKey:", CPCibObjectDataKey);
    if (!objectData || !objj_msgSend(objectData, "isKindOfClass:", objj_msgSend(_CPCibObjectData, "class")))
        return NO;
    objj_msgSend(objectData, "establishConnectionsWithExternalNameTable:", anExternalNameTable);
    var owner = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibOwner),
        topLevelObjects = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibTopLevelObjects);
}
});
instance_methods[2] = new objj_method(sel_registerName("instantiateCibWithOwner:topLevelObjects:"), function $CPCib__instantiateCibWithOwner_topLevelObjects_(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", anOwner,CPCibOwner,topLevelObjects,CPCibTopLevelObjects);
    return objj_msgSend(self, "instantiate");
}
});
class_addMethods(the_class, instance_methods);
}

p;12;CPClipView.ji;8;CPView.jc;3814;
{var the_class = objj_allocateClassPair(CPView, "CPClipView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documentView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setDocumentView:"), function $CPClipView__setDocumentView_(self, _cmd, aView)
{ with(self)
{
    if (_documentView == aView)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_documentView)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, _documentView);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, _documentView);
        objj_msgSend(_documentView, "removeFromSuperview");
    }
    _documentView = aView;
    if (_documentView)
    {
        objj_msgSend(_documentView, "setFrameOrigin:", CGPointMake(0.0,0.0));
        objj_msgSend(self, "addSubview:", _documentView);
  objj_msgSend(_documentView, "setPostsFrameChangedNotifications:", YES);
  objj_msgSend(_documentView, "setPostsBoundsChangedNotifications:", YES);
  objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("viewFrameChanged:"), CPViewFrameDidChangeNotification, _documentView);
  objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("viewBoundsChanged:"), CPViewBoundsDidChangeNotification, _documentView);
    }
}
});
instance_methods[1] = new objj_method(sel_registerName("documentView"), function $CPClipView__documentView(self, _cmd)
{ with(self)
{
    return _documentView;
}
});
instance_methods[2] = new objj_method(sel_registerName("constrainScrollPoint:"), function $CPClipView__constrainScrollPoint_(self, _cmd, aPoint)
{ with(self)
{
    var documentFrame = objj_msgSend(_documentView, "frame");
    aPoint.x = MAX(0.0, MIN(aPoint.x, MAX((documentFrame.size.width) - (_bounds.size.width), 0.0)));
    aPoint.y = MAX(0.0, MIN(aPoint.y, MAX((documentFrame.size.height) - (_bounds.size.height), 0.0)));
    return aPoint;
}
});
instance_methods[3] = new objj_method(sel_registerName("setBoundsOrigin:"), function $CPClipView__setBoundsOrigin_(self, _cmd, aPoint)
{ with(self)
{
    if ((_bounds.origin.x == aPoint.x && _bounds.origin.y == aPoint.y))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setBoundsOrigin:", aPoint);
    var superview = objj_msgSend(self, "superview");
    if(objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
});
instance_methods[4] = new objj_method(sel_registerName("scrollToPoint:"), function $CPClipView__scrollToPoint_(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "setBoundsOrigin:", objj_msgSend(self, "constrainScrollPoint:", aPoint));
}
});
instance_methods[5] = new objj_method(sel_registerName("viewBoundsChanged:"), function $CPClipView__viewBoundsChanged_(self, _cmd, aNotification)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if(objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
});
instance_methods[6] = new objj_method(sel_registerName("viewFrameChanged:"), function $CPClipView__viewFrameChanged_(self, _cmd, aNotification)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if(objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
});
class_addMethods(the_class, instance_methods);
}

p;18;CPCollectionView.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.jI;15;AppKit/CPView.jc;17291;
{var the_class = objj_allocateClassPair(CPView, "CPCollectionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content"), new objj_ivar("_items"), new objj_ivar("_itemData"), new objj_ivar("_itemPrototype"), new objj_ivar("_itemForDragging"), new objj_ivar("_cachedItems"), new objj_ivar("_maxNumberOfRows"), new objj_ivar("_maxNumberOfColumns"), new objj_ivar("_minItemSize"), new objj_ivar("_maxItemSize"), new objj_ivar("_tileWidth"), new objj_ivar("_isSelectable"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_selectionIndexes"), new objj_ivar("_itemSize"), new objj_ivar("_horizontalMargin"), new objj_ivar("_verticalMargin"), new objj_ivar("_numberOfRows"), new objj_ivar("_numberOfColumns"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPCollectionView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _items = [];
        _content = [];
        _cachedItems = [];
        _itemSize = CGSizeMakeZero();
        _minItemSize = CGSizeMakeZero();
        _maxItemSize = CGSizeMakeZero();
        _verticalMargin = 5.0;
        _tileWidth = -1.0;
        _selectionIndexes = objj_msgSend(CPIndexSet, "indexSet");
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setItemPrototype:"), function $CPCollectionView__setItemPrototype_(self, _cmd, anItem)
{ with(self)
{
    _itemData = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", anItem);
    _itemForDragging = anItem
    objj_msgSend(self, "reloadContent");
}
});
instance_methods[2] = new objj_method(sel_registerName("itemPrototype"), function $CPCollectionView__itemPrototype(self, _cmd)
{ with(self)
{
    return _itemPrototype;
}
});
instance_methods[3] = new objj_method(sel_registerName("newItemForRepresentedObject:"), function $CPCollectionView__newItemForRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    var item = nil;
    if (_cachedItems.length)
        item = _cachedItems.pop();
    else
        item = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _itemData);
    objj_msgSend(item, "setRepresentedObject:", anObject);
    objj_msgSend(objj_msgSend(item, "view"), "setFrameSize:", _itemSize);
    return item;
}
});
instance_methods[4] = new objj_method(sel_registerName("acceptsFirstResponder"), function $CPCollectionView__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[5] = new objj_method(sel_registerName("isFirstResponder"), function $CPCollectionView__isFirstResponder(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "window"), "firstResponder") == self;
}
});
instance_methods[6] = new objj_method(sel_registerName("setContent:"), function $CPCollectionView__setContent_(self, _cmd, anArray)
{ with(self)
{
    if (_content == anArray)
        return;
    _content = anArray;
    objj_msgSend(self, "reloadContent");
}
});
instance_methods[7] = new objj_method(sel_registerName("content"), function $CPCollectionView__content(self, _cmd)
{ with(self)
{
    return _content;
}
});
instance_methods[8] = new objj_method(sel_registerName("items"), function $CPCollectionView__items(self, _cmd)
{ with(self)
{
    return _items;
}
});
instance_methods[9] = new objj_method(sel_registerName("setSelectable:"), function $CPCollectionView__setSelectable_(self, _cmd, isSelectable)
{ with(self)
{
    if (_isSelectable == isSelectable)
        return;
    _isSelectable = isSelectable;
    if (!_isSelectable)
    {
        var index = CPNotFound;
        while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
            objj_msgSend(_items[index], "setSelected:", NO);
    }
}
});
instance_methods[10] = new objj_method(sel_registerName("isSelected"), function $CPCollectionView__isSelected(self, _cmd)
{ with(self)
{
    return _isSelected;
}
});
instance_methods[11] = new objj_method(sel_registerName("setAllowsMultipleSelection:"), function $CPCollectionView__setAllowsMultipleSelection_(self, _cmd, shouldAllowMultipleSelection)
{ with(self)
{
    _allowsMultipleSelection = shouldAllowsMultipleSelection;
}
});
instance_methods[12] = new objj_method(sel_registerName("allowsMultipleSelection"), function $CPCollectionView__allowsMultipleSelection(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
});
instance_methods[13] = new objj_method(sel_registerName("setSelectionIndexes:"), function $CPCollectionView__setSelectionIndexes_(self, _cmd, anIndexSet)
{ with(self)
{
    if (_selectionIndexes == anIndexSet)
        return;
    var index = CPNotFound;
    while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        objj_msgSend(_items[index], "setSelected:", NO);
    _selectionIndexes = anIndexSet;
    var index = CPNotFound;
    while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        objj_msgSend(_items[index], "setSelected:", YES);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("collectionViewDidChangeSelection:")))
        objj_msgSend(_delegate, "collectionViewDidChangeSelection:", self)
}
});
instance_methods[14] = new objj_method(sel_registerName("selectionIndexes"), function $CPCollectionView__selectionIndexes(self, _cmd)
{ with(self)
{
    return _selectionIndexes;
}
});
instance_methods[15] = new objj_method(sel_registerName("reloadContent"), function $CPCollectionView__reloadContent(self, _cmd)
{ with(self)
{
    var count = _items.length;
    while (count--)
    {
        objj_msgSend(objj_msgSend(_items[count], "view"), "removeFromSuperview");
        _cachedItems.push(_items[count]);
    }
    _items = [];
    if (!_itemData || !_content)
        return;
    var index = 0;
    count = _content.length;
    for (; index < count; ++index)
    {
        _items.push(objj_msgSend(self, "newItemForRepresentedObject:", _content[index]));
        objj_msgSend(self, "addSubview:", objj_msgSend(_items[index], "view"));
    }
    objj_msgSend(self, "tile");
}
});
instance_methods[16] = new objj_method(sel_registerName("tile"), function $CPCollectionView__tile(self, _cmd)
{ with(self)
{
    var width = CGRectGetWidth(objj_msgSend(self, "bounds"));
    if (!objj_msgSend(_content, "count") || width == _tileWidth)
        return;
    var itemSize = CGSizeMakeCopy(_minItemSize);
    _numberOfColumns = MAX(1.0, FLOOR(width / itemSize.width));
    if (_maxNumberOfColumns > 0)
        _numberOfColumns = MIN(_maxNumberOfColumns, _numberOfColumns);
    var remaining = width - _numberOfColumns * itemSize.width,
        itemsNeedSizeUpdate = NO;
    if (remaining > 0 && itemSize.width < _maxItemSize.width)
        itemSize.width = MIN(_maxItemSize.width, itemSize.width + FLOOR(remaining / _numberOfColumns));
    if (!CGSizeEqualToSize(_itemSize, itemSize))
    {
        _itemSize = itemSize;
        itemsNeedSizeUpdate = YES;
    }
    var index = 0,
        count = _items.length;
    if (_maxNumberOfColumns > 0 && _maxNumberOfRows > 0)
        count = MIN(count, _maxNumberOfColumns * _maxNumberOfRows);
    _numberOfRows = CEIL(count / _numberOfColumns);
    _horizontalMargin = FLOOR((width - _numberOfColumns * itemSize.width) / (_numberOfColumns + 1));
    var x = _horizontalMargin,
        y = -itemSize.height;
    for (; index < count; ++index)
    {
        if (index % _numberOfColumns == 0)
        {
            x = _horizontalMargin;
            y += _verticalMargin + itemSize.height;
        }
        var view = objj_msgSend(_items[index], "view");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(x,y));
        if (itemsNeedSizeUpdate)
            objj_msgSend(view, "setFrameSize:", _itemSize);
        x += itemSize.width + _horizontalMargin;
    }
    _tileWidth = width;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(width,y+itemSize.height+_verticalMargin));
    _tileWidth = -1.0;
}
});
instance_methods[17] = new objj_method(sel_registerName("resizeSubviewsWithOldSize:"), function $CPCollectionView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "tile");
}
});
instance_methods[18] = new objj_method(sel_registerName("setMaxNumberOfRows:"), function $CPCollectionView__setMaxNumberOfRows_(self, _cmd, aMaxNumberOfRows)
{ with(self)
{
    if (_maxNumberOfRows == aMaxNumberOfRows)
        return;
    _maxNumberOfRows = aMaxNumberOfRows;
    objj_msgSend(self, "tile");
}
});
instance_methods[19] = new objj_method(sel_registerName("maxNumberOfRows"), function $CPCollectionView__maxNumberOfRows(self, _cmd)
{ with(self)
{
    return _maxNumberOfRows;
}
});
instance_methods[20] = new objj_method(sel_registerName("setMaxNumberOfColumns:"), function $CPCollectionView__setMaxNumberOfColumns_(self, _cmd, aMaxNumberOfColumns)
{ with(self)
{
    if (_maxNumberOfColumns == aMaxNumberOfColumns)
        return;
    _maxNumberOfColumns = aMaxNumberOfColumns;
    objj_msgSend(self, "tile");
}
});
instance_methods[21] = new objj_method(sel_registerName("maxNumberOfColumns"), function $CPCollectionView__maxNumberOfColumns(self, _cmd)
{ with(self)
{
    return _maxNumberOfColumns;
}
});
instance_methods[22] = new objj_method(sel_registerName("setMinItemSize:"), function $CPCollectionView__setMinItemSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_minItemSize, aSize))
        return;
    _minItemSize = CGSizeMakeCopy(aSize);
    objj_msgSend(self, "tile");
}
});
instance_methods[23] = new objj_method(sel_registerName("minItemSize"), function $CPCollectionView__minItemSize(self, _cmd)
{ with(self)
{
    return _minItemSize;
}
});
instance_methods[24] = new objj_method(sel_registerName("setMaxItemSize:"), function $CPCollectionView__setMaxItemSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_maxItemSize, aSize))
        return;
    _maxItemSize = CGSizeMakeCopy(aSize);
    objj_msgSend(self, "tile");
}
});
instance_methods[25] = new objj_method(sel_registerName("maxItemSize"), function $CPCollectionView__maxItemSize(self, _cmd)
{ with(self)
{
    return _maxItemSize;
}
});
instance_methods[26] = new objj_method(sel_registerName("mouseUp:"), function $CPCollectionView__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(_selectionIndexes, "count") && objj_msgSend(anEvent, "clickCount") == 2 && objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("collectionView:didDoubleClickOnItemAtIndex:")))
        objj_msgSend(_delegate, "collectionView:didDoubleClickOnItemAtIndex:", self, objj_msgSend(_selectionIndexes, "firstIndex"));
}
});
instance_methods[27] = new objj_method(sel_registerName("mouseDown:"), function $CPCollectionView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        row = FLOOR(location.y / (_itemSize.height + _verticalMargin)),
        column = FLOOR(location.x / (_itemSize.width + _horizontalMargin)),
        index = row * _numberOfColumns + column;
    if (index >= 0 && index < _items.length)
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
});
instance_methods[28] = new objj_method(sel_registerName("mouseDragged:"), function $CPCollectionView__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("collectionView:dragTypesForItemsAtIndexes:")))
        return;
    if (!objj_msgSend(_selectionIndexes, "count"))
        return;
    var dragTypes = objj_msgSend(_delegate, "collectionView:dragTypesForItemsAtIndexes:", self, _selectionIndexes);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", dragTypes, self);
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    objj_msgSend(_itemForDragging, "setRepresentedObject:", _content[objj_msgSend(_selectionIndexes, "firstIndex")]);
    var view = objj_msgSend(_itemForDragging, "view"),
        frame = objj_msgSend(view, "frame");
    objj_msgSend(view, "setFrameSize:", _itemSize);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes, "firstIndex")], "view"), "frame").origin, CGPointMakeZero(), anEvent, nil, self, YES);
}
});
instance_methods[29] = new objj_method(sel_registerName("pasteboard:provideDataForType:"), function $CPCollectionView__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{
    objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(_delegate, "collectionView:dataForItemsAtIndexes:forType:", self, _selectionIndexes, aType), aType);
}
});
instance_methods[30] = new objj_method(sel_registerName("setVerticalMargin:"), function $CPCollectionView__setVerticalMargin_(self, _cmd, aVerticalMargin)
{ with(self)
{
    if (_verticalMargin == aVerticalMargin)
        return;
    _verticalMargin = aVerticalMargin;
    objj_msgSend(self, "tile");
}
});
instance_methods[31] = new objj_method(sel_registerName("setDelegate:"), function $CPCollectionView__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
});
instance_methods[32] = new objj_method(sel_registerName("delegate"), function $CPCollectionView__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPObject, "CPCollectionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_isSelected")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setRepresentedObject:"), function $CPCollectionViewItem__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    if (_representedObject == anObject)
        return;
    _representedObject = anObject;
    objj_msgSend(_view, "setRepresentedObject:", anObject);
}
});
instance_methods[1] = new objj_method(sel_registerName("representedObject"), function $CPCollectionViewItem__representedObject(self, _cmd)
{ with(self)
{
    return _representedObject;
}
});
instance_methods[2] = new objj_method(sel_registerName("setView:"), function $CPCollectionViewItem__setView_(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
});
instance_methods[3] = new objj_method(sel_registerName("view"), function $CPCollectionViewItem__view(self, _cmd)
{ with(self)
{
    return _view;
}
});
instance_methods[4] = new objj_method(sel_registerName("setSelected:"), function $CPCollectionViewItem__setSelected_(self, _cmd, shouldBeSelected)
{ with(self)
{
    if (_isSelected == shouldBeSelected)
        return;
    _isSelected = shouldBeSelected;
    objj_msgSend(_view, "setSelected:", _isSelected);
}
});
instance_methods[5] = new objj_method(sel_registerName("isSelected"), function $CPCollectionViewItem__isSelected(self, _cmd)
{ with(self)
{
    return _isSelected;
}
});
instance_methods[6] = new objj_method(sel_registerName("collectionView"), function $CPCollectionViewItem__collectionView(self, _cmd)
{ with(self)
{
    return objj_msgSend(_view, "superview");
}
});
class_addMethods(the_class, instance_methods);
}
var CPCollectionViewItemViewKey = "CPCollectionViewItemViewKey";
{
var the_class = objj_getClass("CPCollectionViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCollectionViewItem\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("copy"), function $CPCollectionViewItem__copy(self, _cmd)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
}
var CPCollectionViewItemViewKey = "CPCollectionViewItemViewKey";
{
var the_class = objj_getClass("CPCollectionViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCollectionViewItem\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPCollectionViewItem__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _view = objj_msgSend(aCoder, "decodeObjectForKey:", CPCollectionViewItemViewKey);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPCollectionViewItem__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _view, CPCollectionViewItemViewKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;9;CPColor.jI;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;16795;
var _redComponent = 0,
    _greenComponent = 1,
    _blueComponent = 2,
    _alphaCompnent = 3;
var _hueComponent = 0,
    _saturationComponent = 1,
    _brightnessComponent = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPColor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_components"), new objj_ivar("_patternImage"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("colorWithCalibratedRed:green:blue:alpha:"), function $CPColor__colorWithCalibratedRed_green_blue_alpha_(self, _cmd, red, green, blue, alpha)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [red,green,blue,alpha]);
}
});
class_methods[1] = new objj_method(sel_registerName("colorWithCalibratedWhite:alpha:"), function $CPColor__colorWithCalibratedWhite_alpha_(self, _cmd, white, alpha)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [white,white,white,alpha]);
}
});
class_methods[2] = new objj_method(sel_registerName("colorWithHue:saturation:brightness:"), function $CPColor__colorWithHue_saturation_brightness_(self, _cmd, hue, saturation, brightness)
{ with(self)
{
    if(saturation == 0.0)
        return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", brightness/100.0, 1.0);
    var f = hue % 60,
        p = (brightness * (100 - saturation)) / 10000,
        q = (brightness * (6000 - saturation * f)) / 600000,
        t = (brightness * (6000 - saturation * (60 -f))) / 600000,
        b = brightness / 100.0;
    switch(FLOOR(hue / 60))
    {
        case 0: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", b, t, p, 1.0);
        case 1: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", q, b, p, 1.0);
        case 2: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", p, b, t, 1.0);
        case 3: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", p, q, b, 1.0);
        case 4: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", t, p, b, 1.0);
        case 5: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", b, p, q, 1.0);
    }
}
});
class_methods[3] = new objj_method(sel_registerName("colorWithHexString:"), function $CPColor__colorWithHexString_(self, _cmd, hex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", hexToRGB(hex));
}
});
class_methods[4] = new objj_method(sel_registerName("blackColor"), function $CPColor__blackColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0,0.0,0.0,1.0]);
}
});
class_methods[5] = new objj_method(sel_registerName("blueColor"), function $CPColor__blueColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0,0.0,1.0,1.0]);
}
});
class_methods[6] = new objj_method(sel_registerName("darkGrayColor"), function $CPColor__darkGrayColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 1.0/3.0, 1.0);
}
});
class_methods[7] = new objj_method(sel_registerName("grayColor"), function $CPColor__grayColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.5, 1.0);
}
});
class_methods[8] = new objj_method(sel_registerName("greenColor"), function $CPColor__greenColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0,1.0,0.0,1.0]);
}
});
class_methods[9] = new objj_method(sel_registerName("lightGrayColor"), function $CPColor__lightGrayColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 2.0/3.0, 1.0);
}
});
class_methods[10] = new objj_method(sel_registerName("redColor"), function $CPColor__redColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0,0.0,0.0,1.0]);
}
});
class_methods[11] = new objj_method(sel_registerName("whiteColor"), function $CPColor__whiteColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0,1.0,1.0,1.0]);
}
});
class_methods[12] = new objj_method(sel_registerName("yellowColor"), function $CPColor__yellowColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0,1.0,0.0,1.0]);
}
});
class_methods[13] = new objj_method(sel_registerName("shadowColor"), function $CPColor__shadowColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0,0.0,0.0,1.0/3.0]);
}
});
class_methods[14] = new objj_method(sel_registerName("colorWithPatternImage:"), function $CPColor__colorWithPatternImage_(self, _cmd, anImage)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithPatternImage:", anImage);
}
});
class_methods[15] = new objj_method(sel_registerName("colorWithCSSString:"), function $CPColor__colorWithCSSString_(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithCSSString:", aString);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_initWithCSSString:"), function $CPColor___initWithCSSString_(self, _cmd, aString)
{ with(self)
{
    if(aString.indexOf("rgb") == CPNotFound)
        return nil;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    var startingIndex = aString.indexOf("(");
    var parts = aString.substring(startingIndex+1).split(',');
    _components = [parseInt(parts[0],10)/255.0,parseInt(parts[1],10)/255.0,parseInt(parts[2],10)/255.0,parts[3]?parseInt(parts[3],10)/255.0:1.0]
    _cssString = aString;
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("_initWithRGBA:"), function $CPColor___initWithRGBA_(self, _cmd, components)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _components = components;
  if (!CPFeatureIsCompatible(CPCSSRGBAFeature) && _components[3] != 1.0 && window.Base64 && window.CRC32)
  {
   var bytes = [0x89,0x50,0x4e,0x47,0xd,0xa,0x1a,0xa,0x0,0x0,0x0,0xd,0x49,0x48,0x44,0x52,0x0,0x0,0x0,0x1,0x0,0x0,0x0,0x1,0x8,0x3,0x0,0x0,0x0,0x28,0xcb,0x34,0xbb,0x0,0x0,0x3,0x0,0x50,0x4c,0x54,0x45,0xff,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x17,0x89,0x99,0x55,0x0,0x0,0x0,0x1,0x74,0x52,0x4e,0x53,0x0,0x40,0xe6,0xd8,0x66,0x0,0x0,0x0,0x10,0x49,0x44,0x41,0x54,0x78,0xda,0x62,0x60,0x0,0x0,0x0,0x0,0xff,0xff,0x3,0x0,0x0,0x2,0x0,0x1,0x24,0x7f,0x24,0xf1,0x0,0x0,0x0,0x0,0x49,0x45,0x4e,0x44,0xae,0x42,0x60,0x82,0xff];
   var r_off = 41;
   var g_off = 42;
   var b_off = 43;
   var a_off = 821;
   var plte_crc_off = 809;
   var trns_crc_off = 822;
   var plte_type_off = 37;
   var trns_type_off = 817;
   bytes[r_off] = Math.round(_components[0]*255);
   bytes[g_off] = Math.round(_components[1]*255);
   bytes[b_off] = Math.round(_components[2]*255);
   bytes[a_off] = Math.round(_components[3]*255);
   var new_plte_crc = integerToBytes(CRC32.getCRC(bytes, plte_type_off, 4+768), 4);
   var new_trns_crc = integerToBytes(CRC32.getCRC(bytes, trns_type_off, 4+1), 4);
   for (var i = 0; i < 4; i++)
   {
    bytes[plte_crc_off+i] = new_plte_crc[i];
    bytes[trns_crc_off+i] = new_trns_crc[i];
   }
   var base64image = Base64.encode(bytes);
   _cssString = "url(\"data:image/png;base64," + base64image + "\")";
  }
  else
  {
         var hasAlpha = CPFeatureIsCompatible(CPCSSRGBAFeature) && _components[3] != 1.0;
         _cssString = (hasAlpha ? "rgba(" : "rgb(") +
             parseInt(_components[0] * 255.0) + ", " +
             parseInt(_components[1] * 255.0) + ", " +
             parseInt(_components[2] * 255.0) +
             (hasAlpha ? (", " + _components[3]) : "") + ")";
  }
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("_initWithPatternImage:"), function $CPColor___initWithPatternImage_(self, _cmd, anImage)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _patternImage = anImage;
        _cssString = "url(\"" + _patternImage._filename + "\")";
    }
    return self;
}
});
instance_methods[3] = new objj_method(sel_registerName("patternImage"), function $CPColor__patternImage(self, _cmd)
{ with(self)
{
    return _patternImage;
}
});
instance_methods[4] = new objj_method(sel_registerName("alphaComponent"), function $CPColor__alphaComponent(self, _cmd)
{ with(self)
{
    return _components[3];
}
});
instance_methods[5] = new objj_method(sel_registerName("blueComponent"), function $CPColor__blueComponent(self, _cmd)
{ with(self)
{
    return _components[2];
}
});
instance_methods[6] = new objj_method(sel_registerName("greenComponent"), function $CPColor__greenComponent(self, _cmd)
{ with(self)
{
    return _components[1];
}
});
instance_methods[7] = new objj_method(sel_registerName("redComponent"), function $CPColor__redComponent(self, _cmd)
{ with(self)
{
    return _components[0];
}
});
instance_methods[8] = new objj_method(sel_registerName("components"), function $CPColor__components(self, _cmd)
{ with(self)
{
    return _components;
}
});
instance_methods[9] = new objj_method(sel_registerName("colorWithAlphaComponent:"), function $CPColor__colorWithAlphaComponent_(self, _cmd, anAlphaComponent)
{ with(self)
{
    var components = _components.slice();
    components[components.length-1] = anAlphaComponent;
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "_initWithRGBA:", components);
}
});
instance_methods[10] = new objj_method(sel_registerName("hsbComponents"), function $CPColor__hsbComponents(self, _cmd)
{ with(self)
{
    var red = ROUND(_components[_redComponent] * 255.0),
        green = ROUND(_components[_greenComponent] * 255.0),
        blue = ROUND(_components[_blueComponent] * 255.0);
    var max = MAX(red, green, blue),
        min = MIN(red, green, blue),
        delta = max - min;
    var brightness = max / 255.0,
        saturation = (max != 0) ? delta / max : 0;
    var hue;
    if(saturation == 0)
        hue = 0;
    else
    {
        var rr = (max - red) / delta;
        var gr = (max - green) / delta;
        var br = (max - blue) / delta;
        if (red == max)
            hue = br - gr;
        else if (green == max)
            hue = 2 + rr - br;
        else
            hue = 4 + gr - rr;
        hue /= 6;
        if (hue < 0)
            hue++;
    }
    return [ROUND(hue*360.0),ROUND(saturation*100.0),ROUND(brightness*100.0)];
}
});
instance_methods[11] = new objj_method(sel_registerName("cssString"), function $CPColor__cssString(self, _cmd)
{ with(self)
{
    return _cssString;
}
});
instance_methods[12] = new objj_method(sel_registerName("hexString"), function $CPColor__hexString(self, _cmd)
{ with(self)
{
    return rgbToHex(objj_msgSend(self, "redComponent"), objj_msgSend(self, "greenComponent"), objj_msgSend(self, "blueComponent"))
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPColorComponentsKey = "CPColorComponentsKey",
    CPColorPatternImageKey = "CPColorPatternImageKey";
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPColor__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "containsValueForKey:", CPColorPatternImageKey))
        return objj_msgSend(self, "_initWithPatternImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorPatternImageKey));
    return objj_msgSend(self, "_initWithRGBA:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorComponentsKey));
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPColor__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_patternImage)
        objj_msgSend(aCoder, "encodeObject:forKey:", _patternImage, CPColorPatternImageKey);
    else
        objj_msgSend(aCoder, "encodeObject:forKey:", _components, CPColorComponentsKey);
}
});
class_addMethods(the_class, instance_methods);
}
var hexCharacters = "0123456789ABCDEF";
hexToRGB= function(hex)
{
    if(hex.length != 6)
        return null;
    for(var i=0; i<hex.length; i++)
        if(hexCharacters.indexOf(hex.charAt(i)) == -1)
            return null;
    var red = (hexCharacters.indexOf(hex.charAt(0)) * 16 + hexCharacters.indexOf(hex.charAt(1))) / 255.0;
    var green = (hexCharacters.indexOf(hex.charAt(2)) * 16 + hexCharacters.indexOf(hex.charAt(3))) / 255.0;
    var blue = (hexCharacters.indexOf(hex.charAt(4)) * 16 + hexCharacters.indexOf(hex.charAt(5))) / 255.0;
    return [red,green,blue,1.0];
}
integerToBytes= function(integer, length) {
 if (!length)
  length = (integer == 0) ? 1 : Math.round((Math.log(integer)/Math.log(2))/8+0.5);
 var bytes = new Array(length);
 for (var i = length-1; i >= 0; i--) {
  bytes[i] = integer & 255;
  integer = integer >> 8
 }
 return bytes;
}
rgbToHex= function(r,g,b) {
    return byteToHex(r) + byteToHex(g) + byteToHex(b);
}
byteToHex= function(n) {
    if (!n || isNaN(n)) return "00";
    n = ROUND(MIN(255,MAX(0,256*n)));
    return hexCharacters.charAt((n - n % 16) / 16) +
            hexCharacters.charAt(n % 16);
}

p;14;CPColorPanel.ji;10;CPButton.ji;15;CPColorPicker.ji;10;CPCookie.ji;20;CPKulerColorPicker.ji;9;CPPanel.ji;21;CPSliderColorPicker.ji;8;CPView.jc;25028;
CPColorPanelColorDidChangeNotification = "CPColorPanelColorDidChangeNotification";
var PREVIEW_HEIGHT = 20.0,
    TOOLBAR_HEIGHT = 32.0,
    SWATCH_HEIGHT = 14.0;
var SharedColorPanel = nil;
CPWheelColorPickerMode = 1;
CPKulerColorPickerMode = 2;
CPSliderColorPickerMode = 3;
CPColorPickerViewWidth = 265,
CPColorPickerViewHeight = 370;
{var the_class = objj_allocateClassPair(CPPanel, "CPColorPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_swatchView"), new objj_ivar("_previewView"), new objj_ivar("_previewLabel"), new objj_ivar("_swatchLabel"), new objj_ivar("_activeView"), new objj_ivar("_activePicker"), new objj_ivar("_wheelPicker"), new objj_ivar("_kulerPicker"), new objj_ivar("_sliderPicker"), new objj_ivar("_color"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_mode")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("sharedColorPanel"), function $CPColorPanel__sharedColorPanel(self, _cmd)
{ with(self)
{
    if (!SharedColorPanel)
        SharedColorPanel = objj_msgSend(objj_msgSend(CPColorPanel, "alloc"), "init");
    return SharedColorPanel;
}
});
class_methods[1] = new objj_method(sel_registerName("setPickerMode:"), function $CPColorPanel__setPickerMode_(self, _cmd, mode)
{ with(self)
{
    var panel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(panel, "setMode:", mode);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CPColorPanel__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", CGRectMake(500.0,50.0,218.0,360.0), (CPHUDBackgroundWindowMask|CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
    if (self)
    {
        objj_msgSend(self, "setTitle:", "Color Panel");
        objj_msgSend(self, "setLevel:", CPFloatingWindowLevel);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        objj_msgSend(self, "setMinSize:", CGSizeMake(218.0,360.0));
        objj_msgSend(self, "setMaxSize:", CGSizeMake(327.0,540.0));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setColor:"), function $CPColorPanel__setColor_(self, _cmd, aColor)
{ with(self)
{
    _color = aColor;
    objj_msgSend(_previewView, "setBackgroundColor:", _color);
    objj_msgSend(CPApp, "sendAction:to:from:", sel_registerName("changeColor:"), nil, self);
    if (_target && _action)
        objj_msgSend(_target, _action, self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPColorPanelColorDidChangeNotification, self);
}
});
instance_methods[2] = new objj_method(sel_registerName("setColor:updatePicker:"), function $CPColorPanel__setColor_updatePicker_(self, _cmd, aColor, bool)
{ with(self)
{
    objj_msgSend(self, "setColor:", aColor);
    if(bool)
        objj_msgSend(_activePicker, "setColor:", _color);
 }
});
instance_methods[3] = new objj_method(sel_registerName("color"), function $CPColorPanel__color(self, _cmd)
{ with(self)
{
    return _color;
}
});
instance_methods[4] = new objj_method(sel_registerName("setTarget:"), function $CPColorPanel__setTarget_(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
});
instance_methods[5] = new objj_method(sel_registerName("target"), function $CPColorPanel__target(self, _cmd)
{ with(self)
{
    return _target;
}
});
instance_methods[6] = new objj_method(sel_registerName("setAction:"), function $CPColorPanel__setAction_(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
});
instance_methods[7] = new objj_method(sel_registerName("action"), function $CPColorPanel__action(self, _cmd)
{ with(self)
{
    return _action;
}
});
instance_methods[8] = new objj_method(sel_registerName("setMode:"), function $CPColorPanel__setMode_(self, _cmd, mode)
{ with(self)
{
    if(mode == _mode)
        return;
    var frame = CPRectCreateCopy(objj_msgSend(_currentView, "frame"));
    objj_msgSend(_currentView, "removeFromSuperview");
    switch(mode)
    {
        case CPWheelColorPickerMode: _activePicker = _wheelPicker; break;
        case CPKulerColorPickerMode: _activePicker = _kulerPicker; break;
        case CPSliderColorPickerMode: _activePicker = _sliderPicker; break;
    }
    _currentView = objj_msgSend(_activePicker, "provideNewView:", NO);
    objj_msgSend(_activePicker, "setColor:", _color);
    _mode = mode;
    objj_msgSend(_currentView, "setFrame:", frame);
    objj_msgSend(_currentView, "setAutoresizingMask:", (CPViewWidthSizable|CPViewHeightSizable));
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", _currentView);
}
});
instance_methods[9] = new objj_method(sel_registerName("mode"), function $CPColorPanel__mode(self, _cmd)
{ with(self)
{
    return _mode;
}
});
instance_methods[10] = new objj_method(sel_registerName("orderFront:"), function $CPColorPanel__orderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "_loadContentsIfNecessary");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "orderFront:", aSender);
}
});
instance_methods[11] = new objj_method(sel_registerName("_loadContentsIfNecessary"), function $CPColorPanel___loadContentsIfNecessary(self, _cmd)
{ with(self)
{
    if (_toolbar)
        return;
    var contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    _toolbar = objj_msgSend(objj_msgSend(_CPColorPanelToolbar, "alloc"), "initWithFrame:", CPRectMake(0,0,CGRectGetWidth(bounds),TOOLBAR_HEIGHT));
    objj_msgSend(_toolbar, "setAutoresizingMask:", CPViewWidthSizable);
    var previewBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76,TOOLBAR_HEIGHT+10,CGRectGetWidth(bounds)-86,PREVIEW_HEIGHT));
    _previewView = objj_msgSend(objj_msgSend(_CPColorPanelPreview, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(previewBox, "bounds"),2.0,2.0));
    objj_msgSend(_previewView, "setColorPanel:", self);
    objj_msgSend(_previewView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(previewBox, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "addSubview:", _previewView);
    _previewLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(10,TOOLBAR_HEIGHT+14,60,15));
    objj_msgSend(_previewLabel, "setStringValue:", "Preview:");
    objj_msgSend(_previewLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_previewLabel, "setAlignment:", CPRightTextAlignment);
    var swatchBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76,TOOLBAR_HEIGHT+10+PREVIEW_HEIGHT+5,CGRectGetWidth(bounds)-86,SWATCH_HEIGHT+2.0));
    objj_msgSend(swatchBox, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(swatchBox, "setAutoresizingMask:", CPViewWidthSizable);
    _swatchView = objj_msgSend(objj_msgSend(_CPColorPanelSwatches, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(swatchBox, "bounds"),1.0,1.0));
    objj_msgSend(_swatchView, "setColorPanel:", self);
    objj_msgSend(_swatchView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(swatchBox, "addSubview:", _swatchView);
    _swatchLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(10,TOOLBAR_HEIGHT+8+PREVIEW_HEIGHT+5,60,15));
    objj_msgSend(_swatchLabel, "setStringValue:", "Swatches:");
    objj_msgSend(_swatchLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_swatchLabel, "setAlignment:", CPRightTextAlignment);
    _wheelPicker = objj_msgSend(objj_msgSend(CPColorWheelColorPicker, "alloc"), "initWithPickerMask:colorPanel:", 1|2|3, self);
    _currentView = objj_msgSend(_wheelPicker, "provideNewView:", YES);
    var height = (TOOLBAR_HEIGHT+10+PREVIEW_HEIGHT+5+SWATCH_HEIGHT+10);
    objj_msgSend(_currentView, "setFrameSize:", CPSizeMake(bounds.size.width-10,bounds.size.height-height));
    objj_msgSend(_currentView, "setFrameOrigin:", CPPointMake(5,TOOLBAR_HEIGHT+10+PREVIEW_HEIGHT+5+SWATCH_HEIGHT+10));
    objj_msgSend(_currentView, "setAutoresizingMask:", (CPViewWidthSizable|CPViewHeightSizable));
    _kulerPicker = objj_msgSend(objj_msgSend(CPKulerColorPicker, "alloc"), "initWithPickerMask:colorPanel:", 1|2|3, self);
    objj_msgSend(_kulerPicker, "provideNewView:", YES);
    _sliderPicker = objj_msgSend(objj_msgSend(CPSliderColorPicker, "alloc"), "initWithPickerMask:colorPanel:", 1|2|3, self);
    objj_msgSend(_sliderPicker, "provideNewView:", YES);
    objj_msgSend(contentView, "addSubview:", _toolbar);
    objj_msgSend(contentView, "addSubview:", previewBox);
    objj_msgSend(contentView, "addSubview:", _previewLabel);
    objj_msgSend(contentView, "addSubview:", swatchBox);
    objj_msgSend(contentView, "addSubview:", _swatchLabel);
    objj_msgSend(contentView, "addSubview:", _currentView);
    _target = nil;
    _action = nil;
    _activePicker = _wheelPicker;
    objj_msgSend(self, "setColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_activePicker, "setColor:", objj_msgSend(CPColor, "whiteColor"));
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var iconSize = 32,
    totalIcons = 3;
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelToolbar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_wheelAlternateImage"), new objj_ivar("_wheelButton"), new objj_ivar("_sliderImage"), new objj_ivar("_sliderAlternateImage"), new objj_ivar("_sliderButton"), new objj_ivar("_kulerImage"), new objj_ivar("_kulerAlternateImage"), new objj_ivar("_kulerButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPColorPanelToolbar__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    var width = aFrame.size.width;
    var center = width / 2.0;
    var start = center - ((totalIcons * iconSize) + (totalIcons - 1) * 8.0) / 2.0;
    _wheelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPRectMake(start,0,iconSize,iconSize));
    start += iconSize + 8;
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", _CPColorPanelToolbar), "pathForResource:", "wheel_button.png");
    _wheelImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CPSizeMake(iconSize,iconSize));
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", _CPColorPanelToolbar), "pathForResource:", "wheel_button_h.png");
    _wheelAlternateImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CPSizeMake(iconSize,iconSize));
    objj_msgSend(_wheelButton, "setBordered:", NO);
    objj_msgSend(_wheelButton, "setImage:", _wheelImage);
    objj_msgSend(_wheelButton, "setAlternateImage:", _wheelAlternateImage);
    objj_msgSend(_wheelButton, "setTarget:", self);
    objj_msgSend(_wheelButton, "setAction:", sel_registerName("setMode:"));
    objj_msgSend(_wheelButton, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin);
    objj_msgSend(self, "addSubview:", _wheelButton);
    _sliderButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPRectMake(start,0,iconSize,iconSize));
    start += iconSize + 8;
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", _CPColorPanelToolbar), "pathForResource:", "slider_button.png");
    _sliderImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CPSizeMake(iconSize,iconSize));
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", _CPColorPanelToolbar), "pathForResource:", "slider_button_h.png");
    _sliderAlternateImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CPSizeMake(iconSize,iconSize));
    objj_msgSend(_sliderButton, "setBordered:", NO);
    objj_msgSend(_sliderButton, "setImage:", _sliderImage);
    objj_msgSend(_sliderButton, "setAlternateImage:", _sliderAlternateImage);
    objj_msgSend(_sliderButton, "setTarget:", self);
    objj_msgSend(_sliderButton, "setAction:", sel_registerName("setMode:"));
    objj_msgSend(_sliderButton, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin);
    objj_msgSend(self, "addSubview:", _sliderButton);
    _kulerButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPRectMake(start,0,iconSize,iconSize));
    start += iconSize + 8;
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", _CPColorPanelToolbar), "pathForResource:", "kuler_button.png");
    _kulerImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CPSizeMake(iconSize,iconSize));
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", _CPColorPanelToolbar), "pathForResource:", "kuler_button_h.png");
    _kulerAlternateImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", path, CPSizeMake(iconSize,iconSize));
    objj_msgSend(_kulerButton, "setBordered:", NO);
    objj_msgSend(_kulerButton, "setImage:", _kulerImage);
    objj_msgSend(_kulerButton, "setAlternateImage:", _kulerAlternateImage);
    objj_msgSend(_kulerButton, "setTarget:", self);
    objj_msgSend(_kulerButton, "setAction:", sel_registerName("setMode:"));
    objj_msgSend(_kulerButton, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin);
    objj_msgSend(self, "addSubview:", _kulerButton);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setMode:"), function $_CPColorPanelToolbar__setMode_(self, _cmd, sender)
{ with(self)
{
    if(sender == _kulerButton)
        objj_msgSend(objj_msgSend(CPColorPanel, "sharedColorPanel"), "setMode:", CPKulerColorPickerMode);
    else if(sender == _wheelButton)
        objj_msgSend(objj_msgSend(CPColorPanel, "sharedColorPanel"), "setMode:", CPWheelColorPickerMode);
    else
        objj_msgSend(objj_msgSend(CPColorPanel, "sharedColorPanel"), "setMode:", CPSliderColorPickerMode);
}
});
class_addMethods(the_class, instance_methods);
}
CPColorDragType = "CPColorDragType";
var CPColorPanelSwatchesCookie = "CPColorPanelSwatchesCookie";
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelSwatches"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("["), new objj_ivar("_swatches"), new objj_ivar("_dragColor"), new objj_ivar("_colorPanel"), new objj_ivar("_swatchCookie")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPColorPanelSwatches__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    var whiteColor = objj_msgSend(CPColor, "whiteColor");
    _swatchCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:", CPColorPanelSwatchesCookie);
    var colorList = objj_msgSend(self, "startingColorList");
    _swatches = [];
    for(var i=0; i < 50; i++)
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(13*i+1,1,12,12)),
            fillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(view, "bounds"),1.0,1.0));
        objj_msgSend(view, "setBackgroundColor:", whiteColor);
        objj_msgSend(fillView, "setBackgroundColor:", (i<colorList.length)?colorList[i]:whiteColor);
        objj_msgSend(view, "addSubview:", fillView);
        objj_msgSend(self, "addSubview:", view);
        _swatches.push(view);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("isOpaque"), function $_CPColorPanelSwatches__isOpaque(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[2] = new objj_method(sel_registerName("startingColorList"), function $_CPColorPanelSwatches__startingColorList(self, _cmd)
{ with(self)
{
    var cookieValue = objj_msgSend(_swatchCookie, "value");
    if(cookieValue == "")
    {
        return [objj_msgSend(CPColor, "blackColor"),objj_msgSend(CPColor, "darkGrayColor"),objj_msgSend(CPColor, "grayColor"),objj_msgSend(CPColor, "lightGrayColor"),objj_msgSend(CPColor, "whiteColor"),objj_msgSend(CPColor, "redColor"),objj_msgSend(CPColor, "greenColor"),objj_msgSend(CPColor, "blueColor"),objj_msgSend(CPColor, "yellowColor")];
    }
    var cookieValue = eval(cookieValue);
    var result = [];
    for(var i=0; i<cookieValue.length; i++)
        result.push(objj_msgSend(CPColor, "colorWithHexString:", cookieValue[i]));
    return result;
}
});
instance_methods[3] = new objj_method(sel_registerName("saveColorList"), function $_CPColorPanelSwatches__saveColorList(self, _cmd)
{ with(self)
{
    var result = [];
    for(var i=0; i<_swatches.length; i++)
        result.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i], "subviews")[0], "backgroundColor"), "hexString"));
    var future = new Date();
    future.setYear(2019);
    objj_msgSend(_swatchCookie, "setValue:expires:domain:", CPJSObjectCreateJSON(result), future, nil);
}
});
instance_methods[4] = new objj_method(sel_registerName("setColorPanel:"), function $_CPColorPanelSwatches__setColorPanel_(self, _cmd, panel)
{ with(self)
{
    _colorPanel = panel;
}
});
instance_methods[5] = new objj_method(sel_registerName("colorPanel"), function $_CPColorPanelSwatches__colorPanel(self, _cmd)
{ with(self)
{
    return _colorPanel;
}
});
instance_methods[6] = new objj_method(sel_registerName("colorAtIndex:"), function $_CPColorPanelSwatches__colorAtIndex_(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_swatches[index], "subviews")[0], "backgroundColor");
}
});
instance_methods[7] = new objj_method(sel_registerName("setColor:atIndex:"), function $_CPColorPanelSwatches__setColor_atIndex_(self, _cmd, aColor, index)
{ with(self)
{
    objj_msgSend(objj_msgSend(_swatches[index], "subviews")[0], "setBackgroundColor:", aColor);
    objj_msgSend(self, "saveColorList");
}
});
instance_methods[8] = new objj_method(sel_registerName("mouseUp:"), function $_CPColorPanelSwatches__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if(point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(_colorPanel, "setColor:updatePicker:", objj_msgSend(self, "colorAtIndex:", FLOOR(point.x/13)), YES);
}
});
instance_methods[9] = new objj_method(sel_registerName("mouseDragged:"), function $_CPColorPanelSwatches__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
     if(point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var swatch = _swatches[FLOOR(point.x/13)];
    _dragColor = objj_msgSend(objj_msgSend(swatch, "subviews")[0], "backgroundColor");
    var bounds = CPRectCreateCopy(objj_msgSend(swatch, "bounds"));
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", bounds);
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds,1.0,1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", _dragColor);
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CPPointMake(point.x-bounds.size.width/2.0,point.y-bounds.size.height/2.0), CPPointMake(0.0,0.0), anEvent, nil, self, YES);
}
});
instance_methods[10] = new objj_method(sel_registerName("pasteboard:provideDataForType:"), function $_CPColorPanelSwatches__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", _dragColor, aType);
}
});
instance_methods[11] = new objj_method(sel_registerName("performDragOperation:"), function $_CPColorPanelSwatches__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(aSender, "draggingLocation"), nil),
        pasteboard = objj_msgSend(aSender, "draggingPasteboard"),
        swatch = nil;
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]) || location.x > objj_msgSend(self, "bounds").size.width - 1 || location.x < 1)
        return NO;
    objj_msgSend(self, "setColor:atIndex:", objj_msgSend(pasteboard, "dataForType:", CPColorDragType), FLOOR(location.x/13));
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelPreview"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_colorPanel")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPColorPanelPreview__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setColorPanel:"), function $_CPColorPanelPreview__setColorPanel_(self, _cmd, aPanel)
{ with(self)
{
    _colorPanel = aPanel;
}
});
instance_methods[2] = new objj_method(sel_registerName("colorPanel"), function $_CPColorPanelPreview__colorPanel(self, _cmd)
{ with(self)
{
    return _colorPanel;
}
});
instance_methods[3] = new objj_method(sel_registerName("performDragOperation:"), function $_CPColorPanelPreview__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]))
        return NO;
    var color = objj_msgSend(pasteboard, "dataForType:", CPColorDragType);
    objj_msgSend(_colorPanel, "setColor:updatePicker:", color, YES);
}
});
instance_methods[4] = new objj_method(sel_registerName("isOpaque"), function $_CPColorPanelPreview__isOpaque(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[5] = new objj_method(sel_registerName("mouseDragged:"), function $_CPColorPanelPreview__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var bounds = CPRectMake(0, 0, 15, 15);
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", bounds);
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds,1.0,1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CPPointMake(point.x-bounds.size.width/2.0,point.y-bounds.size.height/2.0), CPPointMake(0.0,0.0), anEvent, nil, self, YES);
}
});
instance_methods[6] = new objj_method(sel_registerName("pasteboard:provideDataForType:"), function $_CPColorPanelPreview__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self, "backgroundColor"), aType);
}
});
class_addMethods(the_class, instance_methods);
}

p;15;CPColorPicker.jI;23;Foundation/Foundation.jI;15;AppKit/CPView.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jc;13476;
{var the_class = objj_allocateClassPair(CPObject, "CPColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_panel"), new objj_ivar("_mask")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithPickerMask:colorPanel:"), function $CPColorPicker__initWithPickerMask_colorPanel_(self, _cmd, aMask, aPanel)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _panel = aPanel;
    _mask = aMask;
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("colorPanel"), function $CPColorPicker__colorPanel(self, _cmd)
{ with(self)
{
    return _panel;
}
});
instance_methods[2] = new objj_method(sel_registerName("provideNewButtonImage"), function $CPColorPicker__provideNewButtonImage(self, _cmd)
{ with(self)
{
    return nil;
}
});
instance_methods[3] = new objj_method(sel_registerName("setMode:"), function $CPColorPicker__setMode_(self, _cmd, mode)
{ with(self)
{
    return;
}
});
instance_methods[4] = new objj_method(sel_registerName("setColor:"), function $CPColorPicker__setColor_(self, _cmd, aColor)
{ with(self)
{
    return;
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPColorPicker, "CPColorWheelColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_pickerView"), new objj_ivar("_brightnessSlider"), new objj_ivar("_brightnessBarImage"), new objj_ivar("_hueSaturationView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithPickerMask:colorPanel:"), function $CPColorWheelColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask, owningColorPanel);
}
});
instance_methods[1] = new objj_method(sel_registerName("initView"), function $CPColorWheelColorPicker__initView(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _pickerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "brightness_bar.png");
    _brightnessBarImage = new Image();
    _brightnessBarImage.src = path;
    _brightnessBarImage.style.width = "100%";
    _brightnessBarImage.style.height = "100%";
    _brightnessBarImage.style.position = "absolute";
    _brightnessBarImage.style.top = "0px";
    _brightnessBarImage.style.left = "0px";
    var brightnessBarView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(0,(aFrame.size.height-34),aFrame.size.width,15));
    objj_msgSend(brightnessBarView, "setAutoresizingMask:", (CPViewWidthSizable|CPViewMinYMargin));
    brightnessBarView._DOMElement.appendChild(_brightnessBarImage);
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(0,aFrame.size.height-22,aFrame.size.width,12));
    objj_msgSend(_brightnessSlider, "setMaxValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setMinValue:", 0.0);
    objj_msgSend(_brightnessSlider, "setValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setTarget:", self);
    objj_msgSend(_brightnessSlider, "setAction:", sel_registerName("brightnessSliderDidChange:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:", (CPViewWidthSizable|CPViewMinYMargin));
    _hueSaturationView = objj_msgSend(objj_msgSend(__CPColorWheel, "alloc"), "initWithFrame:", CPRectMake(0,0,aFrame.size.width,aFrame.size.height-38));
    objj_msgSend(_hueSaturationView, "setDelegate:", self);
    objj_msgSend(_hueSaturationView, "setAutoresizingMask:", (CPViewWidthSizable|CPViewHeightSizable));
    objj_msgSend(_pickerView, "addSubview:", brightnessBarView);
    objj_msgSend(_pickerView, "addSubview:", _hueSaturationView);
    objj_msgSend(_pickerView, "addSubview:", _brightnessSlider);
}
});
instance_methods[2] = new objj_method(sel_registerName("brightnessSliderDidChange:"), function $CPColorWheelColorPicker__brightnessSliderDidChange_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
});
instance_methods[3] = new objj_method(sel_registerName("colorWheelDidChange:"), function $CPColorWheelColorPicker__colorWheelDidChange_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
});
instance_methods[4] = new objj_method(sel_registerName("updateColor"), function $CPColorWheelColorPicker__updateColor(self, _cmd)
{ with(self)
{
    var hue = objj_msgSend(_hueSaturationView, "angle"),
        saturation = objj_msgSend(_hueSaturationView, "distance"),
        brightness = objj_msgSend(_brightnessSlider, "value");
    objj_msgSend(_hueSaturationView, "setWheelBrightness:", brightness/100.0);
    _brightnessBarImage.style.backgroundColor = "#"+objj_msgSend(objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hue, saturation, 100), "hexString");
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hue, saturation, brightness));
}
});
instance_methods[5] = new objj_method(sel_registerName("supportsMode:"), function $CPColorWheelColorPicker__supportsMode_(self, _cmd, mode)
{ with(self)
{
    return (mode == CPWheelColorPickerMode) ? YES : NO;
}
});
instance_methods[6] = new objj_method(sel_registerName("currentMode"), function $CPColorWheelColorPicker__currentMode(self, _cmd)
{ with(self)
{
    return CPWheelColorPickerMode;
}
});
instance_methods[7] = new objj_method(sel_registerName("provideNewView:"), function $CPColorWheelColorPicker__provideNewView_(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _pickerView;
}
});
instance_methods[8] = new objj_method(sel_registerName("setColor:"), function $CPColorWheelColorPicker__setColor_(self, _cmd, newColor)
{ with(self)
{
    var hsb = objj_msgSend(newColor, "hsbComponents");
    objj_msgSend(_hueSaturationView, "setPositionToColor:", newColor);
    objj_msgSend(_brightnessSlider, "setValue:", hsb[2]);
    objj_msgSend(_hueSaturationView, "setWheelBrightness:", hsb[2]/100.0);
    _brightnessBarImage.style.backgroundColor = "#"+objj_msgSend(objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1], 100), "hexString");
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPView, "__CPColorWheel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_blackWheelImage"), new objj_ivar("_crosshair"), new objj_ivar("_delegate"), new objj_ivar("_angle"), new objj_ivar("_distance"), new objj_ivar("_radius")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $__CPColorWheel__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel.png");
    _wheelImage = new Image();
    _wheelImage.src = path;
    _wheelImage.style.position = "absolute";
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_black.png");
    _blackWheelImage = new Image();
    _blackWheelImage.src = path;
    _blackWheelImage.style.opacity = "0";
    _blackWheelImage.style.filter = "alpha(opacity=0)"
    _blackWheelImage.style.position = "absolute";
    _DOMElement.appendChild(_wheelImage);
    _DOMElement.appendChild(_blackWheelImage);
    objj_msgSend(self, "setWheelSize:", aFrame.size);
    _crosshair = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(_radius-2,_radius-2,4,4));
    objj_msgSend(_crosshair, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(_crosshair, "bounds"),1.0,1.0));
    objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_crosshair, "addSubview:", view);
    objj_msgSend(self, "addSubview:", _crosshair);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setWheelBrightness:"), function $__CPColorWheel__setWheelBrightness_(self, _cmd, brightness)
{ with(self)
{
    _blackWheelImage.style.opacity = 1.0 - brightness;
    _blackWheelImage.style.filter = "alpha(opacity=" + (1.0 - brightness)*100 + ")"
}
});
instance_methods[2] = new objj_method(sel_registerName("setFrameSize:"), function $__CPColorWheel__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "setWheelSize:", aSize);
}
});
instance_methods[3] = new objj_method(sel_registerName("setWheelSize:"), function $__CPColorWheel__setWheelSize_(self, _cmd, aSize)
{ with(self)
{
    var min = MIN(aSize.width, aSize.height);
    _blackWheelImage.style.width = min;
    _blackWheelImage.style.height = min;
    _blackWheelImage.width = min;
    _blackWheelImage.height = min;
    _blackWheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    _blackWheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    _wheelImage.style.width = min;
    _wheelImage.style.height = min;
    _wheelImage.width = min;
    _wheelImage.height = min;
    _wheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    _wheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    _radius = min / 2.0;
    objj_msgSend(self, "setAngle:distance:", objj_msgSend(self, "degreesToRadians:", _angle), (_distance/100.0)*_radius);
}
});
instance_methods[4] = new objj_method(sel_registerName("setDelegate:"), function $__CPColorWheel__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
});
instance_methods[5] = new objj_method(sel_registerName("delegate"), function $__CPColorWheel__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[6] = new objj_method(sel_registerName("angle"), function $__CPColorWheel__angle(self, _cmd)
{ with(self)
{
    return _angle;
}
});
instance_methods[7] = new objj_method(sel_registerName("distance"), function $__CPColorWheel__distance(self, _cmd)
{ with(self)
{
    return _distance;
}
});
instance_methods[8] = new objj_method(sel_registerName("mouseDown:"), function $__CPColorWheel__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:", anEvent);
}
});
instance_methods[9] = new objj_method(sel_registerName("mouseDragged:"), function $__CPColorWheel__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:", anEvent);
}
});
instance_methods[10] = new objj_method(sel_registerName("reposition:"), function $__CPColorWheel__reposition_(self, _cmd, anEvent)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    var distance = MIN(SQRT((location.x - midX)*(location.x - midX) + (location.y - midY)*(location.y - midY)), _radius);
    var angle = ATAN2(location.y - midY, location.x - midX);
    objj_msgSend(self, "setAngle:distance:", angle, distance);
    if(_delegate)
        objj_msgSend(_delegate, "colorWheelDidChange:", self);
}
});
instance_methods[11] = new objj_method(sel_registerName("setAngle:distance:"), function $__CPColorWheel__setAngle_distance_(self, _cmd, angle, distance)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    _angle = objj_msgSend(self, "radiansToDegrees:", angle);
    _distance = (distance / _radius) * 100.0;
    objj_msgSend(_crosshair, "setFrameOrigin:", CPPointMake(COS(angle)*distance+midX-2.0,SIN(angle)*distance+midY-2.0));
}
});
instance_methods[12] = new objj_method(sel_registerName("setPositionToColor:"), function $__CPColorWheel__setPositionToColor_(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents"),
        bounds = objj_msgSend(self, "bounds");
    var angle = objj_msgSend(self, "degreesToRadians:", hsb[0]),
        distance = (hsb[1] / 100.0) * _radius;
    objj_msgSend(self, "setAngle:distance:", angle, distance);
}
});
instance_methods[13] = new objj_method(sel_registerName("radiansToDegrees:"), function $__CPColorWheel__radiansToDegrees_(self, _cmd, radians)
{ with(self)
{
    return ((-radians / PI) * 180 + 360) % 360;
}
});
instance_methods[14] = new objj_method(sel_registerName("degreesToRadians:"), function $__CPColorWheel__degreesToRadians_(self, _cmd, degrees)
{ with(self)
{
    return -(((degrees - 360) / 180) * PI);
}
});
class_addMethods(the_class, instance_methods);
}

p;13;CPColorWell.jI;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jc;6017;
var _CPColorWellDidBecomeExclusiveNotification = "_CPColorWellDidBecomeExclusiveNotification";
{var the_class = objj_allocateClassPair(CPControl, "CPColorWell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_active"), new objj_ivar("_color"), new objj_ivar("_wellView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPColorWell__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _active = NO;
        _color = objj_msgSend(CPColor, "whiteColor");
        objj_msgSend(self, "drawBezelWithHighlight:", NO);
        objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"),3.0,3.0));
        var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("colorWellDidBecomeExclusive:"), _CPColorWellDidBecomeExclusiveNotification, nil);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("colorPanelWillClose:"), CPWindowWillCloseNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("color"), function $CPColorWell__color(self, _cmd)
{ with(self)
{
    return _color;
}
});
instance_methods[2] = new objj_method(sel_registerName("setColor:"), function $CPColorWell__setColor_(self, _cmd, aColor)
{ with(self)
{
    if (_color == aColor)
        return;
    _color = aColor;
    objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"),3.0,3.0));
}
});
instance_methods[3] = new objj_method(sel_registerName("takeColorFrom:"), function $CPColorWell__takeColorFrom_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setColor:", objj_msgSend(aSender, "color"));
}
});
instance_methods[4] = new objj_method(sel_registerName("activate:"), function $CPColorWell__activate_(self, _cmd, shouldBeExclusive)
{ with(self)
{
    if (shouldBeExclusive)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPColorWellDidBecomeExclusiveNotification, self);
    if (objj_msgSend(self, "isActive"))
        return;
    _active = YES;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_registerName("colorPanelDidChangeColor:"), CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
});
instance_methods[5] = new objj_method(sel_registerName("deactivate"), function $CPColorWell__deactivate(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isActive"))
        return;
    _active = NO;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
});
instance_methods[6] = new objj_method(sel_registerName("isActive"), function $CPColorWell__isActive(self, _cmd)
{ with(self)
{
    return _active;
}
});
instance_methods[7] = new objj_method(sel_registerName("drawBezelWithHighlight:"), function $CPColorWell__drawBezelWithHighlight_(self, _cmd, shouldHighlight)
{ with(self)
{}
});
instance_methods[8] = new objj_method(sel_registerName("drawWellInside:"), function $CPColorWell__drawWellInside_(self, _cmd, aRect)
{ with(self)
{
    if (!_wellView)
    {
        _wellView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aRect);
        objj_msgSend(self, "addSubview:", _wellView);
    }
    else
        objj_msgSend(_wellView, "setFrame:", aRect);
    objj_msgSend(_wellView, "setBackgroundColor:", _color);
}
});
instance_methods[9] = new objj_method(sel_registerName("colorPanelDidChangeColor:"), function $CPColorWell__colorPanelDidChangeColor_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "takeColorFrom:", objj_msgSend(aNotification, "object"));
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
});
instance_methods[10] = new objj_method(sel_registerName("colorWellDidBecomeExclusive:"), function $CPColorWell__colorWellDidBecomeExclusive_(self, _cmd, aNotification)
{ with(self)
{
    if (self != objj_msgSend(aNotification, "object"))
        objj_msgSend(self, "deactivate");
}
});
instance_methods[11] = new objj_method(sel_registerName("colorPanelWillClose:"), function $CPColorWell__colorPanelWillClose_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "deactivate");
}
});
instance_methods[12] = new objj_method(sel_registerName("mouseDown:"), function $CPColorWell__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", YES);
}
});
instance_methods[13] = new objj_method(sel_registerName("mouseDragged:"), function $CPColorWell__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", CGRectContainsPoint(objj_msgSend(self, "bounds"),objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)));
}
});
instance_methods[14] = new objj_method(sel_registerName("mouseUp:"), function $CPColorWell__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", NO);
    if (!CGRectContainsPoint(objj_msgSend(self, "bounds"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
        return;
    objj_msgSend(self, "activate:", YES);
    var colorPanel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(colorPanel, "setColor:", _color);
    objj_msgSend(colorPanel, "orderFront:", self);
}
});
class_addMethods(the_class, instance_methods);
}

p;17;CPCompatibility.ji;9;CPEvent.jc;3431;
CPUnknownBrowserEngine = 0;
CPGeckoBrowserEngine = 1;
CPInternetExplorerBrowserEngine = 2;
CPKHTMLBrowserEngine = 3;
CPOperaBrowserEngine = 4;
CPWebKitBrowserEngine = 5;
CPCSSRGBAFeature = 1 << 5;
CPHTMLCanvasFeature = 1 << 6;
CPHTMLContentEditableFeature = 1 << 7;
CPJavascriptInnerTextFeature = 1 << 8;
CPJavascriptTextContentFeature = 1 << 9;
CPJavascriptClipboardEventsFeature = 1 << 10;
CPJavascriptClipboardAccessFeature = 1 << 11;
CPJavaScriptCanvasDrawFeature = 1 << 12;
CPVMLFeature = 1 << 14;
CPJavascriptRemedialKeySupport = 1 << 15;
CPJavaScriptShadowFeature = 1 << 20;
CPJavaScriptNegativeMouseWheelValues = 1 << 22;
var USER_AGENT = "";
    PLATFORM_ENGINE = CPUnknownBrowserEngine,
    PLATFORM_FEATURES = 0;
if (typeof window != "undfined" && typeof window.navigator != "undefined")
    USER_AGENT = window.navigator.userAgent;
if (window.opera)
{
    PLATFORM_ENGINE = CPOperaBrowserEngine;
    PLATFORM_FEATURES |= CPJavaScriptCanvasDrawFeature;
}
else if (window.attachEvent)
{
    PLATFORM_ENGINE = CPInternetExplorerBrowserEngine;
    PLATFORM_FEATURES |= CPVMLFeature;
    PLATFORM_FEATURES |= CPJavascriptRemedialKeySupport;
    PLATFORM_FEATURES |= CPJavaScriptShadowFeature;
}
else if (USER_AGENT.indexOf("AppleWebKit/") != -1)
{
    PLATFORM_ENGINE = CPWebKitBrowserEngine;
    PLATFORM_FEATURES |= CPCSSRGBAFeature;
    PLATFORM_FEATURES |= CPHTMLContentEditableFeature;
    PLATFORM_FEATURES |= CPJavascriptClipboardEventsFeature;
    PLATFORM_FEATURES |= CPJavascriptClipboardAccessFeature;
    PLATFORM_FEATURES |= CPJavaScriptShadowFeature;
    var versionStart = USER_AGENT.indexOf("AppleWebKit/") + "AppleWebKit/".length,
        versionEnd = USER_AGENT.indexOf(" ", versionStart),
        version = parseFloat(USER_AGENT.substring(versionStart, versionEnd), 10);
    if(USER_AGENT.indexOf("Plainview") == -1 && version >= 525.14 || USER_AGENT.indexOf("Chrome") != -1)
        PLATFORM_FEATURES |= CPJavascriptRemedialKeySupport;
}
else if (USER_AGENT.indexOf('KHTML') != -1)
{
    PLATFORM_ENGINE = CPKHTMLBrowserEngine;
}
else if (USER_AGENT.indexOf('Gecko') != -1)
{
    PLATFORM_ENGINE = CPGeckoBrowserEngine;
    PLATFORM_FEATURES |= CPJavaScriptCanvasDrawFeature;
    var index = USER_AGENT.indexOf("Firefox"),
        version = (index == -1) ? 2.0 : parseFloat(USER_AGENT.substring(index+"Firefox".length+1));
    if (version >= 3.0)
        PLATFORM_FEATURES |= CPCSSRGBAFeature;
}
if (typeof document != "undefined")
{
    if (document.createElement("canvas").getContext)
        PLATFORM_FEATURES |= CPHTMLCanvasFeature;
    var DOMElement = document.createElement("div");
    if (DOMElement.innerText != undefined)
        PLATFORM_FEATURES |= CPJavascriptInnerTextFeature;
    else if (DOMElement.textContent != undefined)
        PLATFORM_FEATURES |= CPJavascriptTextContentFeature;
}
CPFeatureIsCompatible= function(aFeature)
{
    return PLATFORM_FEATURES & aFeature;
}
if (USER_AGENT.indexOf("Mac") != -1)
{
    CPPlatformActionKeyMask = CPCommandKeyMask;
    CPUndoKeyEquivalent = "Z";
    CPRedoKeyEquivalent = "Z";
    CPUndoKeyEquivalentModifierMask = CPCommandKeyMask;
    CPRedoKeyEquivalentModifierMask = CPCommandKeyMask | CPShiftKeyMask;
}
else
{
    CPPlatformActionKeyMask = CPControlKeyMask;
    CPUndoKeyEquivalent = "Z";
    CPRedoKeyEquivalent = "Y";
    CPUndoKeyEquivalentModifierMask = CPControlKeyMask;
    CPRedoKeyEquivalentModifierMask = CPControlKeyMask;
}

p;11;CPControl.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;14661;
CPLeftTextAlignment = 0;
CPRightTextAlignment = 1;
CPCenterTextAlignment = 2;
CPJustifiedTextAlignment = 3;
CPNaturalTextAlignment = 4;
CPRegularControlSize = 0;
CPSmallControlSize = 1;
CPMiniControlSize = 2;
CPControlNormalBackgroundColor = "CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor = "CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor = "CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor = "CPControlDisabledBackgroundColor";
var CPControlBlackColor = objj_msgSend(CPColor, "blackColor");
{var the_class = objj_allocateClassPair(CPView, "CPControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_value"), new objj_ivar("_isEnabled"), new objj_ivar("_alignment"), new objj_ivar("_font"), new objj_ivar("_textColor"), new objj_ivar("_textShadow"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_sendActionOn"), new objj_ivar("_backgroundColor"), new objj_ivar("_highlightedBackgroundColor"), new objj_ivar("_backgroundColors"), new objj_ivar("_currentBackgroundColorName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPControl__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _sendActionOn = CPLeftMouseUpMask;
        _isEnabled = YES;
        objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(self, "setTextColor:", CPControlBlackColor);
        _backgroundColors = objj_msgSend(CPDictionary, "dictionary");
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setEnabled:"), function $CPControl__setEnabled_(self, _cmd, isEnabled)
{ with(self)
{
    objj_msgSend(self, "setAlphaValue:", (_isEnabled=isEnabled)?1.0:0.3);
}
});
instance_methods[2] = new objj_method(sel_registerName("isEnabled"), function $CPControl__isEnabled(self, _cmd)
{ with(self)
{
    return _isEnabled;
}
});
instance_methods[3] = new objj_method(sel_registerName("setTextColor:"), function $CPControl__setTextColor_(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
}
});
instance_methods[4] = new objj_method(sel_registerName("textColor"), function $CPControl__textColor(self, _cmd)
{ with(self)
{
    return _textColor;
}
});
instance_methods[5] = new objj_method(sel_registerName("alignment"), function $CPControl__alignment(self, _cmd)
{ with(self)
{
    return _alignment;
}
});
instance_methods[6] = new objj_method(sel_registerName("setAlignment:"), function $CPControl__setAlignment_(self, _cmd, anAlignment)
{ with(self)
{
    _alignment = anAlignment;
}
});
instance_methods[7] = new objj_method(sel_registerName("setFont:"), function $CPControl__setFont_(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
}
});
instance_methods[8] = new objj_method(sel_registerName("font"), function $CPControl__font(self, _cmd)
{ with(self)
{
    return _font;
}
});
instance_methods[9] = new objj_method(sel_registerName("setTextShadow:"), function $CPControl__setTextShadow_(self, _cmd, aTextShadow)
{ with(self)
{
    _DOMElement.style.textShadow = objj_msgSend(_textShadow=aTextShadow, "cssString");
}
});
instance_methods[10] = new objj_method(sel_registerName("textShadow"), function $CPControl__textShadow(self, _cmd)
{ with(self)
{
    return _textShadow;
}
});
instance_methods[11] = new objj_method(sel_registerName("action"), function $CPControl__action(self, _cmd)
{ with(self)
{
    return _action;
}
});
instance_methods[12] = new objj_method(sel_registerName("setAction:"), function $CPControl__setAction_(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
});
instance_methods[13] = new objj_method(sel_registerName("target"), function $CPControl__target(self, _cmd)
{ with(self)
{
    return _target;
}
});
instance_methods[14] = new objj_method(sel_registerName("setTarget:"), function $CPControl__setTarget_(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
});
instance_methods[15] = new objj_method(sel_registerName("mouseUp:"), function $CPControl__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    if (_sendActionOn & CPLeftMouseUpMask && CPRectContainsPoint(objj_msgSend(self, "bounds"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
        objj_msgSend(self, "sendAction:to:", _action, _target);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "mouseUp:", anEvent);
}
});
instance_methods[16] = new objj_method(sel_registerName("sendAction:to:"), function $CPControl__sendAction_to_(self, _cmd, anAction, anObject)
{ with(self)
{
    objj_msgSend(CPApp, "sendAction:to:from:", anAction, anObject, self);
}
});
instance_methods[17] = new objj_method(sel_registerName("floatValue"), function $CPControl__floatValue(self, _cmd)
{ with(self)
{
    return _value ? parseFloat(_value, 10) : 0.0;
}
});
instance_methods[18] = new objj_method(sel_registerName("setFloatValue:"), function $CPControl__setFloatValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", aValue);
}
});
instance_methods[19] = new objj_method(sel_registerName("objectValue"), function $CPControl__objectValue(self, _cmd)
{ with(self)
{
    return _value;
}
});
instance_methods[20] = new objj_method(sel_registerName("setObjectValue:"), function $CPControl__setObjectValue_(self, _cmd, anObject)
{ with(self)
{
    _value = anObject;
}
});
instance_methods[21] = new objj_method(sel_registerName("doubleValue"), function $CPControl__doubleValue(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "floatValue");
}
});
instance_methods[22] = new objj_method(sel_registerName("setDoubleValue:"), function $CPControl__setDoubleValue_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
});
instance_methods[23] = new objj_method(sel_registerName("intValue"), function $CPControl__intValue(self, _cmd)
{ with(self)
{
    return _value ? parseInt(_value, 10) : 0;
}
});
instance_methods[24] = new objj_method(sel_registerName("setIntValue:"), function $CPControl__setIntValue_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
});
instance_methods[25] = new objj_method(sel_registerName("stringValue"), function $CPControl__stringValue(self, _cmd)
{ with(self)
{
    return _value ? ""+_value : "";
}
});
instance_methods[26] = new objj_method(sel_registerName("setStringValue:"), function $CPControl__setStringValue_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
});
instance_methods[27] = new objj_method(sel_registerName("setBackgroundColor:"), function $CPControl__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    _backgroundColors = objj_msgSend(CPDictionary, "dictionary");
    objj_msgSend(self, "setBackgroundColor:forName:", aColor, CPControlNormalBackgroundColor);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setBackgroundColor:", aColor);
}
});
instance_methods[28] = new objj_method(sel_registerName("setBackgroundColor:forName:"), function $CPControl__setBackgroundColor_forName_(self, _cmd, aColor, aName)
{ with(self)
{
    if (!aColor)
        objj_msgSend(_backgroundColors, "removeObjectForKey:", aName);
    else
        objj_msgSend(_backgroundColors, "setObject:forKey:", aColor, aName);
    if (_currentBackgroundColorName == aName)
        objj_msgSend(self, "setBackgroundColorWithName:", _currentBackgroundColorName);
}
});
instance_methods[29] = new objj_method(sel_registerName("backgroundColorForName:"), function $CPControl__backgroundColorForName_(self, _cmd, aName)
{ with(self)
{
    var backgroundColor = objj_msgSend(_backgroundColors, "objectForKey:", aName);
    if (!backgroundColor && aName != CPControlNormalBackgroundColor)
        return objj_msgSend(_backgroundColors, "objectForKey:", CPControlNormalBackgroundColor);
    return backgroundColor;
}
});
instance_methods[30] = new objj_method(sel_registerName("setBackgroundColorWithName:"), function $CPControl__setBackgroundColorWithName_(self, _cmd, aName)
{ with(self)
{
    _currentBackgroundColorName = aName;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setBackgroundColor:", objj_msgSend(self, "backgroundColorForName:", aName));
}
});
class_addMethods(the_class, instance_methods);
}
var CPControlIsEnabledKey = "CPControlIsEnabledKey",
    CPControlAlignmentKey = "CPControlAlignmentKey",
    CPControlFontKey = "CPControlFontKey",
    CPControlTextColorKey = "CPControlTextColorKey",
    CPControlTargetKey = "CPControlTargetKey",
    CPControlActionKey = "CPControlActionKey",
    CPControlSendActionOnKey = "CPControlSendActionOnKey";
{
var the_class = objj_getClass("CPControl")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPControl\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPControl__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setEnabled:", objj_msgSend(aCoder, "decodeIntForKey:", CPControlIsEnabledKey));
        objj_msgSend(self, "setAlignment:", objj_msgSend(aCoder, "decodeIntForKey:", CPControlAlignmentKey));
        objj_msgSend(self, "setFont:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlFontKey));
        objj_msgSend(self, "setTextColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlTextColorKey));
        objj_msgSend(self, "setTarget:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlTargetKey));
        objj_msgSend(self, "setAction:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlActionKey));
        _sendActionOn = objj_msgSend(aCoder, "decodeIntForKey:", CPControlSendActionOnKey);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPControl__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", _isEnabled, CPControlIsEnabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _alignment, CPControlAlignmentKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _font, CPControlFontKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _textColor, CPControlTextColorKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _target, CPControlTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _action, CPControlActionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _sendActionOn, CPControlSendActionOnKey);
}
});
class_addMethods(the_class, instance_methods);
}
var _CPControlSizeIdentifiers = [],
    _CPControlCachedThreePartImages = {},
    _CPControlCachedColorWithPatternImages = {},
    _CPControlCachedThreePartImagePattern = {};
_CPControlSizeIdentifiers[CPRegularControlSize] = "Regular";
_CPControlSizeIdentifiers[CPSmallControlSize] = "Small";
_CPControlSizeIdentifiers[CPMiniControlSize] = "Mini";
_CPControlIdentifierForControlSize= function(aControlSize)
{
    return _CPControlSizeIdentifiers[aControlSize];
}
_CPControlColorWithPatternImage= function(sizes, aClassName)
{
    var index = 1,
        count = arguments.length,
        identifier = "";
    for (; index < count; ++index)
        identifier += arguments[index];
    var color = _CPControlCachedColorWithPatternImages[identifier];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPControl, "class"));
        color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", aClassName+"/"+identifier+".png"), sizes[identifier]));
        _CPControlCachedColorWithPatternImages[identifier] = color;
    }
    return color;
}
_CPControlThreePartImages= function(sizes, aClassName)
{
    var index = 1,
        count = arguments.length,
        identifier = "";
    for (; index < count; ++index)
        identifier += arguments[index];
    var images = _CPControlCachedThreePartImages[identifier];
    if (!images)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPControl, "class")),
            path = aClassName + "/" + identifier;
        sizes = sizes[identifier];
        images = [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path+"0.png"), sizes[0]),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path+"1.png"), sizes[1]),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path+"2.png"), sizes[2])];
        _CPControlCachedThreePartImages[identifier] = images;
    }
    return images;
}
_CPControlThreePartImagePattern= function(isVertical, sizes, aClassName)
{
    var index = 2,
        count = arguments.length,
        identifier = "";
    for (; index < count; ++index)
        identifier += arguments[index];
    var color = _CPControlCachedThreePartImagePattern[identifier];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPControl, "class")),
            path = aClassName + "/" + identifier;
        sizes = sizes[identifier];
        color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path+"0.png"), sizes[0]),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path+"1.png"), sizes[1]),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path+"2.png"), sizes[2])], isVertical));
        _CPControlCachedThreePartImagePattern[identifier] = color;
    }
    return color;
}

p;10;CPCookie.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;2042;
{var the_class = objj_allocateClassPair(CPObject, "CPCookie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookieName"), new objj_ivar("_cookieValue"), new objj_ivar("_expires")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithName:"), function $CPCookie__initWithName_(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _cookieName = aName;
    _cookieValue = objj_msgSend(self, "_readCookieValue");
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("value"), function $CPCookie__value(self, _cmd)
{ with(self)
{
    return _cookieValue;
}
});
instance_methods[2] = new objj_method(sel_registerName("name"), function $CPCookie__name(self, _cmd)
{ with(self)
{
    return _cookieName;
}
});
instance_methods[3] = new objj_method(sel_registerName("expires"), function $CPCookie__expires(self, _cmd)
{ with(self)
{
    return _expires;
}
});
instance_methods[4] = new objj_method(sel_registerName("setValue:expires:domain:"), function $CPCookie__setValue_expires_domain_(self, _cmd, value, date, domain)
{ with(self)
{
    if(date)
        var expires = "; expires="+date.toGMTString();
    else
        var expires = "";
    if(domain)
        domain = "; domain="+domain;
    else
        domain = "";
 document.cookie = _cookieName+"="+value+expires+"; path=/"+domain;
}
});
instance_methods[5] = new objj_method(sel_registerName("_readCookieValue"), function $CPCookie___readCookieValue(self, _cmd)
{ with(self)
{
 var nameEQ = _cookieName + "=";
 var ca = document.cookie.split(';');
 for(var i=0;i < ca.length;i++) {
  var c = ca[i];
  while (c.charAt(0)==' ') c = c.substring(1,c.length);
  if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
 }
 return "";
}
});
class_addMethods(the_class, instance_methods);
}

p;12;CPDocument.jI;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;20;CPWindowController.jc;18256;
CPSaveOperation = 0;
CPSaveAsOperation = 1;
CPSaveToOperation = 2;
CPAutosaveOperation = 3;
CPChangeDone = 0;
CPChangeUndone = 1;
CPChangeCleared = 2;
CPChangeReadOtherContents = 3;
CPChangeAutosaved = 4;
CPDocumentWillSaveNotification = "CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification = "CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification = "CPDocumentDidFailToSaveNotification";
var CPDocumentUntitledCount = 0;
{var the_class = objj_allocateClassPair(CPResponder, "CPDocument"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fileURL"), new objj_ivar("_fileType"), new objj_ivar("_windowControllers"), new objj_ivar("_untitledDocumentIndex"), new objj_ivar("_hasUndoManager"), new objj_ivar("_undoManager"), new objj_ivar("_changeCount"), new objj_ivar("_readConnection"), new objj_ivar("_writeRequest")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CPDocument__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _windowControllers = [];
        _hasUndoManager = YES;
        _changeCount = 0;
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithType:error:"), function $CPDocument__initWithType_error_(self, _cmd, aType, anError)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
        objj_msgSend(self, "setFileType:", aType);
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo);
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
    }
    return self;
}
});
instance_methods[3] = new objj_method(sel_registerName("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo);
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
    }
    return self;
}
});
instance_methods[4] = new objj_method(sel_registerName("dataOfType:error:"), function $CPDocument__dataOfType_error_(self, _cmd, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataOfType:error: must be overridden by the document subclass.");
}
});
instance_methods[5] = new objj_method(sel_registerName("readFromData:ofType:error:"), function $CPDocument__readFromData_ofType_error_(self, _cmd, aData, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "readFromData:ofType: must be overridden by the document subclass.");
}
});
instance_methods[6] = new objj_method(sel_registerName("makeWindowControllers"), function $CPDocument__makeWindowControllers(self, _cmd)
{ with(self)
{
    var controller = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindowCibName:", nil);
    objj_msgSend(self, "addWindowController:", controller);
}
});
instance_methods[7] = new objj_method(sel_registerName("windowControllers"), function $CPDocument__windowControllers(self, _cmd)
{ with(self)
{
    return _windowControllers;
}
});
instance_methods[8] = new objj_method(sel_registerName("addWindowController:"), function $CPDocument__addWindowController_(self, _cmd, aWindowController)
{ with(self)
{
    objj_msgSend(_windowControllers, "addObject:", aWindowController);
    if (objj_msgSend(aWindowController, "document") != self)
    {
        objj_msgSend(aWindowController, "setNextResponder:", self);
        objj_msgSend(aWindowController, "setDocument:", self);
    }
}
});
instance_methods[9] = new objj_method(sel_registerName("showWindows"), function $CPDocument__showWindows(self, _cmd)
{ with(self)
{
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_registerName("showWindow:"), self);
}
});
instance_methods[10] = new objj_method(sel_registerName("displayName"), function $CPDocument__displayName(self, _cmd)
{ with(self)
{
    if (!_untitledDocumentIndex)
        _untitledDocumentIndex = ++CPDocumentUntitledCount;
 if (_untitledDocumentIndex == 1)
    return "Untitled";
 return "Untitled " + _untitledDocumentIndex;
}
});
instance_methods[11] = new objj_method(sel_registerName("windowCibName"), function $CPDocument__windowCibName(self, _cmd)
{ with(self)
{
    return nil;
}
});
instance_methods[12] = new objj_method(sel_registerName("windowControllerDidLoadNib:"), function $CPDocument__windowControllerDidLoadNib_(self, _cmd, aWindowController)
{ with(self)
{}
});
instance_methods[13] = new objj_method(sel_registerName("windowControllerWillLoadNib:"), function $CPDocument__windowControllerWillLoadNib_(self, _cmd, aWindowController)
{ with(self)
{}
});
instance_methods[14] = new objj_method(sel_registerName("readFromURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__readFromURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(_readConnection, "cancel");
    _readConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL), self);
    _readConnection.session = _CPReadSessionMake(aType, aDelegate, aDidReadSelector, aContextInfo);
}
});
instance_methods[15] = new objj_method(sel_registerName("fileURL"), function $CPDocument__fileURL(self, _cmd)
{ with(self)
{
    return _fileURL;
}
});
instance_methods[16] = new objj_method(sel_registerName("setFileURL:"), function $CPDocument__setFileURL_(self, _cmd, aFileURL)
{ with(self)
{
    if (_fileURL == aFileURL)
        return;
    _fileURL = aFileURL;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:", sel_registerName("synchronizeWindowTitleWithDocumentName"));
}
});
instance_methods[17] = new objj_method(sel_registerName("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"), function $CPDocument__saveToURL_ofType_forSaveOperation_delegate_didSaveSelector_contextInfo_(self, _cmd, anAbsoluteURL, aTypeName, aSaveOperation, aDelegate, aDidSaveSelector, aContextInfo)
{ with(self)
{
    var data = objj_msgSend(self, "dataOfType:error:", objj_msgSend(self, "fileType"), nil),
        oldChangeCount = _changeCount;
    _writeRequest = objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL);
    objj_msgSend(_writeRequest, "setHTTPMethod:", "POST");
    objj_msgSend(_writeRequest, "setHTTPBody:", objj_msgSend(data, "string"));
    objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "close", "Connection");
    if (aSaveOperation == CPSaveOperation)
        objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
    if (aSaveOperation != CPSaveToOperation)
        objj_msgSend(self, "updateChangeCount:", CPChangeCleared);
    var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", _writeRequest, self);
    connection.session = _CPSaveSessionMake(anAbsoluteURL, aSaveOperation, oldChangeCount, aDelegate, aDidSaveSelector, aContextInfo, connection);
}
});
instance_methods[18] = new objj_method(sel_registerName("connection:didReceiveResponse:"), function $CPDocument__connection_didReceiveResponse_(self, _cmd, aConnection, aResponse)
{ with(self)
{
    var statusCode = objj_msgSend(aResponse, "statusCode");
    if (statusCode == 200)
        return;
    var session = aConnection.session;
    if (aConnection == _readConnection)
    {
        objj_msgSend(aConnection, "cancel");
        alert("There was an error retrieving the document.");
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    }
    else
    {
        if (statusCode == 409)
        {
            objj_msgSend(aConnection, "cancel");
            if (confirm("There already exists a file with that name, would you like to overwrite it?"))
            {
                objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
                objj_msgSend(aConnection, "start");
            }
            else
            {
                if (session.saveOperation != CPSaveToOperation)
                {
                    _changeCount += session.changeCount;
                    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_registerName("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
                }
                _writeRequest = nil;
                objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
            }
        }
    }
}
});
instance_methods[19] = new objj_method(sel_registerName("connection:didReceiveData:"), function $CPDocument__connection_didReceiveData_(self, _cmd, aConnection, aData)
{ with(self)
{
    var session = aConnection.session;
    if (aConnection == _readConnection)
    {
        objj_msgSend(self, "readFromData:ofType:error:", objj_msgSend(CPData, "dataWithString:", aData), session.fileType, nil);
        objj_msgSend(session.delegate, session.didReadSelector, self, YES, session.contextInfo);
    }
    else
    {
        if (session.saveOperation != CPSaveToOperation)
            objj_msgSend(self, "setFileURL:", session.absoluteURL);
        _writeRequest = nil;
        objj_msgSend(session.delegate, session.didSaveSelector, self, YES, session.contextInfo);
    }
}
});
instance_methods[20] = new objj_method(sel_registerName("connection:didFailWithError:"), function $CPDocument__connection_didFailWithError_(self, _cmd, aConnection, anError)
{ with(self)
{
    var session = aConnection.session;
    if (_readConnection == aConnection)
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    else
    {
        if (session.saveOperation != CPSaveToOperation)
        {
            _changeCount += session.changeCount;
            objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_registerName("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
        }
        _writeRequest = nil;
        alert("There was an error saving the document.");
        objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
    }
}
});
instance_methods[21] = new objj_method(sel_registerName("connectionDidFinishLoading:"), function $CPDocument__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
    if (_readConnection == aConnection)
        _readConnection = nil;
}
});
instance_methods[22] = new objj_method(sel_registerName("isDocumentEdited"), function $CPDocument__isDocumentEdited(self, _cmd)
{ with(self)
{
    return _changeCount != 0;
}
});
instance_methods[23] = new objj_method(sel_registerName("updateChangeCount:"), function $CPDocument__updateChangeCount_(self, _cmd, aChangeType)
{ with(self)
{
    if (aChangeType == CPChangeDone)
        ++_changeCount;
    else if (aChangeType == CPChangeUndone)
        --_changeCount;
    else if (aChangeType == CPChangeCleared)
        _changeCount = 0;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_registerName("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
}
});
instance_methods[24] = new objj_method(sel_registerName("setFileType:"), function $CPDocument__setFileType_(self, _cmd, aType)
{ with(self)
{
    _fileType = aType;
}
});
instance_methods[25] = new objj_method(sel_registerName("fileType"), function $CPDocument__fileType(self, _cmd)
{ with(self)
{
    return _fileType;
}
});
instance_methods[26] = new objj_method(sel_registerName("hasUndoManager"), function $CPDocument__hasUndoManager(self, _cmd)
{ with(self)
{
    return _hasUndoManager;
}
});
instance_methods[27] = new objj_method(sel_registerName("setHasUndoManager:"), function $CPDocument__setHasUndoManager_(self, _cmd, aFlag)
{ with(self)
{
    if (_hasUndoManager == aFlag)
        return;
    _hasUndoManager = aFlag;
    if (!_hasUndoManager)
        objj_msgSend(self, "setUndoManager:", nil);
}
});
instance_methods[28] = new objj_method(sel_registerName("_undoManagerWillCloseGroup:"), function $CPDocument___undoManagerWillCloseGroup_(self, _cmd, aNotification)
{ with(self)
{
    var undoManager = objj_msgSend(aNotification, "object");
    if (objj_msgSend(undoManager, "isUndoing") || objj_msgSend(undoManager, "isRedoing"))
        return;
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
});
instance_methods[29] = new objj_method(sel_registerName("_undoManagerDidUndoChange:"), function $CPDocument___undoManagerDidUndoChange_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeUndone);
}
});
instance_methods[30] = new objj_method(sel_registerName("_undoManagerDidRedoChange:"), function $CPDocument___undoManagerDidRedoChange_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
});
instance_methods[31] = new objj_method(sel_registerName("setUndoManager:"), function $CPDocument__setUndoManager_(self, _cmd, anUndoManager)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_undoManager)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
    _undoManager = anUndoManager;
    if (_undoManager)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("_undoManagerDidUndoChange:"), CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("_undoManagerDidRedoChange:"), CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("_undoManagerWillCloseGroup:"), CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
}
});
instance_methods[32] = new objj_method(sel_registerName("undoManager"), function $CPDocument__undoManager(self, _cmd)
{ with(self)
{
    if (_hasUndoManager && !_undoManager)
        objj_msgSend(self, "setUndoManager:", objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init"));
    return _undoManager;
}
});
instance_methods[33] = new objj_method(sel_registerName("windowWillReturnUndoManager:"), function $CPDocument__windowWillReturnUndoManager_(self, _cmd, aWindow)
{ with(self)
{
    return objj_msgSend(self, "undoManager");
}
});
instance_methods[34] = new objj_method(sel_registerName("saveDocument:"), function $CPDocument__saveDocument_(self, _cmd, aSender)
{ with(self)
{
    if (_fileURL)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
        objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", _fileURL, objj_msgSend(self, "fileType"), CPSaveOperation, self, sel_registerName("document:didSave:contextInfo:"), NULL);
    }
    else
        objj_msgSend(self, "saveDocumentAs:", self);
}
});
instance_methods[35] = new objj_method(sel_registerName("saveDocumentAs:"), function $CPDocument__saveDocumentAs_(self, _cmd, aSender)
{ with(self)
{
    _documentName = window.prompt("Document Name:");
    if (!_documentName)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
    objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", objj_msgSend(self, "proposedFileURL"), objj_msgSend(self, "fileType"), CPSaveAsOperation, self, sel_registerName("document:didSave:contextInfo:"), NULL);
}
});
instance_methods[36] = new objj_method(sel_registerName("document:didSave:contextInfo:"), function $CPDocument__document_didSave_contextInfo_(self, _cmd, aDocument, didSave, aContextInfo)
{ with(self)
{
    if (didSave)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidSaveNotification, self);
    else
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidFailToSaveNotification, self);
}
});
class_addMethods(the_class, instance_methods);
}
var _CPReadSessionMake = function(aType, aDelegate, aDidReadSelector, aContextInfo)
{
    return { fileType:aType, delegate:aDelegate, didReadSelector:aDidReadSelector, contextInfo:aContextInfo };
}
var _CPSaveSessionMake = function(anAbsoluteURL, aSaveOperation, aChangeCount, aDelegate, aDidSaveSelector, aContextInfo, aConnection)
{
    return { absoluteURL:anAbsoluteURL, saveOperation:aSaveOperation, changeCount:aChangeCount, delegate:aDelegate, didSaveSelector:aDidSaveSelector, contextInfo:aContextInfo, connection:aConnection };
}

p;22;CPDocumentController.jI;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.jc;8691;
var CPSharedDocumentController = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDocumentController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documents"), new objj_ivar("_documentTypes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("sharedDocumentController"), function $CPDocumentController__sharedDocumentController(self, _cmd)
{ with(self)
{
    if (!CPSharedDocumentController)
        objj_msgSend(objj_msgSend(self, "alloc"), "init");
    return CPSharedDocumentController;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CPDocumentController__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _documents = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        if (!CPSharedDocumentController)
            CPSharedDocumentController = self;
        _documentTypes = objj_msgSend(objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "infoDictionary"), "objectForKey:", "CPBundleDocumentTypes");
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("documentForURL:"), function $CPDocumentController__documentForURL_(self, _cmd, aURL)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(_documents, "count");
 for (; index < count; ++index)
    {
        var theDocument = _documents[index];
  if (objj_msgSend(objj_msgSend(theDocument, "fileURL"), "isEqual:", aURL))
   return theDocument;
    }
 return nil;
}
});
instance_methods[2] = new objj_method(sel_registerName("openUntitledDocumentOfType:display:"), function $CPDocumentController__openUntitledDocumentOfType_display_(self, _cmd, aType, shouldDisplay)
{ with(self)
{
    var theDocument = objj_msgSend(self, "makeUntitledDocumentOfType:error:", aType, nil);
    if (theDocument)
        objj_msgSend(self, "addDocument:", theDocument);
    if (shouldDisplay)
    {
        objj_msgSend(theDocument, "makeWindowControllers");
        objj_msgSend(theDocument, "showWindows");
    }
    return theDocument;
}
});
instance_methods[3] = new objj_method(sel_registerName("makeUntitledDocumentOfType:error:"), function $CPDocumentController__makeUntitledDocumentOfType_error_(self, _cmd, aType, anError)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initWithType:error:", aType, anError);
}
});
instance_methods[4] = new objj_method(sel_registerName("openDocumentWithContentsOfURL:display:error:"), function $CPDocumentController__openDocumentWithContentsOfURL_display_error_(self, _cmd, anAbsoluteURL, shouldDisplay, anError)
{ with(self)
{
    var result = objj_msgSend(self, "documentForURL:", anAbsoluteURL);
    if (!result)
    {
        var type = objj_msgSend(self, "typeForContentsOfURL:error:", anAbsoluteURL, anError);
        result = objj_msgSend(self, "makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, type, self, sel_registerName("document:didRead:contextInfo:"), objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", shouldDisplay, "shouldDisplay"));
    }
    else if (shouldDisplay)
        objj_msgSend(result, "showWindows");
    return result;
}
});
instance_methods[5] = new objj_method(sel_registerName("reopenDocumentForURL:withContentsOfURL:error:"), function $CPDocumentController__reopenDocumentForURL_withContentsOfURL_error_(self, _cmd, anAbsoluteURL, absoluteContentsURL, anError)
{ with(self)
{
    return objj_msgSend(self, "makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, objj_msgSend(objj_msgSend(_documentTypes, "objectAtIndex:", 0), "objectForKey:", "CPBundleTypeName"), self, sel_registerName("document:didRead:contextInfo:"), nil);
}
});
instance_methods[6] = new objj_method(sel_registerName("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocumentController__makeDocumentWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo);
}
});
instance_methods[7] = new objj_method(sel_registerName("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocumentController__makeDocumentForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo);
}
});
instance_methods[8] = new objj_method(sel_registerName("document:didRead:contextInfo:"), function $CPDocumentController__document_didRead_contextInfo_(self, _cmd, aDocument, didRead, aContextInfo)
{ with(self)
{
    if (!didRead)
        return;
    objj_msgSend(self, "addDocument:", aDocument);
    objj_msgSend(aDocument, "makeWindowControllers");
    if (objj_msgSend(aContextInfo, "objectForKey:", "shouldDisplay"))
        objj_msgSend(aDocument, "showWindows");
}
});
instance_methods[9] = new objj_method(sel_registerName("newDocument:"), function $CPDocumentController__newDocument_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "openUntitledDocumentOfType:display:", objj_msgSend(objj_msgSend(_documentTypes, "objectAtIndex:", 0), "objectForKey:", "CPBundleTypeName"), YES);
}
});
instance_methods[10] = new objj_method(sel_registerName("documents"), function $CPDocumentController__documents(self, _cmd)
{ with(self)
{
    return _documents;
}
});
instance_methods[11] = new objj_method(sel_registerName("addDocument:"), function $CPDocumentController__addDocument_(self, _cmd, aDocument)
{ with(self)
{
    objj_msgSend(_documents, "addObject:", aDocument);
}
});
instance_methods[12] = new objj_method(sel_registerName("removeDocument:"), function $CPDocumentController__removeDocument_(self, _cmd, aDocument)
{ with(self)
{
    objj_msgSend(_documents, "removeObjectIdenticalTo:", aDocument);
}
});
instance_methods[13] = new objj_method(sel_registerName("defaultType"), function $CPDocumentController__defaultType(self, _cmd)
{ with(self)
{
    return objj_msgSend(_documentTypes[0], "objectForKey:", "CPBundleTypeName");
}
});
instance_methods[14] = new objj_method(sel_registerName("typeForContentsOfURL:error:"), function $CPDocumentController__typeForContentsOfURL_error_(self, _cmd, anAbsoluteURL, outError)
{ with(self)
{
    var index = 0,
        count = _documentTypes.length,
        extension = objj_msgSend(objj_msgSend(anAbsoluteURL, "pathExtension"), "lowercaseString");
    for (; index < count; ++index)
    {
        var documentType = _documentTypes[index],
            extensions = objj_msgSend(documentType, "objectForKey:", "CFBundleTypeExtensions"),
            extensionIndex = 0,
            extensionCount = extensions.length;
        for (; extensionIndex < extensionCount; ++extensionIndex)
            if (objj_msgSend(extensions[extensionIndex], "lowercaseString") == extension)
                return objj_msgSend(documentType, "objectForKey:", "CPBundleTypeName");
    }
    return objj_msgSend(self, "defaultType");
}
});
instance_methods[15] = new objj_method(sel_registerName("_infoForType:"), function $CPDocumentController___infoForType_(self, _cmd, aType)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(_documentTypes, "count");
    for (;i < count; ++i)
    {
        var documentType = _documentTypes[i];
        if (objj_msgSend(documentType, "objectForKey:", "CPBundleTypeName") == aType)
            return documentType;
    }
    return nil;
}
});
instance_methods[16] = new objj_method(sel_registerName("documentClassForType:"), function $CPDocumentController__documentClassForType_(self, _cmd, aType)
{ with(self)
{
    var className = objj_msgSend(objj_msgSend(self, "_infoForType:", aType), "objectForKey:", "CPDocumentClass");
    return className ? CPClassFromString(className) : nil;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;20;CPDOMDisplayServer.jI;22;Foundation/CPRunLoop.jc;6197;
var CPDOMDisplayRunLoop = nil;
CPDOMDisplayServerInstructions = [];
CPDOMDisplayServerInstructionCount = 0;
CPDOMDisplayServerViews = [];
CPDOMDisplayServerViewsCount = 0;
CPDOMDisplayServerViewsContext = {};
{var the_class = objj_allocateClassPair(CPObject, "CPDOMDisplayServer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("start"), function $CPDOMDisplayServer__start(self, _cmd)
{ with(self)
{
    CPDOMDisplayRunLoop = objj_msgSend(CPRunLoop, "currentRunLoop");
    objj_msgSend(CPDOMDisplayRunLoop, "performSelector:target:argument:order:modes:", sel_registerName("run"), CPDOMDisplayServer, nil, 0, [CPDefaultRunLoopMode]);
}
});
class_methods[1] = new objj_method(sel_registerName("run"), function $CPDOMDisplayServer__run(self, _cmd)
{ with(self)
{
    while (CPDOMDisplayServerInstructionCount || CPDOMDisplayServerViewsCount)
    {
        var index = 0;
        while (index < CPDOMDisplayServerInstructionCount)
        {
            var instruction = CPDOMDisplayServerInstructions[index++];
    try{
            switch (instruction)
            {
                case 0:
                case 1:
                case 2:
                case 3: var element = CPDOMDisplayServerInstructions[index],
                                                style = element.style,
                                                x = (instruction == 0 || instruction == 2) ? "left" : "right",
                                                y = (instruction == 0 || instruction == 1) ? "top" : "bottom";
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            var transform = CPDOMDisplayServerInstructions[index++];
                                            if (transform)
                                            {
                                                var point = { x:CPDOMDisplayServerInstructions[index++], y:CPDOMDisplayServerInstructions[index++] },
                                                    transformed = { x:point.x * transform.a + point.y * transform.c + transform.tx, y:point.x * transform.b + point.y * transform.d + transform.ty };
                                                style[x] = ROUND(transformed.x) + "px";
                                                style[y] = ROUND(transformed.y) + "px";
                                            }
                                            else
                                            {
                                                style[x] = ROUND(CPDOMDisplayServerInstructions[index++]) + "px";
                                                style[y] = ROUND(CPDOMDisplayServerInstructions[index++]) + "px";
                                            }
                                            element.CPDOMDisplayContext[0] = -1;
                                            break;
                case 4: var element = CPDOMDisplayServerInstructions[index],
                                                style = element.style;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            element.CPDOMDisplayContext[4] = -1;
                                            style.width = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++])) + "px";
                                            style.height = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++])) + "px";
                                            break;
                case 5: var element = CPDOMDisplayServerInstructions[index];
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            element.CPDOMDisplayContext[5] = -1;
                                            element.width = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++]));
                                            element.height = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++]));
                                            break;
                case 6: CPDOMDisplayServerInstructions[index].appendChild(CPDOMDisplayServerInstructions[index+1]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                case 7: CPDOMDisplayServerInstructions[index].insertBefore(CPDOMDisplayServerInstructions[index+1], CPDOMDisplayServerInstructions[index+2]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                case 8: CPDOMDisplayServerInstructions[index].removeChild(CPDOMDisplayServerInstructions[index+1]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                }}catch(e) { CPLog("here?" + instruction) }
        }
        CPDOMDisplayServerInstructionCount = 0;
        var views = CPDOMDisplayServerViews,
            index = 0,
            count = CPDOMDisplayServerViewsCount;
        CPDOMDisplayServerViews = [];
        CPDOMDisplayServerViewsCount = 0;
        for (; index < count; ++index)
        {
            var view = views[index];
            delete CPDOMDisplayServerViewsContext[objj_msgSend(view, "hash")];
            objj_msgSend(view, "displayIfNeeded");
        }
    }
    objj_msgSend(CPDOMDisplayRunLoop, "performSelector:target:argument:order:modes:", sel_registerName("run"), CPDOMDisplayServer, nil, 0, [CPDefaultRunLoopMode]);
}
});
class_addMethods(meta_class, class_methods);
}
objj_msgSend(CPDOMDisplayServer, "start");

p;19;CPDOMWindowBridge.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.jc;30718;
CPSharedDOMWindowBridge = nil;
var ExcludedDOMElements = [];
{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowBridge"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_orderedWindows"), new objj_ivar("_mouseDownWindow"), new objj_ivar("_DOMWindow"), new objj_ivar("_DOMBodyElement"), new objj_ivar("_DOMFocusElement"), new objj_ivar("_windowLevels"), new objj_ivar("_windowLayers"), new objj_ivar("_frame"), new objj_ivar("_contentBounds"), new objj_ivar("_mouseIsDown"), new objj_ivar("_lastMouseUp"), new objj_ivar("_lastMouseDown"), new objj_ivar("_currentMousePosition"), new objj_ivar("_charCodes"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEventMode"), new objj_ivar("_DOMPasteboardElement"), new objj_ivar("_pasteboardKeyDownEvent"), new objj_ivar("_overriddenEventType")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("sharedDOMWindowBridge"), function $CPDOMWindowBridge__sharedDOMWindowBridge(self, _cmd)
{ with(self)
{
    if (!CPSharedDOMWindowBridge)
        CPSharedDOMWindowBridge = objj_msgSend(objj_msgSend(CPDOMWindowBridge, "alloc"), "_initWithDOMWindow:", window);
    return CPSharedDOMWindowBridge;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPDOMWindowBridge__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    alert("unimplemented");
}
});
instance_methods[1] = new objj_method(sel_registerName("_initWithDOMWindow:"), function $CPDOMWindowBridge___initWithDOMWindow_(self, _cmd, aDOMWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _DOMWindow = aDOMWindow;
        _windowLevels = [];
        _windowLayers = objj_msgSend(CPDictionary, "dictionary");
        _DOMBodyElement = document.getElementsByTagName("body")[0];
        _DOMBodyElement.innerHTML = "";
        _DOMBodyElement.style.overflow = "hidden";
        if (document.documentElement)
            document.documentElement.style.overflow = "hidden";
        _frame = CPDOMWindowGetFrame(_DOMWindow);
        _contentBounds = CGRectMake(0.0, 0.0, CPRectGetWidth(_frame), CPRectGetHeight(_frame));
        _DOMFocusElement = document.createElement("input");
        _DOMFocusElement.style.position = "absolute";
        _DOMFocusElement.style.zIndex = "-1000";
        _DOMFocusElement.style.opacity = "0";
        _DOMFocusElement.style.filter = "alpha(opacity=0)";
        _DOMBodyElement.appendChild(_DOMFocusElement);
        _DOMPasteboardElement = document.createElement("input");
        _DOMPasteboardElement.style.position = "absolute";
        _DOMPasteboardElement.style.top = "-10000px";
        _DOMPasteboardElement.style.zIndex = "99";
        _DOMBodyElement.appendChild(_DOMPasteboardElement);
        _DOMPasteboardElement.blur();
        _charCodes = {};
        var theClass = objj_msgSend(self, "class"),
            keyEventSelector = sel_registerName("_bridgeKeyEvent:"),
            keyEventImplementation = class_getMethodImplementation(theClass, keyEventSelector),
            keyEventCallback = function (anEvent) { keyEventImplementation(self, nil, anEvent); },
            mouseEventSelector = sel_registerName("_bridgeMouseEvent:"),
            mouseEventImplementation = class_getMethodImplementation(theClass, mouseEventSelector),
            mouseEventCallback = function (anEvent) { mouseEventImplementation(self, nil, anEvent); },
            scrollEventSelector = sel_registerName("_bridgeScrollEvent:"),
            scrollEventImplementation = class_getMethodImplementation(theClass, scrollEventSelector),
            scrollEventCallback = function (anEvent) { scrollEventImplementation(self, nil, anEvent); },
            resizeEventSelector = sel_registerName("_bridgeResizeEvent:"),
            resizeEventImplementation = class_getMethodImplementation(theClass, resizeEventSelector),
            resizeEventCallback = function (anEvent) { resizeEventImplementation(self, nil, anEvent); },
            theDocument = _DOMWindow.document;
        if (document.addEventListener)
        {
            _DOMWindow.addEventListener("resize", resizeEventCallback, NO);
            theDocument.addEventListener(CPDOMEventMouseUp, mouseEventCallback, NO);
            theDocument.addEventListener(CPDOMEventMouseDown, mouseEventCallback, NO);
            theDocument.addEventListener(CPDOMEventMouseMoved, mouseEventCallback, NO);
            theDocument.addEventListener(CPDOMEventKeyUp, keyEventCallback, NO);
            theDocument.addEventListener(CPDOMEventKeyDown, keyEventCallback, NO);
            theDocument.addEventListener(CPDOMEventKeyPress, keyEventCallback, NO);
            _DOMWindow.addEventListener("DOMMouseScroll", scrollEventCallback, NO);
            _DOMWindow.addEventListener(CPDOMEventScrollWheel, scrollEventCallback, NO);
        }
        else if(document.attachEvent)
        {
            _DOMWindow.attachEvent("onresize", resizeEventCallback);
            theDocument.attachEvent("on" + CPDOMEventMouseUp, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventMouseDown, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventMouseMoved, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventDoubleClick, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventKeyUp, keyEventCallback);
            theDocument.attachEvent("on" + CPDOMEventKeyDown, keyEventCallback);
            theDocument.attachEvent("on" + CPDOMEventKeyPress, keyEventCallback);
            _DOMWindow.onmousewheel = scrollEventCallback;
            theDocument.onmousewheel = scrollEventCallback;
            theDocument.body.ondrag = function () { return NO; };
            theDocument.body.onselectstart = function () { return window.event.srcElement == _DOMPasteboardElement; };
        }
        ExcludedDOMElements["INPUT"] = YES;
        ExcludedDOMElements["SELECT"] = YES;
        ExcludedDOMElements["TEXTAREA"] = YES;
        ExcludedDOMElements["OPTION"] = YES;
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("frame"), function $CPDOMWindowBridge__frame(self, _cmd)
{ with(self)
{
    return CGRectMakeCopy(_frame);
}
});
instance_methods[3] = new objj_method(sel_registerName("visibleFrame"), function $CPDOMWindowBridge__visibleFrame(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "frame");
    frame.origin = CGPointMakeZero();
    if (objj_msgSend(CPMenu, "menuBarVisible"))
    {
        var menuBarHeight = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "menuBarHeight");
        frame.origin.y += menuBarHeight;
        frame.size.height -= menuBarHeight;
    }
    return frame;
}
});
instance_methods[4] = new objj_method(sel_registerName("contentBounds"), function $CPDOMWindowBridge__contentBounds(self, _cmd)
{ with(self)
{
    return CPRectCreateCopy(_contentBounds);
}
});
instance_methods[5] = new objj_method(sel_registerName("layerAtLevel:create:"), function $CPDOMWindowBridge__layerAtLevel_create_(self, _cmd, aLevel, aFlag)
{ with(self)
{
    var layer = objj_msgSend(_windowLayers, "objectForKey:", aLevel);
    if (!layer && aFlag)
    {
        layer = objj_msgSend(objj_msgSend(CPDOMWindowLayer, "alloc"), "initWithLevel:", aLevel);
        objj_msgSend(_windowLayers, "setObject:forKey:", layer, aLevel);
        var low = 0,
            high = _windowLevels.length - 1,
            middle;
        while (low <= high)
        {
            middle = FLOOR((low + high) / 2);
            if (_windowLevels[middle] > aLevel)
                high = middle - 1;
            else
                low = middle + 1;
        }
        objj_msgSend(_windowLevels, "insertObject:atIndex:", aLevel, _windowLevels[middle]>aLevel?middle:middle+1);
        layer._DOMElement.style.zIndex = aLevel;
        _DOMBodyElement.appendChild(layer._DOMElement);
    }
    return layer;
}
});
instance_methods[6] = new objj_method(sel_registerName("order:window:relativeTo:"), function $CPDOMWindowBridge__order_window_relativeTo_(self, _cmd, aPlace, aWindow, otherWindow)
{ with(self)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", objj_msgSend(aWindow, "level"), aPlace!=CPWindowOut);
    if (aPlace == CPWindowOut)
        return objj_msgSend(layer, "removeWindow:", aWindow);
    objj_msgSend(layer, "insertWindow:atIndex:", aWindow, (otherWindow?(aPlace==CPWindowAbove?otherWindow._index+1:otherWindow._index):CPNotFound));
}
});
instance_methods[7] = new objj_method(sel_registerName("_dragHitTest:pasteboard:"), function $CPDOMWindowBridge___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    var view = nil,
        levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length;
    while (levelCount-- && !view)
    {
        if (levels[levelCount] >= CPDraggingWindowLevel)
            continue;
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
        {
            var theWindow = windows[windowCount],
                frame = theWindow._frame;
            if (CPRectContainsPoint(frame, aPoint))
                if (view = objj_msgSend(theWindow._windowView, "_dragHitTest:pasteboard:", CGPointMake(aPoint.x-frame.origin.x,aPoint.y-frame.origin.y), aPasteboard))
                    return view;
                else
                    return nil;
        }
    }
    return view;
}
});
instance_methods[8] = new objj_method(sel_registerName("_propagateCurrentDOMEvent:"), function $CPDOMWindowBridge___propagateCurrentDOMEvent_(self, _cmd, aFlag)
{ with(self)
{
    StopDOMEventPropagation = !aFlag;
}
});
instance_methods[9] = new objj_method(sel_registerName("hitTest:"), function $CPDOMWindowBridge__hitTest_(self, _cmd, location)
{ with(self)
{
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length,
        theWindow = nil;
    while (levelCount-- && !theWindow)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount-- && !theWindow)
            if (CPRectContainsPoint(windows[windowCount]._frame, location))
                theWindow = windows[windowCount];
    }
    return theWindow;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPDOMWindowGetFrame = function(_DOMWindow)
{
    var frame = nil;
    if (_DOMWindow.outerWidth)
        frame = CGRectMake(0, 0, _DOMWindow.outerWidth, _DOMWindow.outerHeight);
    else
        frame = CGRectMake(0, 0, -1, -1);
    if (window.screenTop)
        frame.origin = CGPointMake(_DOMWindow.screenLeft, _DOMWindow.screenTop, 0);
    else if (window.screenX)
        frame.origin = CGPointMake(_DOMWindow.screenX, _DOMWindow.screenY, 0);
    if (_DOMWindow.innerWidth)
        frame.size = CGSizeMake(_DOMWindow.innerWidth, _DOMWindow.innerHeight);
    else if (document.documentElement && document.documentElement.clientWidth)
        frame.size = CGSizeMake(_DOMWindow.document.documentElement.clientWidth, _DOMWindow.document.documentElement.clientHeight);
    else
        frame.size = CGSizeMake(_DOMWindow.document.body.clientWidth, _DOMWindow.document.body.clientHeight);
    return frame;
}
var KeyCodesToPrevent = {},
    CharacterKeysToPrevent = {},
    KeyCodesWithoutKeyPressEvents = { '8':1, '9':1, '37':1, '38':1, '39':1, '40':1, '46':1 };
var CTRL_KEY_CODE = 17;
{
var the_class = objj_getClass("CPDOMWindowBridge")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPDOMWindowBridge\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("preventCharacterKeysFromPropagating:"), function $CPDOMWindowBridge__preventCharacterKeysFromPropagating_(self, _cmd, characters)
{ with(self)
{
    for(var i=characters.length; i>0; i--)
        CharacterKeysToPrevent[""+characters[i-1].toLowerCase()] = YES;
}
});
instance_methods[1] = new objj_method(sel_registerName("preventCharacterKeyFromPropagating:"), function $CPDOMWindowBridge__preventCharacterKeyFromPropagating_(self, _cmd, character)
{ with(self)
{
    CharacterKeysToPrevent[character.toLowerCase()] = YES;
}
});
instance_methods[2] = new objj_method(sel_registerName("clearCharacterKeysToPreventFromPropagating"), function $CPDOMWindowBridge__clearCharacterKeysToPreventFromPropagating(self, _cmd)
{ with(self)
{
    CharacterKeysToPrevent = {};
}
});
instance_methods[3] = new objj_method(sel_registerName("preventKeyCodesFromPropagating:"), function $CPDOMWindowBridge__preventKeyCodesFromPropagating_(self, _cmd, keyCodes)
{ with(self)
{
    for(var i=keyCodes.length; i>0; i--)
        KeyCodesToPrevent[keyCodes[i-1]] = YES;
}
});
instance_methods[4] = new objj_method(sel_registerName("preventKeyCodeFromPropagating:"), function $CPDOMWindowBridge__preventKeyCodeFromPropagating_(self, _cmd, keyCode)
{ with(self)
{
    KeyCodesToPrevent[keyCode] = YES;
}
});
instance_methods[5] = new objj_method(sel_registerName("clearKeyCodesToPreventFromPropagating"), function $CPDOMWindowBridge__clearKeyCodesToPreventFromPropagating(self, _cmd)
{ with(self)
{
    KeyCodesToPrevent = {};
}
});
instance_methods[6] = new objj_method(sel_registerName("_bridgeMouseEvent:"), function $CPDOMWindowBridge___bridgeMouseEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    var theType = _overriddenEventType || aDOMEvent.type;
    if (theType == CPDOMEventDoubleClick)
    {
        _overriddenEventType = CPDOMEventMouseDown;
        objj_msgSend(self, "_bridgeMouseEvent:", aDOMEvent);
        _overriddenEventType = CPDOMEventMouseUp;
        objj_msgSend(self, "_bridgeMouseEvent:", aDOMEvent);
        _overriddenEventType = nil;
        return;
    }
    try
    {
        var event,
            location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY },
            timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
            sourceElement = (aDOMEvent.target || aDOMEvent.srcElement),
            windowNumber = 0,
            modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                            (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                            (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                            (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
        StopDOMEventPropagation = YES;
        if (_mouseDownWindow)
            windowNumber = objj_msgSend(_mouseDownWindow, "windowNumber");
        else
        {
            var theWindow = objj_msgSend(self, "hitTest:", location);
            if (aDOMEvent.type == CPDOMEventMouseDown && theWindow)
                _mouseDownWindow = theWindow;
            windowNumber = objj_msgSend(theWindow, "windowNumber");
        }
        if (windowNumber)
        {
            var windowFrame = CPApp._windows[windowNumber]._frame;
            location.x -= (windowFrame.origin.x);
            location.y -= (windowFrame.origin.y);
        }
        switch (theType)
        {
            case CPDOMEventMouseUp: if(_mouseIsDown)
                                        {
                                            event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseUp,timestamp,location), 0);
                                            _mouseIsDown = NO;
                                            _lastMouseUp = event;
                                            _mouseDownWindow = nil;
                                        }
                                        if(_DOMEventMode)
                                        {
                                            _DOMEventMode = NO;
                                            return;
                                        }
                                        break;
            case CPDOMEventMouseDown: if (ExcludedDOMElements[sourceElement.tagName] && sourceElement != _DOMFocusElement)
                                        {
                                            _DOMEventMode = YES;
                                            _mouseIsDown = YES;
                                            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown,timestamp,location), 0));
                                            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown,timestamp,location), 0));
                                            return;
                                        }
                                        event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown,timestamp,location), 0);
                                        _mouseIsDown = YES;
                                        _lastMouseDown = event;
                                        break;
            case CPDOMEventMouseMoved: if (_DOMEventMode)
                                            return;
                                        event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", _mouseIsDown?CPLeftMouseDragged:CPMouseMoved, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0);
                                        _currentMousePosition = { x:aDOMEvent.clientX, y:aDOMEvent.clientY };
                                        break;
        }
        if (event)
        {
            event._DOMEvent = aDOMEvent;
            objj_msgSend(CPApp, "sendEvent:", event);
        }
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
});
instance_methods[7] = new objj_method(sel_registerName("_bridgeKeyEvent:"), function $CPDOMWindowBridge___bridgeKeyEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    try
    {
        var event,
            timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
            sourceElement = (aDOMEvent.target || aDOMEvent.srcElement),
            windowNumber = objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "windowNumber"),
            modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                            (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                            (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                            (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
        if (ExcludedDOMElements[sourceElement.tagName] && sourceElement != _DOMFocusElement && sourceElement != _DOMPasteboardElement)
            return;
        StopDOMEventPropagation = !(modifierFlags & (CPControlKeyMask | CPCommandKeyMask)) ||
                                  CharacterKeysToPrevent[String.fromCharCode(aDOMEvent.keyCode||aDOMEvent.charCode).toLowerCase()] ||
                                  KeyCodesToPrevent[aDOMEvent.keyCode];
        var isNativePasteEvent = NO,
            isNativeCopyOrCutEvent = NO;
        switch (aDOMEvent.type)
        {
            case CPDOMEventKeyDown:
                                        _keyCode = aDOMEvent.keyCode;
                                        var characters = String.fromCharCode(_keyCode).toLowerCase();
                                        if (characters == "v" && (modifierFlags & CPPlatformActionKeyMask))
                                        {
                                            _DOMPasteboardElement.select();
                                            _DOMPasteboardElement.value = "";
                                            isNativePasteEvent = YES;
                                        }
                                        else if ((characters == "c" || characters == "x") && (modifierFlags & CPPlatformActionKeyMask))
                                            isNativeCopyOrCutEvent = YES;
                                        else if (!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport))
                                            return;
                                        else if (!KeyCodesWithoutKeyPressEvents[_keyCode] && (_keyCode == CTRL_KEY_CODE || !(modifierFlags & CPControlKeyMask)))
                                            return;
            case CPDOMEventKeyPress:
                                        if ((aDOMEvent.target || aDOMEvent.srcElement) == _DOMPasteboardElement)
                                            return;
                                        var keyCode = _keyCode,
                                            charCode = aDOMEvent.keyCode || aDOMEvent.charCode,
                                            isARepeat = (_charCodes[keyCode] != nil);
                                        _charCodes[keyCode] = charCode;
                                        var characters = String.fromCharCode(charCode),
                                            charactersIgnoringModifiers = characters.toLowerCase();
                                        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyDown, location, modifierFlags, timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, isARepeat, keyCode);
                                        if (isNativePasteEvent)
                                        {
                                            _pasteboardKeyDownEvent = event;
                                            window.setTimeout(function () { objj_msgSend(self, "_checkPasteboardElement") }, 0);
                                            return;
                                        }
                                        break;
            case CPDOMEventKeyUp: var keyCode = aDOMEvent.keyCode,
                                            charCode = _charCodes[keyCode];
                                        _charCodes[keyCode] = nil;
                                        var characters = String.fromCharCode(charCode),
                                            charactersIgnoringModifiers = characters.toLowerCase();
                                        if (!(modifierFlags & CPShiftKeyMask))
                                            characters = charactersIgnoringModifiers;
                                        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, location, modifierFlags, timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, NO, keyCode);
                                        break;
        }
        if (event)
        {
            event._DOMEvent = aDOMEvent;
            objj_msgSend(CPApp, "sendEvent:", event);
            if (isNativeCopyOrCutEvent)
            {
                var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard"),
                    types = objj_msgSend(pasteboard, "types");
                if (types.length)
                {
                    if (objj_msgSend(types, "indexOfObjectIdenticalTo:", CPStringPboardType) != CPNotFound)
                        _DOMPasteboardElement.value = objj_msgSend(pasteboard, "stringForType:", CPStringPboardType);
                    else
                        _DOMPasteboardElement.value = objj_msgSend(pasteboard, "_generateStateUID");
                    _DOMPasteboardElement.select();
                    window.setTimeout(function() { objj_msgSend(self, "_clearPasteboardElement"); }, 0);
                }
                return;
            }
        }
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
});
instance_methods[8] = new objj_method(sel_registerName("_bridgeScrollEvent:"), function $CPDOMWindowBridge___bridgeScrollEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    if(!aDOMEvent)
        aDOMEvent = window.event;
    try
    {
        var deltaX = 0.0,
            deltaY = 0.0,
            windowNumber = 0,
            location = CGPointMake(_currentMousePosition.x, _currentMousePosition.y),
            timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
            modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                            (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                            (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                            (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
        StopDOMEventPropagation = YES;
        windowNumber = objj_msgSend(objj_msgSend(self, "hitTest:", location), "windowNumber");
        if (!windowNumber)
            return;
        var windowFrame = CPApp._windows[windowNumber]._frame;
        location.x -= CGRectGetMinX(windowFrame);
        location.y -= CGRectGetMinY(windowFrame);
        if(typeof aDOMEvent.wheelDeltaX != "undefined")
        {
            deltaX = aDOMEvent.wheelDeltaX / 120.0;
            deltaY = aDOMEvent.wheelDeltaY / 120.0;
        }
        else if (aDOMEvent.wheelDelta)
            deltaY = aDOMEvent.wheelDelta / 120.0;
        else if (aDOMEvent.detail)
            deltaY = -aDOMEvent.detail / 3.0;
        else
            return;
        if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues))
        {
            deltaX = -deltaX;
            deltaY = -deltaY;
        }
        var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPScrollWheel, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0);
        event._DOMEvent = aDOMEvent;
        event._deltaX = ROUND(deltaX * 1.5);
        event._deltaY = ROUND(deltaY * 1.5);
        objj_msgSend(CPApp, "sendEvent:", event);
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
});
instance_methods[9] = new objj_method(sel_registerName("_bridgeResizeEvent:"), function $CPDOMWindowBridge___bridgeResizeEvent_(self, _cmd, aDOMEvent)
{ with(self)
{
    try
    {
        var oldSize = _frame.size;
        _frame = CPDOMWindowGetFrame(_DOMWindow);
        _contentBounds.size = CGSizeCreateCopy(_frame.size);
        var levels = _windowLevels,
            layers = _windowLayers,
            levelCount = levels.length;
        while (levelCount--)
        {
            var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
                windowCount = windows.length;
            while (windowCount--)
                objj_msgSend(windows[windowCount], "resizeWithOldBridgeSize:", oldSize);
        }
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
});
instance_methods[10] = new objj_method(sel_registerName("_checkPasteboardElement"), function $CPDOMWindowBridge___checkPasteboardElement(self, _cmd)
{ with(self)
{
    try
    {
        var value = _DOMPasteboardElement.value;
        if (objj_msgSend(value, "length"))
        {
            var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
            if (objj_msgSend(pasteboard, "_stateUID") != value)
            {
                objj_msgSend(pasteboard, "declareTypes:owner:", [CPStringPboardType], self);
                objj_msgSend(pasteboard, "setString:forType:", value, CPStringPboardType);
            }
        }
        objj_msgSend(self, "_clearPasteboardElement");
        objj_msgSend(CPApp, "sendEvent:", _pasteboardKeyDownEvent);
        _pasteboardKeyDownEvent = nil;
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
});
instance_methods[11] = new objj_method(sel_registerName("_clearPasteboardElement"), function $CPDOMWindowBridge___clearPasteboardElement(self, _cmd)
{ with(self)
{
    _DOMPasteboardElement.value = "";
    _DOMPasteboardElement.blur();
}
});
class_addMethods(the_class, instance_methods);
}
var CLICK_SPACE_DELTA = 5.0,
    CLICK_TIME_DELTA = document.addEventListener ? 350.0 : 1000.0;
var CPDOMEventGetClickCount = function(aComparisonEvent, aTimestamp, aLocation)
{
    if (!aComparisonEvent)
        return 1;
    var comparisonLocation = objj_msgSend(aComparisonEvent, "locationInWindow");
    return (aTimestamp - objj_msgSend(aComparisonEvent, "timestamp") < CLICK_TIME_DELTA &&
        ABS(comparisonLocation.x - aLocation.x) < CLICK_SPACE_DELTA &&
        ABS(comparisonLocation.y - aLocation.y) < CLICK_SPACE_DELTA) ? objj_msgSend(aComparisonEvent, "clickCount") + 1 : 1;
}
var CPDOMEventStop = function(aDOMEvent)
{
    aDOMEvent.cancelBubble = true;
    aDOMEvent.returnValue = false;
    if (aDOMEvent.preventDefault)
        aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
        aDOMEvent.stopPropagation();
    if (aDOMEvent.type == CPDOMEventMouseDown)
    {
        CPSharedDOMWindowBridge._DOMFocusElement.focus();
        CPSharedDOMWindowBridge._DOMFocusElement.blur();
    }
}

p;18;CPDOMWindowLayer.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jc;3331;
{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_level"), new objj_ivar("_windows"), new objj_ivar("_DOMElement")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithLevel:"), function $CPDOMWindowLayer__initWithLevel_(self, _cmd, aLevel)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _level = aLevel;
        _windows = [];
        _DOMElement = document.createElement("div");
        _DOMElement.style.position = "absolute";
        _DOMElement.style.top = "0px";
        _DOMElement.style.left = "0px";
        _DOMElement.style.width = "1px";
        _DOMElement.style.height = "1px";
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("level"), function $CPDOMWindowLayer__level(self, _cmd)
{ with(self)
{
    return _level;
}
});
instance_methods[2] = new objj_method(sel_registerName("removeWindow:"), function $CPDOMWindowLayer__removeWindow_(self, _cmd, aWindow)
{ with(self)
{
    var index = aWindow._index,
        count = _windows.length - 1;
    CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 8; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = aWindow._DOMElement;;
    objj_msgSend(_windows, "removeObjectAtIndex:", aWindow._index);
    for (; index < count; ++index)
    {
        _windows[index]._index = index;
        _windows[index]._DOMElement.style.zIndex = index;
    }
    aWindow._isVisible = NO;
}
});
instance_methods[3] = new objj_method(sel_registerName("insertWindow:atIndex:"), function $CPDOMWindowLayer__insertWindow_atIndex_(self, _cmd, aWindow, anIndex)
{ with(self)
{
    var count = objj_msgSend(_windows, "count"),
        zIndex = (anIndex == CPNotFound ? count : anIndex),
        isVisible = aWindow._isVisible;
    if (isVisible)
    {
        zIndex = MIN(zIndex, aWindow._index);
        objj_msgSend(_windows, "removeObjectAtIndex:", aWindow._index);
    }
    else
        ++count;
    if (anIndex == CPNotFound || anIndex >= count)
        objj_msgSend(_windows, "addObject:", aWindow);
    else
        objj_msgSend(_windows, "insertObject:atIndex:", aWindow, anIndex);
    for (; zIndex < count; ++zIndex)
    {
        _windows[zIndex]._index = zIndex;
        _windows[zIndex]._DOMElement.style.zIndex = zIndex;
    }
    if (!isVisible)
    {
        if (aWindow._DOMElement.CPDOMDisplayContext) aWindow._DOMElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 6; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = aWindow._DOMElement;;
        aWindow._isVisible = YES;
        if (objj_msgSend(aWindow, "styleMask") & CPBorderlessBridgeWindowMask)
            objj_msgSend(aWindow, "setFrame:", objj_msgSend(aWindow._bridge, "contentBounds"));
    }
}
});
class_addMethods(the_class, instance_methods);
}

p;14;CPDragServer.jI;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;11342;
var CPSharedDragServer = nil;
var CPDragServerView = nil,
    CPDragServerSource = nil,
    CPDragServerWindow = nil,
    CPDragServerOffset = nil,
    CPDragServerLocation = nil,
    CPDragServerPasteboard = nil,
    CPDragServerDestination = nil,
    CPDragServerDraggingInfo = nil;
var CPDragServerIsDraggingImage = NO,
    CPDragServerShouldSendDraggedViewMovedTo = NO,
    CPDragServerShouldSendDraggedImageMovedTo = NO,
    CPDragServerShouldSendDraggedViewEndedAtOperation = NO,
    CPDragServerShouldSendDraggedImageEndedAtOperation = NO;
var CPDragServerStartDragging = function(anEvent)
{
    CPDragServerUpdateDragging(anEvent);
}
var CPDragServerUpdateDragging = function(anEvent)
{
    if(objj_msgSend(anEvent, "type") == CPLeftMouseUp)
    {
        CPDragServerLocation = objj_msgSend(objj_msgSend(CPDragServerDestination, "window"), "convertBridgeToBase:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")));
        objj_msgSend(CPDragServerView, "removeFromSuperview");
        objj_msgSend(CPSharedDragServer._dragWindow, "orderOut:", nil);
        if (CPDragServerDestination &&
            (!objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_registerName("prepareForDragOperation:")) || objj_msgSend(CPDragServerDestination, "prepareForDragOperation:", CPDragServerDraggingInfo)) &&
            (!objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_registerName("performDragOperation:")) || objj_msgSend(CPDragServerDestination, "performDragOperation:", CPDragServerDraggingInfo)) &&
            objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_registerName("concludeDragOperation:")))
            objj_msgSend(CPDragServerDestination, "concludeDragOperation:", CPDragServerDraggingInfo);
        if (CPDragServerShouldSendDraggedImageEndedAtOperation)
            objj_msgSend(CPDragServerSource, "draggedImage:endedAt:operation:", objj_msgSend(CPDragServerView, "image"), CPDragServerLocation, NO);
        else if (CPDragServerShouldSendDraggedViewEndedAtOperation)
            objj_msgSend(CPDragServerSource, "draggedView:endedAt:operation:", CPDragServerView, CPDragServerLocation, NO);
        CPDragServerIsDraggingImage = NO;
        CPDragServerDestination = nil;
        return;
    }
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", CPDragServerUpdateDragging, CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, 0, NO);
    var location = objj_msgSend(anEvent, "locationInWindow"),
        operation =
        bridgeLocation = objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", location);
    var draggingDestination = objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_dragHitTest:pasteboard:", bridgeLocation, CPDragServerPasteboard);
    CPDragServerLocation = objj_msgSend(objj_msgSend(CPDragServerDestination, "window"), "convertBridgeToBase:", bridgeLocation);
    if(draggingDestination != CPDragServerDestination)
    {
        if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_registerName("draggingExited:")))
            objj_msgSend(CPDragServerDestination, "draggingExited:", CPDragServerDraggingInfo);
        CPDragServerDestination = draggingDestination;
        if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_registerName("draggingEntered:")))
            objj_msgSend(CPDragServerDestination, "draggingEntered:", CPDragServerDraggingInfo);
    }
    else if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_registerName("draggingUpdated:")))
        objj_msgSend(CPDragServerDestination, "draggingUpdated:", CPDragServerDraggingInfo);
    location.x -= CPDragServerOffset.x;
    location.y -= CPDragServerOffset.y;
    objj_msgSend(CPDragServerView, "setFrameOrigin:", location);
    if (CPDragServerShouldSendDraggedImageMovedTo)
        objj_msgSend(CPDragServerSource, "draggedImage:movedTo:", objj_msgSend(CPDragServerView, "image"), location);
    else if (CPDragServerShouldSendDraggedViewMovedTo)
        objj_msgSend(CPDragServerSource, "draggedView:movedTo:", CPDragServerView, location);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDraggingInfo"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithWindow:"), function $CPDraggingInfo__initWithWindow_(self, _cmd, aWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _window = aWindow;
    return this;
}
});
instance_methods[1] = new objj_method(sel_registerName("draggingSource"), function $CPDraggingInfo__draggingSource(self, _cmd)
{ with(self)
{
    return CPDragServerSource;
}
});
instance_methods[2] = new objj_method(sel_registerName("draggingLocation"), function $CPDraggingInfo__draggingLocation(self, _cmd)
{ with(self)
{
    return CPDragServerLocation;
}
});
instance_methods[3] = new objj_method(sel_registerName("draggingPasteboard"), function $CPDraggingInfo__draggingPasteboard(self, _cmd)
{ with(self)
{
    return CPDragServerPasteboard;
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDragServer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dragWindow"), new objj_ivar("_imageView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPDragServer__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPDragServer, "class"))
        return;
    CPDragServerDraggingInfo = objj_msgSend(objj_msgSend(CPDraggingInfo, "alloc"), "init");
}
});
class_methods[1] = new objj_method(sel_registerName("sharedDragServer"), function $CPDragServer__sharedDragServer(self, _cmd)
{ with(self)
{
    if (!CPSharedDragServer)
        CPSharedDragServer = objj_msgSend(objj_msgSend(CPDragServer, "alloc"), "init");
    return CPSharedDragServer;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CPDragServer__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _dragWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CPRectMakeZero(), CPBorderlessWindowMask);
        objj_msgSend(_dragWindow, "setLevel:", CPDraggingWindowLevel);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragView_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aWindow, viewLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    var eventLocation = objj_msgSend(anEvent, "locationInWindow");
    CPDragServerView = aView;
    CPDragServerSource = aSourceObject;
    CPDragServerWindow = aWindow;
    CPDragServerOffset = CPPointMake(eventLocation.x - viewLocation.x, eventLocation.y - viewLocation.y);
    CPDragServerPasteboard = objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard);
    objj_msgSend(_dragWindow, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "frame").size));
    objj_msgSend(_dragWindow, "orderFront:", self);
    objj_msgSend(aView, "setFrameOrigin:", viewLocation);
    objj_msgSend(objj_msgSend(_dragWindow, "contentView"), "addSubview:", aView);
    if (CPDragServerIsDraggingImage)
    {
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_registerName("draggedImage:beganAt:")))
            objj_msgSend(CPDragServerSource, "draggedImage:beganAt:", objj_msgSend(aView, "image"), viewLocation);
        CPDragServerShouldSendDraggedImageMovedTo = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_registerName("draggedImage:movedTo:"));
        CPDragServerShouldSendDraggedImageEndedAtOperation = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_registerName("draggedImage:endAt:operation:"));
        CPDragServerShouldSendDraggedViewMovedTo = NO;
        CPDragServerShouldSendDraggedViewEndedAtOperation = NO;
    }
    else
    {
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_registerName("draggedView:beganAt:")))
            objj_msgSend(CPDragServerSource, "draggedView:beganAt:", aView, viewLocation);
        CPDragServerShouldSendDraggedViewMovedTo = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_registerName("draggedView:movedTo:"));
        CPDragServerShouldSendDraggedViewEndedAtOperation = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_registerName("draggedView:endedAt:operation:"));
        CPDragServerShouldSendDraggedImageMovedTo = NO;
        CPDragServerShouldSendDraggedImageEndedAtOperation = NO;
    }
    CPDragServerStartDragging(anEvent);
}
});
instance_methods[2] = new objj_method(sel_registerName("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function $CPDragServer__dragImage_fromWindow_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    CPDragServerIsDraggingImage = YES;
    if (!_imageView)
        _imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CPRectMakeZero());
    objj_msgSend(_imageView, "setImage:", anImage);
    objj_msgSend(_imageView, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(anImage, "size")));
    objj_msgSend(self, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", _imageView, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_dragHitTest:pasteboard:"), function $CPView___dragHitTest_pasteboard_(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    if(!CPRectContainsPoint(_frame, aPoint) || self == CPDragServerView)
        return nil;
    var view = nil,
        i = objj_msgSend(_subviews, "count"),
        adjustedPoint = CPPointMake(aPoint.x - CPRectGetMinX(_frame), aPoint.y - CPRectGetMinY(_frame));
    while (i--)
        if (view = objj_msgSend(_subviews[i], "_dragHitTest:pasteboard:", adjustedPoint, aPasteboard))
            return view;
    if (objj_msgSend(aPasteboard, "availableTypeFromArray:", _registeredDraggedTypes))
        return self;
    return nil;
}
});
class_addMethods(the_class, instance_methods);
}

p;9;CPEvent.jI;21;Foundation/CPObject.jc;11727;
CPLeftMouseDown = 1;
CPLeftMouseUp = 2;
CPRightMouseDown = 3;
CPRightMouseUp = 4;
CPMouseMoved = 5;
CPLeftMouseDragged = 6;
CPRightMouseDragged = 7;
CPMouseEntered = 8;
CPMouseExited = 9;
CPKeyDown = 10;
CPKeyUp = 11;
CPFlagsChanged = 12;
CPAppKitDefined = 13;
CPSystemDefined = 14;
CPApplicationDefined = 15;
CPPeriodic = 16;
CPCursorUpdate = 17;
CPScrollWheel = 22;
CPOtherMouseDown = 25;
CPOtherMouseUp = 26;
CPOtherMouseDragged = 27;
CPAlphaShiftKeyMask = 1 << 16;
CPShiftKeyMask = 1 << 17;
CPControlKeyMask = 1 << 18;
CPAlternateKeyMask = 1 << 19;
CPCommandKeyMask = 1 << 20;
CPNumericPadKeyMask = 1 << 21;
CPHelpKeyMask = 1 << 22;
CPFunctionKeyMask = 1 << 23;
CPDeviceIndependentModifierFlagsMask = 0xffff0000;
CPLeftMouseDownMask = 1 << CPLeftMouseDown;
CPLeftMouseUpMask = 1 << CPLeftMouseUp;
CPRightMouseDownMask = 1 << CPRightMouseDown;
CPRightMouseUpMask = 1 << CPRightMouseUp;
CPOtherMouseDownMask = 1 << CPOtherMouseDown;
CPOtherMouseUpMask = 1 << CPOtherMouseUp;
CPMouseMovedMask = 1 << CPMouseMoved;
CPLeftMouseDraggedMask = 1 << CPLeftMouseDragged;
CPRightMouseDraggedMask = 1 << CPRightMouseDragged;
CPOtherMouseDragged = 1 << CPOtherMouseDragged;
CPMouseEnteredMask = 1 << CPMouseEntered;
CPMouseExitedMask = 1 << CPMouseExited;
CPCursorUpdateMask = 1 << CPCursorUpdate;
CPKeyDownMask = 1 << CPKeyDown;
CPKeyUpMask = 1 << CPKeyUp;
CPFlagsChangedMask = 1 << CPFlagsChanged;
CPAppKitDefinedMask = 1 << CPAppKitDefined;
CPSystemDefinedMask = 1 << CPSystemDefined;
CPApplicationDefinedMask = 1 << CPApplicationDefined;
CPPeriodicMask = 1 << CPPeriodic;
CPScrollWheelMask = 1 << CPScrollWheel;
CPAnyEventMask = 0xffffffff;
CPDOMEventDoubleClick = "dblclick",
CPDOMEventMouseDown = "mousedown",
CPDOMEventMouseUp = "mouseup",
CPDOMEventMouseMoved = "mousemove",
CPDOMEventMouseDragged = "mousedrag",
CPDOMEventKeyUp = "keyup",
CPDOMEventKeyDown = "keydown",
CPDOMEventKeyPress = "keypress";
CPDOMEventCopy = "copy";
CPDOMEventPaste = "paste";
CPDOMEventScrollWheel = "mousewheel";
var _CPEventPeriodicEventPeriod = 0,
    _CPEventPeriodicEventTimer = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPEvent"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_type"), new objj_ivar("_location"), new objj_ivar("_modifierFlags"), new objj_ivar("_timestamp"), new objj_ivar("_context"), new objj_ivar("_eventNumber"), new objj_ivar("_clickCount"), new objj_ivar("_pressure"), new objj_ivar("_window"), new objj_ivar("_characters"), new objj_ivar("_charactersIgnoringModifiers"), new objj_ivar("_isARepeat"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEvent"), new objj_ivar("_deltaX"), new objj_ivar("_deltaY"), new objj_ivar("_deltaZ")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function $CPEvent__keyEventWithType_location_modifierFlags_timestamp_windowNumber_context_characters_charactersIgnoringModifiers_isARepeat_keyCode_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code);
}
});
class_methods[1] = new objj_method(sel_registerName("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function $CPEvent__mouseEventWithType_location_modifierFlags_timestamp_windowNumber_context_eventNumber_clickCount_pressure_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure);
}
});
class_methods[2] = new objj_method(sel_registerName("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function $CPEvent__otherEventWithType_location_modifierFlags_timestamp_windowNumber_context_subtype_data1_data2_(self, _cmd, anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function $CPEvent___initMouseEventWithType_location_modifierFlags_timestamp_windowNumber_context_eventNumber_clickCount_pressure_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _type = anEventType;
        _location = CPPointCreateCopy(aPoint);
        _modifierFlags = modifierFlags;
        _timestamp = aTimestamp;
        _context = aGraphicsContext;
        _eventNumber = anEventNumber;
        _clickCount = aClickCount;
        _pressure = aPressure;
        _window = objj_msgSend(CPApp, "windowWithWindowNumber:", aWindowNumber);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function $CPEvent___initKeyEventWithType_location_modifierFlags_timestamp_windowNumber_context_characters_charactersIgnoringModifiers_isARepeat_keyCode_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, isARepeat, code)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _type = anEventType;
        _location = CPPointCreateCopy(aPoint);
        _modifierFlags = modifierFlags;
        _timestamp = aTimestamp;
        _context = aGraphicsContext;
        _characters = characters;
        _charactersIgnoringModifiers = unmodCharacters;
        _isARepeat = isARepeat;
        _keyCode = code;
        _window = objj_msgSend(CPApp, "windowWithWindowNumber:", aWindowNumber);
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function $CPEvent___initOtherEventWithType_location_modifierFlags_timestamp_windowNumber_context_subtype_data1_data2_(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _type = anEventType;
        _location = CPPointCreateCopy(aPoint);
        _modifierFlags = modifierFlags;
        _timestamp = aTimestamp;
        _context = aGraphicsContext;
        _subtype = aSubtype;
        _data1 = aData1;
        _data2 = aData2;
    }
    return self;
}
});
instance_methods[3] = new objj_method(sel_registerName("locationInWindow"), function $CPEvent__locationInWindow(self, _cmd)
{ with(self)
{
    return _location;
}
});
instance_methods[4] = new objj_method(sel_registerName("modifierFlags"), function $CPEvent__modifierFlags(self, _cmd)
{ with(self)
{
    return _modifierFlags;
}
});
instance_methods[5] = new objj_method(sel_registerName("timestamp"), function $CPEvent__timestamp(self, _cmd)
{ with(self)
{
    return _timestamp;
}
});
instance_methods[6] = new objj_method(sel_registerName("type"), function $CPEvent__type(self, _cmd)
{ with(self)
{
    return _type;
}
});
instance_methods[7] = new objj_method(sel_registerName("window"), function $CPEvent__window(self, _cmd)
{ with(self)
{
    return _window;
}
});
instance_methods[8] = new objj_method(sel_registerName("windowNumber"), function $CPEvent__windowNumber(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
});
instance_methods[9] = new objj_method(sel_registerName("buttonNumber"), function $CPEvent__buttonNumber(self, _cmd)
{ with(self)
{
    return _buttonNumber;
}
});
instance_methods[10] = new objj_method(sel_registerName("clickCount"), function $CPEvent__clickCount(self, _cmd)
{ with(self)
{
    return _clickCount;
}
});
instance_methods[11] = new objj_method(sel_registerName("characters"), function $CPEvent__characters(self, _cmd)
{ with(self)
{
    return _characters;
}
});
instance_methods[12] = new objj_method(sel_registerName("charactersIgnoringModifiers"), function $CPEvent__charactersIgnoringModifiers(self, _cmd)
{ with(self)
{
    return _charactersIgnoringModifiers;
}
});
instance_methods[13] = new objj_method(sel_registerName("isARepeat"), function $CPEvent__isARepeat(self, _cmd)
{ with(self)
{
    return _isARepeat;
}
});
instance_methods[14] = new objj_method(sel_registerName("keyCode"), function $CPEvent__keyCode(self, _cmd)
{ with(self)
{
    return _keyCode;
}
});
instance_methods[15] = new objj_method(sel_registerName("pressure"), function $CPEvent__pressure(self, _cmd)
{ with(self)
{
    return _pressure;
}
});
instance_methods[16] = new objj_method(sel_registerName("_DOMEvent"), function $CPEvent___DOMEvent(self, _cmd)
{ with(self)
{
    return _DOMEvent;
}
});
instance_methods[17] = new objj_method(sel_registerName("deltaX"), function $CPEvent__deltaX(self, _cmd)
{ with(self)
{
    return _deltaX;
}
});
instance_methods[18] = new objj_method(sel_registerName("deltaY"), function $CPEvent__deltaY(self, _cmd)
{ with(self)
{
    return _deltaY;
}
});
instance_methods[19] = new objj_method(sel_registerName("deltaZ"), function $CPEvent__deltaZ(self, _cmd)
{ with(self)
{
    return _deltaZ;
}
});
class_methods[3] = new objj_method(sel_registerName("startPeriodicEventsAfterDelay:withPeriod:"), function $CPEvent__startPeriodicEventsAfterDelay_withPeriod_(self, _cmd, aDelay, aPeriod)
{ with(self)
{
    _CPEventPeriodicEventPeriod = aPeriod;
    _CPEventPeriodicEventTimer = window.setTimeout(function() { _CPEventPeriodicEventTimer = window.setInterval(_CPEventFirePeriodEvent, aPeriod * 1000.0); }, aDelay * 1000.0);
}
});
class_methods[4] = new objj_method(sel_registerName("stopPeriodicEvents"), function $CPEvent__stopPeriodicEvents(self, _cmd)
{ with(self)
{
    if (_CPEventPeriodicEventTimer === nil)
        return;
    window.clearTimeout(_CPEventPeriodicEventTimer);
    _CPEventPeriodicEventTimer = nil;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
_CPEventFirePeriodEvent= function()
{
    objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", CPPeriodic, {x:0.0,y:0.0}, 0, 0, 0, nil, 0, 0, 0));
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
}

p;14;CPFlashMovie.jI;21;Foundation/CPObject.jc;977;
{var the_class = objj_allocateClassPair(CPObject, "CPFlashMovie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fileName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("flashMovieWithFile:"), function $CPFlashMovie__flashMovieWithFile_(self, _cmd, aFileName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFile:", aFileName);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFile:"), function $CPFlashMovie__initWithFile_(self, _cmd, aFileName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _fileName = aFileName;
    return self;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;13;CPFlashView.ji;19;CPDOMWindowBridge.ji;14;CPFlashMovie.ji;8;CPView.jc;2990;
{var the_class = objj_allocateClassPair(CPView, "CPFlashView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie"), new objj_ivar("_DOMEmbedElement"), new objj_ivar("_DOMMParamElement"), new objj_ivar("_DOMObjectElement")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPFlashView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _DOMObjectElement = document.createElement("object");
        _DOMObjectElement.width = "100%";
        _DOMObjectElement.height = "100%";
        _DOMObjectElement.style.top = "0px";
        _DOMObjectElement.style.left = "0px";
        _DOMParamElement = document.createElement("param");
        _DOMParamElement.name = "movie";
        _DOMObjectElement.appendChild(_DOMParamElement);
        var param = document.createElement("param");
        param.name = "wmode";
        param.value = "transparent";
        _DOMObjectElement.appendChild(param);
        _DOMEmbedElement = document.createElement("embed");
        _DOMEmbedElement.type = "application/x-shockwave-flash";
        _DOMEmbedElement.wmode = "transparent";
        _DOMEmbedElement.width = "100%";
        _DOMEmbedElement.height = "100%";
        _DOMElement.appendChild(_DOMEmbedElement);
        _DOMElement.appendChild(_DOMObjectElement);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setFlashMovie:"), function $CPFlashView__setFlashMovie_(self, _cmd, aFlashMovie)
{ with(self)
{
    if (_flashMovie == aFlashMovie)
        return;
    _flashMovie = aFlashMovie;
    _DOMParamElement.value = aFlashMovie._fileName;
    if (_DOMEmbedElement)
       _DOMEmbedElement.src = aFlashMovie._fileName;
}
});
instance_methods[2] = new objj_method(sel_registerName("flashMovie"), function $CPFlashView__flashMovie(self, _cmd)
{ with(self)
{
    return _flashMovie;
}
});
instance_methods[3] = new objj_method(sel_registerName("mouseDragged:"), function $CPFlashView__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
}
});
instance_methods[4] = new objj_method(sel_registerName("mouseDown:"), function $CPFlashView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
}
});
instance_methods[5] = new objj_method(sel_registerName("mouseUp:"), function $CPFlashView__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
}
});
class_addMethods(the_class, instance_methods);
}

p;8;CPFont.jc;4002;var _CPFonts = {};
    _CPFontSystemFontFace = "Arial";
{var the_class = objj_allocateClassPair(CPObject, "CPFont"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_size"), new objj_ivar("_isBold"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("fontWithName:size:"), function $CPFont__fontWithName_size_(self, _cmd, aName, aSize)
{ with(self)
{
    return _CPFonts[(NO?"bold ":"")+ROUND(aSize)+"px '"+aName+"'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", aName, aSize, NO);
}
});
class_methods[1] = new objj_method(sel_registerName("boldFontWithName:size:"), function $CPFont__boldFontWithName_size_(self, _cmd, aName, aSize)
{ with(self)
{
    return _CPFonts[(YES?"bold ":"")+ROUND(aSize)+"px '"+aName+"'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", aName, aSize, YES);
}
});
class_methods[2] = new objj_method(sel_registerName("systemFontOfSize:"), function $CPFont__systemFontOfSize_(self, _cmd, aSize)
{ with(self)
{
    return _CPFonts[(NO?"bold ":"")+ROUND(aSize)+"px '"+_CPFontSystemFontFace+"'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", _CPFontSystemFontFace, aSize, NO);
}
});
class_methods[3] = new objj_method(sel_registerName("boldSystemFontOfSize:"), function $CPFont__boldSystemFontOfSize_(self, _cmd, aSize)
{ with(self)
{
    return _CPFonts[(YES?"bold ":"")+ROUND(aSize)+"px '"+_CPFontSystemFontFace+"'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", _CPFontSystemFontFace, aSize, YES);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_initWithName:size:bold:"), function $CPFont___initWithName_size_bold_(self, _cmd, aName, aSize, isBold)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _size = aSize;
        _isBold = isBold;
        _cssString = (_isBold ? "bold " : "") + ROUND(aSize) + "px '" + aName + "'";
        _CPFonts[_cssString] = self;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("size"), function $CPFont__size(self, _cmd)
{ with(self)
{
    return _size;
}
});
instance_methods[2] = new objj_method(sel_registerName("cssString"), function $CPFont__cssString(self, _cmd)
{ with(self)
{
    return _cssString;
}
});
instance_methods[3] = new objj_method(sel_registerName("familyName"), function $CPFont__familyName(self, _cmd)
{ with(self)
{
    return _name;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPFontNameKey = "CPFontNameKey",
    CPFontSizeKey = "CPFontSizeKey",
    CPFontIsBoldKey = "CPFontIsBoldKey";
{
var the_class = objj_getClass("CPFont")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPFont\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPFont__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "_initWithName:size:bold:", objj_msgSend(aCoder, "decodeObjectForKey:", CPFontNameKey), objj_msgSend(aCoder, "decodeFloatForKey:", CPFontSizeKey), objj_msgSend(aCoder, "decodeBoolForKey:", CPFontIsBoldKey));
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPFont__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPFontNameKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _size, CPFontSizeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isBold, CPFontIsBoldKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;15;CPFontManager.jI;21;Foundation/CPObject.jI;15;AppKit/CPFont.jc;4861;
var CPSharedFontManager = nil,
    CPFontManagerFactory = Nil;
{var the_class = objj_allocateClassPair(CPObject, "CPFontManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_availableFonts")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("sharedFontManager"), function $CPFontManager__sharedFontManager(self, _cmd)
{ with(self)
{
    if (!CPSharedFontManager)
        CPSharedFontManager = objj_msgSend(objj_msgSend(CPFontManagerFactory, "alloc"), "init");
    return CPSharedFontManager;
}
});
class_methods[1] = new objj_method(sel_registerName("setFontManagerFactory:"), function $CPFontManager__setFontManagerFactory_(self, _cmd, aClass)
{ with(self)
{
    CPFontManagerFactory = aClass;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("availableFonts"), function $CPFontManager__availableFonts(self, _cmd)
{ with(self)
{
    if (!_availableFonts)
    {
        _CPFontDetectSpan = document.createElement("span");
        _CPFontDetectSpan.fontSize = "24px";
        _CPFontDetectSpan.appendChild(document.createTextNode("mmmmmmmmmml"));
        var div = document.createElement("div");
        div.style.position = "absolute";
        div.style.top = "-1000px";
        div.appendChild(_CPFontDetectSpan);
        document.getElementsByTagName("body")[0].appendChild(div);
    _CPFontDetectReferenceFonts = _CPFontDetectPickTwoDifferentFonts(["monospace","serif","sans-serif","cursive"]);
        _availableFonts = [];
        for (var i = 0; i < _CPFontDetectAllFonts.length; i++) {
            var available = _CPFontDetectFontAvailable(_CPFontDetectAllFonts[i]);
      if (available)
                _availableFonts.push(_CPFontDetectAllFonts[i]);
        }
    }
    return _availableFonts;
}
});
instance_methods[1] = new objj_method(sel_registerName("fontWithNameIsAvailable:"), function $CPFontManager__fontWithNameIsAvailable_(self, _cmd, aFontName)
{ with(self)
{
    return _CPFontDetectFontAvailable(aFontName);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var _CPFontDetectSpan,
    _CPFontDetectReferenceFonts,
    _CPFontDetectAllFonts = ["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _CPFontDetectFontAvailable = function(font) {
 for (var i = 0; i < _CPFontDetectReferenceFonts.length; i++)
  if (_CPFontDetectCompareFonts(_CPFontDetectReferenceFonts[i], font))
   return true;
 return false;
}
var _CPFontDetectCache = {};
var _CPFontDetectCompareFonts = function(fontA, fontB) {
    var a;
    if (_CPFontDetectCache[fontA]) {
        a = _CPFontDetectCache[fontA];
    } else {
     _CPFontDetectSpan.style.fontFamily = '"' + fontA + '"';
        _CPFontDetectCache[fontA] = a = { w: _CPFontDetectSpan.offsetWidth, h: _CPFontDetectSpan.offsetHeight };
    }
 _CPFontDetectSpan.style.fontFamily= '"' + fontB + '", "' + fontA + '"';
 var bWidth = _CPFontDetectSpan.offsetWidth;
 var bHeight = _CPFontDetectSpan.offsetHeight;
 return (a.w != bWidth || a.h != bHeight);
}
var _CPFontDetectPickTwoDifferentFonts = function(candidates) {
 for (var i = 0; i < candidates.length; i++)
  for (var j = 0; j < i; j++)
   if (_CPFontDetectCompareFonts(candidates[i], candidates[j]))
    return [candidates[i],candidates[j]];
 return [candidates[0]];
}
objj_msgSend(CPFontManager, "setFontManagerFactory:", objj_msgSend(CPFontManager, "class"));

p;12;CPGeometry.ji;12;CGGeometry.jc;5420;
CPMinXEdge = 0;
CPMinYEdge = 1;
CPMaxXEdge = 2;
CPMaxYEdge = 3;
CPMakePoint = CGPointMake;
CPMakeSize = CGSizeMake;
CPMakeRect = CGRectMake;
CPPointCreateCopy= function(aPoint)
{
    return { x: aPoint.x, y: aPoint.y };
}
CPPointMake= function(x, y)
{
    return { x: x, y: y };
}
CPRectInset= function(aRect, dX, dY)
{
    return CPRectMake( aRect.origin.x + dX, aRect.origin.y + dY,
                        aRect.size.width - 2 * dX, aRect.size.height - 2*dY);
}
CPRectIntegral= function(aRect)
{
    alert("CPRectIntegral unimplemented");
}
CPRectIntersection= function(lhsRect, rhsRect)
{
    var intersection = CPRectMake(
        Math.max(CPRectGetMinX(lhsRect), CPRectGetMinX(rhsRect)),
        Math.max(CPRectGetMinY(lhsRect), CPRectGetMinY(rhsRect)),
        0, 0);
    intersection.size.width = Math.min(CPRectGetMaxX(lhsRect), CPRectGetMaxX(rhsRect)) - CPRectGetMinX(intersection);
    intersection.size.height = Math.min(CPRectGetMaxY(lhsRect), CPRectGetMaxY(rhsRect)) - CPRectGetMinY(intersection);
    return CPRectIsEmpty(intersection) ? CPRectMakeZero() : intersection;
}
CPRectCreateCopy= function(aRect)
{
    return { origin: CPPointCreateCopy(aRect.origin), size: CPSizeCreateCopy(aRect.size) };
}
CPRectMake= function(x, y, width, height)
{
    return { origin: CPPointMake(x, y), size: CPSizeMake(width, height) };
}
CPRectOffset= function(aRect, dX, dY)
{
    return CPRectMake(aRect.origin.x + dX, aRect.origin.y + dY, aRect.size.width, aRect.size.height);
}
CPRectStandardize= function(aRect)
{
    var width = CPRectGetWidth(aRect),
        height = CPRectGetHeight(aRect),
        standardized = CPRectCreateCopy(aRect);
    if (width < 0.0)
    {
        standardized.origin.x += width;
        standardized.size.width = -width;
    }
    if (height < 0.0)
    {
        standardized.origin.y += height;
        standardized.size.height = -height;
    }
    return standardized;
}
CPRectUnion= function(lhsRect, rhsRect)
{
    var minX = Math.min(CPRectGetMinX(lhsRect), CPRectGetMinX(rhsRect)),
        minY = Math.min(CPRectGetMinY(lhsRect), CPRectGetMinY(rhsRect)),
        maxX = Math.max(CPRectGetMaxX(lhsRect), CPRectGetMaxX(rhsRect)),
        maxY = Math.max(CPRectGetMaxY(lhsRect), CPRectGetMaxY(rhsRect));
    return CPRectMake(minX, minY, maxX - minX, maxY - minY);
}
CPSizeCreateCopy= function(aSize)
{
    return { width: aSize.width, height: aSize.height };
}
CPSizeMake= function(width, height)
{
    return { width: width, height: height };
}
CPRectContainsPoint= function(aRect, aPoint)
{
    return aPoint.x >= CPRectGetMinX(aRect) &&
            aPoint.y >= CPRectGetMinY(aRect) &&
      aPoint.x < CPRectGetMaxX(aRect) &&
      aPoint.y < CPRectGetMaxY(aRect);
}
CPRectContainsRect= function(lhsRect, rhsRect)
{
    return CPRectEqualToRect(CPUnionRect(lhsRect, rhsRect), rhsRect);
}
CPPointEqualToPoint= function(lhsPoint, rhsPoint)
{
    return lhsPoint.x == rhsPoint.x && lhsPoint.y == rhsPoint.y;
}
CPRectEqualToRect= function(lhsRect, rhsRect)
{
    return CPPointEqualToPoint(lhsRect.origin, rhsRect.origin) &&
            CPSizeEqualToSize(lhsRect.size, rhsRect.size);
}
CPRectGetHeight= function(aRect)
{
    return aRect.size.height;
}
CPRectGetMaxX= function(aRect)
{
    return aRect.origin.x + aRect.size.width;
}
CPRectGetMaxY= function(aRect)
{
    return aRect.origin.y + aRect.size.height;
}
CPRectGetMidX= function(aRect)
{
    return aRect.origin.x + (aRect.size.width) / 2.0;
}
CPRectGetMidY= function(aRect)
{
    return aRect.origin.y + (aRect.size.height) / 2.0;
}
CPRectGetMinX= function(aRect)
{
    return aRect.origin.x;
}
CPRectGetMinY= function(aRect)
{
    return aRect.origin.y;
}
CPRectGetWidth= function(aRect)
{
    return aRect.size.width;
}
CPRectIntersectsRect= function(lhsRect, rhsRect)
{
    return !CPRectIsEmpty(CPRectIntersection(lhsRect, rhsRect));
}
CPRectIsEmpty= function(aRect)
{
    return aRect.size.width <= 0.0 || aRect.size.height <= 0.0;
}
CPRectIsNull= function(aRect)
{
    return aRect.size.width <= 0.0 || aRect.size.height <= 0.0;
}
CPSizeEqualToSize= function(lhsSize, rhsSize)
{
    return lhsSize.width == rhsSize.width && lhsSize.height == rhsSize.height;
}
CPStringFromPoint= function(aPoint)
{
    return "{" + aPoint.x + ", " + aPoint.y + "}";
}
CPStringFromSize= function(aSize)
{
    return "{" + aSize.width + ", " + aSize.height + "}";
}
CPStringFromRect= function(aRect)
{
    return "{" + CPStringFromPoint(aRect.origin) + ", " + CPStringFromSize(aRect.size) + "}";
}
CPPointFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { x:parseInt(aString.substr(1, comma - 1)), y:parseInt(aString.substring(comma + 1, aString.length)) };
}
CPSizeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { width:parseInt(aString.substr(1, comma - 1)), height:parseInt(aString.substring(comma + 1, aString.length)) };
}
CPRectFromString= function(aString)
{
    var comma = aString.indexOf(',', aString.indexOf(',') + 1);
    return { origin:CPPointFromString(aString.substr(1, comma - 1)), size:CPSizeFromString(aString.substring(comma + 2, aString.length)) };
}
CPPointFromEvent= function(anEvent)
{
    return CPPointMake(anEvent.clientX, anEvent.clientY, 0);
}
CPSizeMakeZero= function()
{
    return CPSizeMake(0, 0);
}
CPRectMakeZero= function()
{
    return CPRectMake(0, 0, 0, 0);
}
CPPointMakeZero= function()
{
    return CPPointMake(0, 0, 0);
}

p;19;CPGraphicsContext.jc;1695;var CPGraphicsContextCurrent = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPGraphicsContext"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_graphicsPort")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("currentContext"), function $CPGraphicsContext__currentContext(self, _cmd)
{ with(self)
{
    return CPGraphicsContextCurrent;
}
});
class_methods[1] = new objj_method(sel_registerName("setCurrentContext:"), function $CPGraphicsContext__setCurrentContext_(self, _cmd, aGraphicsContext)
{ with(self)
{
    CPGraphicsContextCurrent = aGraphicsContext;
}
});
class_methods[2] = new objj_method(sel_registerName("graphicsContextWithGraphicsPort:flipped:"), function $CPGraphicsContext__graphicsContextWithGraphicsPort_flipped_(self, _cmd, aContext, aFlag)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithGraphicsPort:", aContext);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithGraphicsPort:"), function $CPGraphicsContext__initWithGraphicsPort_(self, _cmd, aGraphicsPort)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _graphicsPort = aGraphicsPort;
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("graphicsPort"), function $CPGraphicsContext__graphicsPort(self, _cmd)
{ with(self)
{
    return _graphicsPort;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;9;CPImage.jI;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;11921;
CPImageLoadStatusInitialized = 0;
CPImageLoadStatusLoading = 1;
CPImageLoadStatusCompleted = 2;
CPImageLoadStatusCancelled = 3;
CPImageLoadStatusInvalidData = 4;
CPImageLoadStatusUnexpectedEOF = 5;
CPImageLoadStatusReadError = 6;
CPImageDidLoadNotification = "CPImageDidLoadNotification";
{
var the_class = objj_getClass("CPBundle")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPBundle\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("pathForResource:"), function $CPBundle__pathForResource_(self, _cmd, aFilename)
{ with(self)
{
    return objj_msgSend(self, "bundlePath") + "Resources/" + aFilename;
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPObject, "CPImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_size"), new objj_ivar("_filename"), new objj_ivar("_delegate"), new objj_ivar("_loadStatus"), new objj_ivar("_image")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initByReferencingFile:size:"), function $CPImage__initByReferencingFile_size_(self, _cmd, aFilename, aSize)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _size = CPSizeCreateCopy(aSize);
        _filename = aFilename;
        _loadStatus = CPImageLoadStatusInitialized;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithContentsOfFile:size:"), function $CPImage__initWithContentsOfFile_size_(self, _cmd, aFilename, aSize)
{ with(self)
{
    self = objj_msgSend(self, "initByReferencingFile:size:", aFilename, aSize);
    if (self)
        objj_msgSend(self, "load");
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("initWithContentsOfFile:"), function $CPImage__initWithContentsOfFile_(self, _cmd, aFilename)
{ with(self)
{
    self = objj_msgSend(self, "initByReferencingFile:size:", aFilename, CGSizeMake(-1,-1));
    if (self)
        objj_msgSend(self, "load");
    return self;
}
});
instance_methods[3] = new objj_method(sel_registerName("filename"), function $CPImage__filename(self, _cmd)
{ with(self)
{
    return _filename;
}
});
instance_methods[4] = new objj_method(sel_registerName("setSize:"), function $CPImage__setSize_(self, _cmd, aSize)
{ with(self)
{
    _size = CGSizeMakeCopy(aSize);
}
});
instance_methods[5] = new objj_method(sel_registerName("size"), function $CPImage__size(self, _cmd)
{ with(self)
{
    return _size;
}
});
instance_methods[6] = new objj_method(sel_registerName("setDelegate:"), function $CPImage__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
});
instance_methods[7] = new objj_method(sel_registerName("delegate"), function $CPImage__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[8] = new objj_method(sel_registerName("loadStatus"), function $CPImage__loadStatus(self, _cmd)
{ with(self)
{
    return _loadStatus;
}
});
instance_methods[9] = new objj_method(sel_registerName("load"), function $CPImage__load(self, _cmd)
{ with(self)
{
    if (_loadStatus == CPImageLoadStatusLoading || _loadStatus == CPImageLoadStatusCompleted)
        return;
    _loadStatus = CPImageLoadStatusLoading;
    _image = new Image();
    var isSynchronous = YES;
    _image.onload = function () { if (isSynchronous) window.setTimeout(function() { objj_msgSend(self, "_imageDidLoad") }, 0); else objj_msgSend(self, "_imageDidLoad"); }
    _image.onerror = function () { if (isSynchronous) window.setTimeout(function() { objj_msgSend(self, "_imageDidError") }, 0); else objj_msgSend(self, "_imageDidError"); }
    _image.onabort = function () { if (isSynchronous) window.setTimeout(function() { objj_msgSend(self, "_imageDidAbort") }, 0); else objj_msgSend(self, "_imageDidAbort"); }
    _image.src = _filename;
    isSynchronous = NO;
}
});
instance_methods[10] = new objj_method(sel_registerName("isThreePartImage"), function $CPImage__isThreePartImage(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[11] = new objj_method(sel_registerName("isNinePartImage"), function $CPImage__isNinePartImage(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[12] = new objj_method(sel_registerName("_imageDidLoad"), function $CPImage___imageDidLoad(self, _cmd)
{ with(self)
{
    _loadStatus = CPImageLoadStatusCompleted;
    if (!_size || (_size.width == -1 && _size.height == -1))
        _size = CGSizeMake(_image.width, _image.height);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPImageDidLoadNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("imageDidLoad:")))
        objj_msgSend(_delegate, "imageDidLoad:", self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
}
});
instance_methods[13] = new objj_method(sel_registerName("_imageDidError"), function $CPImage___imageDidError(self, _cmd)
{ with(self)
{
    _loadStatus = CPImageLoadStatusReadError;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("imageDidError:")))
        objj_msgSend(_delegate, "imageDidError:", self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
}
});
instance_methods[14] = new objj_method(sel_registerName("_imageDidAbort"), function $CPImage___imageDidAbort(self, _cmd)
{ with(self)
{
    _loadStatus = CPImageLoadStatusCancelled;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("imageDidAbort:")))
        objj_msgSend(_delegate, "imageDidAbort:", self);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
}
});
class_addMethods(the_class, instance_methods);
}
{
var the_class = objj_getClass("CPImage")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPImage\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPImage__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "initWithContentsOfFile:size:", objj_msgSend(aCoder, "decodeObjectForKey:", "CPFilename"), objj_msgSend(aCoder, "decodeSizeForKey:", "CPSize"));
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPImage__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _filename, "CPFilename");
    objj_msgSend(aCoder, "encodeSize:forKey:", _size, "CPSize");
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPObject, "CPThreePartImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageSlices"), new objj_ivar("_isVertical")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithImageSlices:isVertical:"), function $CPThreePartImage__initWithImageSlices_isVertical_(self, _cmd, imageSlices, isVertical)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _imageSlices = imageSlices;
        _isVertical = isVertical;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("imageSlices"), function $CPThreePartImage__imageSlices(self, _cmd)
{ with(self)
{
    return _imageSlices;
}
});
instance_methods[2] = new objj_method(sel_registerName("isVertical"), function $CPThreePartImage__isVertical(self, _cmd)
{ with(self)
{
    return _isVertical;
}
});
instance_methods[3] = new objj_method(sel_registerName("isThreePartImage"), function $CPThreePartImage__isThreePartImage(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[4] = new objj_method(sel_registerName("isNinePartImage"), function $CPThreePartImage__isNinePartImage(self, _cmd)
{ with(self)
{
    return NO;
}
});
class_addMethods(the_class, instance_methods);
}
var CPThreePartImageImageSlicesKey = "CPThreePartImageImageSlicesKey",
    CPThreePartImageIsVerticalKey = "CPThreePartImageIsVerticalKey";
{
var the_class = objj_getClass("CPThreePartImage")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPThreePartImage\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPThreePartImage__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _imageSlices = objj_msgSend(aCoder, "decodeObjectForKey:", CPThreePartImageImageSlicesKey);
        _isVertical = objj_msgSend(aCoder, "decodeBoolForKey:", CPThreePartImageIsVerticalKey);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPThreePartImage__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _imageSlices, CPThreePartImageImageSlicesKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isVertical, CPThreePartImageIsVerticalKey);
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPObject, "CPNinePartImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageSlices")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithImageSlices:"), function $CPNinePartImage__initWithImageSlices_(self, _cmd, imageSlices)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _imageSlices = imageSlices;
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("imageSlices"), function $CPNinePartImage__imageSlices(self, _cmd)
{ with(self)
{
    return _imageSlices;
}
});
instance_methods[2] = new objj_method(sel_registerName("isThreePartImage"), function $CPNinePartImage__isThreePartImage(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[3] = new objj_method(sel_registerName("isNinePartImage"), function $CPNinePartImage__isNinePartImage(self, _cmd)
{ with(self)
{
    return YES;
}
});
class_addMethods(the_class, instance_methods);
}
var CPNinePartImageImageSlicesKey = "CPNinePartImageImageSlicesKey";
{
var the_class = objj_getClass("CPNinePartImage")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPNinePartImage\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPNinePartImage__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _imageSlices = objj_msgSend(aCoder, "decodeObjectForKey:", CPNinePartImageImageSlicesKey);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPNinePartImage__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _imageSlices, CPNinePartImageImageSlicesKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;13;CPImageView.jI;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;10170;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
var CPImageViewShadowBackgroundColor = nil;
var LEFT_SHADOW_INSET = 3.0,
    RIGHT_SHADOW_INSET = 3.0,
    TOP_SHADOW_INSET = 3.0,
    BOTTOM_SHADOW_INSET = 5.0,
    VERTICAL_SHADOW_INSET = TOP_SHADOW_INSET + BOTTOM_SHADOW_INSET,
    HORIZONTAL_SHADOW_INSET = LEFT_SHADOW_INSET + RIGHT_SHADOW_INSET;
{var the_class = objj_allocateClassPair(CPControl, "CPImageView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_image"), new objj_ivar("_DOMImageElement"), new objj_ivar("_imageScaling"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowView"), new objj_ivar("_imageRect")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPImageView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("image"), function $CPImageView__image(self, _cmd)
{ with(self)
{
    return _image;
}
});
instance_methods[2] = new objj_method(sel_registerName("setImage:"), function $CPImageView__setImage_(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    var center = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_image)
        objj_msgSend(center, "removeObserver:name:object:", self, CPImageDidLoadNotification, _image);
    _image = anImage;
    _DOMImageElement.src = objj_msgSend(anImage, "filename");
    var size = objj_msgSend(_image, "size");
    if (size && size.width == -1 && size.height == -1)
    {
        objj_msgSend(center, "addObserver:selector:name:object:", self, sel_registerName("imageDidLoad:"), CPImageDidLoadNotification, _image);
        _DOMImageElement.width = 0;
        _DOMImageElement.height = 0;
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self, "hideOrDisplayContents");
        objj_msgSend(self, "tile");
    }
}
});
instance_methods[3] = new objj_method(sel_registerName("imageDidLoad:"), function $CPImageView__imageDidLoad_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "hideOrDisplayContents");
    objj_msgSend(self, "tile");
}
});
instance_methods[4] = new objj_method(sel_registerName("hasShadow"), function $CPImageView__hasShadow(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
});
instance_methods[5] = new objj_method(sel_registerName("setHasShadow:"), function $CPImageView__setHasShadow_(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow == shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        _shadowView = objj_msgSend(objj_msgSend(CPShadowView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _shadowView);
        objj_msgSend(self, "tile");
    }
    else
    {
        objj_msgSend(_shadowView, "removeFromSuperview");
        _shadowView = nil;
    }
    objj_msgSend(self, "hideOrDisplayContents");
}
});
instance_methods[6] = new objj_method(sel_registerName("setImageScaling:"), function $CPImageView__setImageScaling_(self, _cmd, anImageScaling)
{ with(self)
{
    if (_imageScaling == anImageScaling)
        return;
    _imageScaling = anImageScaling;
    if (_imageScaling == CPScaleToFit)
    {
        if (!_DOMImageElement.CPDOMDisplayContext) _DOMImageElement.CPDOMDisplayContext = []; var __index = _DOMImageElement.CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageElement.CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index+1] = _DOMImageElement; CPDOMDisplayServerInstructions[__index+2] = NULL; CPDOMDisplayServerInstructions[__index+3] = 0.0; CPDOMDisplayServerInstructions[__index+4] = 0.0;;
    }
    objj_msgSend(self, "tile");
}
});
instance_methods[7] = new objj_method(sel_registerName("imageScaling"), function $CPImageView__imageScaling(self, _cmd)
{ with(self)
{
    return _imageScaling;
}
});
instance_methods[8] = new objj_method(sel_registerName("setFrameSize:"), function $CPImageView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(self, "tile");
}
});
instance_methods[9] = new objj_method(sel_registerName("hideOrDisplayContents"), function $CPImageView__hideOrDisplayContents(self, _cmd)
{ with(self)
{
    if (!_image)
    {
        _DOMImageElement.style.visibility = "hidden";
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        _DOMImageElement.style.visibility = "visible";
        objj_msgSend(_shadowView, "setHidden:", NO);
    }
}
});
instance_methods[10] = new objj_method(sel_registerName("imageRect"), function $CPImageView__imageRect(self, _cmd)
{ with(self)
{
    return _imageRect;
}
});
instance_methods[11] = new objj_method(sel_registerName("tile"), function $CPImageView__tile(self, _cmd)
{ with(self)
{
    if (!_image)
        return;
    var bounds = objj_msgSend(self, "bounds"),
        x = 0.0,
        y = 0.0,
        insetWidth = (_hasShadow ? HORIZONTAL_SHADOW_INSET : 0.0),
        insetHeight = (_hasShadow ? VERTICAL_SHADOW_INSET : 0.0),
        boundsWidth = (bounds.size.width),
        boundsHeight = (bounds.size.height),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;
    if (_imageScaling == CPScaleToFit)
    {
        _DOMImageElement.width = ROUND(width);
        _DOMImageElement.height = ROUND(height);
    }
    else
    {
        var size = objj_msgSend(_image, "size");
        if (size.width == -1 && size.height == -1)
            return;
        if (_imageScaling == CPScaleProportionally)
        {
            if (width >= size.width && height >= size.height)
            {
                width = size.width;
                height = size.height;
            }
            else
            {
                var imageRatio = size.width / size.height,
                    viewRatio = width / height;
                if (viewRatio > imageRatio)
                    width = height * imageRatio;
                else
                    height = width / imageRatio;
            }
            _DOMImageElement.width = ROUND(width);
            _DOMImageElement.height = ROUND(height);
        }
        else
        {
            width = size.width;
            height = size.height;
        }
        if (_imageScaling == CPScaleNone)
        {
            _DOMImageElement.width = ROUND(size.width);
            _DOMImageElement.height = ROUND(size.height);
        }
        var x = (boundsWidth - width) / 2.0,
            y = (boundsHeight - height) / 2.0;
        if (!_DOMImageElement.CPDOMDisplayContext) _DOMImageElement.CPDOMDisplayContext = []; var __index = _DOMImageElement.CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageElement.CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index+1] = _DOMImageElement; CPDOMDisplayServerInstructions[__index+2] = NULL; CPDOMDisplayServerInstructions[__index+3] = x; CPDOMDisplayServerInstructions[__index+4] = y;;
    }
    _imageRect = { origin: { x:x, y:y }, size: { width:width, height:height } };
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrame:", {origin:{x:x-LEFT_SHADOW_INSET,y:y-TOP_SHADOW_INSET},size:{width:width+insetWidth,height:height+insetHeight}});
}
});
class_addMethods(the_class, instance_methods);
}
var CPImageViewImageKey = "CPImageViewImageKey",
    CPImageViewImageScalingKey = "CPImageViewImageScalingKey",
    CPImageViewHasShadowKey = "CPImageViewHasShadowKey";
{
var the_class = objj_getClass("CPImageView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPImageView\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPImageView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _DOMImageElement = document.createElement("img");
        _DOMImageElement.style.position = "absolute";
        _DOMImageElement.style.left = "0px";
        _DOMImageElement.style.top = "0px";
        _DOMElement.appendChild(_DOMImageElement);
        _DOMImageElement.style.visibility = "hidden";
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPImageViewImageKey));
        objj_msgSend(self, "setImageScaling:", objj_msgSend(aCoder, "decodeIntForKey:", CPImageViewImageScalingKey));
        objj_msgSend(self, "setHasShadow:", objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey));
        objj_msgSend(self, "tile");
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPImageView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_shadowView)
    {
        var actualSubviews = _subviews;
        _subviews = objj_msgSend(_subviews, "copy");
        objj_msgSend(_subviews, "removeObjectIdenticalTo:", _shadowView);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    if (_shadowView)
        _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPImageViewImageKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _imageScaling, CPImageViewImageScalingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasShadow, CPImageViewHasShadowKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;20;CPKulerColorPicker.jI;23;Foundation/Foundation.ji;8;CPView.ji;10;CPButton.ji;9;CPImage.ji;13;CPImageView.ji;15;CPColorPicker.ji;14;CPColorPanel.ji;11;CPTabView.ji;15;CPTabViewItem.jc;15036;
{var the_class = objj_allocateClassPair(CPColorPicker, "CPKulerColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_tabView"), new objj_ivar("_searchView"), new objj_ivar("_popularView"), new objj_ivar("_searchView"), new objj_ivar("_FIXME_searchField"), new objj_ivar("_searchConnection"), new objj_ivar("_popularConnection")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithPickerMask:colorPanel:"), function $CPKulerColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask, owningColorPanel);
}
});
instance_methods[1] = new objj_method(sel_registerName("initView"), function $CPKulerColorPicker__initView(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    _tabView = objj_msgSend(objj_msgSend(CPTabView, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,CGRectGetWidth(aFrame),CGRectGetHeight(aFrame)-20));
    objj_msgSend(_tabView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    objj_msgSend(_tabView, "setDelegate:", self);
    objj_msgSend(_contentView, "addSubview:", _tabView);
    var label = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CPRectMake((CPColorPickerViewWidth-150)/2,CPColorPickerViewHeight-20,150,20));
    objj_msgSend(label, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin);
    objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 10.0));
    objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(label, "setTitle:", "Powered by Adobe Kuler");
    objj_msgSend(label, "setTarget:", self);
    objj_msgSend(label, "setAction:", sel_registerName("openKulerLink:"));
    objj_msgSend(label, "setBordered:", NO);
    objj_msgSend(_contentView, "addSubview:", label);
    var searchThemeView = objj_msgSend(objj_msgSend(_CPKulerThemeView, "alloc"), "initWithFrame:", CPRectMake(0,0,aFrame.size.width,0));
    objj_msgSend(searchThemeView, "setDelegate:", self);
    objj_msgSend(searchThemeView, "setAutoresizingMask:", CPViewWidthSizable);
    _searchView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CPRectMake(0,0,aFrame.size.width,CPColorPickerViewHeight-10));
    objj_msgSend(_searchView, "setDocumentView:", searchThemeView);
    objj_msgSend(_searchView, "setHasHorizontalScroller:", NO);
    objj_msgSend(_searchView, "setAutoresizingMask:", (CPViewWidthSizable|CPViewHeightSizable));
    objj_msgSend(objj_msgSend(_searchView, "verticalScroller"), "setControlSize:", CPSmallControlSize);
    objj_msgSend(_searchView, "setAutohidesScrollers:", YES);
    var auxiliarySearchView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,CPColorPickerViewWidth,26.0));
    objj_msgSend(auxiliarySearchView, "setAutoresizingMask:", (CPViewMinYMargin|CPViewWidthSizable));
    _FIXME_searchField = document.createElement("input");
    if(!window.addEventListener)
        _FIXME_searchField.type = "text";
    else
        _FIXME_searchField.type = "search";
    _FIXME_searchField.style.position = "absolute";
    _FIXME_searchField.style.width = "96%";
    _FIXME_searchField.style.left = "2%";
    _FIXME_searchField.style.top = "2px";
    _FIXME_searchField.onkeypress = function(aDOMEvent)
    {
        aDOMEvent = aDOMEvent || window.event;
        if (aDOMEvent.keyCode == 13)
        {
            objj_msgSend(self, "search");
            if(aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            else if(aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
            _FIXME_searchField.blur();
        }
    };
    auxiliarySearchView._DOMElement.appendChild(_FIXME_searchField);
    var popularThemeView = objj_msgSend(objj_msgSend(_CPKulerThemeView, "alloc"), "initWithFrame:", CPRectMake(0,0,aFrame.size.width,0));
    objj_msgSend(popularThemeView, "setDelegate:", self);
    objj_msgSend(popularThemeView, "setAutoresizingMask:", CPViewWidthSizable);
    _popularView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CPRectMake(0,0,aFrame.size.width,CPColorPickerViewHeight));
    objj_msgSend(_popularView, "setDocumentView:", popularThemeView);
    objj_msgSend(_popularView, "setHasHorizontalScroller:", NO);
    objj_msgSend(_popularView, "setAutoresizingMask:", (CPViewWidthSizable|CPViewHeightSizable));
    objj_msgSend(objj_msgSend(_popularView, "verticalScroller"), "setControlSize:", CPSmallControlSize);
    objj_msgSend(_popularView, "setAutohidesScrollers:", YES);
    var mostPopularItem = objj_msgSend(objj_msgSend(CPTabViewItem, "alloc"), "initWithIdentifier:", "Popular");
    var searchItem = objj_msgSend(objj_msgSend(CPTabViewItem, "alloc"), "initWithIdentifier:", "Search");
    objj_msgSend(searchItem, "setLabel:", "Search");
    objj_msgSend(searchItem, "setView:", _searchView);
    objj_msgSend(searchItem, "setAuxiliaryView:", auxiliarySearchView);
    objj_msgSend(mostPopularItem, "setLabel:", "Popular");
    objj_msgSend(mostPopularItem, "setView:", _popularView);
    objj_msgSend(_tabView, "addTabViewItem:", mostPopularItem);
    objj_msgSend(_tabView, "addTabViewItem:", searchItem);
    objj_msgSend(self, "popularThemes");
}
});
instance_methods[2] = new objj_method(sel_registerName("openKulerLink:"), function $CPKulerColorPicker__openKulerLink_(self, _cmd, sender)
{ with(self)
{
    window.open("http://kuler.adobe.com");
}
});
instance_methods[3] = new objj_method(sel_registerName("provideNewView:"), function $CPKulerColorPicker__provideNewView_(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _contentView;
}
});
instance_methods[4] = new objj_method(sel_registerName("currentMode"), function $CPKulerColorPicker__currentMode(self, _cmd)
{ with(self)
{
    return CPKulerColorPickerMode;
}
});
instance_methods[5] = new objj_method(sel_registerName("supportsMode:"), function $CPKulerColorPicker__supportsMode_(self, _cmd, mode)
{ with(self)
{
    return (mode == CPKulerColorPickerMode) ? YES : NO;
}
});
instance_methods[6] = new objj_method(sel_registerName("search"), function $CPKulerColorPicker__search(self, _cmd)
{ with(self)
{
    var query = escape(_FIXME_searchField.value);
    if(query.replace("%20", "") == "")
        return;
    objj_msgSend(_searchConnection, "cancel");
    _searchConnection = nil;
    _searchConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", BASE_URL+"kuler.php?mode=search&query="+query), self);
}
});
instance_methods[7] = new objj_method(sel_registerName("popularThemes"), function $CPKulerColorPicker__popularThemes(self, _cmd)
{ with(self)
{
    objj_msgSend(_popularConnection, "cancel");
    _popularConnection = nil;
    _popularConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", BASE_URL+"kuler.php?mode=popular"), self);
}
});
instance_methods[8] = new objj_method(sel_registerName("connection:didReceiveData:"), function $CPKulerColorPicker__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
    var data = CPJSObjectCreateWithJSON(data);
    if(!data)
        var themes = [];
    else
        var themes = data.result;
    if(aConnection == _popularConnection)
        objj_msgSend(objj_msgSend(_popularView, "documentView"), "setThemes:", themes);
    if(aConnection == _searchConnection)
        objj_msgSend(objj_msgSend(_searchView, "documentView"), "setThemes:", themes);
}
});
instance_methods[9] = new objj_method(sel_registerName("connection:didFailWithError:"), function $CPKulerColorPicker__connection_didFailWithError_(self, _cmd, aConnection, anError)
{ with(self)
{
    objj_msgSend(self, "connectionDidFinishLoading:", aConnection);
}
});
instance_methods[10] = new objj_method(sel_registerName("connectionDidFinishLoading:"), function $CPKulerColorPicker__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{}
});
instance_methods[11] = new objj_method(sel_registerName("chooseColor:"), function $CPKulerColorPicker__chooseColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", aColor);
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPView, "_CPKulerThemeView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_themes"), new objj_ivar("_delegate"), new objj_ivar("_alternateBGColor")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPKulerThemeView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    _alternateBGColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 241.0/255.0, 245.0/255.0, 250.0/255.0, 1.0);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("delegate"), function $_CPKulerThemeView__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[2] = new objj_method(sel_registerName("setDelegate:"), function $_CPKulerThemeView__setDelegate_(self, _cmd, delegate)
{ with(self)
{
    _delegate = delegate;
}
});
instance_methods[3] = new objj_method(sel_registerName("themes"), function $_CPKulerThemeView__themes(self, _cmd)
{ with(self)
{
    return _themes;
}
});
instance_methods[4] = new objj_method(sel_registerName("setThemes:"), function $_CPKulerThemeView__setThemes_(self, _cmd, themes)
{ with(self)
{
    _themes = themes;
    objj_msgSend(self, "updateDisplay");
}
});
instance_methods[5] = new objj_method(sel_registerName("updateDisplay"), function $_CPKulerThemeView__updateDisplay(self, _cmd)
{ with(self)
{
    var width = objj_msgSend(self, "frame").size.width;
    var subviews = objj_msgSend(self, "subviews");
    for(var i = objj_msgSend(subviews, "count")-1; i >= 0; --i)
        objj_msgSend(subviews[i], "removeFromSuperview");
    for(var i=0, count = objj_msgSend(_themes, "count"); i<count; i++)
    {
        var swatches = _themes[i].swatches;
        var containerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(0,1+20*i,width,20));
        objj_msgSend(containerView, "setAutoresizingMask:", CPViewWidthSizable);
        for(var j=0; j<swatches.length; j++)
        {
            var outerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2+20*j,1,18,18)),
                innerView = objj_msgSend(objj_msgSend(_CPColorView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(outerView, "bounds"),1.0,1.0));
            objj_msgSend(innerView, "setTarget:", self);
            objj_msgSend(innerView, "setAction:", sel_registerName("selectedColor:"));
            objj_msgSend(innerView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", swatches[j].hexColor));
            objj_msgSend(outerView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
            objj_msgSend(outerView, "addSubview:", innerView);
            objj_msgSend(containerView, "addSubview:", outerView);
        }
        var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(102,0,width-102,20));
        objj_msgSend(label, "setStringValue:", _themes[i].title);
        objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(label, "setLineBreakMode:", CPLineBreakByTruncatingTail);
        objj_msgSend(label, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(containerView, "addSubview:", label);
        if(i%2 == 1)
            objj_msgSend(containerView, "setBackgroundColor:", _alternateBGColor);
        objj_msgSend(self, "addSubview:", containerView);
    }
    objj_msgSend(self, "setFrameSize:", CPSizeMake(width,(count)*20+2));
}
});
instance_methods[6] = new objj_method(sel_registerName("selectedColor:"), function $_CPKulerThemeView__selectedColor_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(_delegate, "chooseColor:", objj_msgSend(sender, "backgroundColor"));
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPControl, "_CPColorView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPColorView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("mouseDragged:"), function $_CPColorView__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var bounds = CPRectMake(0, 0, 15, 15),
        point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    var outerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", bounds),
        innerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(outerView, "bounds"),1.0,1.0));
    objj_msgSend(innerView, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    objj_msgSend(outerView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(outerView, "addSubview:", innerView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", outerView, CPPointMake(point.x-bounds.size.width/2.0,point.y-bounds.size.height/2.0), CPPointMake(0.0,0.0), anEvent, nil, self, YES);
}
});
instance_methods[2] = new objj_method(sel_registerName("pasteboard:provideDataForType:"), function $_CPColorView__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self, "backgroundColor"), aType);
}
});
class_addMethods(the_class, instance_methods);
}

p;8;CPMenu.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;22;_CPImageAndTitleView.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;58064;
CPMenuDidAddItemNotification = "CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification = "CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification = "CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification = "CPMenuDidEndTrackingNotification";
var MENUBAR_HEIGHT = 19.0;
var _CPMenuBarVisible = NO,
    _CPMenuBarTitle = "",
    _CPMenuBarIconImage = nil,
    _CPMenuBarIconImageAlphaValue = 1.0,
    _CPMenuBarSharedWindow = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_title"), new objj_ivar("_items"), new objj_ivar("_attachedMenu"), new objj_ivar("_autoenablesItems"), new objj_ivar("_showsStateColumn"), new objj_ivar("_delegate"), new objj_ivar("_highlightedIndex"), new objj_ivar("_menuWindow")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("menuBarVisible"), function $CPMenu__menuBarVisible(self, _cmd)
{ with(self)
{
    return _CPMenuBarVisible;
}
});
class_methods[1] = new objj_method(sel_registerName("setMenuBarVisible:"), function $CPMenu__setMenuBarVisible_(self, _cmd, menuBarShouldBeVisible)
{ with(self)
{
    if (_CPMenuBarVisible == menuBarShouldBeVisible)
        return;
    _CPMenuBarVisible = menuBarShouldBeVisible;
    if (menuBarShouldBeVisible)
    {
        if (!_CPMenuBarSharedWindow)
            _CPMenuBarSharedWindow = objj_msgSend(objj_msgSend(_CPMenuBarWindow, "alloc"), "init");
        objj_msgSend(_CPMenuBarSharedWindow, "setMenu:", objj_msgSend(CPApp, "mainMenu"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", _CPMenuBarIconImage);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", _CPMenuBarIconImageAlphaValue);
        objj_msgSend(_CPMenuBarSharedWindow, "orderFront:", self);
    }
    else
        objj_msgSend(_CPMenuBarWindow, "orderOut:", self);
}
});
class_methods[2] = new objj_method(sel_registerName("setMenuBarTitle:"), function $CPMenu__setMenuBarTitle_(self, _cmd, aTitle)
{ with(self)
{
    _CPMenuBarTitle = aTitle;
    objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
}
});
class_methods[3] = new objj_method(sel_registerName("menuBarTitle"), function $CPMenu__menuBarTitle(self, _cmd)
{ with(self)
{
    return _CPMenuBarTitle;
}
});
class_methods[4] = new objj_method(sel_registerName("setMenuBarIconImage:"), function $CPMenu__setMenuBarIconImage_(self, _cmd, anImage)
{ with(self)
{
    _CPMenuBarImage = anImage;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", anImage);
}
});
class_methods[5] = new objj_method(sel_registerName("menuBarIconImage"), function $CPMenu__menuBarIconImage(self, _cmd)
{ with(self)
{
    return _CPMenuBarImage;
}
});
class_methods[6] = new objj_method(sel_registerName("_setMenuBarIconImageAlphaValue:"), function $CPMenu___setMenuBarIconImageAlphaValue_(self, _cmd, anAlphaValue)
{ with(self)
{
    _CPMenuBarIconImageAlphaValue = anAlphaValue;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", anAlphaValue);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("menuBarHeight"), function $CPMenu__menuBarHeight(self, _cmd)
{ with(self)
{
    if (self == objj_msgSend(CPApp, "mainMenu"))
        return MENUBAR_HEIGHT;
    return 0.0;
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithTitle:"), function $CPMenu__initWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = aTitle;
        _items = [];
        _autoenablesItems = YES;
        _showsStateColumn = YES;
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("insertItem:atIndex:"), function $CPMenu__insertItem_atIndex_(self, _cmd, aMenuItem, anIndex)
{ with(self)
{
    var menu = objj_msgSend(aMenuItem, "menu");
    if (menu)
        if (menu != self)
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Attempted to insert item into menu that was already in another menu.");
        else
            return;
    objj_msgSend(aMenuItem, "setMenu:", self);
    objj_msgSend(_items, "insertObject:atIndex:", aMenuItem, anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidAddItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
});
instance_methods[3] = new objj_method(sel_registerName("insertItemWithTitle:action:keyEquivalent:atIndex:"), function $CPMenu__insertItemWithTitle_action_keyEquivalent_atIndex_(self, _cmd, aTitle, anAction, aKeyEquivalent, anIndex)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", aTitle, anAction, aKeyEquivalent);
    objj_msgSend(self, "insertItem:atIndex:", item, anIndex);
    return item;
}
});
instance_methods[4] = new objj_method(sel_registerName("addItem:"), function $CPMenu__addItem_(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "insertItem:atIndex:", aMenuItem, objj_msgSend(_items, "count"));
}
});
instance_methods[5] = new objj_method(sel_registerName("addItemWithTitle:action:keyEquivalent:"), function $CPMenu__addItemWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    return objj_msgSend(self, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, anAction, aKeyEquivalent, objj_msgSend(_items, "count"));
}
});
instance_methods[6] = new objj_method(sel_registerName("removeItem:"), function $CPMenu__removeItem_(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem));
}
});
instance_methods[7] = new objj_method(sel_registerName("removeItemAtIndex:"), function $CPMenu__removeItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex < 0 || anIndex >= _items.length)
        return;
    objj_msgSend(_items[anIndex], "setMenu:", nil);
    objj_msgSend(_items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidRemoveItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
});
instance_methods[8] = new objj_method(sel_registerName("itemChanged:"), function $CPMenu__itemChanged_(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidChangeItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem), "CPMenuItemIndex"));
}
});
instance_methods[9] = new objj_method(sel_registerName("menuWithTag:"), function $CPMenu__menuWithTag_(self, _cmd, aTag)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTag:", aTag);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
});
instance_methods[10] = new objj_method(sel_registerName("menuWithTitle:"), function $CPMenu__menuWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
});
instance_methods[11] = new objj_method(sel_registerName("itemAtIndex:"), function $CPMenu__itemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_items, "objectAtIndex:", anIndex);
}
});
instance_methods[12] = new objj_method(sel_registerName("numberOfItems"), function $CPMenu__numberOfItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_items, "count");
}
});
instance_methods[13] = new objj_method(sel_registerName("itemArray"), function $CPMenu__itemArray(self, _cmd)
{ with(self)
{
    return _items;
}
});
instance_methods[14] = new objj_method(sel_registerName("indexOfItem:"), function $CPMenu__indexOfItem_(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return CPNotFound;
    return objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem);
}
});
instance_methods[15] = new objj_method(sel_registerName("indexOfItemWithTitle:"), function $CPMenu__indexOfItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "title") === aTitle)
            return index;
    return CPNotFound;
}
});
instance_methods[16] = new objj_method(sel_registerName("indexOfItemWithTag:"), function $CPMenu__indexOfItemWithTag_(self, _cmd, aTag)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "tag") == aTag)
            return index;
    return CPNotFound;
}
});
instance_methods[17] = new objj_method(sel_registerName("indexOfItemWithTarget:andAction:"), function $CPMenu__indexOfItemWithTarget_andAction_(self, _cmd, aTarget, anAction)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
    {
        var item = _items[index];
        if (objj_msgSend(item, "target") == aTarget && (!anAction || objj_msgSend(item, "action") == anAction))
            return index;
    }
    return CPNotFound;
}
});
instance_methods[18] = new objj_method(sel_registerName("indexOfItemWithRepresentedObject:"), function $CPMenu__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_items[index], "representedObject"), "isEqual:", anObject))
            return index;
    return CPNotFound;
}
});
instance_methods[19] = new objj_method(sel_registerName("indexOfItemWithSubmenu:"), function $CPMenu__indexOfItemWithSubmenu_(self, _cmd, aMenu)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "submenu") == aMenu)
            return index;
    return CPNotFound;
}
});
instance_methods[20] = new objj_method(sel_registerName("setSubmenu:forItem:"), function $CPMenu__setSubmenu_forItem_(self, _cmd, aMenu, aMenuItem)
{ with(self)
{
    objj_msgSend(aMenuItem, "setTarget:", aMenuItem);
    objj_msgSend(aMenuItem, "setAction:", sel_registerName("submenuAction:"));
    objj_msgSend(aMenuItem, "setSubmenu:", aMenu);
}
});
instance_methods[21] = new objj_method(sel_registerName("submenuAction:"), function $CPMenu__submenuAction_(self, _cmd, aSender)
{ with(self)
{}
});
instance_methods[22] = new objj_method(sel_registerName("attachedMenu"), function $CPMenu__attachedMenu(self, _cmd)
{ with(self)
{
    return _attachedMenu;
}
});
instance_methods[23] = new objj_method(sel_registerName("isAttached"), function $CPMenu__isAttached(self, _cmd)
{ with(self)
{
    return _isAttached;
}
});
instance_methods[24] = new objj_method(sel_registerName("locationOfSubmenu:"), function $CPMenu__locationOfSubmenu_(self, _cmd, aMenu)
{ with(self)
{}
});
instance_methods[25] = new objj_method(sel_registerName("supermenu"), function $CPMenu__supermenu(self, _cmd)
{ with(self)
{
    return _supermenu;
}
});
instance_methods[26] = new objj_method(sel_registerName("setSupermenu:"), function $CPMenu__setSupermenu_(self, _cmd, aMenu)
{ with(self)
{
    _supermenu = aMenu;
}
});
instance_methods[27] = new objj_method(sel_registerName("isTornOff"), function $CPMenu__isTornOff(self, _cmd)
{ with(self)
{
    return !_supermenu || self == objj_msgSend(CPApp, "mainMenu");
}
});
instance_methods[28] = new objj_method(sel_registerName("setAutoenablesItems:"), function $CPMenu__setAutoenablesItems_(self, _cmd, aFlag)
{ with(self)
{
    _autoenablesItems = aFlag;
}
});
instance_methods[29] = new objj_method(sel_registerName("autoenablesItems"), function $CPMenu__autoenablesItems(self, _cmd)
{ with(self)
{
    return _autoenablesItems;
}
});
instance_methods[30] = new objj_method(sel_registerName("update"), function $CPMenu__update(self, _cmd)
{ with(self)
{}
});
instance_methods[31] = new objj_method(sel_registerName("setTitle:"), function $CPMenu__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
}
});
instance_methods[32] = new objj_method(sel_registerName("title"), function $CPMenu__title(self, _cmd)
{ with(self)
{
    return _title;
}
});
class_methods[7] = new objj_method(sel_registerName("popUpContextMenu:withEvent:forView:"), function $CPMenu__popUpContextMenu_withEvent_forView_(self, _cmd, aMenu, anEvent, aView)
{ with(self)
{
    objj_msgSend(self, "popUpContextMenu:withEvent:forView:withFont:", aMenu, anEvent, aView, nil);
}
});
class_methods[8] = new objj_method(sel_registerName("popUpContextMenu:withEvent:forView:withFont:"), function $CPMenu__popUpContextMenu_withEvent_forView_withFont_(self, _cmd, aMenu, anEvent, aView, aFont)
{ with(self)
{
    objj_msgSend(self, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", aMenu, anEvent, aView, aFont, NO);
}
});
class_methods[9] = new objj_method(sel_registerName("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"), function $CPMenu___popUpContextMenu_withEvent_forView_withFont_forMenuBar_(self, _cmd, aMenu, anEvent, aView, aFont, isForMenuBar)
{ with(self)
{
    var delegate = objj_msgSend(aMenu, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_registerName("menuWillOpen:")))
        objj_msgSend(delegate, "menuWillOpen:", aMenu);
    if (!aFont)
        aFont = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);
    var theWindow = objj_msgSend(aView, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", aMenu, aFont);
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", isForMenuBar?_CPMenuWindowMenuBarBackgroundStyle:_CPMenuWindowPopUpBackgroundStyle);
    objj_msgSend(menuWindow, "setFrameOrigin:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_registerName("_menuWindowDidFinishTracking:highlightedItem:"));
}
});
class_methods[10] = new objj_method(sel_registerName("_menuWindowDidFinishTracking:highlightedItem:"), function $CPMenu___menuWindowDidFinishTracking_highlightedItem_(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    var target = nil,
        action = objj_msgSend(aMenuItem, "action");
    if (!action)
    {
    }
    else
        target = objj_msgSend(aMenuItem, "target");
    objj_msgSend(CPApp, "sendAction:to:from:", action, target, nil);
}
});
instance_methods[33] = new objj_method(sel_registerName("setShowsStateColumn:"), function $CPMenu__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
});
instance_methods[34] = new objj_method(sel_registerName("showsStateColumn"), function $CPMenu__showsStateColumn(self, _cmd)
{ with(self)
{
    return _showsStateColumn;
}
});
instance_methods[35] = new objj_method(sel_registerName("highlightedItem"), function $CPMenu__highlightedItem(self, _cmd)
{ with(self)
{
    return _highlightedIndex >= 0 ? _items[_highlightedIndex] : nil;
}
});
instance_methods[36] = new objj_method(sel_registerName("setDelegate:"), function $CPMenu__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
});
instance_methods[37] = new objj_method(sel_registerName("delegate"), function $CPMenu__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[38] = new objj_method(sel_registerName("cancelTracking"), function $CPMenu__cancelTracking(self, _cmd)
{ with(self)
{
    objj_msgSend(_menuWindow, "cancelTracking");
}
});
instance_methods[39] = new objj_method(sel_registerName("_setMenuWindow:"), function $CPMenu___setMenuWindow_(self, _cmd, aMenuWindow)
{ with(self)
{
    _menuWindow = aMenuWindow;
}
});
instance_methods[40] = new objj_method(sel_registerName("performKeyEquivalent:"), function $CPMenu__performKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    if (_autoenablesItems)
        objj_msgSend(self, "update");
    var index = 0,
        count = _items.length,
        characters = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    for(; index < count; ++index)
    {
        var item = _items[index],
            modifierMask = objj_msgSend(item, "keyEquivalentModifierMask");
        if ((modifierFlags & (CPShiftKeyMask | CPAlternateKeyMask | CPCommandKeyMask | CPControlKeyMask)) == modifierMask &&
            objj_msgSend(characters, "caseInsensitiveCompare:", objj_msgSend(item, "keyEquivalent")) == CPOrderedSame)
        {
            if (objj_msgSend(item, "isEnabled"))
                objj_msgSend(self, "performActionForItemAtIndex:", index);
            else
            {
            }
            return YES;
        }
        if (objj_msgSend(objj_msgSend(item, "submenu"), "performKeyEquivalent:", anEvent))
            return YES;
   }
   return NO;
}
});
instance_methods[41] = new objj_method(sel_registerName("performActionForItemAtIndex:"), function $CPMenu__performActionForItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    var item = _items[anIndex];
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(item, "action"), objj_msgSend(item, "target"), item);
}
});
instance_methods[42] = new objj_method(sel_registerName("_itemIsHighlighted:"), function $CPMenu___itemIsHighlighted_(self, _cmd, aMenuItem)
{ with(self)
{
    return _items[_highlightedIndex] == aMenuItem;
}
});
instance_methods[43] = new objj_method(sel_registerName("_highlightItemAtIndex:"), function $CPMenu___highlightItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    var previousHighlightedIndex = _highlightedIndex;
    _highlightedIndex = anIndex;
    if (previousHighlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[previousHighlightedIndex], "_menuItemView"), "highlight:", NO);
    if (_highlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[_highlightedIndex], "_menuItemView"), "highlight:", YES);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPMenuTitleKey = "CPMenuTitleKey",
    CPMenuItemsKey = "CPMenuItemsKey";
{
var the_class = objj_getClass("CPMenu")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenu\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPMenu__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuTitleKey);
        _items = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemsKey);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPMenu__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _items, CPMenuItemsKey);
}
});
class_addMethods(the_class, instance_methods);
}
var _CPMenuWindowPool = [],
    _CPMenuWindowPoolCapacity = 5,
    _CPMenuWindowBackgroundColors = [],
    _CPMenuWindowScrollingStateUp = -1,
    _CPMenuWindowScrollingStateDown = 1,
    _CPMenuWindowScrollingStateNone = 0;
_CPMenuWindowMenuBarBackgroundStyle = 0;
_CPMenuWindowPopUpBackgroundStyle = 1;
_CPMenuWindowAttachedMenuBackgroundStyle = 2;
var STICKY_TIME_INTERVAL = 500,
    TOP_MARGIN = 5.0,
    LEFT_MARGIN = 1.0,
    RIGHT_MARGIN = 1.0,
    BOTTOM_MARGIN = 5.0,
    SCROLL_INDICATOR_HEIGHT = 16.0;
{var the_class = objj_allocateClassPair(CPWindow, "_CPMenuWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuView"), new objj_ivar("_menuClipView"), new objj_ivar("_lastMouseOverMenuView"), new objj_ivar("_moreAboveView"), new objj_ivar("_moreBelowView"), new objj_ivar("_sessionDelegate"), new objj_ivar("_didEndSelector"), new objj_ivar("_startTime"), new objj_ivar("_scrollingState"), new objj_ivar("_lastScreenLocation"), new objj_ivar("_isShowingTopScrollIndicator"), new objj_ivar("_isShowingBottomScrollIndicator"), new objj_ivar("_trackingCanceled"), new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("menuWindowWithMenu:font:"), function $_CPMenuWindow__menuWindowWithMenu_font_(self, _cmd, aMenu, aFont)
{ with(self)
{
    var menuWindow = nil;
    if (_CPMenuWindowPool.length)
        menuWindow = _CPMenuWindowPool.pop();
    else
        menuWindow = objj_msgSend(objj_msgSend(_CPMenuWindow, "alloc"), "init");
    objj_msgSend(menuWindow, "setFont:", aFont);
    objj_msgSend(menuWindow, "setMenu:", aMenu);
    return menuWindow;
}
});
class_methods[1] = new objj_method(sel_registerName("poolMenuWindow:"), function $_CPMenuWindow__poolMenuWindow_(self, _cmd, aMenuWindow)
{ with(self)
{
    if (!aMenuWindow || _CPMenuWindowPool.length >= _CPMenuWindowPoolCapacity)
        return;
    _CPMenuWindowPool.push(aMenuWindow);
}
});
class_methods[2] = new objj_method(sel_registerName("initialize"), function $_CPMenuWindow__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuWindowMoreAboveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreAbove.png"), CGSizeMake(38.0,18.0));
    _CPMenuWindowMoreBelowImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreBelow.png"), CGSizeMake(38.0,18.0));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $_CPMenuWindow__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", CPTornOffMenuWindowLevel);
        objj_msgSend(self, "setHasShadow:", YES);
        objj_msgSend(self, "setAcceptsMouseMovedEvents:", YES);
        _unconstrainedFrame = CGRectMakeZero();
        var contentView = objj_msgSend(self, "contentView");
        _menuView = objj_msgSend(objj_msgSend(_CPMenuView, "alloc"), "initWithFrame:", CGRectMakeZero());
        _menuClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", CGRectMake(LEFT_MARGIN,TOP_MARGIN,0.0,0.0));
        objj_msgSend(_menuClipView, "setDocumentView:", _menuView);
        objj_msgSend(contentView, "addSubview:", _menuClipView);
        _moreAboveView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_moreAboveView, "setImage:", _CPMenuWindowMoreAboveImage);
        objj_msgSend(_moreAboveView, "setFrameSize:", objj_msgSend(_CPMenuWindowMoreAboveImage, "size"));
        objj_msgSend(contentView, "addSubview:", _moreAboveView);
        _moreBelowView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_moreBelowView, "setImage:", _CPMenuWindowMoreBelowImage);
        objj_msgSend(_moreBelowView, "setFrameSize:", objj_msgSend(_CPMenuWindowMoreBelowImage, "size"));
        objj_msgSend(contentView, "addSubview:", _moreBelowView);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setFont:"), function $_CPMenuWindow__setFont_(self, _cmd, aFont)
{ with(self)
{
    objj_msgSend(_menuView, "setFont:", aFont);
}
});
instance_methods[2] = new objj_method(sel_registerName("setBackgroundStyle:"), function $_CPMenuWindow__setBackgroundStyle_(self, _cmd, aBackgroundStyle)
{ with(self)
{
    var color = _CPMenuWindowBackgroundColors[aBackgroundStyle];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        if (aBackgroundStyle == _CPMenuWindowPopUpBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded0.png"), CGSizeMake(4.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow1.png"), CGSizeMake(1.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded2.png"), CGSizeMake(4.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0,4.0))]));
        else if (aBackgroundStyle == _CPMenuWindowMenuBarBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0,0.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0,0.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0,0.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0,4.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0,4.0))]));
        _CPMenuWindowBackgroundColors[aBackgroundStyle] = color;
    }
    objj_msgSend(self, "setBackgroundColor:", color);
}
});
instance_methods[3] = new objj_method(sel_registerName("setMenu:"), function $_CPMenuWindow__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSend(aMenu, "_setMenuWindow:", self);
    objj_msgSend(_menuView, "setMenu:", aMenu);
    var menuViewSize = objj_msgSend(_menuView, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(LEFT_MARGIN+menuViewSize.width+RIGHT_MARGIN,TOP_MARGIN+menuViewSize.height+BOTTOM_MARGIN));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0,0.0));
    objj_msgSend(_menuClipView, "setFrame:", CGRectMake(LEFT_MARGIN,TOP_MARGIN,menuViewSize.width,menuViewSize.height));
}
});
instance_methods[4] = new objj_method(sel_registerName("setMinWidth:"), function $_CPMenuWindow__setMinWidth_(self, _cmd, aWidth)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(MAX(size.width,aWidth),size.height));
}
});
instance_methods[5] = new objj_method(sel_registerName("rectForItemAtIndex:"), function $_CPMenuWindow__rectForItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuView, "convertRect:toView:", objj_msgSend(_menuView, "rectForItemAtIndex:", anIndex), nil);
}
});
instance_methods[6] = new objj_method(sel_registerName("orderFront:"), function $_CPMenuWindow__orderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "constrainToScreen");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "orderFront:", aSender);
}
});
instance_methods[7] = new objj_method(sel_registerName("constrainToScreen"), function $_CPMenuWindow__constrainToScreen(self, _cmd)
{ with(self)
{
    _unconstrainedFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
    var screenBounds = CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), 5.0, 5.0),
        constrainedFrame = CGRectIntersection(_unconstrainedFrame, screenBounds),
        menuViewOrigin = objj_msgSend(self, "convertBaseToBridge:", CGPointMake(LEFT_MARGIN,TOP_MARGIN));
    constrainedFrame.origin.x = CGRectGetMinX(_unconstrainedFrame);
    constrainedFrame.size.width = CGRectGetWidth(_unconstrainedFrame);
    if (CGRectGetWidth(constrainedFrame) > CGRectGetWidth(screenBounds))
        constrainedFrame.size.width = CGRectGetWidth(screenBounds);
    if (CGRectGetMaxX(constrainedFrame) > CGRectGetMaxX(screenBounds))
        constrainedFrame.origin.x -= CGRectGetMaxX(constrainedFrame) - CGRectGetMaxX(screenBounds);
    if (CGRectGetMinX(constrainedFrame) < CGRectGetMinX(screenBounds))
        constrainedFrame.origin.x = CGRectGetMinX(screenBounds);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "setFrame:", constrainedFrame);
    var topMargin = TOP_MARGIN,
        bottomMargin = BOTTOM_MARGIN,
        contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    var moreAbove = menuViewOrigin.y < CGRectGetMinY(constrainedFrame) + TOP_MARGIN,
        moreBelow = menuViewOrigin.y + CGRectGetHeight(objj_msgSend(_menuView, "frame")) > CGRectGetMaxY(constrainedFrame) - BOTTOM_MARGIN;
    if (moreAbove)
    {
        topMargin += SCROLL_INDICATOR_HEIGHT;
        var frame = objj_msgSend(_moreAboveView, "frame");
        objj_msgSend(_moreAboveView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds)-CGRectGetWidth(frame))/2.0,(TOP_MARGIN+SCROLL_INDICATOR_HEIGHT-CGRectGetHeight(frame))/2.0));
    }
    objj_msgSend(_moreAboveView, "setHidden:", !moreAbove);
    if (moreBelow)
    {
        bottomMargin += SCROLL_INDICATOR_HEIGHT;
        objj_msgSend(_moreBelowView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds)-CGRectGetWidth(objj_msgSend(_moreBelowView, "frame")))/2.0,CGRectGetHeight(bounds)-SCROLL_INDICATOR_HEIGHT-BOTTOM_MARGIN));
    }
    objj_msgSend(_moreBelowView, "setHidden:", !moreBelow);
    var clipFrame = CGRectMake(LEFT_MARGIN, topMargin, CGRectGetWidth(constrainedFrame) - LEFT_MARGIN - RIGHT_MARGIN, CGRectGetHeight(constrainedFrame) - topMargin - bottomMargin)
    objj_msgSend(_menuClipView, "setFrame:", clipFrame);
    objj_msgSend(_menuView, "setFrameSize:", CGSizeMake(CGRectGetWidth(clipFrame),CGRectGetHeight(objj_msgSend(_menuView, "frame"))));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0,objj_msgSend(self, "convertBaseToBridge:", clipFrame.origin).y-menuViewOrigin.y));
}
});
instance_methods[8] = new objj_method(sel_registerName("cancelTracking"), function $_CPMenuWindow__cancelTracking(self, _cmd)
{ with(self)
{
    _trackingCanceled = YES;
}
});
instance_methods[9] = new objj_method(sel_registerName("beginTrackingWithEvent:sessionDelegate:didEndSelector:"), function $_CPMenuWindow__beginTrackingWithEvent_sessionDelegate_didEndSelector_(self, _cmd, anEvent, aSessionDelegate, aDidEndSelector)
{ with(self)
{
    _startTime = objj_msgSend(anEvent, "timestamp");
    _scrollingState = _CPMenuWindowScrollingStateNone;
    _trackingCanceled = NO;
    _sessionDelegate = aSessionDelegate;
    _didEndSelector = aDidEndSelector;
    objj_msgSend(self, "trackEvent:", anEvent);
}
});
instance_methods[10] = new objj_method(sel_registerName("trackEvent:"), function $_CPMenuWindow__trackEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        theWindow = objj_msgSend(anEvent, "window"),
        screenLocation = theWindow ? objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")) : objj_msgSend(anEvent, "locationInWindow");
    if (type == CPPeriodic)
    {
        var constrainedBounds = CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), 5.0, 5.0);
        if (_scrollingState == _CPMenuWindowScrollingStateUp)
        {
            if (CGRectGetMinY(_unconstrainedFrame) < CGRectGetMinY(constrainedBounds))
                _unconstrainedFrame.origin.y += 10;
        }
        else if (_scrollingState == _CPMenuWindowScrollingStateDown)
            if (CGRectGetMaxY(_unconstrainedFrame) > CGRectGetHeight(constrainedBounds))
                _unconstrainedFrame.origin.y -= 10;
        objj_msgSend(self, "setFrame:", _unconstrainedFrame);
        objj_msgSend(self, "constrainToScreen");
        screenLocation = _lastScreenLocation;
    }
    _lastScreenLocation = screenLocation;
    var menu = objj_msgSend(_menuView, "menu"),
        menuLocation = objj_msgSend(self, "convertBridgeToBase:", screenLocation),
        activeItemIndex = objj_msgSend(_menuView, "itemIndexAtPoint:", objj_msgSend(_menuView, "convertPoint:fromView:", menuLocation, nil)),
        mouseOverMenuView = objj_msgSend(objj_msgSend(menu, "itemAtIndex:", activeItemIndex), "view");
    if (mouseOverMenuView)
    {
        if (!_lastMouseOverMenuView)
            objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        if (_lastMouseOverMenuView != mouseOverMenuView)
        {
            objj_msgSend(mouseOverMenuView, "mouseExited:", anEvent);
            objj_msgSend(_lastMouseOverMenuView, "mouseEntered:", anEvent);
            _lastMouseOverMenuView = mouseOverMenuView;
        }
        objj_msgSend(self, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", type, menuLocation, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")));
    }
    else
    {
        if (_lastMouseOverMenuView)
        {
            objj_msgSend(_lastMouseOverMenuView, "mouseExited:", anEvent);
            _lastMouseOverMenuView = nil;
        }
        objj_msgSend(menu, "_highlightItemAtIndex:", objj_msgSend(_menuView, "itemIndexAtPoint:", objj_msgSend(_menuView, "convertPoint:fromView:", objj_msgSend(self, "convertBridgeToBase:", screenLocation), nil)));
        if (type == CPMouseMoved || type == CPLeftMouseDragged || type == CPLeftMouseDown)
        {
            var frame = objj_msgSend(self, "frame"),
                oldScrollingState = _scrollingState;
            _scrollingState = _CPMenuWindowScrollingStateNone;
            if (screenLocation.y < CGRectGetMinY(frame) + TOP_MARGIN + SCROLL_INDICATOR_HEIGHT)
                _scrollingState = _CPMenuWindowScrollingStateUp;
            else if (screenLocation.y > CGRectGetMaxY(frame) - BOTTOM_MARGIN - SCROLL_INDICATOR_HEIGHT)
                _scrollingState = _CPMenuWindowScrollingStateDown;
            if (_scrollingState != oldScrollingState)
                if (_scrollingState == _CPMenuWindowScrollingStateNone)
                    objj_msgSend(CPEvent, "stopPeriodicEvents");
                else if (oldScrollingState == _CPMenuWindowScrollingStateNone)
                    objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.04);
        }
        else if (type == CPLeftMouseUp && (objj_msgSend(anEvent, "timestamp") - _startTime > STICKY_TIME_INTERVAL))
        {
            if (_scrollingState != _CPMenuWindowScrollingStateNone)
                objj_msgSend(CPEvent, "stopPeriodicEvents");
            objj_msgSend(self, "cancelTracking");
        }
    }
    if (_trackingCanceled)
    {
        var highlightedItem = objj_msgSend(objj_msgSend(_menuView, "menu"), "highlightedItem");
        objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        objj_msgSend(_menuView, "setMenu:", nil);
        objj_msgSend(self, "orderOut:", self);
        if (_sessionDelegate && _didEndSelector)
            objj_msgSend(_sessionDelegate, _didEndSelector, self, highlightedItem);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPMenuDidEndTrackingNotification, menu);
        var delegate = objj_msgSend(menu, "delegate");
        if (objj_msgSend(delegate, "respondsToSelector:", sel_registerName("menuDidClose:")))
            objj_msgSend(delegate, "menuDidClose:", menu);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackEvent:"), CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItemViews"), new objj_ivar("_font")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setFont:"), function $_CPMenuView__setFont_(self, _cmd, aFont)
{ with(self)
{
    _font = aFont;
}
});
instance_methods[1] = new objj_method(sel_registerName("rectForItemAtIndex:"), function $_CPMenuView__rectForItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuItemViews[anIndex==CPNotFound?0:anIndex], "frame");
}
});
instance_methods[2] = new objj_method(sel_registerName("itemIndexAtPoint:"), function $_CPMenuView__itemIndexAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var index = 0,
        count = _menuItemViews.length;
    for (; index < count; ++index)
    {
        var view = _menuItemViews[index];
        if (objj_msgSend(view, "isHidden"))
            continue;
        if (CGRectContainsPoint(objj_msgSend(view, "frame"), aPoint))
            return index;
    }
    return CPNotFound;
}
});
instance_methods[3] = new objj_method(sel_registerName("setMenu:"), function $_CPMenuView__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setMenu:", aMenu);
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:", sel_registerName("removeFromSuperview"));
    _menuItemViews = [];
    var menu = objj_msgSend(self, "menu");
    if (!menu)
        return;
    var items = objj_msgSend(menu, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count"),
        maxWidth = 0,
        y = 0,
        showsStateColumn = objj_msgSend(menu, "showsStateColumn");
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(item, "_menuItemView");
        _menuItemViews.push(view);
        if (objj_msgSend(item, "isHidden"))
            continue;
        objj_msgSend(view, "setFont:", _font);
        objj_msgSend(view, "setShowsStateColumn:", showsStateColumn);
        objj_msgSend(view, "synchronizeWithMenuItem");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(0.0,y));
        objj_msgSend(self, "addSubview:", view);
        var size = objj_msgSend(view, "minSize"),
            width = size.width;
        if (maxWidth < width)
            maxWidth = width;
        y += size.height;
    }
    for (index = 0; index < count; ++index)
    {
        var view = _menuItemViews[index];
        objj_msgSend(view, "setFrameSize:", CGSizeMake(maxWidth,CGRectGetHeight(objj_msgSend(view, "frame"))));
    }
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(maxWidth,y));
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
});
class_addMethods(the_class, instance_methods);
}
var MENUBAR_HEIGHT = 29.0,
    MENUBAR_MARGIN = 10.0,
    MENUBAR_LEFT_MARGIN = 10.0,
    MENUBAR_RIGHT_MARGIN = 10.0;
var _CPMenuBarWindowBackgroundColor = nil,
    _CPMenuBarWindowFont = nil;
{var the_class = objj_allocateClassPair(CPPanel, "_CPMenuBarWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_highlightView"), new objj_ivar("_menuItemViews"), new objj_ivar("_trackingMenuItem"), new objj_ivar("_iconImageView"), new objj_ivar("_titleField")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPMenuBarWindow__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuBarWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuBarWindowBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuBarWindow/_CPMenuBarWindowBackground.png"), CGSizeMake(1.0,18.0)));
    _CPMenuBarWindowFont = objj_msgSend(CPFont, "systemFontOfSize:", 11.0);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $_CPMenuBarWindow__init(self, _cmd)
{ with(self)
{
    var bridgeWidth = CGRectGetWidth(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", CGRectMake(0.0,0.0,bridgeWidth,MENUBAR_HEIGHT), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", -1);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable);
        var contentView = objj_msgSend(self, "contentView");
        objj_msgSend(contentView, "setBackgroundColor:", _CPMenuBarWindowBackgroundColor);
        objj_msgSend(contentView, "setAutoresizesSubviews:", NO);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        _iconImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,16.0,16.0));
        objj_msgSend(contentView, "addSubview:", _iconImageView);
        _titleField = objj_msgSend(objj_msgSend(_CPImageAndTitleView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
        objj_msgSend(_titleField, "setImagePosition:", CPImageLeft);
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(contentView, "addSubview:", _titleField);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setTitle:"), function $_CPMenuBarWindow__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setTitle:", aTitle);
    objj_msgSend(_titleField, "sizeToFit");
    objj_msgSend(self, "tile");
}
});
instance_methods[2] = new objj_method(sel_registerName("setIconImage:"), function $_CPMenuBarWindow__setIconImage_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(_iconImageView, "setImage:", anImage);
    objj_msgSend(_iconImageView, "setHidden:", anImage==nil);
    objj_msgSend(self, "tile");
}
});
instance_methods[3] = new objj_method(sel_registerName("setIconImageAlphaValue:"), function $_CPMenuBarWindow__setIconImageAlphaValue_(self, _cmd, anAlphaValue)
{ with(self)
{
    objj_msgSend(_iconImageView, "setAlphaValue:", anAlphaValue);
}
});
instance_methods[4] = new objj_method(sel_registerName("setMenu:"), function $_CPMenuBarWindow__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    if (_menu == aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, _menu);
        var items = objj_msgSend(_menu, "itemArray"),
            count = items.length;
        while (count--)
            objj_msgSend(objj_msgSend(items[count], "_menuItemView"), "removeFromSuperview");
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    _menuItemViews = [];
    var contentView = objj_msgSend(self, "contentView"),
        items = objj_msgSend(_menu, "itemArray"),
        count = items.length;
    for (index = 0; index < count; ++index)
    {
        var item = items[index],
            menuItemView = objj_msgSend(item, "_menuItemView");
        _menuItemViews.push(menuItemView);
        objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
        objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
        objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
        objj_msgSend(menuItemView, "setHidden:", objj_msgSend(item, "isHidden"));
        objj_msgSend(menuItemView, "synchronizeWithMenuItem");
        objj_msgSend(contentView, "addSubview:", menuItemView);
    }
    objj_msgSend(self, "tile");
}
});
instance_methods[5] = new objj_method(sel_registerName("menuDidChangeItem:"), function $_CPMenuBarWindow__menuDidChangeItem_(self, _cmd, aNotification)
{ with(self)
{
    var menuItem = objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex")),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(self, "tile");
}
});
instance_methods[6] = new objj_method(sel_registerName("menuDidAddItem:"), function $_CPMenuBarWindow__menuDidAddItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItem = objj_msgSend(_menu, "itemAtIndex:", index),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(_menuItemViews, "insertObject:atIndex:", menuItemView, index);
    objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
    objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
    objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", menuItemView);
    objj_msgSend(self, "tile");
}
});
instance_methods[7] = new objj_method(sel_registerName("menuDidRemoveItem:"), function $_CPMenuBarWindow__menuDidRemoveItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItemView = objj_msgSend(_menuItemViews, "objectAtIndex:", index);
    objj_msgSend(_menuItemViews, "removeObjectAtIndex:", index);
    objj_msgSend(menuItemView, "removeFromSuperview");
    objj_msgSend(self, "tile");
}
});
instance_methods[8] = new objj_method(sel_registerName("frameForMenuItem:"), function $_CPMenuBarWindow__frameForMenuItem_(self, _cmd, aMenuItem)
{ with(self)
{
    var frame = objj_msgSend(objj_msgSend(aMenuItem, "_menuItemView"), "frame");
    frame.origin.x -= 5.0;
    frame.origin.y = 0;
    frame.size.width += 10.0;
    frame.size.height = MENUBAR_HEIGHT;
    return frame;
}
});
instance_methods[9] = new objj_method(sel_registerName("menuItemAtPoint:"), function $_CPMenuBarWindow__menuItemAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var items = objj_msgSend(_menu, "itemArray"),
        count = items.length;
    while (count--)
    {
        var item = items[count];
        if (objj_msgSend(item, "isHidden") || objj_msgSend(item, "isSeparatorItem"))
            continue;
        if (CGRectContainsPoint(objj_msgSend(self, "frameForMenuItem:", item), aPoint))
            return item;
    }
    return nil;
}
});
instance_methods[10] = new objj_method(sel_registerName("mouseDown:"), function $_CPMenuBarWindow__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    _trackingMenuItem = objj_msgSend(self, "menuItemAtPoint:", objj_msgSend(anEvent, "locationInWindow"));
    if (!objj_msgSend(_trackingMenuItem, "isEnabled"))
        return;
    if (objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "eventOnSubmenu:", anEvent))
        return objj_msgSend(self, "showMenu:", anEvent);
    if (objj_msgSend(_trackingMenuItem, "isEnabled"))
        objj_msgSend(self, "trackEvent:", anEvent);
}
});
instance_methods[11] = new objj_method(sel_registerName("trackEvent:"), function $_CPMenuBarWindow__trackEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPPeriodic)
        return objj_msgSend(self, "showMenu:", anEvent);
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView"),
        onMenuItemView = CGRectContainsPoint(frame, objj_msgSend(anEvent, "locationInWindow"));
    if (type == CPLeftMouseDown)
    {
        if (objj_msgSend(_trackingMenuItem, "submenu") != nil)
        {
            if (!objj_msgSend(_trackingMenuItem, "action"))
                return objj_msgSend(self, "showMenu:", anEvent);
            objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.5);
        }
        objj_msgSend(menuItemView, "highlight:", onMenuItemView);
    }
    else if (type == CPLeftMouseDragged)
    {
        if (!onMenuItemView && objj_msgSend(_trackingMenuItem, "submenu"))
            return objj_msgSend(self, "showMenu:", anEvent);
        objj_msgSend(menuItemView, "highlight:", onMenuItemView);
    }
    else
    {
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        objj_msgSend(menuItemView, "highlight:", NO);
        if (onMenuItemView)
            objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(_trackingMenuItem, "action"), objj_msgSend(_trackingMenuItem, "target"), nil);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackEvent:"), CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
instance_methods[12] = new objj_method(sel_registerName("showMenu:"), function $_CPMenuBarWindow__showMenu_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(CPEvent, "stopPeriodicEvents");
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView");
    if (!_highlightView)
    {
        _highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", frame);
        objj_msgSend(_highlightView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 81.0/255.0, 83.0/255.0, 109.0/255.0, 1.0));
    }
    else
        objj_msgSend(_highlightView, "setFrame:", frame);
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:positioned:relativeTo:", _highlightView, CPWindowBelow, menuItemView);
    objj_msgSend(menuItemView, "activate:", YES);
    var submenu = objj_msgSend(_trackingMenuItem, "submenu");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_registerName("menuDidEndTracking:"), CPMenuDidEndTrackingNotification, submenu);
    objj_msgSend(CPMenu, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", submenu, objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, CGPointMake(CGRectGetMinX(frame),CGRectGetMaxY(frame)), objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")), objj_msgSend(self, "contentView"), nil, YES);
}
});
instance_methods[13] = new objj_method(sel_registerName("menuDidEndTracking:"), function $_CPMenuBarWindow__menuDidEndTracking_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_highlightView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "activate:", NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPMenuDidEndTrackingNotification, objj_msgSend(aNotification, "object"));
}
});
instance_methods[14] = new objj_method(sel_registerName("tile"), function $_CPMenuBarWindow__tile(self, _cmd)
{ with(self)
{
    var items = objj_msgSend(_menu, "itemArray"),
        index = 0,
        count = items.length,
        x = MENUBAR_LEFT_MARGIN,
        y = 0.0,
        isLeftAligned = YES;
    for (; index < count; ++index)
    {
        var item = items[index];
        if (objj_msgSend(item, "isSeparatorItem"))
        {
            x = CGRectGetWidth(objj_msgSend(self, "frame")) - MENUBAR_RIGHT_MARGIN;
            isLeftAligned = NO;
            continue;
        }
         if (objj_msgSend(item, "isHidden"))
            continue;
        var menuItemView = objj_msgSend(item, "_menuItemView"),
            frame = objj_msgSend(menuItemView, "frame");
        if (isLeftAligned)
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x,(MENUBAR_HEIGHT-1.0-CGRectGetHeight(frame))/2.0));
            x += CGRectGetWidth(objj_msgSend(menuItemView, "frame")) + MENUBAR_MARGIN;
        }
        else
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x-CGRectGetWidth(frame),(MENUBAR_HEIGHT-1.0-CGRectGetHeight(frame))/2.0));
            x = CGRectGetMinX(objj_msgSend(menuItemView, "frame")) - MENUBAR_MARGIN;
        }
    }
    var bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds"),
        titleFrame = objj_msgSend(_titleField, "frame");
    if (objj_msgSend(_iconImageView, "isHidden"))
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds)-CGRectGetWidth(titleFrame))/2.0,(CGRectGetHeight(bounds)-CGRectGetHeight(titleFrame))/2.0));
    else
    {
        var iconFrame = objj_msgSend(_iconImageView, "frame"),
            iconWidth = CGRectGetWidth(iconFrame),
            totalWidth = iconWidth + CGRectGetWidth(titleFrame);
        objj_msgSend(_iconImageView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds)-totalWidth)/2.0,(CGRectGetHeight(bounds)-CGRectGetHeight(iconFrame))/2.0));
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds)-totalWidth)/2.0+iconWidth,(CGRectGetHeight(bounds)-CGRectGetHeight(titleFrame))/2.0));
    }
}
});
instance_methods[15] = new objj_method(sel_registerName("setFrameSize:"), function $_CPMenuBarWindow__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "setFrameSize:", aSize);
    objj_msgSend(self, "tile");
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;12;CPMenuItem.jI;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;28421;
{var the_class = objj_allocateClassPair(CPObject, "CPMenuItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_title"), new objj_ivar("_font"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_isHidden"), new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_onStateImage"), new objj_ivar("_offStateImage"), new objj_ivar("_mixedStateImage"), new objj_ivar("_submenu"), new objj_ivar("_menu"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_mnemonicLocation"), new objj_ivar("_isAlternate"), new objj_ivar("_indentationLevel"), new objj_ivar("_toolTip"), new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_menuItemView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithTitle:action:keyEquivalent:"), function $CPMenuItem__initWithTitle_action_keyEquivalent_(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = aTitle;
        _action = anAction;
        _isEnabled = YES;
        _state = CPOffState;
        _keyEquivalent = aKeyEquivalent;
        _keyEquivalentModifierMask = CPPlatformActionKeyMask;
        _mnemonicLocation = CPNotFound;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setEnabled:"), function $CPMenuItem__setEnabled_(self, _cmd, isEnabled)
{ with(self)
{
    if (objj_msgSend(_menu, "autoenablesItems"))
        return;
    _isEnabled = isEnabled;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[2] = new objj_method(sel_registerName("isEnabled"), function $CPMenuItem__isEnabled(self, _cmd)
{ with(self)
{
    return _isEnabled;
}
});
instance_methods[3] = new objj_method(sel_registerName("setHidden:"), function $CPMenuItem__setHidden_(self, _cmd, isHidden)
{ with(self)
{
    _isHidden = isHidden;
}
});
instance_methods[4] = new objj_method(sel_registerName("isHidden"), function $CPMenuItem__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
});
instance_methods[5] = new objj_method(sel_registerName("isHiddenOrHasHiddenAncestor"), function $CPMenuItem__isHiddenOrHasHiddenAncestor(self, _cmd)
{ with(self)
{
    if (_isHidden)
        return YES;
    if (objj_msgSend(objj_msgSend(objj_msgSend(_menu, "supermenu"), "indexOfItemWithSubmenu:", _menu), "isHiddenOrHasHiddenAncestor"))
        return YES;
    return NO;
}
});
instance_methods[6] = new objj_method(sel_registerName("setTarget:"), function $CPMenuItem__setTarget_(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
});
instance_methods[7] = new objj_method(sel_registerName("target"), function $CPMenuItem__target(self, _cmd)
{ with(self)
{
    return _target;
}
});
instance_methods[8] = new objj_method(sel_registerName("setAction:"), function $CPMenuItem__setAction_(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
});
instance_methods[9] = new objj_method(sel_registerName("action"), function $CPMenuItem__action(self, _cmd)
{ with(self)
{
    return _action;
}
});
instance_methods[10] = new objj_method(sel_registerName("setTitle:"), function $CPMenuItem__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _mnemonicLocation = CPNotFound;
    if (_title == aTitle)
        return;
    _title = aTitle;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[11] = new objj_method(sel_registerName("title"), function $CPMenuItem__title(self, _cmd)
{ with(self)
{
    return _title;
}
});
instance_methods[12] = new objj_method(sel_registerName("setFont:"), function $CPMenuItem__setFont_(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
});
instance_methods[13] = new objj_method(sel_registerName("font"), function $CPMenuItem__font(self, _cmd)
{ with(self)
{
    return _font;
}
});
instance_methods[14] = new objj_method(sel_registerName("setTag:"), function $CPMenuItem__setTag_(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
});
instance_methods[15] = new objj_method(sel_registerName("tag"), function $CPMenuItem__tag(self, _cmd)
{ with(self)
{
    return _tag;
}
});
instance_methods[16] = new objj_method(sel_registerName("setState:"), function $CPMenuItem__setState_(self, _cmd, aState)
{ with(self)
{
    if (_state == aState)
        return;
    _state = aState;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
});
instance_methods[17] = new objj_method(sel_registerName("state"), function $CPMenuItem__state(self, _cmd)
{ with(self)
{
    return _state;
}
});
instance_methods[18] = new objj_method(sel_registerName("setImage:"), function $CPMenuItem__setImage_(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[19] = new objj_method(sel_registerName("image"), function $CPMenuItem__image(self, _cmd)
{ with(self)
{
    return _image;
}
});
instance_methods[20] = new objj_method(sel_registerName("setAlternateImage:"), function $CPMenuItem__setAlternateImage_(self, _cmd, anImage)
{ with(self)
{
    _alternateImage = anImage;
}
});
instance_methods[21] = new objj_method(sel_registerName("alternateImage"), function $CPMenuItem__alternateImage(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
});
instance_methods[22] = new objj_method(sel_registerName("setOnStateImage:"), function $CPMenuItem__setOnStateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_onStateImage == anImage)
        return;
    _onStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[23] = new objj_method(sel_registerName("onStateImage"), function $CPMenuItem__onStateImage(self, _cmd)
{ with(self)
{
    return _onStateImage;
}
});
instance_methods[24] = new objj_method(sel_registerName("setOffStateImage:"), function $CPMenuItem__setOffStateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_offStateImage == anImage)
        return;
    _offStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[25] = new objj_method(sel_registerName("offStateImage"), function $CPMenuItem__offStateImage(self, _cmd)
{ with(self)
{
    return _offStateImage;
}
});
instance_methods[26] = new objj_method(sel_registerName("setMixedStateImage:"), function $CPMenuItem__setMixedStateImage_(self, _cmd, anImage)
{ with(self)
{
    if (_mixedStateImage == anImage)
        return;
    _mixedStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[27] = new objj_method(sel_registerName("mixedStateImage"), function $CPMenuItem__mixedStateImage(self, _cmd)
{ with(self)
{
    return _mixedStateImage;
}
});
instance_methods[28] = new objj_method(sel_registerName("setSubmenu:"), function $CPMenuItem__setSubmenu_(self, _cmd, aMenu)
{ with(self)
{
    var supermenu = objj_msgSend(_submenu, "supermenu");
    if (supermenu == self)
        return;
    if (supermenu)
        return alert("bad");
    objj_msgSend(_submenu, "setSupermenu:", _menu);
    _submenu = aMenu;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[29] = new objj_method(sel_registerName("submenu"), function $CPMenuItem__submenu(self, _cmd)
{ with(self)
{
    return _submenu;
}
});
instance_methods[30] = new objj_method(sel_registerName("hasSubmenu"), function $CPMenuItem__hasSubmenu(self, _cmd)
{ with(self)
{
    return _submenu ? YES : NO;
}
});
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("separatorItem"), function $CPMenuItem__separatorItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPMenuItemSeparator, "alloc"), "init");
}
});
instance_methods[31] = new objj_method(sel_registerName("isSeparatorItem"), function $CPMenuItem__isSeparatorItem(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[32] = new objj_method(sel_registerName("setMenu:"), function $CPMenuItem__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
});
instance_methods[33] = new objj_method(sel_registerName("menu"), function $CPMenuItem__menu(self, _cmd)
{ with(self)
{
    return _menu;
}
});
instance_methods[34] = new objj_method(sel_registerName("setKeyEquivalent:"), function $CPMenuItem__setKeyEquivalent_(self, _cmd, aString)
{ with(self)
{
    _keyEquivalent = aString;
}
});
instance_methods[35] = new objj_method(sel_registerName("keyEquivalent"), function $CPMenuItem__keyEquivalent(self, _cmd)
{ with(self)
{
    return _keyEquivalent;
}
});
instance_methods[36] = new objj_method(sel_registerName("setKeyEquivalentModifierMask:"), function $CPMenuItem__setKeyEquivalentModifierMask_(self, _cmd, aMask)
{ with(self)
{
    _keyEquivalentModifierMask = aMask;
}
});
instance_methods[37] = new objj_method(sel_registerName("keyEquivalentModifierMask"), function $CPMenuItem__keyEquivalentModifierMask(self, _cmd)
{ with(self)
{
    return _keyEquivalentModifierMask;
}
});
instance_methods[38] = new objj_method(sel_registerName("setMnemonicLocation:"), function $CPMenuItem__setMnemonicLocation_(self, _cmd, aLocation)
{ with(self)
{
    _mnemonicLocation = aLocation;
}
});
instance_methods[39] = new objj_method(sel_registerName("mnemonicLocation"), function $CPMenuItem__mnemonicLocation(self, _cmd)
{ with(self)
{
    return _mnemonicLocation;
}
});
instance_methods[40] = new objj_method(sel_registerName("setTitleWithMnemonicLocation:"), function $CPMenuItem__setTitleWithMnemonicLocation_(self, _cmd, aTitle)
{ with(self)
{
    var location = objj_msgSend(aTitle, "rangeOfString:", "&").location;
    if (location == CPNotFound)
        objj_msgSend(self, "setTitle:", aTitle);
    else
    {
        objj_msgSend(self, "setTitle:", objj_msgSend(aTitle, "substringToIndex:", location)+objj_msgSend(aTitle, "substringFromIndex:", location+1));
        objj_msgSend(self, "setMnemonicLocation:", location);
    }
}
});
instance_methods[41] = new objj_method(sel_registerName("mnemonic"), function $CPMenuItem__mnemonic(self, _cmd)
{ with(self)
{
    return _mnemonicLocation == CPNotFound ? "" : objj_msgSend(_title, "characterAtIndex:", _mnemonicLocation);
}
});
instance_methods[42] = new objj_method(sel_registerName("setAlternate:"), function $CPMenuItem__setAlternate_(self, _cmd, isAlternate)
{ with(self)
{
    _isAlternate = isAlternate;
}
});
instance_methods[43] = new objj_method(sel_registerName("isAlternate"), function $CPMenuItem__isAlternate(self, _cmd)
{ with(self)
{
    return _isAlternate;
}
});
instance_methods[44] = new objj_method(sel_registerName("setIndentationLevel:"), function $CPMenuItem__setIndentationLevel_(self, _cmd, aLevel)
{ with(self)
{
    if (aLevel < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "setIndentationLevel: argument must be greater than 0.");
    _indentationLevel = MIN(15, aLevel);
}
});
instance_methods[45] = new objj_method(sel_registerName("indentationLevel"), function $CPMenuItem__indentationLevel(self, _cmd)
{ with(self)
{
    return _indentationLevel;
}
});
instance_methods[46] = new objj_method(sel_registerName("setToolTip:"), function $CPMenuItem__setToolTip_(self, _cmd, aToolTip)
{ with(self)
{
    _toolTip = aToolTip;
}
});
instance_methods[47] = new objj_method(sel_registerName("toolTip"), function $CPMenuItem__toolTip(self, _cmd)
{ with(self)
{
    return _toolTip;
}
});
instance_methods[48] = new objj_method(sel_registerName("setRepresentedObject:"), function $CPMenuItem__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    _representedObject = anObject;
}
});
instance_methods[49] = new objj_method(sel_registerName("representedObject"), function $CPMenuItem__representedObject(self, _cmd)
{ with(self)
{
    return _representedObject;
}
});
instance_methods[50] = new objj_method(sel_registerName("setView:"), function $CPMenuItem__setView_(self, _cmd, aView)
{ with(self)
{
    if (_view == aView)
        return;
    _view = aView;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
});
instance_methods[51] = new objj_method(sel_registerName("view"), function $CPMenuItem__view(self, _cmd)
{ with(self)
{
    return _view;
}
});
instance_methods[52] = new objj_method(sel_registerName("isHighlighted"), function $CPMenuItem__isHighlighted(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "menu"), "highlightedItem") == self;
}
});
instance_methods[53] = new objj_method(sel_registerName("_menuItemView"), function $CPMenuItem___menuItemView(self, _cmd)
{ with(self)
{
    if (!_menuItemView)
        _menuItemView = objj_msgSend(objj_msgSend(_CPMenuItemView, "alloc"), "initWithFrame:forMenuItem:", CGRectMakeZero(), self);
    return _menuItemView;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{var the_class = objj_allocateClassPair(CPMenuItem, "_CPMenuItemSeparator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $_CPMenuItemSeparator__init(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem") }, "initWithTitle:action:keyEquivalent:", "", nil, "");
}
});
instance_methods[1] = new objj_method(sel_registerName("isSeparatorItem"), function $_CPMenuItemSeparator__isSeparatorItem(self, _cmd)
{ with(self)
{
    return YES;
}
});
class_addMethods(the_class, instance_methods);
}
var CPMenuItemTitleKey = "CPMenuItemTitleKey",
    CPMenuItemTargetKey = "CPMenuItemTargetKey",
    CPMenuItemActionKey = "CPMenuItemActionKey",
    CPMenuItemIsEnabledKey = "CPMenuItemIsEnabledKey",
    CPMenuItemIsHiddenKey = "CPMenuItemIsHiddenKey",
    CPMenuItemImageKey = "CPMenuItemImageKey",
    CPMenuItemAlternateImageKey = "CPMenuItemAlternateImageKey",
    CPMenuItemSubmenuKey = "CPMenuItemSubmenuKey",
    CPMenuItemMenuKey = "CPMenuItemMenuKey",
    CPMenuItemRepresentedObjectKey = "CPMenuItemRepresentedObjectKey";
{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenuItem\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPMenuItem__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTitleKey);
        _target = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTargetKey);
        _action = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemActionKey);
        _isEnabled = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemIsEnabledKey);
        _isHidden = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemIsHiddenKey);
        _image = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemImageKey);
        _alternateImage = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemAlternateImageKey);
        _submenu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemSubmenuKey);
        _menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemMenuKey);
    _representedObject = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemRepresentedObjectKey);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPMenuItem__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuItemTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _target, CPMenuItemTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _action, CPMenuItemActionKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _isEnabled, CPMenuItemIsEnabledKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _isHidden, CPMenuItemIsHiddenKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPMenuItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPMenuItemAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _submenu, CPMenuItemSubmenuKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPMenuItemMenuKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _representedObject, CPMenuItemRepresentedObjectKey);
}
});
class_addMethods(the_class, instance_methods);
}
var LEFT_MARGIN = 3.0,
    RIGHT_MARGIN = 16.0,
    STATE_COLUMN_WIDTH = 14.0,
    INDENTATION_WIDTH = 17.0;
var _CPMenuItemSelectionColor = nil,
    _CPMenuItemDefaultStateImages = [],
    _CPMenuItemDefaultStateHighlightedImages = [],
    _CPMenuItemViewMenuBarArrowImage = nil,
    _CPMenuItemViewMenuBarArrowActivatedImage = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItem"), new objj_ivar("_font"), new objj_ivar("_minSize"), new objj_ivar("_isDirty"), new objj_ivar("_showsStateColumn"), new objj_ivar("_belongsToMenuBar"), new objj_ivar("_stateView"), new objj_ivar("_imageAndTitleView"), new objj_ivar("_submenuImageView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPMenuItemView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuItemView, "class"))
        return;
    _CPMenuItemSelectionColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 81.0/255.0, 83.0/255.0, 109.0/255.0, 1.0);
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuItemDefaultStateImages[CPOffState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPOffState] = nil;
    _CPMenuItemDefaultStateImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnState.png"), CGSizeMake(14.0,14.0));
    _CPMenuItemDefaultStateHighlightedImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnStateHighlighted.png"), CGSizeMake(14.0,14.0));
    _CPMenuItemDefaultStateImages[CPMixedState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPMixedState] = nil;
}
});
class_methods[1] = new objj_method(sel_registerName("leftMargin"), function $_CPMenuItemView__leftMargin(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + STATE_COLUMN_WIDTH;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:forMenuItem:"), function $_CPMenuItemView__initWithFrame_forMenuItem_(self, _cmd, aFrame, aMenuItem)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _menuItem = aMenuItem;
        _showsStateColumn = YES;
        _isDirty = YES;
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "synchronizeWithMenuItem");
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("minSize"), function $_CPMenuItemView__minSize(self, _cmd)
{ with(self)
{
    return _minSize;
}
});
instance_methods[2] = new objj_method(sel_registerName("setDirty"), function $_CPMenuItemView__setDirty(self, _cmd)
{ with(self)
{
    _isDirty = YES;
}
});
instance_methods[3] = new objj_method(sel_registerName("synchronizeWithMenuItem"), function $_CPMenuItemView__synchronizeWithMenuItem(self, _cmd)
{ with(self)
{
    if (!_isDirty)
        return;
    _isDirty = NO;
    var view = objj_msgSend(_menuItem, "view");
    if (view)
    {
        objj_msgSend(_imageAndTitleView, "removeFromSuperview");
        _imageAndTitleView = nil;
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
        objj_msgSend(_submenuImageView, "removeFromSuperview");
        _submenuImageView = nil;
        _minSize = objj_msgSend(view, "frame").size;
        objj_msgSend(self, "setFrameSize:", _minSize);
        objj_msgSend(self, "addSubview:", view);
        return;
    }
    var x = _belongsToMenuBar ? 0.0 : (LEFT_MARGIN + objj_msgSend(_menuItem, "indentationLevel") * INDENTATION_WIDTH);
    if (_showsStateColumn)
    {
        if (!_stateView)
        {
            _stateView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(x,(CGRectGetHeight(objj_msgSend(self, "frame"))-STATE_COLUMN_WIDTH)/2.0,STATE_COLUMN_WIDTH,STATE_COLUMN_WIDTH));
            objj_msgSend(_stateView, "setAutoresizingMask:", CPViewMinYMargin|CPViewMaxYMargin);
            objj_msgSend(self, "addSubview:", _stateView);
        }
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", _CPMenuItemDefaultStateImages[state]);
                                break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
        x += STATE_COLUMN_WIDTH;
    }
    else
    {
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
    }
    if (!_imageAndTitleView)
    {
        _imageAndTitleView = objj_msgSend(objj_msgSend(_CPImageAndTitleView, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,0.0,0.0));
        objj_msgSend(_imageAndTitleView, "setImagePosition:", CPImageLeft);
        objj_msgSend(self, "addSubview:", _imageAndTitleView);
    }
    var font = objj_msgSend(_menuItem, "font");
    if (!font)
        font = _font;
    objj_msgSend(_imageAndTitleView, "setFont:", font);
    objj_msgSend(_imageAndTitleView, "setImage:", objj_msgSend(_menuItem, "image"));
    objj_msgSend(_imageAndTitleView, "setTitle:", objj_msgSend(_menuItem, "title"));
    objj_msgSend(_imageAndTitleView, "setTextColor:", objj_msgSend(_menuItem, "isEnabled")?objj_msgSend(CPColor, "blackColor"):objj_msgSend(CPColor, "darkGrayColor"));
    objj_msgSend(_imageAndTitleView, "setFrameOrigin:", CGPointMake(x,0.0));
    objj_msgSend(_imageAndTitleView, "sizeToFit");
    var frame = objj_msgSend(_imageAndTitleView, "frame");
    x += CGRectGetWidth(frame);
    if (objj_msgSend(_menuItem, "hasSubmenu"))
    {
        if (!_submenuImageView)
        {
            _submenuImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,10.0,10.0));
            objj_msgSend(self, "addSubview:", _submenuImageView);
        }
        if (_belongsToMenuBar && !_CPMenuItemViewMenuBarArrowImage)
            _CPMenuItemViewMenuBarArrowImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPMenuItemView, "class")), "pathForResource:", "_CPMenuItemView/_CPMenuItemViewMenuBarArrow.png"), CGSizeMake(10.0,10.0));
        objj_msgSend(_submenuImageView, "setHidden:", NO);
        objj_msgSend(_submenuImageView, "setImage:", _belongsToMenuBar?_CPMenuItemViewMenuBarArrowImage:nil);
        objj_msgSend(_submenuImageView, "setFrameOrigin:", CGPointMake(x,(CGRectGetHeight(frame)-10.0)/2.0));
        x += 10.0;
    }
    else
        objj_msgSend(_submenuImageView, "setHidden:", YES);
    _minSize = CGSizeMake(x + (_belongsToMenuBar ? 0.0 : RIGHT_MARGIN), CGRectGetHeight(frame));
    objj_msgSend(self, "setFrameSize:", _minSize);
}
});
instance_methods[4] = new objj_method(sel_registerName("calculatedLeftMargin"), function $_CPMenuItemView__calculatedLeftMargin(self, _cmd)
{ with(self)
{
    if (_belongsToMenuBar)
        return 0.0;
    return LEFT_MARGIN + (objj_msgSend(objj_msgSend(_menuItem, "menu"), "showsStateColumn") ? STATE_COLUMN_WIDTH : 0.0) + objj_msgSend(_menuItem, "indentationLevel") * INDENTATION_WIDTH;
}
});
instance_methods[5] = new objj_method(sel_registerName("setShowsStateColumn:"), function $_CPMenuItemView__setShowsStateColumn_(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
});
instance_methods[6] = new objj_method(sel_registerName("setBelongsToMenuBar:"), function $_CPMenuItemView__setBelongsToMenuBar_(self, _cmd, shouldBelongToMenuBar)
{ with(self)
{
    _belongsToMenuBar = shouldBelongToMenuBar;
}
});
instance_methods[7] = new objj_method(sel_registerName("highlight:"), function $_CPMenuItemView__highlight_(self, _cmd, shouldHighlight)
{ with(self)
{
    if (_belongsToMenuBar)
        objj_msgSend(_imageAndTitleView, "setImage:", shouldHighlight?objj_msgSend(_menuItem, "alternateImage"):objj_msgSend(_menuItem, "image"));
    else
    {
        objj_msgSend(_imageAndTitleView, "setTextColor:", shouldHighlight?objj_msgSend(CPColor, "whiteColor"):objj_msgSend(CPColor, "blackColor"));
        if (shouldHighlight)
            objj_msgSend(self, "setBackgroundColor:", _CPMenuItemSelectionColor);
        else
            objj_msgSend(self, "setBackgroundColor:", nil);
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", shouldHighlight?_CPMenuItemDefaultStateHighlightedImages[state]:_CPMenuItemDefaultStateImages[state]);
                                break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
    }
}
});
instance_methods[8] = new objj_method(sel_registerName("activate:"), function $_CPMenuItemView__activate_(self, _cmd, shouldActivate)
{ with(self)
{
    objj_msgSend(_imageAndTitleView, "setImage:", objj_msgSend(_menuItem, "image"));
    if (shouldActivate)
    {
        if (!_CPMenuItemViewMenuBarArrowActivatedImage)
            _CPMenuItemViewMenuBarArrowActivatedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPMenuItemView, "class")), "pathForResource:", "_CPMenuItemView/_CPMenuItemViewMenuBarArrowActivated.png"), CGSizeMake(10.0,10.0));
        objj_msgSend(_imageAndTitleView, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_submenuImageView, "setImage:", _CPMenuItemViewMenuBarArrowActivatedImage);
    }
    else
    {
        objj_msgSend(_imageAndTitleView, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(_submenuImageView, "setImage:", _CPMenuItemViewMenuBarArrowImage);
    }
}
});
instance_methods[9] = new objj_method(sel_registerName("eventOnSubmenu:"), function $_CPMenuItemView__eventOnSubmenu_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_menuItem, "hasSubmenu"))
        return NO;
    return CGRectContainsPoint(objj_msgSend(_submenuImageView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
}
});
instance_methods[10] = new objj_method(sel_registerName("isHidden"), function $_CPMenuItemView__isHidden(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isHidden");
}
});
instance_methods[11] = new objj_method(sel_registerName("menuItem"), function $_CPMenuItemView__menuItem(self, _cmd)
{ with(self)
{
    return _menuItem;
}
});
instance_methods[12] = new objj_method(sel_registerName("setFont:"), function $_CPMenuItemView__setFont_(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(self, "setDirty");
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;9;CPPanel.ji;10;CPWindow.jc;1889;
CPOKButton = 1;
CPCancelButton = 0;
{var the_class = objj_allocateClassPair(CPWindow, "CPPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_becomesKeyOnlyIfNeeded"), new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("isFloatingPanel"), function $CPPanel__isFloatingPanel(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "level") == CPFloatingWindowLevel;
}
});
instance_methods[1] = new objj_method(sel_registerName("setFloatingPanel:"), function $CPPanel__setFloatingPanel_(self, _cmd, isFloatingPanel)
{ with(self)
{
    objj_msgSend(self, "setLevel:", isFloatingPanel?CPFloatingWindowLevel:CPNormalWindowLevel);
}
});
instance_methods[2] = new objj_method(sel_registerName("becomesKeyOnlyIfNeeded"), function $CPPanel__becomesKeyOnlyIfNeeded(self, _cmd)
{ with(self)
{
    return _becomesKeyOnlyIfNeeded;
}
});
instance_methods[3] = new objj_method(sel_registerName("setBecomesKeyOnlyIfNeeded:"), function $CPPanel__setBecomesKeyOnlyIfNeeded_(self, _cmd, shouldBecomeKeyOnlyIfNeeded)
{ with(self)
{
    _becomesKeyOnlyIfNeeded = shouldBecomeKeyOnlyIfNeeded
}
});
instance_methods[4] = new objj_method(sel_registerName("worksWhenModal"), function $CPPanel__worksWhenModal(self, _cmd)
{ with(self)
{
    return _worksWhenModal;
}
});
instance_methods[5] = new objj_method(sel_registerName("setWorksWhenModal:"), function $CPPanel__setWorksWhenModal_(self, _cmd, shouldWorkWhenModal)
{ with(self)
{
    _worksWhenModal = shouldWorkWhenModal;
}
});
instance_methods[6] = new objj_method(sel_registerName("canBecomeMainWindow"), function $CPPanel__canBecomeMainWindow(self, _cmd)
{ with(self)
{
    return NO;
}
});
class_addMethods(the_class, instance_methods);
}

p;14;CPPasteboard.jI;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;6585;
CPGeneralPboard = "CPGeneralPboard";
CPFontPboard = "CPFontPboard";
CPRulerPboard = "CPRulerPboard";
CPFindPboard = "CPFindPboard";
CPDragPboard = "CPDragPboard";
CPColorPboardType = "CPColorPboardType";
CPFilenamesPboardType = "CPFilenamesPboardType";
CPFontPboardType = "CPFontPboardType";
CPHTMLPboardType = "CPHTMLPboardType";
CPStringPboardType = "CPStringPboardType";
CPURLPboardType = "CPURLPboardType";
CPImagePboardType = "CPImagePboardType";
var CPPasteboards = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPPasteboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_types"), new objj_ivar("_owners"), new objj_ivar("_provided"), new objj_ivar("_changeCount"), new objj_ivar("_stateUID")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPPasteboard__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPPasteboard, "class"))
        return;
    objj_msgSend(self, "setVersion:", 1.0);
    CPPasteboards = objj_msgSend(CPDictionary, "dictionary");
}
});
class_methods[1] = new objj_method(sel_registerName("generalPasteboard"), function $CPPasteboard__generalPasteboard(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPasteboard, "pasteboardWithName:", CPGeneralPboard);
}
});
class_methods[2] = new objj_method(sel_registerName("pasteboardWithName:"), function $CPPasteboard__pasteboardWithName_(self, _cmd, aName)
{ with(self)
{
    var pasteboard = objj_msgSend(CPPasteboards, "objectForKey:", aName);
    if (pasteboard)
        return pasteboard;
    pasteboard = objj_msgSend(objj_msgSend(CPPasteboard, "alloc"), "_initWithName:", aName);
    objj_msgSend(CPPasteboards, "setObject:forKey:", pasteboard, aName);
    return pasteboard;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_initWithName:"), function $CPPasteboard___initWithName_(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _types = [];
        _owners = objj_msgSend(CPDictionary, "dictionary");
        _provided = objj_msgSend(CPDictionary, "dictionary");
        _changeCount = 0;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("addTypes:owner:"), function $CPPasteboard__addTypes_owner_(self, _cmd, types, anOwner)
{ with(self)
{
    var i = 0,
        count = types.length;
    for (; i < count; ++i)
    {
        var type = types[i];
        if(!objj_msgSend(_owners, "objectForKey:", type))
        {
            objj_msgSend(_types, "addObject:", type);
            objj_msgSend(_provided, "removeObjectForKey:", type);
        }
        objj_msgSend(_owners, "setObject:forKey:", anOwner, type);
    }
    return ++_changeCount;
}
});
instance_methods[2] = new objj_method(sel_registerName("declareTypes:owner:"), function $CPPasteboard__declareTypes_owner_(self, _cmd, types, anOwner)
{ with(self)
{
    objj_msgSend(_types, "setArray:", types);
    _owners = objj_msgSend(CPDictionary, "dictionary");
    _provided = objj_msgSend(CPDictionary, "dictionary");
    var count = _types.length;
    while (count--)
        objj_msgSend(_owners, "setObject:forKey:", anOwner, _types[count]);
    return ++_changeCount;
}
});
instance_methods[3] = new objj_method(sel_registerName("setData:forType:"), function $CPPasteboard__setData_forType_(self, _cmd, aData, aType)
{ with(self)
{
    objj_msgSend(_provided, "setObject:forKey:", aData, aType);
    return YES;
}
});
instance_methods[4] = new objj_method(sel_registerName("setPropertyList:forType:"), function $CPPasteboard__setPropertyList_forType_(self, _cmd, aPropertyList, aType)
{ with(self)
{
    return objj_msgSend(self, "setData:forType:", objj_msgSend(CPPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", aPropertyList, CPPropertyListXMLFormat_v1_0, nil), aType);
}
});
instance_methods[5] = new objj_method(sel_registerName("setString:forType:"), function $CPPasteboard__setString_forType_(self, _cmd, aString, aType)
{ with(self)
{
    return objj_msgSend(self, "setPropertyList:forType:", aString, aType);
}
});
instance_methods[6] = new objj_method(sel_registerName("availableTypeFromArray:"), function $CPPasteboard__availableTypeFromArray_(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(_types, "firstObjectCommonWithArray:", anArray);
}
});
instance_methods[7] = new objj_method(sel_registerName("types"), function $CPPasteboard__types(self, _cmd)
{ with(self)
{
    return _types;
}
});
instance_methods[8] = new objj_method(sel_registerName("changeCount"), function $CPPasteboard__changeCount(self, _cmd)
{ with(self)
{
    return _changeCount;
}
});
instance_methods[9] = new objj_method(sel_registerName("dataForType:"), function $CPPasteboard__dataForType_(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(_provided, "objectForKey:", aType);
    if (data)
        return data;
    var owner = objj_msgSend(_owners, "objectForKey:", aType);
    if (owner)
    {
        objj_msgSend(owner, "pasteboard:provideDataForType:", self, aType);
        ++_changeCount;
        return objj_msgSend(_provided, "objectForKey:", aType);
    }
    return nil;
}
});
instance_methods[10] = new objj_method(sel_registerName("propertyListForType:"), function $CPPasteboard__propertyListForType_(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(self, "dataForType:", aType);
    if (data)
        return objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", data, CPPropertyListXMLFormat_v1_0, nil);
    return nil;
}
});
instance_methods[11] = new objj_method(sel_registerName("stringForType:"), function $CPPasteboard__stringForType_(self, _cmd, aType)
{ with(self)
{
    return objj_msgSend(self, "propertyListForType:", aType);
}
});
instance_methods[12] = new objj_method(sel_registerName("_generateStateUID"), function $CPPasteboard___generateStateUID(self, _cmd)
{ with(self)
{
    var bits = 32;
    _stateUID = "";
    while (bits--)
        _stateUID += FLOOR(RAND() * 16.0).toString(16).toUpperCase();
    return _stateUID;
}
});
instance_methods[13] = new objj_method(sel_registerName("_stateUID"), function $CPPasteboard___stateUID(self, _cmd)
{ with(self)
{
    return _stateUID;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;15;CPPopUpButton.ji;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;19785;
var VISIBLE_MARGIN = 7.0;
var CPPopUpButtonArrowsImage = nil;
{var the_class = objj_allocateClassPair(CPButton, "CPPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_pullsDown"), new objj_ivar("_selectedIndex"), new objj_ivar("_preferredEdge"), new objj_ivar("_arrowsView"), new objj_ivar("_menu")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:pullsDown:"), function $CPPopUpButton__initWithFrame_pullsDown_(self, _cmd, aFrame, shouldPullDown)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithFrame:", aFrame);
    if (self)
    {
        _pullsDown = shouldPullDown;
        _selectedIndex = CPNotFound;
        _preferredEdge = CPMaxYEdge;
        objj_msgSend(self, "setBezelStyle:", CPTexturedRoundedBezelStyle);
        objj_msgSend(self, "setImagePosition:", CPImageLeft);
        objj_msgSend(self, "setAlignment:", CPLeftTextAlignment);
        objj_msgSend(self, "setMenu:", objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", ""));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithFrame:"), function $CPPopUpButton__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:pullsDown:", aFrame, NO);
}
});
instance_methods[2] = new objj_method(sel_registerName("setBordered:"), function $CPPopUpButton__setBordered_(self, _cmd, shouldBeBordered)
{ with(self)
{
    if (shouldBeBordered)
    {
        var bounds = objj_msgSend(self, "bounds");
        _arrowsView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)-10.0,(CGRectGetHeight(bounds)-8.0)/2.0,5.0,8.0));
        if (!CPPopUpButtonArrowsImage)
            CPPopUpButtonArrowsImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPPopUpButton, "class")), "pathForResource:", "CPPopUpButton/CPPopUpButtonArrows.png"), CGSizeMake(5.0,8.0));
        objj_msgSend(_arrowsView, "setImage:", CPPopUpButtonArrowsImage);
        objj_msgSend(_arrowsView, "setAutoresizingMask:", CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
        objj_msgSend(self, "addSubview:", _arrowsView);
    }
    else
    {
        objj_msgSend(_arrowsView, "removeFromSuperview");
        _arrowsView = nil;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setBordered:", shouldBeBordered);
}
});
instance_methods[3] = new objj_method(sel_registerName("setPullsDown:"), function $CPPopUpButton__setPullsDown_(self, _cmd, shouldPullDown)
{ with(self)
{
    if (_pullsDown == shouldPullDown)
        return;
    _pullsDown = shouldPullDown;
    var items = objj_msgSend(_menu, "itemArray");
    if (items.length <= 0)
        return;
    objj_msgSend(items[0], "setHidden:", _pullsDown);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
});
instance_methods[4] = new objj_method(sel_registerName("pullsDown"), function $CPPopUpButton__pullsDown(self, _cmd)
{ with(self)
{
    return _pullsDown;
}
});
instance_methods[5] = new objj_method(sel_registerName("addItemWithTitle:"), function $CPPopUpButton__addItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_menu, "addItemWithTitle:action:keyEquivalent:", aTitle, NULL, NULL);
}
});
instance_methods[6] = new objj_method(sel_registerName("addItemsWithTitles:"), function $CPPopUpButton__addItemsWithTitles_(self, _cmd, titles)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(titles, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "addItemWithTitle:", titles[index]);
}
});
instance_methods[7] = new objj_method(sel_registerName("insertItemWithTitle:atIndex:"), function $CPPopUpButton__insertItemWithTitle_atIndex_(self, _cmd, aTitle, anIndex)
{ with(self)
{
    var items = objj_msgSend(self, "itemArray"),
        count = objj_msgSend(items, "count");
    while (count--)
        if (objj_msgSend(items[count], "title") == aTitle)
            objj_msgSend(self, "removeItemAtIndex:", count);
    objj_msgSend(_menu, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, NULL, NULL, anIndex);
}
});
instance_methods[8] = new objj_method(sel_registerName("removeAllItems"), function $CPPopUpButton__removeAllItems(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_menu, "numberOfItems");
    while (count--)
        objj_msgSend(_menu, "removeItemAtIndex:", 0);
}
});
instance_methods[9] = new objj_method(sel_registerName("removeItemWithTitle:"), function $CPPopUpButton__removeItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
});
instance_methods[10] = new objj_method(sel_registerName("removeItemAtIndex:"), function $CPPopUpButton__removeItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(_menu, "removeItemAtIndex:", anIndex);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
});
instance_methods[11] = new objj_method(sel_registerName("selectedItem"), function $CPPopUpButton__selectedItem(self, _cmd)
{ with(self)
{
    if (_selectedIndex < 0)
        return nil;
    return objj_msgSend(_menu, "itemAtIndex:", _selectedIndex);
}
});
instance_methods[12] = new objj_method(sel_registerName("titleOfSelectedItem"), function $CPPopUpButton__titleOfSelectedItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "selectedItem"), "title");
}
});
instance_methods[13] = new objj_method(sel_registerName("indexOfSelectedItem"), function $CPPopUpButton__indexOfSelectedItem(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
});
instance_methods[14] = new objj_method(sel_registerName("objectValue"), function $CPPopUpButton__objectValue(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
});
instance_methods[15] = new objj_method(sel_registerName("selectItem:"), function $CPPopUpButton__selectItem_(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItem:", aMenuItem));
}
});
instance_methods[16] = new objj_method(sel_registerName("selectItemAtIndex:"), function $CPPopUpButton__selectItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    if (_selectedIndex == anIndex)
        return;
    if (_selectedIndex >= 0 && !_pullsDown)
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOffState);
    _selectedIndex = anIndex;
    if (_selectedIndex >= 0 && !_pullsDown)
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOnState);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
});
instance_methods[17] = new objj_method(sel_registerName("selectItemWithTag:"), function $CPPopUpButton__selectItemWithTag_(self, _cmd, aTag)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTag:", aTag));
}
});
instance_methods[18] = new objj_method(sel_registerName("selectItemWithTitle:"), function $CPPopUpButton__selectItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
}
});
instance_methods[19] = new objj_method(sel_registerName("setObjectValue:"), function $CPPopUpButton__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aValue, "intValue"));
}
});
instance_methods[20] = new objj_method(sel_registerName("menu"), function $CPPopUpButton__menu(self, _cmd)
{ with(self)
{
    return _menu;
}
});
instance_methods[21] = new objj_method(sel_registerName("setMenu:"), function $CPPopUpButton__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    if (_menu == aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:selector:name:object:", self, sel_registerName("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:selector:name:object:", self, sel_registerName("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:selector:name:object:", self, sel_registerName("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
});
instance_methods[22] = new objj_method(sel_registerName("numberOfItems"), function $CPPopUpButton__numberOfItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "numberOfItems");
}
});
instance_methods[23] = new objj_method(sel_registerName("itemArray"), function $CPPopUpButton__itemArray(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "itemArray");
}
});
instance_methods[24] = new objj_method(sel_registerName("itemAtIndex:"), function $CPPopUpButton__itemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", anIndex);
}
});
instance_methods[25] = new objj_method(sel_registerName("itemTitleAtIndex:"), function $CPPopUpButton__itemTitleAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemAtIndex:", anIndex), "title");
}
});
instance_methods[26] = new objj_method(sel_registerName("itemTitles"), function $CPPopUpButton__itemTitles(self, _cmd)
{ with(self)
{
    var titles = [],
        items = objj_msgSend(self, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count");
    for (; index < count; ++index)
        items.push(objj_msgSend(items[index], "title"));
}
});
instance_methods[27] = new objj_method(sel_registerName("itemWithTitle:"), function $CPPopUpButton__itemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle));
}
});
instance_methods[28] = new objj_method(sel_registerName("lastItem"), function $CPPopUpButton__lastItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemArray"), "lastObject");
}
});
instance_methods[29] = new objj_method(sel_registerName("indexOfItem:"), function $CPPopUpButton__indexOfItem_(self, _cmd, aMenuItem)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItem:", aMenuItem);
}
});
instance_methods[30] = new objj_method(sel_registerName("indexOfItemWithTag:"), function $CPPopUpButton__indexOfItemWithTag_(self, _cmd, aTag)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTag:", aMenuItem);
}
});
instance_methods[31] = new objj_method(sel_registerName("indexOfItemWithTitle:"), function $CPPopUpButton__indexOfItemWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle);
}
});
instance_methods[32] = new objj_method(sel_registerName("indexOfItemWithRepresentedObject:"), function $CPPopUpButton__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithRepresentedObejct:", anObject);
}
});
instance_methods[33] = new objj_method(sel_registerName("indexOfItemWithTarget:action:"), function $CPPopUpButton__indexOfItemWithTarget_action_(self, _cmd, aTarget, anAction)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTarget:action:", aTarget, anAction);
}
});
instance_methods[34] = new objj_method(sel_registerName("preferredEdge"), function $CPPopUpButton__preferredEdge(self, _cmd)
{ with(self)
{
    return _preferredEdge;
}
});
instance_methods[35] = new objj_method(sel_registerName("setPreferredEdge:"), function $CPPopUpButton__setPreferredEdge_(self, _cmd, aRectEdge)
{ with(self)
{
    _preferredEdge = aRectEdge;
}
});
instance_methods[36] = new objj_method(sel_registerName("setTitle:"), function $CPPopUpButton__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    if (objj_msgSend(self, "title") == aTitle)
        return;
    if (_pullsDown)
    {
        objj_msgSend(_items[0], "setTitle:", aTitle);
        objj_msgSend(self, "synchronizeTitleAndSelectedItem");
    }
    else
    {
        var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
        if (index < 0)
        {
            objj_msgSend(self, "addItemWithTitle:", aTitle);
            index = objj_msgSend(self, "numberOfItems") - 1;
        }
        objj_msgSend(self, "selectItemAtIndex:", index);
    }
}
});
instance_methods[37] = new objj_method(sel_registerName("setImage:"), function $CPPopUpButton__setImage_(self, _cmd, anImage)
{ with(self)
{}
});
instance_methods[38] = new objj_method(sel_registerName("synchronizeTitleAndSelectedItem"), function $CPPopUpButton__synchronizeTitleAndSelectedItem(self, _cmd)
{ with(self)
{
    var item = nil;
    if (_pullsDown)
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (items.length > 0)
            item = items[0];
    }
    else
        item = objj_msgSend(self, "selectedItem");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setImage:", objj_msgSend(item, "image"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setTitle:", objj_msgSend(item, "title"));
}
});
instance_methods[39] = new objj_method(sel_registerName("menuDidAddItem:"), function $CPPopUpButton__menuDidAddItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (_selectedIndex < 0)
        objj_msgSend(self, "selectItemAtIndex:", 0);
    else if (index == _selectedIndex)
        objj_msgSend(self, "synchronizeTitleAndSelectedItem");
    else if (index < _selectedIndex)
        ++_selectedIndex;
    if (index == 0 && _pullsDown)
    {
        var items = objj_msgSend(_menu, "itemArray");
        objj_msgSend(items[0], "setHidden:", YES);
        if (items.length > 0)
            objj_msgSend(items[1], "setHidden:", NO);
    }
}
});
instance_methods[40] = new objj_method(sel_registerName("menuDidChangeItem:"), function $CPPopUpButton__menuDidChangeItem_(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (_pullsDown && index != 0)
        return;
    if (!_pullsDown && index != _selectedIndex)
        return;
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
});
instance_methods[41] = new objj_method(sel_registerName("menuDidRemoveItem:"), function $CPPopUpButton__menuDidRemoveItem_(self, _cmd, aNotification)
{ with(self)
{
    var numberOfItems = objj_msgSend(self, "numberOfItems");
    if (numberOfItems <= _selectedIndex)
        objj_msgSend(self, "selectItemAtIndex:", numberOfItems-1);
}
});
instance_methods[42] = new objj_method(sel_registerName("mouseDown:"), function $CPPopUpButton__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "highlight:", YES);
    var theWindow = objj_msgSend(self, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", objj_msgSend(self, "menu"), objj_msgSend(self, "font"));
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    var menuOrigin = objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(self, "convertPoint:toView:", CGPointMakeZero(), nil));
    if (_pullsDown)
        menuOrigin.y += CGRectGetHeight(objj_msgSend(self, "frame"));
    else
    {
        var contentRect = objj_msgSend(menuWindow, "rectForItemAtIndex:", _selectedIndex);
        menuOrigin.x -= CGRectGetMinX(contentRect) + objj_msgSend(_CPMenuItemView, "leftMargin");
        menuOrigin.y -= CGRectGetMinY(contentRect);
    }
    objj_msgSend(menuWindow, "setFrameOrigin:", menuOrigin);
    var menuMaxX = CGRectGetMaxX(objj_msgSend(menuWindow, "frame")),
        buttonMaxX = CGRectGetMaxX(objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "bounds"), nil));
    if (menuMaxX < buttonMaxX)
        objj_msgSend(menuWindow, "setMinWidth:", CGRectGetWidth(objj_msgSend(menuWindow, "frame"))+buttonMaxX-menuMaxX-VISIBLE_MARGIN);
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_registerName("menuWindowDidFinishTracking:highlightedItem:"));
}
});
instance_methods[43] = new objj_method(sel_registerName("menuWindowDidFinishTracking:highlightedItem:"), function $CPPopUpButton__menuWindowDidFinishTracking_highlightedItem_(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    objj_msgSend(self, "highlight:", NO);
    var index = objj_msgSend(_menu, "indexOfItem:", aMenuItem);
    if (index == CPNotFound)
        return;
    objj_msgSend(self, "selectItemAtIndex:", index);
    var selectedItem = objj_msgSend(self, "selectedItem"),
        target = nil,
        action = objj_msgSend(selectedItem, "action");
    if (!action)
    {
        target = objj_msgSend(self, "target");
        action = objj_msgSend(self, "action");
    }
    else
        target = objj_msgSend(selectedItem, "target");
    objj_msgSend(self, "sendAction:to:", action, target);
}
});
class_addMethods(the_class, instance_methods);
}
var CPPopUpButtonMenuKey = "CPPopUpButtonMenuKey",
    CPPopUpButtonSelectedIndexKey = "CPPopUpButtonSelectedIndexKey",
    CPPopUpButtonPullsDownKey = "CPPopUpButtonPullsDownKey";
{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPPopUpButton\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPPopUpButton__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setMenu:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonMenuKey));
        objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonSelectedIndexKey));
        objj_msgSend(self, "setPullsDown:", objj_msgSend(aCoder, "decodeBoolForKey:", CPPopUpButtonPullsDownKey));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPPopUpButton__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPPopUpButtonMenuKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedIndex, CPPopUpButtonSelectedIndexKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _pullsDown, CPPopUpButtonPullsDownKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;21;CPProgressIndicator.jI;19;AppKit/CGGeometry.jI;20;AppKit/CPImageView.jI;15;AppKit/CPView.jc;13736;
CPProgressIndicatorBarStyle = 0;
CPProgressIndicatorSpinningStyle = 1;
CPProgressIndicatorHUDBarStyle = 2;
var CPProgressIndicatorSpinningStyleColors = nil,
    CPProgressIndicatorClassName = nil,
    CPProgressIndicatorStyleIdentifiers = nil,
    CPProgressIndicatorStyleSizes = nil;
{var the_class = objj_allocateClassPair(CPView, "CPProgressIndicator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_doubleValue"), new objj_ivar("_controlSize"), new objj_ivar("_isIndeterminate"), new objj_ivar("_style"), new objj_ivar("_isAnimating"), new objj_ivar("_isDisplayedWhenStoppedSet"), new objj_ivar("_isDisplayedWhenStopped"), new objj_ivar("_barView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPProgressIndicator__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPProgressIndicator, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPProgressIndicatorSpinningStyleColors = [];
    CPProgressIndicatorSpinningStyleColors[CPMiniControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0,64.0)));
    CPProgressIndicatorSpinningStyleColors[CPSmallControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0,64.0)));
    CPProgressIndicatorSpinningStyleColors[CPRegularControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0,64.0)));
    CPProgressIndicatorBezelBorderViewPool = [];
    var start = CPProgressIndicatorBarStyle,
        end = CPProgressIndicatorHUDBarStyle;
    for (; start <= end; ++start)
    {
        CPProgressIndicatorBezelBorderViewPool[start] = [];
        CPProgressIndicatorBezelBorderViewPool[start][CPMiniControlSize] = [];
        CPProgressIndicatorBezelBorderViewPool[start][CPSmallControlSize] = [];
        CPProgressIndicatorBezelBorderViewPool[start][CPRegularControlSize] = [];
    }
    CPProgressIndicatorClassName = objj_msgSend(self, "className");
    CPProgressIndicatorStyleIdentifiers = [];
    CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle] = "Bar";
    CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorSpinningStyle] = "Spinny";
    CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle] = "HUDBar";
    var regularIdentifier = _CPControlIdentifierForControlSize(CPRegularControlSize),
        smallIdentifier = _CPControlIdentifierForControlSize(CPSmallControlSize),
        miniIdentifier = _CPControlIdentifierForControlSize(CPMiniControlSize);
    CPProgressIndicatorStyleSizes = [];
    var prefix = CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle];
    CPProgressIndicatorStyleSizes[prefix+regularIdentifier] = [{width:3.0,height:15.0},{width:1.0,height:15.0},{width:3.0,height:15.0}];
    CPProgressIndicatorStyleSizes[prefix+smallIdentifier] = [{width:3.0,height:15.0},{width:1.0,height:15.0},{width:3.0,height:15.0}];
    CPProgressIndicatorStyleSizes[prefix+miniIdentifier] = [{width:3.0,height:15.0},{width:1.0,height:15.0},{width:3.0,height:15.0}];
    prefix = CPProgressIndicatorClassName + "Bar" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle];
    CPProgressIndicatorStyleSizes[prefix+regularIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix+smallIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix+miniIdentifier] = { width:1.0, height:9.0 };
    prefix = CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle];
    CPProgressIndicatorStyleSizes[prefix+regularIdentifier] = [{width:3.0,height:15.0},{width:1.0,height:15.0},{width:3.0,height:15.0}];
    CPProgressIndicatorStyleSizes[prefix+smallIdentifier] = [{width:3.0,height:15.0},{width:1.0,height:15.0},{width:3.0,height:15.0}];
    CPProgressIndicatorStyleSizes[prefix+miniIdentifier] = [{width:3.0,height:15.0},{width:1.0,height:15.0},{width:3.0,height:15.0}];
    prefix = CPProgressIndicatorClassName + "Bar" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle];
    CPProgressIndicatorStyleSizes[prefix+regularIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix+smallIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix+miniIdentifier] = { width:1.0, height:9.0 };
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPProgressIndicator__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minValue = 0.0;
        _maxValue = 100.0;
        _doubleValue = 0.0;
        _style = CPProgressIndicatorBarStyle;
        _isDisplayedWhenStoppedSet = NO;
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "updateBackgroundColor");
        objj_msgSend(self, "drawBar");
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setUsesThreadedAnimation:"), function $CPProgressIndicator__setUsesThreadedAnimation_(self, _cmd, aFlag)
{ with(self)
{}
});
instance_methods[2] = new objj_method(sel_registerName("startAnimation:"), function $CPProgressIndicator__startAnimation_(self, _cmd, aSender)
{ with(self)
{
    _isAnimating = YES;
    objj_msgSend(self, "_hideOrDisplay");
}
});
instance_methods[3] = new objj_method(sel_registerName("stopAnimation:"), function $CPProgressIndicator__stopAnimation_(self, _cmd, aSender)
{ with(self)
{
    _isAnimating = NO;
    objj_msgSend(self, "_hideOrDisplay");
}
});
instance_methods[4] = new objj_method(sel_registerName("usesThreadedAnimation"), function $CPProgressIndicator__usesThreadedAnimation(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[5] = new objj_method(sel_registerName("incrementBy:"), function $CPProgressIndicator__incrementBy_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "setDoubleValue:", _doubleValue+aValue);
}
});
instance_methods[6] = new objj_method(sel_registerName("setDoubleValue:"), function $CPProgressIndicator__setDoubleValue_(self, _cmd, aValue)
{ with(self)
{
    _doubleValue = MIN(MAX(aValue, _minValue), _maxValue);
    objj_msgSend(self, "drawBar");
}
});
instance_methods[7] = new objj_method(sel_registerName("doubleValue"), function $CPProgressIndicator__doubleValue(self, _cmd)
{ with(self)
{
    return _doubleValue;
}
});
instance_methods[8] = new objj_method(sel_registerName("setMinValue:"), function $CPProgressIndicator__setMinValue_(self, _cmd, aValue)
{ with(self)
{
    _minValue = aValue;
}
});
instance_methods[9] = new objj_method(sel_registerName("minValue"), function $CPProgressIndicator__minValue(self, _cmd)
{ with(self)
{
    return _minValue;
}
});
instance_methods[10] = new objj_method(sel_registerName("setMaxValue:"), function $CPProgressIndicator__setMaxValue_(self, _cmd, aValue)
{ with(self)
{
    _maxValue = aValue;
}
});
instance_methods[11] = new objj_method(sel_registerName("maxValue"), function $CPProgressIndicator__maxValue(self, _cmd)
{ with(self)
{
    return _maxValue;
}
});
instance_methods[12] = new objj_method(sel_registerName("setControlSize:"), function $CPProgressIndicator__setControlSize_(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "updateBackgroundColor");
}
});
instance_methods[13] = new objj_method(sel_registerName("controlSize"), function $CPProgressIndicator__controlSize(self, _cmd)
{ with(self)
{
    return _controlSize;
}
});
instance_methods[14] = new objj_method(sel_registerName("setControlTint:"), function $CPProgressIndicator__setControlTint_(self, _cmd, aControlTint)
{ with(self)
{}
});
instance_methods[15] = new objj_method(sel_registerName("controlTint"), function $CPProgressIndicator__controlTint(self, _cmd)
{ with(self)
{
    return 0;
}
});
instance_methods[16] = new objj_method(sel_registerName("setBezeled:"), function $CPProgressIndicator__setBezeled_(self, _cmd, isBezeled)
{ with(self)
{}
});
instance_methods[17] = new objj_method(sel_registerName("isBezeled"), function $CPProgressIndicator__isBezeled(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[18] = new objj_method(sel_registerName("setIndeterminate:"), function $CPProgressIndicator__setIndeterminate_(self, _cmd, isIndeterminate)
{ with(self)
{
    if (_indeterminate == isIndeterminate)
        return;
    _isIndeterminate = isIndeterminate;
    objj_msgSend(self, "updateBackgroundColor");
}
});
instance_methods[19] = new objj_method(sel_registerName("isIndeterminate"), function $CPProgressIndicator__isIndeterminate(self, _cmd)
{ with(self)
{
    return _isIndeterminate;
}
});
instance_methods[20] = new objj_method(sel_registerName("setStyle:"), function $CPProgressIndicator__setStyle_(self, _cmd, aStyle)
{ with(self)
{
    if (_style == aStyle)
        return;
    _style = aStyle;
    objj_msgSend(self, "updateBackgroundColor");
}
});
instance_methods[21] = new objj_method(sel_registerName("sizeToFit"), function $CPProgressIndicator__sizeToFit(self, _cmd)
{ with(self)
{
    if (_style == CPProgressIndicatorSpinningStyle)
        objj_msgSend(self, "setFrameSize:", objj_msgSend(objj_msgSend(CPProgressIndicatorSpinningStyleColors[_controlSize], "patternImage"), "size"));
    else
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")),CPProgressIndicatorStyleSizes[CPProgressIndicatorClassName+"BezelBorder"+CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle]+_CPControlIdentifierForControlSize(_controlSize)][0].height));
}
});
instance_methods[22] = new objj_method(sel_registerName("setDisplayedWhenStopped:"), function $CPProgressIndicator__setDisplayedWhenStopped_(self, _cmd, isDisplayedWhenStopped)
{ with(self)
{
    if (_isDisplayedWhenStoppedSet && _isDisplayedWhenStopped == isDisplayedWhenStopped)
        return;
    _isDisplayedWhenStoppedSet = YES;
    _isDisplayedWhenStopped = isDisplayedWhenStopped;
    objj_msgSend(self, "_hideOrDisplay");
}
});
instance_methods[23] = new objj_method(sel_registerName("isDisplayedWhenStopped"), function $CPProgressIndicator__isDisplayedWhenStopped(self, _cmd)
{ with(self)
{
    if (_isDisplayedWhenStoppedSet)
        return _isDisplayedWhenStopped;
    if (_style == CPProgressIndicatorBarStyle || _style == CPProgressIndicatorHUDBarStyle)
        return YES;
    return NO;
}
});
instance_methods[24] = new objj_method(sel_registerName("_hideOrDisplay"), function $CPProgressIndicator___hideOrDisplay(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setHidden:", !_isAnimating&&!objj_msgSend(self, "isDisplayedWhenStopped"));
}
});
instance_methods[25] = new objj_method(sel_registerName("setFrameSize:"), function $CPProgressIndicator__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "drawBar");
}
});
instance_methods[26] = new objj_method(sel_registerName("drawBar"), function $CPProgressIndicator__drawBar(self, _cmd)
{ with(self)
{
    if (_style == CPProgressIndicatorSpinningStyle)
        return;
    if (!_barView)
    {
        _barView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2.0,2.0,0.0,9.0));
        objj_msgSend(_barView, "setBackgroundColor:", objj_msgSend(CPColor, "redColor"));
        objj_msgSend(self, "addSubview:", _barView);
    }
    objj_msgSend(_barView, "setBackgroundColor:", _CPControlColorWithPatternImage(CPProgressIndicatorStyleSizes,CPProgressIndicatorClassName,"Bar",CPProgressIndicatorStyleIdentifiers[_style],_CPControlIdentifierForControlSize(_controlSize)));
    objj_msgSend(_barView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "bounds"))*(_doubleValue-_minValue)/(_maxValue-_minValue)-4.0,9.0));
}
});
instance_methods[27] = new objj_method(sel_registerName("updateBackgroundColor"), function $CPProgressIndicator__updateBackgroundColor(self, _cmd)
{ with(self)
{
    if (YES)
    {
        if (_style == CPProgressIndicatorSpinningStyle)
        {
            objj_msgSend(_barView, "removeFromSuperview");
            _barView = nil;
            objj_msgSend(self, "setBackgroundColor:", CPProgressIndicatorSpinningStyleColors[_controlSize]);
        }
        else
        {
            objj_msgSend(self, "setBackgroundColor:", _CPControlThreePartImagePattern(NO,CPProgressIndicatorStyleSizes,CPProgressIndicatorClassName,"BezelBorder",CPProgressIndicatorStyleIdentifiers[_style],_CPControlIdentifierForControlSize(_controlSize)));
            objj_msgSend(self, "drawBar");
        }
    }
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;13;CPResponder.jI;21;Foundation/CPObject.jc;7727;
CPDeleteKeyCode = 8;
CPUpArrowKeyCode = 63232;
CPDownArrowKeyCode = 63233;
CPLeftArrowKeyCode = 63234;
CPRightArrowKeyCode = 63235;
{var the_class = objj_allocateClassPair(CPObject, "CPResponder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_nextResponder")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("acceptsFirstResponder"), function $CPResponder__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[1] = new objj_method(sel_registerName("becomeFirstResponder"), function $CPResponder__becomeFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[2] = new objj_method(sel_registerName("resignFirstResponder"), function $CPResponder__resignFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[3] = new objj_method(sel_registerName("setNextResponder:"), function $CPResponder__setNextResponder_(self, _cmd, aResponder)
{ with(self)
{
    _nextResponder = aResponder;
}
});
instance_methods[4] = new objj_method(sel_registerName("nextResponder"), function $CPResponder__nextResponder(self, _cmd)
{ with(self)
{
    return _nextResponder;
}
});
instance_methods[5] = new objj_method(sel_registerName("interpretKeyEvents:"), function $CPResponder__interpretKeyEvents_(self, _cmd, events)
{ with(self)
{
    var event,
        index = 0;
    while(event = events[index++])
    {
        switch(objj_msgSend(event, "keyCode"))
        {
            case CPLeftArrowKeyCode: objj_msgSend(self, "moveBackward:", self);
                                        break;
            case CPRightArrowKeyCode: objj_msgSend(self, "moveForward:", self);
                                        break;
            case CPUpArrowKeyCode: objj_msgSend(self, "moveUp:", self);
                                        break;
            case CPDownArrowKeyCode: objj_msgSend(self, "moveDown:", self);
                                        break;
            case CPDeleteKeyCode: objj_msgSend(self, "deleteBackward:", self);
                                        break;
            case 3:
            case 13: objj_msgSend(self, "insertLineBreak:", self);
                                        break;
            default: objj_msgSend(self, "insertText:", objj_msgSend(event, "characters"));
        }
    }
}
});
instance_methods[6] = new objj_method(sel_registerName("mouseDown:"), function $CPResponder__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[7] = new objj_method(sel_registerName("mouseDragged:"), function $CPResponder__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[8] = new objj_method(sel_registerName("mouseUp:"), function $CPResponder__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[9] = new objj_method(sel_registerName("mouseMoved:"), function $CPResponder__mouseMoved_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[10] = new objj_method(sel_registerName("mouseEntered:"), function $CPResponder__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[11] = new objj_method(sel_registerName("mouseExited:"), function $CPResponder__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[12] = new objj_method(sel_registerName("scrollWheel:"), function $CPResponder__scrollWheel_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[13] = new objj_method(sel_registerName("keyDown:"), function $CPResponder__keyDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[14] = new objj_method(sel_registerName("keyUp:"), function $CPResponder__keyUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
});
instance_methods[15] = new objj_method(sel_registerName("performKeyEquivalent:"), function $CPResponder__performKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
});
instance_methods[16] = new objj_method(sel_registerName("deleteBackward:"), function $CPResponder__deleteBackward_(self, _cmd, aSender)
{ with(self)
{}
});
instance_methods[17] = new objj_method(sel_registerName("insertLineBreak:"), function $CPResponder__insertLineBreak_(self, _cmd, aSender)
{ with(self)
{}
});
instance_methods[18] = new objj_method(sel_registerName("insertText:"), function $CPResponder__insertText_(self, _cmd, aString)
{ with(self)
{}
});
instance_methods[19] = new objj_method(sel_registerName("doCommandBySelector:"), function $CPResponder__doCommandBySelector_(self, _cmd, aSelector)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
        objj_msgSend(self, "performSelector:", aSelector);
    else
        objj_msgSend(_nextResponder, "doCommandBySelector:", aSelector);
}
});
instance_methods[20] = new objj_method(sel_registerName("tryToPerform:with:"), function $CPResponder__tryToPerform_with_(self, _cmd, aSelector, anObject)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
    {
        objj_msgSend(self, "performSelector:withObject:", aSelector, anObject);
        return YES;
    }
    return objj_msgSend(_nextResponder, "tryToPerform:with:", aSelector, anObject);
}
});
instance_methods[21] = new objj_method(sel_registerName("setMenu:"), function $CPResponder__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
});
instance_methods[22] = new objj_method(sel_registerName("menu"), function $CPResponder__menu(self, _cmd)
{ with(self)
{
    return _menu;
}
});
instance_methods[23] = new objj_method(sel_registerName("undoManager"), function $CPResponder__undoManager(self, _cmd)
{ with(self)
{
    return objj_msgSend(_nextResponder, "performSelector:", _cmd);
}
});
instance_methods[24] = new objj_method(sel_registerName("noResponderFor:"), function $CPResponder__noResponderFor_(self, _cmd, anEventSelector)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
}
var CPResponderNextResponderKey = "CPResponderNextResponderKey";
{
var the_class = objj_getClass("CPResponder")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPResponder\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPResponder__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _nextResponder = objj_msgSend(aCoder, "decodeObjectForKey:", CPResponderNextResponderKey);
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPResponder__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _nextResponder, CPResponderNextResponderKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;12;CPScroller.ji;11;CPControl.jc;28126;
CPScrollerNoPart = 0;
CPScrollerDecrementPage = 1;
CPScrollerKnob = 2;
CPScrollerIncrementPage = 3;
CPScrollerDecrementLine = 4;
CPScrollerIncrementLine = 5;
CPScrollerKnobSlot = 6;
CPScrollerIncrementArrow = 0;
CPScrollerDecrementArrow = 1;
CPNoScrollerParts = 0;
CPOnlyScrollerArrows = 1;
CPAllScrollerParts = 2;
var _CPScrollerWidths = [],
    _CPScrollerKnobMinimumHeights = [],
    _CPScrollerArrowHeights = [],
    _CPScrollerArrowUsableHeights = [];
_CPScrollerWidths[CPRegularControlSize] = 14.0;
_CPScrollerWidths[CPSmallControlSize] = 11.0;
_CPScrollerWidths[CPMiniControlSize] = 11.0;
_CPScrollerKnobMinimumHeights[CPRegularControlSize] = 18.0;
_CPScrollerKnobMinimumHeights[CPSmallControlSize] = 12.0;
_CPScrollerKnobMinimumHeights[CPMiniControlSize] = 12.0;
_CPScrollerArrowHeights[CPRegularControlSize] = 21.0;
_CPScrollerArrowHeights[CPSmallControlSize] = 16.0;
_CPScrollerArrowHeights[CPMiniControlSize] = 16.0;
_CPScrollerArrowUsableHeights[CPRegularControlSize] = 16.0
_CPScrollerArrowUsableHeights[CPSmallControlSize] = 10.0;
_CPScrollerArrowUsableHeights[CPMiniControlSize] = 10.0;
var _CPScrollerKnobIdentifier = "Knob",
    _CPScrollerKnobSlotIdentifier = "KnobSlot",
    _CPScrollerDecrementArrowIdentifier = "DecrementArrow",
    _CPScrollerIncrementArrowIdentifier = "IncrementArrow",
    _CPScrollerHorizontalIdentifier = "Horizontal",
    _CPScrollerVerticalIdentifier = "Vertical",
    _CPScrollerHighlightedIdentifier = "Highlighted",
    _CPScrollerDisabledIdentifier = "Disabled";
var _CPScrollerClassName = nil,
    _CPScrollerPartSizes = {};
{var the_class = objj_allocateClassPair(CPControl, "CPScroller"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controlSize"), new objj_ivar("_usableParts"), new objj_ivar("_partRects"), new objj_ivar("_isHorizontal"), new objj_ivar("_knobProportion"), new objj_ivar("_hitPart"), new objj_ivar("_trackingPart"), new objj_ivar("_trackingFloatValue"), new objj_ivar("_trackingStartPoint"), new objj_ivar("_knobView"), new objj_ivar("_knobSlotView"), new objj_ivar("_decrementArrowView"), new objj_ivar("_incrementArrowView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPScroller__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPScroller, "class"))
        return;
    _CPScrollerClassName = objj_msgSend(self, "className");
    var regularIdentifier = _CPControlIdentifierForControlSize(CPRegularControlSize),
        smallIdentifier = _CPControlIdentifierForControlSize(CPSmallControlSize),
        miniIdentifier = _CPControlIdentifierForControlSize(CPMiniControlSize);
    var prefix = _CPScrollerClassName + _CPScrollerKnobIdentifier + _CPScrollerHorizontalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = [{width:9.0,height:_CPScrollerWidths[CPRegularControlSize]},{width:1.0,height:_CPScrollerWidths[CPRegularControlSize]},{width:9.0,height:_CPScrollerWidths[CPRegularControlSize]}];
    _CPScrollerPartSizes[prefix+smallIdentifier] = [{width:6.0,height:_CPScrollerWidths[CPSmallControlSize]},{width:1.0,height:_CPScrollerWidths[CPSmallControlSize]},{width:6.0,height:_CPScrollerWidths[CPSmallControlSize]}];
    _CPScrollerPartSizes[prefix+miniIdentifier] = [{width:6.0,height:_CPScrollerWidths[CPMiniControlSize]},{width:1.0,height:_CPScrollerWidths[CPMiniControlSize]},{width:6.0,height:_CPScrollerWidths[CPMiniControlSize]}];
    var prefix = _CPScrollerClassName + _CPScrollerKnobIdentifier + _CPScrollerVerticalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = [{width:_CPScrollerWidths[CPRegularControlSize],height:9.0},{width:_CPScrollerWidths[CPRegularControlSize],height:1.0},{width:_CPScrollerWidths[CPRegularControlSize],height:9.0}];
    _CPScrollerPartSizes[prefix+smallIdentifier] = [{width:_CPScrollerWidths[CPSmallControlSize],height:6.0},{width:_CPScrollerWidths[CPSmallControlSize],height:1.0},{width:_CPScrollerWidths[CPSmallControlSize],height:6.0}];
    _CPScrollerPartSizes[prefix+miniIdentifier] = [{width:_CPScrollerWidths[CPMiniControlSize],height:6.0},{width:_CPScrollerWidths[CPMiniControlSize],height:1.0},{width:_CPScrollerWidths[CPMiniControlSize],height:6.0}];
    var prefix = _CPScrollerClassName + _CPScrollerKnobSlotIdentifier + _CPScrollerHorizontalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = { width:1.0, height:_CPScrollerWidths[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier] = { width:1.0, height:_CPScrollerWidths[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier] = { width:1.0, height:_CPScrollerWidths[CPMiniControlSize] };
    var prefix = _CPScrollerClassName + _CPScrollerKnobSlotIdentifier + _CPScrollerVerticalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = { width:_CPScrollerWidths[CPRegularControlSize], height:1.0 };
    _CPScrollerPartSizes[prefix+smallIdentifier] = { width:_CPScrollerWidths[CPSmallControlSize], height:1.0 };
    _CPScrollerPartSizes[prefix+miniIdentifier] = { width:_CPScrollerWidths[CPMiniControlSize], height:1.0 };
    var prefix = _CPScrollerClassName + _CPScrollerDecrementArrowIdentifier + _CPScrollerHorizontalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = { width:_CPScrollerArrowHeights[CPRegularControlSize], height:_CPScrollerWidths[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+regularIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerArrowHeights[CPRegularControlSize], height:_CPScrollerWidths[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier] = { width:_CPScrollerArrowHeights[CPSmallControlSize], height:_CPScrollerWidths[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerArrowHeights[CPSmallControlSize], height:_CPScrollerWidths[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier] = { width:_CPScrollerArrowHeights[CPMiniControlSize], height:_CPScrollerWidths[CPMiniControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerArrowHeights[CPMiniControlSize], height:_CPScrollerWidths[CPMiniControlSize] };
    var prefix = _CPScrollerClassName + _CPScrollerDecrementArrowIdentifier + _CPScrollerVerticalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = { width:_CPScrollerWidths[CPRegularControlSize], height:_CPScrollerArrowHeights[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+regularIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerWidths[CPRegularControlSize], height:_CPScrollerArrowHeights[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier] = { width:_CPScrollerWidths[CPSmallControlSize], height:_CPScrollerArrowHeights[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerWidths[CPSmallControlSize], height:_CPScrollerArrowHeights[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier] = { width:_CPScrollerWidths[CPMiniControlSize], height:_CPScrollerArrowHeights[CPMiniControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerWidths[CPMiniControlSize], height:_CPScrollerArrowHeights[CPMiniControlSize] };
    var prefix = _CPScrollerClassName + _CPScrollerIncrementArrowIdentifier + _CPScrollerHorizontalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = { width:_CPScrollerArrowHeights[CPRegularControlSize], height:_CPScrollerWidths[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+regularIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerArrowHeights[CPRegularControlSize], height:_CPScrollerWidths[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier] = { width:_CPScrollerArrowHeights[CPSmallControlSize], height:_CPScrollerWidths[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerArrowHeights[CPSmallControlSize], height:_CPScrollerWidths[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier] = { width:_CPScrollerArrowHeights[CPMiniControlSize], height:_CPScrollerWidths[CPMiniControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerArrowHeights[CPMiniControlSize], height:_CPScrollerWidths[CPMiniControlSize] };
    var prefix = _CPScrollerClassName + _CPScrollerIncrementArrowIdentifier + _CPScrollerVerticalIdentifier;
    _CPScrollerPartSizes[prefix+regularIdentifier] = { width:_CPScrollerWidths[CPRegularControlSize], height:_CPScrollerArrowHeights[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+regularIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerWidths[CPRegularControlSize], height:_CPScrollerArrowHeights[CPRegularControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier] = { width:_CPScrollerWidths[CPSmallControlSize], height:_CPScrollerArrowHeights[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+smallIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerWidths[CPSmallControlSize], height:_CPScrollerArrowHeights[CPSmallControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier] = { width:_CPScrollerWidths[CPMiniControlSize], height:_CPScrollerArrowHeights[CPMiniControlSize] };
    _CPScrollerPartSizes[prefix+miniIdentifier+_CPScrollerHighlightedIdentifier] = { width:_CPScrollerWidths[CPMiniControlSize], height:_CPScrollerArrowHeights[CPMiniControlSize] };
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPScroller__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        _partRects = [];
        objj_msgSend(self, "setFloatValue:knobProportion:", 0.0, 1.0);
        _isHorizontal = CPRectGetWidth(aFrame) > CPRectGetHeight(aFrame);
        _hitPart = CPScrollerNoPart;
        objj_msgSend(self, "checkSpaceForParts");
        objj_msgSend(self, "drawParts");
        objj_msgSend(self, "layoutSubviews");
    }
    return self;
}
});
class_methods[1] = new objj_method(sel_registerName("scrollerWidth"), function $CPScroller__scrollerWidth(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "scrollerWidthForControlSize:", CPRegularControlSize);
}
});
class_methods[2] = new objj_method(sel_registerName("scrollerWidthForControlSize:"), function $CPScroller__scrollerWidthForControlSize_(self, _cmd, aControlSize)
{ with(self)
{
    return _CPScrollerWidths[aControlSize];
}
});
instance_methods[1] = new objj_method(sel_registerName("setControlSize:"), function $CPScroller__setControlSize_(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "drawKnobSlot");
    objj_msgSend(self, "drawKnob");
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, NO);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, NO);
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[2] = new objj_method(sel_registerName("controlSize"), function $CPScroller__controlSize(self, _cmd)
{ with(self)
{
    return _controlSize;
}
});
instance_methods[3] = new objj_method(sel_registerName("setFloatValue:"), function $CPScroller__setFloatValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFloatValue:", MIN(1.0,MAX(0.0,aValue)));
    objj_msgSend(self, "checkSpaceForParts");
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[4] = new objj_method(sel_registerName("setFloatValue:knobProportion:"), function $CPScroller__setFloatValue_knobProportion_(self, _cmd, aValue, aProportion)
{ with(self)
{
    _knobProportion = MIN(1.0, MAX(0.0001, aProportion));
    objj_msgSend(self, "setFloatValue:", aValue);
}
});
instance_methods[5] = new objj_method(sel_registerName("knobProportion"), function $CPScroller__knobProportion(self, _cmd)
{ with(self)
{
    return _knobProportion;
}
});
instance_methods[6] = new objj_method(sel_registerName("rectForPart:"), function $CPScroller__rectForPart_(self, _cmd, aPart)
{ with(self)
{
    if (aPart == CPScrollerNoPart)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    return _partRects[aPart];
}
});
instance_methods[7] = new objj_method(sel_registerName("testPart:"), function $CPScroller__testPart_(self, _cmd, aPoint)
{ with(self)
{
    aPoint = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil);
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerKnob), aPoint))
        return CPScrollerKnob;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerDecrementPage), aPoint))
        return CPScrollerDecrementPage;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerIncrementPage), aPoint))
        return CPScrollerIncrementPage;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerDecrementLine), aPoint))
        return CPScrollerDecrementLine;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerIncrementLine), aPoint))
        return CPScrollerIncrementLine;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot), aPoint))
        return CPScrollerKnobSlot;
    return CPScrollerNoPart;
}
});
instance_methods[8] = new objj_method(sel_registerName("checkSpaceForParts"), function $CPScroller__checkSpaceForParts(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    if (_knobProportion == 1.0)
    {
        _usableParts = CPNoScrollerParts;
        _partRects[CPScrollerDecrementPage] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerKnob] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:bounds.origin.x, y:bounds.origin.y }, size: { width:bounds.size.width, height:bounds.size.height } };
        return;
    }
    var width = (bounds.size.width),
        height = (bounds.size.height),
        usableArrowHeight = _CPScrollerArrowUsableHeights[_controlSize],
        slotWidth = (_isHorizontal ? width : height) - 2.0 * usableArrowHeight,
        knobWidth = MAX(_CPScrollerKnobMinimumHeights[_controlSize], (slotWidth * _knobProportion));
    _usableParts = CPAllScrollerParts;
    var arrowHeight = _CPScrollerArrowHeights[_controlSize],
        knobLocation = usableArrowHeight + (slotWidth - knobWidth) * objj_msgSend(self, "floatValue");
    if (_isHorizontal)
    {
        _partRects[CPScrollerDecrementPage] = { origin: { x:usableArrowHeight, y:0.0 }, size: { width:knobLocation - usableArrowHeight, height:height } };
        _partRects[CPScrollerKnob] = { origin: { x:knobLocation, y:0.0 }, size: { width:knobWidth, height:_CPScrollerWidths[_controlSize] } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:knobLocation + knobWidth, y:0.0 }, size: { width:width - (knobLocation + knobWidth) - usableArrowHeight, height:height } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:usableArrowHeight, y:0.0 }, size: { width:slotWidth, height:height } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:arrowHeight, height:height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:width - _CPScrollerArrowHeights[_controlSize], y:0.0 }, size: { width:arrowHeight, height:height } };
    }
    else
    {
        _partRects[CPScrollerDecrementPage] = { origin: { x:0.0, y:usableArrowHeight }, size: { width:width, height:knobLocation - usableArrowHeight } };
        _partRects[CPScrollerKnob] = { origin: { x:0.0, y:knobLocation }, size: { width:_CPScrollerWidths[_controlSize], height:knobWidth } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:0.0, y:knobLocation + knobWidth }, size: { width:width, height:height - (knobLocation + knobWidth) - usableArrowHeight } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:0.0, y:usableArrowHeight }, size: { width:width, height:slotWidth } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:width, height:arrowHeight } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:height - _CPScrollerArrowHeights[_controlSize] }, size: { width:width, height:arrowHeight } };
    }
}
});
instance_methods[9] = new objj_method(sel_registerName("usableParts"), function $CPScroller__usableParts(self, _cmd)
{ with(self)
{
    return _usableParts;
}
});
instance_methods[10] = new objj_method(sel_registerName("drawArrow:highlight:"), function $CPScroller__drawArrow_highlight_(self, _cmd, anArrow, shouldHighlight)
{ with(self)
{
    var identifier = (anArrow == CPScrollerDecrementArrow ? _CPScrollerDecrementArrowIdentifier : _CPScrollerIncrementArrowIdentifier),
        arrowView = (anArrow == CPScrollerDecrementArrow ? _decrementArrowView : _incrementArrowView);
    objj_msgSend(arrowView, "setBackgroundColor:", _CPControlColorWithPatternImage(_CPScrollerPartSizes,_CPScrollerClassName,identifier,_isHorizontal?_CPScrollerHorizontalIdentifier:_CPScrollerVerticalIdentifier,_CPControlIdentifierForControlSize(_controlSize),shouldHighlight?_CPScrollerHighlightedIdentifier:""));
}
});
instance_methods[11] = new objj_method(sel_registerName("drawKnob"), function $CPScroller__drawKnob(self, _cmd)
{ with(self)
{
    objj_msgSend(_knobView, "setBackgroundColor:", _CPControlThreePartImagePattern(!_isHorizontal,_CPScrollerPartSizes,_CPScrollerClassName,_CPScrollerKnobIdentifier,_isHorizontal?_CPScrollerHorizontalIdentifier:_CPScrollerVerticalIdentifier,_CPControlIdentifierForControlSize(_controlSize)));
}
});
instance_methods[12] = new objj_method(sel_registerName("drawKnobSlot"), function $CPScroller__drawKnobSlot(self, _cmd)
{ with(self)
{
    objj_msgSend(_knobSlotView, "setBackgroundColor:", _CPControlColorWithPatternImage(_CPScrollerPartSizes,_CPScrollerClassName,_CPScrollerKnobSlotIdentifier,_isHorizontal?_CPScrollerHorizontalIdentifier:_CPScrollerVerticalIdentifier,_CPControlIdentifierForControlSize(_controlSize)));
}
});
instance_methods[13] = new objj_method(sel_registerName("drawParts"), function $CPScroller__drawParts(self, _cmd)
{ with(self)
{
    _knobSlotView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", {origin:{x:0.0,y:0.0},size:{width:0.0,height:0.0}});
    objj_msgSend(_knobSlotView, "setHitTests:", NO);
    objj_msgSend(self, "addSubview:", _knobSlotView);
    objj_msgSend(self, "drawKnobSlot");
    _knobView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", {origin:{x:0.0,y:0.0},size:{width:0.0,height:0.0}});
    objj_msgSend(_knobView, "setHitTests:", NO);
    objj_msgSend(self, "addSubview:", _knobView);
    objj_msgSend(self, "drawKnob");
    _decrementArrowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", {origin:{x:0.0,y:0.0},size:{width:0.0,height:0.0}});
    objj_msgSend(_decrementArrowView, "setHitTests:", NO);
    objj_msgSend(self, "addSubview:", _decrementArrowView);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, NO);
    _incrementArrowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", {origin:{x:0.0,y:0.0},size:{width:0.0,height:0.0}});
    objj_msgSend(_incrementArrowView, "setHitTests:", NO);
    objj_msgSend(self, "addSubview:", _incrementArrowView);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, NO);
}
});
instance_methods[14] = new objj_method(sel_registerName("highlight:"), function $CPScroller__highlight_(self, _cmd, shouldHighlight)
{ with(self)
{
    if (_trackingPart == CPScrollerDecrementLine)
        objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, shouldHighlight);
    else if (_trackingPart == CPScrollerIncrementLine)
        objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, shouldHighlight);
}
});
instance_methods[15] = new objj_method(sel_registerName("hitPart"), function $CPScroller__hitPart(self, _cmd)
{ with(self)
{
    return _hitPart;
}
});
instance_methods[16] = new objj_method(sel_registerName("trackKnob:"), function $CPScroller__trackKnob_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseUp)
    {
        _hitPart = CPScrollerNoPart;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _trackingFloatValue = objj_msgSend(self, "floatValue");
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    }
    else if (type == CPLeftMouseDragged)
    {
        var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
            knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
            remainder = _isHorizontal ? ((knobSlotRect.size.width) - (knobRect.size.width)) : ((knobSlotRect.size.height) - (knobRect.size.height));
        if (remainder <= 0)
            objj_msgSend(self, "setFloatValue:", 0.0);
        else
        {
            var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
                delta = _isHorizontal ? location.x - _trackingStartPoint.x : location.y - _trackingStartPoint.y;
            objj_msgSend(self, "setFloatValue:", _trackingFloatValue+delta/remainder);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackKnob:"), CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
});
instance_methods[17] = new objj_method(sel_registerName("trackScrollButtons:"), function $CPScroller__trackScrollButtons_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseUp)
    {
        objj_msgSend(self, "highlight:", NO);
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        _hitPart = CPScrollerNoPart;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _trackingPart = objj_msgSend(self, "hitPart");
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        if (objj_msgSend(anEvent, "modifierFlags") & CPAlternateKeyMask)
        {
            if (_trackingPart == CPScrollerDecrementLine)
                _hitPart = CPScrollerDecrementPage;
            else if (_trackingPart == CPScrollerIncrementLine)
                _hitPart = CPScrollerIncrementPage;
            else if (_trackingPart == CPScrollerDecrementPage || _trackingPart == CPScrollerIncrementPage)
            {
                var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
                    knobWidth = _isHorizontal ? (knobRect.size.width) : (knobRect.size.height),
                    knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
                    remainder = (_isHorizontal ? (knobSlotRect.size.width) : (knobSlotRect.size.height)) - knobWidth;
                objj_msgSend(self, "setFloatValue:", ((_isHorizontal?_trackingStartPoint.x-(knobSlotRect.origin.x):_trackingStartPoint.y-(knobSlotRect.origin.y))-knobWidth/2.0)/remainder);
                _hitPart = CPScrollerKnob;
                objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
                return objj_msgSend(self, "trackKnob:", anEvent);
            }
        }
        objj_msgSend(self, "highlight:", YES);
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
        objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.5, 0.04);
    }
    else if (type == CPLeftMouseDragged)
    {
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        if (_trackingPart == CPScrollerDecrementPage || _trackingPart == CPScrollerIncrementPage)
        {
            var hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));
            if (hitPart == CPScrollerDecrementPage || hitPart == CPScrollerIncrementPage)
            {
                _trackingPart = hitPart;
                _hitPart = hitPart;
            }
        }
        objj_msgSend(self, "highlight:", CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart),_trackingStartPoint));
    }
    else if (type == CPPeriodic && CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint))
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackScrollButtons:"), CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
instance_methods[18] = new objj_method(sel_registerName("setFrameSize:"), function $CPScroller__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(self, "checkSpaceForParts");
    var frame = objj_msgSend(self, "frame"),
        isHorizontal = CPRectGetWidth(frame) > CPRectGetHeight(frame);
    if (_isHorizontal != isHorizontal)
    {
        _isHorizontal = isHorizontal;
        objj_msgSend(self, "drawParts");
    }
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[19] = new objj_method(sel_registerName("layoutSubviews"), function $CPScroller__layoutSubviews(self, _cmd)
{ with(self)
{
    objj_msgSend(_knobSlotView, "setFrame:", objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot));
    var usableParts = objj_msgSend(self, "usableParts"),
        hidden = !(usableParts == CPAllScrollerParts);
    if (hidden != objj_msgSend(_knobView, "isHidden"))
    {
        objj_msgSend(_knobView, "setHidden:", hidden);
        objj_msgSend(_decrementArrowView, "setHidden:", hidden);
        objj_msgSend(_incrementArrowView, "setHidden:", hidden);
    }
    if (!hidden)
    {
        objj_msgSend(_knobView, "setFrame:", objj_msgSend(self, "rectForPart:", CPScrollerKnob));
        objj_msgSend(_decrementArrowView, "setFrame:", objj_msgSend(self, "rectForPart:", CPScrollerDecrementLine));
        objj_msgSend(_incrementArrowView, "setFrame:", objj_msgSend(self, "rectForPart:", CPScrollerIncrementLine));
    }
}
});
instance_methods[20] = new objj_method(sel_registerName("mouseDown:"), function $CPScroller__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    _hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));
    switch (_hitPart)
    {
        case CPScrollerKnob: return objj_msgSend(self, "trackKnob:", anEvent);
        case CPScrollerDecrementLine:
        case CPScrollerIncrementLine:
        case CPScrollerDecrementPage:
        case CPScrollerIncrementPage: return objj_msgSend(self, "trackScrollButtons:", anEvent);
    }
}
});
instance_methods[21] = new objj_method(sel_registerName("setEnabled:"), function $CPScroller__setEnabled_(self, _cmd, shouldBeEnabled)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;14;CPScrollView.ji;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;18089;
{var the_class = objj_allocateClassPair(CPView, "CPScrollView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_hasHorizontalScroller"), new objj_ivar("_autohidesScrollers"), new objj_ivar("_verticalScroller"), new objj_ivar("_horizontalScroller"), new objj_ivar("_recursionCount"), new objj_ivar("_verticalLineScroll"), new objj_ivar("_verticalPageScroll"), new objj_ivar("_horizontalLineScroll"), new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPScrollView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _verticalLineScroll = 10.0;
        _verticalPageScroll = 10.0;
        _horizontalLineScroll = 10.0;
        _horizontalPageScroll = 10.0;
        _contentView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _contentView);
        objj_msgSend(self, "setHasVerticalScroller:", YES);
        objj_msgSend(self, "setHasHorizontalScroller:", YES);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("contentSize"), function $CPScrollView__contentSize(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "frame").size;
}
});
instance_methods[2] = new objj_method(sel_registerName("documentView"), function $CPScrollView__documentView(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "documentView");
}
});
instance_methods[3] = new objj_method(sel_registerName("setContentView:"), function $CPScrollView__setContentView_(self, _cmd, aContentView)
{ with(self)
{
    if (!aContentView)
        return;
    var documentView = objj_msgSend(aContentView, "documentView");
    if (documentView)
        objj_msgSend(documentView, "removeFromSuperview");
    objj_msgSend(_contentView, "removeFromSuperview");
    var size = objj_msgSend(self, "contentSize");
    _contentView = aContentView;
    objj_msgSend(_contentView, "setFrame:", CGRectMake(0.0,0.0,size.width,size.height));
    objj_msgSend(_contentView, "setDocumentView:", documentView);
    objj_msgSend(self, "addSubview:", _contentView);
}
});
instance_methods[4] = new objj_method(sel_registerName("contentView"), function $CPScrollView__contentView(self, _cmd)
{ with(self)
{
    return _contentView;
}
});
instance_methods[5] = new objj_method(sel_registerName("setDocumentView:"), function $CPScrollView__setDocumentView_(self, _cmd, aView)
{ with(self)
{
   objj_msgSend(_contentView, "setDocumentView:", aView);
   objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
});
instance_methods[6] = new objj_method(sel_registerName("reflectScrolledClipView:"), function $CPScrollView__reflectScrolledClipView_(self, _cmd, aClipView)
{ with(self)
{
    if(_contentView != aClipView)
        return;
    if (_recursionCount > 5)
        return;
    ++_recursionCount;
    var documentView = objj_msgSend(self, "documentView");
    if (!documentView)
    {
        if (_autohidesScrollers)
        {
            objj_msgSend(_verticalScroller, "setHidden:", YES);
            objj_msgSend(_horizontalScroller, "setHidden:", YES);
        }
        else
        {
            objj_msgSend(_verticalScroller, "setEnabled:", NO);
            objj_msgSend(_horizontalScroller, "setEnabled:", NO);
        }
        objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "bounds"));
        --_recursionCount;
        return;
    }
    var documentFrame = objj_msgSend(documentView, "frame"),
        contentViewFrame = objj_msgSend(self, "bounds"),
        scrollPoint = objj_msgSend(_contentView, "bounds").origin,
        difference = { width:CPRectGetWidth(documentFrame) - CPRectGetWidth(contentViewFrame), height:CPRectGetHeight(documentFrame) - CPRectGetHeight(contentViewFrame) },
        shouldShowVerticalScroller = (!_autohidesScrollers || difference.height > 0.0) && _hasVerticalScroller,
        shouldShowHorizontalScroller = (!_autohidesScrollers || difference.width > 0.0) && _hasHorizontalScroller,
        wasShowingVerticalScroller = !objj_msgSend(_verticalScroller, "isHidden"),
        wasShowingHorizontalScroller = !objj_msgSend(_horizontalScroller, "isHidden"),
        verticalScrollerWidth = objj_msgSend(CPScroller, "scrollerWidthForControlSize:", objj_msgSend(_verticalScroller, "controlSize")),
        horizontalScrollerHeight = objj_msgSend(CPScroller, "scrollerWidthForControlSize:", objj_msgSend(_horizontalScroller, "controlSize"));
    if (_autohidesScrollers)
    {
        if (shouldShowVerticalScroller)
            shouldShowHorizontalScroller = (!_autohidesScrollers || difference.width > -verticalScrollerWidth) && _hasHorizontalScroller;
        if (shouldShowHorizontalScroller)
            shouldShowVerticalScroller = (!_autohidesScrollers || difference.height > -horizontalScrollerHeight) && _hasVerticalScroller;
    }
    objj_msgSend(_verticalScroller, "setHidden:", !shouldShowVerticalScroller);
    objj_msgSend(_verticalScroller, "setEnabled:", !_autohidesScrollers&&difference.height<0);
    objj_msgSend(_horizontalScroller, "setHidden:", !shouldShowHorizontalScroller);
    objj_msgSend(_horizontalScroller, "setEnabled:", !_autohidesScrollers&&difference.width<0);
    if (shouldShowVerticalScroller)
    {
        var verticalScrollerHeight = CPRectGetHeight(contentViewFrame);
        if (shouldShowHorizontalScroller)
            verticalScrollerHeight -= horizontalScrollerHeight;
        difference.width += verticalScrollerWidth;
        contentViewFrame.size.width -= verticalScrollerWidth;
        objj_msgSend(_verticalScroller, "setFloatValue:knobProportion:", (difference.height<=0.0)?0.0:scrollPoint.y/difference.height, CPRectGetHeight(contentViewFrame)/CPRectGetHeight(documentFrame));
        objj_msgSend(_verticalScroller, "setFrame:", CPRectMake(CPRectGetMaxX(contentViewFrame),0.0,verticalScrollerWidth,verticalScrollerHeight));
    }
    else if (wasShowingVerticalScroller)
        objj_msgSend(_verticalScroller, "setFloatValue:knobProportion:", 0.0, 1.0);
    if (shouldShowHorizontalScroller)
    {
        difference.height += horizontalScrollerHeight;
        contentViewFrame.size.height -= horizontalScrollerHeight;
        objj_msgSend(_horizontalScroller, "setFloatValue:knobProportion:", (difference.width<=0.0)?0.0:scrollPoint.x/difference.width, CPRectGetWidth(contentViewFrame)/CPRectGetWidth(documentFrame));
        objj_msgSend(_horizontalScroller, "setFrame:", CPRectMake(0.0,CPRectGetMaxY(contentViewFrame),CPRectGetWidth(contentViewFrame),horizontalScrollerHeight));
    }
    else if (wasShowingHorizontalScroller)
        objj_msgSend(_horizontalScroller, "setFloatValue:knobProportion:", 0.0, 1.0);
    objj_msgSend(_contentView, "setFrame:", contentViewFrame);
    if (_hasVerticalScroller && (shouldShowVerticalScroller || wasShowingVerticalScroller))
    {
        var value = objj_msgSend(_verticalScroller, "floatValue"),
            contentBounds = objj_msgSend(_contentView, "bounds");
        contentBounds.origin.y = value * ((objj_msgSend(objj_msgSend(_contentView, "documentView"), "frame").size.height) - (contentBounds.size.height));
        objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
    }
    if (_hasHorizontalScroller && (shouldShowHorizontalScroller || wasShowingHorizontalScroller))
    {
        var value = objj_msgSend(_horizontalScroller, "floatValue"),
            contentBounds = objj_msgSend(_contentView, "bounds");
        contentBounds.origin.x = value * ((objj_msgSend(objj_msgSend(_contentView, "documentView"), "frame").size.width) - (contentBounds.size.width));
        objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
    }
    --_recursionCount;
}
});
instance_methods[7] = new objj_method(sel_registerName("setHorizontalScroller:"), function $CPScrollView__setHorizontalScroller_(self, _cmd, aScroller)
{ with(self)
{
    if (_horizontalScroller == aScroller)
        return;
    objj_msgSend(_horizontalScroller, "removeFromSuperview");
    objj_msgSend(_horizontalScroller, "setTarget:", nil);
    objj_msgSend(_horizontalScroller, "setAction:", nil);
    _horizontalScroller = aScroller;
    objj_msgSend(_horizontalScroller, "setTarget:", self);
    objj_msgSend(_horizontalScroller, "setAction:", sel_registerName("_horizontalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _horizontalScroller);
}
});
instance_methods[8] = new objj_method(sel_registerName("horizontalScroller"), function $CPScrollView__horizontalScroller(self, _cmd)
{ with(self)
{
    return _horizontalScroller;
}
});
instance_methods[9] = new objj_method(sel_registerName("setHasHorizontalScroller:"), function $CPScrollView__setHasHorizontalScroller_(self, _cmd, hasHorizontalScroller)
{ with(self)
{
    _hasHorizontalScroller = hasHorizontalScroller;
    if (_hasHorizontalScroller && !_horizontalScroller)
        objj_msgSend(self, "setHorizontalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CPRectMake(0.0,0.0,CPRectGetWidth(objj_msgSend(self, "bounds")),objj_msgSend(CPScroller, "scrollerWidth"))));
    else if (!hasHorizontalScroller && _horizontalScroller)
        objj_msgSend(_horizontalScroller, "setHidden:", YES);
}
});
instance_methods[10] = new objj_method(sel_registerName("hasHorizontalScroller"), function $CPScrollView__hasHorizontalScroller(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
});
instance_methods[11] = new objj_method(sel_registerName("setVerticalScroller:"), function $CPScrollView__setVerticalScroller_(self, _cmd, aScroller)
{ with(self)
{
    if (_verticalScroller == aScroller)
        return;
    objj_msgSend(_verticalScroller, "removeFromSuperview");
    objj_msgSend(_verticalScroller, "setTarget:", nil);
    objj_msgSend(_verticalScroller, "setAction:", nil);
    _verticalScroller = aScroller;
    objj_msgSend(_verticalScroller, "setTarget:", self);
    objj_msgSend(_verticalScroller, "setAction:", sel_registerName("_verticalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _verticalScroller);
}
});
instance_methods[12] = new objj_method(sel_registerName("verticalScroller"), function $CPScrollView__verticalScroller(self, _cmd)
{ with(self)
{
    return _verticalScroller;
}
});
instance_methods[13] = new objj_method(sel_registerName("setHasVerticalScroller:"), function $CPScrollView__setHasVerticalScroller_(self, _cmd, hasVerticalScroller)
{ with(self)
{
    _hasVerticalScroller = hasVerticalScroller;
    if (_hasVerticalScroller && !_verticalScroller)
        objj_msgSend(self, "setVerticalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CPRectMake(0.0,0.0,objj_msgSend(CPScroller, "scrollerWidth"),CPRectGetHeight(objj_msgSend(self, "bounds")))));
    else if (!hasVerticalScroller && _verticalScroller)
        objj_msgSend(_verticalScroller, "setHidden:", YES);
}
});
instance_methods[14] = new objj_method(sel_registerName("hasHorizontalScroller"), function $CPScrollView__hasHorizontalScroller(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
});
instance_methods[15] = new objj_method(sel_registerName("setAutohidesScrollers:"), function $CPScrollView__setAutohidesScrollers_(self, _cmd, autohidesScrollers)
{ with(self)
{
    _autohidesScrollers = autohidesScrollers;
}
});
instance_methods[16] = new objj_method(sel_registerName("autohidesScrollers"), function $CPScrollView__autohidesScrollers(self, _cmd)
{ with(self)
{
    return _autohidesScrollers;
}
});
instance_methods[17] = new objj_method(sel_registerName("_verticalScrollerDidScroll:"), function $CPScrollView___verticalScrollerDidScroll_(self, _cmd, aScroller)
{ with(self)
{
   var value = objj_msgSend(aScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(_contentView, "documentView"), "frame");
        contentBounds = objj_msgSend(_contentView, "bounds");
    switch (objj_msgSend(_verticalScroller, "hitPart"))
    {
        case CPScrollerDecrementLine: contentBounds.origin.y -= _verticalLineScroll;
                                        break;
        case CPScrollerIncrementLine: contentBounds.origin.y += _verticalLineScroll;
                                        break;
        case CPScrollerDecrementPage: contentBounds.origin.y -= (contentBounds.size.height) - _verticalPageScroll;
                                        break;
        case CPScrollerIncrementPage: contentBounds.origin.y += (contentBounds.size.height) - _verticalPageScroll;
                                        break;
        case CPScrollerKnobSlot:
        case CPScrollerKnob:
        default: contentBounds.origin.y = value * ((documentFrame.size.height) - (contentBounds.size.height));
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
});
instance_methods[18] = new objj_method(sel_registerName("_horizontalScrollerDidScroll:"), function $CPScrollView___horizontalScrollerDidScroll_(self, _cmd, aScroller)
{ with(self)
{
   var value = objj_msgSend(aScroller, "floatValue"),
       documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    switch (objj_msgSend(_horizontalScroller, "hitPart"))
    {
        case CPScrollerDecrementLine: contentBounds.origin.x -= _horizontalLineScroll;
                                        break;
        case CPScrollerIncrementLine: contentBounds.origin.x += _horizontalLineScroll;
                                        break;
        case CPScrollerDecrementPage: contentBounds.origin.x -= (contentBounds.size.width) - _horizontalPageScroll;
                                        break;
        case CPScrollerIncrementPage: contentBounds.origin.x += (contentBounds.size.width) - _horizontalPageScroll;
                                        break;
        case CPScrollerKnobSlot:
        case CPScrollerKnob:
        default: contentBounds.origin.x = value * ((documentFrame.size.width) - (contentBounds.size.width));
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
});
instance_methods[19] = new objj_method(sel_registerName("tile"), function $CPScrollView__tile(self, _cmd)
{ with(self)
{}
});
instance_methods[20] = new objj_method(sel_registerName("resizeSubviewsWithOldSize:"), function $CPScrollView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
});
instance_methods[21] = new objj_method(sel_registerName("setLineScroll:"), function $CPScrollView__setLineScroll_(self, _cmd, aLineScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizonalLineScroll:", aLineScroll);
    objj_msgSend(self, "setVerticalLineScroll:", aLineScroll);
}
});
instance_methods[22] = new objj_method(sel_registerName("lineScroll"), function $CPScrollView__lineScroll(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalLineScroll");
}
});
instance_methods[23] = new objj_method(sel_registerName("setHorizontalLineScroll:"), function $CPScrollView__setHorizontalLineScroll_(self, _cmd, aLineScroll)
{ with(self)
{
    _horizontalLineScroll = aLineScroll;
}
});
instance_methods[24] = new objj_method(sel_registerName("horizontalLineScroll"), function $CPScrollView__horizontalLineScroll(self, _cmd)
{ with(self)
{
    return _horizontalLineScroll;
}
});
instance_methods[25] = new objj_method(sel_registerName("setVerticalLineScroll:"), function $CPScrollView__setVerticalLineScroll_(self, _cmd, aLineScroll)
{ with(self)
{
    _verticalLineScroll = aLineScroll;
}
});
instance_methods[26] = new objj_method(sel_registerName("verticalLineScroll"), function $CPScrollView__verticalLineScroll(self, _cmd)
{ with(self)
{
    return _verticalLineScroll;
}
});
instance_methods[27] = new objj_method(sel_registerName("setPageScroll:"), function $CPScrollView__setPageScroll_(self, _cmd, aPageScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizontalPageScroll:", aPageScroll);
    objj_msgSend(self, "setVerticalPageScroll:", aPageScroll);
}
});
instance_methods[28] = new objj_method(sel_registerName("pageScroll"), function $CPScrollView__pageScroll(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalPageScroll");
}
});
instance_methods[29] = new objj_method(sel_registerName("setHorizontalPageScroll:"), function $CPScrollView__setHorizontalPageScroll_(self, _cmd, aPageScroll)
{ with(self)
{
    _horizontalPageScroll = aPageScroll;
}
});
instance_methods[30] = new objj_method(sel_registerName("horizontalPageScroll"), function $CPScrollView__horizontalPageScroll(self, _cmd)
{ with(self)
{
    return _horizontalPageScroll;
}
});
instance_methods[31] = new objj_method(sel_registerName("setVerticalPageScroll:"), function $CPScrollView__setVerticalPageScroll_(self, _cmd, aPageScroll)
{ with(self)
{
    _verticalPageScroll = aPageScroll;
}
});
instance_methods[32] = new objj_method(sel_registerName("verticalPageScroll"), function $CPScrollView__verticalPageScroll(self, _cmd)
{ with(self)
{
    return _verticalPageScroll;
}
});
instance_methods[33] = new objj_method(sel_registerName("scrollWheel:"), function $CPScrollView__scrollWheel_(self, _cmd, anEvent)
{ with(self)
{
   var value = objj_msgSend(_verticalScroller, "floatValue"),
       documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    contentBounds.origin.x += objj_msgSend(anEvent, "deltaX") * _horizontalLineScroll;
    contentBounds.origin.y += objj_msgSend(anEvent, "deltaY") * _verticalLineScroll;
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
});
class_addMethods(the_class, instance_methods);
}

p;19;CPSecureTextField.ji;13;CPTextField.jc;1370;




var TOP_PADDING = 4.0,
    BOTTOM_PADDING = 3.0;
    HORIZONTAL_PADDING = 3.0;

var CPSecureTextFieldDOMInputElement = nil;

{var the_class = objj_allocateClassPair(CPTextField, "CPSecureTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPSecureTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setFont:"), function $CPSecureTextField__setFont_(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "setFont:", aFont);
}
});
instance_methods[2] = new objj_method(sel_registerName("stringValue"), function $CPSecureTextField__stringValue(self, _cmd)
{ with(self)
{
    return _DOMTextElement.value;
}
});
instance_methods[3] = new objj_method(sel_registerName("setStringValue:"), function $CPSecureTextField__setStringValue_(self, _cmd, aStringValue)
{ with(self)
{
    _value = aStringValue;
}
});
class_addMethods(the_class, instance_methods);
}

p;20;CPSegmentedControl.jI;20;Foundation/CPArray.ji;11;CPControl.jc;17113;
CPSegmentSwitchTrackingSelectOne = 0;
CPSegmentSwitchTrackingSelectAny = 1;
CPSegmentSwitchTrackingMomentary = 2;
{var the_class = objj_allocateClassPair(CPControl, "CPSegmentedControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_segmentCount"), new objj_ivar("_segments"), new objj_ivar("_selectedSegment"), new objj_ivar("_trackingMode"), new objj_ivar("_trackingSegment"), new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPSegmentedControl__initWithFrame_(self, _cmd, aRect)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aRect);
    if (self)
    {
        _segments = [];
        _selectedSegment = -1;
        _segmentCount = 0;
        _trackingMode = CPSegmentSwitchTrackingSelectOne;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("selectedTag"), function $CPSegmentedControl__selectedTag(self, _cmd)
{ with(self)
{
    return _segments[_selectedSegment].tag;
}
});
instance_methods[2] = new objj_method(sel_registerName("setSegmentCount:"), function $CPSegmentedControl__setSegmentCount_(self, _cmd, aCount)
{ with(self)
{
    if (_segmentCount == aCount)
        return;
    var height = CGRectGetHeight(objj_msgSend(self, "bounds"));
    if (_segmentCount < aCount)
    {
        var index = _segmentCount;
        for (; index < aCount; ++index)
        {
            _segments[index] = _CPSegmentMake();
            _segments[index].frame.size.height = height;
        }
    }
    else if (aCount < _segmentCount)
    {
        var index = aCount;
        for (; index < _segmentCount; ++index)
        {
            objj_msgSend(_segments[index].imageView, "removeFromSuperview");
            objj_msgSend(_segments[index].labelView, "removeFromSuperview");
            _segments[index] = nil;
        }
    }
    _segmentCount = aCount;
    if (_selectedSegment < _segmentCount)
        _selectedSegment = -1;
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
});
instance_methods[3] = new objj_method(sel_registerName("segmentCount"), function $CPSegmentedControl__segmentCount(self, _cmd)
{ with(self)
{
    return _segmentCount;
}
});
instance_methods[4] = new objj_method(sel_registerName("setSelectedSegment:"), function $CPSegmentedControl__setSelectedSegment_(self, _cmd, aSegment)
{ with(self)
{
    objj_msgSend(self, "setSelected:forSegment:", YES, aSegment);
}
});
instance_methods[5] = new objj_method(sel_registerName("selectedSegment"), function $CPSegmentedControl__selectedSegment(self, _cmd)
{ with(self)
{
    return _selectedSegment;
}
});
instance_methods[6] = new objj_method(sel_registerName("selectSegmentWithTag:"), function $CPSegmentedControl__selectSegmentWithTag_(self, _cmd, aTag)
{ with(self)
{
    var index = 0;
    for (; index < _segmentCount; ++index)
        if (_segments[index].tag == aTag)
        {
            objj_msgSend(self, "setSelectedSegment:", index);
            return YES;
        }
    return NO;
}
});
instance_methods[7] = new objj_method(sel_registerName("isTracking"), function $CPSegmentedControl__isTracking(self, _cmd)
{ with(self)
{}
});
instance_methods[8] = new objj_method(sel_registerName("setTrackingMode:"), function $CPSegmentedControl__setTrackingMode_(self, _cmd, aTrackingMode)
{ with(self)
{
    if (_trackingMode == aTrackingMode)
        return;
    _trackingMode = aTrackingMode;
    if (_trackingMode == CPSegmentSwitchTrackingSelectOne)
    {
        var index = 0,
            selected = NO;
        for (; index < _segmentCount; ++index)
            if (_segments[index].selected)
                if (selected)
                    objj_msgSend(self, "setSelected:forSegment:", NO, index);
                else
                    selected = YES;
    }
    else if (_trackingMode == CPSegmentSwitchTrackingMomentary)
    {
        var index = 0;
        for (; index < _segmentCount; ++index)
            if (_segments[index].selected)
                objj_msgSend(self, "setSelected:forSegment:", NO, index);
    }
}
});
instance_methods[9] = new objj_method(sel_registerName("trackingMode"), function $CPSegmentedControl__trackingMode(self, _cmd)
{ with(self)
{
    return _trackingMode;
}
});
instance_methods[10] = new objj_method(sel_registerName("setWidth:forSegment:"), function $CPSegmentedControl__setWidth_forSegment_(self, _cmd, aWidth, aSegment)
{ with(self)
{
    _segments[aSegment].width = aWidth;
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
});
instance_methods[11] = new objj_method(sel_registerName("widthForSegment:"), function $CPSegmentedControl__widthForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].width;
}
});
instance_methods[12] = new objj_method(sel_registerName("setImage:forSegment:"), function $CPSegmentedControl__setImage_forSegment_(self, _cmd, anImage, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (!anImage)
    {
        objj_msgSend(segment.imageView, "removeFromSuperview");
        segment.imageView = nil;
    }
    else
    {
        if (!segment.imageView)
        {
            segment.imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(self, "addSubview:", segment.imageView);
        }
        objj_msgSend(segment.imageView, "setImage:", anImage);
        objj_msgSend(segment.imageView, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(anImage, "size")));
    }
    segment.image = anImage;
    if (segment.width)
        objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
    else
        objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
});
instance_methods[13] = new objj_method(sel_registerName("imageForSegment:"), function $CPSegmentedControl__imageForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].image;
}
});
instance_methods[14] = new objj_method(sel_registerName("setLabel:forSegment:"), function $CPSegmentedControl__setLabel_forSegment_(self, _cmd, aLabel, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (!aLabel || !aLabel.length)
    {
        objj_msgSend(segment.labelView, "removeFromSuperview");
        segment.labelView = nil;
    }
    else
    {
        if (!segment.labelView)
        {
            segment.labelView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(segment.labelView, "setFont:", objj_msgSend(self, "font"));
            objj_msgSend(self, "addSubview:", segment.labelView);
        }
        objj_msgSend(segment.labelView, "setStringValue:", aLabel);
        objj_msgSend(segment.labelView, "sizeToFit");
    }
    _segments[aSegment].label = aLabel;
    if (segment.width)
        objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
    else
        objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
});
instance_methods[15] = new objj_method(sel_registerName("labelForSegment:"), function $CPSegmentedControl__labelForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].label;
}
});
instance_methods[16] = new objj_method(sel_registerName("setMenu:forSegment:"), function $CPSegmentedControl__setMenu_forSegment_(self, _cmd, aMenu, aSegment)
{ with(self)
{
    _segments[aSegment].menu = aMenu;
}
});
instance_methods[17] = new objj_method(sel_registerName("menuForSegment:"), function $CPSegmentedControl__menuForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].menu;
}
});
instance_methods[18] = new objj_method(sel_registerName("setSelected:forSegment:"), function $CPSegmentedControl__setSelected_forSegment_(self, _cmd, isSelected, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (segment.selected == isSelected)
        return;
    segment.selected = isSelected;
    if (isSelected)
    {
        var oldSelectedSegment = _selectedSegment;
        _selectedSegment = aSegment;
        if (_trackingMode == CPSegmentSwitchTrackingSelectOne && oldSelectedSegment != aSegment && oldSelectedSegment != -1)
        {
            _segments[oldSelectedSegment].selected = NO;
            objj_msgSend(self, "drawSegmentBezel:highlight:", oldSelectedSegment, NO);
        }
    }
    if (_trackingMode != CPSegmentSwitchTrackingMomentary)
        objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
}
});
instance_methods[19] = new objj_method(sel_registerName("isSelectedForSegment:"), function $CPSegmentedControl__isSelectedForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].selected;
}
});
instance_methods[20] = new objj_method(sel_registerName("setEnabled:forSegment:"), function $CPSegmentedControl__setEnabled_forSegment_(self, _cmd, isEnabled, aSegment)
{ with(self)
{
    _segments[aSegment].enabled = isEnabled;
}
});
instance_methods[21] = new objj_method(sel_registerName("isEnabledForSegment:"), function $CPSegmentedControl__isEnabledForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].enabled;
}
});
instance_methods[22] = new objj_method(sel_registerName("setTag:forSegment:"), function $CPSegmentedControl__setTag_forSegment_(self, _cmd, aTag, aSegment)
{ with(self)
{
    _segments[aSegment].tag = aTag;
}
});
instance_methods[23] = new objj_method(sel_registerName("tagForSegment:"), function $CPSegmentedControl__tagForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].tag;
}
});
instance_methods[24] = new objj_method(sel_registerName("drawSegmentBezel:highlight:"), function $CPSegmentedControl__drawSegmentBezel_highlight_(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{}
});
instance_methods[25] = new objj_method(sel_registerName("drawSegment:highlight:"), function $CPSegmentedControl__drawSegment_highlight_(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{
    var segment = _segments[aSegment],
        imageView = segment.imageView,
        labelView = segment.labelView,
        frame = segment.frame,
        segmentX = CGRectGetMinX(frame),
        segmentWidth = CGRectGetWidth(frame),
        segmentHeight = CGRectGetHeight(frame) - 1.0;
    if (imageView && labelView)
    {
        var imageViewSize = objj_msgSend(imageView, "frame").size,
            labelViewSize = objj_msgSend(labelView, "frame").size,
            totalHeight = imageViewSize.height + labelViewSize.height,
            labelWidth = MIN(labelViewSize.width, width),
            y = (segmentHeight - totalHeight) / 2.0;
        objj_msgSend(imageView, "setFrameOrigin:", CGPointMake(segmentX+(segmentWidth-imageViewSize.width)/2.0,y));
        if (labelWidth < labelViewSize.width)
            objj_msgSend(labelView, "setFrameSize:", CGSizeMake(labelWidth,labelViewSize.height));
        objj_msgSend(labelView, "setFrameOrigin:", CGPointMake(segmentX+(segmentWidth-labelWidth)/2.0,y+imageViewSize.height));
    }
    else if (imageView)
    {
        var imageViewSize = objj_msgSend(imageView, "frame").size;
        objj_msgSend(imageView, "setFrameOrigin:", CGPointMake(segmentX+(segmentWidth-imageViewSize.width)/2.0,(segmentHeight-imageViewSize.height)/2.0));
    }
    else if (labelView)
    {
        var labelViewSize = objj_msgSend(labelView, "frame").size,
            labelWidth = MIN(labelViewSize.width, segmentWidth);
        if (labelWidth < labelViewSize.width)
            objj_msgSend(labelView, "setFrameSize:", CGSizeMake(labelWidth,labelViewSize.height));
        objj_msgSend(labelView, "setFrameOrigin:", CGPointMake(segmentX+(segmentWidth-labelWidth)/2.0,(segmentHeight-labelViewSize.height)/2.0));
    }
}
});
instance_methods[26] = new objj_method(sel_registerName("tileWithChangedSegment:"), function $CPSegmentedControl__tileWithChangedSegment_(self, _cmd, aSegment)
{ with(self)
{
    var segment = _segments[aSegment],
        segmentWidth = segment.width;
    if (!segmentWidth)
    {
        if (segment.labelView && segment.imageView)
            segmentWidth = MAX(CGRectGetWidth(objj_msgSend(segment.labelView, "frame")) , CGRectGetWidth(objj_msgSend(segment.imageView, "frame")));
        else if (segment.labelView)
            segmentWidth = CGRectGetWidth(objj_msgSend(segment.labelView, "frame"));
        else if (segment.imageView)
            segmentWidth = CGRectGetWidth(objj_msgSend(segment.imageView, "frame"));
    }
    var delta = segmentWidth - CGRectGetWidth(segment.frame);
    if (!delta)
        return;
    var frame = objj_msgSend(self, "frame");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame)+delta,CGRectGetHeight(frame)));
    segment.frame.size.width = segmentWidth;
    var index = aSegment + 1;
    for (; index < _segmentCount; ++index)
    {
        _segments[index].frame.origin.x += delta;
        objj_msgSend(self, "drawSegmentBezel:highlight:", index, NO);
        objj_msgSend(self, "drawSegment:highlight:", index, NO);
    }
    objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
}
});
instance_methods[27] = new objj_method(sel_registerName("frameForSegment:"), function $CPSegmentedControl__frameForSegment_(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].frame;
}
});
instance_methods[28] = new objj_method(sel_registerName("testSegment:"), function $CPSegmentedControl__testSegment_(self, _cmd, aPoint)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil),
        count = _segments.length;
    while (count--)
        if (CGRectContainsPoint(_segments[count].frame, aPoint))
            return count;
    return -1;
}
});
instance_methods[29] = new objj_method(sel_registerName("mouseDown:"), function $CPSegmentedControl__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "trackSegment:", anEvent);
}
});
instance_methods[30] = new objj_method(sel_registerName("mouseUp:"), function $CPSegmentedControl__mouseUp_(self, _cmd, anEvent)
{ with(self)
{}
});
instance_methods[31] = new objj_method(sel_registerName("trackSegment:"), function $CPSegmentedControl__trackSegment_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (type == CPLeftMouseUp)
    {
        if (CGRectContainsPoint(_segments[_trackingSegment].frame, location))
        {
            if (_trackingMode == CPSegmentSwitchTrackingSelectAny)
            {
                objj_msgSend(self, "setSelected:forSegment:", !objj_msgSend(self, "isSelectedForSegment:", _trackingSegment), _trackingSegment);
                _selectedSegment = _trackingSegment;
            }
            else
                objj_msgSend(self, "setSelected:forSegment:", YES, _trackingSegment);
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
            if (_trackingMode == CPSegmentSwitchTrackingMomentary)
            {
                objj_msgSend(self, "setSelected:forSegment:", NO, _trackingSegment);
                _selectedSegment = -1;
            }
        }
        objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, NO);
        _trackingSegment = -1;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _trackingHighlighted = YES;
        _trackingSegment = objj_msgSend(self, "testSegment:", location);
        objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, YES);
    }
    else if (type == CPLeftMouseDragged)
    {
        var highlighted = CGRectContainsPoint(_segments[_trackingSegment].frame, location);
        if (highlighted != _trackingHighlighted)
        {
            _trackingHighlighted = highlighted;
            objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, _trackingHighlighted);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackSegment:"), CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
instance_methods[32] = new objj_method(sel_registerName("setFont:"), function $CPSegmentedControl__setFont_(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFont:", aFont);
    var count = _segmentCount;
    if (!count)
        return;
    while (count--)
        objj_msgSend(_segments[count].labelView, "setFont:", aFont);
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
});
class_addMethods(the_class, instance_methods);
}
var _CPSegmentMake = function()
{
    return { width:0, image:nil, label:"", menu:nil, selected:NO, enabled:NO, tag:0, labelView:nil, imageView:nil, frame:CGRectMakeZero() }
}

p;10;CPShadow.jI;21;Foundation/CPObject.jc;2078;
{var the_class = objj_allocateClassPair(CPObject, "CPShadow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_offset"), new objj_ivar("_blurRadius"), new objj_ivar("_color"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("shadowWithOffset:blurRadius:color:"), function $CPShadow__shadowWithOffset_blurRadius_color_(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPShadow, "alloc"), "_initWithOffset:blurRadius:color:", anOffset, aBlurRadius, aColor);
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_initWithOffset:blurRadius:color:"), function $CPShadow___initWithOffset_blurRadius_color_(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _offset = anOffset;
        _blurRadius = aBlurRadius;
        _color = aColor;
        _cssString = objj_msgSend(_color, "cssString") + " " + Math.round(anOffset.width) + "px " + Math.round(anOffset.height) + "px " + Math.round(_blurRadius) + "px";
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("shadowOffset"), function $CPShadow__shadowOffset(self, _cmd)
{ with(self)
{
    return _offset;
}
});
instance_methods[2] = new objj_method(sel_registerName("shadowBlurRadius"), function $CPShadow__shadowBlurRadius(self, _cmd)
{ with(self)
{
    return _blurRadius;
}
});
instance_methods[3] = new objj_method(sel_registerName("shadowColor"), function $CPShadow__shadowColor(self, _cmd)
{ with(self)
{
    return _color;
}
});
instance_methods[4] = new objj_method(sel_registerName("cssString"), function $CPShadow__cssString(self, _cmd)
{ with(self)
{
    return _cssString;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;14;CPShadowView.jI;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jc;7917;
CPLightShadow = 0;
CPHeavyShadow = 1;
var CPShadowViewLightBackgroundColor = nil,
    CPShadowViewHeavyBackgroundColor = nil;
var LIGHT_LEFT_INSET = 3.0,
    LIGHT_RIGHT_INSET = 3.0,
    LIGHT_TOP_INSET = 3.0,
    LIGHT_BOTTOM_INSET = 5.0,
    HEAVY_LEFT_INSET = 7.0,
    HEAVY_RIGHT_INSET = 7.0,
    HEAVY_TOP_INSET = 5.0,
    HEAVY_BOTTOM_INSET = 5.0;
{var the_class = objj_allocateClassPair(CPView, "CPShadowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_weight")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPShadowView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPShadowView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    CPShadowViewLightBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTopLeft.png"), CGSizeMake(9.0,9.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTop.png"), CGSizeMake(1.0,9.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTopRight.png"), CGSizeMake(9.0,9.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightLeft.png"), CGSizeMake(9.0,1.0)),nil,objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightRight.png"), CGSizeMake(9.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottomLeft.png"), CGSizeMake(9.0,9.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottom.png"), CGSizeMake(1.0,9.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottomRight.png"), CGSizeMake(9.0,9.0))]));
    CPShadowViewHeavyBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTopLeft.png"), CGSizeMake(17.0,17.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTop.png"), CGSizeMake(1.0,17.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTopRight.png"), CGSizeMake(17.0,17.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyLeft.png"), CGSizeMake(17.0,1.0)),nil,objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyRight.png"), CGSizeMake(17.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottomLeft.png"), CGSizeMake(17.0,17.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottom.png"), CGSizeMake(1.0,17.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottomRight.png"), CGSizeMake(17.0,17.0))]));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPShadowView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _weight = CPLightShadow;
        objj_msgSend(self, "setBackgroundColor:", CPShadowViewLightBackgroundColor);
        objj_msgSend(self, "setHitTests:", NO);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setWeight:"), function $CPShadowView__setWeight_(self, _cmd, aWeight)
{ with(self)
{
    if (_weight == aWeight)
        return;
    _weight = aWeight;
    if (_weight == CPLightShadow)
        objj_msgSend(self, "setBackgroundColor:", CPShadowViewLightBackgroundColor);
    else
        objj_msgSend(self, "setBackgroundColor:", CPShadowViewHeavyBackgroundColor);
}
});
instance_methods[2] = new objj_method(sel_registerName("leftInset"), function $CPShadowView__leftInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_LEFT_INSET : HEAVY_LEFT_INSET;
}
});
instance_methods[3] = new objj_method(sel_registerName("rightInset"), function $CPShadowView__rightInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_RIGHT_INSET : HEAVY_RIGHT_INSET;
}
});
instance_methods[4] = new objj_method(sel_registerName("topInset"), function $CPShadowView__topInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_TOP_INSET : HEAVY_TOP_INSET;
}
});
instance_methods[5] = new objj_method(sel_registerName("bottomInset"), function $CPShadowView__bottomInset(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_BOTTOM_INSET : HEAVY_BOTTOM_INSET;
}
});
instance_methods[6] = new objj_method(sel_registerName("horizontalInset"), function $CPShadowView__horizontalInset(self, _cmd)
{ with(self)
{
    if (_weight == CPLightShadow)
        return LIGHT_LEFT_INSET + LIGHT_RIGHT_INSET;
    return HEAVY_LEFT_INSET + HEAVY_RIGHT_INSET;
}
});
instance_methods[7] = new objj_method(sel_registerName("verticalInset"), function $CPShadowView__verticalInset(self, _cmd)
{ with(self)
{
    if (_weight == CPLightShadow)
        return LIGHT_TOP_INSET + LIGHT_BOTTOM_INSET;
    return HEAVY_TOP_INSET + HEAVY_BOTTOM_INSET;
}
});
class_methods[1] = new objj_method(sel_registerName("frameForContentFrame:withWeight:"), function $CPShadowView__frameForContentFrame_withWeight_(self, _cmd, aFrame, aWeight)
{ with(self)
{
    if (aWeight == CPLightShadow)
        return CGRectMake((aFrame.origin.x) - LIGHT_LEFT_INSET, (aFrame.origin.y) - LIGHT_TOP_INSET, (aFrame.size.width) + LIGHT_LEFT_INSET + LIGHT_RIGHT_INSET, (aFrame.size.height) + LIGHT_TOP_INSET + LIGHT_BOTTOM_INSET);
    else
        return CGRectMake((aFrame.origin.x) - HEAVY_LEFT_INSET, (aFrame.origin.y) - HEAVY_TOP_INSET, (aFrame.size.width) + HEAVY_LEFT_INSET + HEAVY_RIGHT_INSET, (aFrame.size.height) + HEAVY_TOP_INSET + HEAVY_BOTTOM_INSET);
}
});
instance_methods[8] = new objj_method(sel_registerName("frameForContentFrame:"), function $CPShadowView__frameForContentFrame_(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameForContentFrame:withWeight:", aFrame, _weight);
}
});
instance_methods[9] = new objj_method(sel_registerName("setFrameForContentFrame:"), function $CPShadowView__setFrameForContentFrame_(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:", objj_msgSend(self, "frameForContentFrame:", aFrame));
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;10;CPSlider.ji;11;CPControl.jc;13326;
var CPSliderHorizontalKnobImage = nil,
    CPSliderHorizontalBarLeftImage = nil,
    CPSliderHorizontalBarRightImage = nil,
    CPSliderHorizontalBarCenterImage = nil;
{var the_class = objj_allocateClassPair(CPControl, "CPSlider"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_value"), new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_altIncrementValue"), new objj_ivar("_bar"), new objj_ivar("_knob"), new objj_ivar("_isVertical"), new objj_ivar("_standardKnob"), new objj_ivar("_standardVerticalBar"), new objj_ivar("_standardHorizontalBar")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPSlider__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPSlider, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPSliderKnobImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSlider/CPSliderKnobRegular.png"), CPSizeMake(11.0,11.0)),
    CPSliderKnobPushedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSlider/CPSliderKnobRegularPushed.png"), CPSizeMake(11.0,11.0)),
    CPSliderHorizontalBarLeftImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSlider/CPSliderTrackHorizontalLeft.png"), CPSizeMake(2.0,4.0)),
    CPSliderHorizontalBarRightImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSlider/CPSliderTrackHorizontalRight.png"), CPSizeMake(2.0,4.0)),
    CPSliderHorizontalBarCenterImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSlider/CPSliderTrackHorizontalCenter.png"), CPSizeMake(1.0,4.0));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPSlider__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _value = 50.0;
        _minValue = 0.0;
        _maxValue = 100.0;
        _bar = objj_msgSend(self, "bar");
        _knob = objj_msgSend(self, "knob");
        _knobSize = objj_msgSend(objj_msgSend(self, "knobImage"), "size");
        _isVertical = objj_msgSend(self, "isVertical");
        objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "knobPosition"));
        objj_msgSend(self, "addSubview:", _bar);
        objj_msgSend(self, "addSubview:", _knob);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setFrameSize:"), function $CPSlider__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    if(aSize.height > 21.0)
        aSize.height = 21.0;
    if (_isVertical != objj_msgSend(self, "isVertical"))
    {
        _isVertical = objj_msgSend(self, "isVertical");
        var bar = objj_msgSend(self, "bar"),
            knob = objj_msgSend(self, "knob");
        if (_bar != bar)
            objj_msgSend(self, "replaceSubview:withView:", _bar=bar, _bar);
        if (_knob != knob)
        {
            objj_msgSend(self, "replaceSubview:withView:", knob, _knob);
            _knob = knob;
            objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "knobPosition"));
        }
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "knobPosition"));
}
});
instance_methods[2] = new objj_method(sel_registerName("altIncrementValue"), function $CPSlider__altIncrementValue(self, _cmd)
{ with(self)
{
    return _altIncrementValue;
}
});
instance_methods[3] = new objj_method(sel_registerName("knobThickness"), function $CPSlider__knobThickness(self, _cmd)
{ with(self)
{
    return CPRectGetWidth(objj_msgSend(_knob, "frame"));
}
});
instance_methods[4] = new objj_method(sel_registerName("leftTrackImage"), function $CPSlider__leftTrackImage(self, _cmd)
{ with(self)
{
    return CPSliderHorizontalBarLeftImage;
}
});
instance_methods[5] = new objj_method(sel_registerName("rightTrackImage"), function $CPSlider__rightTrackImage(self, _cmd)
{ with(self)
{
    return CPSliderHorizontalBarRightImage;
}
});
instance_methods[6] = new objj_method(sel_registerName("centerTrackImage"), function $CPSlider__centerTrackImage(self, _cmd)
{ with(self)
{
    return CPSliderHorizontalBarCenterImage
}
});
instance_methods[7] = new objj_method(sel_registerName("knobImage"), function $CPSlider__knobImage(self, _cmd)
{ with(self)
{
    return CPSliderKnobImage;
}
});
instance_methods[8] = new objj_method(sel_registerName("pushedKnobImage"), function $CPSlider__pushedKnobImage(self, _cmd)
{ with(self)
{
    return CPSliderKnobPushedImage;
}
});
instance_methods[9] = new objj_method(sel_registerName("knob"), function $CPSlider__knob(self, _cmd)
{ with(self)
{
    if (!_standardKnob)
    {
        var knobImage = objj_msgSend(self, "knobImage"),
            knobSize = objj_msgSend(knobImage, "size");
        _standardKnob = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CPRectMake(0.0,0.0,knobSize.width,knobSize.height));
        objj_msgSend(_standardKnob, "setImage:", knobImage);
    }
    return _standardKnob;
}
});
instance_methods[10] = new objj_method(sel_registerName("bar"), function $CPSlider__bar(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isVertical"))
        return nil;
    else
    {
        if (!_standardHorizontalBar)
        {
            var frame = objj_msgSend(self, "frame"),
                barFrame = CPRectMake(0.0, 0.0, CPRectGetWidth(frame), 4.0);
            _standardHorizontalBar = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", barFrame);
            objj_msgSend(_standardHorizontalBar, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", [objj_msgSend(self, "leftTrackImage"),objj_msgSend(self, "centerTrackImage"),objj_msgSend(self, "rightTrackImage")], NO)));
            objj_msgSend(_standardHorizontalBar, "setFrame:", CPRectMake(0.0,(CPRectGetHeight(frame)-CPRectGetHeight(barFrame))/2.0,CPRectGetWidth(_isVertical?barFrame:frame),CPRectGetHeight(_isVertical?frame:barFrame)));
            objj_msgSend(_standardHorizontalBar, "setAutoresizingMask:", _isVertical?CPViewHeightSizable:CPViewWidthSizable);
        }
        return _standardHorizontalBar;
    }
}
});
instance_methods[11] = new objj_method(sel_registerName("setAltIncrementValue:"), function $CPSlider__setAltIncrementValue_(self, _cmd, anIncrementValue)
{ with(self)
{
    _altIncrementValue = anIncrementValue;
}
});
instance_methods[12] = new objj_method(sel_registerName("isVertical"), function $CPSlider__isVertical(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "frame");
    if (CPRectGetWidth(frame) == CPRectGetHeight(frame))
        return -1;
    return CPRectGetWidth(frame) < CPRectGetHeight(frame);
}
});
instance_methods[13] = new objj_method(sel_registerName("maxValue"), function $CPSlider__maxValue(self, _cmd)
{ with(self)
{
    return _maxValue;
}
});
instance_methods[14] = new objj_method(sel_registerName("minValue"), function $CPSlider__minValue(self, _cmd)
{ with(self)
{
    return _minValue;
}
});
instance_methods[15] = new objj_method(sel_registerName("setMaxValue:"), function $CPSlider__setMaxValue_(self, _cmd, aMaxValue)
{ with(self)
{
    _maxValue = aMaxValue;
}
});
instance_methods[16] = new objj_method(sel_registerName("setMinValue:"), function $CPSlider__setMinValue_(self, _cmd, aMinValue)
{ with(self)
{
    _minValue = aMinValue;
}
});
instance_methods[17] = new objj_method(sel_registerName("setValue:"), function $CPSlider__setValue_(self, _cmd, aValue)
{ with(self)
{
    _value = aValue;
    objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "knobPosition"));
}
});
instance_methods[18] = new objj_method(sel_registerName("value"), function $CPSlider__value(self, _cmd)
{ with(self)
{
    return _value;
}
});
instance_methods[19] = new objj_method(sel_registerName("knobPosition"), function $CPSlider__knobPosition(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isVertical"))
        return CPPointMake(0.0, 0.0);
    else
        return CPPointMake(
            ((_value - _minValue) / (_maxValue - _minValue)) * (CPRectGetWidth(objj_msgSend(self, "frame")) - CPRectGetWidth(objj_msgSend(_knob, "frame"))),
            (CPRectGetHeight(objj_msgSend(self, "frame")) - CPRectGetHeight(objj_msgSend(_knob, "frame"))) / 2.0);
}
});
instance_methods[20] = new objj_method(sel_registerName("valueForKnobPosition:"), function $CPSlider__valueForKnobPosition_(self, _cmd, aPoint)
{ with(self)
{
    if (objj_msgSend(self, "isVertical"))
        return 0.0;
    else
        return MAX(MIN((aPoint.x) * (_maxValue - _minValue) / ( CPRectGetWidth(objj_msgSend(self, "frame")) - CPRectGetWidth(objj_msgSend(_knob, "frame")) ) + _minValue, _maxValue), _minValue);
}
});
instance_methods[21] = new objj_method(sel_registerName("constrainKnobPosition:"), function $CPSlider__constrainKnobPosition_(self, _cmd, aPoint)
{ with(self)
{
    aPoint.x -= _knobSize.width / 2.0;
    return CPPointMake(MAX(MIN(CPRectGetWidth(objj_msgSend(self, "bounds")) - _knobSize.width, aPoint.x), 0.0), (CPRectGetHeight(objj_msgSend(self, "bounds")) - CPRectGetHeight(objj_msgSend(_knob, "frame"))) / 2.0);
}
});
instance_methods[22] = new objj_method(sel_registerName("mouseUp:"), function $CPSlider__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "knob"), "setImage:", objj_msgSend(self, "knobImage"));
    if (objj_msgSend(_target, "respondsToSelector:", sel_registerName("sliderDidFinish:")))
        objj_msgSend(_target, "sliderDidFinish:", self);
}
});
instance_methods[23] = new objj_method(sel_registerName("mouseDown:"), function $CPSlider__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "constrainKnobPosition:", objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)));
    _value = objj_msgSend(self, "valueForKnobPosition:", objj_msgSend(_knob, "frame").origin);
    objj_msgSend(objj_msgSend(self, "knob"), "setImage:", objj_msgSend(self, "pushedKnobImage"));
    objj_msgSend(self, "sendAction:to:", _action, _target);
}
});
instance_methods[24] = new objj_method(sel_registerName("mouseDragged:"), function $CPSlider__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "constrainKnobPosition:", objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)));
    _value = objj_msgSend(self, "valueForKnobPosition:", objj_msgSend(_knob, "frame").origin);
    objj_msgSend(self, "sendAction:to:", _action, _target);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPSliderMinValueKey = "CPSliderMinValueKey",
    CPSliderMaxValueKey = "CPSliderMaxValueKey",
    CPSliderValueKey = "CPSliderValueKey";
{
var the_class = objj_getClass("CPSlider")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSlider\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPSlider__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _value = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderValueKey);
        _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMinValueKey);
        _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMaxValueKey);
        _bar = objj_msgSend(self, "bar");
        _knob = objj_msgSend(self, "knob");
        _knobSize = objj_msgSend(objj_msgSend(self, "knobImage"), "size");
        _isVertical = objj_msgSend(self, "isVertical");
        objj_msgSend(_knob, "setFrameOrigin:", objj_msgSend(self, "knobPosition"));
        objj_msgSend(self, "addSubview:", _bar);
        objj_msgSend(self, "addSubview:", _knob);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPSlider__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    var subviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    _subviews = subviews;
    objj_msgSend(aCoder, "encodeDouble:forKey:", _value, CPSliderValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _minValue, CPSliderMinValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _maxValue, CPSliderMaxValueKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;21;CPSliderColorPicker.jI;23;Foundation/Foundation.jI;15;AppKit/CPView.jI;17;AppKit/CPSlider.jI;22;AppKit/CPColorPicker.jI;21;AppKit/CPColorPanel.jc;16902;
{var the_class = objj_allocateClassPair(CPColorPicker, "CPSliderColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_redSlider"), new objj_ivar("_greenSlider"), new objj_ivar("_blueSlider"), new objj_ivar("_hueSlider"), new objj_ivar("_saturationSlider"), new objj_ivar("_brightnessSlider"), new objj_ivar("_rgbLabel"), new objj_ivar("_hsbLabel"), new objj_ivar("_redLabel"), new objj_ivar("_greenLabel"), new objj_ivar("_blueLabel"), new objj_ivar("_hueLabel"), new objj_ivar("_saturationLabel"), new objj_ivar("_brightnessLabel"), new objj_ivar("_hexLabel"), new objj_ivar("_redValue"), new objj_ivar("_greenValue"), new objj_ivar("_blueValue"), new objj_ivar("_hueValue"), new objj_ivar("_saturationValue"), new objj_ivar("_brightnessValue"), new objj_ivar("_hexValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithPickerMask:colorPanel:"), function $CPSliderColorPicker__initWithPickerMask_colorPanel_(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask, owningColorPanel);
}
});
instance_methods[1] = new objj_method(sel_registerName("initView"), function $CPSliderColorPicker__initView(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    _rgbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,10,100,20));
    objj_msgSend(_rgbLabel, "setStringValue:", "RGB");
    objj_msgSend(_rgbLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _redLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,35,15,20));
    objj_msgSend(_redLabel, "setStringValue:", "R");
    objj_msgSend(_redLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _redSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(15,35,aFrame.size.width-70,20));
    objj_msgSend(_redSlider, "setMaxValue:", 1.0);
    objj_msgSend(_redSlider, "setMinValue:", 0.0);
    objj_msgSend(_redSlider, "setTarget:", self);
    objj_msgSend(_redSlider, "setAction:", sel_registerName("sliderChanged:"));
    objj_msgSend(_redSlider, "setAutoresizingMask:", CPViewWidthSizable);
    var updateFunction = function(aDOMEvent)
    {
        if(isNaN(this.value))
            return;
        switch(this)
        {
            case _redValue: objj_msgSend(_redSlider, "setValue:", MAX(MIN(ROUND(this.value),255)/255.0,0));
                                   objj_msgSend(self, "sliderChanged:", _redSlider);
                                   break;
            case _greenValue: objj_msgSend(_greenSlider, "setValue:", MAX(MIN(ROUND(this.value),255)/255.0,0));
                                   objj_msgSend(self, "sliderChanged:", _greenSlider);
                                   break;
            case _blueValue: objj_msgSend(_blueSlider, "setValue:", MAX(MIN(ROUND(this.value),255)/255.0,0));
                                   objj_msgSend(self, "sliderChanged:", _blueSlider);
                                   break;
            case _hueValue: objj_msgSend(_hueSlider, "setValue:", MAX(MIN(ROUND(this.value),360),0));
                                   objj_msgSend(self, "sliderChanged:", _hueSlider);
                                   break;
            case _saturationValue: objj_msgSend(_saturationSlider, "setValue:", MAX(MIN(ROUND(this.value),100),0));
                                   objj_msgSend(self, "sliderChanged:", _saturationSlider);
                                   break;
            case _brightnessValue: objj_msgSend(_brightnessSlider, "setValue:", MAX(MIN(ROUND(this.value),100),0));
                                   objj_msgSend(self, "sliderChanged:", _brightnessSlider);
                                   break;
        }
        this.blur();
    };
    var keypressFunction = function(aDOMEvent)
    {
        aDOMEvent = aDOMEvent || window.event;
        if (aDOMEvent.keyCode == 13)
        {
            updateFunction(aDOMEvent);
            if(aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            else if(aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
        }
    }
    var redValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(aFrame.size.width-45,35,45,20));
    objj_msgSend(redValue, "setAutoresizingMask:", CPViewMinXMargin);
    _redValue = document.createElement("input");
    _redValue.style.width = "40px";
    _redValue.style.backgroundColor = "transparent";
    _redValue.style.border = "1px solid white";
    _redValue.style.color = "white";
    _redValue.style.position = "absolute";
    _redValue.style.top = "0px";
    _redValue.style.left = "0px";
    _redValue.onchange = updateFunction;
    redValue._DOMElement.appendChild(_redValue);
    objj_msgSend(_contentView, "addSubview:", redValue);
    _greenLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,58,15,20));
    objj_msgSend(_greenLabel, "setStringValue:", "G");
    objj_msgSend(_greenLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _greenSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(15,58,aFrame.size.width-70,20));
    objj_msgSend(_greenSlider, "setMaxValue:", 1.0);
    objj_msgSend(_greenSlider, "setMinValue:", 0.0);
    objj_msgSend(_greenSlider, "setTarget:", self);
    objj_msgSend(_greenSlider, "setAction:", sel_registerName("sliderChanged:"));
    objj_msgSend(_greenSlider, "setAutoresizingMask:", CPViewWidthSizable);
    var greenValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(aFrame.size.width-45,58,45,20));
    objj_msgSend(greenValue, "setAutoresizingMask:", CPViewMinXMargin);
    _greenValue = _redValue.cloneNode(false);
    _greenValue.onchange = updateFunction;
    greenValue._DOMElement.appendChild(_greenValue);
    objj_msgSend(_contentView, "addSubview:", greenValue);
    _blueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,81,15,20));
    objj_msgSend(_blueLabel, "setStringValue:", "B");
    objj_msgSend(_blueLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _blueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(15,81,aFrame.size.width-70,20));
    objj_msgSend(_blueSlider, "setMaxValue:", 1.0);
    objj_msgSend(_blueSlider, "setMinValue:", 0.0);
    objj_msgSend(_blueSlider, "setTarget:", self);
    objj_msgSend(_blueSlider, "setAction:", sel_registerName("sliderChanged:"));
    objj_msgSend(_blueSlider, "setAutoresizingMask:", CPViewWidthSizable);
    var blueValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(aFrame.size.width-45,81,45,20));
    objj_msgSend(blueValue, "setAutoresizingMask:", CPViewMinXMargin);
    _blueValue = _redValue.cloneNode(false);
    _blueValue.onchange = updateFunction;
    blueValue._DOMElement.appendChild(_blueValue);
    objj_msgSend(_contentView, "addSubview:", blueValue);
    _hsbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,120,100,20));
    objj_msgSend(_hsbLabel, "setStringValue:", "HSB");
    objj_msgSend(_hsbLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _hueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,145,15,20));
    objj_msgSend(_hueLabel, "setStringValue:", "H");
    objj_msgSend(_hueLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _hueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(15,145,aFrame.size.width-70,20));
    objj_msgSend(_hueSlider, "setMaxValue:", 359.0);
    objj_msgSend(_hueSlider, "setMinValue:", 0.0);
    objj_msgSend(_hueSlider, "setTarget:", self);
    objj_msgSend(_hueSlider, "setAction:", sel_registerName("sliderChanged:"));
    objj_msgSend(_hueSlider, "setAutoresizingMask:", CPViewWidthSizable);
    var hueValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(aFrame.size.width-45,145,45,20));
    objj_msgSend(hueValue, "setAutoresizingMask:", CPViewMinXMargin);
    _hueValue = _redValue.cloneNode(false);
    _hueValue.onchange = updateFunction;
    hueValue._DOMElement.appendChild(_hueValue);
    objj_msgSend(_contentView, "addSubview:", hueValue);
    _saturationLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,168,15,20));
    objj_msgSend(_saturationLabel, "setStringValue:", "S");
    objj_msgSend(_saturationLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _saturationSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(15,168,aFrame.size.width-70,20));
    objj_msgSend(_saturationSlider, "setMaxValue:", 100.0);
    objj_msgSend(_saturationSlider, "setMinValue:", 0.0);
    objj_msgSend(_saturationSlider, "setTarget:", self);
    objj_msgSend(_saturationSlider, "setAction:", sel_registerName("sliderChanged:"));
    objj_msgSend(_saturationSlider, "setAutoresizingMask:", CPViewWidthSizable);
    var saturationValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(aFrame.size.width-45,168,45,20));
    objj_msgSend(saturationValue, "setAutoresizingMask:", CPViewMinXMargin);
    _saturationValue = _redValue.cloneNode(false);
    _saturationValue.onchange = updateFunction;
    saturationValue._DOMElement.appendChild(_saturationValue);
    objj_msgSend(_contentView, "addSubview:", saturationValue);
    _brightnessLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,191,15,20));
    objj_msgSend(_brightnessLabel, "setStringValue:", "B");
    objj_msgSend(_brightnessLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CPRectMake(15,191,aFrame.size.width-70,20));
    objj_msgSend(_brightnessSlider, "setMaxValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setMinValue:", 0.0);
    objj_msgSend(_brightnessSlider, "setTarget:", self);
    objj_msgSend(_brightnessSlider, "setAction:", sel_registerName("sliderChanged:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:", CPViewWidthSizable);
    var brightnessValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(aFrame.size.width-45,191,45,20));
    objj_msgSend(brightnessValue, "setAutoresizingMask:", CPViewMinXMargin);
    _brightnessValue = _redValue.cloneNode(false);
    _brightnessValue.onchange = updateFunction;
    brightnessValue._DOMElement.appendChild(_brightnessValue);
    objj_msgSend(_contentView, "addSubview:", brightnessValue);
    _hexLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMake(0,230,100,20));
    objj_msgSend(_hexLabel, "setStringValue:", "Hex");
    objj_msgSend(_hexLabel, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    _hexValue = _redValue.cloneNode(false);
    _hexValue.style.top = "255px";
    _hexValue.style.width = "80px";
    _hexValue.style.left = "0px";
    _hexValue.onkeypress = function(aDOMEvent)
    {
        aDOMEvent = aDOMEvent || window.event;
        if (aDOMEvent.keyCode == 13)
        {
            var newColor = objj_msgSend(CPColor, "colorWithHexString:", this.value);
            if(newColor)
            {
                objj_msgSend(self, "setColor:", newColor);
                objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", newColor);
            }
            if(aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            else if(aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
            this.blur();
        }
    };
    _contentView._DOMElement.appendChild(_hexValue);
    objj_msgSend(_contentView, "addSubview:", _rgbLabel);
    objj_msgSend(_contentView, "addSubview:", _redLabel);
    objj_msgSend(_contentView, "addSubview:", _greenLabel);
    objj_msgSend(_contentView, "addSubview:", _blueLabel);
    objj_msgSend(_contentView, "addSubview:", _redSlider);
    objj_msgSend(_contentView, "addSubview:", _greenSlider);
    objj_msgSend(_contentView, "addSubview:", _blueSlider);
    objj_msgSend(_contentView, "addSubview:", _hsbLabel);
    objj_msgSend(_contentView, "addSubview:", _hueLabel);
    objj_msgSend(_contentView, "addSubview:", _saturationLabel);
    objj_msgSend(_contentView, "addSubview:", _brightnessLabel);
    objj_msgSend(_contentView, "addSubview:", _hueSlider);
    objj_msgSend(_contentView, "addSubview:", _saturationSlider);
    objj_msgSend(_contentView, "addSubview:", _brightnessSlider);
    objj_msgSend(_contentView, "addSubview:", _hexLabel);
}
});
instance_methods[2] = new objj_method(sel_registerName("provideNewView:"), function $CPSliderColorPicker__provideNewView_(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _contentView;
}
});
instance_methods[3] = new objj_method(sel_registerName("currentMode"), function $CPSliderColorPicker__currentMode(self, _cmd)
{ with(self)
{
    return CPSliderColorPickerMode;
}
});
instance_methods[4] = new objj_method(sel_registerName("supportsMode:"), function $CPSliderColorPicker__supportsMode_(self, _cmd, mode)
{ with(self)
{
    return (mode == CPSliderColorPickerMode) ? YES : NO;
}
});
instance_methods[5] = new objj_method(sel_registerName("sliderChanged:"), function $CPSliderColorPicker__sliderChanged_(self, _cmd, sender)
{ with(self)
{
    var newColor;
    switch(sender)
    {
        case _hueSlider:
        case _saturationSlider:
        case _brightnessSlider: newColor = objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", objj_msgSend(_hueSlider, "value"), objj_msgSend(_saturationSlider, "value"), objj_msgSend(_brightnessSlider, "value"));
                                        objj_msgSend(self, "updateRGBSliders:", newColor);
                                        break;
        case _redSlider:
        case _greenSlider:
        case _blueSlider: newColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", objj_msgSend(_redSlider, "value"), objj_msgSend(_greenSlider, "value"), objj_msgSend(_blueSlider, "value"), 1.0);
                                        objj_msgSend(self, "updateHSBSliders:", newColor);
                                        break;
    }
    objj_msgSend(self, "updateLabels");
    objj_msgSend(self, "updateHex:", newColor);
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", newColor);
}
});
instance_methods[6] = new objj_method(sel_registerName("setColor:"), function $CPSliderColorPicker__setColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(self, "updateRGBSliders:", aColor);
    objj_msgSend(self, "updateHSBSliders:", aColor);
    objj_msgSend(self, "updateHex:", aColor);
    objj_msgSend(self, "updateLabels");
}
});
instance_methods[7] = new objj_method(sel_registerName("updateHSBSliders:"), function $CPSliderColorPicker__updateHSBSliders_(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents");
    objj_msgSend(_hueSlider, "setValue:", hsb[0]);
    objj_msgSend(_saturationSlider, "setValue:", hsb[1]);
    objj_msgSend(_brightnessSlider, "setValue:", hsb[2]);
}
});
instance_methods[8] = new objj_method(sel_registerName("updateHex:"), function $CPSliderColorPicker__updateHex_(self, _cmd, aColor)
{ with(self)
{
    _hexValue.value = objj_msgSend(aColor, "hexString");
}
});
instance_methods[9] = new objj_method(sel_registerName("updateRGBSliders:"), function $CPSliderColorPicker__updateRGBSliders_(self, _cmd, aColor)
{ with(self)
{
    var rgb = objj_msgSend(aColor, "components");
    objj_msgSend(_redSlider, "setValue:", rgb[0]);
    objj_msgSend(_greenSlider, "setValue:", rgb[1]);
    objj_msgSend(_blueSlider, "setValue:", rgb[2]);
}
});
instance_methods[10] = new objj_method(sel_registerName("updateLabels"), function $CPSliderColorPicker__updateLabels(self, _cmd)
{ with(self)
{
    _hueValue.value = ROUND(objj_msgSend(_hueSlider, "value"));
    _saturationValue.value = ROUND(objj_msgSend(_saturationSlider, "value"));
    _brightnessValue.value = ROUND(objj_msgSend(_brightnessSlider, "value"));
    _redValue.value = ROUND(objj_msgSend(_redSlider, "value") * 255);
    _greenValue.value = ROUND(objj_msgSend(_greenSlider, "value") * 255);
    _blueValue.value = ROUND(objj_msgSend(_blueSlider, "value") * 255);
}
});
class_addMethods(the_class, instance_methods);
}

p;13;CPSplitView.ji;9;CPImage.ji;8;CPView.jc;21911;
CPSplitViewDidResizeSubviewsNotification = "CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification = "CPSplitViewWillResizeSubviewsNotification";
var CPSplitViewHorizontalImage = nil,
    CPSplitViewVerticalImage = nil;
{var the_class = objj_allocateClassPair(CPView, "CPSplitView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_isVertical"), new objj_ivar("_isPaneSplitter"), new objj_ivar("_currentDivider"), new objj_ivar("_initialOffset"), new objj_ivar("_originComponent"), new objj_ivar("_sizeComponent"), new objj_ivar("_DOMDividerElements"), new objj_ivar("_dividerImagePath"), new objj_ivar("_drawingDivider"), new objj_ivar("_needsResizeSubviews")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPSplitView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPSplitView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPSplitViewHorizontalImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSplitView/CPSplitViewHorizontal.png"), CPSizeMake(5.0,10.0));
    CPSplitViewVerticalImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSplitView/CPSplitViewVertical.png"), CPSizeMake(10.0,5.0));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPSplitView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame))
    {
        _currentDivider = CPNotFound;
        _DOMDividerElements = [];
        objj_msgSend(self, "_setVertical:", YES);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("dividerThickness"), function $CPSplitView__dividerThickness(self, _cmd)
{ with(self)
{
    return _isPaneSplitter ? 1.0 : 10.0;
}
});
instance_methods[2] = new objj_method(sel_registerName("isVertical"), function $CPSplitView__isVertical(self, _cmd)
{ with(self)
{
    return _isVertical;
}
});
instance_methods[3] = new objj_method(sel_registerName("setVertical:"), function $CPSplitView__setVertical_(self, _cmd, shouldBeVertical)
{ with(self)
{
    if (!objj_msgSend(self, "_setVertical:", shouldBeVertical))
        return;
    var frame = objj_msgSend(self, "frame"),
        dividerThickness = objj_msgSend(self, "dividerThickness");
    objj_msgSend(self, "_postNotificationWillResize");
    var eachSize = ROUND((frame.size[_sizeComponent] - dividerThickness * (_subviews.length - 1)) / _subviews.length),
        index = 0,
        count = _subviews.length;
    if (objj_msgSend(self, "isVertical"))
        for (; index < count; ++index)
            objj_msgSend(_subviews[index], "setFrame:", CGRectMake(ROUND((eachSize+dividerThickness)*index),0,eachSize,frame.size.height));
    else
        for (; index < count; ++index)
            objj_msgSend(_subviews[index], "setFrame:", CGRectMake(0,ROUND((eachSize+dividerThickness)*index),frame.size.width,eachSize));
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "_postNotificationDidResize");
}
});
instance_methods[4] = new objj_method(sel_registerName("_setVertical:"), function $CPSplitView___setVertical_(self, _cmd, shouldBeVertical)
{ with(self)
{
    var changed = (_isVertical != shouldBeVertical);
    _isVertical = shouldBeVertical;
    _originComponent = objj_msgSend(self, "isVertical") ? "x" : "y";
    _sizeComponent = objj_msgSend(self, "isVertical") ? "width" : "height";
    _dividerImagePath = objj_msgSend(self, "isVertical") ? objj_msgSend(CPSplitViewVerticalImage, "filename") : objj_msgSend(CPSplitViewHorizontalImage, "filename");
    return changed;
}
});
instance_methods[5] = new objj_method(sel_registerName("isPaneSplitter"), function $CPSplitView__isPaneSplitter(self, _cmd)
{ with(self)
{
    return _isPaneSplitter;
}
});
instance_methods[6] = new objj_method(sel_registerName("setIsPaneSplitter:"), function $CPSplitView__setIsPaneSplitter_(self, _cmd, shouldBePaneSplitter)
{ with(self)
{
    if (_isPaneSplitter == shouldBePaneSplitter)
        return;
    _isPaneSplitter = shouldBePaneSplitter;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
});
instance_methods[7] = new objj_method(sel_registerName("didAddSubview:"), function $CPSplitView__didAddSubview_(self, _cmd, aSubview)
{ with(self)
{
    _needsResizeSubviews = YES;
}
});
instance_methods[8] = new objj_method(sel_registerName("isSubviewCollapsed:"), function $CPSplitView__isSubviewCollapsed_(self, _cmd, subview)
{ with(self)
{
    return objj_msgSend(subview, "frame").size[_sizeComponent] < 1 ? YES : NO;
}
});
instance_methods[9] = new objj_method(sel_registerName("rectOfDividerAtIndex:"), function $CPSplitView__rectOfDividerAtIndex_(self, _cmd, aDivider)
{ with(self)
{
    var frame = objj_msgSend(_subviews[aDivider], "frame"),
        rect = CGRectMakeZero();
    rect.size = objj_msgSend(self, "frame").size;
    rect.size[_sizeComponent] = objj_msgSend(self, "dividerThickness");
    rect.origin[_originComponent] = frame.origin[_originComponent] + frame.size[_sizeComponent];
    return rect;
}
});
instance_methods[10] = new objj_method(sel_registerName("effectiveRectOfDividerAtIndex:"), function $CPSplitView__effectiveRectOfDividerAtIndex_(self, _cmd, aDivider)
{ with(self)
{
    var realRect = objj_msgSend(self, "rectOfDividerAtIndex:", aDivider);
    var padding = 2;
    realRect.size[_sizeComponent] += padding * 2;
    realRect.origin[_originComponent] -= padding;
    return realRect;
}
});
instance_methods[11] = new objj_method(sel_registerName("drawRect:"), function $CPSplitView__drawRect_(self, _cmd, rect)
{ with(self)
{
    var count = objj_msgSend(_subviews, "count") - 1;
    while (count--)
        objj_msgSend(self, "drawDividerInRect:", objj_msgSend(self, "rectOfDividerAtIndex:", count));
}
});
instance_methods[12] = new objj_method(sel_registerName("drawDividerInRect:"), function $CPSplitView__drawDividerInRect_(self, _cmd, aRect)
{ with(self)
{}
});
instance_methods[13] = new objj_method(sel_registerName("viewWillDraw"), function $CPSplitView__viewWillDraw(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
}
});
instance_methods[14] = new objj_method(sel_registerName("_adjustSubviewsWithCalculatedSize"), function $CPSplitView___adjustSubviewsWithCalculatedSize(self, _cmd)
{ with(self)
{
    if (!_needsResizeSubviews)
        return;
    _needsResizeSubviews = NO;
    var subviews = objj_msgSend(self, "subviews"),
        count = subviews.length,
        oldSize = CGSizeMakeZero();
    if (objj_msgSend(self, "isVertical"))
    {
        oldSize.width += objj_msgSend(self, "dividerThickness") * (count - 1);
        oldSize.height = CGRectGetHeight(objj_msgSend(self, "frame"));
    }
    else
    {
        oldSize.width = CGRectGetWidth(objj_msgSend(self, "frame"));
        oldSize.height += objj_msgSend(self, "dividerThickness") * (count - 1);
    }
    while (count--)
        oldSize[_sizeComponent] += objj_msgSend(subviews[count], "frame").size[_sizeComponent];
    objj_msgSend(self, "resizeSubviewsWithOldSize:", oldSize);
}
});
instance_methods[15] = new objj_method(sel_registerName("cursorAtPoint:hitDividerAtIndex:"), function $CPSplitView__cursorAtPoint_hitDividerAtIndex_(self, _cmd, aPoint, anIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[anIndex], "frame"),
        startPosition = frame.origin[_originComponent] + frame.size[_sizeComponent],
        effectiveRect = objj_msgSend(self, "effectiveRectOfDividerAtIndex:", anIndex),
        additionalRect = null;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:")))
        effectiveRect = objj_msgSend(_delegate, "splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:", self, effectiveRect, effectiveRect, anIndex);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:additionalEffectiveRectOfDividerAtIndex:")))
        additionalRect = objj_msgSend(_delegate, "splitView:additionalEffectiveRectOfDividerAtIndex:", self, anIndex);
    return CGRectContainsPoint(effectiveRect, aPoint) || (additionalRect && CGRectContainsPoint(additionalRect, aPoint));
}
});
instance_methods[16] = new objj_method(sel_registerName("hitTest:"), function $CPSplitView__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    if (objj_msgSend(self, "isHidden") || !objj_msgSend(self, "hitTests") || !CGRectContainsPoint(objj_msgSend(self, "frame"), aPoint))
        return nil;
    var point = objj_msgSend(self, "convertPoint:fromView:", aPoint, objj_msgSend(self, "superview"));
    var count = objj_msgSend(_subviews, "count") - 1;
    for (var i = 0; i < count; i++)
    {
        if (objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            return self;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "hitTest:", aPoint);
}
});
instance_methods[17] = new objj_method(sel_registerName("trackDivider:"), function $CPSplitView__trackDivider_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseUp)
    {
        if (_currentDivider != CPNotFound)
        {
            _currentDivider = CPNotFound;
            objj_msgSend(self, "_postNotificationDidResize");
        }
        return;
    }
    if (type == CPLeftMouseDown)
    {
        var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        _currentDivider = CPNotFound;
        var count = objj_msgSend(_subviews, "count") - 1;
        for (var i = 0; i < count; i++)
        {
            var frame = objj_msgSend(_subviews[i], "frame"),
                startPosition = frame.origin[_originComponent] + frame.size[_sizeComponent];
            if (objj_msgSend(self, "cursorAtPoint:hitDividerAtIndex:", point, i))
            {
                if (objj_msgSend(anEvent, "clickCount") == 2 &&
                    objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:canCollapseSubview:")) &&
                    objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:")))
                {
                    var minPosition = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", i),
                        maxPosition = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", i);
                    if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i]) && objj_msgSend(_delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, _subviews[i], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", _subviews[i]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", (minPosition+(maxPosition-minPosition)/2), i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", minPosition, i);
                    }
                    else if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i+1]) && objj_msgSend(_delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, _subviews[i+1], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", _subviews[i+1]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", (minPosition+(maxPosition-minPosition)/2), i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", maxPosition, i);
                    }
                }
                else
                {
                    _currentDivider = i;
                    _initialOffset = startPosition - point[_originComponent];
                    objj_msgSend(self, "_postNotificationWillResize");
                }
            }
        }
    }
    else if (type == CPLeftMouseDragged && _currentDivider != CPNotFound)
    {
        var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        objj_msgSend(self, "setPosition:ofDividerAtIndex:", (point[_originComponent]+_initialOffset), _currentDivider);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackDivider:"), CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
instance_methods[18] = new objj_method(sel_registerName("mouseDown:"), function $CPSplitView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "trackDivider:", anEvent);
}
});
instance_methods[19] = new objj_method(sel_registerName("maxPossiblePositionOfDividerAtIndex:"), function $CPSplitView__maxPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[dividerIndex+1], "frame");
    if (dividerIndex + 1 < objj_msgSend(_subviews, "count") - 1)
        return frame.origin[_originComponent] + frame.size[_sizeComponent] - objj_msgSend(self, "dividerThickness");
    else
        return objj_msgSend(self, "frame").size[_sizeComponent] - objj_msgSend(self, "dividerThickness");
}
});
instance_methods[20] = new objj_method(sel_registerName("minPossiblePositionOfDividerAtIndex:"), function $CPSplitView__minPossiblePositionOfDividerAtIndex_(self, _cmd, dividerIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[dividerIndex-1], "frame");
    if (dividerIndex > 0)
        return frame.origin[_originComponent] + frame.size[_sizeComponent] + objj_msgSend(self, "dividerThickness");
    else
        return 0;
}
});
instance_methods[21] = new objj_method(sel_registerName("setPosition:ofDividerAtIndex:"), function $CPSplitView__setPosition_ofDividerAtIndex_(self, _cmd, position, dividerIndex)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:constrainSplitPosition:ofSubviewAt:")))
        position = objj_msgSend(_delegate, "splitView:constrainSplitPosition:ofSubviewAt:", self, position, dividerIndex);
    var proposedMax = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", dividerIndex),
        proposedMin = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", dividerIndex),
        actualMax = proposedMax,
        actualMin = proposedMin;
    if(objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:constrainMinCoordinate:ofSubviewAt:")))
        actualMin = objj_msgSend(_delegate, "splitView:constrainMinCoordinate:ofSubviewAt:", self, proposedMin, dividerIndex);
    if(objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:constrainMaxCoordinate:ofSubviewAt:")))
        actualMax = objj_msgSend(_delegate, "splitView:constrainMaxCoordinate:ofSubviewAt:", self, proposedMax, dividerIndex);
    var frame = objj_msgSend(self, "frame"),
        viewA = _subviews[dividerIndex],
        frameA = objj_msgSend(viewA, "frame"),
        viewB = _subviews[dividerIndex+1],
        frameB = objj_msgSend(viewB, "frame");
    var realPosition = MAX(MIN(position, actualMax), actualMin);
    if (position < proposedMin + (actualMin - proposedMin) / 2)
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:canCollapseSubview:")))
            if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, viewA))
                realPosition = proposedMin;
    frameA.size[_sizeComponent] = realPosition - frameA.origin[_originComponent];
    objj_msgSend(_subviews[dividerIndex], "setFrame:", frameA);
    frameB.size[_sizeComponent] = frameB.origin[_originComponent] + frameB.size[_sizeComponent] - realPosition - objj_msgSend(self, "dividerThickness");
    frameB.origin[_originComponent] = realPosition + objj_msgSend(self, "dividerThickness");
    objj_msgSend(_subviews[dividerIndex+1], "setFrame:", frameB);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
});
instance_methods[22] = new objj_method(sel_registerName("setFrameSize:"), function $CPSplitView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
});
instance_methods[23] = new objj_method(sel_registerName("resizeSubviewsWithOldSize:"), function $CPSplitView__resizeSubviewsWithOldSize_(self, _cmd, oldSize)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitView:resizeSubviewsWithOldSize:")))
    {
        objj_msgSend(_delegate, "splitView:resizeSubviewsWithOldSize:", self, oldSize);
        return;
    }
    objj_msgSend(self, "_postNotificationWillResize");
    var frame = objj_msgSend(self, "frame");
    var index = 0,
        count = objj_msgSend(_subviews, "count"),
        dividerThickness = objj_msgSend(self, "dividerThickness");
    for (; index < count; ++index)
    {
        var view = _subviews[index],
            newFrame = CGRectCreateCopy(frame);
        if (index + 1 == count)
            newFrame.size[_sizeComponent] = frame.size[_sizeComponent] - newFrame.origin[_originComponent];
        else
            newFrame.size[_sizeComponent] = frame.size[_sizeComponent] * (objj_msgSend(view, "frame").size[_sizeComponent] / oldSize[_sizeComponent]);
        frame.origin[_originComponent] += newFrame.size[_sizeComponent] + dividerThickness;
        objj_msgSend(view, "setFrame:", newFrame);
    }
    objj_msgSend(self, "_postNotificationDidResize");
}
});
instance_methods[24] = new objj_method(sel_registerName("setDelegate:"), function $CPSplitView__setDelegate_(self, _cmd, delegate)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitViewDidResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", _delegate, CPSplitViewDidResizeSubviewsNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitViewWillResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", _delegate, CPSplitViewWillResizeSubviewsNotification, self);
   _delegate = delegate;
   if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitViewDidResizeSubviews:")))
       objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", _delegate, sel_registerName("splitViewDidResizeSubviews:"), CPSplitViewDidResizeSubviewsNotification, self);
   if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("splitViewWillResizeSubviews:")))
       objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", _delegate, sel_registerName("splitViewWillResizeSubviews:"), CPSplitViewWillResizeSubviewsNotification, self);
}
});
instance_methods[25] = new objj_method(sel_registerName("_postNotificationWillResize"), function $CPSplitView___postNotificationWillResize(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPSplitViewWillResizeSubviewsNotification, self);
}
});
instance_methods[26] = new objj_method(sel_registerName("_postNotificationDidResize"), function $CPSplitView___postNotificationDidResize(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPSplitViewDidResizeSubviewsNotification, self);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var CPSplitViewDelegateKey = "CPSplitViewDelegateKey",
    CPSplitViewIsVerticalKey = "CPSplitViewIsVerticalKey",
    CPSplitViewIsPaneSplitterKey = "CPSplitViewIsPaneSplitterKey";
{
var the_class = objj_getClass("CPSplitView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSplitView\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPSplitView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        _currentDivider = CPNotFound;
        _DOMDividerElements = [];
        _delegate = objj_msgSend(aCoder, "decodeObjectForKey:", CPSplitViewDelegateKey);;
        _isPaneSplitter = objj_msgSend(aCoder, "decodeBoolForKey:", CPSplitViewIsPaneSplitterKey);
        objj_msgSend(self, "_setVertical:", objj_msgSend(aCoder, "decodeBoolForKey:", CPSplitViewIsVerticalKey));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPSplitView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPSplitViewDelegateKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isVertical, CPSplitViewIsVerticalKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isPaneSplitter, CPSplitViewIsPaneSplitterKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;17;CPStringDrawing.jI;21;Foundation/CPString.jc;1646;
var CPStringReferenceElement = nil;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("cssString"), function $CPString__cssString(self, _cmd)
{ with(self)
{
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("sizeWithFont:"), function $CPString__sizeWithFont_(self, _cmd, aFont)
{ with(self)
{
    if (!CPStringReferenceElement)
    {
        CPStringReferenceElement = document.createElement("span");
        var style = CPStringReferenceElement.style;
        style.position = "absolute";
        style.whiteSpace = "pre";
        style.visibility = "visible";
        style.padding = "0px";
        style.margin = "0px";
        style.left = "-100000px";
        style.top = "-100000px";
        style.zIndex = "10000";
        style.background = "red";
        document.getElementsByTagName("body")[0].appendChild(CPStringReferenceElement);
    }
    CPStringReferenceElement.style.font = objj_msgSend(aFont?aFont:objj_msgSend(CPFont, "systemFontOfSize:", 12.0), "cssString");
    if (CPFeatureIsCompatible(CPJavascriptInnerTextFeature))
        CPStringReferenceElement.innerText = self;
    else if (CPFeatureIsCompatible(CPJavascriptTextContentFeature))
        CPStringReferenceElement.textContent = self;
    return CGSizeMake(CPStringReferenceElement.clientWidth, CPStringReferenceElement.clientHeight);
}
});
class_addMethods(the_class, instance_methods);
}

p;11;CPTabView.ji;13;CPImageView.ji;15;CPTabViewItem.ji;8;CPView.jc;25027;
CPTopTabsBezelBorder = 0;
CPNoTabsBezelBorder = 4;
CPNoTabsLineBorder = 5;
CPNoTabsNoBorder = 6;
var CPTabViewBezelBorderLeftImage = nil,
    CPTabViewBackgroundCenterImage = nil,
    CPTabViewBezelBorderRightImage = nil,
    CPTabViewBezelBorderColor = nil,
    CPTabViewBezelBorderBackgroundColor = nil;
var LEFT_INSET = 7.0,
    RIGHT_INSET = 7.0;
var CPTabViewDidSelectTabViewItemSelector = 1,
    CPTabViewShouldSelectTabViewItemSelector = 2,
    CPTabViewWillSelectTabViewItemSelector = 4,
    CPTabViewDidChangeNumberOfTabViewItemsSelector = 8;
{var the_class = objj_allocateClassPair(CPView, "CPTabView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_labelsView"), new objj_ivar("_backgroundView"), new objj_ivar("_separatorView"), new objj_ivar("_auxiliaryView"), new objj_ivar("_contentView"), new objj_ivar("_tabViewItems"), new objj_ivar("_selectedTabViewItem"), new objj_ivar("_tabViewType"), new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPTabView__initialize(self, _cmd)
{ with(self)
{
    if (self != CPTabView)
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self),
        emptyImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initByReferencingFile:size:", "", CGSizeMake(7.0,0.0)),
        backgroundImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBackgroundCenter.png"), CGSizeMake(1.0,1.0)),
        bezelBorderLeftImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorderLeft.png"), CGSizeMake(7.0,1.0)),
        bezerBorderImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorder.png"), CGSizeMake(1.0,1.0)),
        bezelBorderRightImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorderRight.png"), CGSizeMake(7.0,1.0));
    CPTabViewBezelBorderBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [emptyImage,emptyImage,emptyImage,bezelBorderLeftImage,backgroundImage,bezelBorderRightImage,bezelBorderLeftImage,bezerBorderImage,bezelBorderRightImage]));
    CPTabViewBezelBorderColor = objj_msgSend(CPColor, "colorWithPatternImage:", bezerBorderImage);
}
});
class_methods[1] = new objj_method(sel_registerName("bezelBorderColor"), function $CPTabView__bezelBorderColor(self, _cmd)
{ with(self)
{
    return CPTabViewBezelBorderColor;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPTabView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _tabViewType = CPTopTabsBezelBorder;
        _tabViewItems = [];
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("viewDidMoveToWindow"), function $CPTabView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
    if (_tabViewType != CPTopTabsBezelBorder || _labelsView)
        return;
    objj_msgSend(self, "_createBezelBorder");
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[2] = new objj_method(sel_registerName("_createBezelBorder"), function $CPTabView___createBezelBorder(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    _labelsView = objj_msgSend(objj_msgSend(_CPTabLabelsView, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,CGRectGetWidth(bounds),0.0));
    objj_msgSend(_labelsView, "setTabView:", self);
    objj_msgSend(_labelsView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self, "addSubview:", _labelsView);
    _backgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_backgroundView, "setBackgroundColor:", CPTabViewBezelBorderBackgroundColor);
    objj_msgSend(_backgroundView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    objj_msgSend(self, "addSubview:", _backgroundView);
    _separatorView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_separatorView, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "bezelBorderColor"));
    objj_msgSend(_separatorView, "setAutoresizingMask:", CPViewWidthSizable|CPViewMaxYMargin);
    objj_msgSend(self, "addSubview:", _separatorView);
}
});
instance_methods[3] = new objj_method(sel_registerName("layoutSubviews"), function $CPTabView__layoutSubviews(self, _cmd)
{ with(self)
{
    if (_tabViewType == CPTopTabsBezelBorder)
    {
        var backgroundRect = objj_msgSend(self, "bounds"),
            labelsViewHeight = objj_msgSend(_CPTabLabelsView, "height");
        backgroundRect.origin.y += labelsViewHeight;
        backgroundRect.size.height -= labelsViewHeight;
        objj_msgSend(_backgroundView, "setFrame:", backgroundRect);
        var auxiliaryViewHeight = 5.0;
        if (_auxiliaryView)
        {
            auxiliaryViewHeight = CGRectGetHeight(objj_msgSend(_auxiliaryView, "frame"));
            objj_msgSend(_auxiliaryView, "setFrame:", CGRectMake(LEFT_INSET,labelsViewHeight,CGRectGetWidth(backgroundRect)-LEFT_INSET-RIGHT_INSET,auxiliaryViewHeight));
        }
        objj_msgSend(_separatorView, "setFrame:", CGRectMake(LEFT_INSET,labelsViewHeight+auxiliaryViewHeight,CGRectGetWidth(backgroundRect)-LEFT_INSET-RIGHT_INSET,1.0));
    }
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRect"));
}
});
instance_methods[4] = new objj_method(sel_registerName("addTabViewItem:"), function $CPTabView__addTabViewItem_(self, _cmd, aTabViewItem)
{ with(self)
{
    objj_msgSend(self, "insertTabViewItem:atIndex:", aTabViewItem, objj_msgSend(_tabViewItems, "count"));
}
});
instance_methods[5] = new objj_method(sel_registerName("insertTabViewItem:atIndex:"), function $CPTabView__insertTabViewItem_atIndex_(self, _cmd, aTabViewItem, anIndex)
{ with(self)
{
    objj_msgSend(_tabViewItems, "insertObject:atIndex:", aTabViewItem, anIndex);
    objj_msgSend(_labelsView, "tabView:didAddTabViewItem:", self, aTabViewItem);
    if (objj_msgSend(_tabViewItems, "count") == 1)
        objj_msgSend(self, "selectFirstTabViewItem:", self);
    if (_delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(_delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
});
instance_methods[6] = new objj_method(sel_registerName("removeTabViewItem:"), function $CPTabView__removeTabViewItem_(self, _cmd, aTabViewItem)
{ with(self)
{
    objj_msgSend(_tabViewItems, "removeObjectIdenticalTo:", aTabViewItem);
    objj_msgSend(_labelsView, "tabView:didRemoveTabViewItem:", self, aTabViewItem);
    if (_delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(_delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
});
instance_methods[7] = new objj_method(sel_registerName("indexOfTabViewItem:"), function $CPTabView__indexOfTabViewItem_(self, _cmd, aTabViewItem)
{ with(self)
{
    return objj_msgSend(_tabViewItems, "indexOfObjectIdenticalTo:", aTabViewItem);
}
});
instance_methods[8] = new objj_method(sel_registerName("indexOfTabViewItemWithIdentifier:"), function $CPTabView__indexOfTabViewItemWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(_tabViewItems, "count");
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_tabViewItems[index], "identifier"), "isEqualTo:", anIdentifier))
            return index;
    return index;
}
});
instance_methods[9] = new objj_method(sel_registerName("numberOfTabViewItems"), function $CPTabView__numberOfTabViewItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_tabViewItems, "count");
}
});
instance_methods[10] = new objj_method(sel_registerName("tabViewItemAtIndex:"), function $CPTabView__tabViewItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    return _tabViewItems[anIndex];
}
});
instance_methods[11] = new objj_method(sel_registerName("tabViewItems"), function $CPTabView__tabViewItems(self, _cmd)
{ with(self)
{
    return _tabViewItems;
}
});
instance_methods[12] = new objj_method(sel_registerName("selectFirstTabViewItem:"), function $CPTabView__selectFirstTabViewItem_(self, _cmd, aSender)
{ with(self)
{
    var count = objj_msgSend(_tabViewItems, "count");
    if (count)
        objj_msgSend(self, "selectTabViewItemAtIndex:", 0);
}
});
instance_methods[13] = new objj_method(sel_registerName("selectLastTabViewItem:"), function $CPTabView__selectLastTabViewItem_(self, _cmd, aSender)
{ with(self)
{
    var count = objj_msgSend(_tabViewItems, "count");
    if (count)
        objj_msgSend(self, "selectTabViewItemAtIndex:", count-1);
}
});
instance_methods[14] = new objj_method(sel_registerName("selectNextTabViewItem:"), function $CPTabView__selectNextTabViewItem_(self, _cmd, aSender)
{ with(self)
{
    if (!_selectedTabViewItem)
        return;
    var index = objj_msgSend(self, "indexOfTabViewItem:", _selectedTabViewItem),
        count = objj_msgSend(_tabViewItems, "count");
    objj_msgSend(self, "selectTabViewItemAtIndex:", index+1%count);
}
});
instance_methods[15] = new objj_method(sel_registerName("selectPreviousTabViewItem:"), function $CPTabView__selectPreviousTabViewItem_(self, _cmd, aSender)
{ with(self)
{
    if (!_selectedTabViewItem)
        return;
    var index = objj_msgSend(self, "indexOfTabViewItem:", _selectedTabViewItem),
        count = objj_msgSend(_tabViewItems, "count");
    objj_msgSend(self, "selectTabViewItemAtIndex:", index==0?count:index-1);
}
});
instance_methods[16] = new objj_method(sel_registerName("selectTabViewItem:"), function $CPTabView__selectTabViewItem_(self, _cmd, aTabViewItem)
{ with(self)
{
    if ((_delegateSelectors & CPTabViewShouldSelectTabViewItemSelector) && !objj_msgSend(_delegate, "tabView:shouldSelectTabViewItem:", self, aTabViewItem))
        return;
    if (_delegateSelectors & CPTabViewWillSelectTabViewItemSelector)
        objj_msgSend(_delegate, "tabView:willSelectTabViewItem:", self, aTabViewItem);
    if (_selectedTabViewItem)
    {
        _selectedTabViewItem._tabState = CPBackgroundTab;
        objj_msgSend(_labelsView, "tabView:didChangeStateOfTabViewItem:", self, _selectedTabViewItem);
        objj_msgSend(_contentView, "removeFromSuperview");
        objj_msgSend(_auxiliaryView, "removeFromSuperview");
    }
    _selectedTabViewItem = aTabViewItem;
    _selectedTabViewItem._tabState = CPSelectedTab;
    _contentView = objj_msgSend(_selectedTabViewItem, "view");
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    _auxiliaryView = objj_msgSend(_selectedTabViewItem, "auxiliaryView");
    objj_msgSend(_auxiliaryView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self, "addSubview:", _contentView);
    if (_auxiliaryView)
        objj_msgSend(self, "addSubview:", _auxiliaryView);
    objj_msgSend(_labelsView, "tabView:didChangeStateOfTabViewItem:", self, _selectedTabViewItem);
    objj_msgSend(self, "layoutSubviews");
    if (_delegateSelectors & CPTabViewDidSelectTabViewItemSelector)
        objj_msgSend(_delegate, "tabView:didSelectTabViewItem:", self, aTabViewItem);
}
});
instance_methods[17] = new objj_method(sel_registerName("selectTabViewItemAtIndex:"), function $CPTabView__selectTabViewItemAtIndex_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "selectTabViewItem:", _tabViewItems[anIndex]);
}
});
instance_methods[18] = new objj_method(sel_registerName("selectedTabViewItem"), function $CPTabView__selectedTabViewItem(self, _cmd)
{ with(self)
{
    return _selectedTabViewItem;
}
});
instance_methods[19] = new objj_method(sel_registerName("setTabViewType:"), function $CPTabView__setTabViewType_(self, _cmd, aTabViewType)
{ with(self)
{
    if (_tabViewType == aTabViewType)
        return;
    _tabViewType = aTabViewType;
    if (_tabViewType == CPNoTabsBezelBorder || _tabViewType == CPNoTabsLineBorder || _tabViewType == CPNoTabsNoBorder)
        objj_msgSend(_labelsView, "removeFromSuperview");
    else if (!objj_msgSend(_labelsView, "superview"))
        objj_msgSend(self, "addSubview:", _lablesView);
    if (_tabViewType == CPNoTabsLineBorder || _tabViewType == CPNoTabsNoBorder)
        objj_msgSend(_backgroundView, "removeFromSuperview");
    else if (!objj_msgSend(_backgroundView, "superview"))
        objj_msgSend(self, "addSubview:", _backgroundView);
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[20] = new objj_method(sel_registerName("tabViewType"), function $CPTabView__tabViewType(self, _cmd)
{ with(self)
{
    return _tabViewType;
}
});
instance_methods[21] = new objj_method(sel_registerName("contentRect"), function $CPTabView__contentRect(self, _cmd)
{ with(self)
{
    var contentRect = CGRectMakeCopy(objj_msgSend(self, "bounds"));
    if (_tabViewType == CPTopTabsBezelBorder)
    {
        var labelsViewHeight = objj_msgSend(_CPTabLabelsView, "height"),
            auxiliaryViewHeight = _auxiliaryView ? CGRectGetHeight(objj_msgSend(_auxiliaryView, "frame")) : 5.0,
            separatorViewHeight = 1.0;
        contentRect.origin.y += labelsViewHeight + auxiliaryViewHeight + separatorViewHeight;
        contentRect.size.height -= labelsViewHeight + auxiliaryViewHeight + separatorViewHeight * 2.0;
        contentRect.origin.x += LEFT_INSET;
        contentRect.size.width -= LEFT_INSET + RIGHT_INSET;
    }
    return contentRect;
}
});
instance_methods[22] = new objj_method(sel_registerName("setDelegate:"), function $CPTabView__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _delegateSelectors = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("tabView:shouldSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewShouldSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("tabView:willSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewWillSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("tabView:didSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewDidSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("tabViewDidChangeNumberOfTabViewItems:")))
        _delegateSelectors |= CPTabViewDidChangeNumberOfTabViewItemsSelector;
}
});
instance_methods[23] = new objj_method(sel_registerName("mouseDown:"), function $CPTabView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(_labelsView, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        tabViewItem = objj_msgSend(_labelsView, "representedTabViewItemAtPoint:", location);
    if (tabViewItem)
        objj_msgSend(self, "selectTabViewItem:", tabViewItem);
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var _CPTabLabelsViewBackgroundColor = nil,
    _CPTabLabelsViewInsideMargin = 10.0,
    _CPTabLabelsViewOutsideMargin = 15.0;
{var the_class = objj_allocateClassPair(CPView, "_CPTabLabelsView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tabView"), new objj_ivar("_tabLabels")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPTabLabelsView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPTabLabelsView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPTabLabelsViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewLeft.png"), CGSizeMake(12.0,26.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewCenter.png"), CGSizeMake(1.0,26.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewRight.png"), CGSizeMake(12.0,26.0))], NO));
}
});
class_methods[1] = new objj_method(sel_registerName("height"), function $_CPTabLabelsView__height(self, _cmd)
{ with(self)
{
    return 26.0;
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPTabLabelsView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _tabLabels = [];
        objj_msgSend(self, "setBackgroundColor:", _CPTabLabelsViewBackgroundColor);
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(aFrame),26.0));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setTabView:"), function $_CPTabLabelsView__setTabView_(self, _cmd, aTabView)
{ with(self)
{
    _tabView = aTabView;
}
});
instance_methods[2] = new objj_method(sel_registerName("tabView"), function $_CPTabLabelsView__tabView(self, _cmd)
{ with(self)
{
    return _tabView;
}
});
instance_methods[3] = new objj_method(sel_registerName("tabView:didAddTabViewItem:"), function $_CPTabLabelsView__tabView_didAddTabViewItem_(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    var label = objj_msgSend(objj_msgSend(_CPTabLabel, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(label, "setTabViewItem:", aTabViewItem);
    _tabLabels.push(label);
    objj_msgSend(self, "addSubview:", label);
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[4] = new objj_method(sel_registerName("tabView:didRemoveTabViewItem:"), function $_CPTabLabelsView__tabView_didRemoveTabViewItem_(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    var index = objj_msgSend(aTabView, "indexOfTabViewItem:", aTabViewItem),
        label = _tabLabels[index];
    objj_msgSend(_tabLabels, "removeObjectAtIndex:", index);
    objj_msgSend(label, "removeFromSuperview");
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[5] = new objj_method(sel_registerName("tabView:didChangeStateOfTabViewItem:"), function $_CPTabLabelsView__tabView_didChangeStateOfTabViewItem_(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    objj_msgSend(_tabLabels[objj_msgSend(aTabView, "indexOfTabViewItem:", aTabViewItem)], "setTabState:", objj_msgSend(aTabViewItem, "tabState"));
 }
});
instance_methods[6] = new objj_method(sel_registerName("representedTabViewItemAtPoint:"), function $_CPTabLabelsView__representedTabViewItemAtPoint_(self, _cmd, aPoint)
{ with(self)
{
    var index = 0,
        count = _tabLabels.length;
    for (; index < count; ++index)
    {
        var label = _tabLabels[index];
        if (CGRectContainsPoint(objj_msgSend(label, "frame"), aPoint))
            return objj_msgSend(label, "tabViewItem");
    }
    return nil;
}
});
instance_methods[7] = new objj_method(sel_registerName("layoutSubviews"), function $_CPTabLabelsView__layoutSubviews(self, _cmd)
{ with(self)
{
    var index = 0,
        count = _tabLabels.length,
        width = ((objj_msgSend(self, "bounds").size.width) - (count - 1) * _CPTabLabelsViewInsideMargin - 2 * _CPTabLabelsViewOutsideMargin) / count,
        x = _CPTabLabelsViewOutsideMargin;
    for (; index < count; ++index)
    {
        var label = _tabLabels[index],
            frame = { origin: { x:x, y:8.0 }, size: { width:width, height:18.0 } };
        objj_msgSend(label, "setFrame:", frame);
        x = (frame.origin.x + frame.size.width) + _CPTabLabelsViewInsideMargin;
    }
}
});
instance_methods[8] = new objj_method(sel_registerName("setFrameSize:"), function $_CPTabLabelsView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(objj_msgSend(self, "frame").size, aSize))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "layoutSubviews");
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var _CPTabLabelBackgroundColor = nil,
    _CPTabLabelSelectedBackgroundColor = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPTabLabel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tabViewItem"), new objj_ivar("_labelField")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPTabLabel__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPTabLabel, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPTabLabelBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundLeft.png"), CGSizeMake(6.0,18.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundCenter.png"), CGSizeMake(1.0,18.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundRight.png"), CGSizeMake(6.0,18.0))], NO));
    _CPTabLabelSelectedBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedLeft.png"), CGSizeMake(3.0,18.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedCenter.png"), CGSizeMake(1.0,18.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedRight.png"), CGSizeMake(3.0,18.0))], NO));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPTabLabel__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _labelField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_labelField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_labelField, "setFrame:", CGRectMake(5.0,0.0,CGRectGetWidth(aFrame)-10.0,20.0));
        objj_msgSend(_labelField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_labelField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
        objj_msgSend(self, "addSubview:", _labelField);
        objj_msgSend(self, "setTabState:", CPBackgroundTab);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setTabState:"), function $_CPTabLabel__setTabState_(self, _cmd, aTabState)
{ with(self)
{
    objj_msgSend(self, "setBackgroundColor:", aTabState==CPSelectedTab?_CPTabLabelSelectedBackgroundColor:_CPTabLabelBackgroundColor);
}
});
instance_methods[2] = new objj_method(sel_registerName("setTabViewItem:"), function $_CPTabLabel__setTabViewItem_(self, _cmd, aTabViewItem)
{ with(self)
{
    _tabViewItem = aTabViewItem;
    objj_msgSend(self, "update");
}
});
instance_methods[3] = new objj_method(sel_registerName("tabViewItem"), function $_CPTabLabel__tabViewItem(self, _cmd)
{ with(self)
{
    return _tabViewItem;
}
});
instance_methods[4] = new objj_method(sel_registerName("update"), function $_CPTabLabel__update(self, _cmd)
{ with(self)
{
    objj_msgSend(_labelField, "setStringValue:", objj_msgSend(_tabViewItem, "label"));
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;15;CPTabViewItem.jI;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;2494;
CPSelectedTab = 0;
CPBackgroundTab = 1;
CPPressedTab = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTabViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_label"), new objj_ivar("_view"), new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithIdentifier:"), function $CPTabViewItem__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _identifier = anIdentifier;
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setLabel:"), function $CPTabViewItem__setLabel_(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
});
instance_methods[2] = new objj_method(sel_registerName("label"), function $CPTabViewItem__label(self, _cmd)
{ with(self)
{
    return _label;
}
});
instance_methods[3] = new objj_method(sel_registerName("tabState"), function $CPTabViewItem__tabState(self, _cmd)
{ with(self)
{
    return _tabState;
}
});
instance_methods[4] = new objj_method(sel_registerName("setIdentifier:"), function $CPTabViewItem__setIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
});
instance_methods[5] = new objj_method(sel_registerName("identifier"), function $CPTabViewItem__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
});
instance_methods[6] = new objj_method(sel_registerName("setView:"), function $CPTabViewItem__setView_(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
});
instance_methods[7] = new objj_method(sel_registerName("view"), function $CPTabViewItem__view(self, _cmd)
{ with(self)
{
    return _view;
}
});
instance_methods[8] = new objj_method(sel_registerName("setAuxiliaryView:"), function $CPTabViewItem__setAuxiliaryView_(self, _cmd, anAuxiliaryView)
{ with(self)
{
    _auxiliaryView = anAuxiliaryView;
}
});
instance_methods[9] = new objj_method(sel_registerName("auxiliaryView"), function $CPTabViewItem__auxiliaryView(self, _cmd)
{ with(self)
{
    return _auxiliaryView;
}
});
instance_methods[10] = new objj_method(sel_registerName("tabView"), function $CPTabViewItem__tabView(self, _cmd)
{ with(self)
{
    return _tabView;
}
});
class_addMethods(the_class, instance_methods);
}

p;13;CPTextField.ji;11;CPControl.ji;17;CPStringDrawing.jc;10869;
CPLineBreakByWordWrapping = 0;
CPLineBreakByCharWrapping = 1;
CPLineBreakByClipping = 2;
CPLineBreakByTruncatingHead = 3;
CPLineBreakByTruncatingTail = 4;
CPLineBreakByTruncatingMiddle = 5;
CPTextFieldSquareBezel = 0;
CPTextFieldRoundedBezel = 1;
var TOP_PADDING = 4.0,
    BOTTOM_PADDING = 3.0;
    HORIZONTAL_PADDING = 3.0;
var _CPTextFieldSquareBezelColor = nil;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("string"), function $CPString__string(self, _cmd)
{ with(self)
{
    return self;
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPControl, "CPTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isBordered"), new objj_ivar("_isBezeled"), new objj_ivar("_bezelStyle"), new objj_ivar("_isEditable"), new objj_ivar("_isSelectable"), new objj_ivar("_value"), new objj_ivar("_placeholderString"), new objj_ivar("_lineBreakMode")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $CPTextField__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _value = "";
        _placeholderString = "";
        objj_msgSend(self, "setAlignment:", CPLeftTextAlignment);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setBezeled:"), function $CPTextField__setBezeled_(self, _cmd, shouldBeBezeled)
{ with(self)
{
    if (_isBezeled == shouldBeBezeled)
        return;
    _isBezeled = shouldBeBezeled;
    objj_msgSend(self, "_updateBackground");
}
});
instance_methods[2] = new objj_method(sel_registerName("isBezeled"), function $CPTextField__isBezeled(self, _cmd)
{ with(self)
{
    return _isBezeled;
}
});
instance_methods[3] = new objj_method(sel_registerName("setBezelStyle:"), function $CPTextField__setBezelStyle_(self, _cmd, aBezelStyle)
{ with(self)
{
    if (_bezelStyle == aBezelStyle)
        return;
    _bezelStyle = aBezelStyle;
    objj_msgSend(self, "_updateBackground");
}
});
instance_methods[4] = new objj_method(sel_registerName("bezelStyle"), function $CPTextField__bezelStyle(self, _cmd)
{ with(self)
{
    return _bezelStyle;
}
});
instance_methods[5] = new objj_method(sel_registerName("setBordered:"), function $CPTextField__setBordered_(self, _cmd, shouldBeBordered)
{ with(self)
{
    if (_isBordered == shouldBeBordered)
        return;
    _isBordered = shouldBeBordered;
    objj_msgSend(self, "_updateBackground");
}
});
instance_methods[6] = new objj_method(sel_registerName("isBordered"), function $CPTextField__isBordered(self, _cmd)
{ with(self)
{
    return _isBordered;
}
});
instance_methods[7] = new objj_method(sel_registerName("_updateBackground"), function $CPTextField___updateBackground(self, _cmd)
{ with(self)
{
    if (_isBordered && _bezelStyle == CPTextFieldSquareBezel && _isBezeled)
    {
        if (!_CPTextFieldSquareBezelColor)
        {
            var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPTextField, "class"));
            _CPTextFieldSquareBezelColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare0.png"), CGSizeMake(2.0,3.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare1.png"), CGSizeMake(1.0,3.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare2.png"), CGSizeMake(2.0,3.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare3.png"), CGSizeMake(2.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare4.png"), CGSizeMake(1.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare5.png"), CGSizeMake(2.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare6.png"), CGSizeMake(2.0,2.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare7.png"), CGSizeMake(1.0,2.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTextField/CPTextFieldBezelSquare8.png"), CGSizeMake(2.0,2.0))]));
        }
        objj_msgSend(self, "setBackgroundColor:", _CPTextFieldSquareBezelColor);
    }
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
}
});
instance_methods[8] = new objj_method(sel_registerName("acceptsFirstResponder"), function $CPTextField__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return _isEditable;
}
});
instance_methods[9] = new objj_method(sel_registerName("becomeFirstResponder"), function $CPTextField__becomeFirstResponder(self, _cmd)
{ with(self)
{
    var string = objj_msgSend(self, "stringValue");
    objj_msgSend(self, "setStringValue:", "");
    return YES;
}
});
instance_methods[10] = new objj_method(sel_registerName("resignFirstResponder"), function $CPTextField__resignFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[11] = new objj_method(sel_registerName("setEditable:"), function $CPTextField__setEditable_(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
});
instance_methods[12] = new objj_method(sel_registerName("isEditable"), function $CPTextField__isEditable(self, _cmd)
{ with(self)
{
    return _isEditable;
}
});
instance_methods[13] = new objj_method(sel_registerName("setFrameSize:"), function $CPTextField__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
}
});
instance_methods[14] = new objj_method(sel_registerName("isSelectable"), function $CPTextField__isSelectable(self, _cmd)
{ with(self)
{
    return _isSelectable;
}
});
instance_methods[15] = new objj_method(sel_registerName("setSelectable:"), function $CPTextField__setSelectable_(self, _cmd, aFlag)
{ with(self)
{
    _isSelectable = aFlag;
}
});
instance_methods[16] = new objj_method(sel_registerName("setAlignment:"), function $CPTextField__setAlignment_(self, _cmd, anAlignment)
{ with(self)
{
    if (objj_msgSend(self, "alignment") == anAlignment)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setAlignment:", anAlignment);
}
});
instance_methods[17] = new objj_method(sel_registerName("setLineBreakMode:"), function $CPTextField__setLineBreakMode_(self, _cmd, aLineBreakMode)
{ with(self)
{
    _lineBreakMode = aLineBreakMode;
}
});
instance_methods[18] = new objj_method(sel_registerName("stringValue"), function $CPTextField__stringValue(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "stringValue");
}
});
instance_methods[19] = new objj_method(sel_registerName("setObjectValue:"), function $CPTextField__setObjectValue_(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", aValue);
}
});
instance_methods[20] = new objj_method(sel_registerName("placeholderString"), function $CPTextField__placeholderString(self, _cmd)
{ with(self)
{
    return _placeholderString;
}
});
instance_methods[21] = new objj_method(sel_registerName("setPlaceholderString:"), function $CPTextField__setPlaceholderString_(self, _cmd, aStringValue)
{ with(self)
{
    _placeholderString = aStringValue;
}
});
instance_methods[22] = new objj_method(sel_registerName("sizeToFit"), function $CPTextField__sizeToFit(self, _cmd)
{ with(self)
{}
});
instance_methods[23] = new objj_method(sel_registerName("selectText:"), function $CPTextField__selectText_(self, _cmd, sender)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
}
var CPTextFieldIsSelectableKey = "CPTextFieldIsSelectableKey",
    CPTextFieldLineBreakModeKey = "CPTextFieldLineBreakModeKey",
    CPTextFieldStringValueKey = "CPTextFieldStringValueKey",
    CPTextFieldIsEditableKey = "CPTextFieldIsEditableKey";
{
var the_class = objj_getClass("CPTextField")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTextField\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPTextField__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        var bounds = objj_msgSend(self, "bounds");
        _value = "";
        objj_msgSend(self, "setEditable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsEditableKey));
        objj_msgSend(self, "setSelectable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsSelectableKey));
        objj_msgSend(self, "setLineBreakMode:", objj_msgSend(aCoder, "decodeIntForKey:", CPTextFieldLineBreakModeKey));
        objj_msgSend(self, "setStringValue:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldStringValueKey));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPTextField__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isSelectable, CPTextFieldIsSelectableKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _lineBreakMode, CPTextFieldLineBreakModeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _value, CPTextFieldStringValueKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPTextFieldIsEditableKey);
}
});
class_addMethods(the_class, instance_methods);
}

p;11;CPToolbar.jI;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;19184;
CPToolbarDisplayModeDefault = 0;
CPToolbarDisplayModeIconAndLabel = 1;
CPToolbarDisplayModeIconOnly = 2;
CPToolbarDisplayModeLabelOnly = 3;
var CPToolbarsByIdentifier = nil;
var CPToolbarConfigurationsByIdentifier = nil;
var _CPToolbarItemVisibilityPriorityCompare = function(lhs, rhs)
{
    var lhsVisibilityPriority = objj_msgSend(lhs, "visibilityPriority"),
        rhsVisibilityPriority = objj_msgSend(rhs, "visibilityPriority");
    if (lhsVisibilityPriority == rhsVisibilityPriority)
        return CPOrderedSame;
    if (lhsVisibilityPriority > rhsVisibilityPriority)
        return CPOrderedAscending;
    return CPOrderedDescending;
}
{var the_class = objj_allocateClassPair(CPObject, "CPToolbar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_displayMode"), new objj_ivar("_showsBaselineSeparator"), new objj_ivar("_allowsUserCustomization"), new objj_ivar("_isVisible"), new objj_ivar("_needsReloadOfItems"), new objj_ivar("_delegate"), new objj_ivar("_toolbarView"), new objj_ivar("_itemIdentifiers"), new objj_ivar("_allowedItemIdentifiers"), new objj_ivar("_items"), new objj_ivar("_labels"), new objj_ivar("_itemIndexes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPToolbar__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPToolbar, "class"))
        return;
    CPToolbarsByIdentifier = objj_msgSend(CPDictionary, "dictionary");
    CPToolbarConfigurationsByIdentifier = objj_msgSend(CPDictionary, "dictionary");
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithIdentifier:"), function $CPToolbar__initWithIdentifier_(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _items = [];
        _labels = [];
        _identifier = anIdentifier;
        _isVisible = YES;
        var toolbarsSharingIdentifier = objj_msgSend(CPToolbarsByIdentifier, "objectForKey:", _identifier);
        if (!toolbarsSharingIdentifier)
        {
            toolbarsSharingIdentifier = []
            objj_msgSend(CPToolbarsByIdentifier, "setObject:forKey:", toolbarsSharingIdentifier, _identifier);
        }
        objj_msgSend(toolbarsSharingIdentifier, "addObject:", self);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setDisplayMode:"), function $CPToolbar__setDisplayMode_(self, _cmd, aDisplayMode)
{ with(self)
{}
});
instance_methods[2] = new objj_method(sel_registerName("identifier"), function $CPToolbar__identifier(self, _cmd)
{ with(self)
{
    return _identifier;
}
});
instance_methods[3] = new objj_method(sel_registerName("delegate"), function $CPToolbar__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[4] = new objj_method(sel_registerName("isVisible"), function $CPToolbar__isVisible(self, _cmd)
{ with(self)
{
    return _isVisible;
}
});
instance_methods[5] = new objj_method(sel_registerName("setVisible:"), function $CPToolbar__setVisible_(self, _cmd, aFlag)
{ with(self)
{
    if (_isVisible == aFlag)
        return;
    _isVisible = aFlag;
    objj_msgSend(_window, "_setToolbarVisible:", _isVisible);
    objj_msgSend(self, "_reloadToolbarItems");
}
});
instance_methods[6] = new objj_method(sel_registerName("setDelegate:"), function $CPToolbar__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _itemIdentifiers = nil;
    _allowedItemIdentifiers = objj_msgSend(_delegate, "toolbarAllowedItemIdentifiers:", self);
    objj_msgSend(self, "_reloadToolbarItems");
}
});
instance_methods[7] = new objj_method(sel_registerName("_loadConfiguration"), function $CPToolbar___loadConfiguration(self, _cmd)
{ with(self)
{}
});
instance_methods[8] = new objj_method(sel_registerName("_toolbarView"), function $CPToolbar___toolbarView(self, _cmd)
{ with(self)
{
    if (!_toolbarView)
    {
        _toolbarView = objj_msgSend(objj_msgSend(_CPToolbarView, "alloc"), "initWithFrame:", CPRectMake(0.0,0.0,1200.0,59.0));
        objj_msgSend(_toolbarView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_toolbarView, "setToolbar:", self);
    }
    return _toolbarView;
}
});
instance_methods[9] = new objj_method(sel_registerName("_reloadToolbarItems"), function $CPToolbar___reloadToolbarItems(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_toolbarView, "superview") || !_delegate)
        return;
    var count = objj_msgSend(_itemIdentifiers, "count");
    if (!count)
    {
        _itemIdentifiers = objj_msgSend(objj_msgSend(_delegate, "toolbarDefaultItemIdentifiers:", self), "mutableCopy");
        count = objj_msgSend(_itemIdentifiers, "count");
    }
    objj_msgSend(objj_msgSend(_toolbarView, "subviews"), "makeObjectsPerformSelector:", sel_registerName("removeFromSuperview"));
    _items = [];
    _labels = [];
    var index = 0;
    for (; index < count; ++index)
    {
        var identifier = _itemIdentifiers[index],
            item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (!item)
            item = objj_msgSend(objj_msgSend(_delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, YES), "copy");
        if (item == nil)
            objj_msgSend(CPException, "raise:format:", CPInvalidArgumentException, "_delegate %@ returned nil toolbar item returned for identifier %@",_delegate,identifier);
        objj_msgSend(_items, "addObject:", item);
    }
    _itemsSortedByVisibilityPriority = objj_msgSend(_items, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL);
    objj_msgSend(_toolbarView, "reloadToolbarItems");
}
});
instance_methods[10] = new objj_method(sel_registerName("items"), function $CPToolbar__items(self, _cmd)
{ with(self)
{
    return _items;
}
});
instance_methods[11] = new objj_method(sel_registerName("visibleItems"), function $CPToolbar__visibleItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(_toolbarView, "visibleItems");
}
});
instance_methods[12] = new objj_method(sel_registerName("indexOfItem:"), function $CPToolbar__indexOfItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemIndexes, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return CPNotFound;
    return info.index;
}
});
instance_methods[13] = new objj_method(sel_registerName("itemsSortedByVisibilityPriority"), function $CPToolbar__itemsSortedByVisibilityPriority(self, _cmd)
{ with(self)
{
    return _itemsSortedByVisibilityPriority;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
var _CPToolbarViewBackgroundColor = nil,
    _CPToolbarViewExtraItemsImage = nil,
    _CPToolbarViewExtraItemsAlternateImage = nil;
var TOOLBAR_TOP_MARGIN = 5.0,
    TOOLBAR_ITEM_MARGIN = 10.0,
    TOOLBAR_EXTRA_ITEMS_WIDTH = 20.0;
var _CPToolbarItemInfoMake = function(anIndex, aView, aLabel, aMinWidth)
{
    return { index:anIndex, view:aView, label:aLabel, minWidth:aMinWidth };
}
{var the_class = objj_allocateClassPair(CPView, "_CPToolbarView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_flexibleWidthIndexes"), new objj_ivar("_visibleFlexibleWidthIndexes"), new objj_ivar("_itemInfos"), new objj_ivar("_visibleItems"), new objj_ivar("_invisibleItems"), new objj_ivar("_additionalItemsButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $_CPToolbarView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPToolbarView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPToolbarViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewBackground.png"), CGSizeMake(1.0,59.0)));
    _CPToolbarViewExtraItemsImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewExtraItemsImage.png"), CPSizeMake(10.0,15.0));
    _CPToolbarViewExtraItemsAlternateImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"), CGSizeMake(10.0,15.0));
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:"), function $_CPToolbarView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minWidth = 0;
        objj_msgSend(self, "setBackgroundColor:", _CPToolbarViewBackgroundColor);
        _additionalItemsButton = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:pullsDown:", CGRectMake(0.0,0.0,10.0,15.0), YES);
        objj_msgSend(_additionalItemsButton, "setBordered:", NO);
        objj_msgSend(_additionalItemsButton, "setImagePosition:", CPImageOnly);
        objj_msgSend(objj_msgSend(_additionalItemsButton, "menu"), "setShowsStateColumn:", NO);
        objj_msgSend(_additionalItemsButton, "setAlternateImage:", _CPToolbarViewExtraItemsAlternateImage);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("setToolbar:"), function $_CPToolbarView__setToolbar_(self, _cmd, aToolbar)
{ with(self)
{
    _toolbar = aToolbar;
}
});
instance_methods[2] = new objj_method(sel_registerName("toolbar"), function $_CPToolbarView__toolbar(self, _cmd)
{ with(self)
{
    return _toolbar;
}
});
instance_methods[3] = new objj_method(sel_registerName("resizeSubviewsWithOldSize:"), function $_CPToolbarView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "layoutSubviews");
}
});
instance_methods[4] = new objj_method(sel_registerName("layoutSubviews"), function $_CPToolbarView__layoutSubviews(self, _cmd)
{ with(self)
{
    var items = objj_msgSend(_toolbar, "items"),
        width = CGRectGetWidth(objj_msgSend(self, "bounds")),
        minWidth = _minWidth,
        flexibleItemIndexes = objj_msgSend(CPIndexSet, "indexSet"),
        invisibleItemsSortedByPriority = [];
    _visibleItems = items;
    if (width < minWidth)
    {
        width -= TOOLBAR_EXTRA_ITEMS_WIDTH;
        _visibleItems = objj_msgSend(_visibleItems, "copy");
        var itemsSortedByVisibilityPriority = objj_msgSend(_toolbar, "itemsSortedByVisibilityPriority"),
            count = itemsSortedByVisibilityPriority.length;
        while (minWidth > width)
        {
            var item = itemsSortedByVisibilityPriority[count--];
            minWidth -= objj_msgSend(self, "minWidthForItem:", item) + TOOLBAR_ITEM_MARGIN;
            objj_msgSend(_visibleItems, "removeObjectIdenticalTo:", item);
            objj_msgSend(invisibleItemsSortedByPriority, "addObject:", item);
            objj_msgSend(objj_msgSend(self, "viewForItem:", item), "setHidden:", YES);
            objj_msgSend(objj_msgSend(self, "labelForItem:", item), "setHidden:", YES);
        }
    }
    var index = _visibleItems.length;
    while (index--)
    {
        var item = _visibleItems[index];
        if (objj_msgSend(item, "minSize").width != objj_msgSend(item, "maxSize").width)
            objj_msgSend(flexibleItemIndexes, "addIndex:", index);
        objj_msgSend(objj_msgSend(self, "viewForItem:", item), "setHidden:", NO);
        objj_msgSend(objj_msgSend(self, "labelForItem:", item), "setHidden:", NO);
    }
    var remainingSpace = width - minWidth,
        proportionate = 0.0;
    while (remainingSpace && objj_msgSend(flexibleItemIndexes, "count"))
    {
        proportionate += remainingSpace / objj_msgSend(flexibleItemIndexes, "count");
        remainingSpace = 0.0;
        var index = CPNotFound;
        while ((index = objj_msgSend(flexibleItemIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        {
            var item = _visibleItems[index];
                view = objj_msgSend(self, "viewForItem:", item),
                frame = objj_msgSend(view, "frame"),
                proposedWidth = objj_msgSend(item, "minSize").width + proportionate,
                constrainedWidth = MIN(proposedWidth, objj_msgSend(item, "maxSize").width);
            if (constrainedWidth < proposedWidth)
            {
                objj_msgSend(flexibleItemIndexes, "removeIndex:", index);
                remainingSpace += proposedWidth - constrainedWidth;
            }
            objj_msgSend(view, "setFrameSize:", CGSizeMake(constrainedWidth,CGRectGetHeight(frame)));
        }
    }
    var count = _visibleItems.length,
        x = TOOLBAR_ITEM_MARGIN;
    for (index = 0; index < count; ++index)
    {
        var item = _visibleItems[index],
            view = objj_msgSend(self, "viewForItem:", item),
            viewFrame = objj_msgSend(view, "frame"),
            viewWidth = CGRectGetWidth(viewFrame),
            label = objj_msgSend(self, "labelForItem:", item),
            labelFrame = objj_msgSend(label, "frame"),
            labelWidth = CGRectGetWidth(labelFrame),
            itemWidth = MAX(objj_msgSend(self, "minWidthForItem:", item), viewWidth);
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(x+(itemWidth-viewWidth)/2.0,TOOLBAR_TOP_MARGIN));
        objj_msgSend(label, "setFrameOrigin:", CGPointMake(x+(itemWidth-labelWidth)/2.0,TOOLBAR_TOP_MARGIN+CGRectGetHeight(viewFrame)));
        x += itemWidth + TOOLBAR_ITEM_MARGIN;
    }
    if (objj_msgSend(invisibleItemsSortedByPriority, "count"))
    {
        var index = 0,
            count = objj_msgSend(items, "count");
        _invisibleItems = [];
        for (; index < count; ++index)
        {
            var item = items[index];
            if (objj_msgSend(invisibleItemsSortedByPriority, "indexOfObjectIdenticalTo:", item) != CPNotFound)
                objj_msgSend(_invisibleItems, "addObject:", item);
        }
        objj_msgSend(_additionalItemsButton, "setFrameOrigin:", CGPointMake(width+5.0,(CGRectGetHeight(objj_msgSend(self, "bounds"))-CGRectGetHeight(objj_msgSend(_additionalItemsButton, "frame")))/2.0));
        objj_msgSend(self, "addSubview:", _additionalItemsButton);
        objj_msgSend(_additionalItemsButton, "removeAllItems");
        var index = 0,
            count = objj_msgSend(_invisibleItems, "count");
        objj_msgSend(_additionalItemsButton, "addItemWithTitle:", "Additional Items");
        objj_msgSend(objj_msgSend(_additionalItemsButton, "itemArray")[0], "setImage:", _CPToolbarViewExtraItemsImage);
        for (; index < count; ++index)
        {
            var item = _invisibleItems[index];
            objj_msgSend(_additionalItemsButton, "addItemWithTitle:", objj_msgSend(item, "label"));
            var menuItem = objj_msgSend(_additionalItemsButton, "itemArray")[index+1];
            objj_msgSend(menuItem, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(menuItem, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(menuItem, "setAction:", objj_msgSend(item, "action"));
        }
    }
    else
        objj_msgSend(_additionalItemsButton, "removeFromSuperview");
}
});
instance_methods[5] = new objj_method(sel_registerName("indexOfItem:"), function $_CPToolbarView__indexOfItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return CPNotFound;
    return info.index;
}
});
instance_methods[6] = new objj_method(sel_registerName("viewForItem:"), function $_CPToolbarView__viewForItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return nil;
    return info.view;
}
});
instance_methods[7] = new objj_method(sel_registerName("labelForItem:"), function $_CPToolbarView__labelForItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return nil;
    return info.label;
}
});
instance_methods[8] = new objj_method(sel_registerName("minWidthForItem:"), function $_CPToolbarView__minWidthForItem_(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return 0;
    return info.minWidth;
}
});
instance_methods[9] = new objj_method(sel_registerName("reloadToolbarItems"), function $_CPToolbarView__reloadToolbarItems(self, _cmd)
{ with(self)
{
    var subviews = objj_msgSend(self, "subviews"),
        count = subviews.length;
    while (count--)
        objj_msgSend(subviews, "removeObjectAtIndex:", count);
    var items = objj_msgSend(_toolbar, "items"),
        index = 0;
    count = items.length;
    _itemInfos = objj_msgSend(CPDictionary, "dictionary");
    _minWidth = TOOLBAR_ITEM_MARGIN;
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(item, "view");
        if (!view)
        {
            view = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0.0,0.0,32.0,32.0));
            objj_msgSend(view, "setBordered:", NO);
            objj_msgSend(view, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(view, "setAlternateImage:", objj_msgSend(item, "alternateImage"));
            objj_msgSend(view, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(view, "setAction:", objj_msgSend(item, "action"));
            objj_msgSend(view, "setImagePosition:", CPImageOnly);
        }
        objj_msgSend(self, "addSubview:", view);
        var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(label, "setStringValue:", objj_msgSend(item, "label"));
        objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(label, "sizeToFit");
        objj_msgSend(label, "setTarget:", objj_msgSend(item, "target"));
        objj_msgSend(label, "setAction:", objj_msgSend(item, "action"));
        objj_msgSend(self, "addSubview:", label);
        var minSize = objj_msgSend(item, "minSize"),
            minWidth = MAX(minSize.width, CGRectGetWidth(objj_msgSend(label, "frame")));
        objj_msgSend(_itemInfos, "setObject:forKey:", _CPToolbarItemInfoMake(index,view,label,minWidth), objj_msgSend(item, "hash"));
        _minWidth += minWidth + TOOLBAR_ITEM_MARGIN;
    }
    objj_msgSend(self, "layoutSubviews");
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}

p;15;CPToolbarItem.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;9798;
CPToolbarItemVisibilityPriorityStandard = 0;
CPToolbarItemVisibilityPriorityLow = -1000;
CPToolbarItemVisibilityPriorityHigh = 1000;
CPToolbarItemVisibilityPriorityUser = 2000;
CPToolbarSeparatorItemIdentifier = "CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier = "CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier = "CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier = "CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier = "CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier = "CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier = "CPToolbarPrintItemIdentifier";
{var the_class = objj_allocateClassPair(CPObject, "CPToolbarItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_itemIdentifier"), new objj_ivar("_toolbar"), new objj_ivar("_label"), new objj_ivar("_paletteLabel"), new objj_ivar("_toolTip"), new objj_ivar("_tag"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_view"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithItemIdentifier:"), function $CPToolbarItem__initWithItemIdentifier_(self, _cmd, anItemIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _itemIdentifier = anItemIdentifier;
        _minSize = CGSizeMakeZero();
        _maxSize = CGSizeMakeZero();
        _visibilityPriority = CPToolbarItemVisibilityPriorityStandard;
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("itemIdentifier"), function $CPToolbarItem__itemIdentifier(self, _cmd)
{ with(self)
{
    return _itemIdentifier;
}
});
instance_methods[2] = new objj_method(sel_registerName("toolbar"), function $CPToolbarItem__toolbar(self, _cmd)
{ with(self)
{
    return _toolbar;
}
});
instance_methods[3] = new objj_method(sel_registerName("label"), function $CPToolbarItem__label(self, _cmd)
{ with(self)
{
    return _label;
}
});
instance_methods[4] = new objj_method(sel_registerName("setLabel:"), function $CPToolbarItem__setLabel_(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
});
instance_methods[5] = new objj_method(sel_registerName("paletteLabel"), function $CPToolbarItem__paletteLabel(self, _cmd)
{ with(self)
{
    return _paletteLabel;
}
});
instance_methods[6] = new objj_method(sel_registerName("setPaletteLabel:"), function $CPToolbarItem__setPaletteLabel_(self, _cmd, aPaletteLabel)
{ with(self)
{
    _paletteLabel = aPaletteLabel;
}
});
instance_methods[7] = new objj_method(sel_registerName("toolTip"), function $CPToolbarItem__toolTip(self, _cmd)
{ with(self)
{
    return _toolTip;
}
});
instance_methods[8] = new objj_method(sel_registerName("setToolTip:"), function $CPToolbarItem__setToolTip_(self, _cmd, aToolTip)
{ with(self)
{
    _toolTip = aToolTip;
}
});
instance_methods[9] = new objj_method(sel_registerName("tag"), function $CPToolbarItem__tag(self, _cmd)
{ with(self)
{
    return _tag;
}
});
instance_methods[10] = new objj_method(sel_registerName("setTag:"), function $CPToolbarItem__setTag_(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
});
instance_methods[11] = new objj_method(sel_registerName("target"), function $CPToolbarItem__target(self, _cmd)
{ with(self)
{
    return _target;
}
});
instance_methods[12] = new objj_method(sel_registerName("setTarget:"), function $CPToolbarItem__setTarget_(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
    objj_msgSend(_view, "setTarget:", aTarget);
}
});
instance_methods[13] = new objj_method(sel_registerName("action"), function $CPToolbarItem__action(self, _cmd)
{ with(self)
{
    return _action;
}
});
instance_methods[14] = new objj_method(sel_registerName("setAction:"), function $CPToolbarItem__setAction_(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
    objj_msgSend(_view, "setAction:", anAction);
}
});
instance_methods[15] = new objj_method(sel_registerName("isEnabled"), function $CPToolbarItem__isEnabled(self, _cmd)
{ with(self)
{
    return _isEnabled;
}
});
instance_methods[16] = new objj_method(sel_registerName("setEnabled:"), function $CPToolbarItem__setEnabled_(self, _cmd, aFlag)
{ with(self)
{
    _isEnabled = aFlag;
}
});
instance_methods[17] = new objj_method(sel_registerName("image"), function $CPToolbarItem__image(self, _cmd)
{ with(self)
{
    return _image;
}
});
instance_methods[18] = new objj_method(sel_registerName("setImage:"), function $CPToolbarItem__setImage_(self, _cmd, anImage)
{ with(self)
{
    _image = anImage;
    objj_msgSend(_view, "setImage:", anImage);
}
});
instance_methods[19] = new objj_method(sel_registerName("setAlternateImage:"), function $CPToolbarItem__setAlternateImage_(self, _cmd, anImage)
{ with(self)
{
    _alternateImage = anImage;
    objj_msgSend(_view, "setAlternateImage:", anImage);
}
});
instance_methods[20] = new objj_method(sel_registerName("alternateImage"), function $CPToolbarItem__alternateImage(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
});
instance_methods[21] = new objj_method(sel_registerName("view"), function $CPToolbarItem__view(self, _cmd)
{ with(self)
{
    return _view;
}
});
instance_methods[22] = new objj_method(sel_registerName("setView:"), function $CPToolbarItem__setView_(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
});
instance_methods[23] = new objj_method(sel_registerName("minSize"), function $CPToolbarItem__minSize(self, _cmd)
{ with(self)
{
    return _minSize;
}
});
instance_methods[24] = new objj_method(sel_registerName("setMinSize:"), function $CPToolbarItem__setMinSize_(self, _cmd, aMinSize)
{ with(self)
{
    _minSize = CGSizeCreateCopy(aMinSize);
}
});
instance_methods[25] = new objj_method(sel_registerName("maxSize"), function $CPToolbarItem__maxSize(self, _cmd)
{ with(self)
{
    return _maxSize;
}
});
instance_methods[26] = new objj_method(sel_registerName("setMaxSize:"), function $CPToolbarItem__setMaxSize_(self, _cmd, aMaxSize)
{ with(self)
{
    _maxSize = CGSizeCreateCopy(aMaxSize);
}
});
instance_methods[27] = new objj_method(sel_registerName("visibilityPriority"), function $CPToolbarItem__visibilityPriority(self, _cmd)
{ with(self)
{
    return _visibilityPriority;
}
});
instance_methods[28] = new objj_method(sel_registerName("setVisibilityPriority:"), function $CPToolbarItem__setVisibilityPriority_(self, _cmd, aVisibilityPriority)
{ with(self)
{
    _visibilityPriority = aVisibilityPriority;
}
});
class_addMethods(the_class, instance_methods);
}
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbarItem\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("copy"), function $CPToolbarItem__copy(self, _cmd)
{ with(self)
{
    var copy = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithItemIdentifier:", _itemIdentifier);
    objj_msgSend(copy, "setLabel:", _label);
    objj_msgSend(copy, "setPaletteLabel:", _paletteLabel);
    objj_msgSend(copy, "setToolTip:", _toolTip);
    objj_msgSend(copy, "setTag:", _tag);
    objj_msgSend(copy, "setTarget:", _target);
    objj_msgSend(copy, "setAction:", _action);
    objj_msgSend(copy, "setEnabled:", _isEnabled);
    objj_msgSend(copy, "setImage:", _image);
    objj_msgSend(copy, "setAlternateImage:", _alternateImage);
    if (_view)
        objj_msgSend(copy, "setView:", objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", _view)));
    objj_msgSend(copy, "setMinSize:", _minSize);
    objj_msgSend(copy, "setMaxSize:", _maxSize);
    objj_msgSend(copy, "setVisibilityPriority:", _visibilityPriority);
    return copy;
}
});
class_addMethods(the_class, instance_methods);
}
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbarItem\""));
var meta_class = the_class.isa;var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("_standardItemWithItemIdentifier:"), function $CPToolbarItem___standardItemWithItemIdentifier_(self, _cmd, anItemIdentifier)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPToolbarItem, "alloc"), "initWithItemIdentifier:", anItemIdentifier);
    switch (anItemIdentifier)
    {
        case CPToolbarSeparatorItemIdentifier: return nil;
        case CPToolbarSpaceItemIdentifier: objj_msgSend(item, "setMinSize:", CGSizeMake(32.0,32.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(32.0,32.0));
                                                        return item;
        case CPToolbarFlexibleSpaceItemIdentifier: objj_msgSend(item, "setMinSize:", CGSizeMake(32.0,32.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(10000.0,32.0));
                                                        return item;
        case CPToolbarShowColorsItemIdentifier: return nil;
        case CPToolbarShowFontsItemIdentifier: return nil;
        case CPToolbarCustomizeToolbarItemIdentifier: return nil;
        case CPToolbarPrintItemIdentifier: return nil;
    }
    return nil;
}
});
class_addMethods(meta_class, class_methods);
}

p;8;CPView.jI;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;13;CPResponder.ji;19;CPGraphicsContext.jc;41605;
CPViewNotSizable = 0;
CPViewMinXMargin = 1;
CPViewWidthSizable = 2;
CPViewMaxXMargin = 4;
CPViewMinYMargin = 8;
CPViewHeightSizable = 16;
CPViewMaxYMargin = 32;
CPViewBoundsDidChangeNotification = "CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification = "CPViewFrameDidChangeNotification";
var _DOMOriginUpdateMask = 1 << 0,
    _DOMSizeUpdateMask = 1 << 1;
var _CPViewNotificationCenter = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_superview"), new objj_ivar("_subviews"), new objj_ivar("_graphicsContext"), new objj_ivar("_tag"), new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_boundsTransform"), new objj_ivar("_inverseBoundsTransform"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_isHidden"), new objj_ivar("_hitTests"), new objj_ivar("_postsFrameChangedNotifications"), new objj_ivar("_postsBoundsChangedNotifications"), new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"), new objj_ivar("_displayHash"), new objj_ivar("_dirtyRect"), new objj_ivar("_opacity"), new objj_ivar("_backgroundColor"), new objj_ivar("_autoresizesSubviews"), new objj_ivar("_autoresizingMask"), new objj_ivar("_layer"), new objj_ivar("_wantsLayer"), new objj_ivar("_isInFullScreenMode"), new objj_ivar("_fullScreenModeState")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPView__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPView, "class"))
        return;
    _CPViewNotificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("init"), function $CPView__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:", CGRectMakeZero());
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithFrame:"), function $CPView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        var width = (aFrame.size.width),
            height = (aFrame.size.height);
        _subviews = [];
        _tag = -1;
        _frame = { origin: { x:aFrame.origin.x, y:aFrame.origin.y }, size: { width:aFrame.size.width, height:aFrame.size.height } };
        _bounds = { origin: { x:0.0, y:0.0 }, size: { width:width, height:height } };
        _registeredDraggedTypes = [];
        _autoresizingMask = CPViewNotSizable;
        _autoresizesSubviews = YES;
        _opacity = 1.0;
        _isHidden = NO;
        _hitTests = YES;
        _displayHash = objj_msgSend(self, "hash");
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("superview"), function $CPView__superview(self, _cmd)
{ with(self)
{
    return _superview;
}
});
instance_methods[3] = new objj_method(sel_registerName("subviews"), function $CPView__subviews(self, _cmd)
{ with(self)
{
    return _subviews;
}
});
instance_methods[4] = new objj_method(sel_registerName("window"), function $CPView__window(self, _cmd)
{ with(self)
{
    return _window;
}
});
instance_methods[5] = new objj_method(sel_registerName("addSubview:"), function $CPView__addSubview_(self, _cmd, aSubview)
{ with(self)
{
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, CPNotFound);
}
});
instance_methods[6] = new objj_method(sel_registerName("addSubview:positioned:relativeTo:"), function $CPView__addSubview_positioned_relativeTo_(self, _cmd, aSubview, anOrderingMode, anotherView)
{ with(self)
{
    var index = anotherView ? objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", anotherView) : CPNotFound;
    if (index == CPNotFound)
        index = (anOrderingMode == CPWindowAbove) ? objj_msgSend(_subviews, "count") : 0;
    else if (anOrderingMode == CPWindowAbove)
        ++index;
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, index);
}
});
instance_methods[7] = new objj_method(sel_registerName("_insertSubview:atIndex:"), function $CPView___insertSubview_atIndex_(self, _cmd, aSubview, anIndex)
{ with(self)
{
    var count = _subviews.length;
    if (aSubview._superview == self)
    {
        var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
        if (index == anIndex || index == count - 1 && anIndex == count)
            return;
        objj_msgSend(_subviews, "removeObjectAtIndex:", index);
        if (anIndex > index)
            --anIndex;
    }
    else
    {
        objj_msgSend(aSubview, "removeFromSuperview");
        objj_msgSend(aSubview, "_setWindow:", _window);
        objj_msgSend(aSubview, "viewWillMoveToSuperview:", self);
        aSubview._superview = self;
    }
    if (anIndex == CPNotFound || anIndex >= count)
    {
        _subviews.push(aSubview);
    }
    else
    {
        _subviews.splice(anIndex, 0, aSubview);
    }
    objj_msgSend(aSubview, "setNextResponder:", self);
    objj_msgSend(aSubview, "viewDidMoveToSuperview");
    objj_msgSend(self, "didAddSubview:", aSubview);
}
});
instance_methods[8] = new objj_method(sel_registerName("didAddSubview:"), function $CPView__didAddSubview_(self, _cmd, aSubview)
{ with(self)
{}
});
instance_methods[9] = new objj_method(sel_registerName("removeFromSuperview"), function $CPView__removeFromSuperview(self, _cmd)
{ with(self)
{
    if (!_superview)
        return;
    objj_msgSend(_superview, "willRemoveSubview:", self);
    objj_msgSend(objj_msgSend(_superview, "subviews"), "removeObject:", self);
    _superview = nil;
    objj_msgSend(self, "_setWindow:", nil);
}
});
instance_methods[10] = new objj_method(sel_registerName("replaceSubview:with:"), function $CPView__replaceSubview_with_(self, _cmd, aSubview, aView)
{ with(self)
{
    if (aSubview._superview != self)
        return;
    var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
    objj_msgSend(aSubview, "removeFromSuperview");
    objj_msgSend(self, "_insertSubview:atIndex:", aView, index);
}
});
instance_methods[11] = new objj_method(sel_registerName("_setWindow:"), function $CPView___setWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (objj_msgSend(_window, "firstResponder") == self)
        objj_msgSend(_window, "makeFirstResponder:", nil);
    objj_msgSend(self, "viewWillMoveToWindow:", aWindow);
    objj_msgSend(_subviews, "makeObjectsPerformSelector:withObject:", sel_registerName("_setWindow:"), aWindow);
    _window = aWindow;
    objj_msgSend(self, "viewDidMoveToWindow");
}
});
instance_methods[12] = new objj_method(sel_registerName("isDescendantOf:"), function $CPView__isDescendantOf_(self, _cmd, aView)
{ with(self)
{
    var view = self;
    do
    {
        if (view == aView)
            return YES;
    } while(view = objj_msgSend(view, "superview"))
    return NO;
}
});
instance_methods[13] = new objj_method(sel_registerName("viewDidMoveToSuperview"), function $CPView__viewDidMoveToSuperview(self, _cmd)
{ with(self)
{
        objj_msgSend(self, "setNeedsDisplay:", YES);
}
});
instance_methods[14] = new objj_method(sel_registerName("viewDidMoveToWindow"), function $CPView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{}
});
instance_methods[15] = new objj_method(sel_registerName("viewWillMoveToSuperview:"), function $CPView__viewWillMoveToSuperview_(self, _cmd, aView)
{ with(self)
{}
});
instance_methods[16] = new objj_method(sel_registerName("viewWillMoveToWindow:"), function $CPView__viewWillMoveToWindow_(self, _cmd, aWindow)
{ with(self)
{}
});
instance_methods[17] = new objj_method(sel_registerName("willRemoveSubview:"), function $CPView__willRemoveSubview_(self, _cmd, aView)
{ with(self)
{}
});
instance_methods[18] = new objj_method(sel_registerName("enclosingMenuItem"), function $CPView__enclosingMenuItem(self, _cmd)
{ with(self)
{
    var view = self;
    while (!objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPMenuItemView, "class")))
        view = objj_msgSend(view, "superview");
    if (view)
        return view._menuItem;
    return nil;
}
});
instance_methods[19] = new objj_method(sel_registerName("tag"), function $CPView__tag(self, _cmd)
{ with(self)
{
    return _tag;
}
});
instance_methods[20] = new objj_method(sel_registerName("isFlipped"), function $CPView__isFlipped(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[21] = new objj_method(sel_registerName("setFrame:"), function $CPView__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (((_frame.origin.x == aFrame.origin.x && _frame.origin.y == aFrame.origin.y) && (_frame.size.width == aFrame.size.width && _frame.size.height == aFrame.size.height)))
        return;
    _inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setFrameOrigin:", aFrame.origin);
    objj_msgSend(self, "setFrameSize:", aFrame.size);
    _inhibitFrameAndBoundsChangedNotifications = NO;
    if (_postsFrameChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
});
instance_methods[22] = new objj_method(sel_registerName("frame"), function $CPView__frame(self, _cmd)
{ with(self)
{
    return { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } };
}
});
instance_methods[23] = new objj_method(sel_registerName("setFrameOrigin:"), function $CPView__setFrameOrigin_(self, _cmd, aPoint)
{ with(self)
{
    var origin = _frame.origin;
    if (!aPoint || (origin.x == aPoint.x && origin.y == aPoint.y))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
});
instance_methods[24] = new objj_method(sel_registerName("setFrameSize:"), function $CPView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    var size = _frame.size;
    if (!aSize || (size.width == aSize.width && size.height == aSize.height))
        return;
    var oldSize = { width:size.width, height:size.height };
    size.width = aSize.width;
    size.height = aSize.height;
    if (YES)
    {
        _bounds.size.width = aSize.width;
        _bounds.size.height = aSize.height;
    }
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
    if (_layer)
        objj_msgSend(_layer, "_owningViewBoundsChanged");
    if (_autoresizesSubviews)
        objj_msgSend(self, "resizeSubviewsWithOldSize:", oldSize);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
});
instance_methods[25] = new objj_method(sel_registerName("setBounds:"), function $CPView__setBounds_(self, _cmd, bounds)
{ with(self)
{
    if (((_bounds.origin.x == bounds.origin.x && _bounds.origin.y == bounds.origin.y) && (_bounds.size.width == bounds.size.width && _bounds.size.height == bounds.size.height)))
        return;
    _inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setBoundsOrigin:", bounds.origin);
    objj_msgSend(self, "setBoundsSize:", bounds.size);
    _inhibitFrameAndBoundsChangedNotifications = NO;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
});
instance_methods[26] = new objj_method(sel_registerName("bounds"), function $CPView__bounds(self, _cmd)
{ with(self)
{
    return { origin: { x:_bounds.origin.x, y:_bounds.origin.y }, size: { width:_bounds.size.width, height:_bounds.size.height } };
}
});
instance_methods[27] = new objj_method(sel_registerName("setBoundsOrigin:"), function $CPView__setBoundsOrigin_(self, _cmd, aPoint)
{ with(self)
{
    var origin = _bounds.origin;
    if ((origin.x == aPoint.x && origin.y == aPoint.y))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (origin.x != 0 || origin.y != 0)
    {
        _boundsTransform = { a:1.0, b:0.0, c:0.0, d:1.0, tx:-origin.x, ty:-origin.y };
        _inverseBoundsTransform = CGAffineTransformInvert(_boundsTransform);
    }
    else
    {
        _boundsTransform = nil;
        _inverseBoundsTransform = nil;
    }
    if (_postsBoundsChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
});
instance_methods[28] = new objj_method(sel_registerName("setBoundsSize:"), function $CPView__setBoundsSize_(self, _cmd, aSize)
{ with(self)
{
    var size = _bounds.size;
    if ((size.width == aSize.width && size.height == aSize.height))
        return;
    var frameSize = _frame.size;
    if (!(size.width == frameSize.width && size.height == frameSize.height))
    {
        var origin = _bounds.origin;
        origin.x /= size.width / frameSize.width;
        origin.y /= size.height / frameSize.height;
    }
    size.width = aSize.width;
    size.height = aSize.height;
    if (!(size.width == frameSize.width && size.height == frameSize.height))
    {
        var origin = _bounds.origin;
        origin.x *= size.width / frameSize.width;
        origin.y *= size.height / frameSize.height;
    }
    if (_postsBoundsChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
});
instance_methods[29] = new objj_method(sel_registerName("resizeWithOldSuperviewSize:"), function $CPView__resizeWithOldSuperviewSize_(self, _cmd, aSize)
{ with(self)
{
    var mask = _autoresizingMask;
    if(mask == CPViewNotSizable)
        return;
    var frame = _superview._frame,
        newFrame = { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } },
        dX = ((frame.size.width) - aSize.width) /
            (((mask & CPViewMinXMargin) ? 1 : 0) + (mask & CPViewWidthSizable ? 1 : 0) + (mask & CPViewMaxXMargin ? 1 : 0)),
        dY = ((frame.size.height) - aSize.height) /
            ((mask & CPViewMinYMargin ? 1 : 0) + (mask & CPViewHeightSizable ? 1 : 0) + (mask & CPViewMaxYMargin ? 1 : 0));
    if (mask & CPViewMinXMargin)
        newFrame.origin.x += dX;
    if (mask & CPViewWidthSizable)
        newFrame.size.width += dX;
    if (mask & CPViewMinYMargin)
        newFrame.origin.y += dY;
    if (mask & CPViewHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "setFrame:", newFrame);
}
});
instance_methods[30] = new objj_method(sel_registerName("resizeSubviewsWithOldSize:"), function $CPView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    var count = _subviews.length;
    while (count--)
        objj_msgSend(_subviews[count], "resizeWithOldSuperviewSize:", aSize);
}
});
instance_methods[31] = new objj_method(sel_registerName("setAutoresizesSubviews:"), function $CPView__setAutoresizesSubviews_(self, _cmd, aFlag)
{ with(self)
{
    _autoresizesSubviews = aFlag;
}
});
instance_methods[32] = new objj_method(sel_registerName("autoresizesSubviews"), function $CPView__autoresizesSubviews(self, _cmd)
{ with(self)
{
    return _autoresizesSubviews;
}
});
instance_methods[33] = new objj_method(sel_registerName("setAutoresizingMask:"), function $CPView__setAutoresizingMask_(self, _cmd, aMask)
{ with(self)
{
    _autoresizingMask = aMask;
}
});
instance_methods[34] = new objj_method(sel_registerName("autoresizingMask"), function $CPView__autoresizingMask(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
});
instance_methods[35] = new objj_method(sel_registerName("enterFullScreenMode:withOptions:"), function $CPView__enterFullScreenMode_withOptions_(self, _cmd, aScreen, options)
{ with(self)
{
    _fullScreenModeState = _CPViewFullScreenModeStateMake(self);
    var fullScreenWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), CPBorderlessWindowMask);
    objj_msgSend(fullScreenWindow, "setLevel:", CPScreenSaverWindowLevel);
    objj_msgSend(fullScreenWindow, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    var contentView = objj_msgSend(fullScreenWindow, "contentView");
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(contentView, "addSubview:", self);
    objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    objj_msgSend(self, "setFrame:", CGRectMakeCopy(objj_msgSend(contentView, "bounds")));
    objj_msgSend(fullScreenWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(fullScreenWindow, "makeFirstResponder:", self);
    _isInFullScreenMode = YES;
    return YES;
}
});
instance_methods[36] = new objj_method(sel_registerName("exitFullScreenModeWithOptions:"), function $CPView__exitFullScreenModeWithOptions_(self, _cmd, options)
{ with(self)
{
    if (!_isInFullScreenMode)
        return;
    _isInFullScreenMode = NO;
    objj_msgSend(self, "setFrame:", _fullScreenModeState.frame);
    objj_msgSend(self, "setAutoresizingMask:", _fullScreenModeState.autoresizingMask);
    objj_msgSend(_fullScreenModeState.superview, "_insertSubview:atIndex:", self, _fullScreenModeState.index);
    objj_msgSend(objj_msgSend(self, "window"), "orderOut:", self);
}
});
instance_methods[37] = new objj_method(sel_registerName("isInFullScreenMode"), function $CPView__isInFullScreenMode(self, _cmd)
{ with(self)
{
    return _isInFullScreenMode;
}
});
instance_methods[38] = new objj_method(sel_registerName("setHidden:"), function $CPView__setHidden_(self, _cmd, aFlag)
{ with(self)
{
    if(_isHidden == aFlag)
        return;
    _isHidden = aFlag;
}
});
instance_methods[39] = new objj_method(sel_registerName("isHidden"), function $CPView__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
});
instance_methods[40] = new objj_method(sel_registerName("setAlphaValue:"), function $CPView__setAlphaValue_(self, _cmd, anAlphaValue)
{ with(self)
{
    if (_opacity == anAlphaValue)
        return;
    _opacity = anAlphaValue;
}
});
instance_methods[41] = new objj_method(sel_registerName("alphaValue"), function $CPView__alphaValue(self, _cmd)
{ with(self)
{
    return _opacity;
}
});
instance_methods[42] = new objj_method(sel_registerName("isHiddenOrHasHiddenAncestor"), function $CPView__isHiddenOrHasHiddenAncestor(self, _cmd)
{ with(self)
{
    var view = self;
    while (!objj_msgSend(view, "isHidden"))
        view = objj_msgSend(view, "superview");
    return view != nil;
}
});
instance_methods[43] = new objj_method(sel_registerName("acceptsFirstMouse:"), function $CPView__acceptsFirstMouse_(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
});
instance_methods[44] = new objj_method(sel_registerName("hitTests"), function $CPView__hitTests(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[45] = new objj_method(sel_registerName("setHitTests:"), function $CPView__setHitTests_(self, _cmd, shouldHitTest)
{ with(self)
{
    _hitTests = shouldHitTest;
}
});
instance_methods[46] = new objj_method(sel_registerName("hitTest:"), function $CPView__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    if(_isHidden || !_hitTests || !CPRectContainsPoint(_frame, aPoint))
        return nil;
    var view = nil,
        i = _subviews.length,
        adjustedPoint = { x:aPoint.x - (_frame.origin.x), y:aPoint.y - (_frame.origin.y) };
    if (_inverseBoundsTransform)
        adjustedPoint = { x:adjustedPoint.x * _inverseBoundsTransform.a + adjustedPoint.y * _inverseBoundsTransform.c + _inverseBoundsTransform.tx, y:adjustedPoint.x * _inverseBoundsTransform.b + adjustedPoint.y * _inverseBoundsTransform.d + _inverseBoundsTransform.ty };
    while (i--)
        if (view = objj_msgSend(_subviews[i], "hitTest:", adjustedPoint))
            return view;
    return self;
}
});
instance_methods[47] = new objj_method(sel_registerName("mouseDownCanMoveWindow"), function $CPView__mouseDownCanMoveWindow(self, _cmd)
{ with(self)
{
    return !objj_msgSend(self, "isOpaque");
}
});
instance_methods[48] = new objj_method(sel_registerName("mouseDown:"), function $CPView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "mouseDownCanMoveWindow"))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "mouseDown:", anEvent);
}
});
instance_methods[49] = new objj_method(sel_registerName("setBackgroundColor:"), function $CPView__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    if (_backgroundColor == aColor)
        return;
    _backgroundColor = aColor;
}
});
instance_methods[50] = new objj_method(sel_registerName("backgroundColor"), function $CPView__backgroundColor(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
});
instance_methods[51] = new objj_method(sel_registerName("convertPoint:fromView:"), function $CPView__convertPoint_fromView_(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(aView, self));
}
});
instance_methods[52] = new objj_method(sel_registerName("convertPoint:toView:"), function $CPView__convertPoint_toView_(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(self, aView));
}
});
instance_methods[53] = new objj_method(sel_registerName("convertSize:fromView:"), function $CPView__convertSize_fromView_(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(aView, self));
}
});
instance_methods[54] = new objj_method(sel_registerName("convertSize:toView:"), function $CPView__convertSize_toView_(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(self, aView));
}
});
instance_methods[55] = new objj_method(sel_registerName("convertRect:fromView:"), function $CPView__convertRect_fromView_(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(aView, self));
}
});
instance_methods[56] = new objj_method(sel_registerName("convertRect:toView:"), function $CPView__convertRect_toView_(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(self, aView));
}
});
instance_methods[57] = new objj_method(sel_registerName("setPostsFrameChangedNotifications:"), function $CPView__setPostsFrameChangedNotifications_(self, _cmd, shouldPostFrameChangedNotifications)
{ with(self)
{
    if (_postsFrameChangedNotifications == shouldPostFrameChangedNotifications)
        return;
    _postsFrameChangedNotifications = shouldPostFrameChangedNotifications;
    if (_postsFrameChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
});
instance_methods[58] = new objj_method(sel_registerName("postsFrameChangedNotifications"), function $CPView__postsFrameChangedNotifications(self, _cmd)
{ with(self)
{
    return _postsFrameChangedNotifications;
}
});
instance_methods[59] = new objj_method(sel_registerName("setPostsBoundsChangedNotifications:"), function $CPView__setPostsBoundsChangedNotifications_(self, _cmd, shouldPostBoundsChangedNotifications)
{ with(self)
{
    if (_postsBoundsChangedNotifications == shouldPostBoundsChangedNotifications)
        return;
    _postsBoundsChangedNotifications = shouldPostBoundsChangedNotifications;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
});
instance_methods[60] = new objj_method(sel_registerName("postsBoundsChangedNotifications"), function $CPView__postsBoundsChangedNotifications(self, _cmd)
{ with(self)
{
    return _postsBoundsChangedNotifications;
}
});
instance_methods[61] = new objj_method(sel_registerName("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragImage:at:offset:event:pasteboard:source:slideBack:", anImage, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
});
instance_methods[62] = new objj_method(sel_registerName("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragView:at:offset:event:pasteboard:source:slideBack:", aView, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
});
instance_methods[63] = new objj_method(sel_registerName("registerForDraggedTypes:"), function $CPView__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{ with(self)
{
    _registeredDraggedTypes = objj_msgSend(pasteboardTypes, "copy");
}
});
instance_methods[64] = new objj_method(sel_registerName("registeredDraggedTypes"), function $CPView__registeredDraggedTypes(self, _cmd)
{ with(self)
{
    return _registeredDraggedTypes;
}
});
instance_methods[65] = new objj_method(sel_registerName("unregisterDraggedTypes"), function $CPView__unregisterDraggedTypes(self, _cmd)
{ with(self)
{
    _registeredDraggedTypes = nil;
}
});
instance_methods[66] = new objj_method(sel_registerName("drawRect:"), function $CPView__drawRect_(self, _cmd, aRect)
{ with(self)
{}
});
instance_methods[67] = new objj_method(sel_registerName("setNeedsDisplay:"), function $CPView__setNeedsDisplay_(self, _cmd, aFlag)
{ with(self)
{
    if (aFlag)
        objj_msgSend(self, "setNeedsDisplayInRect:", objj_msgSend(self, "bounds"));
}
});
instance_methods[68] = new objj_method(sel_registerName("setNeedsDisplayInRect:"), function $CPView__setNeedsDisplayInRect_(self, _cmd, aRect)
{ with(self)
{
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0))
        return;
    if (_dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0))
        _dirtyRect = CGRectUnion(aRect, _dirtyRect);
    else
        _dirtyRect = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
}
});
instance_methods[69] = new objj_method(sel_registerName("needsDisplay"), function $CPView__needsDisplay(self, _cmd)
{ with(self)
{
    return _dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0);
}
});
instance_methods[70] = new objj_method(sel_registerName("displayIfNeeded"), function $CPView__displayIfNeeded(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", _dirtyRect);
}
});
instance_methods[71] = new objj_method(sel_registerName("display"), function $CPView__display(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "displayRect:", objj_msgSend(self, "visibleRect"));
}
});
instance_methods[72] = new objj_method(sel_registerName("displayIfNeededInRect:"), function $CPView__displayIfNeededInRect_(self, _cmd, aRect)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", aRect);
}
});
instance_methods[73] = new objj_method(sel_registerName("displayRect:"), function $CPView__displayRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "viewWillDraw");
    objj_msgSend(self, "displayRectIgnoringOpacity:inContext:", aRect, nil);
    _dirtyRect = NULL;
}
});
instance_methods[74] = new objj_method(sel_registerName("displayRectIgnoringOpacity:inContext:"), function $CPView__displayRectIgnoringOpacity_inContext_(self, _cmd, aRect, aGraphicsContext)
{ with(self)
{
    objj_msgSend(self, "lockFocus");
    CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"), aRect);
    objj_msgSend(self, "drawRect:", aRect);
    objj_msgSend(self, "unlockFocus");
}
});
instance_methods[75] = new objj_method(sel_registerName("viewWillDraw"), function $CPView__viewWillDraw(self, _cmd)
{ with(self)
{}
});
instance_methods[76] = new objj_method(sel_registerName("lockFocus"), function $CPView__lockFocus(self, _cmd)
{ with(self)
{
    if (!_graphicsContext)
    {
        var graphicsPort = CGBitmapGraphicsContextCreate();
        _DOMContentsElement = graphicsPort.DOMElement;
        _DOMContentsElement.style.zIndex = -100;
        _DOMContentsElement.style.overflow = "hidden";
        _DOMContentsElement.style.position = "absolute";
        _DOMContentsElement.style.visibility = "visible";
        _DOMContentsElement.width = ROUND((_frame.size.width));
        _DOMContentsElement.height = ROUND((_frame.size.height));
        _DOMContentsElement.style.top = "0px";
        _DOMContentsElement.style.left = "0px";
        _DOMContentsElement.style.width = ROUND((_frame.size.width)) + "px";
        _DOMContentsElement.style.height = ROUND((_frame.size.height)) + "px";
        if (_DOMContentsElement.CPDOMDisplayContext) _DOMContentsElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 6; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMContentsElement;;
        _graphicsContext = objj_msgSend(CPGraphicsContext, "graphicsContextWithGraphicsPort:flipped:", graphicsPort, YES);
    }
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", _graphicsContext);
    CGContextSaveGState(objj_msgSend(_graphicsContext, "graphicsPort"));
}
});
instance_methods[77] = new objj_method(sel_registerName("unlockFocus"), function $CPView__unlockFocus(self, _cmd)
{ with(self)
{
    CGContextRestoreGState(objj_msgSend(_graphicsContext, "graphicsPort"));
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", nil);
}
});
instance_methods[78] = new objj_method(sel_registerName("isOpaque"), function $CPView__isOpaque(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[79] = new objj_method(sel_registerName("visibleRect"), function $CPView__visibleRect(self, _cmd)
{ with(self)
{
    if (!_superview)
        return _bounds;
    return CGRectIntersection(objj_msgSend(self, "convertRect:fromView:", objj_msgSend(_superview, "visibleRect"), _superview), _bounds);
}
});
instance_methods[80] = new objj_method(sel_registerName("_enclosingClipView"), function $CPView___enclosingClipView(self, _cmd)
{ with(self)
{
    var superview = _superview,
        clipViewClass = objj_msgSend(CPClipView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", clipViewClass))
        superview = superview._superview;
    return superview;
}
});
instance_methods[81] = new objj_method(sel_registerName("scrollPoint:"), function $CPView__scrollPoint_(self, _cmd, aPoint)
{ with(self)
{
    var clipView = objj_msgSend(self, "_enclosingClipView");
    if (!clipView)
        return;
    objj_msgSend(clipView, "scrollToPoint:", objj_msgSend(self, "convertPoint:toView:", aPoint, clipView));
}
});
instance_methods[82] = new objj_method(sel_registerName("scrollRectToVisible:"), function $CPView__scrollRectToVisible_(self, _cmd, aRect)
{ with(self)
{
    var visibleRect = objj_msgSend(self, "visibleRect");
    aRect = CGRectIntersection(aRect, _bounds);
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0) || CGRectContainsRect(visibleRect, aRect))
        return NO;
    var enclosingClipView = objj_msgSend(self, "_enclosingClipView");
    if (!enclosingClipView)
        return NO;
    var scrollPoint = { x:visibleRect.origin.x, y:visibleRect.origin.y };
    if ((aRect.origin.x) <= (visibleRect.origin.x))
        scrollPoint.x = (aRect.origin.x);
    else if ((aRect.origin.x + aRect.size.width) > (visibleRect.origin.x + visibleRect.size.width))
        scrollPoint.x += (aRect.origin.x + aRect.size.width) - (visibleRect.origin.x + visibleRect.size.width);
    if ((aRect.origin.y) <= (visibleRect.origin.y))
        scrollPoint.y = CGRectGetMinY(aRect);
    else if ((aRect.origin.y + aRect.size.height) > (visibleRect.origin.y + visibleRect.size.height))
        scrollPoint.y += (aRect.origin.y + aRect.size.height) - (visibleRect.origin.y + visibleRect.size.height);
    objj_msgSend(enclosingClipView, "scrollToPoint:", CGPointMake(scrollPoint.x,scrollPoint.y));
    return YES;
}
});
instance_methods[83] = new objj_method(sel_registerName("autoscroll:"), function $CPView__autoscroll_(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
});
instance_methods[84] = new objj_method(sel_registerName("adjustScroll:"), function $CPView__adjustScroll_(self, _cmd, proposedVisibleRect)
{ with(self)
{
    return proposedVisibleRect;
}
});
instance_methods[85] = new objj_method(sel_registerName("scrollRect:by:"), function $CPView__scrollRect_by_(self, _cmd, aRect, anAmount)
{ with(self)
{}
});
instance_methods[86] = new objj_method(sel_registerName("enclosingScrollView"), function $CPView__enclosingScrollView(self, _cmd)
{ with(self)
{
    var superview = _superview,
        scrollViewClass = objj_msgSend(CPScrollView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", scrollViewClass))
        superview = superview._superview;
    return superview;
}
});
instance_methods[87] = new objj_method(sel_registerName("scrollClipView:toPoint:"), function $CPView__scrollClipView_toPoint_(self, _cmd, aClipView, aPoint)
{ with(self)
{
    objj_msgSend(aClipView, "scrollToPoint:", aPoint);
}
});
instance_methods[88] = new objj_method(sel_registerName("reflectScrolledClipView:"), function $CPView__reflectScrolledClipView_(self, _cmd, aClipView)
{ with(self)
{}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setLayer:"), function $CPView__setLayer_(self, _cmd, aLayer)
{ with(self)
{
    if (_layer == aLayer)
        return;
    if (_layer)
    {
        _layer._owningView = nil;
    }
    _layer = aLayer;
    if (_layer)
    {
        var bounds = CGRectMakeCopy(objj_msgSend(self, "bounds"));
        objj_msgSend(_layer, "_setOwningView:", self);
    }
}
});
instance_methods[1] = new objj_method(sel_registerName("layer"), function $CPView__layer(self, _cmd)
{ with(self)
{
    return _layer;
}
});
instance_methods[2] = new objj_method(sel_registerName("setWantsLayer:"), function $CPView__setWantsLayer_(self, _cmd, aFlag)
{ with(self)
{
    _wantsLayer = aFlag;
}
});
instance_methods[3] = new objj_method(sel_registerName("wantsLayer"), function $CPView__wantsLayer(self, _cmd)
{ with(self)
{
    return _wantsLayer;
}
});
class_addMethods(the_class, instance_methods);
}
var CPViewAutoresizingMaskKey = "CPViewAutoresizingMask",
    CPViewAutoresizesSubviewsKey = "CPViewAutoresizesSubviews",
    CPViewBackgroundColorKey = "CPViewBackgroundColor",
    CPViewBoundsKey = "CPViewBoundsKey",
    CPViewFrameKey = "CPViewFrameKey",
    CPViewHitTestsKey = "CPViewHitTestsKey",
    CPViewIsHiddenKey = "CPViewIsHiddenKey",
    CPViewOpacityKey = "CPViewOpacityKey",
    CPViewSubviewsKey = "CPViewSubviewsKey",
    CPViewSuperviewKey = "CPViewSuperviewKey",
    CPViewTagKey = "CPViewTagKey",
    CPViewWindowKey = "CPViewWindowKey";
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithCoder:"), function $CPView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    _frame = objj_msgSend(aCoder, "decodeRectForKey:", CPViewFrameKey);
    _bounds = objj_msgSend(aCoder, "decodeRectForKey:", CPViewBoundsKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "initWithCoder:", aCoder);
    if (self)
    {
        _tag = -1;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPViewTagKey))
            _tag = objj_msgSend(aCoder, "decodeIntForKey:", CPViewTagKey);
        _window = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewWindowKey);
        _subviews = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSubviewsKey);
        _superview = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSuperviewKey);
        _autoresizingMask = objj_msgSend(aCoder, "decodeIntForKey:", CPViewAutoresizingMaskKey);
        _autoresizesSubviews = objj_msgSend(aCoder, "decodeBoolForKey:", CPViewAutoresizesSubviewsKey);
        _hitTests = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewHitTestsKey);
        _isHidden = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewIsHiddenKey);
        _opacity = objj_msgSend(aCoder, "decodeIntForKey:", CPViewOpacityKey);
        _displayHash = objj_msgSend(self, "hash");
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPViewBackgroundColorKey));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("encodeWithCoder:"), function $CPView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "encodeWithCoder:", aCoder);
    if (_tag != -1)
        objj_msgSend(aCoder, "encodeInt:forKey:", _tag, CPViewTagKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _frame, CPViewFrameKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _bounds, CPViewBoundsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _window, CPViewWindowKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _subviews, CPViewSubviewsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _superview, CPViewSuperviewKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _autoresizingMask, CPViewAutoresizingMaskKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _autoresizesSubviews, CPViewAutoresizesSubviewsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _backgroundColor, CPViewBackgroundColorKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hitTests, CPViewHitTestsKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isHidden, CPViewIsHiddenKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _opacity, CPViewOpacityKey);
}
});
class_addMethods(the_class, instance_methods);
}
var _CPViewFullScreenModeStateMake = function(aView)
{
    var superview = aView._superview;
    return { autoresizingMask:aView._autoresizingMask, frame:CGRectMakeCopy(aView._frame), index:(superview ? objj_msgSend(superview._subviews, "indexOfObjectIdenticalTo:", aView) : 0), superview:superview };
}
var _CPViewGetTransform = function( fromView, toView)
{
    var transform = CGAffineTransformMakeIdentity();
    if (fromView)
    {
        var view = fromView;
        while (view && view != toView)
        {
            var frame = view._frame;
            transform.tx += (frame.origin.x);
            transform.ty += (frame.origin.y);
            if (view._boundsTransform)
            {
                var tx = transform.tx * view._boundsTransform.a + transform.ty * view._boundsTransform.c + view._boundsTransform.tx;transform.ty = transform.tx * view._boundsTransform.b + transform.ty * view._boundsTransform.d + view._boundsTransform.ty;transform.tx = tx;var a = transform.a * view._boundsTransform.a + transform.b * view._boundsTransform.c, b = transform.a * view._boundsTransform.b + transform.b * view._boundsTransform.d, c = transform.c * view._boundsTransform.a + transform.d * view._boundsTransform.c;transform.d = transform.c * view._boundsTransform.b + transform.d * view._boundsTransform.d;transform.a = a;transform.b = b;transform.c = c;;
            }
            view = view._superview;
        }
        if (view == toView)
            return transform;
    }
    var view = toView;
    while (view)
    {
        var frame = view._frame;
        transform.tx -= (frame.origin.x);
        transform.ty -= (frame.origin.y);
        if (view._boundsTransform)
        {
            var tx = transform.tx * view._inverseBoundsTransform.a + transform.ty * view._inverseBoundsTransform.c + view._inverseBoundsTransform.tx;transform.ty = transform.tx * view._inverseBoundsTransform.b + transform.ty * view._inverseBoundsTransform.d + view._inverseBoundsTransform.ty;transform.tx = tx;var a = transform.a * view._inverseBoundsTransform.a + transform.b * view._inverseBoundsTransform.c, b = transform.a * view._inverseBoundsTransform.b + transform.b * view._inverseBoundsTransform.d, c = transform.c * view._inverseBoundsTransform.a + transform.d * view._inverseBoundsTransform.c;transform.d = transform.c * view._inverseBoundsTransform.b + transform.d * view._inverseBoundsTransform.d;transform.a = a;transform.b = b;transform.c = c;;
        }
        view = view._superview;
    }
    return transform;
}

p;11;CPWebView.ji;8;CPView.jc;12604;
CPWebViewProgressStartedNotification = "CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification = "CPWebViewProgressFinishedNotification";
{var the_class = objj_allocateClassPair(CPView, "CPWebView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_iframe"), new objj_ivar("_mainFrameURL"), new objj_ivar("_backwardStack"), new objj_ivar("_forwardStack"), new objj_ivar("_ignoreLoadEvent"), new objj_ivar("_downloadDelegate"), new objj_ivar("_frameLoadDelegate"), new objj_ivar("_policyDelegate"), new objj_ivar("_resourceLoadDelegate"), new objj_ivar("_UIDelegate"), new objj_ivar("_wso")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithFrame:frameName:groupName:"), function $CPWebView__initWithFrame_frameName_groupName_(self, _cmd, frameRect, frameName, groupName)
{ with(self)
{
    if (self = objj_msgSend(self, "initWithFrame:", frameRect))
    {
        _iframe.name = frameName;
    }
    return self
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithFrame:"), function $CPWebView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame))
    {
        _mainFrameURL = nil;
        _backwardStack = [];
        _forwardStack = [];
        _ignoreLoadEvent = NO;
        _iframe = document.createElement("iframe");
        _iframe.name = "iframe_" + Math.floor(Math.random()*10000);
        _iframe.style.width = "100%";
        _iframe.style.height = "100%";
        _iframe.style.borderWidth = "0px";
        var loadCallback = function() {
      if (!_ignoreLoadEvent)
      {
          objj_msgSend(self, "_startedLoading");
          if (_mainFrameURL)
              objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
                _mainFrameURL = _iframe.src;
             objj_msgSend(_forwardStack, "removeAllObjects");
      }
      _ignoreLoadEvent = NO;
            objj_msgSend(self, "_finishedLoading")
  }
  if (_iframe.addEventListener)
      _iframe.addEventListener("load", loadCallback, false);
  else if (_iframe.attachEvent)
      _iframe.attachEvent("onload", loadCallback);
        _DOMElement.appendChild(_iframe);
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("drawsBackground"), function $CPWebView__drawsBackground(self, _cmd)
{ with(self)
{
    return _iframe.style.backgroundColor != "";
}
});
instance_methods[3] = new objj_method(sel_registerName("setDrawsBackground:"), function $CPWebView__setDrawsBackground_(self, _cmd, drawsBackround)
{ with(self)
{
    _iframe.style.backgroundColor = drawsBackround ? "white" : "";
}
});
instance_methods[4] = new objj_method(sel_registerName("mainFrameURL"), function $CPWebView__mainFrameURL(self, _cmd)
{ with(self)
{
    return _mainFrameURL;
}
});
instance_methods[5] = new objj_method(sel_registerName("_loadMainFrameURL"), function $CPWebView___loadMainFrameURL(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_startedLoading");
    _ignoreLoadEvent = YES;
    _iframe.src = _mainFrameURL;
}
});
instance_methods[6] = new objj_method(sel_registerName("_startedLoading"), function $CPWebView___startedLoading(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressStartedNotification, self);
    if (objj_msgSend(_frameLoadDelegate, "respondsToSelector:", sel_registerName("webView:didStartProvisionalLoadForFrame:")))
        objj_msgSend(_frameLoadDelegate, "webView:didStartProvisionalLoadForFrame:", self, nil);
}
});
instance_methods[7] = new objj_method(sel_registerName("_finishedLoading"), function $CPWebView___finishedLoading(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressFinishedNotification, self);
    if (objj_msgSend(_frameLoadDelegate, "respondsToSelector:", sel_registerName("webView:didFinishLoadForFrame:")))
        objj_msgSend(_frameLoadDelegate, "webView:didFinishLoadForFrame:", self, nil);
}
});
instance_methods[8] = new objj_method(sel_registerName("setMainFrameURL:"), function $CPWebView__setMainFrameURL_(self, _cmd, URLString)
{ with(self)
{
    if (_mainFrameURL)
        objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
    _mainFrameURL = URLString;
    objj_msgSend(_forwardStack, "removeAllObjects");
    objj_msgSend(self, "_loadMainFrameURL");
}
});
instance_methods[9] = new objj_method(sel_registerName("takeStringURLFrom:"), function $CPWebView__takeStringURLFrom_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "setMainFrameURL:", objj_msgSend(sender, "stringValue"));
}
});
instance_methods[10] = new objj_method(sel_registerName("goBack"), function $CPWebView__goBack(self, _cmd)
{ with(self)
{
    if (_backwardStack.length > 0)
    {
        if (_mainFrameURL)
            objj_msgSend(_forwardStack, "addObject:", _mainFrameURL);
        _mainFrameURL = objj_msgSend(_backwardStack, "lastObject");
        objj_msgSend(_backwardStack, "removeLastObject");
        objj_msgSend(self, "_loadMainFrameURL");
        return YES;
    }
    return NO;
}
});
instance_methods[11] = new objj_method(sel_registerName("goForward"), function $CPWebView__goForward(self, _cmd)
{ with(self)
{
    if (_forwardStack.length > 0)
    {
        if (_mainFrameURL)
            objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
        _mainFrameURL = objj_msgSend(_forwardStack, "lastObject");
        objj_msgSend(_forwardStack, "removeLastObject");
        objj_msgSend(self, "_loadMainFrameURL");
        return YES;
    }
    return NO;
}
});
instance_methods[12] = new objj_method(sel_registerName("goBack:"), function $CPWebView__goBack_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "goBack");
}
});
instance_methods[13] = new objj_method(sel_registerName("goForward:"), function $CPWebView__goForward_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "goForward");
}
});
instance_methods[14] = new objj_method(sel_registerName("canGoBack"), function $CPWebView__canGoBack(self, _cmd)
{ with(self)
{
    return (_backwardStack.length > 0);
}
});
instance_methods[15] = new objj_method(sel_registerName("canGoForward"), function $CPWebView__canGoForward(self, _cmd)
{ with(self)
{
    return (_forwardStack.length > 0);
}
});
instance_methods[16] = new objj_method(sel_registerName("backForwardList"), function $CPWebView__backForwardList(self, _cmd)
{ with(self)
{
    return { back: _backwardStack, forward: _forwardStack };
}
});
instance_methods[17] = new objj_method(sel_registerName("close"), function $CPWebView__close(self, _cmd)
{ with(self)
{
    _DOMElement.removeChild(_iframe);
}
});
instance_methods[18] = new objj_method(sel_registerName("window"), function $CPWebView__window(self, _cmd)
{ with(self)
{
    return (_iframe.contentDocument && _iframe.contentDocument.defaultView) || _iframe.contentWindow;
}
});
instance_methods[19] = new objj_method(sel_registerName("windowScriptObject"), function $CPWebView__windowScriptObject(self, _cmd)
{ with(self)
{
    var win = objj_msgSend(self, "window");
    if (!_wso || win != objj_msgSend(_wso, "window"))
    {
        if (win)
            _wso = objj_msgSend(objj_msgSend(CPWebScriptObject, "alloc"), "initWithWindow:", win);
        else
            _wso = nil;
    }
    return _wso;
}
});
instance_methods[20] = new objj_method(sel_registerName("stringByEvaluatingJavaScriptFromString:"), function $CPWebView__stringByEvaluatingJavaScriptFromString_(self, _cmd, script)
{ with(self)
{
    var result = objj_msgSend(self, "objectByEvaluatingJavaScriptFromString:", script);
    return result ? String(result) : nil;
}
});
instance_methods[21] = new objj_method(sel_registerName("objectByEvaluatingJavaScriptFromString:"), function $CPWebView__objectByEvaluatingJavaScriptFromString_(self, _cmd, script)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "windowScriptObject"), "evaluateWebScript:", script);
}
});
instance_methods[22] = new objj_method(sel_registerName("computedStyleForElement:pseudoElement:"), function $CPWebView__computedStyleForElement_pseudoElement_(self, _cmd, element, pseudoElement)
{ with(self)
{
    var win = objj_msgSend(objj_msgSend(self, "windowScriptObject"), "window");
    if (win)
    {
        return win.document.defaultView.getComputedStyle(element, pseudoElement);
    }
    return nil;
}
});
instance_methods[23] = new objj_method(sel_registerName("downloadDelegate"), function $CPWebView__downloadDelegate(self, _cmd)
{ with(self)
{
    return _downloadDelegate;
}
});
instance_methods[24] = new objj_method(sel_registerName("setDownloadDelegate:"), function $CPWebView__setDownloadDelegate_(self, _cmd, anObject)
{ with(self)
{
    _downloadDelegate = anObject;
}
});
instance_methods[25] = new objj_method(sel_registerName("frameLoadDelegate"), function $CPWebView__frameLoadDelegate(self, _cmd)
{ with(self)
{
    return _frameLoadDelegate;
}
});
instance_methods[26] = new objj_method(sel_registerName("setFrameLoadDelegate:"), function $CPWebView__setFrameLoadDelegate_(self, _cmd, anObject)
{ with(self)
{
    _frameLoadDelegate = anObject;
}
});
instance_methods[27] = new objj_method(sel_registerName("policyDelegate"), function $CPWebView__policyDelegate(self, _cmd)
{ with(self)
{
    return _policyDelegate;
}
});
instance_methods[28] = new objj_method(sel_registerName("setPolicyDelegate:"), function $CPWebView__setPolicyDelegate_(self, _cmd, anObject)
{ with(self)
{
    _policyDelegate = anObject;
}
});
instance_methods[29] = new objj_method(sel_registerName("resourceLoadDelegate"), function $CPWebView__resourceLoadDelegate(self, _cmd)
{ with(self)
{
    return _resourceLoadDelegate;
}
});
instance_methods[30] = new objj_method(sel_registerName("setResourceLoadDelegate:"), function $CPWebView__setResourceLoadDelegate_(self, _cmd, anObject)
{ with(self)
{
    _resourceLoadDelegate = anObject;
}
});
instance_methods[31] = new objj_method(sel_registerName("UIDelegate"), function $CPWebView__UIDelegate(self, _cmd)
{ with(self)
{
    return _UIDelegate;
}
});
instance_methods[32] = new objj_method(sel_registerName("setUIDelegate:"), function $CPWebView__setUIDelegate_(self, _cmd, anObject)
{ with(self)
{
    _UIDelegate = anObject;
}
});
instance_methods[33] = new objj_method(sel_registerName("loadHTMLString:"), function $CPWebView__loadHTMLString_(self, _cmd, aString)
{ with(self)
{
    objj_msgSend(self, "loadHTMLString:baseURL:", aString, nil);
}
});
instance_methods[34] = new objj_method(sel_registerName("loadHTMLString:baseURL:"), function $CPWebView__loadHTMLString_baseURL_(self, _cmd, aString, URL)
{ with(self)
{
    _iframe.src = "";
    window.setTimeout(function() {
        var win = objj_msgSend(self, "window");
        win.document.write(aString);
    }, 0);
}
});
class_addMethods(the_class, instance_methods);
}
{var the_class = objj_allocateClassPair(CPObject, "CPWebScriptObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithWindow:"), function $CPWebScriptObject__initWithWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _window = aWindow
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("callWebScriptMethod:withArguments:"), function $CPWebScriptObject__callWebScriptMethod_withArguments_(self, _cmd, methodName, args)
{ with(self)
{
    if (typeof _window[methodName] == "function")
    {
        try {
            return _window[methodName].apply(args);
        } catch (e) {
        }
    }
    return undefined;
}
});
instance_methods[2] = new objj_method(sel_registerName("evaluateWebScript:"), function $CPWebScriptObject__evaluateWebScript_(self, _cmd, script)
{ with(self)
{
    try {
        return _window.eval(script);
    } catch (e) {
    }
    return undefined;
}
});
instance_methods[3] = new objj_method(sel_registerName("window"), function $CPWebScriptObject__window(self, _cmd)
{ with(self)
{
    return _window;
}
});
class_addMethods(the_class, instance_methods);
}

p;10;CPWindow.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.jc;46383;
CPBorderlessWindowMask = 0;
CPTitledWindowMask = 1 << 0;
CPClosableWindowMask = 1 << 1;
CPMiniaturizableWindowMask = 1 << 2;
CPResizableWindowMask = 1 << 3;
CPTexturedBackgroundWindowMask = 1 << 8;
CPBorderlessBridgeWindowMask = 1 << 20;
CPHUDBackgroundWindowMask = 1 << 21;
CPWindowNotSizable = 0;
CPWindowMinXMargin = 1;
CPWindowWidthSizable = 2;
CPWindowMaxXMargin = 4;
CPWindowMinYMargin = 8;
CPWindowHeightSizable = 16;
CPWindowMaxYMargin = 32;
CPNormalWindowLevel = 4;
CPFloatingWindowLevel = 5;
CPSubmenuWindowLevel = 6;
CPTornOffMenuWindowLevel = 6;
CPMainMenuWindowLevel = 8;
CPStatusWindowLevel = 9;
CPModalPanelWindowLevel = 10;
CPPopUpMenuWindowLevel = 11;
CPDraggingWindowLevel = 12;
CPScreenSaverWindowLevel = 13;
CPWindowOut = 0;
CPWindowAbove = 1;
CPWindowBelow = 2;
CPWindowWillCloseNotification = "CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification = "CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification = "CPWindowDidResignMainNotification";
var SHADOW_MARGIN_LEFT = 20.0,
    SHADOW_MARGIN_RIGHT = 19.0,
    SHADOW_MARGIN_TOP = 10.0,
    SHADOW_MARGIN_BOTTOM = 10.0,
    SHADOW_DISTANCE = 5.0,
    _CPWindowShadowColor = nil;
var CPWindowSaveImage = nil,
    CPWindowSavingImage = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_windowNumber"), new objj_ivar("_styleMask"), new objj_ivar("_frame"), new objj_ivar("_level"), new objj_ivar("_isVisible"), new objj_ivar("_isAnimating"), new objj_ivar("_hasShadow"), new objj_ivar("_isMovableByWindowBackground"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isDocumentSaving"), new objj_ivar("_shadowView"), new objj_ivar("_windowView"), new objj_ivar("_contentView"), new objj_ivar("_toolbarView"), new objj_ivar("_mouseOverView"), new objj_ivar("_leftMouseDownView"), new objj_ivar("_rightMouseDownView"), new objj_ivar("_toolbar"), new objj_ivar("_firstResponder"), new objj_ivar("_delegate"), new objj_ivar("_title"), new objj_ivar("_acceptsMouseMovedEvents"), new objj_ivar("_windowController"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_resizeFrame"), new objj_ivar("_mouseDraggedPoint"), new objj_ivar("_undoManager"), new objj_ivar("_representedURL"), new objj_ivar("_bridge"), new objj_ivar("_autoresizingMask"), new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var class_methods = [];
class_methods[0] = new objj_method(sel_registerName("initialize"), function $CPWindow__initialize(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
    CPWindowResizeIndicatorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindowResizeIndicator.png"), CGSizeMake(12.0,12.0));
    CPWindowSavingImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(16.0,16.0))
}
});
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithContentRect:styleMask:"), function $CPWindow__initWithContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    return objj_msgSend(self, "initWithContentRect:styleMask:bridge:", aContentRect, aStyleMask, objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"));
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithContentRect:styleMask:bridge:"), function $CPWindow__initWithContentRect_styleMask_bridge_(self, _cmd, aContentRect, aStyleMask, aBridge)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _windowNumber = objj_msgSend(CPApp._windows, "count");
        CPApp._windows[_windowNumber] = self;
        _styleMask = aStyleMask;
        _frame = objj_msgSend(self, "frameRectForContentRect:", aContentRect);
        _level = CPNormalWindowLevel;
        _hasShadow = NO;
        _minSize = CGSizeMake(0.0, 0.0);
        _maxSize = CGSizeMake(1000000.0, 1000000.0);
        if (_styleMask & CPBorderlessBridgeWindowMask)
            _autoresizingMask = CPWindowWidthSizable | CPWindowHeightSizable;
        _windowView = objj_msgSend(objj_msgSend(_CPWindowView, "alloc"), "initWithFrame:forStyleMask:", CGRectMake(0.0,0.0,CGRectGetWidth(_frame),CGRectGetHeight(_frame)), _styleMask);
        objj_msgSend(_windowView, "_setWindow:", self);
        objj_msgSend(_windowView, "setNextResponder:", self);
        objj_msgSend(self, "setMovableByWindowBackground:", aStyleMask&CPHUDBackgroundWindowMask);
        objj_msgSend(self, "setContentView:", objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero()));
        _firstResponder = self;
        objj_msgSend(self, "setBridge:", aBridge);
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
});
instance_methods[2] = new objj_method(sel_registerName("styleMask"), function $CPWindow__styleMask(self, _cmd)
{ with(self)
{
    return _styleMask;
}
});
class_methods[1] = new objj_method(sel_registerName("frameRectForContentRect:styleMask:"), function $CPWindow__frameRectForContentRect_styleMask_(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    var frame = CGRectMakeCopy(aContentRect);
    return frame;
}
});
instance_methods[3] = new objj_method(sel_registerName("contentRectForFrameRect:"), function $CPWindow__contentRectForFrameRect_(self, _cmd, aFrame)
{ with(self)
{
    var contentRect = CGRectMakeCopy(objj_msgSend(_windowView, "bounds"));
    if (_styleMask & CPHUDBackgroundWindowMask)
    {
        contentRect.origin.x += 7.0;
        contentRect.origin.y += 30.0;
        contentRect.size.width -= 14.0;
        contentRect.size.height -= 40.0;
    }
    else if (_styleMask & CPBorderlessBridgeWindowMask)
    {
    }
    if (objj_msgSend(_toolbar, "isVisible"))
    {
        var toolbarHeight = CGRectGetHeight(objj_msgSend(_toolbarView, "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
});
instance_methods[4] = new objj_method(sel_registerName("frameRectForContentRect:"), function $CPWindow__frameRectForContentRect_(self, _cmd, aContentRect)
{ with(self)
{
    if (_styleMask & CPBorderlessBridgeWindowMask)
        return _bridge ? objj_msgSend(_bridge, "visibleFrame") : CGRectMakeZero();
    var frame = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:styleMask:", aContentRect, _styleMask);
    return frame;
}
});
instance_methods[5] = new objj_method(sel_registerName("frame"), function $CPWindow__frame(self, _cmd)
{ with(self)
{
    return _frame;
}
});
instance_methods[6] = new objj_method(sel_registerName("setFrame:display:animate:"), function $CPWindow__setFrame_display_animate_(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
{ with(self)
{
    if (shouldAnimate)
    {
        var animation = objj_msgSend(objj_msgSend(_CPWindowFrameAnimation, "alloc"), "initWithWindow:targetFrame:", self, aFrame);
        objj_msgSend(animation, "startAnimation");
    }
    else
    {
        objj_msgSend(self, "setFrameOrigin:", aFrame.origin);
        objj_msgSend(self, "setFrameSize:", aFrame.size);
    }
}
});
instance_methods[7] = new objj_method(sel_registerName("setFrame:"), function $CPWindow__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:display:animate:", aFrame, YES, NO);
}
});
instance_methods[8] = new objj_method(sel_registerName("setFrameOrigin:"), function $CPWindow__setFrameOrigin_(self, _cmd, anOrigin)
{ with(self)
{
    var origin = _frame.origin;
    if ((origin.x == anOrigin.x && origin.y == anOrigin.y))
        return;
    origin.x = anOrigin.x;
    origin.y = anOrigin.y;
}
});
instance_methods[9] = new objj_method(sel_registerName("setFrameSize:"), function $CPWindow__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    aSize = { width:MIN(MAX(aSize.width, _minSize.width), _maxSize.width), height:MIN(MAX(aSize.height, _minSize.height), _maxSize.height) };
    if ((_frame.size.width == aSize.width && _frame.size.height == aSize.height))
        return;
    _frame.size = aSize;
    objj_msgSend(_windowView, "setFrameSize:", aSize);
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrameSize:", {width:SHADOW_MARGIN_LEFT+aSize.width+SHADOW_MARGIN_RIGHT,height:SHADOW_MARGIN_BOTTOM+aSize.height+SHADOW_MARGIN_TOP+SHADOW_DISTANCE});
    if (!_isAnimating && objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowDidResize:")))
        objj_msgSend(_delegate, "windowDidResize:", self);
}
});
instance_methods[10] = new objj_method(sel_registerName("trackMoveWithEvent:"), function $CPWindow__trackMoveWithEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseUp)
        return;
    else if (type == CPLeftMouseDown)
        _mouseDraggedPoint = objj_msgSend(self, "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow"));
    else if (type == CPLeftMouseDragged)
    {
        var location = objj_msgSend(self, "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow"));
        objj_msgSend(self, "setFrameOrigin:", CGPointMake((_frame.origin.x)+(location.x-_mouseDraggedPoint.x),(_frame.origin.y)+(location.y-_mouseDraggedPoint.y)));
        _mouseDraggedPoint = location;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackMoveWithEvent:"), CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
instance_methods[11] = new objj_method(sel_registerName("trackResizeWithEvent:"), function $CPWindow__trackResizeWithEvent_(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(anEvent, "locationInWindow"),
        type = objj_msgSend(anEvent, "type");
    if (type == CPLeftMouseUp)
        return;
    else if (type == CPLeftMouseDown)
        _resizeFrame = CGRectMake(location.x, location.y, CGRectGetWidth(_frame), CGRectGetHeight(_frame));
    else if (type == CPLeftMouseDragged)
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(_resizeFrame)+location.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+location.y-CGRectGetMinY(_resizeFrame)));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_registerName("trackResizeWithEvent:"), CPLeftMouseDraggedMask|CPLeftMouseUpMask, nil, nil, YES);
}
});
instance_methods[12] = new objj_method(sel_registerName("orderFront:"), function $CPWindow__orderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowAbove, self, nil);
}
});
instance_methods[13] = new objj_method(sel_registerName("orderBack:"), function $CPWindow__orderBack_(self, _cmd, aSender)
{ with(self)
{}
});
instance_methods[14] = new objj_method(sel_registerName("orderOut:"), function $CPWindow__orderOut_(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowWillClose:")))
        objj_msgSend(_delegate, "windowWillClose:", self);
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowOut, self, nil);
    if (objj_msgSend(CPApp, "keyWindow") == self)
    {
        objj_msgSend(self, "resignKeyWindow");
        CPApp._keyWindow = nil;
    }
}
});
instance_methods[15] = new objj_method(sel_registerName("orderWindow:relativeTo:"), function $CPWindow__orderWindow_relativeTo_(self, _cmd, aPlace, otherWindowNumber)
{ with(self)
{
    objj_msgSend(_bridge, "order:window:relativeTo:", aPlace, self, CPApp._windows[otherWindowNumber]);
}
});
instance_methods[16] = new objj_method(sel_registerName("setLevel:"), function $CPWindow__setLevel_(self, _cmd, aLevel)
{ with(self)
{
    _level = aLevel;
}
});
instance_methods[17] = new objj_method(sel_registerName("level"), function $CPWindow__level(self, _cmd)
{ with(self)
{
    return _level;
}
});
instance_methods[18] = new objj_method(sel_registerName("isVisible"), function $CPWindow__isVisible(self, _cmd)
{ with(self)
{
    return _isVisible;
}
});
instance_methods[19] = new objj_method(sel_registerName("showsResizeIndicator"), function $CPWindow__showsResizeIndicator(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "showsResizeIndicator");
}
});
instance_methods[20] = new objj_method(sel_registerName("setShowsResizeIndicator:"), function $CPWindow__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    objj_msgSend(_windowView, "setShowsResizeIndicator:", shouldShowResizeIndicator);
}
});
instance_methods[21] = new objj_method(sel_registerName("resizeIndicatorOffset"), function $CPWindow__resizeIndicatorOffset(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "resizeIndicatorOffset");
}
});
instance_methods[22] = new objj_method(sel_registerName("setResizeIndicatorOffset:"), function $CPWindow__setResizeIndicatorOffset_(self, _cmd, anOffset)
{ with(self)
{
    objj_msgSend(_windowView, "setResizeIndicatorOffset:", anOffset);
}
});
instance_methods[23] = new objj_method(sel_registerName("setContentView:"), function $CPWindow__setContentView_(self, _cmd, aView)
{ with(self)
{
    if (_contentView)
        objj_msgSend(_contentView, "removeFromSuperview");
    _contentView = aView;
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRectForFrameRect:", _frame));
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    objj_msgSend(_windowView, "addSubview:positioned:relativeTo:", _contentView, CPWindowBelow, nil);
}
});
instance_methods[24] = new objj_method(sel_registerName("contentView"), function $CPWindow__contentView(self, _cmd)
{ with(self)
{
    return _contentView;
}
});
instance_methods[25] = new objj_method(sel_registerName("setBackgroundColor:"), function $CPWindow__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(_windowView, "setBackgroundColor:", aColor);
}
});
instance_methods[26] = new objj_method(sel_registerName("backgroundColor"), function $CPWindow__backgroundColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "backgroundColor");
}
});
instance_methods[27] = new objj_method(sel_registerName("setMinSize:"), function $CPWindow__setMinSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_minSize, aSize))
        return;
    _minSize = CGSizeCreateCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width < _minSize.width)
    {
        size.width = _minSize.width;
        needsFrameChange = YES;
    }
    if (size.height < _minSize.height)
    {
        size.height = _minSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
});
instance_methods[28] = new objj_method(sel_registerName("minSize"), function $CPWindow__minSize(self, _cmd)
{ with(self)
{
    return _minSize;
}
});
instance_methods[29] = new objj_method(sel_registerName("setMaxSize:"), function $CPWindow__setMaxSize_(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_maxSize, aSize))
        return;
    _maxSize = CGSizeCreateCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width > _maxSize.width)
    {
        size.width = _maxSize.width;
        needsFrameChange = YES;
    }
    if (size.height > _maxSize.height)
    {
        size.height = _maxSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
});
instance_methods[30] = new objj_method(sel_registerName("maxSize"), function $CPWindow__maxSize(self, _cmd)
{ with(self)
{
    return _maxSize;
}
});
instance_methods[31] = new objj_method(sel_registerName("hasShadow"), function $CPWindow__hasShadow(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
});
instance_methods[32] = new objj_method(sel_registerName("setHasShadow:"), function $CPWindow__setHasShadow_(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow == shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        var bounds = objj_msgSend(_windowView, "bounds");
        _shadowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(-SHADOW_MARGIN_LEFT,-SHADOW_MARGIN_TOP+SHADOW_DISTANCE,SHADOW_MARGIN_LEFT+CGRectGetWidth(bounds)+SHADOW_MARGIN_RIGHT,SHADOW_MARGIN_TOP+CGRectGetHeight(bounds)+SHADOW_MARGIN_BOTTOM));
        if (!_CPWindowShadowColor)
        {
            var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
            _CPWindowShadowColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow0.png"), CGSizeMake(20.0,19.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow1.png"), CGSizeMake(1.0,19.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow2.png"), CGSizeMake(19.0,19.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow3.png"), CGSizeMake(20.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow4.png"), CGSizeMake(1.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow5.png"), CGSizeMake(19.0,1.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow6.png"), CGSizeMake(20.0,18.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow7.png"), CGSizeMake(1.0,18.0)),objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow8.png"), CGSizeMake(19.0,18.0))]));
        }
        objj_msgSend(_shadowView, "setBackgroundColor:", _CPWindowShadowColor);
        objj_msgSend(_shadowView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    }
    else
    {
        _shadowView = nil;
    }
}
});
instance_methods[33] = new objj_method(sel_registerName("setDelegate:"), function $CPWindow__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    _delegateRespondsToWindowWillReturnUndoManagerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowWillReturnUndoManager:"));
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowDidBecomeMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_registerName("windowDidBecomeMain:"), CPWindowDidBecomeMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowDidResignMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_registerName("windowDidResignMain:"), CPWindowDidResignMainNotification, self);
}
});
instance_methods[34] = new objj_method(sel_registerName("delegate"), function $CPWindow__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
});
instance_methods[35] = new objj_method(sel_registerName("setWindowController:"), function $CPWindow__setWindowController_(self, _cmd, aWindowController)
{ with(self)
{
    _windowController = aWindowController;
}
});
instance_methods[36] = new objj_method(sel_registerName("windowController"), function $CPWindow__windowController(self, _cmd)
{ with(self)
{
    return _windowController;
}
});
instance_methods[37] = new objj_method(sel_registerName("doCommandBySelector:"), function $CPWindow__doCommandBySelector_(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
});
instance_methods[38] = new objj_method(sel_registerName("acceptsFirstResponder"), function $CPWindow__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[39] = new objj_method(sel_registerName("makeFirstResponder:"), function $CPWindow__makeFirstResponder_(self, _cmd, aResponder)
{ with(self)
{
    if (_firstResponder == aResponder)
        return YES;
    if(!objj_msgSend(_firstResponder, "resignFirstResponder"))
        return NO;
    if(!aResponder || !objj_msgSend(aResponder, "acceptsFirstResponder") || !objj_msgSend(aResponder, "becomeFirstResponder"))
    {
        _firstResponder = self;
        return NO;
    }
    _firstResponder = aResponder;
    return YES;
}
});
instance_methods[40] = new objj_method(sel_registerName("firstResponder"), function $CPWindow__firstResponder(self, _cmd)
{ with(self)
{
    return _firstResponder;
}
});
instance_methods[41] = new objj_method(sel_registerName("acceptsMouseMovedEvents"), function $CPWindow__acceptsMouseMovedEvents(self, _cmd)
{ with(self)
{
    return _acceptsMouseMovedEvents;
}
});
instance_methods[42] = new objj_method(sel_registerName("setAcceptsMouseMovedEvents:"), function $CPWindow__setAcceptsMouseMovedEvents_(self, _cmd, shouldAcceptMouseMovedEvents)
{ with(self)
{
    _acceptsMouseMovedEvents = shouldAcceptMouseMovedEvents;
}
});
instance_methods[43] = new objj_method(sel_registerName("title"), function $CPWindow__title(self, _cmd)
{ with(self)
{
    return _title;
}
});
instance_methods[44] = new objj_method(sel_registerName("setTitle:"), function $CPWindow__setTitle_(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
    objj_msgSend(_windowView, "setTitle:", aTitle);
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
}
});
instance_methods[45] = new objj_method(sel_registerName("setTitleWithRepresentedFilename:"), function $CPWindow__setTitleWithRepresentedFilename_(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedFilename:", aFilePath);
    objj_msgSend(self, "setTitle:", objj_msgSend(aFilePath, "lastPathComponent"));
}
});
instance_methods[46] = new objj_method(sel_registerName("setRepresentedFilename:"), function $CPWindow__setRepresentedFilename_(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedURL:", aFilePath);
}
});
instance_methods[47] = new objj_method(sel_registerName("representedFilename"), function $CPWindow__representedFilename(self, _cmd)
{ with(self)
{
    return _representedURL;
}
});
instance_methods[48] = new objj_method(sel_registerName("setRepresentedURL:"), function $CPWindow__setRepresentedURL_(self, _cmd, aURL)
{ with(self)
{
    _representedURL = aURL;
}
});
instance_methods[49] = new objj_method(sel_registerName("representedURL"), function $CPWindow__representedURL(self, _cmd)
{ with(self)
{
    return _representedURL;
}
});
instance_methods[50] = new objj_method(sel_registerName("setMovableByWindowBackground:"), function $CPWindow__setMovableByWindowBackground_(self, _cmd, shouldBeMovableByWindowBackground)
{ with(self)
{
    _isMovableByWindowBackground = shouldBeMovableByWindowBackground;
}
});
instance_methods[51] = new objj_method(sel_registerName("isMovableByWindowBackground"), function $CPWindow__isMovableByWindowBackground(self, _cmd)
{ with(self)
{
    return _isMovableByWindowBackground;
}
});
instance_methods[52] = new objj_method(sel_registerName("center"), function $CPWindow__center(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size,
        bridgeSize = objj_msgSend(_bridge, "contentBounds").size;
    objj_msgSend(self, "setFrameOrigin:", CGPointMake((bridgeSize.width-size.width)/2.0,(bridgeSize.height-size.height)/2.0));
}
});
instance_methods[53] = new objj_method(sel_registerName("sendEvent:"), function $CPWindow__sendEvent_(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        point = objj_msgSend(anEvent, "locationInWindow");
    switch (type)
    {
        case CPKeyUp: return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyUp:", anEvent);
        case CPKeyDown: return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyDown:", anEvent);
        case CPScrollWheel: return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "scrollWheel:", anEvent);
        case CPLeftMouseUp: if (!_leftMouseDownView)
                                        return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "mouseUp:", anEvent);
                                    objj_msgSend(_leftMouseDownView, "mouseUp:", anEvent)
                                    _leftMouseDownView = nil;
                                    return;
        case CPLeftMouseDown: _leftMouseDownView = objj_msgSend(_windowView, "hitTest:", point);
                                    if (_leftMouseDownView != _firstResponder && objj_msgSend(_leftMouseDownView, "acceptsFirstResponder"))
                                        objj_msgSend(self, "makeFirstResponder:", _leftMouseDownView);
                                    var theWindow = objj_msgSend(anEvent, "window");
                                    if (objj_msgSend(theWindow, "isKeyWindow") || objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
                                        return objj_msgSend(_leftMouseDownView, "mouseDown:", anEvent);
                                    else
                                    {
                                        objj_msgSend(self, "makeKeyAndOrderFront:", self);
                                        if (objj_msgSend(_leftMouseDownView, "acceptsFirstMouse:", anEvent))
                                            return objj_msgSend(_leftMouseDownView, "mouseDown:", anEvent)
                                    }
                                    break;
        case CPLeftMouseDragged: if (!_leftMouseDownView)
                                        return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "mouseDragged:", anEvent);
                                    return objj_msgSend(_leftMouseDownView, "mouseDragged:", anEvent);
        case CPRightMouseUp: return objj_msgSend(_rightMouseDownView, "mouseUp:", anEvent);
        case CPRightMouseDown: _rightMouseDownView = objj_msgSend(_windowView, "hitTest:", point);
                                    return objj_msgSend(_rightMouseDownView, "mouseDown:", anEvent);
        case CPRightMouseDragged: return objj_msgSend(_rightMouseDownView, "mouseDragged:", anEvent);
        case CPMouseMoved: if (!_acceptsMouseMovedEvents)
                                        return;
                                    var hitTestView = objj_msgSend(_windowView, "hitTest:", point);
                                    if (hitTestView != _mouseOverView)
                                    {
                                        if (_mouseOverView)
                                            objj_msgSend(_mouseOverView, "mouseExited:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseExited, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), _windowNumber, nil, -1, 1, 0));
                                        if (hitTestView)
                                            objj_msgSend(hitTestView, "mouseEntered:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseEntered, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), _windowNumber, nil, -1, 1, 0));
                                        _mouseOverView = hitTestView;
                                    }
                                    objj_msgSend(_mouseOverView, "mouseMoved:", anEvent);
    }
}
});
instance_methods[54] = new objj_method(sel_registerName("windowNumber"), function $CPWindow__windowNumber(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
});
instance_methods[55] = new objj_method(sel_registerName("becomeKeyWindow"), function $CPWindow__becomeKeyWindow(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_registerName("becomeKeyWindow")))
        objj_msgSend(_firstResponder, "becomeKeyWindow");
}
});
instance_methods[56] = new objj_method(sel_registerName("canBecomeKeyWindow"), function $CPWindow__canBecomeKeyWindow(self, _cmd)
{ with(self)
{
    return YES;
}
});
instance_methods[57] = new objj_method(sel_registerName("isKeyWindow"), function $CPWindow__isKeyWindow(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "keyWindow") == self;
}
});
instance_methods[58] = new objj_method(sel_registerName("makeKeyAndOrderFront:"), function $CPWindow__makeKeyAndOrderFront_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "orderFront:", self);
    objj_msgSend(self, "makeKeyWindow");
    objj_msgSend(self, "makeMainWindow");
}
});
instance_methods[59] = new objj_method(sel_registerName("makeKeyWindow"), function $CPWindow__makeKeyWindow(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeKeyWindow"))
        return;
    objj_msgSend(CPApp._keyWindow, "resignKeyWindow");
    CPApp._keyWindow = self;
    objj_msgSend(self, "becomeKeyWindow");
}
});
instance_methods[60] = new objj_method(sel_registerName("resignKeyWindow"), function $CPWindow__resignKeyWindow(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_registerName("resignKeyWindow")))
        objj_msgSend(_firstResponder, "resignKeyWindow");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowDidResignKey:")))
        objj_msgSend(_delegate, "windowDidResignKey:", self);
}
});
instance_methods[61] = new objj_method(sel_registerName("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:", anImage, self, objj_msgSend(self, "convertBaseToBridge:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
});
instance_methods[62] = new objj_method(sel_registerName("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPWindow__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", aView, self, objj_msgSend(self, "convertBaseToBridge:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
});
instance_methods[63] = new objj_method(sel_registerName("setDocumentEdited:"), function $CPWindow__setDocumentEdited_(self, _cmd, isDocumentEdited)
{ with(self)
{
    if (_isDocumentEdited == isDocumentEdited)
        return;
    _isDocumentEdited = isDocumentEdited;
    objj_msgSend(CPMenu, "_setMenuBarIconImageAlphaValue:", _isDocumentEdited?0.5:1.0);
}
});
instance_methods[64] = new objj_method(sel_registerName("isDocumentEdited"), function $CPWindow__isDocumentEdited(self, _cmd)
{ with(self)
{
    return _isDocumentEdited;
}
});
instance_methods[65] = new objj_method(sel_registerName("setDocumentSaving:"), function $CPWindow__setDocumentSaving_(self, _cmd, isDocumentSaving)
{ with(self)
{
    if (_isDocumentSaving == isDocumentSaving)
        return;
    _isDocumentSaving = isDocumentSaving;
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(_windowView, "windowDidChangeDocumentSaving");
}
});
instance_methods[66] = new objj_method(sel_registerName("isDocumentSaving"), function $CPWindow__isDocumentSaving(self, _cmd)
{ with(self)
{
    return _isDocumentSaving;
}
});
instance_methods[67] = new objj_method(sel_registerName("_synchronizeSaveMenuWithDocumentSaving"), function $CPWindow___synchronizeSaveMenuWithDocumentSaving(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isMainWindow"))
        return;
    var mainMenu = objj_msgSend(CPApp, "mainMenu"),
        index = objj_msgSend(mainMenu, "indexOfItemWithTitle:", _isDocumentSaving?"Save":"Saving...");
    if (index == CPNotFound)
        return;
    var item = objj_msgSend(mainMenu, "itemAtIndex:", index);
    if (_isDocumentSaving)
    {
        CPWindowSaveImage = objj_msgSend(item, "image");
        objj_msgSend(item, "setTitle:", "Saving...");
        objj_msgSend(item, "setImage:", CPWindowSavingImage);
        objj_msgSend(item, "setEnabled:", NO);
    }
    else
    {
        objj_msgSend(item, "setTitle:", "Save");
        objj_msgSend(item, "setImage:", CPWindowSaveImage);
        objj_msgSend(item, "setEnabled:", YES);
    }
}
});
instance_methods[68] = new objj_method(sel_registerName("performClose:"), function $CPWindow__performClose_(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_registerName("windowShouldClose:")) && !objj_msgSend(_delegate, "windowShouldClose:", self) ||
        objj_msgSend(self, "respondsToSelector:", sel_registerName("windowShouldClose:")) && !objj_msgSend(self, "windowShouldClose:", self))
        return;
    objj_msgSend(self, "close");
}
});
instance_methods[69] = new objj_method(sel_registerName("close"), function $CPWindow__close(self, _cmd)
{ with(self)
{
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillCloseNotification, self);
   objj_msgSend(self, "orderOut:", nil);
}
});
instance_methods[70] = new objj_method(sel_registerName("isMainWindow"), function $CPWindow__isMainWindow(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "mainWindow") == self;
}
});
instance_methods[71] = new objj_method(sel_registerName("canBecomeMainWindow"), function $CPWindow__canBecomeMainWindow(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isVisible"))
        return YES;
    return NO;
}
});
instance_methods[72] = new objj_method(sel_registerName("makeMainWindow"), function $CPWindow__makeMainWindow(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeMainWindow"))
        return;
    objj_msgSend(CPApp._mainWindow, "resignMainWindow");
    CPApp._mainWindow = self;
    objj_msgSend(self, "becomeMainWindow");
}
});
instance_methods[73] = new objj_method(sel_registerName("becomeMainWindow"), function $CPWindow__becomeMainWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidBecomeMainNotification, self);
}
});
instance_methods[74] = new objj_method(sel_registerName("resignMainWindow"), function $CPWindow__resignMainWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResignMainNotification, self);
}
});
instance_methods[75] = new objj_method(sel_registerName("toolbar"), function $CPWindow__toolbar(self, _cmd)
{ with(self)
{
    return _toolbar;
}
});
instance_methods[76] = new objj_method(sel_registerName("setToolbar:"), function $CPWindow__setToolbar_(self, _cmd, aToolbar)
{ with(self)
{
    if (_toolbar == aToolbar)
        return;
    if (_toolbar)
    {
        objj_msgSend(self, "_setToolbarVisible:", NO);
        _toolbar._window = nil;
        _toolbarView = nil;
    }
    if (_toolbar = aToolbar)
    {
        _toolbar = aToolbar;
        _toolbar._window = self;
        if (objj_msgSend(_toolbar, "isVisible"))
            objj_msgSend(self, "_setToolbarVisible:", YES);
        objj_msgSend(_toolbar, "_reloadToolbarItems");
    }
}
});
instance_methods[77] = new objj_method(sel_registerName("_setToolbarVisible:"), function $CPWindow___setToolbarVisible_(self, _cmd, aFlag)
{ with(self)
{
    if (aFlag)
    {
        if (!_toolbarView)
            _toolbarView = objj_msgSend(_toolbar, "_toolbarView");
        objj_msgSend(_toolbarView, "setFrame:", CGRectMake(0.0,0.0,CGRectGetWidth(objj_msgSend(_windowView, "bounds")),CGRectGetHeight(objj_msgSend(_toolbarView, "frame"))));
        objj_msgSend(_windowView, "addSubview:", _toolbarView);
    }
    else
        objj_msgSend(_toolbarView, "removeFromSuperview");
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRectForFrameRect:", objj_msgSend(_windowView, "bounds")));
}
});
instance_methods[78] = new objj_method(sel_registerName("_setAttachedSheetFrameOrigin"), function $CPWindow___setAttachedSheetFrameOrigin(self, _cmd)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "contentView"), "frame"),
        sheetFrame = CGRectMakeCopy(objj_msgSend(_attachedSheet, "frame"));
   sheetFrame.origin.y = CGRectGetMinY(_frame) + CGRectGetMinY(contentRect);
   sheetFrame.origin.x = CGRectGetMinX(_frame) + FLOOR((CGRectGetWidth(_frame) - CGRectGetWidth(sheetFrame)) / 2.0);
   objj_msgSend(_attachedSheet, "setFrameOrigin:", sheetFrame.origin);
}
});
instance_methods[79] = new objj_method(sel_registerName("_animateAttachedSheet"), function $CPWindow___animateAttachedSheet(self, _cmd)
{ with(self)
{}
});
instance_methods[80] = new objj_method(sel_registerName("_attachSheet:modalDelegate:didEndSelector:contextInfo:"), function $CPWindow___attachSheet_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    _attachedSheet = aSheet;
    aSheet._isSheet = YES;
    objj_msgSend(self, "_setAttachedSheetFrameOrigin");
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowAbove, aSheet, self);
}
});
instance_methods[81] = new objj_method(sel_registerName("attachedSheet"), function $CPWindow__attachedSheet(self, _cmd)
{ with(self)
{
    return _attachedSheet;
}
});
instance_methods[82] = new objj_method(sel_registerName("isSheet"), function $CPWindow__isSheet(self, _cmd)
{ with(self)
{
    return _isSheet;
}
});
instance_methods[83] = new objj_method(sel_registerName("becomesKeyOnlyIfNeeded"), function $CPWindow__becomesKeyOnlyIfNeeded(self, _cmd)
{ with(self)
{
    return NO;
}
});
instance_methods[84] = new objj_method(sel_registerName("worksWhenModal"), function $CPWindow__worksWhenModal(self, _cmd)
{ with(self)
{
    return NO;
}
});
class_addMethods(the_class, instance_methods);
class_addMethods(meta_class, class_methods);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("_synchronizeMenuBarTitleWithWindowTitle"), function $CPWindow___synchronizeMenuBarTitleWithWindowTitle(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_windowController, "document") || !objj_msgSend(self, "isMainWindow"))
        return;
    objj_msgSend(CPMenu, "setMenuBarTitle:", _title);
}
});
class_addMethods(the_class, instance_methods);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("setBridge:"), function $CPWindow__setBridge_(self, _cmd, aBridge)
{ with(self)
{
    if (_bridge == aBridge)
        return;
    if (_bridge)
    {
        objj_msgSend(self, "orderOut:", self);
    }
    _bridge = aBridge;
    if (_styleMask & CPBorderlessBridgeWindowMask)
        objj_msgSend(self, "setFrame:", objj_msgSend(aBridge, "contentBounds"));
}
});
instance_methods[1] = new objj_method(sel_registerName("resizeWithOldBridgeSize:"), function $CPWindow__resizeWithOldBridgeSize_(self, _cmd, aSize)
{ with(self)
{
    if (_styleMask & CPBorderlessBridgeWindowMask)
        return objj_msgSend(self, "setFrame:", objj_msgSend(_bridge, "visibleFrame"));
    if (_autoresizingMask == CPWindowNotSizable)
        return;
    var frame = objj_msgSend(_bridge, "contentBounds"),
        newFrame = CGRectMakeCopy(_frame),
        dX = (CGRectGetWidth(frame) - aSize.width) /
            (((_autoresizingMask & CPWindowMinXMargin) ? 1 : 0) + (_autoresizingMask & CPWindowWidthSizable ? 1 : 0) + (_autoresizingMask & CPWindowMaxXMargin ? 1 : 0)),
        dY = (CGRectGetHeight(frame) - aSize.height) /
            ((_autoresizingMask & CPWindowMinYMargin ? 1 : 0) + (_autoresizingMask & CPWindowHeightSizable ? 1 : 0) + (_autoresizingMask & CPWindowMaxYMargin ? 1 : 0));
    if (_autoresizingMask & CPWindowMinXMargin)
        newFrame.origin.x += dX;
    if (_autoresizingMask & CPWindowWidthSizable)
        newFrame.size.width += dX;
    if (_autoresizingMask & CPWindowMinYMargin)
        newFrame.origin.y += dY;
    if (_autoresizingMask & CPWindowHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "setFrame:", newFrame);
}
});
instance_methods[2] = new objj_method(sel_registerName("setAutoresizingMask:"), function $CPWindow__setAutoresizingMask_(self, _cmd, anAutoresizingMask)
{ with(self)
{
    _autoresizingMask = anAutoresizingMask;
}
});
instance_methods[3] = new objj_method(sel_registerName("autoresizingMask"), function $CPWindow__autoresizingMask(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
});
instance_methods[4] = new objj_method(sel_registerName("convertBaseToBridge:"), function $CPWindow__convertBaseToBridge_(self, _cmd, aPoint)
{ with(self)
{
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x + origin.x, aPoint.y + origin.y);
}
});
instance_methods[5] = new objj_method(sel_registerName("convertBridgeToBase:"), function $CPWindow__convertBridgeToBase_(self, _cmd, aPoint)
{ with(self)
{
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x - origin.x, aPoint.y - origin.y);
}
});
instance_methods[6] = new objj_method(sel_registerName("undoManager"), function $CPWindow__undoManager(self, _cmd)
{ with(self)
{
    if (_delegateRespondsToWindowWillReturnUndoManagerSelector)
        return objj_msgSend(_delegate, "windowWillReturnUndoManager:", self);
    if (!_undoManager)
        _undoManager = objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init");
    return _undoManager;
}
});
instance_methods[7] = new objj_method(sel_registerName("undo:"), function $CPWindow__undo_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "undo");
}
});
instance_methods[8] = new objj_method(sel_registerName("redo:"), function $CPWindow__redo_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "redo");
}
});
class_addMethods(the_class, instance_methods);
}
var interpolate = function(fromValue, toValue, progress)
{
    return fromValue + (toValue - fromValue) * progress;
}
{var the_class = objj_allocateClassPair(CPAnimation, "_CPWindowFrameAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_startFrame"), new objj_ivar("_targetFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithWindow:targetFrame:"), function $_CPWindowFrameAnimation__initWithWindow_targetFrame_(self, _cmd, aWindow, aTargetFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "initWithDuration:animationCurve:", 0.2, CPAnimationLinear);
    if (self)
    {
        _window = aWindow;
        _targetFrame = CGRectMakeCopy(aTargetFrame);
        _startFrame = CGRectMakeCopy(objj_msgSend(_window, "frame"));
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("startAnimation"), function $_CPWindowFrameAnimation__startAnimation(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "startAnimation");
    _window._isAnimating = YES;
}
});
instance_methods[2] = new objj_method(sel_registerName("setCurrentProgress:"), function $_CPWindowFrameAnimation__setCurrentProgress_(self, _cmd, aProgress)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "setCurrentProgress:", aProgress);
    var value = objj_msgSend(self, "currentValue");
    if (value == 1.0)
        _window._isAnimating = NO;
    objj_msgSend(_window, "setFrameOrigin:", CGPointMake(interpolate(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),value),interpolate(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),value)));
    objj_msgSend(_window, "setFrameSize:", CGSizeMake(interpolate(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),value),interpolate(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),value)));
}
});
class_addMethods(the_class, instance_methods);
}
i;14;CPDragServer.ji;19;CPDOMWindowBridge.ji;15;_CPWindowView.ji;8;CPView.jp;20;CPWindowController.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;6910;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_owner"), new objj_ivar("_window"), new objj_ivar("_document"), new objj_ivar("_windowCibName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var instance_methods = [];
instance_methods[0] = new objj_method(sel_registerName("initWithWindow:"), function $CPWindowController__initWithWindow_(self, _cmd, aWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        objj_msgSend(self, "setWindow:", aWindow);
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
});
instance_methods[1] = new objj_method(sel_registerName("initWithWindowCibName:"), function $CPWindowController__initWithWindowCibName_(self, _cmd, aWindowCibName)
{ with(self)
{
    return objj_msgSend(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
});
instance_methods[2] = new objj_method(sel_registerName("initWithWindowCibName:owner:"), function $CPWindowController__initWithWindowCibName_owner_(self, _cmd, aWindowCibName, anOwner)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _owner = anOwner;
        _windowCibName = aWindowCibName;
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
});
instance_methods[3] = new objj_method(sel_registerName("loadWindow"), function $CPWindowController__loadWindow(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "windowWillLoad");
    objj_msgSend(self, "setWindow:", CPApp._keyWindow=objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CPRectMakeZero(), CPBorderlessBridgeWindowMask|CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
    objj_msgSend(self, "windowDidLoad");
}
});
instance_methods[4] = new objj_method(sel_registerName("showWindow:"), function $CPWindowController__showWindow_(self, _cmd, aSender)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
 if (objj_msgSend(theWindow, "respondsToSelector:", sel_registerName("becomesKeyOnlyIfNeeded")) && objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
        objj_msgSend(theWindow, "orderFront:", aSender);
    else
        objj_msgSend(theWindow, "makeKeyAndOrderFront:", aSender);
}
});
instance_methods[5] = new objj_method(sel_registerName("isWindowLoaded"), function $CPWindowController__isWindowLoaded(self, _cmd)
{ with(self)
{
    return _window;
}
});
instance_methods[6] = new objj_method(sel_registerName("window"), function $CPWindowController__window(self, _cmd)
{ with(self)
{
    if (!_window)
         objj_msgSend(self, "loadWindow");
    return _window;
}
});
instance_methods[7] = new objj_method(sel_registerName("setWindow:"), function $CPWindowController__setWindow_(self, _cmd, aWindow)
{ with(self)
{
    _window = aWindow;
    objj_msgSend(_window, "setWindowController:", self);
    objj_msgSend(_window, "setNextResponder:", self);
}
});
instance_methods[8] = new objj_method(sel_registerName("windowDidLoad"), function $CPWindowController__windowDidLoad(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerDidLoadNib:", self);
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
});
instance_methods[9] = new objj_method(sel_registerName("windowWillLoad"), function $CPWindowController__windowWillLoad(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerWillLoadNib:", self);
}
});
instance_methods[10] = new objj_method(sel_registerName("setDocument:"), function $CPWindowController__setDocument_(self, _cmd, aDocument)
{ with(self)
{
    if (_document == aDocument)
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
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("_documentWillSave:"), CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("_documentDidSave:"), CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_registerName("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, _document);
        objj_msgSend(self, "setDocumentEdited:", objj_msgSend(_document, "isDocumentEdited"));
    }
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
});
instance_methods[11] = new objj_method(sel_registerName("_documentWillSave:"), function $CPWindowController___documentWillSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", YES);
}
});
instance_methods[12] = new objj_method(sel_registerName("_documentDidSave:"), function $CPWindowController___documentDidSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
});
instance_methods[13] = new objj_method(sel_registerName("_documentDidFailToSave:"), function $CPWindowController___documentDidFailToSave_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
});
instance_methods[14] = new objj_method(sel_registerName("document"), function $CPWindowController__document(self, _cmd)
{ with(self)
{
    return _document;
}
});
instance_methods[15] = new objj_method(sel_registerName("setDocumentEdited:"), function $CPWindowController__setDocumentEdited_(self, _cmd, isEdited)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentEdited:", isEdited);
}
});
instance_methods[16] = new objj_method(sel_registerName("synchronizeWindowTitleWithDocumentName"), function $CPWindowController__synchronizeWindowTitleWithDocumentName(self, _cmd)
{ with(self)
{
    if (!_document || !_window)
        return;
    objj_msgSend(_window, "setTitle:", objj_msgSend(self, "windowTitleForDocumentDisplayName:", objj_msgSend(_document, "displayName")));
}
});
instance_methods[17] = new objj_method(sel_registerName("windowTitleForDocumentDisplayName:"), function $CPWindowController__windowTitleForDocumentDisplayName_(self, _cmd, aDisplayName)
{ with(self)
{
    return aDisplayName;
}
});
class_addMethods(the_class, instance_methods);
}

