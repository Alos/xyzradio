/* -*- coding: utf-8 -*-
 * Created by Moritz Angermann on 6. March 2009.
 * Copyright 2009 Moritz Angermann. All rights reserved.
 */
@import <AppKit/CPView.j>
@import "../controllers/StarRatingControl.j"

var values = [ @"No selection",
               @"Failed",
               @"Not good",
               @"Average",
               @"Good",
               @"Very good",
               @"Excellent" ];

@implementation StarRatingView : CPView
{
  StarRatingControl rater @accessors(readonly);
  CPTextField indicator @accessors(readonly);
}
- (void)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
      rater  = [[StarRatingControl alloc] initWithFrame:CGRectMakeZero()];
      [rater setNumberOfStars:5];
      [rater sizeToFit];
      [rater setTarget:self];
      [rater setAction:@selector(starClick:)];
      indicator = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
      [indicator setPlaceholderString:values[0]];
      [indicator sizeToFit];
      var s_bounds = [self bounds],
          r_bounds = [rater bounds],
          i_bounds = [indicator bounds],
          origin   = CGPointMake(r_bounds.size.width + 5, (r_bounds.size.height - i_bounds.size.height) / 2.0),
          size     = CGSizeMake(s_bounds.size.width - r_bounds.size.width - 5, i_bounds.size.height);
      [indicator setFrameOrigin:origin];
      [indicator setFrameSize:size];
      [indicator setAutoresizingMask: CPViewWidthSizable];
      [self addSubview:rater];
      //[self addSubview:indicator];
    }
    return self;
}

- (void)starClick:(id)sender
{
  var info = [CPDictionary dictionaryWithObject:[sender intValue] forKey:"rating"];   
  [[CPNotificationCenter defaultCenter] postNotificationName:"StarRatingForSongChanged" object:self userInfo:info]; 	
  //[indicator setStringValue:values[[sender intValue]]];
}
@end
