//
//  SFTable.j
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
@import <Foundation/CPObject.j>
@import "XYZSong.j"
@import "StarRatingView.j"
SongsDragType = @"SongsDragType";
@implementation XYZTable : CPView
{
    /*The collection view for the table*/
    CPCollectionView collectionView;
    CPArray model;
    /*The model for the table*/
    CPDictionary columnModel;
    /*cells*/
    XYZCell celdas;
    var pos; 
}

-(void) initWithColumnModel:(CPDictionary)aColumnModel model:(CPArray)aModel frame:(CGRect)bounds{
    self = [super initWithFrame:bounds];
    [self setModel:aModel];
		
    //the cells
	celdas = [[XYZCell alloc] initWithFrame:CGRectMakeZero()];
	[celdas setModel: aColumnModel];
	
	//para nuestro grid
    collectionView = [[CPCollectionView alloc] initWithFrame: CGRectMake(0, 0,  CGRectGetWidth(bounds), CGRectGetHeight(bounds))];
    pos=0;
    //los scrolls por si son muchos
    var scrollView = [[CPScrollView alloc] initWithFrame: CGRectMake(0, 30, CGRectGetWidth(bounds), CGRectGetHeight(bounds))];
    [scrollView setAutohidesScrollers: YES];
    [scrollView setDocumentView: collectionView]; 
    [[scrollView contentView] setBackgroundColor: NULL];
    [scrollView setHasHorizontalScroller:NO]
    [scrollView setAutoresizesSubviews:YES];
    //los items q representan los renglones
    var listItem = [[CPCollectionViewItem alloc] init];
    [listItem setView: celdas];  
    
    [collectionView setItemPrototype: listItem];  
    [collectionView setMaxNumberOfColumns:1]; 
    [collectionView setMinItemSize:CPSizeMake(CGRectGetWidth(bounds), 20)];
    [collectionView setMaxItemSize:CPSizeMake(CGRectGetWidth(bounds), 20)];
    [collectionView setContent: model];
    [self addSubview:scrollView];
    
    
    [collectionView setDelegate: self];
        
	//la de arriba    
    var borderTop = [[CPView alloc] initWithFrame:CGRectMake(0, 5, CGRectGetWidth(bounds)-2, 1)];    
        [borderTop setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: borderTop];

    //la q esta arriba del Collectionview
    var borderArriba = [[CPView alloc] initWithFrame:CGRectMake(0, 25 , CGRectGetWidth(bounds)-2, 1)];    
        [borderArriba setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: borderArriba];
   
    [self setColumnModel:aColumnModel];
    
    [self registerForDraggedTypes:[SongsDragType]];
    
    return self;
}
-(void)collectionView:(CPCollectionView)collectionView didDoubleClickOnItemAtIndex:(int)index{
	var info = [CPDictionary dictionaryWithObject:index forKey:"index"];
	[[CPNotificationCenter defaultCenter] postNotificationName:"songDoubleClicked" object:self userInfo:info]; 
}

- (void)performDragOperation:(id <CPDraggingInfo>)aSender
{
	console.log("here in performdrag....");
    // If this is us, don't add it.
    if ([aSender draggingSource] == collectionView)
        return;
        
    var pasteboard = [aSender draggingPasteboard];

    if ([[pasteboard types] containsObject:SongsDragType])
    {
        songs = [CPKeyedUnarchiver unarchiveObjectWithData:[pasteboard dataForType:SongsDragType]];
        
        var index = 0,
            count = songs.length;
        
        for (; index < count; ++index){
            if(![[collectionView content] containsObject:songs[index]])
				[self addItem:songs[index]];
			else
				console.log("Repetido!");
		}
			
    }
}

-(void)setColumnModel:(CPDictionary)aColumnModel{
    
	columnModel = [aColumnModel allValues];
    
	for(var i=0; i<[columnModel count];i++){
        var thisColumnModel = [columnModel objectAtIndex:i];
        [self addSubview: thisColumnModel];
        if(i>0 && i<[columnModel count]){
            pos = pos+CGRectGetWidth([[columnModel objectAtIndex: i-1] bounds])+1;
            var border = [[CPView alloc] initWithFrame:CGRectMake(pos, 5, 1, CGRectGetHeight([self bounds])-7)];    
            [border setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview: border];
        }
        
    }
}
-(void)setModel:(CPArray)aModel{
    model = aModel;
    [collectionView setContent: model];
    [collectionView reloadContent];
}
/**
Adds an item to the table
@param the item to add to the table
*/
-(void)addItem:(CPObject)anItem{
    [model addObject:anItem];
    [collectionView reloadContent];
}
/**
@param anIndex the value where the item you want t remove is
*/
-(void)removeItem:(int)anIndex{
    [model removeObjectAtIndex: anIndex];
    [collectionView reloadContent];
}
/**
Returns the item that is currently selected
@return
*/
-(int)getSelectedItem{
    return [[collectionView selectionIndexes] firstIndex];
}
/**
Removes selected items
*/
-(void)removeSelectedItems{
    var indexes= [collectionView selectionIndexes];
    var a = [indexes firstIndex];
    [model removeObjectAtIndex: a];
    [collectionView reloadContent];
}
/**
Gets the current song index in the array
*/
-(int)getSongIndex:(XYZSong)aSong{
	return [model indexOfObject:aSong];
}
/**
Gets the song in the index
*/
-(XYZSong)getSongByIndex:(int)index{
	console.log([[model objectAtIndex:index] pathToSong]);
	return [model objectAtIndex:index];
}
/**
Gets the total of songs in the list
*/
-(int)getSongListSize{
	return [[collectionView content] count];
}

