@STATIC;1.0;i;14;XYZMusicList.ji;9;XYZSong.jt;3037;objj_executeFile("XYZMusicList.j", YES);
objj_executeFile("XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "SongDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("xyzConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SongDS__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SongDS").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addNewPlaylist:"), function $SongDS__addNewPlaylist_(self, _cmd, nameOfPlaylist)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/AddNewPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SongDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    var info = JSON.parse(data);
    if(!response.error){
        CPLog.info("Filling songs...");
        var newSong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
        objj_msgSend(newSong, "setSongTitle:", info.songTitle);
        objj_msgSend(newSong, "setArtist:", info.artist);
        objj_msgSend(newSong, "setTime:", info.time);
        objj_msgSend(newSong, "setGenre:", info.genre);
        objj_msgSend(newSong, "setRating:", info.rating);
        CPLog.warn("El valor de songID es: "+ info.songID );
        objj_msgSend(newSong, "setSongID:", info.songID.id);
        objj_msgSend(newSong, "setLocal:", info.isLocal);
        objj_msgSend(newSong, "setPathToSong:", info.pathToSong);
        objj_msgSend(newSong, "setPathToAlbumArt:", info.pathToAlbumArt);
        var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", newSong, "theSong");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "SongReceived", self, info);
    }else{
        CPLog.info("No songs found in data!");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SongDS__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SongDS__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == xyzConnection)
        xyzConnection = nil;
}
},["void","CPURLConnection"])]);
}

