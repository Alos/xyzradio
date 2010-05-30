@STATIC;1.0;I;16;AppKit/CPPanel.ji;24;XYZPlayListWindowForDJ.ji;23;../model/XYZMusicList.ji;15;XYZTableForDJ.ji;19;NewPlaylistWindow.ji;25;../dataStore/SongListDS.jt;14442;objj_executeFile("AppKit/CPPanel.j", NO);
objj_executeFile("XYZPlayListWindowForDJ.j", YES);
objj_executeFile("../model/XYZMusicList.j", YES);
objj_executeFile("XYZTableForDJ.j", YES);
objj_executeFile("NewPlaylistWindow.j", YES);
objj_executeFile("../dataStore/SongListDS.j", YES);
{var the_class = objj_allocateClassPair(XYZPlayListWindowForDJ, "DJList"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("playlistCollectionView"), new objj_ivar("playlistsArray"), new objj_ivar("newPlaylistWindow"), new objj_ivar("djListContentView"), new objj_ivar("bounds"), new objj_ivar("songListDS"), new objj_ivar("selectedPlaylist")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithSource:contentRect:"), function $DJList__initWithSource_contentRect_(self, _cmd, list, aRect)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DJList").super_class }, "initWithContentRect:", aRect);
        if (self)
        {
            objj_msgSend(self, "setTitle:", "DJ List");
            djListContentView = objj_msgSend(self, "contentView");
            bounds = objj_msgSend(djListContentView, "bounds");
            var playlistCollectionViewWidthSize = 150;
            var playlistCollectionViewHeightSize = 380;
            songListDS = objj_msgSend(objj_msgSend(SongListDS, "alloc"), "init");
            playlistsArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            var headderLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(50, 32, 100, 18));
            objj_msgSend(headderLabel, "setStringValue:", "Playlists");
            objj_msgSend(headderLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  headderLabel);
            var playListCells = objj_msgSend(objj_msgSend(PlayListCell, "alloc"), "initWithFrame:", CGRectMakeZero());
            playlistCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:",  CGRectMake(0, 0, playlistCollectionViewWidthSize, playlistCollectionViewHeightSize));
            var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:",  CGRectMake(0, 50, playlistCollectionViewWidthSize, playlistCollectionViewHeightSize+30));
            objj_msgSend(scrollView, "setAutohidesScrollers:",  YES);
            objj_msgSend(scrollView, "setDocumentView:",  playlistCollectionView);
            objj_msgSend(scrollView, "setHasHorizontalScroller:", NO);
            objj_msgSend(scrollView, "setAutoresizesSubviews:", YES);
            objj_msgSend(objj_msgSend(scrollView, "contentView"), "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "012909"));
            var listItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
            objj_msgSend(listItem, "setView:",  playListCells);
            objj_msgSend(playlistCollectionView, "setItemPrototype:",  listItem);
            objj_msgSend(playlistCollectionView, "setMaxNumberOfColumns:", 1);
            objj_msgSend(playlistCollectionView, "setMinItemSize:", CPSizeMake(playlistCollectionViewWidthSize, 20));
            objj_msgSend(playlistCollectionView, "setMaxItemSize:", CPSizeMake(playlistCollectionViewWidthSize, 20));
            objj_msgSend(playlistCollectionView, "setContent:", playlistsArray);
            objj_msgSend(djListContentView, "addSubview:", scrollView);
            objj_msgSend(playlistCollectionView, "setDelegate:",  self);
            var newPlaylistButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(20, 470, 50, 18));
            objj_msgSend(newPlaylistButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(newPlaylistButton, "setBezelStyle:", CPHUDBezelStyle);
            objj_msgSend(newPlaylistButton, "setTitle:", "  +  ");
            objj_msgSend(newPlaylistButton, "sizeToFit");
            objj_msgSend(newPlaylistButton, "setTarget:", self);
            objj_msgSend(newPlaylistButton, "setAction:", sel_getUid("newPlaylist"));
            objj_msgSend(djListContentView, "addSubview:",  newPlaylistButton);
            var removePlaylistButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(50, 470, 0, 0));
            objj_msgSend(removePlaylistButton, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
            objj_msgSend(removePlaylistButton, "setTitle:", "  -  ");
            objj_msgSend(removePlaylistButton, "sizeToFit");
            objj_msgSend(removePlaylistButton, "setTarget:", self);
            objj_msgSend(removePlaylistButton, "setAction:", sel_getUid("removePlaylist"));
            objj_msgSend(djListContentView, "addSubview:",  removePlaylistButton);
            var border0a = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2, 30, playlistCollectionViewWidthSize-2, 1));
            objj_msgSend(border0a, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border0a);
            var border0b = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2, 50, playlistCollectionViewWidthSize-2, 1));
            objj_msgSend(border0b, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border0b);
            var border1 = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(playlistCollectionViewWidthSize, 30, 1, CGRectGetHeight(bounds)-32));
            objj_msgSend(border1, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border1);
            var border2 = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2, playlistCollectionViewHeightSize+80, playlistCollectionViewWidthSize-2, 1));
            objj_msgSend(border2, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(djListContentView, "addSubview:",  border2);
            var cmArray =objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            var titleColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(2, 7, 150, 31), "Name", nil);
            var artistColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(155, 7, 150, 31), "Artist",  nil);
            var ratingColumnModel =objj_msgSend(objj_msgSend(XYZColumnModel, "alloc"), "initWithFrame:title:color:", CGRectMake(305, 7, 48, 31), "Rating",  nil);
            var fullModel = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [titleColumnModel, artistColumnModel, ratingColumnModel], ["title", "artist", "rating"]);
            theTable = objj_msgSend(objj_msgSend(XYZTableForDJ, "alloc"), "initWithColumnModel:model:frame:", fullModel, theList,  CGRectMake(playlistCollectionViewWidthSize, 25, 450, CGRectGetHeight(bounds)-26));
            objj_msgSend(djListContentView, "addSubview:",  theTable);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("addNewPlaylist:"), "NewPlaylistAdded", nil);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("playListsRecived:"), "PlayListsRecived", nil);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("addSongToPlaylist:"), "NewSongAddedToPlaylist", nil);
        }
        return self;
    }
},["id","CPArray","CGRect"]), new objj_method(sel_getUid("addSongToPlaylist:"), function $DJList__addSongToPlaylist_(self, _cmd, aNotification)
{ with(self)
{
        CPLog.trace("On addSongToPlaylist in the DJPlaylist.j");
        var info = objj_msgSend(aNotification, "userInfo");
        var aux = objj_msgSend(info, "objectForKey:", "songAdded");
        CPLog.trace("The song that wants to be added is: "+aux+" with the id " + objj_msgSend(aux, "songID"));
        objj_msgSend(songListDS, "addSongToPlaylist:song:", escape(objj_msgSend(selectedPlaylist, "nameOfList")), aux);
    }
},["void","CPNotification"]), new objj_method(sel_getUid("newPlaylist"), function $DJList__newPlaylist(self, _cmd)
{ with(self)
{
        var mainContentView = objj_msgSend(objj_msgSend(CPApp, "delegate"), "contentView");
        var windowsCenter = objj_msgSend(mainContentView, "convertPoint:fromView:", objj_msgSend(djListContentView, "center"), djListContentView);
        var xpos = windowsCenter.x - 300/2;
        var ypos = windowsCenter.y - 100/2;
        if(!newPlaylistWindow)
            newPlaylistWindow = objj_msgSend(objj_msgSend(NewPlaylistWindow, "alloc"), "initWithContentRect:styleMask:contentViewOfWindow:", CGRectMake(0, 0, 300, 100),  CPHUDBackgroundWindowMask|CPClosableWindowMask, djListContentView);
        objj_msgSend(newPlaylistWindow, "setFrameOrigin:", (CPPointMake(xpos,ypos)));
        objj_msgSend(newPlaylistWindow, "clean");
        objj_msgSend(newPlaylistWindow, "orderFront:", self);
    }
},["void"]), new objj_method(sel_getUid("removePlaylist"), function $DJList__removePlaylist(self, _cmd)
{ with(self)
{
        for(var i= 0; i< objj_msgSend(playlistsArray, "count"); i++){
            CPLog.info(i+"->"+objj_msgSend(objj_msgSend(playlistsArray, "objectAtIndex:",  i), "nameOfList"));
        }
        var index = objj_msgSend(playlistCollectionView, "selectionIndexes");
        var deletedPlaylist = objj_msgSend(playlistsArray, "objectAtIndex:",  objj_msgSend(index, "firstIndex"));
        var nameOfDeletedPlaylist = objj_msgSend(deletedPlaylist, "nameOfList");
        CPLog.info("removing: "+nameOfDeletedPlaylist);
        objj_msgSend(playlistsArray, "removeObjectAtIndex:",  objj_msgSend(index, "firstIndex"));
        objj_msgSend(playlistCollectionView, "reloadContent");
        objj_msgSend(songListDS, "removePlaylist:",  escape(nameOfDeletedPlaylist));
    }
},["void"]), new objj_method(sel_getUid("addNewPlaylist:"), function $DJList__addNewPlaylist_(self, _cmd, aNotification)
{ with(self)
{
        var info = objj_msgSend(aNotification, "userInfo");
        var aux = objj_msgSend(info, "objectForKey:", "playlistName");
        CPLog.info("Adding new playlist!" + aux);
        var newPlaylist =objj_msgSend(objj_msgSend(XYZMusicList, "alloc"), "init");
        objj_msgSend(newPlaylist, "setNameOfList:", aux);
        objj_msgSend(playlistsArray, "addObject:",  newPlaylist);
        objj_msgSend(playlistCollectionView, "reloadContent");
        objj_msgSend(songListDS, "addNewPlaylist:",  aux);
    }
},["void","CPNotification"]), new objj_method(sel_getUid("playListsRecived:"), function $DJList__playListsRecived_(self, _cmd, aNotification)
{ with(self)
{
        var info = objj_msgSend(aNotification, "userInfo");
        var aux = objj_msgSend(info, "objectForKey:", "playlist");
        CPLog.info("Recived:"+aux);
        playlistsArray = aux;
        objj_msgSend(playlistCollectionView, "setContent:", playlistsArray);
        objj_msgSend(playlistCollectionView, "reloadContent");
    }
},["void","CPNotification"]), new objj_method(sel_getUid("getUserPlaylists"), function $DJList__getUserPlaylists(self, _cmd)
{ with(self)
{
        CPLog.info("Getting playlists...");
        objj_msgSend(songListDS, "getUserPlaylists");
    }
},["void"]), new objj_method(sel_getUid("collectionViewDidChangeSelection:"), function $DJList__collectionViewDidChangeSelection_(self, _cmd, collectionView)
{ with(self)
{
        var index = objj_msgSend(collectionView, "selectionIndexes");
        CPLog.trace("Selected index of collectionView: "+ objj_msgSend(index, "firstIndex"));
        CPLog.trace("The playlistsArray contains: "+ playlistsArray);
        selectedPlaylist = objj_msgSend(playlistsArray, "objectAtIndex:", objj_msgSend(index, "firstIndex"));
        CPLog.trace("The selected list: "+ selectedPlaylist);
        objj_msgSend(theTable, "setModel:",  objj_msgSend(selectedPlaylist, "musicList"));
    }
},["void","CPCollectionView"])]);
}
{var the_class = objj_allocateClassPair(CPView, "PlayListCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("playlistLabel"), new objj_ivar("theIcon"), new objj_ivar("highlightView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function $PlayListCell__setRepresentedObject_(self, _cmd, playlistObject)
{ with(self)
{
        if(!playlistLabel)
        {
            playlistLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset( objj_msgSend(self, "bounds"), 4, 4));
            objj_msgSend(playlistLabel, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
            objj_msgSend(playlistLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  playlistLabel);
        }
        objj_msgSend(playlistLabel, "setStringValue:",  objj_msgSend(playlistObject, "nameOfList"));
        objj_msgSend(playlistLabel, "sizeToFit");
        objj_msgSend(playlistLabel, "setFrameOrigin:",  CGPointMake(10,0.0));
    }
},["void","JSObject"]), new objj_method(sel_getUid("setSelected:"), function $PlayListCell__setSelected_(self, _cmd, flag)
{ with(self)
{
        if(!highlightView)
        {
            highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectCreateCopy(objj_msgSend(self, "bounds")));
            objj_msgSend(highlightView, "setBackgroundColor:",  objj_msgSend(CPColor, "greenColor"));
        }
        if(flag)
        {
            objj_msgSend(self, "addSubview:positioned:relativeTo:", highlightView, CPWindowBelow,  playlistLabel);
            objj_msgSend(playlistLabel, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        }
        else
        {
            objj_msgSend(highlightView, "removeFromSuperview");
            objj_msgSend(playlistLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        }
    }
},["void","BOOL"])]);
}

