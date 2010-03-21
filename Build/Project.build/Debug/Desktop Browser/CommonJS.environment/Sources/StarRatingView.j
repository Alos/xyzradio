@STATIC;1.0;I;15;AppKit/CPView.ji;19;StarRatingControl.jt;2630;





objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("StarRatingControl.j", YES);

var values = [ "No selection",
               "Failed",
               "Not good",
               "Average",
               "Good",
               "Very good",
               "Excellent" ];

{var the_class = objj_allocateClassPair(CPView, "StarRatingView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("rater"), new objj_ivar("indicator")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("rater"), function $StarRatingView__rater(self, _cmd)
{ with(self)
{
return rater;
}
},["id"]),
new objj_method(sel_getUid("indicator"), function $StarRatingView__indicator(self, _cmd)
{ with(self)
{
return indicator;
}
},["id"]), new objj_method(sel_getUid("initWithFrame:"), function $StarRatingView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("StarRatingView").super_class }, "initWithFrame:", aFrame))
    {
      rater = objj_msgSend(objj_msgSend(StarRatingControl, "alloc"), "initWithFrame:", CGRectMakeZero());
      objj_msgSend(rater, "setNumberOfStars:", 5);
      objj_msgSend(rater, "sizeToFit");
      objj_msgSend(rater, "setTarget:", self);
      objj_msgSend(rater, "setAction:", sel_getUid("starClick:"));
      indicator = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
      objj_msgSend(indicator, "setPlaceholderString:", values[0]);
      objj_msgSend(indicator, "sizeToFit");
      var s_bounds = objj_msgSend(self, "bounds"),
          r_bounds = objj_msgSend(rater, "bounds"),
          i_bounds = objj_msgSend(indicator, "bounds"),
          origin = CGPointMake(r_bounds.size.width + 5, (r_bounds.size.height - i_bounds.size.height) / 2.0),
          size = CGSizeMake(s_bounds.size.width - r_bounds.size.width - 5, i_bounds.size.height);
      objj_msgSend(indicator, "setFrameOrigin:", origin);
      objj_msgSend(indicator, "setFrameSize:", size);
      objj_msgSend(indicator, "setAutoresizingMask:",  CPViewWidthSizable);
      objj_msgSend(self, "addSubview:", rater);

    }
    return self;
}
},["void","CGRect"]), new objj_method(sel_getUid("starClick:"), function $StarRatingView__starClick_(self, _cmd, sender)
{ with(self)
{
  var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(sender, "intValue"), "rating");
  objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "StarRatingForSongChanged", self, info);

}
},["void","id"])]);
}

