@import <AppKit/CPView.j>

@implementation UserCell : CPView
{
    CPImage         image;
    CPImageView     userView;
    CPView          highlightView;
	CPImageView glassImageView;
}

- (void)setRepresentedObject:(JSObject)anObject
{
    //colocamos el avatar
    if(!userView)
    {
		var backImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/70/fondo-información-de-usuario.png" size:CPSizeMake(246, 91)];
        userView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 246, 91)];
		[userView setImage:backImage];
        [self addSubview:userView];     
    }
	if([anObject pathToAvatar] == ""){
		CPLog.info("No path!");
		if([anObject sex]=="MALE"){
			if([anObject dj]== YES){
				var avatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/70/usuario-dj-hombre.png" size:CPSizeMake(87, 88)];
				var avatarImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0,0,87,88)];
				[avatarImageView setImage:avatarImage];
				[self addSubview:avatarImageView]; 
			}else{
				var avatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/70/usuario-hombre.png" size:CPSizeMake(87, 88)];
				var avatarImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0,0,87,88)];
				[avatarImageView setImage:avatarImage];
				[self addSubview:avatarImageView]; 
			}
		}else{
			if([anObject dj]== YES){
				var avatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/70/usuario-dj-mujer.png" size:CPSizeMake(87, 88)];
				var avatarImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0,0,87,88)];
				[avatarImageView setImage:avatarImage];
				[self addSubview:avatarImageView]; 
			}else{
				var avatarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/70/usuario-mujer.png" size:CPSizeMake(87, 88)];
				var avatarImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0,0,87,88)];
				[avatarImageView setImage:avatarImage];
				[self addSubview:avatarImageView]; 
			} 
		}
	}else{
		//we add the pic
	
	}
    currentlyPlayingTextField= [[CPTextField alloc] initWithFrame: CGRectMake(0, 0, 350, 18)];
    [currentlyPlayingTextField setStringValue:[anObject usernick]];
    [currentlyPlayingTextField setTextColor: [CPColor colorWithHexString:"33FF00"]];
    [currentlyPlayingTextField setAlignment:CPCenterTextAlignment];
    [self addSubview: currentlyPlayingTextField];
	
	var glassImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/70/brillo-información-usuario.png" size:CPSizeMake(246, 91)];
	glassImageView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, 246, 91)];
	[glassImageView setImage:glassImage];
	[glassImageView setAlphaValue:.3];
	[self addSubview:glassImageView]; 
}

- (void)imageDidLoad:(CPImage)anImage
{
    [userView setImage:anImage];
}

- (void)setSelected:(BOOL)flag
{
    if(!highlightView)
    {
        highlightView = [[CPView alloc] initWithFrame:[self bounds]];
        [highlightView setBackgroundColor:[CPColor colorWithCalibratedWhite:0.8 alpha:0.6]];
        [highlightView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
    }

    if(flag)
    {
		[glassImageView setAlphaValue:.5];
    }
    else{
        [glassImageView setAlphaValue:.3];
	}
} 

@end
