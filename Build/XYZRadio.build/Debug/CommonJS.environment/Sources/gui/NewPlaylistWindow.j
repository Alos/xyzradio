@STATIC;1.0;t;2698;{var the_class = objj_allocateClassPair(CPWindow, "NewPlaylistWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("nameTextField"), new objj_ivar("botonGuardar")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:contentViewOfWindow:"), function $NewPlaylistWindow__initWithContentRect_styleMask_contentViewOfWindow_(self, _cmd, aRectangle, aStyleMask, aContentView)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("NewPlaylistWindow").super_class }, "initWithContentRect:styleMask:", aRectangle,  aStyleMask);
  if (self)
  {
   contentViewOfWindow = aContentView;
   objj_msgSend(self, "setTitle:", "New Playlist");
   var contentView = objj_msgSend(self, "contentView");
   var bounds = objj_msgSend(contentView, "bounds");
   var center= CGRectGetWidth(bounds)/2.0;
   var nameLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(20, 30, 50, 18));
   objj_msgSend(nameLabel, "setStringValue:", "Name:");
   objj_msgSend(nameLabel, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
   objj_msgSend(contentView, "addSubview:", nameLabel);
    nameTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(60, 25, 170, 28));
   objj_msgSend(nameTextField, "setEditable:", YES);
   objj_msgSend(nameTextField, "setBezeled:", YES);
   objj_msgSend(contentView, "addSubview:", nameTextField);
   botonGuardar = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(230, 65, 50, 18));
   objj_msgSend(botonGuardar, "setTheme:", objj_msgSend(CPTheme, "themeNamed:", "Aristo-HUD"));
   objj_msgSend(botonGuardar, "setBezelStyle:", CPHUDBezelStyle);
   objj_msgSend(botonGuardar, "setTitle:", "Ok");
   objj_msgSend(botonGuardar, "setTarget:", self);
   objj_msgSend(botonGuardar, "setAction:", sel_getUid("savePreferences"));
   objj_msgSend(contentView, "addSubview:",  botonGuardar);
  }
  return self;
 }
},["id",null,null,"CPView"]), new objj_method(sel_getUid("clean"), function $NewPlaylistWindow__clean(self, _cmd)
{ with(self)
{
  objj_msgSend(nameTextField, "setStringValue:", "");
 }
},["void"]), new objj_method(sel_getUid("savePreferences"), function $NewPlaylistWindow__savePreferences(self, _cmd)
{ with(self)
{
  var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(nameTextField, "objectValue"), "playlistName");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewPlaylistAdded", self, info);
  objj_msgSend(self, "close");
 }
},["void"])]);
}

