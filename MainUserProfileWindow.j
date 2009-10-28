//
//  ProfileWindow.j
//  XYZRadio
//
//  Created by Oswa on 18/08/09.
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

@implementation MainUserProfileWindow : CPWindow
	{
		CPImageView avatarImageView;
		CPButton saveButton;
		CPTextField userNameTextField;
	}
	
	//constructora
	- (id)initWithContentRect:aRectangle styleMask:aStyleMask {
		self = [super initWithContentRect:aRectangle styleMask: aStyleMask];
		if (self)
		{
			[self setTitle:@"Profile"];
			
			var contentView = [self contentView];
			var bounds = [contentView bounds];  
			var center= CGRectGetWidth(bounds)/2.0;
			
			//Avatar
			var defaultAvatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/usuario-hombre.png" size:CPSizeMake(87,88)];
			[defaultAvatarImage setDelegate:self];
			avatarImageView = [[CPImageView alloc] initWithFrame:CGRectMake(20,20,87,88)];
			[avatarImageView setImage: defaultAvatarImage];
			[contentView addSubview:avatarImageView];
			
			//name
			var userNameLabel = [[CPTextField alloc] initWithFrame: CGRectMake(120, 30, 100, 50)];
			[userNameLabel setStringValue:"User:"];
			[userNameLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];  
			[contentView addSubview: userNameLabel];
			
			userNameTextField = [[CPTextField alloc] initWithFrame: CGRectMake(155, 25, 100, 30)];
			[userNameTextField setEditable:YES];
			[userNameTextField setBezeled:YES];      
			[contentView addSubview: userNameTextField];
			
			//boton para agregar amigo
			saveButton = [[CPButton alloc] initWithFrame:CGRectMake(220, 360, 40, 20)];
			[saveButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
			[saveButton setBezelStyle:CPHUDBezelStyle];
			[saveButton setTitle:@"Save"];	        
			[saveButton setTarget:self];
			[saveButton setAction:@selector(savePreferences)];                 
			[contentView addSubview: saveButton];
			
			
		}
		return self;
	}
	//loads the info for this user
	-(void)loadUserSettings{
	
	}
	
	-(void)savePreferences{
		//var contentView = [bridgeWindow contentView];
		bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/wallpapers/"+[wallpaperMenus titleOfSelectedItem] size:CPSizeMake(1440, 960)];
		[contentViewOfWindow setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
	}
	
	@end
