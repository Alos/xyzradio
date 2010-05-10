@STATIC;1.0;i;18;../model/XYZSong.jt;2177;objj_executeFile("../model/XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "XYZPlayListWindowForDJ"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theTable"), new objj_ivar("theList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $XYZPlayListWindowForDJ__initWithContentRect_(self, _cmd, aRectangle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZPlayListWindowForDJ").super_class }, "initWithContentRect:styleMask:", aRectangle, CPHUDBackgroundWindowMask|CPClosableWindowMask);
    if (self){
        theList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        objj_msgSend(self, "registerForDraggedTypes:", [SongsDragType]);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("getSelectedSong"), function $XYZPlayListWindowForDJ__getSelectedSong(self, _cmd)
{ with(self)
{
    var index = objj_msgSend(theTable, "getSelectedItem");
    var aux = objj_msgSend(theTable, "getSongByIndex:",  index);
    return aux;
}
},["XYZSong"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZPlayListWindowForDJ__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
    return objj_msgSend(theTable, "getSongIndex:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZPlayListWindowForDJ__getSongByIndex_(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(theTable, "getSongByIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZPlayListWindowForDJ__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
    objj_msgSend(theTable, "setSelectionIndexes:", index);
}
},["void","int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZPlayListWindowForDJ__removeSelectedItems(self, _cmd)
{ with(self)
{
   objj_msgSend(theTable, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("getSongListSize"), function $XYZPlayListWindowForDJ__getSongListSize(self, _cmd)
{ with(self)
{
    return objj_msgSend(theTable, "getSongListSize");
}
},["int"])]);
}

