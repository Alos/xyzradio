i;10;CPObject.ji;13;CPException.ji;18;CPSortDescriptor.ji;9;CPValue.jc;9348;
CPCaseInsensitiveSearch=1;
CPLiteralSearch=2;
CPBackwardsSearch=4;
CPAnchoredSearch=8;
CPNumericSearch=64;
var _1=new objj_dictionary();
var _2=["/",".","*","+","?","|","$","^","(",")","[","]","{","}","\\"],_3=new RegExp("(\\"+_2.join("|\\")+")","g");
var _4=objj_allocateClassPair(CPObject,"CPString"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithString:"),function(_6,_7,_8){
with(_6){
return String(_8);
}
}),new objj_method(sel_getUid("initWithFormat:"),function(_9,_a,_b){
with(_9){
if(!_b){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
_9=sprintf.apply(this,Array.prototype.slice.call(arguments,2));
return _9;
}
}),new objj_method(sel_getUid("description"),function(_c,_d){
with(_c){
return _c;
}
}),new objj_method(sel_getUid("length"),function(_e,_f){
with(_e){
return length;
}
}),new objj_method(sel_getUid("characterAtIndex:"),function(_10,_11,_12){
with(_10){
return charAt(_12);
}
}),new objj_method(sel_getUid("stringByAppendingFormat:"),function(_13,_14,_15){
with(_13){
if(!_15){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return _13+sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("stringByAppendingString:"),function(_16,_17,_18){
with(_16){
return _16+_18;
}
}),new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
if(length==_1b){
return _19;
}
if(_1b<length){
return substr(0,_1b);
}
var _1e=_19,_1f=_1c.substring(_1d),_20=_1b-length;
while((_20-=_1f.length)>=0){
_1e+=_1f;
}
if(-_20<_1f.length){
_1e+=_1f.substring(0,-_20);
}
return _1e;
}
}),new objj_method(sel_getUid("componentsSeparatedByString:"),function(_21,_22,_23){
with(_21){
return split(_23);
}
}),new objj_method(sel_getUid("substringFromIndex:"),function(_24,_25,_26){
with(_24){
return substr(_26);
}
}),new objj_method(sel_getUid("substringWithRange:"),function(_27,_28,_29){
with(_27){
return substr(_29.location,_29.length);
}
}),new objj_method(sel_getUid("substringToIndex:"),function(_2a,_2b,_2c){
with(_2a){
return substring(0,_2c);
}
}),new objj_method(sel_getUid("rangeOfString:"),function(_2d,_2e,_2f){
with(_2d){
return objj_msgSend(_2d,"rangeOfString:options:",_2f,0);
}
}),new objj_method(sel_getUid("rangeOfString:options:"),function(_30,_31,_32,_33){
with(_30){
return objj_msgSend(_30,"rangeOfString:options:range:",_32,_33,nil);
}
}),new objj_method(sel_getUid("rangeOfString:options:range:"),function(_34,_35,_36,_37,_38){
with(_34){
var _39=(_38==nil)?_34:objj_msgSend(_34,"substringWithRange:",_38),_3a=CPNotFound;
if(_37&CPCaseInsensitiveSearch){
_39=_39.toLowerCase();
_36=_36.toLowerCase();
}
if(_37&CPBackwardsSearch){
_3a=_39.lastIndexOf(_36,_37&CPAnchoredSearch?length-_36.length:0);
}else{
if(_37&CPAnchoredSearch){
_3a=_39.substr(0,_36.length).indexOf(_36)!=CPNotFound?0:CPNotFound;
}else{
_3a=_39.indexOf(_36);
}
}
return CPMakeRange(_3a,_3a==CPNotFound?0:_36.length);
}
}),new objj_method(sel_getUid("stringByEscapingRegexControlCharacters"),function(_3b,_3c){
with(_3b){
return _3b.replace(_3,"\\$1");
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"),function(_3d,_3e,_3f,_40){
with(_3d){
return _3d.replace(new RegExp(objj_msgSend(_3f,"stringByEscapingRegexControlCharacters"),"g"),_40);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"),function(_41,_42,_43,_44,_45,_46){
with(_41){
var _47=substring(0,_46.location),_48=substr(_46.location,_46.length),end=substring(_46.location+_46.length,_41.length),_43=objj_msgSend(_43,"stringByEscapingRegexControlCharacters"),_4a;
if(_45&CPCaseInsensitiveSearch){
_4a=new RegExp(_43,"gi");
}else{
_4a=new RegExp(_43,"g");
}
return _47+""+_48.replace(_4a,_44)+""+end;
}
}),new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"),function(_4b,_4c,_4d,_4e){
with(_4b){
return ""+substring(0,_4d.location)+_4e+substring(_4d.location+_4d.length,_4b.length);
}
}),new objj_method(sel_getUid("compare:"),function(_4f,_50,_51){
with(_4f){
return objj_msgSend(_4f,"compare:options:",_51,nil);
}
}),new objj_method(sel_getUid("caseInsensitiveCompare:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(_52,"compare:options:",_54,CPCaseInsensitiveSearch);
}
}),new objj_method(sel_getUid("compare:options:"),function(_55,_56,_57,_58){
with(_55){
var lhs=_55,rhs=_57;
if(_58&CPCaseInsensitiveSearch){
lhs=lhs.toLowerCase();
rhs=rhs.toLowerCase();
}
if(lhs<rhs){
return CPOrderedAscending;
}else{
if(lhs>rhs){
return CPOrderedDescending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("compare:options:range:"),function(_5b,_5c,_5d,_5e,_5f){
with(_5b){
var lhs=objj_msgSend(_5b,"substringWithRange:",_5f),rhs=_5d;
return objj_msgSend(lhs,"compare:options:",rhs,_5e);
}
}),new objj_method(sel_getUid("hasPrefix:"),function(_62,_63,_64){
with(_62){
return _64&&_64!=""&&indexOf(_64)==0;
}
}),new objj_method(sel_getUid("hasSuffix:"),function(_65,_66,_67){
with(_65){
return _67&&_67!=""&&lastIndexOf(_67)==(length-_67.length);
}
}),new objj_method(sel_getUid("isEqualToString:"),function(_68,_69,_6a){
with(_68){
return _68==_6a;
}
}),new objj_method(sel_getUid("UID"),function(_6b,_6c){
with(_6b){
var _6d=dictionary_getValue(_1,_6b);
if(!_6d){
_6d=_objj_generateObjectHash();
dictionary_setValue(_1,_6b,_6d);
}
return _6d;
}
}),new objj_method(sel_getUid("capitalizedString"),function(_6e,_6f){
with(_6e){
var _70=_6e.split(/\b/g);
for(var i=0;i<_70.length;i++){
if(i==0||(/\s$/).test(_70[i-1])){
_70[i]=_70[i].substring(0,1).toUpperCase()+_70[i].substring(1).toLowerCase();
}else{
_70[i]=_70[i].toLowerCase();
}
}
return _70.join("");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_72,_73){
with(_72){
return toLowerCase();
}
}),new objj_method(sel_getUid("uppercaseString"),function(_74,_75){
with(_74){
return toUpperCase();
}
}),new objj_method(sel_getUid("doubleValue"),function(_76,_77){
with(_76){
return parseFloat(_76,10);
}
}),new objj_method(sel_getUid("boolValue"),function(_78,_79){
with(_78){
var _7a=new RegExp("^\\s*[\\+,\\-]*0*");
return RegExp("^[Y,y,t,T,1-9]").test(_78.replace(_7a,""));
}
}),new objj_method(sel_getUid("floatValue"),function(_7b,_7c){
with(_7b){
return parseFloat(_7b,10);
}
}),new objj_method(sel_getUid("intValue"),function(_7d,_7e){
with(_7d){
return parseInt(_7d,10);
}
}),new objj_method(sel_getUid("pathComponents"),function(_7f,_80){
with(_7f){
var _81=split("/");
if(_81[0]===""){
_81[0]="/";
}
if(_81[_81.length-1]===""){
_81.pop();
}
return _81;
}
}),new objj_method(sel_getUid("pathExtension"),function(_82,_83){
with(_82){
return substr(lastIndexOf(".")+1);
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_84,_85){
with(_84){
var _86=objj_msgSend(_84,"pathComponents");
return _86[_86.length-1];
}
}),new objj_method(sel_getUid("stringByDeletingLastPathComponent"),function(_87,_88){
with(_87){
var _89=_87,_8a=length-1;
while(_89.charAt(_8a)==="/"){
_8a--;
}
_89=_89.substr(0,_89.lastIndexOf("/",_8a));
if(_89===""&&charAt(0)==="/"){
return "/";
}
return _89;
}
}),new objj_method(sel_getUid("stringByStandardizingPath"),function(_8b,_8c){
with(_8b){
return objj_standardize_path(_8b);
}
}),new objj_method(sel_getUid("copy"),function(_8d,_8e){
with(_8d){
return new String(_8d);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("alloc"),function(_8f,_90){
with(_8f){
return new String;
}
}),new objj_method(sel_getUid("string"),function(_91,_92){
with(_91){
return objj_msgSend(objj_msgSend(_91,"alloc"),"init");
}
}),new objj_method(sel_getUid("stringWithHash:"),function(_93,_94,_95){
with(_93){
var _96=parseInt(_95,10).toString(16);
return "000000".substring(0,MAX(6-_96.length,0))+_96;
}
}),new objj_method(sel_getUid("stringWithString:"),function(_97,_98,_99){
with(_97){
if(!_99){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"stringWithString: the string can't be 'nil'");
}
return objj_msgSend(objj_msgSend(_97,"alloc"),"initWithString:",_99);
}
}),new objj_method(sel_getUid("stringWithFormat:"),function(_9a,_9b,_9c){
with(_9a){
if(!_9c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
})]);
var _4=objj_getClass("CPString");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("objectFromJSON"),function(_9d,_9e){
with(_9d){
return JSON.parse(_9d);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("JSONFromObject:"),function(_9f,_a0,_a1){
with(_9f){
return JSON.stringify(_a1);
}
})]);
var _4=objj_getClass("CPString");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _5=_4.isa;
class_addMethods(_5,[new objj_method(sel_getUid("UUID"),function(_a2,_a3){
with(_a2){
var g="";
for(var i=0;i<32;i++){
g+=FLOOR(RAND()*15).toString(15);
}
return g;
}
})]);
String.prototype.isa=CPString;
