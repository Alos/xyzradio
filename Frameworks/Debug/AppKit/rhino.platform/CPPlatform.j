I;21;Foundation/CPObject.jc;909;




{var the_class = objj_allocateClassPair(CPObject, "CPPlatform"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPPlatform__bootstrap(self, _cmd)
{ with(self)
{
    objj_msgSend(CPPlatformString, "bootstrap");
    objj_msgSend(CPPlatformWindow, "setPrimaryPlatformWindow:", objj_msgSend(objj_msgSend(CPPlatformWindow, "alloc"), "_init"));
}
},["void"]), new objj_method(sel_getUid("isBrowser"), function $CPPlatform__isBrowser(self, _cmd)
{ with(self)
{
    return typeof window.cpIsDesktop === "undefined";
}
},["BOOL"]), new objj_method(sel_getUid("supportsDragAndDrop"), function $CPPlatform__supportsDragAndDrop(self, _cmd)
{ with(self)
{
    return CPFeatureIsCompatible(CPHTMLDragAndDropFeature);
}
},["BOOL"])]);
}

