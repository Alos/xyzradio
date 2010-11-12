//
//  SoundDS.j
//  XYZRadio
//
//  Created by Alos on 21/3/2010.
/*
This file is part of XYZRadio.

    Louhi is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License.

    Louhi is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with Louhi.  If not, see <http://www.gnu.org/licenses/>.
*/

@import "../gui/XYZMusicList.j"
@import "../model/XYZSong.j"

@implementation SongDS : CPObject
{
    CPArray answerArray;  
    CPURLConnection xyzConnection;
}

-(id)init{
    self = [super init];
    if(self){

    }
    return self;
}

/**
    Creates a new playlist for this user
*/
-(void)addNewPlaylist:(CPString)nameOfPlaylist{
    var app = [CPApp delegate];
    var aURL = [app serverIP] + "/AddNewPlaylist?userID=" + [[app userLoggedin] email] + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = [CPURLRequest requestWithURL:aURL];
    xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}



- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    var info =  JSON.parse(data);

    if(!response.error){
        CPLog.info("Filling songs...");
        var newSong = [[XYZSong alloc] init];
        [newSong setSongTitle:info.songTitle];
        [newSong setArtist:info.artist];
        [newSong setTime:info.time];
        [newSong setGenre:info.genre];
        [newSong setRating:info.rating];
        CPLog.warn("El valor de songID es: "+ info.songID );
        [newSong setSongID:info.songID.id];
        [newSong setLocal:info.isLocal];
        [newSong setPathToSong:info.pathToSong];
        [newSong setPathToAlbumArt:info.pathToAlbumArt];
        
        //now that we have the song we return it
        var info = [CPDictionary dictionaryWithObject:newSong forKey:"theSong"];  
        [[CPNotificationCenter defaultCenter] postNotificationName:"SongReceived" object:self userInfo:info]; 
        
    }else{
        //no user was found lets ask the new user stuff
        CPLog.info("No songs found in data!");  
    }
}

-(void)connectionDidFinishLoading:(CPURLConnection)connection{
    //nothing
}

- (void)connection:(CPURLConnection) connection didFailWithError:(CPString)error
{
}

- (void)clearConnection:(CPURLConnection)connection
{
    //we no longer need to hold on to a reference to this connection
    if (connection == xyzConnection)
        xyzConnection = nil;
}

@end