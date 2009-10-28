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

@implementation NewPlaylistWindow : CPWindow
	{
		
		CPTextField nameTextField;
		CPButton botonGuardar;
	}
	
	/*Una bonita contructora*/
	- (id)initWithContentRect:aRectangle styleMask:aStyleMask contentViewOfWindow:(CPView)aContentView{
		self = [super initWithContentRect:aRectangle styleMask: aStyleMask];
		if (self)//pa ver si no somos null :P
		{
			contentViewOfWindow = aContentView;
			//le ponemos titulo al HUD lo centramos
			[self setTitle:@"New Playlist"];
			
			var contentView = [self contentView];
			var bounds = [contentView bounds];  
			var center= CGRectGetWidth(bounds)/2.0;
			
			var nameLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 50, 100, 18)];
			[nameLabel setStringValue:"Name:"];
			[nameLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
			
			nameTextField = [[CPTextField alloc] initWithFrame: CGRectMake(50, 248, 170, 30)];
			[nameTextField setEditable:YES];
			[nameTextField setBezeled:YES];
			[nameTextField setTextColor: [CPColor colorWithHexString:"000000"]];
			[nameTextField setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
			[contentView addSubview:nameTextField];
			
			
			botonGuardar = [[CPButton alloc] initWithFrame:CGRectMake(50, 100, 50, 18)];
			[botonGuardar setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
			[botonGuardar setBezelStyle:CPHUDBezelStyle];
			[botonGuardar setTitle:@"Ok"];	        
			[botonGuardar setTarget:self];
			[botonGuardar setAction:@selector(savePreferences)];                
			
			[contentView addSubview: botonGuardar];
			
			
		}
		return self;
	}
	
	-(void)savePreferences{
		
		[self close];
	}
	
	@end
