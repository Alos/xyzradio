//
//  XYZAddSongView.j
//  XYZRadio
//
//  Created by oswa on 15/07/09
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
   DCTextField urlField;
   DCTextField titleField;
   DCTextField artistField;
   DCTextField genreField;
   DCTextField timeField;
   DCTextField pathAlbumArtField;
   id HTMLElement @accessors;
   CPTextField link;
   CPPopUpButton menu;
   BOOL menuURL=NO; 
}
	
	/*Una bonita contructora*/
	- (id) initWithFrame:(CGRect)aRect{
		self = [super initWithFrame:aRect];
		if(self){
		  menu=[[CPPopUpButton alloc] initWithFrame:CGRectMake(135,85,110,25)];
		  //[menu setTitle:"add song"];
		  [menu setPullsDown:YES];
		  [menu setTitle:@"add song"];
		  [menu addItemWithTitle:@"LOCAL"];
		  [menu addItemWithTitle:@"URL"];
		  [menu setTarget:self];
		  [menu setAction:@selector(menuDidChangeItem)];      
		  [self	addSubview:menu]; 	     
		  
		  //field = [self addFieldRowWithTitle:@"URL:" name:@"URL" controlType:DCFormControlTypeTextField required:NO];	
		  [headerLabel setStringValue:@"Should see the terms of use"];
		  [self setSubmitButtonTitle:@"Save song"];
		}
		return self;
	}

//se manda llamar a este metodo cuando se cambia un 
//item del popUpButton 
-(void)menuDidChangeItem{
   var items = [self subviews];
 
   if([[menu selectedItem] title] == "LOCAL"){
      //console.log("local");
   }

   if([[menu selectedItem] title] == "URL"){
      //contruimos el formulario
      if([items count]==5){
	titleField = [self addFieldRowWithTitle:@"title:" name:@"title" controlType:DCFormControlTypeTextField required:NO];
	artistField = [self addFieldRowWithTitle:@"artist:" name:@"artist" controlType:DCFormControlTypeTextField required:NO];
	genreField = [self addFieldRowWithTitle:@"genre:" name:@"genre" controlType:DCFormControlTypeTextField required:NO];
	timeField = [self addFieldRowWithTitle:@"time:" name:@"time" controlType:DCFormControlTypeTextField required:NO];
	pathAlbumArtField = [self addFieldRowWithTitle:@"URL album art:" name:@"pathAlbumArt" controlType:DCFormControlTypeTextField required:NO];
	urlField = [self addFieldRowWithTitle:@"URL song:" name:@"URL" controlType:DCFormControlTypeTextField required:NO];
      }
   }

   [[menu selectedItem] setEnabled:NO]; 
}

-(void)submitAction:(id)sender{
   //console.log("save");
   //console.log([field stringValue]);
}

-(CPString)thankYouMessage {
	//return @"Thanks for adding!  They'll show up in the feed soon.";
	return @"";
}

@end
