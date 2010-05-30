@STATIC;1.0;i;15;UploadURLForm.ji;17;UploadLocalForm.jt;7523;objj_executeFile("UploadURLForm.j", YES);;
objj_executeFile("UploadLocalForm.j", YES);;
{var the_class = objj_allocateClassPair(CPWindow, "AddSongWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("uploadURLForm"), new objj_ivar("uploadLocalForm"), new objj_ivar("animFadeInURLForm"), new objj_ivar("animFadeOutURLForm"), new objj_ivar("animFadeInUploadLocalForm"), new objj_ivar("animFadeOutUploadLocalForm"), new objj_ivar("typeOfUpload"), new objj_ivar("songURLUploader"), new objj_ivar("contentView"), new objj_ivar("currentForm")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $AddSongWindow__initWithContentRect_styleMask_(self, _cmd, aRectangle, aStyleMask)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AddSongWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
        if (self)
        {
            objj_msgSend(self, "setTitle:", "Upload Songs");
            var contentView = objj_msgSend(self, "contentView");
            var bounds = objj_msgSend(contentView, "bounds");
            var arr =objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
            objj_msgSend(arr, "addObject:", "Select how to upload your song...");
            objj_msgSend(arr, "addObject:", "URL");
            objj_msgSend(arr, "addObject:", "Upload from computer...");
            typeOfUpload =objj_msgSend(objj_msgSend(CPPopUpButton, "alloc"), "initWithFrame:", CGRectMake(20, 20, 270, 24));
            objj_msgSend(typeOfUpload, "addItemsWithTitles:", arr);
            objj_msgSend(typeOfUpload, "setTarget:", self);
            objj_msgSend(typeOfUpload, "setAction:", sel_getUid("typeOfUploadDidChangeItem"));
            objj_msgSend(contentView, "addSubview:",  typeOfUpload);
            currentForm = 0;
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("clearAndClose:"), "SubmitSuccessful", nil);
        }
    return self;
    }
},["id",null,null]), new objj_method(sel_getUid("typeOfUploadDidChangeItem"), function $AddSongWindow__typeOfUploadDidChangeItem(self, _cmd)
{ with(self)
{
        if(objj_msgSend(objj_msgSend(typeOfUpload, "selectedItem"), "title") == "URL"){
            CPLog.trace("Adding URLForm1...");
            objj_msgSend(self, "cleanForm");
            currentForm = 1;
            objj_msgSend(self, "fadeinUploadURLFormSection");
        }else if(objj_msgSend(objj_msgSend(typeOfUpload, "selectedItem"), "title") == "Upload from computer..."){
            CPLog.trace("Adding Upload local form1...");
            objj_msgSend(self, "cleanForm");
            currentForm = 2;
            objj_msgSend(self, "fadeinUploadLocalFormSection");
        }else{
            CPLog.trace("Clearing form...");
            objj_msgSend(self, "cleanForm");
            currentForm = 0;
        }
    }
},["void"]), new objj_method(sel_getUid("animationDidEnd:"), function $AddSongWindow__animationDidEnd_(self, _cmd, animation)
{ with(self)
{
        if(animation == animFadeOutURLForm){
            CPLog.info("Removing uploadURLForm...");
            objj_msgSend(uploadURLForm, "removeFromSuperview");
            uploadURLForm = nil;
        }
        if(animation == animFadeOutUploadLocalForm){
            CPLog.info("Removing uploadLocalForm...");
            objj_msgSend(uploadLocalForm, "removeFromSuperview");
            uploadLocalForm = nil;
        }
    }
},["void","CPAnimation"]), new objj_method(sel_getUid("fadeinUploadURLFormSection"), function $AddSongWindow__fadeinUploadURLFormSection(self, _cmd)
{ with(self)
{
        CPLog.info("Fading in UploadURLForm");
        uploadURLForm = objj_msgSend(objj_msgSend(UploadURLForm, "alloc"), "initWithFrame:", CGRectMake(20, 60, 500, 380));
        objj_msgSend(uploadURLForm, "setAlphaValue:", 0);
        objj_msgSend(contentView, "addSubview:",  uploadURLForm);
        animFadeInURLForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadURLForm, "alphaValue");
        objj_msgSend(animFadeInURLForm, "setStart:", 0);
        objj_msgSend(animFadeInURLForm, "setEnd:", 1);
        objj_msgSend(animFadeInURLForm, "setDuration:", 1.0);
        objj_msgSend(animFadeInURLForm, "startAnimation");
        objj_msgSend(animFadeInURLForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("fadeoutUploadURLSection"), function $AddSongWindow__fadeoutUploadURLSection(self, _cmd)
{ with(self)
{
        CPLog.trace("Fading out url section...");
        animFadeOutURLForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadURLForm, "alphaValue");
        objj_msgSend(animFadeOutURLForm, "setStart:", 1);
        objj_msgSend(animFadeOutURLForm, "setEnd:", 0);
        objj_msgSend(animFadeOutURLForm, "setDuration:", 1.0);
        objj_msgSend(animFadeOutURLForm, "startAnimation");
        objj_msgSend(animFadeOutURLForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("fadeinUploadLocalFormSection"), function $AddSongWindow__fadeinUploadLocalFormSection(self, _cmd)
{ with(self)
{
        CPLog.info("Fading in UploadLocalForm");
        uploadLocalForm = objj_msgSend(objj_msgSend(UploadLocalForm, "alloc"), "initWithFrame:", CGRectMake(20, 60, 500, 380));
        objj_msgSend(uploadLocalForm, "setAlphaValue:", 0);
        objj_msgSend(contentView, "addSubview:",  uploadLocalForm);
        animFadeInUploadLocalForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadLocalForm, "alphaValue");
        objj_msgSend(animFadeInUploadLocalForm, "setStart:", 0);
        objj_msgSend(animFadeInUploadLocalForm, "setEnd:", 1);
        objj_msgSend(animFadeInUploadLocalForm, "setDuration:", 1.0);
        objj_msgSend(animFadeInUploadLocalForm, "startAnimation");
        objj_msgSend(animFadeInUploadLocalForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("fadeoutUploadLocalSection"), function $AddSongWindow__fadeoutUploadLocalSection(self, _cmd)
{ with(self)
{
        CPLog.trace("Fading out local section...");
        animFadeOutUploadLocalForm = objj_msgSend(objj_msgSend(CPPropertyAnimation, "alloc"), "initWithView:property:", uploadLocalForm, "alphaValue");
        objj_msgSend(animFadeOutUploadLocalForm, "setStart:", 1);
        objj_msgSend(animFadeOutUploadLocalForm, "setEnd:", 0);
        objj_msgSend(animFadeOutUploadLocalForm, "setDuration:", 1.0);
        objj_msgSend(animFadeOutUploadLocalForm, "startAnimation");
        objj_msgSend(animFadeOutUploadLocalForm, "setDelegate:",  self);
    }
},["void"]), new objj_method(sel_getUid("cleanForm"), function $AddSongWindow__cleanForm(self, _cmd)
{ with(self)
{
        if(currentForm == 0){
            CPLog.trace("Should clear all");
            return;
        }else if(currentForm == 1){
            CPLog.trace("Clearing the URLForm...");
            objj_msgSend(self, "fadeoutUploadURLSection");
        }else if(currentForm == 2){
            CPLog.trace("Clearing the LocalForm...");
             objj_msgSend(self, "fadeoutUploadLocalSection");
        }
    }
},["void"]), new objj_method(sel_getUid("clearAndClose:"), function $AddSongWindow__clearAndClose_(self, _cmd, aNotification)
{ with(self)
{
         objj_msgSend(self, "close");
     }
},["void","CPNotification"])]);
}

