@STATIC;1.0;i;17;SongURLUploader.jt;9117;objj_executeFile("SongURLUploader.j", YES);
{var the_class = objj_allocateClassPair(CPView, "UploadURLForm"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("urlField"), new objj_ivar("titleField"), new objj_ivar("artistField"), new objj_ivar("genreField"), new objj_ivar("timeField"), new objj_ivar("pathAlbumArtField"), new objj_ivar("componentsArray"), new objj_ivar("submitSongButton"), new objj_ivar("songURLUploader")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $UploadURLForm__initWithFrame_(self, _cmd, aRectangle)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadURLForm").super_class }, "initWithFrame:",  aRectangle);
        if(self){
            componentsArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            songURLUploader = objj_msgSend(objj_msgSend(SongURLUploader, "alloc"), "init");
            var URLFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(47, 40, 100, 18));
            objj_msgSend(URLFieldLabel, "setStringValue:", "URL:");
            objj_msgSend(URLFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  URLFieldLabel);
            urlField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 32, 300, 30));
            objj_msgSend(urlField, "setEditable:", YES);
            objj_msgSend(urlField, "setBezeled:", YES);
            objj_msgSend(urlField, "setPlaceholderString:", "http://www.someurl.com/yoursong.mp3");
            objj_msgSend(urlField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", urlField);
            objj_msgSend(self, "addSubview:", urlField);
            var titleFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 80, 100, 18));
            objj_msgSend(titleFieldLabel, "setStringValue:", "Song title:");
            objj_msgSend(titleFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  titleFieldLabel);
            titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 72, 300, 30));
            objj_msgSend(titleField, "setEditable:", YES);
            objj_msgSend(titleField, "setBezeled:", YES);
            objj_msgSend(titleField, "setPlaceholderString:", "Some title");
            objj_msgSend(titleField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", titleField);
            objj_msgSend(self, "addSubview:", titleField);
            var artistFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(45, 120, 100, 18));
            objj_msgSend(artistFieldLabel, "setStringValue:", "Artist:");
            objj_msgSend(artistFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  artistFieldLabel);
            artistField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 112, 200, 30));
            objj_msgSend(artistField, "setEditable:", YES);
            objj_msgSend(artistField, "setBezeled:", YES);
            objj_msgSend(artistField, "setPlaceholderString:", "Some Artist");
            objj_msgSend(artistField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:",  artistField);
            objj_msgSend(self, "addSubview:", artistField);
            var genreFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(38, 160, 100, 18));
            objj_msgSend(genreFieldLabel, "setStringValue:", "Genre:");
            objj_msgSend(genreFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  genreFieldLabel);
            genreField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 152, 100, 30));
            objj_msgSend(genreField, "setEditable:", YES);
            objj_msgSend(genreField, "setBezeled:", YES);
            objj_msgSend(genreField, "setPlaceholderString:", "Some genre");
            objj_msgSend(genreField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", genreField);
            objj_msgSend(self, "addSubview:", genreField);
            var timeFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 200, 100, 18));
            objj_msgSend(timeFieldLabel, "setStringValue:", "Total time:");
            objj_msgSend(timeFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:", timeFieldLabel);
            timeField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 192, 100, 30));
            objj_msgSend(timeField, "setEditable:", YES);
            objj_msgSend(timeField, "setBezeled:", YES);
            objj_msgSend(timeField, "setPlaceholderString:", "02:30");
            objj_msgSend(timeField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", timeField);
            objj_msgSend(self, "addSubview:", timeField);
            var pathAlbumArtFieldLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 240, 100, 18));
            objj_msgSend(pathAlbumArtFieldLabel, "setStringValue:", "Album art:");
            objj_msgSend(pathAlbumArtFieldLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:", pathAlbumArtFieldLabel);
            pathAlbumArtField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(80, 232, 300, 30));
            objj_msgSend(pathAlbumArtField, "setEditable:", YES);
            objj_msgSend(pathAlbumArtField, "setBezeled:", YES);
            objj_msgSend(pathAlbumArtField, "setPlaceholderString:", "http://www.someurl.com/image.jpg");
            objj_msgSend(pathAlbumArtField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "000000"));
            objj_msgSend(componentsArray, "addObject:", pathAlbumArtField);
            objj_msgSend(self, "addSubview:", pathAlbumArtField);
            submitSongButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(330, 272, 50, 18));
            objj_msgSend(submitSongButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(submitSongButton, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(submitSongButton, "setTitle:", "Submit song");
            objj_msgSend(submitSongButton, "sizeToFit");
            objj_msgSend(submitSongButton, "setTarget:", self);
            objj_msgSend(submitSongButton, "setAction:", sel_getUid("submitSong"));
            objj_msgSend(self, "addSubview:", submitSongButton);
        }
        return self;
    }
},["id","CGRect"]), new objj_method(sel_getUid("submitSong"), function $UploadURLForm__submitSong(self, _cmd)
{ with(self)
{
        CPLog.trace("Checking complete fields...");
        var completeData = true;
        for(var i = 0; i < objj_msgSend(componentsArray, "count"); i++){
            var aux = objj_msgSend(componentsArray, "objectAtIndex:", i);
            CPLog.debug(aux);
            if(objj_msgSend(aux, "objectValue") == ""){
                completeData = false;
                break;
            }
        }
        if(completeData){
            CPLog.trace("Fields are complete! Sending song...");
            var url = objj_msgSend(urlField, "objectValue");
            var title = objj_msgSend(titleField, "objectValue");
            var artist = objj_msgSend(artistField, "objectValue");
            var genre = objj_msgSend(genreField, "objectValue");
            var time = objj_msgSend(timeField, "objectValue");
            var albumArt = objj_msgSend(pathAlbumArtField, "objectValue");
            objj_msgSend(songURLUploader, "uploadSongWithTitle:artist:genere:time:pathToAlbumArt:songURL:", title, artist, genre, time, albumArt, url);
        }else{
            var errorAlert = objj_msgSend(objj_msgSend(CPAlert, "alloc"), "init");
            objj_msgSend(errorAlert, "setTitle:", "Incomplete form");
            objj_msgSend(errorAlert, "setWindowStyle:", CPHUDBackgroundWindowMask);
            objj_msgSend(errorAlert, "setMessageText:", "Please fill all the fields to submit your song");
            objj_msgSend(errorAlert, "addButtonWithTitle:", "Ok");
            objj_msgSend(errorAlert, "runModal");
        }
    }
},["void"])]);
}

