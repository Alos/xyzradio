@STATIC;1.0;i;10;UserCell.ji;9;XYZUser.ji;26;UserListCollectionViewDS.jt;6296;objj_executeFile("UserCell.j", YES);
objj_executeFile("XYZUser.j", YES);
objj_executeFile("UserListCollectionViewDS.j", YES);
{var the_class = objj_allocateClassPair(CPWindow, "UsersWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("list"), new objj_ivar("listCollectionView"), new objj_ivar("userListCollectionViewDS")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentRect:styleMask:"), function $UsersWindow__contentRect_styleMask_(self, _cmd, aRect, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("UsersWindow").super_class }, "initWithContentRect:styleMask:", aRect,  aStyleMask);
    if (self)
    {
   list = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
         objj_msgSend(self, "setTitle:", "Users");
         var contentView = objj_msgSend(self, "contentView");
         var bounds = objj_msgSend(contentView, "bounds");
  objj_msgSend(self, "setBackgroundColor:", nil);
  var listScrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 246 , CGRectGetHeight(bounds)));
         objj_msgSend(listScrollView, "setAutohidesScrollers:", YES);
  objj_msgSend(listScrollView, "setAutoresizingMask:", CPViewHeightSizable);
  objj_msgSend(objj_msgSend(listScrollView, "contentView"), "setBackgroundColor:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 0, 0, 0, 0.0));
  var userListItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
  objj_msgSend(userListItem, "setView:", objj_msgSend(objj_msgSend(UserCell, "alloc"), "initWithFrame:", CGRectMakeZero()));
  listCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 246, 91));
  objj_msgSend(listCollectionView, "setDelegate:", self);
  objj_msgSend(listCollectionView, "setItemPrototype:", userListItem);
  objj_msgSend(listCollectionView, "setMinItemSize:", CGSizeMake(246, 91));
  objj_msgSend(listCollectionView, "setMaxItemSize:", CGSizeMake(246, 91));
  objj_msgSend(listCollectionView, "setMaxNumberOfColumns:", 1);
     objj_msgSend(listScrollView, "setDocumentView:", listCollectionView);
  objj_msgSend(contentView, "addSubview:", listScrollView);
  userListCollectionViewDS = objj_msgSend(objj_msgSend(UserListCollectionViewDS, "alloc"), "init");
  objj_msgSend(userListCollectionViewDS, "getOnlineUsers");
    }
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("updateList:"), "UserListRetrived", nil);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("addUser:"), "NewUserHasArrived", nil);
 objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("removeUser:"), "UserLoggedoff", nil);
    return self;
}
},["id","CGRect",null]), new objj_method(sel_getUid("updateList:"), function $UsersWindow__updateList_(self, _cmd, aNotification)
{ with(self)
{
 var info = objj_msgSend(aNotification, "userInfo");
 var aux = objj_msgSend(info, "objectForKey:", "list");
 for(var i = 0 ; i< objj_msgSend(aux, "count") ; ++i){
  objj_msgSend(list, "addObject:",  aux[i]);
 }
 objj_msgSend(listCollectionView, "setContent:", objj_msgSend(CPArray, "arrayWithArray:", list));
}
},["void","CPNotification"]), new objj_method(sel_getUid("getCollectionViewContent"), function $UsersWindow__getCollectionViewContent(self, _cmd)
{ with(self)
{
 return objj_msgSend(listCollectionView, "content");
}
},["CPArray"]), new objj_method(sel_getUid("removeUser:"), function $UsersWindow__removeUser_(self, _cmd, aNotification)
{ with(self)
{
 var info = objj_msgSend(aNotification, "userInfo");
 var account = objj_msgSend(info, "objectForKey:", "account");
 objj_msgSend(list, "removeObject:", account);
 objj_msgSend(listCollectionView, "setContent:",  objj_msgSend(CPArray, "arrayWithArray:", list));
}
},["void","CPNotification"]), new objj_method(sel_getUid("addUser:"), function $UsersWindow__addUser_(self, _cmd, aNotification)
{ with(self)
{
 CPLog.info("Adding new user...");
 var info = objj_msgSend(aNotification, "userInfo");
 var account = objj_msgSend(info, "objectForKey:", "account");
 var app = objj_msgSend(CPApp, "delegate");
 var aURL = objj_msgSend(app, "serverIP") + "/GetUserByEmail?account="+account;
 CPLog.info("Getting users at: %s", aURL);
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", aURL);
 connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void","CPNotification"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $UsersWindow__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 var result = JSON.parse(data);
 var newUserArray = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
  var userInfo = result;
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
  objj_msgSend(newUserArray, "addObject:",  newUser);
 for(var i = 0; i < list.length; i++){
  objj_msgSend(newUserArray, "addObject:",  list[i]);
 }
 objj_msgSend(listCollectionView, "setContent:",  newUserArray);
 list = objj_msgSend(CPArray, "arrayWithArray:", list);
}
},["void","CPURLConnection","CPString"])]);
}

