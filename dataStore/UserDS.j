//
//  UserDS.j
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

@import "../model/XYZSong.j"

@implementation UserDS : CPObject
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
-(void)getUserData{
    var app = [CPApp delegate];
    var aURL = [app serverIP] + "/GetUserData";
    CPLog.info("Getting User data at: %s", aURL);
    var request = [CPURLRequest requestWithURL:aURL];
    xyzConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}



- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    var info =  JSON.parse(data);

    if(!response.error){
        CPLog.info("Got user: "+ response);
        var user = [[XYZUser alloc] init];
       
        //now that we have the song we return it
        var info = [CPDictionary dictionaryWithObject:user forKey:"UserData"];  
        [[CPNotificationCenter defaultCenter] postNotificationName:"UserDataReceived" object:self userInfo:info]; 
        
    }else{
        //no user was found lets ask the new user stuff
        CPLog.info("No UserData found in data!");  
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