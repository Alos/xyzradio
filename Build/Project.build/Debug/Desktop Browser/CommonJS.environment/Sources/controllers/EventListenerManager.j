@STATIC;1.0;t;3217;{var the_class = objj_allocateClassPair(CPObject, "EventListenerManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("connection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $EventListenerManager__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("EventListenerManager").super_class }, "init");
 if(self){
 }
 return self;
}
},["id"]), new objj_method(sel_getUid("getEvents"), function $EventListenerManager__getEvents(self, _cmd)
{ with(self)
{
 answerArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
 var app = objj_msgSend(CPApp, "delegate");
 var aURL = objj_msgSend(app, "serverIP") + "/GetEventsForUser?account="+objj_msgSend(objj_msgSend(app, "userLoggedin"), "email");
 CPLog.info("Getting events at: %s", aURL);
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
 connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $EventListenerManager__connection_didReceiveData_(self, _cmd, aConnection, data)
{ with(self)
{
 var result = JSON.parse(data);
 CPLog.info(result);
 for(var i=0; i < result.length; i++){
  var event = result[i];
  if(event.eventName == "com.xyzradioengine.model.events.UserHasLoggedinXYZEvent"){
   CPLog.info("%s loggedin", event.userEmail);
   var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", event.userEmail, "account");
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewUserHasArrived", self, info);
  } else if(event.eventName == "com.xyzradioengine.model.events.UserHasLoggedoffXYZEvent")
  {
   CPLog.info("%s loggedoff", event.userEmail);
   var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", event.userEmail, "account");
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "UserLoggedoff", self, info);
  }
  else if(event.eventName == "com.xyzradioengine.model.events.NewSongAddedXYZEvent")
  {
   CPLog.info("%s new song arrived: ", event.song);
   var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", event.song, "song");
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewSongAddedXYZEvent", self, info);
  }
 }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $EventListenerManager__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $EventListenerManager__connection_didFailWithError_(self, _cmd, aConnection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $EventListenerManager__clearConnection_(self, _cmd, aConnection)
{ with(self)
{
    if (aConnection == louhiConnection)
        louhiConnection = nil;
}
},["void","CPURLConnection"])]);
}

