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

@implementation Preferences : CPWindowController
{
    CPButton backButton;
    CPButton playButton;
    CPButton forwardButton;
    CPTextField currentlyPlaying;
    CPString currentlyPlayingString;
    CPButton botonOk;
    CPWindow bridgeWindow;
    CPPopUpButton wallpaperMenus;
}

/*Una bonita contructora*/
- (id)initWithParentWindow:(CPWindow)parentWindow{
    var win = [[CPPanel alloc] initWithContentRect:CGRectMake(500, 50, 400, 500) styleMask: CPHUDBackgroundWindowMask|CPClosableWindowMask];
    self = [super initWithWindow:win];
    if (self)//pa ver si no somos null :P
    {
        bridgeWindow = parentWindow;
        //le ponemos titulo al HUD lo centramos
        [win setTitle:@"Preferences"];
        [win setFloatingPanel:YES];
        [win setDelegate:self];  
        var contentView = [win contentView];
        var bounds = [contentView bounds];  
        var center= CGRectGetWidth(bounds)/2.0;
        
        var wallpaperLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 50, 100, 18)];
        [wallpaperLabel setStringValue:"Wallpaper:"];
        [wallpaperLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [wallpaperLabel setBackgroundColor:NULL];
        
        var arr =[[CPArray alloc] init];
        [arr addObject:"theGoldenAgeOf60"];
        [arr addObject:"Organ-ism"];  
        wallpaperMenus =[[CPPopUpButton alloc] initWithFrame:CGRectMake(125, 50, 170, 18)];
        [wallpaperMenus addItemsWithTitles:arr];
        
        
        var serverIPLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 90, 100, 18)];
        [serverIPLabel setStringValue:"Server IP:"];
        [serverIPLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [serverIPLabel setBackgroundColor:NULL];
        
        var serverIP = [[CPTextField alloc] initWithFrame: CGRectMake(125, 90, 170, 18)];
        [serverIP setEditable:YES];
        [serverIP setBezeled:YES];
        [serverIP setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [serverIP setBackgroundColor:[CPColor colorWithHexString:"003300"]];
        
        
        botonOK = [[CPButton alloc] initWithFrame:CGRectMake(300, 400, 50, 18)];
        [botonOk setBezelStyle:CPHUDBezelStyle];
        [botonOK setTitle:@"Ok"];
        
        [botonOK setTarget:self];
        [botonOK setAction:@selector(savePreferences)];                
              
        [contentView addSubview:botonOK];
        [contentView addSubview: wallpaperLabel]; 
        [contentView addSubview: wallpaperMenus]; 
        [contentView addSubview: serverIPLabel];  
        [contentView addSubview: serverIP];   
             
    }
    return self;
}
-(void)savePreferences{
    var contentView = [bridgeWindow contentView];
    bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/"+[wallpaperMenus titleOfSelectedItem]+".jpg" size:CPSizeMake(30, 25)];
    [contentView setBackgroundColor:[CPColor colorWithPatternImage:bgImage]];
}
@end