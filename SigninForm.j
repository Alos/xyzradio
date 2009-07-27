/**USED TO CREATE NEW USERS**/

@implementation	SigninForm : CPView{
	//for the login
	CPTextField instructionsLabel;
	
	CPTextField accountLabel;
	CPTextField passLabel;
	CPTextField userNameLabel;
	
	CPTextField account;
	CPTextField password;
	CPTextField userName;
	CPRadio maleButton;
	CPRadio femaleButton;	
	
	CPButton acceptButton;
	CPButton cancelButton;
}	
	
-(id) initWithFrame:(CGRect)aRectangle{
		self = [super initWithFrame: aRectangle];
		if(self){
					
			//instructions
			instructionsLabel = [[CPTextField alloc] initWithFrame: CGRectMake(0, 0, 100, 30)];
			[instructionsLabel setStringValue:"Create an Account!"];
			[instructionsLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[instructionsLabel setBackgroundColor:NULL];
			[instructionsLabel setFont:[CPFont systemFontOfSize:18.0]];
			[instructionsLabel sizeToFit];
			[self addSubview:instructionsLabel];
			
			
			//userid
			accountLabel = [[CPTextField alloc] initWithFrame: CGRectMake(15, 54, 100, 30)];
			[accountLabel setStringValue:"Account:"];
			[accountLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[accountLabel setBackgroundColor:NULL];
			[accountLabel sizeToFit];
			[self addSubview:accountLabel];
			
			account = [[CPTextField alloc] initWithFrame: CGRectMake(70, 48, 170, 30)];
			[account setEditable:YES];
			[account setBezeled:YES];
			[account setPlaceholderString:"bob@gmail.com"];
			[account setTextColor: [CPColor colorWithHexString:"000000"]];
			[account setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
			[self addSubview:account];
			
			//pass
			passLabel = [[CPTextField alloc] initWithFrame: CGRectMake(5, 96, 100, 30)];
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
			
			//username
			userNameLabel = [[CPTextField alloc] initWithFrame: CGRectMake(0, 138, 100, 30)];
			[userNameLabel setStringValue:"User name:"];
			[userNameLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[userNameLabel setBackgroundColor:NULL];
			[userNameLabel sizeToFit];
			[self addSubview:userNameLabel];
			
			userName = [[CPTextField alloc] initWithFrame: CGRectMake(70, 132, 170, 30)];
			[userName setEditable:YES];
			[userName setBezeled:YES];
			[userName setTextColor: [CPColor colorWithHexString:"000000"]];
			[userName setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
			[self addSubview:userName];
			
			//the radio buttons
			var sexLabel = [[CPTextField alloc] initWithFrame: CGRectMake(40, 179, 100, 30)];
			[sexLabel setStringValue:"Sex:"];
			[sexLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[sexLabel setBackgroundColor:NULL];
			[sexLabel sizeToFit];
			[self addSubview:sexLabel];
			
			maleButton = [[CPRadio alloc] initWithFrame:CGRectMake(70, 180, 30, 30)];
			[maleButton setObjectValue:CPOnState];
			[self addSubview:maleButton];
			
			var maleLabel = [[CPTextField alloc] initWithFrame: CGRectMake(87, 179, 100, 30)];
			[maleLabel setStringValue:"Male"];
			[maleLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[maleLabel setBackgroundColor:NULL];
			[maleLabel sizeToFit];
			[self addSubview:maleLabel];
			
			femaleButton = [[CPRadio alloc] initWithFrame:CGRectMake(150, 180, 30, 30) radioGroup:[maleButton radioGroup]];
			[self addSubview:femaleButton];
			
			var femaleLabel = [[CPTextField alloc] initWithFrame: CGRectMake(167, 179, 100, 30)];
			[femaleLabel setStringValue:"Female"];
			[femaleLabel setTextColor: [CPColor colorWithHexString:"FFFFFF"]];
			[femaleLabel setBackgroundColor:NULL];
			[femaleLabel sizeToFit];
			[self addSubview:femaleLabel];

			//terms
			var termsLabel = [[DCLinkTextField alloc] initWithFrame:CGRectMake(0, 220, 500, 30)];
			[termsLabel setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
			[termsLabel HTMLElement].style.color = "#FFFFFF";
			[termsLabel HTMLElement].style.fontSize = "12px";
			[termsLabel HTMLElement].style.fontFamily = "Helvetica, Sans-Serif";
			[termsLabel HTMLElement].style.fontColor = "#FFFFFF";
			[termsLabel HTMLElement].style.lineHeight = "1.5em";
			[termsLabel setHTML: @"By clicking on 'I accept' below you are agreeing to the <a href=\"Terms of Service.html\" style=\"color:#ffffff;\">Terms of Service</a>"];
			[self addSubview: termsLabel];
			
			//buttons
			acceptButton = [[CPButton alloc] initWithFrame:CGRectMake(120, 262, 50, 18)];
			[acceptButton setTitle:@"I accept. Create my account."];
			[acceptButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
			[acceptButton sizeToFit];
			[acceptButton setTarget:self];
			[acceptButton setAction:@selector(createAccountActionPerformed)];   
			[self addSubview:acceptButton];
						
			cancelButton = [[CPButton alloc] initWithFrame: CGRectMake(65, 262, 170, 30)];
			[cancelButton setTitle:@"Cancel"];
			[cancelButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
			[cancelButton sizeToFit];	
			[cancelButton setTarget:self];
			[cancelButton setAction:@selector(cancelButtonActionPerformed)];   
			[self addSubview:cancelButton];
			
		}
		return self;
	}
	-(void)createAccountActionPerformed{
		[[CPNotificationCenter defaultCenter] postNotificationName:"createAccountActionPerformed" object:self]; 
	}
	
	-(void)cancelButtonActionPerformed{
		[[CPNotificationCenter defaultCenter] postNotificationName:"cancelButtonActionPerformed" object:self];
	}
	
	-(CPString)getUserAccount{
		return  [account objectValue];
	}
	
	-(CPString)getUserPass{
		return  [password objectValue];
	}
	
	-(CPString)getUserName{
		return  [userName objectValue];
	}
	
	-(CPString)getUserSex{
		CPLog.info([[maleButton radioGroup] selectedRadio]);
		if([[maleButton radioGroup] selectedRadio] == maleButton)
			return "MALE";
		else
			return "FEMALE";
	}
	
	@end

