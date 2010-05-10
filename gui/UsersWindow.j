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
@import "../model/XYZUser.j"
@import "../dataStore/UserListCollectionViewDS.j"

@implementation UsersWindow:CPWindow {
   CPArray list;
   CPCollectionView listCollectionView;
   UserListCollectionViewDS userListCollectionViewDS;
}

//constructora
- (id)contentRect:(CGRect)aRect styleMask:aStyleMask{
    self = [super initWithContentRect:aRect styleMask: aStyleMask];
    if (self)
    {
		 list = [[CPArray alloc] init];
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
	 //[listCollectionView setContent:list];
	 
	 [listCollectionView setMinItemSize:CGSizeMake(246, 91)];
	 [listCollectionView setMaxItemSize:CGSizeMake(246, 91)];
	 [listCollectionView setMaxNumberOfColumns:1]; 
     [listScrollView setDocumentView:listCollectionView];        
	 [contentView addSubview:listScrollView];    
	
	 userListCollectionViewDS = [[UserListCollectionViewDS alloc] init];
	 [userListCollectionViewDS getOnlineUsers];
	
    }
	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(updateList:) name:"UserListRetrived" object:nil];
	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(addUser:) name:"NewUserHasArrived" object:nil];
	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(removeUser:) name:"UserLoggedoff" object:nil];
    return self;
}

-(void)updateList:(CPNotification)aNotification{
	var info = [aNotification userInfo];
	var aux = [info objectForKey:"list"];
	
	for(var i = 0 ; i< [aux count] ; ++i){
		[list addObject: aux[i]];
	}
		
	[listCollectionView setContent:[CPArray arrayWithArray:list]];
}

-(CPArray)getCollectionViewContent{
	return [listCollectionView content];
}

-(void)removeUser:(CPNotification)aNotification{
	var info = [aNotification userInfo];
	var account = [info objectForKey:"account"];
	[list removeObject:account];
	[listCollectionView setContent: [CPArray arrayWithArray:list]];
}

-(void)addUser:(CPNotification)aNotification{
	CPLog.info("Adding new user...");

	var info = [aNotification userInfo];
	var account = [info objectForKey:"account"];
	
	var app = [CPApp delegate];
	var aURL = [app serverIP] + "/GetUserByEmail?account="+account;
	CPLog.info("Getting users at: %s", aURL);
	var request = [CPURLRequest requestWithURL:aURL];
	connection = [CPURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    //This method is called when a connection receives a response. in a
    //multi-part request, this method will (eventually) be called multiple times,
    //once for each part in the response.
	
	var result =  JSON.parse(data);
	
	var newUserArray = [[CPArray alloc] init];
	
		var userInfo = result;
		var newUser = [[XYZUser alloc] init];
		[newUser setEmail: userInfo.email];
		[newUser setUsernick: userInfo.usernick];
		if(userInfo.pathToAvatar)
			[newUser setPathToAvatar: userInfo.pathToAvatar];
		else
			[newUser setPathToAvatar:""];
		[newUser setLogged: userInfo.logged];
		if(userInfo.dj)
			[newUser setDj:YES];
		else
			[newUser setDj:NO];
		[newUser setSex: userInfo.sex];
		[newUser setDjList1: userInfo.djList1];
		[newUser setDjList2: userInfo.djList2];
		[newUser setDjList3: userInfo.djList3];
		[newUser setOwnedSongs: userInfo.ownedSongs];
		[newUser setUserRating: userInfo.userRating];
		
		var somePrefrences = [[XYZUserPrefrences alloc] init];
		
		[newUser setPrefrences: somePrefrences];

		[newUserArray addObject: newUser];
	


	for(var i = 0; i < list.length; i++){
		[newUserArray addObject: list[i]];
	}	
	[listCollectionView setContent: newUserArray];
	list =  [CPArray arrayWithArray:list];	
}
@end

