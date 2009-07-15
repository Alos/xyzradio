//
//  XYZAddSongView.j
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
@import "DCFormView.j"

@implementation XYZAddSongView : DCFormView
{
   DCTextField field;
}
	
	/*Una bonita contructora*/
	- (id) initWithFrame:(CGRect)aRect{
		self = [super initWithFrame:aRect];
		if(self){
		  //field = [self addFieldRowWithTitle:@"" name:@"URL" controlType:DCFormControlTypeHidden required:NO];
		  field = [self addFieldRowWithTitle:@"URL:" name:@"URL" controlType:DCFormControlTypeTextField required:NO];	
		  [headerLabel setStringValue:@"Add the url of song"];
		  [self setSubmitButtonTitle:@"Save song"]
		}
		return self;
	}

-(void){
   
}

@end