-(CPIndexSet)getSelectedItems{
    return [collectionView selectionIndexes];
}

- (void)setSelectionIndexes:(CPIndexSet)index{
		[collectionView setSelectionIndexes:[CPIndexSet indexSetWithIndex:index]];
}

-(CPArray)collectionView:(CPCollectionView)collectionView dragTypesForItemsAtIndexes:(CPIndexSet)indices{
	console.log("here in dragtypes....%s",indices);
    return [SongsDragType];
}

- (CPData)collectionView:(CPCollectionView)aCollectionView dataForItemsAtIndexes:(CPIndexSet)indexes forType:(CPString)aType
{
    var index = CPNotFound,
        content = [aCollectionView content],
        songs = [];

    while ((index = [indexes indexGreaterThanIndex:index]) != CPNotFound)
        songs.push(content[index]);
    
    return [CPKeyedArchiver archivedDataWithRootObject:songs];
}

@end


var authorViewSize;
var titleViewSize;
var timeViewSize;
var ratingViewSize;

@implementation XYZCell : CPView
{
    CPTextField titleView;
    CPTextField authorView;
    CPTextField timeView;
    CPView highlightView;
    XYZSong theSong;
	StarRatingView raterView;
}


- (void)setModel:(CPDictionary)aModel{
	console.log("Setting the model: %s", aModel);
	if(aModel){
		var titleColumn = [aModel objectForKey:"title"];
		if(titleColumn){
			var titleColumnWidth = [titleColumn frame].origin.x;
			titleViewSize = titleColumnWidth+2;
		}
		
		var artistColumn = [aModel objectForKey:"artist"];
		if(artistColumn){
			var artistColumnWidth = [artistColumn frame].origin.x;
			authorViewSize = artistColumnWidth+2;
		}
		
		var timeColumn = [aModel objectForKey:"time"];
		if(timeColumn){
			var timeColumnWidth = [timeColumn frame].origin.x;
			timeViewSize = timeColumnWidth + 2;
		}
		
		var ratingColumn = [aModel objectForKey:"rating"];
		if(ratingColumn){
			var ratingColumnWidth = [ratingColumn frame].origin.x;
			ratingViewSize = ratingColumnWidth+2;
		}
	}
}

- (void)setRepresentedObject:(JSObject)anObject
{
    theSong = anObject;
    if(!titleView)
    {   
        titleView = [[CPTextField alloc] initWithFrame:CGRectInset( [self bounds], 4, 4)];
        [titleView setFont: [CPFont systemFontOfSize: 12.0]];
        [titleView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: titleView];
    }

    [titleView setStringValue: [anObject songTitle]];
    [titleView sizeToFit];
    [titleView setFrameOrigin: CGPointMake(titleViewSize,0.0)];
    
    if(!authorView)
    {
        authorView = [[CPTextField alloc] initWithFrame:CGRectInset([self bounds], 4, 4)];
        [authorView setFont: [CPFont systemFontOfSize: 12.0]];
        [authorView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: authorView];
    }
	
    [authorView setStringValue: [anObject artist]];
    [authorView sizeToFit];
    [authorView setFrameOrigin: CGPointMake(authorViewSize,0.0)];   
    
    if(!timeView)
    {
        timeView = [[CPTextField alloc] initWithFrame:CGRectInset([self bounds], 4, 4)];
        [timeView setFont: [CPFont systemFontOfSize: 12.0]];
        [timeView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: timeView];
    }
	
    [timeView setStringValue: [anObject time]];
    [timeView sizeToFit];
    [timeView setFrameOrigin: CGPointMake(timeViewSize,0.0)]; 
	
	if(!raterView){
		  var raterView = [[StarRatingView alloc] initWithFrame:CGRectMake(0, 0, 300, 25)];
		  [raterView setFrameOrigin:CGPointMake(ratingViewSize, 0.0)];
		  console.log("Setting rater for %s width %s", [anObject songTitle], raterView);
		  [anObject setStarRater: raterView];		  
		  [self addSubview: raterView];
	}
	var control = [raterView rater];
	[control setIntValue: [anObject rating]];
	
	
	
}

- (void)setSelected:(BOOL)flag
{
    if(!highlightView)
    {
        highlightView = [[CPView alloc] initWithFrame:CGRectCreateCopy([self bounds])];
        [highlightView setBackgroundColor: [CPColor greenColor]];
    }

    if(flag)
    {
        [self addSubview:highlightView positioned:CPWindowBelow relativeTo: titleView];
        [titleView setTextColor: [CPColor blackColor]];            
        [authorView setTextColor: [CPColor blackColor]];
        [timeView setTextColor: [CPColor blackColor]];     
    }
    else
    {
        [highlightView removeFromSuperview];
        [titleView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [authorView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [timeView setTextColor: [CPColor colorWithHexString:"33FF00"]];
    }

}
@end
