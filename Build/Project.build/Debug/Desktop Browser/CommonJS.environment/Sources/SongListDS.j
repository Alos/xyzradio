@STATIC;1.0;i;14;XYZMusicList.ji;9;XYZSong.jt;5766;objj_executeFile("XYZMusicList.j", YES);
objj_executeFile("XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "SongListDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("xyzConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SongListDS__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SongListDS").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addNewPlaylist:"), function $SongListDS__addNewPlaylist_(self, _cmd, nameOfPlaylist)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/AddNewPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("addSongToPlaylist:song:"), function $SongListDS__addSongToPlaylist_song_(self, _cmd, nameOfPlaylist, aSong)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/AddSongToPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist + "&songID=" + objj_msgSend(aSong, "songID");
    CPLog.info("Adding "+aSong+" to playlist "+nameOfPlaylist+" at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString","XYZSong"]), new objj_method(sel_getUid("removePlaylist:"), function $SongListDS__removePlaylist_(self, _cmd, nameOfPlaylist)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/RemovePlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email") + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPString"]), new objj_method(sel_getUid("getUserPlaylists"), function $SongListDS__getUserPlaylists(self, _cmd)
{ with(self)
{
    answerArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/GetUserPlaylist?userID=" + objj_msgSend(objj_msgSend(app, "userLoggedin"), "email");
    CPLog.info("Getting user playlists at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("getSongsForPlaylist:"), function $SongListDS__getSongsForPlaylist_(self, _cmd, songIDArray)
{ with(self)
{
    var resp = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    var app = objj_msgSend(CPApp, "delegate");
    var listaCompleta = objj_msgSend(app, "globalSongList");
    for(var x=0; x< objj_msgSend(songIDArray, "count"); x++){
        var songOnlyID = objj_msgSend(songIDArray, "objectAtIndex:", x);
        for(var i=0; i< objj_msgSend(listaCompleta, "count"); i++){
            var fullSong = objj_msgSend(listaCompleta, "objectAtIndex:", i);
            if(objj_msgSend(fullSong, "songID") == objj_msgSend(songOnlyID, "songID")){
                var newSong = fullSong;
                objj_msgSend(resp, "addObject:",  newSong);
                break;
            }
        }
    }
    return resp;
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SongListDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if(!data)
        return;
    var result = JSON.parse(data);
    CPLog.info("Playlists: %s", result);
    for(var i=0; i< result.length; i++){
        var object = result[i];
        var musicList = objj_msgSend(objj_msgSend(XYZMusicList, "alloc"), "init");
        objj_msgSend(musicList, "setNameOfList:",  object.nameOfList);
        var arrayOfIDs = object.musicList;
        for(var j=0; j<objj_msgSend(arrayOfIDs, "count"); j++){
            var emptySong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
            objj_msgSend(emptySong, "setSongID:", objj_msgSend(arrayOfIDs, "objectAtIndex:",  j));
            objj_msgSend(musicList, "addSong:", emptySong);
        }
        objj_msgSend(answerArray, "addObject:",  musicList);
    }
    var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", answerArray, "playlist");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "PlayListsRecived", self, info);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SongListDS__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SongListDS__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongListDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == xyzConnection)
        xyzConnection = nil;
}
},["void","CPURLConnection"])]);
}

