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
@import "FileUpload.j"
//@import "UploadButton.j"

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
   //UploadButton uploadButton;
   CPButton uploadButton;  
   CPArray items;
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

/*se manda llamar a este metodo cuando se cambia un 
//item del popUpButton
*/
-(void)menuDidChangeItem{
  items = [self subviews];
  console.log("antes de cargar el menu: ",[items count]);
   if([items count]==6 || [items count]==17){
      [self cleanForm];
   }

   if([[menu selectedItem] title] == "LOCAL"){
      //agregamos el boton de upload
      if([items count]==5){
	uploadButton = [[UploadButton alloc] initWithFrame:CGRectMake(135,250,110,25)];// title:@"Upload"];
	[uploadButton setTitle:@"Upload"];
	[uploadButton setDelegate:self];
	[uploadButton setTarget:self];
	[self addSubview:uploadButton];
      }
   }

   if([[menu selectedItem] title] == "URL"){
      //contruimos el formulario
      if([items count]==5 || [items count]==6){
	titleField = [self addFieldRowWithTitle:@"Title:" name:@"title" controlType:DCFormControlTypeTextField required:NO];
	artistField = [self addFieldRowWithTitle:@"Artist:" name:@"artist" controlType:DCFormControlTypeTextField required:NO];
	genreField = [self addFieldRowWithTitle:@"Genre:" name:@"genre" controlType:DCFormControlTypeTextField required:NO];
	timeField = [self addFieldRowWithTitle:@"Time:" name:@"time" controlType:DCFormControlTypeTextField required:NO];
	pathAlbumArtField = [self addFieldRowWithTitle:@"URL album art:" name:@"pathAlbumArt" controlType:DCFormControlTypeTextField required:NO];
	urlField = [self addFieldRowWithTitle:@"URL song:" name:@"URL" controlType:DCFormControlTypeTextField required:NO];
      }
   }
   console.log("despues de cargar el menu: ",[items count]);
}

//limpia el formulario
-(void)cleanForm{
  do{
    for(var i=5;i<[items count];i++){
      console.log("subviews ",[items objectAtIndex:i]);
      [[items objectAtIndex:i] removeFromSuperview];
    }  
  }while([items count]>5);  
}

//guarda la cancion de cualquiera de las dos formas
-(void)submitAction:(id)sender{
  if([[menu selectedItem] title] == "URL"){
    console.log("URL");
  }

  if([[menu selectedItem] title] == "LOCAL"){
    console.log("LOCAL");
  }
}

-(CPString)thankYouMessage {
	//return @"Thanks for adding!  They'll show up in the feed soon.";
	return @"";
}

//------------------delegate methods-----------------------

-(void)didChangeSelection:(CPNotification)aNotification{
  console.log("file value: ",[uploadButton selection]);
}

@end
