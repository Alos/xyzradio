//
//  UserBrowserDS.j
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

@import "../model/XYZUser.j"
@import "../model/XYZUserPrefrences.j"

@implementation UserListCollectionViewDS : CPObject
{
	CPArray answerArray;  
	CPURLConnection connection;
}

-(id)init{
	self = [super init];
	if(self){
		
	}
	return self;
}


-(void)getOnlineUsers{
	answerArray = [[CPArray alloc] init];
	var app = [CPApp delegate];
	var aURL = [app serverIP] + "/GetAllCheckedOnlineUsersAsJSON"
	CPLog.info("Getting users at: %s", aURL);
	var request = [CPURLRequest requestWithURL:aURL];
	connection = [CPURLConnection connectionWithRequest:request delegate:self];
}


- (void)connection:(CPURLConnection)aConnection didReceiveData:(CPString)data
{
    //This method is called when a connection receives a response. in a
    //multi-part request, this method will (eventually) be called multiple times,
    //once for each part in the response.
	
	var result =  JSON.parse(data);
	CPLog.info("The users: %s", result.pathToAvatar);
	for(var i=0; i< result.length; i++){
		var userInfo = result[i];
		var newUser = [[XYZUser alloc] init];
		[newUser setEmail: userInfo.email];
		[newUser setUsernick: userInfo.usernick];
		if(userInfo.pathToAvatar)
			[newUser setPathToAvatar: userInfo.pathToAvatar];
		else
			[newUser setPathToAvatar:""];
		[newUser setLogged: userInfo.logged];
		if(userInfo.dj)
			[newUser setDj:YES];
		else
			[newUser setDj:NO];
		[newUser setSex: userInfo.sex];
		[newUser setDjList1: userInfo.djList1];
		[newUser setDjList2: userInfo.djList2];
		[newUser setDjList3: userInfo.djList3];
		[newUser setOwnedSongs: userInfo.ownedSongs];
		[newUser setUserRating: userInfo.userRating];
		
		var somePrefrences = [[XYZUserPrefrences alloc] init];
		
		[newUser setPrefrences: somePrefrences];

		[answerArray addObject: newUser];
	}
	
	var info = [CPDictionary dictionaryWithObject:answerArray forKey:"list"];   
	[[CPNotificationCenter defaultCenter] postNotificationName:"UserListRetrived" object:self userInfo:info]; 

}

-(void)connectionDidFinishLoading:(CPURLConnection)aConnection{
	//nothing
}

- (void)connection:(CPURLConnection)aConnection didFailWithError:(CPString)error
{
}

- (void)clearConnection:(CPURLConnection)aConnection
{
    //we no longer need to hold on to a reference to this connection
    if (aConnection == louhiConnection)
        louhiConnection = nil;
}

@end