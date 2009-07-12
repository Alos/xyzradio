//
//  MainBrowser.j
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
@import "XYZPlayList.j"
@import "XYZColumnModel.j"
@import "XYZTable.j"

/*The Music browser*/
@implementation MainBrowser : XYZPlayList
{
}

/*Una bonita contructora*/
- (id)initWithSource:(CPArray)list rectangle:(CGRect)aRectangle{
    //Initializing a window
    self = [super initWithContentRect:aRectangle];
    if (self)//pa ver si no somos null :P
    {
        //le ponemos titulo al HUD lo centramos
        [self setTitle:@"Music Browser"];
        var contentView = [self contentView];
        var bounds = [contentView bounds];
        //para los titulos
		var titleColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(0, 7, 228, 31) title:"Name" color:NULL];
        var artistColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(230, 7, 190, 31) title:"Artist" color: NULL];
        var timeColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(422, 7, 48, 31) title:"Time" color: NULL];
        var ratingColumnModel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(470, 7, 48, 31) title:"Rating" color: NULL];
		
		var fullModel = [CPDictionary dictionaryWithObjects:[titleColumnModel, artistColumnModel, timeColumnModel, ratingColumnModel] forKeys:["title", "artist", "time", "rating"]];
		
       
        theTable = [[XYZTable alloc] initWithColumnModel:fullModel model:list frame: bounds];
        
        [contentView addSubview: theTable];    
            
    }
    
    return self;
}
-(void)addItem:(CPObject)anObject{
    [theTable addItem:anObject];
}
-(void)addList:(CPArray)aModel
{   console.log("addlist here!");
    [theTable setModel: aModel];
}
-(void)removeSelectedItems{
   console.log("removeSlectedItems in SFBrowser got a msg");
   [theTable removeSelectedItems];
}


@end