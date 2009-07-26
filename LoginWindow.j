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


@implementation LoginWindow : CPWindow
{
	CPButton loginButton;
	CPTextField userid;
	CPTextField password;
	CPWindow parentWindow;
	CPString useridReq;
	CPString userPassReq;
}

- (id)initWithContentRect:(CGRect)aRectangle styleMask:(unsigned int) aStyle {
    self = [super initWithContentRect: aRectangle styleMask: aStyle];
    if (self)
    {
		var contentView = [self contentView];
		
		var bgImage = [[CPImage alloc] initWithContentsOfFile:"Resources/fondo-login.jpg" size:CPSizeMake(1000, 800)];
		var bgImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 1000, 800)];
		[bgImageView setImage: bgImage];
		[contentView addSubview: bgImageView];
		
		//userid
	    var usuarioLabel = [[CPTextField alloc] initWithFrame: CGRectMake(620, 252, 100, 30)];
        [usuarioLabel setStringValue:"User:"];
        [usuarioLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
        [usuarioLabel setBackgroundColor:NULL];
		[usuarioLabel sizeToFit];
		//[usuarioLabel resignFirstResponder:YES];
		[contentView addSubview:usuarioLabel];
		
		userid = [[CPTextField alloc] initWithFrame: CGRectMake(660, 248, 170, 30)];
        [userid setEditable:YES];
        [userid setBezeled:YES];
        [userid setTextColor: [CPColor colorWithHexString:"000000"]];
        [userid setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
		[contentView addSubview:userid];
		
		//pass
		var passLabel = [[CPTextField alloc] initWithFrame: CGRectMake(595, 314, 100, 30)];
        [passLabel setStringValue:"Password:"];
        [passLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
        [passLabel setBackgroundColor:NULL];
		[passLabel sizeToFit];
		[contentView addSubview:passLabel];
		
		password = [[CPTextField alloc] initWithFrame: CGRectMake(660, 308, 170, 30)];
        [password setEditable:YES];
        [password setBezeled:YES];
		[password setSecure: YES];
        [password setTextColor: [CPColor colorWithHexString:"000000"]];
        [password setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
		[contentView addSubview:password];
		
        loginButton = [[CPButton alloc] initWithFrame:CGRectMake(780, 360, 50, 18)];
        [loginButton setTitle:@"Login"];
	    //[loginButton sizeToFit];
		[loginButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
		//[loginButton setBezelStyle:CPHUDBezelStyle];
        [loginButton setTarget:self];
        [loginButton setAction:@selector(loginActionPerformed)];   
		[contentView addSubview:loginButton];
		
		var poweredByGoogleImage = [[CPImage alloc] initWithContentsOfFile:"Resources/appengine-silver-120x30.gif" size:CPSizeMake(127, 30)];
		var poweredByGoogleImageView = [[CPImageView alloc] initWithFrame:CGRectMake(840, 750, 127, 30)];
		[poweredByGoogleImageView setImage: poweredByGoogleImage];
		[contentView addSubview: poweredByGoogleImageView];
		
		[self makeFirstResponder:userid];
		
		var helpLink = [[DCLinkTextField alloc] initWithFrame:CGRectMake(20, 750, 100, 30)];
		[helpLink setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
		[helpLink HTMLElement].style.color = "#FFFFFF";
		[helpLink HTMLElement].style.fontSize = "12px";
		[helpLink HTMLElement].style.fontFamily = "Helvetica, Sans-Serif";
		[helpLink HTMLElement].style.fontColor = "#FFFFFF";
		[helpLink HTMLElement].style.lineHeight = "1.5em";
		[helpLink setHTML: @"<a href=\"xyzradioHelpp.html\">Help</a>"];
		[contentView addSubview: helpLink];
		
    }
    return self;
}
-(void)loginActionPerformed{
	var useridReq = [userid objectValue];
	var userPassReq = [password objectValue];
	
	[self loguser: useridReq password: userPassReq];
	
}

-(void) loguser:(CPString)aUser password:(CPString)aPassword{
	var url = "https://www.google.com/accounts/ClientLogin?Email="+[userid objectValue]+"&Passwd="+[password objectValue]+"&accountType=HOSTED_OR_GOOGLE&source=alos-xyzradio-1&service=ah";
	var request = [CPURLRequest requestWithURL: url];
	var xyzradioConnectionForLogin = [CPURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
	var authValue = [data componentsSeparatedByString:"="];
	var urlWithToken = "http://xyzradioengine.appspot.com/_ah/login?auth="+authValue[3];
	var googleAuthentification = [[GoogleAuthentification alloc] initWithURL:urlWithToken];
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