/*
 * CPPropertyAnimation.j
 * AppKit
 *
 * Created by Nicholas Small. (extended by David Cann)
 * Copyright 2008, Nicholas Small.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */
 
/*
  A VERY basic, but functional, property for Cappuccino. This is not CoreAnimation,
  nor anything similar. However, it will handle some basic property animations, and
  more can easily be added.
*/
 
@implementation CPPropertyAnimation : CPAnimation {
	CPView _view;
	CPString _keyPath;
	CPValue _start;
	CPValue _end;
}
 
- (id)initWithView:(CPView)aView property:(CPString)keyPath {
	self = [super initWithDuration:1.0 animationCurve:CPAnimationLinear];
	if (self) {
		if ([aView respondsToSelector:keyPath]) {
			_view = aView;
			_keyPath = keyPath;
		} else {
			return null;
		}
	}
	return self;
}

- (void)setCurrentProgress:(float)progress {
	[super setCurrentProgress:progress];

	progress = [self currentValue];

	if (_keyPath == 'width' || _keyPath == 'height')
		progress = (progress * (_end - _start)) + _start;
	else if (_keyPath == 'size')
		progress = CGSizeMake((progress * (_end.width - _start.width)) + _start.width, (progress * (_end.height - _start.height)) + _start.height);
	else if (_keyPath == 'frame') {
		progress = CGRectMake(
			(progress * (_end.origin.x - _start.origin.x)) + _start.origin.x, 
			(progress * (_end.origin.y - _start.origin.y)) + _start.origin.y,
			(progress * (_end.size.width - _start.size.width)) + _start.size.width, 
			(progress * (_end.size.height - _start.size.height)) + _start.size.height);
	} else if (_keyPath == 'alphaValue')
		progress = (progress * (_end - _start)) + _start;

	[_view setValue:progress forKey:_keyPath];
}

- (void)setStart:(id)aValue {
	_start = aValue;
}

- (id)start {
	return _start;
}

- (void)setEnd:(id)aValue {
	_end = aValue;
}

- (id)end {
	return _end;
}

@end