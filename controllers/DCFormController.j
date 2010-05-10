 
/*
 * DCFormController.j
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "CPPropertyAnimation.j"
@import "../gui/DCFormView.j"

@implementation DCFormController : CPObject {
	// suggest event sheet
	CPWindow sheet;
	DCFormView formView @accessors;
	CPView shadeView;
}

- (id)initWithFormView:(DCFormView)aFormView {
	self = [super init];
	if (self) {
		formView = aFormView;
		[formView setDelegate:self];

		sheet = [[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, [formView frame].size.width, [formView frame].size.height) styleMask:CPBorderlessWindowMask];
		[sheet setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMaxYMargin];
		[sheet setHasShadow:YES];
		[sheet setContentView:formView];

		shadeView = [[CPView alloc] initWithFrame:[[[[[CPApplication sharedApplication] delegate] theWindow] contentView] bounds]];
		[shadeView setBackgroundColor:[CPColor blackColor]];
		[shadeView setAlphaValue:0.5];
		[shadeView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
	}
	return self;
}

- (void)startForm {
	var mainWindow = [[[CPApplication sharedApplication] delegate] theWindow];

	[[mainWindow contentView] addSubview:shadeView];

	[[CPApplication sharedApplication] runModalForWindow:sheet];
	[sheet setFrame:CGRectMake(
		([mainWindow frame].size.width / 2) - ([sheet frame].size.width / 2),
		-[sheet frame].size.height - 20,
		[sheet frame].size.width,
		[sheet frame].size.height)];

	var anim = [[CPPropertyAnimation alloc] initWithView:sheet property:@"frame"];
	[anim setStart:CGRectMakeCopy([sheet frame])];
	[anim setEnd:CGRectMake([sheet frame].origin.x, -20, [sheet frame].size.width, [sheet frame].size.height)];
	[anim setDuration:0.3];
	[anim startAnimation];

	//[[[[CPApplication sharedApplication] delegate] infoBubbleController] hide];

	[sheet orderFront:[[[CPApplication sharedApplication] delegate] theWindow]];
	[sheet becomeKeyWindow];
	[formView didShow];
}

- (void)endForm {
	[[CPApplication sharedApplication] stopModal];

	[shadeView removeFromSuperview];

	var anim = [[CPPropertyAnimation alloc] initWithView:sheet property:@"frame"];
	[anim setStart:CGRectMakeCopy([sheet frame])];
	[anim setEnd:CGRectMake([sheet frame].origin.x, -[sheet frame].size.height - 20, [sheet frame].size.width, [sheet frame].size.height)];
	[anim setDuration:0.3];
	[anim setDelegate:self];
	[anim startAnimation];
}

- (void)animationDidEnd:(CPAnimation)animation {
	[sheet orderOut:nil];
}

@end