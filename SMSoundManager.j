//
//  SMSoundManager.j
//  SoundManager
//
//  Created by Ross Boucher and Alos on 10/3/08.
/*
This file is part of XYZRadio.

    XYZRadio is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License.

    XYZRadio is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with XYZRadio.  If not, see <http://www.gnu.org/licenses/>.
*/


@implementation SMSoundManager : CPObject
{
    BOOL    isLoaded;
    Object  soundManager;
	Object song; 
}

- (id)init
{
    self = [super init];
    CPLog.trace("Inicializando el SM");
    window.setTimeout(setupSoundManager, 1000, self);
    
    return self;
}

- (void)soundManagerDidLoad:(Object)aManager
{
    isLoaded = YES;
    soundManager = aManager;
    
    //[self playSound];
}

- (void)playSound:(CPString)aFile
{
	CPLog.trace("The File: %s",aFile);
    var song = soundManager.createSound({ 
		id : 'aSong', 
		url : aFile,
		onfinish: function(){
			[self soundDidFinish]
		;},
		whileplaying: function(){
			[self soundPosition];
		}
	});
	song.play();
}
-(void)pauseSound{
	soundManager.pause('aSong');
}
-(void)resumeSound{
	soundManager.resume('aSong');
}
-(void)togglePause{
	soundManager.togglePause('aSong');
}
-(void)stopSound{
	soundManager.destroySound('aSong');
	soundManager.stopAll();
}

-(void)isLoaded
{
	return isLoaded;
}
-(void)setVolume:(int)aVolume{
	soundManager.setVolume('aSong', aVolume);
}
-(void)soundDidFinish{
	 CPLog.trace("Sound finished...posting notification...");
	 [[CPNotificationCenter defaultCenter] postNotificationName:"SongEnded" object:self]; 
}
-(void)soundPosition{
	var info = [CPDictionary dictionaryWithObject:song.position forKey:"time"];   
	[[CPNotificationCenter defaultCenter] postNotificationName:"pos" object:self userInfo:info]; 
}

@end

var setupSoundManager = function(obj)
{
	var script = document.createElement("script");
	
	script.type = "text/javascript";
	script.src = "Resources/soundmanager2.js";
	
	script.addEventListener("load", function()
	{
		soundManager.url = "Resources/soundmanager2.js"; // path to directory containing SoundManager2 .SWF file
		soundManager.onload = function() {
            [obj soundManagerDidLoad:soundManager];            
		};
        soundManager.beginDelayedInit();
		soundManager.debugMode = false;
	}, YES);	
	
	document.getElementsByTagName("head")[0].appendChild(script);
}