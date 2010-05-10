@STATIC;1.0;I;21;Foundation/CPObject.ji;13;DCTextField.jt;15497;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("DCTextField.j", YES);
DCFormControlTypeTextField = "DCFormControlTypeTextField";
DCFormControlTypeTextFieldShort = "DCFormControlTypeTextFieldShort";
DCFormControlTypeTextArea = "DCFormControlTypeTextArea";
DCFormControlTypeCheckBox = "DCFormControlTypeCheckBox";
DCFormControlTypeHidden = "DCFormControlTypeHidden";
{var the_class = objj_allocateClassPair(CPView, "DCFormView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("delegate"), new objj_ivar("enabled"), new objj_ivar("submitURLString"), new objj_ivar("submitButtonTitle"), new objj_ivar("headerLabel"), new objj_ivar("requiredLabel"), new objj_ivar("cancelButton"), new objj_ivar("submitButton"), new objj_ivar("fields"), new objj_ivar("paddingBottom"), new objj_ivar("paddingLeft"), new objj_ivar("paddingRight"), new objj_ivar("paddingTop"), new objj_ivar("lineSpacing"), new objj_ivar("columnSpacing"), new objj_ivar("labelWidth"), new objj_ivar("fieldHeight"), new objj_ivar("currentYOffset"), new objj_ivar("connection"), new objj_ivar("data")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $DCFormView__delegate(self, _cmd)
{ with(self)
{
return delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $DCFormView__setDelegate_(self, _cmd, newValue)
{ with(self)
{
delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("enabled"), function $DCFormView__enabled(self, _cmd)
{ with(self)
{
return enabled;
}
},["id"]),
new objj_method(sel_getUid("setEnabled:"), function $DCFormView__setEnabled_(self, _cmd, newValue)
{ with(self)
{
enabled = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("submitURLString"), function $DCFormView__submitURLString(self, _cmd)
{ with(self)
{
return submitURLString;
}
},["id"]),
new objj_method(sel_getUid("setSubmitURLString:"), function $DCFormView__setSubmitURLString_(self, _cmd, newValue)
{ with(self)
{
submitURLString = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("submitButtonTitle"), function $DCFormView__submitButtonTitle(self, _cmd)
{ with(self)
{
return submitButtonTitle;
}
},["id"]),
new objj_method(sel_getUid("setSubmitButtonTitle:"), function $DCFormView__setSubmitButtonTitle_(self, _cmd, newValue)
{ with(self)
{
submitButtonTitle = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("fields"), function $DCFormView__fields(self, _cmd)
{ with(self)
{
return fields;
}
},["id"]),
new objj_method(sel_getUid("setFields:"), function $DCFormView__setFields_(self, _cmd, newValue)
{ with(self)
{
fields = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $DCFormView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DCFormView").super_class }, "initWithFrame:", aFrame);
 if (self) {
  objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.95, 0.95));
  paddingBottom = 20;
  paddingLeft = 20;
  paddingRight = 20;
  paddingTop = 100;
  lineSpacing = 14;
  columnSpacing = 10;
  labelWidth = 106;
  fieldHeight = 26;
  currentYOffset = paddingTop;
  fields = objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
  submitButtonTitle = "Submit";
  headerLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft, 45, objj_msgSend(self, "frame").size.width - paddingLeft - paddingRight, 40));
  objj_msgSend(headerLabel, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "444444"));
  objj_msgSend(headerLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12));
  objj_msgSend(headerLabel, "setAlignment:", CPCenterTextAlignment);
  objj_msgSend(headerLabel, "setStringValue:", "");
  objj_msgSend(headerLabel, "setAutoresizingMask:", CPViewMaxXMargin | CPViewMaxYMargin);
  objj_msgSend(self, "addSubview:", headerLabel);
  requiredLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft, objj_msgSend(self, "frame").size.height - paddingBottom - 20, 100, fieldHeight));
  objj_msgSend(requiredLabel, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "444444"));
  objj_msgSend(requiredLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11));
  objj_msgSend(requiredLabel, "setStringValue:", "* Required Fields");
  objj_msgSend(requiredLabel, "setAutoresizingMask:", CPViewMaxXMargin | CPViewMinYMargin);
  objj_msgSend(requiredLabel, "setHidden:", YES);
  objj_msgSend(self, "addSubview:", requiredLabel);
  submitButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(objj_msgSend(self, "frame").size.width - paddingRight - 112, objj_msgSend(self, "frame").size.height - paddingBottom - 24, 112, 24));
  objj_msgSend(submitButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
  objj_msgSend(submitButton, "setTarget:", self);
  objj_msgSend(submitButton, "setAction:", sel_getUid("submitAction:"));
  objj_msgSend(submitButton, "setTitle:", objj_msgSend(self, "submitButtonTitle"));
  objj_msgSend(self, "addSubview:", submitButton);
  cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(
   objj_msgSend(self, "frame").size.width - paddingRight - objj_msgSend(submitButton, "frame").size.width - columnSpacing - 70,
   objj_msgSend(self, "frame").size.height - paddingBottom - 24,
   70,
   24));
  objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
  objj_msgSend(cancelButton, "setTarget:", self);
  objj_msgSend(cancelButton, "setAction:", sel_getUid("cancelAction"));
  objj_msgSend(cancelButton, "setTitle:", "Cancel");
  objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
  objj_msgSend(self, "addSubview:", cancelButton);
  objj_msgSend(self, "becomeFirstResponder");
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("didShow"), function $DCFormView__didShow(self, _cmd)
{ with(self)
{
 objj_msgSend(self, "setEnabled:", YES);
 if (objj_msgSend(fields, "count") > 0) {
 }
 for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
  if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "superview")) {
   objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "becomeFirstResponder");
   break;
  }
 }
}
},["void"]), new objj_method(sel_getUid("cancelAction"), function $DCFormView__cancelAction(self, _cmd)
{ with(self)
{
 objj_msgSend(delegate, "endForm");
}
},["void"]), new objj_method(sel_getUid("labelWithTitle:originY:"), function $DCFormView__labelWithTitle_originY_(self, _cmd, aString, y)
{ with(self)
{
 var label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft, y, labelWidth, fieldHeight));
 objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "colorWithHexString:", "444444"));
 objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12));
 objj_msgSend(label, "setAlignment:", CPRightTextAlignment);
 objj_msgSend(label, "setStringValue:", aString);
 objj_msgSend(label, "setAutoresizingMask:", CPViewMaxXMargin | CPViewMaxYMargin);
 objj_msgSend(self, "addSubview:", label);
 return label;
}
},["CPTextField","CPString","float"]), new objj_method(sel_getUid("addFieldRowWithTitle:name:controlType:required:"), function $DCFormView__addFieldRowWithTitle_name_controlType_required_(self, _cmd, theTitle, name, theControlType, required)
{ with(self)
{
 if (theControlType != DCFormControlTypeCheckBox) {
  objj_msgSend(self, "labelWithTitle:originY:", theTitle, currentYOffset + 54);
 }
 var control;
 if (theControlType == DCFormControlTypeTextField || theControlType == DCFormControlTypeTextFieldShort) {
  var width = objj_msgSend(self, "frame").size.width - paddingLeft - labelWidth - columnSpacing - paddingRight;
  if (theControlType == DCFormControlTypeTextFieldShort) {
   width = width / 2;
  }
  control = objj_msgSend(objj_msgSend(DCTextField, "alloc"), "initWithFrame:", CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset+50, width, fieldHeight));
  objj_msgSend(control, "setAutoresizingMask:", CPViewWidthSizable | CPViewMaxYMargin);
  objj_msgSend(control, "setDelegate:", self);
  objj_msgSend(self, "addSubview:", control);
  currentYOffset += fieldHeight + lineSpacing;
 } else if (theControlType == DCFormControlTypeTextArea) {
  var width = objj_msgSend(self, "frame").size.width - paddingLeft - labelWidth - columnSpacing - paddingRight;
  control = objj_msgSend(objj_msgSend(DCTextArea, "alloc"), "initWithFrame:", CGRectMake(paddingLeft + labelWidth + columnSpacing, currentYOffset, width, fieldHeight * 4));
  objj_msgSend(control, "setAutoresizingMask:", CPViewWidthSizable | CPViewMaxYMargin);
  objj_msgSend(self, "addSubview:", control);
  currentYOffset += (fieldHeight * 4) + lineSpacing;
 } else if (theControlType == DCFormControlTypeCheckBox) {
  var label = objj_msgSend(self, "labelWithTitle:originY:", theTitle, currentYOffset + 4);
  var width = objj_msgSend(self, "frame").size.width - paddingLeft - labelWidth - columnSpacing - paddingRight - 30;
  objj_msgSend(label, "setFrame:", CGRectMake(paddingLeft + labelWidth + columnSpacing + 30, objj_msgSend(label, "frame").origin.y - 10, width, objj_msgSend(label, "frame").size.height));
  objj_msgSend(label, "setAlignment:", CPLeftTextAlignment);
  currentYOffset += fieldHeight + lineSpacing - 10;
 } else if (theControlType == DCFormControlTypeHidden) {
  control = objj_msgSend(objj_msgSend(DCTextField, "alloc"), "initWithFrame:", CGRectMake(10, 10, 10, 10));
  objj_msgSend(control, "setDelegate:", self);
 }
 objj_msgSend(control, "setName:", name);
 objj_msgSend(control, "setRequired:", required);
 objj_msgSend(fields, "addObject:", control);
 if (objj_msgSend(control, "required")) {
  objj_msgSend(requiredLabel, "setHidden:", NO);
 }
 return control;
}
},["CPControl","CPString","CPString","CPString","bool"]), new objj_method(sel_getUid("setEnabled:"), function $DCFormView__setEnabled_(self, _cmd, yesNo)
{ with(self)
{
 enabled = yesNo;
 if (enabled == YES) {
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "setEnabled:", YES);
  }
  objj_msgSend(cancelButton, "setEnabled:", YES);
  objj_msgSend(cancelButton, "setAlphaValue:", 1);
  objj_msgSend(submitButton, "setEnabled:", YES);
  objj_msgSend(submitButton, "setTitle:", objj_msgSend(self, "submitButtonTitle"));
  objj_msgSend(submitButton, "setAlphaValue:", 1);
 } else {
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "respondsToSelector:", sel_getUid("setEnabled:"))) {
    objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "setEnabled:", NO);
   }
  }
  objj_msgSend(submitButton, "setEnabled:", NO);
  objj_msgSend(submitButton, "setTitle:", "Sending...");
  objj_msgSend(submitButton, "setAlphaValue:", 0.7);
 }
}
},["void","bool"]), new objj_method(sel_getUid("submitAction:"), function $DCFormView__submitAction_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(self, "setEnabled:", NO);
 var requiredError = NO;
 for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
  if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "required") && objj_msgSend(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "stringValue"), "isEqualToString:", "")) {
   requiredError = YES;
  }
 }
 if (requiredError) {
  alert("Please fill in all required fields.");
  objj_msgSend(self, "setEnabled:", YES);
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   if (objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "required") && objj_msgSend(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "stringValue"), "isEqualToString:", "")) {
    objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "becomeFirstResponder");
    return;
   }
  }
 } else {
  var body = "";
  for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
   body += "&"+ escape(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "name")) +"="+ escape(objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "stringValue"));
  }
  var uniqueCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:", "unique");
  body += "&unique="+ escape(objj_msgSend(uniqueCookie, "value"));
  if (objj_msgSend(submitURLString, "isEqualToString:", "") == NO) {
   var request = objj_msgSend(CPURLRequest, "requestWithURL:", submitURLString);
   objj_msgSend(request, "setHTTPMethod:", "POST");
   objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/x-www-form-urlencoded", "Content-Type");
   objj_msgSend(request, "setValue:forHTTPHeaderField:", objj_msgSend(body, "length"), "Content-Length");
   objj_msgSend(request, "setHTTPBody:", body);
   var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
  } else {
   CPConsoleLog("Invalid submitURLString: "+ submitURLString);
  }
 }
}
},["void","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $DCFormView__connection_didReceiveResponse_(self, _cmd, aConnection, response)
{ with(self)
{
}
},["void","CPURLConnection","CPHTTPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $DCFormView__connection_didReceiveData_(self, _cmd, aConnection, theData)
{ with(self)
{
 data = theData;
}
},["void","CPURLConnection","Object"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $DCFormView__connectionDidFinishLoading_(self, _cmd, aConnection)
{ with(self)
{
 objj_msgSend(submitButton, "setTitle:", "Done!");
 objj_msgSend(cancelButton, "setEnabled:", NO);
 objj_msgSend(cancelButton, "setAlphaValue:", 0.7);
 var message = NO;
 if (objj_msgSend(objj_msgSend(self, "thankYouMessage"), "isEqualToString:", "")) {
  objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 1, self, sel_getUid("clearAndClose"), nil, NO);
 } else {
  objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("thanks"), nil, NO);
 }
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $DCFormView__connection_didFailWithError_(self, _cmd, aConnection, error)
{ with(self)
{
 alert("Error sending form.  Please try again.");
 objj_msgSend(self, "setEnabled:", YES);
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("thanks"), function $DCFormView__thanks(self, _cmd)
{ with(self)
{
 alert(objj_msgSend(self, "thankYouMessage"));
 objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.1, self, sel_getUid("clearAndClose"), nil, NO);
}
},["void"]), new objj_method(sel_getUid("clearAndClose"), function $DCFormView__clearAndClose(self, _cmd)
{ with(self)
{
 for (var i = 0; i < objj_msgSend(fields, "count"); i++) {
  objj_msgSend(objj_msgSend(fields, "objectAtIndex:", i), "setStringValue:", "");
 }
 objj_msgSend(self, "setEnabled:", YES);
 objj_msgSend(delegate, "endForm");
}
},["void"]), new objj_method(sel_getUid("commitAction"), function $DCFormView__commitAction(self, _cmd)
{ with(self)
{
 objj_msgSend(self, "submitAction:", nil);
}
},["void"]), new objj_method(sel_getUid("thankYouMessage"), function $DCFormView__thankYouMessage(self, _cmd)
{ with(self)
{
 return "";
}
},["CPString"])]);
}

