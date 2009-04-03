//
//  MainBrowser.j
//  XYZRadio
//
//  Created by Alos on 10/2/08.

//
@import "XYZPlayList.j"
@import "XYZColumnModel.j"
@import "XYZTable.j"

/*The Music browser*/
@implementation MainBrowser : XYZPlayList
{
}

/*Una bonita contructora*/
- (id)initWithSource:(CPArray)list{
    //Initializing a window
    self = [super initWithContentRect:CGRectMake(0, 60, 800, 500)];
    if (self)//pa ver si no somos null :P
    {
        //le ponemos titulo al HUD lo centramos
        [win setTitle:@"Music Browser"];
        [win setFloatingPanel:YES];
        [win setDelegate:self];  
        var contentView = [win contentView];
        var bounds = [contentView bounds];
        //para los titulos
        var cmArray = [[CPArray alloc] init]; 
        var titleLabel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(0, 0, 248, 31) title:"Name" color:NULL];
        var artistLabel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(250, 0, 248, 31) title:"Artist" color: NULL];
        var timeLabel =[[XYZColumnModel alloc] initWithFrame:CGRectMake(500, 0, 48, 31) title:"Time" color: NULL];
        var ratingLable =[[XYZColumnModel alloc] initWithFrame:CGRectMake(550, 0, 48, 31) title:"Rating" color: NULL];
        [cmArray addObject: titleLabel]; 
        [cmArray addObject: artistLabel];
        [cmArray addObject: timeLabel];
        [cmArray addObject: ratingLable];
        //a table
        theTable = [[XYZTable alloc] initWithColumnModel:cmArray model:list frame: bounds];
        
        [contentView addSubview: theTable];    
            
    }
    
    return self;
}
-(void)addItem:(CPObject)anObject{
    [theTable addItem:anObject];
}
-(void)addList:(CPArray)aModel
{   console.log("addlist here!");
    [theTable setModel: aModel];
}
-(void)removeSelectedItems{
   console.log("removeSlectedItems in SFBrowser got a msg");
   [theTable removeSelectedItems];
}


@end