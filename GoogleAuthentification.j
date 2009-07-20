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


@implementation GoogleAuthentification : CPObject
{
}

- (void)initWithURL:(CPString)aURL
{
    
	var url = aURL;
	var request = [CPURLRequest requestWithURL: url];
	var googleAuthentificationConnection = [CPURLConnection connectionWithRequest:request delegate:self];
	
}
/*Delegate methods*/

//for the connections delegate
- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{	
	[[CPNotificationCenter defaultCenter] postNotificationName:"LoginSuccessful" object:self]; 	
}

-(void)connectionDidFinishLoading:(CPURLConnection)connection{
	//nothing
}

- (void)connection:(CPURLConnection) connection didFailWithError:(CPString)error
{
}
@end

