//
//  DJList.j
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
@import <AppKit/CPPanel.j>
@import <AppKit/CPWindowController.j>
@import "XYZPlayList.j"

@implementation DJList : XYZPlayList
{
}

/*Una bonita contructora*/
- (id)initWithSource:(CPArray)list{
    self = [super initWithContentRect:CGRectMake(900, 60, 500, 500)];
    if (self)//pa ver si no somos null :P
    {
	   //le ponemos titulo al HUD lo centramos
        [win setTitle:@"DJ List"];
        [win setFloatingPanel:YES];
        [win setDelegate:self];  
        var contentView = [win contentView];
        var bounds = [contentView bounds];
        //para los titulos
        var cmArray =[[CPArray alloc] init]; 
        var titleLabel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(0, 0, 248, 31) title:"Name" color:NULL];
        var artistLabel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(250, 0, 248, 31) title:"Artist" color: NULL];
        var timeLabel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(500, 0, 48, 31) title:"Time" color: NULL];
        var ratingLable =[[XYZColumnModel alloc] initWithFrame:CGRectMake(550, 0, 48, 31) title:"Rating" color: NULL];
        [cmArray addObject: titleLabel]; 
        [cmArray addObject: artistLabel];
        [cmArray addObject: timeLabel];
        [cmArray addObject: ratingLable];
        //a table
        theTable = [[XYZTable alloc] initWithColumnModel: cmArray model:list frame: bounds];
        
        [contentView addSubview: theTable];    
	}    
    return self;
}
@end