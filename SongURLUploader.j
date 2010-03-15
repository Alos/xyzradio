//
//  SongURLUploader.j
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


@implementation SongURLUploader: CPObject
{
    CPApp app;
    CPURLConnection theConnection;
}

- (id)init
{
    self = [super init];
    if(self) {
        app = [CPApp delegate];
    }
    return self;
}

- (void)uploadSongWithTitle:(CPString)aTitle artist:(CPString)anArtist genere:(CPString)aGenere time:(CPString)aTime pathToAlbumArt:(CPString)aPathToArt songURL:(CPString)aURL {
        var aURL = [app serverIP] + "/AddSong?songTitle="+aTitle+"&artist="+anArtist+"&genere="+aGenere+"&time="+aTime+"&pathToAlbumArt="+aPathToArt+
        "&pathToSong="+aURL+"&userid="+[[app userLoggedin] email];
        CPLog.info("Getting users at: %s", aURL);
        var request = [CPURLRequest requestWithURL:aURL];
        theConnection = [CPURLConnection connectionWithRequest:request delegate:self];
    }
    -(void)connectionDidFinishLoading:(CPURLConnection)connection{
        CPLog.trace("SubmitSuccessful");
        [[CPNotificationCenter defaultCenter] postNotificationName:"SubmitSuccessful" object:self];
    }
    - (void)connection:(CPURLConnection) connection didFailWithError:(CPString)error
    {
        CPLog.error(error);
    }

    - (void)clearConnection:(CPURLConnection)connection
    {
        //we no longer need to hold on to a reference to this connection
        if ( connection ==  theConnection)
            theConnection = nil;
    }

@end