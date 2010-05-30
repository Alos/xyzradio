//
//  MainBrowser.j
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
@import "XYZPlayListWindow.j"
@import "XYZColumnModel.j"
@import "XYZTable.j"

/*The Music browser*/
@implementation MainBrowser : XYZPlayListWindow
{
}

- (id)initWithSource:(CPArray)list rectangle:(CGRect)aRectangle{
    //Initializing a window
    self = [super initWithContentRect:aRectangle];
    if (self)//pa ver si no somos null :P
    {
        //le ponemos titulo al HUD lo centramos
        [self setTitle:@"Music Browser"];
        var contentView = [self contentView];
        var bounds = [contentView bounds];

        [self getAllSongs];
        
        //para los titulos
        var playingColumnModel = [[XYZColumnModel alloc] initWithFrame:CGRectMake(10, 7, 26, 31) title:" " color:nil];
        var titleColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(27, 7, 202, 31) title:"Name" color:nil];
        var artistColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(230, 7, 190, 31) title:"Artist" color: nil];
        var timeColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(422, 7, 48, 31) title:"Time" color: nil];
        var ratingColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(470, 7, 48, 31) title:"Rating" color: nil];
    
        var fullModel = [CPDictionary dictionaryWithObjects:[playingColumnModel, titleColumnModel, artistColumnModel, timeColumnModel, ratingColumnModel] forKeys:["playing", "title", "artist", "time", "rating"]];
        
        theTable = [[XYZTable alloc] initWithColumnModel:fullModel model:list frame: bounds];
        
        [contentView addSubview: theTable];    

        //refreshes the music list
        [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(getAllSongs:) name:"NewSongAddedXYZEvent" object:nil];
        [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(getAllSongs:) name:"SubmitSuccessful" object:nil];
    }
    
    return self;
}
-(void)addItem:(CPObject)anObject{
    [theTable addItem:anObject];
}
-(void)addList:(CPArray)aModel
{   
    CPLog.trace("addlist here!");
    [theTable setModel: aModel];
    //podemos el arreglo de todas las canciones en la lista principal de canciones
    var app = [CPApp delegate];
    [app setGlobalSongList: aModel];
}
-(void)removeSelectedItems{
   CPLog.trace("removeSlectedItems in SFBrowser got a msg");
   [theTable removeSelectedItems];
}

- (void)getAllSongs{
    var app = [CPApp delegate];
    var url = [app serverIP]+"/GetAllSongs";
    theRequest = [CPURLRequest requestWithURL: url];
    serverConnection = [CPURLConnection connectionWithRequest:theRequest delegate:self];
}

- (void)getAllSongs:(CPNotification)aNotification{
    var app = [CPApp delegate];
    var url = [app serverIP]+"/GetAllSongs";
    theRequest = [CPURLRequest requestWithURL: url];
    serverConnection = [CPURLConnection connectionWithRequest:theRequest delegate:self];
}
/*Delegate methods*/

//for the connections delegate
- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    var response =  JSON.parse(data);

    if(!response.error){
        //Everything is ok now we fill the table with songs!
        CPLog.info("Filling songs...");
        var songsArray = [[CPArray alloc] init];
        for(var i=0; i< response.length; i++){
            var info = response[i];
            var newSong = [[XYZSong alloc] init];
            [newSong setSongTitle:info.songTitle];
            [newSong setArtist:info.artist];
            [newSong setTime:info.time];
            [newSong setGenre:info.genre];
            [newSong setRating:info.rating];
            [newSong setSongID:info.songID];
            [newSong setLocal:info.isLocal];
            [newSong setPathToSong:info.pathToSong];
            [newSong setPathToAlbumArt:info.pathToAlbumArt];
            CPLog.trace("El valor de songID del objeto es: "+ [newSong songID] );
            [songsArray addObject: newSong];
        }
        [self addList:songsArray];
    }else{
        //no user was found lets ask the new user stuff
        CPLog.info("No songs found in data!");  
    }
    
}

-(void)connectionDidFinishLoading:(CPURLConnection)connection{
    //nothing
    connection = null;
}



@end