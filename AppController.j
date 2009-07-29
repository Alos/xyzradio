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
@import "UsersWindow.j"
@import "CPSound.j"
@import "XYZAddSongView.j"
@import "DCFormController.j"
@import "UserCell.j"
@import "LoginWindow.j"
@import "UserProfileWindow.j"
@import "XYZUser.j"


var BotonBrowserIdentifier = "BotonBrowserIdentifier" ,
    BotonMiListaIdentifier = "BotonMiListaIdentifier",
    AddSongToolbarItemIdentifier = "AddSongToolbarItemIdentifier",
    RemoveSongToolbarItemIdentifier = "RemoveSongToolbarItemIdentifier",
    preferencesItemIdentifier = "preferencesItemIdentifier",
    usersItemIdentifier = "usresItemIdentifier";	


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
    CPView contentView;
    UsersWindow usersWindow;
    CPCollectionView listCollectionView;
    CPWindow contentUsers;
    CGRect bounds;
	CPURLConnection xyzradioConnectionForLogin;
	CPString serverIP;
	LoginWindow loginWindow;
	UserProfileWindow userProfileWindow;
	XYZUser userLoggedin;//the full user
	CPString loggedUserEmail; 
}


- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
	CPLogRegister(CPLogConsole)
    CPLog.info("Inicio de ventana");
    theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
	contentView = [theWindow contentView];
    //bg
    bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/theGoldenAgeOf60.jpg" size:CPSizeMake(30, 25)];
    [contentView setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
    //sizes
    bounds = [contentView bounds];
    librarySongs = [[CPArray alloc] init];    
    //el rectangulo de los controles
    toolbar= [[CPToolbar alloc] initWithIdentifier:@"main-toolbar"];
    [theWindow setToolbar: toolbar]; 
    [toolbar setDelegate:self];
	 
	   
	serverIP = "http://localhost:8080"; 

	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(closeLoginWindow:) name:"LoginSuccessful" object:nil];

	
   
	 
	/*console.log("Opening sound!"); 
	var sound = [[CPSound alloc] initWithResource:@"Resources/LocalMusic/Rewrite.mp3"]; 
	[sound setDelegate:self];
	[sound play];
	console.log("playing...");*/		
	
    //testing...
    var demoList = [[CPArray alloc] init]; 
    var song1 = [[XYZSong alloc] initWithSongTitle:@"do it over" setArtist:@"amélie" setID:1 time:"3:04" pathToSong:"http://files.me.com/alos/h4w1s0.mp3" rating:"4"];
    [demoList addObject:song1];
    var song2 = [[XYZSong alloc] initWithSongTitle:@"Broken Stereo (Acoustic Version)" setArtist:@"AZ Yet" setID:2 time:"4:28" pathToSong:"Resources/LocalMusic/Broken Stereo (Acoustic Version).mp3" rating:"2"];
    [demoList addObject:song2];
    var song3 = [[XYZSong alloc] initWithSongTitle:@"My Last Breath (Live version)" setArtist:@"Evanescence" setID:3 time:"3:59" pathToSong:"" rating:"3"];
    [demoList addObject:song3];
	[self addSongList: demoList];
    //brings the window to the front
    [theWindow orderFront:self];


	musicBrowser = [[MainBrowser alloc] initWithSource:librarySongs rectangle:CGRectMake(0, 0, 600, 500)];
	[musicBrowser setFrameOrigin:(CPPointMake(60, 100))];

	djList = [[DJList alloc] initWithSource:librarySongs contentRect: CGRectMake(700, 100, 600, 500)];
	[djList setFrameOrigin:(CPPointMake(700, 100))];

	playerControl=[[PlayerControl alloc] init: djList];	
    //testing users
    //[self openUsers];
   // [self openLoginWindow];

}

-(void)setServerIP:(CPString)aURL{
	serverIP = aURL;
}

-(CPString)loggedUserEmail{
	return loggedUserEmail;
}

-(void)setLoggedUserEmail:(CPString)anEmail{
	loggedUserEmail= anEmail;
}

-(CPString)serverIP{
	return serverIP;
}

-(void)sound:(CPSound)aSound didFinishPlaying:(BOOL)aBoolean{
	CPLog.info("Sound did finish playing");
}

-(void)theWindow{
	return theWindow;
}

-(void)addSong:(XYZSong)aSong 
{   if(!musicBrowser)
         musicBrowser = [[MainBrowser alloc] initWithSource:librarySongs];
    [musicBrowser addItem: aSong];
}

