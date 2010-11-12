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
@import "gui/DJList.j"
@import "gui/MainBrowser.j"
@import "controllers/PlayerControl.j"
@import "gui/PreferencesWindow.j"
@import "model/XYZSong.j"
@import "gui/UsersWindow.j"
@import "controllers/DCFormController.j"
@import "gui/UserCell.j"
@import "model/XYZUser.j"
@import "controllers/EventListenerManager.j"
@import "gui/MainUserProfileWindow.j"
@import "gui/AddSongWindow.j"

var BotonBrowserIdentifier = "BotonBrowserIdentifier",
    BotonMiListaIdentifier = "BotonMiListaIdentifier",
    AddSongToolbarItemIdentifier = "AddSongToolbarItemIdentifier",
    RemoveSongToolbarItemIdentifier = "RemoveSongToolbarItemIdentifier",
    PreferencesItemIdentifier = "PreferencesItemIdentifier",
    UsersItemIdentifier = "UsresItemIdentifier",
    ProfileItemIdentifier = "ProfileItemIdentifier",
    LogoutIdentifier = "LogoutIdentifier";


@implementation AppController : CPObject
{
    CPArray librarySongs;
    CPToolbar toolbar;
    DJList djList;
    MainBrowser musicBrowser; //main music browser
    PlayerControl playerControl; //the controller that takes care of the playing of songs
                                 //when its intantiated it creates the PlayerWindow
    PreferencesWindow preferencesWindow; //ditto
    CPImage bgImage;
    CPWindow theWindow;
    CPView contentView;
    UsersWindow usersWindow; //Contains a list of all the users friends that are online
    MainUserProfileWindow mainUserProfileWindow; //a place to configure the user stuff
    CPCollectionView listCollectionView;
    CPWindow contentUsers;
    CGRect bounds;
    CPURLConnection xyzradioConnectionForLogin; //takes care of the loggin stuff
    CPString serverIP;
    //LoginWindow loginWindow; //the log window that is presented to the user at the start
    XYZUser userLoggedin @accessors;//the full user
    CPTimer userLoggingTimer;
    EventListenerManager eventListenerManager; //handles the events that might happen on the server side
    AddSongWindow addSongWindow; //allows the user to upload new songs
    CPArray globalSongList @accessors; //the list with all the songs in the user lib
}


- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    CPLogRegister(CPLogConsole);
    CPLog.info("Inicio de ventana");
    theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
    contentView = [theWindow contentView];
    //bg
    //bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/wallpapers/xyzradiowallpaper.png" size:CPSizeMake(30, 25)];
    //[contentView setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
    [contentView setBackgroundColor:[CPColor colorWithHexString:"666666"]];
    //sizes
    bounds = [contentView bounds];
    librarySongs = [[CPArray alloc] init];    
    //el rectangulo de los controles
    toolbar= [[CPToolbar alloc] initWithIdentifier:@"main-toolbar"];
    [theWindow setToolbar: toolbar]; 
    [toolbar setDelegate:self];
   
    //serverIP = "http://localhost:8888"; 
    serverIP = "http://xyzradioengine.appspot.com";	
    //[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(closeLoginWindow:) name:"LoginSuccessful" object:nil];

    
    /*console.log("Opening sound!"); 
    var sound = [[CPSound alloc] initWithResource:@"Resources/LocalMusic/Rewrite.mp3"]; 
    [sound setDelegate:self];
    [sound play];
    console.log("playing...");*/

    musicBrowser = [[MainBrowser alloc] initWithSource:librarySongs rectangle:CGRectMake(0, 0, 600, 500)];
    [musicBrowser setFrameOrigin:(CPPointMake(60, 100))];

    djList = [[DJList alloc] initWithSource:librarySongs contentRect: CGRectMake(700, 100, 600, 500)];
    [djList setFrameOrigin:(CPPointMake(700, 100))];

    //brings the window to the front
    [theWindow orderFront:self];

    playerControl=[[PlayerControl alloc] initWithMainPlayingList:musicBrowser djList:djList];

}

-(CPView) contentView{
    return contentView;
}

-(void)setServerIP:(CPString)aURL{
    serverIP = aURL;
}

-(XYZUser)userLoggedin{
	return userLoggedin;
}

