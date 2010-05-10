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

@implementation ProfileWindow : CPWindow
{
    CPImageView avatarImageView;
    CPButton backButton;
    CPButton playButton;
    CPButton forwardButton;
    CPTextField currentlyPlaying;
    CPString currentlyPlayingString;
    CPButton addButton;
    CPPopUpButton wallpaperMenus;
    CPView contentViewOfWindow;	
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

	//info del usuario
        var infoLabel = [[CPTextField alloc] initWithFrame: CGRectMake(120, 30, 100, 50)];
        [infoLabel setStringValue:"User: oswa\nAge: 24"];
        [infoLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];  
	[contentView addSubview: infoLabel];
        
	//boton para agregar amigo
        addButton = [[CPButton alloc] initWithFrame:CGRectMake(170, 360, 40, 20)];
	[addButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
        [addButton setBezelStyle:CPHUDBezelStyle];
        [addButton setTitle:@"Add"];	        
        [addButton setTarget:self];
        [addButton setAction:@selector(savePreferences)];                 
        [contentView addSubview: addButton];

	//boton para enviar mail
        sendMailButton = [[CPButton alloc] initWithFrame:CGRectMake(220, 360, 70, 20)];
	[sendMailButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
        [sendMailButton setBezelStyle:CPHUDBezelStyle];
        [sendMailButton setTitle:@"Send mail"];	        
        [sendMailButton setTarget:self];
        [sendMailButton setAction:@selector(savePreferences)];                
        [contentView addSubview: sendMailButton];
             
    }
    return self;
}

-(void)savePreferences{
    //var contentView = [bridgeWindow contentView];
    bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/wallpapers/"+[wallpaperMenus titleOfSelectedItem] size:CPSizeMake(1440, 960)];
    [contentViewOfWindow setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
}

@end
