/*
 * DCLinkTextField.j
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */
 
@import <Foundation/CPObject.j>
 
@implementation DCLinkTextField : CPTextField {
	CPColor _oldTextColor;
	CPString HTML @accessors;
	id HTMLElement @accessors;
}
 
- (id)initWithFrame:(CGRect)aFrame {
	self = [super initWithFrame:aFrame];
	if (self) {
		var contentView = [self layoutEphemeralSubviewNamed:@"content-view"
	                                             positioned:CPWindowAbove
	                        relativeToEphemeralSubviewNamed:@"bezel-view"];
 
		HTMLElement = document.createElement("div");
		HTMLElement.style.width = "100%";
		HTMLElement.style.height = "100%";
		contentView._DOMElement.appendChild(HTMLElement);
	}
	return self;
}
 
- (void)setHTML:(CPString)theHTML {
	HTMLElement.innerHTML = theHTML;
}
 
- (void)HTML {
	return HTMLElement.innerHTML;
}
 
@end