/*
 * CPLightbox.j
 * AppKit
 *
 * Created by Nicholas Small.
 * Copyright 2009, 280 North, Inc.
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

@import <AppKit/CPApplication.j>


var SharedLightbox;

@implementation CPLightbox : CPObject
{
    CPWindow        _lightbox;
    
    CPColor         _backgroundColor;
}

+ (id)sharedLightbox
{
    if (!SharedLightbox)
        SharedLightbox = [[CPLightbox alloc] init];
    
    return SharedLightbox;
}

+ (void)runModalForWindow:(CPWindow)aWindow
{
    [[self sharedLightbox] runModalForWindow:aWindow];
}

+ (void)stopModal
{
    [[self sharedLightbox] stopModal];
}

+ (void)setBackgroundColor:(CPColor)aColor
{
    [[self sharedLightbox] setBackgroundColor:aColor];
}

+ (CPColor)backgroundColor
{
    return [[self sharedLightbox] backgroundColor];
}

- (void)runModalForWindow:(CPWindow)aWindow
{
    if (!_lightbox)
    {
        _lightbox = [[CPWindow alloc] initWithContentRect:CGRectMake(0.0, 0.0, 10000.0, 10000.0) styleMask:CPBorderlessWindowMask];
        [_lightbox setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [[_lightbox contentView] setBackgroundColor:_backgroundColor || [CPColor colorWithCalibratedRed:209.0/255.0 green:216.0/255.0 blue:227.0/255.0 alpha:0.6]];
    }
    
    [_lightbox orderFront:self];
    
    [CPApp runModalForWindow:aWindow];
}

- (void)stopModal
{
    [CPApp stopModal];
    
    [_lightbox close];
}

- (void)setBackgroundColor:(CPColor)aColor
{
    _backgroundColor = aColor;
    
    if (_lightbox)
        [[_lightbox contentView] setBackgroundColor:_backgroundColor];
}

- (CPColor)backgroundColor
{
    return _backgroundColor;
}

@end