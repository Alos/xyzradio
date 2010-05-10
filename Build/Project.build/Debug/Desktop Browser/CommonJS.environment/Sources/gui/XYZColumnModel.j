@STATIC;1.0;t;1007;{var the_class = objj_allocateClassPair(CPView, "XYZColumnModel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("textfield")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:title:color:"), function $XYZColumnModel__initWithFrame_title_color_(self, _cmd, aFrame, aTitle, aColor)
{ with(self)
{
    self= objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  aFrame);
 textfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CGRectMake(0, 0, 0, 18));
    objj_msgSend(textfield, "setStringValue:", aTitle);
 if(aColor)
  objj_msgSend(textfield, "setTextColor:",  aColor);
 else
  objj_msgSend(textfield, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
    objj_msgSend(textfield, "setBackgroundColor:",  aColor);
 objj_msgSend(textfield, "sizeToFit");
 objj_msgSend(self, "addSubview:",  textfield);
    return self;
}
},["id","CPRect","CPString","CPColor"])]);
}