-(void)setUserLoggedin:(XYZUser)aUser{
	userLoggedin= aUser;
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

//abre el formulario para subir una cancion
-(void)openAddSongForm{
 
 if(!addSongWindow)
        addSongWindow = [[AddSongWindow alloc] initWithContentRect:CGRectMake(500, 50, 500, 400) styleMask: CPHUDBackgroundWindowMask|CPClosableWindowMask];
        [addSongWindow setFrameOrigin:(CPPointMake(500, 50))];
    if([addSongWindow isVisible]){
        [addSongWindow setFrameOrigin:(CPPointMake(500, 100))];
        [addSongWindow close];
    }
    else    
        [addSongWindow orderFront:self];

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

//Opens the user window, when this is done the timer starts and gets the events from the server every X minutes
    -(void)openUsers{
        if(!usersWindow){
            usersWindow = [[UsersWindow alloc] contentRect:CGRectMake(5,60,247,CGRectGetHeight(bounds)-60) styleMask:CPBorderlessWindowMask];
            [usersWindow setFrameOrigin:(CPPointMake(5, 70))];

            CPLog.info("Starting timer!");
            userLoggingTimer = [CPTimer scheduledTimerWithTimeInterval:15.0 target: self selector:"checkForNewUsers:" userInfo:nil repeats:YES ];
            
            [usersWindow orderFront:self];
        }else{
            if([usersWindow isVisible]){
                [usersWindow close];
                CPLog.info("Stoping the timer");
                [userLoggingTimer invalidate];
            }
            else{
                CPLog.info("Restarting the timer");
                userLoggingTimer = [CPTimer scheduledTimerWithTimeInterval:15.0 target: self selector:"checkForNewUsers:" userInfo:nil repeats:YES ];
    
                [usersWindow orderFront:self];
            }
        }
    }

//Abre la ventana de perfil de usuario
-(void)openProfile{
  if(!mainUserProfileWindow){
    mainUserProfileWindow = [[MainUserProfileWindow alloc] initWithContentRect:CGRectMake(100,200,300,400) styleMask:CPHUDBackgroundWindowMask|CPClosableWindowMask];
    [mainUserProfileWindow setFrameOrigin:(CPPointMake(100, 200))];
    [mainUserProfileWindow orderFront:self];
  }else{
    if([mainUserProfileWindow isVisible]){
        [mainUserProfileWindow close];
    }else{
        [mainUserProfileWindow orderFront:self];
    }
  }
}

-(void)checkForNewUsers:(CPTimer)theTimer{
        CPLog.info("Getting events");
        eventListenerManager = [[EventListenerManager alloc] init];
        [eventListenerManager getEvents];
}

- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar
{
   return [CPToolbarFlexibleSpaceItemIdentifier, BotonBrowserIdentifier,BotonMiListaIdentifier, AddSongToolbarItemIdentifier, UsersItemIdentifier, ProfileItemIdentifier, RemoveSongToolbarItemIdentifier, LogoutIdentifier, PreferencesItemIdentifier];
}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
   return [BotonBrowserIdentifier, BotonMiListaIdentifier, AddSongToolbarItemIdentifier, RemoveSongToolbarItemIdentifier, UsersItemIdentifier, ProfileItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier, PreferencesItemIdentifier,LogoutIdentifier];
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag
{
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier: anItemIdentifier];

    if (anItemIdentifier == BotonBrowserIdentifier)
    {   //TODO crear una view y luego ponerle 
        // setAutoresizingMask: CPViewMinYMargin | CPViewMaxYMargin

        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/biblioteca.png" size:CPSizeMake(27, 27)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/bibliotecaOff.png" size:CPSizeMake(27, 27)];

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
        
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/dj.png" size:CPSizeMake(27, 27)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/djOff.png" size:CPSizeMake(27, 27)];

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
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/addSong.png" size:CPSizeMake(27, 27)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/addSongOff.png" size:CPSizeMake(27, 27)];
            
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
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/removeSong.png" size:CPSizeMake(27, 27)],
        highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/removeSongOff.png" size:CPSizeMake(27, 27)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(removeSong)];
        [toolbarItem setLabel: "Remove a song"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    //ventana de usuarios
    else if(anItemIdentifier == UsersItemIdentifier){
    var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/usuario.png" size:CPSizeMake(27, 27)],
        highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/usuariosOff.png" size:CPSizeMake(27, 27)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(openUsers)];
        [toolbarItem setLabel: "Users"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];

    }else if(anItemIdentifier == ProfileItemIdentifier){
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/miperfiloff.png" size:CPSizeMake(27, 27)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/miperfilon.png" size:CPSizeMake(27, 27)];
            
        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(openProfile)];
        [toolbarItem setLabel: "Profile"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];

    }else if (anItemIdentifier == PreferencesItemIdentifier)
    {   
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/setup.png" size:CPSizeMake(27, 27)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/setupOff.png" size:CPSizeMake(27, 27)];

        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];

        [toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(openPreferences)]; 
        [toolbarItem setLabel:"Prefrences"];
        
        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }else if (anItemIdentifier == LogoutIdentifier)
    {   
        var image = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/logouton.png" size:CPSizeMake(27, 27)],
            highlighted = [[CPImage alloc] initWithContentsOfFile:"Resources/buttons/logoutOff.png" size:CPSizeMake(27, 27)];

        [toolbarItem setImage: image];
        [toolbarItem setAlternateImage: highlighted];
        
        [toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(logoutUser)]; 
        [toolbarItem setLabel:"Logout"];

        [toolbarItem setMinSize:CGSizeMake(32, 32)];
        [toolbarItem setMaxSize:CGSizeMake(32, 32)];
    } 

        
    return toolbarItem;
}

