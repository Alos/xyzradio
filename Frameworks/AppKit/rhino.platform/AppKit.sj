@STATIC;1.0;p;31;_CPBorderlessBridgeWindowView.ji;15;_CPWindowView.jc;2368;
var _CPToolbarViewBackgroundColor = nil;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPBorderlessBridgeWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarBackgroundView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds");
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", CGRectMake(0.0, objj_msgSend(self, "toolbarMaxY"), CGRectGetWidth(bounds), CGRectGetHeight(bounds) - objj_msgSend(self, "toolbarMaxY")));
    if (!objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        objj_msgSend(_toolbarBackgroundView, "removeFromSuperview");
        _toolbarBackgroundView = nil;
        return;
    }
    if (!_toolbarBackgroundView)
    {
        _toolbarBackgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_toolbarBackgroundView, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "toolbarBackgroundColor"));
        objj_msgSend(_toolbarBackgroundView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "addSubview:positioned:relativeTo:", _toolbarBackgroundView, CPWindowBelow, nil);
    }
    var frame = CGRectMakeZero();
    frame.origin = CGPointMakeCopy(objj_msgSend(self, "toolbarOffset"));
    frame.size = objj_msgSend(_toolbarView, "frame").size;
    objj_msgSend(_toolbarBackgroundView, "setFrame:", frame);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("toolbarBackgroundColor"), function(self, _cmd)
{ with(self)
{
    if (!_CPToolbarViewBackgroundColor)
        _CPToolbarViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPBorderlessBridgeWindowView, "class")), "pathForResource:", "_CPToolbarView/_CPToolbarViewBackground.png"), CGSizeMake(1.0, 59.0)));
    return _CPToolbarViewBackgroundColor;
}
})]);
}

p;25;_CPBorderlessWindowView.ji;15;_CPWindowView.jc;234;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPBorderlessWindowView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

p;17;_CPCibConnector.jI;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;4009;


var _CPCibConnectorSourceKey = "_CPCibConnectorSourceKey",
    _CPCibConnectorDestinationKey = "_CPCibConnectorDestinationKey",
    _CPCibConnectorLabelKey = "_CPCibConnectorLabelKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_source"), new objj_ivar("_destination"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("replaceObjects:"), function(self, _cmd, replacementObjects)
{ with(self)
{
    var replacement = replacementObjects[objj_msgSend(_source, "hash")];

    if (replacement !== undefined)
        _source = replacement;

    replacement = replacementObjects[objj_msgSend(_destination, "hash")];

    if (replacement !== undefined)
        _destination = replacement;
}
})]);
}

{
var the_class = objj_getClass("_CPCibConnector")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibConnector\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
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
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _source, _CPCibConnectorSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _destination, _CPCibConnectorDestinationKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, _CPCibConnectorLabelKey);
}
})]);
}

{var the_class = objj_allocateClassPair(_CPCibConnector, "_CPCibControlConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function(self, _cmd)
{ with(self)
{





    var selectorName = _label;

    if (!objj_msgSend(selectorName, "hasSuffix:", ":"))
        selectorName += ':';

    var selector = CPSelectorFromString(selectorName);

    if (!selector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] selector " + selectorName + " does not exist.");

    if (objj_msgSend(_source, "respondsToSelector:", sel_getUid("setAction:")))
        objj_msgSend(_source, sel_getUid("setAction:"), selector);

    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] " + objj_msgSend(_source, "description") + " does not respond to setAction:");

    if (objj_msgSend(_source, "respondsToSelector:", sel_getUid("setTarget:")))
        objj_msgSend(_source, sel_getUid("setTarget:"), _destination);

    else
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] " + objj_msgSend(_source, "description") + " does not respond to setTarget:");
}
})]);
}

{var the_class = objj_allocateClassPair(_CPCibConnector, "_CPCibOutletConnector"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function(self, _cmd)
{ with(self)
{




    objj_msgSend(_source, "setValue:forKey:", _destination, _label);
}
})]);
}

p;20;_CPCibCustomObject.jI;21;Foundation/CPObject.jc;1931;


var _CPCibCustomObjectClassName = "_CPCibCustomObjectClassName";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function(self, _cmd)
{ with(self)
{
    return _className;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description") + " (" + objj_msgSend(self, "customClassName") + ')';
}
})]);
}

{
var the_class = objj_getClass("_CPCibCustomObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomObjectClassName);

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomObjectClassName);
}
}), new objj_method(sel_getUid("_cibInstantiate"), function(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);

    if (!theClass)
        CPLog("Unknown class \"" + _className + "\" in cib file");

    if (theClass === objj_msgSend(CPApplication, "class"))
        return objj_msgSend(CPApplication, "sharedApplication");

    return objj_msgSend(objj_msgSend(theClass, "alloc"), "init");
}
})]);
}

p;22;_CPCibCustomResource.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;3713;
var _CPCibCustomResourceClassNameKey = "_CPCibCustomResourceClassNameKey",
    _CPCibCustomResourceResourceNameKey = "_CPCibCustomResourceResourceNameKey",
    _CPCibCustomResourcePropertiesKey = "_CPCibCustomResourcePropertiesKey";
{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomResource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className"), new objj_ivar("_resourceName"), new objj_ivar("_properties")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithClassName:resourceName:properties:"), function(self, _cmd, aClassName, aResourceName, properties)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _className = aClassName;
        _resourceName = aResourceName;
        _properties = properties;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceClassNameKey);
        _resourceName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceResourceNameKey);
        _properties = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourcePropertiesKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomResourceClassNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _resourceName, _CPCibCustomResourceResourceNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _properties, _CPCibCustomResourcePropertiesKey);
}
}), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("bundle")) &&
        (!objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("awakenCustomResources")) || objj_msgSend(aCoder, "awakenCustomResources")))
        if (_className === "CPImage")
            return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(aCoder, "bundle"), "pathForResource:", _resourceName), objj_msgSend(_properties, "objectForKey:", "size"));
    return self;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("imageResourceWithName:size:"), function(self, _cmd, aResourceName, aSize)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aSize, "size"));
}
})]);
}
{
var the_class = objj_getClass("_CPCibCustomResource")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomResource\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("filename"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", _resourceName);
}
}), new objj_method(sel_getUid("size"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_properties, "objectForKey:", "size");
}
}), new objj_method(sel_getUid("isThreePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("isNinePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
}

p;18;_CPCibCustomView.ji;8;CPView.jc;3582;
{var the_class = objj_allocateClassPair(CPView, "_CPCibCustomView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function(self, _cmd)
{ with(self)
{
    return _className;
}
})]);
}
var _CPCibCustomViewClassNameKey = "_CPCibCustomViewClassNameKey";
{
var the_class = objj_getClass("_CPCibCustomView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomViewClassNameKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomViewClassNameKey);
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, aRect)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 169.0 / 255.0, 173.0 / 255.0, 178.0 / 255.0, 1.0));
    CGContextStrokeRect(context, CGRectInset(CGRectIntegral(bounds), 0.5, 0.5));
    CGContextSetFillColor(context, objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 224.0 / 255.0, 236.0 / 255.0, 250.0 / 255.0, 1.0));
    CGContextFillRect(context, CGRectInset(bounds, 2.0, 2.0));
}
}), new objj_method(sel_getUid("_cibInstantiate"), function(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);
    if (!theClass)
    {
        CPLog("Unknown class \"" + _className + "\" in cib file, using CPView instead.");
        theClass = objj_msgSend(CPView, "class");
    }
    if (theClass === objj_msgSend(self, "class"))
    {
        _className = "CPView";
        return self;
    }
    var view = objj_msgSend(objj_msgSend(theClass, "alloc"), "initWithFrame:", objj_msgSend(self, "frame"));
    if (view)
    {
        objj_msgSend(view, "setBounds:", objj_msgSend(self, "bounds"));
        var subviews = objj_msgSend(objj_msgSend(self, "subviews"), "copy"),
            index = 0,
            count = subviews.length;
        for (; index < count; ++index)
            objj_msgSend(view, "addSubview:", subviews[index]);
        objj_msgSend(view, "setAutoresizingMask:", objj_msgSend(self, "autoresizingMask"));
        objj_msgSend(view, "setAutoresizesSubviews:", objj_msgSend(self, "autoresizesSubviews"));
        objj_msgSend(view, "setHitTests:", objj_msgSend(self, "hitTests"));
        objj_msgSend(view, "setHidden:", objj_msgSend(self, "isHidden"));
        objj_msgSend(view, "setAlphaValue:", objj_msgSend(self, "alphaValue"));
        objj_msgSend(_superview, "replaceSubview:with:", self, view);
        objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    }
    return view;
}
})]);
}

p;23;_CPCibKeyedUnarchiver.jI;30;Foundation/CPKeyedUnarchiver.jc;1350;


{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPCibKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"), function(self, _cmd, data, aBundle, shouldAwakenCustomResources)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);

    if (self)
    {
        _bundle = aBundle;
        _awakenCustomResources = shouldAwakenCustomResources;

        objj_msgSend(self, "setDelegate:", self);
    }

    return self;
}
}), new objj_method(sel_getUid("bundle"), function(self, _cmd)
{ with(self)
{
    return _bundle;
}
}), new objj_method(sel_getUid("awakenCustomResources"), function(self, _cmd)
{ with(self)
{
    return _awakenCustomResources;
}
}), new objj_method(sel_getUid("replaceObjectAtUID:withObject:"), function(self, _cmd, aUID, anObject)
{ with(self)
{
    _objects[aUID] = anObject;
}
}), new objj_method(sel_getUid("objectAtUID:"), function(self, _cmd, aUID)
{ with(self)
{
    return _objects[aUID];
}
})]);
}

p;15;_CPCibLoading.jI;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;1627;
var CPCibOwner = "CPCibOwner";
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function(self, _cmd)
{ with(self)
{
}
})]);
}
{
var the_class = objj_getClass("CPBundle")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPBundle\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function(self, _cmd, aPath, aNameTable)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfFile:", aPath), "instantiateCibWithExternalNameTable:", aNameTable);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function(self, _cmd, aPath, aNameTable)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfFile:", aPath), "instantiateCibWithExternalNameTable:", aNameTable);
}
}), new objj_method(sel_getUid("loadCibNamed:owner:"), function(self, _cmd, aName, anOwner)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class"));
    var path = objj_msgSend(bundle, "pathForResource:", aName);
    return objj_msgSend(CPBundle, "loadCibFile:externalNameTable:", aPath, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anOwner, CPCibOwner));
}
})]);
}

p;18;_CPCibObjectData.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;17;_CPCibConnector.jc;9131;
{var the_class = objj_allocateClassPair(CPObject, "_CPCibObjectData"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_namesKeys"), new objj_ivar("_namesValues"), new objj_ivar("_accessibilityConnectors"), new objj_ivar("_accessibilityOidsKeys"), new objj_ivar("_accessibilityOidsValues"), new objj_ivar("_classesKeys"), new objj_ivar("_classesValues"), new objj_ivar("_connections"), new objj_ivar("_fontManager"), new objj_ivar("_framework"), new objj_ivar("_nextOid"), new objj_ivar("_objectsKeys"), new objj_ivar("_objectsValues"), new objj_ivar("_oidKeys"), new objj_ivar("_oidValues"), new objj_ivar("_fileOwner"), new objj_ivar("_visibleWindows"), new objj_ivar("_replacementObjects")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _namesKeys = [];
        _namesValues = [];
        _classesKeys = [];
        _classesValues = [];
        _connections = [];
        _framework = "";
        _nextOid = [];
        _objectsKeys = [];
        _objectsValues = [];
        _oidKeys = [];
        _oidValues = [];
        _fileOwner = nil;
        _visibleWindows = objj_msgSend(CPSet, "set");
    }
    return self;
}
}), new objj_method(sel_getUid("mainMenu"), function(self, _cmd)
{ with(self)
{
    var index = objj_msgSend(_namesValues, "indexOfObjectIdenticalTo:", "MainMenu");
    if (index === CPNotFound)
        return nil;
    return _namesKeys[index];
}
}), new objj_method(sel_getUid("displayVisibleWindows"), function(self, _cmd)
{ with(self)
{
    var object = nil,
        objectEnumerator = objj_msgSend(_visibleWindows, "objectEnumerator");
    while (object = objj_msgSend(objectEnumerator, "nextObject"))
        objj_msgSend(_replacementObjects[objj_msgSend(object, "hash")], "makeKeyAndOrderFront:", self);
}
})]);
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
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _replacementObjects = {};
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
        _visibleWindows = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibObjectDataVisibleWindowsKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
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
    objj_msgSend(aCoder, "encodeObject:forKey:", _visibleWindows, _CPCibObjectDataVisibleWindowsKey);
}
}), new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"), function(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    var count = objj_msgSend(_objectsKeys, "count");
    while (count--)
    {
        var object = _objectsKeys[count],
            parent = _objectsValues[count],
            instantiatedObject = object;
        if (objj_msgSend(object, "respondsToSelector:", sel_getUid("_cibInstantiate")))
        {
            var instantiatedObject = objj_msgSend(object, "_cibInstantiate");
            if (instantiatedObject !== object)
            {
                _replacementObjects[objj_msgSend(object, "hash")] = instantiatedObject;
                if (objj_msgSend(instantiatedObject, "isKindOfClass:", objj_msgSend(CPView, "class")))
                {
                    var clipView = objj_msgSend(instantiatedObject, "superview");
                    if (objj_msgSend(clipView, "isKindOfClass:", objj_msgSend(CPClipView, "class")))
                    {
                        var scrollView = objj_msgSend(clipView, "superview");
                        if (objj_msgSend(scrollView, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
                            objj_msgSend(scrollView, "setDocumentView:", instantiatedObject);
                    }
                }
            }
        }
        if (topLevelObjects && parent === _fileOwner && object !== _fileOwner)
            topLevelObjects.push(instantiatedObject);
    }
}
}), new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"), function(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    _replacementObjects[objj_msgSend(_fileOwner, "hash")] = anOwner;
    var index = 0,
        count = _connections.length;
    for (; index < count; ++index)
    {
        var connection = _connections[index];
        objj_msgSend(connection, "replaceObjects:", _replacementObjects);
        objj_msgSend(connection, "establishConnection");
    }
}
}), new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"), function(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    var count = objj_msgSend(_objectsKeys, "count");
    while (count--)
    {
        var object = _objectsKeys[count],
            instantiatedObject = _replacementObjects[objj_msgSend(object, "hash")];
        if (instantiatedObject)
            object = instantiatedObject;
        if (object !== _fileOwner && objj_msgSend(object, "respondsToSelector:", sel_getUid("awakeFromCib")))
            objj_msgSend(object, "awakeFromCib");
    }
    if (objj_msgSend(anOwner, "respondsToSelector:", sel_getUid("awakeFromCib")))
        objj_msgSend(anOwner, "awakeFromCib");
}
})]);
}

p;22;_CPCibWindowTemplate.jI;21;Foundation/CPObject.jc;4791;


var _CPCibWindowTemplateMinSizeKey = "_CPCibWindowTemplateMinSizeKey",
    _CPCibWindowTemplateMaxSizeKey = "_CPCibWindowTemplateMaxSizeKey",

    _CPCibWindowTemplateViewClassKey = "_CPCibWindowTemplateViewClassKey",
    _CPCibWindowTemplateWindowClassKey = "_CPCibWindowTemplateWindowClassKey",

    _CPCibWindowTemplateWindowRectKey = "_CPCibWindowTemplateWindowRectKey",
    _CPCibWindowTemplateWindowStyleMaskKey = "_CPCibWindowTempatStyleMaskKey",
    _CPCibWindowTemplateWindowTitleKey = "_CPCibWindowTemplateWindowTitleKey",
    _CPCibWindowTemplateWindowViewKey = "_CPCibWindowTemplateWindowViewKey",

    _CPCibWindowTemplateWindowIsFullBridgeKey = "_CPCibWindowTemplateWindowIsFullBridgeKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibWindowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_viewClass"), new objj_ivar("_windowClass"), new objj_ivar("_windowRect"), new objj_ivar("_windowStyleMask"), new objj_ivar("_windowTitle"), new objj_ivar("_windowView"), new objj_ivar("_windowIsFullBridge")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        if (objj_msgSend(aCoder, "containsValueForKey:", _CPCibWindowTemplateMinSizeKey))
            _minSize = objj_msgSend(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMinSizeKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", _CPCibWindowTemplateMaxSizeKey))
            _maxSize = objj_msgSend(aCoder, "decodeSizeForKey:", _CPCibWindowTemplateMaxSizeKey);

        _viewClass = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateViewClassKey);

        _windowClass = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowClassKey);
        _windowRect = objj_msgSend(aCoder, "decodeRectForKey:", _CPCibWindowTemplateWindowRectKey);
        _windowStyleMask = objj_msgSend(aCoder, "decodeIntForKey:", _CPCibWindowTemplateWindowStyleMaskKey);

        _windowTitle = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowTitleKey);
        _windowView = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowViewKey);

        _windowIsFullBridge = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibWindowTemplateWindowIsFullBridgeKey);
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (_minSize)
        objj_msgSend(aCoder, "encodeSize:forKey:", _minSize, _CPCibWindowTemplateMinSizeKey);
    if (_maxSize)
        objj_msgSend(aCoder, "encodeSize:forKey:", _maxSize, _CPCibWindowTemplateMaxSizeKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _viewClass, _CPCibWindowTemplateViewClassKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowClass, _CPCibWindowTemplateWindowClassKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _windowRect, _CPCibWindowTemplateWindowRectKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _windowStyleMask, _CPCibWindowTemplateWindowStyleMaskKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowTitle, _CPCibWindowTemplateWindowTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _windowView, _CPCibWindowTemplateWindowViewKey);

    objj_msgSend(aCoder, "encodeObject:forKey:", _windowIsFullBridge, _CPCibWindowTemplateWindowIsFullBridgeKey);
}
}), new objj_method(sel_getUid("windowClass"), function(self, _cmd)
{ with(self)
{
    return _windowClass;
}
}), new objj_method(sel_getUid("_cibInstantiate"), function(self, _cmd)
{ with(self)
{
    var windowClass = CPClassFromString(objj_msgSend(self, "windowClass"));





    var theWindow = objj_msgSend(objj_msgSend(windowClass, "alloc"), "initWithContentRect:styleMask:", _windowRect, _windowStyleMask);

    if (_minSize)
        objj_msgSend(theWindow, "setMinSize:", _minSize);
    if (_maxSize)
        objj_msgSend(theWindow, "setMaxSize:", _maxSize);
    objj_msgSend(theWindow, "setLevel:", CPFloatingWindowLevel);


    objj_msgSend(theWindow, "setTitle:", _windowTitle);


    objj_msgSend(_windowView, "setAutoresizesSubviews:", NO);

    objj_msgSend(theWindow, "setContentView:", _windowView);

    objj_msgSend(_windowView, "setAutoresizesSubviews:", YES);

    if (objj_msgSend(_viewClass, "isKindOfClass:", objj_msgSend(CPToolbar, "class")))
    {
       objj_msgSend(theWindow, "setToolbar:", _viewClass);
    }

    objj_msgSend(theWindow, "setFullBridge:", _windowIsFullBridge);

    return theWindow;
}
})]);
}

p;18;_CPHUDWindowView.jc;8599;var _CPHUDWindowViewBackgroundColor = nil,
    CPHUDCloseButtonImage = nil;
var HUD_TITLEBAR_HEIGHT = 26.0;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPHUDWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarView"), new objj_ivar("_titleField"), new objj_ivar("_closeButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
    if (objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(self, "toolbarView"), "frame"));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
}
}), new objj_method(sel_getUid("initWithFrame:styleMask:"), function(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var bounds = objj_msgSend(self, "bounds");
        objj_msgSend(self, "setBackgroundColor:", _CPHUDWindowViewBackgroundColor);
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setHitTests:", NO);
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(_titleField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_titleField, "setTextShadowColor:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(_titleField, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setLineBreakMode:", CPLineBreakByTruncatingTail);
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_titleField, "setStringValue:", "Untitled");
        objj_msgSend(_titleField, "sizeToFit");
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setStringValue:", "");
        objj_msgSend(_titleField, "setFrame:", CGRectMake(20.0, 3.0, CGRectGetWidth(objj_msgSend(self, "bounds")) - 40.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));
        objj_msgSend(self, "addSubview:", _titleField);
        if (_styleMask & CPClosableWindowMask)
        {
            var closeSize = objj_msgSend(_CPHUDWindowViewCloseImage, "size");
            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(4.0, 4.0, closeSize.width, closeSize.height));
            objj_msgSend(_closeButton, "setBordered:", NO);
            objj_msgSend(_closeButton, "setImage:", _CPHUDWindowViewCloseImage);
            objj_msgSend(_closeButton, "setAlternateImage:", _CPHUDWindowViewCloseActiveImage);
            objj_msgSend(self, "addSubview:", _closeButton);
        }
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(5.0, 5.0));
    }
    return self;
}
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_closeButton, "setAction:", sel_getUid("performClose:"));
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
}
}), new objj_method(sel_getUid("toolbarView"), function(self, _cmd)
{ with(self)
{
    return _toolbarView;
}
}), new objj_method(sel_getUid("toolbarLabelColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "whiteColor");
}
}), new objj_method(sel_getUid("toolbarOffset"), function(self, _cmd)
{ with(self)
{
    return CGSizeMake(0.0, HUD_TITLEBAR_HEIGHT);
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    objj_msgSend(_titleField, "setFrame:", CGRectMake(20.0, 3.0, width - 40.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));
    var maxY = objj_msgSend(self, "toolbarMaxY");
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrameOrigin:", CGPointMake(0.0, maxY, width, CGRectGetHeight(bounds) - maxY));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPHUDWindowView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPHUDWindowViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground0.png"), CPSizeMake(6.0, 78.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground1.png"), CPSizeMake(1.0, 78.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground2.png"), CPSizeMake(6.0, 78.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground3.png"), CPSizeMake(6.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground4.png"), CPSizeMake(1.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground5.png"), CPSizeMake(6.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground6.png"), CPSizeMake(6.0, 6.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground7.png"), CPSizeMake(6.0, 6.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/HUD/CPWindowHUDBackground8.png"), CPSizeMake(6.0, 6.0))
        ]));
    _CPHUDWindowViewCloseImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowClose.png"), CPSizeMake(20.0, 20.0));
    _CPHUDWindowViewCloseActiveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "HUDTheme/WindowCloseActive.png"), CPSizeMake(20.0, 20.0));
}
}), new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = CGRectMakeCopy(aFrameRect),
        titleBarHeight = HUD_TITLEBAR_HEIGHT;
    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;
    return contentRect;
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = HUD_TITLEBAR_HEIGHT;
    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;
    return frameRect;
}
})]);
}

p;21;_CPImageAndTextView.jI;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;10378;
CPTopVerticalTextAlignment = 1,
CPCenterVerticalTextAlignment = 2,
CPBottomVerticalTextAlignment = 3;
var _CPimageAndTextViewFrameSizeChangedFlag = 1 << 0,
    _CPImageAndTextViewImageChangedFlag = 1 << 1,
    _CPImageAndTextViewTextChangedFlag = 1 << 2,
    _CPImageAndTextViewAlignmentChangedFlag = 1 << 3,
    _CPImageAndTextViewVerticalAlignmentChangedFlag = 1 << 4,
    _CPImageAndTextViewLineBreakModeChangedFlag = 1 << 5,
    _CPImageAndTextViewTextColorChangedFlag = 1 << 6,
    _CPImageAndTextViewFontChangedFlag = 1 << 7,
    _CPImageAndTextViewTextShadowColorChangedFlag = 1 << 8,
    _CPImageAndTextViewImagePositionChangedFlag = 1 << 9,
    _CPImageAndTextViewImageScalingChangedFlag = 1 << 10;
var HORIZONTAL_MARGIN = 3.0,
    VERTICAL_MARGIN = 5.0;
{var the_class = objj_allocateClassPair(CPView, "_CPImageAndTextView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alignment"), new objj_ivar("_verticalAlignment"), new objj_ivar("_lineBreakMode"), new objj_ivar("_textColor"), new objj_ivar("_font"), new objj_ivar("_textShadowColor"), new objj_ivar("_textShadowOffset"), new objj_ivar("_imagePosition"), new objj_ivar("_imageScaling"), new objj_ivar("_image"), new objj_ivar("_text"), new objj_ivar("_textSize"), new objj_ivar("_flags")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:control:"), function(self, _cmd, aFrame, aControl)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _textShadowOffset = { width:0.0, height:0.0 };
        objj_msgSend(self, "setVerticalAlignment:", CPTopVerticalTextAlignment);
        if (aControl)
        {
            objj_msgSend(self, "setLineBreakMode:", objj_msgSend(aControl, "lineBreakMode"));
            objj_msgSend(self, "setTextColor:", objj_msgSend(aControl, "textColor"));
            objj_msgSend(self, "setAlignment:", objj_msgSend(aControl, "alignment"));
            objj_msgSend(self, "setVerticalAlignment:", objj_msgSend(aControl, "verticalAlignment"));
            objj_msgSend(self, "setFont:", objj_msgSend(aControl, "font"));
            objj_msgSend(self, "setImagePosition:", objj_msgSend(aControl, "imagePosition"));
            objj_msgSend(self, "setImageScaling:", objj_msgSend(aControl, "imageScaling"));
        }
        else
        {
            objj_msgSend(self, "setLineBreakMode:", CPLineBreakByClipping);
            objj_msgSend(self, "setAlignment:", CPCenterTextAlignment);
            objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
            objj_msgSend(self, "setImagePosition:", CPNoImage);
            objj_msgSend(self, "setImageScaling:", CPScaleNone);
        }
        _textSize = NULL;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:control:", aFrame, nil);
}
}), new objj_method(sel_getUid("setAlignment:"), function(self, _cmd, anAlignment)
{ with(self)
{
    if (_alignment === anAlignment)
        return;
    _alignment = anAlignment;
}
}), new objj_method(sel_getUid("alignment"), function(self, _cmd)
{ with(self)
{
    return _alignment;
}
}), new objj_method(sel_getUid("setVerticalAlignment:"), function(self, _cmd, anAlignment)
{ with(self)
{
    if (_verticalAlignment === anAlignment)
        return;
    _verticalAlignment = anAlignment;
    _flags |= _CPImageAndTextViewVerticalAlignmentChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("verticalAlignment"), function(self, _cmd)
{ with(self)
{
    return _verticalAlignment;
}
}), new objj_method(sel_getUid("setLineBreakMode:"), function(self, _cmd, aLineBreakMode)
{ with(self)
{
    if (_lineBreakMode === aLineBreakMode)
        return;
    _lineBreakMode = aLineBreakMode;
    _flags |= _CPImageAndTextViewLineBreakModeChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("lineBreakMode"), function(self, _cmd)
{ with(self)
{
    return _lineBreakMode;
}
}), new objj_method(sel_getUid("setImagePosition:"), function(self, _cmd, anImagePosition)
{ with(self)
{
    if (_imagePosition == anImagePosition)
        return;
    _imagePosition = anImagePosition;
    _flags |= _CPImageAndTextViewImagePositionChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("imagePosition"), function(self, _cmd)
{ with(self)
{
    return _imagePosition;
}
}), new objj_method(sel_getUid("setImageScaling:"), function(self, _cmd, anImageScaling)
{ with(self)
{
    if (_imageScaling == anImageScaling)
        return;
    _imageScaling = anImageScaling;
    _flags |= _CPImageAndTextViewImageScalingChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("imageScaling"), function(self, _cmd)
{ with(self)
{
    return _imageScaling;
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aTextColor)
{ with(self)
{
    if (_textColor === aTextColor)
        return;
    _textColor = aTextColor;
}
}), new objj_method(sel_getUid("textColor"), function(self, _cmd)
{ with(self)
{
    return _textColor;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    if (_font === aFont)
        return;
    _font = aFont;
    _flags |= _CPImageAndTextViewFontChangedFlag;
    _textSize = NULL;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("font"), function(self, _cmd)
{ with(self)
{
    return _font;
}
}), new objj_method(sel_getUid("setTextShadowColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textShadowColor === aColor)
        return;
    _textShadowColor = aColor;
    _flags |= _CPImageAndTextViewTextShadowColorChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("textShadowColor"), function(self, _cmd)
{ with(self)
{
    return _textShadowColor;
}
}), new objj_method(sel_getUid("setTextShadowOffset:"), function(self, _cmd, anOffset)
{ with(self)
{
    if ((_textShadowOffset.width == anOffset.width && _textShadowOffset.height == anOffset.height))
        return;
    _textShadowOffset = { width:anOffset.width, height:anOffset.height };
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("textShadowOffset"), function(self, _cmd)
{ with(self)
{
    return _textShadowOffset;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    _flags |= _CPImageAndTextViewImageChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return _image;
}
}), new objj_method(sel_getUid("setText:"), function(self, _cmd, text)
{ with(self)
{
    if (_text === text)
        return;
    _text = text;
    _flags |= _CPImageAndTextViewTextChangedFlag;
    _textSize = NULL;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("text"), function(self, _cmd)
{ with(self)
{
    return _text;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "bounds").size,
        textRect = { origin: { x:0.0, y:0.0 }, size: { width:size.width, height:size.height } };
    if (hasDOMImageElement)
    {
        if (!imageStyle)
            var imageStyle = _DOMImageElement.style;
        if (_flags & _CPImageAndTextViewImageChangedFlag)
            _DOMImageElement.src = objj_msgSend(_image, "filename");
        var centerX = size.width / 2.0,
            centerY = size.height / 2.0,
            imageSize = objj_msgSend(_image, "size"),
            imageWidth = imageSize.width,
            imageHeight = imageSize.height;
        if (_imageScaling === CPScaleToFit)
        {
            imageWidth = size.width;
            imageHeight = size.height;
        }
        else if (_imageScaling === CPScaleProportionally)
        {
            var scale = MIN(MIN(size.width, imageWidth) / imageWidth, MIN(size.height, imageHeight) / imageHeight);
            imageWidth *= scale;
            imageHeight *= scale;
        }
        if (_imagePosition === CPImageBelow)
        {
            textRect.size.height = size.height - imageHeight - VERTICAL_MARGIN;
        }
        else if (_imagePosition === CPImageAbove)
        {
            textRect.origin.y += imageHeight + VERTICAL_MARGIN;
            textRect.size.height = size.height - imageHeight - VERTICAL_MARGIN;
        }
        else if (_imagePosition === CPImageLeft)
        {
            textRect.origin.x = imageWidth + HORIZONTAL_MARGIN;
            textRect.size.width -= imageWidth + HORIZONTAL_MARGIN;
        }
        else if (_imagePosition === CPImageRight)
        {
            textRect.size.width -= imageWidth + HORIZONTAL_MARGIN;
        }
        else if (_imagePosition === CPImageOnly)
        {
        }
    }
    _flags = 0;
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    var size = CGSizeMakeZero();
    if ((_imagePosition !== CPNoImage) && _image)
    {
        var imageSize = objj_msgSend(_image, "size");
        size.width += imageSize.width;
        size.height += imageSize.height;
    }
    if ((_imagePosition !== CPImageOnly) && objj_msgSend(_text, "length") > 0)
    {
        if (!_textSize)
            _textSize = objj_msgSend(_text, "sizeWithFont:", _font ? _font : objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        if (_imagePosition === CPImageLeft || _imagePosition === CPImageRight)
        {
            size.width += _textSize.width + HORIZONTAL_MARGIN;
            size.height = MAX(size.height, _textSize.height);
        }
        else if (_imagePosition === CPImageAbove || _imagePosition === CPImageBelow)
        {
            size.width = MAX(size.width, _textSize.width);
            size.height += _textSize.height + VERTICAL_MARGIN;
        }
        else
        {
            size.width = MAX(size.width, _textSize.width);
            size.height = MAX(size.height, _textSize.height);
        }
    }
    objj_msgSend(self, "setFrameSize:", size);
}
})]);
}

p;23;_CPStandardWindowView.ji;15;_CPWindowView.jc;13290;
var GRADIENT_HEIGHT = 41.0;
var _CPTexturedWindowHeadGradientColor = nil,
    _CPTexturedWindowHeadSolidColor = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPTexturedWindowHeadView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_gradientView"), new objj_ivar("_solidView"), new objj_ivar("_dividerView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");
        _gradientView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), GRADIENT_HEIGHT));
        objj_msgSend(_gradientView, "setBackgroundColor:", objj_msgSend(theClass, "gradientColor"));
        objj_msgSend(self, "addSubview:", _gradientView);
        _solidView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, GRADIENT_HEIGHT, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - GRADIENT_HEIGHT));
        objj_msgSend(_solidView, "setBackgroundColor:", objj_msgSend(theClass, "solidColor"));
        objj_msgSend(self, "addSubview:", _solidView);
    }
    return self;
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    objj_msgSend(_gradientView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), GRADIENT_HEIGHT));
    objj_msgSend(_solidView, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds) - GRADIENT_HEIGHT));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("gradientColor"), function(self, _cmd)
{ with(self)
{
    if (!_CPTexturedWindowHeadGradientColor)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPWindowView, "class"));
        _CPTexturedWindowHeadGradientColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
            [
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop0.png"), CGSizeMake(6.0, 41.0)),
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop1.png"), CGSizeMake(1.0, 41.0)),
                objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardTop2.png"), CGSizeMake(6.0, 41.0))
            ], NO
        ));
    }
    return _CPTexturedWindowHeadGradientColor;
}
}), new objj_method(sel_getUid("solidColor"), function(self, _cmd)
{ with(self)
{
    if (!_CPTexturedWindowHeadSolidColor)
        _CPTexturedWindowHeadSolidColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 182.0 / 255.0, 182.0 / 255.0, 182.0 / 255.0, 1.0);
    return _CPTexturedWindowHeadSolidColor;
}
})]);
}
var _CPStandardWindowViewBodyBackgroundColor = nil,
    _CPStandardWindowViewDividerBackgroundColor = nil,
    _CPStandardWindowViewTitleBackgroundColor = nil,
    _CPStandardWindowViewCloseButtonImage = nil,
    _CPStandardWindowViewCloseButtonHighlightedImage = nil;
var STANDARD_GRADIENT_HEIGHT = 41.0;
    STANDARD_TITLEBAR_HEIGHT = 25.0;
{var the_class = objj_allocateClassPair(_CPWindowView, "_CPStandardWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_headView"), new objj_ivar("_dividerView"), new objj_ivar("_bodyView"), new objj_ivar("_toolbarView"), new objj_ivar("_titleField"), new objj_ivar("_closeButton")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");
    if (objj_msgSend(theToolbar, "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));
        contentRect.origin.y += toolbarHeight;
        contentRect.size.height -= toolbarHeight;
    }
    return contentRect;
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect),
        theToolbar = objj_msgSend(objj_msgSend(self, "window"), "toolbar");
    if (objj_msgSend(theToolbar, "isVisible"))
    {
        toolbarHeight = CGRectGetHeight(objj_msgSend(objj_msgSend(theToolbar, "_toolbarView"), "frame"));
        frameRect.origin.y -= toolbarHeight;
        frameRect.size.height += toolbarHeight;
    }
    return frameRect;
}
}), new objj_method(sel_getUid("initWithFrame:styleMask:"), function(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "initWithFrame:styleMask:", aFrame, aStyleMask);
    if (self)
    {
        var theClass = objj_msgSend(self, "class"),
            bounds = objj_msgSend(self, "bounds");
        _headView = objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight")));
        objj_msgSend(_headView, "setAutoresizingMask:", CPViewWidthSizable);;
        objj_msgSend(_headView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", _headView);
        _dividerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, CGRectGetMaxY(objj_msgSend(_headView, "frame")), CGRectGetWidth(bounds), 1.0));
        objj_msgSend(_dividerView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_dividerView, "setBackgroundColor:", objj_msgSend(theClass, "dividerBackgroundColor"));
        objj_msgSend(_dividerView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", _dividerView);
        var y = CGRectGetMaxY(objj_msgSend(_dividerView, "frame"));
        _bodyView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, y, CGRectGetWidth(bounds), CGRectGetHeight(bounds) - y));
        objj_msgSend(_bodyView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(_bodyView, "setBackgroundColor:", objj_msgSend(theClass, "bodyBackgroundColor"));
        objj_msgSend(_bodyView, "setHitTests:", NO);
        objj_msgSend(self, "addSubview:", _bodyView);
        objj_msgSend(self, "setResizeIndicatorOffset:", CGSizeMake(2.0, 2.0));
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setLineBreakMode:", CPLineBreakByTruncatingTail);
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_titleField, "setTextShadowColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_titleField, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(_titleField, "setStringValue:", "Untitled");
        objj_msgSend(_titleField, "sizeToFit");
        objj_msgSend(_titleField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_titleField, "setStringValue:", "");
        objj_msgSend(self, "addSubview:", _titleField);
        if (_styleMask & CPClosableWindowMask)
        {
            if (!_CPStandardWindowViewCloseButtonImage)
            {
                var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
                _CPStandardWindowViewCloseButtonImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButton.png"), CGSizeMake(16.0, 16.0));
                _CPStandardWindowViewCloseButtonHighlightedImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"), CGSizeMake(16.0, 16.0));
            }
            _closeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(8.0, 7.0, 16.0, 16.0));
            objj_msgSend(_closeButton, "setBordered:", NO);
            objj_msgSend(_closeButton, "setImage:", _CPStandardWindowViewCloseButtonImage);
            objj_msgSend(_closeButton, "setAlternateImage:", _CPStandardWindowViewCloseButtonHighlightedImage);
            objj_msgSend(self, "addSubview:", _closeButton);
        }
        objj_msgSend(self, "tile");
    }
    return self;
}
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_closeButton, "setTarget:", objj_msgSend(self, "window"));
    objj_msgSend(_closeButton, "setAction:", sel_getUid("performClose:"));
}
}), new objj_method(sel_getUid("toolbarOffset"), function(self, _cmd)
{ with(self)
{
    return CGSizeMake(0.0, objj_msgSend(objj_msgSend(self, "class"), "titleBarHeight"));
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    objj_msgSend(_headView, "setFrameSize:", CGSizeMake(width, objj_msgSend(self, "toolbarMaxY")));
    objj_msgSend(_dividerView, "setFrame:", CGRectMake(0.0, CGRectGetMaxY(objj_msgSend(_headView, "frame")), width, 1.0));
    var dividerMaxY = CGRectGetMaxY(objj_msgSend(_dividerView, "frame"));
    objj_msgSend(_bodyView, "setFrame:", CGRectMake(0.0, dividerMaxY, width, CGRectGetHeight(bounds) - dividerMaxY));
    objj_msgSend(_titleField, "setFrame:", CGRectMake(10.0, 3.0, width - 20.0, CGRectGetHeight(objj_msgSend(_titleField, "frame"))));
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrameOrigin:", CGPointMake(0.0, CGRectGetMaxY(objj_msgSend(_dividerView, "frame"))));
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (CGRectContainsPoint(objj_msgSend(_headView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
        return objj_msgSend(self, "trackMoveWithEvent:", anEvent);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPWindowView") }, "mouseDown:", anEvent);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("bodyBackgroundColor"), function(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewBodyBackgroundColor)
        _CPStandardWindowViewBodyBackgroundColor = objj_msgSend(CPColor, "whiteColor");
    return _CPStandardWindowViewBodyBackgroundColor;
}
}), new objj_method(sel_getUid("dividerBackgroundColor"), function(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewDividerBackgroundColor)
        _CPStandardWindowViewDividerBackgroundColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 125.0 / 255.0, 125.0 / 255.0, 125.0 / 255.0, 1.0);
    return _CPStandardWindowViewDividerBackgroundColor;
}
}), new objj_method(sel_getUid("titleColor"), function(self, _cmd)
{ with(self)
{
    if (!_CPStandardWindowViewTitleBackgroundColor)
        _CPStandardWindowViewTitleBackgroundColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 44.0 / 255.0, 44.0 / 255.0, 44.0 / 255.0, 1.0);
    return _CPStandardWindowViewTitleBackgroundColor;
}
}), new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    var contentRect = CGRectMakeCopy(aFrameRect),
        titleBarHeight = objj_msgSend(self, "titleBarHeight") + 1.0;
    contentRect.origin.y += titleBarHeight;
    contentRect.size.height -= titleBarHeight;
    return contentRect;
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    var frameRect = CGRectMakeCopy(aContentRect),
        titleBarHeight = objj_msgSend(self, "titleBarHeight") + 1.0;
    frameRect.origin.y -= titleBarHeight;
    frameRect.size.height += titleBarHeight;
    return frameRect;
}
}), new objj_method(sel_getUid("titleBarHeight"), function(self, _cmd)
{ with(self)
{
    return STANDARD_TITLEBAR_HEIGHT;
}
})]);
}

p;15;_CPWindowView.ji;8;CPView.ji;13;CPImageView.jc;10453;
var _CPWindowViewResizeIndicatorImage = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_styleMask"), new objj_ivar("_resizeIndicator"), new objj_ivar("_resizeIndicatorOffset"), new objj_ivar("_toolbarView"), new objj_ivar("_resizeFrame"), new objj_ivar("_mouseDraggedPoint")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
}
}), new objj_method(sel_getUid("initWithFrame:styleMask:"), function(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _styleMask = aStyleMask;
        _resizeIndicatorOffset = CGSizeMake(0.0, 0.0);
        _toolbarOffset = CGSizeMake(0.0, 0.0);
        objj_msgSend(self, "setShowsResizeIndicator:", !(_styleMask & CPBorderlessBridgeWindowMask) && (_styleMask & CPResizableWindowMask));
    }
    return self;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
}
}), new objj_method(sel_getUid("acceptsFirstMouse:"), function(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
    if ((_styleMask & CPResizableWindowMask) && _resizeIndicator)
    {
        var frame = objj_msgSend(_resizeIndicator, "frame");
        if (CGRectContainsPoint(frame, objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
            return objj_msgSend(self, "trackResizeWithEvent:", anEvent);
    }
    if (objj_msgSend(theWindow, "isMovableByWindowBackground"))
        objj_msgSend(self, "trackMoveWithEvent:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("trackResizeWithEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(anEvent, "locationInWindow"),
        type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
        return;
    var theWindow = objj_msgSend(self, "window");
    if (type === CPLeftMouseDown)
    {
        var frame = objj_msgSend(theWindow, "frame");
        _resizeFrame = CGRectMake(location.x, location.y, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
    else if (type === CPLeftMouseDragged)
        objj_msgSend(theWindow, "setFrameSize:", CGSizeMake(CGRectGetWidth(_resizeFrame) + location.x - CGRectGetMinX(_resizeFrame), CGRectGetHeight(_resizeFrame) + location.y - CGRectGetMinY(_resizeFrame)));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackResizeWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("trackMoveWithEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
        return;
    else if (type === CPLeftMouseDown)
        _mouseDraggedPoint = objj_msgSend(objj_msgSend(self, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow"));
    else if (type === CPLeftMouseDragged)
    {
        var theWindow = objj_msgSend(self, "window"),
            location = objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")),
            frame = objj_msgSend(theWindow, "frame");
        objj_msgSend(theWindow, "setFrameOrigin:", CGPointMake((frame.origin.x) + (location.x - _mouseDraggedPoint.x), (frame.origin.y) + (location.y - _mouseDraggedPoint.y)));
        _mouseDraggedPoint = location;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMoveWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("setShowsResizeIndicator:"), function(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    if (shouldShowResizeIndicator)
    {
        var size = objj_msgSend(_CPWindowViewResizeIndicatorImage, "size"),
            boundsSize = objj_msgSend(self, "frame").size;
        _resizeIndicator = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(boundsSize.width - size.width - _resizeIndicatorOffset.width, boundsSize.height - size.height - _resizeIndicatorOffset.height, size.width, size.height));
        objj_msgSend(_resizeIndicator, "setImage:", _CPWindowViewResizeIndicatorImage);
        objj_msgSend(_resizeIndicator, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(self, "addSubview:", _resizeIndicator);
    }
    else
    {
        objj_msgSend(_resizeIndicator, "removeFromSuperview");
        _resizeIndicator = nil;
    }
}
}), new objj_method(sel_getUid("showsResizeIndicator"), function(self, _cmd)
{ with(self)
{
    return _resizeIndicator !== nil;
}
}), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function(self, _cmd, anOffset)
{ with(self)
{
    if (CGSizeEqualToSize(_resizeIndicatorOffset, anOffset))
        return;
    _resizeIndicatorOffset = anOffset;
    if (!_resizeIndicator)
        return;
    var size = objj_msgSend(_resizeIndicator, "frame").size,
        boundsSize = objj_msgSend(self, "frame").size;
    objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - anOffset.width, boundsSize.height - size.height - anOffset.height));
}
}), new objj_method(sel_getUid("resizeIndicatorOffset"), function(self, _cmd)
{ with(self)
{
    return _resizeIndicatorOffset;
}
}), new objj_method(sel_getUid("windowDidChangeDocumentEdited"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("windowDidChangeDocumentSaving"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("showsToolbar"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("toolbarOffset"), function(self, _cmd)
{ with(self)
{
    return CGSizeMakeZero();
}
}), new objj_method(sel_getUid("toolbarLabelColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "blackColor");
}
}), new objj_method(sel_getUid("toolbarMaxY"), function(self, _cmd)
{ with(self)
{
    if (!_toolbarView || objj_msgSend(_toolbarView, "isHidden"))
        return objj_msgSend(self, "toolbarOffset").height;
    return CGRectGetMaxY(objj_msgSend(_toolbarView, "frame"));
}
}), new objj_method(sel_getUid("toolbarView"), function(self, _cmd)
{ with(self)
{
    return _toolbarView;
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    if (objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        var toolbarView = objj_msgSend(self, "toolbarView"),
            toolbarOffset = objj_msgSend(self, "toolbarOffset");
        objj_msgSend(toolbarView, "setFrame:", CGRectMake(toolbarOffset.width, toolbarOffset.height, width, CGRectGetHeight(objj_msgSend(toolbarView, "frame"))));
    }
    if (objj_msgSend(self, "showsResizeIndicator"))
    {
        var size = objj_msgSend(_resizeIndicator, "frame").size,
            boundsSize = objj_msgSend(self, "bounds").size;
        objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - _resizeIndicatorOffset.width, boundsSize.height - size.height - _resizeIndicatorOffset.height));
    }
}
}), new objj_method(sel_getUid("noteToolbarChanged"), function(self, _cmd)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window"),
        toolbar = objj_msgSend(theWindow, "toolbar"),
        toolbarView = objj_msgSend(toolbar, "_toolbarView");
    if (_toolbarView !== toolbarView)
    {
        objj_msgSend(_toolbarView, "removeFromSuperview");
        if (toolbarView)
        {
            objj_msgSend(toolbarView, "removeFromSuperview");
            objj_msgSend(toolbarView, "setLabelColor:", objj_msgSend(self, "toolbarLabelColor"));
            objj_msgSend(self, "addSubview:", toolbarView);
        }
        _toolbarView = toolbarView;
    }
    objj_msgSend(toolbarView, "setHidden:", !objj_msgSend(self, "showsToolbar") || !objj_msgSend(toolbar, "isVisible"));
    if (theWindow)
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(objj_msgSend(theWindow, "contentView"), "frame"), nil);
        contentRect.origin = objj_msgSend(theWindow, "convertBaseToBridge:", contentRect.origin);
        objj_msgSend(self, "setAutoresizesSubviews:", NO);
        objj_msgSend(theWindow, "setFrame:", objj_msgSend(theWindow, "frameRectForContentRect:", contentRect));
        objj_msgSend(self, "setAutoresizesSubviews:", YES);
    }
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("didAddSubview:"), function(self, _cmd, aView)
{ with(self)
{
    if (!_resizeIndicator || aView === _resizeIndicator)
        return;
    objj_msgSend(self, "addSubview:", _resizeIndicator);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPWindowView, "class"))
        return;
    _CPWindowViewResizeIndicatorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class")), "pathForResource:", "_CPWindowView/_CPWindowViewResizeIndicator.png"), CGSizeMake(12.0, 12.0));
}
}), new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    return CGRectMakeCopy(aFrameRect);
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    return CGRectMakeCopy(aContentRect);
}
})]);
}

p;8;AppKit.ji;9;CALayer.ji;9;CPAlert.ji;13;CPAnimation.ji;15;CPApplication.ji;10;CPButton.ji;13;CPButtonBar.ji;12;CPClipView.ji;18;CPCollectionView.ji;9;CPColor.ji;14;CPColorPanel.ji;13;CPColorWell.ji;17;CPCompatibility.ji;11;CPControl.ji;10;CPCookie.ji;12;CPDocument.ji;22;CPDocumentController.ji;9;CPEvent.ji;14;CPFlashMovie.ji;13;CPFlashView.ji;8;CPFont.ji;15;CPFontManager.ji;12;CPGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPMenu.ji;12;CPMenuItem.ji;9;CPPanel.ji;14;CPPasteboard.ji;15;CPPopUpButton.ji;21;CPProgressIndicator.ji;13;CPResponder.ji;14;CPScrollView.ji;12;CPScroller.ji;19;CPSecureTextField.ji;20;CPSegmentedControl.ji;10;CPShadow.ji;10;CPSlider.ji;13;CPSplitView.ji;11;CPTabView.ji;15;CPTableColumn.ji;13;CPTableView.ji;13;CPTextField.ji;11;CPToolbar.ji;15;CPToolbarItem.ji;8;CPView.ji;11;CPWebView.ji;10;CPWindow.ji;20;CPWindowController.jp;13;CAAnimation.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;4561;
{var the_class = objj_allocateClassPair(CPObject, "CAAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isRemovedOnCompletion"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _isRemovedOnCompletion = YES;
    return self;
}
}), new objj_method(sel_getUid("shouldArchiveValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setRemovedOnCompletion:"), function(self, _cmd, isRemovedOnCompletion)
{ with(self)
{
    _isRemovedOnCompletion = isRemovedOnCompletion;
}
}), new objj_method(sel_getUid("removedOnCompletion"), function(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
}), new objj_method(sel_getUid("isRemovedOnCompletion"), function(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
}), new objj_method(sel_getUid("timingFunction"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("runActionForKey:object:arguments:"), function(self, _cmd, aKey, anObject, arguments)
{ with(self)
{
    objj_msgSend(anObject, "addAnimation:forKey:", self, aKey);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animation"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("defaultValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return nil;
}
})]);
}
{var the_class = objj_allocateClassPair(CAAnimation, "CAPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_isCumulative"), new objj_ivar("_isAdditive")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    _keyPath = aKeyPath;
}
}), new objj_method(sel_getUid("keyPath"), function(self, _cmd)
{ with(self)
{
    return _keyPath;
}
}), new objj_method(sel_getUid("setCumulative:"), function(self, _cmd, isCumulative)
{ with(self)
{
    _isCumulative = isCumulative;
}
}), new objj_method(sel_getUid("cumulative"), function(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
}), new objj_method(sel_getUid("isCumulative"), function(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
}), new objj_method(sel_getUid("setAdditive:"), function(self, _cmd, isAdditive)
{ with(self)
{
    _isAdditive = isAdditive;
}
}), new objj_method(sel_getUid("additive"), function(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
}), new objj_method(sel_getUid("isAdditive"), function(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animationWithKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    var animation = objj_msgSend(self, "animation");
    objj_msgSend(animation, "setKeypath:", aKeyPath);
    return animation;
}
})]);
}
{var the_class = objj_allocateClassPair(CAPropertyAnimation, "CABasicAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fromValue"), new objj_ivar("_toValue"), new objj_ivar("_byValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFromValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _fromValue = aValue;
}
}), new objj_method(sel_getUid("fromValue"), function(self, _cmd)
{ with(self)
{
    return _fromValue;
}
}), new objj_method(sel_getUid("setToValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _toValue = aValue;
}
}), new objj_method(sel_getUid("toValue"), function(self, _cmd)
{ with(self)
{
    return _toValue;
}
}), new objj_method(sel_getUid("setByValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _byValue = aValue;
}
}), new objj_method(sel_getUid("byValue"), function(self, _cmd)
{ with(self)
{
    return _byValue;
}
})]);
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

p;14;CAFlashLayer.ji;9;CALayer.ji;14;CPFlashMovie.jc;1052;
{var the_class = objj_allocateClassPair(CALayer, "CAFlashLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFlashMovie:"), function(self, _cmd, aFlashMovie)
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
}), new objj_method(sel_getUid("flashMovie"), function(self, _cmd)
{ with(self)
{
    return _flashMovie;
}
})]);
}

p;9;CALayer.jI;21;Foundation/CPObject.jI;23;AppKit/CABackingStore.jI;18;AppKit/CGContext.jI;19;AppKit/CGGeometry.ji;12;CGGeometry.jc;34948;
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
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
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
}), new objj_method(sel_getUid("setBounds:"), function(self, _cmd, aBounds)
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
}), new objj_method(sel_getUid("bounds"), function(self, _cmd)
{ with(self)
{
    return _bounds;
}
}), new objj_method(sel_getUid("setPosition:"), function(self, _cmd, aPosition)
{ with(self)
{
    if (CGPointEqualToPoint(_position, aPosition))
        return;
    _position = { x:aPosition.x, y:aPosition.y };
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask);
}
}), new objj_method(sel_getUid("position"), function(self, _cmd)
{ with(self)
{
    return _position;
}
}), new objj_method(sel_getUid("setZPosition:"), function(self, _cmd, aZPosition)
{ with(self)
{
    if (_zPosition == aZPosition)
        return;
    _zPosition = aZPosition;
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerZPositionUpdateMask);
}
}), new objj_method(sel_getUid("setAnchorPoint:"), function(self, _cmd, anAnchorPoint)
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
}), new objj_method(sel_getUid("anchorPoint"), function(self, _cmd)
{ with(self)
{
    return _anchorPoint;
}
}), new objj_method(sel_getUid("setAffineTransform:"), function(self, _cmd, anAffineTransform)
{ with(self)
{
    if (CGAffineTransformEqualToTransform(_affineTransform, anAffineTransform))
        return;
    _affineTransform = { a:anAffineTransform.a, b:anAffineTransform.b, c:anAffineTransform.c, d:anAffineTransform.d, tx:anAffineTransform.tx, ty:anAffineTransform.ty };
    _CALayerRecalculateGeometry(self, CALayerGeometryAffineTransformMask);
}
}), new objj_method(sel_getUid("affineTransform"), function(self, _cmd)
{ with(self)
{
    return _affineTransform;
}
}), new objj_method(sel_getUid("setSublayerTransform:"), function(self, _cmd, anAffineTransform)
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
}), new objj_method(sel_getUid("sublayerTransform"), function(self, _cmd)
{ with(self)
{
    return _sublayerTransform;
}
}), new objj_method(sel_getUid("transformToLayer"), function(self, _cmd)
{ with(self)
{
    return _transformToLayer;
}
}), new objj_method(sel_getUid("setFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    alert("FIXME IMPLEMENT");
}
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    if (!_frame)
        _frame = objj_msgSend(self, "convertRect:toLayer:", _bounds, _superlayer);
    return _frame;
}
}), new objj_method(sel_getUid("backingStoreFrame"), function(self, _cmd)
{ with(self)
{
    return _backingStoreFrame;
}
}), new objj_method(sel_getUid("setBackingStoreFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("contents"), function(self, _cmd)
{ with(self)
{
    return _contents;
}
}), new objj_method(sel_getUid("setContents:"), function(self, _cmd, contents)
{ with(self)
{
    if (_contents == contents)
        return;
    _contents = contents;
    objj_msgSend(self, "composite");
}
}), new objj_method(sel_getUid("composite"), function(self, _cmd)
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
}), new objj_method(sel_getUid("display"), function(self, _cmd)
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
}), new objj_method(sel_getUid("drawInContext:"), function(self, _cmd, aContext)
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
}), new objj_method(sel_getUid("opacity"), function(self, _cmd)
{ with(self)
{
    return _opacity;
}
}), new objj_method(sel_getUid("setOpacity:"), function(self, _cmd, anOpacity)
{ with(self)
{
    if (_opacity == anOpacity)
        return;
    _opacity = anOpacity;
    _DOMElement.style.opacity = anOpacity;
    _DOMElement.style.filter = "alpha(opacity=" + anOpacity * 100 + ")";
}
}), new objj_method(sel_getUid("setHidden:"), function(self, _cmd, isHidden)
{ with(self)
{
    _isHidden = isHidden;
    _DOMElement.style.display = isHidden ? "none" : "block";
}
}), new objj_method(sel_getUid("hidden"), function(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("setMasksToBounds:"), function(self, _cmd, masksToBounds)
{ with(self)
{
    if (_masksToBounds == masksToBounds)
        return;
    _masksToBounds = masksToBounds;
    _DOMElement.style.overflow = _masksToBounds ? "hidden" : "visible";
}
}), new objj_method(sel_getUid("setBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    _backgroundColor = aColor;
    objj_msgSend(self, "setNeedsDisplay");
}
}), new objj_method(sel_getUid("backgroundColor"), function(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
}), new objj_method(sel_getUid("sublayers"), function(self, _cmd)
{ with(self)
{
    return _sublayers;
}
}), new objj_method(sel_getUid("superlayer"), function(self, _cmd)
{ with(self)
{
    return _superlayer;
}
}), new objj_method(sel_getUid("addSublayer:"), function(self, _cmd, aLayer)
{ with(self)
{
    objj_msgSend(self, "insertSublayer:atIndex:", aLayer, _sublayers.length);
    return;
    if (_DOMContentsElement && aLayer._zPosition > _DOMContentsElement.style.zIndex) _DOMContentsElement.style.zIndex -= 100.0;;
    objj_msgSend(_sublayers, "addObject:", aLayer);
    _DOMElement.appendChild(aLayer._DOMElement);
}
}), new objj_method(sel_getUid("removeFromSuperlayer"), function(self, _cmd)
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
}), new objj_method(sel_getUid("insertSublayer:atIndex:"), function(self, _cmd, aLayer, anIndex)
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
        _DOMElement.insertBefore(aLayer._DOMElement, _sublayers[anIndex + 1]._DOMElement);
    aLayer._superlayer = self;
    if (self != superlayer)
        _CALayerRecalculateGeometry(aLayer, 0xFFFFFFF);
}
}), new objj_method(sel_getUid("insertSublayer:below:"), function(self, _cmd, aLayer, aSublayer)
{ with(self)
{
    var index = aSublayer ? objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer) : 0;
    objj_msgSend(self, "insertSublayer:atIndex:", aLayer, index == CPNotFound ? _sublayers.length : index);
}
}), new objj_method(sel_getUid("insertSublayer:above:"), function(self, _cmd, aLayer, aSublayer)
{ with(self)
{
    var index = aSublayer ? objj_msgSend(_sublayers, "indexOfObjectIdenticalTo:", aSublayer) : _sublayers.length;
    if (index == CPNotFound)
        objj_msgSend(CPException, "raise:reason:", "CALayerNotFoundException", "aSublayer is not a sublayer of this layer");
    objj_msgSend(_sublayers, "insertObject:atIndex:", aLayer, index == CPNotFound ? _sublayers.length : index + 1);
}
}), new objj_method(sel_getUid("replaceSublayer:with:"), function(self, _cmd, aSublayer, aLayer)
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
}), new objj_method(sel_getUid("registerRunLoopUpdateWithMask:"), function(self, _cmd, anUpdateMask)
{ with(self)
{
    if (CALayerRegisteredRunLoopUpdates == nil)
    {
        CALayerRegisteredRunLoopUpdates = {};
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("runLoopUpdateLayers"), CALayer, nil, 0, [CPDefaultRunLoopMode]);
    }
    _runLoopUpdateMask |= anUpdateMask;
    CALayerRegisteredRunLoopUpdates[objj_msgSend(self, "hash")] = self;
}
}), new objj_method(sel_getUid("setNeedsComposite"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerCompositeUpdateMask);
}
}), new objj_method(sel_getUid("setNeedsDisplay"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerRunLoopUpdateWithMask:", CALayerDisplayUpdateMask);
}
}), new objj_method(sel_getUid("setNeedsDisplayOnBoundsChange:"), function(self, _cmd, needsDisplayOnBoundsChange)
{ with(self)
{
    _needsDisplayOnBoundsChange = needsDisplayOnBoundsChange;
}
}), new objj_method(sel_getUid("needsDisplayOnBoundsChange"), function(self, _cmd)
{ with(self)
{
    return _needsDisplayOnBoundsChange;
}
}), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function(self, _cmd, aRect)
{ with(self)
{
    _dirtyRect = aRect;
    objj_msgSend(self, "display");
}
}), new objj_method(sel_getUid("convertPoint:fromLayer:"), function(self, _cmd, aPoint, aLayer)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(aLayer, self));
}
}), new objj_method(sel_getUid("convertPoint:toLayer:"), function(self, _cmd, aPoint, aLayer)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CALayerGetTransform(self, aLayer));
}
}), new objj_method(sel_getUid("convertRect:fromLayer:"), function(self, _cmd, aRect, aLayer)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(aLayer, self));
}
}), new objj_method(sel_getUid("convertRect:toLayer:"), function(self, _cmd, aRect, aLayer)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CALayerGetTransform(self, aLayer));
}
}), new objj_method(sel_getUid("containsPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    return (aPoint.x >= (_bounds.origin.x) && aPoint.y >= (_bounds.origin.y) && aPoint.x < (_bounds.origin.x + _bounds.size.width) && aPoint.y < (_bounds.origin.y + _bounds.size.height));
}
}), new objj_method(sel_getUid("hitTest:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _delegateRespondsToDisplayLayerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("displayLayer:"));
    _delegateRespondsToDrawLayerInContextSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("drawLayer:inContext:"));
    if (_delegateRespondsToDisplayLayerSelector || _delegateRespondsToDrawLayerInContextSelector)
        objj_msgSend(self, "setNeedsDisplay");
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("_setOwningView:"), function(self, _cmd, anOwningView)
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
}), new objj_method(sel_getUid("_owningViewBoundsChanged"), function(self, _cmd)
{ with(self)
{
    _bounds.size = CGSizeMakeCopy(objj_msgSend(_owningView, "bounds").size);
    _position = CGPointMake((_bounds.size.width) * _anchorPoint.x, (_bounds.size.height) * _anchorPoint.y);
    _CALayerRecalculateGeometry(self, CALayerGeometryPositionMask | CALayerGeometryBoundsMask);
}
}), new objj_method(sel_getUid("_update"), function(self, _cmd)
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
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("layer"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "init");
}
}), new objj_method(sel_getUid("runLoopUpdateLayers"), function(self, _cmd)
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
})]);
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

p;23;CAMediaTimingFunction.jI;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2864;
kCAMediaTimingFunctionLinear = "kCAMediaTimingFunctionLinear";
kCAMediaTimingFunctionEaseIn = "kCAMediaTimingFunctionEaseIn";
kCAMediaTimingFunctionEaseOut = "kCAMediaTimingFunctionEaseOut";
kCAMediaTimingFunctionEaseInEaseOut = "kCAMediaTimingFunctionEaseInEaseOut";
var CAMediaNamedTimingFunctions = nil;
{var the_class = objj_allocateClassPair(CPObject, "CAMediaTimingFunction"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_c1x"), new objj_ivar("_c1y"), new objj_ivar("_c2x"), new objj_ivar("_c2y")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithControlPoints::::"), function(self, _cmd, c1x, c1y, c2x, c2y)
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
}), new objj_method(sel_getUid("getControlPointAtIndex:values:"), function(self, _cmd, anIndex, reference)
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
        reference[1] = 1.0;
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("functionWithName:"), function(self, _cmd, aName)
{ with(self)
{
    if (!CAMediaNamedTimingFunctions)
    {
        CAMediaNamedTimingFunctions = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.0 , 0.0 , 1.0 , 1.0), kCAMediaTimingFunctionLinear);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.42 , 0.0 , 1.0 , 1.0), kCAMediaTimingFunctionEaseIn);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.0 , 0.0 , 0.58 , 1.0), kCAMediaTimingFunctionEaseOut);
        objj_msgSend(CAMediaNamedTimingFunctions, "setObject:forKey:", objj_msgSend(CAMediaTimingFunction, "functionWithControlPoints::::", 0.42 , 0.0 , 0.58 , 1.0), kCAMediaTimingFunctionEaseInEaseOut);
    }
    return objj_msgSend(CAMediaNamedTimingFunctions, "objectForKey:", aName);
}
}), new objj_method(sel_getUid("functionWithControlPoints::::"), function(self, _cmd, c1x, c1y, c2x, c2y)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithControlPoints::::", c1x , c1y , c2x , c2y);
}
})]);
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

p;9;CGColor.ji;14;CGColorSpace.jc;3028;
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
    return CGColorCreate(0, [gray, alpha]);
}
CGColorCreateGenericRGB= function(red, green, blue, alpha)
{
    return CGColorCreate(0, [red, green, blue, alpha]);
}
CGColorCreateGenericCMYK= function(cyan, magenta, yellow, black, alpha)
{
    return CGColorCreate(0, [cyan, magenta, yellow, black, alpha]);
}
CGColorCreateCopyWithAlpha= function(aColor, anAlpha)
{
    var components = aColor.components;
    if (!aColor || anAlpha == components[components.length - 1])
     return aColor;
    if (aColor.pattern)
        var copy = CGColorCreateWithPattern(aColor.colorspace, aColor.pattern, components);
    else
        var copy = CGColorCreate(aColor.colorspace, components);
    copy.components[components.length - 1] = anAlpha;
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
    return components[components.length - 1];
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

p;11;CGContext.ji;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;32815;
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
    return { alpha:1.0, strokeStyle:"#000", fillStyle:"#ccc", lineWidth:1.0, lineJoin:kCGLineJoinMiter, lineCap:kCGLineCapButt, miterLimit:10.0, globalAlpha:1.0,
        blendMode:kCGBlendModeNormal,
        shadowOffset:{ width:0.0, height:0.0 }, shadowBlur:0.0, shadowColor:NULL, CTM:{ a:1.0, b:0.0, c:0.0, d:1.0, tx:0.0, ty:0.0 } };
}
CGGStateCreateCopy= function(aGState)
{
    return { alpha:aGState.alpha, strokeStyle:aGState.strokeStyle, fillStyle:aGState.fillStyle, lineWidth:aGState.lineWidth,
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
    if (arguments[2] === undefined)
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
CGContextSetAlpha= function(aContext, anAlpha)
{
    aContext.gState.alpha = MAX(MIN(anAlpha, 1.0), 0.0);
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
        CGContextAddLineToPoint(aContext, points[i + 1].x, points[i + 1].y);
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
CGContextStrokeRoundedRectangleInRect= function(aContext, aRect, aRadius, ne, se, sw, nw)
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
    CGContextStrokePath(aContext);
}
if (CPFeatureIsCompatible(CPHTMLCanvasFeature))
{
var CANVAS_LINECAP_TABLE = [ "butt", "round", "square" ],
    CANVAS_LINEJOIN_TABLE = [ "miter", "round", "bevel" ],
    CANVAS_COMPOSITE_TABLE = [ "source-over", "source-over", "source-over", "source-over", "darker",
                                "lighter", "source-over", "source-over", "source-over", "source-over",
                                "source-over", "source-over", "source-over", "source-over", "source-over",
                                "source-over", "source-over",
                                "copy", "source-in", "source-out", "source-atop",
                                "destination-over", "destination-in", "destination-out", "destination-atop",
                                "xor", "source-over", "source-over" ];
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
if (CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature))
{
CGContextConcatCTM = function(aContext, anAffineTransform)
{
    aContext.transform(anAffineTransform.a, anAffineTransform.b, anAffineTransform.c, anAffineTransform.d, anAffineTransform.tx, anAffineTransform.ty);
}
}
else
{
CGContextConcatCTM = function(aContext, anAffineTransform)
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
var VML_TRUTH_TABLE = [ "f", "t"],
    VML_LINECAP_TABLE = [ "flat", "round", "square" ],
    VML_LINEJOIN_TABLE = [ "miter", "round", "bevel" ],
    VML_ELEMENT_TABLE = [ " m ", " l ", "qb", " c ", " x ", [" at ", " wa "]];
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
    var elements = aContext.path.elements,
        i = 0,
        count = aContext.path.count,
        gState = aContext.gState,
        fill = (aMode == kCGPathFill || aMode == kCGPathFillStroke) ? 1 : 0,
        stroke = (aMode == kCGPathStroke || aMode == kCGPathFillStroke) ? 1 : 0,
        opacity = gState.alpha,
        vml = [ "<cg_vml_:shape",
                " fillcolor=\"", gState.fillStyle,
                "\" filled=\"", VML_TRUTH_TABLE[fill],
                "\" style=\"position:absolute;width:", W, ";height:", H,
                ";\" coordorigin=\"0 0\" coordsize=\"", Z * W, " ", Z * H,
                "\" stroked=\"", VML_TRUTH_TABLE[stroke],
                "\" strokeweight=\"", gState.lineWidth,
                "\" strokecolor=\"", gState.strokeStyle,
                "\" path=\""];
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

p;12;CGGeometry.jc;7219;CGPointMake= function(x, y) { return { x:x, y:y }; }
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
CGInsetMake= function(top, left, bottom, right) { return { top:(top), left:(left), bottom:(bottom), right:(right) }; }
CGInsetMakeZero= function() { return { top:(0), left:(0), bottom:(0), right:(0) }; }
CGInsetMakeCopy= function(anInset) { return { top:(anInset.top), left:(anInset.left), bottom:(anInset.bottom), right:(anInset.right) }; }
CGInsetIsEmpty= function(anInset) { return ((anInset).left === 0 && (anInset).top === 0 && (anInset).right === 0 && (anInset).bottom === 0); }
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

p;8;CGPath.ji;12;CGGeometry.ji;19;CGAffineTransform.jc;8088;
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
            aPath.elements[aPath.count - 1].radius = element.radius;
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
    var previous = aPath.elements[count - 1];
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
    if (count == 0 || aPath.elements[count - 1].type == kCGPathElementCloseSubpath)
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

p;9;CPAlert.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPColor.jI;15;AppKit/CPFont.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jI;16;AppKit/CPPanel.jI;20;AppKit/CPTextField.jc;6930;
CPWarningAlertStyle = 0;
CPInformationalAlertStyle = 1;
CPCriticalAlertStyle = 2;
var CPAlertWarningImage,
    CPAlertInformationImage,
    CPAlertErrorImage;
{var the_class = objj_allocateClassPair(CPObject, "CPAlert"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alertPanel"), new objj_ivar("_messageLabel"), new objj_ivar("_alertImageView"), new objj_ivar("_alertStyle"), new objj_ivar("_windowTitle"), new objj_ivar("_windowStyle"), new objj_ivar("_buttonCount"), new objj_ivar("_buttons"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _buttonCount = 0;
        _buttons = objj_msgSend(CPArray, "array");
        _alertStyle = CPWarningAlertStyle;
        _messageLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(57.0, 10.0, 220.0, 80.0));
        objj_msgSend(_messageLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(_messageLabel, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(_messageLabel, "setAlignment:", CPJustifiedTextAlignment);
        _alertImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(15.0, 12.0, 32.0, 32.0));
        objj_msgSend(self, "setWindowStyle:", nil);
    }
    return self;
}
}), new objj_method(sel_getUid("setWindowStyle:"), function(self, _cmd, styleMask)
{ with(self)
{
    _windowStyle = styleMask;
    _alertPanel = objj_msgSend(objj_msgSend(CPPanel, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0.0, 0.0, 300.0, 130.0), styleMask ? styleMask | CPTitledWindowMask : CPTitledWindowMask);
    objj_msgSend(_alertPanel, "setFloatingPanel:", YES);
    objj_msgSend(_alertPanel, "center");
    objj_msgSend(_messageLabel, "setTextColor:", (styleMask == CPHUDBackgroundWindowMask) ? objj_msgSend(CPColor, "whiteColor") : objj_msgSend(CPColor, "blackColor"));
    var count = objj_msgSend(_buttons, "count");
    for(var i=0; i < count; i++)
    {
        var button = _buttons[i];
        objj_msgSend(button, "setFrameSize:", CGSizeMake(objj_msgSend(button, "frame").size.width, (styleMask == CPHUDBackgroundWindowMask) ? 20.0 : 18.0));
        objj_msgSend(button, "setBezelStyle:", (styleMask == CPHUDBackgroundWindowMask) ? CPHUDBezelStyle : CPRoundedBezelStyle);
        objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", button);
    }
    objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", _messageLabel);
    objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", _alertImageView);
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _windowTitle = aTitle;
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _windowTitle;
}
}), new objj_method(sel_getUid("windowStyle"), function(self, _cmd)
{ with(self)
{
    return _windowStyle;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, delegate)
{ with(self)
{
    _delegate = delegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setAlertStyle:"), function(self, _cmd, style)
{ with(self)
{
    _alertStyle = style;
}
}), new objj_method(sel_getUid("alertStyle"), function(self, _cmd)
{ with(self)
{
    return _alertStyle;
}
}), new objj_method(sel_getUid("setMessageText:"), function(self, _cmd, messageText)
{ with(self)
{
    objj_msgSend(_messageLabel, "setStringValue:", messageText);
}
}), new objj_method(sel_getUid("messageText"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_messageLabel, "stringValue");
}
}), new objj_method(sel_getUid("addButtonWithTitle:"), function(self, _cmd, title)
{ with(self)
{
    var button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(200.0 - (_buttonCount * 90.0), 98.0, 80.0, (_windowStyle == CPHUDBackgroundWindowMask) ? 20.0 : 18.0));
    objj_msgSend(button, "setTitle:", title);
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setTag:", _buttonCount);
    objj_msgSend(button, "setAction:", sel_getUid("_notifyDelegate:"));
    objj_msgSend(button, "setBezelStyle:", (_windowStyle == CPHUDBackgroundWindowMask) ? CPHUDBezelStyle : CPRoundRectBezelStyle);
    objj_msgSend(objj_msgSend(_alertPanel, "contentView"), "addSubview:", button);
    _buttonCount++;
    objj_msgSend(_buttons, "addObject:", button);
}
}), new objj_method(sel_getUid("runModal"), function(self, _cmd)
{ with(self)
{
    var theTitle;
    switch (_alertStyle)
    {
        case CPWarningAlertStyle: objj_msgSend(_alertImageView, "setImage:", CPAlertWarningImage);
                                        theTitle = "Warning";
                                        break;
        case CPInformationalAlertStyle: objj_msgSend(_alertImageView, "setImage:", CPAlertInformationImage);
                                        theTitle = "Information";
                                        break;
        case CPCriticalAlertStyle: objj_msgSend(_alertImageView, "setImage:", CPAlertErrorImage);
                                        theTitle = "Error";
                                        break;
    }
    objj_msgSend(_alertPanel, "setTitle:", _windowTitle ? _windowTitle : theTitle);
    objj_msgSend(CPApp, "runModalForWindow:", _alertPanel);
}
}), new objj_method(sel_getUid("_notifyDelegate:"), function(self, _cmd, button)
{ with(self)
{
    if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("alertDidEnd:returnCode:")))
        objj_msgSend(_delegate, "alertDidEnd:returnCode:", self, objj_msgSend(button, "tag"));
    objj_msgSend(CPApp, "abortModal");
    objj_msgSend(_alertPanel, "close");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != CPAlert)
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    CPAlertWarningImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPAlert/dialog-warning.png"), CGSizeMake(32.0, 32.0));
    CPAlertInformationImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPAlert/dialog-information.png"), CGSizeMake(32.0, 32.0));
    CPAlertErrorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPAlert/dialog-error.png"), CGSizeMake(32.0, 32.0));
}
})]);
}

p;13;CPAnimation.jI;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;5335;
CPAnimationEaseInOut = 0;
CPAnimationEaseIn = 1;
CPAnimationEaseOut = 2;
CPAnimationLinear = 3;
ACTUAL_FRAME_RATE = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_lastTime"), new objj_ivar("_duration"), new objj_ivar("_animationCurve"), new objj_ivar("_timingFunction"), new objj_ivar("_frameRate"), new objj_ivar("_progress"), new objj_ivar("_delegate"), new objj_ivar("_timer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDuration:animationCurve:"), function(self, _cmd, aDuration, anAnimationCurve)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _progress = 0.0;
        _duration = MAX(0.0, aDuration);
        _animationCurve = anAnimationCurve;
        _frameRate = 60.0;
    }
    return self;
}
}), new objj_method(sel_getUid("setAnimationCurve:"), function(self, _cmd, anAnimationCurve)
{ with(self)
{
    switch (_animationCurve)
    {
        case CPAnimationEaseInOut: timingFunctionName = kCAMediaTimingFunctionEaseInEaseOut;
                                    break;
        case CPAnimationEaseIn: timingFunctionName = kCAMediaTimingFunctionEaseIn;
                                    break;
        case CPAnimationEaseOut: timingFunctionName = kCAMediaTimingFunctionEaseOut;
                                    break;
        case CPAnimationLinear: timingFunctionName = kCAMediaTimingFunctionLinear;
                                    break;
        default: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for animation curve");
                                    break;
    }
    _animationCurve = anAnimationCurve;
    _timingFunction = objj_msgSend(CAMediaTimingFunction, "functionWithName:", timingFunctionName);
}
}), new objj_method(sel_getUid("animationCurve"), function(self, _cmd)
{ with(self)
{
    return _animationCurve;
}
}), new objj_method(sel_getUid("setDuration:"), function(self, _cmd, aDuration)
{ with(self)
{
    if (aDuration < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aDuration can't be negative");
    _duration = aDuration;
}
}), new objj_method(sel_getUid("duration"), function(self, _cmd)
{ with(self)
{
    return _duration;
}
}), new objj_method(sel_getUid("setFrameRate:"), function(self, _cmd, frameRate)
{ with(self)
{
    if (frameRate < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "frameRate can't be negative");
    _frameRate = frameRate;
}
}), new objj_method(sel_getUid("frameRate"), function(self, _cmd)
{ with(self)
{
    return _frameRate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("startAnimation"), function(self, _cmd)
{ with(self)
{
    if (_timer || _delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationShouldStart")) && !objj_msgSend(_delegate, "animationShouldStart:", self))
        return;
    if (_progress === 1.0)
        _progress = 0.0;
    ACTUAL_FRAME_RATE = 0;
    _lastTime = new Date();
    _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("animationTimerDidFire:"), nil, YES);
}
}), new objj_method(sel_getUid("animationTimerDidFire:"), function(self, _cmd, aTimer)
{ with(self)
{
    var currentTime = new Date(),
        progress = MIN(1.0, objj_msgSend(self, "currentProgress") + (currentTime - _lastTime) / (_duration * 1000.0));
    _lastTime = currentTime;
    ++ACTUAL_FRAME_RATE;
    objj_msgSend(self, "setCurrentProgress:", progress);
    if (progress === 1.0)
    {
        objj_msgSend(_timer, "invalidate");
        _timer = nil;
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationDidEnd:")))
            objj_msgSend(_delegate, "animationDidEnd:", self);
    }
}
}), new objj_method(sel_getUid("stopAnimation"), function(self, _cmd)
{ with(self)
{
    if (!_timer)
        return;
    objj_msgSend(_timer, "invalidate");
    _timer = nil;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationDidStop:")))
        objj_msgSend(_delegate, "animationDidStop:", self);
}
}), new objj_method(sel_getUid("isAnimating"), function(self, _cmd)
{ with(self)
{
    return _timer;
}
}), new objj_method(sel_getUid("setCurrentProgress:"), function(self, _cmd, aProgress)
{ with(self)
{
    _progress = aProgress;
}
}), new objj_method(sel_getUid("currentProgress"), function(self, _cmd)
{ with(self)
{
    return _progress;
}
}), new objj_method(sel_getUid("currentValue"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animation:valueForProgress:")))
        return objj_msgSend(_delegate, "animation:valueForProgress:", self, _progress);
    if (_animationCurve == CPAnimationLinear)
        return _progress;
    alert("IMPLEMENT ANIMATION CURVES!!!");
}
})]);
}

p;15;CPApplication.jI;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.jc;20257;
CPApp = nil;
CPApplicationWillFinishLaunchingNotification = "CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification = "CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse = -1000;
CPRunAbortedResponse = -1001;
CPRunContinuesResponse = -1002;
{var the_class = objj_allocateClassPair(CPResponder, "CPApplication"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_eventListeners"), new objj_ivar("_currentEvent"), new objj_ivar("_windows"), new objj_ivar("_keyWindow"), new objj_ivar("_mainWindow"), new objj_ivar("_mainMenu"), new objj_ivar("_documentController"), new objj_ivar("_currentSession"), new objj_ivar("_delegate"), new objj_ivar("_namedArgs"), new objj_ivar("_args"), new objj_ivar("_fullArgsString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
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
            newMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "New", sel_getUid("newDocument:"), "N");
        objj_msgSend(newMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/New.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(newMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/NewHighlighted.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(_mainMenu, "addItem:", newMenuItem);
        var openMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Open", sel_getUid("openDocument:"), "O");
        objj_msgSend(openMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/Open.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(openMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/OpenHighlighted.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(_mainMenu, "addItem:", openMenuItem);
        var saveMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "Save"),
            saveMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save", sel_getUid("saveDocument:"), nil);
        objj_msgSend(saveMenuItem, "setImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/Save.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(saveMenuItem, "setAlternateImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPApplication/SaveHighlighted.png"), CGSizeMake(16.0, 16.0)));
        objj_msgSend(saveMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save", sel_getUid("saveDocument:"), "S"));
        objj_msgSend(saveMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Save As", sel_getUid("saveDocumentAs:"), nil));
        objj_msgSend(saveMenuItem, "setSubmenu:", saveMenu);
        objj_msgSend(_mainMenu, "addItem:", saveMenuItem);
        var editMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Edit", nil, nil),
            editMenu = objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", "Edit"),
            undoMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Undo", sel_getUid("undo:"), CPUndoKeyEquivalent),
            redoMenuItem = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Redo", sel_getUid("redo:"), CPRedoKeyEquivalent);
        objj_msgSend(undoMenuItem, "setKeyEquivalentModifierMask:", CPUndoKeyEquivalentModifierMask);
        objj_msgSend(redoMenuItem, "setKeyEquivalentModifierMask:", CPRedoKeyEquivalentModifierMask);
        objj_msgSend(editMenu, "addItem:", undoMenuItem);
        objj_msgSend(editMenu, "addItem:", redoMenuItem);
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Cut", sel_getUid("cut:"), "X")),
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Copy", sel_getUid("copy:"), "C")),
        objj_msgSend(editMenu, "addItem:", objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", "Paste", sel_getUid("paste:"), "V"));
        objj_msgSend(editMenuItem, "setSubmenu:", editMenu);
        objj_msgSend(editMenuItem, "setHidden:", YES);
        objj_msgSend(_mainMenu, "addItem:", editMenuItem);
        objj_msgSend(_mainMenu, "addItem:", objj_msgSend(CPMenuItem, "separatorItem"));
    }
    return self;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
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
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("applicationWillFinishLaunching:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("applicationWillFinishLaunching:"), CPApplicationWillFinishLaunchingNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("applicationDidFinishLaunching:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("applicationDidFinishLaunching:"), CPApplicationDidFinishLaunchingNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("finishLaunching"), function(self, _cmd)
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
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
}), new objj_method(sel_getUid("run"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "finishLaunching");
}
}), new objj_method(sel_getUid("runModalForWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(self, "runModalSession:", objj_msgSend(self, "beginModalSessionForWindow:", aWindow));
}
}), new objj_method(sel_getUid("stopModalWithCode:"), function(self, _cmd, aCode)
{ with(self)
{
    if (!_currentSession)
    {
        return;
    }
    _currentSession._state = aCode;
    _currentSession = _currentSession._previous;
        objj_msgSend(self, "_removeRunModalLoop");
}
}), new objj_method(sel_getUid("_removeRunModalLoop"), function(self, _cmd)
{ with(self)
{
    var count = _eventListeners.length;
    while (count--)
        if (_eventListeners[count]._callback === _CPRunModalLoop)
        {
            _eventListeners.splice(count, 1);
            return;
        }
}
}), new objj_method(sel_getUid("stopModal"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "stopModalWithCode:", CPRunStoppedResponse)
}
}), new objj_method(sel_getUid("abortModal"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "stopModalWithCode:", CPRunAbortedResponse);
}
}), new objj_method(sel_getUid("beginModalSessionForWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    return _CPModalSessionMake(aWindow, 0);
}
}), new objj_method(sel_getUid("runModalSession:"), function(self, _cmd, aModalSession)
{ with(self)
{
    aModalSession._previous = _currentSession;
    _currentSession = aModalSession;
    var theWindow = aModalSession._window;
    objj_msgSend(theWindow, "center");
    objj_msgSend(theWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, NO);
}
}), new objj_method(sel_getUid("modalWindow"), function(self, _cmd)
{ with(self)
{
    if (!_currentSession)
        return nil;
    return _currentSession._window;
}
}), new objj_method(sel_getUid("_handleKeyEquivalent:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(_mainMenu, "performKeyEquivalent:", anEvent))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("sendEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPKeyDown &&
        objj_msgSend(anEvent, "modifierFlags") & (CPCommandKeyMask | CPControlKeyMask) &&
        objj_msgSend(objj_msgSend(anEvent, "characters"), "length") > 0 &&
        objj_msgSend(self, "_handleKeyEquivalent:", anEvent))
        return;
    if (_eventListeners.length)
    {
        if (_eventListeners[_eventListeners.length - 1]._mask & (1 << objj_msgSend(anEvent, "type")))
            _eventListeners.pop()._callback(anEvent);
        return;
    }
    objj_msgSend(objj_msgSend(anEvent, "window"), "sendEvent:", anEvent);
}
}), new objj_method(sel_getUid("doCommandBySelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
}), new objj_method(sel_getUid("keyWindow"), function(self, _cmd)
{ with(self)
{
    return _keyWindow;
}
}), new objj_method(sel_getUid("mainWindow"), function(self, _cmd)
{ with(self)
{
    return _mainWindow;
}
}), new objj_method(sel_getUid("windowWithWindowNumber:"), function(self, _cmd, aWindowNumber)
{ with(self)
{
    return _windows[aWindowNumber];
}
}), new objj_method(sel_getUid("windows"), function(self, _cmd)
{ with(self)
{
    return _windows;
}
}), new objj_method(sel_getUid("mainMenu"), function(self, _cmd)
{ with(self)
{
    return _mainMenu;
}
}), new objj_method(sel_getUid("setMainMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _mainMenu = aMenu;
}
}), new objj_method(sel_getUid("tryToPerform:with:"), function(self, _cmd, anAction, anObject)
{ with(self)
{
    if (!anAction)
        return NO;
    if (objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "tryToPerform:with:", anAction, anObject))
        return YES;
    if(objj_msgSend(_delegate, "respondsToSelector:", anAction))
    {
        objj_msgSend(_delegate, "performSelector:withObject:", anAction, anObject);
        return YES;
    }
    return NO;
}
}), new objj_method(sel_getUid("sendAction:to:from:"), function(self, _cmd, anAction, aTarget, aSender)
{ with(self)
{
    var target = objj_msgSend(self, "targetForAction:to:from:", anAction, aTarget, aSender);
    if (!target)
        return NO;
    objj_msgSend(target, "performSelector:withObject:", anAction, aSender);
    return YES;
}
}), new objj_method(sel_getUid("targetForAction:to:from:"), function(self, _cmd, anAction, aTarget, aSender)
{ with(self)
{
    if (!anAction)
        return nil;
    if (aTarget)
        return aTarget;
    return objj_msgSend(self, "targetForAction:", anAction);
}
}), new objj_method(sel_getUid("_targetForWindow:action:"), function(self, _cmd, aWindow, anAction)
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
}), new objj_method(sel_getUid("targetForAction:"), function(self, _cmd, anAction)
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
}), new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function(self, _cmd, aCallback, aMask, anExpiration, aMode, shouldDequeue)
{ with(self)
{
    _eventListeners.push(_CPEventListenerMake(aMask, aCallback));
    if (_eventListeners.length == 3) objj_debug_print_backtrace();
}
}), new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function(self, _cmd, aTarget, aSelector, aMask, anExpiration, aMode, shouldDequeue)
{ with(self)
{
    _eventListeners.push(_CPEventListenerMake(aMask, function (anEvent) { objj_msgSend(aTarget, aSelector, anEvent); }));
}
}), new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"), function(self, _cmd, aSheet, aWindow, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(aWindow, "_attachSheet:modalDelegate:didEndSelector:contextInfo:", aSheet, aModalDelegate, aDidEndSelector, aContextInfo);
}
}), new objj_method(sel_getUid("arguments"), function(self, _cmd)
{ with(self)
{
    if(_fullArgsString != window.location.hash)
        objj_msgSend(self, "_reloadArguments");
    return _args;
}
}), new objj_method(sel_getUid("setArguments:"), function(self, _cmd, args)
{ with(self)
{
    if(!args || args.length == 0)
    {
        _args = [];
        window.location.hash = "#";
        return;
    }
    if(objj_msgSend(args, "class") != CPArray)
        args = objj_msgSend(CPArray, "arrayWithObject:", args);
    _args = args;
    var toEncode = objj_msgSend(_args, "copy");
    for(var i=0, count = toEncode.length; i<count; i++)
        toEncode[i] = encodeURIComponent(toEncode[i]);
    var hash = objj_msgSend(toEncode, "componentsJoinedByString:", "/");
    window.location.hash = "#" + hash;
}
}), new objj_method(sel_getUid("_reloadArguments"), function(self, _cmd)
{ with(self)
{
    _fullArgsString = window.location.hash;
    var args = _fullArgsString.replace("#", "").split("/").slice(0);
    for(var i=0, count = args.length; i<count; i++)
        args[i] = decodeURIComponent(args[i]);
    _args = args;
}
}), new objj_method(sel_getUid("namedArguments"), function(self, _cmd)
{ with(self)
{
    return _namedArgs;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedApplication"), function(self, _cmd)
{ with(self)
{
    if (!CPApp)
        CPApp = objj_msgSend(objj_msgSend(CPApplication, "alloc"), "init");
    return CPApp;
}
})]);
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
}
{var the_class = objj_allocateClassPair(CPObject, "X"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("blendDidFinishLoading:"), function(self, _cmd, aBundle)
{ with(self)
{
    objj_msgSend(CPTheme, "setDefaultTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo"));
    _CPApplicationMain()
}
})]);
}
CPApplicationMain= function(args, namedArgs)
{
    var blend = objj_msgSend(objj_msgSend(CPBlend, "alloc"), "initWithContentsOfURL:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPApplication, "class")), "pathForResource:", "Aristo.blend"));
    objj_msgSend(blend, "loadWithDelegate:", objj_msgSend(X, "new"));
}
_CPApplicationMain= function(args, namedArgs)
{
    var mainBundle = objj_msgSend(CPBundle, "mainBundle"),
        principalClass = objj_msgSend(mainBundle, "principalClass");
    if (!principalClass)
        principalClass = objj_msgSend(CPApplication, "class");
    objj_msgSend(principalClass, "sharedApplication");
    if (!args && !namedArgs)
    {
        var args = objj_msgSend(CPApp, "arguments"),
            searchParams = window.location.search.substring(1).split("&");
            namedArgs = objj_msgSend(CPDictionary, "dictionary");
        if(objj_msgSend(args, "containsObject:", "debug"))
            CPLogRegister(CPLogPopup);
        for(var i=0; i<searchParams.length; i++)
        {
            var index = searchParams[i].indexOf('=');
            if(index == -1)
                objj_msgSend(namedArgs, "setObject:forKey:",  "", searchParams[i]);
            else
                objj_msgSend(namedArgs, "setObject:forKey:",  searchParams[i].substring(index+1),  searchParams[i].substring(0, index));
        }
    }
    CPApp._args = args;
    CPApp._namedArgs = namedArgs;
    objj_msgSend(CPApp, "run");
}

p;10;CPButton.ji;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;14976;
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_allowsMixedState"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_bezelInset"), new objj_ivar("_contentInset"), new objj_ivar("_bezelColor"), new objj_ivar("_bezelView"), new objj_ivar("_contentView"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPCenterTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPCenterVerticalTextAlignment, "vertical-alignment");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPScaleNone, "image-scaling");
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setBordered:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("allowsMixedState"), function(self, _cmd)
{ with(self)
{
    return _allowsMixedState;
}
}), new objj_method(sel_getUid("setAllowsMixedState:"), function(self, _cmd, aFlag)
{ with(self)
{
    _allowsMixedState = aFlag;
}
}), new objj_method(sel_getUid("setNextState"), function(self, _cmd)
{ with(self)
{
    if (_state == CPOffState)
        _state = CPOnState;
    else
        _state = (_state >= CPOnState && _allowsMixedState) ? CPMixedState : CPOffState;
}
}), new objj_method(sel_getUid("setState:"), function(self, _cmd, aState)
{ with(self)
{
    _state = aState;
}
}), new objj_method(sel_getUid("state"), function(self, _cmd)
{ with(self)
{
    return _state;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    if (_title === aTitle)
        return;
    _title = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setAlternateTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    if (_alternateTitle === aTitle)
        return;
    _alternateTitle = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("alternateTitle"), function(self, _cmd)
{ with(self)
{
    return _alternateTitle;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_image === anImage)
        return;
    _image = anImage;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return _image;
}
}), new objj_method(sel_getUid("setAlternateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_alternateImage === anImage)
        return;
    _alternateImage = anImage;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("alternateImage"), function(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
}), new objj_method(sel_getUid("highlight:"), function(self, _cmd, aFlag)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "highlight:", aFlag);
    objj_msgSend(self, "drawBezelWithHighlight:", aFlag);
}
}), new objj_method(sel_getUid("setTag:"), function(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    return _tag;
}
}), new objj_method(sel_getUid("startTrackingAt:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "highlight:", YES);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "startTrackingAt:", aPoint);
}
}), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    objj_msgSend(self, "highlight:", NO);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "stopTracking:at:mouseIsUp:", lastPoint, aPoint, mouseIsUp);
}
}), new objj_method(sel_getUid("drawBezelWithHighlight:"), function(self, _cmd, shouldHighlight)
{ with(self)
{ return;
    _bezelBorderNeedsUpdate = !objj_msgSend(self, "window");
    if (_bezelBorderNeedsUpdate)
        return;
    objj_msgSend(self, "setBackgroundColorWithName:", shouldHighlight ? CPControlHighlightedBackgroundColor : CPControlNormalBackgroundColor);
}
}), new objj_method(sel_getUid("createBezelView"), function(self, _cmd)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
}), new objj_method(sel_getUid("createContentView"), function(self, _cmd)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    return view;
}
}), new objj_method(sel_getUid("contentRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "content-inset");
    if (((contentInset).left === 0 && (contentInset).top === 0 && (contentInset).right === 0 && (contentInset).bottom === 0))
        return bounds;
    bounds.origin.x += contentInset.left;
    bounds.origin.y += contentInset.top;
    bounds.size.width -= contentInset.left + contentInset.right;
    bounds.size.height -= contentInset.top + contentInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("bezelRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    if (!objj_msgSend(self, "isBordered"))
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var bezelInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-inset");
    if (((bezelInset).left === 0 && (bezelInset).top === 0 && (bezelInset).right === 0 && (bezelInset).bottom === 0))
        return bounds;
    bounds.origin.x += bezelInset.left;
    bounds.origin.y += bezelInset.top;
    bounds.size.width -= bezelInset.left + bezelInset.right;
    bounds.size.height -= bezelInset.top + bezelInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        objj_msgSend(contentView, "setText:", ((_controlState & CPControlStateHighlighted) && _alternateTitle) ? _alternateTitle : _title);
        objj_msgSend(contentView, "setImage:", ((_controlState & CPControlStateHighlighted) && _alternateImage) ? _alternateImage : _image);
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemedAttributeName:", "font"));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-color"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemedAttributeName:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-offset"));
        objj_msgSend(contentView, "setImagePosition:", objj_msgSend(self, "currentValueForThemedAttributeName:", "image-position"));
        objj_msgSend(contentView, "setImageScaling:", objj_msgSend(self, "currentValueForThemedAttributeName:", "image-scaling"));
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [{ top:(0), left:(0), bottom:(0), right:(0) }, { top:(0), left:(0), bottom:(0), right:(0) }, nil], ["bezel-inset", "content-inset", "bezel-color"]);
}
})]);
}
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBezelStyle:"), function(self, _cmd, aBezelStyle)
{ with(self)
{
}
}), new objj_method(sel_getUid("bezelStyle"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setBordered:"), function(self, _cmd, shouldBeBordered)
{ with(self)
{
    if ((!!(_controlState & CPControlStateBordered)) === shouldBeBordered)
        return;
    if (shouldBeBordered)
        _controlState |= CPControlStateBordered;
    else
        _controlState &= ~CPControlStateBordered;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isBordered"), function(self, _cmd)
{ with(self)
{
    return !!(_controlState & CPControlStateBordered);
}
})]);
}
var CPButtonImageKey = "CPButtonImageKey",
    CPButtonAlternateImageKey = "CPButtonAlternateImageKey",
    CPButtonTitleKey = "CPButtonTitleKey",
    CPButtonAlternateTitleKey = "CPButtonAlternateTitleKey",
    CPButtonContentInsetKey = "CPButtonContentInsetKey",
    CPButtonBezelInsetKey = "CPButtonBezelInsetKey",
    CPButtonBezelColorKey = "CPButtonBezelColorKey",
    CPButtonImageAndTitleViewKey = "CPButtonImageAndTitleViewKey",
    CPButtonImagePositionKey = "CPButtonImagePositionKey",
    CPButtonImageScalingKey = "CPButtonImageScalingKey",
    CPButtonIsBorderedKey = "CPButtonIsBorderedKey",
    CPButtonBezelStyleKey = "CPButtonBezelStyleKey",
    CPButtonImageAndTitleViewKey = "CPButtonImageAndTitleViewKey";
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonImageKey));
        objj_msgSend(self, "setAlternateImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateImageKey));
        objj_msgSend(self, "setTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonTitleKey));
        objj_msgSend(self, "setAlternateTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateTitleKey));
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPButtonImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPButtonAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPButtonTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateTitle, CPButtonAlternateTitleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _bezelStyle, CPButtonBezelStyleKey);
}
})]);
}

p;13;CPButtonBar.jI;15;AppKit/CPView.jc;1946;




{var the_class = objj_allocateClassPair(CPControl, "CPButtonBar"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bounds");

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });

        objj_msgSend(view, "setHitTests:", NO);

        return view;
    }

    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "");

    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-color"));
}
}), new objj_method(sel_getUid("addSubview:"), function(self, _cmd, aSubview)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "addSubview:", aSubview);

    objj_msgSend(aSubview, "setAutoresizingMask:", CPViewMinXMargin);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil], ["bezel-color"]);
}
})]);
}

p;7;CPCib.jI;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;22;_CPCibWindowTemplate.jc;3552;
CPCibOwner = "CPCibOwner",
CPCibTopLevelObjects = "CPCibTopLevelObjects",
CPCibReplacementClasses = "CPCibReplacementClasses";
var CPCibObjectDataKey = "CPCibObjectDataKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data"), new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentsOfURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _data = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:error:", objj_msgSend(CPURLRequest, "requestWithURL:", aURL), nil, nil);
        _awakenCustomResources = YES;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithCibNamed:bundle:"), function(self, _cmd, aName, aBundle)
{ with(self)
{
    self = objj_msgSend(self, "initWithContentsOfURL:", aName);
    if (self)
    {
        _bundle = aBundle;
    }
    return self;
}
}), new objj_method(sel_getUid("_setAwakenCustomResources:"), function(self, _cmd, shouldAwakenCustomResources)
{ with(self)
{
    _awakenCustomResources = shouldAwakenCustomResources;
}
}), new objj_method(sel_getUid("_awakenCustomResources"), function(self, _cmd)
{ with(self)
{
    return _awakenCustomResources;
}
}), new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"), function(self, _cmd, anExternalNameTable)
{ with(self)
{
    var unarchiver = objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:awakenCustomResources:", _data, _bundle, _awakenCustomResources),
        replacementClasses = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibReplacementClasses);
    if (replacementClasses)
    {
        var key = nil,
            keyEnumerator = objj_msgSend(replacementClasses, "keyEnumerator");
        while (key = objj_msgSend(keyEnumerator, "nextObject"))
            objj_msgSend(unarchiver, "setClass:forClassName:", objj_msgSend(replacementClasses, "objectForKey:", key), key);
    }
    var objectData = objj_msgSend(unarchiver, "decodeObjectForKey:", CPCibObjectDataKey);
    if (!objectData || !objj_msgSend(objectData, "isKindOfClass:", objj_msgSend(_CPCibObjectData, "class")))
        return NO;
    var owner = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibOwner),
        topLevelObjects = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibTopLevelObjects);
    objj_msgSend(objectData, "instantiateWithOwner:topLevelObjects:", owner, topLevelObjects)
    objj_msgSend(objectData, "establishConnectionsWithOwner:topLevelObjects:", owner, topLevelObjects);
    objj_msgSend(objectData, "awakeWithOwner:topLevelObjects:", owner, topLevelObjects);
    var menu;
    if ((menu = objj_msgSend(objectData, "mainMenu")) != nil)
    {
         objj_msgSend(CPApp, "setMainMenu:", menu);
         objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    }
    objj_msgSend(objectData, "displayVisibleWindows");
    return YES;
}
}), new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"), function(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", anOwner, CPCibOwner, topLevelObjects, CPCibTopLevelObjects);
    return objj_msgSend(self, "instantiate");
}
})]);
}

p;12;CPClipView.ji;8;CPView.jc;4767;
{var the_class = objj_allocateClassPair(CPView, "CPClipView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documentView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setDocumentView:"), function(self, _cmd, aView)
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
        objj_msgSend(self, "addSubview:", _documentView);
  objj_msgSend(_documentView, "setPostsFrameChangedNotifications:", YES);
  objj_msgSend(_documentView, "setPostsBoundsChangedNotifications:", YES);
  objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("viewFrameChanged:"), CPViewFrameDidChangeNotification, _documentView);
  objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("viewBoundsChanged:"), CPViewBoundsDidChangeNotification, _documentView);
    }
}
}), new objj_method(sel_getUid("documentView"), function(self, _cmd)
{ with(self)
{
    return _documentView;
}
}), new objj_method(sel_getUid("constrainScrollPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    if (!_documentView)
        return { x:0.0, y:0.0 };
    var documentFrame = objj_msgSend(_documentView, "frame");
    aPoint.x = MAX(0.0, MIN(aPoint.x, MAX((documentFrame.size.width) - (_bounds.size.width), 0.0)));
    aPoint.y = MAX(0.0, MIN(aPoint.y, MAX((documentFrame.size.height) - (_bounds.size.height), 0.0)));
    return aPoint;
}
}), new objj_method(sel_getUid("setBoundsOrigin:"), function(self, _cmd, aPoint)
{ with(self)
{
    if ((_bounds.origin.x == aPoint.x && _bounds.origin.y == aPoint.y))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setBoundsOrigin:", aPoint);
    var superview = objj_msgSend(self, "superview");
    if(objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
}), new objj_method(sel_getUid("scrollToPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "setBoundsOrigin:", objj_msgSend(self, "constrainScrollPoint:", aPoint));
}
}), new objj_method(sel_getUid("viewBoundsChanged:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "_constrainScrollPoint");
}
}), new objj_method(sel_getUid("viewFrameChanged:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "_constrainScrollPoint");
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "resizeSubviewsWithOldSize:", aSize);
    objj_msgSend(self, "_constrainScrollPoint");
}
}), new objj_method(sel_getUid("_constrainScrollPoint"), function(self, _cmd)
{ with(self)
{
    var oldScrollPoint = objj_msgSend(self, "bounds").origin;
    objj_msgSend(self, "scrollToPoint:", oldScrollPoint);
    if (!CGPointEqualToPoint(oldScrollPoint, objj_msgSend(self, "bounds").origin))
        return;
    var superview = objj_msgSend(self, "superview");
    if (objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
})]);
}
var CPClipViewDocumentViewKey = "CPScrollViewDocumentView";
{
var the_class = objj_getClass("CPClipView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPClipView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
        objj_msgSend(self, "setDocumentView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPClipViewDocumentViewKey));
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _documentView, CPClipViewDocumentViewKey);
}
})]);
}

p;18;CPCollectionView.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.jI;15;AppKit/CPView.jc;16676;
{var the_class = objj_allocateClassPair(CPView, "CPCollectionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content"), new objj_ivar("_items"), new objj_ivar("_itemData"), new objj_ivar("_itemPrototype"), new objj_ivar("_itemForDragging"), new objj_ivar("_cachedItems"), new objj_ivar("_maxNumberOfRows"), new objj_ivar("_maxNumberOfColumns"), new objj_ivar("_minItemSize"), new objj_ivar("_maxItemSize"), new objj_ivar("_tileWidth"), new objj_ivar("_isSelectable"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_selectionIndexes"), new objj_ivar("_itemSize"), new objj_ivar("_horizontalMargin"), new objj_ivar("_verticalMargin"), new objj_ivar("_numberOfRows"), new objj_ivar("_numberOfColumns"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
        _isSelectable = YES;
    }
    return self;
}
}), new objj_method(sel_getUid("setItemPrototype:"), function(self, _cmd, anItem)
{ with(self)
{
    _itemData = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", anItem);
    _itemForDragging = anItem
    objj_msgSend(self, "reloadContent");
}
}), new objj_method(sel_getUid("itemPrototype"), function(self, _cmd)
{ with(self)
{
    return _itemPrototype;
}
}), new objj_method(sel_getUid("newItemForRepresentedObject:"), function(self, _cmd, anObject)
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
}), new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("isFirstResponder"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "window"), "firstResponder") == self;
}
}), new objj_method(sel_getUid("setContent:"), function(self, _cmd, anArray)
{ with(self)
{
    if (_content == anArray)
        return;
    _content = anArray;
    objj_msgSend(self, "reloadContent");
}
}), new objj_method(sel_getUid("content"), function(self, _cmd)
{ with(self)
{
    return _content;
}
}), new objj_method(sel_getUid("items"), function(self, _cmd)
{ with(self)
{
    return _items;
}
}), new objj_method(sel_getUid("setSelectable:"), function(self, _cmd, isSelectable)
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
}), new objj_method(sel_getUid("isSelected"), function(self, _cmd)
{ with(self)
{
    return _isSelected;
}
}), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function(self, _cmd, shouldAllowMultipleSelection)
{ with(self)
{
    _allowsMultipleSelection = shouldAllowMultipleSelection;
}
}), new objj_method(sel_getUid("allowsMultipleSelection"), function(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
}), new objj_method(sel_getUid("setSelectionIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    if (_selectionIndexes == anIndexSet || !_isSelectable)
        return;
    var index = CPNotFound;
    while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        objj_msgSend(_items[index], "setSelected:", NO);
    _selectionIndexes = anIndexSet;
    var index = CPNotFound;
    while ((index = objj_msgSend(_selectionIndexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        objj_msgSend(_items[index], "setSelected:", YES);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("collectionViewDidChangeSelection:")))
        objj_msgSend(_delegate, "collectionViewDidChangeSelection:", self)
}
}), new objj_method(sel_getUid("selectionIndexes"), function(self, _cmd)
{ with(self)
{
    return _selectionIndexes;
}
}), new objj_method(sel_getUid("reloadContent"), function(self, _cmd)
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
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
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
    if (_maxNumberOfColumns == 1 && itemSize.width < _maxItemSize.width && itemSize.width < width)
        itemSize.width = MIN(_maxItemSize.width, width);
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
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(x, y));
        if (itemsNeedSizeUpdate)
            objj_msgSend(view, "setFrameSize:", _itemSize);
        x += itemSize.width + _horizontalMargin;
    }
    _tileWidth = width;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(width, y + itemSize.height + _verticalMargin));
    _tileWidth = -1.0;
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("setMaxNumberOfRows:"), function(self, _cmd, aMaxNumberOfRows)
{ with(self)
{
    if (_maxNumberOfRows == aMaxNumberOfRows)
        return;
    _maxNumberOfRows = aMaxNumberOfRows;
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("maxNumberOfRows"), function(self, _cmd)
{ with(self)
{
    return _maxNumberOfRows;
}
}), new objj_method(sel_getUid("setMaxNumberOfColumns:"), function(self, _cmd, aMaxNumberOfColumns)
{ with(self)
{
    if (_maxNumberOfColumns == aMaxNumberOfColumns)
        return;
    _maxNumberOfColumns = aMaxNumberOfColumns;
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("maxNumberOfColumns"), function(self, _cmd)
{ with(self)
{
    return _maxNumberOfColumns;
}
}), new objj_method(sel_getUid("numberOfRows"), function(self, _cmd)
{ with(self)
{
    return _numberOfRows;
}
}), new objj_method(sel_getUid("numberOfColumns"), function(self, _cmd)
{ with(self)
{
    return _numberOfColumns;
}
}), new objj_method(sel_getUid("setMinItemSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_minItemSize, aSize))
        return;
    _minItemSize = CGSizeMakeCopy(aSize);
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("minItemSize"), function(self, _cmd)
{ with(self)
{
    return _minItemSize;
}
}), new objj_method(sel_getUid("setMaxItemSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_maxItemSize, aSize))
        return;
    _maxItemSize = CGSizeMakeCopy(aSize);
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("maxItemSize"), function(self, _cmd)
{ with(self)
{
    return _maxItemSize;
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(_selectionIndexes, "count") && objj_msgSend(anEvent, "clickCount") == 2 && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("collectionView:didDoubleClickOnItemAtIndex:")))
        objj_msgSend(_delegate, "collectionView:didDoubleClickOnItemAtIndex:", self, objj_msgSend(_selectionIndexes, "firstIndex"));
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        row = FLOOR(location.y / (_itemSize.height + _verticalMargin)),
        column = FLOOR(location.x / (_itemSize.width + _horizontalMargin)),
        index = row * _numberOfColumns + column;
    if (index >= 0 && index < _items.length)
        objj_msgSend(self, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("collectionView:dragTypesForItemsAtIndexes:")))
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
    objj_msgSend(view, "setAlphaValue:", 0.7);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes, "firstIndex")], "view"), "frame").origin, CGPointMakeZero(), anEvent, nil, self, YES);
}
}), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function(self, _cmd, aPasteboard, aType)
{ with(self)
{
    objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(_delegate, "collectionView:dataForItemsAtIndexes:forType:", self, _selectionIndexes, aType), aType);
}
}), new objj_method(sel_getUid("setVerticalMargin:"), function(self, _cmd, aVerticalMargin)
{ with(self)
{
    if (_verticalMargin == aVerticalMargin)
        return;
    _verticalMargin = aVerticalMargin;
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("verticalMargin"), function(self, _cmd)
{ with(self)
{
    return _verticalMargin;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPCollectionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_isSelected")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (_representedObject == anObject)
        return;
    _representedObject = anObject;
    objj_msgSend(_view, "setRepresentedObject:", anObject);
}
}), new objj_method(sel_getUid("representedObject"), function(self, _cmd)
{ with(self)
{
    return _representedObject;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("setSelected:"), function(self, _cmd, shouldBeSelected)
{ with(self)
{
    if (_isSelected == shouldBeSelected)
        return;
    _isSelected = shouldBeSelected;
    objj_msgSend(_view, "setSelected:", _isSelected);
}
}), new objj_method(sel_getUid("isSelected"), function(self, _cmd)
{ with(self)
{
    return _isSelected;
}
}), new objj_method(sel_getUid("collectionView"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_view, "superview");
}
})]);
}
var CPCollectionViewMinItemSizeKey = "CPCollectionViewMinItemSizeKey",
    CPCollectionViewMaxItemSizeKey = "CPCollectionViewMaxItemSizeKey",
    CPCollectionViewVerticalMarginKey = "CPCollectionViewVerticalMarginKey";
{
var the_class = objj_getClass("CPCollectionView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCollectionView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        _items = [];
        _content = [];
        _cachedItems = [];
        _itemSize = CGSizeMakeZero();
        _minItemSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewMinItemSizeKey);
        _maxItemSize = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewMaxItemSizeKey);
        _verticalMargin = objj_msgSend(aCoder, "decodeSizeForKey:", CPCollectionViewVerticalMarginKey);
        _tileWidth = -1.0;
        _selectionIndexes = objj_msgSend(CPIndexSet, "indexSet");
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeSize:forKey:", _minItemSize, CPCollectionViewMinItemSizeKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", _maxItemSize, CPCollectionViewMaxItemSizeKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", _verticalMargin, CPCollectionViewVerticalMarginKey);
}
})]);
}
var CPCollectionViewItemViewKey = "CPCollectionViewItemViewKey";
{
var the_class = objj_getClass("CPCollectionViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCollectionViewItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
}
})]);
}
var CPCollectionViewItemViewKey = "CPCollectionViewItemViewKey";
{
var the_class = objj_getClass("CPCollectionViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPCollectionViewItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _view = objj_msgSend(aCoder, "decodeObjectForKey:", CPCollectionViewItemViewKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _view, CPCollectionViewItemViewKey);
}
})]);
}

p;9;CPColor.jI;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;15583;
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
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithCSSString:"), function(self, _cmd, aString)
{ with(self)
{
    if(aString.indexOf("rgb") == CPNotFound)
        return nil;
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    var startingIndex = aString.indexOf("(");
    var parts = aString.substring(startingIndex+1).split(',');
    _components = [
        parseInt(parts[0], 10) / 255.0,
        parseInt(parts[1], 10) / 255.0,
        parseInt(parts[2], 10) / 255.0,
        parts[3] ? parseInt(parts[3], 10) / 255.0 : 1.0
    ]
    _cssString = aString;
    return self;
}
}), new objj_method(sel_getUid("_initWithRGBA:"), function(self, _cmd, components)
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
}), new objj_method(sel_getUid("_initWithPatternImage:"), function(self, _cmd, anImage)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _patternImage = anImage;
        _cssString = "url(\"" + objj_msgSend(_patternImage, "filename") + "\")";
    }
    return self;
}
}), new objj_method(sel_getUid("patternImage"), function(self, _cmd)
{ with(self)
{
    return _patternImage;
}
}), new objj_method(sel_getUid("alphaComponent"), function(self, _cmd)
{ with(self)
{
    return _components[3];
}
}), new objj_method(sel_getUid("blueComponent"), function(self, _cmd)
{ with(self)
{
    return _components[2];
}
}), new objj_method(sel_getUid("greenComponent"), function(self, _cmd)
{ with(self)
{
    return _components[1];
}
}), new objj_method(sel_getUid("redComponent"), function(self, _cmd)
{ with(self)
{
    return _components[0];
}
}), new objj_method(sel_getUid("components"), function(self, _cmd)
{ with(self)
{
    return _components;
}
}), new objj_method(sel_getUid("colorWithAlphaComponent:"), function(self, _cmd, anAlphaComponent)
{ with(self)
{
    var components = _components.slice();
    components[components.length - 1] = anAlphaComponent;
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "_initWithRGBA:", components);
}
}), new objj_method(sel_getUid("hsbComponents"), function(self, _cmd)
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
    return [
        ROUND(hue * 360.0),
        ROUND(saturation * 100.0),
        ROUND(brightness * 100.0)
    ];
}
}), new objj_method(sel_getUid("cssString"), function(self, _cmd)
{ with(self)
{
    return _cssString;
}
}), new objj_method(sel_getUid("hexString"), function(self, _cmd)
{ with(self)
{
    return rgbToHex(objj_msgSend(self, "redComponent"), objj_msgSend(self, "greenComponent"), objj_msgSend(self, "blueComponent"))
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description")+" "+objj_msgSend(self, "cssString");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"), function(self, _cmd, red, green, blue, alpha)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [red, green, blue, alpha]);
}
}), new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"), function(self, _cmd, white, alpha)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [white, white, white, alpha]);
}
}), new objj_method(sel_getUid("colorWithHue:saturation:brightness:"), function(self, _cmd, hue, saturation, brightness)
{ with(self)
{
    if(saturation == 0.0)
        return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:",  brightness/100.0,  1.0);
    var f = hue % 60,
        p = (brightness * (100 - saturation)) / 10000,
        q = (brightness * (6000 - saturation * f)) / 600000,
        t = (brightness * (6000 - saturation * (60 -f))) / 600000,
        b = brightness / 100.0;
    switch(FLOOR(hue / 60))
    {
        case 0: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  b,  t,  p,  1.0);
        case 1: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  q,  b,  p,  1.0);
        case 2: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  p,  b,  t,  1.0);
        case 3: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  p,  q,  b,  1.0);
        case 4: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  t,  p,  b,  1.0);
        case 5: return objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  b,  p,  q,  1.0);
    }
}
}), new objj_method(sel_getUid("colorWithHexString:"), function(self, _cmd, hex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:",  hexToRGB(hex));
}
}), new objj_method(sel_getUid("blackColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 0.0, 1.0]);
}
}), new objj_method(sel_getUid("blueColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 1.0, 1.0]);
}
}), new objj_method(sel_getUid("darkGrayColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 1.0 / 3.0, 1.0);
}
}), new objj_method(sel_getUid("grayColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.5,  1.0);
}
}), new objj_method(sel_getUid("greenColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 1.0, 0.0, 1.0]);
}
}), new objj_method(sel_getUid("lightGrayColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 2.0 / 3.0, 1.0);
}
}), new objj_method(sel_getUid("redColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 0.0, 0.0, 1.0]);
}
}), new objj_method(sel_getUid("whiteColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 1.0, 1.0, 1.0]);
}
}), new objj_method(sel_getUid("yellowColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [1.0, 1.0, 0.0, 1.0]);
}
}), new objj_method(sel_getUid("shadowColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.0, 0.0, 0.0, 1.0 / 3.0]);
}
}), new objj_method(sel_getUid("colorWithPatternImage:"), function(self, _cmd, anImage)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithPatternImage:", anImage);
}
}), new objj_method(sel_getUid("colorWithCSSString:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithCSSString:",  aString);
}
})]);
}
var CPColorComponentsKey = "CPColorComponentsKey",
    CPColorPatternImageKey = "CPColorPatternImageKey";
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "containsValueForKey:", CPColorPatternImageKey))
        return objj_msgSend(self, "_initWithPatternImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorPatternImageKey));
    return objj_msgSend(self, "_initWithRGBA:", objj_msgSend(aCoder, "decodeObjectForKey:", CPColorComponentsKey));
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (_patternImage)
        objj_msgSend(aCoder, "encodeObject:forKey:", _patternImage, CPColorPatternImageKey);
    else
        objj_msgSend(aCoder, "encodeObject:forKey:", _components, CPColorComponentsKey);
}
})]);
}
var hexCharacters = "0123456789ABCDEF";
hexToRGB= function(hex)
{
    if ( hex.length == 3 )
        hex = hex.charAt(0) + hex.charAt(0) + hex.charAt(1) + hex.charAt(1) + hex.charAt(2) + hex.charAt(2);
    if(hex.length != 6)
        return null;
    hex = hex.toUpperCase();
    for(var i=0; i<hex.length; i++)
        if(hexCharacters.indexOf(hex.charAt(i)) == -1)
            return null;
    var red = (hexCharacters.indexOf(hex.charAt(0)) * 16 + hexCharacters.indexOf(hex.charAt(1))) / 255.0;
    var green = (hexCharacters.indexOf(hex.charAt(2)) * 16 + hexCharacters.indexOf(hex.charAt(3))) / 255.0;
    var blue = (hexCharacters.indexOf(hex.charAt(4)) * 16 + hexCharacters.indexOf(hex.charAt(5))) / 255.0;
    return [red, green, blue, 1.0];
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

p;14;CPColorPanel.ji;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;8;CPView.jc;18939;
CPColorPanelColorDidChangeNotification = "CPColorPanelColorDidChangeNotification";
var PREVIEW_HEIGHT = 20.0,
    TOOLBAR_HEIGHT = 32.0,
    SWATCH_HEIGHT = 14.0,
    ICON_WIDTH = 32.0,
    ICON_PADDING = 12.0;
var SharedColorPanel = nil,
    ColorPickerClasses = [];
CPWheelColorPickerMode = 1;
CPSliderColorPickerMode = 2;
CPColorPickerViewWidth = 265,
CPColorPickerViewHeight = 370;
{var the_class = objj_allocateClassPair(CPPanel, "CPColorPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_swatchView"), new objj_ivar("_previewView"), new objj_ivar("_previewLabel"), new objj_ivar("_swatchLabel"), new objj_ivar("_colorPickers"), new objj_ivar("_currentView"), new objj_ivar("_activePicker"), new objj_ivar("_color"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_mode")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", CGRectMake(500.0, 50.0, 219.0, 322.0), (CPTitledWindowMask | CPClosableWindowMask | CPResizableWindowMask));
    if (self)
    {
        objj_msgSend(self, "setTitle:", "Color Panel");
        objj_msgSend(self, "setLevel:", CPFloatingWindowLevel);
        objj_msgSend(self, "setFloatingPanel:", YES);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        objj_msgSend(self, "setMinSize:", CGSizeMake(219.0, 342.0));
        objj_msgSend(self, "setMaxSize:", CGSizeMake(323.0, 537.0));
    }
    return self;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    _color = aColor;
    objj_msgSend(_previewView, "setBackgroundColor:",  _color);
    objj_msgSend(CPApp, "sendAction:to:from:", sel_getUid("changeColor:"), nil, self);
    if (_target && _action)
        objj_msgSend(CPApp, "sendAction:to:from:", _action, _target, self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPColorPanelColorDidChangeNotification, self);
    objj_msgSend(_activePicker, "setColor:", _color);
}
}), new objj_method(sel_getUid("setColor:updatePicker:"), function(self, _cmd, aColor, bool)
{ with(self)
{
    objj_msgSend(self, "setColor:", aColor);
    if (bool)
        objj_msgSend(_activePicker, "setColor:", _color);
}
}), new objj_method(sel_getUid("color"), function(self, _cmd)
{ with(self)
{
    return _color;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _target;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    return _action;
}
}), new objj_method(sel_getUid("setMode:"), function(self, _cmd, mode)
{ with(self)
{
    _mode = mode;
}
}), new objj_method(sel_getUid("_setPicker:"), function(self, _cmd, sender)
{ with(self)
{
    var picker = _colorPickers[objj_msgSend(sender, "tag")],
        view = objj_msgSend(picker, "provideNewView:", NO);
    if (!view)
        view = objj_msgSend(picker, "provideNewView:", YES);
    if (view == _currentView)
        return;
    if (_currentView)
        objj_msgSend(view, "setFrame:", objj_msgSend(_currentView, "frame"));
    else
    {
        var height = (TOOLBAR_HEIGHT+10+PREVIEW_HEIGHT+5+SWATCH_HEIGHT+10),
            bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds");
        objj_msgSend(view, "setFrameSize:",  CPSizeMake(bounds.size.width - 10, bounds.size.height - height));
        objj_msgSend(view, "setFrameOrigin:",  CPPointMake(5, height));
    }
    objj_msgSend(_currentView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", view);
    _currentView = view;
    _activePicker = picker;
    objj_msgSend(picker, "setColor:", objj_msgSend(self, "color"));
}
}), new objj_method(sel_getUid("mode"), function(self, _cmd)
{ with(self)
{
    return _mode;
}
}), new objj_method(sel_getUid("orderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "_loadContentsIfNecessary");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "orderFront:", aSender);
}
}), new objj_method(sel_getUid("_loadContentsIfNecessary"), function(self, _cmd)
{ with(self)
{
    if (_toolbar)
        return;
    _colorPickers = [];
    var count = objj_msgSend(ColorPickerClasses, "count");
    for (var i=0; i<count; i++)
    {
        var currentPickerClass = ColorPickerClasses[i],
            currentPicker = objj_msgSend(objj_msgSend(currentPickerClass, "alloc"), "initWithPickerMask:colorPanel:", 0, self);
        _colorPickers.push(currentPicker);
    }
    var contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    _toolbar = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 6, CGRectGetWidth(bounds), TOOLBAR_HEIGHT));
    objj_msgSend(_toolbar, "setAutoresizingMask:",  CPViewWidthSizable);
    var totalToolbarWidth = count * ICON_WIDTH + (count - 1) * ICON_PADDING,
        leftOffset = (CGRectGetWidth(bounds) - totalToolbarWidth) / 2.0,
        buttonForLater = nil;
    for (var i=0; i<count; i++)
    {
        var image = objj_msgSend(_colorPickers[i], "provideNewButtonImage"),
            highlightImage = objj_msgSend(_colorPickers[i], "provideNewAlternateButtonImage"),
            button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(leftOffset + i*(ICON_WIDTH+ICON_PADDING), 0, ICON_WIDTH, ICON_WIDTH));
        objj_msgSend(button, "setTag:", i);
        objj_msgSend(button, "setTarget:", self);
        objj_msgSend(button, "setAction:", sel_getUid("_setPicker:"));
        objj_msgSend(button, "setBordered:", NO);
        objj_msgSend(button, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin);
        objj_msgSend(button, "setImage:", image);
        objj_msgSend(button, "setAlternateImage:", highlightImage);
        objj_msgSend(_toolbar, "addSubview:", button);
        if (!buttonForLater)
            buttonForLater = button;
    }
    var previewBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10, CGRectGetWidth(bounds) - 86, PREVIEW_HEIGHT));
    _previewView = objj_msgSend(objj_msgSend(_CPColorPanelPreview, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(previewBox, "bounds"), 2.0, 2.0));
    objj_msgSend(_previewView, "setColorPanel:", self);
    objj_msgSend(_previewView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(previewBox, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "addSubview:", _previewView);
    _previewLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(10, TOOLBAR_HEIGHT + 13, 60, 15));
    objj_msgSend(_previewLabel, "setStringValue:",  "Preview:");
    objj_msgSend(_previewLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(_previewLabel, "setAlignment:", CPRightTextAlignment);
    var swatchBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10 + PREVIEW_HEIGHT + 5, CGRectGetWidth(bounds) - 86, SWATCH_HEIGHT + 2.0));
    objj_msgSend(swatchBox, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(swatchBox, "setAutoresizingMask:", CPViewWidthSizable);
    _swatchView = objj_msgSend(objj_msgSend(_CPColorPanelSwatches, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(swatchBox, "bounds"), 1.0, 1.0));
    objj_msgSend(_swatchView, "setColorPanel:",  self);
    objj_msgSend(_swatchView, "setAutoresizingMask:",  CPViewWidthSizable);
    objj_msgSend(swatchBox, "addSubview:", _swatchView);
    _swatchLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(10, TOOLBAR_HEIGHT + 8 + PREVIEW_HEIGHT + 7, 60, 15));
    objj_msgSend(_swatchLabel, "setStringValue:",  "Swatches:");
    objj_msgSend(_swatchLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(_swatchLabel, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(contentView, "addSubview:",  _toolbar);
    objj_msgSend(contentView, "addSubview:",  previewBox);
    objj_msgSend(contentView, "addSubview:",  _previewLabel);
    objj_msgSend(contentView, "addSubview:",  swatchBox);
    objj_msgSend(contentView, "addSubview:",  _swatchLabel);
    _target = nil;
    _action = nil;
    _activePicker = nil;
    objj_msgSend(_previewView, "setBackgroundColor:",  _color ? _color : objj_msgSend(CPColor, "whiteColor"));
    if (buttonForLater)
        objj_msgSend(self, "_setPicker:", buttonForLater);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("provideColorPickerClass:"), function(self, _cmd, aColorPickerSubclass)
{ with(self)
{
    ColorPickerClasses.push(aColorPickerSubclass);
}
}), new objj_method(sel_getUid("sharedColorPanel"), function(self, _cmd)
{ with(self)
{
    if (!SharedColorPanel)
        SharedColorPanel = objj_msgSend(objj_msgSend(CPColorPanel, "alloc"), "init");
    return SharedColorPanel;
}
}), new objj_method(sel_getUid("setPickerMode:"), function(self, _cmd, mode)
{ with(self)
{
    var panel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(panel, "setMode:",  mode);
}
})]);
}
CPColorDragType = "CPColorDragType";
var CPColorPanelSwatchesCookie = "CPColorPanelSwatchesCookie";
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelSwatches"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_swatches"), new objj_ivar("_dragColor"), new objj_ivar("_colorPanel"), new objj_ivar("_swatchCookie")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "setBackgroundColor:",  objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    var whiteColor = objj_msgSend(CPColor, "whiteColor");
    _swatchCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:",  CPColorPanelSwatchesCookie);
    var colorList = objj_msgSend(self, "startingColorList");
    _swatches = [];
    for(var i=0; i < 50; i++)
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(13*i+1, 1, 12, 12)),
            fillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(view, "bounds"), 1.0, 1.0));
        objj_msgSend(view, "setBackgroundColor:", whiteColor);
        objj_msgSend(fillView, "setBackgroundColor:",  (i < colorList.length) ? colorList[i] : whiteColor);
        objj_msgSend(view, "addSubview:", fillView);
        objj_msgSend(self, "addSubview:",  view);
        _swatches.push(view);
    }
    return self;
}
}), new objj_method(sel_getUid("isOpaque"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("startingColorList"), function(self, _cmd)
{ with(self)
{
    var cookieValue = objj_msgSend(_swatchCookie, "value");
    if(cookieValue == "")
    {
        return [
            objj_msgSend(CPColor, "blackColor"),
            objj_msgSend(CPColor, "darkGrayColor"),
            objj_msgSend(CPColor, "grayColor"),
            objj_msgSend(CPColor, "lightGrayColor"),
            objj_msgSend(CPColor, "whiteColor"),
            objj_msgSend(CPColor, "redColor"),
            objj_msgSend(CPColor, "greenColor"),
            objj_msgSend(CPColor, "blueColor"),
            objj_msgSend(CPColor, "yellowColor")
        ];
    }
    var cookieValue = eval(cookieValue);
    var result = [];
    for(var i=0; i<cookieValue.length; i++)
        result.push(objj_msgSend(CPColor, "colorWithHexString:",  cookieValue[i]));
    return result;
}
}), new objj_method(sel_getUid("saveColorList"), function(self, _cmd)
{ with(self)
{
    var result = [];
    for(var i=0; i<_swatches.length; i++)
        result.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i], "subviews")[0], "backgroundColor"), "hexString"));
    var future = new Date();
    future.setYear(2019);
    objj_msgSend(_swatchCookie, "setValue:expires:domain:",  CPJSObjectCreateJSON(result), future,  nil);
}
}), new objj_method(sel_getUid("setColorPanel:"), function(self, _cmd, panel)
{ with(self)
{
    _colorPanel = panel;
}
}), new objj_method(sel_getUid("colorPanel"), function(self, _cmd)
{ with(self)
{
    return _colorPanel;
}
}), new objj_method(sel_getUid("colorAtIndex:"), function(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_swatches[index], "subviews")[0], "backgroundColor");
}
}), new objj_method(sel_getUid("setColor:atIndex:"), function(self, _cmd, aColor, index)
{ with(self)
{
    objj_msgSend(objj_msgSend(_swatches[index], "subviews")[0], "setBackgroundColor:", aColor);
    objj_msgSend(self, "saveColorList");
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if(point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(_colorPanel, "setColor:updatePicker:",  objj_msgSend(self, "colorAtIndex:", FLOOR(point.x / 13)),  YES);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
     if(point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var swatch = _swatches[FLOOR(point.x / 13)];
    _dragColor = objj_msgSend(objj_msgSend(swatch, "subviews")[0], "backgroundColor");
    var bounds = CPRectCreateCopy(objj_msgSend(swatch, "bounds"));
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  bounds);
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds, 1.0, 1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", _dragColor);
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:",  dragView,  CPPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0),  CPPointMake(0.0, 0.0),  anEvent,  nil,  self,  YES);
}
}), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", _dragColor, aType);
}
}), new objj_method(sel_getUid("performDragOperation:"), function(self, _cmd, aSender)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(aSender, "draggingLocation"), nil),
        pasteboard = objj_msgSend(aSender, "draggingPasteboard"),
        swatch = nil;
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]) || location.x > objj_msgSend(self, "bounds").size.width - 1 || location.x < 1)
        return NO;
    objj_msgSend(self, "setColor:atIndex:", objj_msgSend(pasteboard, "dataForType:", CPColorDragType),  FLOOR(location.x / 13));
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelPreview"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_colorPanel")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    return self;
}
}), new objj_method(sel_getUid("setColorPanel:"), function(self, _cmd, aPanel)
{ with(self)
{
    _colorPanel = aPanel;
}
}), new objj_method(sel_getUid("colorPanel"), function(self, _cmd)
{ with(self)
{
    return _colorPanel;
}
}), new objj_method(sel_getUid("performDragOperation:"), function(self, _cmd, aSender)
{ with(self)
{
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]))
        return NO;
    var color = objj_msgSend(pasteboard, "dataForType:", CPColorDragType);
    objj_msgSend(_colorPanel, "setColor:updatePicker:",  color,  YES);
}
}), new objj_method(sel_getUid("isOpaque"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var bounds = CPRectMake(0, 0, 15, 15);
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  bounds);
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds, 1.0, 1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:",  dragView,  CPPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0),  CPPointMake(0.0, 0.0),  anEvent,  nil,  self,  YES);
}
}), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self, "backgroundColor"), aType);
}
})]);
}
i;15;CPColorPicker.ji;21;CPSliderColorPicker.jc;160;
objj_msgSend(CPColorPanel, "provideColorPickerClass:", CPColorWheelColorPicker);
objj_msgSend(CPColorPanel, "provideColorPickerClass:", CPSliderColorPicker);

p;15;CPColorPicker.jI;21;Foundation/CPObject.ji;14;CPColorPanel.jc;12356;
{var the_class = objj_allocateClassPair(CPObject, "CPColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_panel"), new objj_ivar("_mask")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function(self, _cmd, aMask, aPanel)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _panel = aPanel;
    _mask = aMask;
    return self;
}
}), new objj_method(sel_getUid("colorPanel"), function(self, _cmd)
{ with(self)
{
    return _panel;
}
}), new objj_method(sel_getUid("provideNewButtonImage"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("setMode:"), function(self, _cmd, mode)
{ with(self)
{
    return;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    return;
}
})]);
}
{var the_class = objj_allocateClassPair(CPColorPicker, "CPColorWheelColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_pickerView"), new objj_ivar("_brightnessSlider"), new objj_ivar("_brightnessBarImage"), new objj_ivar("_hueSaturationView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask,  owningColorPanel);
}
}), new objj_method(sel_getUid("initView"), function(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _pickerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(_pickerView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:",  CPColorPicker), "pathForResource:", "brightness_bar.png");
    _brightnessBarImage = new Image();
    _brightnessBarImage.src = path;
    _brightnessBarImage.style.width = "100%";
    _brightnessBarImage.style.height = "100%";
    _brightnessBarImage.style.position = "absolute";
    _brightnessBarImage.style.top = "0px";
    _brightnessBarImage.style.left = "0px";
    var brightnessBarView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(0, (aFrame.size.height - 34), aFrame.size.width, 15));
    objj_msgSend(brightnessBarView, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewMinYMargin));
    brightnessBarView._DOMElement.appendChild(_brightnessBarImage);
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(0, aFrame.size.height - 22, aFrame.size.width, 12));
    objj_msgSend(_brightnessSlider, "setMaxValue:",  100.0);
    objj_msgSend(_brightnessSlider, "setMinValue:",  0.0);
    objj_msgSend(_brightnessSlider, "setFloatValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setTarget:",  self);
    objj_msgSend(_brightnessSlider, "setAction:",  sel_getUid("brightnessSliderDidChange:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewMinYMargin));
    _hueSaturationView = objj_msgSend(objj_msgSend(__CPColorWheel, "alloc"), "initWithFrame:",  CPRectMake(0, 0, aFrame.size.width, aFrame.size.height - 38));
    objj_msgSend(_hueSaturationView, "setDelegate:",  self);
    objj_msgSend(_hueSaturationView, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewHeightSizable));
    objj_msgSend(_pickerView, "addSubview:",  brightnessBarView);
    objj_msgSend(_pickerView, "addSubview:",  _hueSaturationView);
    objj_msgSend(_pickerView, "addSubview:",  _brightnessSlider);
}
}), new objj_method(sel_getUid("brightnessSliderDidChange:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
}), new objj_method(sel_getUid("colorWheelDidChange:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
}), new objj_method(sel_getUid("updateColor"), function(self, _cmd)
{ with(self)
{
    var hue = objj_msgSend(_hueSaturationView, "angle"),
        saturation = objj_msgSend(_hueSaturationView, "distance"),
        brightness = objj_msgSend(_brightnessSlider, "floatValue");
    objj_msgSend(_hueSaturationView, "setWheelBrightness:",  brightness / 100.0);
    _brightnessBarImage.style.backgroundColor = "#"+objj_msgSend(objj_msgSend(CPColor, "colorWithHue:saturation:brightness:",  hue,  saturation,  100), "hexString");
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:",  hue,  saturation,  brightness));
}
}), new objj_method(sel_getUid("supportsMode:"), function(self, _cmd, mode)
{ with(self)
{
    return (mode == CPWheelColorPickerMode) ? YES : NO;
}
}), new objj_method(sel_getUid("currentMode"), function(self, _cmd)
{ with(self)
{
    return CPWheelColorPickerMode;
}
}), new objj_method(sel_getUid("provideNewView:"), function(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _pickerView;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, newColor)
{ with(self)
{
    var hsb = objj_msgSend(newColor, "hsbComponents");
    objj_msgSend(_hueSaturationView, "setPositionToColor:", newColor);
    objj_msgSend(_brightnessSlider, "setFloatValue:", hsb[2]);
    objj_msgSend(_hueSaturationView, "setWheelBrightness:", hsb[2] / 100.0);
    _brightnessBarImage.style.backgroundColor = "#"+objj_msgSend(objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1], 100), "hexString");
}
}), new objj_method(sel_getUid("provideNewButtonImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button.png"), CGSizeMake(32, 32));
}
}), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button_h.png"), CGSizeMake(32, 32));
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "__CPColorWheel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_blackWheelImage"), new objj_ivar("_crosshair"), new objj_ivar("_delegate"), new objj_ivar("_angle"), new objj_ivar("_distance"), new objj_ivar("_radius")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:",  aFrame);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:",  CPColorPicker), "pathForResource:", "wheel.png");
    _wheelImage = new Image();
    _wheelImage.src = path;
    _wheelImage.style.position = "absolute";
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:",  CPColorPicker), "pathForResource:", "wheel_black.png");
    _blackWheelImage = new Image();
    _blackWheelImage.src = path;
    _blackWheelImage.style.opacity = "0";
    _blackWheelImage.style.filter = "alpha(opacity=0)"
    _blackWheelImage.style.position = "absolute";
    _DOMElement.appendChild(_wheelImage);
    _DOMElement.appendChild(_blackWheelImage);
    objj_msgSend(self, "setWheelSize:",  aFrame.size);
    _crosshair = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(_radius - 2, _radius - 2, 4, 4));
    objj_msgSend(_crosshair, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(_crosshair, "bounds"), 1.0, 1.0));
    objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_crosshair, "addSubview:", view);
    objj_msgSend(self, "addSubview:",  _crosshair);
    return self;
}
}), new objj_method(sel_getUid("setWheelBrightness:"), function(self, _cmd, brightness)
{ with(self)
{
    _blackWheelImage.style.opacity = 1.0 - brightness;
    _blackWheelImage.style.filter = "alpha(opacity=" + (1.0 - brightness)*100 + ")"
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:",  aSize);
    objj_msgSend(self, "setWheelSize:",  aSize);
}
}), new objj_method(sel_getUid("setWheelSize:"), function(self, _cmd, aSize)
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
    objj_msgSend(self, "setAngle:distance:",  objj_msgSend(self, "degreesToRadians:",  _angle),  (_distance / 100.0) * _radius);
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("angle"), function(self, _cmd)
{ with(self)
{
    return _angle;
}
}), new objj_method(sel_getUid("distance"), function(self, _cmd)
{ with(self)
{
    return _distance;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:",  anEvent);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:",  anEvent);
}
}), new objj_method(sel_getUid("reposition:"), function(self, _cmd, anEvent)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        location = objj_msgSend(self, "convertPoint:fromView:",  objj_msgSend(anEvent, "locationInWindow"),  nil);
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    var distance = MIN(SQRT((location.x - midX)*(location.x - midX) + (location.y - midY)*(location.y - midY)), _radius);
    var angle = ATAN2(location.y - midY, location.x - midX);
    objj_msgSend(self, "setAngle:distance:",  angle,  distance);
    if(_delegate)
        objj_msgSend(_delegate, "colorWheelDidChange:",  self);
}
}), new objj_method(sel_getUid("setAngle:distance:"), function(self, _cmd, angle, distance)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    _angle = objj_msgSend(self, "radiansToDegrees:",  angle);
    _distance = (distance / _radius) * 100.0;
    objj_msgSend(_crosshair, "setFrameOrigin:", CPPointMake(COS(angle) * distance + midX - 2.0, SIN(angle) * distance + midY - 2.0));
}
}), new objj_method(sel_getUid("setPositionToColor:"), function(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents"),
        bounds = objj_msgSend(self, "bounds");
    var angle = objj_msgSend(self, "degreesToRadians:",  hsb[0]),
        distance = (hsb[1] / 100.0) * _radius;
    objj_msgSend(self, "setAngle:distance:",  angle,  distance);
}
}), new objj_method(sel_getUid("radiansToDegrees:"), function(self, _cmd, radians)
{ with(self)
{
    return ((-radians / PI) * 180 + 360) % 360;
}
}), new objj_method(sel_getUid("degreesToRadians:"), function(self, _cmd, degrees)
{ with(self)
{
    return -(((degrees - 360) / 180) * PI);
}
})]);
}

p;13;CPColorWell.jI;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jc;7348;
var _CPColorWellDidBecomeExclusiveNotification = "_CPColorWellDidBecomeExclusiveNotification";
{var the_class = objj_allocateClassPair(CPControl, "CPColorWell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_active"), new objj_ivar("_bordered"), new objj_ivar("_color"), new objj_ivar("_wellView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _active = NO;
        _bordered = YES;
        _color = objj_msgSend(CPColor, "whiteColor");
        objj_msgSend(self, "drawBezelWithHighlight:", NO);
        objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
        objj_msgSend(self, "_registerForNotifications");
    }
    return self;
}
}), new objj_method(sel_getUid("_registerForNotifications"), function(self, _cmd)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorWellDidBecomeExclusive:"), _CPColorWellDidBecomeExclusiveNotification, nil);
    objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("colorPanelWillClose:"), CPWindowWillCloseNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
}), new objj_method(sel_getUid("isBordered"), function(self, _cmd)
{ with(self)
{
    return _bordered;
}
}), new objj_method(sel_getUid("setBordered:"), function(self, _cmd, bordered)
{ with(self)
{
    if (_bordered == bordered)
        return;
    _bordered = bordered;
    objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
}
}), new objj_method(sel_getUid("color"), function(self, _cmd)
{ with(self)
{
    return _color;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_color == aColor)
        return;
    _color = aColor;
    objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
}
}), new objj_method(sel_getUid("takeColorFrom:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "setColor:", objj_msgSend(aSender, "color"));
}
}), new objj_method(sel_getUid("activate:"), function(self, _cmd, shouldBeExclusive)
{ with(self)
{
    if (shouldBeExclusive)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", _CPColorWellDidBecomeExclusiveNotification, self);
    if (objj_msgSend(self, "isActive"))
        return;
    _active = YES;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("colorPanelDidChangeColor:"), CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
}), new objj_method(sel_getUid("deactivate"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isActive"))
        return;
    _active = NO;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPColorPanelColorDidChangeNotification, objj_msgSend(CPColorPanel, "sharedColorPanel"));
}
}), new objj_method(sel_getUid("isActive"), function(self, _cmd)
{ with(self)
{
    return _active;
}
}), new objj_method(sel_getUid("drawBezelWithHighlight:"), function(self, _cmd, shouldHighlight)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawWellInside:"), function(self, _cmd, aRect)
{ with(self)
{
    if (!_wellView)
    {
        _wellView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aRect);
        objj_msgSend(_wellView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", _wellView);
    }
    else
        objj_msgSend(_wellView, "setFrame:", aRect);
    objj_msgSend(_wellView, "setBackgroundColor:", _color);
}
}), new objj_method(sel_getUid("colorPanelDidChangeColor:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "takeColorFrom:", objj_msgSend(aNotification, "object"));
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
}), new objj_method(sel_getUid("colorWellDidBecomeExclusive:"), function(self, _cmd, aNotification)
{ with(self)
{
    if (self != objj_msgSend(aNotification, "object"))
        objj_msgSend(self, "deactivate");
}
}), new objj_method(sel_getUid("colorPanelWillClose:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "deactivate");
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", YES);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "drawBezelWithHighlight:", CGRectContainsPoint(objj_msgSend(self, "bounds"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)));
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
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
})]);
}
var CPColorWellColorKey = "CPColorWellColorKey",
    CPColorWellBorderedKey = "CPColorWellBorderedKey";
{
var the_class = objj_getClass("CPColorWell")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColorWell\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _active = NO;
        _bordered = objj_msgSend(aCoder, "decodeObjectForKey:", CPColorWellBorderedKey);
        _color = objj_msgSend(aCoder, "decodeObjectForKey:", CPColorWellColorKey);
        objj_msgSend(self, "drawBezelWithHighlight:", NO);
        objj_msgSend(self, "drawWellInside:", CGRectInset(objj_msgSend(self, "bounds"), 3.0, 3.0));
        objj_msgSend(self, "_registerForNotifications");
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = objj_msgSend(_subviews, "copy");
    objj_msgSend(_subviews, "removeObjectIdenticalTo:", _wellView);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _color, CPColorWellColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _bordered, CPColorWellBorderedKey);
}
})]);
}

p;17;CPCompatibility.ji;9;CPEvent.jc;4279;
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
CPJavaScriptCanvasTransformFeature = 1 << 13;
CPVMLFeature = 1 << 14;
CPJavascriptRemedialKeySupport = 1 << 15;
CPJavaScriptShadowFeature = 1 << 20;
CPJavaScriptNegativeMouseWheelValues = 1 << 22;
CPJavaScriptMouseWheelValues_8_15 = 1 << 23
CPOpacityRequiresFilterFeature = 1 << 24;
var USER_AGENT = "",
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
    PLATFORM_FEATURES |= CPOpacityRequiresFilterFeature;
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
else if (USER_AGENT.indexOf("KHTML") != -1)
{
    PLATFORM_ENGINE = CPKHTMLBrowserEngine;
}
else if (USER_AGENT.indexOf("Gecko") != -1)
{
    PLATFORM_ENGINE = CPGeckoBrowserEngine;
    PLATFORM_FEATURES |= CPJavaScriptCanvasDrawFeature;
    var index = USER_AGENT.indexOf("Firefox"),
        version = (index == -1) ? 2.0 : parseFloat(USER_AGENT.substring(index + "Firefox".length + 1));
    if (version >= 3.0)
        PLATFORM_FEATURES |= CPCSSRGBAFeature;
    var geckoIndex = USER_AGENT.indexOf("Gecko"),
        geckoVersion = (geckoIndex === -1) ? 0.0 : parseFloat(USER_AGENT.substring(geckoIndex + "Gecko".length + 1, USER_AGENT.indexOf(' ', geckoIndex)));
    if (version < 20061028)
        PLATFORM_FEATURES |= CPJavaScriptMouseWheelValues_8_15;
}
if (typeof document != "undefined")
{
    var canvasElement = document.createElement("canvas");
    if (canvasElement && canvasElement.getContext)
    {
        PLATFORM_FEATURES |= CPHTMLCanvasFeature;
        var context = document.createElement("canvas").getContext("2d");
        if (context && context.setTransform && context.transform)
            PLATFORM_FEATURES |= CPJavaScriptCanvasTransformFeature;
    }
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
CPBrowserIsEngine= function(anEngine)
{
    return PLATFORM_ENGINE == anEngine;
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

p;11;CPControl.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;23552;
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
CPControlTextDidBeginEditingNotification = "CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification = "CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification = "CPControlTextDidEndEditingNotification";
var CPControlBlackColor = objj_msgSend(CPColor, "blackColor");
{var the_class = objj_allocateClassPair(CPView, "CPControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_value"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_sendActionOn"), new objj_ivar("_continuousTracking"), new objj_ivar("_trackingWasWithinFrame"), new objj_ivar("_trackingMouseDownFlags"), new objj_ivar("_previousTrackingLocation"), new objj_ivar("_controlState"), new objj_ivar("_ephemeralSubviewsForNames"), new objj_ivar("_ephereralSubviews"), new objj_ivar("_toolTip"), new objj_ivar("_isBezeled")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _controlState = CPControlStateNormal;
        _sendActionOn = CPLeftMouseUpMask;
        _trackingMouseDownFlags = 0;
    }
    return self;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    return _action;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _target;
}
}), new objj_method(sel_getUid("sendAction:to:"), function(self, _cmd, anAction, anObject)
{ with(self)
{
    objj_msgSend(CPApp, "sendAction:to:from:", anAction, anObject, self);
}
}), new objj_method(sel_getUid("sendActionOn:"), function(self, _cmd, mask)
{ with(self)
{
    var previousMask = _sendActionOn;
    _sendActionOn = mask;
    return previousMask;
}
}), new objj_method(sel_getUid("isContinuous"), function(self, _cmd)
{ with(self)
{
    return (_sendActionOn & CPPeriodicMask) !== 0;
}
}), new objj_method(sel_getUid("setContinuous:"), function(self, _cmd, flag)
{ with(self)
{
    if (flag)
        _sendActionOn |= CPPeriodicMask;
    else
        _sendActionOn &= ~CPPeriodicMask;
}
}), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("trackMouse:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        currentLocation = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        isWithinFrame = objj_msgSend(self, "tracksMouseOutsideOfFrame") || CGRectContainsPoint(objj_msgSend(self, "bounds"), currentLocation);
    if (type === CPLeftMouseUp)
    {
        objj_msgSend(self, "stopTracking:at:mouseIsUp:", _previousTrackingLocation, currentLocation, YES);
        _trackingMouseDownFlags = 0;
    }
    else
    {
        if (type === CPLeftMouseDown)
        {
            _trackingMouseDownFlags = objj_msgSend(anEvent, "modifierFlags");
            _continuousTracking = objj_msgSend(self, "startTrackingAt:", currentLocation);
        }
        else if (type === CPLeftMouseDragged)
        {
            if (isWithinFrame)
            {
                if (!_trackingWasWithinFrame)
                    _continuousTracking = objj_msgSend(self, "startTrackingAt:", currentLocation);
                else if (_continuousTracking)
                    _continuousTracking = objj_msgSend(self, "continueTracking:at:", _previousTrackingLocation, currentLocation);
            }
            else
                objj_msgSend(self, "stopTracking:at:mouseIsUp:", _previousTrackingLocation, currentLocation, NO);
        }
        objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
    }
    if ((_sendActionOn & (1 << type)) && isWithinFrame)
        objj_msgSend(self, "sendAction:to:", _action, _target);
    _trackingWasWithinFrame = isWithinFrame;
    _previousTrackingLocation = currentLocation;
}
}), new objj_method(sel_getUid("mouseDownFlags"), function(self, _cmd)
{ with(self)
{
    return _trackingMouseDownFlags;
}
}), new objj_method(sel_getUid("startTrackingAt:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "highlight:", YES);
    return (_sendActionOn & CPPeriodicMask) || (_sendActionOn & CPLeftMouseDraggedMask);
}
}), new objj_method(sel_getUid("continueTracking:at:"), function(self, _cmd, lastPoint, aPoint)
{ with(self)
{
    return (_sendActionOn & CPPeriodicMask) || (_sendActionOn & CPLeftMouseDraggedMask);
}
}), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    objj_msgSend(self, "highlight:", NO);
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "trackMouse:", anEvent);
}
}), new objj_method(sel_getUid("objectValue"), function(self, _cmd)
{ with(self)
{
    return _value;
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, anObject)
{ with(self)
{
    _value = anObject;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("floatValue"), function(self, _cmd)
{ with(self)
{
    var floatValue = parseFloat(_value, 10);
    return isNaN(floatValue) ? 0.0 : floatValue;
}
}), new objj_method(sel_getUid("setFloatValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", aValue);
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    var doubleValue = parseFloat(_value, 10);
    return isNaN(doubleValue) ? 0.0 : doubleValue;
}
}), new objj_method(sel_getUid("setDoubleValue:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
}), new objj_method(sel_getUid("intValue"), function(self, _cmd)
{ with(self)
{
    var intValue = parseInt(_value, 10);
    return isNaN(intValue) ? 0.0 : intValue;
}
}), new objj_method(sel_getUid("setIntValue:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
}), new objj_method(sel_getUid("integerValue"), function(self, _cmd)
{ with(self)
{
    var intValue = parseInt(_value, 10);
    return isNaN(intValue) ? 0.0 : intValue;
}
}), new objj_method(sel_getUid("setIntegerValue:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
}), new objj_method(sel_getUid("stringValue"), function(self, _cmd)
{ with(self)
{
    return (_value === undefined || _value === nil) ? "" : String(_value);
}
}), new objj_method(sel_getUid("setStringValue:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anObject);
}
}), new objj_method(sel_getUid("takeDoubleValueFrom:"), function(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("doubleValue")))
        objj_msgSend(self, "setDoubleValue:", objj_msgSend(sender, "doubleValue"));
}
}), new objj_method(sel_getUid("takeFloatValueFrom:"), function(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("floatValue")))
        objj_msgSend(self, "setFloatValue:", objj_msgSend(sender, "floatValue"));
}
}), new objj_method(sel_getUid("takeIntegerValueFrom:"), function(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("integerValue")))
        objj_msgSend(self, "setIntegerValue:", objj_msgSend(sender, "integerValue"));
}
}), new objj_method(sel_getUid("takeIntValueFrom:"), function(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("intValue")))
        objj_msgSend(self, "setIntValue:", objj_msgSend(sender, "intValue"));
}
}), new objj_method(sel_getUid("takeObjectValueFrom:"), function(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("objectValue")))
        objj_msgSend(self, "setObjectValue:", objj_msgSend(sender, "objectValue"));
}
}), new objj_method(sel_getUid("takeStringValueFrom:"), function(self, _cmd, sender)
{ with(self)
{
    if (objj_msgSend(sender, "respondsToSelector:", sel_getUid("stringValue")))
        objj_msgSend(self, "setStringValue:", objj_msgSend(sender, "stringValue"));
}
}), new objj_method(sel_getUid("textDidBeginEditing:"), function(self, _cmd, note)
{ with(self)
{
    if(objj_msgSend(note, "object") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(note, "object"), "CPFieldEditor"));
}
}), new objj_method(sel_getUid("textDidChange:"), function(self, _cmd, note)
{ with(self)
{
    if(objj_msgSend(note, "object") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPControlTextDidChangeNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(note, "object"), "CPFieldEditor"));
}
}), new objj_method(sel_getUid("textDidEndEditing:"), function(self, _cmd, note)
{ with(self)
{
    if(objj_msgSend(note, "object") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPControlTextDidEndEditingNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(note, "object"), "CPFieldEditor"));
}
}), new objj_method(sel_getUid("setAlignment:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "alignment");}
}), new objj_method(sel_getUid("alignment"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "alignment");}
}), new objj_method(sel_getUid("setVerticalAlignment:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "vertical-alignment");}
}), new objj_method(sel_getUid("verticalAlignment"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "vertical-alignment");}
}), new objj_method(sel_getUid("setLineBreakMode:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "line-break-mode");}
}), new objj_method(sel_getUid("lineBreakMode"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "line-break-mode");}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "text-color");}
}), new objj_method(sel_getUid("textColor"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "text-color");}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "font");}
}), new objj_method(sel_getUid("font"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "font");}
}), new objj_method(sel_getUid("setTextShadowColor:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "text-shadow-color");}
}), new objj_method(sel_getUid("textShadowColor"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "text-shadow-color");}
}), new objj_method(sel_getUid("setTextShadowOffset:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "text-shadow-offset");}
}), new objj_method(sel_getUid("textShadowOffset"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "text-shadow-offset");}
}), new objj_method(sel_getUid("setImagePosition:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "image-position");}
}), new objj_method(sel_getUid("imagePosition"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "image-position");}
}), new objj_method(sel_getUid("setImageScaling:"), function(self, _cmd, aValue)
{ with(self)
{objj_msgSend(self, "setValue:forThemedAttributeName:", aValue, "image-scaling");}
}), new objj_method(sel_getUid("imageScaling"), function(self, _cmd)
{ with(self)
{return objj_msgSend(self, "valueForThemedAttributeName:", "image-scaling");}
}), new objj_method(sel_getUid("controlState"), function(self, _cmd)
{ with(self)
{
    return _controlState;
}
}), new objj_method(sel_getUid("setEnabled:"), function(self, _cmd, isEnabled)
{ with(self)
{
    if ((!(_controlState & CPControlStateDisabled)) === isEnabled)
        return;
    if (isEnabled)
        _controlState &= ~CPControlStateDisabled;
    else
        _controlState |= CPControlStateDisabled;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isEnabled"), function(self, _cmd)
{ with(self)
{
    return !(_controlState & CPControlStateDisabled);
}
}), new objj_method(sel_getUid("highlight:"), function(self, _cmd, shouldHighlight)
{ with(self)
{
    objj_msgSend(self, "setHighlighted:", shouldHighlight);
}
}), new objj_method(sel_getUid("setHighlighted:"), function(self, _cmd, isHighlighted)
{ with(self)
{
    if ((!!(_controlState & CPControlStateHighlighted)) === isHighlighted)
        return;
    if (isHighlighted)
        _controlState |= CPControlStateHighlighted;
    else
        _controlState &= ~CPControlStateHighlighted;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isHighlighted"), function(self, _cmd)
{ with(self)
{
    return !!(_controlState & CPControlStateHighlighted);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aViewName)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aViewName)
{ with(self)
{
    return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
}
}), new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"), function(self, _cmd, aViewName, anOrderingMode, relativeToViewName)
{ with(self)
{
    if (!_ephemeralSubviewsForNames)
    {
        _ephemeralSubviewsForNames = {};
        _ephemeralSubviews = objj_msgSend(CPSet, "set");
    }
    var frame = objj_msgSend(self, "rectForEphemeralSubviewNamed:", aViewName);
    if (frame && !(frame.size.width <= 0.0 || frame.size.height <= 0.0))
    {
        if (!_ephemeralSubviewsForNames[aViewName])
        {
            _ephemeralSubviewsForNames[aViewName] = objj_msgSend(self, "createEphemeralSubviewNamed:", aViewName);
            objj_msgSend(_ephemeralSubviews, "addObject:", _ephemeralSubviewsForNames[aViewName]);
            if (_ephemeralSubviewsForNames[aViewName])
                objj_msgSend(self, "addSubview:positioned:relativeTo:", _ephemeralSubviewsForNames[aViewName], anOrderingMode, _ephemeralSubviewsForNames[relativeToViewName]);
        }
        if (_ephemeralSubviewsForNames[aViewName])
            objj_msgSend(_ephemeralSubviewsForNames[aViewName], "setFrame:", frame);
    }
    else if (_ephemeralSubviewsForNames[aViewName])
    {
        objj_msgSend(_ephemeralSubviewsForNames[aViewName], "removeFromSuperview");
        objj_msgSend(_ephemeralSubviews, "removeObject:", _ephemeralSubviewsForNames[aViewName]);
        delete _ephemeralSubviewsForNames[aViewName];
    }
    return _ephemeralSubviewsForNames[aViewName];
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [
        CPLeftTextAlignment, CPTopVerticalTextAlignment, CPLineBreakByClipping, objj_msgSend(CPColor, "blackColor"), objj_msgSend(CPFont, "systemFontOfSize:", 12.0), nil, { width:0.0, height:0.0 }, CPImageLeft, CPScaleToFit], ["alignment", "vertical-alignment", "line-break-mode", "text-color", "font", "text-shadow-color", "text-shadow-offset", "image-position", "image-scaling"]);
}
})]);
}
var CPControlValueKey = "CPControlValueKey",
    CPControlControlStateKey = "CPControlControlStateKey",
    CPControlIsEnabledKey = "CPControlIsEnabledKey",
    CPControlTargetKey = "CPControlTargetKey",
    CPControlActionKey = "CPControlActionKey",
    CPControlSendActionOnKey = "CPControlSendActionOnKey";
var __Deprecated__CPImageViewImageKey = "CPImageViewImageKey";
{
var the_class = objj_getClass("CPControl")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPControl\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        _controlState = objj_msgSend(aCoder, "decodeObjectForKey:", CPControlControlStateKey);
        objj_msgSend(self, "setObjectValue:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlValueKey));
        objj_msgSend(self, "setTarget:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlTargetKey));
        objj_msgSend(self, "setAction:", objj_msgSend(aCoder, "decodeObjectForKey:", CPControlActionKey));
        objj_msgSend(self, "sendActionOn:", objj_msgSend(aCoder, "decodeIntForKey:", CPControlSendActionOnKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var count = objj_msgSend(_subviews, "count"),
        ephemeral
        subviews = nil;
    if (count > 0 && objj_msgSend(_ephemeralSubviews, "count") > 0)
    {
        subviews = objj_msgSend(_subviews.slice(0), "copy");
        while (count--)
            if (objj_msgSend(_ephemeralSubviews, "containsObject:", _subviews[count]))
                _subviews.splice(count, 1);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    if (subviews)
        _subviews = subviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _controlState, CPControlControlStateKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _value, CPControlValueKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _target, CPControlTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _action, CPControlActionKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _sendActionOn, CPControlSendActionOnKey);
}
})]);
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
        color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", aClassName + "/" + identifier + ".png"), sizes[identifier]));
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
        images = [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path + "0.png"), sizes[0]),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path + "1.png"), sizes[1]),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path + "2.png"), sizes[2])
                ];
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
        color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path + "0.png"), sizes[0]),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path + "1.png"), sizes[1]),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", path + "2.png"), sizes[2])
                ], isVertical));
        _CPControlCachedThreePartImagePattern[identifier] = color;
    }
    return color;
}

p;10;CPCookie.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1690;
{var the_class = objj_allocateClassPair(CPObject, "CPCookie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookieName"), new objj_ivar("_cookieValue"), new objj_ivar("_expires")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _cookieName = aName;
    _cookieValue = objj_msgSend(self, "_readCookieValue");
    return self;
}
}), new objj_method(sel_getUid("value"), function(self, _cmd)
{ with(self)
{
    return _cookieValue;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _cookieName;
}
}), new objj_method(sel_getUid("expires"), function(self, _cmd)
{ with(self)
{
    return _expires;
}
}), new objj_method(sel_getUid("setValue:expires:domain:"), function(self, _cmd, value, date, domain)
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
}), new objj_method(sel_getUid("_readCookieValue"), function(self, _cmd)
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
})]);
}

p;12;CPDocument.jI;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;20;CPWindowController.jc;15878;
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
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
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
}), new objj_method(sel_getUid("initWithType:error:"), function(self, _cmd, aType, anError)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
        objj_msgSend(self, "setFileType:", aType);
    return self;
}
}), new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
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
}), new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo)
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
}), new objj_method(sel_getUid("dataOfType:error:"), function(self, _cmd, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataOfType:error: must be overridden by the document subclass.");
}
}), new objj_method(sel_getUid("readFromData:ofType:error:"), function(self, _cmd, aData, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "readFromData:ofType: must be overridden by the document subclass.");
}
}), new objj_method(sel_getUid("makeWindowControllers"), function(self, _cmd)
{ with(self)
{
    var controller = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindowCibName:", nil);
    objj_msgSend(self, "addWindowController:", controller);
}
}), new objj_method(sel_getUid("windowControllers"), function(self, _cmd)
{ with(self)
{
    return _windowControllers;
}
}), new objj_method(sel_getUid("addWindowController:"), function(self, _cmd, aWindowController)
{ with(self)
{
    objj_msgSend(_windowControllers, "addObject:", aWindowController);
    if (objj_msgSend(aWindowController, "document") != self)
    {
        objj_msgSend(aWindowController, "setNextResponder:", self);
        objj_msgSend(aWindowController, "setDocument:", self);
    }
}
}), new objj_method(sel_getUid("showWindows"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("showWindow:"), self);
}
}), new objj_method(sel_getUid("displayName"), function(self, _cmd)
{ with(self)
{
    if (_fileURL)
        return objj_msgSend(_fileURL, "lastPathComponent");
    if (!_untitledDocumentIndex)
        _untitledDocumentIndex = ++CPDocumentUntitledCount;
 if (_untitledDocumentIndex == 1)
    return "Untitled";
 return "Untitled " + _untitledDocumentIndex;
}
}), new objj_method(sel_getUid("windowCibName"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("windowControllerDidLoadNib:"), function(self, _cmd, aWindowController)
{ with(self)
{
}
}), new objj_method(sel_getUid("windowControllerWillLoadNib:"), function(self, _cmd, aWindowController)
{ with(self)
{
}
}), new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(_readConnection, "cancel");
    _readConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL), self);
    _readConnection.session = _CPReadSessionMake(aType, aDelegate, aDidReadSelector, aContextInfo);
}
}), new objj_method(sel_getUid("fileURL"), function(self, _cmd)
{ with(self)
{
    return _fileURL;
}
}), new objj_method(sel_getUid("setFileURL:"), function(self, _cmd, aFileURL)
{ with(self)
{
    if (_fileURL == aFileURL)
        return;
    _fileURL = aFileURL;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:", sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}), new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aTypeName, aSaveOperation, aDelegate, aDidSaveSelector, aContextInfo)
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
}), new objj_method(sel_getUid("connection:didReceiveResponse:"), function(self, _cmd, aConnection, aResponse)
{ with(self)
{
    if (!objj_msgSend(aResponse, "isKindOfClass:", objj_msgSend(CPHTTPURLResponse, "class")))
        return;
    var statusCode = objj_msgSend(aResponse, "statusCode");
    if (statusCode === 200)
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
                    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
                }
                _writeRequest = nil;
                objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
            }
        }
    }
}
}), new objj_method(sel_getUid("connection:didReceiveData:"), function(self, _cmd, aConnection, aData)
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
}), new objj_method(sel_getUid("connection:didFailWithError:"), function(self, _cmd, aConnection, anError)
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
            objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
        }
        _writeRequest = nil;
        alert("There was an error saving the document.");
        objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
    }
}
}), new objj_method(sel_getUid("connectionDidFinishLoading:"), function(self, _cmd, aConnection)
{ with(self)
{
    if (_readConnection == aConnection)
        _readConnection = nil;
}
}), new objj_method(sel_getUid("isDocumentEdited"), function(self, _cmd)
{ with(self)
{
    return _changeCount != 0;
}
}), new objj_method(sel_getUid("updateChangeCount:"), function(self, _cmd, aChangeType)
{ with(self)
{
    if (aChangeType == CPChangeDone)
        ++_changeCount;
    else if (aChangeType == CPChangeUndone)
        --_changeCount;
    else if (aChangeType == CPChangeCleared)
        _changeCount = 0;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
}
}), new objj_method(sel_getUid("setFileType:"), function(self, _cmd, aType)
{ with(self)
{
    _fileType = aType;
}
}), new objj_method(sel_getUid("fileType"), function(self, _cmd)
{ with(self)
{
    return _fileType;
}
}), new objj_method(sel_getUid("hasUndoManager"), function(self, _cmd)
{ with(self)
{
    return _hasUndoManager;
}
}), new objj_method(sel_getUid("setHasUndoManager:"), function(self, _cmd, aFlag)
{ with(self)
{
    if (_hasUndoManager == aFlag)
        return;
    _hasUndoManager = aFlag;
    if (!_hasUndoManager)
        objj_msgSend(self, "setUndoManager:", nil);
}
}), new objj_method(sel_getUid("_undoManagerWillCloseGroup:"), function(self, _cmd, aNotification)
{ with(self)
{
    var undoManager = objj_msgSend(aNotification, "object");
    if (objj_msgSend(undoManager, "isUndoing") || objj_msgSend(undoManager, "isRedoing"))
        return;
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
}), new objj_method(sel_getUid("_undoManagerDidUndoChange:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeUndone);
}
}), new objj_method(sel_getUid("_undoManagerDidRedoChange:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
}), new objj_method(sel_getUid("setUndoManager:"), function(self, _cmd, anUndoManager)
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
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidUndoChange:"), CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidRedoChange:"), CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerWillCloseGroup:"), CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
}
}), new objj_method(sel_getUid("undoManager"), function(self, _cmd)
{ with(self)
{
    if (_hasUndoManager && !_undoManager)
        objj_msgSend(self, "setUndoManager:", objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init"));
    return _undoManager;
}
}), new objj_method(sel_getUid("windowWillReturnUndoManager:"), function(self, _cmd, aWindow)
{ with(self)
{
    return objj_msgSend(self, "undoManager");
}
}), new objj_method(sel_getUid("saveDocument:"), function(self, _cmd, aSender)
{ with(self)
{
    if (_fileURL)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
        objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", _fileURL, objj_msgSend(self, "fileType"), CPSaveOperation, self, sel_getUid("document:didSave:contextInfo:"), NULL);
    }
    else
        objj_msgSend(self, "saveDocumentAs:", self);
}
}), new objj_method(sel_getUid("saveDocumentAs:"), function(self, _cmd, aSender)
{ with(self)
{
    _documentName = window.prompt("Document Name:");
    if (!_documentName)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
    objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", objj_msgSend(self, "proposedFileURL"), objj_msgSend(self, "fileType"), CPSaveAsOperation, self, sel_getUid("document:didSave:contextInfo:"), NULL);
}
}), new objj_method(sel_getUid("document:didSave:contextInfo:"), function(self, _cmd, aDocument, didSave, aContextInfo)
{ with(self)
{
    if (didSave)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidSaveNotification, self);
    else
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidFailToSaveNotification, self);
}
})]);
}
var _CPReadSessionMake = function(aType, aDelegate, aDidReadSelector, aContextInfo)
{
    return { fileType:aType, delegate:aDelegate, didReadSelector:aDidReadSelector, contextInfo:aContextInfo };
}
var _CPSaveSessionMake = function(anAbsoluteURL, aSaveOperation, aChangeCount, aDelegate, aDidSaveSelector, aContextInfo, aConnection)
{
    return { absoluteURL:anAbsoluteURL, saveOperation:aSaveOperation, changeCount:aChangeCount, delegate:aDelegate, didSaveSelector:aDidSaveSelector, contextInfo:aContextInfo, connection:aConnection };
}

p;22;CPDocumentController.jI;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.jc;7155;
var CPSharedDocumentController = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDocumentController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documents"), new objj_ivar("_documentTypes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
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
}), new objj_method(sel_getUid("documentForURL:"), function(self, _cmd, aURL)
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
}), new objj_method(sel_getUid("openUntitledDocumentOfType:display:"), function(self, _cmd, aType, shouldDisplay)
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
}), new objj_method(sel_getUid("makeUntitledDocumentOfType:error:"), function(self, _cmd, aType, anError)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initWithType:error:", aType, anError);
}
}), new objj_method(sel_getUid("openDocumentWithContentsOfURL:display:error:"), function(self, _cmd, anAbsoluteURL, shouldDisplay, anError)
{ with(self)
{
    var result = objj_msgSend(self, "documentForURL:", anAbsoluteURL);
    if (!result)
    {
        var type = objj_msgSend(self, "typeForContentsOfURL:error:", anAbsoluteURL, anError);
        result = objj_msgSend(self, "makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, type, self, sel_getUid("document:didRead:contextInfo:"), objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", shouldDisplay, "shouldDisplay"));
    }
    else if (shouldDisplay)
        objj_msgSend(result, "showWindows");
    return result;
}
}), new objj_method(sel_getUid("reopenDocumentForURL:withContentsOfURL:error:"), function(self, _cmd, anAbsoluteURL, absoluteContentsURL, anError)
{ with(self)
{
    return objj_msgSend(self, "makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, objj_msgSend(objj_msgSend(_documentTypes, "objectAtIndex:", 0), "objectForKey:", "CPBundleTypeName"), self, sel_getUid("document:didRead:contextInfo:"), nil);
}
}), new objj_method(sel_getUid("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo);
}
}), new objj_method(sel_getUid("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo);
}
}), new objj_method(sel_getUid("document:didRead:contextInfo:"), function(self, _cmd, aDocument, didRead, aContextInfo)
{ with(self)
{
    if (!didRead)
        return;
    objj_msgSend(self, "addDocument:", aDocument);
    objj_msgSend(aDocument, "makeWindowControllers");
    if (objj_msgSend(aContextInfo, "objectForKey:", "shouldDisplay"))
        objj_msgSend(aDocument, "showWindows");
}
}), new objj_method(sel_getUid("newDocument:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "openUntitledDocumentOfType:display:", objj_msgSend(objj_msgSend(_documentTypes, "objectAtIndex:", 0), "objectForKey:", "CPBundleTypeName"), YES);
}
}), new objj_method(sel_getUid("documents"), function(self, _cmd)
{ with(self)
{
    return _documents;
}
}), new objj_method(sel_getUid("addDocument:"), function(self, _cmd, aDocument)
{ with(self)
{
    objj_msgSend(_documents, "addObject:", aDocument);
}
}), new objj_method(sel_getUid("removeDocument:"), function(self, _cmd, aDocument)
{ with(self)
{
    objj_msgSend(_documents, "removeObjectIdenticalTo:", aDocument);
}
}), new objj_method(sel_getUid("defaultType"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_documentTypes[0], "objectForKey:", "CPBundleTypeName");
}
}), new objj_method(sel_getUid("typeForContentsOfURL:error:"), function(self, _cmd, anAbsoluteURL, outError)
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
}), new objj_method(sel_getUid("_infoForType:"), function(self, _cmd, aType)
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
}), new objj_method(sel_getUid("documentClassForType:"), function(self, _cmd, aType)
{ with(self)
{
    var className = objj_msgSend(objj_msgSend(self, "_infoForType:", aType), "objectForKey:", "CPDocumentClass");
    return className ? CPClassFromString(className) : nil;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedDocumentController"), function(self, _cmd)
{ with(self)
{
    if (!CPSharedDocumentController)
        objj_msgSend(objj_msgSend(self, "alloc"), "init");
    return CPSharedDocumentController;
}
})]);
}

p;20;CPDOMDisplayServer.jI;22;Foundation/CPRunLoop.jc;6104;
var CPDOMDisplayRunLoop = nil;
CPDOMDisplayServerInstructions = [];
CPDOMDisplayServerInstructionCount = 0;
CPDOMDisplayServerViews = [];
CPDOMDisplayServerViewsCount = 0;
CPDOMDisplayServerViewsContext = {};
{var the_class = objj_allocateClassPair(CPObject, "CPDOMDisplayServer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    CPDOMDisplayRunLoop = objj_msgSend(CPRunLoop, "currentRunLoop");
    objj_msgSend(CPDOMDisplayRunLoop, "performSelector:target:argument:order:modes:", sel_getUid("run"), CPDOMDisplayServer, nil, 0, [CPDefaultRunLoopMode]);
}
}), new objj_method(sel_getUid("run"), function(self, _cmd)
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
                case 6: CPDOMDisplayServerInstructions[index].appendChild(CPDOMDisplayServerInstructions[index + 1]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                case 7: CPDOMDisplayServerInstructions[index].insertBefore(CPDOMDisplayServerInstructions[index + 1], CPDOMDisplayServerInstructions[index + 2]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                case 8: CPDOMDisplayServerInstructions[index].removeChild(CPDOMDisplayServerInstructions[index + 1]);
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
            objj_msgSend(view, "layoutIfNeeded");
            objj_msgSend(view, "displayIfNeeded");
        }
    }
    objj_msgSend(CPDOMDisplayRunLoop, "performSelector:target:argument:order:modes:", sel_getUid("run"), CPDOMDisplayServer, nil, 0, [CPDefaultRunLoopMode]);
}
})]);
}
objj_msgSend(CPDOMDisplayServer, "start");

p;19;CPDOMWindowBridge.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.jc;32427;
CPSharedDOMWindowBridge = nil;
var ExcludedDOMElements = [];
var CPDOMWindowGetFrame,
    CPDOMEventGetClickCount,
    CPDOMEventStop;
{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowBridge"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_orderedWindows"), new objj_ivar("_mouseDownWindow"), new objj_ivar("_DOMWindow"), new objj_ivar("_DOMBodyElement"), new objj_ivar("_DOMFocusElement"), new objj_ivar("_windowLevels"), new objj_ivar("_windowLayers"), new objj_ivar("_frame"), new objj_ivar("_contentBounds"), new objj_ivar("_mouseIsDown"), new objj_ivar("_lastMouseUp"), new objj_ivar("_lastMouseDown"), new objj_ivar("_charCodes"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEventMode"), new objj_ivar("_DOMPasteboardElement"), new objj_ivar("_pasteboardKeyDownEvent"), new objj_ivar("_overriddenEventType")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    alert("unimplemented");
}
}), new objj_method(sel_getUid("_initWithDOMWindow:"), function(self, _cmd, aDOMWindow)
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
        _DOMBodyElement.style.webkitTouchCallout = "none";
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
            keyEventSelector = sel_getUid("_bridgeKeyEvent:"),
            keyEventImplementation = class_getMethodImplementation(theClass, keyEventSelector),
            keyEventCallback = function (anEvent) { keyEventImplementation(self, nil, anEvent); },
            mouseEventSelector = sel_getUid("_bridgeMouseEvent:"),
            mouseEventImplementation = class_getMethodImplementation(theClass, mouseEventSelector),
            mouseEventCallback = function (anEvent) { mouseEventImplementation(self, nil, anEvent); },
            scrollEventSelector = sel_getUid("_bridgeScrollEvent:"),
            scrollEventImplementation = class_getMethodImplementation(theClass, scrollEventSelector),
            scrollEventCallback = function (anEvent) { scrollEventImplementation(self, nil, anEvent); },
            resizeEventSelector = sel_getUid("_bridgeResizeEvent:"),
            resizeEventImplementation = class_getMethodImplementation(theClass, resizeEventSelector),
            resizeEventCallback = function (anEvent) { resizeEventImplementation(self, nil, anEvent); },
            touchEventSelector = sel_getUid("_bridgeTouchEvent:"),
            touchEventImplementation = class_getMethodImplementation(theClass, touchEventSelector),
            touchEventCallback = function (anEvent) { touchEventImplementation(self, nil, anEvent); },
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
            theDocument.addEventListener(CPDOMEventTouchStart, touchEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchEnd, touchEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchMove, touchEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchCancel, touchEventCallback, NO);
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
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    return CGRectMakeCopy(_frame);
}
}), new objj_method(sel_getUid("visibleFrame"), function(self, _cmd)
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
}), new objj_method(sel_getUid("contentBounds"), function(self, _cmd)
{ with(self)
{
    return CPRectCreateCopy(_contentBounds);
}
}), new objj_method(sel_getUid("orderedWindowsAtLevel:"), function(self, _cmd, aLevel)
{ with(self)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", aLevel, NO);
    if (!layer)
        return [];
    return objj_msgSend(layer, "orderedWindows");
}
}), new objj_method(sel_getUid("layerAtLevel:create:"), function(self, _cmd, aLevel, aFlag)
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
        objj_msgSend(_windowLevels, "insertObject:atIndex:", aLevel, _windowLevels[middle] > aLevel ? middle : middle + 1);
        layer._DOMElement.style.zIndex = aLevel;
        _DOMBodyElement.appendChild(layer._DOMElement);
    }
    return layer;
}
}), new objj_method(sel_getUid("order:window:relativeTo:"), function(self, _cmd, aPlace, aWindow, otherWindow)
{ with(self)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", objj_msgSend(aWindow, "level"), aPlace != CPWindowOut);
    if (aPlace == CPWindowOut)
        return objj_msgSend(layer, "removeWindow:", aWindow);
    objj_msgSend(layer, "insertWindow:atIndex:", aWindow, (otherWindow ? (aPlace == CPWindowAbove ? otherWindow._index + 1 : otherWindow._index) : CPNotFound));
}
}), new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        if (levels[levelCount] >= CPDraggingWindowLevel)
            continue;
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
        {
            var theWindow = windows[windowCount];
            if (objj_msgSend(theWindow, "containsPoint:", aPoint))
                return objj_msgSend(theWindow, "_dragHitTest:pasteboard:", aPoint, aPasteboard);
        }
    }
    return nil;
}
}), new objj_method(sel_getUid("_propagateCurrentDOMEvent:"), function(self, _cmd, aFlag)
{ with(self)
{
    StopDOMEventPropagation = !aFlag;
}
}), new objj_method(sel_getUid("hitTest:"), function(self, _cmd, location)
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
        {
            var candidateWindow = windows[windowCount];
            if (!candidateWindow._ignoresMouseEvents && objj_msgSend(candidateWindow, "containsPoint:", location))
                theWindow = candidateWindow;
        }
    }
    return theWindow;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedDOMWindowBridge"), function(self, _cmd)
{ with(self)
{
    if (!CPSharedDOMWindowBridge)
        CPSharedDOMWindowBridge = objj_msgSend(objj_msgSend(CPDOMWindowBridge, "alloc"), "_initWithDOMWindow:", window);
    return CPSharedDOMWindowBridge;
}
})]);
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
    KeyCodesWithoutKeyPressEvents = { '8':1, '9':1, '37':1, '38':1, '39':1, '40':1, '46':1, '33':1, '34':1 };
var CTRL_KEY_CODE = 17;
{
var the_class = objj_getClass("CPDOMWindowBridge")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPDOMWindowBridge\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"), function(self, _cmd, characters)
{ with(self)
{
    for(var i=characters.length; i>0; i--)
        CharacterKeysToPrevent[""+characters[i-1].toLowerCase()] = YES;
}
}), new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"), function(self, _cmd, character)
{ with(self)
{
    CharacterKeysToPrevent[character.toLowerCase()] = YES;
}
}), new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"), function(self, _cmd)
{ with(self)
{
    CharacterKeysToPrevent = {};
}
}), new objj_method(sel_getUid("preventKeyCodesFromPropagating:"), function(self, _cmd, keyCodes)
{ with(self)
{
    for(var i=keyCodes.length; i>0; i--)
        KeyCodesToPrevent[keyCodes[i-1]] = YES;
}
}), new objj_method(sel_getUid("preventKeyCodeFromPropagating:"), function(self, _cmd, keyCode)
{ with(self)
{
    KeyCodesToPrevent[keyCode] = YES;
}
}), new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"), function(self, _cmd)
{ with(self)
{
    KeyCodesToPrevent = {};
}
}), new objj_method(sel_getUid("_bridgeMouseEvent:"), function(self, _cmd, aDOMEvent)
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
                                            event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseUp, timestamp, location), 0);
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
                                            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0));
                                            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0));
                                            return;
                                        }
                                        event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0);
                                        _mouseIsDown = YES;
                                        _lastMouseDown = event;
                                        break;
            case CPDOMEventMouseMoved: if (_DOMEventMode)
                                            return;
                                        event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", _mouseIsDown ? CPLeftMouseDragged : CPMouseMoved, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0);
                                        break;
        }
        if (event)
        {
            event._DOMEvent = aDOMEvent;
            objj_msgSend(CPApp, "sendEvent:", event);
        }
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeKeyEvent:"), function(self, _cmd, aDOMEvent)
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
                                  CharacterKeysToPrevent[String.fromCharCode(aDOMEvent.keyCode || aDOMEvent.charCode).toLowerCase()] ||
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
                                            window.setNativeTimeout(function () { objj_msgSend(self, "_checkPasteboardElement") }, 0);
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
                                        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, location, modifierFlags,  timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, NO, keyCode);
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
                    window.setNativeTimeout(function() { objj_msgSend(self, "_clearPasteboardElement"); }, 0);
                }
                return;
            }
        }
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeScrollEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    if(!aDOMEvent)
        aDOMEvent = window.event;
    try
    {
        if (CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15))
        {
            var x = 0.0,
                y = 0.0,
                element = aDOMEvent.target;
            while (element.nodeType !== 1)
                element = element.parentNode;
            if (element.offsetParent)
            {
                do
                {
                    x += element.offsetLeft;
                    y += element.offsetTop;
                } while (element = element.offsetParent);
            }
            var location = { x:(x + ((aDOMEvent.clientX - 8) / 15)), y:(y + ((aDOMEvent.clientY - 8) / 15)) };}
        else
            var location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY };
        var deltaX = 0.0,
            deltaY = 0.0,
            windowNumber = 0,
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
        var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPScrollWheel, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0 );
        event._DOMEvent = aDOMEvent;
        event._deltaX = ROUND(deltaX * 1.5);
        event._deltaY = ROUND(deltaY * 1.5);
        objj_msgSend(CPApp, "sendEvent:", event);
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeResizeEvent:"), function(self, _cmd, aDOMEvent)
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
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeTouchEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    try
    {
        if (aDOMEvent.touches && (aDOMEvent.touches.length == 1 || (aDOMEvent.touches.length == 0 && aDOMEvent.changedTouches.length == 1)))
        {
            var newEvent = {};
            switch(aDOMEvent.type)
            {
                case CPDOMEventTouchStart: newEvent.type = CPDOMEventMouseDown;
                                            break;
                case CPDOMEventTouchEnd: newEvent.type = CPDOMEventMouseUp;
                                            break;
                case CPDOMEventTouchMove: newEvent.type = CPDOMEventMouseMoved;
                                            break;
                case CPDOMEventTouchCancel: newEvent.type = CPDOMEventMouseUp;
                                            break;
            }
            var touch = aDOMEvent.touches.length ? aDOMEvent.touches[0] : aDOMEvent.changedTouches[0];
            newEvent.clientX = touch.clientX;
            newEvent.clientY = touch.clientY;
            newEvent.timestamp = aDOMEvent.timestamp;
            newEvent.target = aDOMEvent.target;
            newEvent.shiftKey = newEvent.ctrlKey = newEvent.altKey = newEvent.metaKey = false;
                newEvent.preventDefault = function(){if(aDOMEvent.preventDefault) aDOMEvent.preventDefault()};
                newEvent.stopPropagation = function(){if(aDOMEvent.stopPropagation) aDOMEvent.stopPropagation()};
            objj_msgSend(self, "_bridgeMouseEvent:", newEvent);
            return;
        }
        else
        {
            if (aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            if (aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
        }
    }
    catch(e)
    {
        objj_exception_report(e, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_checkPasteboardElement"), function(self, _cmd)
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
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_clearPasteboardElement"), function(self, _cmd)
{ with(self)
{
    _DOMPasteboardElement.value = "";
    _DOMPasteboardElement.blur();
}
})]);
}
var CLICK_SPACE_DELTA = 5.0,
    CLICK_TIME_DELTA = (typeof document != "undefined" && document.addEventListener) ? 350.0 : 1000.0;
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

p;18;CPDOMWindowLayer.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jc;3124;
{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowLayer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_level"), new objj_ivar("_windows"), new objj_ivar("_DOMElement")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithLevel:"), function(self, _cmd, aLevel)
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
}), new objj_method(sel_getUid("level"), function(self, _cmd)
{ with(self)
{
    return _level;
}
}), new objj_method(sel_getUid("removeWindow:"), function(self, _cmd, aWindow)
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
}), new objj_method(sel_getUid("insertWindow:atIndex:"), function(self, _cmd, aWindow, anIndex)
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
        if (objj_msgSend(aWindow, "isFullBridge"))
            objj_msgSend(aWindow, "setFrame:", objj_msgSend(aWindow._bridge, "contentBounds"));
    }
}
}), new objj_method(sel_getUid("orderedWindows"), function(self, _cmd)
{ with(self)
{
    return _windows;
}
})]);
}

p;14;CPDragServer.jI;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;11168;
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
        CPDragServerLocation = objj_msgSend((objj_msgSend(CPDragServerDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? CPDragServerDestination : objj_msgSend(CPDragServerDestination, "window")), "convertBridgeToBase:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")));
        objj_msgSend(CPDragServerView, "removeFromSuperview");
        objj_msgSend(CPSharedDragServer._dragWindow, "orderOut:", nil);
        if (CPDragServerDestination &&
            (!objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("prepareForDragOperation:")) || objj_msgSend(CPDragServerDestination, "prepareForDragOperation:", CPDragServerDraggingInfo)) &&
            (!objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("performDragOperation:")) || objj_msgSend(CPDragServerDestination, "performDragOperation:", CPDragServerDraggingInfo)) &&
            objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("concludeDragOperation:")))
            objj_msgSend(CPDragServerDestination, "concludeDragOperation:", CPDragServerDraggingInfo);
        if (CPDragServerShouldSendDraggedImageEndedAtOperation)
            objj_msgSend(CPDragServerSource, "draggedImage:endedAt:operation:", objj_msgSend(CPDragServerView, "image"), CPDragServerLocation, NO);
        else if (CPDragServerShouldSendDraggedViewEndedAtOperation)
            objj_msgSend(CPDragServerSource, "draggedView:endedAt:operation:", CPDragServerView, CPDragServerLocation, NO);
        CPDragServerIsDraggingImage = NO;
        CPDragServerDestination = nil;
        return;
    }
    objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", CPDragServerUpdateDragging, CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, 0, NO);
    var location = objj_msgSend(anEvent, "locationInWindow"),
        operation =
        bridgeLocation = objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", location);
    var draggingDestination = objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_dragHitTest:pasteboard:", bridgeLocation, CPDragServerPasteboard);
    CPDragServerLocation = objj_msgSend((objj_msgSend(draggingDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? draggingDestination : objj_msgSend(draggingDestination, "window")), "convertBridgeToBase:", bridgeLocation);
    if(draggingDestination != CPDragServerDestination)
    {
        if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("draggingExited:")))
            objj_msgSend(CPDragServerDestination, "draggingExited:", CPDragServerDraggingInfo);
        CPDragServerDestination = draggingDestination;
        if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("draggingEntered:")))
            objj_msgSend(CPDragServerDestination, "draggingEntered:", CPDragServerDraggingInfo);
    }
    else if (CPDragServerDestination && objj_msgSend(CPDragServerDestination, "respondsToSelector:", sel_getUid("draggingUpdated:")))
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
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("draggingSource"), function(self, _cmd)
{ with(self)
{
    return CPDragServerSource;
}
}), new objj_method(sel_getUid("draggingLocation"), function(self, _cmd)
{ with(self)
{
    return CPDragServerLocation;
}
}), new objj_method(sel_getUid("draggingPasteboard"), function(self, _cmd)
{ with(self)
{
    return CPDragServerPasteboard;
}
}), new objj_method(sel_getUid("draggedImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDragServerView, "image");
}
}), new objj_method(sel_getUid("draggedImageLocation"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "draggedViewLocation");
}
}), new objj_method(sel_getUid("draggedViewLocation"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend((objj_msgSend(CPDragServerDestination, "isKindOfClass:", objj_msgSend(CPWindow, "class")) ? CPDragServerDestination : objj_msgSend(CPDragServerDestination, "window")), "convertBridgeToBase:", objj_msgSend(CPDragServerView, "frame").origin);
}
}), new objj_method(sel_getUid("draggedView"), function(self, _cmd)
{ with(self)
{
    return CPDragServerView;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDragServer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dragWindow"), new objj_ivar("_imageView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
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
}), new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, aView, aWindow, viewLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
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
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedImage:beganAt:")))
            objj_msgSend(CPDragServerSource, "draggedImage:beganAt:", objj_msgSend(aView, "image"), viewLocation);
        CPDragServerShouldSendDraggedImageMovedTo = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedImage:movedTo:"));
        CPDragServerShouldSendDraggedImageEndedAtOperation = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedImage:endAt:operation:"));
        CPDragServerShouldSendDraggedViewMovedTo = NO;
        CPDragServerShouldSendDraggedViewEndedAtOperation = NO;
    }
    else
    {
        if (objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedView:beganAt:")))
            objj_msgSend(CPDragServerSource, "draggedView:beganAt:", aView, viewLocation);
        CPDragServerShouldSendDraggedViewMovedTo = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedView:movedTo:"));
        CPDragServerShouldSendDraggedViewEndedAtOperation = objj_msgSend(CPDragServerSource, "respondsToSelector:", sel_getUid("draggedView:endedAt:operation:"));
        CPDragServerShouldSendDraggedImageMovedTo = NO;
        CPDragServerShouldSendDraggedImageEndedAtOperation = NO;
    }
    CPDragServerStartDragging(anEvent);
}
}), new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, anImage, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    CPDragServerIsDraggingImage = YES;
    if (!_imageView)
        _imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CPRectMakeZero());
    objj_msgSend(_imageView, "setImage:", anImage);
    objj_msgSend(_imageView, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(anImage, "size")));
    objj_msgSend(self, "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", _imageView, aWindow, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPDragServer, "class"))
        return;
    CPDragServerDraggingInfo = objj_msgSend(objj_msgSend(CPDraggingInfo, "alloc"), "init");
}
}), new objj_method(sel_getUid("sharedDragServer"), function(self, _cmd)
{ with(self)
{
    if (!CPSharedDragServer)
        CPSharedDragServer = objj_msgSend(objj_msgSend(CPDragServer, "alloc"), "init");
    return CPSharedDragServer;
}
})]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    if (!_inclusiveRegisteredDraggedTypes)
        return nil;
    var adjustedPoint = { x:aPoint.x - (_frame.origin.x), y:aPoint.y - (_frame.origin.y) },
        hitView = objj_msgSend(_windowView, "hitTest:", adjustedPoint);
    while (hitView && !objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(hitView, "registeredDraggedTypes")))
        hitView = objj_msgSend(hitView, "superview");
    if (hitView)
        return hitView;
    if (objj_msgSend(aPasteboard, "availableTypeFromArray:", objj_msgSend(self, "registeredDraggedTypes")))
        return self;
    return nil;
}
})]);
}

p;9;CPEvent.jI;21;Foundation/CPObject.jc;9874;
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
CPTouchStart = 28;
CPTouchMove = 29;
CPTouchEnd = 30;
CPTouchCancel = 31;
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
CPDOMEventTouchStart = "touchstart";
CPDOMEventTouchMove = "touchmove";
CPDOMEventTouchEnd = "touchend";
CPDOMEventTouchCancel = "touchcancel";
var _CPEventPeriodicEventPeriod = 0,
    _CPEventPeriodicEventTimer = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPEvent"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_type"), new objj_ivar("_location"), new objj_ivar("_modifierFlags"), new objj_ivar("_timestamp"), new objj_ivar("_context"), new objj_ivar("_eventNumber"), new objj_ivar("_clickCount"), new objj_ivar("_pressure"), new objj_ivar("_window"), new objj_ivar("_characters"), new objj_ivar("_isARepeat"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEvent"), new objj_ivar("_deltaX"), new objj_ivar("_deltaY"), new objj_ivar("_deltaZ")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
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
}), new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, isARepeat, code)
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
}), new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
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
}), new objj_method(sel_getUid("locationInWindow"), function(self, _cmd)
{ with(self)
{
    return _location;
}
}), new objj_method(sel_getUid("modifierFlags"), function(self, _cmd)
{ with(self)
{
    return _modifierFlags;
}
}), new objj_method(sel_getUid("timestamp"), function(self, _cmd)
{ with(self)
{
    return _timestamp;
}
}), new objj_method(sel_getUid("type"), function(self, _cmd)
{ with(self)
{
    return _type;
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("windowNumber"), function(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
}), new objj_method(sel_getUid("buttonNumber"), function(self, _cmd)
{ with(self)
{
    return _buttonNumber;
}
}), new objj_method(sel_getUid("clickCount"), function(self, _cmd)
{ with(self)
{
    return _clickCount;
}
}), new objj_method(sel_getUid("characters"), function(self, _cmd)
{ with(self)
{
    return _characters;
}
}), new objj_method(sel_getUid("charactersIgnoringModifiers"), function(self, _cmd)
{ with(self)
{
    return _charactersIgnoringModifiers;
}
}), new objj_method(sel_getUid("isARepeat"), function(self, _cmd)
{ with(self)
{
    return _isARepeat;
}
}), new objj_method(sel_getUid("keyCode"), function(self, _cmd)
{ with(self)
{
    return _keyCode;
}
}), new objj_method(sel_getUid("pressure"), function(self, _cmd)
{ with(self)
{
    return _pressure;
}
}), new objj_method(sel_getUid("_DOMEvent"), function(self, _cmd)
{ with(self)
{
    return _DOMEvent;
}
}), new objj_method(sel_getUid("deltaX"), function(self, _cmd)
{ with(self)
{
    return _deltaX;
}
}), new objj_method(sel_getUid("deltaY"), function(self, _cmd)
{ with(self)
{
    return _deltaY;
}
}), new objj_method(sel_getUid("deltaZ"), function(self, _cmd)
{ with(self)
{
    return _deltaZ;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"), function(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, characters, unmodCharacters, repeatKey, code);
}
}), new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"), function(self, _cmd, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure);
}
}), new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"), function(self, _cmd, anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", anEventType, aLocation, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, aSubtype, aData1, aData2);
}
}), new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"), function(self, _cmd, aDelay, aPeriod)
{ with(self)
{
    _CPEventPeriodicEventPeriod = aPeriod;
    _CPEventPeriodicEventTimer = window.setTimeout(function() { _CPEventPeriodicEventTimer = window.setInterval(_CPEventFirePeriodEvent, aPeriod * 1000.0); }, aDelay * 1000.0);
}
}), new objj_method(sel_getUid("stopPeriodicEvents"), function(self, _cmd)
{ with(self)
{
    if (_CPEventPeriodicEventTimer === nil)
        return;
    window.clearTimeout(_CPEventPeriodicEventTimer);
    _CPEventPeriodicEventTimer = nil;
}
})]);
}
_CPEventFirePeriodEvent= function()
{
    objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:", CPPeriodic, { x:0.0, y:0.0 }, 0, 0, 0, nil, 0, 0, 0));
}

p;14;CPFlashMovie.jI;21;Foundation/CPObject.jc;780;
{var the_class = objj_allocateClassPair(CPObject, "CPFlashMovie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fileName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFile:"), function(self, _cmd, aFileName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _fileName = aFileName;
    return self;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("flashMovieWithFile:"), function(self, _cmd, aFileName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFile:", aFileName);
}
})]);
}

p;13;CPFlashView.ji;19;CPDOMWindowBridge.ji;14;CPFlashMovie.ji;8;CPView.jc;2635;
{var the_class = objj_allocateClassPair(CPView, "CPFlashView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_flashMovie"), new objj_ivar("_DOMEmbedElement"), new objj_ivar("_DOMMParamElement"), new objj_ivar("_DOMObjectElement")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
        _DOMEmbedElement.setAttribute("wmode", "transparent");
        _DOMEmbedElement.width = "100%";
        _DOMEmbedElement.height = "100%";
        _DOMElement.appendChild(_DOMEmbedElement);
        _DOMElement.appendChild(_DOMObjectElement);
    }
    return self;
}
}), new objj_method(sel_getUid("setFlashMovie:"), function(self, _cmd, aFlashMovie)
{ with(self)
{
    if (_flashMovie == aFlashMovie)
        return;
    _flashMovie = aFlashMovie;
    _DOMParamElement.value = aFlashMovie._fileName;
    if (_DOMEmbedElement)
       _DOMEmbedElement.src = aFlashMovie._fileName;
}
}), new objj_method(sel_getUid("flashMovie"), function(self, _cmd)
{ with(self)
{
    return _flashMovie;
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_propagateCurrentDOMEvent:", YES);
}
})]);
}

p;8;CPFont.jc;3404;var _CPFonts = {};
    _CPFontSystemFontFace = "Arial";
{var the_class = objj_allocateClassPair(CPObject, "CPFont"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_size"), new objj_ivar("_isBold"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithName:size:bold:"), function(self, _cmd, aName, aSize, isBold)
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
}), new objj_method(sel_getUid("size"), function(self, _cmd)
{ with(self)
{
    return _size;
}
}), new objj_method(sel_getUid("cssString"), function(self, _cmd)
{ with(self)
{
    return _cssString;
}
}), new objj_method(sel_getUid("familyName"), function(self, _cmd)
{ with(self)
{
    return _name;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("fontWithName:size:"), function(self, _cmd, aName, aSize)
{ with(self)
{
    return _CPFonts[(NO ? "bold " : "") + ROUND(aSize) + "px '" + aName + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", aName, aSize, NO);
}
}), new objj_method(sel_getUid("boldFontWithName:size:"), function(self, _cmd, aName, aSize)
{ with(self)
{
    return _CPFonts[(YES ? "bold " : "") + ROUND(aSize) + "px '" + aName + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", aName, aSize, YES);
}
}), new objj_method(sel_getUid("systemFontOfSize:"), function(self, _cmd, aSize)
{ with(self)
{
    return _CPFonts[(NO ? "bold " : "") + ROUND(aSize) + "px '" + _CPFontSystemFontFace + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", _CPFontSystemFontFace, aSize, NO);
}
}), new objj_method(sel_getUid("boldSystemFontOfSize:"), function(self, _cmd, aSize)
{ with(self)
{
    return _CPFonts[(YES ? "bold " : "") + ROUND(aSize) + "px '" + _CPFontSystemFontFace + "'"] || objj_msgSend(objj_msgSend(CPFont, "alloc"), "_initWithName:size:bold:", _CPFontSystemFontFace, aSize, YES);
}
})]);
}
var CPFontNameKey = "CPFontNameKey",
    CPFontSizeKey = "CPFontSizeKey",
    CPFontIsBoldKey = "CPFontIsBoldKey";
{
var the_class = objj_getClass("CPFont")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPFont\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "_initWithName:size:bold:", objj_msgSend(aCoder, "decodeObjectForKey:", CPFontNameKey), objj_msgSend(aCoder, "decodeFloatForKey:", CPFontSizeKey), objj_msgSend(aCoder, "decodeBoolForKey:", CPFontIsBoldKey));
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPFontNameKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _size, CPFontSizeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isBold, CPFontIsBoldKey);
}
})]);
}

p;15;CPFontManager.jI;21;Foundation/CPObject.jI;15;AppKit/CPFont.jc;4690;
var CPSharedFontManager = nil,
    CPFontManagerFactory = Nil;
{var the_class = objj_allocateClassPair(CPObject, "CPFontManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_availableFonts")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("availableFonts"), function(self, _cmd)
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
    _CPFontDetectReferenceFonts = _CPFontDetectPickTwoDifferentFonts(["monospace", "serif", "sans-serif", "cursive"]);
        _availableFonts = [];
        for (var i = 0; i < _CPFontDetectAllFonts.length; i++) {
            var available = _CPFontDetectFontAvailable(_CPFontDetectAllFonts[i]);
      if (available)
                _availableFonts.push(_CPFontDetectAllFonts[i]);
        }
    }
    return _availableFonts;
}
}), new objj_method(sel_getUid("fontWithNameIsAvailable:"), function(self, _cmd, aFontName)
{ with(self)
{
    return _CPFontDetectFontAvailable(aFontName);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedFontManager"), function(self, _cmd)
{ with(self)
{
    if (!CPSharedFontManager)
        CPSharedFontManager = objj_msgSend(objj_msgSend(CPFontManagerFactory, "alloc"), "init");
    return CPSharedFontManager;
}
}), new objj_method(sel_getUid("setFontManagerFactory:"), function(self, _cmd, aClass)
{ with(self)
{
    CPFontManagerFactory = aClass;
}
})]);
}
var _CPFontDetectSpan,
    _CPFontDetectReferenceFonts,
    _CPFontDetectAllFonts = [
        "American Typewriter",
        "Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS",
        "Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif",
        "Brush Script MT",
        "Cambria",
        "Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L",
        "Comic Sans", "Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New",
        "Futura",
        "Geneva","Georgia","Georgia Ref", "Geeza Pro", "Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed",
        "Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow",
        "Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode",
        "Marker Felt",
        "Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT",
        "Papyrus",
        "Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS",
        "Verdana","Verdana Ref",
        "Zapfino"];
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
    return [candidates[i], candidates[j]];
 return [candidates[0]];
}
objj_msgSend(CPFontManager, "setFontManagerFactory:", objj_msgSend(CPFontManager, "class"));

p;12;CPGeometry.ji;12;CGGeometry.jc;5444;
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
    return { x:parseFloat(aString.substr(1, comma - 1), 10), y:parseFloat(aString.substring(comma + 1, aString.length), 10) };
}
CPSizeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { width:parseFloat(aString.substr(1, comma - 1), 10), height:parseFloat(aString.substring(comma + 1, aString.length), 10) };
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

p;19;CPGraphicsContext.jc;1274;var CPGraphicsContextCurrent = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPGraphicsContext"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_graphicsPort")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithGraphicsPort:"), function(self, _cmd, aGraphicsPort)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _graphicsPort = aGraphicsPort;
    return self;
}
}), new objj_method(sel_getUid("graphicsPort"), function(self, _cmd)
{ with(self)
{
    return _graphicsPort;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("currentContext"), function(self, _cmd)
{ with(self)
{
    return CPGraphicsContextCurrent;
}
}), new objj_method(sel_getUid("setCurrentContext:"), function(self, _cmd, aGraphicsContext)
{ with(self)
{
    CPGraphicsContextCurrent = aGraphicsContext;
}
}), new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"), function(self, _cmd, aContext, aFlag)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithGraphicsPort:", aContext);
}
})]);
}

p;9;CPImage.jI;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;10856;
CPImageLoadStatusInitialized = 0;
CPImageLoadStatusLoading = 1;
CPImageLoadStatusCompleted = 2;
CPImageLoadStatusCancelled = 3;
CPImageLoadStatusInvalidData = 4;
CPImageLoadStatusUnexpectedEOF = 5;
CPImageLoadStatusReadError = 6;
CPImageDidLoadNotification = "CPImageDidLoadNotification";
CPImageInBundle= function(aFilename, aSize, aBundle)
{
    if (!aBundle)
        aBundle = objj_msgSend(CPBundle, "mainBundle");
    if (aSize)
        return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(aBundle, "pathForResource:", aFilename), aSize);
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(aBundle, "pathForResource:", aFilename));
}
{
var the_class = objj_getClass("CPBundle")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPBundle\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("pathForResource:"), function(self, _cmd, aFilename)
{ with(self)
{
    return objj_msgSend(self, "resourcePath") + '/' + aFilename;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_size"), new objj_ivar("_filename"), new objj_ivar("_delegate"), new objj_ivar("_loadStatus"), new objj_ivar("_image")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initByReferencingFile:size:"), function(self, _cmd, aFilename, aSize)
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
}), new objj_method(sel_getUid("initWithContentsOfFile:size:"), function(self, _cmd, aFilename, aSize)
{ with(self)
{
    self = objj_msgSend(self, "initByReferencingFile:size:", aFilename, aSize);
    if (self)
        objj_msgSend(self, "load");
    return self;
}
}), new objj_method(sel_getUid("initWithContentsOfFile:"), function(self, _cmd, aFilename)
{ with(self)
{
    self = objj_msgSend(self, "initByReferencingFile:size:", aFilename,  CGSizeMake(-1, -1));
    if (self)
        objj_msgSend(self, "load");
    return self;
}
}), new objj_method(sel_getUid("filename"), function(self, _cmd)
{ with(self)
{
    return _filename;
}
}), new objj_method(sel_getUid("setSize:"), function(self, _cmd, aSize)
{ with(self)
{
    _size = CGSizeMakeCopy(aSize);
}
}), new objj_method(sel_getUid("size"), function(self, _cmd)
{ with(self)
{
    return _size;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("loadStatus"), function(self, _cmd)
{ with(self)
{
    return _loadStatus;
}
}), new objj_method(sel_getUid("load"), function(self, _cmd)
{ with(self)
{
    if (_loadStatus == CPImageLoadStatusLoading || _loadStatus == CPImageLoadStatusCompleted)
        return;
    _loadStatus = CPImageLoadStatusLoading;
    _image = new Image();
    var isSynchronous = YES;
    _image.onload = function ()
        {
            if (isSynchronous)
                window.setTimeout(function() { objj_msgSend(self, "_imageDidLoad"); }, 0);
            else
            {
                objj_msgSend(self, "_imageDidLoad");
                objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            }
        }
    _image.onerror = function ()
        {
            if (isSynchronous)
                window.setTimeout(function() { objj_msgSend(self, "_imageDidError"); }, 0);
            else
            {
                objj_msgSend(self, "_imageDidError");
                objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            }
        }
    _image.onabort = function ()
        {
            if (isSynchronous)
                window.setTimeout(function() { objj_msgSend(self, "_imageDidAbort"); }, 0);
            else
            {
                objj_msgSend(self, "_imageDidAbort");
                objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            }
        }
    _image.src = _filename;
    isSynchronous = NO;
}
}), new objj_method(sel_getUid("isThreePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("isNinePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("_imageDidLoad"), function(self, _cmd)
{ with(self)
{
    _loadStatus = CPImageLoadStatusCompleted;
    if (!_size || (_size.width == -1 && _size.height == -1))
        _size = CGSizeMake(_image.width, _image.height);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPImageDidLoadNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("imageDidLoad:")))
        objj_msgSend(_delegate, "imageDidLoad:", self);
}
}), new objj_method(sel_getUid("_imageDidError"), function(self, _cmd)
{ with(self)
{
    _loadStatus = CPImageLoadStatusReadError;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("imageDidError:")))
        objj_msgSend(_delegate, "imageDidError:", self);
}
}), new objj_method(sel_getUid("_imageDidAbort"), function(self, _cmd)
{ with(self)
{
    _loadStatus = CPImageLoadStatusCancelled;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("imageDidAbort:")))
        objj_msgSend(_delegate, "imageDidAbort:", self);
}
})]);
}
{
var the_class = objj_getClass("CPImage")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPImage\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "initWithContentsOfFile:size:", objj_msgSend(aCoder, "decodeObjectForKey:", "CPFilename"), objj_msgSend(aCoder, "decodeSizeForKey:", "CPSize"));
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _filename, "CPFilename");
    objj_msgSend(aCoder, "encodeSize:forKey:", _size, "CPSize");
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPThreePartImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageSlices"), new objj_ivar("_isVertical")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithImageSlices:isVertical:"), function(self, _cmd, imageSlices, isVertical)
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
}), new objj_method(sel_getUid("filename"), function(self, _cmd)
{ with(self)
{
    return "";
}
}), new objj_method(sel_getUid("imageSlices"), function(self, _cmd)
{ with(self)
{
    return _imageSlices;
}
}), new objj_method(sel_getUid("isVertical"), function(self, _cmd)
{ with(self)
{
    return _isVertical;
}
}), new objj_method(sel_getUid("isThreePartImage"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("isNinePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
}
var CPThreePartImageImageSlicesKey = "CPThreePartImageImageSlicesKey",
    CPThreePartImageIsVerticalKey = "CPThreePartImageIsVerticalKey";
{
var the_class = objj_getClass("CPThreePartImage")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPThreePartImage\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
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
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _imageSlices, CPThreePartImageImageSlicesKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isVertical, CPThreePartImageIsVerticalKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPNinePartImage"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_imageSlices")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithImageSlices:"), function(self, _cmd, imageSlices)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _imageSlices = imageSlices;
    return self;
}
}), new objj_method(sel_getUid("filename"), function(self, _cmd)
{ with(self)
{
    return "";
}
}), new objj_method(sel_getUid("imageSlices"), function(self, _cmd)
{ with(self)
{
    return _imageSlices;
}
}), new objj_method(sel_getUid("isThreePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("isNinePartImage"), function(self, _cmd)
{ with(self)
{
    return YES;
}
})]);
}
var CPNinePartImageImageSlicesKey = "CPNinePartImageImageSlicesKey";
{
var the_class = objj_getClass("CPNinePartImage")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPNinePartImage\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _imageSlices = objj_msgSend(aCoder, "decodeObjectForKey:", CPNinePartImageImageSlicesKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _imageSlices, CPNinePartImageImageSlicesKey);
}
})]);
}

p;13;CPImageView.jI;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;7605;
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMImageElement"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowView"), new objj_ivar("_imageRect")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "objectValue");
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anImage);
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, anImage)
{ with(self)
{
    var oldImage = objj_msgSend(self, "objectValue");
    if (oldImage === anImage)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", anImage);
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (oldImage)
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPImageDidLoadNotification, oldImage);
    var newImage = objj_msgSend(self, "objectValue");
    var size = objj_msgSend(newImage, "size");
    if (size && size.width === -1 && size.height === -1)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, newImage);
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self, "hideOrDisplayContents");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
}), new objj_method(sel_getUid("imageDidLoad:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "hideOrDisplayContents");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("hasShadow"), function(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
}), new objj_method(sel_getUid("setHasShadow:"), function(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow == shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        _shadowView = objj_msgSend(objj_msgSend(CPShadowView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _shadowView);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    else
    {
        objj_msgSend(_shadowView, "removeFromSuperview");
        _shadowView = nil;
    }
    objj_msgSend(self, "hideOrDisplayContents");
}
}), new objj_method(sel_getUid("setImageScaling:"), function(self, _cmd, anImageScaling)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setImageScaling:", anImageScaling);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("hideOrDisplayContents"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
    {
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(_shadowView, "setHidden:", NO);
    }
}
}), new objj_method(sel_getUid("imageRect"), function(self, _cmd)
{ with(self)
{
    return _imageRect;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
        return;
    var bounds = objj_msgSend(self, "bounds"),
        image = objj_msgSend(self, "image"),
        imageScaling = objj_msgSend(self, "currentValueForThemedAttributeName:", "image-scaling"),
        x = 0.0,
        y = 0.0,
        insetWidth = (_hasShadow ? HORIZONTAL_SHADOW_INSET : 0.0),
        insetHeight = (_hasShadow ? VERTICAL_SHADOW_INSET : 0.0),
        boundsWidth = (bounds.size.width),
        boundsHeight = (bounds.size.height),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;
    if (imageScaling === CPScaleToFit)
    {
    }
    else
    {
        var size = objj_msgSend(image, "size");
        if (size.width == -1 && size.height == -1)
            return;
        if (imageScaling === CPScaleProportionally)
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
        }
        else
        {
            width = size.width;
            height = size.height;
        }
        if (imageScaling == CPScaleNone)
        {
        }
        var x = (boundsWidth - width) / 2.0,
            y = (boundsHeight - height) / 2.0;
    }
    _imageRect = { origin: { x:x, y:y }, size: { width:width, height:height } };
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrame:", { origin: { x:x - LEFT_SHADOW_INSET, y:y - TOP_SHADOW_INSET }, size: { width:width + insetWidth, height:height + insetHeight } });
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
})]);
}
var CPImageViewImageKey = "CPImageViewImageKey",
    CPImageViewImageScalingKey = "CPImageViewImageScalingKey",
    CPImageViewHasShadowKey = "CPImageViewHasShadowKey";
{
var the_class = objj_getClass("CPImageView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPImageView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setHasShadow:", objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey));
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
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
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasShadow, CPImageViewHasShadowKey);
}
})]);
}

p;8;CPMenu.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;57065;
CPMenuDidAddItemNotification = "CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification = "CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification = "CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification = "CPMenuDidEndTrackingNotification";
var MENUBAR_HEIGHT = 19.0;
var _CPMenuBarVisible = NO,
    _CPMenuBarTitle = "",
    _CPMenuBarIconImage = nil,
    _CPMenuBarIconImageAlphaValue = 1.0,
    _CPMenuBarAttributes = nil,
    _CPMenuBarSharedWindow = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_supermenu"), new objj_ivar("_title"), new objj_ivar("_items"), new objj_ivar("_attachedMenu"), new objj_ivar("_autoenablesItems"), new objj_ivar("_showsStateColumn"), new objj_ivar("_delegate"), new objj_ivar("_highlightedIndex"), new objj_ivar("_menuWindow")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("menuBarHeight"), function(self, _cmd)
{ with(self)
{
    if (self == objj_msgSend(CPApp, "mainMenu"))
        return MENUBAR_HEIGHT;
    return 0.0;
}
}), new objj_method(sel_getUid("initWithTitle:"), function(self, _cmd, aTitle)
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
}), new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithTitle:", "");
}
}), new objj_method(sel_getUid("insertItem:atIndex:"), function(self, _cmd, aMenuItem, anIndex)
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
}), new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"), function(self, _cmd, aTitle, anAction, aKeyEquivalent, anIndex)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", aTitle, anAction, aKeyEquivalent);
    objj_msgSend(self, "insertItem:atIndex:", item, anIndex);
    return item;
}
}), new objj_method(sel_getUid("addItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "insertItem:atIndex:", aMenuItem, objj_msgSend(_items, "count"));
}
}), new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"), function(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    return objj_msgSend(self, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, anAction, aKeyEquivalent, objj_msgSend(_items, "count"));
}
}), new objj_method(sel_getUid("removeItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem));
}
}), new objj_method(sel_getUid("removeItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex < 0 || anIndex >= _items.length)
        return;
    objj_msgSend(_items[anIndex], "setMenu:", nil);
    objj_msgSend(_items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidRemoveItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
}), new objj_method(sel_getUid("itemChanged:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidChangeItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem), "CPMenuItemIndex"));
}
}), new objj_method(sel_getUid("menuWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTag:", aTag);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
}), new objj_method(sel_getUid("menuWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
}), new objj_method(sel_getUid("itemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_items, "objectAtIndex:", anIndex);
}
}), new objj_method(sel_getUid("numberOfItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_items, "count");
}
}), new objj_method(sel_getUid("itemArray"), function(self, _cmd)
{ with(self)
{
    return _items;
}
}), new objj_method(sel_getUid("indexOfItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return CPNotFound;
    return objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem);
}
}), new objj_method(sel_getUid("indexOfItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "title") === aTitle)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "tag") == aTag)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"), function(self, _cmd, aTarget, anAction)
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
}), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_items[index], "representedObject"), "isEqual:", anObject))
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithSubmenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "submenu") == aMenu)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("setSubmenu:forItem:"), function(self, _cmd, aMenu, aMenuItem)
{ with(self)
{
    objj_msgSend(aMenuItem, "setTarget:", aMenuItem);
    objj_msgSend(aMenuItem, "setAction:", sel_getUid("submenuAction:"));
    objj_msgSend(aMenuItem, "setSubmenu:", aMenu);
}
}), new objj_method(sel_getUid("submenuAction:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("attachedMenu"), function(self, _cmd)
{ with(self)
{
    return _attachedMenu;
}
}), new objj_method(sel_getUid("isAttached"), function(self, _cmd)
{ with(self)
{
    return _isAttached;
}
}), new objj_method(sel_getUid("locationOfSubmenu:"), function(self, _cmd, aMenu)
{ with(self)
{
}
}), new objj_method(sel_getUid("supermenu"), function(self, _cmd)
{ with(self)
{
    return _supermenu;
}
}), new objj_method(sel_getUid("setSupermenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _supermenu = aMenu;
}
}), new objj_method(sel_getUid("isTornOff"), function(self, _cmd)
{ with(self)
{
    return !_supermenu || self == objj_msgSend(CPApp, "mainMenu");
}
}), new objj_method(sel_getUid("setAutoenablesItems:"), function(self, _cmd, aFlag)
{ with(self)
{
    _autoenablesItems = aFlag;
}
}), new objj_method(sel_getUid("autoenablesItems"), function(self, _cmd)
{ with(self)
{
    return _autoenablesItems;
}
}), new objj_method(sel_getUid("update"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setShowsStateColumn:"), function(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
}), new objj_method(sel_getUid("showsStateColumn"), function(self, _cmd)
{ with(self)
{
    return _showsStateColumn;
}
}), new objj_method(sel_getUid("highlightedItem"), function(self, _cmd)
{ with(self)
{
    return _highlightedIndex >= 0 ? _items[_highlightedIndex] : nil;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("cancelTracking"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_menuWindow, "cancelTracking");
}
}), new objj_method(sel_getUid("_setMenuWindow:"), function(self, _cmd, aMenuWindow)
{ with(self)
{
    _menuWindow = aMenuWindow;
}
}), new objj_method(sel_getUid("performKeyEquivalent:"), function(self, _cmd, anEvent)
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
}), new objj_method(sel_getUid("performActionForItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    var item = _items[anIndex];
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(item, "action"), objj_msgSend(item, "target"), item);
}
}), new objj_method(sel_getUid("_itemIsHighlighted:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    return _items[_highlightedIndex] == aMenuItem;
}
}), new objj_method(sel_getUid("_highlightItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    var previousHighlightedIndex = _highlightedIndex;
    _highlightedIndex = anIndex;
    if (previousHighlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[previousHighlightedIndex], "_menuItemView"), "highlight:", NO);
    if (_highlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[_highlightedIndex], "_menuItemView"), "highlight:", YES);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuBarVisible"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarVisible;
}
}), new objj_method(sel_getUid("setMenuBarVisible:"), function(self, _cmd, menuBarShouldBeVisible)
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
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "orderFront:", self);
    }
    else
        objj_msgSend(_CPMenuBarSharedWindow, "orderOut:", self);
}
}), new objj_method(sel_getUid("setMenuBarTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _CPMenuBarTitle = aTitle;
    objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
}
}), new objj_method(sel_getUid("menuBarTitle"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarTitle;
}
}), new objj_method(sel_getUid("setMenuBarIconImage:"), function(self, _cmd, anImage)
{ with(self)
{
    _CPMenuBarImage = anImage;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", anImage);
}
}), new objj_method(sel_getUid("menuBarIconImage"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarImage;
}
}), new objj_method(sel_getUid("setMenuBarAttributes:"), function(self, _cmd, attributes)
{ with(self)
{
    if (_CPMenuBarAttributes == attributes)
        return;
    _CPMenuBarAttributes = objj_msgSend(attributes, "copy");
    var textColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTextColor"),
        titleColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTitleColor");
    if (!textColor && titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", titleColor, "CPMenuBarTextColor");
    else if (textColor && !titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", textColor, "CPMenuBarTitleColor");
    else if (!textColor && !titleColor)
    {
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "blackColor"), "CPMenuBarTextColor");
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "blackColor"), "CPMenuBarTitleColor");
    }
    if (_CPMenuBarSharedWindow)
    {
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
    }
}
}), new objj_method(sel_getUid("menuBarAttributes"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarAttributes;
}
}), new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"), function(self, _cmd, anAlphaValue)
{ with(self)
{
    _CPMenuBarIconImageAlphaValue = anAlphaValue;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", anAlphaValue);
}
}), new objj_method(sel_getUid("menuBarHeight"), function(self, _cmd)
{ with(self)
{
    return MENUBAR_HEIGHT;
}
}), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"), function(self, _cmd, aMenu, anEvent, aView)
{ with(self)
{
    objj_msgSend(self, "popUpContextMenu:withEvent:forView:withFont:", aMenu, anEvent, aView, nil);
}
}), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"), function(self, _cmd, aMenu, anEvent, aView, aFont)
{ with(self)
{
    objj_msgSend(self, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", aMenu, anEvent, aView, aFont, NO);
}
}), new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"), function(self, _cmd, aMenu, anEvent, aView, aFont, isForMenuBar)
{ with(self)
{
    var delegate = objj_msgSend(aMenu, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuWillOpen:")))
        objj_msgSend(delegate, "menuWillOpen:", aMenu);
    if (!aFont)
        aFont = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);
    var theWindow = objj_msgSend(aView, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", aMenu, aFont);
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", isForMenuBar ? _CPMenuWindowMenuBarBackgroundStyle : _CPMenuWindowPopUpBackgroundStyle);
    objj_msgSend(menuWindow, "setFrameOrigin:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}), new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"), function(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    var menu = objj_msgSend(aMenuWindow, "menu");
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    if(objj_msgSend(aMenuItem, "isEnabled"))
        objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(aMenuItem, "action"), objj_msgSend(aMenuItem, "target"), aMenuItem);
    var delegate = objj_msgSend(menu, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuDidClose:")))
        objj_msgSend(delegate, "menuDidClose:", menu);
}
})]);
}
var CPMenuTitleKey = "CPMenuTitleKey",
    CPMenuItemsKey = "CPMenuItemsKey";
{
var the_class = objj_getClass("CPMenu")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenu\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
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
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _items, CPMenuItemsKey);
}
})]);
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
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", CPPopUpMenuWindowLevel);
        objj_msgSend(self, "setHasShadow:", YES);
        objj_msgSend(self, "setAcceptsMouseMovedEvents:", YES);
        _unconstrainedFrame = CGRectMakeZero();
        var contentView = objj_msgSend(self, "contentView");
        _menuView = objj_msgSend(objj_msgSend(_CPMenuView, "alloc"), "initWithFrame:", CGRectMakeZero());
        _menuClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", CGRectMake(LEFT_MARGIN, TOP_MARGIN, 0.0, 0.0));
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
}), new objj_method(sel_getUid("overlapOffsetWidth"), function(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSend(_menuView, "setFont:", aFont);
}
}), new objj_method(sel_getUid("setBackgroundStyle:"), function(self, _cmd, aBackgroundStyle)
{ with(self)
{
    var color = _CPMenuWindowBackgroundColors[aBackgroundStyle];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        if (aBackgroundStyle == _CPMenuWindowPopUpBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded0.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow1.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded2.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0, 4.0))
                ]));
        else if (aBackgroundStyle == _CPMenuWindowMenuBarBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0, 4.0))
                ]));
        _CPMenuWindowBackgroundColors[aBackgroundStyle] = color;
    }
    objj_msgSend(self, "setBackgroundColor:", color);
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSend(aMenu, "_setMenuWindow:", self);
    objj_msgSend(_menuView, "setMenu:", aMenu);
    var menuViewSize = objj_msgSend(_menuView, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(LEFT_MARGIN + menuViewSize.width + RIGHT_MARGIN, TOP_MARGIN + menuViewSize.height + BOTTOM_MARGIN));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0, 0.0));
    objj_msgSend(_menuClipView, "setFrame:", CGRectMake(LEFT_MARGIN, TOP_MARGIN, menuViewSize.width, menuViewSize.height));
}
}), new objj_method(sel_getUid("setMinWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(MAX(size.width, aWidth), size.height));
}
}), new objj_method(sel_getUid("rectForItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuView, "convertRect:toView:", objj_msgSend(_menuView, "rectForItemAtIndex:", anIndex), nil);
}
}), new objj_method(sel_getUid("orderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "constrainToScreen");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "orderFront:", aSender);
}
}), new objj_method(sel_getUid("constrainToScreen"), function(self, _cmd)
{ with(self)
{
    _unconstrainedFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
    var screenBounds = CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), 5.0, 5.0),
        constrainedFrame = CGRectIntersection(_unconstrainedFrame, screenBounds),
        menuViewOrigin = objj_msgSend(self, "convertBaseToBridge:", CGPointMake(LEFT_MARGIN, TOP_MARGIN));
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
        objj_msgSend(_moreAboveView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(frame)) / 2.0, (TOP_MARGIN + SCROLL_INDICATOR_HEIGHT - CGRectGetHeight(frame)) / 2.0));
    }
    objj_msgSend(_moreAboveView, "setHidden:", !moreAbove);
    if (moreBelow)
    {
        bottomMargin += SCROLL_INDICATOR_HEIGHT;
        objj_msgSend(_moreBelowView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(objj_msgSend(_moreBelowView, "frame"))) / 2.0, CGRectGetHeight(bounds) - SCROLL_INDICATOR_HEIGHT - BOTTOM_MARGIN));
    }
    objj_msgSend(_moreBelowView, "setHidden:", !moreBelow);
    var clipFrame = CGRectMake(LEFT_MARGIN, topMargin, CGRectGetWidth(constrainedFrame) - LEFT_MARGIN - RIGHT_MARGIN, CGRectGetHeight(constrainedFrame) - topMargin - bottomMargin)
    objj_msgSend(_menuClipView, "setFrame:", clipFrame);
    objj_msgSend(_menuView, "setFrameSize:", CGSizeMake(CGRectGetWidth(clipFrame), CGRectGetHeight(objj_msgSend(_menuView, "frame"))));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0, objj_msgSend(self, "convertBaseToBridge:", clipFrame.origin).y - menuViewOrigin.y));
}
}), new objj_method(sel_getUid("cancelTracking"), function(self, _cmd)
{ with(self)
{
    _trackingCanceled = YES;
}
}), new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"), function(self, _cmd, anEvent, aSessionDelegate, aDidEndSelector)
{ with(self)
{
    _startTime = objj_msgSend(anEvent, "timestamp");
    _scrollingState = _CPMenuWindowScrollingStateNone;
    _trackingCanceled = NO;
    _sessionDelegate = aSessionDelegate;
    _didEndSelector = aDidEndSelector;
    objj_msgSend(self, "trackEvent:", anEvent);
}
}), new objj_method(sel_getUid("trackEvent:"), function(self, _cmd, anEvent)
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
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        var highlightedItem = objj_msgSend(objj_msgSend(_menuView, "menu"), "highlightedItem");
        objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        objj_msgSend(_menuView, "setMenu:", nil);
        objj_msgSend(self, "orderOut:", self);
        if (_sessionDelegate && _didEndSelector)
            objj_msgSend(_sessionDelegate, _didEndSelector, self, highlightedItem);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPMenuDidEndTrackingNotification, menu);
        var delegate = objj_msgSend(menu, "delegate");
        if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuDidClose:")))
            objj_msgSend(delegate, "menuDidClose:", menu);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuWindowWithMenu:font:"), function(self, _cmd, aMenu, aFont)
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
}), new objj_method(sel_getUid("poolMenuWindow:"), function(self, _cmd, aMenuWindow)
{ with(self)
{
    if (!aMenuWindow || _CPMenuWindowPool.length >= _CPMenuWindowPoolCapacity)
        return;
    _CPMenuWindowPool.push(aMenuWindow);
}
}), new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuWindowMoreAboveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreAbove.png"), CGSizeMake(38.0, 18.0));
    _CPMenuWindowMoreBelowImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreBelow.png"), CGSizeMake(38.0, 18.0));
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItemViews"), new objj_ivar("_visibleMenuItemInfos"), new objj_ivar("_font")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    _font = aFont;
}
}), new objj_method(sel_getUid("rectForItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuItemViews[anIndex == CPNotFound ? 0 : anIndex], "frame");
}
}), new objj_method(sel_getUid("itemIndexAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var x = aPoint.x,
        bounds = objj_msgSend(self, "bounds");
    if (x < CGRectGetMinX(bounds) || x > CGRectGetMaxX(bounds))
        return CPNotFound;
    var y = aPoint.y,
        low = 0,
        high = _visibleMenuItemInfos.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            info = _visibleMenuItemInfos[middle]
            frame = objj_msgSend(info.view, "frame");
        if (y < CGRectGetMinY(frame))
            high = middle - 1;
        else if (y > CGRectGetMaxY(frame))
            low = middle + 1;
        else
            return info.index;
   }
   return CPNotFound;
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setMenu:", aMenu);
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
    _menuItemViews = [];
    _visibleMenuItemInfos = [];
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
        _visibleMenuItemInfos.push({ view:view, index:index });
        objj_msgSend(view, "setFont:", _font);
        objj_msgSend(view, "setShowsStateColumn:", showsStateColumn);
        objj_msgSend(view, "synchronizeWithMenuItem");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(0.0, y));
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
        objj_msgSend(view, "setFrameSize:", CGSizeMake(maxWidth, CGRectGetHeight(objj_msgSend(view, "frame"))));
    }
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(maxWidth, y));
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
})]);
}
var MENUBAR_HEIGHT = 29.0,
    MENUBAR_MARGIN = 10.0,
    MENUBAR_LEFT_MARGIN = 10.0,
    MENUBAR_RIGHT_MARGIN = 10.0;
var _CPMenuBarWindowBackgroundColor = nil,
    _CPMenuBarWindowFont = nil;
{var the_class = objj_allocateClassPair(CPPanel, "_CPMenuBarWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_highlightView"), new objj_ivar("_menuItemViews"), new objj_ivar("_trackingMenuItem"), new objj_ivar("_iconImageView"), new objj_ivar("_titleField"), new objj_ivar("_textColor"), new objj_ivar("_titleColor")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    var bridgeWidth = CGRectGetWidth(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", CGRectMake(0.0, 0.0, bridgeWidth, MENUBAR_HEIGHT), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", -1);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable);
        var contentView = objj_msgSend(self, "contentView");
        objj_msgSend(contentView, "setAutoresizesSubviews:", NO);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        _iconImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0));
        objj_msgSend(contentView, "addSubview:", _iconImageView);
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(contentView, "addSubview:", _titleField);
    }
    return self;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_titleField, "setStringValue:", aTitle);
    objj_msgSend(_titleField, "sizeToFit");
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("setIconImage:"), function(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(_iconImageView, "setImage:", anImage);
    objj_msgSend(_iconImageView, "setHidden:", anImage == nil);
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("setIconImageAlphaValue:"), function(self, _cmd, anAlphaValue)
{ with(self)
{
    objj_msgSend(_iconImageView, "setAlphaValue:", anAlphaValue);
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (!aColor)
    {
        if (!_CPMenuBarWindowBackgroundColor)
            _CPMenuBarWindowBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPMenuBarWindow, "class")), "pathForResource:", "_CPMenuBarWindow/_CPMenuBarWindowBackground.png"), CGSizeMake(1.0, 18.0)));
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", _CPMenuBarWindowBackgroundColor);
    }
    else
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", aColor);
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextColor:"), _textColor);
}
}), new objj_method(sel_getUid("setTitleColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_titleColor == aColor)
        return;
    _titleColor = aColor;
    objj_msgSend(_titleField, "setTextColor:", aColor ? aColor : objj_msgSend(CPColor, "blackColor"));
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
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
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
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
        objj_msgSend(menuItemView, "setTextColor:", _textColor);
        objj_msgSend(menuItemView, "setHidden:", objj_msgSend(item, "isHidden"));
        objj_msgSend(menuItemView, "synchronizeWithMenuItem");
        objj_msgSend(contentView, "addSubview:", menuItemView);
    }
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("menuDidChangeItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var menuItem = objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex")),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("menuDidAddItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItem = objj_msgSend(_menu, "itemAtIndex:", index),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(_menuItemViews, "insertObject:atIndex:", menuItemView, index);
    objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
    objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
    objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
    objj_msgSend(menuItemView, "setTextColor:", _textColor);
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", menuItemView);
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("menuDidRemoveItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItemView = objj_msgSend(_menuItemViews, "objectAtIndex:", index);
    objj_msgSend(_menuItemViews, "removeObjectAtIndex:", index);
    objj_msgSend(menuItemView, "removeFromSuperview");
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("frameForMenuItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    var frame = objj_msgSend(objj_msgSend(aMenuItem, "_menuItemView"), "frame");
    frame.origin.x -= 5.0;
    frame.origin.y = 0;
    frame.size.width += 10.0;
    frame.size.height = MENUBAR_HEIGHT;
    return frame;
}
}), new objj_method(sel_getUid("menuItemAtPoint:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
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
}), new objj_method(sel_getUid("trackEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPPeriodic)
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
            objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(_trackingMenuItem, "action"), objj_msgSend(_trackingMenuItem, "target"), _trackingMenuItem);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("showMenu:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(CPEvent, "stopPeriodicEvents");
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView");
    if (!_highlightView)
    {
        _highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", frame);
        objj_msgSend(_highlightView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 81.0 / 255.0, 83.0 / 255.0, 109.0 / 255.0, 1.0));
    }
    else
        objj_msgSend(_highlightView, "setFrame:", frame);
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:positioned:relativeTo:", _highlightView, CPWindowBelow, menuItemView);
    objj_msgSend(menuItemView, "activate:", YES);
    var submenu = objj_msgSend(_trackingMenuItem, "submenu");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("menuDidEndTracking:"), CPMenuDidEndTrackingNotification, submenu);
    objj_msgSend(CPMenu, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", submenu, objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame)), objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")), objj_msgSend(self, "contentView"), nil, YES);
}
}), new objj_method(sel_getUid("menuDidEndTracking:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_highlightView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "activate:", NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPMenuDidEndTrackingNotification, objj_msgSend(aNotification, "object"));
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
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
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x, (MENUBAR_HEIGHT - 1.0 - CGRectGetHeight(frame)) / 2.0));
            x += CGRectGetWidth(objj_msgSend(menuItemView, "frame")) + MENUBAR_MARGIN;
        }
        else
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x - CGRectGetWidth(frame), (MENUBAR_HEIGHT - 1.0 - CGRectGetHeight(frame)) / 2.0));
            x = CGRectGetMinX(objj_msgSend(menuItemView, "frame")) - MENUBAR_MARGIN;
        }
    }
    var bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds"),
        titleFrame = objj_msgSend(_titleField, "frame");
    if (objj_msgSend(_iconImageView, "isHidden"))
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(titleFrame)) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    else
    {
        var iconFrame = objj_msgSend(_iconImageView, "frame"),
            iconWidth = CGRectGetWidth(iconFrame),
            totalWidth = iconWidth + CGRectGetWidth(titleFrame);
        objj_msgSend(_iconImageView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(iconFrame)) / 2.0));
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0 + iconWidth, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    }
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "setFrameSize:", aSize);
    objj_msgSend(self, "tile");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuBarWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuBarWindowFont = objj_msgSend(CPFont, "systemFontOfSize:", 11.0);
}
})]);
}

p;12;CPMenuItem.jI;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;26583;
{var the_class = objj_allocateClassPair(CPObject, "CPMenuItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_title"), new objj_ivar("_font"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_isHidden"), new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_onStateImage"), new objj_ivar("_offStateImage"), new objj_ivar("_mixedStateImage"), new objj_ivar("_submenu"), new objj_ivar("_menu"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_mnemonicLocation"), new objj_ivar("_isAlternate"), new objj_ivar("_indentationLevel"), new objj_ivar("_toolTip"), new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_menuItemView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"), function(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = aTitle;
        _action = anAction;
        _isEnabled = YES;
        _tag = 0;
        _state = CPOffState;
        _keyEquivalent = aKeyEquivalent || "";
        _keyEquivalentModifierMask = CPPlatformActionKeyMask;
        _mnemonicLocation = CPNotFound;
    }
    return self;
}
}), new objj_method(sel_getUid("setEnabled:"), function(self, _cmd, isEnabled)
{ with(self)
{
    if (objj_msgSend(_menu, "autoenablesItems"))
        return;
    _isEnabled = isEnabled;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("isEnabled"), function(self, _cmd)
{ with(self)
{
    return _isEnabled;
}
}), new objj_method(sel_getUid("setHidden:"), function(self, _cmd, isHidden)
{ with(self)
{
    if (_isHidden == isHidden)
        return;
    _isHidden = isHidden;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function(self, _cmd)
{ with(self)
{
    if (_isHidden)
        return YES;
    var supermenu = objj_msgSend(_menu, "supermenu");
    if (objj_msgSend(objj_msgSend(supermenu, "itemAtIndex:", objj_msgSend(supermenu, "indexOfItemWithSubmenu:", _menu)), "isHiddenOrHasHiddenAncestor"))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _target;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    return _action;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _mnemonicLocation = CPNotFound;
    if (_title == aTitle)
        return;
    _title = aTitle;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aColor)
{ with(self)
{
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
}), new objj_method(sel_getUid("font"), function(self, _cmd)
{ with(self)
{
    return _font;
}
}), new objj_method(sel_getUid("setTag:"), function(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    return _tag;
}
}), new objj_method(sel_getUid("setState:"), function(self, _cmd, aState)
{ with(self)
{
    if (_state == aState)
        return;
    _state = aState;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
}), new objj_method(sel_getUid("state"), function(self, _cmd)
{ with(self)
{
    return _state;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return _image;
}
}), new objj_method(sel_getUid("setAlternateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    _alternateImage = anImage;
}
}), new objj_method(sel_getUid("alternateImage"), function(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
}), new objj_method(sel_getUid("setOnStateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_onStateImage == anImage)
        return;
    _onStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("onStateImage"), function(self, _cmd)
{ with(self)
{
    return _onStateImage;
}
}), new objj_method(sel_getUid("setOffStateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_offStateImage == anImage)
        return;
    _offStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("offStateImage"), function(self, _cmd)
{ with(self)
{
    return _offStateImage;
}
}), new objj_method(sel_getUid("setMixedStateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_mixedStateImage == anImage)
        return;
    _mixedStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("mixedStateImage"), function(self, _cmd)
{ with(self)
{
    return _mixedStateImage;
}
}), new objj_method(sel_getUid("setSubmenu:"), function(self, _cmd, aMenu)
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
}), new objj_method(sel_getUid("submenu"), function(self, _cmd)
{ with(self)
{
    return _submenu;
}
}), new objj_method(sel_getUid("hasSubmenu"), function(self, _cmd)
{ with(self)
{
    return _submenu ? YES : NO;
}
}), new objj_method(sel_getUid("isSeparatorItem"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
}), new objj_method(sel_getUid("menu"), function(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("setKeyEquivalent:"), function(self, _cmd, aString)
{ with(self)
{
    _keyEquivalent = aString || "";
}
}), new objj_method(sel_getUid("keyEquivalent"), function(self, _cmd)
{ with(self)
{
    return _keyEquivalent;
}
}), new objj_method(sel_getUid("setKeyEquivalentModifierMask:"), function(self, _cmd, aMask)
{ with(self)
{
    _keyEquivalentModifierMask = aMask;
}
}), new objj_method(sel_getUid("keyEquivalentModifierMask"), function(self, _cmd)
{ with(self)
{
    return _keyEquivalentModifierMask;
}
}), new objj_method(sel_getUid("setMnemonicLocation:"), function(self, _cmd, aLocation)
{ with(self)
{
    _mnemonicLocation = aLocation;
}
}), new objj_method(sel_getUid("mnemonicLocation"), function(self, _cmd)
{ with(self)
{
    return _mnemonicLocation;
}
}), new objj_method(sel_getUid("setTitleWithMnemonicLocation:"), function(self, _cmd, aTitle)
{ with(self)
{
    var location = objj_msgSend(aTitle, "rangeOfString:", "&").location;
    if (location == CPNotFound)
        objj_msgSend(self, "setTitle:", aTitle);
    else
    {
        objj_msgSend(self, "setTitle:", objj_msgSend(aTitle, "substringToIndex:", location) + objj_msgSend(aTitle, "substringFromIndex:", location + 1));
        objj_msgSend(self, "setMnemonicLocation:", location);
    }
}
}), new objj_method(sel_getUid("mnemonic"), function(self, _cmd)
{ with(self)
{
    return _mnemonicLocation == CPNotFound ? "" : objj_msgSend(_title, "characterAtIndex:", _mnemonicLocation);
}
}), new objj_method(sel_getUid("setAlternate:"), function(self, _cmd, isAlternate)
{ with(self)
{
    _isAlternate = isAlternate;
}
}), new objj_method(sel_getUid("isAlternate"), function(self, _cmd)
{ with(self)
{
    return _isAlternate;
}
}), new objj_method(sel_getUid("setIndentationLevel:"), function(self, _cmd, aLevel)
{ with(self)
{
    if (aLevel < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "setIndentationLevel: argument must be greater than 0.");
    _indentationLevel = MIN(15, aLevel);
}
}), new objj_method(sel_getUid("indentationLevel"), function(self, _cmd)
{ with(self)
{
    return _indentationLevel;
}
}), new objj_method(sel_getUid("setToolTip:"), function(self, _cmd, aToolTip)
{ with(self)
{
    _toolTip = aToolTip;
}
}), new objj_method(sel_getUid("toolTip"), function(self, _cmd)
{ with(self)
{
    return _toolTip;
}
}), new objj_method(sel_getUid("setRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    _representedObject = anObject;
}
}), new objj_method(sel_getUid("representedObject"), function(self, _cmd)
{ with(self)
{
    return _representedObject;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_view == aView)
        return;
    _view = aView;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("isHighlighted"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "menu"), "highlightedItem") == self;
}
}), new objj_method(sel_getUid("_menuItemView"), function(self, _cmd)
{ with(self)
{
    if (!_menuItemView)
        _menuItemView = objj_msgSend(objj_msgSend(_CPMenuItemView, "alloc"), "initWithFrame:forMenuItem:", CGRectMakeZero(), self);
    return _menuItemView;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("separatorItem"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPMenuItemSeparator, "alloc"), "init");
}
})]);
}
{var the_class = objj_allocateClassPair(CPMenuItem, "_CPMenuItemSeparator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem") }, "initWithTitle:action:keyEquivalent:", "", nil, nil);
    if (self)
        objj_msgSend(self, "setEnabled:", NO);
    return self;
}
}), new objj_method(sel_getUid("isSeparatorItem"), function(self, _cmd)
{ with(self)
{
    return YES;
}
})]);
}
var CPMenuItemTitleKey = "CPMenuItemTitleKey",
    CPMenuItemTargetKey = "CPMenuItemTargetKey",
    CPMenuItemActionKey = "CPMenuItemActionKey",
    CPMenuItemIsEnabledKey = "CPMenuItemIsEnabledKey",
    CPMenuItemIsHiddenKey = "CPMenuItemIsHiddenKey",
    CPMenuItemTagKey = "CPMenuItemTagKey",
    CPMenuItemImageKey = "CPMenuItemImageKey",
    CPMenuItemAlternateImageKey = "CPMenuItemAlternateImageKey",
    CPMenuItemSubmenuKey = "CPMenuItemSubmenuKey",
    CPMenuItemMenuKey = "CPMenuItemMenuKey",
    CPMenuItemRepresentedObjectKey = "CPMenuItemRepresentedObjectKey";
{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenuItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
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
        _tag = objj_msgSend(aCoder, "containsValueForKey:", CPMenuItemTagKey) ? objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTagKey) : 0;
        _image = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemImageKey);
        _alternateImage = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemAlternateImageKey);
        _submenu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemSubmenuKey);
        _menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemMenuKey);
    _representedObject = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemRepresentedObjectKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuItemTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _target, CPMenuItemTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _action, CPMenuItemActionKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _isEnabled, CPMenuItemIsEnabledKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _isHidden, CPMenuItemIsHiddenKey);
    if (_tag !== 0)
        objj_msgSend(aCoder, "encodeObject:forKey:", _tag, CPMenuItemTagKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPMenuItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPMenuItemAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _submenu, CPMenuItemSubmenuKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPMenuItemMenuKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _representedObject, CPMenuItemRepresentedObjectKey);
}
})]);
}
var LEFT_MARGIN = 3.0,
    RIGHT_MARGIN = 16.0,
    STATE_COLUMN_WIDTH = 14.0,
    INDENTATION_WIDTH = 17.0,
    VERTICAL_MARGIN = 4.0;
var _CPMenuItemSelectionColor = nil,
    _CPMenuItemTextShadowColor = nil,
    _CPMenuItemDefaultStateImages = [],
    _CPMenuItemDefaultStateHighlightedImages = [];
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItem"), new objj_ivar("_font"), new objj_ivar("_textColor"), new objj_ivar("_minSize"), new objj_ivar("_isDirty"), new objj_ivar("_showsStateColumn"), new objj_ivar("_belongsToMenuBar"), new objj_ivar("_stateView"), new objj_ivar("_imageAndTextView"), new objj_ivar("_submenuView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:forMenuItem:"), function(self, _cmd, aFrame, aMenuItem)
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
}), new objj_method(sel_getUid("minSize"), function(self, _cmd)
{ with(self)
{
    return _minSize;
}
}), new objj_method(sel_getUid("setDirty"), function(self, _cmd)
{ with(self)
{
    _isDirty = YES;
}
}), new objj_method(sel_getUid("synchronizeWithMenuItem"), function(self, _cmd)
{ with(self)
{
    if (!_isDirty)
        return;
    _isDirty = NO;
    var view = objj_msgSend(_menuItem, "view");
    if (objj_msgSend(_menuItem, "isSeparatorItem"))
    {
        var line = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 5.0, 10.0, 1.0));
        view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 10.0));
        objj_msgSend(view, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(line, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(line, "setBackgroundColor:", objj_msgSend(CPColor, "lightGrayColor"));
        objj_msgSend(view, "addSubview:", line);
    }
    if (view)
    {
        objj_msgSend(_imageAndTextView, "removeFromSuperview");
        _imageAndTextView = nil;
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
        objj_msgSend(_submenuView, "removeFromSuperview");
        _submenuView = nil;
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
            _stateView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(x, (CGRectGetHeight(objj_msgSend(self, "frame")) - STATE_COLUMN_WIDTH) / 2.0, STATE_COLUMN_WIDTH, STATE_COLUMN_WIDTH));
            objj_msgSend(_stateView, "setAutoresizingMask:", CPViewMinYMargin | CPViewMaxYMargin);
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
    if (!_imageAndTextView)
    {
        _imageAndTextView = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0));
        objj_msgSend(_imageAndTextView, "setImagePosition:", CPImageLeft);
        objj_msgSend(_imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self, "addSubview:", _imageAndTextView);
    }
    var font = objj_msgSend(_menuItem, "font");
    if (!font)
        font = _font;
    objj_msgSend(_imageAndTextView, "setFont:", font);
    objj_msgSend(_imageAndTextView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(_imageAndTextView, "setImage:", objj_msgSend(_menuItem, "image"));
    objj_msgSend(_imageAndTextView, "setText:", objj_msgSend(_menuItem, "title"));
    objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_imageAndTextView, "setFrameOrigin:", CGPointMake(x, VERTICAL_MARGIN));
    objj_msgSend(_imageAndTextView, "sizeToFit");
    var frame = objj_msgSend(_imageAndTextView, "frame");
    frame.size.height += 2 * VERTICAL_MARGIN;
    x += CGRectGetWidth(frame);
    if (objj_msgSend(_menuItem, "hasSubmenu"))
    {
        x += 3.0;
        if (!_submenuView)
        {
            _submenuView = objj_msgSend(objj_msgSend(_CPMenuItemArrowView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0));
            objj_msgSend(self, "addSubview:", _submenuView);
        }
        objj_msgSend(_submenuView, "setHidden:", NO);
        objj_msgSend(_submenuView, "setColor:", _belongsToMenuBar ? objj_msgSend(self, "textColor") : nil);
        objj_msgSend(_submenuView, "setFrameOrigin:", CGPointMake(x, (CGRectGetHeight(frame) - 10.0) / 2.0));
        x += 10.0;
    }
    else
        objj_msgSend(_submenuView, "setHidden:", YES);
    _minSize = CGSizeMake(x + (_belongsToMenuBar ? 0.0 : RIGHT_MARGIN) + 3.0, CGRectGetHeight(frame));
    objj_msgSend(self, "setFrameSize:", _minSize);
}
}), new objj_method(sel_getUid("overlapOffsetWidth"), function(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + (objj_msgSend(objj_msgSend(_menuItem, "menu"), "showsStateColumn") ? STATE_COLUMN_WIDTH : 0.0);
}
}), new objj_method(sel_getUid("setShowsStateColumn:"), function(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
}), new objj_method(sel_getUid("setBelongsToMenuBar:"), function(self, _cmd, shouldBelongToMenuBar)
{ with(self)
{
    _belongsToMenuBar = shouldBelongToMenuBar;
}
}), new objj_method(sel_getUid("highlight:"), function(self, _cmd, shouldHighlight)
{ with(self)
{
    if (_belongsToMenuBar)
        objj_msgSend(_imageAndTextView, "setImage:", shouldHighlight ? objj_msgSend(_menuItem, "alternateImage") : objj_msgSend(_menuItem, "image"));
    else if (objj_msgSend(_menuItem, "isEnabled"))
    {
        if (shouldHighlight)
        {
            objj_msgSend(self, "setBackgroundColor:", _CPMenuItemSelectionColor);
            objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
            objj_msgSend(_imageAndTextView, "setTextShadowColor:", _CPMenuItemTextShadowColor);
        }
        else
        {
            objj_msgSend(self, "setBackgroundColor:", nil);
            objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
            objj_msgSend(_imageAndTextView, "setTextShadowColor:", nil);
        }
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", shouldHighlight ? _CPMenuItemDefaultStateHighlightedImages[state] : _CPMenuItemDefaultStateImages[state]);
                            break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
    }
}
}), new objj_method(sel_getUid("activate:"), function(self, _cmd, shouldActivate)
{ with(self)
{
    objj_msgSend(_imageAndTextView, "setImage:", objj_msgSend(_menuItem, "image"));
    if (shouldActivate)
    {
        objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_submenuView, "setColor:", objj_msgSend(CPColor, "whiteColor"));
    }
    else
    {
        objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
        objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "textColor"));
    }
}
}), new objj_method(sel_getUid("eventOnSubmenu:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_menuItem, "hasSubmenu"))
        return NO;
    return CGRectContainsPoint(objj_msgSend(_submenuView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isHidden");
}
}), new objj_method(sel_getUid("menuItem"), function(self, _cmd)
{ with(self)
{
    return _menuItem;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(self, "setDirty");
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
    objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "textColor"));
}
}), new objj_method(sel_getUid("textColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isEnabled") ? (_textColor ? _textColor : objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 70.0 / 255.0, 69.0 / 255.0, 69.0 / 255.0, 1.0)) : objj_msgSend(CPColor, "darkGrayColor");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuItemView, "class"))
        return;
    _CPMenuItemSelectionColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 95.0 / 255.0, 131.0 / 255.0, 185.0 / 255.0, 1.0);
    _CPMenuItemTextShadowColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 26.0 / 255.0,  73.0 / 255.0, 109.0 / 255.0, 1.0)
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuItemDefaultStateImages[CPOffState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPOffState] = nil;
    _CPMenuItemDefaultStateImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnState.png"), CGSizeMake(14.0, 14.0));
    _CPMenuItemDefaultStateHighlightedImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnStateHighlighted.png"), CGSizeMake(14.0, 14.0));
    _CPMenuItemDefaultStateImages[CPMixedState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPMixedState] = nil;
}
}), new objj_method(sel_getUid("leftMargin"), function(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + STATE_COLUMN_WIDTH;
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemArrowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_color == aColor)
        return;
    _color = aColor;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, aRect)
{ with(self)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1.0, 4.0);
    CGContextAddLineToPoint(context, 9.0, 4.0);
    CGContextAddLineToPoint(context, 5.0, 8.0);
    CGContextAddLineToPoint(context, 1.0, 4.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, _color);
    CGContextFillPath(context);
}
})]);
}

p;15;CPOutlineView.ji;13;CPTableView.jc;3176;
{var the_class = objj_allocateClassPair(CPTableView, "CPOutlineView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineDataSource"), new objj_ivar("_itemsByRow")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "setDataSource:", self);
        _itemsByRow = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    }
    return self;
}
}), new objj_method(sel_getUid("setDataSource:"), function(self, _cmd, aDataSource)
{ with(self)
{
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:child:ofItem")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:child:ofItem'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:isItemExpandable")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:isItemExpandable'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:numberOfChildrenOfItem")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:numberOfChildrenOfItem'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:objectValueForTableColumn:byItem")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:objectValueForTableColumn:byItem'");
    _outlineDataSource = aDataSource;
    objj_msgSend(self, "reloadData");
}
}), new objj_method(sel_getUid("reloadData"), function(self, _cmd)
{ with(self)
{
    _numberOfVisibleItems = objj_msgSend(_outlineDataSource, "outlineView:numberOfChildrenOfItem:", self, nil);
    _numberOfRows = _numberOfVisibleItems;
    var i = 0;
    for (; i < _numberOfVisibleItems; ++i)
        _itemsByRow[i] = objj_msgSend(_outlineDataSource, "outlineView:child:ofItem:", self, i, nil);
    objj_msgSend(self, "loadTableCellsInRect:", objj_msgSend(self, "bounds"));
}
})]);
}
{
var the_class = objj_getClass("CPOutlineView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPOutlineView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfRowsInTableView:"), function(self, _cmd, aTableView)
{ with(self)
{
    return _numberOfVisibleItems;
}
}), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function(self, _cmd, aTableView, aTableColumn, aRowIndex)
{ with(self)
{
    return objj_msgSend(_outlineDataSource, "outlineView:objectValueForTableColumn:byItem:", self, aTableColumn, _itemsByRow[aRowIndex]);
}
})]);
}

p;9;CPPanel.ji;10;CPWindow.jc;1446;
CPOKButton = 1;
CPCancelButton = 0;
{var the_class = objj_allocateClassPair(CPWindow, "CPPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_becomesKeyOnlyIfNeeded"), new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isFloatingPanel"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "level") == CPFloatingWindowLevel;
}
}), new objj_method(sel_getUid("setFloatingPanel:"), function(self, _cmd, isFloatingPanel)
{ with(self)
{
    objj_msgSend(self, "setLevel:", isFloatingPanel ? CPFloatingWindowLevel : CPNormalWindowLevel);
}
}), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function(self, _cmd)
{ with(self)
{
    return _becomesKeyOnlyIfNeeded;
}
}), new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"), function(self, _cmd, shouldBecomeKeyOnlyIfNeeded)
{ with(self)
{
    _becomesKeyOnlyIfNeeded = shouldBecomeKeyOnlyIfNeeded
}
}), new objj_method(sel_getUid("worksWhenModal"), function(self, _cmd)
{ with(self)
{
    return _worksWhenModal;
}
}), new objj_method(sel_getUid("setWorksWhenModal:"), function(self, _cmd, shouldWorkWhenModal)
{ with(self)
{
    _worksWhenModal = shouldWorkWhenModal;
}
}), new objj_method(sel_getUid("canBecomeMainWindow"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
}

p;14;CPPasteboard.jI;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;5499;
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
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithName:"), function(self, _cmd, aName)
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
}), new objj_method(sel_getUid("addTypes:owner:"), function(self, _cmd, types, anOwner)
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
}), new objj_method(sel_getUid("declareTypes:owner:"), function(self, _cmd, types, anOwner)
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
}), new objj_method(sel_getUid("setData:forType:"), function(self, _cmd, aData, aType)
{ with(self)
{
    objj_msgSend(_provided, "setObject:forKey:", aData, aType);
    return YES;
}
}), new objj_method(sel_getUid("setPropertyList:forType:"), function(self, _cmd, aPropertyList, aType)
{ with(self)
{
    return objj_msgSend(self, "setData:forType:", objj_msgSend(CPPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", aPropertyList, CPPropertyListXMLFormat_v1_0, nil), aType);
}
}), new objj_method(sel_getUid("setString:forType:"), function(self, _cmd, aString, aType)
{ with(self)
{
    return objj_msgSend(self, "setPropertyList:forType:", aString, aType);
}
}), new objj_method(sel_getUid("availableTypeFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(_types, "firstObjectCommonWithArray:", anArray);
}
}), new objj_method(sel_getUid("types"), function(self, _cmd)
{ with(self)
{
    return _types;
}
}), new objj_method(sel_getUid("changeCount"), function(self, _cmd)
{ with(self)
{
    return _changeCount;
}
}), new objj_method(sel_getUid("dataForType:"), function(self, _cmd, aType)
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
}), new objj_method(sel_getUid("propertyListForType:"), function(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(self, "dataForType:", aType);
    if (data)
        return objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", data, CPPropertyListXMLFormat_v1_0, nil);
    return nil;
}
}), new objj_method(sel_getUid("stringForType:"), function(self, _cmd, aType)
{ with(self)
{
    return objj_msgSend(self, "propertyListForType:", aType);
}
}), new objj_method(sel_getUid("_generateStateUID"), function(self, _cmd)
{ with(self)
{
    var bits = 32;
    _stateUID = "";
    while (bits--)
        _stateUID += FLOOR(RAND() * 16.0).toString(16).toUpperCase();
    return _stateUID;
}
}), new objj_method(sel_getUid("_stateUID"), function(self, _cmd)
{ with(self)
{
    return _stateUID;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPPasteboard, "class"))
        return;
    objj_msgSend(self, "setVersion:", 1.0);
    CPPasteboards = objj_msgSend(CPDictionary, "dictionary");
}
}), new objj_method(sel_getUid("generalPasteboard"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPasteboard, "pasteboardWithName:", CPGeneralPboard);
}
}), new objj_method(sel_getUid("pasteboardWithName:"), function(self, _cmd, aName)
{ with(self)
{
    var pasteboard = objj_msgSend(CPPasteboards, "objectForKey:", aName);
    if (pasteboard)
        return pasteboard;
    pasteboard = objj_msgSend(objj_msgSend(CPPasteboard, "alloc"), "_initWithName:", aName);
    objj_msgSend(CPPasteboards, "setObject:forKey:", pasteboard, aName);
    return pasteboard;
}
})]);
}

p;15;CPPopUpButton.ji;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;16956;
var VISIBLE_MARGIN = 7.0;
CPPopUpButtonStatePullsDown = 1 << 12;
{var the_class = objj_allocateClassPair(CPButton, "CPPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectedIndex"), new objj_ivar("_preferredEdge"), new objj_ivar("_menu")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:pullsDown:"), function(self, _cmd, aFrame, shouldPullDown)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithFrame:", aFrame);
    if (self)
    {
        _selectedIndex = CPNotFound;
        _preferredEdge = CPMaxYEdge;
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPLeftTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPLineBreakByTruncatingTail, "line-break-mode");
        objj_msgSend(self, "setMenu:", objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", ""));
        objj_msgSend(self, "setPullsDown:", shouldPullDown);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:pullsDown:", aFrame, NO);
}
}), new objj_method(sel_getUid("setPullsDown:"), function(self, _cmd, shouldPullDown)
{ with(self)
{
    if ((!!(_controlState & CPPopUpButtonStatePullsDown)) === shouldPullDown)
        return;
    if (shouldPullDown)
        _controlState |= CPPopUpButtonStatePullsDown;
    else
        _controlState &= ~CPPopUpButtonStatePullsDown;
    var items = objj_msgSend(_menu, "itemArray");
    if (objj_msgSend(items, "count") <= 0)
        return;
    objj_msgSend(items[0], "setHidden:", objj_msgSend(self, "pullsDown"));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("pullsDown"), function(self, _cmd)
{ with(self)
{
    return _controlState & CPPopUpButtonStatePullsDown;
}
}), new objj_method(sel_getUid("addItem:"), function(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(_menu, "addItem:", anItem);
}
}), new objj_method(sel_getUid("addItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_menu, "addItemWithTitle:action:keyEquivalent:", aTitle, NULL, nil);
}
}), new objj_method(sel_getUid("addItemsWithTitles:"), function(self, _cmd, titles)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(titles, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "addItemWithTitle:", titles[index]);
}
}), new objj_method(sel_getUid("insertItemWithTitle:atIndex:"), function(self, _cmd, aTitle, anIndex)
{ with(self)
{
    var items = objj_msgSend(self, "itemArray"),
        count = objj_msgSend(items, "count");
    while (count--)
        if (objj_msgSend(items[count], "title") == aTitle)
            objj_msgSend(self, "removeItemAtIndex:", count);
    objj_msgSend(_menu, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, NULL, nil, anIndex);
}
}), new objj_method(sel_getUid("removeAllItems"), function(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_menu, "numberOfItems");
    while (count--)
        objj_msgSend(_menu, "removeItemAtIndex:", 0);
}
}), new objj_method(sel_getUid("removeItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("removeItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(_menu, "removeItemAtIndex:", anIndex);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("selectedItem"), function(self, _cmd)
{ with(self)
{
    if (_selectedIndex < 0)
        return nil;
    return objj_msgSend(_menu, "itemAtIndex:", _selectedIndex);
}
}), new objj_method(sel_getUid("titleOfSelectedItem"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "selectedItem"), "title");
}
}), new objj_method(sel_getUid("indexOfSelectedItem"), function(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
}), new objj_method(sel_getUid("objectValue"), function(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
}), new objj_method(sel_getUid("selectItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItem:", aMenuItem));
}
}), new objj_method(sel_getUid("selectItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (_selectedIndex == anIndex)
        return;
    if (_selectedIndex >= 0 && !objj_msgSend(self, "pullsDown"))
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOffState);
    _selectedIndex = anIndex;
    if (_selectedIndex >= 0 && !objj_msgSend(self, "pullsDown"))
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOnState);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("selectItemWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTag:", aTag));
}
}), new objj_method(sel_getUid("selectItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aValue, "intValue"));
}
}), new objj_method(sel_getUid("menu"), function(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    if (_menu === aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, _menu);
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("numberOfItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "numberOfItems");
}
}), new objj_method(sel_getUid("itemArray"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "itemArray");
}
}), new objj_method(sel_getUid("itemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", anIndex);
}
}), new objj_method(sel_getUid("itemTitleAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemAtIndex:", anIndex), "title");
}
}), new objj_method(sel_getUid("itemTitles"), function(self, _cmd)
{ with(self)
{
    var titles = [],
        items = objj_msgSend(self, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count");
    for (; index < count; ++index)
        items.push(objj_msgSend(items[index], "title"));
}
}), new objj_method(sel_getUid("itemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle));
}
}), new objj_method(sel_getUid("lastItem"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemArray"), "lastObject");
}
}), new objj_method(sel_getUid("indexOfItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItem:", aMenuItem);
}
}), new objj_method(sel_getUid("indexOfItemWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTag:", aTag);
}
}), new objj_method(sel_getUid("indexOfItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle);
}
}), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithRepresentedObject:", anObject);
}
}), new objj_method(sel_getUid("indexOfItemWithTarget:action:"), function(self, _cmd, aTarget, anAction)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTarget:action:", aTarget, anAction);
}
}), new objj_method(sel_getUid("preferredEdge"), function(self, _cmd)
{ with(self)
{
    return _preferredEdge;
}
}), new objj_method(sel_getUid("setPreferredEdge:"), function(self, _cmd, aRectEdge)
{ with(self)
{
    _preferredEdge = aRectEdge;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    if (objj_msgSend(self, "title") === aTitle)
        return;
    if (objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (objj_msgSend(items, "count") <= 0)
            objj_msgSend(self, "addItemWithTitle:", aTitle);
        else
        {
            objj_msgSend(items[0], "setTitle:", aTitle);
            objj_msgSend(self, "synchronizeTitleAndSelectedItem");
        }
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
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
}
}), new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"), function(self, _cmd)
{ with(self)
{
    var item = nil;
    if (objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (objj_msgSend(items, "count") > 0)
            item = items[0];
    }
    else
        item = objj_msgSend(self, "selectedItem");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setImage:", objj_msgSend(item, "image"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setTitle:", objj_msgSend(item, "title"));
}
}), new objj_method(sel_getUid("menuDidAddItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (_selectedIndex < 0)
        objj_msgSend(self, "selectItemAtIndex:", 0);
    else if (index == _selectedIndex)
        objj_msgSend(self, "synchronizeTitleAndSelectedItem");
    else if (index < _selectedIndex)
        ++_selectedIndex;
    if (index == 0 && objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        objj_msgSend(items[0], "setHidden:", YES);
        if (items.length > 0)
            objj_msgSend(items[1], "setHidden:", NO);
    }
    var item = objj_msgSend(_menu, "itemArray")[index],
        action = objj_msgSend(item, "action");
    if (!action || (action === sel_getUid("_popUpItemAction:")))
    {
        objj_msgSend(item, "setTarget:", self);
        objj_msgSend(item, "setAction:", sel_getUid("_popUpItemAction:"));
    }
}
}), new objj_method(sel_getUid("menuDidChangeItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (objj_msgSend(self, "pullsDown") && index != 0)
        return;
    if (!objj_msgSend(self, "pullsDown") && index != _selectedIndex)
        return;
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("menuDidRemoveItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var numberOfItems = objj_msgSend(self, "numberOfItems");
    if (numberOfItems <= _selectedIndex)
        objj_msgSend(self, "selectItemAtIndex:", numberOfItems - 1);
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "highlight:", YES);
    var menu = objj_msgSend(self, "menu"),
        theWindow = objj_msgSend(self, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", menu, objj_msgSend(self, "font"));
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    if (objj_msgSend(self, "pullsDown"))
        var menuOrigin = objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(self, "convertPoint:toView:", CGPointMake(0.0, CGRectGetMaxY(objj_msgSend(self, "bounds"))), nil));
    else
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds")), nil),
            menuOrigin = objj_msgSend(theWindow, "convertBaseToBridge:", contentRect.origin),
            menuItemRect = objj_msgSend(menuWindow, "rectForItemAtIndex:", _selectedIndex);
        menuOrigin.x -= CGRectGetMinX(menuItemRect) + objj_msgSend(menuWindow, "overlapOffsetWidth") + objj_msgSend(objj_msgSend(objj_msgSend(menu, "itemAtIndex:", _selectedIndex), "_menuItemView"), "overlapOffsetWidth");
        menuOrigin.y -= CGRectGetMinY(menuItemRect) + (CGRectGetHeight(menuItemRect) - CGRectGetHeight(contentRect)) / 2.0;
    }
    objj_msgSend(menuWindow, "setFrameOrigin:", menuOrigin);
    var menuMaxX = CGRectGetMaxX(objj_msgSend(menuWindow, "frame")),
        buttonMaxX = objj_msgSend(theWindow, "convertBaseToBridge:", CGPointMake(CGRectGetMaxX(objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "bounds"), nil)), 0.0)).x;
    if (menuMaxX < buttonMaxX)
        objj_msgSend(menuWindow, "setMinWidth:", CGRectGetWidth(objj_msgSend(menuWindow, "frame")) + buttonMaxX - menuMaxX - (objj_msgSend(self, "pullsDown") ? 0.0 : VISIBLE_MARGIN));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}), new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"), function(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    objj_msgSend(self, "highlight:", NO);
    var index = objj_msgSend(_menu, "indexOfItem:", aMenuItem);
    if (index == CPNotFound)
        return;
    objj_msgSend(self, "selectItemAtIndex:", index);
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(aMenuItem, "action"), objj_msgSend(aMenuItem, "target"), aMenuItem);
}
}), new objj_method(sel_getUid("_popUpItemAction:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
})]);
}
var CPPopUpButtonMenuKey = "CPPopUpButtonMenuKey",
    CPPopUpButtonSelectedIndexKey = "CPPopUpButtonSelectedIndexKey",
    CPPopUpButtonPullsDownKey = "CPPopUpButtonPullsDownKey";
{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPPopUpButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithCoder:", aCoder);
    if (self)
    {
        _selectedIndex = -1;
        objj_msgSend(self, "setMenu:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonMenuKey));
        objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonSelectedIndexKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPPopUpButtonMenuKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedIndex, CPPopUpButtonSelectedIndexKey);
}
})]);
}

p;21;CPProgressIndicator.jI;19;AppKit/CGGeometry.jI;20;AppKit/CPImageView.jI;15;AppKit/CPView.jc;12084;
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
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("setUsesThreadedAnimation:"), function(self, _cmd, aFlag)
{ with(self)
{
}
}), new objj_method(sel_getUid("startAnimation:"), function(self, _cmd, aSender)
{ with(self)
{
    _isAnimating = YES;
    objj_msgSend(self, "_hideOrDisplay");
}
}), new objj_method(sel_getUid("stopAnimation:"), function(self, _cmd, aSender)
{ with(self)
{
    _isAnimating = NO;
    objj_msgSend(self, "_hideOrDisplay");
}
}), new objj_method(sel_getUid("usesThreadedAnimation"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("incrementBy:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "setDoubleValue:", _doubleValue + aValue);
}
}), new objj_method(sel_getUid("setDoubleValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _doubleValue = MIN(MAX(aValue, _minValue), _maxValue);
    objj_msgSend(self, "drawBar");
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    return _doubleValue;
}
}), new objj_method(sel_getUid("setMinValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _minValue = aValue;
}
}), new objj_method(sel_getUid("minValue"), function(self, _cmd)
{ with(self)
{
    return _minValue;
}
}), new objj_method(sel_getUid("setMaxValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _maxValue = aValue;
}
}), new objj_method(sel_getUid("maxValue"), function(self, _cmd)
{ with(self)
{
    return _maxValue;
}
}), new objj_method(sel_getUid("setControlSize:"), function(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "updateBackgroundColor");
}
}), new objj_method(sel_getUid("controlSize"), function(self, _cmd)
{ with(self)
{
    return _controlSize;
}
}), new objj_method(sel_getUid("setControlTint:"), function(self, _cmd, aControlTint)
{ with(self)
{
}
}), new objj_method(sel_getUid("controlTint"), function(self, _cmd)
{ with(self)
{
    return 0;
}
}), new objj_method(sel_getUid("setBezeled:"), function(self, _cmd, isBezeled)
{ with(self)
{
}
}), new objj_method(sel_getUid("isBezeled"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setIndeterminate:"), function(self, _cmd, isIndeterminate)
{ with(self)
{
    if (_isIndeterminate == isIndeterminate)
        return;
    _isIndeterminate = isIndeterminate;
    objj_msgSend(self, "updateBackgroundColor");
}
}), new objj_method(sel_getUid("isIndeterminate"), function(self, _cmd)
{ with(self)
{
    return _isIndeterminate;
}
}), new objj_method(sel_getUid("setStyle:"), function(self, _cmd, aStyle)
{ with(self)
{
    if (_style == aStyle)
        return;
    _style = aStyle;
    objj_msgSend(self, "updateBackgroundColor");
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    if (_style == CPProgressIndicatorSpinningStyle)
        objj_msgSend(self, "setFrameSize:", objj_msgSend(objj_msgSend(CPProgressIndicatorSpinningStyleColors[_controlSize], "patternImage"), "size"));
    else
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), CPProgressIndicatorStyleSizes[
            CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle] +
            _CPControlIdentifierForControlSize(_controlSize)][0].height));
}
}), new objj_method(sel_getUid("setDisplayedWhenStopped:"), function(self, _cmd, isDisplayedWhenStopped)
{ with(self)
{
    if (_isDisplayedWhenStoppedSet && _isDisplayedWhenStopped == isDisplayedWhenStopped)
        return;
    _isDisplayedWhenStoppedSet = YES;
    _isDisplayedWhenStopped = isDisplayedWhenStopped;
    objj_msgSend(self, "_hideOrDisplay");
}
}), new objj_method(sel_getUid("isDisplayedWhenStopped"), function(self, _cmd)
{ with(self)
{
    if (_isDisplayedWhenStoppedSet)
        return _isDisplayedWhenStopped;
    if (_style == CPProgressIndicatorBarStyle || _style == CPProgressIndicatorHUDBarStyle)
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("_hideOrDisplay"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setHidden:", !_isAnimating && !objj_msgSend(self, "isDisplayedWhenStopped"));
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "drawBar");
}
}), new objj_method(sel_getUid("drawBar"), function(self, _cmd)
{ with(self)
{
    if (_style == CPProgressIndicatorSpinningStyle)
        return;
    if (!_barView)
    {
        _barView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2.0, 2.0, 0.0, 9.0));
        objj_msgSend(_barView, "setBackgroundColor:", objj_msgSend(CPColor, "redColor"));
        objj_msgSend(self, "addSubview:", _barView);
    }
    objj_msgSend(_barView, "setBackgroundColor:", _CPControlColorWithPatternImage(
        CPProgressIndicatorStyleSizes,
        CPProgressIndicatorClassName,
        "Bar",
        CPProgressIndicatorStyleIdentifiers[_style],
        _CPControlIdentifierForControlSize(_controlSize)));
    objj_msgSend(_barView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "bounds")) * (_doubleValue - _minValue) / (_maxValue - _minValue) - 4.0, 9.0));
}
}), new objj_method(sel_getUid("updateBackgroundColor"), function(self, _cmd)
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
            objj_msgSend(self, "setBackgroundColor:", _CPControlThreePartImagePattern(
                NO,
                CPProgressIndicatorStyleSizes,
                CPProgressIndicatorClassName,
                "BezelBorder",
                CPProgressIndicatorStyleIdentifiers[_style],
                _CPControlIdentifierForControlSize(_controlSize)));
            objj_msgSend(self, "drawBar");
        }
    }
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPProgressIndicator, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPProgressIndicatorSpinningStyleColors = [];
    CPProgressIndicatorSpinningStyleColors[CPMiniControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", 
        objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0, 64.0)));
    CPProgressIndicatorSpinningStyleColors[CPSmallControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", 
        objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0, 64.0)));
    CPProgressIndicatorSpinningStyleColors[CPRegularControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", 
        objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0, 64.0)));
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
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    prefix = CPProgressIndicatorClassName + "Bar" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = { width:1.0, height:9.0 };
    prefix = CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    prefix = CPProgressIndicatorClassName + "Bar" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = { width:1.0, height:9.0 };
}
})]);
}

p;13;CPResponder.jI;21;Foundation/CPObject.jc;6097;
CPDeleteKeyCode = 8;
CPUpArrowKeyCode = 63232;
CPDownArrowKeyCode = 63233;
CPLeftArrowKeyCode = 63234;
CPRightArrowKeyCode = 63235;
{var the_class = objj_allocateClassPair(CPObject, "CPResponder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_nextResponder")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("becomeFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("resignFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setNextResponder:"), function(self, _cmd, aResponder)
{ with(self)
{
    _nextResponder = aResponder;
}
}), new objj_method(sel_getUid("nextResponder"), function(self, _cmd)
{ with(self)
{
    return _nextResponder;
}
}), new objj_method(sel_getUid("interpretKeyEvents:"), function(self, _cmd, events)
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
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseMoved:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseEntered:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseExited:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("scrollWheel:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("keyDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("keyUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("performKeyEquivalent:"), function(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("deleteBackward:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertLineBreak:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertText:"), function(self, _cmd, aString)
{ with(self)
{
}
}), new objj_method(sel_getUid("doCommandBySelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
        objj_msgSend(self, "performSelector:", aSelector);
    else
        objj_msgSend(_nextResponder, "doCommandBySelector:", aSelector);
}
}), new objj_method(sel_getUid("tryToPerform:with:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
    {
        objj_msgSend(self, "performSelector:withObject:", aSelector, anObject);
        return YES;
    }
    return objj_msgSend(_nextResponder, "tryToPerform:with:", aSelector, anObject);
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
}), new objj_method(sel_getUid("menu"), function(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("undoManager"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_nextResponder, "performSelector:", _cmd);
}
}), new objj_method(sel_getUid("noResponderFor:"), function(self, _cmd, anEventSelector)
{ with(self)
{
}
})]);
}
var CPResponderNextResponderKey = "CPResponderNextResponderKey";
{
var the_class = objj_getClass("CPResponder")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPResponder\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _nextResponder = objj_msgSend(aCoder, "decodeObjectForKey:", CPResponderNextResponderKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _nextResponder, CPResponderNextResponderKey);
}
})]);
}

p;12;CPScroller.ji;11;CPControl.jc;20770;
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
var PARTS_ARRANGEMENT = [CPScrollerKnobSlot, CPScrollerDecrementLine, CPScrollerIncrementLine, CPScrollerKnob],
    NAMES_FOR_PARTS = {},
    PARTS_FOR_NAMES = {};
NAMES_FOR_PARTS[CPScrollerDecrementLine] = "decrement-line";
NAMES_FOR_PARTS[CPScrollerIncrementLine] = "increment-line";
NAMES_FOR_PARTS[CPScrollerKnobSlot] = "knob-slot";
NAMES_FOR_PARTS[CPScrollerKnob] = "knob";
{var the_class = objj_allocateClassPair(CPControl, "CPScroller"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controlSize"), new objj_ivar("_usableParts"), new objj_ivar("_partRects"), new objj_ivar("_isVertical"), new objj_ivar("_knobProportion"), new objj_ivar("_hitPart"), new objj_ivar("_trackingPart"), new objj_ivar("_trackingFloatValue"), new objj_ivar("_trackingStartPoint")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isVertical"), function(self, _cmd)
{ with(self)
{
return _isVertical;
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        _partRects = [];
        objj_msgSend(self, "setFloatValue:knobProportion:", 0.0, 1.0);
        _hitPart = CPScrollerNoPart;
        objj_msgSend(self, "_recalculateIsVertical");
    }
    return self;
}
}), new objj_method(sel_getUid("setControlSize:"), function(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("controlSize"), function(self, _cmd)
{ with(self)
{
    return _controlSize;
}
}), new objj_method(sel_getUid("setFloatValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFloatValue:", MIN(1.0, MAX(0.0, aValue)));
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("setFloatValue:knobProportion:"), function(self, _cmd, aValue, aProportion)
{ with(self)
{
    _knobProportion = MIN(1.0, MAX(0.0001, aProportion));
    objj_msgSend(self, "setFloatValue:", aValue);
}
}), new objj_method(sel_getUid("knobProportion"), function(self, _cmd)
{ with(self)
{
    return _knobProportion;
}
}), new objj_method(sel_getUid("currentValueForThemedAttributeName:"), function(self, _cmd, anAttributeName)
{ with(self)
{
    var controlState = _controlState;
    if (NAMES_FOR_PARTS[_hitPart] + "-color" !== anAttributeName)
        controlState &= ~CPControlStateHighlighted;
    return objj_msgSend(self, "valueForThemedAttributeName:inControlState:", anAttributeName, controlState);
}
}), new objj_method(sel_getUid("rectForPart:"), function(self, _cmd, aPart)
{ with(self)
{
    if (aPart == CPScrollerNoPart)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    return _partRects[aPart];
}
}), new objj_method(sel_getUid("testPart:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("checkSpaceForParts"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    if (_knobProportion === 1.0)
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
    _usableParts = CPAllScrollerParts;
    var trackOverlapInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "track-overlap-inset"),
        width = (bounds.size.width),
        height = (bounds.size.height);
    if (objj_msgSend(self, "isVertical"))
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "increment-line-size"),
            effectiveDecrementLineHeight = decrementLineSize.height - trackOverlapInset.top,
            effectiveIncrementLineHeight = incrementLineSize.height - trackOverlapInset.bottom,
            slotHeight = height - effectiveDecrementLineHeight - effectiveIncrementLineHeight,
            minimumKnobSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "minimum-knob-size"),
            knobHeight = MAX(minimumKnobSize.height, (slotHeight * _knobProportion)),
            knobLocation = effectiveDecrementLineHeight + (slotHeight - knobHeight) * objj_msgSend(self, "floatValue");
        _partRects[CPScrollerDecrementPage] = { origin: { x:0.0, y:effectiveDecrementLineHeight }, size: { width:width, height:knobLocation - effectiveDecrementLineHeight } };
        _partRects[CPScrollerKnob] = { origin: { x:(width - minimumKnobSize.width) / 2.0, y:knobLocation }, size: { width:minimumKnobSize.width, height:knobHeight } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:0.0, y:knobLocation + knobHeight }, size: { width:width, height:height - (knobLocation + knobHeight) - effectiveIncrementLineHeight } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:0.0, y:effectiveDecrementLineHeight }, size: { width:width, height:slotHeight } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:decrementLineSize.width, height:decrementLineSize.height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:height - incrementLineSize.height }, size: { width:incrementLineSize.width, height:incrementLineSize.height } };
    }
    else
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "increment-line-size"),
            effectiveDecrementLineWidth = decrementLineSize.width - trackOverlapInset.left,
            effectiveIncrementLineWidth = incrementLineSize.width - trackOverlapInset.right;
            slotWidth = width - effectiveDecrementLineWidth - effectiveIncrementLineWidth,
            minimumKnobSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "minimum-knob-size"),
            knobWidth = MAX(minimumKnobSize.width, (slotWidth * _knobProportion)),
            knobLocation = effectiveDecrementLineWidth + (slotWidth - knobWidth) * objj_msgSend(self, "floatValue");
        _partRects[CPScrollerDecrementPage] = { origin: { x:effectiveDecrementLineWidth, y:0.0 }, size: { width:knobLocation - effectiveDecrementLineWidth, height:height } };
        _partRects[CPScrollerKnob] = { origin: { x:knobLocation, y:0.0 }, size: { width:knobWidth, height:minimumKnobSize.height } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:knobLocation + knobWidth, y:0.0 }, size: { width:width - (knobLocation + knobWidth) - effectiveIncrementLineWidth, height:height } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:effectiveDecrementLineWidth, y:0.0 }, size: { width:slotWidth, height:height } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:decrementLineSize.width, height:decrementLineSize.height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:width - incrementLineSize.width, y:0.0 }, size: { width:incrementLineSize.width, height:incrementLineSize.height } };
    }
}
}), new objj_method(sel_getUid("usableParts"), function(self, _cmd)
{ with(self)
{
    return _usableParts;
}
}), new objj_method(sel_getUid("drawArrow:highlight:"), function(self, _cmd, anArrow, shouldHighlight)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawKnob"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawKnobSlot"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("createViewForPart:"), function(self, _cmd, aPart)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    return _partRects[aName];
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "checkSpaceForParts");
    var index = 0,
        count = PARTS_ARRANGEMENT.length;
    for (; index < count; ++index)
    {
        var part = PARTS_ARRANGEMENT[index];
        if (index === 0)
            view = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", part, CPWindowBelow, PARTS_ARRANGEMENT[index + 1]);
        else
            view = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", part, CPWindowAbove, PARTS_ARRANGEMENT[index - 1]);
        if (view)
            objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", NAMES_FOR_PARTS[part] + "-color"));
    }
}
}), new objj_method(sel_getUid("drawParts"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "drawKnobSlot");
    objj_msgSend(self, "drawKnob");
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, NO);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, NO);
}
}), new objj_method(sel_getUid("hitPart"), function(self, _cmd)
{ with(self)
{
    return _hitPart;
}
}), new objj_method(sel_getUid("trackKnob:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        _hitPart = CPScrollerNoPart;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        _trackingFloatValue = objj_msgSend(self, "floatValue");
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    }
    else if (type === CPLeftMouseDragged)
    {
        var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
            knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
            remainder = !objj_msgSend(self, "isVertical") ? ((knobSlotRect.size.width) - (knobRect.size.width)) : ((knobSlotRect.size.height) - (knobRect.size.height));
        if (remainder <= 0)
            objj_msgSend(self, "setFloatValue:", 0.0);
        else
        {
            var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
                delta = !objj_msgSend(self, "isVertical") ? location.x - _trackingStartPoint.x : location.y - _trackingStartPoint.y;
            objj_msgSend(self, "setFloatValue:", _trackingFloatValue + delta / remainder);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackKnob:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
}), new objj_method(sel_getUid("trackScrollButtons:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        objj_msgSend(self, "highlight:", NO);
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        _hitPart = CPScrollerNoPart;
        return;
    }
    if (type === CPLeftMouseDown)
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
                    knobWidth = !objj_msgSend(self, "isVertical") ? (knobRect.size.width) : (knobRect.size.height),
                    knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
                    remainder = (!objj_msgSend(self, "isVertical") ? (knobSlotRect.size.width) : (knobSlotRect.size.height)) - knobWidth;
                objj_msgSend(self, "setFloatValue:", ((!objj_msgSend(self, "isVertical") ? _trackingStartPoint.x - (knobSlotRect.origin.x) : _trackingStartPoint.y - (knobSlotRect.origin.y)) - knobWidth / 2.0) / remainder);
                _hitPart = CPScrollerKnob;
                objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
                return objj_msgSend(self, "trackKnob:", anEvent);
            }
        }
        objj_msgSend(self, "highlight:", YES);
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
        objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.5, 0.04);
    }
    else if (type === CPLeftMouseDragged)
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
        objj_msgSend(self, "highlight:", CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint));
    }
    else if (type == CPPeriodic && CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint))
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackScrollButtons:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("_recalculateIsVertical"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        width = (bounds.size.width),
        height = (bounds.size.height);
    _isVertical = width < height ? 1 : (width > height ? 0 : -1);
    if (_isVertical === 1)
        _controlState |= CPControlStateVertical;
    else if (_isVertical === 0)
        _controlState &= ~CPControlStateVertical;
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(self, "_recalculateIsVertical");
    objj_msgSend(self, "checkSpaceForParts");
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
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
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [ { top:(0), left:(0), bottom:(0), right:(0) },
                                                    nil, nil, nil, nil,
                                                    { width:0.0, height:0.0 }, { width:0.0, height:0.0 }, { width:0.0, height:0.0 }], [ "track-overlap-inset",
                                                    "knob-slot-color",
                                                    "decrement-line-color",
                                                    "increment-line-color",
                                                    "knob-color",
                                                    "decrement-line-size",
                                                    "increment-line-size",
                                                    "minimum-knob-size"]);
}
}), new objj_method(sel_getUid("scrollerWidth"), function(self, _cmd)
{ with(self)
{
    return 17.0;
}
}), new objj_method(sel_getUid("scrollerWidthForControlSize:"), function(self, _cmd, aControlSize)
{ with(self)
{
    return 17.0;
}
})]);
}
var CPScrollerControlSizeKey = "CPScrollerControlSize",
    CPScrollerKnobProportionKey = "CPScrollerKnobProportion";
{
var the_class = objj_getClass("CPScroller")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPScroller\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder))
    {
        _controlSize = CPRegularControlSize;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerControlSizeKey))
            _controlSize = objj_msgSend(aCoder, "decodeIntForKey:", CPScrollerControlSizeKey);
        _knobProportion = 1.0;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerKnobProportionKey))
            _knobProportion = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollerKnobProportionKey);
        _partRects = [];
        _hitPart = CPScrollerNoPart;
        objj_msgSend(self, "_recalculateIsVertical");
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", _controlSize, CPScrollerControlSizeKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _knobProportion, CPScrollerKnobProportionKey);
}
})]);
}

p;14;CPScrollView.ji;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;20163;
{var the_class = objj_allocateClassPair(CPView, "CPScrollView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_hasHorizontalScroller"), new objj_ivar("_autohidesScrollers"), new objj_ivar("_verticalScroller"), new objj_ivar("_horizontalScroller"), new objj_ivar("_recursionCount"), new objj_ivar("_verticalLineScroll"), new objj_ivar("_verticalPageScroll"), new objj_ivar("_horizontalLineScroll"), new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("contentSize"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "frame").size;
}
}), new objj_method(sel_getUid("documentView"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "documentView");
}
}), new objj_method(sel_getUid("setContentView:"), function(self, _cmd, aContentView)
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
    objj_msgSend(_contentView, "setFrame:", CGRectMake(0.0, 0.0, size.width, size.height));
    objj_msgSend(_contentView, "setDocumentView:", documentView);
    objj_msgSend(self, "addSubview:", _contentView);
}
}), new objj_method(sel_getUid("contentView"), function(self, _cmd)
{ with(self)
{
    return _contentView;
}
}), new objj_method(sel_getUid("setDocumentView:"), function(self, _cmd, aView)
{ with(self)
{
   objj_msgSend(_contentView, "setDocumentView:", aView);
   objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("reflectScrolledClipView:"), function(self, _cmd, aClipView)
{ with(self)
{
    if(_contentView !== aClipView)
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
        verticalScrollerWidth = (objj_msgSend(_verticalScroller, "frame").size.width);
        horizontalScrollerHeight = (objj_msgSend(_horizontalScroller, "frame").size.height);
    if (_autohidesScrollers)
    {
        if (shouldShowVerticalScroller)
            shouldShowHorizontalScroller = (!_autohidesScrollers || difference.width > -verticalScrollerWidth) && _hasHorizontalScroller;
        if (shouldShowHorizontalScroller)
            shouldShowVerticalScroller = (!_autohidesScrollers || difference.height > -horizontalScrollerHeight) && _hasVerticalScroller;
    }
    objj_msgSend(_verticalScroller, "setHidden:", !shouldShowVerticalScroller);
    objj_msgSend(_verticalScroller, "setEnabled:", difference.height > 0.0);
    objj_msgSend(_horizontalScroller, "setHidden:", !shouldShowHorizontalScroller);
    objj_msgSend(_horizontalScroller, "setEnabled:", difference.width > 0.0);
    if (shouldShowVerticalScroller)
    {
        var verticalScrollerHeight = CPRectGetHeight(contentViewFrame);
        if (shouldShowHorizontalScroller)
            verticalScrollerHeight -= horizontalScrollerHeight;
        difference.width += verticalScrollerWidth;
        contentViewFrame.size.width -= verticalScrollerWidth;
        objj_msgSend(_verticalScroller, "setFloatValue:knobProportion:", (difference.height <= 0.0) ? 0.0 : scrollPoint.y / difference.height, CPRectGetHeight(contentViewFrame) / CPRectGetHeight(documentFrame));
        objj_msgSend(_verticalScroller, "setFrame:", CPRectMake(CPRectGetMaxX(contentViewFrame), 0.0, verticalScrollerWidth, verticalScrollerHeight));
    }
    else if (wasShowingVerticalScroller)
        objj_msgSend(_verticalScroller, "setFloatValue:knobProportion:", 0.0, 1.0);
    if (shouldShowHorizontalScroller)
    {
        difference.height += horizontalScrollerHeight;
        contentViewFrame.size.height -= horizontalScrollerHeight;
        objj_msgSend(_horizontalScroller, "setFloatValue:knobProportion:", (difference.width <= 0.0) ? 0.0 : scrollPoint.x / difference.width, CPRectGetWidth(contentViewFrame) / CPRectGetWidth(documentFrame));
        objj_msgSend(_horizontalScroller, "setFrame:", CPRectMake(0.0, CPRectGetMaxY(contentViewFrame), CPRectGetWidth(contentViewFrame), horizontalScrollerHeight));
    }
    else if (wasShowingHorizontalScroller)
        objj_msgSend(_horizontalScroller, "setFloatValue:knobProportion:", 0.0, 1.0);
    objj_msgSend(_contentView, "setFrame:", contentViewFrame);
    --_recursionCount;
}
}), new objj_method(sel_getUid("setHorizontalScroller:"), function(self, _cmd, aScroller)
{ with(self)
{
    if (_horizontalScroller === aScroller)
        return;
    objj_msgSend(_horizontalScroller, "removeFromSuperview");
    objj_msgSend(_horizontalScroller, "setTarget:", nil);
    objj_msgSend(_horizontalScroller, "setAction:", nil);
    _horizontalScroller = aScroller;
    objj_msgSend(_horizontalScroller, "setTarget:", self);
    objj_msgSend(_horizontalScroller, "setAction:", sel_getUid("_horizontalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _horizontalScroller);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("horizontalScroller"), function(self, _cmd)
{ with(self)
{
    return _horizontalScroller;
}
}), new objj_method(sel_getUid("setHasHorizontalScroller:"), function(self, _cmd, shouldHaveHorizontalScroller)
{ with(self)
{
    if (_hasHorizontalScroller === shouldHaveHorizontalScroller)
        return;
    _hasHorizontalScroller = shouldHaveHorizontalScroller;
    if (_hasHorizontalScroller && !_horizontalScroller)
        objj_msgSend(self, "setHorizontalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CPRectGetWidth(objj_msgSend(self, "bounds")), objj_msgSend(CPScroller, "scrollerWidth"))));
    else if (!_hasHorizontalScroller && _horizontalScroller)
    {
        objj_msgSend(_horizontalScroller, "setHidden:", YES);
        objj_msgSend(self, "reflectScrolledClipView:", _contentView);
    }
}
}), new objj_method(sel_getUid("hasHorizontalScroller"), function(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
}), new objj_method(sel_getUid("setVerticalScroller:"), function(self, _cmd, aScroller)
{ with(self)
{
    if (_verticalScroller === aScroller)
        return;
    objj_msgSend(_verticalScroller, "removeFromSuperview");
    objj_msgSend(_verticalScroller, "setTarget:", nil);
    objj_msgSend(_verticalScroller, "setAction:", nil);
    _verticalScroller = aScroller;
    objj_msgSend(_verticalScroller, "setTarget:", self);
    objj_msgSend(_verticalScroller, "setAction:", sel_getUid("_verticalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _verticalScroller);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("verticalScroller"), function(self, _cmd)
{ with(self)
{
    return _verticalScroller;
}
}), new objj_method(sel_getUid("setHasVerticalScroller:"), function(self, _cmd, shouldHaveVerticalScroller)
{ with(self)
{
    if (_hasVerticalScroller === shouldHaveVerticalScroller)
        return;
    _hasVerticalScroller = shouldHaveVerticalScroller;
    if (_hasVerticalScroller && !_verticalScroller)
        objj_msgSend(self, "setVerticalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CPRectMake(0.0, 0.0, objj_msgSend(CPScroller, "scrollerWidth"), CPRectGetHeight(objj_msgSend(self, "bounds")))));
    else if (!_hasVerticalScroller && _verticalScroller)
    {
        objj_msgSend(_verticalScroller, "setHidden:", YES);
        objj_msgSend(self, "reflectScrolledClipView:", _contentView);
    }
}
}), new objj_method(sel_getUid("hasHorizontalScroller"), function(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
}), new objj_method(sel_getUid("setAutohidesScrollers:"), function(self, _cmd, autohidesScrollers)
{ with(self)
{
    if (_autohidesScrollers == autohidesScrollers)
        return;
    _autohidesScrollers = autohidesScrollers;
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("autohidesScrollers"), function(self, _cmd)
{ with(self)
{
    return _autohidesScrollers;
}
}), new objj_method(sel_getUid("_verticalScrollerDidScroll:"), function(self, _cmd, aScroller)
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
}), new objj_method(sel_getUid("_horizontalScrollerDidScroll:"), function(self, _cmd, aScroller)
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
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("setLineScroll:"), function(self, _cmd, aLineScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizonalLineScroll:", aLineScroll);
    objj_msgSend(self, "setVerticalLineScroll:", aLineScroll);
}
}), new objj_method(sel_getUid("lineScroll"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalLineScroll");
}
}), new objj_method(sel_getUid("setHorizontalLineScroll:"), function(self, _cmd, aLineScroll)
{ with(self)
{
    _horizontalLineScroll = aLineScroll;
}
}), new objj_method(sel_getUid("horizontalLineScroll"), function(self, _cmd)
{ with(self)
{
    return _horizontalLineScroll;
}
}), new objj_method(sel_getUid("setVerticalLineScroll:"), function(self, _cmd, aLineScroll)
{ with(self)
{
    _verticalLineScroll = aLineScroll;
}
}), new objj_method(sel_getUid("verticalLineScroll"), function(self, _cmd)
{ with(self)
{
    return _verticalLineScroll;
}
}), new objj_method(sel_getUid("setPageScroll:"), function(self, _cmd, aPageScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizontalPageScroll:", aPageScroll);
    objj_msgSend(self, "setVerticalPageScroll:", aPageScroll);
}
}), new objj_method(sel_getUid("pageScroll"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalPageScroll");
}
}), new objj_method(sel_getUid("setHorizontalPageScroll:"), function(self, _cmd, aPageScroll)
{ with(self)
{
    _horizontalPageScroll = aPageScroll;
}
}), new objj_method(sel_getUid("horizontalPageScroll"), function(self, _cmd)
{ with(self)
{
    return _horizontalPageScroll;
}
}), new objj_method(sel_getUid("setVerticalPageScroll:"), function(self, _cmd, aPageScroll)
{ with(self)
{
    _verticalPageScroll = aPageScroll;
}
}), new objj_method(sel_getUid("verticalPageScroll"), function(self, _cmd)
{ with(self)
{
    return _verticalPageScroll;
}
}), new objj_method(sel_getUid("scrollWheel:"), function(self, _cmd, anEvent)
{ with(self)
{
   var value = objj_msgSend(_verticalScroller, "floatValue"),
       documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    contentBounds.origin.x += objj_msgSend(anEvent, "deltaX") * _horizontalLineScroll;
    contentBounds.origin.y += objj_msgSend(anEvent, "deltaY") * _verticalLineScroll;
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
}), new objj_method(sel_getUid("keyDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var keyCode = objj_msgSend(anEvent, "keyCode"),
        value = objj_msgSend(_verticalScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        contentBounds = objj_msgSend(_contentView, "bounds");
    switch (keyCode)
    {
        case 33:
                    contentBounds.origin.y -= (contentBounds.size.height) - _verticalPageScroll;
                    break;
        case 34:
                    contentBounds.origin.y += (contentBounds.size.height) - _verticalPageScroll;
                    break;
        case 38:
                    contentBounds.origin.y -= _verticalLineScroll;
                    break;
        case 40:
                    contentBounds.origin.y += _verticalLineScroll;
                    break;
        case 37:
                    contentBounds.origin.x -= _horizontalLineScroll;
                    break;
        case 49:
                    contentBounds.origin.x += _horizontalLineScroll;
                    break;
        default: return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "keyDown:", anEvent);
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
})]);
}
var CPScrollViewContentViewKey = "CPScrollViewContentView",
    CPScrollViewVLineScrollKey = "CPScrollViewVLineScroll",
    CPScrollViewHLineScrollKey = "CPScrollViewHLineScroll",
    CPScrollViewVPageScrollKey = "CPScrollViewVPageScroll",
    CPScrollViewHPageScrollKey = "CPScrollViewHPageScroll",
    CPScrollViewHasVScrollerKey = "CPScrollViewHasVScroller",
    CPScrollViewHasHScrollerKey = "CPScrollViewHasHScroller",
    CPScrollViewVScrollerKey = "CPScrollViewVScroller",
    CPScrollViewHScrollerKey = "CPScrollViewHScroller",
    CPScrollViewAutohidesScrollerKey = "CPScrollViewAutohidesScroller";
{
var the_class = objj_getClass("CPScrollView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPScrollView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
    {
        _verticalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVLineScrollKey);
        _verticalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVPageScrollKey);
        _horizontalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHLineScrollKey);
        _horizontalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHPageScrollKey);
        _contentView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewContentViewKey);
        _verticalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewVScrollerKey);
        _horizontalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewHScrollerKey);
        _hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasVScrollerKey);
        _hasHorizontalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasHScrollerKey);
        _autohidesScrollers = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewAutohidesScrollerKey);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("reflectScrolledClipView:"), self, _contentView, 0, [CPDefaultRunLoopMode]);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _contentView, CPScrollViewContentViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _verticalScroller, CPScrollViewVScrollerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _horizontalScroller, CPScrollViewHScrollerKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalLineScroll, CPScrollViewVLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalPageScroll, CPScrollViewVPageScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _horizontalLineScroll, CPScrollViewHLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _horizontalPageScroll, CPScrollViewHPageScrollKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasVerticalScroller, CPScrollViewHasVScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasHorizontalScroller, CPScrollViewHasHScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _autohidesScrollers, CPScrollViewAutohidesScrollerKey);
}
})]);
}

p;19;CPSecureTextField.ji;13;CPTextField.jc;1083;




var TOP_PADDING = 4.0,
    BOTTOM_PADDING = 3.0;
    HORIZONTAL_PADDING = 3.0;

var CPSecureTextFieldDOMInputElement = nil;

{var the_class = objj_allocateClassPair(CPTextField, "CPSecureTextField"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTextField") }, "setFont:", aFont);
}
}), new objj_method(sel_getUid("stringValue"), function(self, _cmd)
{ with(self)
{
    return _DOMTextElement.value;
}
}), new objj_method(sel_getUid("setStringValue:"), function(self, _cmd, aStringValue)
{ with(self)
{
    _value = aStringValue;
}
})]);
}

p;20;CPSegmentedControl.jI;20;Foundation/CPArray.ji;11;CPControl.jc;20294;
CPSegmentSwitchTrackingSelectOne = 0;
CPSegmentSwitchTrackingSelectAny = 1;
CPSegmentSwitchTrackingMomentary = 2;
{var the_class = objj_allocateClassPair(CPControl, "CPSegmentedControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_segments"), new objj_ivar("_selectedSegment"), new objj_ivar("_segmentStyle"), new objj_ivar("_trackingMode"), new objj_ivar("_trackingSegment"), new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aRect)
{ with(self)
{
    _segments = [];
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aRect);
    if (self)
    {
        _selectedSegment = -1;
        _trackingMode = CPSegmentSwitchTrackingSelectOne;
    }
    return self;
}
}), new objj_method(sel_getUid("selectedTag"), function(self, _cmd)
{ with(self)
{
    return _segments[_selectedSegment].tag;
}
}), new objj_method(sel_getUid("setSegmentCount:"), function(self, _cmd, aCount)
{ with(self)
{
    if (_segments.length == aCount)
        return;
    var height = CGRectGetHeight(objj_msgSend(self, "bounds"));
    if (_segments.length < aCount)
    {
        var index = _segments.length;
        for (; index < aCount; ++index)
        {
            _segments[index] = objj_msgSend(objj_msgSend(_CPSegmentItem, "alloc"), "init");
            _segments[index].frame.size.height = height;
        }
    }
    else if (aCount < _segments.length)
    {
        var index = aCount;
        for (; index < _segments.length; ++index)
        {
            objj_msgSend(_segments[index].imageView, "removeFromSuperview");
            objj_msgSend(_segments[index].labelView, "removeFromSuperview");
            _segments[index] = nil;
        }
    }
    if (_selectedSegment < _segments.length)
        _selectedSegment = -1;
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
}), new objj_method(sel_getUid("segmentCount"), function(self, _cmd)
{ with(self)
{
    return _segments.length;
}
}), new objj_method(sel_getUid("setSelectedSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    objj_msgSend(self, "setSelected:forSegment:", YES, aSegment);
}
}), new objj_method(sel_getUid("selectedSegment"), function(self, _cmd)
{ with(self)
{
    return _selectedSegment;
}
}), new objj_method(sel_getUid("selectSegmentWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    var index = 0;
    for (; index < _segments.length; ++index)
        if (_segments[index].tag == aTag)
        {
            objj_msgSend(self, "setSelectedSegment:", index);
            return YES;
        }
    return NO;
}
}), new objj_method(sel_getUid("isTracking"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setTrackingMode:"), function(self, _cmd, aTrackingMode)
{ with(self)
{
    if (_trackingMode == aTrackingMode)
        return;
    _trackingMode = aTrackingMode;
    if (_trackingMode == CPSegmentSwitchTrackingSelectOne)
    {
        var index = 0,
            selected = NO;
        for (; index < _segments.length; ++index)
            if (_segments[index].selected)
                if (selected)
                    objj_msgSend(self, "setSelected:forSegment:", NO, index);
                else
                    selected = YES;
    }
    else if (_trackingMode == CPSegmentSwitchTrackingMomentary)
    {
        var index = 0;
        for (; index < _segments.length; ++index)
            if (_segments[index].selected)
                objj_msgSend(self, "setSelected:forSegment:", NO, index);
    }
}
}), new objj_method(sel_getUid("trackingMode"), function(self, _cmd)
{ with(self)
{
    return _trackingMode;
}
}), new objj_method(sel_getUid("setWidth:forSegment:"), function(self, _cmd, aWidth, aSegment)
{ with(self)
{
    _segments[aSegment].width = aWidth;
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
}), new objj_method(sel_getUid("widthForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].width;
}
}), new objj_method(sel_getUid("setImage:forSegment:"), function(self, _cmd, anImage, aSegment)
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
}), new objj_method(sel_getUid("imageForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].image;
}
}), new objj_method(sel_getUid("setLabel:forSegment:"), function(self, _cmd, aLabel, aSegment)
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
}), new objj_method(sel_getUid("labelForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].label;
}
}), new objj_method(sel_getUid("setMenu:forSegment:"), function(self, _cmd, aMenu, aSegment)
{ with(self)
{
    _segments[aSegment].menu = aMenu;
}
}), new objj_method(sel_getUid("menuForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].menu;
}
}), new objj_method(sel_getUid("setSelected:forSegment:"), function(self, _cmd, isSelected, aSegment)
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
}), new objj_method(sel_getUid("isSelectedForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].selected;
}
}), new objj_method(sel_getUid("setEnabled:forSegment:"), function(self, _cmd, isEnabled, aSegment)
{ with(self)
{
    _segments[aSegment].enabled = isEnabled;
}
}), new objj_method(sel_getUid("isEnabledForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].enabled;
}
}), new objj_method(sel_getUid("setTag:forSegment:"), function(self, _cmd, aTag, aSegment)
{ with(self)
{
    _segments[aSegment].tag = aTag;
}
}), new objj_method(sel_getUid("tagForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].tag;
}
}), new objj_method(sel_getUid("drawSegmentBezel:highlight:"), function(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawSegment:highlight:"), function(self, _cmd, aSegment, shouldHighlight)
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
        objj_msgSend(imageView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - imageViewSize.width) / 2.0, y));
        if (labelWidth < labelViewSize.width)
            objj_msgSend(labelView, "setFrameSize:", CGSizeMake(labelWidth, labelViewSize.height));
        objj_msgSend(labelView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - labelWidth) / 2.0, y + imageViewSize.height));
    }
    else if (imageView)
    {
        var imageViewSize = objj_msgSend(imageView, "frame").size;
        objj_msgSend(imageView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - imageViewSize.width) / 2.0, (segmentHeight - imageViewSize.height) / 2.0));
    }
    else if (labelView)
    {
        var labelViewSize = objj_msgSend(labelView, "frame").size,
            labelWidth = MIN(labelViewSize.width, segmentWidth);
        if (labelWidth < labelViewSize.width)
            objj_msgSend(labelView, "setFrameSize:", CGSizeMake(labelWidth, labelViewSize.height));
        objj_msgSend(labelView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - labelWidth) / 2.0, (segmentHeight - labelViewSize.height) / 2.0));
    }
}
}), new objj_method(sel_getUid("tileWithChangedSegment:"), function(self, _cmd, aSegment)
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
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame) + delta, CGRectGetHeight(frame)));
    segment.frame.size.width = segmentWidth;
    var index = aSegment + 1;
    for (; index < _segments.length; ++index)
    {
        _segments[index].frame.origin.x += delta;
        objj_msgSend(self, "drawSegmentBezel:highlight:", index, NO);
        objj_msgSend(self, "drawSegment:highlight:", index, NO);
    }
    objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
}
}), new objj_method(sel_getUid("frameForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].frame;
}
}), new objj_method(sel_getUid("testSegment:"), function(self, _cmd, aPoint)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil),
        count = _segments.length;
    while (count--)
        if (CGRectContainsPoint(_segments[count].frame, aPoint))
            return count;
    return -1;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "trackSegment:", anEvent);
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
}
}), new objj_method(sel_getUid("trackSegment:"), function(self, _cmd, anEvent)
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
        CPLog.error("_trackingSegment="+_trackingSegment);
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
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSegment:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFont:", aFont);
    var count = _segments.length;
    if (!count)
        return;
    while (count--)
        objj_msgSend(_segments[count].labelView, "setFont:", aFont);
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
})]);
}
var CPSegmentedControlSegmentsKey = "CPSegmentedControlSegmentsKey",
    CPSegmentedControlSelectedKey = "CPSegmentedControlSelectedKey",
    CPSegmentedControlSegmentStyleKey = "CPSegmentedControlSegmentStyleKey",
    CPSegmentedControlTrackingModeKey = "CPSegmentedControlTrackingModeKey";
{
var the_class = objj_getClass("CPSegmentedControl")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSegmentedControl\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _segments = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentedControlSegmentsKey);
        _segmentStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSegmentStyleKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlSelectedKey))
            _selectedSegment = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSelectedKey);
        else
            _selectedSegment = -1;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlTrackingModeKey))
            _trackingMode = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlTrackingModeKey);
        else
            _trackingMode = CPSegmentSwitchTrackingSelectOne;
        for (var i = 0; i < _segments.length; i++)
        {
            if (_segments[i].image != undefined)
                objj_msgSend(self, "setImage:forSegment:", _segments[i].image, i);
            if (_segments[i].label != undefined)
                objj_msgSend(self, "setLabel:forSegment:", _segments[i].label, i);
        }
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _segments, CPSegmentedControlSegmentsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedSegment, CPSegmentedControlSelectedKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _segmentStyle, CPSegmentedControlSegmentStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _trackingMode, CPSegmentedControlTrackingModeKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPSegmentItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("image"), new objj_ivar("label"), new objj_ivar("menu"), new objj_ivar("selected"), new objj_ivar("enabled"), new objj_ivar("tag"), new objj_ivar("width"), new objj_ivar("labelView"), new objj_ivar("imageView"), new objj_ivar("frame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        image = nil;
        label = "";
        menu = nil;
        selected = NO;
        enabled = NO;
        tag = 0;
        labelView = nil;
        imageView = nil;
        width = 0;
        frame = CGRectMakeZero();
    }
    return self;
}
})]);
}
var CPSegmentItemImageKey = "CPSegmentItemImageKey",
    CPSegmentItemLabelKey = "CPSegmentItemLabelKey",
    CPSegmentItemMenuKey = "CPSegmentItemMenuKey",
    CPSegmentItemSelectedKey = "CPSegmentItemSelectedKey",
    CPSegmentItemEnabledKey = "CPSegmentItemEnabledKey",
    CPSegmentItemTagKey = "CPSegmentItemTagKey";
{
var the_class = objj_getClass("_CPSegmentItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPSegmentItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        image = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemImageKey);
        label = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemLabelKey);
        menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemMenuKey);
        selected = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemSelectedKey);
        enabled = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemEnabledKey);
        tag = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentItemTagKey);
        labelView = nil;
        imageView = nil;
        width = 0;
        frame = CGRectMakeZero();
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", image, CPSegmentItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", label, CPSegmentItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", menu, CPSegmentItemMenuKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", selected, CPSegmentItemSelectedKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", enabled, CPSegmentItemEnabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", tag, CPSegmentItemTagKey);
}
})]);
}

p;10;CPShadow.jI;21;Foundation/CPObject.jc;1646;
{var the_class = objj_allocateClassPair(CPObject, "CPShadow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_offset"), new objj_ivar("_blurRadius"), new objj_ivar("_color"), new objj_ivar("_cssString")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"), function(self, _cmd, anOffset, aBlurRadius, aColor)
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
}), new objj_method(sel_getUid("shadowOffset"), function(self, _cmd)
{ with(self)
{
    return _offset;
}
}), new objj_method(sel_getUid("shadowBlurRadius"), function(self, _cmd)
{ with(self)
{
    return _blurRadius;
}
}), new objj_method(sel_getUid("shadowColor"), function(self, _cmd)
{ with(self)
{
    return _color;
}
}), new objj_method(sel_getUid("cssString"), function(self, _cmd)
{ with(self)
{
    return _cssString;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"), function(self, _cmd, anOffset, aBlurRadius, aColor)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPShadow, "alloc"), "_initWithOffset:blurRadius:color:", anOffset, aBlurRadius, aColor);
}
})]);
}

p;14;CPShadowView.jI;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jc;7424;
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
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("setWeight:"), function(self, _cmd, aWeight)
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
}), new objj_method(sel_getUid("leftInset"), function(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_LEFT_INSET : HEAVY_LEFT_INSET;
}
}), new objj_method(sel_getUid("rightInset"), function(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_RIGHT_INSET : HEAVY_RIGHT_INSET;
}
}), new objj_method(sel_getUid("topInset"), function(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_TOP_INSET : HEAVY_TOP_INSET;
}
}), new objj_method(sel_getUid("bottomInset"), function(self, _cmd)
{ with(self)
{
    return _weight == CPLightShadow ? LIGHT_BOTTOM_INSET : HEAVY_BOTTOM_INSET;
}
}), new objj_method(sel_getUid("horizontalInset"), function(self, _cmd)
{ with(self)
{
    if (_weight == CPLightShadow)
        return LIGHT_LEFT_INSET + LIGHT_RIGHT_INSET;
    return HEAVY_LEFT_INSET + HEAVY_RIGHT_INSET;
}
}), new objj_method(sel_getUid("verticalInset"), function(self, _cmd)
{ with(self)
{
    if (_weight == CPLightShadow)
        return LIGHT_TOP_INSET + LIGHT_BOTTOM_INSET;
    return HEAVY_TOP_INSET + HEAVY_BOTTOM_INSET;
}
}), new objj_method(sel_getUid("frameForContentFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameForContentFrame:withWeight:", aFrame, _weight);
}
}), new objj_method(sel_getUid("setFrameForContentFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:", objj_msgSend(self, "frameForContentFrame:", aFrame));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPShadowView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    CPShadowViewLightBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTopLeft.png"), CGSizeMake(9.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTop.png"), CGSizeMake(1.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightTopRight.png"), CGSizeMake(9.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightLeft.png"), CGSizeMake(9.0, 1.0)),
            nil,
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightRight.png"), CGSizeMake(9.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottomLeft.png"), CGSizeMake(9.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottom.png"), CGSizeMake(1.0, 9.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewLightBottomRight.png"), CGSizeMake(9.0, 9.0))
        ]));
    CPShadowViewHeavyBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTopLeft.png"), CGSizeMake(17.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTop.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyTopRight.png"), CGSizeMake(17.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyLeft.png"), CGSizeMake(17.0, 1.0)),
            nil,
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyRight.png"), CGSizeMake(17.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottomLeft.png"), CGSizeMake(17.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottom.png"), CGSizeMake(1.0, 17.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPShadowView/CPShadowViewHeavyBottomRight.png"), CGSizeMake(17.0, 17.0))
        ]));
}
}), new objj_method(sel_getUid("frameForContentFrame:withWeight:"), function(self, _cmd, aFrame, aWeight)
{ with(self)
{
    if (aWeight == CPLightShadow)
        return CGRectMake((aFrame.origin.x) - LIGHT_LEFT_INSET, (aFrame.origin.y) - LIGHT_TOP_INSET, (aFrame.size.width) + LIGHT_LEFT_INSET + LIGHT_RIGHT_INSET, (aFrame.size.height) + LIGHT_TOP_INSET + LIGHT_BOTTOM_INSET);
    else
        return CGRectMake((aFrame.origin.x) - HEAVY_LEFT_INSET, (aFrame.origin.y) - HEAVY_TOP_INSET, (aFrame.size.width) + HEAVY_LEFT_INSET + HEAVY_RIGHT_INSET, (aFrame.size.height) + HEAVY_TOP_INSET + HEAVY_BOTTOM_INSET);
}
})]);
}

p;10;CPSlider.ji;11;CPControl.jc;12178;
{var the_class = objj_allocateClassPair(CPControl, "CPSlider"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_altIncrementValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minValue = 0.0;
        _maxValue = 100.0;
        objj_msgSend(self, "setObjectValue:", 50.0);
        objj_msgSend(self, "setContinuous:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("setMinValue:"), function(self, _cmd, aMinimumValue)
{ with(self)
{
    if (_minValue === aMinimumValue)
        return;
    _minValue = aMinimumValue;
    var doubleValue = objj_msgSend(self, "doubleValue");
    if (doubleValue < _minValue)
        objj_msgSend(self, "setDoubleValue:", _minValue);
}
}), new objj_method(sel_getUid("minValue"), function(self, _cmd)
{ with(self)
{
    return _minValue;
}
}), new objj_method(sel_getUid("setMaxValue:"), function(self, _cmd, aMaximumValue)
{ with(self)
{
    if (_maxValue === aMaximumValue)
        return;
    _maxValue = aMaximumValue;
    var doubleValue = objj_msgSend(self, "doubleValue");
    if (doubleValue > _maxValue)
        objj_msgSend(self, "setDoubleValue:", _maxValue);
}
}), new objj_method(sel_getUid("maxValue"), function(self, _cmd)
{ with(self)
{
    return _maxValue;
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", MIN(MAX(aValue, _minValue), _maxValue));
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("trackRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var trackWidth = objj_msgSend(self, "currentValueForThemedAttributeName:", "track-width");
    if (trackWidth <= 0)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    if (objj_msgSend(self, "isVertical"))
    {
        bounds.origin.x = ((bounds.size.width) - trackWidth) / 2.0;
        bounds.size.width = trackWidth;
    }
    else
    {
        bounds.origin.y = ((bounds.size.height) - trackWidth) / 2.0;
        bounds.size.height = trackWidth;
    }
    return bounds;
}
}), new objj_method(sel_getUid("knobRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var knobSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "knob-size");
    if (knobSize.width <= 0 || knobSize.height <= 0)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var knobRect = { origin: { x:0.0, y:0.0 }, size: { width:knobSize.width, height:knobSize.height } },
        trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
    if (!trackRect || (trackRect.size.width <= 0.0 || trackRect.size.height <= 0.0))
        trackRect = bounds;
    if (objj_msgSend(self, "isVertical"))
    {
        knobRect.origin.x = (trackRect.origin.x + (trackRect.size.width) / 2.0) - knobSize.width / 2.0;
        knobRect.origin.y = ((objj_msgSend(self, "doubleValue") - _minValue) / (_maxValue - _minValue)) * ((trackRect.size.height) - knobSize.height);
    }
    else
    {
        knobRect.origin.x = ((objj_msgSend(self, "doubleValue") - _minValue) / (_maxValue - _minValue)) * ((trackRect.size.width) - knobSize.width);
        knobRect.origin.y = (trackRect.origin.y + (trackRect.size.height) / 2.0) - knobSize.height / 2.0;
    }
    return knobRect;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "track-view")
        return objj_msgSend(self, "trackRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "knob-view")
        return objj_msgSend(self, "knobRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "track-view" || aName === "knob-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("setAltIncrementValue:"), function(self, _cmd, anAltIncrementValue)
{ with(self)
{
    _altIncrementValue = anAltIncrementValue;
}
}), new objj_method(sel_getUid("altIncrementValue"), function(self, _cmd)
{ with(self)
{
    return _altIncrementValue;
}
}), new objj_method(sel_getUid("isVertical"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds);
    return width < height ? 1 : (width > height ? 0 : -1);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var trackView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "track-view", CPWindowBelow, "knob-view");
    if (trackView)
        if (objj_msgSend(self, "isVertical"))
            objj_msgSend(trackView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "vertical-track-color"));
        else
            objj_msgSend(trackView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "horizontal-track-color"));
    var knobView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "knob-view", CPWindowAbove, "track-view");
    if (knobView)
        objj_msgSend(knobView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "knob-color"));
}
}), new objj_method(sel_getUid("tracksMouseOutsideOfFrame"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("_valueAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        knobRect = objj_msgSend(self, "knobRectForBounds:", bounds),
        trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
    if (objj_msgSend(self, "isVertical"))
    {
        var knobHeight = (knobRect.size.height);
        trackRect.origin.y += knobHeight / 2;
        trackRect.size.height -= knobHeight;
        var minValue = objj_msgSend(self, "minValue");
        return MAX(0.0, MIN(1.0, (aPoint.y - (trackRect.origin.y)) / (trackRect.size.height))) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
    }
    else
    var knobWidth = (knobRect.size.width);
    trackRect.origin.x += knobWidth / 2;
    trackRect.size.width -= knobWidth;
    var minValue = objj_msgSend(self, "minValue");
    return MAX(0.0, MIN(1.0, (aPoint.x - (trackRect.origin.x)) / (trackRect.size.width))) * (objj_msgSend(self, "maxValue") - minValue) + minValue;
}
}), new objj_method(sel_getUid("startTrackingAt:"), function(self, _cmd, aPoint)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        knobRect = objj_msgSend(self, "knobRectForBounds:", { origin: { x:bounds.origin.x, y:bounds.origin.y }, size: { width:bounds.size.width, height:bounds.size.height } });
    if ((aPoint.x >= (knobRect.origin.x) && aPoint.y >= (knobRect.origin.y) && aPoint.x < (knobRect.origin.x + knobRect.size.width) && aPoint.y < (knobRect.origin.y + knobRect.size.height)))
        _dragOffset = { width:(knobRect.origin.x + (knobRect.size.width) / 2.0) - aPoint.x, height:(knobRect.origin.y + (knobRect.size.height) / 2.0) - aPoint.y };
    else
    {
        var trackRect = objj_msgSend(self, "trackRectForBounds:", bounds);
        if (trackRect && (aPoint.x >= (trackRect.origin.x) && aPoint.y >= (trackRect.origin.y) && aPoint.x < (trackRect.origin.x + trackRect.size.width) && aPoint.y < (trackRect.origin.y + trackRect.size.height)))
        {
            _dragOffset = { width:0.0, height:0.0 };
            objj_msgSend(self, "setObjectValue:", objj_msgSend(self, "_valueAtPoint:", aPoint));
        }
        else
            return NO;
    }
    objj_msgSend(self, "setHighlighted:", YES);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
}), new objj_method(sel_getUid("continueTracking:at:"), function(self, _cmd, lastPoint, aPoint)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", objj_msgSend(self, "_valueAtPoint:", { x:aPoint.x + _dragOffset.width, y:aPoint.y + _dragOffset.height }));
    return YES;
}
}), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    objj_msgSend(self, "setHighlighted:", NO);
    if (objj_msgSend(_target, "respondsToSelector:", sel_getUid("sliderDidFinish:")))
        objj_msgSend(_target, "sliderDidFinish:", self);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("setContinuous:"), function(self, _cmd, flag)
{ with(self)
{
    if (flag)
        _sendActionOn |= CPLeftMouseDraggedMask;
    else
        _sendActionOn &= ~CPLeftMouseDraggedMask;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [nil, { width:0.0, height:0.0 }, 0.0, nil, nil], ["knob-color", "knob-size", "track-width", "vertical-track-color", "horizontal-track-color"]);
}
})]);
}
var CPSliderMinValueKey = "CPSliderMinValueKey",
    CPSliderMaxValueKey = "CPSliderMaxValueKey",
    CPSliderAltIncrValueKey = "CPSliderAltIncrValueKey";
{
var the_class = objj_getClass("CPSlider")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSlider\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    _minValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMinValueKey);
    _maxValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderMaxValueKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _altIncrementValue = objj_msgSend(aCoder, "decodeDoubleForKey:", CPSliderAltIncrValueKey);
        objj_msgSend(self, "setContinuous:", YES);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _minValue, CPSliderMinValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _maxValue, CPSliderMaxValueKey);
    objj_msgSend(aCoder, "encodeDouble:forKey:", _altIncrementValue, CPSliderAltIncrValueKey);
}
})]);
}
{
var the_class = objj_getClass("CPSlider")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSlider\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("value"), function(self, _cmd)
{ with(self)
{
    CPLog.warn("[CPSlider value] is deprecated, use doubleValue or objectValue instead.");
    return objj_msgSend(self, "doubleValue");
}
}), new objj_method(sel_getUid("setValue:"), function(self, _cmd, aValue)
{ with(self)
{
    CPLog.warn("[CPSlider setValue:] is deprecated, use setDoubleValue: or setObjectValue: instead.");
    objj_msgSend(self, "setObjectValue:", aValue);
}
})]);
}

p;21;CPSliderColorPicker.ji;15;CPColorPicker.jc;16686;
{var the_class = objj_allocateClassPair(CPColorPicker, "CPSliderColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_redSlider"), new objj_ivar("_greenSlider"), new objj_ivar("_blueSlider"), new objj_ivar("_hueSlider"), new objj_ivar("_saturationSlider"), new objj_ivar("_brightnessSlider"), new objj_ivar("_rgbLabel"), new objj_ivar("_hsbLabel"), new objj_ivar("_redLabel"), new objj_ivar("_greenLabel"), new objj_ivar("_blueLabel"), new objj_ivar("_hueLabel"), new objj_ivar("_saturationLabel"), new objj_ivar("_brightnessLabel"), new objj_ivar("_hexLabel"), new objj_ivar("_redValue"), new objj_ivar("_greenValue"), new objj_ivar("_blueValue"), new objj_ivar("_hueValue"), new objj_ivar("_saturationValue"), new objj_ivar("_brightnessValue"), new objj_ivar("_hexValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask,  owningColorPanel);
}
}), new objj_method(sel_getUid("initView"), function(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _contentView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    _rgbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 10, 100, 20));
    objj_msgSend(_rgbLabel, "setStringValue:",  "Red, Green, Blue");
    objj_msgSend(_rgbLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _redLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 35, 15, 20));
    objj_msgSend(_redLabel, "setStringValue:",  "R");
    objj_msgSend(_redLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _redSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 35, aFrame.size.width - 70, 20));
    objj_msgSend(_redSlider, "setMaxValue:",  1.0);
    objj_msgSend(_redSlider, "setMinValue:",  0.0);
    objj_msgSend(_redSlider, "setTarget:",  self);
    objj_msgSend(_redSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_redSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var updateFunction = function(aDOMEvent)
    {
        if(isNaN(this.value))
            return;
        switch(this)
        {
            case _redValue: objj_msgSend(_redSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 255) / 255.0, 0));
                                   break;
            case _greenValue: objj_msgSend(_greenSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 255) / 255.0, 0));
                                   break;
            case _blueValue: objj_msgSend(_blueSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 255) / 255.0, 0));
                                   break;
            case _hueValue: objj_msgSend(_hueSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 360), 0));
                                   break;
            case _saturationValue: objj_msgSend(_saturationSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 100), 0));
                                   break;
            case _brightnessValue: objj_msgSend(_brightnessSlider, "setFloatValue:", MAX(MIN(ROUND(this.value), 100), 0));
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
    var redValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 35, 45, 20));
    objj_msgSend(redValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _redValue = document.createElement("input");
    _redValue.style.width = "40px";
    _redValue.style.backgroundColor = "transparent";
    _redValue.style.border = "1px solid black";
    _redValue.style.color = "black";
    _redValue.style.position = "absolute";
    _redValue.style.top = "0px";
    _redValue.style.left = "0px";
    _redValue.onchange = updateFunction;
    redValue._DOMElement.appendChild(_redValue);
    objj_msgSend(_contentView, "addSubview:",  redValue);
    _greenLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 58, 15, 20));
    objj_msgSend(_greenLabel, "setStringValue:",  "G");
    objj_msgSend(_greenLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _greenSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 58, aFrame.size.width - 70, 20));
    objj_msgSend(_greenSlider, "setMaxValue:",  1.0);
    objj_msgSend(_greenSlider, "setMinValue:",  0.0);
    objj_msgSend(_greenSlider, "setTarget:",  self);
    objj_msgSend(_greenSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_greenSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var greenValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 58, 45, 20));
    objj_msgSend(greenValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _greenValue = _redValue.cloneNode(false);
    _greenValue.onchange = updateFunction;
    greenValue._DOMElement.appendChild(_greenValue);
    objj_msgSend(_contentView, "addSubview:",  greenValue);
    _blueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 81, 15, 20));
    objj_msgSend(_blueLabel, "setStringValue:",  "B");
    objj_msgSend(_blueLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _blueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 81, aFrame.size.width - 70, 20));
    objj_msgSend(_blueSlider, "setMaxValue:",  1.0);
    objj_msgSend(_blueSlider, "setMinValue:",  0.0);
    objj_msgSend(_blueSlider, "setTarget:",  self);
    objj_msgSend(_blueSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_blueSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var blueValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 81, 45, 20));
    objj_msgSend(blueValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _blueValue = _redValue.cloneNode(false);
    _blueValue.onchange = updateFunction;
    blueValue._DOMElement.appendChild(_blueValue);
    objj_msgSend(_contentView, "addSubview:",  blueValue);
    _hsbLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 120, 190, 20));
    objj_msgSend(_hsbLabel, "setStringValue:",  "Hue, Saturation, Brightness");
    objj_msgSend(_hsbLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _hueLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 145, 15, 20));
    objj_msgSend(_hueLabel, "setStringValue:",  "H");
    objj_msgSend(_hueLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _hueSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 145, aFrame.size.width - 70, 20));
    objj_msgSend(_hueSlider, "setMaxValue:",  359.0);
    objj_msgSend(_hueSlider, "setMinValue:",  0.0);
    objj_msgSend(_hueSlider, "setTarget:",  self);
    objj_msgSend(_hueSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_hueSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var hueValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 145, 45, 20));
    objj_msgSend(hueValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _hueValue = _redValue.cloneNode(false);
    _hueValue.onchange = updateFunction;
    hueValue._DOMElement.appendChild(_hueValue);
    objj_msgSend(_contentView, "addSubview:",  hueValue);
    _saturationLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 168, 15, 20));
    objj_msgSend(_saturationLabel, "setStringValue:",  "S");
    objj_msgSend(_saturationLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _saturationSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 168, aFrame.size.width - 70, 20));
    objj_msgSend(_saturationSlider, "setMaxValue:",  100.0);
    objj_msgSend(_saturationSlider, "setMinValue:",  0.0);
    objj_msgSend(_saturationSlider, "setTarget:",  self);
    objj_msgSend(_saturationSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_saturationSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var saturationValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 168, 45, 20));
    objj_msgSend(saturationValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _saturationValue = _redValue.cloneNode(false);
    _saturationValue.onchange = updateFunction;
    saturationValue._DOMElement.appendChild(_saturationValue);
    objj_msgSend(_contentView, "addSubview:",  saturationValue);
    _brightnessLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 191, 15, 20));
    objj_msgSend(_brightnessLabel, "setStringValue:",  "B");
    objj_msgSend(_brightnessLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(15, 191, aFrame.size.width - 70, 20));
    objj_msgSend(_brightnessSlider, "setMaxValue:",  100.0);
    objj_msgSend(_brightnessSlider, "setMinValue:",  0.0);
    objj_msgSend(_brightnessSlider, "setTarget:",  self);
    objj_msgSend(_brightnessSlider, "setAction:",  sel_getUid("sliderChanged:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:",  CPViewWidthSizable);
    var brightnessValue = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(aFrame.size.width - 45, 191, 45, 20));
    objj_msgSend(brightnessValue, "setAutoresizingMask:",  CPViewMinXMargin);
    _brightnessValue = _redValue.cloneNode(false);
    _brightnessValue.onchange = updateFunction;
    brightnessValue._DOMElement.appendChild(_brightnessValue);
    objj_msgSend(_contentView, "addSubview:",  brightnessValue);
    _hexLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(0, 230, 100, 20));
    objj_msgSend(_hexLabel, "setStringValue:",  "Hex");
    objj_msgSend(_hexLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    _hexValue = _redValue.cloneNode(false);
    _hexValue.style.top = "255px";
    _hexValue.style.width = "80px";
    _hexValue.style.left = "0px";
    _hexValue.onkeypress = function(aDOMEvent)
    {
        aDOMEvent = aDOMEvent || window.event;
        if (aDOMEvent.keyCode == 13)
        {
            var newColor = objj_msgSend(CPColor, "colorWithHexString:",  this.value);
            if(newColor)
            {
                objj_msgSend(self, "setColor:",  newColor);
                objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:",  newColor);
            }
            if(aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            else if(aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
            this.blur();
        }
    };
    _contentView._DOMElement.appendChild(_hexValue);
    objj_msgSend(_contentView, "addSubview:",  _rgbLabel);
    objj_msgSend(_contentView, "addSubview:",  _redLabel);
    objj_msgSend(_contentView, "addSubview:",  _greenLabel);
    objj_msgSend(_contentView, "addSubview:",  _blueLabel);
    objj_msgSend(_contentView, "addSubview:",  _redSlider);
    objj_msgSend(_contentView, "addSubview:",  _greenSlider);
    objj_msgSend(_contentView, "addSubview:",  _blueSlider);
    objj_msgSend(_contentView, "addSubview:",  _hsbLabel);
    objj_msgSend(_contentView, "addSubview:",  _hueLabel);
    objj_msgSend(_contentView, "addSubview:",  _saturationLabel);
    objj_msgSend(_contentView, "addSubview:",  _brightnessLabel);
    objj_msgSend(_contentView, "addSubview:",  _hueSlider);
    objj_msgSend(_contentView, "addSubview:",  _saturationSlider);
    objj_msgSend(_contentView, "addSubview:",  _brightnessSlider);
    objj_msgSend(_contentView, "addSubview:",  _hexLabel);
}
}), new objj_method(sel_getUid("provideNewView:"), function(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _contentView;
}
}), new objj_method(sel_getUid("currentMode"), function(self, _cmd)
{ with(self)
{
    return CPSliderColorPickerMode;
}
}), new objj_method(sel_getUid("supportsMode:"), function(self, _cmd, mode)
{ with(self)
{
    return (mode == CPSliderColorPickerMode) ? YES : NO;
}
}), new objj_method(sel_getUid("sliderChanged:"), function(self, _cmd, sender)
{ with(self)
{
    var newColor;
    switch(sender)
    {
        case _hueSlider:
        case _saturationSlider:
        case _brightnessSlider: newColor = objj_msgSend(CPColor, "colorWithHue:saturation:brightness:",  objj_msgSend(_hueSlider, "floatValue"),  objj_msgSend(_saturationSlider, "floatValue"),  objj_msgSend(_brightnessSlider, "floatValue"));
                                        objj_msgSend(self, "updateRGBSliders:",  newColor);
                                        break;
        case _redSlider:
        case _greenSlider:
        case _blueSlider: newColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:",  objj_msgSend(_redSlider, "floatValue"),  objj_msgSend(_greenSlider, "floatValue"),  objj_msgSend(_blueSlider, "floatValue"),  1.0);
                                        objj_msgSend(self, "updateHSBSliders:",  newColor);
                                        break;
    }
    objj_msgSend(self, "updateLabels");
    objj_msgSend(self, "updateHex:",  newColor);
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:",  newColor);
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(self, "updateRGBSliders:",  aColor);
    objj_msgSend(self, "updateHSBSliders:",  aColor);
    objj_msgSend(self, "updateHex:",  aColor);
    objj_msgSend(self, "updateLabels");
}
}), new objj_method(sel_getUid("updateHSBSliders:"), function(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents");
    objj_msgSend(_hueSlider, "setFloatValue:", hsb[0]);
    objj_msgSend(_saturationSlider, "setFloatValue:", hsb[1]);
    objj_msgSend(_brightnessSlider, "setFloatValue:", hsb[2]);
}
}), new objj_method(sel_getUid("updateHex:"), function(self, _cmd, aColor)
{ with(self)
{
    _hexValue.value = objj_msgSend(aColor, "hexString");
}
}), new objj_method(sel_getUid("updateRGBSliders:"), function(self, _cmd, aColor)
{ with(self)
{
    var rgb = objj_msgSend(aColor, "components");
    objj_msgSend(_redSlider, "setFloatValue:", rgb[0]);
    objj_msgSend(_greenSlider, "setFloatValue:", rgb[1]);
    objj_msgSend(_blueSlider, "setFloatValue:", rgb[2]);
}
}), new objj_method(sel_getUid("updateLabels"), function(self, _cmd)
{ with(self)
{
    _hueValue.value = ROUND(objj_msgSend(_hueSlider, "floatValue"));
    _saturationValue.value = ROUND(objj_msgSend(_saturationSlider, "floatValue"));
    _brightnessValue.value = ROUND(objj_msgSend(_brightnessSlider, "floatValue"));
    _redValue.value = ROUND(objj_msgSend(_redSlider, "floatValue") * 255);
    _greenValue.value = ROUND(objj_msgSend(_greenSlider, "floatValue") * 255);
    _blueValue.value = ROUND(objj_msgSend(_blueSlider, "floatValue") * 255);
}
}), new objj_method(sel_getUid("provideNewButtonImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "slider_button.png"), CGSizeMake(32, 32));
}
}), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "slider_button_h.png"), CGSizeMake(32, 32));
}
})]);
}

p;13;CPSplitView.ji;9;CPImage.ji;8;CPView.jc;21821;
CPSplitViewDidResizeSubviewsNotification = "CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification = "CPSplitViewWillResizeSubviewsNotification";
var CPSplitViewHorizontalImage = nil,
    CPSplitViewVerticalImage = nil;
{var the_class = objj_allocateClassPair(CPView, "CPSplitView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegate"), new objj_ivar("_isVertical"), new objj_ivar("_isPaneSplitter"), new objj_ivar("_currentDivider"), new objj_ivar("_initialOffset"), new objj_ivar("_originComponent"), new objj_ivar("_sizeComponent"), new objj_ivar("_DOMDividerElements"), new objj_ivar("_dividerImagePath"), new objj_ivar("_drawingDivider"), new objj_ivar("_needsResizeSubviews")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("dividerThickness"), function(self, _cmd)
{ with(self)
{
    return _isPaneSplitter ? 1.0 : 10.0;
}
}), new objj_method(sel_getUid("isVertical"), function(self, _cmd)
{ with(self)
{
    return _isVertical;
}
}), new objj_method(sel_getUid("setVertical:"), function(self, _cmd, shouldBeVertical)
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
            objj_msgSend(_subviews[index], "setFrame:", CGRectMake(ROUND((eachSize + dividerThickness) * index), 0, eachSize, frame.size.height));
    else
        for (; index < count; ++index)
            objj_msgSend(_subviews[index], "setFrame:", CGRectMake(0, ROUND((eachSize + dividerThickness) * index), frame.size.width, eachSize));
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "_postNotificationDidResize");
}
}), new objj_method(sel_getUid("_setVertical:"), function(self, _cmd, shouldBeVertical)
{ with(self)
{
    var changed = (_isVertical != shouldBeVertical);
    _isVertical = shouldBeVertical;
    _originComponent = objj_msgSend(self, "isVertical") ? "x" : "y";
    _sizeComponent = objj_msgSend(self, "isVertical") ? "width" : "height";
    _dividerImagePath = objj_msgSend(self, "isVertical") ? objj_msgSend(CPSplitViewVerticalImage, "filename") : objj_msgSend(CPSplitViewHorizontalImage, "filename");
    return changed;
}
}), new objj_method(sel_getUid("isPaneSplitter"), function(self, _cmd)
{ with(self)
{
    return _isPaneSplitter;
}
}), new objj_method(sel_getUid("setIsPaneSplitter:"), function(self, _cmd, shouldBePaneSplitter)
{ with(self)
{
    if (_isPaneSplitter == shouldBePaneSplitter)
        return;
    _isPaneSplitter = shouldBePaneSplitter;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("didAddSubview:"), function(self, _cmd, aSubview)
{ with(self)
{
    _needsResizeSubviews = YES;
}
}), new objj_method(sel_getUid("isSubviewCollapsed:"), function(self, _cmd, subview)
{ with(self)
{
    return objj_msgSend(subview, "frame").size[_sizeComponent] < 1 ? YES : NO;
}
}), new objj_method(sel_getUid("rectOfDividerAtIndex:"), function(self, _cmd, aDivider)
{ with(self)
{
    var frame = objj_msgSend(_subviews[aDivider], "frame"),
        rect = CGRectMakeZero();
    rect.size = objj_msgSend(self, "frame").size;
    rect.size[_sizeComponent] = objj_msgSend(self, "dividerThickness");
    rect.origin[_originComponent] = frame.origin[_originComponent] + frame.size[_sizeComponent];
    return rect;
}
}), new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"), function(self, _cmd, aDivider)
{ with(self)
{
    var realRect = objj_msgSend(self, "rectOfDividerAtIndex:", aDivider);
    var padding = 2;
    realRect.size[_sizeComponent] += padding * 2;
    realRect.origin[_originComponent] -= padding;
    return realRect;
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, rect)
{ with(self)
{
    var count = objj_msgSend(_subviews, "count") - 1;
    while ((count--) > 0)
    {
        _drawingDivider = count;
        objj_msgSend(self, "drawDividerInRect:", objj_msgSend(self, "rectOfDividerAtIndex:", count));
    }
}
}), new objj_method(sel_getUid("drawDividerInRect:"), function(self, _cmd, aRect)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillDraw"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
}
}), new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"), function(self, _cmd)
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
}), new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"), function(self, _cmd, aPoint, anIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[anIndex], "frame"),
        startPosition = frame.origin[_originComponent] + frame.size[_sizeComponent],
        effectiveRect = objj_msgSend(self, "effectiveRectOfDividerAtIndex:", anIndex),
        additionalRect = null;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:")))
        effectiveRect = objj_msgSend(_delegate, "splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:", self, effectiveRect, effectiveRect, anIndex);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:")))
        additionalRect = objj_msgSend(_delegate, "splitView:additionalEffectiveRectOfDividerAtIndex:", self, anIndex);
    return CGRectContainsPoint(effectiveRect, aPoint) || (additionalRect && CGRectContainsPoint(additionalRect, aPoint));
}
}), new objj_method(sel_getUid("hitTest:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("trackDivider:"), function(self, _cmd, anEvent)
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
                    objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")) &&
                    objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:")))
                {
                    var minPosition = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", i),
                        maxPosition = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", i);
                    if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i]) && objj_msgSend(_delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, _subviews[i], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", _subviews[i]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", (minPosition + (maxPosition - minPosition) / 2), i);
                        else
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", minPosition, i);
                    }
                    else if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, _subviews[i+1]) && objj_msgSend(_delegate, "splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:", self, _subviews[i+1], i))
                    {
                        if (objj_msgSend(self, "isSubviewCollapsed:", _subviews[i+1]))
                            objj_msgSend(self, "setPosition:ofDividerAtIndex:", (minPosition + (maxPosition - minPosition) / 2), i);
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
        objj_msgSend(self, "setPosition:ofDividerAtIndex:", (point[_originComponent] + _initialOffset), _currentDivider);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackDivider:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "trackDivider:", anEvent);
}
}), new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"), function(self, _cmd, dividerIndex)
{ with(self)
{
    var frame = objj_msgSend(_subviews[dividerIndex + 1], "frame");
    if (dividerIndex + 1 < objj_msgSend(_subviews, "count") - 1)
        return frame.origin[_originComponent] + frame.size[_sizeComponent] - objj_msgSend(self, "dividerThickness");
    else
        return objj_msgSend(self, "frame").size[_sizeComponent] - objj_msgSend(self, "dividerThickness");
}
}), new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"), function(self, _cmd, dividerIndex)
{ with(self)
{
    if (dividerIndex > 0)
    {
        var frame = objj_msgSend(_subviews[dividerIndex - 1], "frame");
        return frame.origin[_originComponent] + frame.size[_sizeComponent] + objj_msgSend(self, "dividerThickness");
    }
    else
        return 0;
}
}), new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"), function(self, _cmd, position, dividerIndex)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:")))
        position = objj_msgSend(_delegate, "splitView:constrainSplitPosition:ofSubviewAt:", self, position, dividerIndex);
    var proposedMax = objj_msgSend(self, "maxPossiblePositionOfDividerAtIndex:", dividerIndex),
        proposedMin = objj_msgSend(self, "minPossiblePositionOfDividerAtIndex:", dividerIndex),
        actualMax = proposedMax,
        actualMin = proposedMin;
    if(objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:")))
        actualMin = objj_msgSend(_delegate, "splitView:constrainMinCoordinate:ofSubviewAt:", self, proposedMin, dividerIndex);
    if(objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:")))
        actualMax = objj_msgSend(_delegate, "splitView:constrainMaxCoordinate:ofSubviewAt:", self, proposedMax, dividerIndex);
    var frame = objj_msgSend(self, "frame"),
        viewA = _subviews[dividerIndex],
        frameA = objj_msgSend(viewA, "frame"),
        viewB = _subviews[dividerIndex + 1],
        frameB = objj_msgSend(viewB, "frame");
    var realPosition = MAX(MIN(position, actualMax), actualMin);
    if (position < proposedMin + (actualMin - proposedMin) / 2)
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:canCollapseSubview:")))
            if (objj_msgSend(_delegate, "splitView:canCollapseSubview:", self, viewA))
                realPosition = proposedMin;
    frameA.size[_sizeComponent] = realPosition - frameA.origin[_originComponent];
    objj_msgSend(_subviews[dividerIndex], "setFrame:", frameA);
    frameB.size[_sizeComponent] = frameB.origin[_originComponent] + frameB.size[_sizeComponent] - realPosition - objj_msgSend(self, "dividerThickness");
    frameB.origin[_originComponent] = realPosition + objj_msgSend(self, "dividerThickness");
    objj_msgSend(_subviews[dividerIndex + 1], "setFrame:", frameB);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "_adjustSubviewsWithCalculatedSize");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, oldSize)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitView:resizeSubviewsWithOldSize:")))
    {
        objj_msgSend(_delegate, "splitView:resizeSubviewsWithOldSize:", self, oldSize);
        return;
    }
    objj_msgSend(self, "_postNotificationWillResize");
    var index = 0,
        count = objj_msgSend(_subviews, "count"),
        bounds = objj_msgSend(self, "bounds"),
        dividerThickness = objj_msgSend(self, "dividerThickness"),
        totalDividers = count - 1,
        totalSizableSpace = 0,
        nonSizableSpace = 0,
        lastSizableIndex = -1,
        totalSizablePanes = 0,
        isVertical = objj_msgSend(self, "isVertical");
    for (index = 0; index < count; ++index)
    {
        var view = _subviews[index],
            isSizable = isVertical ? objj_msgSend(view, "autoresizingMask") & CPViewWidthSizable : objj_msgSend(view, "autoresizingMask") & CPViewHeightSizable;
        if (isSizable)
        {
            totalSizableSpace += objj_msgSend(view, "frame").size[_sizeComponent];
            lastSizableIndex = index;
            totalSizablePanes++;
        }
    }
    if (totalSizablePanes === count)
        totalSizableSpace = 0;
    var nonSizableSpace = totalSizableSpace ? bounds.size[_sizeComponent] - totalSizableSpace : 0,
        ratio = (bounds.size[_sizeComponent] - totalDividers*dividerThickness - nonSizableSpace) / (oldSize[_sizeComponent]- totalDividers*dividerThickness - nonSizableSpace),
        remainingFlexibleSpace = bounds.size[_sizeComponent] - oldSize[_sizeComponent];
    for (index = 0; index < count; ++index)
    {
        var view = _subviews[index],
            viewFrame = CGRectMakeCopy(bounds),
            isSizable = isVertical ? objj_msgSend(view, "autoresizingMask") & CPViewWidthSizable : objj_msgSend(view, "autoresizingMask") & CPViewHeightSizable;
            if (index + 1 == count)
                viewFrame.size[_sizeComponent] = bounds.size[_sizeComponent] - viewFrame.origin[_originComponent];
            else if (totalSizableSpace && isSizable && lastSizableIndex === index)
                viewFrame.size[_sizeComponent] = MAX(0, ROUND(objj_msgSend(view, "frame").size[_sizeComponent] + remainingFlexibleSpace))
            else if (isSizable || !totalSizableSpace)
            {
                viewFrame.size[_sizeComponent] = MAX(0, ROUND(ratio * objj_msgSend(view, "frame").size[_sizeComponent]));
                remainingFlexibleSpace -= (viewFrame.size[_sizeComponent] - objj_msgSend(view, "frame").size[_sizeComponent]);
            }
            else if (totalSizableSpace && !isSizable)
                viewFrame.size[_sizeComponent] = objj_msgSend(view, "frame").size[_sizeComponent];
            else
                alert("SHOULD NEVER GET HERE");
        bounds.origin[_originComponent] += viewFrame.size[_sizeComponent] + dividerThickness;
        objj_msgSend(view, "setFrame:", viewFrame);
    }
    objj_msgSend(self, "_postNotificationDidResize");
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, delegate)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", _delegate, CPSplitViewDidResizeSubviewsNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:")))
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", _delegate, CPSplitViewWillResizeSubviewsNotification, self);
   _delegate = delegate;
   if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewDidResizeSubviews:")))
       objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", _delegate, sel_getUid("splitViewDidResizeSubviews:"), CPSplitViewDidResizeSubviewsNotification, self);
   if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("splitViewWillResizeSubviews:")))
       objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", _delegate, sel_getUid("splitViewWillResizeSubviews:"), CPSplitViewWillResizeSubviewsNotification, self);
}
}), new objj_method(sel_getUid("_postNotificationWillResize"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPSplitViewWillResizeSubviewsNotification, self);
}
}), new objj_method(sel_getUid("_postNotificationDidResize"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPSplitViewDidResizeSubviewsNotification, self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPSplitView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPSplitViewHorizontalImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSplitView/CPSplitViewHorizontal.png"), CPSizeMake(5.0, 10.0));
    CPSplitViewVerticalImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPSplitView/CPSplitViewVertical.png"), CPSizeMake(10.0, 5.0));
}
})]);
}
var CPSplitViewDelegateKey = "CPSplitViewDelegateKey",
    CPSplitViewIsVerticalKey = "CPSplitViewIsVerticalKey",
    CPSplitViewIsPaneSplitterKey = "CPSplitViewIsPaneSplitterKey";
{
var the_class = objj_getClass("CPSplitView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSplitView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
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
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPSplitViewDelegateKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isVertical, CPSplitViewIsVerticalKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isPaneSplitter, CPSplitViewIsPaneSplitterKey);
}
})]);
}

p;17;CPStringDrawing.jI;21;Foundation/CPString.jc;729;
var CPStringReferenceElement = nil,
    CPStringDefaultFont = nil;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("cssString"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("sizeWithFont:"), function(self, _cmd, aFont)
{ with(self)
{
    return objj_msgSend(self, "sizeWithFont:inWidth:", aFont, NULL);
}
}), new objj_method(sel_getUid("sizeWithFont:inWidth:"), function(self, _cmd, aFont, aWidth)
{ with(self)
{
    return { width:0.0, height:0.0 };
}
})]);
}

p;15;CPTableColumn.jI;23;Foundation/Foundation.jc;9437;
CPTableColumnNoResizing = 0;
CPTableColumnAutoresizingMask = 1;
CPTableColumnUserResizingMask = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTableColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_headerView"), new objj_ivar("_tableView"), new objj_ivar("_width"), new objj_ivar("_minWidth"), new objj_ivar("_maxWidth"), new objj_ivar("_resizingMask"), new objj_ivar("_dataView"), new objj_ivar("_dataViewData"), new objj_ivar("_dataViewForView"), new objj_ivar("_purgableInfosForDataView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        objj_msgSend(self, "_init");
        _identifier = anIdentifier;
        _width = 40.0;
        _minWidth = 8.0;
        _maxWidth = 1000.0;
        var dataView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(dataView, "setValue:forThemedAttributeName:inControlState:", objj_msgSend(CPColor, "whiteColor"), "text-color", CPControlStateHighlighted);
        objj_msgSend(self, "setDataView:", dataView);
        _headerView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(_headerView, "setBackgroundColor:", objj_msgSend(CPColor, "greenColor"));
    }
    return self;
}
}), new objj_method(sel_getUid("_init"), function(self, _cmd)
{ with(self)
{
    _dataViewData = {};
    _dataViewForView = {};
    _purgableInfosForDataView = {};
}
}), new objj_method(sel_getUid("setIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
}), new objj_method(sel_getUid("identifier"), function(self, _cmd)
{ with(self)
{
    return _identifier;
}
}), new objj_method(sel_getUid("setTableView:"), function(self, _cmd, aTableView)
{ with(self)
{
    _tableView = aTableView;
}
}), new objj_method(sel_getUid("tableView"), function(self, _cmd)
{ with(self)
{
    return _tableView;
}
}), new objj_method(sel_getUid("setWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    _width = aWidth;
}
}), new objj_method(sel_getUid("width"), function(self, _cmd)
{ with(self)
{
    return _width;
}
}), new objj_method(sel_getUid("setMinWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    if (_width < (_minWidth = aWidth))
        objj_msgSend(self, "setWidth:", _minWidth);
}
}), new objj_method(sel_getUid("minWidth"), function(self, _cmd)
{ with(self)
{
    return _minWidth;
}
}), new objj_method(sel_getUid("setMaxWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    if (_width > (_maxmimumWidth = aWidth))
        objj_msgSend(self, "setWidth:", _maxWidth);
}
}), new objj_method(sel_getUid("setResizingMask:"), function(self, _cmd, aMask)
{ with(self)
{
    _resizingMask = aMask;
}
}), new objj_method(sel_getUid("resizingMask"), function(self, _cmd)
{ with(self)
{
    return _resizingMask;
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    var width = CPRectGetWidth(objj_msgSend(_headerView, "frame"));
    if (width < _minWidth)
        objj_msgSend(self, "setMinWidth:", width);
    else if (width > _maxWidth)
        objj_msgSend(self, "setMaxWidth:", width)
    if (_width != width)
        objj_msgSend(self, "setWidth:", width);
}
}), new objj_method(sel_getUid("setEditable:"), function(self, _cmd, aFlag)
{ with(self)
{
    _isEditable = aFlag;
}
}), new objj_method(sel_getUid("isEditable"), function(self, _cmd)
{ with(self)
{
    return _isEditable;
}
}), new objj_method(sel_getUid("setHeaderView:"), function(self, _cmd, aView)
{ with(self)
{
    _headerView = aView;
}
}), new objj_method(sel_getUid("headerView"), function(self, _cmd)
{ with(self)
{
    return _headerView;
}
}), new objj_method(sel_getUid("setDataCell:"), function(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(self, "setDataView:", aView);
}
}), new objj_method(sel_getUid("setDataView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_dataView)
        _dataViewData[objj_msgSend(_dataView, "hash")] = nil;
    _dataView = aView;
    _dataViewData[objj_msgSend(aView, "hash")] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aView);
}
}), new objj_method(sel_getUid("dataCell"), function(self, _cmd)
{ with(self)
{
    return _dataView;
}
}), new objj_method(sel_getUid("dataView"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "dataCell");
}
}), new objj_method(sel_getUid("dataCellForRow:"), function(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataView");
}
}), new objj_method(sel_getUid("dataViewForRow:"), function(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataCellForRow:", aRowIndex);
}
}), new objj_method(sel_getUid("_markView:inRow:asPurgable:"), function(self, _cmd, aView, aRow, isPurgable)
{ with(self)
{
    var viewHash = objj_msgSend(aView, "hash"),
        dataViewHash = objj_msgSend(_dataViewForView[viewHash], "hash");
    if (!_purgableInfosForDataView[dataViewHash])
    {
        if (!isPurgable)
            return;
        _purgableInfosForDataView[dataViewHash] = {};
    }
    if (!isPurgable) {
        if (_purgableInfosForDataView[dataViewHash][viewHash])
            CPLog.warn("removing unpurgable " + _purgableInfosForDataView[dataViewHash][viewHash]);
        delete _purgableInfosForDataView[dataViewHash][viewHash];
    }
    else
        _purgableInfosForDataView[dataViewHash][viewHash] = { view:(aView), row:(aRow) };
}
}), new objj_method(sel_getUid("_newDataViewForRow:avoidingRows:"), function(self, _cmd, aRowIndex, rows)
{ with(self)
{
    var view = objj_msgSend(self, "dataViewForRow:", aRowIndex),
        viewHash = objj_msgSend(view, "hash"),
        purgableInfos = _purgableInfosForDataView[viewHash];
    if (purgableInfos)
    {
        for (var key in purgableInfos)
        {
            var info = purgableInfos[key];
                delete purgableInfos[key];
                return ((info).view);
        }
    }
    if (!_dataViewData[viewHash])
        _dataViewData[viewHash] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", view);
    var newView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _dataViewData[viewHash]);
    _dataViewForView[objj_msgSend(newView, "hash")] = view;
    CPLog.warn("creating cell: %s", newView);
    return newView;
}
}), new objj_method(sel_getUid("_purge"), function(self, _cmd)
{ with(self)
{
    for (var viewHash in _purgableInfosForDataView)
    {
        var purgableInfos = _purgableInfosForDataView[viewHash];
        for (var key in purgableInfos)
        {
            var view = ((purgableInfos[key]).view);
            if (!view)
                CPLog.info("key="+key+" view=" + view + " purgableInfos[key]="+purgableInfos[key])
            else if (view._superview) {
                objj_msgSend(view, "setHidden:", YES);
            }
        }
    }
}
})]);
}
var CPTableColumnIdentifierKey = "CPTableColumnIdentifierKey",
    CPTableColumnHeaderViewKey = "CPTableColumnHeaderViewKey",
    CPTableColumnDataViewKey = "CPTableColumnDataViewKey",
    CPTableColumnWidthKey = "CPTableColumnWidthKey",
    CPTableColumnMinWidthKey = "CPTableColumnMinWidthKey",
    CPTableColumnMaxWidthKey = "CPTableColumnMaxWidthKey",
    CPTableColumnResizingMaskKey = "CPTableColumnResizingMaskKey";
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableColumn\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(self, "_init");
    _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnIdentifierKey);
    objj_msgSend(self, "setHeaderView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnHeaderViewKey));
    objj_msgSend(self, "setDataView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnDataViewKey));
    _width = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnWidthKey);
    _minWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMinWidthKey);
    _maxWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMaxWidthKey);
    _resizingMask = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableColumnResizingMaskKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTableColumnIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _headerView, CPTableColumnHeaderViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _dataView, CPTableColumnDataViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _width, CPTableColumnWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _minWidth, CPTableColumnMinWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _maxWidth, CPTableColumnMaxWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _resizingMask, CPTableColumnResizingMaskKey);
}
})]);
}

p;13;CPTableView.ji;11;CPControl.ji;15;CPTableColumn.ji;9;CPColor.ji;13;CPTextField.jc;38378;
CPTableViewColumnDidMoveNotification = "CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification = "CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification = "CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification = "CPTableViewSelectionIsChangingNotification";
var _CPTableViewWillDisplayCellSelector = 1 << 0,
    _CPTableViewShouldSelectRowSelector = 1 << 1,
    _CPTableViewShouldSelectTableColumnSelector = 1 << 2,
    _CPTableViewSelectionShouldChangeSelector = 1 << 3,
    _CPTableViewShouldEditTableColumnSelector = 1 << 4,
    _CPTableViewSelectionIndexesForProposedSelectionSelector = 1 << 5,
    _CPTableViewHeightOfRowSelector = 1 << 6;
{var the_class = objj_allocateClassPair(CPControl, "CPTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_delegate"), new objj_ivar("_tableColumns"), new objj_ivar("_selectedRowIndexes"), new objj_ivar("_rowHeight"), new objj_ivar("_intercellSpacing"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_delegateSelectorsCache"), new objj_ivar("_numberOfRows"), new objj_ivar("_hasVariableHeightRows"), new objj_ivar("_columnHeight"), new objj_ivar("_rowHeights"), new objj_ivar("_rowMinYs"), new objj_ivar("_tableCells"), new objj_ivar("_tableColumnViews"), new objj_ivar("_dataViewCache"), new objj_ivar("_objectValueCache"), new objj_ivar("_visibleRows"), new objj_ivar("_visibleColumns"), new objj_ivar("_populatedRows"), new objj_ivar("_populatedColumns"), new objj_ivar("_previousSelectedRowIndexes"), new objj_ivar("_selectionStartRow"), new objj_ivar("_selectionModifier"), new objj_ivar("_currentlySelected"), new objj_ivar("_selectionViews"), new objj_ivar("_selectionViewsPool"), new objj_ivar("_scrollTimer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "_init");
    }
    return self;
}
}), new objj_method(sel_getUid("_init"), function(self, _cmd)
{ with(self)
{
    _tableColumns = [];
    _selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    _rowHeight = 17.0;
    _intercellSpacing = CPSizeMake(3.0, 2.0);
    _allowsMultipleSelection = YES;
    _allowsEmptySelection = YES;
    _tableCells = [];
    _tableColumnViews = [];
    _dataViewCache = {};
    _objectValueCache = [];
    _visibleRows = CPMakeRange(0, 0);
    _visibleColumns = CPMakeRange(0, 0);
    _rowHeights = [];
    _rowMinYs = [];
}
}), new objj_method(sel_getUid("_columnHeight"), function(self, _cmd)
{ with(self)
{
    return _columnHeight;
}
}), new objj_method(sel_getUid("newCellForRow:column:avoidingRows:"), function(self, _cmd, aRowIndex, aColumnIndex, rows)
{ with(self)
{
    var dataView = objj_msgSend(_tableColumns[aColumnIndex], "_newDataViewForRow:avoidingRows:", aRowIndex, rows);
    objj_msgSend(dataView, "setFrame:", CGRectMake(0.0, (_hasVariableHeightRows ? _rowMinYs[aRowIndex] : (aRowIndex * (_rowHeight + _intercellSpacing.height))), objj_msgSend(_tableColumns[aColumnIndex], "width"), (_hasVariableHeightRows ? _rowHeights[aRowIndex] : _rowHeight)));
    if (objj_msgSend(dataView, "respondsToSelector:", sel_getUid("highlight:")))
        objj_msgSend(dataView, "highlight:", objj_msgSend(_selectedRowIndexes, "containsIndex:", aRowIndex));
    if (!_objectValueCache[aColumnIndex])
        _objectValueCache[aColumnIndex] = [];
    if (_objectValueCache[aColumnIndex][aRowIndex] === undefined)
        _objectValueCache[aColumnIndex][aRowIndex] = objj_msgSend(_dataSource, "tableView:objectValueForTableColumn:row:", self, _tableColumns[aColumnIndex], aRowIndex);
    objj_msgSend(dataView, "setObjectValue:", _objectValueCache[aColumnIndex][aRowIndex]);
    return dataView;
}
}), new objj_method(sel_getUid("clearCells"), function(self, _cmd)
{ with(self)
{
    var columnEnd = CPMaxRange(_visibleColumns),
        rowEnd = CPMaxRange(_visibleRows);
    for (var column = _visibleColumns.location; column < columnEnd; column++)
    {
        var tableColumn = _tableColumns[column],
            tableColumnCells = _tableCells[column];
        for (var row = _visibleRows.location; row < rowEnd; row++)
        {
            var cell = tableColumnCells[row];
            if (cell)
            {
                tableColumnCells[row] = nil;
                objj_msgSend(tableColumn, "_markView:inRow:asPurgable:", cell, row, YES);
            }
            else
            {
                CPLog.warn("Missing cell? " + row + "," + column);
            }
        }
    }
    _visibleColumns = CPMakeRange(0,0);
    _visibleRows = CPMakeRange(0,0);
}
}), new objj_method(sel_getUid("loadTableCellsInRect:"), function(self, _cmd, aRect)
{ with(self)
{
   if (!_dataSource)
        return;
    var rowStart = MAX(0, objj_msgSend(self, "_rowAtY:", CGRectGetMinY(aRect)) - 1),
        rowEnd = MIN(_numberOfRows, objj_msgSend(self, "_rowAtY:", CGRectGetMaxY(aRect)) + 1),
        visibleRows = CPMakeRange(rowStart, rowEnd - rowStart),
        columnStart = MAX(0, objj_msgSend(self, "_columnAtX:", CGRectGetMinX(aRect))),
        columnEnd = MIN(_tableColumns.length, objj_msgSend(self, "_columnAtX:", CGRectGetMaxX(aRect)) + 1),
        visibleColumns = CPMakeRange(columnStart, columnEnd - columnStart);
    if (CPEqualRanges(_visibleRows, visibleRows) && CPEqualRanges(_visibleColumns, visibleColumns))
        return;
    var unionVisibleRows = CPUnionRange(_visibleRows, visibleRows),
        unionVisibleColumns = CPUnionRange(_visibleColumns, visibleColumns);
    if (unionVisibleRows.length * unionVisibleColumns.length <=
        (_visibleRows.length * _visibleColumns.length) + (visibleRows.length * visibleColumns.length))
    {
        var cEnd = CPMaxRange(unionVisibleColumns),
            rEnd = CPMaxRange(unionVisibleRows),
            cell;
        for (var column = unionVisibleColumns.location; column < cEnd; ++column)
        {
            var tableColumn = _tableColumns[column],
                tableColumnCells = _tableCells[column],
                columnIsVisible = CPLocationInRange(column, visibleColumns),
                newCells = [];
            for (var row = unionVisibleRows.location; row < rEnd; ++row)
            {
                if (cell = tableColumnCells[row])
                {
                    if (!columnIsVisible || !CPLocationInRange(row, visibleRows))
                    {
                        tableColumnCells[row] = nil;
                        objj_msgSend(tableColumn, "_markView:inRow:asPurgable:", cell, row, YES);
                    }
                }
                else
                {
                    newCells.push(row);
                }
            }
            while (newCells.length > 0)
            {
                var row = newCells.pop();
                tableColumnCells[row] = objj_msgSend(self, "newCellForRow:column:avoidingRows:", row, column, visibleRows);
                if (!tableColumnCells[row]._superview)
                    objj_msgSend(_tableColumnViews[column], "addSubview:", tableColumnCells[row]);
                else if (tableColumnCells[row]._isHidden)
                    objj_msgSend(tableColumnCells[row], "setHidden:", NO);
            }
            objj_msgSend(tableColumn, "_purge");
        }
    }
    else {
        var cEnd = CPMaxRange(_visibleColumns),
            rEnd = CPMaxRange(_visibleRows),
            cell;
        for (var column = _visibleColumns.location; column < cEnd; ++column)
        {
            var tableColumn = _tableColumns[column],
                tableColumnCells = _tableCells[column],
                columnIsVisible = CPLocationInRange(column, visibleColumns);
            for (var row = _visibleRows.location; row < rEnd; ++row)
            {
                if (cell = tableColumnCells[row])
                {
                    if (!columnIsVisible || !CPLocationInRange(row, visibleRows))
                    {
                        tableColumnCells[row] = nil;
                        objj_msgSend(tableColumn, "_markView:inRow:asPurgable:", cell, row, YES);
                    }
                }
            }
        }
        var cEnd = CPMaxRange(visibleColumns),
            rEnd = CPMaxRange(visibleRows);
        for (var column = visibleColumns.location; column < cEnd; ++column)
        {
            var tableColumn = _tableColumns[column],
                tableColumnCells = _tableCells[column];
            for (var row = visibleRows.location; row < rEnd; ++row)
            {
                tableColumnCells[row] = objj_msgSend(self, "newCellForRow:column:avoidingRows:", row, column, visibleRows);
                if (!tableColumnCells[row]._superview)
                    objj_msgSend(_tableColumnViews[column], "addSubview:", tableColumnCells[row]);
                else if (tableColumnCells[row]._isHidden)
                    objj_msgSend(tableColumnCells[row], "setHidden:", NO);
            }
            objj_msgSend(tableColumn, "_purge");
        }
    }
    _visibleRows = visibleRows;
    _visibleColumns = visibleColumns;
}
}), new objj_method(sel_getUid("setIntercellSpacing:"), function(self, _cmd, aSize)
{ with(self)
{
    if (_intercellSpacing.width != aSize.width)
    {
        var i = 1,
            delta = aSize.width - _intercellSpacing.width;
            total = delta;
        for (; i < _tableColumns.length; ++i, total += delta)
        {
            var origin = objj_msgSend(_tableColumnViews[i], "frame").origin;
            objj_msgSend(_tableColumnViews[i], "setFrameOrigin:", CGPointMake(origin.x + total, origin.y));
        }
    }
    if (_intercellSpacing.height != aSize.height)
    {
        var i = 0;
        for (; i < _tableColumns.length; ++i, total += delta)
        {
            objj_msgSend(_tableColumnViews[i], "setFrameSize:", CGSizeMake(objj_msgSend(_tableColumnViews[i], "width"), _numberOfRows * (_rowHeight + _intercellSpacing.height)));
            var j = 1,
                y = _rowHeight + _intercellSpacing.height;
            for (; j < _numberOfRows; ++i, y += _rowHeight + _intercellSpacing.height)
            {
                if (!_tableCells[i][j])
                    continue;
                objj_msgSend(_tableCells[i][j], "setFrameOrigin:", CPPointMake(0.0, y));
            }
        }
    }
    _intercellSpacing = CPSizeCreateCopy(aSize);
}
}), new objj_method(sel_getUid("intercellSpacing"), function(self, _cmd)
{ with(self)
{
    return _intercellSpacing;
}
}), new objj_method(sel_getUid("setRowHeight:"), function(self, _cmd, aRowHeight)
{ with(self)
{
    if (_rowHeight == aRowHeight)
        return;
    _rowHeight = aRowHeight;
    if (_hasVariableHeightRows)
        return;
    for (var row = 0; row < _numberOfRows; ++row)
        for (var column = 0; column < _tableColumns.length; ++column)
            objj_msgSend(_tableCells[column][row], "setFrameOrigin:", CPPointMake(0.0, row * (_rowHeight + _intercellSpacing.height)));
}
}), new objj_method(sel_getUid("rowHeight"), function(self, _cmd)
{ with(self)
{
    return _rowHeight;
}
}), new objj_method(sel_getUid("addTableColumn:"), function(self, _cmd, aTableColumn)
{ with(self)
{
    var i = 0,
        x = _tableColumns.length ? CPRectGetMaxX(objj_msgSend(self, "rectOfColumn:", _tableColumns.length - 1)) + _intercellSpacing.width : 0.0,
        tableColumnView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(x, 0.0, objj_msgSend(aTableColumn, "width"), objj_msgSend(self, "_columnHeight"))),
        tableColumnCells = [];
    objj_msgSend(_tableColumns, "addObject:", aTableColumn);
    objj_msgSend(_tableColumnViews, "addObject:", tableColumnView);
    objj_msgSend(self, "addSubview:", tableColumnView);
    objj_msgSend(_tableCells, "addObject:", tableColumnCells);
    for (; i < _numberOfRows; ++i)
        _tableCells[_tableColumns.length-1][i] = nil;
}
}), new objj_method(sel_getUid("removeTableColumn:"), function(self, _cmd, aTableColumn)
{ with(self)
{
    var frame = objj_msgSend(self, "frame"),
        width = objj_msgSend(aTableColumn, "width") + _intercellSpacing.width,
        index = objj_msgSend(_tableColumns, "indexOfObjectIdenticalTo:", aTableColumn);
    objj_msgSend(_tableColumnViews[i], "removeFromSuperview");
    objj_msgSend(_tableCells, "removeObjectAtIndex:", index);
    objj_msgSend(_tableColumns, "removeObjectAtIndex:", index);
    objj_msgSend(_tabelColumnViews, "removeObjectAtIndex:", index);
    for (; index < _tableColumns.length; ++ index)
        objj_msgSend(_tableColumnViews[index], "setFrameOrigin:", CPPointMake(CPRectGetMinX(objj_msgSend(_tableColumnViews[index], "frame")) - width, 0.0))
    objj_msgSend(self, "setFrameSize:", CPSizeMake(CPRectGetWidth(frame) - width, CPRectGetHeight(frame)));
}
}), new objj_method(sel_getUid("moveColumn:toColumn:"), function(self, _cmd, fromIndex, toIndex)
{ with(self)
{
    if (fromIndex == toIndex)
        return;
}
}), new objj_method(sel_getUid("tableColumns"), function(self, _cmd)
{ with(self)
{
    return _tableColumns;
}
}), new objj_method(sel_getUid("tableColumnWithIdentifier:"), function(self, _cmd, anObject)
{ with(self)
{
    for (var i = 0; i < _tableColumns.length; i++)
        if (objj_msgSend(_tableColumns[i], "isEqual:", anObject))
            return _tableColumns[i];
    return nil;
}
}), new objj_method(sel_getUid("numberOfColumns"), function(self, _cmd)
{ with(self)
{
    return _tableColumns.length;
}
}), new objj_method(sel_getUid("numberOfRows"), function(self, _cmd)
{ with(self)
{
    return _numberOfRows;
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    var HEIGHT = 10.0;
}
}), new objj_method(sel_getUid("setDataSource:"), function(self, _cmd, aDataSource)
{ with(self)
{
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("numberOfRowsInTableView:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source doesn't support 'numberOfRowsInTableView:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("tableView:objectValueForTableColumn:row:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source doesn't support 'tableView:objectValueForTableColumn:row:'");
    _dataSource = aDataSource;
    objj_msgSend(self, "reloadData");
}
}), new objj_method(sel_getUid("dataSource"), function(self, _cmd)
{ with(self)
{
    return _dataSource;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate === aDelegate)
        return;
    var notificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionIsChangingNotification, self);
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidResize:"), CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, self);
    _delegateSelectorsCache = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:willDisplayCell:forTableColumn:row:")))
        _delegateSelectorsCache |= _CPTableViewWillDisplayCellSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectRow:")))
        _delegateSelectorsCache |= _CPTableViewShouldSelectRowSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectTableColumn:")))
        _delegateSelectorsCache |= _CPTableViewShouldSelectTableColumnSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("selectionShouldChangeInTableView:")))
        _delegateSelectorsCache |= _CPTableViewSelectionShouldChangeSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldEditTableColumn:row:")))
        _delegateSelectorsCache |= _CPTableViewShouldEditTableColumnSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:selectionIndexesForProposedSelection:")))
        _delegateSelectorsCache |= _CPTableViewSelectionIndexesForProposedSelectionSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:heightOfRow:")))
    {
        _delegateSelectorsCache |= _CPTableViewHeightOfRowSelector;
        _hasVariableHeightRows = YES;
    }
    else
        _hasVariableHeightRows = NO;
}
}), new objj_method(sel_getUid("noteNumberOfRowsChanged"), function(self, _cmd)
{ with(self)
{
    var numberOfRows = objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
    if (_numberOfRows != numberOfRows)
    {
        _numberOfRows = numberOfRows;
        objj_msgSend(self, "_recalculateColumnHeight");
    }
}
}), new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"), function(self, _cmd, indexSet)
{ with(self)
{
    objj_msgSend(self, "_recalculateColumnHeight");
}
}), new objj_method(sel_getUid("rectOfRow:"), function(self, _cmd, aRowIndex)
{ with(self)
{
    return CPRectMake(0.0, (_hasVariableHeightRows ? _rowMinYs[aRowIndex] : (aRowIndex * (_rowHeight + _intercellSpacing.height))), CPRectGetWidth(objj_msgSend(self, "bounds")), (_hasVariableHeightRows ? _rowHeights[aRowIndex] : _rowHeight));
}
}), new objj_method(sel_getUid("rectOfColumn:"), function(self, _cmd, aColumnIndex)
{ with(self)
{
    return objj_msgSend(_tableColumnViews[aColumnIndex], "frame");
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("_recalculateColumnHeight"), function(self, _cmd)
{ with(self)
{
    var oldColumnHeight = _columnHeight;
    if (_hasVariableHeightRows)
    {
        _rowMinYs[0] = 0;
        for (var row = 0; row < _numberOfRows; row++)
        {
            _rowHeights[row] = objj_msgSend(_delegate, "tableView:heightOfRow:", self, row);
            _rowMinYs[row+1] = _rowMinYs[row] + _rowHeights[row] + _intercellSpacing.height;
        }
        _columnHeight = _rowMinYs[_numberOfRows];
    }
    else
        _columnHeight = _numberOfRows * (_rowHeight + _intercellSpacing.height);
    var count = _tableColumnViews.length;
    while (count--)
        objj_msgSend(_tableColumnViews[count], "setFrameSize:", CGSizeMake(objj_msgSend(_tableColumns[count], "width"), _columnHeight));
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), _columnHeight));
}
}), new objj_method(sel_getUid("visibleRectInParent"), function(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview)
        return objj_msgSend(self, "bounds");
    return objj_msgSend(self, "convertRect:fromView:", CGRectIntersection(objj_msgSend(superview, "bounds"), objj_msgSend(self, "frame")), superview);
}
}), new objj_method(sel_getUid("reloadData"), function(self, _cmd)
{ with(self)
{
    var oldNumberOfRows = _numberOfRows;
    _numberOfRows = objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
    if (oldNumberOfRows != _numberOfRows)
    {
        objj_msgSend(self, "_recalculateColumnHeight");
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), objj_msgSend(self, "_columnHeight")));
    }
    _objectValueCache = [];
    objj_msgSend(self, "clearCells");
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "loadTableCellsInRect:", objj_msgSend(self, "visibleRectInParent"));
}
}), new objj_method(sel_getUid("displaySoon"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_scrollTimer, "invalidate");
    _scrollTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.05, self, sel_getUid("displayNow"), nil, NO);
}
}), new objj_method(sel_getUid("displayNow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("viewDidMoveToSuperview"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "enclosingScrollView"), "contentView"), "setPostsBoundsChangedNotifications:", YES);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("viewBoundsChanged:"), CPViewBoundsDidChangeNotification, objj_msgSend(objj_msgSend(self, "enclosingScrollView"), "contentView"));
}
}), new objj_method(sel_getUid("viewBoundsChanged:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "displayNow");
}
}), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function(self, _cmd, allowsMultipleSelection)
{ with(self)
{
    if (_allowsMultipleSelection === allowsMultipleSelection)
        return;
    _allowsMultipleSelection = allowsMultipleSelection;
}
}), new objj_method(sel_getUid("allowsMultipleSelection"), function(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
}), new objj_method(sel_getUid("setAllowsEmptySelection:"), function(self, _cmd, allowsEmptySelection)
{ with(self)
{
    if (_allowsEmptySelection === allowsEmptySelection)
        return;
    _allowsEmptySelection = allowsEmptySelection;
}
}), new objj_method(sel_getUid("allowsEmptySelection"), function(self, _cmd)
{ with(self)
{
    return _allowsEmptySelection;
}
}), new objj_method(sel_getUid("rowAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var index = objj_msgSend(self, "_rowAtY:", aPoint.y)
    if (index >= 0 && index < _numberOfRows)
        return index;
    else
        return CPNotFound;
}
}), new objj_method(sel_getUid("columnAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var index = objj_msgSend(self, "_columnAtX:", aPoint.x)
    if (index >= 0 && index < _tableColumns.length)
        return index;
    else
        return CPNotFound;
}
}), new objj_method(sel_getUid("_rowAtY:"), function(self, _cmd, y)
{ with(self)
{
    if (_hasVariableHeightRows)
    {
        var a = 0,
            b = _numberOfRows;
        if (y < _rowMinYs[0])
            return -1;
        if (y >= _rowMinYs[_rowMinYs.length-1])
            return _numberOfRows;
        while (true)
        {
            var half = a + Math.floor((b - a) / 2);
            if (y < _rowMinYs[half])
                b = half;
            else if (half < _numberOfRows-1 && y >= _rowMinYs[half+1])
                a = half;
            else
                return half;
        }
    }
    else
        return FLOOR(y / (_rowHeight + _intercellSpacing.height));
}
}), new objj_method(sel_getUid("_columnAtX:"), function(self, _cmd, x)
{ with(self)
{
    var a = 0,
        b = _tableColumns.length;
    var last = objj_msgSend(_tableColumnViews[_tableColumns.length-1], "frame");
    if (x < objj_msgSend(_tableColumnViews[0], "frame").origin.x)
        return -1;
    if (x >= last.origin.x + last.size.width)
        return _tableColumns.length;
    while (true)
    {
        var half = a + Math.floor((b - a) / 2);
        if (x < objj_msgSend(_tableColumnViews[half], "frame").origin.x)
            b = half;
        else if (half < _tableColumns.length-1 && x >= objj_msgSend(_tableColumnViews[half+1], "frame").origin.x)
            a = half;
        else
            return half;
    }
}
}), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function(self, _cmd, indexes, extend)
{ with(self)
{
    if (extend)
        _selectedRowIndexes = objj_msgSend(objj_msgSend(_selectedRowIndexes, "copy"), "addIndexes:", indexes);
    else if (objj_msgSend(indexes, "count") > 0 || _allowsEmptySelection)
        _selectedRowIndexes = objj_msgSend(indexes, "copy");
    objj_msgSend(self, "_drawSelection");
}
}), new objj_method(sel_getUid("selectedRowIndexes"), function(self, _cmd)
{ with(self)
{
    return _selectedRowIndexes;
}
}), new objj_method(sel_getUid("numberOfSelectedRows"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectedRowIndexes, "count");
}
}), new objj_method(sel_getUid("deselectAll:"), function(self, _cmd, sender)
{ with(self)
{
    if (!_allowsEmptySelection || objj_msgSend(_selectedRowIndexes, "count") === 0 ||
            ((_delegateSelectorsCache & _CPTableViewSelectionShouldChangeSelector) && !objj_msgSend(_delegate, "selectionShouldChangeInTableView:", self)))
        return;
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSet"), NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil);
}
}), new objj_method(sel_getUid("editColumn:row:withEvent:select:"), function(self, _cmd, columnIndex, rowIndex, theEvent, flag)
{ with(self)
{
}
}), new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"), function(self, _cmd, aRow)
{ with(self)
{
    var newSelection;
    if (_allowsMultipleSelection)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(MIN(aRow, _selectionStartRow), ABS(aRow-_selectionStartRow)+1));
    else if (aRow >= 0 && aRow < _numberOfRows)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndex:", aRow);
    else
        newSelection = objj_msgSend(CPIndexSet, "indexSet");
    if (_allowsMultipleSelection && _selectionModifier & (CPCommandKeyMask | CPControlKeyMask | CPAlternateKeyMask))
    {
        var intersection = objj_msgSend(newSelection, "copy"),
            difference = objj_msgSend(newSelection, "copy");
        objj_msgSend(difference, "removeIndexes:", _previousSelectedRowIndexes);
        objj_msgSend(intersection, "removeIndexes:", difference)
        objj_msgSend(newSelection, "addIndexes:", _previousSelectedRowIndexes);
        objj_msgSend(newSelection, "removeIndexes:", intersection);
    }
    if (!objj_msgSend(newSelection, "isEqualToIndexSet:", _selectedRowIndexes))
    {
        if ((_delegateSelectorsCache & _CPTableViewSelectionShouldChangeSelector) && !objj_msgSend(_delegate, "selectionShouldChangeInTableView:", self))
            return;
        if (_delegateSelectorsCache & _CPTableViewSelectionIndexesForProposedSelectionSelector)
            newSelection = objj_msgSend(_delegate, "tableView:selectionIndexesForProposedSelection:", self, newSelection);
        else if (_delegateSelectorsCache & _CPTableViewShouldSelectRowSelector)
        {
            var indexes = [];
            objj_msgSend(newSelection, "getIndexes:maxCount:inIndexRange:", indexes, Number.MAX_VALUE, nil);
            for (var i = 0; i < indexes.length; i++)
                if (!objj_msgSend(_delegate, "tableView:shouldSelectRow:", self, indexes[i]))
                    objj_msgSend(newSelection, "removeIndex:", indexes[i]);
        }
    }
    if (!_allowsEmptySelection && objj_msgSend(newSelection, "count") === 0)
        return;
    if (!objj_msgSend(newSelection, "isEqualToIndexSet:", _selectedRowIndexes))
    {
        objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", newSelection, NO);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionIsChangingNotification, self, nil);
    }
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "trackSelection:", anEvent);
}
}), new objj_method(sel_getUid("setDoubleAction:"), function(self, _cmd, aSelector)
{ with(self)
{
    _doubleAction = aSelector;
}
}), new objj_method(sel_getUid("doubleAction"), function(self, _cmd)
{ with(self)
{
    return _doubleAction;
}
}), new objj_method(sel_getUid("clickedColumn"), function(self, _cmd)
{ with(self)
{
    return _clickedColumn;
}
}), new objj_method(sel_getUid("clickedRow"), function(self, _cmd)
{ with(self)
{
    return _clickedRow;
}
}), new objj_method(sel_getUid("trackSelection:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        currentRow = MAX(0, MIN(_numberOfRows-1, objj_msgSend(self, "_rowAtY:", point.y)));
    if (type == CPLeftMouseUp)
    {
        _clickedRow = objj_msgSend(self, "rowAtPoint:", point);
        _clickedColumn = objj_msgSend(self, "columnAtPoint:", point);
        if (objj_msgSend(anEvent, "clickCount") === 2)
        {
            CPLog.warn("edit?!");
            objj_msgSend(self, "sendAction:to:", _doubleAction, _target);
        }
        else
        {
            if (!objj_msgSend(_previousSelectedRowIndexes, "isEqualToIndexSet:", _selectedRowIndexes))
            {
                objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil);
            }
            objj_msgSend(self, "sendAction:to:", _action, _target);
        }
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _previousSelectedRowIndexes = _selectedRowIndexes;
        _selectionModifier = objj_msgSend(anEvent, "modifierFlags");
        if (_selectionModifier & CPShiftKeyMask)
            _selectionStartRow = (ABS(objj_msgSend(_previousSelectedRowIndexes, "firstIndex") - currentRow) < ABS(objj_msgSend(_previousSelectedRowIndexes, "lastIndex") - currentRow)) ?
                objj_msgSend(_previousSelectedRowIndexes, "firstIndex") : objj_msgSend(_previousSelectedRowIndexes, "lastIndex");
        else
            _selectionStartRow = currentRow;
        objj_msgSend(self, "_updateSelectionWithMouseAtRow:", currentRow);
    }
    else if (type == CPLeftMouseDragged)
    {
        objj_msgSend(self, "_updateSelectionWithMouseAtRow:", currentRow);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSelection:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("_drawSelection"), function(self, _cmd)
{ with(self)
{
    if (!_currentlySelected) {
        _currentlySelected = objj_msgSend(CPIndexSet, "indexSet");
        _selectionViews = [];
        _selectionViewsPool = [];
    }
    var removeSet = objj_msgSend(_currentlySelected, "copy"),
        indexesToRemove = [];
    objj_msgSend(removeSet, "removeIndexes:", _selectedRowIndexes);
    objj_msgSend(removeSet, "getIndexes:maxCount:inIndexRange:", indexesToRemove, Number.MAX_VALUE, nil);
    var addSet = objj_msgSend(_selectedRowIndexes, "copy"),
        indexesToAdd = [];
    objj_msgSend(addSet, "removeIndexes:", _currentlySelected);
    objj_msgSend(addSet, "getIndexes:maxCount:inIndexRange:", indexesToAdd, Number.MAX_VALUE, nil);
    for (var i = 0; i < indexesToRemove.length; i++)
    {
        var row = indexesToRemove[i];
        for (var column = 0; column < _tableColumns.length; column++)
            if (objj_msgSend(_tableCells[column][row], "respondsToSelector:", sel_getUid("highlight:")))
                objj_msgSend(_tableCells[column][row], "highlight:", NO);
    }
    for (var i = 0; i < indexesToAdd.length; i++)
    {
        var row = indexesToAdd[i];
        for (var column = 0; column < _tableColumns.length; column++)
            if (objj_msgSend(_tableCells[column][row], "respondsToSelector:", sel_getUid("highlight:")))
                objj_msgSend(_tableCells[column][row], "highlight:", YES);
    }
    for (var i = 0; i < indexesToAdd.length; i++)
    {
        var index = indexesToAdd[i],
            view;
        if (indexesToRemove.length > 0)
        {
            view = _selectionViews[indexesToRemove.pop()];
        }
        else if (_selectionViewsPool.length > 0)
        {
            view = _selectionViewsPool.pop();
            objj_msgSend(self, "addSubview:positioned:relativeTo:", view, CPWindowBelow, nil);
        }
        else
        {
            view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
            objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "alternateSelectedControlColor"));
            objj_msgSend(self, "addSubview:positioned:relativeTo:", view, CPWindowBelow, nil);
        }
        _selectionViews[index] = view;
        var frame = objj_msgSend(self, "rectOfRow:", index);
        frame.size.height += _intercellSpacing.height - 1;
        objj_msgSend(view, "setFrame:", frame);
    }
    for (var i = 0; i < indexesToRemove.length; i++)
    {
        var row = indexesToRemove[i],
            view = _selectionViews[row];
        objj_msgSend(view, "removeFromSuperview");
        _selectionViewsPool.push(view);
    }
    _currentlySelected = objj_msgSend(_selectedRowIndexes, "copy");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
}
})]);
}
var CPTableViewDataSourceKey = "CPTableViewDataSourceKey",
    CPTableViewDelegateKey = "CPTableViewDelegateKey",
    CPTableViewHeaderViewKey = "CPTableViewHeaderViewKey",
    CPTableViewTableColumnsKey = "CPTableViewTableColumnsKey",
    CPTableViewRowHeightKey = "CPTableViewRowHeightKey",
    CPTableViewIntercellSpacingKey = "CPTableViewIntercellSpacingKey",
    CPTableViewMultipleSelectionKey = "CPTableViewMultipleSelectionKey",
    CPTableViewEmptySelectionKey = "CPTableViewEmptySelectionKey";
{
var the_class = objj_getClass("CPTableView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder))
    {
        objj_msgSend(self, "_init");
        _dataSource = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDataSourceKey);
        _delegate = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDelegateKey);
        _rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableViewRowHeightKey);
        _intercellSpacing = objj_msgSend(aCoder, "decodeSizeForKey:", CPTableViewIntercellSpacingKey);
        _allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewMultipleSelectionKey);
        _allowsEmptySelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewEmptySelectionKey);
        var tableColumns = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewTableColumnsKey);
        for (var i = 0; i < tableColumns.length; i++)
            objj_msgSend(self, "addTableColumn:", tableColumns[i]);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _dataSource, CPTableViewDataSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _delegate, CPTableViewDelegateKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _tableColumns, CPTableViewTableColumnsKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _rowHeight, CPTableViewRowHeightKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", _intercellSpacing, CPTableViewIntercellSpacingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsMultipleSelection, CPTableViewMultipleSelectionKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsEmptySelection, CPTableViewEmptySelectionKey);
}
})]);
}
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("alternateSelectedControlColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.22, 0.46, 0.84, 1.0]);
}
}), new objj_method(sel_getUid("secondarySelectedControlColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.83, 0.83, 0.83, 1.0]);
}
})]);
}

p;11;CPTabView.ji;13;CPImageView.ji;15;CPTabViewItem.ji;8;CPView.jc;24558;
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
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function(self, _cmd)
{ with(self)
{
    if (_tabViewType != CPTopTabsBezelBorder || _labelsView)
        return;
    objj_msgSend(self, "_createBezelBorder");
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("_createBezelBorder"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    _labelsView = objj_msgSend(objj_msgSend(_CPTabLabelsView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), 0.0));
    objj_msgSend(_labelsView, "setTabView:", self);
    objj_msgSend(_labelsView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self, "addSubview:", _labelsView);
    _backgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_backgroundView, "setBackgroundColor:", CPTabViewBezelBorderBackgroundColor);
    objj_msgSend(_backgroundView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self, "addSubview:", _backgroundView);
    _separatorView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_separatorView, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "bezelBorderColor"));
    objj_msgSend(_separatorView, "setAutoresizingMask:", CPViewWidthSizable | CPViewMaxYMargin);
    objj_msgSend(self, "addSubview:", _separatorView);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
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
            objj_msgSend(_auxiliaryView, "setFrame:", CGRectMake(LEFT_INSET, labelsViewHeight, CGRectGetWidth(backgroundRect) - LEFT_INSET - RIGHT_INSET, auxiliaryViewHeight));
        }
        objj_msgSend(_separatorView, "setFrame:", CGRectMake(LEFT_INSET, labelsViewHeight + auxiliaryViewHeight, CGRectGetWidth(backgroundRect) - LEFT_INSET - RIGHT_INSET, 1.0));
    }
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRect"));
}
}), new objj_method(sel_getUid("addTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    objj_msgSend(self, "insertTabViewItem:atIndex:", aTabViewItem, objj_msgSend(_tabViewItems, "count"));
}
}), new objj_method(sel_getUid("insertTabViewItem:atIndex:"), function(self, _cmd, aTabViewItem, anIndex)
{ with(self)
{
    objj_msgSend(_tabViewItems, "insertObject:atIndex:", aTabViewItem, anIndex);
    objj_msgSend(_labelsView, "tabView:didAddTabViewItem:", self, aTabViewItem);
    if (objj_msgSend(_tabViewItems, "count") == 1)
        objj_msgSend(self, "selectFirstTabViewItem:", self);
    if (_delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(_delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
}), new objj_method(sel_getUid("removeTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    objj_msgSend(_tabViewItems, "removeObjectIdenticalTo:", aTabViewItem);
    objj_msgSend(_labelsView, "tabView:didRemoveTabViewItem:", self, aTabViewItem);
    if (_delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(_delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
}), new objj_method(sel_getUid("indexOfTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    return objj_msgSend(_tabViewItems, "indexOfObjectIdenticalTo:", aTabViewItem);
}
}), new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(_tabViewItems, "count");
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_tabViewItems[index], "identifier"), "isEqualTo:", anIdentifier))
            return index;
    return index;
}
}), new objj_method(sel_getUid("numberOfTabViewItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_tabViewItems, "count");
}
}), new objj_method(sel_getUid("tabViewItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return _tabViewItems[anIndex];
}
}), new objj_method(sel_getUid("tabViewItems"), function(self, _cmd)
{ with(self)
{
    return _tabViewItems;
}
}), new objj_method(sel_getUid("selectFirstTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    var count = objj_msgSend(_tabViewItems, "count");
    if (count)
        objj_msgSend(self, "selectTabViewItemAtIndex:", 0);
}
}), new objj_method(sel_getUid("selectLastTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    var count = objj_msgSend(_tabViewItems, "count");
    if (count)
        objj_msgSend(self, "selectTabViewItemAtIndex:", count - 1);
}
}), new objj_method(sel_getUid("selectNextTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    if (!_selectedTabViewItem)
        return;
    var index = objj_msgSend(self, "indexOfTabViewItem:", _selectedTabViewItem),
        count = objj_msgSend(_tabViewItems, "count");
    objj_msgSend(self, "selectTabViewItemAtIndex:", index + 1 % count);
}
}), new objj_method(sel_getUid("selectPreviousTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    if (!_selectedTabViewItem)
        return;
    var index = objj_msgSend(self, "indexOfTabViewItem:", _selectedTabViewItem),
        count = objj_msgSend(_tabViewItems, "count");
    objj_msgSend(self, "selectTabViewItemAtIndex:", index == 0 ? count : index - 1);
}
}), new objj_method(sel_getUid("selectTabViewItem:"), function(self, _cmd, aTabViewItem)
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
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
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
}), new objj_method(sel_getUid("selectTabViewItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "selectTabViewItem:", _tabViewItems[anIndex]);
}
}), new objj_method(sel_getUid("selectedTabViewItem"), function(self, _cmd)
{ with(self)
{
    return _selectedTabViewItem;
}
}), new objj_method(sel_getUid("setTabViewType:"), function(self, _cmd, aTabViewType)
{ with(self)
{
    if (_tabViewType == aTabViewType)
        return;
    _tabViewType = aTabViewType;
    if (_tabViewType == CPNoTabsBezelBorder || _tabViewType == CPNoTabsLineBorder || _tabViewType == CPNoTabsNoBorder)
        objj_msgSend(_labelsView, "removeFromSuperview");
    else if (!objj_msgSend(_labelsView, "superview"))
        objj_msgSend(self, "addSubview:", _labelsView);
    if (_tabViewType == CPNoTabsLineBorder || _tabViewType == CPNoTabsNoBorder)
        objj_msgSend(_backgroundView, "removeFromSuperview");
    else if (!objj_msgSend(_backgroundView, "superview"))
        objj_msgSend(self, "addSubview:", _backgroundView);
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("tabViewType"), function(self, _cmd)
{ with(self)
{
    return _tabViewType;
}
}), new objj_method(sel_getUid("contentRect"), function(self, _cmd)
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
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _delegateSelectors = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabView:shouldSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewShouldSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabView:willSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewWillSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabView:didSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewDidSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabViewDidChangeNumberOfTabViewItems:")))
        _delegateSelectors |= CPTabViewDidChangeNumberOfTabViewItemsSelector;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(_labelsView, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        tabViewItem = objj_msgSend(_labelsView, "representedTabViewItemAtPoint:", location);
    if (tabViewItem)
        objj_msgSend(self, "selectTabViewItem:", tabViewItem);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != CPTabView)
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self),
        emptyImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initByReferencingFile:size:", "", CGSizeMake(7.0, 0.0)),
        backgroundImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBackgroundCenter.png"), CGSizeMake(1.0, 1.0)),
        bezelBorderLeftImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorderLeft.png"), CGSizeMake(7.0, 1.0)),
        bezerBorderImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorder.png"), CGSizeMake(1.0, 1.0)),
        bezelBorderRightImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorderRight.png"), CGSizeMake(7.0, 1.0));
    CPTabViewBezelBorderBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            emptyImage,
            emptyImage,
            emptyImage,
            bezelBorderLeftImage,
            backgroundImage,
            bezelBorderRightImage,
            bezelBorderLeftImage,
            bezerBorderImage,
            bezelBorderRightImage
        ]));
    CPTabViewBezelBorderColor = objj_msgSend(CPColor, "colorWithPatternImage:", bezerBorderImage);
}
}), new objj_method(sel_getUid("bezelBorderColor"), function(self, _cmd)
{ with(self)
{
    return CPTabViewBezelBorderColor;
}
})]);
}
var CPTabViewItemsKey = "CPTabViewItemsKey",
    CPTabViewSelectedItemKey = "CPTabViewSelectedItemKey",
    CPTabViewTypeKey = "CPTabViewTypeKey",
    CPTabViewDelegateKey = "CPTabViewDelegateKey";
{
var the_class = objj_getClass("CPTabView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTabView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
    {
        _tabViewType = objj_msgSend(aCoder, "decodeIntForKey:", CPTabViewTypeKey);
        _tabViewItems = [];
        objj_msgSend(self, "_createBezelBorder");
        var items = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemsKey);
        for (var i = 0; items && i < items.length; i++)
            objj_msgSend(self, "insertTabViewItem:atIndex:", items[i], i);
        var selected = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewSelectedItemKey);
        if (selected)
            objj_msgSend(self, "selectTabViewItem:", selected);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewDelegateKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _tabViewItems, CPTabViewItemsKey);;
    objj_msgSend(aCoder, "encodeObject:forKey:", _selectedTabViewItem, CPTabViewSelectedItemKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _tabViewType, CPTabViewTypeKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPTabViewDelegateKey);
}
})]);
}
var _CPTabLabelsViewBackgroundColor = nil,
    _CPTabLabelsViewInsideMargin = 10.0,
    _CPTabLabelsViewOutsideMargin = 15.0;
{var the_class = objj_allocateClassPair(CPView, "_CPTabLabelsView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tabView"), new objj_ivar("_tabLabels")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _tabLabels = [];
        objj_msgSend(self, "setBackgroundColor:", _CPTabLabelsViewBackgroundColor);
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(aFrame), 26.0));
    }
    return self;
}
}), new objj_method(sel_getUid("setTabView:"), function(self, _cmd, aTabView)
{ with(self)
{
    _tabView = aTabView;
}
}), new objj_method(sel_getUid("tabView"), function(self, _cmd)
{ with(self)
{
    return _tabView;
}
}), new objj_method(sel_getUid("tabView:didAddTabViewItem:"), function(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    var label = objj_msgSend(objj_msgSend(_CPTabLabel, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(label, "setTabViewItem:", aTabViewItem);
    _tabLabels.push(label);
    objj_msgSend(self, "addSubview:", label);
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("tabView:didRemoveTabViewItem:"), function(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    var index = objj_msgSend(aTabView, "indexOfTabViewItem:", aTabViewItem),
        label = _tabLabels[index];
    objj_msgSend(_tabLabels, "removeObjectAtIndex:", index);
    objj_msgSend(label, "removeFromSuperview");
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("tabView:didChangeStateOfTabViewItem:"), function(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    objj_msgSend(_tabLabels[objj_msgSend(aTabView, "indexOfTabViewItem:", aTabViewItem)], "setTabState:", objj_msgSend(aTabViewItem, "tabState"));
 }
}), new objj_method(sel_getUid("representedTabViewItemAtPoint:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
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
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(objj_msgSend(self, "frame").size, aSize))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "layoutSubviews");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPTabLabelsView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPTabLabelsViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewLeft.png"), CGSizeMake(12.0, 26.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewCenter.png"), CGSizeMake(1.0, 26.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewRight.png"), CGSizeMake(12.0, 26.0))
        ], NO));
}
}), new objj_method(sel_getUid("height"), function(self, _cmd)
{ with(self)
{
    return 26.0;
}
})]);
}
var _CPTabLabelBackgroundColor = nil,
    _CPTabLabelSelectedBackgroundColor = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPTabLabel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tabViewItem"), new objj_ivar("_labelField")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _labelField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_labelField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_labelField, "setFrame:", CGRectMake(5.0, 0.0, CGRectGetWidth(aFrame) - 10.0, 20.0));
        objj_msgSend(_labelField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_labelField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
        objj_msgSend(self, "addSubview:", _labelField);
        objj_msgSend(self, "setTabState:", CPBackgroundTab);
    }
    return self;
}
}), new objj_method(sel_getUid("setTabState:"), function(self, _cmd, aTabState)
{ with(self)
{
    objj_msgSend(self, "setBackgroundColor:", aTabState == CPSelectedTab ? _CPTabLabelSelectedBackgroundColor : _CPTabLabelBackgroundColor);
}
}), new objj_method(sel_getUid("setTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    _tabViewItem = aTabViewItem;
    objj_msgSend(self, "update");
}
}), new objj_method(sel_getUid("tabViewItem"), function(self, _cmd)
{ with(self)
{
    return _tabViewItem;
}
}), new objj_method(sel_getUid("update"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_labelField, "setStringValue:", objj_msgSend(_tabViewItem, "label"));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPTabLabel, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPTabLabelBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundLeft.png"), CGSizeMake(6.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundCenter.png"), CGSizeMake(1.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundRight.png"), CGSizeMake(6.0, 18.0))
        ], NO));
    _CPTabLabelSelectedBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedLeft.png"), CGSizeMake(3.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedCenter.png"), CGSizeMake(1.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedRight.png"), CGSizeMake(3.0, 18.0))
        ], NO));
}
})]);
}

p;15;CPTabViewItem.jI;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;3357;
CPSelectedTab = 0;
CPBackgroundTab = 1;
CPPressedTab = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTabViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_label"), new objj_ivar("_view"), new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _identifier = anIdentifier;
    return self;
}
}), new objj_method(sel_getUid("setLabel:"), function(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
}), new objj_method(sel_getUid("label"), function(self, _cmd)
{ with(self)
{
    return _label;
}
}), new objj_method(sel_getUid("tabState"), function(self, _cmd)
{ with(self)
{
    return _tabState;
}
}), new objj_method(sel_getUid("setIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
}), new objj_method(sel_getUid("identifier"), function(self, _cmd)
{ with(self)
{
    return _identifier;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    _view = aView;
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("setAuxiliaryView:"), function(self, _cmd, anAuxiliaryView)
{ with(self)
{
    _auxiliaryView = anAuxiliaryView;
}
}), new objj_method(sel_getUid("auxiliaryView"), function(self, _cmd)
{ with(self)
{
    return _auxiliaryView;
}
}), new objj_method(sel_getUid("tabView"), function(self, _cmd)
{ with(self)
{
    return _tabView;
}
})]);
}
var CPTabViewItemIdentifierKey = "CPTabViewItemIdentifierKey",
    CPTabViewItemLabelKey = "CPTabViewItemLabelKey",
    CPTabViewItemViewKey = "CPTabViewItemViewKey",
    CPTabViewItemAuxViewKey = "CPTabViewItemAuxViewKey";
{
var the_class = objj_getClass("CPTabViewItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTabViewItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemIdentifierKey);
        _label = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemLabelKey);
        _view = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemViewKey);
        _auxiliaryView = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemAuxViewKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTabViewItemIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _label, CPTabViewItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _view, CPTabViewItemViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _auxiliaryView, CPTabViewItemAuxViewKey);
}
})]);
}

p;13;CPTextField.ji;11;CPControl.ji;17;CPStringDrawing.jc;23326;
CGPointMake= function(x, y) { return { x:x, y:y }; }
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
CGInsetMake= function(top, left, bottom, right) { return { top:(top), left:(left), bottom:(bottom), right:(right) }; }
CGInsetMakeZero= function() { return { top:(0), left:(0), bottom:(0), right:(0) }; }
CGInsetMakeCopy= function(anInset) { return { top:(anInset.top), left:(anInset.left), bottom:(anInset.bottom), right:(anInset.right) }; }
CGInsetIsEmpty= function(anInset) { return ((anInset).left === 0 && (anInset).top === 0 && (anInset).right === 0 && (anInset).bottom === 0); }
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
CPLineBreakByWordWrapping = 0;
CPLineBreakByCharWrapping = 1;
CPLineBreakByClipping = 2;
CPLineBreakByTruncatingHead = 3;
CPLineBreakByTruncatingTail = 4;
CPLineBreakByTruncatingMiddle = 5;
CPTextFieldSquareBezel = 0;
CPTextFieldRoundedBezel = 1;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("string"), function(self, _cmd)
{ with(self)
{
    return self;
}
})]);
}
CPTextFieldStateRounded = 1 << 12;
CPTextFieldStatePlaceholder = 1 << 13;
{var the_class = objj_allocateClassPair(CPControl, "CPTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEditable"), new objj_ivar("_isSelectable"), new objj_ivar("_drawsBackground"), new objj_ivar("_textFieldBackgroundColor"), new objj_ivar("_placeholderString"), new objj_ivar("_delegate"), new objj_ivar("_textDidChangeValue"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);

    if (self)
    {
        objj_msgSend(self, "setStringValue:", "");
        objj_msgSend(self, "setPlaceholderString:", "");

        _sendActionOn = CPKeyUpMask | CPKeyDownMask;

        objj_msgSend(self, "setValue:forThemedAttributeName:", CPLeftTextAlignment, "alignment");
    }

    return self;
}
}), new objj_method(sel_getUid("setEditable:"), function(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
}), new objj_method(sel_getUid("isEditable"), function(self, _cmd)
{ with(self)
{
    return _isEditable;
}
}), new objj_method(sel_getUid("setSelectable:"), function(self, _cmd, aFlag)
{ with(self)
{
    _isSelectable = aFlag;
}
}), new objj_method(sel_getUid("isSelectable"), function(self, _cmd)
{ with(self)
{
    return _isSelectable;
}
}), new objj_method(sel_getUid("setBezeled:"), function(self, _cmd, shouldBeBezeled)
{ with(self)
{
    if ((!!(_controlState & CPControlStateBezeled)) === shouldBeBezeled)
        return;

    if (shouldBeBezeled)
        _controlState |= CPControlStateBezeled;
    else
        _controlState &= ~CPControlStateBezeled;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isBezeled"), function(self, _cmd)
{ with(self)
{
    return !!(_controlState & CPControlStateBezeled);
}
}), new objj_method(sel_getUid("setBezelStyle:"), function(self, _cmd, aBezelStyle)
{ with(self)
{
    var shouldBeRounded = aBezelStyle === CPTextFieldRoundedBezel;

    if ((!!(_controlState & CPTextFieldStateRounded)) === shouldBeRounded)
        return;

    if (shouldBeRounded)
        _controlState |= CPTextFieldStateRounded;
    else
        _controlState &= ~CPTextFieldStateRounded;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("bezelStyle"), function(self, _cmd)
{ with(self)
{
    if (_controlState & CPTextFieldStateRounded)
        return CPTextFieldRoundedBezel;

    return CPTextFieldSquareBezel;
}
}), new objj_method(sel_getUid("setBordered:"), function(self, _cmd, shouldBeBordered)
{ with(self)
{
    if ((!!(_controlState & CPControlStateBordered)) === shouldBeBordered)
        return;

    if (shouldBeBordered)
        _controlState |= CPControlStateBordered;
    else
        _controlState &= ~CPControlStateBordered;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isBordered"), function(self, _cmd)
{ with(self)
{
    return !!(_controlState & CPControlStateBordered);
}
}), new objj_method(sel_getUid("setDrawsBackground:"), function(self, _cmd, shouldDrawBackground)
{ with(self)
{
    if (_drawsBackground == shouldDrawBackground)
        return;

    _drawsBackground = shouldDrawBackground;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("drawsBackground"), function(self, _cmd)
{ with(self)
{
    return _drawsBackground;
}
}), new objj_method(sel_getUid("setTextFieldBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textFieldBackgroundColor == aColor)
        return;

    _textFieldBackgroundColor = aColor;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("textFieldBackgroundColor"), function(self, _cmd)
{ with(self)
{
    return _textFieldBackgroundColor;
}
}), new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled");
}
}), new objj_method(sel_getUid("becomeFirstResponder"), function(self, _cmd)
{ with(self)
{
    _controlState |= CPControlStateEditing;
    objj_msgSend(self, "setNeedsLayout");
    return YES;
}
}), new objj_method(sel_getUid("resignFirstResponder"), function(self, _cmd)
{ with(self)
{
    _controlState &= ~CPControlStateEditing;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
    return YES;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled"))
        return objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    else
        return objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("objectValue"), function(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "objectValue");
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", aValue);
    var string = objj_msgSend(self, "stringValue");
    if (!string || objj_msgSend(string, "length") === 0)
        _controlState |= CPTextFieldStatePlaceholder;
    else
        _controlState &= ~CPTextFieldStatePlaceholder;
}
}), new objj_method(sel_getUid("setPlaceholderString:"), function(self, _cmd, aStringValue)
{ with(self)
{
    if (_placeholderString === aStringValue)
        return;
    _placeholderString = aStringValue;
    if (_controlState & CPTextFieldStatePlaceholder)
    {
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
}), new objj_method(sel_getUid("placeholderString"), function(self, _cmd)
{ with(self)
{
    return _placeholderString;
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    var size = objj_msgSend((_value || " "), "sizeWithFont:", objj_msgSend(self, "font")),
        contentInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "content-inset");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(size.width + contentInset.left + contentInset.right, size.height + contentInset.top + contentInset.bottom));
}
}), new objj_method(sel_getUid("selectText:"), function(self, _cmd, sender)
{ with(self)
{
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidBeginEditingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidChangeNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidEndEditingNotification, self);
    }
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidBeginEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidBeginEditing:"), CPControlTextDidBeginEditingNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidChange:"), CPControlTextDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidEndEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidEndEditing:"), CPControlTextDidEndEditingNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("contentRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "content-inset");
    if (!contentInset)
        return bounds;
    bounds.origin.x += contentInset.left;
    bounds.origin.y += contentInset.top;
    bounds.size.width -= contentInset.left + contentInset.right;
    bounds.size.height -= contentInset.top + contentInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("bezelRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var bezelInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-inset");
    if (!((bezelInset).left === 0 && (bezelInset).top === 0 && (bezelInset).right === 0 && (bezelInset).bottom === 0))
        return bounds;
    bounds.origin.x += bezelInset.left;
    bounds.origin.y += bezelInset.top;
    bounds.size.width -= bezelInset.left + bezelInset.right;
    bounds.size.height -= bezelInset.top + bezelInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
    {
        var view = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        return view;
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        objj_msgSend(contentView, "setHidden:", _controlState & CPControlStateEditing);
        if (_controlState & CPTextFieldStatePlaceholder)
            objj_msgSend(contentView, "setText:", objj_msgSend(self, "placeholderString"));
        else
            objj_msgSend(contentView, "setText:", objj_msgSend(self, "stringValue"));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-color"));
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemedAttributeName:", "font"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemedAttributeName:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-offset"));
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [{ top:(0), left:(0), bottom:(0), right:(0) }, { top:(2.0), left:(2.0), bottom:(2.0), right:(2.0) }, { top:(2.0), left:(2.0), bottom:(2.0), right:(2.0) }, nil], ["bezel-inset", "content-inset", "bezeled-content-inset", "bezel-color"]);
}
})]);
}
var CPTextFieldIsEditableKey = "CPTextFieldIsEditableKey",
    CPTextFieldIsSelectableKey = "CPTextFieldIsSelectableKey",
    CPTextFieldIsBorderedKey = "CPTextFieldIsBorderedKey",
    CPTextFieldIsBezeledKey = "CPTextFieldIsBezeledKey",
    CPTextFieldBezelStyleKey = "CPTextFieldBezelStyleKey",
    CPTextFieldDrawsBackgroundKey = "CPTextFieldDrawsBackgroundKey",
    CPTextFieldLineBreakModeKey = "CPTextFieldLineBreakModeKey",
    CPTextFieldBackgroundColorKey = "CPTextFieldBackgroundColorKey",
    CPTextFieldPlaceholderStringKey = "CPTextFieldPlaceholderStringKey";
{
var the_class = objj_getClass("CPTextField")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTextField\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setEditable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsEditableKey));
        objj_msgSend(self, "setSelectable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsSelectableKey));
        objj_msgSend(self, "setDrawsBackground:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldDrawsBackgroundKey));
        objj_msgSend(self, "setTextFieldBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldBackgroundColorKey));
        objj_msgSend(self, "setPlaceholderString:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldPlaceholderStringKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPTextFieldIsEditableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isSelectable, CPTextFieldIsSelectableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _drawsBackground, CPTextFieldDrawsBackgroundKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _textFieldBackgroundColor, CPTextFieldBackgroundColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _placeholderString, CPTextFieldPlaceholderStringKey);
}
})]);
}

p;9;CPTheme.jI;21;Foundation/CPObject.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.ji;19;CPThemedAttribute.jc;10788;
{var the_class = objj_allocateClassPair(CPObject, "CPBlend"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_themes"), new objj_ivar("_loadDelegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_themes"), function(self, _cmd)
{ with(self)
{
return _themes;
}
}), new objj_method(sel_getUid("initWithContentsOfURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _bundle = objj_msgSend(objj_msgSend(CPBundle, "alloc"), "initWithPath:", aURL + "/Info.plist");
    }
    return self;
}
}), new objj_method(sel_getUid("loadWithDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _loadDelegate = aDelegate;
    objj_msgSend(_bundle, "loadWithDelegate:", self);
}
}), new objj_method(sel_getUid("bundleDidFinishLoading:"), function(self, _cmd, aBundle)
{ with(self)
{
    var paths = objj_msgSend(_bundle, "objectForInfoDictionaryKey:", "CPBundleReplacedFiles"),
        index = 0,
        count = paths.length,
        bundlePath = objj_msgSend(_bundle, "bundlePath");
    while (count--)
    {
        var path = paths[count];
        if (objj_msgSend(path, "pathExtension") === "keyedtheme")
        {
            var unarchiver = objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:", objj_msgSend(CPData, "dataWithString:", objj_files[bundlePath + '/' + path].contents), _bundle);
            objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
            objj_msgSend(unarchiver, "finishDecoding");
        }
    }
    objj_msgSend(_loadDelegate, "blendDidFinishLoading:", self);
}
})]);
}
var CPThemesByName = nil,
    CPThemeDefaultTheme = nil,
    CPThemeViewClass = Nil,
    CPThemeWindowClass = Nil;
{var the_class = objj_allocateClassPair(CPObject, "CPTheme"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_activeClass"), new objj_ivar("_classTable")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _classTable = {};
        _classTable[objj_msgSend(objj_msgSend(self, "class"), "className")] = {};
        CPThemesByName[_name] = aName;
    }
    return self;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("setActiveClass:"), function(self, _cmd, aClass)
{ with(self)
{
    _activeClass = aClass;
}
}), new objj_method(sel_getUid("activeClass"), function(self, _cmd)
{ with(self)
{
    return _activeClass;
}
}), new objj_method(sel_getUid("valueForAttributeName:inClass:"), function(self, _cmd, anAttributeName, aClass)
{ with(self)
{
    if (!aClass)
        return nil;
    var className = objj_msgSend(aClass, "className"),
        table = _classTable[className];
    if (!table)
        return nil;
    var value = table[anAttributeName];
    if (!value)
        return nil;
    return value;
}
}), new objj_method(sel_getUid("takeThemeFromObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var attributes = objj_msgSend(anObject, "_themedAttributes"),
        attributeName = nil,
        attributeNames = objj_msgSend(attributes, "keyEnumerator"),
        objectClass = objj_msgSend(anObject, "class");
    while (attributeName = objj_msgSend(attributeNames, "nextObject"))
        objj_msgSend(self, "addValue:forAttributeName:inClass:", objj_msgSend(attributes, "objectForKey:", attributeName), attributeName, objectClass);
}
}), new objj_method(sel_getUid("setDefaultValue:forAttributeName:"), function(self, _cmd, aValue, anAttributeName)
{ with(self)
{
    objj_msgSend(self, "addValue:forAttributeName:inClass:", aValue, anAttributeName, objj_msgSend(self, "class"));
}
}), new objj_method(sel_getUid("addValue:forAttributeName:inClass:"), function(self, _cmd, aValue, anAttributeName, aClass)
{ with(self)
{
    if (!aValue)
        return;
    var className = objj_msgSend(aClass, "className"),
        table = _classTable[className];
    if (!table)
    {
        var classNames = [];
        while (!table && (aClass !== CPThemeViewClass) && (aClass !== CPThemeWindowClass))
        {
            classNames.push(className);
            aClass = objj_msgSend(aClass, "superclass");
            className = objj_msgSend(aClass, "className");
            table = _classTable[className];
        }
        if (!table)
            table = _classTable[objj_msgSend(objj_msgSend(self, "class"), "className")];
        var count = objj_msgSend(classNames, "count");
        while (count--)
        {
            className = classNames[count];
            _classTable[className] = {};
            _classTable[className].prototype = table;
            table = _classTable[className];
        }
    }
    var existingAttribute = table[anAttributeName];
    if (existingAttribute)
        table[anAttributeName] = objj_msgSend(existingAttribute, "themedAttributeMergedWithThemedAttribute:", aValue);
    else
        table[anAttributeName] = aValue;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPTheme, "class"))
        return;
    CPThemesByName = {};
    CPThemeViewClass = objj_msgSend(CPView, "class");
    CPThemeWindowClass = objj_msgSend(CPWindow, "class");
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
        defaultThemePath = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "Default Themes Path"),
        defaultThemeName = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "Default Theme Name");
    if (!defaultThemePath)
        return;
    defaultThemePath = objj_msgSend(bundle, "pathForResource:", defaultThemePath);
    var file = objj_files[defaultThemePath + "/Info.plist"];
    if (!file)
        return;
    var infoDictionary = CPPropertyListCreateFromData(objj_msgSend(CPData, "dataWithString:", objj_files[defaultThemePath + "/Info.plist"].contents));
        themes = objj_msgSend(infoDictionary, "objectForKey:", "CPBundleReplacedFiles"),
        themeIndex = 0,
        themeCount = objj_msgSend(themes, "count");
    for (; themeIndex < themeCount; ++themeIndex)
    {
        var unarchiver = objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:", objj_msgSend(CPData, "dataWithString:", objj_files[defaultThemePath + '/' + themes[themeIndex]].contents), file.bundle);
        objj_msgSend(unarchiver, "decodeObjectForKey:", "root");
        objj_msgSend(unarchiver, "finishDecoding");
    }
    objj_msgSend(self, "setDefaultTheme:", objj_msgSend(CPTheme, "themeNamed:", defaultThemeName));
}
}), new objj_method(sel_getUid("setDefaultTheme:"), function(self, _cmd, aTheme)
{ with(self)
{
    CPThemeDefaultTheme = aTheme;
}
}), new objj_method(sel_getUid("defaultTheme"), function(self, _cmd)
{ with(self)
{
    return CPThemeDefaultTheme;
}
}), new objj_method(sel_getUid("themeNamed:"), function(self, _cmd, aName)
{ with(self)
{
    return CPThemesByName[aName];
}
}), new objj_method(sel_getUid("loadThemesAtURL:delegate:"), function(self, _cmd, aURL, aLoadDelegate)
{ with(self)
{
}
})]);
}
var CPThemeNameKey = "CPThemeNameKey",
    CPThemeClassNamesArrayKey = "CPThemeClassNamesArrayKey";
{
var the_class = objj_getClass("CPTheme")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTheme\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _name = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeNameKey);
    _classTable = {};
    CPThemesByName[_name] = self;
    if (self)
    {
        var classNamesArray = objj_msgSend(aCoder, "decodeObjectForKey:", CPThemeClassNamesArrayKey),
            count = classNamesArray.length;
        while (count--)
        {
            var className = classNamesArray[count],
                theClass = objj_getClass(className),
                values = objj_msgSend(aCoder, "decodeObjectForKey:", className),
                keys = objj_msgSend(values, "allKeys"),
                keyCount = keys.length;
            while (keyCount--)
            {
                var key = keys[keyCount];
                objj_msgSend(self, "addValue:forAttributeName:inClass:", objj_msgSend(values, "objectForKey:", key), key, theClass);
            }
        }
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var classNamesArray = [];
    for (var className in _classTable)
    {
        if (_classTable.hasOwnProperty(className))
        {
            var values = _classTable[className],
                valuesDictionary = objj_msgSend(CPDictionary, "dictionary");
            for (var key in values)
                if (key !== "prototype" && values.hasOwnProperty(key))
                    objj_msgSend(valuesDictionary, "setObject:forKey:", values[key], key);
            objj_msgSend(aCoder, "encodeObject:forKey:", valuesDictionary, className);
            classNamesArray.push(className);
        }
    }
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, CPThemeNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", classNamesArray, CPThemeClassNamesArrayKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPThemeKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:"), function(self, _cmd, data, aBundle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);
    if (self)
        _bundle = aBundle;
    return self;
}
}), new objj_method(sel_getUid("bundle"), function(self, _cmd)
{ with(self)
{
    return _bundle;
}
}), new objj_method(sel_getUid("awakenCustomResources"), function(self, _cmd)
{ with(self)
{
    return YES;
}
})]);
}

p;19;CPThemedAttribute.jI;21;Foundation/CPObject.jc;7686;


CPControlStateNormal = 0,
CPControlStateHighlighted = 1 << 0,
CPControlStateDisabled = 1 << 1,
CPControlStateSelected = 1 << 2,
CPControlStateDefault = 1 << 3,
CPControlStateBordered = 1 << 4,
CPControlStateBezeled = 1 << 5,
CPControlStateVertical = 1 << 6,
CPControlStateEditable = 1 << 7,
CPControlStateEditing = 1 << 8;

var BIT_COUNT = [ 0 , 1 , 1 , 2 , 1 , 2 , 2 , 3 ,
                    1 , 2 , 2 , 3 , 2 , 3 , 3 , 4 ,
                    1 , 2 , 2 , 3 , 2 , 3 , 3 , 4 ,
                    2 , 3 , 3 , 4 , 3 , 4 , 4 , 5 ],
    bit_count = function(bits)
    {
        var count = 0;

        while (bits)
        {
            ++count;
            bits &= (bits - 1);
        }

        return count ;
    }

{var the_class = objj_allocateClassPair(CPObject, "CPThemedAttribute"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cache"), new objj_ivar("_name"), new objj_ivar("_defaultValue"), new objj_ivar("_theme"), new objj_ivar("_themedClass"), new objj_ivar("_values"), new objj_ivar("_attributeFromTheme")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:defaultValue:theme:class:"), function(self, _cmd, aName, aDefaultValue, aTheme, aClass)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _cache = {};

        _name = aName;

        _defaultValue = aDefaultValue;

        _theme = aTheme;
        _themedClass = aClass;

        _values = objj_msgSend(CPDictionary, "dictionary");
        _attributeFromTheme = objj_msgSend(_theme, "valueForAttributeName:inClass:", _name, _themedClass);
    }

    return self;
}
}), new objj_method(sel_getUid("setName:"), function(self, _cmd, aName)
{ with(self)
{
    _name = aName;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("setDefaultValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _cache = {};
    _defaultValue = aValue;
}
}), new objj_method(sel_getUid("setTheme:"), function(self, _cmd, aTheme)
{ with(self)
{
    if (_theme === aTheme)
        return;

    _cache = {};
    _theme = aTheme;
    _attributeFromTheme = objj_msgSend(_theme, "valueForAttributeName:inClass:", _name, _themedClass);
}
}), new objj_method(sel_getUid("setThemedClass:"), function(self, _cmd, aClass)
{ with(self)
{
    if (_themedClass === aClass)
        return;

    _cache = {};
    _themedClass = aClass;
    _attributeFromTheme = objj_msgSend(_theme, "valueForAttributeName:inClass:", _name, _themedClass);
}
}), new objj_method(sel_getUid("setValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _cache = {};

    if (aValue === undefined || aValue === nil)
        _values = objj_msgSend(CPDictionary, "dictionary");
    else
        _values = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aValue, String(CPControlStateNormal));
}
}), new objj_method(sel_getUid("value"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForControlState:", CPControlStateNormal);
}
}), new objj_method(sel_getUid("setValue:forControlState:"), function(self, _cmd, aValue, aState)
{ with(self)
{

    _cache = {};

    if ((aValue === undefined) || (aValue === nil))
        objj_msgSend(_values, "removeObjectForKey:", String(aState));
    else
        objj_msgSend(_values, "setObject:forKey:", aValue, String(aState));
}
}), new objj_method(sel_getUid("valueForControlState:"), function(self, _cmd, aState)
{ with(self)
{
    var value = _cache[aState];


    if (value !== undefined)
        return value;

    value = objj_msgSend(_values, "objectForKey:", String(aState));


    if ((value === undefined || value === nil) && aState > 0)
    {

        if (aState & (aState - 1))
        {
            var highestBitCount = 0,
                states = objj_msgSend(_values, "allKeys"),
                count = states.length;

            while (count--)
            {

                state = Number(states[count]);


                if ((state & aState) === state)
                {
                    var bitCount = (state < BIT_COUNT.length) ? BIT_COUNT[state] : bit_count(state);

                    if (bitCount > highestBitCount)
                    {
                        highestBitCount = bitCount;
                        value = objj_msgSend(_values, "objectForKey:", String(state));
                    }
                }
            }
        }


        if (value === undefined || value === nil)
            value = objj_msgSend(_values, "objectForKey:", String(CPControlStateNormal));
    }

    if (value === undefined || value === nil)
        value = objj_msgSend(_attributeFromTheme, "valueForControlState:", aState);

    if (value === undefined || value === nil)
        value = _defaultValue;

    _cache[aState] = value;

    return value;
}
}), new objj_method(sel_getUid("themedAttributeMergedWithThemedAttribute:"), function(self, _cmd, aThemedAttribute)
{ with(self)
{
    var mergedAttribute = CPThemedAttributeMake(_name, _defaultValue, _theme, _themedClass);

    mergedAttribute._values = objj_msgSend(_values, "copy");
    objj_msgSend(mergedAttribute._values, "addEntriesFromDictionary:", aThemedAttribute._values);

    return mergedAttribute;
}
}), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
    {
        _cache = {};
        _values = objj_msgSend(aCoder, "decodeObjectForKey:", "values");
    }

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _values, "values");
}
})]);
}

CPThemedAttributeMake= function(aName, aDefaultValue, aTheme, aClass)
{
    return objj_msgSend(objj_msgSend(CPThemedAttribute, "alloc"), "initWithName:defaultValue:theme:class:", aName, aDefaultValue, aTheme, aClass);
}

CPThemedAttributeEncode= function(aCoder, aThemedAttribute)
{
    var values = aThemedAttribute._values,
        count = objj_msgSend(values, "count");

    if (count === 1)
    {
        var key = objj_msgSend(values, "allKeys")[0];

        if (Number(key) === 0)
            return objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(values, "objectForKey:", key), "$a" + objj_msgSend(aThemedAttribute, "name"));
    }

    if (count >= 1)
        objj_msgSend(aCoder, "encodeObject:forKey:", aThemedAttribute, "$a" + objj_msgSend(aThemedAttribute, "name"));
}

CPThemedAttributeDecode= function(aCoder, anAttributeName, aDefaultValue, aTheme, aClass)
{
    var key = "$a" + anAttributeName;

    if (!objj_msgSend(aCoder, "containsValueForKey:", key))
        return CPThemedAttributeMake(anAttributeName, aDefaultValue, aTheme, aClass);

    var attribute = objj_msgSend(aCoder, "decodeObjectForKey:", key);

    if (!attribute.isa || !objj_msgSend(attribute, "isKindOfClass:", objj_msgSend(CPThemedAttribute, "class")))
    {
        var themedAttribute = CPThemedAttributeMake(anAttributeName, aDefaultValue, aTheme, aClass);

        objj_msgSend(themedAttribute, "setValue:", attribute);

        attribute = themedAttribute;
    }

    else
    {
        objj_msgSend(attribute, "setName:", anAttributeName);
        objj_msgSend(attribute, "setDefaultValue:", aDefaultValue);
        objj_msgSend(attribute, "setTheme:", aTheme);
        objj_msgSend(attribute, "setThemedClass:", aClass);
    }

    return attribute;
}

p;11;CPToolbar.jI;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;23306;
CPToolbarDisplayModeDefault = 0;
CPToolbarDisplayModeIconAndLabel = 1;
CPToolbarDisplayModeIconOnly = 2;
CPToolbarDisplayModeLabelOnly = 3;
var CPToolbarsByIdentifier = nil;
var CPToolbarConfigurationsByIdentifier = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPToolbar"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_displayMode"), new objj_ivar("_showsBaselineSeparator"), new objj_ivar("_allowsUserCustomization"), new objj_ivar("_isVisible"), new objj_ivar("_delegate"), new objj_ivar("_itemIdentifiers"), new objj_ivar("_identifiedItems"), new objj_ivar("_defaultItems"), new objj_ivar("_allowedItems"), new objj_ivar("_selectableItems"), new objj_ivar("_items"), new objj_ivar("_itemsSortedByVisibilityPriority"), new objj_ivar("_toolbarView"), new objj_ivar("_window")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _items = [];
        _identifier = anIdentifier;
        _isVisible = YES;
        objj_msgSend(CPToolbar, "_addToolbar:forIdentifier:", self, _identifier);
    }
    return self;
}
}), new objj_method(sel_getUid("setDisplayMode:"), function(self, _cmd, aDisplayMode)
{ with(self)
{
}
}), new objj_method(sel_getUid("identifier"), function(self, _cmd)
{ with(self)
{
    return _identifier;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("isVisible"), function(self, _cmd)
{ with(self)
{
    return _isVisible;
}
}), new objj_method(sel_getUid("setVisible:"), function(self, _cmd, aFlag)
{ with(self)
{
    if (_isVisible === aFlag)
        return;
    _isVisible = aFlag;
    objj_msgSend(_window, "_noteToolbarChanged");
}
}), new objj_method(sel_getUid("_window"), function(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("_setWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    _window = aWindow;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    objj_msgSend(self, "_reloadToolbarItems");
}
}), new objj_method(sel_getUid("_loadConfiguration"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("_toolbarView"), function(self, _cmd)
{ with(self)
{
    if (!_toolbarView)
    {
        _toolbarView = objj_msgSend(objj_msgSend(_CPToolbarView, "alloc"), "initWithFrame:", CPRectMake(0.0, 0.0, 1200.0, 59.0));
        objj_msgSend(_toolbarView, "setToolbar:", self);
        objj_msgSend(_toolbarView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_toolbarView, "reloadToolbarItems");
    }
    return _toolbarView;
}
}), new objj_method(sel_getUid("_reloadToolbarItems"), function(self, _cmd)
{ with(self)
{
    if (!_delegate)
        return;
    var count = objj_msgSend(_itemIdentifiers, "count");
    if (!count)
    {
         _itemIdentifiers = objj_msgSend(objj_msgSend(_delegate, "toolbarDefaultItemIdentifiers:", self), "mutableCopy");
         count = objj_msgSend(_itemIdentifiers, "count");
    }
    _items = [];
    var index = 0;
    for (; index < count; ++index)
    {
        var identifier = _itemIdentifiers[index],
            item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (!item)
            item = objj_msgSend(_delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, YES);
        item = objj_msgSend(item, "copy");
        if (item == nil)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, sprintf("_delegate %s returned nil toolbar item returned for identifier %s", _delegate, identifier));
        objj_msgSend(_items, "addObject:", item);
    }
    _itemsSortedByVisibilityPriority = objj_msgSend(_items, "sortedArrayUsingFunction:context:", _CPToolbarItemVisibilityPriorityCompare, NULL);
    objj_msgSend(_toolbarView, "reloadToolbarItems");
}
}), new objj_method(sel_getUid("items"), function(self, _cmd)
{ with(self)
{
    return _items;
}
}), new objj_method(sel_getUid("visibleItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_toolbarView, "visibleItems");
}
}), new objj_method(sel_getUid("itemsSortedByVisibilityPriority"), function(self, _cmd)
{ with(self)
{
    return _itemsSortedByVisibilityPriority;
}
}), new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"), function(self, _cmd, identifier, toolbar)
{ with(self)
{
    var item = objj_msgSend(_identifiedItems, "objectForKey:", identifier);
    if (!item)
    {
        item = objj_msgSend(CPToolbarItem, "_standardItemWithItemIdentifier:", identifier);
        if (_delegate && !item)
        {
            item = objj_msgSend(objj_msgSend(_delegate, "toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:", self, identifier, toolbar), "copy");
            if (!item)
                objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, sprintf("_delegate %s returned nil toolbar item returned for identifier %s", _delegate, identifier));
        }
        objj_msgSend(_identifiedItems, "setObject:forKey:", item, identifier);
    }
    return item;
}
}), new objj_method(sel_getUid("_itemsWithIdentifiers:"), function(self, _cmd, identifiers)
{ with(self)
{
    var items = [];
    for (var i = 0; i < identifiers.length; i++)
        objj_msgSend(items, "addObject:", objj_msgSend(self, "_itemForItemIdentifier:willBeInsertedIntoToolbar:", identifiers[i], NO));
    return items;
}
}), new objj_method(sel_getUid("_defaultToolbarItems"), function(self, _cmd)
{ with(self)
{
    if (!_defaultItems)
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("toolbarDefaultItemIdentifiers:")))
            _defaultItems = objj_msgSend(self, "_itemsWithIdentifiers:", objj_msgSend(_delegate, "toolbarDefaultItemIdentifiers:", self));
    return _defaultItems;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPToolbar, "class"))
        return;
    CPToolbarsByIdentifier = objj_msgSend(CPDictionary, "dictionary");
    CPToolbarConfigurationsByIdentifier = objj_msgSend(CPDictionary, "dictionary");
}
}), new objj_method(sel_getUid("_addToolbar:forIdentifier:"), function(self, _cmd, toolbar, identifier)
{ with(self)
{
    var toolbarsSharingIdentifier = objj_msgSend(CPToolbarsByIdentifier, "objectForKey:", identifier);
    if (!toolbarsSharingIdentifier)
    {
        toolbarsSharingIdentifier = []
        objj_msgSend(CPToolbarsByIdentifier, "setObject:forKey:", toolbarsSharingIdentifier, identifier);
    }
    objj_msgSend(toolbarsSharingIdentifier, "addObject:", toolbar);
}
})]);
}
var CPToolbarIdentifierKey = "CPToolbarIdentifierKey",
    CPToolbarDisplayModeKey = "CPToolbarDisplayModeKey",
    CPToolbarShowsBaselineSeparatorKey = "CPToolbarShowsBaselineSeparatorKey",
    CPToolbarAllowsUserCustomizationKey = "CPToolbarAllowsUserCustomizationKey",
    CPToolbarIsVisibleKey = "CPToolbarIsVisibleKey",
    CPToolbarDelegateKey = "CPToolbarDelegateKey",
    CPToolbarIdentifiedItemsKey = "CPToolbarIdentifiedItemsKey",
    CPToolbarDefaultItemsKey = "CPToolbarDefaultItemsKey",
    CPToolbarAllowedItemsKey = "CPToolbarAllowedItemsKey",
    CPToolbarSelectableItemsKey = "CPToolbarSelectableItemsKey";
{
var the_class = objj_getClass("CPToolbar")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbar\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarIdentifierKey);
        _displayMode = objj_msgSend(aCoder, "decodeIntForKey:", CPToolbarDisplayModeKey);
        _showsBaselineSeparator = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarShowsBaselineSeparatorKey);
        _allowsUserCustomization = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarAllowsUserCustomizationKey);
        _isVisible = objj_msgSend(aCoder, "decodeBoolForKey:", CPToolbarIsVisibleKey);
        _identifiedItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarIdentifiedItemsKey);
        _defaultItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarDefaultItemsKey);
        _allowedItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarAllowedItemsKey);
        _selectableItems = objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarSelectableItemsKey);
        _items = [];
        objj_msgSend(CPToolbar, "_addToolbar:forIdentifier:", self, _identifier);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPToolbarDelegateKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPToolbarIdentifierKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _displayMode, CPToolbarDisplayModeKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _showsBaselineSeparator, CPToolbarShowsBaselineSeparatorKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsUserCustomization, CPToolbarAllowsUserCustomizationKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isVisible, CPToolbarIsVisibleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifiedItems, CPToolbarIdentifiedItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _defaultItems, CPToolbarDefaultItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _allowedItems, CPToolbarAllowedItemsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _selectableItems, CPToolbarSelectableItemsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPToolbarDelegateKey);
}
})]);
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
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_flexibleWidthIndexes"), new objj_ivar("_visibleFlexibleWidthIndexes"), new objj_ivar("_itemInfos"), new objj_ivar("_visibleItems"), new objj_ivar("_invisibleItems"), new objj_ivar("_additionalItemsButton"), new objj_ivar("_labelColor"), new objj_ivar("_minWidth")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minWidth = 0;
        _labelColor = objj_msgSend(CPColor, "blackColor");
        _additionalItemsButton = objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:pullsDown:", CGRectMake(0.0, 0.0, 10.0, 15.0), YES);
        objj_msgSend(_additionalItemsButton, "setBordered:", NO);
        objj_msgSend(_additionalItemsButton, "setImagePosition:", CPImageOnly);
        objj_msgSend(objj_msgSend(_additionalItemsButton, "menu"), "setShowsStateColumn:", NO);
        objj_msgSend(_additionalItemsButton, "setAlternateImage:", _CPToolbarViewExtraItemsAlternateImage);
    }
    return self;
}
}), new objj_method(sel_getUid("setToolbar:"), function(self, _cmd, aToolbar)
{ with(self)
{
    _toolbar = aToolbar;
}
}), new objj_method(sel_getUid("toolbar"), function(self, _cmd)
{ with(self)
{
    return _toolbar;
}
}), new objj_method(sel_getUid("setLabelColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_labelColor === aColor)
        return;
    _labelColor = aColor;
    var items = objj_msgSend(_toolbar, "items"),
        count = objj_msgSend(items, "count");
    while (count--)
        objj_msgSend(objj_msgSend(self, "labelForItem:", items[count]), "setTextColor:", _labelColor);
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
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
    var index = _visibleItems.length,
        height = 0.0;
    while (index--)
    {
        var item = _visibleItems[index],
            minSize = objj_msgSend(item, "minSize"),
            view = objj_msgSend(self, "viewForItem:", item);
        if (minSize.width != objj_msgSend(item, "maxSize").width)
            objj_msgSend(flexibleItemIndexes, "addIndex:", index);
        else
            objj_msgSend(view, "setFrameSize:", CGSizeMake(objj_msgSend(item, "minSize").width, CGRectGetHeight(objj_msgSend(view, "frame"))));
        objj_msgSend(view, "setHidden:", NO);
        objj_msgSend(objj_msgSend(self, "labelForItem:", item), "setHidden:", NO);
        if (height < minSize.height)
            height = minSize.height;
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
                viewFrame = objj_msgSend(view, "frame"),
                proposedWidth = objj_msgSend(item, "minSize").width + proportionate,
                constrainedWidth = MIN(proposedWidth, objj_msgSend(item, "maxSize").width);
            if (constrainedWidth < proposedWidth)
            {
                objj_msgSend(flexibleItemIndexes, "removeIndex:", index);
                remainingSpace += proposedWidth - constrainedWidth;
            }
            objj_msgSend(view, "setFrameSize:", CGSizeMake(constrainedWidth, CGRectGetHeight(viewFrame)));
        }
    }
    var count = _visibleItems.length,
        x = TOOLBAR_ITEM_MARGIN,
        fullHeightItems = [];
    for (index = 0; index < count; ++index)
    {
        var item = _visibleItems[index],
            view = objj_msgSend(self, "viewForItem:", item),
            viewFrame = objj_msgSend(view, "frame"),
            viewWidth = CGRectGetWidth(viewFrame),
            label = objj_msgSend(self, "labelForItem:", item),
            labelFrame = objj_msgSend(label, "frame"),
            labelWidth = CGRectGetWidth(labelFrame),
            itemWidth = MAX(objj_msgSend(self, "minWidthForItem:", item), viewWidth),
            viewHeight = CGRectGetHeight(viewFrame);
        objj_msgSend(view, "setFrame:", CGRectMake(x + (itemWidth - viewWidth) / 2.0, TOOLBAR_TOP_MARGIN + (height - viewHeight) / 2.0, viewWidth, viewHeight));
        objj_msgSend(label, "setFrameOrigin:", CGPointMake(x + (itemWidth - labelWidth) / 2.0, TOOLBAR_TOP_MARGIN + height + 2.0));
        x += itemWidth + TOOLBAR_ITEM_MARGIN;
        if (objj_msgSend(item, "itemIdentifier") == CPToolbarSeparatorItemIdentifier)
            fullHeightItems.push(item);
    }
    for (index = 0, count = fullHeightItems.length; index < count; ++index)
    {
        var view = objj_msgSend(self, "viewForItem:", fullHeightItems[index]),
            viewHeight = 53.0;
        objj_msgSend(view, "setFrame:", CGRectMake(CGRectGetMinX(objj_msgSend(view, "frame")), (59.0 - viewHeight) / 2.0, CGRectGetWidth(objj_msgSend(view, "frame")), viewHeight));
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
        objj_msgSend(_additionalItemsButton, "setFrameOrigin:", CGPointMake(width + 5.0, (CGRectGetHeight(objj_msgSend(self, "bounds")) - CGRectGetHeight(objj_msgSend(_additionalItemsButton, "frame"))) / 2.0));
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
            var menuItem = objj_msgSend(_additionalItemsButton, "itemArray")[index + 1];
            objj_msgSend(menuItem, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(menuItem, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(menuItem, "setAction:", objj_msgSend(item, "action"));
        }
    }
    else
        objj_msgSend(_additionalItemsButton, "removeFromSuperview");
}
}), new objj_method(sel_getUid("viewForItem:"), function(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return nil;
    return info.view;
}
}), new objj_method(sel_getUid("labelForItem:"), function(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return nil;
    return info.label;
}
}), new objj_method(sel_getUid("minWidthForItem:"), function(self, _cmd, anItem)
{ with(self)
{
    var info = objj_msgSend(_itemInfos, "objectForKey:", objj_msgSend(anItem, "hash"));
    if (!info)
        return 0;
    return info.minWidth;
}
}), new objj_method(sel_getUid("reloadToolbarItems"), function(self, _cmd)
{ with(self)
{
    var subviews = objj_msgSend(self, "subviews"),
        count = subviews.length;
    while (count--)
        objj_msgSend(subviews[count], "removeFromSuperview");
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
            view = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 32.0, 32.0));
            objj_msgSend(view, "setBordered:", NO);
            objj_msgSend(view, "setImage:", objj_msgSend(item, "image"));
            objj_msgSend(view, "setAlternateImage:", objj_msgSend(item, "alternateImage"));
            objj_msgSend(view, "setTarget:", objj_msgSend(item, "target"));
            objj_msgSend(view, "setAction:", objj_msgSend(item, "action"));
            objj_msgSend(view, "setTag:", objj_msgSend(item, "tag"));
            objj_msgSend(view, "setImagePosition:", CPImageOnly);
        }
        objj_msgSend(self, "addSubview:", view);
        var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(label, "setStringValue:", objj_msgSend(item, "label"));
        objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(label, "setTextColor:", _labelColor);
        objj_msgSend(label, "sizeToFit");
        objj_msgSend(label, "setTarget:", objj_msgSend(item, "target"));
        objj_msgSend(label, "setAction:", objj_msgSend(item, "action"));
        objj_msgSend(self, "addSubview:", label);
        var minSize = objj_msgSend(item, "minSize"),
            minWidth = MAX(minSize.width, CGRectGetWidth(objj_msgSend(label, "frame")));
        objj_msgSend(_itemInfos, "setObject:forKey:", _CPToolbarItemInfoMake(index, view, label, minWidth), objj_msgSend(item, "hash"));
        _minWidth += minWidth + TOOLBAR_ITEM_MARGIN;
    }
    objj_msgSend(self, "layoutSubviews");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPToolbarView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPToolbarViewExtraItemsImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),  CPSizeMake(10.0, 15.0));
    _CPToolbarViewExtraItemsAlternateImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:",  objj_msgSend(bundle, "pathForResource:", "_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"), CGSizeMake(10.0, 15.0));
}
})]);
}
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

p;15;CPToolbarItem.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;12179;
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
class_addMethods(the_class, [new objj_method(sel_getUid("initWithItemIdentifier:"), function(self, _cmd, anItemIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _itemIdentifier = anItemIdentifier;
        _tag = 0;
        _isEnabled = YES;
        _minSize = CGSizeMakeZero();
        _maxSize = CGSizeMakeZero();
        _visibilityPriority = CPToolbarItemVisibilityPriorityStandard;
    }
    return self;
}
}), new objj_method(sel_getUid("itemIdentifier"), function(self, _cmd)
{ with(self)
{
    return _itemIdentifier;
}
}), new objj_method(sel_getUid("toolbar"), function(self, _cmd)
{ with(self)
{
    return _toolbar;
}
}), new objj_method(sel_getUid("label"), function(self, _cmd)
{ with(self)
{
    return _label;
}
}), new objj_method(sel_getUid("setLabel:"), function(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
}), new objj_method(sel_getUid("paletteLabel"), function(self, _cmd)
{ with(self)
{
    return _paletteLabel;
}
}), new objj_method(sel_getUid("setPaletteLabel:"), function(self, _cmd, aPaletteLabel)
{ with(self)
{
    _paletteLabel = aPaletteLabel;
}
}), new objj_method(sel_getUid("toolTip"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("toolTip")))
        return objj_msgSend(_view, "toolTip");
    return _toolTip;
}
}), new objj_method(sel_getUid("setToolTip:"), function(self, _cmd, aToolTip)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setToolTip:")))
        objj_msgSend(view, "setToolTip:", aToolTip);
    _toolTip = aToolTip;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("tag")))
        return objj_msgSend(_view, "tag");
    return _tag;
}
}), new objj_method(sel_getUid("setTag:"), function(self, _cmd, aTag)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setTag:")))
        objj_msgSend(_view, "setTag:", aTag);
    _tag = aTag;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    if (_view)
        return objj_msgSend(_view, "respondsToSelector:", sel_getUid("target")) ? objj_msgSend(_view, "target") : nil;
    return _target;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    if (!_view)
        _target = aTarget;
    else if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setTarget:")))
        objj_msgSend(_view, "setTarget:", aTarget);
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    if (_view)
        return objj_msgSend(_view, "respondsToSelector:", sel_getUid("action")) ? objj_msgSend(_view, "action") : nil;
    return _action;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    if (!_view)
        _action = anAction;
    else if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setAction:")))
        objj_msgSend(_view, "setAction:", anAction);
}
}), new objj_method(sel_getUid("isEnabled"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("isEnabled")))
        return objj_msgSend(_view, "isEnabled");
    return _isEnabled;
}
}), new objj_method(sel_getUid("setEnabled:"), function(self, _cmd, shouldBeEnabled)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setEnabled:")))
        objj_msgSend(_view, "setEnabled:", shouldBeEnabled);
    _isEnabled = shouldBeEnabled;
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("image")))
        return objj_msgSend(_view, "image");
    return _image;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setImage:")))
        objj_msgSend(_view, "setImage:", anImage);
    _image = anImage;
    if (!_image)
        return;
    if (_minSize.width == 0 && _minSize.height == 0 &&
        _maxSize.width == 0 && _maxSize.height == 0)
    {
        var imageSize = objj_msgSend(_image, "size");
        if (imageSize.width > 0 || imageSize.height > 0)
        {
            objj_msgSend(self, "setMinSize:", imageSize);
            objj_msgSend(self, "setMaxSize:", imageSize);
        }
    }
}
}), new objj_method(sel_getUid("setAlternateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setAlternateImage:")))
        objj_msgSend(_view, "setAlternateImage:", anImage);
    _alternateImage = anImage;
}
}), new objj_method(sel_getUid("alternateImage"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("alternateIamge")))
        return objj_msgSend(_view, "alternateImage");
    return _alternateImage;
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_view == aView)
        return;
    _view = aView;
    if (_view)
    {
        if (_tag !== 0 && objj_msgSend(_view, "respondsToSelector:", sel_getUid("setTag:")))
            objj_msgSend(_view, "setTag:", _tag);
        _target = nil;
        _action = nil;
    }
}
}), new objj_method(sel_getUid("minSize"), function(self, _cmd)
{ with(self)
{
    return _minSize;
}
}), new objj_method(sel_getUid("setMinSize:"), function(self, _cmd, aMinSize)
{ with(self)
{
    _minSize = CGSizeMakeCopy(aMinSize);
    _maxSize = CGSizeMake(MAX(_minSize.width, _maxSize.width), MAX(_minSize.height, _maxSize.height));
}
}), new objj_method(sel_getUid("maxSize"), function(self, _cmd)
{ with(self)
{
    return _maxSize;
}
}), new objj_method(sel_getUid("setMaxSize:"), function(self, _cmd, aMaxSize)
{ with(self)
{
    _maxSize = CGSizeMakeCopy(aMaxSize);
    _minSize = CGSizeMake(MIN(_minSize.width, _maxSize.width), MIN(_minSize.height, _maxSize.height));
}
}), new objj_method(sel_getUid("visibilityPriority"), function(self, _cmd)
{ with(self)
{
    return _visibilityPriority;
}
}), new objj_method(sel_getUid("setVisibilityPriority:"), function(self, _cmd, aVisibilityPriority)
{ with(self)
{
    _visibilityPriority = aVisibilityPriority;
}
})]);
}
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbarItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    var copy = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithItemIdentifier:", _itemIdentifier);
    if (_view)
        objj_msgSend(copy, "setView:", objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", _view)));
    objj_msgSend(copy, "setLabel:", _label);
    objj_msgSend(copy, "setPaletteLabel:", _paletteLabel);
    objj_msgSend(copy, "setToolTip:", objj_msgSend(self, "toolTip"));
    objj_msgSend(copy, "setTag:", objj_msgSend(self, "tag"));
    objj_msgSend(copy, "setTarget:", objj_msgSend(self, "target"));
    objj_msgSend(copy, "setAction:", objj_msgSend(self, "action"));
    objj_msgSend(copy, "setEnabled:", objj_msgSend(self, "isEnabled"));
    objj_msgSend(copy, "setImage:", _image);
    objj_msgSend(copy, "setAlternateImage:", _alternateImage);
    objj_msgSend(copy, "setMinSize:", _minSize);
    objj_msgSend(copy, "setMaxSize:", _maxSize);
    objj_msgSend(copy, "setVisibilityPriority:", _visibilityPriority);
    return copy;
}
})]);
}
var _CPToolbarSeparatorItemView = nil,
    _CPToolbarSpaceItemView = nil;
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbarItem\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("_separatorItemView"), function(self, _cmd)
{ with(self)
{
    if (!_CPToolbarSeparatorItemView)
    {
        _CPToolbarSeparatorItemView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 2.0, 32.0));
        sizes = {};
        sizes["CPToolbarItemSeparator"] = [CGSizeMake(2.0, 26.0), CGSizeMake(2.0, 1.0), CGSizeMake(2.0, 26.0)];
        objj_msgSend(_CPToolbarSeparatorItemView, "setBackgroundColor:", _CPControlThreePartImagePattern(YES, sizes, "CPToolbarItem", "Separator"));
    }
    return _CPToolbarSeparatorItemView;
}
}), new objj_method(sel_getUid("_spaceItemView"), function(self, _cmd)
{ with(self)
{
    if (!_CPToolbarSpaceItemView)
        _CPToolbarSpaceItemView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    return _CPToolbarSpaceItemView;
}
}), new objj_method(sel_getUid("_standardItemWithItemIdentifier:"), function(self, _cmd, anItemIdentifier)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPToolbarItem, "alloc"), "initWithItemIdentifier:", anItemIdentifier);
    switch (anItemIdentifier)
    {
        case CPToolbarSeparatorItemIdentifier: objj_msgSend(item, "setView:", objj_msgSend(self, "_separatorItemView"));
                                                        objj_msgSend(item, "setMinSize:", CGSizeMake(2.0, 0.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(2.0, 100000.0));
                                                        return item;
        case CPToolbarSpaceItemIdentifier: objj_msgSend(item, "setView:", objj_msgSend(self, "_spaceItemView"));
                                                        objj_msgSend(item, "setMinSize:", CGSizeMake(32.0, 32.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(32.0, 32.0));
                                                        return item;
        case CPToolbarFlexibleSpaceItemIdentifier: objj_msgSend(item, "setView:", objj_msgSend(self, "_spaceItemView"));
                                                        objj_msgSend(item, "setMinSize:", CGSizeMake(32.0, 32.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(10000.0, 32.0));
                                                        return item;
        case CPToolbarShowColorsItemIdentifier: return nil;
        case CPToolbarShowFontsItemIdentifier: return nil;
        case CPToolbarCustomizeToolbarItemIdentifier: return nil;
        case CPToolbarPrintItemIdentifier: return nil;
    }
    return nil;
}
})]);
}

p;8;CPView.jI;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;45009;
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
var _CPViewNotificationCenter = nil,
    _CachedThemedAttributes = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_superview"), new objj_ivar("_subviews"), new objj_ivar("_graphicsContext"), new objj_ivar("_tag"), new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_boundsTransform"), new objj_ivar("_inverseBoundsTransform"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_isHidden"), new objj_ivar("_hitTests"), new objj_ivar("_postsFrameChangedNotifications"), new objj_ivar("_postsBoundsChangedNotifications"), new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"), new objj_ivar("_displayHash"), new objj_ivar("_dirtyRect"), new objj_ivar("_opacity"), new objj_ivar("_backgroundColor"), new objj_ivar("_autoresizesSubviews"), new objj_ivar("_autoresizingMask"), new objj_ivar("_layer"), new objj_ivar("_wantsLayer"), new objj_ivar("_isInFullScreenMode"), new objj_ivar("_fullScreenModeState"), new objj_ivar("_needsLayout"), new objj_ivar("_ephemeralSubviews"), new objj_ivar("_theme"), new objj_ivar("_themedAttributes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:", CGRectMakeZero());
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        var width = (aFrame.size.width),
            height = (aFrame.size.height);
        _subviews = [];
        _registeredDraggedTypes = objj_msgSend(CPSet, "set");
        _registeredDraggedTypesArray = [];
        _tag = -1;
        _frame = { origin: { x:aFrame.origin.x, y:aFrame.origin.y }, size: { width:aFrame.size.width, height:aFrame.size.height } };
        _bounds = { origin: { x:0.0, y:0.0 }, size: { width:width, height:height } };
        _autoresizingMask = CPViewNotSizable;
        _autoresizesSubviews = YES;
        _opacity = 1.0;
        _isHidden = NO;
        _hitTests = YES;
        _displayHash = objj_msgSend(self, "hash");
        _theme = objj_msgSend(CPTheme, "defaultTheme");
        _themedAttributes = {};
        objj_msgSend(self, "_loadThemedAttributes");
    }
    return self;
}
}), new objj_method(sel_getUid("superview"), function(self, _cmd)
{ with(self)
{
    return _superview;
}
}), new objj_method(sel_getUid("subviews"), function(self, _cmd)
{ with(self)
{
    return _subviews;
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("addSubview:"), function(self, _cmd, aSubview)
{ with(self)
{
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, CPNotFound);
}
}), new objj_method(sel_getUid("addSubview:positioned:relativeTo:"), function(self, _cmd, aSubview, anOrderingMode, anotherView)
{ with(self)
{
    var index = anotherView ? objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", anotherView) : CPNotFound;
    if (index === CPNotFound)
        index = (anOrderingMode === CPWindowAbove) ? objj_msgSend(_subviews, "count") : 0;
    else if (anOrderingMode === CPWindowAbove)
        ++index;
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, index);
}
}), new objj_method(sel_getUid("_insertSubview:atIndex:"), function(self, _cmd, aSubview, anIndex)
{ with(self)
{
    var count = _subviews.length;
    if (aSubview._superview == self)
    {
        var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
        if (index === anIndex || index === count - 1 && anIndex === count)
            return;
        objj_msgSend(_subviews, "removeObjectAtIndex:", index);
        if (anIndex > index)
            --anIndex;
        --count;
    }
    else
    {
        objj_msgSend(aSubview, "removeFromSuperview");
        objj_msgSend(aSubview, "_setWindow:", _window);
        objj_msgSend(aSubview, "viewWillMoveToSuperview:", self);
        aSubview._superview = self;
    }
    if (anIndex === CPNotFound || anIndex >= count)
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
}), new objj_method(sel_getUid("didAddSubview:"), function(self, _cmd, aSubview)
{ with(self)
{
}
}), new objj_method(sel_getUid("removeFromSuperview"), function(self, _cmd)
{ with(self)
{
    if (!_superview)
        return;
    objj_msgSend(_superview, "willRemoveSubview:", self);
    objj_msgSend(objj_msgSend(_superview, "subviews"), "removeObject:", self);
    _superview = nil;
    objj_msgSend(self, "_setWindow:", nil);
}
}), new objj_method(sel_getUid("replaceSubview:with:"), function(self, _cmd, aSubview, aView)
{ with(self)
{
    if (aSubview._superview != self)
        return;
    var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
    objj_msgSend(aSubview, "removeFromSuperview");
    objj_msgSend(self, "_insertSubview:atIndex:", aView, index);
}
}), new objj_method(sel_getUid("_setWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    if (_window === aWindow)
        return;
    if (objj_msgSend(_window, "firstResponder") === self)
        objj_msgSend(_window, "makeFirstResponder:", nil);
    objj_msgSend(self, "viewWillMoveToWindow:", aWindow);
    if (_registeredDraggedTypes)
    {
        objj_msgSend(_window, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
        objj_msgSend(aWindow, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    }
    _window = aWindow;
    var count = objj_msgSend(_subviews, "count");
    while (count--)
        objj_msgSend(_subviews[count], "_setWindow:", aWindow);
    objj_msgSend(self, "viewDidMoveToWindow");
}
}), new objj_method(sel_getUid("isDescendantOf:"), function(self, _cmd, aView)
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
}), new objj_method(sel_getUid("viewDidMoveToSuperview"), function(self, _cmd)
{ with(self)
{
        objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function(self, _cmd, aView)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillMoveToWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
}
}), new objj_method(sel_getUid("willRemoveSubview:"), function(self, _cmd, aView)
{ with(self)
{
}
}), new objj_method(sel_getUid("enclosingMenuItem"), function(self, _cmd)
{ with(self)
{
    var view = self;
    while (!objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPMenuItemView, "class")))
        view = objj_msgSend(view, "superview");
    if (view)
        return view._menuItem;
    return nil;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    return _tag;
}
}), new objj_method(sel_getUid("isFlipped"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setFrame:"), function(self, _cmd, aFrame)
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
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    return { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } };
}
}), new objj_method(sel_getUid("setCenter:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "setFrameOrigin:", CGPointMake(aPoint.x - _frame.size.width / 2.0, aPoint.y - _frame.size.height / 2.0));
}
}), new objj_method(sel_getUid("center"), function(self, _cmd)
{ with(self)
{
    return CGPointMake(_frame.size.width / 2.0 + _frame.origin.x, _frame.size.height / 2.0 + _frame.origin.y);
}
}), new objj_method(sel_getUid("setFrameOrigin:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
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
    if (_layer)
        objj_msgSend(_layer, "_owningViewBoundsChanged");
    if (_autoresizesSubviews)
        objj_msgSend(self, "resizeSubviewsWithOldSize:", oldSize);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("setBounds:"), function(self, _cmd, bounds)
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
}), new objj_method(sel_getUid("bounds"), function(self, _cmd)
{ with(self)
{
    return { origin: { x:_bounds.origin.x, y:_bounds.origin.y }, size: { width:_bounds.size.width, height:_bounds.size.height } };
}
}), new objj_method(sel_getUid("setBoundsOrigin:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("setBoundsSize:"), function(self, _cmd, aSize)
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
}), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var mask = objj_msgSend(self, "autoresizingMask");
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
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var count = _subviews.length;
    while (count--)
        objj_msgSend(_subviews[count], "resizeWithOldSuperviewSize:", aSize);
}
}), new objj_method(sel_getUid("setAutoresizesSubviews:"), function(self, _cmd, aFlag)
{ with(self)
{
    _autoresizesSubviews = aFlag;
}
}), new objj_method(sel_getUid("autoresizesSubviews"), function(self, _cmd)
{ with(self)
{
    return _autoresizesSubviews;
}
}), new objj_method(sel_getUid("setAutoresizingMask:"), function(self, _cmd, aMask)
{ with(self)
{
    _autoresizingMask = aMask;
}
}), new objj_method(sel_getUid("autoresizingMask"), function(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
}), new objj_method(sel_getUid("enterFullScreenMode"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "enterFullScreenMode:withOptions:", nil, nil);
}
}), new objj_method(sel_getUid("enterFullScreenMode:withOptions:"), function(self, _cmd, aScreen, options)
{ with(self)
{
    _fullScreenModeState = _CPViewFullScreenModeStateMake(self);
    var fullScreenWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), CPBorderlessWindowMask);
    objj_msgSend(fullScreenWindow, "setLevel:", CPScreenSaverWindowLevel);
    objj_msgSend(fullScreenWindow, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    var contentView = objj_msgSend(fullScreenWindow, "contentView");
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(contentView, "addSubview:", self);
    objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self, "setFrame:", CGRectMakeCopy(objj_msgSend(contentView, "bounds")));
    objj_msgSend(fullScreenWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(fullScreenWindow, "makeFirstResponder:", self);
    _isInFullScreenMode = YES;
    return YES;
}
}), new objj_method(sel_getUid("exitFullScreenMode"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "exitFullScreenModeWithOptions:", nil);
}
}), new objj_method(sel_getUid("exitFullScreenModeWithOptions:"), function(self, _cmd, options)
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
}), new objj_method(sel_getUid("isInFullScreenMode"), function(self, _cmd)
{ with(self)
{
    return _isInFullScreenMode;
}
}), new objj_method(sel_getUid("setHidden:"), function(self, _cmd, aFlag)
{ with(self)
{
    if(_isHidden == aFlag)
        return;
    _isHidden = aFlag;
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("setAlphaValue:"), function(self, _cmd, anAlphaValue)
{ with(self)
{
    if (_opacity == anAlphaValue)
        return;
    _opacity = anAlphaValue;
}
}), new objj_method(sel_getUid("alphaValue"), function(self, _cmd)
{ with(self)
{
    return _opacity;
}
}), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function(self, _cmd)
{ with(self)
{
    var view = self;
    while (view && !objj_msgSend(view, "isHidden"))
        view = objj_msgSend(view, "superview");
    return view !== nil;
}
}), new objj_method(sel_getUid("acceptsFirstMouse:"), function(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("hitTests"), function(self, _cmd)
{ with(self)
{
    return _hitTests;
}
}), new objj_method(sel_getUid("setHitTests:"), function(self, _cmd, shouldHitTest)
{ with(self)
{
    _hitTests = shouldHitTest;
}
}), new objj_method(sel_getUid("hitTest:"), function(self, _cmd, aPoint)
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
}), new objj_method(sel_getUid("mouseDownCanMoveWindow"), function(self, _cmd)
{ with(self)
{
    return !objj_msgSend(self, "isOpaque");
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "mouseDownCanMoveWindow"))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("setBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_backgroundColor == aColor)
        return;
    _backgroundColor = aColor;
}
}), new objj_method(sel_getUid("backgroundColor"), function(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
}), new objj_method(sel_getUid("convertPoint:fromView:"), function(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertPoint:toView:"), function(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("convertSize:fromView:"), function(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertSize:toView:"), function(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("convertRect:fromView:"), function(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertRect:toView:"), function(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("setPostsFrameChangedNotifications:"), function(self, _cmd, shouldPostFrameChangedNotifications)
{ with(self)
{
    if (_postsFrameChangedNotifications == shouldPostFrameChangedNotifications)
        return;
    _postsFrameChangedNotifications = shouldPostFrameChangedNotifications;
    if (_postsFrameChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("postsFrameChangedNotifications"), function(self, _cmd)
{ with(self)
{
    return _postsFrameChangedNotifications;
}
}), new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"), function(self, _cmd, shouldPostBoundsChangedNotifications)
{ with(self)
{
    if (_postsBoundsChangedNotifications == shouldPostBoundsChangedNotifications)
        return;
    _postsBoundsChangedNotifications = shouldPostBoundsChangedNotifications;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("postsBoundsChangedNotifications"), function(self, _cmd)
{ with(self)
{
    return _postsBoundsChangedNotifications;
}
}), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, anImage, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragImage:at:offset:event:pasteboard:source:slideBack:", anImage, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, aView, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragView:at:offset:event:pasteboard:source:slideBack:", aView, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("registerForDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    var theWindow = objj_msgSend(self, "window");
    objj_msgSend(theWindow, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    objj_msgSend(_registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes)
    objj_msgSend(theWindow, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypesArray = nil;
}
}), new objj_method(sel_getUid("registeredDraggedTypes"), function(self, _cmd)
{ with(self)
{
    if (!_registeredDraggedTypesArray)
        _registeredDraggedTypesArray = objj_msgSend(_registeredDraggedTypes, "allObjects");
    return _registeredDraggedTypesArray;
}
}), new objj_method(sel_getUid("unregisterDraggedTypes"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypes = objj_msgSend(CPSet, "set");
    _registeredDraggedTypesArray = [];
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, aRect)
{ with(self)
{
}
}), new objj_method(sel_getUid("setNeedsDisplay:"), function(self, _cmd, aFlag)
{ with(self)
{
    if (aFlag)
        objj_msgSend(self, "setNeedsDisplayInRect:", objj_msgSend(self, "bounds"));
}
}), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function(self, _cmd, aRect)
{ with(self)
{
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0))
        return;
    if (_dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0))
        _dirtyRect = CGRectUnion(aRect, _dirtyRect);
    else
        _dirtyRect = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
}
}), new objj_method(sel_getUid("needsDisplay"), function(self, _cmd)
{ with(self)
{
    return _dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0);
}
}), new objj_method(sel_getUid("displayIfNeeded"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", _dirtyRect);
}
}), new objj_method(sel_getUid("display"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "displayRect:", objj_msgSend(self, "visibleRect"));
}
}), new objj_method(sel_getUid("displayIfNeededInRect:"), function(self, _cmd, aRect)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", aRect);
}
}), new objj_method(sel_getUid("displayRect:"), function(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "viewWillDraw");
    objj_msgSend(self, "displayRectIgnoringOpacity:inContext:", aRect, nil);
    _dirtyRect = NULL;
}
}), new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"), function(self, _cmd, aRect, aGraphicsContext)
{ with(self)
{
    objj_msgSend(self, "lockFocus");
    CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"), aRect);
    objj_msgSend(self, "drawRect:", aRect);
    objj_msgSend(self, "unlockFocus");
}
}), new objj_method(sel_getUid("viewWillDraw"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("lockFocus"), function(self, _cmd)
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
}), new objj_method(sel_getUid("unlockFocus"), function(self, _cmd)
{ with(self)
{
    CGContextRestoreGState(objj_msgSend(_graphicsContext, "graphicsPort"));
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", nil);
}
}), new objj_method(sel_getUid("setNeedsLayout"), function(self, _cmd)
{ with(self)
{
    _needsLayout = YES;
}
}), new objj_method(sel_getUid("layoutIfNeeded"), function(self, _cmd)
{ with(self)
{
    if (_needsLayout)
    {
        _needsLayout = NO;
        objj_msgSend(self, "layoutSubviews");
    }
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("isOpaque"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("visibleRect"), function(self, _cmd)
{ with(self)
{
    if (!_superview)
        return _bounds;
    return CGRectIntersection(objj_msgSend(self, "convertRect:fromView:", objj_msgSend(_superview, "visibleRect"), _superview), _bounds);
}
}), new objj_method(sel_getUid("_enclosingClipView"), function(self, _cmd)
{ with(self)
{
    var superview = _superview,
        clipViewClass = objj_msgSend(CPClipView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", clipViewClass))
        superview = superview._superview;
    return superview;
}
}), new objj_method(sel_getUid("scrollPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var clipView = objj_msgSend(self, "_enclosingClipView");
    if (!clipView)
        return;
    objj_msgSend(clipView, "scrollToPoint:", objj_msgSend(self, "convertPoint:toView:", aPoint, clipView));
}
}), new objj_method(sel_getUid("scrollRectToVisible:"), function(self, _cmd, aRect)
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
    objj_msgSend(enclosingClipView, "scrollToPoint:", CGPointMake(scrollPoint.x, scrollPoint.y));
    return YES;
}
}), new objj_method(sel_getUid("autoscroll:"), function(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("adjustScroll:"), function(self, _cmd, proposedVisibleRect)
{ with(self)
{
    return proposedVisibleRect;
}
}), new objj_method(sel_getUid("scrollRect:by:"), function(self, _cmd, aRect, anAmount)
{ with(self)
{
}
}), new objj_method(sel_getUid("enclosingScrollView"), function(self, _cmd)
{ with(self)
{
    var superview = _superview,
        scrollViewClass = objj_msgSend(CPScrollView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", scrollViewClass))
        superview = superview._superview;
    return superview;
}
}), new objj_method(sel_getUid("scrollClipView:toPoint:"), function(self, _cmd, aClipView, aPoint)
{ with(self)
{
    objj_msgSend(aClipView, "scrollToPoint:", aPoint);
}
}), new objj_method(sel_getUid("reflectScrolledClipView:"), function(self, _cmd, aClipView)
{ with(self)
{
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPView, "class"))
        return;
    _CPViewNotificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setLayer:"), function(self, _cmd, aLayer)
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
}), new objj_method(sel_getUid("layer"), function(self, _cmd)
{ with(self)
{
    return _layer;
}
}), new objj_method(sel_getUid("setWantsLayer:"), function(self, _cmd, aFlag)
{ with(self)
{
    _wantsLayer = aFlag;
}
}), new objj_method(sel_getUid("wantsLayer"), function(self, _cmd)
{ with(self)
{
    return _wantsLayer;
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_loadThemedAttributes"), function(self, _cmd)
{ with(self)
{
    var theme = objj_msgSend(self, "theme"),
        theClass = objj_msgSend(self, "class"),
        attributes = objj_msgSend(theClass, "_themedAttributes");
        count = attributes.length;
    while (count--)
    {
        var attributeName = attributes[count--];
        _themedAttributes[attributeName] = CPThemedAttributeMake(attributeName, attributes[count], theme, theClass);
    }
}
}), new objj_method(sel_getUid("setTheme:"), function(self, _cmd, aTheme)
{ with(self)
{
    if (_theme === aTheme)
        return;
    _theme = aTheme;
    objj_msgSend(self, "viewDidChangeTheme");
}
}), new objj_method(sel_getUid("theme"), function(self, _cmd)
{ with(self)
{
    return _theme;
}
}), new objj_method(sel_getUid("viewDidChangeTheme"), function(self, _cmd)
{ with(self)
{
    var theme = objj_msgSend(self, "theme");
    for (var attributeName in _themedAttributes)
        if (_themedAttributes.hasOwnProperty(attributeName))
            objj_msgSend(_themedAttributes[attributeName], "setTheme:", theme);
}
}), new objj_method(sel_getUid("_themedAttributes"), function(self, _cmd)
{ with(self)
{
    var dictionary = objj_msgSend(CPDictionary, "dictionary");
    for (var attributeName in _themedAttributes)
        if (_themedAttributes.hasOwnProperty(attributeName))
            objj_msgSend(dictionary, "setObject:forKey:", _themedAttributes[attributeName], attributeName);
    return dictionary;
}
}), new objj_method(sel_getUid("setValue:forThemedAttributeName:inControlState:"), function(self, _cmd, aValue, aName, aControlState)
{ with(self)
{
    var attribute = _themedAttributes[aName];
    if (!attribute)
        return;
    var currentValue = objj_msgSend(self, "currentValueForThemedAttributeName:", aName);
    objj_msgSend(attribute, "setValue:forControlState:", aValue, aControlState);
    if (objj_msgSend(self, "currentValueForThemedAttributeName:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("setValue:forThemedAttributeName:"), function(self, _cmd, aValue, aName)
{ with(self)
{
    var attribute = _themedAttributes[aName];
    if (!attribute)
        return;
    var currentValue = objj_msgSend(self, "currentValueForThemedAttributeName:", aName);
    objj_msgSend(attribute, "setValue:", aValue);
    if (objj_msgSend(self, "currentValueForThemedAttributeName:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("valueForThemedAttributeName:inControlState:"), function(self, _cmd, aName, aControlState)
{ with(self)
{
    return objj_msgSend(_themedAttributes[aName], "valueForControlState:", aControlState);
}
}), new objj_method(sel_getUid("valueForThemedAttributeName:"), function(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(_themedAttributes[aName], "value");
}
}), new objj_method(sel_getUid("currentValueForThemedAttributeName:"), function(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(_themedAttributes[aName], "valueForControlState:", _controlState);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("_themedAttributes"), function(self, _cmd)
{ with(self)
{
    if (!_CachedThemedAttributes)
        _CachedThemedAttributes = {};
    var theClass = objj_msgSend(self, "class"),
        CPViewClass = objj_msgSend(CPView, "class"),
        attributes = [];
    while (theClass && theClass !== CPViewClass)
    {
        var cachedAttributes = _CachedThemedAttributes[class_getName(theClass)];
        if (cachedAttributes)
        {
            attributes = attributes.length ? attributes.concat(cachedAttributes) : attributes;
            _CachedThemedAttributes[objj_msgSend(self, "className")] = attributes;
            break;
        }
        var attributeDictionary = objj_msgSend(theClass, "themedAttributes");
        if (attributeDictionary)
        {
            var attributeKeys = objj_msgSend(attributeDictionary, "allKeys"),
                attributeCount = attributeKeys.length;
            while (attributeCount--)
            {
                var attributeName = attributeKeys[attributeCount];
                attributes.push(objj_msgSend(attributeDictionary, "objectForKey:", attributeName));
                attributes.push(attributeName);
            }
        }
        theClass = objj_msgSend(theClass, "superclass");
    }
    return attributes;
}
})]);
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
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
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
        _autoresizingMask = objj_msgSend(aCoder, "decodeIntForKey:", CPViewAutoresizingMaskKey) || 0;
        _autoresizesSubviews = objj_msgSend(aCoder, "decodeBoolForKey:", CPViewAutoresizesSubviewsKey);
        _hitTests = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewHitTestsKey);
        _isHidden = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewIsHiddenKey);
        _opacity = objj_msgSend(aCoder, "decodeIntForKey:", CPViewOpacityKey);
        _displayHash = objj_msgSend(self, "hash");
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPViewBackgroundColorKey));
        _theme = objj_msgSend(CPTheme, "defaultTheme");
        _themedAttributes = {};
        var theClass = objj_msgSend(self, "class"),
            attributes = objj_msgSend(theClass, "_themedAttributes"),
            count = attributes.length;
        while (count--)
        {
            var attributeName = attributes[count--];
            _themedAttributes[attributeName] = CPThemedAttributeDecode(aCoder, attributeName, attributes[count], _theme, theClass);
        }
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
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
    for (var attributeName in _themedAttributes)
        if (_themedAttributes.hasOwnProperty(attributeName))
            CPThemedAttributeEncode(aCoder, _themedAttributes[attributeName]);
}
})]);
}
var _CPViewFullScreenModeStateMake = function(aView)
{
    var superview = aView._superview;
    return { autoresizingMask:aView._autoresizingMask, frame:CGRectMakeCopy(aView._frame), index:(superview ? objj_msgSend(superview._subviews, "indexOfObjectIdenticalTo:", aView) : 0), superview:superview };
}
var _CPViewGetTransform = function( fromView, toView)
{
    var transform = CGAffineTransformMakeIdentity(),
        sameWindow = YES,
        fromWindow = nil,
        toWindow = nil;
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
        if (view === toView)
            return transform;
        else if (fromView && toView)
        {
            fromWindow = objj_msgSend(fromView, "window");
            toWindow = objj_msgSend(toView, "window");
            if (fromWindow && toWindow && fromWindow !== toWindow)
            {
                sameWindow = NO;
                var frame = objj_msgSend(fromWindow, "frame");
                transform.tx += (frame.origin.x);
                transform.ty += (frame.origin.y);
            }
        }
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
    if (!sameWindow)
    {
        var frame = objj_msgSend(toWindow, "frame");
        transform.tx -= (frame.origin.x);
        transform.ty -= (frame.origin.y);
    }
    return transform;
}

p;11;CPWebView.jI;15;AppKit/CPView.jc;15931;
CPWebViewProgressStartedNotification = "CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification = "CPWebViewProgressFinishedNotification";
CPWebViewScrollAppKit = 1;
CPWebViewScrollNative = 2;
{var the_class = objj_allocateClassPair(CPView, "CPWebView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_scrollView"), new objj_ivar("_frameView"), new objj_ivar("_iframe"), new objj_ivar("_mainFrameURL"), new objj_ivar("_backwardStack"), new objj_ivar("_forwardStack"), new objj_ivar("_ignoreLoadStart"), new objj_ivar("_ignoreLoadEnd"), new objj_ivar("_downloadDelegate"), new objj_ivar("_frameLoadDelegate"), new objj_ivar("_policyDelegate"), new objj_ivar("_resourceLoadDelegate"), new objj_ivar("_UIDelegate"), new objj_ivar("_wso"), new objj_ivar("_url"), new objj_ivar("_html"), new objj_ivar("_loadCallback"), new objj_ivar("_scrollMode"), new objj_ivar("_scrollSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:frameName:groupName:"), function(self, _cmd, frameRect, frameName, groupName)
{ with(self)
{
    if (self = objj_msgSend(self, "initWithFrame:", frameRect))
    {
        _iframe.name = frameName;
    }
    return self
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame))
    {
        _mainFrameURL = nil;
        _backwardStack = [];
        _forwardStack = [];
        _scrollMode = CPWebViewScrollNative;
        objj_msgSend(self, "_initDOMWithFrame:", aFrame);
    }
    return self;
}
}), new objj_method(sel_getUid("_initDOMWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = YES;
    _iframe = document.createElement("iframe");
    _iframe.name = "iframe_" + Math.floor(Math.random()*10000);
    _iframe.style.width = "100%";
    _iframe.style.height = "100%";
    _iframe.style.borderWidth = "0px";
    objj_msgSend(self, "setDrawsBackground:", YES);
    _loadCallback = function() {
     if (!_ignoreLoadStart)
     {
         objj_msgSend(self, "_startedLoading");
         if (_mainFrameURL)
             objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
            _mainFrameURL = _iframe.src;
            _mainFrameURL = _iframe.src;
         objj_msgSend(_forwardStack, "removeAllObjects");
     }
     else
            _ignoreLoadStart = NO;
     if (!_ignoreLoadEnd)
     {
            objj_msgSend(self, "_finishedLoading");
     }
     else
         _ignoreLoadEnd = NO;
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
 }
 if (_iframe.addEventListener)
     _iframe.addEventListener("load", _loadCallback, false);
 else if (_iframe.attachEvent)
  _iframe.attachEvent("onload", _loadCallback);
    _frameView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    _scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(_scrollView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    objj_msgSend(_scrollView, "setDocumentView:", _frameView);
    _frameView._DOMElement.appendChild(_iframe);
    objj_msgSend(self, "_setScrollMode:", _scrollMode);
    objj_msgSend(self, "addSubview:", _scrollView);
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "_resizeWebFrame");
}
}), new objj_method(sel_getUid("_resizeWebFrame"), function(self, _cmd)
{ with(self)
{
    if (_scrollMode === CPWebViewScrollAppKit)
    {
        if (_scrollSize)
        {
            objj_msgSend(_frameView, "setFrameSize:", _scrollSize);
        }
        else
        {
            objj_msgSend(_frameView, "setFrameSize:", objj_msgSend(_scrollView, "bounds").size);
            var win = null;
            try { win = objj_msgSend(self, "window"); } catch (e) {}
            if (win && win.document)
            {
                var width = win.document.body.scrollWidth,
                    height = win.document.body.scrollHeight;
                _iframe.setAttribute("width", width);
                _iframe.setAttribute("height", height);
                objj_msgSend(_frameView, "setFrameSize:", CGSizeMake(width, height));
            }
            else
            {
                CPLog.warn("using default size 800*1600");
                objj_msgSend(_frameView, "setFrameSize:", CGSizeMake(800, 1600));
            }
        }
    }
}
}), new objj_method(sel_getUid("setScrollMode:"), function(self, _cmd, aScrollMode)
{ with(self)
{
    if (_scrollMode == aScrollMode)
        return;
    objj_msgSend(self, "_setScrollMode:", aScrollMode);
}
}), new objj_method(sel_getUid("_setScrollMode:"), function(self, _cmd, aScrollMode)
{ with(self)
{
    _scrollMode = aScrollMode;
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = YES;
    var parent = _iframe.parentNode;
    parent.removeChild(_iframe);
    if (_scrollMode === CPWebViewScrollAppKit)
    {
        objj_msgSend(_scrollView, "setHasHorizontalScroller:", YES);
        objj_msgSend(_scrollView, "setHasVerticalScroller:", YES);
        _iframe.setAttribute("scrolling", "no");
    }
    else
    {
        objj_msgSend(_scrollView, "setHasHorizontalScroller:", NO);
        objj_msgSend(_scrollView, "setHasVerticalScroller:", NO);
        _iframe.setAttribute("scrolling", "auto");
        objj_msgSend(_frameView, "setFrameSize:", objj_msgSend(_scrollView, "bounds").size);
    }
    parent.appendChild(_iframe);
}
}), new objj_method(sel_getUid("loadHTMLString:"), function(self, _cmd, aString)
{ with(self)
{
    objj_msgSend(self, "loadHTMLString:baseURL:", aString, nil);
}
}), new objj_method(sel_getUid("loadHTMLString:baseURL:"), function(self, _cmd, aString, URL)
{ with(self)
{
    objj_msgSend(self, "_setScrollMode:", CPWebViewScrollAppKit);
    objj_msgSend(self, "_startedLoading");
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = NO;
    _url = null;
    _html = aString;
    objj_msgSend(self, "_load");
}
}), new objj_method(sel_getUid("_loadMainFrameURL"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_setScrollMode:", CPWebViewScrollNative);
    objj_msgSend(self, "_startedLoading");
    _ignoreLoadStart = YES;
    _ignoreLoadEnd = NO;
    _url = _mainFrameURL;
    _html = null;
    objj_msgSend(self, "_load");
}
}), new objj_method(sel_getUid("_load"), function(self, _cmd)
{ with(self)
{
    if (_url)
    {
        _iframe.src = _url;
    }
    else if (_html)
    {
        _iframe.src = "";
        window.setTimeout(function() {
            var win = objj_msgSend(self, "window");
            win.document.write(_html);
            window.setTimeout(_loadCallback, 1);
        }, 0);
    }
}
}), new objj_method(sel_getUid("_startedLoading"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressStartedNotification, self);
    if (objj_msgSend(_frameLoadDelegate, "respondsToSelector:", sel_getUid("webView:didStartProvisionalLoadForFrame:")))
        objj_msgSend(_frameLoadDelegate, "webView:didStartProvisionalLoadForFrame:", self, nil);
}
}), new objj_method(sel_getUid("_finishedLoading"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_resizeWebFrame");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWebViewProgressFinishedNotification, self);
    if (objj_msgSend(_frameLoadDelegate, "respondsToSelector:", sel_getUid("webView:didFinishLoadForFrame:")))
        objj_msgSend(_frameLoadDelegate, "webView:didFinishLoadForFrame:", self, nil);
}
}), new objj_method(sel_getUid("mainFrameURL"), function(self, _cmd)
{ with(self)
{
    return _mainFrameURL;
}
}), new objj_method(sel_getUid("setMainFrameURL:"), function(self, _cmd, URLString)
{ with(self)
{
    if (_mainFrameURL)
        objj_msgSend(_backwardStack, "addObject:", _mainFrameURL);
    _mainFrameURL = URLString;
    objj_msgSend(_forwardStack, "removeAllObjects");
    objj_msgSend(self, "_loadMainFrameURL");
}
}), new objj_method(sel_getUid("goBack"), function(self, _cmd)
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
}), new objj_method(sel_getUid("goForward"), function(self, _cmd)
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
}), new objj_method(sel_getUid("canGoBack"), function(self, _cmd)
{ with(self)
{
    return (_backwardStack.length > 0);
}
}), new objj_method(sel_getUid("canGoForward"), function(self, _cmd)
{ with(self)
{
    return (_forwardStack.length > 0);
}
}), new objj_method(sel_getUid("backForwardList"), function(self, _cmd)
{ with(self)
{
    return { back: _backwardStack, forward: _forwardStack };
}
}), new objj_method(sel_getUid("close"), function(self, _cmd)
{ with(self)
{
    _iframe.parentNode.removeChild(_iframe);
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    return (_iframe.contentDocument && _iframe.contentDocument.defaultView) || _iframe.contentWindow;
}
}), new objj_method(sel_getUid("windowScriptObject"), function(self, _cmd)
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
}), new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"), function(self, _cmd, script)
{ with(self)
{
    var result = objj_msgSend(self, "objectByEvaluatingJavaScriptFromString:", script);
    return result ? String(result) : nil;
}
}), new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"), function(self, _cmd, script)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "windowScriptObject"), "evaluateWebScript:", script);
}
}), new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"), function(self, _cmd, element, pseudoElement)
{ with(self)
{
    var win = objj_msgSend(objj_msgSend(self, "windowScriptObject"), "window");
    if (win)
    {
        return win.document.defaultView.getComputedStyle(element, pseudoElement);
    }
    return nil;
}
}), new objj_method(sel_getUid("drawsBackground"), function(self, _cmd)
{ with(self)
{
    return _iframe.style.backgroundColor != "";
}
}), new objj_method(sel_getUid("setDrawsBackground:"), function(self, _cmd, drawsBackround)
{ with(self)
{
    _iframe.style.backgroundColor = drawsBackround ? "white" : "";
}
}), new objj_method(sel_getUid("takeStringURLFrom:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "setMainFrameURL:", objj_msgSend(sender, "stringValue"));
}
}), new objj_method(sel_getUid("goBack:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "goBack");
}
}), new objj_method(sel_getUid("goForward:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "goForward");
}
}), new objj_method(sel_getUid("stopLoading:"), function(self, _cmd, sender)
{ with(self)
{
}
}), new objj_method(sel_getUid("reload:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "_loadMainFrameURL");
}
}), new objj_method(sel_getUid("print:"), function(self, _cmd, sender)
{ with(self)
{
    try
    {
        objj_msgSend(self, "window").print();
    }
    catch (e)
    {
        alert('Please click the webpage and select "Print" from the "File" menu');
    }
}
}), new objj_method(sel_getUid("downloadDelegate"), function(self, _cmd)
{ with(self)
{
    return _downloadDelegate;
}
}), new objj_method(sel_getUid("setDownloadDelegate:"), function(self, _cmd, anObject)
{ with(self)
{
    _downloadDelegate = anObject;
}
}), new objj_method(sel_getUid("frameLoadDelegate"), function(self, _cmd)
{ with(self)
{
    return _frameLoadDelegate;
}
}), new objj_method(sel_getUid("setFrameLoadDelegate:"), function(self, _cmd, anObject)
{ with(self)
{
    _frameLoadDelegate = anObject;
}
}), new objj_method(sel_getUid("policyDelegate"), function(self, _cmd)
{ with(self)
{
    return _policyDelegate;
}
}), new objj_method(sel_getUid("setPolicyDelegate:"), function(self, _cmd, anObject)
{ with(self)
{
    _policyDelegate = anObject;
}
}), new objj_method(sel_getUid("resourceLoadDelegate"), function(self, _cmd)
{ with(self)
{
    return _resourceLoadDelegate;
}
}), new objj_method(sel_getUid("setResourceLoadDelegate:"), function(self, _cmd, anObject)
{ with(self)
{
    _resourceLoadDelegate = anObject;
}
}), new objj_method(sel_getUid("UIDelegate"), function(self, _cmd)
{ with(self)
{
    return _UIDelegate;
}
}), new objj_method(sel_getUid("setUIDelegate:"), function(self, _cmd, anObject)
{ with(self)
{
    _UIDelegate = anObject;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPWebScriptObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _window = aWindow;
    }
    return self;
}
}), new objj_method(sel_getUid("callWebScriptMethod:withArguments:"), function(self, _cmd, methodName, args)
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
}), new objj_method(sel_getUid("evaluateWebScript:"), function(self, _cmd, script)
{ with(self)
{
    try {
        return _window.eval(script);
    } catch (e) {
    }
    return undefined;
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    return _window;
}
})]);
}
{
var the_class = objj_getClass("CPWebView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWebView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder);
    if (self)
    {
        _mainFrameURL = nil;
        _backwardStack = [];
        _forwardStack = [];
        _scrollMode = CPWebViewScrollNative;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
}
})]);
}

p;10;CPWindow.jI;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.jc;43562;
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
CPBackgroundWindowLevel = -1;
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
CPWindowDidMoveNotification = "CPWindowDidMoveNotification";
var SHADOW_MARGIN_LEFT = 20.0,
    SHADOW_MARGIN_RIGHT = 19.0,
    SHADOW_MARGIN_TOP = 10.0,
    SHADOW_MARGIN_BOTTOM = 10.0,
    SHADOW_DISTANCE = 5.0,
    _CPWindowShadowColor = nil;
var CPWindowSaveImage = nil,
    CPWindowSavingImage = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_windowNumber"), new objj_ivar("_styleMask"), new objj_ivar("_frame"), new objj_ivar("_level"), new objj_ivar("_isVisible"), new objj_ivar("_isAnimating"), new objj_ivar("_hasShadow"), new objj_ivar("_isMovableByWindowBackground"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isDocumentSaving"), new objj_ivar("_shadowView"), new objj_ivar("_windowView"), new objj_ivar("_contentView"), new objj_ivar("_toolbarView"), new objj_ivar("_mouseOverView"), new objj_ivar("_leftMouseDownView"), new objj_ivar("_rightMouseDownView"), new objj_ivar("_toolbar"), new objj_ivar("_firstResponder"), new objj_ivar("_delegate"), new objj_ivar("_title"), new objj_ivar("_acceptsMouseMovedEvents"), new objj_ivar("_ignoresMouseEvents"), new objj_ivar("_windowController"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_undoManager"), new objj_ivar("_representedURL"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_inclusiveRegisteredDraggedTypes"), new objj_ivar("_bridge"), new objj_ivar("_autoresizingMask"), new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"), new objj_ivar("_isFullBridge"), new objj_ivar("_fullBridgeSession")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    return objj_msgSend(self, "initWithContentRect:styleMask:bridge:", aContentRect, aStyleMask, nil);
}
}), new objj_method(sel_getUid("initWithContentRect:styleMask:bridge:"), function(self, _cmd, aContentRect, aStyleMask, aBridge)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _isFullBridge = NO;
        _registeredDraggedTypes = objj_msgSend(CPSet, "set");
        _registeredDraggedTypesArray = [];
        _windowNumber = objj_msgSend(CPApp._windows, "count");
        CPApp._windows[_windowNumber] = self;
        _styleMask = aStyleMask;
        _level = CPNormalWindowLevel;
        _minSize = CGSizeMake(0.0, 0.0);
        _maxSize = CGSizeMake(1000000.0, 1000000.0);
        var windowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", aStyleMask);
        _frame = objj_msgSend(windowViewClass, "frameRectForContentRect:", aContentRect);
        _windowView = objj_msgSend(objj_msgSend(windowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMake(0.0, 0.0, CGRectGetWidth(_frame), CGRectGetHeight(_frame)), aStyleMask);
        objj_msgSend(_windowView, "_setWindow:", self);
        objj_msgSend(_windowView, "setNextResponder:", self);
        objj_msgSend(self, "setMovableByWindowBackground:", aStyleMask & CPHUDBackgroundWindowMask);
        objj_msgSend(self, "setContentView:", objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero()));
        _firstResponder = self;
        objj_msgSend(self, "setBridge:", aBridge);
        objj_msgSend(self, "setNextResponder:", CPApp);
        objj_msgSend(self, "setHasShadow:", aStyleMask !== CPBorderlessWindowMask);
        if (aStyleMask & CPBorderlessBridgeWindowMask)
            objj_msgSend(self, "setFullBridge:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("_setWindowView:"), function(self, _cmd, aWindowView)
{ with(self)
{
    if (_windowView === aWindowView)
        return;
    var oldWindowView = _windowView;
    _windowView = aWindowView;
}
}), new objj_method(sel_getUid("setFullBridge:"), function(self, _cmd, shouldBeFullBridge)
{ with(self)
{
    shouldBeFullBridge = !!shouldBeFullBridge;
    if (_isFullBridge === shouldBeFullBridge)
        return;
    _isFullBridge = shouldBeFullBridge;
    if (_isFullBridge)
    {
        _fullBridgeSession = _CPWindowFullBridgeSessionMake(_windowView, objj_msgSend(self, "contentRectForFrameRect:", objj_msgSend(self, "frame")), objj_msgSend(self, "hasShadow"), objj_msgSend(self, "level"));
        var fullBridgeWindowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForFullBridgeStyleMask:", _styleMask),
            windowView = objj_msgSend(objj_msgSend(fullBridgeWindowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMakeZero(), _styleMask);
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", CPBackgroundWindowLevel);
        objj_msgSend(self, "setHasShadow:", NO);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable | CPWindowHeightSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(_bridge, "visibleFrame"));
    }
    else
    {
        var windowView = _fullBridgeSession.windowView;
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", _fullBridgeSession.level);
        objj_msgSend(self, "setHasShadow:", _fullBridgeSession.hasShadow);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowNotSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(windowView, "frameRectForContentRect:", _fullBridgeSession.contentRect));
    }
}
}), new objj_method(sel_getUid("isFullBridge"), function(self, _cmd)
{ with(self)
{
    return _isFullBridge;
}
}), new objj_method(sel_getUid("styleMask"), function(self, _cmd)
{ with(self)
{
    return _styleMask;
}
}), new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(_windowView, "contentRectForFrameRect:", aFrame);
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    return objj_msgSend(_windowView, "frameRectForContentRect:", aContentRect);
}
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    return _frame;
}
}), new objj_method(sel_getUid("setFrame:display:animate:"), function(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
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
}), new objj_method(sel_getUid("setFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:display:animate:", aFrame, YES, NO);
}
}), new objj_method(sel_getUid("setFrameOrigin:"), function(self, _cmd, anOrigin)
{ with(self)
{
    var origin = _frame.origin;
    if ((origin.x == anOrigin.x && origin.y == anOrigin.y))
        return;
    origin.x = anOrigin.x;
    origin.y = anOrigin.y;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidMoveNotification, self);
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    aSize = { width:MIN(MAX(aSize.width, _minSize.width), _maxSize.width), height:MIN(MAX(aSize.height, _minSize.height), _maxSize.height) };
    if ((_frame.size.width == aSize.width && _frame.size.height == aSize.height))
        return;
    _frame.size = aSize;
    objj_msgSend(_windowView, "setFrameSize:", aSize);
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrameSize:", { width:SHADOW_MARGIN_LEFT + aSize.width + SHADOW_MARGIN_RIGHT, height:SHADOW_MARGIN_BOTTOM + aSize.height + SHADOW_MARGIN_TOP + SHADOW_DISTANCE });
    if (!_isAnimating && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResize:")))
        objj_msgSend(_delegate, "windowDidResize:", self);
}
}), new objj_method(sel_getUid("orderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowAbove, self, nil);
}
}), new objj_method(sel_getUid("orderBack:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("orderOut:"), function(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowWillClose:")))
        objj_msgSend(_delegate, "windowWillClose:", self);
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowOut, self, nil);
    if (objj_msgSend(CPApp, "keyWindow") == self)
    {
        objj_msgSend(self, "resignKeyWindow");
        CPApp._keyWindow = nil;
    }
}
}), new objj_method(sel_getUid("orderWindow:relativeTo:"), function(self, _cmd, aPlace, otherWindowNumber)
{ with(self)
{
    objj_msgSend(_bridge, "order:window:relativeTo:", aPlace, self, CPApp._windows[otherWindowNumber]);
}
}), new objj_method(sel_getUid("setLevel:"), function(self, _cmd, aLevel)
{ with(self)
{
    _level = aLevel;
}
}), new objj_method(sel_getUid("level"), function(self, _cmd)
{ with(self)
{
    return _level;
}
}), new objj_method(sel_getUid("isVisible"), function(self, _cmd)
{ with(self)
{
    return _isVisible;
}
}), new objj_method(sel_getUid("showsResizeIndicator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "showsResizeIndicator");
}
}), new objj_method(sel_getUid("setShowsResizeIndicator:"), function(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    objj_msgSend(_windowView, "setShowsResizeIndicator:", shouldShowResizeIndicator);
}
}), new objj_method(sel_getUid("resizeIndicatorOffset"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "resizeIndicatorOffset");
}
}), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function(self, _cmd, anOffset)
{ with(self)
{
    objj_msgSend(_windowView, "setResizeIndicatorOffset:", anOffset);
}
}), new objj_method(sel_getUid("setContentView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_contentView)
        objj_msgSend(_contentView, "removeFromSuperview");
    var bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(_frame), CGRectGetHeight(_frame));
    _contentView = aView;
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRectForFrameRect:", bounds));
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(_windowView, "addSubview:", _contentView);
}
}), new objj_method(sel_getUid("contentView"), function(self, _cmd)
{ with(self)
{
    return _contentView;
}
}), new objj_method(sel_getUid("setBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(_windowView, "setBackgroundColor:", aColor);
}
}), new objj_method(sel_getUid("backgroundColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "backgroundColor");
}
}), new objj_method(sel_getUid("setMinSize:"), function(self, _cmd, aSize)
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
}), new objj_method(sel_getUid("minSize"), function(self, _cmd)
{ with(self)
{
    return _minSize;
}
}), new objj_method(sel_getUid("setMaxSize:"), function(self, _cmd, aSize)
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
}), new objj_method(sel_getUid("maxSize"), function(self, _cmd)
{ with(self)
{
    return _maxSize;
}
}), new objj_method(sel_getUid("hasShadow"), function(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
}), new objj_method(sel_getUid("setHasShadow:"), function(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow === shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        var bounds = objj_msgSend(_windowView, "bounds");
        _shadowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(-SHADOW_MARGIN_LEFT, -SHADOW_MARGIN_TOP + SHADOW_DISTANCE,
            SHADOW_MARGIN_LEFT + CGRectGetWidth(bounds) + SHADOW_MARGIN_RIGHT, SHADOW_MARGIN_TOP + CGRectGetHeight(bounds) + SHADOW_MARGIN_BOTTOM));
        if (!_CPWindowShadowColor)
        {
            var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
            _CPWindowShadowColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow0.png"), CGSizeMake(20.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow1.png"), CGSizeMake(1.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow2.png"), CGSizeMake(19.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow3.png"), CGSizeMake(20.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow5.png"), CGSizeMake(19.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow6.png"), CGSizeMake(20.0, 18.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow7.png"), CGSizeMake(1.0, 18.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow8.png"), CGSizeMake(19.0, 18.0))
                ]));
        }
        objj_msgSend(_shadowView, "setBackgroundColor:", _CPWindowShadowColor);
        objj_msgSend(_shadowView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    }
    else if (_shadowView)
    {
        _shadowView = nil;
    }
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    _delegateRespondsToWindowWillReturnUndoManagerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowWillReturnUndoManager:"));
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidBecomeMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidBecomeMain:"), CPWindowDidBecomeMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResignMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidResignMain:"), CPWindowDidResignMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidMove:"), CPWindowDidMoveNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setWindowController:"), function(self, _cmd, aWindowController)
{ with(self)
{
    _windowController = aWindowController;
}
}), new objj_method(sel_getUid("windowController"), function(self, _cmd)
{ with(self)
{
    return _windowController;
}
}), new objj_method(sel_getUid("doCommandBySelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
}), new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("makeFirstResponder:"), function(self, _cmd, aResponder)
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
}), new objj_method(sel_getUid("firstResponder"), function(self, _cmd)
{ with(self)
{
    return _firstResponder;
}
}), new objj_method(sel_getUid("acceptsMouseMovedEvents"), function(self, _cmd)
{ with(self)
{
    return _acceptsMouseMovedEvents;
}
}), new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"), function(self, _cmd, shouldAcceptMouseMovedEvents)
{ with(self)
{
    _acceptsMouseMovedEvents = shouldAcceptMouseMovedEvents;
}
}), new objj_method(sel_getUid("ignoresMouseEvents"), function(self, _cmd)
{ with(self)
{
    return _ignoresMouseEvents;
}
}), new objj_method(sel_getUid("setIgnoresMouseEvents:"), function(self, _cmd, shouldIgnoreMouseEvents)
{ with(self)
{
    _ignoresMouseEvents = shouldIgnoreMouseEvents;
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
    objj_msgSend(_windowView, "setTitle:", aTitle);
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
}
}), new objj_method(sel_getUid("setTitleWithRepresentedFilename:"), function(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedFilename:", aFilePath);
    objj_msgSend(self, "setTitle:", objj_msgSend(aFilePath, "lastPathComponent"));
}
}), new objj_method(sel_getUid("setRepresentedFilename:"), function(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedURL:", aFilePath);
}
}), new objj_method(sel_getUid("representedFilename"), function(self, _cmd)
{ with(self)
{
    return _representedURL;
}
}), new objj_method(sel_getUid("setRepresentedURL:"), function(self, _cmd, aURL)
{ with(self)
{
    _representedURL = aURL;
}
}), new objj_method(sel_getUid("representedURL"), function(self, _cmd)
{ with(self)
{
    return _representedURL;
}
}), new objj_method(sel_getUid("setMovableByWindowBackground:"), function(self, _cmd, shouldBeMovableByWindowBackground)
{ with(self)
{
    _isMovableByWindowBackground = shouldBeMovableByWindowBackground;
}
}), new objj_method(sel_getUid("isMovableByWindowBackground"), function(self, _cmd)
{ with(self)
{
    return _isMovableByWindowBackground;
}
}), new objj_method(sel_getUid("center"), function(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size,
        bridgeSize = objj_msgSend(_bridge, "contentBounds").size;
    objj_msgSend(self, "setFrameOrigin:", CGPointMake((bridgeSize.width - size.width) / 2.0, (bridgeSize.height - size.height) / 2.0));
}
}), new objj_method(sel_getUid("sendEvent:"), function(self, _cmd, anEvent)
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
}), new objj_method(sel_getUid("windowNumber"), function(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
}), new objj_method(sel_getUid("becomeKeyWindow"), function(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_getUid("becomeKeyWindow")))
        objj_msgSend(_firstResponder, "becomeKeyWindow");
}
}), new objj_method(sel_getUid("canBecomeKeyWindow"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("isKeyWindow"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "keyWindow") == self;
}
}), new objj_method(sel_getUid("makeKeyAndOrderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "orderFront:", self);
    objj_msgSend(self, "makeKeyWindow");
    objj_msgSend(self, "makeMainWindow");
}
}), new objj_method(sel_getUid("makeKeyWindow"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeKeyWindow"))
        return;
    objj_msgSend(CPApp._keyWindow, "resignKeyWindow");
    CPApp._keyWindow = self;
    objj_msgSend(self, "becomeKeyWindow");
}
}), new objj_method(sel_getUid("resignKeyWindow"), function(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_getUid("resignKeyWindow")))
        objj_msgSend(_firstResponder, "resignKeyWindow");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResignKey:")))
        objj_msgSend(_delegate, "windowDidResignKey:", self);
}
}), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, anImage, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:", anImage, self, objj_msgSend(self, "convertBaseToBridge:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    if (!_inclusiveRegisteredDraggedTypes)
        _inclusiveRegisteredDraggedTypes = objj_msgSend(CPCountedSet, "set");
    objj_msgSend(_inclusiveRegisteredDraggedTypes, "unionSet:", pasteboardTypes);
}
}), new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(_inclusiveRegisteredDraggedTypes, "minusSet:", pasteboardTypes)
    if (objj_msgSend(_inclusiveRegisteredDraggedTypes, "count") === 0)
        _inclusiveRegisteredDraggedTypes = nil;
}
}), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, aView, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", aView, self, objj_msgSend(self, "convertBaseToBridge:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("registerForDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    objj_msgSend(_registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes)
    objj_msgSend(self, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypesArray = nil;
}
}), new objj_method(sel_getUid("registeredDraggedTypes"), function(self, _cmd)
{ with(self)
{
    if (!_registeredDraggedTypesArray)
        _registeredDraggedTypesArray = objj_msgSend(_registeredDraggedTypes, "allObjects")
    return _registeredDraggedTypesArray;
}
}), new objj_method(sel_getUid("unregisterDraggedTypes"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypes = objj_msgSend(CPSet, "set");
    _registeredDraggedTypesArray = [];
}
}), new objj_method(sel_getUid("setDocumentEdited:"), function(self, _cmd, isDocumentEdited)
{ with(self)
{
    if (_isDocumentEdited == isDocumentEdited)
        return;
    _isDocumentEdited = isDocumentEdited;
    objj_msgSend(CPMenu, "_setMenuBarIconImageAlphaValue:", _isDocumentEdited ? 0.5 : 1.0);
}
}), new objj_method(sel_getUid("isDocumentEdited"), function(self, _cmd)
{ with(self)
{
    return _isDocumentEdited;
}
}), new objj_method(sel_getUid("setDocumentSaving:"), function(self, _cmd, isDocumentSaving)
{ with(self)
{
    if (_isDocumentSaving == isDocumentSaving)
        return;
    _isDocumentSaving = isDocumentSaving;
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(_windowView, "windowDidChangeDocumentSaving");
}
}), new objj_method(sel_getUid("isDocumentSaving"), function(self, _cmd)
{ with(self)
{
    return _isDocumentSaving;
}
}), new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isMainWindow"))
        return;
    var mainMenu = objj_msgSend(CPApp, "mainMenu"),
        index = objj_msgSend(mainMenu, "indexOfItemWithTitle:", _isDocumentSaving ? "Save" : "Saving...");
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
}), new objj_method(sel_getUid("performClose:"), function(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowShouldClose:")))
    {
        if (!objj_msgSend(_delegate, "windowShouldClose:", self))
            return;
    }
    else if (objj_msgSend(self, "respondsToSelector:", sel_getUid("windowShouldClose:")) && !objj_msgSend(self, "windowShouldClose:", self))
        return;
    objj_msgSend(self, "close");
}
}), new objj_method(sel_getUid("close"), function(self, _cmd)
{ with(self)
{
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillCloseNotification, self);
   objj_msgSend(self, "orderOut:", nil);
}
}), new objj_method(sel_getUid("isMainWindow"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "mainWindow") == self;
}
}), new objj_method(sel_getUid("canBecomeMainWindow"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isVisible"))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("makeMainWindow"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeMainWindow"))
        return;
    objj_msgSend(CPApp._mainWindow, "resignMainWindow");
    CPApp._mainWindow = self;
    objj_msgSend(self, "becomeMainWindow");
}
}), new objj_method(sel_getUid("becomeMainWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidBecomeMainNotification, self);
}
}), new objj_method(sel_getUid("resignMainWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResignMainNotification, self);
}
}), new objj_method(sel_getUid("toolbar"), function(self, _cmd)
{ with(self)
{
    return _toolbar;
}
}), new objj_method(sel_getUid("setToolbar:"), function(self, _cmd, aToolbar)
{ with(self)
{
    if (_toolbar === aToolbar)
        return;
    objj_msgSend(objj_msgSend(aToolbar, "_window"), "setToolbar:", nil);
    objj_msgSend(_toolbar, "_setWindow:", nil);
    _toolbar = aToolbar;
    objj_msgSend(_toolbar, "_setWindow:", self);
    objj_msgSend(self, "_noteToolbarChanged");
}
}), new objj_method(sel_getUid("toggleToolbarShown:"), function(self, _cmd, aSender)
{ with(self)
{
    var toolbar = objj_msgSend(self, "toolbar");
    objj_msgSend(toolbar, "setVisible:", !objj_msgSend(toolbar, "isVisible"));
}
}), new objj_method(sel_getUid("_noteToolbarChanged"), function(self, _cmd)
{ with(self)
{
    var frame = CGRectMakeCopy(objj_msgSend(self, "frame")),
        newFrame;
    objj_msgSend(_windowView, "noteToolbarChanged");
    if (_isFullBridge)
        newFrame = objj_msgSend(_bridge, "visibleFrame");
    else
    {
        newFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
        newFrame.origin = frame.origin;
    }
    objj_msgSend(self, "setFrame:", newFrame);
}
}), new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"), function(self, _cmd)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "contentView"), "frame"),
        sheetFrame = CGRectMakeCopy(objj_msgSend(_attachedSheet, "frame"));
   sheetFrame.origin.y = CGRectGetMinY(_frame) + CGRectGetMinY(contentRect);
   sheetFrame.origin.x = CGRectGetMinX(_frame) + FLOOR((CGRectGetWidth(_frame) - CGRectGetWidth(sheetFrame)) / 2.0);
   objj_msgSend(_attachedSheet, "setFrameOrigin:", sheetFrame.origin);
}
}), new objj_method(sel_getUid("_animateAttachedSheet"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"), function(self, _cmd, aSheet, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    _attachedSheet = aSheet;
    aSheet._isSheet = YES;
    objj_msgSend(self, "_setAttachedSheetFrameOrigin");
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowAbove, aSheet, self);
}
}), new objj_method(sel_getUid("attachedSheet"), function(self, _cmd)
{ with(self)
{
    return _attachedSheet;
}
}), new objj_method(sel_getUid("isSheet"), function(self, _cmd)
{ with(self)
{
    return _isSheet;
}
}), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("worksWhenModal"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
    CPWindowSavingImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(16.0, 16.0))
}
}), new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function(self, _cmd, aStyleMask)
{ with(self)
{
    if (aStyleMask & CPHUDBackgroundWindowMask)
        return _CPHUDWindowView;
    else if (aStyleMask === CPBorderlessWindowMask)
        return _CPBorderlessWindowView;
    return _CPStandardWindowView;
}
}), new objj_method(sel_getUid("_windowViewClassForFullBridgeStyleMask:"), function(self, _cmd, aStyleMask)
{ with(self)
{
    return _CPBorderlessBridgeWindowView;
}
}), new objj_method(sel_getUid("frameRectForContentRect:styleMask:"), function(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", _styleMask), "frameRectForContentRect:", aContentRect);
}
})]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_windowController, "document") || !objj_msgSend(self, "isMainWindow"))
        return;
    objj_msgSend(CPMenu, "setMenuBarTitle:", _title);
}
})]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBridge:"), function(self, _cmd, aBridge)
{ with(self)
{
    if (_bridge == aBridge)
        return;
    if (_bridge)
    {
        objj_msgSend(self, "orderOut:", self);
    }
    _bridge = aBridge;
    if (objj_msgSend(self, "isFullBridge"))
        objj_msgSend(self, "setFrame:", objj_msgSend(aBridge, "contentBounds"));
}
}), new objj_method(sel_getUid("resizeWithOldBridgeSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (objj_msgSend(self, "isFullBridge"))
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
}), new objj_method(sel_getUid("setAutoresizingMask:"), function(self, _cmd, anAutoresizingMask)
{ with(self)
{
    _autoresizingMask = anAutoresizingMask;
}
}), new objj_method(sel_getUid("autoresizingMask"), function(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
}), new objj_method(sel_getUid("convertBaseToBridge:"), function(self, _cmd, aPoint)
{ with(self)
{
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x + origin.x, aPoint.y + origin.y);
}
}), new objj_method(sel_getUid("convertBridgeToBase:"), function(self, _cmd, aPoint)
{ with(self)
{
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x - origin.x, aPoint.y - origin.y);
}
}), new objj_method(sel_getUid("undoManager"), function(self, _cmd)
{ with(self)
{
    if (_delegateRespondsToWindowWillReturnUndoManagerSelector)
        return objj_msgSend(_delegate, "windowWillReturnUndoManager:", self);
    if (!_undoManager)
        _undoManager = objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init");
    return _undoManager;
}
}), new objj_method(sel_getUid("undo:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "undo");
}
}), new objj_method(sel_getUid("redo:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "redo");
}
}), new objj_method(sel_getUid("containsPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    return CGRectContainsPoint(_frame, aPoint);
}
})]);
}
var interpolate = function(fromValue, toValue, progress)
{
    return fromValue + (toValue - fromValue) * progress;
}
{var the_class = objj_allocateClassPair(CPAnimation, "_CPWindowFrameAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_startFrame"), new objj_ivar("_targetFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:targetFrame:"), function(self, _cmd, aWindow, aTargetFrame)
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
}), new objj_method(sel_getUid("startAnimation"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "startAnimation");
    _window._isAnimating = YES;
}
}), new objj_method(sel_getUid("setCurrentProgress:"), function(self, _cmd, aProgress)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "setCurrentProgress:", aProgress);
    var value = objj_msgSend(self, "currentValue");
    if (value == 1.0)
        _window._isAnimating = NO;
    objj_msgSend(_window, "setFrameOrigin:", CGPointMake(interpolate(CGRectGetMinX(_startFrame), CGRectGetMinX(_targetFrame), value), interpolate(CGRectGetMinY(_startFrame), CGRectGetMinY(_targetFrame), value)));
    objj_msgSend(_window, "setFrameSize:", CGSizeMake(interpolate(CGRectGetWidth(_startFrame), CGRectGetWidth(_targetFrame), value), interpolate(CGRectGetHeight(_startFrame), CGRectGetHeight(_targetFrame), value)));
}
})]);
}
_CPWindowFullBridgeSessionMake= function(aWindowView, aContentRect, hasShadow, aLevel)
{
    return { windowView:aWindowView, contentRect:aContentRect, hasShadow:hasShadow, level:aLevel };
}
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;19;CPDOMWindowBridge.ji;8;CPView.jp;20;CPWindowController.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;5626;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_owner"), new objj_ivar("_window"), new objj_ivar("_document"), new objj_ivar("_windowCibName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:"), function(self, _cmd, aWindow)
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
}), new objj_method(sel_getUid("initWithWindowCibName:"), function(self, _cmd, aWindowCibName)
{ with(self)
{
    return objj_msgSend(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
}), new objj_method(sel_getUid("initWithWindowCibName:owner:"), function(self, _cmd, aWindowCibName, anOwner)
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
}), new objj_method(sel_getUid("loadWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "windowWillLoad");
    objj_msgSend(self, "setWindow:", CPApp._keyWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CPRectMakeZero(), CPBorderlessBridgeWindowMask|CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
    objj_msgSend(self, "windowDidLoad");
}
}), new objj_method(sel_getUid("showWindow:"), function(self, _cmd, aSender)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
 if (objj_msgSend(theWindow, "respondsToSelector:", sel_getUid("becomesKeyOnlyIfNeeded")) && objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
        objj_msgSend(theWindow, "orderFront:", aSender);
    else
        objj_msgSend(theWindow, "makeKeyAndOrderFront:", aSender);
}
}), new objj_method(sel_getUid("isWindowLoaded"), function(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    if (!_window)
         objj_msgSend(self, "loadWindow");
    return _window;
}
}), new objj_method(sel_getUid("setWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    _window = aWindow;
    objj_msgSend(_window, "setWindowController:", self);
    objj_msgSend(_window, "setNextResponder:", self);
}
}), new objj_method(sel_getUid("windowDidLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerDidLoadNib:", self);
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
}), new objj_method(sel_getUid("windowWillLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerWillLoadNib:", self);
}
}), new objj_method(sel_getUid("setDocument:"), function(self, _cmd, aDocument)
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
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentWillSave:"), CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidSave:"), CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, _document);
        objj_msgSend(self, "setDocumentEdited:", objj_msgSend(_document, "isDocumentEdited"));
    }
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
}), new objj_method(sel_getUid("_documentWillSave:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", YES);
}
}), new objj_method(sel_getUid("_documentDidSave:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
}), new objj_method(sel_getUid("_documentDidFailToSave:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
}), new objj_method(sel_getUid("document"), function(self, _cmd)
{ with(self)
{
    return _document;
}
}), new objj_method(sel_getUid("setDocumentEdited:"), function(self, _cmd, isEdited)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentEdited:", isEdited);
}
}), new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"), function(self, _cmd)
{ with(self)
{
    if (!_document || !_window)
        return;
    objj_msgSend(_window, "setTitle:", objj_msgSend(self, "windowTitleForDocumentDisplayName:", objj_msgSend(_document, "displayName")));
}
}), new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"), function(self, _cmd, aDisplayName)
{ with(self)
{
    return aDisplayName;
}
})]);
}

