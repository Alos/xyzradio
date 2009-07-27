//
//  LoginWindow.j
//  Louhi
//
//  Created by Alos on 10/2/08.
/*This file is part of Louhi.
 
 Louhi is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published by
 the Free Software Foundation, either version 3 of the License.
 
 Louhi is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with Louhi.  If not, see <http://www.gnu.org/licenses/>.
 */

@import "CPLightbox.j"
@import "DCLinkTextField.j"
@import "XYZUser.j"
@import "md5.js"
@import "LoginForm.j"
@import "SigninForm.j"

@implementation LoginWindow : CPWindow
	{
		//the loging form
		LoginForm loginForm;
		//for the new user
		SigninForm signinForm;
		CPString useridReq;
		CPString userPassReq;
		CPApp app;
		CPView contentView;
		CPAnimation animFadeInLog;
		CPAnimation animFadeOutLog;
		CPAnimation animFadeInSign;
		CPAnimation animFadeOutSign;
	}
	
	- (id)initWithContentRect:(CGRect)aRectangle styleMask:(unsigned int) aStyle {
		self = [super initWithContentRect: aRectangle styleMask: aStyle];
		if (self)
		{
			contentView = [self contentView];
			app = [CPApp delegate];
			var bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/fondo-login.jpg" size:CPSizeMake(1000, 800)];
			var bgImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 1000, 800)];
			[bgImageView setImage: bgImage];
			[contentView addSubview: bgImageView];
			
			//At the start we show the loginform
			loginForm = [[LoginForm alloc]  initWithFrame:CGRectMake(600, 200, 500, 600)];
			[contentView addSubview: loginForm];
			
			//Stuff at the bottom of the window
			var poweredByGoogleImage = [[CPImage alloc] initWithContentsOfFile:"Resources/appengine-silver-120x30.gif" size:CPSizeMake(127, 30)];
			var poweredByGoogleImageView = [[CPImageView alloc] initWithFrame:CGRectMake(840, 750, 127, 30)];
			[poweredByGoogleImageView setImage: poweredByGoogleImage];
			[contentView addSubview: poweredByGoogleImageView];
			
			//[self makeFirstResponder:userid];
			
			var helpLink = [[DCLinkTextField alloc] initWithFrame:CGRectMake(20, 750, 100, 30)];
			[helpLink setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
			[helpLink HTMLElement].style.color = "#FFFFFF";
			[helpLink HTMLElement].style.fontSize = "12px";
			[helpLink HTMLElement].style.fontFamily = "Helvetica, Sans-Serif";
			[helpLink HTMLElement].style.fontColor = "#FFFFFF";
			[helpLink HTMLElement].style.lineHeight = "1.5em";
			[helpLink setHTML: @"<a href=\"xyzradioHelpp.html\" style=\"color:#ffffff;\">Help</a>"];
			[contentView addSubview: helpLink];
			
			[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(fadeoutLoginSection:) name:"newUserActionPerformed" object:nil];
			[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(loginActionPerformed:) name:"loginActionPerformed" object:nil];	
			
			[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(createAccountActionPerformed:) name:"createAccountActionPerformed" object:nil];	
			[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(fadeoutSigninSection:) name:"cancelButtonActionPerformed" object:nil];	

		}
		return self;
	}
	-(void)loginActionPerformed:(CPNotification)aNotification{
		var useridReq = [loginForm getUserEmail];
		var userPassReq = [loginForm getUserPass];
		userPassReq = b64_md5(userPassReq);
		[self loguser: useridReq password: userPassReq];
		
	}
	
	-(void)createAccountActionPerformed:(CPNotification)aNotification{
		var useridReq = [signinForm getUserAccount];
		var userPassReq = [signinForm getUserPass];
		var userNameReq = [signinForm getUserName];
		var userSexReq = [signinForm getUserSex];
		userPassReq = b64_md5(userPassReq);
		[self createUserAccount:useridReq password:userPassReq name:userNameReq sex:userSexReq];
	}
	
	-(void)animationDidEnd:(CPAnimation)animation{
		if(animation == animFadeOutLog){
			//the loginform exists so it will be removed
			CPLog.info("Removing loginform");
			[loginForm removeFromSuperview];
			loginForm = nil;
			//now we add the sign in form
			CPLog.info("Adding the sign in form");
			[self fadeinSigninSection];
		}
		
		if(animation == animFadeOutSign){
			//the signinform will be removed
			CPLog.info("Removing signinform");
			[signinForm removeFromSuperview];
			signinForm = nil;
			//now we add the sign in form
			CPLog.info("Adding the login form");
			[self fadeinLoginSection];
		}
	}
	
	-(void)fadeinLoginSection{
		CPLog.info("Adding loginform");
		loginForm = [[LoginForm alloc]  initWithFrame:CGRectMake(600, 200, 500, 600)];
		[loginForm setAlphaValue:0];
		[contentView addSubview: loginForm];
		
		animFadeInLog = [[CPPropertyAnimation alloc] initWithView:loginForm property:@"alphaValue"];
		[animFadeInLog setStart:0];
		[animFadeInLog setEnd:1];
		[animFadeInLog setDuration:1.0];
		[animFadeInLog startAnimation];
		[animFadeInLog setDelegate: self];
	}
	
	-(void)fadeoutLoginSection:(CPNotification)aNotification{
		animFadeOutLog = [[CPPropertyAnimation alloc] initWithView:loginForm property:@"alphaValue"];
		[animFadeOutLog setStart:1];
		[animFadeOutLog setEnd:0];
		[animFadeOutLog setDuration:1.0];
		[animFadeOutLog startAnimation];
		[animFadeOutLog setDelegate: self];
	}

	-(void)fadeinSigninSection{
		CPLog.info("Adding sign in form");
		signinForm = [[SigninForm alloc]  initWithFrame:CGRectMake(600, 200, 500, 600)];
		[signinForm setAlphaValue:0];	
		[contentView addSubview: signinForm];	

		animFadeInSign = [[CPPropertyAnimation alloc] initWithView:signinForm property:@"alphaValue"];
		[animFadeInSign setStart:0];
		[animFadeInSign setEnd:1];
		[animFadeInSign setDuration:1.0];
		[animFadeInSign startAnimation];
		[animFadeInSign setDelegate: self];
	}
	
	-(void)fadeoutSigninSection:(CPNotification)aNotification{
		animFadeOutSign = [[CPPropertyAnimation alloc] initWithView:signinForm property:@"alphaValue"];
		[animFadeOutSign setStart:1];
		[animFadeOutSign setEnd:0];
		[animFadeOutSign setDuration:1.0];
		[animFadeOutSign startAnimation];
		[animFadeOutSign setDelegate: self];
	}
	
	
	
	-(void)loguser:(CPString)aUser password:(CPString)aPassword{
		var url = "http://localhost:8080/LoginVerify?email="+aUser+"&passwd="+aPassword;
		CPLog.info("Connecting to" + url);
		var request = [CPURLRequest requestWithURL: url];
		var xyzradioConnectionForLogin = [CPURLConnection connectionWithRequest:request delegate:self];
	}
	
	-(void)createUserAccount:(CPString)anAccount password:(CPString)aPassword name:(CPString)aName sex:(CPString)aSex{
		var url = "http://localhost:8080/NewUser?account="+anAccount+"&password="+aPassword+"&name="+aName+"&sex="+aSex;
		CPLog.info("Connecting to " + url);
		var request = [CPURLRequest requestWithURL: url];
		var xyzradioConnectionForLogin = [CPURLConnection connectionWithRequest:request delegate:self];
	}
	
	- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
	{
		CPLog.trace(data);
		try{
			var response = JSON.parse(data);
			
			if(response.error){
				CPLog.error(response.error);
			}
			
			if(response.user){
				var userRecived = [[XYZUser alloc] init];
				
				var info = [CPDictionary dictionaryWithObject:userRecived forKey:"user"];   
				[[CPNotificationCenter defaultCenter] postNotificationName:"LoginSuccessful" object:self userInfo:info]; 	
			}
			
		}catch(e){
			var mensajeGuardar = [[CPAlert alloc] init];
			[mensajeGuardar setTitle:"Server not available"];
			[mensajeGuardar setWindowStyle:CPHUDBackgroundWindowMask];
			[mensajeGuardar setMessageText:"Sorry, the server is not available. Please try again later."];
			[mensajeGuardar addButtonWithTitle:"Ok"];
			[mensajeGuardar runModal];
		}
		
	}
	
	-(void)connectionDidFinishLoading:(CPURLConnection)connection{
		//nothing
	}
	
	- (void)connection:(CPURLConnection) connection didFailWithError:(CPString)error
	{
	}
	
	- (void)clearConnection:(CPURLConnection)connection
	{
		//we no longer need to hold on to a reference to this connection
		if (connection == louhiConnection)
        louhiConnection = nil;
	}
	@end

