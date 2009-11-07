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


-(void)addNewPlaylist:(CPString)nameOfPlaylist{
	var app = [CPApp delegate];
	var aURL = [app serverIP] + "/AddNewPlaylist?userID=" + [[app userLoggedin] email] + "&playlistName=" + nameOfPlaylist;
	CPLog.info("Adding a new playlist at: %s", aURL);
	var request = [CPURLRequest requestWithURL:aURL];
	xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}

-(void)removePlaylist:(CPString)nameOfPlaylist{
	var app = [CPApp delegate];
	var aURL = [app serverIP] + "/RemovePlaylist?userID=" + [[app userLoggedin] email] + "&playlistName=" + nameOfPlaylist;
	CPLog.info("Adding a new playlist at: %s", aURL);
	var request = [CPURLRequest requestWithURL:aURL];
	xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}

-(void)getUserPlaylists{
	answerArray = [[CPArray alloc] init];
	var app = [CPApp delegate];
	var aURL = [app serverIP] + "/GetUserPlaylist?userID=" + [[app userLoggedin] email];
	CPLog.info("Getting users at: %s", aURL);
	var request = [CPURLRequest requestWithURL:aURL];
	xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    if(!data)
		return;
	var result =  JSON.parse(data);
	CPLog.info("Playlists: %s", result);
	for(var i=0; i< result.length; i++){
		var object = result[i];
		var musicList = [[XYZMusicList alloc] init];
		[musicList setNameOfList: object.nameOfList];
		
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