@STATIC;1.0;t;2242;{var the_class = objj_allocateClassPair(CPObject, "SongURLUploader"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("app"), new objj_ivar("theConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $SongURLUploader__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SongURLUploader").super_class }, "init");
    if(self) {
        app = objj_msgSend(CPApp, "delegate");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("uploadSongWithTitle:artist:genere:time:pathToAlbumArt:songURL:"), function $SongURLUploader__uploadSongWithTitle_artist_genere_time_pathToAlbumArt_songURL_(self, _cmd, aTitle, anArtist, aGenere, aTime, aPathToArt, aURL)
{ with(self)
{
        var aURL = objj_msgSend(app, "serverIP") + "/AddSong?songTitle="+aTitle+"&artist="+anArtist+"&genere="+aGenere+"&time="+aTime+"&pathToAlbumArt="+aPathToArt+
        "&pathToSong="+aURL+"&userid="+objj_msgSend(objj_msgSend(app, "userLoggedin"), "email");
        CPLog.info("Getting users at: %s", aURL);
        var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
        theConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
},["void","CPString","CPString","CPString","CPString","CPString","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $SongURLUploader__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
        CPLog.trace("SubmitSuccessful");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "SubmitSuccessful", self);
    }
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $SongURLUploader__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
        CPLog.error(error);
    }
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $SongURLUploader__clearConnection_(self, _cmd, connection)
{ with(self)
{
        if ( connection == theConnection)
            theConnection = nil;
    }
},["void","CPURLConnection"])]);
}

