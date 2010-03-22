//
//  SoundListDS.j
//  Louhi
//
//  Created by Alos on 10/2/08.
/*
This file is part of Louhi.

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

@import "XYZMusicList.j"
@import "XYZSong.j"

@implementation SongListDS : CPObject
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

/**
    Adds a song to the given playlist
*/
-(void)addSongToPlaylist:(CPString)nameOfPlaylist song:(XYZSong)aSong{
    var app = [CPApp delegate];
    var aURL = [app serverIP] + "/AddSongToPlaylist?userID=" + [[app userLoggedin] email] + "&playlistName=" + nameOfPlaylist + "&songID=" + [aSong songID];
    CPLog.info("Adding "+aSong+" to playlist "+nameOfPlaylist+" at: %s", aURL);
    var request = [CPURLRequest requestWithURL:aURL];
    xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}

/**
    Deletes the user selected playlist
*/
-(void)removePlaylist:(CPString)nameOfPlaylist{
    var app = [CPApp delegate];
    var aURL = [app serverIP] + "/RemovePlaylist?userID=" + [[app userLoggedin] email] + "&playlistName=" + nameOfPlaylist;
    CPLog.info("Adding a new playlist at: %s", aURL);
    var request = [CPURLRequest requestWithURL:aURL];
    xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}

/**
    Gets the users playlists
*/
-(void)getUserPlaylists{
    answerArray = [[CPArray alloc] init];
    var app = [CPApp delegate];
    var aURL = [app serverIP] + "/GetUserPlaylist?userID=" + [[app userLoggedin] email];
    CPLog.info("Getting user playlists at: %s", aURL);
    var request = [CPURLRequest requestWithURL:aURL];
    xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}

/**
    Gets the songs from the array of SongIDS
*/
-(CPArray)getSongsForPlaylist:(CPArray)songIDArray{
    //pedimos recuperar las siguientes canciones
    var resp = [[CPArray alloc] init];
    var app = [CPApp delegate];
    var listaCompleta = [app globalSongList];
    for(var x=0; x< [songIDArray count]; x++){
        var songOnlyID = [songIDArray objectAtIndex:x];
        CPLog.trace("Converting the ID: "+songOnlyID);
        for(var i=0; i< [listaCompleta count]; i++){
            var fullSong = [listaCompleta objectAtIndex:i];
            CPLog.trace("comparing to..."+fullSong);
            if([fullSong songID] == [songOnlyID songID]){
                CPLog.trace("Found song!");
                var newSong = fullSong;
                [resp addObject: newSong];
                break;
            }
        }
    }
    CPLog.trace("Finished getting songs:"+ resp);
    return resp;
}


- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    if(!data)
        return;
    var result =  JSON.parse(data);
    CPLog.info("Playlists: %s", result);
    CPLog.info("Playlists: %s", result.length);
    for(var i=0; i< result.length; i++){
        var object = result[i];
        CPLog.trace("i="+i);
        var musicList = [[XYZMusicList alloc] init];
        [musicList setNameOfList: object.nameOfList];
        CPLog.trace(">>>>>>>>>>>>>>"+object.nameOfList);
        //for each id in the array
        var arrayOfIDs = object.musicList;
        for(var j=0; j<[arrayOfIDs count]; j++){
            var emptySong = [[XYZSong alloc] init];
            [emptySong setSongID:[arrayOfIDs objectAtIndex: j]];
            [musicList  addSong:emptySong];
        }        
       
        [answerArray addObject: musicList];
    }

    var info = [CPDictionary dictionaryWithObject:answerArray forKey:"playlist"];   
    [[CPNotificationCenter defaultCenter] postNotificationName:"PlayListsRecived" object:self userInfo:info]; 

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