//
//  SFColumnModel.j
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