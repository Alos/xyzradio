@STATIC;1.0;t;1909;{var the_class = objj_allocateClassPair(CPObject, "LoginSucessfullXYZEventManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("serverConnection"), new objj_ivar("theRequest"), new objj_ivar("app")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("connection:didReceiveData:"), function $LoginSucessfullXYZEventManager__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 CPLog(data);
 var response = JSON.parse(data);
 if(response.user){
  CPLog("Logged OK. Returned a user!");
  var user = objj_msgSend(objj_msgSend(XYZUser, "alloc"), "init");
  var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", song.position, "time");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "pos", self, info);
 }else{
  CPLog("Logged OK. No user returned");
 }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $LoginSucessfullXYZEventManager__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $LoginSucessfullXYZEventManager__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendLoginToGoogleSucessfullXYZEvent:"), function $LoginSucessfullXYZEventManager__sendLoginToGoogleSucessfullXYZEvent_(self, _cmd, email)
{ with(self)
{
 app = objj_msgSend(CPApp, "delegate");
 var url = objj_msgSend(app, "serverIP")+"/LoginVerify?useremail="+email;
 theRequest = objj_msgSend(CPURLRequest, "requestWithURL:",  url);
 serverConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", theRequest, self);
}
},["void","CPString"])]);
}

