/*
 * DCFormView.j
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */


@import <Foundation/CPObject.j>
@import "DCTextField.j"

DCFormControlTypeTextField = "DCFormControlTypeTextField";
DCFormControlTypeTextFieldShort = "DCFormControlTypeTextFieldShort";
DCFormControlTypeTextArea = "DCFormControlTypeTextArea";
DCFormControlTypeCheckBox = "DCFormControlTypeCheckBox";
DCFormControlTypeHidden = "DCFormControlTypeHidden";

@implementation DCFormView : CPView {
	id delegate @accessors;
	bool enabled @accessors;
	CPString submitURLString @accessors;
	CPString submitButtonTitle @accessors;

	// fields
	CPTextField headerLabel;
	CPTextField requiredLabel;
	CPButton cancelButton;
	CPButton submitButton;
	CPArray fields @accessors;

	// spacing
	float paddingBottom;
	float paddingLeft;
	float paddingRight;
	float paddingTop;
	float lineSpacing;
	float columnSpacing;
	float labelWidth;
	float fieldHeight;
	float currentYOffset;

	// connection
	CPURLConnection connection;
	var data;
}

- (id)initWithFrame:(CGRect)aFrame {
	self = [super initWithFrame:aFrame];
	if (self) {
		[self setBackgroundColor:[CPColor colorWithCalibratedWhite:0.95 alpha:0.95]];

		paddingBottom = 20;
		paddingLeft = 20;
		paddingRight = 20;
		paddingTop = 100;
		lineSpacing = 14;
		columnSpacing = 10;
		labelWidth = 106;
		fieldHeight = 26;
		currentYOffset = paddingTop;
		fields = [[CPMutableArray alloc] init];

		submitButtonTitle = @"Submit";

		// header
		headerLabel = [[CPTextField alloc] initWithFrame:CGRectMake(paddingLeft, 45, [self frame].size.width - paddingLeft - paddingRight, 40)];
		[headerLabel setTextColor:[CPColor colorWithHexString:@"444444"]];
		[headerLabel setFont:[CPFont systemFontOfSize:12]];
		[headerLabel setAlignment:CPCenterTextAlignment];
		[headerLabel setStringValue:@""];
		[headerLabel setAutoresizingMask:CPViewMaxXMargin | CPViewMaxYMargin];
		[self addSubview:headerLabel];

		// required
		requiredLabel = [[CPTextField alloc] initWithFrame:CGRectMake(paddingLeft, [self frame].size.height - paddingBottom - 20, 100, fieldHeight)];
		[requiredLabel setTextColor:[CPColor colorWithHexString:@"444444"]];
		[requiredLabel setFont:[CPFont systemFontOfSize:11]];
		[requiredLabel setStringValue:@"* Required Fields"];
		[requiredLabel setAutoresizingMask:CPViewMaxXMargin | CPViewMinYMargin];
		[requiredLabel setHidden:YES];
		[self addSubview:requiredLabel];

		// submit button
		submitButton = [[CPButton alloc] initWithFrame:CGRectMake([self frame].size.width - paddingRight - 112, [self frame].size.height - paddingBottom - 24, 112, 24)];
		[submitButton setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin];
		[submitButton setTarget:self];
		[submitButton setAction:@selector(submitAction:)];
		[submitButton setTitle:[self submitButtonTitle]];
		[self addSubview:submitButton];

		// cancel button
		cancelButton = [[CPButton alloc] initWithFrame:CGRectMake(
			[self frame].size.width - paddingRight - [submitButton frame].size.width - columnSpacing - 70, 
			[self frame].size.height - paddingBottom - 24, 
			70, 
			24)];
		[cancelButton setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin];
		[cancelButton setTarget:self];
		[cancelButton setAction:@selector(cancelAction)];
		[cancelButton setTitle:"Cancel"];
		[cancelButton setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin];
		[self addSubview:cancelButton];

		[self becomeFirstResponder];
	}
	return self;
}

- (void)didShow {
	[self setEnabled:YES];
	if ([fields count] > 0) {
	}
	for (var i = 0; i < [fields count]; i++) {
		if ([[fields objectAtIndex:i] superview]) {
			[[fields objectAtIndex:i] becomeFirstResponder];
			break;
		}
	}
}

- (void)cancelAction {
	[delegate endForm];
}

- (CPTextField)labelWithTitle:(CPString)aString originY:(float)y {
	var label = [[CPTextField alloc] initWithFrame:CGRectMake(paddingLeft, y, labelWidth, fieldHeight)];
	[label setTextColor:[CPColor colorWithHexString:@"444444"]];
	[label setFont:[CPFont boldSystemFontOfSize:12]];
	[label setAlignment:CPRightTextAlignment];
	[label setStringValue:aString];
	[label setAutoresizingMask:CPViewMaxXMargin | CPViewMaxYMargin];
	[self addSubview:label];
	return label;
}

