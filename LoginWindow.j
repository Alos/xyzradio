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

@implementation LoginWindow : CPWindow
{
	CPWebView loginweb;
}

/*Una bonita contructora*/
- (id)initWithContentRect:(CGRect)aRectangle styleMask:(unsigned int) aStyle url:(CPString)aURL{
    self = [super initWithContentRect: aRectangle styleMask: aStyle];
    if (self)//pa ver si no somos null :P
    {
		var contentView = [self contentView];
		loginweb = [[CPWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 500, 200)];
		[loginweb setMainFrameURL: aURL];
		[contentView addSubview: loginweb];
		[self orderFront:self]; 
	}
    return self;
}
@end