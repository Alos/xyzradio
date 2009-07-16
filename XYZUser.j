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
    CPString userStatus;
    CPString userName;
    CPString userRating;
    id delegate;
    CPView superview;
}

-(id)initWithUserStatus:(CPString)aUserStatus userName:(CPString)aUserName userRating:(CPString)aRating{
    if(self = [super init]){
        userStatus = aUserStatus;
        userName = aUserName
        userRating = aRating;
    }
    return self;
}

-(void)setUserRating:(CPString)aValue{
	userRating = aValue;
}

-(CPString)userRating{
	return userRating;
}

- (void) setUserStatus:(CPString) aStatus{
    userStatus = aStatus;
}
- (CPString)userStatus{
    return userStatus;
}

- (void) setUserName:(CPString)aName{
    userName = aName;
}

- (CPString)userName{
    return userName;
}
/*
-(BOOL)isEqual:(id)anObject{
if([[anObject class] instancesRespondToSelector: @selector(ID)])
    if([anObject ID]==[self ID])
        return YES;
    else
        return NO;
}
*/

- (void)encodeWithCoder:(CPCoder)aCoder{
    [aCoder encodeObject:userStatus forKey:@"UserStatus"];
    [aCoder encodeObject:userName forKey:@"UserName"];
//    [aCoder encodeObject:ID forKey:@"ID"];
    [aCoder encodeObject:userRating forKey:@"UserRating"];
}

- (id)initWithCoder:(CPCoder)aCoder{
    self = [super init];
    if (self)
    {
        userStatus = [aCoder decodeObjectForKey:@"UserStatus"];
        userName = [aCoder decodeObjectForKey:@"UserName"];
//        ID = [aCoder decodeObjectForKey:@"ID"];
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
