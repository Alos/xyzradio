@STATIC;1.0;i;23;../model/XYZMusicList.ji;18;../model/XYZSong.jt;5625;objj_executeFile("../model/XYZMusicList.j", YES);
objj_executeFile("../model/XYZSong.j", YES);
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
    var aURL = objj_msgSend(app, "serverIP") + "/GetUserPlaylist";
    CPLog.info("Getting user playlists at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $SongListDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if(!data)
        return;
    var result = JSON.parse(data);
    CPLog.trace("The data:"+data);
    CPLog.info("Playlists: %s", result);
    for(var i=0; i< result.length; i++){
        var object = result[i];
        CPLog.trace("The object>"+object);
        var musicList = objj_msgSend(objj_msgSend(XYZMusicList, "alloc"), "init");
        objj_msgSend(musicList, "setNameOfList:",  object.nameOfList);
        var arrayOfSongs = object.musicList;
        for(var j=0; j<objj_msgSend(arrayOfSongs, "count"); j++){
            var emptySong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
            objj_msgSend(emptySong, "setSongID:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).songID);
            objj_msgSend(emptySong, "setSongTitle:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).songTitle);
            objj_msgSend(emptySong, "setArtist:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).artist);
            objj_msgSend(emptySong, "setTime:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).time);
            objj_msgSend(emptySong, "setGenre:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).genre);
            objj_msgSend(emptySong, "setPathToAlbumArt:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).pathToAlbumArt);
            objj_msgSend(emptySong, "setPathToSong:", objj_msgSend(arrayOfSongs, "objectAtIndex:",  j).pathToSong)
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
    CPLog.error(error);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongListDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == xyzConnection)
        xyzConnection = nil;
}
},["void","CPURLConnection"])]);
}

