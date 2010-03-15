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
@import "SongURLUploader.j"
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
    CPButton uploadButton;  
    CPArray items;
    SongURLUploader songURLUploader;
    int shownForm; // 0 = upload 1 = local
}

    - (id) initWithFrame:(CGRect)aRect{
        self = [super initWithFrame:aRect];
        if(self){
            songURLUploader = [[SongURLUploader alloc] init];	
            menu=[[CPPopUpButton alloc] initWithFrame:CGRectMake(135,85,150,25)];
            [menu setPullsDown:YES];
            [menu setTitle:@"Submit a song"];
            [menu addItemWithTitle:@"LOCAL"];
            [menu addItemWithTitle:@"URL"];
            [menu setTarget:self];
            [menu setAction:@selector(menuDidChangeItem)];      
            [self addSubview:menu];

            [headerLabel setStringValue:@"Please read the terms of use before submiting a song"];
            [self setSubmitButtonTitle:@"Save song"];
            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(clearAndClose:) name:"SubmitSuccessful" object:songURLUploader];
        }
        return self;
    }

/*se manda llamar a este metodo cuando se cambia un 
//item del popUpButton
*/
-(void)menuDidChangeItem{
  items = [self subviews];
  CPLog.trace("Antes de cargar el menu: %s", [items count]);
   if([items count]==6 || [items count]==17){
      [self cleanForm];
   }

   if([[menu selectedItem] title] == "LOCAL"){
      //agregamos el boton de upload
        if([items count]==5){
            shownForm=0;
            uploadButton = [[UploadButton alloc] initWithFrame:CGRectMake(135,250,110,25)];// title:@"Upload"];
            [uploadButton setTitle:@"Upload"];
            [uploadButton setDelegate:self];
            [uploadButton setTarget:self];  
            [self addSubview:uploadButton];
      }
   }

   if([[menu selectedItem] title] == "URL"){
        CPLog.trace("En URL");
         shownForm=1;
        //contruimos el formulario
        titleField = [self addFieldRowWithTitle:@"Title:" name:@"title" controlType:DCFormControlTypeTextField required:NO];
        artistField = [self addFieldRowWithTitle:@"Artist:" name:@"artist" controlType:DCFormControlTypeTextField required:NO];
        genreField = [self addFieldRowWithTitle:@"Genre:" name:@"genre" controlType:DCFormControlTypeTextField required:NO];
        timeField = [self addFieldRowWithTitle:@"Time:" name:@"time" controlType:DCFormControlTypeTextField required:NO];
        pathAlbumArtField = [self addFieldRowWithTitle:@"URL album art:" name:@"pathAlbumArt" controlType:DCFormControlTypeTextField required:NO];
        urlField = [self addFieldRowWithTitle:@"URL song:" name:@"URL" controlType:DCFormControlTypeTextField required:NO];
   }
   CPLog.trace("despues de cargar el menu: %s", [items count]);
}

//limpia el formulario
-(void)cleanForm{
    CPLog.trace("Clearing form :"+shownForm + "with "+[items count]+"items");
    for(var i=0;i<[items count];i++){
      CPLog.trace("subviews ",[items objectAtIndex:i]);
      [[items objectAtIndex:i] removeFromSuperview];
    }  
}

//guarda la cancion de cualquiera de las dos formas
	-(void)submitAction:(id)sender{
		if([[menu selectedItem] title] == "URL"){
			[self setEnabled:NO];
			var requiredError = NO;
			for (var i = 0; i < [fields count]; i++) {
				if ([[fields objectAtIndex:i] required] && [[[fields objectAtIndex:i] stringValue] isEqualToString:""]) {
					requiredError = YES;
				}
			}
			if (requiredError) {
				alert("Please fill in all required fields.");
				[self setEnabled:YES];
				for (var i = 0; i < [fields count]; i++) {
					if ([[fields objectAtIndex:i] required] && [[[fields objectAtIndex:i] stringValue] isEqualToString:""]) {
						[[fields objectAtIndex:i] becomeFirstResponder];
						return;
					}
				}
			} else {
				//everything is ok s now we submit!
				CPLog.info("Saving a song form a URL with title %s", [titleField stringValue]);
				[songURLUploader uploadSongWithTitle:[titleField stringValue] artist:[artistField stringValue]  genere:[genreField stringValue] time:[timeField stringValue] pathToAlbumArt:[pathAlbumArtField stringValue] songURL:[urlField stringValue]];
			}
		}
		
		if([[menu selectedItem] title] == "LOCAL"){
			console.log("LOCAL");
		}
	}

-(CPString)thankYouMessage {
	//return @"Thanks for adding!  They'll show up in the feed soon.";
	return @"Thanks for submitting a song!";
}

- (void)clearAndClose:(CPNotification)aNotification {
	for (var i = 0; i < [items count]; i++) {
		[[items objectAtIndex:i] setStringValue:@""];
	}
	[self setEnabled:YES];
	[delegate endForm];
}

//------------------delegate methods-----------------------

-(void)didChangeSelection:(CPNotification)aNotification{
  CPLog.info("file value: %s",[uploadButton selection]);
}

@end
