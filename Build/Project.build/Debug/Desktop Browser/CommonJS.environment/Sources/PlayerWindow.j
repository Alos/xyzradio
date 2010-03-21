@STATIC;1.0;I;16;AppKit/CPPanel.jI;27;AppKit/CPWindowController.ji;9;XYZSong.ji;15;PlayerControl.jt;13500;objj_executeFile("AppKit/CPPanel.j", NO);
objj_executeFile("AppKit/CPWindowController.j", NO);
objj_executeFile("XYZSong.j", YES);
objj_executeFile("PlayerControl.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "PlayerWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("backButton"), new objj_ivar("playButton"), new objj_ivar("forwardButton"), new objj_ivar("volumeSlider"), new objj_ivar("currentlyPlayingTextField"), new objj_ivar("currentlyPlayingTimeTextField"), new objj_ivar("playerControl"), new objj_ivar("time"), new objj_ivar("timeSlider"), new objj_ivar("contentView"), new objj_ivar("modeControl"), new objj_ivar("singleUserModeImageOn"), new objj_ivar("multiUserModeImageOn"), new objj_ivar("singleImage")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithAcontrol:contentRect:"), function $PlayerWindow__initWithAcontrol_contentRect_(self, _cmd, aPlayerControl, aRectangle)
{ with(self)
{
  CPLog.trace("Inicializanso la ventana con un control");
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PlayerWindow").super_class }, "initWithContentRect:styleMask:", aRectangle, CPHUDBackgroundWindowMask|CPBorderlessWindowMask);
  playerControl=aPlayerControl;
  if (self)
  {
   objj_msgSend(self, "setTitle:", "Player");
   contentView = objj_msgSend(self, "contentView");
   var bounds = objj_msgSend(contentView, "bounds");
   var center= CGRectGetWidth(bounds)/2.0 -35;
   var singleUserModeImageOn = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/privado.png", CPSizeMake(26, 27));
   var multiUserModeImageOn = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/radio.png", CPSizeMake(26, 27));
   modeControl = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(20, 20, 26, 27));
   objj_msgSend(modeControl, "setImage:",  singleUserModeImageOn);
   objj_msgSend(modeControl, "setBordered:", NO);
   objj_msgSend(modeControl, "setAction:", sel_getUid("modeControlActionPerformed"));
   objj_msgSend(contentView, "addSubview:", modeControl);
   singleImage=YES;
   var backImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/backButton.png", CPSizeMake(50, 50));
   var backImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/backButtonPressed.png", CPSizeMake(50, 50));
   backButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)/2.0-100 , 30, 50, 50));
   objj_msgSend(backButton, "setImage:",  backImage);
   objj_msgSend(backButton, "setAlternateImage:",  backImagePressed);
   objj_msgSend(backButton, "setBordered:", NO);
   objj_msgSend(backButton, "setAction:", sel_getUid("previousSong"));
   var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButtonPressed.png", CPSizeMake(70, 70));
   var playImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
   playButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(center, 15, 70, 70));
   objj_msgSend(playButton, "setImage:",  playImage);
   objj_msgSend(playButton, "setBordered:", NO);
   objj_msgSend(playButton, "setAction:", sel_getUid("playSong"));
   var forwardImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/nextButton.png", CPSizeMake(50, 50));
   var forwardImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/nextButtonPressed.png", CPSizeMake(50, 50));
   forwardButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)/2.0+50, 30, 50, 50));
   objj_msgSend(forwardButton, "setImage:",  forwardImage);
   objj_msgSend(forwardButton, "setAlternateImage:",  forwardImagePressed);
   objj_msgSend(forwardButton, "setBordered:", NO);
   objj_msgSend(forwardButton, "setAction:", sel_getUid("nextSong"));
   volumeSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(bounds)/2.0 - 100, 95, 200, 25));
   objj_msgSend(volumeSlider, "setMinValue:", 0);
   objj_msgSend(volumeSlider, "setMaxValue:", 100);
   objj_msgSend(volumeSlider, "setDoubleValue:", 100);
   objj_msgSend(contentView, "addSubview:", volumeSlider);
   var volumeDownImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/volumeDown.png", CPSizeMake(26, 25));
   var volumeDownImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(70, 95, 26, 25));
   objj_msgSend(volumeDownImageView, "setImage:",  volumeDownImage);
   var volumeUpImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/volumeUp.png", CPSizeMake(26, 25));
   var volumeUpImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(305, 95, 26, 25));
   objj_msgSend(volumeUpImageView, "setImage:",  volumeUpImage);
   objj_msgSend(contentView, "addSubview:", volumeDownImageView);
   objj_msgSend(contentView, "addSubview:", volumeUpImageView);
   objj_msgSend(volumeSlider, "setTarget:", self);
   objj_msgSend(volumeSlider, "setAction:", sel_getUid("setVolume:"));
   var grillBG = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/fondotrans.png", CPSizeMake(371, 67));
   var grillBGImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 130, 371, 67));
   objj_msgSend(grillBGImageView, "setImage:",  grillBG);
   objj_msgSend(grillBGImageView, "setAlphaValue:", 0.6);
   objj_msgSend(contentView, "addSubview:",  grillBGImageView);
   var currentlyPlayingString=" ";
   currentlyPlayingTextField= objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 150, 350, 18));
   objj_msgSend(currentlyPlayingTextField, "setStringValue:", currentlyPlayingString);
   objj_msgSend(currentlyPlayingTextField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(currentlyPlayingTextField, "setAlignment:", CPCenterTextAlignment);
   objj_msgSend(contentView, "addSubview:",  currentlyPlayingTextField);
   var currentlyPlayingTimeString="0:00";
   currentlyPlayingTimeTextField= objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(300, 133, 100, 18));
   objj_msgSend(currentlyPlayingTimeTextField, "setStringValue:", currentlyPlayingTimeString);
   objj_msgSend(currentlyPlayingTimeTextField, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(currentlyPlayingTimeTextField, "setAlignment:", CPCenterTextAlignment);
   objj_msgSend(contentView, "addSubview:",  currentlyPlayingTimeTextField);
   timeSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake( (CGRectGetWidth(bounds)- 250)/2, 170, 250, 25));
   objj_msgSend(timeSlider, "setMinValue:", 0);
   objj_msgSend(timeSlider, "setMaxValue:", 100);
   objj_msgSend(timeSlider, "setDoubleValue:", 0);
   objj_msgSend(timeSlider, "setTarget:", self);
   objj_msgSend(timeSlider, "setAction:", sel_getUid("setTimeOfSong:"));
   objj_msgSend(contentView, "addSubview:", timeSlider);
   var glassImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/transparencia-cristal.png", CPSizeMake(371, 34));
   var glassImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake( (CGRectGetWidth(bounds)- 371)/2, 128, 371, 34));
   objj_msgSend(glassImageView, "setImage:",  glassImage);
   objj_msgSend(glassImageView, "setAlphaValue:", .3);
   objj_msgSend(contentView, "addSubview:",  glassImageView);
   objj_msgSend(contentView, "addSubview:",  backButton);
   objj_msgSend(contentView, "addSubview:",  playButton);
   objj_msgSend(contentView, "addSubview:",  forwardButton);
  }
  return self;
 }
},["id","PlayerControl","CGRect"]), new objj_method(sel_getUid("setPlayIcon"), function $PlayerWindow__setPlayIcon(self, _cmd)
{ with(self)
{
  var pausedIcon = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:", pausedIcon);
 }
},["void"]), new objj_method(sel_getUid("setStopIcon"), function $PlayerWindow__setStopIcon(self, _cmd)
{ with(self)
{
 }
},["void"]), new objj_method(sel_getUid("setPausedIcon"), function $PlayerWindow__setPausedIcon(self, _cmd)
{ with(self)
{
  var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/pausedIcon.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:", playImage);
 }
},["void"]), new objj_method(sel_getUid("setVolume:"), function $PlayerWindow__setVolume_(self, _cmd, aVolume)
{ with(self)
{
  objj_msgSend(playerControl, "setVolume:", objj_msgSend(aVolume, "doubleValue"));
 }
},["void","id"]), new objj_method(sel_getUid("playSong"), function $PlayerWindow__playSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "play");
 }
},["void"]), new objj_method(sel_getUid("pauseSong"), function $PlayerWindow__pauseSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "pauseSong");
 }
},["void"]), new objj_method(sel_getUid("stopSong"), function $PlayerWindow__stopSong(self, _cmd)
{ with(self)
{
  var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:", playImage);
 }
},["void"]), new objj_method(sel_getUid("nextSong"), function $PlayerWindow__nextSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "nextSong");
 }
},["void"]), new objj_method(sel_getUid("previousSong"), function $PlayerWindow__previousSong(self, _cmd)
{ with(self)
{
  objj_msgSend(playerControl, "previousSong");
 }
},["void"]), new objj_method(sel_getUid("setTime:"), function $PlayerWindow__setTime_(self, _cmd, aTime)
{ with(self)
{
  if(aTime){
   objj_msgSend(currentlyPlayingTimeTextField, "setStringValue:",  objj_msgSend(self, "getTime:",  aTime));
   objj_msgSend(timeSlider, "setDoubleValue:", parseInt(aTime));
   objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelectors");
  }
 }
},["void","int"]), new objj_method(sel_getUid("setCurrentlyPlayingSong:time:"), function $PlayerWindow__setCurrentlyPlayingSong_time_(self, _cmd, aSongTitle, aMaxTime)
{ with(self)
{
  CPLog.trace(aMaxTime);
  objj_msgSend(currentlyPlayingTextField, "setStringValue:", aSongTitle);
  var auxArray = objj_msgSend(aMaxTime, "componentsSeparatedByString:", ":");
  var seconds = (parseInt(auxArray[0]) * 60) + parseInt(auxArray[1]);
  var milies = seconds * 1000;
  CPLog.trace("%s milies", milies);
  objj_msgSend(timeSlider, "setMaxValue:", parseInt(milies));
  objj_msgSend(timeSlider, "setDoubleValue:", 0);
 }
},["void","CPString","CPString"]), new objj_method(sel_getUid("labelWithTitle:"), function $PlayerWindow__labelWithTitle_(self, _cmd, aTitle)
{ with(self)
{
  var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
  objj_msgSend(label, "setStringValue:", aTitle);
  objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
  objj_msgSend(label, "sizeToFit");
  return label;
 }
},["CPTextField","CPString"]), new objj_method(sel_getUid("songDidFinishPlaying"), function $PlayerWindow__songDidFinishPlaying(self, _cmd)
{ with(self)
{
  var playImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButtonPressed.png", CPSizeMake(70, 70));
  var playImagePressed = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", "Resources/player/playButton.png", CPSizeMake(70, 70));
  objj_msgSend(playButton, "setImage:",  playImage);
  objj_msgSend(playButton, "setAlternateImage:",  playImagePressed);
  objj_msgSend(currentlyPlayingTextField, "setStringValue:", " ");
  objj_msgSend(currentlyPlayingTimeTextField, "setStringValue:", "0:00");
 }
},["void"]), new objj_method(sel_getUid("setTimeOfSong:"), function $PlayerWindow__setTimeOfSong_(self, _cmd, aVolume)
{ with(self)
{
 }
},["void","id"]), new objj_method(sel_getUid("getTime:"), function $PlayerWindow__getTime_(self, _cmd, timeInMilis)
{ with(self)
{
  var nSec = Math.floor(timeInMilis/1000);
  var min = Math.floor(nSec/60);
  var sec = nSec-(min*60);
  if (min == 0 && sec == 0) return null;
  if(sec>=10)
  return min+":"+sec;
  else
  return min+":0"+sec;
 }
},["CPString","int"]), new objj_method(sel_getUid("modeControlActionPerformed"), function $PlayerWindow__modeControlActionPerformed(self, _cmd)
{ with(self)
{
  if(singleImage){
   CPLog.info("Setting singleuser");
   objj_msgSend(modeControl, "setImage:",  multiUserModeImageOn);
   objj_msgSend(playerControl, "setSingleMode:", YES);
   singleImage = NO;
  }else{
   CPLog.info("Setting multiuser");
   objj_msgSend(modeControl, "setImage:",  singleUserModeImageOn);
   objj_msgSend(playerControl, "setSingleMode:", NO);
   singleImage = YES;
  }
 }
},["void"])]);
}