- (CPControl)addFieldRowWithTitle:(CPString)theTitle name:(CPString)name controlType:(CPString)theControlType required:(bool)required {
	// add the label
	if (theControlType != DCFormControlTypeCheckBox) {
		[self labelWithTitle:theTitle originY:currentYOffset + 54];
	}

	var control;

	// add the control
	if (theControlType == DCFormControlTypeTextField || theControlType == DCFormControlTypeTextFieldShort) {
		var width = [self frame].size.width - paddingLeft - labelWidth - columnSpacing - paddingRight;
		if (theControlType == DCFormControlTypeTextFieldShort) {
			width = width / 2;
		}
		control = [[DCTextField alloc] initWithFrame:CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset+50, width, fieldHeight)];
		//control = [[CPTextField alloc] initWithFrame:CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset, width, fieldHeight)]; 
		[control setAutoresizingMask:CPViewWidthSizable | CPViewMaxYMargin];
		[control setDelegate:self];
		[self addSubview:control];
		currentYOffset += fieldHeight + lineSpacing;
	} else if (theControlType == DCFormControlTypeTextArea) {
		var width = [self frame].size.width - paddingLeft - labelWidth - columnSpacing - paddingRight;
		control = [[DCTextArea alloc] initWithFrame:CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset, width, fieldHeight * 4)];
		[control setAutoresizingMask:CPViewWidthSizable | CPViewMaxYMargin];
		[self addSubview:control];
		currentYOffset += (fieldHeight * 4) + lineSpacing;
	} else if (theControlType == DCFormControlTypeCheckBox) {
		// label
		var label = [self labelWithTitle:theTitle originY:currentYOffset + 4];
		var width = [self frame].size.width - paddingLeft - labelWidth - columnSpacing - paddingRight - 30;
		[label setFrame:CGRectMake(paddingLeft + labelWidth + columnSpacing + 30, [label frame].origin.y - 10, width, [label frame].size.height)];
		[label setAlignment:CPLeftTextAlignment];

		// checkbox
		// TODO: implement checkbox

		// update the offset so we're ready for the next row
		currentYOffset += fieldHeight + lineSpacing - 10;
	} else if (theControlType == DCFormControlTypeHidden) {
		//control = [[DCTextField alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
		//[control setDelegate:self];

		control = [[DCTextField alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
		[control setDelegate:self];
	}

	[control setName:name];
	[control setRequired:required];
	[fields addObject:control];

	if ([control required]) {
		[requiredLabel setHidden:NO];
	}

	return control;
}

- (void)setEnabled:(bool)yesNo {
	enabled = yesNo;
	if (enabled == YES) {
		for (var i = 0; i < [fields count]; i++) {
			[[fields objectAtIndex:i] setEnabled:YES];
		}
		[cancelButton setEnabled:YES];
		[cancelButton setAlphaValue:1];
		[submitButton setEnabled:YES];
		[submitButton setTitle:[self submitButtonTitle]];
		[submitButton setAlphaValue:1];
	} else {
		for (var i = 0; i < [fields count]; i++) {
			if ([[fields objectAtIndex:i] respondsToSelector:@selector(setEnabled:)]) {
				[[fields objectAtIndex:i] setEnabled:NO];
			}
		}
		[submitButton setEnabled:NO];
		[submitButton setTitle:@"Sending..."];
		[submitButton setAlphaValue:0.7];
	}
}

- (void)submitAction:(id)sender {
	[self setEnabled:NO];
	var requiredError = NO;
	for (var i = 0; i < [fields count]; i++) {
		if ([[fields objectAtIndex:i] required] && [[[fields objectAtIndex:i] stringValue] isEqualToString:""]) {
			requiredError = YES;
		}
	}
	if (requiredError) {
		alert("Please fill in all required fields.");
		[self setEnabled:YES];
		for (var i = 0; i < [fields count]; i++) {
			if ([[fields objectAtIndex:i] required] && [[[fields objectAtIndex:i] stringValue] isEqualToString:""]) {
				[[fields objectAtIndex:i] becomeFirstResponder];
				return;
			}
		}
	} else {
		var body = "";
		for (var i = 0; i < [fields count]; i++) {
			body += "&"+ escape([[fields objectAtIndex:i] name]) +"="+ escape([[fields objectAtIndex:i] stringValue]);
		}
		var uniqueCookie = [[CPCookie alloc] initWithName:"unique"];
		body += "&unique="+ escape([uniqueCookie value]);

		if ([submitURLString isEqualToString:@""] == NO) {
			var request = [CPURLRequest requestWithURL:submitURLString];
			[request setHTTPMethod:"POST"];
			[request setValue:"application/x-www-form-urlencoded" forHTTPHeaderField:"Content-Type"];
			[request setValue:[body length] forHTTPHeaderField:"Content-Length"];
			[request setHTTPBody:body];
			var connection = [CPURLConnection connectionWithRequest:request delegate:self];
		} else {
			CPConsoleLog("Invalid submitURLString: "+ submitURLString);
		}
	}
}

-(void)connection:(CPURLConnection)aConnection didReceiveResponse:(CPHTTPURLResponse)response {
	// do nothing
}

- (void)connection:(CPURLConnection)aConnection didReceiveData:(Object)theData {
	data = theData;
}

-(void)connectionDidFinishLoading:(CPURLConnection)aConnection {
	[submitButton setTitle:@"Done!"];
	[cancelButton setEnabled:NO];
	[cancelButton setAlphaValue:0.7];
	var message = NO;
	if ([[self thankYouMessage] isEqualToString:@""]) {
		[CPTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(clearAndClose) userInfo:nil repeats:NO];
	} else {
		[CPTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(thanks) userInfo:nil repeats:NO];
	}
}

- (void)connection:(CPURLConnection)aConnection didFailWithError:(CPString)error {
	alert("Error sending form.  Please try again.");
	[self setEnabled:YES];
}

- (void)thanks {
	alert([self thankYouMessage]);
	[CPTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(clearAndClose) userInfo:nil repeats:NO];
}

- (void)clearAndClose {
	for (var i = 0; i < [fields count]; i++) {
		[[fields objectAtIndex:i] setStringValue:@""];
	}
	[self setEnabled:YES];
	[delegate endForm];
}

- (void)commitAction {
	[self submitAction:nil];
}

- (CPString)thankYouMessage {
	return @"";
}

@end 
