@import <AppKit/CPView.j>

@implementation UserCell : CPView
{
    CPImage         image;
    CPImageView     userView;
    CPView          highlightView;
}

- (void)setRepresentedObject:(JSObject)anObject
{
    //colocamos el avatar
    if(!userView)
    {
        userView = [[CPImageView alloc] initWithFrame:CGRectMake(0,0,200,65)];
        //[userView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        //[userView setImageScaling:CPScaleProportionally];
//        [userView setHasShadow:YES];
        [self addSubview:userView];     
    }

    var backImage = [[CPImage alloc] initWithContentsOfFile:"Resources/usuarios/fondo-información-de-usuario.png" size:CPSizeMake(200, 65)];
    [userView setImage:backImage];
    currentlyPlayingTextField= [[CPTextField alloc] initWithFrame: CGRectMake(20, 150, 350, 18)];
    [currentlyPlayingTextField setStringValue:"oswa"];
    [currentlyPlayingTextField setTextColor: [CPColor colorWithHexString:"33FF00"]];
    [currentlyPlayingTextField setAlignment:CPCenterTextAlignment];
    [self addSubview: currentlyPlayingTextField];
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
        [highlightView setFrame:[self bounds]];
        [self addSubview:highlightView positioned:CPWindowBelow relativeTo:userView];
    }
    else
        [highlightView removeFromSuperview];
} 

@end
