@STATIC;1.0;I;21;Foundation/CPObject.jt;8413;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "XYZUser"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("email"), new objj_ivar("usernick"), new objj_ivar("pathToAvatar"), new objj_ivar("logged"), new objj_ivar("dj"), new objj_ivar("sex"), new objj_ivar("djList1"), new objj_ivar("djList2"), new objj_ivar("djList3"), new objj_ivar("ownedSongs"), new objj_ivar("userRating"), new objj_ivar("prefrences")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("email"), function $XYZUser__email(self, _cmd)
{ with(self)
{
return email;
}
},["id"]),
new objj_method(sel_getUid("setEmail:"), function $XYZUser__setEmail_(self, _cmd, newValue)
{ with(self)
{
email = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("usernick"), function $XYZUser__usernick(self, _cmd)
{ with(self)
{
return usernick;
}
},["id"]),
new objj_method(sel_getUid("setUsernick:"), function $XYZUser__setUsernick_(self, _cmd, newValue)
{ with(self)
{
usernick = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pathToAvatar"), function $XYZUser__pathToAvatar(self, _cmd)
{ with(self)
{
return pathToAvatar;
}
},["id"]),
new objj_method(sel_getUid("setPathToAvatar:"), function $XYZUser__setPathToAvatar_(self, _cmd, newValue)
{ with(self)
{
pathToAvatar = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("logged"), function $XYZUser__logged(self, _cmd)
{ with(self)
{
return logged;
}
},["id"]),
new objj_method(sel_getUid("setLogged:"), function $XYZUser__setLogged_(self, _cmd, newValue)
{ with(self)
{
logged = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("dj"), function $XYZUser__dj(self, _cmd)
{ with(self)
{
return dj;
}
},["id"]),
new objj_method(sel_getUid("setDj:"), function $XYZUser__setDj_(self, _cmd, newValue)
{ with(self)
{
dj = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("sex"), function $XYZUser__sex(self, _cmd)
{ with(self)
{
return sex;
}
},["id"]),
new objj_method(sel_getUid("setSex:"), function $XYZUser__setSex_(self, _cmd, newValue)
{ with(self)
{
sex = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("djList1"), function $XYZUser__djList1(self, _cmd)
{ with(self)
{
return djList1;
}
},["id"]),
new objj_method(sel_getUid("setDjList1:"), function $XYZUser__setDjList1_(self, _cmd, newValue)
{ with(self)
{
djList1 = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("djList2"), function $XYZUser__djList2(self, _cmd)
{ with(self)
{
return djList2;
}
},["id"]),
new objj_method(sel_getUid("setDjList2:"), function $XYZUser__setDjList2_(self, _cmd, newValue)
{ with(self)
{
djList2 = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("djList3"), function $XYZUser__djList3(self, _cmd)
{ with(self)
{
return djList3;
}
},["id"]),
new objj_method(sel_getUid("setDjList3:"), function $XYZUser__setDjList3_(self, _cmd, newValue)
{ with(self)
{
djList3 = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("ownedSongs"), function $XYZUser__ownedSongs(self, _cmd)
{ with(self)
{
return ownedSongs;
}
},["id"]),
new objj_method(sel_getUid("setOwnedSongs:"), function $XYZUser__setOwnedSongs_(self, _cmd, newValue)
{ with(self)
{
ownedSongs = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("userRating"), function $XYZUser__userRating(self, _cmd)
{ with(self)
{
return userRating;
}
},["id"]),
new objj_method(sel_getUid("setUserRating:"), function $XYZUser__setUserRating_(self, _cmd, newValue)
{ with(self)
{
userRating = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("prefrences"), function $XYZUser__prefrences(self, _cmd)
{ with(self)
{
return prefrences;
}
},["id"]),
new objj_method(sel_getUid("setPrefrences:"), function $XYZUser__setPrefrences_(self, _cmd, newValue)
{ with(self)
{
prefrences = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithEmail:usernick:pathToAvatar:logged:dj:sex:djList1:djList2:djList3:ownedSongs:rating:prefrences:"), function $XYZUser__initWithEmail_usernick_pathToAvatar_logged_dj_sex_djList1_djList2_djList3_ownedSongs_rating_prefrences_(self, _cmd, anEmail, aName, aPath, state, isDJ, aSex, aDJList, aDJList2, aDJList3, aList, aRating, somePrefs)
{ with(self)
{
    if(self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init")){
        email = anEmail;
        usernick = aName;
        pathToAvatar = aPath;
        logged = state;
        dj = isDJ;
        sex = aSex;
        djList1 = aDJList;
        djList2 = aDJList2;
        djList3 = aDJList3;
        ownedSongs = aList;
        userRating = aRating;
        prefrences = somePrefs;
    }
    return self;
}
},["id","CPString","CPString","CPString","BOOL","BOOL","CPString","CPArray","CPArray","CPArray","CPArray","CPString","XYZUserPrefrences"]), new objj_method(sel_getUid("initWithUserName:rating:"), function $XYZUser__initWithUserName_rating_(self, _cmd, aUserName, aRating)
{ with(self)
{
    if(self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init")){
        usernick = aUserName
        userRating = aRating;
    }
    return self;
}
},["id","CPString","CPString"]), new objj_method(sel_getUid("init"), function $XYZUser__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("isEqual:"), function $XYZUser__isEqual_(self, _cmd, anObject)
{ with(self)
{
    if(objj_msgSend(objj_msgSend(anObject, "class"), "instancesRespondToSelector:",  sel_getUid("email")))
    if(objj_msgSend(anObject, "email")==objj_msgSend(self, "email"))
        return YES;
    else
        return NO;
}
},["BOOL","id"]), new objj_method(sel_getUid("encodeWithCoder:"), function $XYZUser__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", email, "Email");
    objj_msgSend(aCoder, "encodeObject:forKey:", usernick, "UserNick");
    objj_msgSend(aCoder, "encodeObject:forKey:", logged, "Logged");
    objj_msgSend(aCoder, "encodeObject:forKey:", sex, "Sex");
    objj_msgSend(aCoder, "encodeObject:forKey:", status, "Status");
    objj_msgSend(aCoder, "encodeObject:forKey:", djList1, "DJList1");
    objj_msgSend(aCoder, "encodeObject:forKey:", djList2, "DJList2");
    objj_msgSend(aCoder, "encodeObject:forKey:", djList3, "DJList3");
    objj_msgSend(aCoder, "encodeObject:forKey:", ownedSongs, "OwnedSongs");
    objj_msgSend(aCoder, "encodeObject:forKey:", userRating, "UserRating");
}
},["void","CPCoder"]), new objj_method(sel_getUid("initWithCoder:"), function $XYZUser__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZUser").super_class }, "init");
    if (self)
    {
        email = objj_msgSend(aCoder, "decodeObjectForKey:", "Email");
        usernick =objj_msgSend(aCoder, "decodeObjectForKey:", "UserNick");
        logged = objj_msgSend(aCoder, "decodeObjectForKey:", "Logged");
        sex = objj_msgSend(aCoder, "decodeObjectForKey:", "Sex");
        status = objj_msgSend(aCoder, "decodeObjectForKey:", "Status");
        djList1 = objj_msgSend(aCoder, "decodeObjectForKey:", "DJList1");
        djList2 = objj_msgSend(aCoder, "decodeObjectForKey:", "DJList2");
        djList3 = objj_msgSend(aCoder, "decodeObjectForKey:", "DJList3");
        ownedSongs = objj_msgSend(aCoder, "decodeObjectForKey:", "OwnedSongs");
        userRating = objj_msgSend(aCoder, "decodeObjectForKey:", "UserRating");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("starRatingForUserChanged:"), function $XYZUser__starRatingForUserChanged_(self, _cmd, aNotification)
{ with(self)
{
    console.log("notified!!");
    var info = objj_msgSend(aNotification, "userInfo");
    var aux = objj_msgSend(info, "objectForKey:", "rating");
    objj_msgSend(self, "setUserRating:",  aux);
    console.log(objj_msgSend(self, "rating"));
}
},["void","CPNotification"]), new objj_method(sel_getUid("setStarRater:"), function $XYZUser__setStarRater_(self, _cmd, aRater)
{ with(self)
{
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("starRatingForUserChanged:"), "StarRatingForUserChanged", aRater);
}
},["void","StarRatingView"])]);
}

