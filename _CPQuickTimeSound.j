/*
 * _CPQuickTimeSound.j
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

@implementation _CPQuickTimeSound : CPSound
{
    DOMElement _Player;      // The DOM element that will be used and controlled
}

- (BOOL)_haveQuickTime
{
    var haveqt = NO;
    if (navigator.plugins) {
        for (i=0; i < navigator.plugins.length; i++ ) {
            if (navigator.plugins[i].name.indexOf("QuickTime") >= 0)
            {
                haveqt = YES;
            }
        }
    }
    
    if ((navigator.appVersion.indexOf("Mac") > 0)
        && (navigator.appName.substring(0,9) == "Microsoft")
        && (parseInt(navigator.appVersion) < 5) )
    {
        haveqt = YES;
    }
    
    return haveqt;
}

- (id)_CreateDOMObjectElement:(NSString)aFileName
{
    var _DOMObjectElement = document.createElement("object");
    var _DOMParamElement = document.createElement("param");
    
    _DOMObjectElement.setAttribute("classid", "clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B");
    _DOMObjectElement.setAttribute("codebase", "http://www.apple.com/qtactivex/qtplugin.cab");
    _DOMObjectElement.setAttribute("width", "0");
    _DOMObjectElement.setAttribute("height", "0");
    
    _DOMParamElement.setAttribute("src", aFileName);
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("controller", "false");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("autoplay", "false");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("hidden", "true");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("enablejavascript", "true");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("postdomevents", "true");
    _DOMObjectElement.appendChild(_DOMParamElement);
    _DOMParamElement = document.createElement("param");
    _DOMParamElement.setAttribute("id", "CPMixer" + "Object" + _CPMixerCounter);
    _DOMObjectElement.appendChild(_DOMParamElement);
    
    return _DOMObjectElement;
}

- (id)_CreateDOMEmbedElement:(NSString)aFileName
{
    var _DOMEmbedElement = document.createElement("embed");  // Embed-tag
    
    _DOMEmbedElement.setAttribute("src", aFileName);
    _DOMEmbedElement.setAttribute("width", "0");
    _DOMEmbedElement.setAttribute("height", "0");
    _DOMEmbedElement.setAttribute("pluginspage", "http://www.apple.com/quicktime/download/");
    _DOMEmbedElement.setAttribute("name", "CPMixer" + "Embed" + _CPMixerCounter);
    _DOMEmbedElement.setAttribute("enablejavascript", "true");
    _DOMEmbedElement.setAttribute("postdomevents", "true");
    _DOMEmbedElement.setAttribute("autoplay", "false");
    return _DOMEmbedElement;
}

- (id)initWithFile:(CPString)aFileName mixer:(DOMElement)mixerDiv
{
    self = [super init];
   
    if (self)
    {
        if(![self _haveQuickTime])
            return nil;
        
        var _DOMObjectElement = [self _CreateDOMObjectElement:aFileName];
        var _DOMEmbedElement = [self _CreateDOMEmbedElement:aFileName];
    
        _DOMObjectElement.appendChild(_DOMEmbedElement);
        mixerDiv.appendChild(_DOMObjectElement);
    
        _Player = document.getElementsByName("CPMixer" + "Embed" + _CPMixerCounter);
        if (_Player.length == 0)
        {
            _Player = document.getElementById("CPMixer" + "Object" + _CPMixerCounter);
            if(!_Player)
                return nil;
        } else {
            _Player = _Player[0];
        }
        
        if (document.addEventListener)
        {
            _Player.addEventListener('qt_ended', function () {
                if(_delegate != nil && [_delegate respondsToSelector:@selector(sound:didFinishPlaying:)])
                [_delegate sound:self didFinishPlaying:YES];
            } , false);
        } else {
            _Player.attachEvent('onqt_ended', function () {
                if(_delegate != nil && [_delegate respondsToSelector:@selector(sound:didFinishPlaying:)])
                [_delegate sound:self didFinishPlaying:YES];
            });  // Internet Explorer
        }
    }
    return self;
}

- (BOOL)isPlaying
{
    return _Player.GetRate() != 0;
}

- (void)play
{
    _Player.Play();
}

- (void)pause
{
    _Player.Stop();
}

- (void)stop
{
    _Player.Rewind();
    _Player.Stop();
}

// Volume between 0 and 1
- (var)volume
{
    return _Player.GetVolume() / 256.0;
}

// Set volume between 0 and 1
- (void)setVolume:(var)volume
{
    if (volume > 1)
        volume = 1;
    else if (volume < 0)
        volume = 0;
    _Player.SetVolume(volume*256);
}

- (var)duration
{
    return _Player.GetDuration() / _Player.GetTimeScale();
}

- (BOOL)loops()
{
    return _Player.GetIsLooping() != 0;
}

- (void)setLoops:(BOOL)loops
{
    _Player.SetIsLooping(loops?1:0);
}

- (var)currentTime
{
    return _Player.GetTime() / _Player.GetTimeScale();
}

- (void)setCurrentTime:(var)time
{
    if(time < 0)
        time = 0;
    _Player.SetTime(time * _Player.GetTimeScale());
}

@end