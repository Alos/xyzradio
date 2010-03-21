@STATIC;1.0;i;9;XYZSong.jt;2469;objj_executeFile("XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "XYZPlayListWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theTable"), new objj_ivar("theList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:"), function $XYZPlayListWindow__initWithContentRect_(self, _cmd, aRectangle)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZPlayListWindow").super_class }, "initWithContentRect:styleMask:", aRectangle, CPHUDBackgroundWindowMask|CPClosableWindowMask);
    if (self){
  theList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("getSelectedSong"), function $XYZPlayListWindow__getSelectedSong(self, _cmd)
{ with(self)
{
 var index = objj_msgSend(theTable, "getSelectedItem");
 var aux = objj_msgSend(theTable, "getSongByIndex:",  index);
 return aux;
}
},["XYZSong"]), new objj_method(sel_getUid("labelWithTitle:"), function $XYZPlayListWindow__labelWithTitle_(self, _cmd, aTitle)
{ with(self)
{
    var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(label, "setStringValue:", aTitle);
    objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(label, "sizeToFit");
    return label;
}
},["CPTextField","CPString"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZPlayListWindow__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
 return objj_msgSend(theTable, "getSongIndex:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZPlayListWindow__getSongByIndex_(self, _cmd, index)
{ with(self)
{
 return objj_msgSend(theTable, "getSongByIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZPlayListWindow__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
 objj_msgSend(theTable, "setSelectionIndexes:", index);
}
},["void","int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZPlayListWindow__removeSelectedItems(self, _cmd)
{ with(self)
{
   objj_msgSend(theTable, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("getSongListSize"), function $XYZPlayListWindow__getSongListSize(self, _cmd)
{ with(self)
{
 return objj_msgSend(theTable, "getSongListSize");
}
},["int"])]);
}

