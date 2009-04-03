//
//  XYZPlayList.j
//  XYZRadio
//
//  Created by Alos on 11/19/08.
//
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

-(void)setSelectionIndexes:(CPIndexSet)index{
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