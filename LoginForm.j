/**USED TO LOGIN**/

@implementation	LoginForm : CPView{
	//for the login
	CPButton loginButton;
	CPTextField userid;
	CPTextField password;
	CPTextField newUserLabel;
	CPTextField instructionsLabel;
	CPTextField usuarioLabel;
	CPTextField passLabel;
}	
	
-(id) initWithFrame:(CGRect)aRectangle{
		self = [super initWithFrame: aRectangle];
		if(self){
					
			//instructions
			instructionsLabel = [[CPTextField alloc] initWithFrame: CGRectMake(0, 0, 100, 30)];
			[instructionsLabel setStringValue:"Login to XYZRadio"];
			[instructionsLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[instructionsLabel setBackgroundColor:NULL];
			[instructionsLabel setFont:[CPFont systemFontOfSize:18.0]];
			[instructionsLabel sizeToFit];
			[self addSubview:instructionsLabel];
			
			
			//userid
			usuarioLabel = [[CPTextField alloc] initWithFrame: CGRectMake(10, 54, 100, 30)];
			[usuarioLabel setStringValue:"Account:"];
			[usuarioLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[usuarioLabel setBackgroundColor:NULL];
			[usuarioLabel sizeToFit];
			[self addSubview:usuarioLabel];
			
			userid = [[CPTextField alloc] initWithFrame: CGRectMake(70, 48, 170, 30)];
			[userid setEditable:YES];
			[userid setBezeled:YES];
			[userid setPlaceholderString:"bob@gmail.com"];
			[userid setTextColor: [CPColor colorWithHexString:"000000"]];
			[userid setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
			[self addSubview:userid];
			
			//pass
			passLabel = [[CPTextField alloc] initWithFrame: CGRectMake(0, 96, 100, 30)];
			[passLabel setStringValue:"Password:"];
			[passLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[passLabel setBackgroundColor:NULL];
			[passLabel sizeToFit];
			[self addSubview:passLabel];
			
			password = [[CPTextField alloc] initWithFrame: CGRectMake(70, 90, 170, 30)];
			[password setEditable:YES];
			[password setBezeled:YES];
			[password setSecure: YES];
			[password setTextColor: [CPColor colorWithHexString:"000000"]];
			[password setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
			[self addSubview:password];
			
			loginButton = [[CPButton alloc] initWithFrame:CGRectMake(190, 140, 50, 18)];
			[loginButton setTitle:@"Login"];
			[loginButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
			[loginButton setTarget:self];
			[loginButton setAction:@selector(loginActionPerformed)];   
			[self addSubview:loginButton];
			
			
			
			//new user
			newUserLabel = [[CPTextField alloc] initWithFrame: CGRectMake(0, 220, 100, 30)];
			[newUserLabel setStringValue:"New user?"];
			[newUserLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[newUserLabel setBackgroundColor:NULL];
			[newUserLabel sizeToFit];
			[self addSubview:newUserLabel];
			
			newUserButton = [[CPButton alloc] initWithFrame: CGRectMake(65, 220, 170, 30)];
			[newUserButton setTitle:@"Create an account"];
			[newUserButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
			[newUserButton setTarget:self];
			[newUserButton sizeToFit];
			[newUserButton setAction:@selector(newUserActionPerformed)];   
			[self addSubview:newUserButton];
			
		}
		return self;
	}
	-(void)newUserActionPerformed{
		[[CPNotificationCenter defaultCenter] postNotificationName:"newUserActionPerformed" object:self]; 
	}
	
	-(void)loginActionPerformed{
		[[CPNotificationCenter defaultCenter] postNotificationName:"loginActionPerformed" object:self];
	}
	
	-(CPString)getUserEmail{
		return  [userid objectValue];
	}
	
	-(CPString)getUserPass{
		return  [password objectValue];
	}
	@end

