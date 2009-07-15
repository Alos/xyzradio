/*
 * _CPAudioSound.j
 * AppKit
 *
 * Created by Erik Österlund.
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


@import "CPSound.j"

var _CPMixerCounter = 0;

@implementation _CPAudioSound : CPSound
{
    DOMElement _Player;      // The DOM element that will be used and controlled
}

- (BOOL)_CreateDOMAudioElement:(NSString)aFileName
{
    var _DOMAudioElement = document.createElement("audio");
    _DOMAudioElement.setAttribute("src", aFileName);
    _DOMAudioElement.setAttribute("autoplay", "false");
    _DOMAudioElement.setAttribute("autostart", "0");
    _DOMAudioElement.setAttribute("controls", "false");
    _DOMAudioElement.setAttribute("loop", "false");
    _DOMAudioElement.setAttribute("id", "CPMixer" + "Audio" + _CPMixerCounter);
    
    return _DOMAudioElement;
}

- (id)initWithFile:(CPString)aFileName mixer:(DOMElement)mixerDiv
{
    self = [super init];
   
    if (self)  //TODO: We currently rely on quicktime, but other plugins could be used as well.
    {
        var _DOMAudioElement = [self _CreateDOMAudioElement:aFileName];
        mixerDiv.appendChild(_DOMAudioElement);
        if(!document.getElementById("CPMixer" + "Audio" + _CPMixerCounter))
            return nil;
        
        _Player = _DOMAudioElement;
        
        if (document.addEventListener)
        {
            _Player.addEventListener('ended', function () {
                if(_delegate != nil && [_delegate respondsToSelector:@selector(sound:didFinishPlaying:)])
                [_delegate sound:self didFinishPlaying:YES];
            } , false);
        } else {
            _Player.attachEvent('onended', function () {
                if(_delegate != nil && [_delegate respondsToSelector:@selector(sound:didFinishPlaying:)])
                [_delegate sound:self didFinishPlaying:YES];
            });  // Internet Explorer
        }
    }
    return self;
}

- (BOOL)isPlaying
{
    return !_Player.paused;
}

- (void)play
{
    _Player.play();
}

- (void)pause
{
    _Player.pause();
}

- (void)stop
{
    _Player.pause();
    _Player.currentTime = 0;
}

// Volume between 0 and 1
- (var)volume
{
    return _Player.volume;
}

// Set volume between 0 and 1
- (void)setVolume:(var)volume
{
    if (volume > 1)
        volume = 1;
    else if (volume < 0)
        volume = 0;
    _Player.volume = volume;
}

- (var)duration
{
    return _Player.duration;
}

- (BOOL)loops()
{
    return _Player.loop == nil;
}

- (void)setLoops:(BOOL)loops
{
    _Player.loop = loops;
}

- (var)currentTime
{
    return _Player.currentTime;
}

- (void)setCurrentTime:(var)time
{
    if(time < 0)
        time = 0;
    _Player.currentTime = time;
}

@end