@STATIC;1.0;I;21;Foundation/CPObject.jt;1719;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZMusicList"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("nameOfList"), new objj_ivar("musicList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("nameOfList"), function $XYZMusicList__nameOfList(self, _cmd)
{ with(self)
{
return nameOfList;
}
},["id"]),
new objj_method(sel_getUid("setNameOfList:"), function $XYZMusicList__setNameOfList_(self, _cmd, newValue)
{ with(self)
{
nameOfList = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("musicList"), function $XYZMusicList__musicList(self, _cmd)
{ with(self)
{
return musicList;
}
},["id"]),
new objj_method(sel_getUid("setMusicList:"), function $XYZMusicList__setMusicList_(self, _cmd, newValue)
{ with(self)
{
musicList = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $XYZMusicList__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZMusicList").super_class }, "init");
    if(self){
        CPLog.trace("init the array");
        musicList = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addSong:"), function $XYZMusicList__addSong_(self, _cmd, aSong)
{ with(self)
{
    CPLog.trace("Agregando la cancion: "+aSong+" a la lista "+nameOfList);
    objj_msgSend(musicList, "addObject:", aSong);
}
},["void","XYZSong"]), new objj_method(sel_getUid("description"), function $XYZMusicList__description(self, _cmd)
{ with(self)
{
    return " Name of the list: "+ nameOfList + " Songs in list: "+ musicList;
}
},["CPString"])]);
}

