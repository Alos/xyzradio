//
//  PlayerControl.j
//  XYZRadio
//
//  Created by Alos on 11/19/08.
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

@import <Foundation/CPObject.j>
@import "PlayerWindow.j"
@import "XYZSong.j"
@import "MainBrowser.j"
@import "SMSoundManager.j"

@implementation PlayerControl : CPObject
{
	PlayerWindow player;//the window that has the play button
	SMSoundManager theSoundManager;//the wrapper on the sound manager
    XYZSong currentlyPlayingSong;//the currently playing song
	DJList djList;//the dj list that contains the songs
	//flags for playing
	BOOL playing;
	BOOL paused;
	BOOL local;
}

-(id)init:(DJList)aDJList{
	self = [super init];
	if(self){
		djList=aDJList;
		console.log("Player initialized!");
		[self togglePlayerWindow];
		theSoundManager = [[SMSoundManager alloc] init];
		[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(setTime:) name:"pos" object:theSoundManager];
		[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(songDidFinishPlaying:) name:"SongEnded" object:theSoundManager];
		local=YES;//for testing 
		return self;
	}
}

-(void)play{
	//first we find out where to play the song from
	//right now we just play from the DJLIST
	var song = [djList getSelectedSong];
	console.log("Se selecciono, %s", [song songTitle]);
	[self playSong:song];
}

//Plays the song thats passed to it
- (void)playSong:(XYZSong)aSong{
	if(local){
		if([theSoundManager isLoaded]){
			if(!playing){
				if([aSong pathToSong]==NULL)
					console.log("No path in the song selected!");//TODO poner aqui una ventana de alerta
				else{
					console.log("Playing: %s", [aSong pathToSong]);
					currentlyPlayingSong=aSong;
					var currentlyPlayingString= [aSong songTitle]+" by "+[aSong artist];
					[player setCurrentlyPlayingSong:currentlyPlayingString time:[aSong time]];
					[player setTime:[aSong time]];
					[theSoundManager playSound:[aSong pathToSong]];
					[player setPausedIcon];
					playing = YES;
				}
			}else{
				if(paused){
					console.log("Resumming...");
					[theSoundManager togglePause];
					[player setPausedIcon];
					paused = NO;
				}else{
					console.log("Pausing...");
					[theSoundManager togglePause];
					[player setPlayIcon];
					paused = YES;
				}
			}
		}
		else
			console.log("El sound manager aun no esta funcionando..espere un momento....");
	}else{
		//IP mode
	}		
}

//plays the next song
-(void)nextSong{
	var totalSongs = [djList getSongListSize];
	var index = [djList getSongIndex: currentlyPlayingSong];
	index++;
	if(totalSongs <= index)
		index=0;
	[djList setSelectionIndexes:index];
	if(!paused){
		console.log("Is playing switching to the new song");
		[self stopSong];
		[self playSong:[djList getSongByIndex:index]];
	}else{
		console.log("Not playing just selecting the song");
		[self stopSong];
		paused = NO;
		playing = NO;
	}
}

//plays the previous song
-(void)previousSong{
    var totalSongs = [djList getSongListSize];
	var index = [djList getSongIndex: currentlyPlayingSong];
	index--;
	if(index < 0)
	 index = totalSongs-1;
	console.log("Index: %s",index);
	[djList setSelectionIndexes:index];
	if(!paused){
		console.log("Is playing switching to the new song");
		[self stopSong];
		[self playSong:[djList getSongByIndex:index]];	
	}else{
		console.log("Not playing just selecting the song");
		[self stopSong];
		paused = NO;
		playing = NO;
	}
	
}

//Stops the currently playing song
-(void)stopSong{
	[theSoundManager stopSound];
	[player stopSong];
	playing = NO;
}


/**
Moves the timer on the player GUI 
*/
-(void)setTime:(CPNotification)aNotification{
	var info = [aNotification userInfo];
	var aux = [info objectForKey:"time"];
	time = aux;
	if(time==NULL)
		return;
	[player setTime:time];
}

/**
Notification that gets called when the currently playing song finished
*/
- (void)songDidFinishPlaying:(CPNotification)aNotification{
	console.log("Song finished playing");
	[player songDidFinishPlaying];
	paused=NO;
	playing=NO;
}

/**
Sets the song volume
*/
-(void)setVolume:(double)aVolume{
	[theSoundManager setVolume:aVolume];
}

-(void)togglePlayerWindow{
    if(!player)
		player = [[PlayerWindow alloc] initWithAcontrol:self contentRect:CGRectMake(500, 560, 400, 200)];
    if([player isVisible]){
        [player setFrameOrigin:(CPPointMake(500, 560))];
        [player close];
    }
    else    
		[player orderFront:self];//we open it
}
@end