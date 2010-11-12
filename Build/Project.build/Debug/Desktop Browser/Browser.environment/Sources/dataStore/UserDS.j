@STATIC;1.0;i;18;../model/XYZSong.jt;2256;objj_executeFile("../model/XYZSong.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "UserDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("xyzConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UserDS__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UserDS").super_class }, "init");
    if(self){
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("getUserData"), function $UserDS__getUserData(self, _cmd)
{ with(self)
{
    var app = objj_msgSend(CPApp, "delegate");
    var aURL = objj_msgSend(app, "serverIP") + "/GetUserData";
    CPLog.info("Getting User data at: %s", aURL);
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
    xyzConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UserDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    var info = JSON.parse(data);
    if(!response.error){
        CPLog.info("Got user: "+ response);
        var user = objj_msgSend(objj_msgSend(XYZUser, "alloc"), "init");
        var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", user, "UserData");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "UserDataReceived", self, info);
    }else{
        CPLog.info("No UserData found in data!");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $UserDS__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $UserDS__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $UserDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == xyzConnection)
        xyzConnection = nil;
}
},["void","CPURLConnection"])]);
}

