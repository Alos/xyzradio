@STATIC;1.0;t;2494;{var the_class = objj_allocateClassPair(CPAnimation, "CPPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_view"), new objj_ivar("_keyPath"), new objj_ivar("_start"), new objj_ivar("_end")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithView:property:"), function $CPPropertyAnimation__initWithView_property_(self, _cmd, aView, keyPath)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPropertyAnimation").super_class }, "initWithDuration:animationCurve:", 1.0, CPAnimationLinear);
 if (self) {
  if (objj_msgSend(aView, "respondsToSelector:", keyPath)) {
   _view = aView;
   _keyPath = keyPath;
  } else {
   return null;
  }
 }
 return self;
}
},["id","CPView","CPString"]), new objj_method(sel_getUid("setCurrentProgress:"), function $CPPropertyAnimation__setCurrentProgress_(self, _cmd, progress)
{ with(self)
{
 objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPropertyAnimation").super_class }, "setCurrentProgress:", progress);
 progress = objj_msgSend(self, "currentValue");
 if (_keyPath == 'width' || _keyPath == 'height')
  progress = (progress * (_end - _start)) + _start;
 else if (_keyPath == 'size')
  progress = CGSizeMake((progress * (_end.width - _start.width)) + _start.width, (progress * (_end.height - _start.height)) + _start.height);
 else if (_keyPath == 'frame') {
  progress = CGRectMake(
   (progress * (_end.origin.x - _start.origin.x)) + _start.origin.x,
   (progress * (_end.origin.y - _start.origin.y)) + _start.origin.y,
   (progress * (_end.size.width - _start.size.width)) + _start.size.width,
   (progress * (_end.size.height - _start.size.height)) + _start.size.height);
 } else if (_keyPath == 'alphaValue')
  progress = (progress * (_end - _start)) + _start;
 objj_msgSend(_view, "setValue:forKey:", progress, _keyPath);
}
},["void","float"]), new objj_method(sel_getUid("setStart:"), function $CPPropertyAnimation__setStart_(self, _cmd, aValue)
{ with(self)
{
 _start = aValue;
}
},["void","id"]), new objj_method(sel_getUid("start"), function $CPPropertyAnimation__start(self, _cmd)
{ with(self)
{
 return _start;
}
},["id"]), new objj_method(sel_getUid("setEnd:"), function $CPPropertyAnimation__setEnd_(self, _cmd, aValue)
{ with(self)
{
 _end = aValue;
}
},["void","id"]), new objj_method(sel_getUid("end"), function $CPPropertyAnimation__end(self, _cmd)
{ with(self)
{
 return _end;
}
},["id"])]);
}

