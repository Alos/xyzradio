/*
 * CPSound.j
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


@import <AppKit/CPDOMWindowBridge.j>
@import <Foundation/CPObject.j>
@import <Foundation/CPString.j>
@import <Foundation/CPDictionary.j>

var _CPMixerDiv = nil;
var _CPMixerSounds = nil;

/*! @class CPSound
    
    CPSound is a class cluster consisting of different classes depending on 
    what addons and tags are available on the current browser. You should
    never create one of the subclasses directly, so use this class only.

    @delegate – sound:(CPSound)aSound didFinishPlaying:(BOOL)finished
    If the delegate implements this method, the CPSound will tell when the
    sound is done playing.
    
    @param aSound the sound that completed
    @param finished whether or not we are done playing
*/
@implementation CPSound : CPObject
{
    CPObject   _delegate;    // The delegate, which will be informed when the song ended
    CPString   _name;      // The name of the sound
}

+ (void)initialize
{
    var bridge = [CPDOMWindowBridge sharedDOMWindowBridge];
    var body = bridge._DOMBodyElement;
    _CPMixerDiv = document.createElement("div");
    body.appendChild(_CPMixerDiv);
    _CPMixerDiv.style.width = "0px";
    _CPMixerDiv.style.height = "0px";
    _CPMixerSounds = [CPDictionary dictionary];
}

/*!
    Returns the sound with a given name which can be set with setName:
*/
+ (id)soundNamed:(NSString)aName
{
    return [_CPMixerSounds objectForKey:aName];
}

/*!
    Returns a new CPSound object with the specified resource string.
*/
- (id)initWithResource:(CPString)resource
{
    self = [super init];
   
    if (self)  //TODO: We currently rely on quicktime, but other plugins could be used as well.
    {
        var aFileName = [[CPBundle mainBundle] pathForResource:resource];
        _name = nil;
        
        if (self = [[_CPAudioSound alloc] initWithFile:aFileName mixer:_CPMixerDiv])
            return self;
        if (self = [[_CPQuickTimeSound alloc] initWithFile:aFileName mixer:_CPMixerDiv])
            return self;
    }
    return nil;
}

/*!
    Sets the delegate, which can listen to when we are done playing.
*/
- (void)setDelegate:(CPObject)delegate
{
    _delegate = delegate;
}

/*!
    Returns the delegate.
*/
- (void)delegate
{
    return _delegate;
}

/*!
    Sets the name of the sound, so that it can be created with the soundNamed: class method.
*/
- (void)setName:(CPString)aName
{
    [_CPMixerSounds setObject:self forKey:aName];
    _name = aName;
}

/*!
    Returns the name of the receiver if it got one, nil otherwise.
*/
- (CPString)name
{
    return _name;
}

/*!
    Returns YES if the audio is playing, NO otherwise.
*/
- (BOOL)isPlaying
{
}

/*!
    Starts playing at the current position
*/
- (void)play
{
}

/*!
    Resumes playing. Returns NO if we were already playing, YES otherwise.
*/
- (BOOL)resume
{
    var playing = [self isPlaying];
    [self play];
    return !playing;
}

/*!
    Pauses playback.
*/
- (void)pause
{
}

/*!
    Stops playback and goes back to the beginning.
*/
- (void)stop
{
}

/*!
    Returns the current volume between 0 and 1.
*/
- (var)volume
{
}


/*!
    Sets the volume between 0 and 1.
*/
- (void)setVolume:(var)volume
{
}

/*!
    Returns the duration of the sound in seconds.
*/
- (var)duration
{
}

/*!
    Returns YES if the audio is looping, NO otherwise.
*/
- (BOOL)loops()
{
}

/*!
    Sets whether we are looping or not.
*/
- (void)setLoops:(BOOL)loops
{
}

/*!
    Returns the current time in seconds.
*/
- (var)currentTime
{
}

/*!
    Sets the current time in seconds.
*/
- (void)setCurrentTime:(var)time
{
}

@end

@import "_CPQuickTimeSound.j"
@import "_CPAudioSound.j"