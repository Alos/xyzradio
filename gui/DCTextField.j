/*
 * DCTextField.j
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

@import <Foundation/CPObject.j>

@implementation DCTextField : CPControl {
	var _DOMTextElement;
	id delegate @accessors;
	bool required @accessors;
	CPString name @accessors;
}

- (id)initWithFrame:(CGRect)aFrame {
	self = [super initWithFrame:aFrame];
	if (self) {
		required = NO;
		var padding = 2;
		var border = 1;

		_DOMTextElement = document.createElement("input");
		_DOMTextElement.type = "text";
		_DOMTextElement.style.position = "absolute";
		_DOMTextElement.style.top = "0px";
		_DOMTextElement.style.left = "0px";
		_DOMTextElement.style.width = ([self frame].size.width - (padding * 2) - (border * 2)) + "px";
		_DOMTextElement.style.height = ([self frame].size.height - (padding * 2) - (border * 2)) + "px";
		_DOMTextElement.style.whiteSpace = "pre";
		_DOMTextElement.style.zIndex = 100;
		/*if (!isIE) {
			_DOMTextElement.style.font = _DOMElement.style.font;
		}*/
		_DOMTextElement.style.padding = padding +"px";
		_DOMTextElement.style.margin = "0px";
		_DOMTextElement.style.border = "1px solid #999999";
		_DOMElement.appendChild(_DOMTextElement);

		_DOMElement.style.overflow = "visible"; // so the native browser focus glow is visible

		_DOMTextElement.onkeypress = function(aDOMEvent) {
			aDOMEvent = aDOMEvent || window.event;
			if (aDOMEvent.keyCode == 13) {
				if (aDOMEvent.preventDefault)
					aDOMEvent.preventDefault(); 
				if (aDOMEvent.stopPropagation)
					aDOMEvent.stopPropagation();
				aDOMEvent.cancelBubble = true;
				_DOMTextElement.blur();
				[self commitAction];
			}
		};
		_DOMTextElement.onkeydown = function(aDOMEvent) {
			aDOMEvent = aDOMEvent || window.event;
			if (aDOMEvent.keyCode == 27) {
				if (aDOMEvent.preventDefault)
					aDOMEvent.preventDefault(); 
				if (aDOMEvent.stopPropagation)
					aDOMEvent.stopPropagation();
				aDOMEvent.cancelBubble = true;
				_DOMTextElement.blur();
				[self cancelAction];
			}
		};
	}
	return self;
}

- (BOOL)becomeFirstResponder {
	[super becomeFirstResponder];
	[CPTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(focus) userInfo:nil repeats:NO];
	return YES;
}

- (void)focus {
	_DOMTextElement.focus();
}

- (void)setStringValue:(CPString)aString {
	[super setStringValue:aString];
	_DOMTextElement.value = aString;
}

- (CPString)stringValue {
	return _DOMTextElement.value;
}

- (void)setEnabled:(bool)yesNo {
	[super setEnabled:yesNo];
	if ([self isEnabled] == YES) {
		_DOMTextElement.disabled = false;
		[self setAlphaValue:1];
	} else {
		_DOMTextElement.disabled = true;
		[self setAlphaValue:0.6];
	}
}

- (void)commitAction {
	if ([self delegate] != nil) {
		if ([[self delegate] respondsToSelector:@selector(commitAction)]) {
			[[self delegate] performSelector:@selector(commitAction)];
		}
	}
}

- (void)cancelAction {
	if ([self delegate] != nil) {
		if ([[self delegate] respondsToSelector:@selector(cancelAction)]) {
			[[self delegate] performSelector:@selector(cancelAction)];
		}
	}
}

@end 
