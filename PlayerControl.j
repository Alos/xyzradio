//
//  PlayerControl.j
//  XYZRadio
//
//  Created by Alos on 11/19/08.
//

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
					var currentlyPlayingString= [aSong songTitle]+" by "+[aSong artist]+" Time: "+[aSong time];
					[player setCurrentlyPlayingSong:currentlyPlayingString];
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
	var totalSongs = [theUserList getSongListSize];
	var index = [theUserList getSongIndex: currentlyPlayingSong];
	index++;
	if(totalSongs < index)
		index=0;
	[self playSong:index source:"mylist"];
}

//plays the previous song
-(void)previousSong{
    var totalSongs = [theUserList getSongListSize];
	var index = [theUserList getSongIndex: currentlyPlayingSong];
	index--;
	if(index >= 0)
		[self playSong:index source:"mylist"];	
}

//Stops the currently playing song
-(void)stopSong{
	[player stopSong];
}


/**
Moves the timer on the player GUI 
*/
-(void)setTime:(CPNotification)aNotification{
	var info = [aNotification userInfo];
	var aux = [info objectForKey:"time"];
	time = [self getTime: aux];
	if(time==NULL)
		return;
	var values = [currentlyPlayingSong songTitle]+" by "+[currentlyPlayingSong artist]+" Time: "+time;
	[player setTime:values];
}

/**
Notification that gets called when the currently playing song finished
*/
- (void)songDidFinishPlaying:(CPNotification)aNotification{
	console.log("Song finished playing");
	var playImage = [[CPImage alloc] initWithContentsOfFile:"Resources/playButtonPressed.png" size:CPSizeMake(70, 70)];
	var playImagePressed = [[CPImage alloc] initWithContentsOfFile:"Resources/playButton.png" size:CPSizeMake(70, 70)];
	[playButton setImage: playImage];
	[playButton setAlternateImage: playImagePressed];
	var currentlyPlayingString="Nothing...";
	[currentlyPlaying setStringValue:currentlyPlayingString];
	paused=NO;
	playing=NO;
}

/**
Sets the song volume
*/
-(void)setVolume:(double)aVolume{
	[theSoundManager setVolume:aVolume];
}

/**
Changes milis to regular time
*/
-(CPString)getTime:(int)timeInMilis{
	var nSec = Math.floor(timeInMilis/1000);
    var min = Math.floor(nSec/60);
    var sec = nSec-(min*60);
    if (min == 0 && sec == 0) return null; // return 0:00 as null
	if(sec>=10)
		return min+":"+sec;
	else
		return min+":0"+sec;
}

-(void)togglePlayerWindow{
    if(!player)
		player = [[PlayerWindow alloc] initWithAcontrol:self];
    if([[player window] isVisible]){
        [[player window] setFrameOrigin:(CPPointMake(500, 560))];
        [[player window] orderOut:self];
    }
    else    
    [[player window] orderFront:self];//we open it
}
@end