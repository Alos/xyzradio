@STATIC;1.0;I;22;AppKit/CPApplication.jt;2913;objj_executeFile("AppKit/CPApplication.j", NO);
var SharedLightbox;
{var the_class = objj_allocateClassPair(CPObject, "CPLightbox"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_lightbox"), new objj_ivar("_backgroundColor")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("runModalForWindow:"), function $CPLightbox__runModalForWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (!_lightbox)
    {
        _lightbox = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0.0, 0.0, 10000.0, 10000.0), CPBorderlessWindowMask);
        objj_msgSend(_lightbox, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(objj_msgSend(_lightbox, "contentView"), "setBackgroundColor:", _backgroundColor || objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 209.0/255.0, 216.0/255.0, 227.0/255.0, 0.6));
    }
    objj_msgSend(_lightbox, "orderFront:", self);
    objj_msgSend(CPApp, "runModalForWindow:", aWindow);
}
},["void","CPWindow"]), new objj_method(sel_getUid("stopModal"), function $CPLightbox__stopModal(self, _cmd)
{ with(self)
{
    objj_msgSend(CPApp, "stopModal");
    objj_msgSend(_lightbox, "close");
}
},["void"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPLightbox__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    _backgroundColor = aColor;
    if (_lightbox)
        objj_msgSend(objj_msgSend(_lightbox, "contentView"), "setBackgroundColor:", _backgroundColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPLightbox__backgroundColor(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
},["CPColor"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedLightbox"), function $CPLightbox__sharedLightbox(self, _cmd)
{ with(self)
{
    if (!SharedLightbox)
        SharedLightbox = objj_msgSend(objj_msgSend(CPLightbox, "alloc"), "init");
    return SharedLightbox;
}
},["id"]), new objj_method(sel_getUid("runModalForWindow:"), function $CPLightbox__runModalForWindow_(self, _cmd, aWindow)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "sharedLightbox"), "runModalForWindow:", aWindow);
}
},["void","CPWindow"]), new objj_method(sel_getUid("stopModal"), function $CPLightbox__stopModal(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "sharedLightbox"), "stopModal");
}
},["void"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPLightbox__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "sharedLightbox"), "setBackgroundColor:", aColor);
}
},["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPLightbox__backgroundColor(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "sharedLightbox"), "backgroundColor");
}
},["CPColor"])]);
}

