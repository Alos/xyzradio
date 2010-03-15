//  XYZSong.j
//  XYZRadio
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
@import <Foundation/CPObject.j>

@implementation XYZSong: CPObject
{
    CPString songTitle @accessors;
    CPString artist @accessors;
    CPString time @accessors;
    CPString genre @accessors;
	CPString rating @accessors;
	CPString pathToAlbumArt @accessors;
    CPString songID @accessors;
	BOOL local @accessors (getter=isLocal, setter=setLocal:);
	CPString pathToSong @accessors;
}

-(id)initWithSongTitle:(CPString)aSongTitle setArtist:(CPString)anArtist setID:(int)anID time:(CPString)aTime pathToSong:(CPString)aPath rating:(CPString)aRating{
    if(self = [super init]){
        songTitle = aSongTitle;
        artist = anArtist;
        songID = anID;
        isLocal = false;
        time = aTime;
		pathToSong = aPath;
		rating = aRating;
    }
    return self;
}

-(BOOL)isEqual:(id)anObject{
if([[anObject class] instancesRespondToSelector: @selector(songID)])
    if([anObject songID] == [self songID])
        return YES;
    else
        return NO;
}

- (void)encodeWithCoder:(CPCoder)aCoder{
    [aCoder encodeObject:songTitle forKey:@"SongTitle"];
    [aCoder encodeObject:artist forKey:@"Artist"];
    [aCoder encodeObject:time forKey:@"Time"];
	[aCoder encodeObject:genre forKey:@"Genre"];
	[aCoder encodeObject:rating forKey:@"Rating"];
	[aCoder encodeObject:pathToAlbumArt forKey:@"PathToAlbumArt"];
	[aCoder encodeObject:songID forKey:@"SongID"];
    [aCoder encodeObject:local forKey:@"Local"];
	[aCoder encodeObject:pathToSong forKey:@"PathToSong"];
}

- (id)initWithCoder:(CPCoder)aCoder{
    self = [super init];
    if (self)
    {
        songTitle = [aCoder decodeObjectForKey:@"SongTitle"];
        artist = [aCoder decodeObjectForKey:@"Artist"];
        time = [aCoder decodeObjectForKey:@"Time"];
		genre = [aCoder decodeObjectForKey:@"Genre"];
		rating = [aCoder decodeObjectForKey:@"Rating"];
		pathToAlbumArt = [aCoder decodeObjectForKey:@"PathToAlbumArt"];
		songID = [aCoder decodeObjectForKey:@"SongID"];
        local = [aCoder decodeObjectForKey:@"Local"];
		pathToSong = [aCoder decodeObjectForKey:@"PathToSong"];

    }
    return self;
}

-(void)starRatingForSongChanged:(CPNotification)aNotification{
	CPLog.trace("notified!!");
	var info = [aNotification userInfo];
	var aux = [info objectForKey:"rating"];
	[self setRating: aux];
	CPLog.trace([self rating]);
}

/**
Sets the rater of the song, this makes it easy to update the value of the rating in this song.
**/	
-(void)setStarRater:(StarRatingView)aRater{
		[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(starRatingForSongChanged:) name:"StarRatingForSongChanged" object:aRater];
}

}

- (CPString)description { 
	return songTitle;
}
@end