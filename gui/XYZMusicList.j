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

@implementation XYZMusicList: CPObject
{
    CPString nameOfList @accessors;
    CPArray musicList @accessors;
    BOOL fullyLoaded @accessors (getter=isFullyLoaded, setter=setFullyLoaded:);
}

-(id)init{
    self = [super init];
    if(self){
        musicList = [[CPArray alloc] init];
        fullyLoaded = NO;
    }
    return self;
}


- (void) addSong:(XYZSong)aSong{
    CPLog.trace("Agregando la cancion: "+aSong+" a la lista "+nameOfList); 
    [musicList  addObject:aSong];
}

- (CPString)description { 
    return " Name of the list: "+ nameOfList + " Songs in list: "+ musicList;
}
@end