- (void)addSongList:(CPArray)songs
{    
    if(!musicBrowser){
        musicBrowser = [[MainBrowser alloc] initWithSource:songs rectangle:CGRectMake(60, 100, 600, 500)];
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

//abre la ventana de preferencias
-(void)openPreferences{
    if(!preferencesWindow)
        preferencesWindow = [[PreferencesWindow alloc] initWithContentRect:CGRectMake(500, 50, 400, 500) styleMask: CPHUDBackgroundWindowMask|CPClosableWindowMask contentViewOfWindow:contentView];
		[preferencesWindow setFrameOrigin:(CPPointMake(500, 50))];
    if([preferencesWindow isVisible]){
        [preferencesWindow setFrameOrigin:(CPPointMake(500, 100))];
        [preferencesWindow close];
    }
    else    
    [preferencesWindow orderFront:self];
}


//abre la ventana de usuarios
-(void)openUserProfileWindow{
    if(!userProfileWindow)
        userProfileWindow = [[UserProfileWindow alloc] initWithContentRect:CGRectMake(500, 50, 400, 500) styleMask: CPHUDBackgroundWindowMask|CPClosableWindowMask contentViewOfWindow:contentView];
		[userProfileWindow setFrameOrigin:(CPPointMake(500, 50))];
    if([userProfileWindow isVisible]){
        [userProfileWindow setFrameOrigin:(CPPointMake(500, 50))];
        [userProfileWindow close];
    }
    else    
    [userProfileWindow orderFront:self];
}


//abre el formulario para subir una cancion
-(void)openAddSongForm{
  var addFolloweeFormController = [[DCFormController alloc] initWithFormView:[[XYZAddSongView alloc] initWithFrame:CGRectMake(0,0,400,450)]];
  [addFolloweeFormController startForm];
}

/*Abre la lista de canciones del usuario*/
-(void)openDJList{
    if(!djList){
        djList = [[DJList alloc] initWithSource:librarySongs contentRect: CGRectMake(700, 100, 600, 500)];
	}
    if([djList isVisible]){
        [djList setFrameOrigin:(CPPointMake(700, 100))];
        [djList close];
    }
    else    
    [djList orderFront:self];
}

/*Abre la ventana de canciones*/
-(void)openBrowser{
    if(!musicBrowser){
        musicBrowser = [[MainBrowser alloc] initWithSource:librarySongs rectangle:CGRectMake(0, 0, 600, 500)];
		[musicBrowser setFrameOrigin:(CPPointMake(60, 100))];
    }
    if([musicBrowser isVisible]){
        [musicBrowser setFrameOrigin:(CPPointMake(60, 100))];
        [musicBrowser close];
    }
    else    
        [musicBrowser orderFront:self];
}

//abre la ventana de usuarios
-(void)openUsers{
   if(!usersWindow){
	usersWindow = [[UsersWindow alloc] contentRect:CGRectMake(5,60,247,CGRectGetHeight(bounds)-60) styleMask:CPBorderlessWindowMask];
	[usersWindow setFrameOrigin:(CPPointMake(5, 70))];
   }	
   if([usersWindow isVisible]){
	[usersWindow close];
   }
   else
   	[usersWindow orderFront:self];
}

- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar
{
   return [CPToolbarFlexibleSpaceItemIdentifier, BotonBrowserIdentifier,BotonMiListaIdentifier,AddSongToolbarItemIdentifier,usersItemIdentifier,RemoveSongToolbarItemIdentifier,preferencesItemIdentifier];
}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
   return [BotonBrowserIdentifier,BotonMiListaIdentifier,AddSongToolbarItemIdentifier,RemoveSongToolbarItemIdentifier,usersItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier,preferencesItemIdentifier];
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag
{
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier: anItemIdentifier];

    if (anItemIdentifier == BotonBrowserIdentifier)
    {   //TODO crear una view y luego ponerle 
        // setAutoresizingMask: CPViewMinYMargin | CPViewMaxYMargin
		
		var image = [[CPImage alloc] initWithContentsOfFile:"Resources/biblioteca.png" size:CPSizeMake(30, 25)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/bibliotecaOff.png" size:CPSizeMake(30, 25)];
			
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
		
		var image = [[CPImage alloc] initWithContentsOfFile:"Resources/dj.png" size:CPSizeMake(30, 25)],
		highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/djOff.png" size:CPSizeMake(30, 25)];
		
		[toolbarItem setImage: image];
		[toolbarItem setAlternateImage: highlighted];
		
        [toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(openDJList)]; 
		[toolbarItem setLabel:"DJList"];

        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier == AddSongToolbarItemIdentifier)
    {
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/addSong.png" size:CPSizeMake(30, 25)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/addSongOff.png" size:CPSizeMake(30, 25)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];
        
        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(openAddSongForm)];
        [toolbarItem setLabel: "Add a song"];

        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)]; 
    }
    else if (anItemIdentifier == RemoveSongToolbarItemIdentifier)
    {        
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/removeSong.png" size:CPSizeMake(30, 25)],
        highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/removeSongOff.png" size:CPSizeMake(30, 25)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(removeSong)];
        [toolbarItem setLabel: "Remove a song"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    //ventana de usuarios	
    else if(anItemIdentifier == usersItemIdentifier){
	var image = [[CPImage alloc] initWithContentsOfFile:"Resources/usuario.png" size:CPSizeMake(30, 25)],
        highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/usuariosOff.png" size:CPSizeMake(30, 25)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(openUsers)];
        [toolbarItem setLabel: "Users"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];

    } 	
    else if (anItemIdentifier == preferencesItemIdentifier)
    {   //TODO crear una view y luego ponerle 
        // setAutoresizingMask: CPViewMinYMargin | CPViewMaxYMargin
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/setup.png" size:CPSizeMake(30, 25)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/setupOff.png" size:CPSizeMake(30, 25)];
		
		[toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];
		
		[toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(openPreferences)]; 
        [toolbarItem setLabel:"Prefrences"];
		
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }

        
    return toolbarItem;
}

-(void)openLoginWindow{
		loginWindow = [[LoginWindow alloc] initWithContentRect:CGRectMake(0, 0, 1000, 800) styleMask: CPHUDBackgroundWindowMask | CPBorderlessWindowMask];
		[loginWindow setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
		[CPLightbox setBackgroundColor:[CPColor colorWithCalibratedRed:0 green:0 blue:0 alpha:0.6]];
		[CPLightbox runModalForWindow:loginWindow];
}


-(void)closeLoginWindow:(CPNotification)aNotification{
	[CPLightbox stopModal];
	[loginWindow close];
}

@end

