I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2551;
var CPCibOwner = "CPCibOwner";
var LoadInfoForCib = {};
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function $CPObject__awakeFromCib(self, _cmd)
{ with(self)
{
}
})]);
}
{
var the_class = objj_getClass("CPBundle")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPBundle\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"), function $CPBundle__loadCibFile_externalNameTable_loadDelegate_(self, _cmd, aFileName, aNameTable, aDelegate)
{ with(self)
{
    var cib = objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithCibNamed:bundle:loadDelegate:", aFileName, self, objj_msgSend(self, "class"));
    LoadInfoForCib[objj_msgSend(cib, "UID")] = { loadDelegate:aDelegate, externalNameTable:aNameTable };
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"), function $CPBundle__loadCibFile_externalNameTable_loadDelegate_(self, _cmd, anAbsolutePath, aNameTable, aDelegate)
{ with(self)
{
    var cib = objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfURL:loadDelegate:", anAbsolutePath, self);
    LoadInfoForCib[objj_msgSend(cib, "UID")] = { loadDelegate:aDelegate, externalNameTable:aNameTable };
}
}), new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"), function $CPBundle__loadCibNamed_owner_loadDelegate_(self, _cmd, aName, anOwner, aDelegate)
{ with(self)
{
    var bundle = anOwner ? objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class")) : objj_msgSend(CPBundle, "mainBundle"),
        path = objj_msgSend(bundle, "pathForResource:", aName);
    objj_msgSend(self, "loadCibFile:externalNameTable:loadDelegate:", path, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anOwner, CPCibOwner), aDelegate);
}
}), new objj_method(sel_getUid("cibDidFinishLoading:"), function $CPBundle__cibDidFinishLoading_(self, _cmd, aCib)
{ with(self)
{
    var loadInfo = LoadInfoForCib[objj_msgSend(aCib, "UID")];
    delete LoadInfoForCib[objj_msgSend(aCib, "UID")];
    objj_msgSend(aCib, "instantiateCibWithExternalNameTable:", loadInfo.externalNameTable);
    objj_msgSend(loadInfo.loadDelegate, "cibDidFinishLoading:", aCib);
}
})]);
}

