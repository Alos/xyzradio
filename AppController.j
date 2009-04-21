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
@import <Foundation/CPObject.j>
@import "DJList.j"
@import "MainBrowser.j"
@import "PlayerControl.j"
@import "PreferencesWindow.j"
@import "XYZSong.j"

var BotonBrowserIdentifier = "BotonBrowserIdentifier" ,
    BotonMiListaIdentifier = "BotonMiListaIdentifier",
    AddSongToolbarItemIdentifier = "AddSongToolbarItemIdentifier",
    RemoveSongToolbarItemIdentifier = "RemoveSongToolbarItemIdentifier"
    preferencesItemIdentifier = "preferencesItemIdentifier";


@implementation AppController : CPObject
{
    CPArray librarySongs;
    CPToolbar toolbar;
    DJList djList;
    MainBrowser musicBrowser;
    PlayerControl playerControl;
    PreferencesWindow preferencesWindow;
    CPImage bgImage;
    CPWindow theWindow;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    CPLog.trace("Inicio de ventana");
    theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
    var contentView = [theWindow contentView];
    //bg
    bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/theGoldenAgeOf60.jpg" size:CPSizeMake(30, 25)];
    [contentView setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
    //sizes
    var bounds = [contentView bounds];
    librarySongs = [[CPArray alloc] init];    
    //el rectangulo de los controles
    toolbar= [[CPToolbar alloc] initWithIdentifier:@"main-toolbar"];
    [theWindow setToolbar: toolbar]; 
    [toolbar setDelegate:self];
     
    //testing...
    var demoList = [[CPArray alloc] init]; 
    var song1 = [[XYZSong alloc] initWithSongTitle:@"I just can live a lie" setArtist:@"Carrie Underwood" setID:1 time:"4:00" pathToSong:NULL];
    [demoList addObject:song1];
    var song2 = [[XYZSong alloc] initWithSongTitle:@"Last night" setArtist:@"AZ Yet" setID:2 time:"4:28" pathToSong:NULL];
    [demoList addObject:song2];
    var song3 = [[XYZSong alloc] initWithSongTitle:@"My Last Breath (Live version)" setArtist:@"Evanescence" setID:3 time:"3:59" pathToSong:NULL];
    [demoList addObject:song3];
    var song4 = [[XYZSong alloc] initWithSongTitle:@"Heaven Knows" setArtist:@"Faith Evans" setID:4 time:"5:43" pathToSong:NULL];
    [demoList addObject:song4];
    var song5 = [[XYZSong alloc] initWithSongTitle:@"Trouble" setArtist:@"Pink" setID:5 time:"3:12" pathToSong:NULL];
    [demoList addObject:song5];
    var song6 = [[XYZSong alloc] initWithSongTitle:@"Jaded" setArtist:@"Aerosmith" setID:6 time:"3:27" pathToSong:NULL];
    [demoList addObject:song6];
    var song7 = [[XYZSong alloc] initWithSongTitle:@"Who Knew" setArtist:@"Pink" setID:7 time:"3:21" pathToSong:NULL];
    [demoList addObject:song7];
	var song8 = [[XYZSong alloc] initWithSongTitle:@"Rewrite" setArtist:@"Asian Kung Fu Generation" setID:8 time:"3:47" pathToSong:"Resources/LocalMusic/Rewrite.mp3"];	
    [demoList addObject:song8];
	var song9 = [[XYZSong alloc] initWithSongTitle:@"o.O" setArtist:@"someone" setID:9 time:"??:??" pathToSong:"Resources/LocalMusic/1hz-10khz-sweep.mp3"];	
    [demoList addObject:song9];
    [self addSongList: demoList];
    //brings the window to the front
    [theWindow orderFront:self];
	CPLog.trace("Window ready!");
    [self openBrowser];
	[self openMyList];
	//control init
	playerControl=[[PlayerControl alloc] init: djList];
}
-(void)addSong:(XYZSong)aSong 
{   if(!musicBrowser)
         musicBrowser = [[MainBrowser alloc] initWithSource:librarySongs];
    [musicBrowser addItem: aSong];
}
- (void)addSongList:(CPArray)songs
{    
    if(!musicBrowser){
        musicBrowser = [[MainBrowser alloc] initWithSource:songs];
    }
    else{
        [musicBrowser addList:songs];
    }
}
-(void)removeSong{
    if(djList)
        [djList removeSelectedItems];
}
- (void)connection:(CPJSONPConnection)aConnection didReceiveData:(CPString)data
{
    [self addSongList: data.songs];
}

- (void)connection:(CPJSONPConnection)aConnection didFailWithError:(CPString)error
{
    alert(error);
}

/*Abre el player*/
-(void)togglePlayerWindow{
	[playerControl togglePlayerWindow];
}
-(void)openPreferences{
    if(!preferencesWindow)
        preferencesWindow = [[Preferences alloc] initWithParentWindow:theWindow];
    if([[preferencesWindow window] isVisible]){
        [[preferencesWindow window] setFrameOrigin:(CPPointMake(500, 50))];
        [[preferencesWindow window] orderOut:self];
    }
    else    
    [[preferencesWindow window] orderFront:self];
}
/*Abre la lista de canciones del usuario*/
-(void)openMyList{
    if(!djList)
        djList = [[DJList alloc] initWithSource:librarySongs];
    if([[djList window] isVisible]){
        [[djList window] setFrameOrigin:(CPPointMake(900, 60))];
        [[djList window] orderOut:self];
    }
    else    
    [[djList window] orderFront:self];
}
/*Abre la ventana de canciones*/
-(void)openBrowser{
    if(!musicBrowser){
        console.log("Intentando crear nueva ventana...");
        musicBrowser = [[MainBrowser alloc] initWithSource:librarySongs];
    }
    if([[musicBrowser window] isVisible]){
        [[musicBrowser window] setFrameOrigin:(CPPointMake(0, 60))];
        [[musicBrowser window] orderOut:self];
    }
    else    
        [[musicBrowser window] orderFront:self];
}

- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar
{
   return [CPToolbarFlexibleSpaceItemIdentifier, BotonBrowserIdentifier,BotonMiListaIdentifier,AddSongToolbarItemIdentifier,RemoveSongToolbarItemIdentifier,preferencesItemIdentifier];
}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
   return [BotonBrowserIdentifier,BotonMiListaIdentifier,AddSongToolbarItemIdentifier,RemoveSongToolbarItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier,preferencesItemIdentifier];
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag
{
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier: anItemIdentifier];

    if (anItemIdentifier == BotonBrowserIdentifier)
    {   //TODO crear una view y luego ponerle 
        // setAutoresizingMask: CPViewMinYMargin | CPViewMaxYMargin
		
		var image = [[CPImage alloc] initWithContentsOfFile:"Resources/listaGeneralIcon.png" size:CPSizeMake(30, 25)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/listaGeneralHightlighted.png" size:CPSizeMake(30, 25)];
			
		[toolbarItem setImage: image];
		[toolbarItem setAlternateImage: highlighted];
		
		[toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(openBrowser)]; 
		[toolbarItem setLabel: "Music Browser"];
		 
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier == BotonMiListaIdentifier)
    {   //TODO crear una view y luego ponerle 
        // setAutoresizingMask: CPViewMinYMargin | CPViewMaxYMargin
		
		var image = [[CPImage alloc] initWithContentsOfFile:"Resources/iListIcon.png" size:CPSizeMake(30, 25)],
		highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/iListIconHightlighted.png" size:CPSizeMake(30, 25)];
		
		[toolbarItem setImage: image];
		[toolbarItem setAlternateImage: highlighted];
		
        [toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(openMyList)]; 
		[toolbarItem setLabel:"DJList"];

        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier == AddSongToolbarItemIdentifier)
    {
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/add.png" size:CPSizeMake(30, 25)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/addHighlighted.png" size:CPSizeMake(30, 25)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];
        
        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(addSong:)];
        [toolbarItem setLabel: "Add a song"];

        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier == RemoveSongToolbarItemIdentifier)
    {        
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/remove.png" size:CPSizeMake(30, 25)],
        highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/removeHighlighted.png" size:CPSizeMake(30, 25)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(removeSong)];
        [toolbarItem setLabel: "Remove a song"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier == preferencesItemIdentifier)
    {   //TODO crear una view y luego ponerle 
        // setAutoresizingMask: CPViewMinYMargin | CPViewMaxYMargin
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/prefrencesIcon.png" size:CPSizeMake(30, 25)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/prefrencesIconHightlighted.png" size:CPSizeMake(30, 25)];
		
		[toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];
		
		[toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(openPreferences)]; 
        [toolbarItem setLabel:"Prefrences"];
		
        [toolbarItem setMinSize:CGSizeMake(180, 32)];
        [toolbarItem setMaxSize:CGSizeMake(180, 32)];
    }

        
    return toolbarItem;
}

@end

