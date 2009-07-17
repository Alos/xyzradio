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
        
	 //[contentUsers setHasShadow:YES];
	 [self setBackgroundColor:nil];
         //scrollView
	 var listScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 200 , CGRectGetHeight(bounds))];
         [listScrollView setAutohidesScrollers:YES];
	 [listScrollView setAutoresizingMask:CPViewHeightSizable];
	 [[listScrollView contentView] setBackgroundColor:[CPColor colorWithRed:0 green:0 blue:0 alpha:0.0]];

	 var photosListItem = [[CPCollectionViewItem alloc] init];
	 [photosListItem setView:[[UserCell alloc] initWithFrame:CGRectMakeZero()]];

	 listCollectionView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 0)];
	 [listCollectionView setDelegate:self];
	 [listCollectionView setItemPrototype:photosListItem];
    
	 [listCollectionView setMinItemSize:CGSizeMake(20.0, 45.0)];
	 [listCollectionView setMaxItemSize:CGSizeMake(1000.0, 45.0)];
	 [listCollectionView setMaxNumberOfColumns:1]; 
    
	 [listCollectionView setVerticalMargin:0.0];
	 [listCollectionView setAutoresizingMask:CPViewWidthSizable];
	 [listScrollView setDocumentView:listCollectionView];        
	 [contentView addSubview:listScrollView];    

	 [self usersArray];
    }
    
    return self;
}

-(CPArray)usersArray{
   list = [[CPArray alloc] init];
   var user1 = [[XYZUser alloc] initWithUserStatus:@"" userName:@"alos" userRating:@""];
   var user2 = [[XYZUser alloc] initWithUserStatus:@"" userName:@"oswa" userRating:@""];
   [list addObject:user1];
   [list addObject:user2];
   [listCollectionView setContent:list];
   return list;
}

@end

