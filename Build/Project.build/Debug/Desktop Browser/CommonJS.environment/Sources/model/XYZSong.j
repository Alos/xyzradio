@STATIC;1.0;I;21;Foundation/CPObject.jt;6570;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZSong"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("songTitle"), new objj_ivar("artist"), new objj_ivar("time"), new objj_ivar("genre"), new objj_ivar("rating"), new objj_ivar("pathToAlbumArt"), new objj_ivar("songID"), new objj_ivar("local"), new objj_ivar("pathToSong")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("songTitle"), function $XYZSong__songTitle(self, _cmd)
{ with(self)
{
return songTitle;
}
},["id"]),
new objj_method(sel_getUid("setSongTitle:"), function $XYZSong__setSongTitle_(self, _cmd, newValue)
{ with(self)
{
songTitle = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("artist"), function $XYZSong__artist(self, _cmd)
{ with(self)
{
return artist;
}
},["id"]),
new objj_method(sel_getUid("setArtist:"), function $XYZSong__setArtist_(self, _cmd, newValue)
{ with(self)
{
artist = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("time"), function $XYZSong__time(self, _cmd)
{ with(self)
{
return time;
}
},["id"]),
new objj_method(sel_getUid("setTime:"), function $XYZSong__setTime_(self, _cmd, newValue)
{ with(self)
{
time = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("genre"), function $XYZSong__genre(self, _cmd)
{ with(self)
{
return genre;
}
},["id"]),
new objj_method(sel_getUid("setGenre:"), function $XYZSong__setGenre_(self, _cmd, newValue)
{ with(self)
{
genre = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("rating"), function $XYZSong__rating(self, _cmd)
{ with(self)
{
return rating;
}
},["id"]),
new objj_method(sel_getUid("setRating:"), function $XYZSong__setRating_(self, _cmd, newValue)
{ with(self)
{
rating = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pathToAlbumArt"), function $XYZSong__pathToAlbumArt(self, _cmd)
{ with(self)
{
return pathToAlbumArt;
}
},["id"]),
new objj_method(sel_getUid("setPathToAlbumArt:"), function $XYZSong__setPathToAlbumArt_(self, _cmd, newValue)
{ with(self)
{
pathToAlbumArt = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("songID"), function $XYZSong__songID(self, _cmd)
{ with(self)
{
return songID;
}
},["id"]),
new objj_method(sel_getUid("setSongID:"), function $XYZSong__setSongID_(self, _cmd, newValue)
{ with(self)
{
songID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isLocal"), function $XYZSong__isLocal(self, _cmd)
{ with(self)
{
return local;
}
},["id"]),
new objj_method(sel_getUid("setLocal:"), function $XYZSong__setLocal_(self, _cmd, newValue)
{ with(self)
{
local = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pathToSong"), function $XYZSong__pathToSong(self, _cmd)
{ with(self)
{
return pathToSong;
}
},["id"]),
new objj_method(sel_getUid("setPathToSong:"), function $XYZSong__setPathToSong_(self, _cmd, newValue)
{ with(self)
{
pathToSong = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithSongTitle:setArtist:setID:time:pathToSong:rating:"), function $XYZSong__initWithSongTitle_setArtist_setID_time_pathToSong_rating_(self, _cmd, aSongTitle, anArtist, anID, aTime, aPath, aRating)
{ with(self)
{
    if(self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZSong").super_class }, "init")){
        songTitle = aSongTitle;
        artist = anArtist;
        songID = anID;
        isLocal = false;
        time = aTime;
        pathToSong = aPath;
        rating = aRating;
    }
    return self;
}
},["id","CPString","CPString","int","CPString","CPString","CPString"]), new objj_method(sel_getUid("isEqual:"), function $XYZSong__isEqual_(self, _cmd, anObject)
{ with(self)
{
if(objj_msgSend(objj_msgSend(anObject, "class"), "instancesRespondToSelector:",  sel_getUid("songID")))
    if(objj_msgSend(anObject, "songID") == objj_msgSend(self, "songID"))
        return YES;
    else
        return NO;
}
},["BOOL","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $XYZSong__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", songTitle, "SongTitle");
    objj_msgSend(aCoder, "encodeObject:forKey:", artist, "Artist");
    objj_msgSend(aCoder, "encodeObject:forKey:", time, "Time");
    objj_msgSend(aCoder, "encodeObject:forKey:", genre, "Genre");
    objj_msgSend(aCoder, "encodeObject:forKey:", rating, "Rating");
    objj_msgSend(aCoder, "encodeObject:forKey:", pathToAlbumArt, "PathToAlbumArt");
    objj_msgSend(aCoder, "encodeObject:forKey:", songID, "SongID");
    objj_msgSend(aCoder, "encodeObject:forKey:", local, "Local");
    objj_msgSend(aCoder, "encodeObject:forKey:", pathToSong, "PathToSong");
}
},["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $XYZSong__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZSong").super_class }, "init");
    if (self)
    {
        songTitle = objj_msgSend(aCoder, "decodeObjectForKey:", "SongTitle");
        artist = objj_msgSend(aCoder, "decodeObjectForKey:", "Artist");
        time = objj_msgSend(aCoder, "decodeObjectForKey:", "Time");
        genre = objj_msgSend(aCoder, "decodeObjectForKey:", "Genre");
        rating = objj_msgSend(aCoder, "decodeObjectForKey:", "Rating");
        pathToAlbumArt = objj_msgSend(aCoder, "decodeObjectForKey:", "PathToAlbumArt");
        songID = objj_msgSend(aCoder, "decodeObjectForKey:", "SongID");
        local = objj_msgSend(aCoder, "decodeObjectForKey:", "Local");
        pathToSong = objj_msgSend(aCoder, "decodeObjectForKey:", "PathToSong");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("starRatingForSongChanged:"), function $XYZSong__starRatingForSongChanged_(self, _cmd, aNotification)
{ with(self)
{
    CPLog.trace("notified!!");
    var info = objj_msgSend(aNotification, "userInfo");
    var aux = objj_msgSend(info, "objectForKey:", "rating");
    objj_msgSend(self, "setRating:",  aux);
    CPLog.trace(objj_msgSend(self, "rating"));
}
},["void","CPNotification"]), new objj_method(sel_getUid("setStarRater:"), function $XYZSong__setStarRater_(self, _cmd, aRater)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("starRatingForSongChanged:"), "StarRatingForSongChanged", aRater);
}
},["void","StarRatingView"]), new objj_method(sel_getUid("description"), function $XYZSong__description(self, _cmd)
{ with(self)
{
    return songTitle +"-"+ songID;
}
},["CPString"])]);
}

