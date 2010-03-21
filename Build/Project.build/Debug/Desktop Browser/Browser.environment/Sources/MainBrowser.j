@STATIC;1.0;i;19;XYZPlayListWindow.ji;16;XYZColumnModel.ji;10;XYZTable.jt;5420;objj_executeFile("XYZPlayListWindow.j", YES);
objj_executeFile("XYZColumnModel.j", YES);
objj_executeFile("XYZTable.j", YES);
{var the_class = objj_allocateClassPair(XYZPlayListWindow, "MainBrowser"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSource:rectangle:"), function $MainBrowser__initWithSource_rectangle_(self, _cmd, list, aRectangle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("MainBrowser").super_class }, "initWithContentRect:", aRectangle);
    if (self)
    {
        objj_msgSend(self, "setTitle:", "Music Browser");
        var contentView = objj_msgSend(self, "contentView");
        var bounds = objj_msgSend(contentView, "bounds");
        objj_msgSend(self, "getAllSongs");
        var playingColumnModel = objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(10, 7, 26, 31), " ", nil);
        var titleColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(27, 7, 202, 31), "Name", nil);
        var artistColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(230, 7, 190, 31), "Artist",  nil);
        var timeColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(422, 7, 48, 31), "Time",  nil);
        var ratingColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(470, 7, 48, 31), "Rating",  nil);
        var fullModel = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [playingColumnModel, titleColumnModel, artistColumnModel, timeColumnModel, ratingColumnModel], ["playing", "title", "artist", "time", "rating"]);
        theTable = objj_msgSend(objj_msgSend(XYZTable, "alloc"), "initWithColumnModel:model:frame:", fullModel, list,  bounds);
        objj_msgSend(contentView, "addSubview:",  theTable);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("getAllSongs:"), "NewSongAddedXYZEvent", nil);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("getAllSongs:"), "SubmitSuccessful", nil);
    }
    return self;
}
},["id","CPArray","CGRect"]), new objj_method(sel_getUid("addItem:"), function $MainBrowser__addItem_(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(theTable, "addItem:", anObject);
}
},["void","CPObject"]), new objj_method(sel_getUid("addList:"), function $MainBrowser__addList_(self, _cmd, aModel)
{ with(self)
{ CPLog.trace("addlist here!");
    objj_msgSend(theTable, "setModel:",  aModel);
}
},["void","CPArray"]), new objj_method(sel_getUid("removeSelectedItems"), function $MainBrowser__removeSelectedItems(self, _cmd)
{ with(self)
{
   CPLog.trace("removeSlectedItems in SFBrowser got a msg");
   objj_msgSend(theTable, "removeSelectedItems");
}
},["void"]), new objj_method(sel_getUid("getAllSongs"), function $MainBrowser__getAllSongs(self, _cmd)
{ with(self)
{
    app = objj_msgSend(CPApp, "delegate");
    var url = objj_msgSend(app, "serverIP")+"/GetAllSongs";
    theRequest = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
    serverConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", theRequest, self);
}
},["void"]), new objj_method(sel_getUid("getAllSongs:"), function $MainBrowser__getAllSongs_(self, _cmd, aNotification)
{ with(self)
{
    app = objj_msgSend(CPApp, "delegate");
    var url = objj_msgSend(app, "serverIP")+"/GetAllSongs";
    theRequest = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
    serverConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", theRequest, self);
}
},["void","CPNotification"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $MainBrowser__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    var response = JSON.parse(data);
    if(!response.error){
        CPLog.info("Filling songs...");
        var songsArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        for(var i=0; i< response.length; i++){
            var info = response[i];
            var newSong = objj_msgSend(objj_msgSend(XYZSong, "alloc"), "init");
            objj_msgSend(newSong, "setSongTitle:", info.songTitle);
            objj_msgSend(newSong, "setArtist:", info.artist);
            objj_msgSend(newSong, "setTime:", info.time);
            objj_msgSend(newSong, "setGenre:", info.genre);
            objj_msgSend(newSong, "setRating:", info.rating);
            objj_msgSend(newSong, "setSongID:", info.songID);
            objj_msgSend(newSong, "setLocal:", info.isLocal);
            objj_msgSend(newSong, "setPathToSong:", info.pathToSong);
            objj_msgSend(newSong, "setPathToAlbumArt:", info.pathToAlbumArt);
            objj_msgSend(songsArray, "addObject:",  newSong);
        }
        objj_msgSend(self, "addList:", songsArray);
    }else{
        CPLog.info("No songs found in data!");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $MainBrowser__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
    connection = null;
}
},["void","CPURLConnection"])]);
}

