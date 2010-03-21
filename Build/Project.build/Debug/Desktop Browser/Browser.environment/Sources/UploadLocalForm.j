@STATIC;1.0;t;1227;{var the_class = objj_allocateClassPair(CPView, "UploadLocalForm"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $UploadLocalForm__initWithFrame_(self, _cmd, aRectangle)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UploadLocalForm").super_class }, "initWithFrame:",  aRectangle);
        if(self){
            var commingSoon = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(47, 80, 100, 18));
            objj_msgSend(commingSoon, "setStringValue:", "Comming soon...");
            objj_msgSend(commingSoon, "sizeToFit");
            objj_msgSend(commingSoon, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:", commingSoon);
        }
        return self;
    }
},["id","CGRect"]), new objj_method(sel_getUid("newUserActionPerformed"), function $UploadLocalForm__newUserActionPerformed(self, _cmd)
{ with(self)
{
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", "newUserActionPerformed", self);
    }
},["void"])]);
}

