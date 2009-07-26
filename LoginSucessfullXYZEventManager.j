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



/*This class controlls the login events of XYZRadio*/
@implementation LoginSucessfullXYZEventManager : CPObject
{
	CPURLConnection serverConnection;
	CPURLRequest theRequest;
	CPApp app;
}

+ (void)sendLoginToGoogleSucessfullXYZEvent:(CPString)email{
	app = [CPApp delegate];
	var url = [app serverIP]+"/LoginVerify?useremail="+email;
	theRequest = [CPURLRequest requestWithURL: url];
	serverConnection = [CPURLConnection connectionWithRequest:theRequest delegate:self];
}

/*Delegate methods*/

//for the connections delegate
- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{	
	CPLog(data);
	var response =  JSON.parse(data);

	if(response.user){
		//user already existed and now we just fill his info
		CPLog("Logged OK. Returned a user!");
		var user = [[XYZUser alloc] init];
		
		var info = [CPDictionary dictionaryWithObject:song.position forKey:"time"];   
		[[CPNotificationCenter defaultCenter] postNotificationName:"pos" object:self userInfo:info];
	}else{
		//no user was found lets ask the new user stuff
		CPLog("Logged OK. No user returned");
	}
	
}

-(void)connectionDidFinishLoading:(CPURLConnection)connection{
	//nothing
}

- (void)connection:(CPURLConnection) connection didFailWithError:(CPString)error
{
}
@end

