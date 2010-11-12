//
//  MainUserProfileWindow.j
//  XYZRadio
//
//  Created by Alos on 09/18/10.
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

@import "../dataStore/UserDS.j"


@implementation MainUserProfileWindow : CPWindow
    {
        CPImageView avatarImageView;
        CPButton saveButton;
        CPTextField userNameTextField;
        XYZUser user;
        UserDS userDS;
    }
   
    - (id)initWithContentRect:aRectangle styleMask:aStyleMask {
        self = [super initWithContentRect:aRectangle styleMask: aStyleMask];
        if (self)
        {
            [self setTitle:@"Profile"];
            userDS = [[UserDS alloc] init];            
            [userDS getUserData];
            var contentView = [self contentView];
            var bounds = [contentView bounds];  
            var center= CGRectGetWidth(bounds)/2.0;
            

            //name
            var userNameLabel = [[CPTextField alloc] initWithFrame: CGRectMake(120, 30, 100, 50)];
            [userNameLabel setStringValue:"User:"];
            [userNameLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [contentView addSubview: userNameLabel];

            userNameTextField = [[CPTextField alloc] initWithFrame: CGRectMake(155, 25, 130, 30)];
            [userNameTextField setEditable:YES];
            [userNameTextField setBezeled:YES];      
            [contentView addSubview: userNameTextField];

            //age
            var ageLabel = [[CPTextField alloc] initWithFrame: CGRectMake(120, 70, 100, 50)];
            [ageLabel setStringValue:"Sex:"];
            [ageLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];  
            [contentView addSubview: ageLabel];

            var arr =[[CPArray alloc] init];
            [arr addObject:"Male"]
            [arr addObject:"Female"];
            sexMenu =[[CPPopUpButton alloc] initWithFrame:CGRectMake(155, 70, 100, 24)];
            [sexMenu setBezelStyle:CPHUDBezelStyle];
            [sexMenu addItemsWithTitles:arr];
            [contentView addSubview: sexMenu];

            //save changes
            saveButton = [[CPButton alloc] initWithFrame:CGRectMake(220, 360, 40, 20)];
            [saveButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
            [saveButton setBezelStyle:CPHUDBezelStyle];
            [saveButton setTitle:@"Save"];
            [saveButton sizeToFit];        
            [saveButton setTarget:self];
            [saveButton setAction:@selector(savePreferences)];                 
            [contentView addSubview: saveButton];

            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(userRecieved:) name:"UserDataReceived" object:nil];
            
        }
        return self;
    }
    
    -(void)userRecieved:(CPNotification)aNotification
    {
        var info = [aNotification userInfo];
        user = [info objectForKey:"UserData"];
        [self setupWindow];
    }

    -(void)setupWindow{
        var sex = [user sex];
                
            //Avatar
            if(sex === "FEMALE")
                var defaultAvatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/usuario-mujer.png" size:CPSizeMake(87,88)];
            else
                var defaultAvatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/usuario-hombre.png" size:CPSizeMake(87,88)];

            [defaultAvatarImage setDelegate:self];
            avatarImageView = [[CPImageView alloc] initWithFrame:CGRectMake(20,20,87,88)];
            [avatarImageView setImage: defaultAvatarImage];
            [contentView addSubview:avatarImageView];

    }
    
    //loads the info for this user
    -(void)savePreferences{
        var selectedSex = [sexMenu titleOfSelectedItem];
        if(selectedSex != [loggedUser sex]){
            //update sex
            CPLog.trace("Modifying a user!");
            var app = [CPApp delegate];
            var url = [app serverIP]+"/ModifyUser?userID="+[loggedUser email]+"&parameter=SEX&newValue="+selectedSex;
            CPLog.info("Modifying user: " + url);
            var request = [CPURLRequest requestWithURL: url];
            var modifyConnectionLogin = [CPURLConnection connectionWithRequest:request delegate:self];   
    }


        
    }
    
@end
