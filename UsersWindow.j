 //
//  UsersWindow.j
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

@implementation UsersWindow:CPWindow {
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
        //para los titulos
        //var cmArray =[[CPArray alloc] init]; 
	var userColumnModel = [[XYZColumnModel alloc] initWithFrame:CGRectMake(0, 7, 26, 31) title:"User" color:nil];
	var nameUserColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(27, 7, 202, 31) title:"Name" color:nil];
        var statusUserColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(230, 7, 190, 31) title:"Status" color: nil];
		
	var fullModel = [CPDictionary dictionaryWithObjects:[userColumnModel, nameUserColumnModel, statusUserColumnModel] forKeys:["user","nameUser", "statusUser"]];
	//a table
        theTable = [[XYZTable alloc] initWithColumnModel:fullModel model:list frame: bounds];
        
        [contentView addSubview: theTable];    
    }
    
    return self;
}

@end

