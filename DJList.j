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
@import "XYZPlayList.j"

@implementation DJList : XYZPlayList
{
}

/*Una bonita contructora*/
- (id)initWithSource:(CPArray)list contentRect:(CGRect)aRect{
    self = [super initWithContentRect:aRect];
    if (self)//pa ver si no somos null :P
    {
	   //le ponemos titulo al HUD lo centramos
        [self setTitle:@"DJ List"];
        var contentView = [self contentView];
        var bounds = [contentView bounds];
        //para los titulos
        var cmArray =[[CPArray alloc] init]; 
		var playingColumnModel = [[XYZColumnModel alloc] initWithFrame:CGRectMake(0, 7, 26, 31) title:" " color:nil];
		var titleColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(27, 7, 202, 31) title:"Name" color:nil];
        var artistColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(230, 7, 190, 31) title:"Artist" color: nil];
        var timeColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(422, 7, 48, 31) title:"Time" color: nil];
        var ratingColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(470, 7, 48, 31) title:"Rating" color: nil];
		
		var fullModel = [CPDictionary dictionaryWithObjects:[playingColumnModel, titleColumnModel, artistColumnModel, timeColumnModel, ratingColumnModel] forKeys:["playing","title", "artist", "time", "rating"]];
		//a table
        theTable = [[XYZTable alloc] initWithColumnModel:fullModel model:list frame: bounds];
        
        [contentView addSubview: theTable];    
	}    
    return self;
}
@end