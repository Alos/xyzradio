//
//  UploadLocalForm.j
//  XYZRadio
//
//  Created by Alos on 13/3/10.
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

@implementation UploadLocalForm : CPView{
   
}

-(id) initWithFrame:(CGRect)aRectangle{
        self = [super initWithFrame: aRectangle];
        if(self){
            var commingSoon = [[CPTextField alloc] initWithFrame: CGRectMake(47, 80, 100, 18)];
            [commingSoon setStringValue:"Comming soon..."];
            [commingSoon sizeToFit];
            [commingSoon setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview:commingSoon];

           
        }
        return self;
    }

    -(void)newUserActionPerformed{
        [[CPNotificationCenter defaultCenter] postNotificationName:"newUserActionPerformed" object:self]; 
    }
    @end

