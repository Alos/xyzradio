//
//  Preferences.j
//  XYZRadio
//
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

@implementation PreferencesWindow : CPWindow
{
    CPButton backButton;
    CPButton playButton;
    CPButton forwardButton;
    CPTextField currentlyPlaying;
    CPString currentlyPlayingString;
    CPButton botonOk;
    CPPopUpButton wallpaperMenus;
    CPView contentViewOfWindow;	
}

/*Una bonita contructora*/
- (id)initWithContentRect:aRectangle styleMask:aStyleMask contentViewOfWindow:(CPView)aContentView{
    self = [super initWithContentRect:aRectangle styleMask: aStyleMask];
    if (self)//pa ver si no somos null :P
    {
	contentViewOfWindow = aContentView;
        //le ponemos titulo al HUD lo centramos
        [self setTitle:@"Preferences"];
        
        var contentView = [self contentView];
        var bounds = [contentView bounds];  
        var center= CGRectGetWidth(bounds)/2.0;
        
        var wallpaperLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 50, 100, 18)];
        [wallpaperLabel setStringValue:"Wallpaper:"];
        [wallpaperLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [wallpaperLabel setBackgroundColor:NULL];
        
        var arr =[[CPArray alloc] init];
		[arr addObject:"xyzradiowallpaper.png"]
        [arr addObject:"theGoldenAgeOf60.jpg"];
        [arr addObject:"Organ-ism.jpg"];
		[arr addObject:"Retro_Music.jpg"];  
        wallpaperMenus =[[CPPopUpButton alloc] initWithFrame:CGRectMake(125, 50, 170, 24)];
        [wallpaperMenus addItemsWithTitles:arr];
        
        
        var serverIPLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 90, 100, 18)];
        [serverIPLabel setStringValue:"Server IP:"];
        [serverIPLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [serverIPLabel setBackgroundColor:NULL];
        
        var serverIP = [[CPTextField alloc] initWithFrame: CGRectMake(125, 90, 170, 30)];
        [serverIP setEditable:YES];
        [serverIP setBezeled:YES];
        [serverIP setBackgroundColor:[CPColor colorWithHexString:"33FF00"]];        
        
        botonOK = [[CPButton alloc] initWithFrame:CGRectMake(330, 450, 50, 18)];
	[botonOK setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
        [botonOk setBezelStyle:CPHUDBezelStyle];
        [botonOK setTitle:@"Ok"];	        
        [botonOK setTarget:self];
        [botonOK setAction:@selector(savePreferences)];                
              
        [contentView addSubview: botonOK];
        [contentView addSubview: wallpaperLabel]; 
        [contentView addSubview: wallpaperMenus]; 
        [contentView addSubview: serverIPLabel];  
        [contentView addSubview: serverIP];   
             
    }
    return self;
}

-(void)savePreferences{
    //var contentView = [bridgeWindow contentView];
    bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/wallpapers/"+[wallpaperMenus titleOfSelectedItem] size:CPSizeMake(1440, 960)];
    [contentViewOfWindow setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
}

@end
