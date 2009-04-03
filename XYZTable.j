//
//  SFTable.j
//  XYZRadio
//
//  Created by Alos on 10/2/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//
@import <Foundation/CPObject.j>
@import "XYZSong.j"

SongsDragType = @"SongsDragType";

@implementation XYZTable : CPView
{
    /*Para las tablas*/
    CPCollectionView collectionView;
    CPArray model;
    /*Cosas para los titulos*/
    CPArray columnModel
    /*Cosas para las celdas*/
    XYZCell celdas;
    var pos; 
}

-(void) initWithColumnModel:(CPArray)aColumnModel model:(CPArray)aModel frame:(CGRect)bounds{
    self = [super initWithFrame:bounds];
    [self setModel:aModel];
    //para nuestro grid
    collectionView = [[CPCollectionView alloc] initWithFrame: CGRectMake(0, 30,  CGRectGetWidth(bounds), CGRectGetHeight(bounds))];
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
    celdas = [[XYZCell alloc] initWithFrame:CGRectMakeZero()];
    [listItem setView: celdas];  
    
    [collectionView setItemPrototype: listItem];  
    [collectionView setMaxNumberOfColumns:1]; 
    [collectionView setMinItemSize:CPSizeMake(CGRectGetWidth(bounds), 20)];
    [collectionView setMaxItemSize:CPSizeMake(CGRectGetWidth(bounds), 20)];
    [collectionView setContent: model];
    [self addSubview:scrollView];
    
    
    //DELEGATE?
    [collectionView setDelegate: self];
        
    //la q esta arriba del Collectionview
    var borderArriba = [[CPView alloc] initWithFrame:CGRectMake(0, 30 , CGRectGetWidth(bounds), 1)];    
        [borderArriba setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: borderArriba];
    //la de arriba    
    var borderTop = [[CPView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bounds), 1)];    
        [borderTop setBackgroundColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: borderTop];

    [self setColumnModel:aColumnModel];
    
    [self registerForDraggedTypes:[SongsDragType]];
    
    return self;
}
//DELEGATE METHODS
-(void)collectionView:(CPCollectionView)collectionView didDoubleClickOnItemAtIndex:(int)index{
	console.log("Le dieron click a %d",index);
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
//END OF DELEGATE METHODS
-(void)setColumnModel:(CPArray)aColumnModel{
    console.log("Setting the column model...");
    columnModel = aColumnModel;
    for(var i=0; i<[columnModel count];i++){
        var thisColumn = [columnModel objectAtIndex:i];
        [self addSubview: thisColumn];
        if(i>0 && i<[columnModel count]){
            pos= pos+CGRectGetWidth([[columnModel objectAtIndex: i-1] bounds])+1;
            var border = [[CPView alloc] initWithFrame:CGRectMake(pos, 0, 1, CGRectGetHeight([self bounds]))];    
            console.log("Setting line at: %d",pos);
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
		[collectionView setSelectionIndexes:index];
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

@implementation XYZCell : CPView
{
    CPTextField     titleView;
    CPTextField     authorView;
    CPTextField     time;
    CPView          highlightView;
    XYZSong theSong;
    CPPasteboard aPasteboard;
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
    [titleView setFrameOrigin: CGPointMake(5,0.0)];
    
    if(!authorView)
    {
        authorView = [[CPTextField alloc] initWithFrame:CGRectInset([self bounds], 4, 4)];
        [authorView setFont: [CPFont systemFontOfSize: 12.0]];
        [authorView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: authorView];
    }
    [authorView setStringValue: [anObject artist]];
    [authorView sizeToFit];
    [authorView setFrameOrigin: CGPointMake(251,0.0)];   
    
    if(!time)
    {
        time = [[CPTextField alloc] initWithFrame:CGRectInset([self bounds], 4, 4)];
        [time setFont: [CPFont systemFontOfSize: 12.0]];
        [time setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [self addSubview: time];
    }
    [time setStringValue: [anObject time]];
    [time sizeToFit];
    [time setFrameOrigin: CGPointMake(500,0.0)]; 
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
        [time setTextColor: [CPColor blackColor]];     
    }
    else
    {
        [highlightView removeFromSuperview];
        [titleView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [authorView setTextColor: [CPColor colorWithHexString:"33FF00"]];
        [time setTextColor: [CPColor colorWithHexString:"33FF00"]];
    }

}
@end
