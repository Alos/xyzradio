//
//  SFColumnModel.j
//  XYZRadio
//
//  Created by Alos on 10/2/08.
//

/*El modelo de la columna es responsable de saber de que colo y tamaño se tiene que pintar cada columna de la tabla*/
@implementation XYZColumnModel : CPTextField
{   
}
-(id)initWithFrame:(CPRect)aFrame title:(CPString)aTitle color:(CPColor)aColor{
    self= [[CPTextField alloc] initWithFrame: aFrame];
    [self setStringValue:aTitle];
    [self setTextColor: [CPColor colorWithHexString:"33FF00"]];
    [self setBackgroundColor: aColor];
    return self;
}
@end