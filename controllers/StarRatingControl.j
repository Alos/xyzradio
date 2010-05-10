/* -*- coding: utf-8 -*-
 * Created by Moritz Angermann on 6. March 2009.
 * Copyright 2009 Moritz Angermann. All rights reserved.
 *
 * Based on a revision from boucher from 280North and
 * crafted with lots of aid from him aswell.
 */

@import <AppKit/CPControl.j>
@import <AppKit/CPImage.j>
 
var starEmpty  = [[CPImage alloc] initWithContentsOfFile: "Resources/StarRater/empty.png" size: CPSizeMake(25, 25)],
    starSet    = [[CPImage alloc] initWithContentsOfFile: "Resources/StarRater/set.png" size: CPSizeMake(25, 25)],
    starActive = [[CPImage alloc] initWithContentsOfFile: "Resources/StarRater/active.png" size: CPSizeMake(25, 25)];
 
@implementation StarRatingControl : CPControl
{
    int     numberOfStars @accessors;
    int     activeValue;
    BOOL    isActive;
}
 
- (id)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
        numberOfStars = 6;
        self._DOMElement.style.cursor = "pointer"; // hack until cappuccino has pointer support
    }
    return self;
}
 
- (void)viewWillMoveToWindow:(CPWindow)aWindow
{
    [aWindow setAcceptsMouseMovedEvents:YES];
}

// This will be called whenever we setNeedsDisplay to YES
- (void)drawRect:(CGRect)aRect
{
    if([starEmpty loadStatus] != CPImageLoadStatusCompleted)
      return [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(imageDidLoad:) name:CPImageDidLoadNotification object:starEmpty];
    if([starSet loadStatus] != CPImageLoadStatusCompleted)
      return [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(imageDidLoad:) name:CPImageDidLoadNotification object:starSet];
    if([starActive loadStatus] != CPImageLoadStatusCompleted)
      return [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(imageDidLoad:) name:CPImageDidLoadNotification object:starActive];

    var context = [[CPGraphicsContext currentContext] graphicsPort],
        bounds = [self bounds],
        starWidth = bounds.size.width / numberOfStars,
        starHeight = bounds.size.height,
        value = [self intValue]; 
    for (var i=0; i<numberOfStars; i++)
    {
        if (isActive && activeValue > i)
            CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starActive);
        else
        {
            if (value > i)
                CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starSet);        
            else if (value <= i)
                CGContextDrawImage(context, CGRectMake(starWidth*i, 0, starWidth, starHeight), starEmpty);
        }
    }
}
-(void)imageDidLoad:(CPNotification)aNotification
{
  [[CPNotificationCenter defaultCenter] removeObserver:self name:CPImageDidLoadNotification object:[aNotification object]];
  [self setNeedsDisplay:YES];
}

- (void)mouseEntered:(CPEvent)anEvent  
{  
    isActive = YES;
    [self setNeedsDisplay:YES];
}  
 
- (void)mouseExited:(CPEvent)anEvent  
{  
    isActive = NO;
    [self setNeedsDisplay:YES];
}  
  
- (void)mouseMoved:(CPEvent)anEvent  
{
    var offset = [self convertPoint:[anEvent locationInWindow] fromView:nil].x,
        bounds = [self bounds],
        starWidth = bounds.size.width / numberOfStars;
    activeValue = offset < 5 ? 0 : CEIL(offset/starWidth);
    [self setNeedsDisplay:YES];
}  
 
- (void)mouseDown:(CPEvent)anEvent
{
	
    [self setIntValue:activeValue];
    activeValue = 0;
    [super mouseDown:anEvent]; 
}
 
- (void)sizeToFit
{
    [self setFrameSize:CGSizeMake(numberOfStars*25, 25)];
} 
@end
