 //
//  XYZUsers.j
//  XYZRadio
//
//  Created by oswa on 13/07/09.
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
@import "UserCell.j"
@import "XYZUser.j"
@implementation UsersWindow:CPWindow {
   CPArray list;
   CPCollectionView listCollectionView;
}

//constructora
- (id)contentRect:(CGRect)aRect styleMask:aStyleMask{
    self = [super initWithContentRect:aRect styleMask: aStyleMask];
    if (self)
    {
	 var list = [[CPArray alloc] init];
         //titulo de la ventana
         [self setTitle:@"Users"];
         var contentView = [self contentView];
         var bounds = [contentView bounds];
        
	 [self setBackgroundColor:nil];
         //scrollView
	 var listScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 246 , CGRectGetHeight(bounds))];
         [listScrollView setAutohidesScrollers:YES];
	 [listScrollView setAutoresizingMask:CPViewHeightSizable];
	 [[listScrollView contentView] setBackgroundColor:[CPColor colorWithRed:0 green:0 blue:0 alpha:0.0]];

	 var userListItem = [[CPCollectionViewItem alloc] init];
	 [userListItem setView:[[UserCell alloc] initWithFrame:CGRectMakeZero()]];

	 listCollectionView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0, 0, 246, 91)];
	 [listCollectionView setDelegate:self];
	 [listCollectionView setItemPrototype:userListItem];
    
	 [listCollectionView setMinItemSize:CGSizeMake(246, 91)];
	 [listCollectionView setMaxItemSize:CGSizeMake(246, 91)];
	 [listCollectionView setMaxNumberOfColumns:1]; 
     [listScrollView setDocumentView:listCollectionView];        
	 [contentView addSubview:listScrollView];    

	 [self usersArray];
    }
    
    return self;
}

-(CPArray)usersArray{
   list = [[CPArray alloc] init];
   var user1 = [[XYZUser alloc] initWithEmail:"alos@me.com" usernick:"alos" pathToAvatar:"" logged:YES 
					dj:YES sex:"MALE" djList1:nil djList2:nil djList3:nil
					ownedSongs:nil rating:4 prefrences:nil];
   var user2 =  [[XYZUser alloc] initWithEmail:"osasenky@me.com" usernick:"oswa" pathToAvatar:"" logged:YES 
					dj:NO sex:"MALE" djList1:nil djList2:nil djList3:nil
					ownedSongs:nil rating:2 prefrences:nil];
   var user3 =  [[XYZUser alloc] initWithEmail:"kit@me.com" usernick:"kitsune" pathToAvatar:"" logged:YES 
				dj:NO sex:"FEMALE" djList1:nil djList2:nil djList3:nil
				ownedSongs:nil rating:5 prefrences:nil];
									
   [list addObject:user1];
   [list addObject:user2];
   [list addObject:user3];
   [listCollectionView setContent:list];
   return list;
}

@end

