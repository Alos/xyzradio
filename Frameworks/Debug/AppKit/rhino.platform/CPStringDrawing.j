I;21;Foundation/CPString.jc;982;
var CPStringReferenceElement = nil,
    CPStringDefaultFont = nil;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("cssString"), function $CPString__cssString(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("sizeWithFont:"), function $CPString__sizeWithFont_(self, _cmd, aFont)
{ with(self)
{
    return objj_msgSend(self, "sizeWithFont:inWidth:", aFont, NULL);
}
}), new objj_method(sel_getUid("sizeWithFont:inWidth:"), function $CPString__sizeWithFont_inWidth_(self, _cmd, aFont, aWidth)
{ with(self)
{
    return { width:0.0, height:0.0 };
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_resetSize"), function $CPString___resetSize(self, _cmd)
{ with(self)
{
    CPStringReferenceElement = nil;
}
})]);
}