-(void)modeSwitch{


}

-(void)logoutUser{
        var url = serverIP+"/LogoutUser?email="+[userLoggedin email];
        CPLog.info("Connecting to" + url);
        var request = [CPURLRequest requestWithURL: url];
        //[self openLoginWindow];
        window.location="http://web.me.com/alos/XYZRadio/Home.html";
}

-(void)loginUser:(CPString)aUser{
        var url = serverIP+"/LoginUser?email="+aUser;
        CPLog.info("Connecting to" + url);
        var request = [CPURLRequest requestWithURL: url];
        var xyzradioConnectionForLogin = [CPURLConnection connectionWithRequest:request delegate:self];
}


    - (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
    {
        CPLog.trace("La data en loging window: %s", data);
        try{
            var response = JSON.parse(data);
    
            if(response.error){
                CPLog.error(response.error);
            }

            if(response){
                var userRecived = [[XYZUser alloc] init];

                [userRecived setEmail: response.email];
                [userRecived setUsernick: response.usernick];
                if(response.pathToAvatar)
                    [userRecived setPathToAvatar: response.pathToAvatar];
                else
                    [userRecived setPathToAvatar:""];
                [userRecived setLogged: response.logged];
                if(response.dj)
                    [userRecived setDj:YES];
                else
                    [userRecived setDj:NO];
                [userRecived setSex: response.sex];
                [userRecived setDjList1: response.djList1];
                [userRecived setDjList2: response.djList2];
                [userRecived setDjList3: response.djList3];
                [userRecived setOwnedSongs: response.ownedSongs];
                [userRecived setUserRating: response.userRating];

                var somePrefrences = [[XYZUserPrefrences alloc] init];

                [userRecived setPrefrences: somePrefrences];

                userLoggedin = userRecived;
                [djList getUserPlaylists]; 
            }

        }catch(e){
            var mensajeGuardar = [[CPAlert alloc] init];
            [mensajeGuardar setTitle:"Server not available"];
            [mensajeGuardar setWindowStyle:CPHUDBackgroundWindowMask];
            [mensajeGuardar setMessageText:"Sorry, the server is not available. Please try again later."];
            [mensajeGuardar addButtonWithTitle:"Ok"];
            [mensajeGuardar runModal];
        }

    }

-(void)openLoginWindow{
        loginWindow = [[LoginWindow alloc] initWithContentRect:CGRectMake(0, 0, 1000, 800) styleMask: CPHUDBackgroundWindowMask | CPBorderlessWindowMask];
        [loginWindow setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [CPLightbox setBackgroundColor:[CPColor colorWithCalibratedRed:0 green:0 blue:0 alpha:0.6]];
        [CPLightbox runModalForWindow:loginWindow];
}


-(void)closeLoginWindow:(CPNotification)aNotification{
    var info = [aNotification userInfo];
    var aux = [info objectForKey:"user"];
    userLoggedin = aux;
    [CPLightbox stopModal];
    [loginWindow close];
    [djList getUserPlaylists];
}

@end

/*@implementation CPPlatfom (myhacks) 
+ (BOOL)supportsDragAndDrop 
{ 
return NO; 
} 

@end 
*/