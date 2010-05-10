//
//  AddSongWindow.j
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

@import "UploadURLForm.j";
@import "UploadLocalForm.j";

@implementation AddSongWindow : CPWindow
    {
        UploadURLForm uploadURLForm;        
        UploadLocalForm uploadLocalForm;
        //the animators
        CPAnimation animFadeInURLForm;
        CPAnimation animFadeOutURLForm;
        CPAnimation animFadeInUploadLocalForm;
        CPAnimation animFadeOutUploadLocalForm;


        CPPopUpButton typeOfUpload;
        SongURLUploader songURLUploader;
        CPView contentView;
        int currentForm; //0 = none, 1 = URL or 2 = Local
    }
    
    - (id)initWithContentRect:aRectangle styleMask:aStyleMask{
        self = [super initWithContentRect:aRectangle styleMask: aStyleMask];
        if (self)
        {
            
            [self setTitle:@"Upload Songs"];
            var contentView = [self contentView];
            var bounds = [contentView bounds];
        
            var arr =[[CPArray alloc] init];
            [arr addObject:"Select how to upload your song..."];
            [arr addObject:"URL"];
            [arr addObject:"Upload from computer..."];
    
            typeOfUpload =[[CPPopUpButton alloc] initWithFrame:CGRectMake(20, 20, 270, 24)];
            [typeOfUpload addItemsWithTitles:arr];
            [typeOfUpload setTarget:self];
            [typeOfUpload setAction:@selector(typeOfUploadDidChangeItem)]; 
            [contentView addSubview: typeOfUpload];
    
            currentForm = 0;
            [[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(clearAndClose:) name:"SubmitSuccessful" object:nil];

        }
    return self;
    }

    /**
        Adds the diferent componets based on the chosen menu
    **/
    - (void) typeOfUploadDidChangeItem{
        if([[typeOfUpload selectedItem] title] == "URL"){
            CPLog.trace("Adding URLForm1...");
            
            //we fade out the other forms
            [self cleanForm];
            
            currentForm = 1;
         
            //we start the uploadURLForm animation
            [self fadeinUploadURLFormSection];

        }else if([[typeOfUpload selectedItem] title] == "Upload from computer..."){
            CPLog.trace("Adding Upload local form1...");
            
            //we fade out the other forms
            [self cleanForm];

            currentForm = 2;
           
            //we start the uploadLocalForm animation
            [self fadeinUploadLocalFormSection];

        }else{
            CPLog.trace("Clearing form...");
            //fade out other forms
            [self cleanForm];
            
            currentForm = 0;
            //TODO add the instructions
        }
    }
    
    -(void)animationDidEnd:(CPAnimation)animation{
        if(animation == animFadeOutURLForm){
            //the URLForm exists so it will be removed
            CPLog.info("Removing uploadURLForm...");
            [uploadURLForm removeFromSuperview];
            uploadURLForm = nil;
            //then we show the otherone
            //[self fadeinUploadLocalFormSection];

        }

        if(animation == animFadeOutUploadLocalForm){
            //the uploadlocalform will be removed
            CPLog.info("Removing uploadLocalForm...");
            [uploadLocalForm removeFromSuperview];
            uploadLocalForm = nil;
            //then we show the otherone
            // [self fadeinUploadURLFormSection];
           
        }
    }


    /**
        Adds the URL form
    **/
    -(void) fadeinUploadURLFormSection{
        CPLog.info("Fading in UploadURLForm");
        uploadURLForm = [[UploadURLForm alloc]  initWithFrame:CGRectMake(20, 60, 500, 380)];
        [uploadURLForm setAlphaValue:0];
        [contentView addSubview: uploadURLForm];

        animFadeInURLForm = [[CPPropertyAnimation alloc] initWithView:uploadURLForm property:@"alphaValue"];
        [animFadeInURLForm setStart:0];
        [animFadeInURLForm setEnd:1];
        [animFadeInURLForm setDuration:1.0];
        [animFadeInURLForm startAnimation];
        [animFadeInURLForm setDelegate: self];
    }

    /**
        Removes the URLForm
    **/
    -(void) fadeoutUploadURLSection{
        CPLog.trace("Fading out url section...");
        animFadeOutURLForm = [[CPPropertyAnimation alloc] initWithView:uploadURLForm property:@"alphaValue"];
        [animFadeOutURLForm setStart:1];
        [animFadeOutURLForm setEnd:0];
        [animFadeOutURLForm setDuration:1.0];
        [animFadeOutURLForm startAnimation];
        [animFadeOutURLForm setDelegate: self];
    }

    /**
        Adds the local form
    **/
    -(void) fadeinUploadLocalFormSection{
        CPLog.info("Fading in UploadLocalForm");
        uploadLocalForm = [[UploadLocalForm alloc]  initWithFrame:CGRectMake(20, 60, 500, 380)];
        [uploadLocalForm setAlphaValue:0];
        [contentView addSubview: uploadLocalForm];

        animFadeInUploadLocalForm = [[CPPropertyAnimation alloc] initWithView:uploadLocalForm property:@"alphaValue"];
        [animFadeInUploadLocalForm setStart:0];
        [animFadeInUploadLocalForm setEnd:1];
        [animFadeInUploadLocalForm setDuration:1.0];
        [animFadeInUploadLocalForm startAnimation];
        [animFadeInUploadLocalForm setDelegate: self];
    }

    /**
        Removes the LocalForm
    **/
    -(void)fadeoutUploadLocalSection{
        CPLog.trace("Fading out local section...");
        animFadeOutUploadLocalForm = [[CPPropertyAnimation alloc] initWithView:uploadLocalForm property:@"alphaValue"];
        [animFadeOutUploadLocalForm setStart:1];
        [animFadeOutUploadLocalForm setEnd:0];
        [animFadeOutUploadLocalForm setDuration:1.0];
        [animFadeOutUploadLocalForm startAnimation];
        [animFadeOutUploadLocalForm setDelegate: self];
    }


    /**
        Depending on the currently selected form, it clears the window
    **/
    - (void) cleanForm{
        if(currentForm == 0){
            CPLog.trace("Should clear all");
            return;
        }else if(currentForm == 1){
            //clear the URLForm elements
            CPLog.trace("Clearing the URLForm...");
            [self fadeoutUploadURLSection];
        }else if(currentForm == 2){
            //clear the upload form elements
            CPLog.trace("Clearing the LocalForm...");
             [self fadeoutUploadLocalSection];
        }
    }

    -(void)clearAndClose:(CPNotification)aNotification{
         //TODO clear the form
         [self close];
     }

    }
    @end
