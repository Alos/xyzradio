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

@implementation EventListenerManager : CPObject
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


-(void)getEvents{
	answerArray = [[CPArray alloc] init];
	var app = [CPApp delegate];
	var aURL = [app serverIP] + "/GetEventsForUser?account="+[[app userLoggedin] email];
	CPLog.info("Getting events at: %s", aURL);
	var request = [CPURLRequest requestWithURL:aURL];
	connection = [CPURLConnection connectionWithRequest:request delegate:self];
}


- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    //This method is called when a connection receives a response. in a
    //multi-part request, this method will (eventually) be called multiple times,
    //once for each part in the response.
	
	var result =  JSON.parse(data);
	CPLog.info(result);
	for(var i=0; i < result.length; i++){
		var event = result[i];
		if(event.eventName == "com.xyzradioengine.model.events.UserHasLoggedinXYZEvent"){
			CPLog.info("%s loggedin", event.userEmail);
			var info = [CPDictionary dictionaryWithObject:event.userEmail forKey:"account"];   
			[[CPNotificationCenter defaultCenter] postNotificationName:"NewUserHasArrived" object:self userInfo:info]; 
			
		} else if(event.eventName == "com.xyzradioengine.model.events.UserHasLoggedoffXYZEvent")
		{
			CPLog.info("%s loggedoff", event.userEmail);
			var info = [CPDictionary dictionaryWithObject:event.userEmail forKey:"account"];   
			[[CPNotificationCenter defaultCenter] postNotificationName:"UserLoggedoff" object:self userInfo:info]; 
			
		}

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
    if (connection == louhiConnection)
        louhiConnection = nil;
}

@end