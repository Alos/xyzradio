I;21;Foundation/CPObject.jc;753;




{var the_class = objj_allocateClassPair(CPObject, "CPPlatform"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPPlatform__bootstrap(self, _cmd)
{ with(self)
{

    var body = document.getElementsByTagName("body")[0];

    body.innerHTML = "";
    body.style.overflow = "hidden";

    if (document.documentElement)
        document.documentElement.style.overflow = "hidden";


    objj_msgSend(CPPlatformString, "bootstrap");
    objj_msgSend(CPPlatformWindow, "setPrimaryPlatformWindow:", objj_msgSend(objj_msgSend(CPPlatformWindow, "alloc"), "_init"));
}
})]);
}

