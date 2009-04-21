//
//  XYZPlayList.j
//  XYZRadio
//
//  Created by Alos on 11/19/08.
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
@import <Foundation/CPArray.j>
@import <AppKit/CPPanel.j>
@import <AppKit/CPWindowController.j>
@import "XYZSong.j"

@implementation XYZPlayList : CPWindowController
{
XYZTable theTable;
CPArray theList;
CPPanel win;
}

- (id)initWithContentRect:(CGRect)aRectangle{
	win = [[CPPanel alloc] initWithContentRect:aRectangle styleMask:CPHUDBackgroundWindowMask|CPClosableWindowMask];
    self = [super initWithWindow:win];
    if (self){
	 theList = [[CPArray alloc] init];
    }
    return self;
}

-(XYZSong)getSelectedSong{
	var index = [theTable getSelectedItem]; //we ask the table the selected item
	var aux = [theTable getSongByIndex: index]; //we take said item from the list
	return aux;
}

- (CPTextField)labelWithTitle:(CPString)aTitle{
    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    
    [label setStringValue:aTitle];
    [label setTextColor:[CPColor whiteColor]];
    
    [label sizeToFit];

    return label;
}

-(int)getSongIndex:(XYZSong)aSong{
	return [theTable getSongIndex:aSong];
}

-(XYZSong)getSongByIndex:(int)index{
	return [theTable getSongByIndex:index];
}

-(void)setSelectionIndexes:(int)index{
	[theTable setSelectionIndexes:index];
}

-(void)removeSelectedItems{
   console.log("removeSlectedItems in SFBrowser got a msg");
   [theTable removeSelectedItems];
}

-(int)getSongListSize{
	return [theTable getSongListSize];
}
@end