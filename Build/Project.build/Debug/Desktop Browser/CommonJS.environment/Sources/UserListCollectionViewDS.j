@STATIC;1.0;i;9;XYZUser.ji;19;XYZUserPrefrences.jt;3458;objj_executeFile("XYZUser.j", YES);
objj_executeFile("XYZUserPrefrences.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "UserListCollectionViewDS"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("answerArray"), new objj_ivar("connection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $UserListCollectionViewDS__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UserListCollectionViewDS").super_class }, "init");
 if(self){
 }
 return self;
}
},["id"]), new objj_method(sel_getUid("getOnlineUsers"), function $UserListCollectionViewDS__getOnlineUsers(self, _cmd)
{ with(self)
{
 answerArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
 var app = objj_msgSend(CPApp, "delegate");
 var aURL = objj_msgSend(app, "serverIP") + "/GetAllCheckedOnlineUsersAsJSON"
 CPLog.info("Getting users at: %s", aURL);
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
 connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UserListCollectionViewDS__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 var result = JSON.parse(data);
 CPLog.info("The users: %s", result.pathToAvatar);
 for(var i=0; i< result.length; i++){
  var userInfo = result[i];
  var newUser = objj_msgSend(objj_msgSend(XYZUser, "alloc"), "init");
  objj_msgSend(newUser, "setEmail:",  userInfo.email);
  objj_msgSend(newUser, "setUsernick:",  userInfo.usernick);
  if(userInfo.pathToAvatar)
   objj_msgSend(newUser, "setPathToAvatar:",  userInfo.pathToAvatar);
  else
   objj_msgSend(newUser, "setPathToAvatar:", "");
  objj_msgSend(newUser, "setLogged:",  userInfo.logged);
  if(userInfo.dj)
   objj_msgSend(newUser, "setDj:", YES);
  else
   objj_msgSend(newUser, "setDj:", NO);
  objj_msgSend(newUser, "setSex:",  userInfo.sex);
  objj_msgSend(newUser, "setDjList1:",  userInfo.djList1);
  objj_msgSend(newUser, "setDjList2:",  userInfo.djList2);
  objj_msgSend(newUser, "setDjList3:",  userInfo.djList3);
  objj_msgSend(newUser, "setOwnedSongs:",  userInfo.ownedSongs);
  objj_msgSend(newUser, "setUserRating:",  userInfo.userRating);
  var somePrefrences = objj_msgSend(objj_msgSend(XYZUserPrefrences, "alloc"), "init");
  objj_msgSend(newUser, "setPrefrences:",  somePrefrences);
  objj_msgSend(answerArray, "addObject:",  newUser);
 }
 var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", answerArray, "list");
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "UserListRetrived", self, info);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $UserListCollectionViewDS__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $UserListCollectionViewDS__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("clearConnection:"), function $UserListCollectionViewDS__clearConnection_(self, _cmd, connection)
{ with(self)
{
    if (connection == louhiConnection)
        louhiConnection = nil;
}
},["void","CPURLConnection"])]);
}

