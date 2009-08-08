//
//  PlayerWindow.j
//  XYZRadio
//
//  Created by Alos on 10/2/08.
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

@import <AppKit/CPPanel.j>
@import <AppKit/CPWindowController.j>
@import "XYZSong.j"
@import "PlayerControl.j"

@implementation PlayerWindow : CPWindow
	{
		CPButton backButton;
		CPButton playButton;
		CPButton forwardButton;
		CPSlider volumeSlider;
		CPTextField currentlyPlayingTextField;
		CPTextField currentlyPlayingTimeTextField;	
		//the control
		PlayerControl playerControl;
		//timer
		CPString time;
		CPSlider timeSlider;
		
		//contentview
		CPView contentView;
	}
	
	/*Una bonita contructora*/
	- (id)initWithAcontrol:(PlayerControl)aPlayerControl contentRect:(CGRect)aRectangle{
		CPLog.trace("Inicializanso la ventana con un control");
		self = [super initWithContentRect:aRectangle styleMask:CPHUDBackgroundWindowMask|CPBorderlessWindowMask];
		
		//set local variables
		playerControl=aPlayerControl;
		if (self)//pa ver si no somos null :P
		{
			//le ponemos titulo al HUD lo centramos
			[self setTitle:@"Player"];
			contentView = [self contentView];
			var bounds = [contentView bounds];  
			var center= CGRectGetWidth(bounds)/2.0 -35;
			
			var backImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/backButton.png" size:CPSizeMake(50, 50)];
			var backImagePressed = [[CPImage alloc] initWithContentsOfFile:"Resources/player/backButtonPressed.png" size:CPSizeMake(50, 50)];
			backButton = [[CPButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(bounds)/2.0-100 , 30, 50, 50)];
			[backButton setImage: backImage];
			[backButton setAlternateImage: backImagePressed];
			[backButton setBordered:NO];
			[backButton setAction:@selector(previousSong)];
			
			var playImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/playButtonPressed.png" size:CPSizeMake(70, 70)];
			var playImagePressed = [[CPImage alloc] initWithContentsOfFile:"Resources/player/playButton.png" size:CPSizeMake(70, 70)];
			playButton = [[CPButton alloc] initWithFrame:CGRectMake(center, 15, 70, 70)];
			[playButton setImage: playImage];
			[playButton setBordered:NO];
			[playButton setAction:@selector(playSong)];
			
			
			var forwardImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/nextButton.png" size:CPSizeMake(50, 50)];
			var forwardImagePressed = [[CPImage alloc] initWithContentsOfFile:"Resources/player/nextButtonPressed.png" size:CPSizeMake(50, 50)];
			forwardButton = [[CPButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(bounds)/2.0+50, 30, 50, 50)];
			[forwardButton setImage: forwardImage];
			[forwardButton setAlternateImage: forwardImagePressed];
			[forwardButton setBordered:NO];
			[forwardButton setAction:@selector(nextSong)];
			
			//VOLUME 
			volumeSlider = [[CPSlider alloc] initWithFrame:CGRectMake(CGRectGetWidth(bounds)/2.0 - 100, 95, 200, 25)];
			[volumeSlider setMinValue:0];
			[volumeSlider setMaxValue:100];
			[volumeSlider setDoubleValue:100];        
			[contentView addSubview:volumeSlider];
			//Ponemos las labeles al rededor del slider
			var volumeDownImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/volumeDown.png" size:CPSizeMake(26, 25)];
			var volumeDownImageView = [[CPImageView alloc] initWithFrame:CGRectMake(70, 95, 26, 25)];
			[volumeDownImageView setImage: volumeDownImage];
			
			var volumeUpImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/volumeUp.png" size:CPSizeMake(26, 25)];
			var volumeUpImageView = [[CPImageView alloc] initWithFrame:CGRectMake(305, 95, 26, 25)];
			[volumeUpImageView setImage: volumeUpImage];	
			
			[contentView addSubview:volumeDownImageView];
			[contentView addSubview:volumeUpImageView];
			
			[volumeSlider setTarget:self];
			[volumeSlider setAction:@selector(setVolume:)]; 
			
			//Currenlyplaying bar 
			
			var grillBG = [[CPImage alloc] initWithContentsOfFile:"Resources/player/fondotrans.png" size:CPSizeMake(371, 67)];
			var grillBGImageView = [[CPImageView alloc] initWithFrame:CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 130, 371, 67)];
			[grillBGImageView setImage: grillBG];
			[grillBGImageView setAlphaValue:0.6];
			[contentView addSubview: grillBGImageView];
			
			
			/*var timebar = [[CPImage alloc] initWithContentsOfFile:"Resources/player/timeline.png" size:CPSizeMake(371, 5)];
			var timebarImageView = [[CPImageView alloc] initWithFrame:CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 175, 371, 5)];
			[timebarImageView setImage: timebar];
			[contentView addSubview: timebarImageView];*/
			
			var currentlyPlayingString=" ";
			currentlyPlayingTextField= [[CPTextField alloc] initWithFrame: CGRectMake(20, 150, 350, 18)];
			[currentlyPlayingTextField setStringValue:currentlyPlayingString];//currentlyPlayingString
			[currentlyPlayingTextField setTextColor: [CPColor colorWithHexString:"33FF00"]];
			[currentlyPlayingTextField setAlignment:CPCenterTextAlignment];
			[contentView addSubview: currentlyPlayingTextField];
			
			var currentlyPlayingTimeString="0:00";
			currentlyPlayingTimeTextField= [[CPTextField alloc] initWithFrame: CGRectMake(300, 133, 100, 18)];
			[currentlyPlayingTimeTextField setStringValue:currentlyPlayingTimeString];//currentlyPlayingString
			[currentlyPlayingTimeTextField setTextColor: [CPColor colorWithHexString:"33FF00"]];
			[currentlyPlayingTimeTextField setAlignment:CPCenterTextAlignment];
			[contentView addSubview: currentlyPlayingTimeTextField];
			
			
			timeSlider = [[CPSlider alloc] initWithFrame:CGRectMake( (CGRectGetWidth(bounds)- 250)/2, 170, 250, 25)];
			[timeSlider setMinValue:0];
			[timeSlider setMaxValue:100];
			[timeSlider setDoubleValue:0];        
			[timeSlider setTarget:self];
			[timeSlider setAction:@selector(setTimeOfSong:)];
			[contentView addSubview:timeSlider];

			
			
			var glassImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/transparencia-cristal.png" size:CPSizeMake(371, 34)];
			var glassImageView = [[CPImageView alloc] initWithFrame:CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 128, 371, 34)];
			[glassImageView setImage: glassImage];
			[glassImageView setAlphaValue:.3];
			[contentView addSubview: glassImageView];
			
			
			[contentView addSubview: backButton];
			[contentView addSubview: playButton];
			[contentView addSubview: forwardButton];
			
			
			playing = NO;
			paused = NO;
			local=YES;
		}
		return self;
	}
	/**
	 Sets the play icon
	 */
	-(void)setPlayIcon{
		var pausedIcon = [[CPImage alloc] initWithContentsOfFile:"Resources/player/playButton.png" size:CPSizeMake(70, 70)];
		[playButton setImage:pausedIcon];
	}
	/**
	 Sets the stop icon
	 */
	-(void)setStopIcon{
		
	}
	
	/**
	 Set the pused icon
	 */
	-(void)setPausedIcon{
		var playImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/pausedIcon.png" size:CPSizeMake(70, 70)];
		[playButton setImage:playImage];
	}
	
	/**
	 Gets the vol and tells the control to set it
	 */
	- (void)setVolume:(id)aVolume{
		[playerControl setVolume:[aVolume doubleValue]];
	}
	
	/*playSong*/
	-(void)playSong{
		[playerControl play];
	}
	
	/**
	 Pauses the song
	 */
	-(void)pauseSong{
		[playerControl pauseSong];
	}
	
	/**
	 Stops the playing song
	 */
	-(void)stopSong{
		var playImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/playButton.png" size:CPSizeMake(70, 70)];
		[playButton setImage:playImage];
	}
	
	/**
	 Plays the next song
	 */
	-(void)nextSong{
		[playerControl nextSong];			
	}
	/**
	 Plays the previous song
	 */
	-(void)previousSong{
		[playerControl previousSong];
	}
	
	/*
	 Sets the timer of the current song
	 */
	-(void)setTime:(int)aTime{
		if(aTime){
			[currentlyPlayingTimeTextField setStringValue: [self getTime: aTime]];
			[timeSlider setDoubleValue:parseInt(aTime)];
			[[CPRunLoop currentRunLoop] performSelectors];
		}
	}
	
	/*Sets the curently playing song*/
	-(void)setCurrentlyPlayingSong:(CPString)aSongTitle time:(CPString)aMaxTime{
		CPLog.trace(aMaxTime);
		[currentlyPlayingTextField setStringValue:aSongTitle];
		var auxArray = [aMaxTime componentsSeparatedByString:":"];
		var seconds = (parseInt(auxArray[0]) * 60) + parseInt(auxArray[1]);
		var milies = seconds * 1000;
		CPLog.trace("%s milies", milies);
		[timeSlider setMaxValue:parseInt(milies)];
		[timeSlider setDoubleValue:0];
	}
	
	- (CPTextField)labelWithTitle:(CPString)aTitle
	{
		var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
		
		[label setStringValue:aTitle];
		[label setTextColor:[CPColor colorWithHexString:"33FF00"]];
		
		[label sizeToFit];
		
		return label;
	}
	
	- (void)songDidFinishPlaying{
		var playImage = [[CPImage alloc] initWithContentsOfFile:"Resources/player/playButtonPressed.png" size:CPSizeMake(70, 70)];
		var playImagePressed = [[CPImage alloc] initWithContentsOfFile:"Resources/player/playButton.png" size:CPSizeMake(70, 70)];
		[playButton setImage: playImage];
		[playButton setAlternateImage: playImagePressed];
		[currentlyPlayingTextField setStringValue:" "];
		[currentlyPlayingTimeTextField setStringValue:"0:00"];
	}
	
	-(void)setTimeOfSong:(id)aVolume{
		//TODO[playerControl setVolume:[aVolume value]];
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
	@end

