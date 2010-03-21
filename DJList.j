//
//  DJList.j
//  XYZRadio
//
//  Created by Alos on 10/2/08.
/*
 This file is part of XYZRadio.
 
 XYZRadio is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published by
 the Free Software Foundation, either version 3 of the License.
 
 XYZRadio is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with XYZRadio.  If not, see <http://www.gnu.org/licenses/>.
 */
@import <AppKit/CPPanel.j>
@import "XYZPlayListWindowForDJ.j"
@import "XYZMusicList.j"
@import "XYZTableForDJ.j"
@import "NewPlaylistWindow.j"
@import "SongListDS.j"

@implementation DJList : XYZPlayListWindowForDJ
    {
        CPCollectionView playlistCollectionView; //contains all the playlists
        CPArray playlistsArray; //the array that feeds the playlistCollectionView
        NewPlaylistWindow newPlaylistWindow; //the window to create new playlists
        CPView djListContentView;// this window's content view
        CGRect bounds; //this window's bounds
        SongListDS songListDS; //the datastore to save the playlists 
        XYZMusicList selectedPlaylist; //the currently selected playlist
    }
    
    - (id)initWithSource:(CPArray)list contentRect:(CGRect)aRect{
        self = [super initWithContentRect:aRect];
        if (self)
        {
            [self setTitle:@"DJ List"];

            djListContentView = [self contentView];
            bounds = [djListContentView bounds];
            
            //This controlls the size of the collection view and makes all the layout work
            var playlistCollectionViewWidthSize = 150;
            var playlistCollectionViewHeightSize = 380;
            
            //the DS to senf info to the server
            songListDS = [[SongListDS alloc] init];
    
            
            //getting data
            playlistsArray = [[CPArray alloc] init];

            //the headder for the collectionview
            var headderLabel = [[CPTextField alloc] initWithFrame: CGRectMake(50, 32, 100, 18)];
            [headderLabel setStringValue:"Playlists"];
            [headderLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [djListContentView addSubview: headderLabel];

            //the source list
            //the cells
            var playListCells = [[PlayListCell alloc] initWithFrame:CGRectMakeZero()];

            //para nuestro grid
            playlistCollectionView = [[CPCollectionView alloc] initWithFrame: CGRectMake(0, 0, playlistCollectionViewWidthSize, playlistCollectionViewHeightSize)];
            //los scrolls por si son muchos
            var scrollView = [[CPScrollView alloc] initWithFrame: CGRectMake(0, 50, playlistCollectionViewWidthSize, playlistCollectionViewHeightSize+30)];
            [scrollView setAutohidesScrollers: YES];
            [scrollView setDocumentView: playlistCollectionView]; 
            [scrollView setHasHorizontalScroller:NO];
            [scrollView setAutoresizesSubviews:YES];
            [[scrollView contentView] setBackgroundColor:[CPColor colorWithHexString:"012909"]];
            //los items q representan los renglones
            var listItem = [[CPCollectionViewItem alloc] init];
            [listItem setView: playListCells];  

            [playlistCollectionView setItemPrototype: listItem];  
            [playlistCollectionView setMaxNumberOfColumns:1]; 
            [playlistCollectionView setMinItemSize:CPSizeMake(playlistCollectionViewWidthSize, 20)];
            [playlistCollectionView setMaxItemSize:CPSizeMake(playlistCollectionViewWidthSize, 20)];
            [playlistCollectionView setContent:playlistsArray];
    
            [djListContentView addSubview:scrollView];


            [playlistCollectionView setDelegate: self];

            var newPlaylistButton = [[CPButton alloc] initWithFrame:CGRectMake(20, 470, 50, 18)];
            [newPlaylistButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
            [newPlaylistButton setBezelStyle:CPHUDBezelStyle];
            [newPlaylistButton setTitle:@"  +  "];
            [newPlaylistButton sizeToFit];	        
            [newPlaylistButton setTarget:self];
            [newPlaylistButton setAction:@selector(newPlaylist)];  
            [djListContentView addSubview: newPlaylistButton];
    
            var removePlaylistButton = [[CPButton alloc] initWithFrame:CGRectMake(50, 470, 0, 0)];
            [removePlaylistButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
            [removePlaylistButton setTitle:@"  -  "];
            [removePlaylistButton sizeToFit];    
            [removePlaylistButton setTarget:self];
            [removePlaylistButton setAction:@selector(removePlaylist)];  
            [djListContentView addSubview: removePlaylistButton];

            //border for the playlist hedding
            var border0a = [[CPView alloc] initWithFrame:CGRectMake(2, 30, playlistCollectionViewWidthSize-2, 1)];    
            [border0a setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
            [djListContentView addSubview: border0a];
            var border0b = [[CPView alloc] initWithFrame:CGRectMake(2, 50, playlistCollectionViewWidthSize-2, 1)];    
            [border0b setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
            [djListContentView addSubview: border0b];
    
            //border between source and DJList
            var border1 = [[CPView alloc] initWithFrame:CGRectMake(playlistCollectionViewWidthSize, 30, 1, CGRectGetHeight(bounds)-32)];    
            [border1 setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
            [djListContentView addSubview: border1];

            //border between source and the buttons space
            var border2 = [[CPView alloc] initWithFrame:CGRectMake(2, playlistCollectionViewHeightSize+80, playlistCollectionViewWidthSize-2, 1)];    
            [border2 setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
            [djListContentView addSubview: border2];


            //the DJList
            //para los titulos
            var cmArray =[[CPArray alloc] init]; 
            var titleColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(2, 7, 150, 31) title:"Name" color:nil];
            var artistColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(155, 7, 150, 31) title:"Artist" color: nil];
            var ratingColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(305, 7, 48, 31) title:"Rating" color: nil];

            var fullModel = [CPDictionary dictionaryWithObjects:[titleColumnModel, artistColumnModel, ratingColumnModel] forKeys:["title", "artist", "rating"]];
            //we create a table with an empty model
            theTable = [[XYZTableForDJ alloc] initWithColumnModel:fullModel model:theList frame: CGRectMake(playlistCollectionViewWidthSize, 25, 450, CGRectGetHeight(bounds)-26)];

            [djListContentView addSubview: theTable];    

            //register with the NewPlaylistWindow
            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(addNewPlaylist:) name:"NewPlaylistAdded" object:nil];
            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(playListsRecived:) name:"PlayListsRecived" object:nil];
            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(addSongToPlaylist:) name:"NewSongAddedToPlaylist" object:nil];

        }    
        return self;
    }

    /**
        Ads the song to the sekected playlist and then its saved to the server
    */
    -(void) addSongToPlaylist:(CPNotification)aNotification{
        CPLog.trace("addSongToPlaylist has been summoned");
        var info = [aNotification userInfo];
        var aux = [info objectForKey:"songAdded"];
        CPLog.trace("The song that wants to be added is: "+aux);
        [selectedPlaylist addSong: aux];
        CPLog.trace("It has been done");
        //TODO save it to the server
    }

    
    /**
     Opens a window to name the playlist
     */
    -(void) newPlaylist{
        var mainContentView = [[CPApp delegate] contentView];
        var windowsCenter = [mainContentView convertPoint:[djListContentView center] fromView:djListContentView];
        var xpos = windowsCenter.x - 300/2;
        var ypos = windowsCenter.y - 100/2;
        if(!newPlaylistWindow)
            newPlaylistWindow = [[NewPlaylistWindow alloc] initWithContentRect:CGRectMake(0, 0, 300, 100) styleMask: CPHUDBackgroundWindowMask|CPClosableWindowMask contentViewOfWindow:djListContentView];
        [newPlaylistWindow setFrameOrigin:(CPPointMake(xpos,ypos))];
        [newPlaylistWindow clean];
        [newPlaylistWindow orderFront:self];
    }
    
    /**
     Removes the selected playlist
     */
    -(void) removePlaylist{
        for(var i= 0; i<  [playlistsArray count]; i++){
            CPLog.info(i+"->"+[[playlistsArray objectAtIndex: i] nameOfList]);
        }
        var index = [playlistCollectionView selectionIndexes];
        var deletedPlaylist = [playlistsArray  objectAtIndex: [index firstIndex]];
        var nameOfDeletedPlaylist = [deletedPlaylist nameOfList];
        CPLog.info("removing: "+nameOfDeletedPlaylist);
        [playlistsArray removeObjectAtIndex: [index firstIndex]];
        [playlistCollectionView reloadContent];
        [songListDS removePlaylist: escape(nameOfDeletedPlaylist)];
    }
    
    /**
        Adds the playlist form the popup window and then it saved it to the server
    */
    -(void)addNewPlaylist:(CPNotification)aNotification{
        var info = [aNotification userInfo];
        var aux = [info objectForKey:"playlistName"];
        CPLog.info("Adding new playlist!" + aux);
        //we create a new playlist with the info we got
        var newPlaylist =[[XYZMusicList alloc] init];
        [newPlaylist setNameOfList:aux];
        
        //we then add the new playlist to our playListArray and refresh it
        [playlistsArray addObject: newPlaylist];
        [playlistCollectionView reloadContent]; 

        //we send it to the server
        [songListDS addNewPlaylist: aux];
    }

    /**
        Takes the playlists from the server and adds them to the collectionview
    */
    -(void) playListsRecived:(CPNotification)aNotification{
        var info = [aNotification userInfo];
        var aux = [info objectForKey:"playlist"];
        CPLog.info("Recived:"+aux);
        playlistsArray = aux;
        [playlistCollectionView setContent:playlistsArray];
        [playlistCollectionView reloadContent];
    }
    
    /**
        It gets the music playlists from the server
    */
    -(void) getUserPlaylists{
        CPLog.info("Getting playlists...");
        [songListDS getUserPlaylists];
    }

    //DELEGATE METHODS

    /**
        When a playlist is selected its put in the currentlly selected playlist
        when a drag and drop event happens, the song should be added to this object
        that holds the reference to the music list
    */
    -(void)collectionViewDidChangeSelection:(CPCollectionView)collectionView{
        var index = [collectionView selectionIndexes];
        CPLog.trace("Selected index of collectionView: "+ [index firstIndex]);
        CPLog.trace("The playlistsArray contains: "+ playlistsArray);
        selectedPlaylist = [playlistsArray objectAtIndex:[index firstIndex]];
        CPLog.trace("The selected list: "+ selectedPlaylist);
        [theTable setModel: [selectedPlaylist musicList]];
    }
@end

@implementation PlayListCell : CPView
    {
        CPTextField playlistLabel;
        CPImage theIcon;
        CPView highlightView;
    }



    - (void)setRepresentedObject:(JSObject)playlistObject
    {
        if(!playlistLabel)
        {   
            playlistLabel = [[CPTextField alloc] initWithFrame:CGRectInset( [self bounds], 4, 4)];
            [playlistLabel setFont: [CPFont systemFontOfSize: 12.0]];
            [playlistLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview: playlistLabel];
        }

        [playlistLabel setStringValue: [playlistObject nameOfList]];
        [playlistLabel sizeToFit];
        [playlistLabel setFrameOrigin: CGPointMake(10,0.0)];
    }

    - (void)setSelected:(BOOL)flag
    {
        if(!highlightView)
        {
            highlightView = [[CPView alloc] initWithFrame:CGRectCreateCopy([self bounds])];
            [highlightView setBackgroundColor: [CPColor greenColor]];
        }

        if(flag)
        {
            [self addSubview:highlightView positioned:CPWindowBelow relativeTo: playlistLabel];
            [playlistLabel setTextColor: [CPColor blackColor]];            
        }
        else
        {
            [highlightView removeFromSuperview];
            [playlistLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
        }
    }
@end