//
//  UploadURLForm.j
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

@import "SongURLUploader.j"

@implementation UploadURLForm : CPView{
    CPTextField urlField;
    CPTextField titleField;
    CPTextField artistField;
    CPTextField genreField;
    CPTextField timeField;
    CPTextField pathAlbumArtField;
    
    CPArray componentsArray;

    CPButton submitSongButton;
    SongURLUploader songURLUploader;
}

-(id) initWithFrame:(CGRect)aRectangle{
        self = [super initWithFrame: aRectangle];
        if(self){
            //[self setBackgroundColor:[CPColor colorWithHexString:"666666"]];

            componentsArray = [[CPArray alloc] init];
            songURLUploader =  [[SongURLUploader alloc] init];        

            var URLFieldLabel = [[CPTextField alloc] initWithFrame: CGRectMake(47, 40, 100, 18)];
            [URLFieldLabel setStringValue:"URL:"];
            [URLFieldLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview: URLFieldLabel]; 

            urlField = [[CPTextField alloc] initWithFrame: CGRectMake(80, 32, 300, 30)];
            [urlField setEditable:YES];
            [urlField setBezeled:YES];
            [urlField setPlaceholderString:"http://www.someurl.com/yoursong.mp3"];
            [urlField setTextColor: [CPColor colorWithHexString:"000000"]];
            [componentsArray addObject:urlField];
            [self addSubview:urlField];

            var titleFieldLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 80, 100, 18)];
            [titleFieldLabel setStringValue:"Song title:"];
            [titleFieldLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview: titleFieldLabel];

            titleField = [[CPTextField alloc] initWithFrame: CGRectMake(80, 72, 300, 30)];
            [titleField setEditable:YES];
            [titleField setBezeled:YES];
            [titleField setPlaceholderString:"Some title"];
            [titleField setTextColor: [CPColor colorWithHexString:"000000"]];
            [componentsArray addObject:titleField];
            [self addSubview:titleField];

            var artistFieldLabel = [[CPTextField alloc] initWithFrame: CGRectMake(45, 120, 100, 18)];
            [artistFieldLabel setStringValue:"Artist:"];
            [artistFieldLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview: artistFieldLabel];

            artistField = [[CPTextField alloc] initWithFrame: CGRectMake(80, 112, 200, 30)];
            [artistField setEditable:YES];
            [artistField setBezeled:YES];
            [artistField setPlaceholderString:"Some Artist"];
            [artistField setTextColor: [CPColor colorWithHexString:"000000"]];
            [componentsArray addObject: artistField];
            [self addSubview:artistField];

            var genreFieldLabel = [[CPTextField alloc] initWithFrame: CGRectMake(38, 160, 100, 18)];
            [genreFieldLabel setStringValue:"Genre:"];
            [genreFieldLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview: genreFieldLabel];

            genreField = [[CPTextField alloc] initWithFrame: CGRectMake(80, 152, 100, 30)];
            [genreField setEditable:YES];
            [genreField setBezeled:YES];
            [genreField setPlaceholderString:"Some genre"];
            [genreField setTextColor: [CPColor colorWithHexString:"000000"]];
            [componentsArray addObject:genreField];
            [self addSubview:genreField];

            var timeFieldLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 200, 100, 18)];
            [timeFieldLabel setStringValue:"Total time:"];
            [timeFieldLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview:timeFieldLabel];

            timeField = [[CPTextField alloc] initWithFrame: CGRectMake(80, 192, 100, 30)];
            [timeField setEditable:YES];
            [timeField setBezeled:YES];
            [timeField setPlaceholderString:"02:30"];
            [timeField setTextColor: [CPColor colorWithHexString:"000000"]];
            [componentsArray addObject:timeField];
            [self addSubview:timeField];

            var pathAlbumArtFieldLabel = [[CPTextField alloc] initWithFrame: CGRectMake(20, 240, 100, 18)];
            [pathAlbumArtFieldLabel setStringValue:"Album art:"];
            [pathAlbumArtFieldLabel setTextColor: [CPColor colorWithHexString:"33FF00"]];
            [self addSubview:pathAlbumArtFieldLabel];

            pathAlbumArtField = [[CPTextField alloc] initWithFrame: CGRectMake(80, 232, 300, 30)];
            [pathAlbumArtField setEditable:YES];
            [pathAlbumArtField setBezeled:YES];
            [pathAlbumArtField setPlaceholderString:"http://www.someurl.com/image.jpg"];
            [pathAlbumArtField setTextColor: [CPColor colorWithHexString:"000000"]];
            [componentsArray addObject:pathAlbumArtField];
            [self addSubview:pathAlbumArtField];

            submitSongButton = [[CPButton alloc] initWithFrame:CGRectMake(330, 272, 50, 18)];
            [submitSongButton setTheme:[CPTheme themeNamed:@"Aristo-HUD"]];
            [submitSongButton setBezelStyle:CPHUDBezelStyle];
            [submitSongButton setTitle:@"Submit song"];  
            [submitSongButton sizeToFit];  
            [submitSongButton setTarget:self];
            [submitSongButton setAction:@selector(submitSong)];
            [self addSubview:submitSongButton];
        }
        return self;
    }

    /**
        Submits the song
    **/
    -(void) submitSong{
        CPLog.trace("Checking complete fields...");
        //checking for complete fields
        var completeData = true;
        for(var i = 0; i < [componentsArray count]; i++){
            var aux = [componentsArray objectAtIndex:i];
            CPLog.debug(aux);
            if([aux objectValue] == ""){ 
                completeData = false;
                break;
            }    
        }
        if(completeData){
            CPLog.trace("Fields are complete! Sending song...");
            //we send the song
            var url = [urlField objectValue];
            var title = [titleField objectValue];
            var artist = [artistField objectValue];
            var genre = [genreField objectValue];
            var time = [timeField objectValue];
            var albumArt = [pathAlbumArtField objectValue];
            [songURLUploader uploadSongWithTitle:title artist:artist  genere:genre time:time pathToAlbumArt:albumArt songURL:url];

        }else{
            //add a error panel
            var errorAlert = [[CPAlert alloc] init];
            [errorAlert setTitle:"Incomplete form"];
            [errorAlert setWindowStyle:CPHUDBackgroundWindowMask];
            [errorAlert setMessageText:"Please fill all the fields to submit your song"];
            [errorAlert addButtonWithTitle:"Ok"];
            [errorAlert runModal];
        }
    }
    @end

