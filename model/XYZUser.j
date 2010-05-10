//  XYZSong.j
//  XYZRadio
//  Created by oswa on 14/07/08.
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

@implementation XYZUser: CPObject
{
	CPString email @accessors;
	CPString usernick @accessors;
	CPString pathToAvatar @accessors;
	BOOL logged @accessors;
	BOOL dj @accessors;
	CPString sex @accessors;
	CPArray djList1 @accessors;
	CPArray djList2 @accessors;
	CPArray djList3 @accessors;
	CPArray ownedSongs @accessors;
	CPString userRating @accessors;
	XYZUserPrefrences prefrences @accessors;
}

-(id)initWithEmail:(CPString)anEmail usernick:(CPString)aName pathToAvatar:(CPString)aPath logged:(BOOL)state 
					dj:(BOOL)isDJ sex:(CPString)aSex djList1:(CPArray)aDJList djList2:(CPArray)aDJList2 djList3:(CPArray)aDJList3
					ownedSongs:(CPArray)aList rating:(CPString)aRating prefrences:(XYZUserPrefrences)somePrefs{
    if(self = [super init]){
		email = anEmail;
        usernick = aName;
		pathToAvatar = aPath;
		logged = state;
		dj = isDJ;
		sex = aSex;
		djList1 = aDJList;
		djList2 = aDJList2;
		djList3 = aDJList3;
		ownedSongs = aList;
        userRating = aRating;
		prefrences = somePrefs;
    }
    return self;
}

-(id)initWithUserName:(CPString)aUserName rating:(CPString)aRating{
    if(self = [super init]){
        usernick = aUserName
        userRating = aRating;
    }
    return self;
}

-(id)init{
	self = [super init];
    if(self){
		
    }
    return self;
}

-(BOOL)isEqual:(id)anObject{
	if([[anObject class] instancesRespondToSelector: @selector(email)])
    if([anObject email]==[self email])
        return YES;
    else
        return NO;
}


- (void)encodeWithCoder:(CPCoder)aCoder{
	[aCoder encodeObject:email forKey:@"Email"];
	[aCoder encodeObject:usernick forKey:@"UserNick"];
    [aCoder encodeObject:logged forKey:@"Logged"];
	[aCoder encodeObject:sex forKey:@"Sex"];
	[aCoder encodeObject:status forKey:@"Status"];
	[aCoder encodeObject:djList1 forKey:@"DJList1"];
	[aCoder encodeObject:djList2 forKey:@"DJList2"];
	[aCoder encodeObject:djList3 forKey:@"DJList3"];
	[aCoder encodeObject:ownedSongs forKey:@"OwnedSongs"];
	[aCoder encodeObject:userRating forKey:@"UserRating"];
}

- (id)initWithCoder:(CPCoder)aCoder{
    self = [super init];
    if (self)
    {
		email = [aCoder decodeObjectForKey:@"Email"];
		usernick =[aCoder decodeObjectForKey:@"UserNick"];
		logged = [aCoder decodeObjectForKey:@"Logged"];
		sex = [aCoder decodeObjectForKey:@"Sex"];
		status = [aCoder decodeObjectForKey:@"Status"];  
		djList1 = [aCoder decodeObjectForKey:@"DJList1"];
		djList2 = [aCoder decodeObjectForKey:@"DJList2"];
		djList3 = [aCoder decodeObjectForKey:@"DJList3"];
		ownedSongs = [aCoder decodeObjectForKey:@"OwnedSongs"];
		userRating = [aCoder decodeObjectForKey:@"UserRating"];
    }
    return self;
}

-(void)starRatingForUserChanged:(CPNotification)aNotification{
	console.log("notified!!");
	var info = [aNotification userInfo];
	var aux = [info objectForKey:"rating"];
	[self setUserRating: aux];
	console.log([self rating]);
}

/**
Sets the rater of the song, this makes it easy to update the value of the rating in this song.
**/	
-(void)setStarRater:(StarRatingView)aRater{
		[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(starRatingForUserChanged:) name:"StarRatingForUserChanged" object:aRater];
}

}
@end
