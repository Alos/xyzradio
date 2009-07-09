I;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;4831;


var _CPCibConnectorSourceKey = "_CPCibConnectorSourceKey",
    _CPCibConnectorDestinationKey = "_CPCibConnectorDestinationKey",
    _CPCibConnectorLabelKey = "_CPCibConnectorLabelKey";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibConnector"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_source"), new objj_ivar("_destination"), new objj_ivar("_label")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("replaceObjects:"), function $_CPCibConnector__replaceObjects_(self, _cmd, replacementObjects)
{ with(self)
{
    var replacement = replacementObjects[objj_msgSend(_source, "UID")];

    if (replacement !== undefined)
        _source = replacement;

    replacement = replacementObjects[objj_msgSend(_destination, "UID")];

    if (replacement !== undefined)
        _destination = replacement;
}
})]);
}

{
var the_class = objj_getClass("_CPCibConnector")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibConnector\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPCibConnector__initWithCoder_(self, _cmd, aCoder)
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
}), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPCibConnector__encodeWithCoder_(self, _cmd, aCoder)
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
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $_CPCibControlConnector__establishConnection(self, _cmd)
{ with(self)
{
    var selectorName = _label,
        selectorNameLength = objj_msgSend(selectorName, "length");

    if (selectorNameLength && selectorName[selectorNameLength - 1] !== ':')
        selectorName += ':';

    var selector = CPSelectorFromString(selectorName);


    if (!selector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "-[" + objj_msgSend(self, "className") + ' ' + _cmd + "] selector " + selectorName + " does not exist.");


    if (_destination && !objj_msgSend(_destination, "respondsToSelector:", selector))
    {
        CPLog.warn("Could not connect the action " + selector + " to target of class " + objj_msgSend(_destination, "className"));

        return;
    }


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
class_addMethods(the_class, [new objj_method(sel_getUid("establishConnection"), function $_CPCibOutletConnector__establishConnection(self, _cmd)
{ with(self)
{
    try
    {
        objj_msgSend(_source, "setValue:forKey:", _destination, _label);
    }
    catch (anException)
    {
        if (objj_msgSend(anException, "name") === CPUndefinedKeyException)
            CPLog.warn("Could not connect the outlet " + _label + " of target of class " + objj_msgSend(_source, "className"));

        else
            throw anException;
    }
}
})]);
}

