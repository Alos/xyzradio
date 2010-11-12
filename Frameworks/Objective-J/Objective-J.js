var ObjectiveJ={};
(function(_1,_2){
if(!this.JSON){
JSON={};
}
(function(){
function f(n){
return n<10?"0"+n:n;
};
if(typeof Date.prototype.toJSON!=="function"){
Date.prototype.toJSON=function(_3){
return this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z";
};
String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(_4){
return this.valueOf();
};
}
var cx=new RegExp("[\\u0000\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]","g");
var _5=new RegExp("[\\\\\\\"\\x00-\\x1f\\x7f-\\x9f\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]","g");
var _6,_7,_8={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"},_9;
function _a(_b){
_5.lastIndex=0;
return _5.test(_b)?"\""+_b.replace(_5,function(a){
var c=_8[a];
return typeof c==="string"?c:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
})+"\"":"\""+_b+"\"";
};
function _c(_d,_e){
var i,k,v,_f,_10=_6,_11,_12=_e[_d];
if(_12&&typeof _12==="object"&&typeof _12.toJSON==="function"){
_12=_12.toJSON(_d);
}
if(typeof _9==="function"){
_12=_9.call(_e,_d,_12);
}
switch(typeof _12){
case "string":
return _a(_12);
case "number":
return isFinite(_12)?String(_12):"null";
case "boolean":
case "null":
return String(_12);
case "object":
if(!_12){
return "null";
}
_6+=_7;
_11=[];
if(Object.prototype.toString.apply(_12)==="[object Array]"){
_f=_12.length;
for(i=0;i<_f;i+=1){
_11[i]=_c(i,_12)||"null";
}
v=_11.length===0?"[]":_6?"[\n"+_6+_11.join(",\n"+_6)+"\n"+_10+"]":"["+_11.join(",")+"]";
_6=_10;
return v;
}
if(_9&&typeof _9==="object"){
_f=_9.length;
for(i=0;i<_f;i+=1){
k=_9[i];
if(typeof k==="string"){
v=_c(k,_12);
if(v){
_11.push(_a(k)+(_6?": ":":")+v);
}
}
}
}else{
for(k in _12){
if(Object.hasOwnProperty.call(_12,k)){
v=_c(k,_12);
if(v){
_11.push(_a(k)+(_6?": ":":")+v);
}
}
}
}
v=_11.length===0?"{}":_6?"{\n"+_6+_11.join(",\n"+_6)+"\n"+_10+"}":"{"+_11.join(",")+"}";
_6=_10;
return v;
}
};
if(typeof JSON.stringify!=="function"){
JSON.stringify=function(_13,_14,_15){
var i;
_6="";
_7="";
if(typeof _15==="number"){
for(i=0;i<_15;i+=1){
_7+=" ";
}
}else{
if(typeof _15==="string"){
_7=_15;
}
}
_9=_14;
if(_14&&typeof _14!=="function"&&(typeof _14!=="object"||typeof _14.length!=="number")){
throw new Error("JSON.stringify");
}
return _c("",{"":_13});
};
}
if(typeof JSON.parse!=="function"){
JSON.parse=function(_16,_17){
var j;
function _18(_19,key){
var k,v,_1a=_19[key];
if(_1a&&typeof _1a==="object"){
for(k in _1a){
if(Object.hasOwnProperty.call(_1a,k)){
v=_18(_1a,k);
if(v!==_29){
_1a[k]=v;
}else{
delete _1a[k];
}
}
}
}
return _17.call(_19,key,_1a);
};
cx.lastIndex=0;
if(cx.test(_16)){
_16=_16.replace(cx,function(a){
return "\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
});
}
if(/^[\],:{}\s]*$/.test(_16.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){
j=eval("("+_16+")");
return typeof _17==="function"?_18({"":j},""):j;
}
throw new SyntaxError("JSON.parse");
};
}
}());
var _1b=new RegExp("([^%]+|%(?:\\d+\\$)?[\\+\\-\\ \\#0]*[0-9\\*]*(.[0-9\\*]+)?[hlL]?[cbBdieEfgGosuxXpn%@])","g");
var _1c=new RegExp("(%)(?:(\\d+)\\$)?([\\+\\-\\ \\#0]*)([0-9\\*]*)((?:.[0-9\\*]+)?)([hlL]?)([cbBdieEfgGosuxXpn%@])");
_2.sprintf=function(_1d){
var _1d=arguments[0],_1e=_1d.match(_1b),_1f=0,_20="",arg=1;
for(var i=0;i<_1e.length;i++){
var t=_1e[i];
if(_1d.substring(_1f,_1f+t.length)!=t){
return _20;
}
_1f+=t.length;
if(t.charAt(0)!="%"){
_20+=t;
}else{
var _21=t.match(_1c);
if(_21.length!=8||_21[0]!=t){
return _20;
}
var _22=_21[1],_23=_21[2],_24=_21[3],_25=_21[4],_26=_21[5],_27=_21[6],_28=_21[7];
if(_23===_29||_23===null||_23===""){
_23=arg++;
}else{
_23=Number(_23);
}
var _2a=null;
if(_25=="*"){
_2a=arguments[_23];
}else{
if(_25!=""){
_2a=Number(_25);
}
}
var _2b=null;
if(_26==".*"){
_2b=arguments[_23];
}else{
if(_26!=""){
_2b=Number(_26.substring(1));
}
}
var _2c=(_24.indexOf("-")>=0);
var _2d=(_24.indexOf("0")>=0);
var _2e="";
if(RegExp("[bBdiufeExXo]").test(_28)){
var num=Number(arguments[_23]);
var _2f="";
if(num<0){
_2f="-";
}else{
if(_24.indexOf("+")>=0){
_2f="+";
}else{
if(_24.indexOf(" ")>=0){
_2f=" ";
}
}
}
if(_28=="d"||_28=="i"||_28=="u"){
var _30=String(Math.abs(Math.floor(num)));
_2e=_31(_2f,"",_30,"",_2a,_2c,_2d);
}
if(_28=="f"){
var _30=String((_2b!=null)?Math.abs(num).toFixed(_2b):Math.abs(num));
var _32=(_24.indexOf("#")>=0&&_30.indexOf(".")<0)?".":"";
_2e=_31(_2f,"",_30,_32,_2a,_2c,_2d);
}
if(_28=="e"||_28=="E"){
var _30=String(Math.abs(num).toExponential(_2b!=null?_2b:21));
var _32=(_24.indexOf("#")>=0&&_30.indexOf(".")<0)?".":"";
_2e=_31(_2f,"",_30,_32,_2a,_2c,_2d);
}
if(_28=="x"||_28=="X"){
var _30=String(Math.abs(num).toString(16));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0x":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(_28=="b"||_28=="B"){
var _30=String(Math.abs(num).toString(2));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0b":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(_28=="o"){
var _30=String(Math.abs(num).toString(8));
var _33=(_24.indexOf("#")>=0&&num!=0)?"0":"";
_2e=_31(_2f,_33,_30,"",_2a,_2c,_2d);
}
if(RegExp("[A-Z]").test(_28)){
_2e=_2e.toUpperCase();
}else{
_2e=_2e.toLowerCase();
}
}else{
var _2e="";
if(_28=="%"){
_2e="%";
}else{
if(_28=="c"){
_2e=String(arguments[_23]).charAt(0);
}else{
if(_28=="s"||_28=="@"){
_2e=String(arguments[_23]);
}else{
if(_28=="p"||_28=="n"){
_2e="";
}
}
}
}
_2e=_31("","",_2e,"",_2a,_2c,false);
}
_20+=_2e;
}
}
return _20;
};
function _31(_34,_35,_36,_37,_38,_39,_3a){
var _3b=(_34.length+_35.length+_36.length+_37.length);
if(_39){
return _34+_35+_36+_37+pad(_38-_3b," ");
}else{
if(_3a){
return _34+_35+pad(_38-_3b,"0")+_36+_37;
}else{
return pad(_38-_3b," ")+_34+_35+_36+_37;
}
}
};
function pad(n,ch){
return Array(MAX(0,n)+1).join(ch);
};
CPLogDisable=false;
var _3c="Cappuccino";
var _3d=["fatal","error","warn","info","debug","trace"];
var _3e=_3d[3];
var _3f={};
for(var i=0;i<_3d.length;i++){
_3f[_3d[i]]=i;
}
var _40={};
CPLogRegister=function(_41,_42,_43){
CPLogRegisterRange(_41,_3d[0],_42||_3d[_3d.length-1],_43);
};
CPLogRegisterRange=function(_44,_45,_46,_47){
var min=_3f[_45];
var max=_3f[_46];
if(min!==_29&&max!==_29&&min<=max){
for(var i=min;i<=max;i++){
CPLogRegisterSingle(_44,_3d[i],_47);
}
}
};
CPLogRegisterSingle=function(_48,_49,_4a){
if(!_40[_49]){
_40[_49]=[];
}
for(var i=0;i<_40[_49].length;i++){
if(_40[_49][i][0]===_48){
_40[_49][i][1]=_4a;
return;
}
}
_40[_49].push([_48,_4a]);
};
CPLogUnregister=function(_4b){
for(var _4c in _40){
for(var i=0;i<_40[_4c].length;i++){
if(_40[_4c][i][0]===_4b){
_40[_4c].splice(i--,1);
}
}
}
};
function _4d(_4e,_4f,_50){
if(_50==_29){
_50=_3c;
}
if(_4f==_29){
_4f=_3e;
}
var _51=(typeof _4e[0]=="string"&&_4e.length>1)?_2.sprintf.apply(null,_4e):String(_4e[0]);
if(_40[_4f]){
for(var i=0;i<_40[_4f].length;i++){
var _52=_40[_4f][i];
_52[0](_51,_4f,_50,_52[1]);
}
}
};
CPLog=function(){
_4d(arguments);
};
for(var i=0;i<_3d.length;i++){
CPLog[_3d[i]]=(function(_53){
return function(){
_4d(arguments,_53);
};
})(_3d[i]);
}
var _54=function(_55,_56,_57){
var now=new Date();
_56=(_56==null?"":" ["+CPLogColorize(_56,_56)+"]");
if(typeof _2.sprintf=="function"){
return _2.sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s: %s",now.getFullYear(),now.getMonth()+1,now.getDate(),now.getHours(),now.getMinutes(),now.getSeconds(),now.getMilliseconds(),_57,_56,_55);
}else{
return now+" "+_57+_56+": "+_55;
}
};
CPLogConsole=function(_58,_59,_5a,_5b){
if(typeof console!="undefined"){
var _5c=(_5b||_54)(_58,_59,_5a);
var _5d={"fatal":"error","error":"error","warn":"warn","info":"info","debug":"debug","trace":"debug"}[_59];
if(_5d&&console[_5d]){
console[_5d](_5c);
}else{
if(console.log){
console.log(_5c);
}
}
}
};
CPLogColorize=function(_5e,_5f){
return _5e;
};
CPLogAlert=function(_60,_61,_62,_63){
if(typeof alert!="undefined"&&!CPLogDisable){
var _64=(_63||_54)(_60,_61,_62);
CPLogDisable=!confirm(_64+"\n\n(Click cancel to stop log alerts)");
}
};
var _65=null;
CPLogPopup=function(_66,_67,_68,_69){
try{
if(CPLogDisable||window.open==_29){
return;
}
if(!_65||!_65.document){
_65=window.open("","_blank","width=600,height=400,status=no,resizable=yes,scrollbars=yes");
if(!_65){
CPLogDisable=!confirm(_66+"\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
return;
}
_6a(_65);
}
var _6b=_65.document.createElement("div");
_6b.setAttribute("class",_67||"fatal");
var _6c=(_69||_54)(_66,_69?_67:null,_68);
_6b.appendChild(_65.document.createTextNode(_6c));
_65.log.appendChild(_6b);
if(_65.focusEnabled.checked){
_65.focus();
}
if(_65.blockEnabled.checked){
_65.blockEnabled.checked=_65.confirm(_6c+"\nContinue blocking?");
}
if(_65.scrollEnabled.checked){
_65.scrollToBottom();
}
}
catch(e){
}
};
var _6d="<style type=\"text/css\" media=\"screen\"> body{font:10px Monaco,Courier,\"Courier New\",monospace,mono;padding-top:15px;} div > .fatal,div > .error,div > .warn,div > .info,div > .debug,div > .trace{display:none;overflow:hidden;white-space:pre;padding:0px 5px 0px 5px;margin-top:2px;-moz-border-radius:5px;-webkit-border-radius:5px;} div[wrap=\"yes\"] > div{white-space:normal;} .fatal{background-color:#ffb2b3;} .error{background-color:#ffe2b2;} .warn{background-color:#fdffb2;} .info{background-color:#e4ffb2;} .debug{background-color:#a0e5a0;} .trace{background-color:#99b9ff;} .enfatal .fatal,.enerror .error,.enwarn .warn,.eninfo .info,.endebug .debug,.entrace .trace{display:block;} div#header{background-color:rgba(240,240,240,0.82);position:fixed;top:0px;left:0px;width:100%;border-bottom:1px solid rgba(0,0,0,0.33);text-align:center;} ul#enablers{display:inline-block;margin:1px 15px 0 15px;padding:2px 0 2px 0;} ul#enablers li{display:inline;padding:0px 5px 0px 5px;margin-left:4px;-moz-border-radius:5px;-webkit-border-radius:5px;} [enabled=\"no\"]{opacity:0.25;} ul#options{display:inline-block;margin:0 15px 0px 15px;padding:0 0px;} ul#options li{margin:0 0 0 0;padding:0 0 0 0;display:inline;} </style>";
function _6a(_6e){
var doc=_6e.document;
doc.writeln("<html><head><title></title>"+_6d+"</head><body></body></html>");
doc.title=_3c+" Run Log";
var _6f=doc.getElementsByTagName("head")[0];
var _70=doc.getElementsByTagName("body")[0];
var _71=window.location.protocol+"//"+window.location.host+window.location.pathname;
_71=_71.substring(0,_71.lastIndexOf("/")+1);
var div=doc.createElement("div");
div.setAttribute("id","header");
_70.appendChild(div);
var ul=doc.createElement("ul");
ul.setAttribute("id","enablers");
div.appendChild(ul);
for(var i=0;i<_3d.length;i++){
var li=doc.createElement("li");
li.setAttribute("id","en"+_3d[i]);
li.setAttribute("class",_3d[i]);
li.setAttribute("onclick","toggle(this);");
li.setAttribute("enabled","yes");
li.appendChild(doc.createTextNode(_3d[i]));
ul.appendChild(li);
}
var ul=doc.createElement("ul");
ul.setAttribute("id","options");
div.appendChild(ul);
var _72={"focus":["Focus",false],"block":["Block",false],"wrap":["Wrap",false],"scroll":["Scroll",true],"close":["Close",true]};
for(o in _72){
var li=doc.createElement("li");
ul.appendChild(li);
_6e[o+"Enabled"]=doc.createElement("input");
_6e[o+"Enabled"].setAttribute("id",o);
_6e[o+"Enabled"].setAttribute("type","checkbox");
if(_72[o][1]){
_6e[o+"Enabled"].setAttribute("checked","checked");
}
li.appendChild(_6e[o+"Enabled"]);
var _73=doc.createElement("label");
_73.setAttribute("for",o);
_73.appendChild(doc.createTextNode(_72[o][0]));
li.appendChild(_73);
}
_6e.log=doc.createElement("div");
_6e.log.setAttribute("class","enerror endebug enwarn eninfo enfatal entrace");
_70.appendChild(_6e.log);
_6e.toggle=function(_74){
var _75=(_74.getAttribute("enabled")=="yes")?"no":"yes";
_74.setAttribute("enabled",_75);
if(_75=="yes"){
_6e.log.className+=" "+_74.id;
}else{
_6e.log.className=_6e.log.className.replace(new RegExp("[\\s]*"+_74.id,"g"),"");
}
};
_6e.scrollToBottom=function(){
_6e.scrollTo(0,_70.offsetHeight);
};
_6e.wrapEnabled.addEventListener("click",function(){
_6e.log.setAttribute("wrap",_6e.wrapEnabled.checked?"yes":"no");
},false);
_6e.addEventListener("keydown",function(e){
var e=e||_6e.event;
if(e.keyCode==75&&(e.ctrlKey||e.metaKey)){
while(_6e.log.firstChild){
_6e.log.removeChild(_6e.log.firstChild);
}
e.preventDefault();
}
},"false");
window.addEventListener("unload",function(){
if(_6e&&_6e.closeEnabled&&_6e.closeEnabled.checked){
CPLogDisable=true;
_6e.close();
}
},false);
_6e.addEventListener("unload",function(){
if(!CPLogDisable){
CPLogDisable=!confirm("Click cancel to stop logging");
}
},false);
};
CPLogDefault=(typeof window==="object"&&window.console)?CPLogConsole:CPLogPopup;
var _29;
if(typeof window!=="undefined"){
window.setNativeTimeout=window.setTimeout;
window.clearNativeTimeout=window.clearTimeout;
window.setNativeInterval=window.setInterval;
window.clearNativeInterval=window.clearInterval;
}
NO=false;
YES=true;
nil=null;
Nil=null;
NULL=null;
ABS=Math.abs;
ASIN=Math.asin;
ACOS=Math.acos;
ATAN=Math.atan;
ATAN2=Math.atan2;
SIN=Math.sin;
COS=Math.cos;
TAN=Math.tan;
EXP=Math.exp;
POW=Math.pow;
CEIL=Math.ceil;
FLOOR=Math.floor;
ROUND=Math.round;
MIN=Math.min;
MAX=Math.max;
RAND=Math.random;
SQRT=Math.sqrt;
E=Math.E;
LN2=Math.LN2;
LN10=Math.LN10;
LOG2E=Math.LOG2E;
LOG10E=Math.LOG10E;
PI=Math.PI;
PI2=Math.PI*2;
PI_2=Math.PI/2;
SQRT1_2=Math.SQRT1_2;
SQRT2=Math.SQRT2;
function _76(_77){
this._eventListenersForEventNames={};
this._owner=_77;
};
_76.prototype.addEventListener=function(_78,_79){
var _7a=this._eventListenersForEventNames;
if(!_7b.call(_7a,_78)){
var _7c=[];
_7a[_78]=_7c;
}else{
var _7c=_7a[_78];
}
var _7d=_7c.length;
while(_7d--){
if(_7c[_7d]===_79){
return;
}
}
_7c.push(_79);
};
_76.prototype.removeEventListener=function(_7e,_7f){
var _80=this._eventListenersForEventNames;
if(!_7b.call(_80,_7e)){
return;
}
var _81=_80[_7e],_82=_81.length;
while(_82--){
if(_81[_82]===_7f){
return _81.splice(_82,1);
}
}
};
_76.prototype.dispatchEvent=function(_83){
var _84=_83.type,_85=this._eventListenersForEventNames;
if(_7b.call(_85,_84)){
var _86=this._eventListenersForEventNames[_84],_87=0,_88=_86.length;
for(;_87<_88;++_87){
_86[_87](_83);
}
}
var _89=(this._owner||this)["on"+_84];
if(_89){
_89(_83);
}
};
var _8a=0,_8b=null,_8c=[];
function _8d(_8e){
var _8f=_8a;
if(_8b===null){
window.setNativeTimeout(function(){
var _90=_8c,_91=0,_92=_8c.length;
++_8a;
_8b=null;
_8c=[];
for(;_91<_92;++_91){
_90[_91]();
}
},0);
}
return function(){
var _93=arguments;
if(_8a>_8f){
_8e.apply(this,_93);
}else{
_8c.push(function(){
_8e.apply(this,_93);
});
}
};
};
var _94=null;
if(window.ActiveXObject!==_29){
var _95=["Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP.6.0"],_96=_95.length;
while(_96--){
try{
var _97=_95[_96];
new ActiveXObject(_97);
_94=function(){
return new ActiveXObject(_97);
};
break;
}
catch(anException){
}
}
}
if(!_94){
_94=window.XMLHttpRequest;
}
CFHTTPRequest=function(){
this._isOpen=false;
this._requestHeaders={};
this._mimeType=null;
this._eventDispatcher=new _76(this);
this._nativeRequest=new _94();
var _98=this;
this._stateChangeHandler=function(){
_ab(_98);
};
this._nativeRequest.onreadystatechange=this._stateChangeHandler;
if(CFHTTPRequest.AuthenticationDelegate!==nil){
this._eventDispatcher.addEventListener("HTTP403",function(){
CFHTTPRequest.AuthenticationDelegate(_98);
});
}
};
CFHTTPRequest.UninitializedState=0;
CFHTTPRequest.LoadingState=1;
CFHTTPRequest.LoadedState=2;
CFHTTPRequest.InteractiveState=3;
CFHTTPRequest.CompleteState=4;
CFHTTPRequest.AuthenticationDelegate=nil;
CFHTTPRequest.prototype.status=function(){
try{
return this._nativeRequest.status||0;
}
catch(anException){
return 0;
}
};
CFHTTPRequest.prototype.statusText=function(){
try{
return this._nativeRequest.statusText||"";
}
catch(anException){
return "";
}
};
CFHTTPRequest.prototype.readyState=function(){
return this._nativeRequest.readyState;
};
CFHTTPRequest.prototype.success=function(){
var _99=this.status();
if(_99>=200&&_99<300){
return YES;
}
return _99===0&&this.responseText()&&this.responseText().length;
};
CFHTTPRequest.prototype.responseXML=function(){
var _9a=this._nativeRequest.responseXML;
if(_9a&&(_94===window.XMLHttpRequest)){
return _9a;
}
return _9b(this.responseText());
};
CFHTTPRequest.prototype.responsePropertyList=function(){
var _9c=this.responseText();
if(CFPropertyList.sniffedFormatOfString(_9c)===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(this.responseXML());
}
return CFPropertyList.propertyListFromString(_9c);
};
CFHTTPRequest.prototype.responseText=function(){
return this._nativeRequest.responseText;
};
CFHTTPRequest.prototype.setRequestHeader=function(_9d,_9e){
this._requestHeaders[_9d]=_9e;
};
CFHTTPRequest.prototype.getResponseHeader=function(_9f){
return this._nativeRequest.getResponseHeader(_9f);
};
CFHTTPRequest.prototype.getAllResponseHeaders=function(){
return this._nativeRequest.getAllResponseHeaders();
};
CFHTTPRequest.prototype.overrideMimeType=function(_a0){
this._mimeType=_a0;
};
CFHTTPRequest.prototype.open=function(_a1,_a2,_a3,_a4,_a5){
this._isOpen=true;
this._URL=_a2;
this._async=_a3;
this._method=_a1;
this._user=_a4;
this._password=_a5;
return this._nativeRequest.open(_a1,_a2,_a3,_a4,_a5);
};
CFHTTPRequest.prototype.send=function(_a6){
if(!this._isOpen){
delete this._nativeRequest.onreadystatechange;
this._nativeRequest.open(this._method,this._URL,this._async,this._user,this._password);
this._nativeRequest.onreadystatechange=this._stateChangeHandler;
}
for(var i in this._requestHeaders){
if(this._requestHeaders.hasOwnProperty(i)){
this._nativeRequest.setRequestHeader(i,this._requestHeaders[i]);
}
}
if(this._mimeType&&"overrideMimeType" in this._nativeRequest){
this._nativeRequest.overrideMimeType(this._mimeType);
}
this._isOpen=false;
try{
return this._nativeRequest.send(_a6);
}
catch(anException){
this._eventDispatcher.dispatchEvent({type:"failure",request:this});
}
};
CFHTTPRequest.prototype.abort=function(){
this._isOpen=false;
return this._nativeRequest.abort();
};
CFHTTPRequest.prototype.addEventListener=function(_a7,_a8){
this._eventDispatcher.addEventListener(_a7,_a8);
};
CFHTTPRequest.prototype.removeEventListener=function(_a9,_aa){
this._eventDispatcher.removeEventListener(_a9,_aa);
};
function _ab(_ac){
var _ad=_ac._eventDispatcher;
_ad.dispatchEvent({type:"readystatechange",request:_ac});
var _ae=_ac._nativeRequest,_af=["uninitialized","loading","loaded","interactive","complete"];
if(_af[_ac.readyState()]==="complete"){
var _b0="HTTP"+_ac.status();
_ad.dispatchEvent({type:_b0,request:_ac});
var _b1=_ac.success()?"success":"failure";
_ad.dispatchEvent({type:_b1,request:_ac});
_ad.dispatchEvent({type:_af[_ac.readyState()],request:_ac});
}else{
_ad.dispatchEvent({type:_af[_ac.readyState()],request:_ac});
}
};
function _b2(_b3,_b4,_b5){
var _b6=new CFHTTPRequest();
if(_b3.pathExtension()==="plist"){
_b6.overrideMimeType("text/xml");
}
if(_2.asyncLoader){
_b6.onsuccess=_8d(_b4);
_b6.onfailure=_8d(_b5);
}else{
_b6.onsuccess=_b4;
_b6.onfailure=_b5;
}
_b6.open("GET",_b3.absoluteString(),_2.asyncLoader);
_b6.send("");
};
_2.asyncLoader=YES;
_2.Asynchronous=_8d;
_2.determineAndDispatchHTTPRequestEvents=_ab;
var _b7=0;
objj_generateObjectUID=function(){
return _b7++;
};
CFPropertyList=function(){
this._UID=objj_generateObjectUID();
};
CFPropertyList.DTDRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?/i;
CFPropertyList.XMLRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?<\s*plist[^>]*\>/i;
CFPropertyList.FormatXMLDTD="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">";
CFPropertyList.Format280NorthMagicNumber="280NPLIST";
CFPropertyList.FormatOpenStep=1,CFPropertyList.FormatXML_v1_0=100,CFPropertyList.FormatBinary_v1_0=200,CFPropertyList.Format280North_v1_0=-1000;
CFPropertyList.sniffedFormatOfString=function(_b8){
if(_b8.match(CFPropertyList.XMLRE)){
return CFPropertyList.FormatXML_v1_0;
}
if(_b8.substr(0,CFPropertyList.Format280NorthMagicNumber.length)===CFPropertyList.Format280NorthMagicNumber){
return CFPropertyList.Format280North_v1_0;
}
return NULL;
};
CFPropertyList.dataFromPropertyList=function(_b9,_ba){
var _bb=new CFMutableData();
_bb.setRawString(CFPropertyList.stringFromPropertyList(_b9,_ba));
return _bb;
};
CFPropertyList.stringFromPropertyList=function(_bc,_bd){
if(!_bd){
_bd=CFPropertyList.Format280North_v1_0;
}
var _be=_bf[_bd];
return _be["start"]()+_c0(_bc,_be)+_be["finish"]();
};
function _c0(_c1,_c2){
var _c3=typeof _c1,_c4=_c1.valueOf(),_c5=typeof _c4;
if(_c3!==_c5){
_c3=_c5;
_c1=_c4;
}
if(_c1===YES||_c1===NO){
_c3="boolean";
}else{
if(_c3==="number"){
if(FLOOR(_c1)===_c1){
_c3="integer";
}else{
_c3="real";
}
}else{
if(_c3!=="string"){
if(_c1.slice){
_c3="array";
}else{
_c3="dictionary";
}
}
}
}
return _c2[_c3](_c1,_c2);
};
var _bf={};
_bf[CFPropertyList.FormatXML_v1_0]={"start":function(){
return CFPropertyList.FormatXMLDTD+"<plist version = \"1.0\">";
},"finish":function(){
return "</plist>";
},"string":function(_c6){
return "<string>"+_c7(_c6)+"</string>";
},"boolean":function(_c8){
return _c8?"<true/>":"<false/>";
},"integer":function(_c9){
return "<integer>"+_c9+"</integer>";
},"real":function(_ca){
return "<real>"+_ca+"</real>";
},"array":function(_cb,_cc){
var _cd=0,_ce=_cb.length,_cf="<array>";
for(;_cd<_ce;++_cd){
_cf+=_c0(_cb[_cd],_cc);
}
return _cf+"</array>";
},"dictionary":function(_d0,_d1){
var _d2=_d0._keys,_96=0,_d3=_d2.length,_d4="<dict>";
for(;_96<_d3;++_96){
var key=_d2[_96];
_d4+="<key>"+key+"</key>";
_d4+=_c0(_d0.valueForKey(key),_d1);
}
return _d4+"</dict>";
}};
var _d5="A",_d6="D",_d7="f",_d8="d",_d9="S",_da="T",_db="F",_dc="K",_dd="E";
_bf[CFPropertyList.Format280North_v1_0]={"start":function(){
return CFPropertyList.Format280NorthMagicNumber+";1.0;";
},"finish":function(){
return "";
},"string":function(_de){
return _d9+";"+_de.length+";"+_de;
},"boolean":function(_df){
return (_df?_da:_db)+";";
},"integer":function(_e0){
var _e1=""+_e0;
return _d8+";"+_e1.length+";"+_e1;
},"real":function(_e2){
var _e3=""+_e2;
return _d7+";"+_e3.length+";"+_e3;
},"array":function(_e4,_e5){
var _e6=0,_e7=_e4.length,_e8=_d5+";";
for(;_e6<_e7;++_e6){
_e8+=_c0(_e4[_e6],_e5);
}
return _e8+_dd+";";
},"dictionary":function(_e9,_ea){
var _eb=_e9._keys,_96=0,_ec=_eb.length,_ed=_d6+";";
for(;_96<_ec;++_96){
var key=_eb[_96];
_ed+=_dc+";"+key.length+";"+key;
_ed+=_c0(_e9.valueForKey(key),_ea);
}
return _ed+_dd+";";
}};
var _ee="xml",_ef="#document",_f0="plist",_f1="key",_f2="dict",_f3="array",_f4="string",_f5="true",_f6="false",_f7="real",_f8="integer",_f9="data";
var _fa=function(_fb,_fc,_fd){
var _fe=_fb;
_fe=(_fe.firstChild);
if(_fe!==NULL&&((_fe.nodeType)===8||(_fe.nodeType)===3)){
while((_fe=(_fe.nextSibling))&&((_fe.nodeType)===8||(_fe.nodeType)===3)){
}
}
if(_fe){
return _fe;
}
if((String(_fb.nodeName))===_f3||(String(_fb.nodeName))===_f2){
_fd.pop();
}else{
if(_fe===_fc){
return NULL;
}
_fe=_fb;
while((_fe=(_fe.nextSibling))&&((_fe.nodeType)===8||(_fe.nodeType)===3)){
}
if(_fe){
return _fe;
}
}
_fe=_fb;
while(_fe){
var _ff=_fe;
while((_ff=(_ff.nextSibling))&&((_ff.nodeType)===8||(_ff.nodeType)===3)){
}
if(_ff){
return _ff;
}
var _fe=(_fe.parentNode);
if(_fc&&_fe===_fc){
return NULL;
}
_fd.pop();
}
return NULL;
};
CFPropertyList.propertyListFromData=function(_100,_101){
return CFPropertyList.propertyListFromString(_100.rawString(),_101);
};
CFPropertyList.propertyListFromString=function(_102,_103){
if(!_103){
_103=CFPropertyList.sniffedFormatOfString(_102);
}
if(_103===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(_102);
}
if(_103===CFPropertyList.Format280North_v1_0){
return _104(_102);
}
return NULL;
};
var _d5="A",_d6="D",_d7="f",_d8="d",_d9="S",_da="T",_db="F",_dc="K",_dd="E";
function _104(_105){
var _106=new _107(_105),_108=NULL,key="",_109=NULL,_10a=NULL,_10b=[],_10c=NULL;
while(_108=_106.getMarker()){
if(_108===_dd){
_10b.pop();
continue;
}
var _10d=_10b.length;
if(_10d){
_10c=_10b[_10d-1];
}
if(_108===_dc){
key=_106.getString();
_108=_106.getMarker();
}
switch(_108){
case _d5:
_109=[];
_10b.push(_109);
break;
case _d6:
_109=new CFMutableDictionary();
_10b.push(_109);
break;
case _d7:
_109=parseFloat(_106.getString());
break;
case _d8:
_109=parseInt(_106.getString(),10);
break;
case _d9:
_109=_106.getString();
break;
case _da:
_109=YES;
break;
case _db:
_109=NO;
break;
default:
throw new Error("*** "+_108+" marker not recognized in Plist.");
}
if(!_10a){
_10a=_109;
}else{
if(_10c){
if(_10c.slice){
_10c.push(_109);
}else{
_10c.setValueForKey(key,_109);
}
}
}
}
return _10a;
};
function _c7(_10e){
return _10e.replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&apos;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
};
function _10f(_110){
return _110.replace(/&quot;/g,"\"").replace(/&apos;/g,"'").replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&amp;/g,"&");
};
function _9b(_111){
if(window.DOMParser){
return (new window.DOMParser().parseFromString(_111,"text/xml").documentElement);
}else{
if(window.ActiveXObject){
XMLNode=new ActiveXObject("Microsoft.XMLDOM");
var _112=_111.match(CFPropertyList.DTDRE);
if(_112){
_111=_111.substr(_112[0].length);
}
XMLNode.loadXML(_111);
return XMLNode;
}
}
return NULL;
};
CFPropertyList.propertyListFromXML=function(_113){
var _114=_113;
if(_113.valueOf&&typeof _113.valueOf()==="string"){
_114=_9b(_113);
}
while(((String(_114.nodeName))===_ef)||((String(_114.nodeName))===_ee)){
_114=(_114.firstChild);
}
if(_114!==NULL&&((_114.nodeType)===8||(_114.nodeType)===3)){
while((_114=(_114.nextSibling))&&((_114.nodeType)===8||(_114.nodeType)===3)){
}
}
if(((_114.nodeType)===10)){
while((_114=(_114.nextSibling))&&((_114.nodeType)===8||(_114.nodeType)===3)){
}
}
if(!((String(_114.nodeName))===_f0)){
return NULL;
}
var key="",_115=NULL,_116=NULL,_117=_114,_118=[],_119=NULL;
while(_114=_fa(_114,_117,_118)){
var _11a=_118.length;
if(_11a){
_119=_118[_11a-1];
}
if((String(_114.nodeName))===_f1){
key=((String((_114.firstChild).nodeValue)));
while((_114=(_114.nextSibling))&&((_114.nodeType)===8||(_114.nodeType)===3)){
}
}
switch(String((String(_114.nodeName)))){
case _f3:
_115=[];
_118.push(_115);
break;
case _f2:
_115=new CFMutableDictionary();
_118.push(_115);
break;
case _f7:
_115=parseFloat(((String((_114.firstChild).nodeValue))));
break;
case _f8:
_115=parseInt(((String((_114.firstChild).nodeValue))),10);
break;
case _f4:
if((_114.getAttribute("type")==="base64")){
_115=(_114.firstChild)?CFData.decodeBase64ToString(((String((_114.firstChild).nodeValue)))):"";
}else{
_115=_10f((_114.firstChild)?((String((_114.firstChild).nodeValue))):"");
}
break;
case _f5:
_115=YES;
break;
case _f6:
_115=NO;
break;
case _f9:
_115=new CFMutableData();
_115.bytes=(_114.firstChild)?CFData.decodeBase64ToArray(((String((_114.firstChild).nodeValue))),YES):[];
break;
default:
throw new Error("*** "+(String(_114.nodeName))+" tag not recognized in Plist.");
}
if(!_116){
_116=_115;
}else{
if(_119){
if(_119.slice){
_119.push(_115);
}else{
_119.setValueForKey(key,_115);
}
}
}
}
return _116;
};
kCFPropertyListOpenStepFormat=CFPropertyList.FormatOpenStep;
kCFPropertyListXMLFormat_v1_0=CFPropertyList.FormatXML_v1_0;
kCFPropertyListBinaryFormat_v1_0=CFPropertyList.FormatBinary_v1_0;
kCFPropertyList280NorthFormat_v1_0=CFPropertyList.Format280North_v1_0;
CFPropertyListCreate=function(){
return new CFPropertyList();
};
CFPropertyListCreateFromXMLData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateXMLData=function(_11b){
return CFPropertyList.dataFromPropertyList(_11b,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateFrom280NorthData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.Format280North_v1_0);
};
CFPropertyListCreate280NorthData=function(_11c){
return CFPropertyList.dataFromPropertyList(_11c,CFPropertyList.Format280North_v1_0);
};
CPPropertyListCreateFromData=function(data,_11d){
return CFPropertyList.propertyListFromData(data,_11d);
};
CPPropertyListCreateData=function(_11e,_11f){
return CFPropertyList.dataFromPropertyList(_11e,_11f);
};
CFDictionary=function(_120){
this._keys=[];
this._count=0;
this._buckets={};
this._UID=objj_generateObjectUID();
};
var _121=Array.prototype.indexOf,_7b=Object.prototype.hasOwnProperty;
CFDictionary.prototype.copy=function(){
return this;
};
CFDictionary.prototype.mutableCopy=function(){
var _122=new CFMutableDictionary(),keys=this._keys,_123=this._count;
_122._keys=keys.slice();
_122._count=_123;
var _124=0,_125=this._buckets,_126=_122._buckets;
for(;_124<_123;++_124){
var key=keys[_124];
_126[key]=_125[key];
}
return _122;
};
CFDictionary.prototype.containsKey=function(aKey){
return _7b.apply(this._buckets,[aKey]);
};
CFDictionary.prototype.containsValue=function(_127){
var keys=this._keys,_128=this._buckets,_96=0,_129=keys.length;
for(;_96<_129;++_96){
if(_128[keys[_96]]===_127){
return YES;
}
}
return NO;
};
CFDictionary.prototype.count=function(){
return this._count;
};
CFDictionary.prototype.countOfKey=function(aKey){
return this.containsKey(aKey)?1:0;
};
CFDictionary.prototype.countOfValue=function(_12a){
var keys=this._keys,_12b=this._buckets,_96=0,_12c=keys.length,_12d=0;
for(;_96<_12c;++_96){
if(_12b[keys[_96]]===_12a){
++_12d;
}
}
return _12d;
};
CFDictionary.prototype.keys=function(){
return this._keys.slice();
};
CFDictionary.prototype.valueForKey=function(aKey){
var _12e=this._buckets;
if(!_7b.apply(_12e,[aKey])){
return nil;
}
return _12e[aKey];
};
CFDictionary.prototype.toString=function(){
var _12f="{\n",keys=this._keys,_96=0,_130=this._count;
for(;_96<_130;++_96){
var key=keys[_96];
_12f+="\t"+key+" = \""+String(this.valueForKey(key)).split("\n").join("\n\t")+"\"\n";
}
return _12f+"}";
};
CFMutableDictionary=function(_131){
CFDictionary.apply(this,[]);
};
CFMutableDictionary.prototype=new CFDictionary();
CFMutableDictionary.prototype.copy=function(){
return this.mutableCopy();
};
CFMutableDictionary.prototype.addValueForKey=function(aKey,_132){
if(this.containsKey(aKey)){
return;
}
++this._count;
this._keys.push(aKey);
this._buckets[aKey]=_132;
};
CFMutableDictionary.prototype.removeValueForKey=function(aKey){
var _133=-1;
if(_121){
_133=_121.call(this._keys,aKey);
}else{
var keys=this._keys,_96=0,_134=keys.length;
for(;_96<_134;++_96){
if(keys[_96]===aKey){
_133=_96;
break;
}
}
}
if(_133===-1){
return;
}
--this._count;
this._keys.splice(_133,1);
delete this._buckets[aKey];
};
CFMutableDictionary.prototype.removeAllValues=function(){
this._count=0;
this._keys=[];
this._buckets={};
};
CFMutableDictionary.prototype.replaceValueForKey=function(aKey,_135){
if(!this.containsKey(aKey)){
return;
}
this._buckets[aKey]=_135;
};
CFMutableDictionary.prototype.setValueForKey=function(aKey,_136){
if(_136===nil||_136===_29){
this.removeValueForKey(aKey);
}else{
if(this.containsKey(aKey)){
this.replaceValueForKey(aKey,_136);
}else{
this.addValueForKey(aKey,_136);
}
}
};
CFData=function(){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFData.prototype.propertyList=function(){
if(!this._propertyList){
this._propertyList=CFPropertyList.propertyListFromString(this.rawString());
}
return this._propertyList;
};
CFData.prototype.JSONObject=function(){
if(!this._JSONObject){
try{
this._JSONObject=JSON.parse(this.rawString());
}
catch(anException){
}
}
return this._JSONObject;
};
CFData.prototype.rawString=function(){
if(this._rawString===NULL){
if(this._propertyList){
this._rawString=CFPropertyList.stringFromPropertyList(this._propertyList,this._propertyListFormat);
}else{
if(this._JSONObject){
this._rawString=JSON.stringify(this._JSONObject);
}else{
throw new Error("Can't convert data to string.");
}
}
}
return this._rawString;
};
CFData.prototype.bytes=function(){
return this._bytes;
};
CFData.prototype.base64=function(){
return this._base64;
};
CFMutableData=function(){
CFData.call(this);
};
CFMutableData.prototype=new CFData();
function _137(_138){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFMutableData.prototype.setPropertyList=function(_139,_13a){
_137(this);
this._propertyList=_139;
this._propertyListFormat=_13a;
};
CFMutableData.prototype.setJSONObject=function(_13b){
_137(this);
this._JSONObject=_13b;
};
CFMutableData.prototype.setRawString=function(_13c){
_137(this);
this._rawString=_13c;
};
CFMutableData.prototype.setBytes=function(_13d){
_137(this);
this._bytes=_13d;
};
CFMutableData.prototype.setBase64String=function(_13e){
_137(this);
this._base64=_13e;
};
var _13f=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/","="],_140=[];
for(var i=0;i<_13f.length;i++){
_140[_13f[i].charCodeAt(0)]=i;
}
CFData.decodeBase64ToArray=function(_141,_142){
if(_142){
_141=_141.replace(/[^A-Za-z0-9\+\/\=]/g,"");
}
var pad=(_141[_141.length-1]=="="?1:0)+(_141[_141.length-2]=="="?1:0),_143=_141.length,_144=[];
var i=0;
while(i<_143){
var bits=(_140[_141.charCodeAt(i++)]<<18)|(_140[_141.charCodeAt(i++)]<<12)|(_140[_141.charCodeAt(i++)]<<6)|(_140[_141.charCodeAt(i++)]);
_144.push((bits&16711680)>>16);
_144.push((bits&65280)>>8);
_144.push(bits&255);
}
if(pad>0){
return _144.slice(0,-1*pad);
}
return _144;
};
CFData.encodeBase64Array=function(_145){
var pad=(3-(_145.length%3))%3,_146=_145.length+pad,_147=[];
if(pad>0){
_145.push(0);
}
if(pad>1){
_145.push(0);
}
var i=0;
while(i<_146){
var bits=(_145[i++]<<16)|(_145[i++]<<8)|(_145[i++]);
_147.push(_13f[(bits&16515072)>>18]);
_147.push(_13f[(bits&258048)>>12]);
_147.push(_13f[(bits&4032)>>6]);
_147.push(_13f[bits&63]);
}
if(pad>0){
_147[_147.length-1]="=";
_145.pop();
}
if(pad>1){
_147[_147.length-2]="=";
_145.pop();
}
return _147.join("");
};
CFData.decodeBase64ToString=function(_148,_149){
return CFData.bytesToString(CFData.decodeBase64ToArray(_148,_149));
};
CFData.decodeBase64ToUtf16String=function(_14a,_14b){
return CFData.bytesToUtf16String(CFData.decodeBase64ToArray(_14a,_14b));
};
CFData.bytesToString=function(_14c){
return String.fromCharCode.apply(NULL,_14c);
};
CFData.encodeBase64String=function(_14d){
var temp=[];
for(var i=0;i<_14d.length;i++){
temp.push(_14d.charCodeAt(i));
}
return CFData.encodeBase64Array(temp);
};
CFData.bytesToUtf16String=function(_14e){
var temp=[];
for(var i=0;i<_14e.length;i+=2){
temp.push(_14e[i+1]<<8|_14e[i]);
}
return String.fromCharCode.apply(NULL,temp);
};
CFData.encodeBase64Utf16String=function(_14f){
var temp=[];
for(var i=0;i<_14f.length;i++){
var c=_14f.charCodeAt(i);
temp.push(_14f.charCodeAt(i)&255);
temp.push((_14f.charCodeAt(i)&65280)>>8);
}
return CFData.encodeBase64Array(temp);
};
var _150,_151,_152=0;
function _153(){
if(++_152!==1){
return;
}
_150={};
_151={};
};
function _154(){
_152=MAX(_152-1,0);
if(_152!==0){
return;
}
delete _150;
delete _151;
};
var _155=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"([^?#]*)"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _156=["url","scheme","authorityRoot","authority","userInfo","user","password","domain","portNumber","path","queryString","fragment"];
function _157(aURL){
if(aURL._parts){
return aURL._parts;
}
var _158=aURL.string(),_159=_158.match(/^mhtml:/);
if(_159){
_158=_158.substr("mhtml:".length);
}
if(_152>0&&_7b.call(_151,_158)){
aURL._parts=_151[_158];
return aURL._parts;
}
aURL._parts={};
var _15a=aURL._parts,_15b=_155.exec(_158),_96=_15b.length;
while(_96--){
_15a[_156[_96]]=_15b[_96]||NULL;
}
_15a.portNumber=parseInt(_15a.portNumber,10);
if(isNaN(_15a.portNumber)){
_15a.portNumber=-1;
}
_15a.pathComponents=[];
if(_15a.path){
var _15c=_15a.path.split("/"),_15d=_15a.pathComponents,_96=0,_15e=_15c.length;
for(;_96<_15e;++_96){
var _15f=_15c[_96];
if(_15f){
_15d.push(_15f);
}else{
if(_96===0){
_15d.push("/");
}
}
}
_15a.pathComponents=_15d;
}
if(_159){
_15a.url="mhtml:"+_15a.url;
_15a.scheme="mhtml:"+_15a.scheme;
}
if(_152>0){
_151[_158]=_15a;
}
return _15a;
};
CFURL=function(aURL,_160){
aURL=aURL||"";
if(aURL instanceof CFURL){
if(!_160){
return aURL;
}
var _161=aURL.baseURL();
if(_161){
_160=new CFURL(_161.absoluteURL(),_160);
}
aURL=aURL.string();
}
if(_152>0){
var _162=aURL+" "+(_160&&_160.UID()||"");
if(_7b.call(_150,_162)){
return _150[_162];
}
_150[_162]=this;
}
if(aURL.match(/^data:/)){
var _163={},_96=_156.length;
while(_96--){
_163[_156[_96]]="";
}
_163.url=aURL;
_163.scheme="data";
_163.pathComponents=[];
this._parts=_163;
this._standardizedURL=this;
this._absoluteURL=this;
}
this._UID=objj_generateObjectUID();
this._string=aURL;
this._baseURL=_160;
};
CFURL.prototype.UID=function(){
return this._UID;
};
var _164={};
CFURL.prototype.mappedURL=function(){
return _164[this.absoluteString()]||this;
};
CFURL.setMappedURLForURL=function(_165,_166){
_164[_165.absoluteString()]=_166;
};
CFURL.prototype.schemeAndAuthority=function(){
var _167="",_168=this.scheme();
if(_168){
_167+=_168+":";
}
var _169=this.authority();
if(_169){
_167+="//"+_169;
}
return _167;
};
CFURL.prototype.absoluteString=function(){
if(this._absoluteString===_29){
this._absoluteString=this.absoluteURL().string();
}
return this._absoluteString;
};
CFURL.prototype.toString=function(){
return this.absoluteString();
};
function _16a(aURL){
aURL=aURL.standardizedURL();
var _16b=aURL.baseURL();
if(!_16b){
return aURL;
}
var _16c=((aURL)._parts||_157(aURL)),_16d,_16e=_16b.absoluteURL(),_16f=((_16e)._parts||_157(_16e));
if(_16c.scheme||_16c.authority){
_16d=_16c;
}else{
_16d={};
_16d.scheme=_16f.scheme;
_16d.authority=_16f.authority;
_16d.userInfo=_16f.userInfo;
_16d.user=_16f.user;
_16d.password=_16f.password;
_16d.domain=_16f.domain;
_16d.portNumber=_16f.portNumber;
_16d.queryString=_16c.queryString;
_16d.fragment=_16c.fragment;
var _170=_16c.pathComponents;
if(_170.length&&_170[0]==="/"){
_16d.path=_16c.path;
_16d.pathComponents=_170;
}else{
var _171=_16f.pathComponents,_172=_171.concat(_170);
if(!_16b.hasDirectoryPath()&&_171.length){
_172.splice(_171.length-1,1);
}
if(_170.length&&(_170[0]===".."||_170[0]===".")){
_173(_172,YES);
}
_16d.pathComponents=_172;
_16d.path=_174(_172,_170.length<=0||aURL.hasDirectoryPath());
}
}
var _175=_176(_16d),_177=new CFURL(_175);
_177._parts=_16d;
_177._standardizedURL=_177;
_177._standardizedString=_175;
_177._absoluteURL=_177;
_177._absoluteString=_175;
return _177;
};
function _174(_178,_179){
var path=_178.join("/");
if(path.length&&path.charAt(0)==="/"){
path=path.substr(1);
}
if(_179){
path+="/";
}
return path;
};
function _173(_17a,_17b){
var _17c=0,_17d=0,_17e=_17a.length,_17f=_17b?_17a:[],_180=NO;
for(;_17c<_17e;++_17c){
var _181=_17a[_17c];
if(_181===""){
continue;
}
if(_181==="."){
_180=_17d===0;
continue;
}
if(_181!==".."||_17d===0||_17f[_17d-1]===".."){
_17f[_17d]=_181;
_17d++;
continue;
}
if(_17d>0&&_17f[_17d-1]!=="/"){
--_17d;
}
}
if(_180&&_17d===0){
_17f[_17d++]=".";
}
_17f.length=_17d;
return _17f;
};
function _176(_182){
var _183="",_184=_182.scheme;
if(_184){
_183+=_184+":";
}
var _185=_182.authority;
if(_185){
_183+="//"+_185;
}
_183+=_182.path;
var _186=_182.queryString;
if(_186){
_183+="?"+_186;
}
var _187=_182.fragment;
if(_187){
_183+="#"+_187;
}
return _183;
};
CFURL.prototype.absoluteURL=function(){
if(this._absoluteURL===_29){
this._absoluteURL=_16a(this);
}
return this._absoluteURL;
};
CFURL.prototype.standardizedURL=function(){
if(this._standardizedURL===_29){
var _188=((this)._parts||_157(this)),_189=_188.pathComponents,_18a=_173(_189,NO);
var _18b=_174(_18a,this.hasDirectoryPath());
if(_188.path===_18b){
this._standardizedURL=this;
}else{
var _18c=_18d(_188);
_18c.pathComponents=_18a;
_18c.path=_18b;
var _18e=new CFURL(_176(_18c),this.baseURL());
_18e._parts=_18c;
_18e._standardizedURL=_18e;
this._standardizedURL=_18e;
}
}
return this._standardizedURL;
};
function _18d(_18f){
var _190={},_191=_156.length;
while(_191--){
var _192=_156[_191];
_190[_192]=_18f[_192];
}
return _190;
};
CFURL.prototype.string=function(){
return this._string;
};
CFURL.prototype.authority=function(){
var _193=((this)._parts||_157(this)).authority;
if(_193){
return _193;
}
var _194=this.baseURL();
return _194&&_194.authority()||"";
};
CFURL.prototype.hasDirectoryPath=function(){
var _195=this._hasDirectoryPath;
if(_195===_29){
var path=this.path();
if(!path){
return NO;
}
if(path.charAt(path.length-1)==="/"){
return YES;
}
var _196=this.lastPathComponent();
_195=_196==="."||_196==="..";
this._hasDirectoryPath=_195;
}
return _195;
};
CFURL.prototype.hostName=function(){
return this.authority();
};
CFURL.prototype.fragment=function(){
return ((this)._parts||_157(this)).fragment;
};
CFURL.prototype.lastPathComponent=function(){
if(this._lastPathComponent===_29){
var _197=this.pathComponents(),_198=_197.length;
if(!_198){
this._lastPathComponent="";
}else{
this._lastPathComponent=_197[_198-1];
}
}
return this._lastPathComponent;
};
CFURL.prototype.path=function(){
return ((this)._parts||_157(this)).path;
};
CFURL.prototype.pathComponents=function(){
return ((this)._parts||_157(this)).pathComponents;
};
CFURL.prototype.pathExtension=function(){
var _199=this.lastPathComponent();
if(!_199){
return NULL;
}
_199=_199.replace(/^\.*/,"");
var _19a=_199.lastIndexOf(".");
return _19a<=0?"":_199.substring(_19a+1);
};
CFURL.prototype.queryString=function(){
return ((this)._parts||_157(this)).queryString;
};
CFURL.prototype.scheme=function(){
var _19b=this._scheme;
if(_19b===_29){
_19b=((this)._parts||_157(this)).scheme;
if(!_19b){
var _19c=this.baseURL();
_19b=_19c&&_19c.scheme();
}
this._scheme=_19b;
}
return _19b;
};
CFURL.prototype.user=function(){
return ((this)._parts||_157(this)).user;
};
CFURL.prototype.password=function(){
return ((this)._parts||_157(this)).password;
};
CFURL.prototype.portNumber=function(){
return ((this)._parts||_157(this)).portNumber;
};
CFURL.prototype.domain=function(){
return ((this)._parts||_157(this)).domain;
};
CFURL.prototype.baseURL=function(){
return this._baseURL;
};
CFURL.prototype.asDirectoryPathURL=function(){
if(this.hasDirectoryPath()){
return this;
}
var _19d=this.lastPathComponent();
if(_19d!=="/"){
_19d="./"+_19d;
}
return new CFURL(_19d+"/",this);
};
function _19e(aURL){
if(!aURL._resourcePropertiesForKeys){
aURL._resourcePropertiesForKeys=new CFMutableDictionary();
}
return aURL._resourcePropertiesForKeys;
};
CFURL.prototype.resourcePropertyForKey=function(aKey){
return _19e(this).valueForKey(aKey);
};
CFURL.prototype.setResourcePropertyForKey=function(aKey,_19f){
_19e(this).setValueForKey(aKey,_19f);
};
CFURL.prototype.staticResourceData=function(){
var data=new CFMutableData();
data.setRawString(_1a0.resourceAtURL(this).contents());
return data;
};
function _107(_1a1){
this._string=_1a1;
var _1a2=_1a1.indexOf(";");
this._magicNumber=_1a1.substr(0,_1a2);
this._location=_1a1.indexOf(";",++_1a2);
this._version=_1a1.substring(_1a2,this._location++);
};
_107.prototype.magicNumber=function(){
return this._magicNumber;
};
_107.prototype.version=function(){
return this._version;
};
_107.prototype.getMarker=function(){
var _1a3=this._string,_1a4=this._location;
if(_1a4>=_1a3.length){
return null;
}
var next=_1a3.indexOf(";",_1a4);
if(next<0){
return null;
}
var _1a5=_1a3.substring(_1a4,next);
if(_1a5==="e"){
return null;
}
this._location=next+1;
return _1a5;
};
_107.prototype.getString=function(){
var _1a6=this._string,_1a7=this._location;
if(_1a7>=_1a6.length){
return null;
}
var next=_1a6.indexOf(";",_1a7);
if(next<0){
return null;
}
var size=parseInt(_1a6.substring(_1a7,next),10),text=_1a6.substr(next+1,size);
this._location=next+1+size;
return text;
};
var _1a8=0,_1a9=1<<0,_1aa=1<<1,_1ab=1<<2,_1ac=1<<3,_1ad=1<<4;
var _1ae={},_1af={},_1b0=new Date().getTime(),_1b1=0,_1b2=0;
CFBundle=function(aURL){
aURL=_1b3(aURL).asDirectoryPathURL();
var _1b4=aURL.absoluteString(),_1b5=_1ae[_1b4];
if(_1b5){
return _1b5;
}
_1ae[_1b4]=this;
this._bundleURL=aURL;
this._resourcesDirectoryURL=new CFURL("Resources/",aURL);
this._staticResource=NULL;
this._isValid=NO;
this._loadStatus=_1a8;
this._loadRequests=[];
this._infoDictionary=new CFDictionary();
this._eventDispatcher=new _76(this);
};
CFBundle.environments=function(){
return ["Browser","ObjJ"];
};
CFBundle.bundleContainingURL=function(aURL){
aURL=new CFURL(".",_1b3(aURL));
var _1b6,_1b7=aURL.absoluteString();
while(!_1b6||_1b6!==_1b7){
var _1b8=_1ae[_1b7];
if(_1b8&&_1b8._isValid){
return _1b8;
}
aURL=new CFURL("..",aURL);
_1b6=_1b7;
_1b7=aURL.absoluteString();
}
return NULL;
};
CFBundle.mainBundle=function(){
return new CFBundle(_1b9);
};
function _1ba(_1bb,_1bc){
if(_1bc){
_1af[_1bb.name]=_1bc;
}
};
CFBundle.bundleForClass=function(_1bd){
return _1af[_1bd.name]||CFBundle.mainBundle();
};
CFBundle.prototype.bundleURL=function(){
return this._bundleURL;
};
CFBundle.prototype.resourcesDirectoryURL=function(){
return this._resourcesDirectoryURL;
};
CFBundle.prototype.resourceURL=function(_1be,_1bf,_1c0){
if(_1bf){
_1be=_1be+"."+_1bf;
}
if(_1c0){
_1be=_1c0+"/"+_1be;
}
var _1c1=(new CFURL(_1be,this.resourcesDirectoryURL())).mappedURL();
return _1c1.absoluteURL();
};
CFBundle.prototype.mostEligibleEnvironmentURL=function(){
if(this._mostEligibleEnvironmentURL===_29){
this._mostEligibleEnvironmentURL=new CFURL(this.mostEligibleEnvironment()+".environment/",this.bundleURL());
}
return this._mostEligibleEnvironmentURL;
};
CFBundle.prototype.executableURL=function(){
if(this._executableURL===_29){
var _1c2=this.valueForInfoDictionaryKey("CPBundleExecutable");
if(!_1c2){
this._executableURL=NULL;
}else{
this._executableURL=new CFURL(_1c2,this.mostEligibleEnvironmentURL());
}
}
return this._executableURL;
};
CFBundle.prototype.infoDictionary=function(){
return this._infoDictionary;
};
CFBundle.prototype.valueForInfoDictionaryKey=function(aKey){
return this._infoDictionary.valueForKey(aKey);
};
CFBundle.prototype.hasSpritedImages=function(){
var _1c3=this._infoDictionary.valueForKey("CPBundleEnvironmentsWithImageSprites")||[],_96=_1c3.length,_1c4=this.mostEligibleEnvironment();
while(_96--){
if(_1c3[_96]===_1c4){
return YES;
}
}
return NO;
};
CFBundle.prototype.environments=function(){
return this._infoDictionary.valueForKey("CPBundleEnvironments")||["ObjJ"];
};
CFBundle.prototype.mostEligibleEnvironment=function(_1c5){
_1c5=_1c5||this.environments();
var _1c6=CFBundle.environments(),_96=0,_1c7=_1c6.length,_1c8=_1c5.length;
for(;_96<_1c7;++_96){
var _1c9=0,_1ca=_1c6[_96];
for(;_1c9<_1c8;++_1c9){
if(_1ca===_1c5[_1c9]){
return _1ca;
}
}
}
return NULL;
};
CFBundle.prototype.isLoading=function(){
return this._loadStatus&_1a9;
};
CFBundle.prototype.isLoaded=function(){
return this._loadStatus&_1ad;
};
CFBundle.prototype.load=function(_1cb){
if(this._loadStatus!==_1a8){
return;
}
this._loadStatus=_1a9|_1aa;
var self=this,_1cc=this.bundleURL(),_1cd=new CFURL("..",_1cc);
if(_1cd.absoluteString()===_1cc.absoluteString()){
_1cd=_1cd.schemeAndAuthority();
}
_1a0.resolveResourceAtURL(_1cd,YES,function(_1ce){
var _1cf=_1cc.absoluteURL().lastPathComponent();
self._staticResource=_1ce._children[_1cf]||new _1a0(_1cc,_1ce,YES,NO);
function _1d0(_1d1){
self._loadStatus&=~_1aa;
var _1d2=_1d1.request.responsePropertyList();
self._isValid=!!_1d2||CFBundle.mainBundle()===self;
if(_1d2){
self._infoDictionary=_1d2;
}
if(!self._infoDictionary){
_1d4(self,new Error("Could not load bundle at \""+path+"\""));
return;
}
if(self===CFBundle.mainBundle()&&self.valueForInfoDictionaryKey("CPApplicationSize")){
_1b2=self.valueForInfoDictionaryKey("CPApplicationSize").valueForKey("executable")||0;
}
_1d8(self,_1cb);
};
function _1d3(){
self._isValid=CFBundle.mainBundle()===self;
self._loadStatus=_1a8;
_1d4(self,new Error("Could not load bundle at \""+self.bundleURL()+"\""));
};
new _b2(new CFURL("Info.plist",self.bundleURL()),_1d0,_1d3);
});
};
function _1d4(_1d5,_1d6){
_1d7(_1d5._staticResource);
_1d5._eventDispatcher.dispatchEvent({type:"error",error:_1d6,bundle:_1d5});
};
function _1d8(_1d9,_1da){
if(!_1d9.mostEligibleEnvironment()){
return _1db();
}
_1dc(_1d9,_1dd,_1db);
_1de(_1d9,_1dd,_1db);
if(_1d9._loadStatus===_1a9){
return _1dd();
}
function _1db(_1df){
var _1e0=_1d9._loadRequests,_1e1=_1e0.length;
while(_1e1--){
_1e0[_1e1].abort();
}
this._loadRequests=[];
_1d9._loadStatus=_1a8;
_1d4(_1d9,_1df||new Error("Could not recognize executable code format in Bundle "+_1d9));
};
function _1dd(){
if((typeof CPApp==="undefined"||!CPApp||!CPApp._finishedLaunching)&&typeof OBJJ_PROGRESS_CALLBACK==="function"&&_1b2){
OBJJ_PROGRESS_CALLBACK(MAX(MIN(1,_1b1/_1b2),0),_1b2,_1d9.bundlePath());
}
if(_1d9._loadStatus===_1a9){
_1d9._loadStatus=_1ad;
}else{
return;
}
_1d7(_1d9._staticResource);
function _1e2(){
_1d9._eventDispatcher.dispatchEvent({type:"load",bundle:_1d9});
};
if(_1da){
_1e3(_1d9,_1e2);
}else{
_1e2();
}
};
};
function _1dc(_1e4,_1e5,_1e6){
var _1e7=_1e4.executableURL();
if(!_1e7){
return;
}
_1e4._loadStatus|=_1ab;
new _b2(_1e7,function(_1e8){
try{
_1b1+=_1e8.request.responseText().length;
_1e9(_1e4,_1e8.request.responseText(),_1e7);
_1e4._loadStatus&=~_1ab;
_1e5();
}
catch(anException){
_1e6(anException);
}
},_1e6);
};
function _1ea(_1eb){
return "mhtml:"+new CFURL("MHTMLTest.txt",_1eb.mostEligibleEnvironmentURL());
};
function _1ec(_1ed){
if(_1ee===_1ef){
return new CFURL("dataURLs.txt",_1ed.mostEligibleEnvironmentURL());
}
if(_1ee===_1f0||_1ee===_1f1){
return new CFURL("MHTMLPaths.txt",_1ed.mostEligibleEnvironmentURL());
}
return NULL;
};
function _1de(_1f2,_1f3,_1f4){
if(!_1f2.hasSpritedImages()){
return;
}
_1f2._loadStatus|=_1ac;
if(!_1f5()){
return _1f6(_1ea(_1f2),function(){
_1de(_1f2,_1f3,_1f4);
});
}
var _1f7=_1ec(_1f2);
if(!_1f7){
_1f2._loadStatus&=~_1ac;
return _1f3();
}
new _b2(_1f7,function(_1f8){
try{
_1b1+=_1f8.request.responseText().length;
_1e9(_1f2,_1f8.request.responseText(),_1f7);
_1f2._loadStatus&=~_1ac;
}
catch(anException){
_1f4(anException);
}
_1f3();
},_1f4);
};
var _1f9=[],_1ee=-1,_1fa=0,_1ef=1,_1f0=2,_1f1=3;
function _1f5(){
return _1ee!==-1;
};
function _1f6(_1fb,_1fc){
if(_1f5()){
return;
}
_1f9.push(_1fc);
if(_1f9.length>1){
return;
}
_1f9.push(function(){
var size=0,_1fd=CFBundle.mainBundle().valueForInfoDictionaryKey("CPApplicationSize");
if(!_1fd){
return;
}
switch(_1ee){
case _1ef:
size=_1fd.valueForKey("data");
break;
case _1f0:
case _1f1:
size=_1fd.valueForKey("mhtml");
break;
}
_1b2+=size;
});
_1fe([_1ef,"data:image/gif;base64,R0lGODlhAQABAIAAAMc9BQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",_1f0,_1fb+"!test",_1f1,_1fb+"?"+_1b0+"!test"]);
};
function _1ff(){
var _200=_1f9.length;
while(_200--){
_1f9[_200]();
}
};
function _1fe(_201){
if(_201.length<2){
_1ee=_1fa;
_1ff();
return;
}
var _202=new Image();
_202.onload=function(){
if(_202.width===1&&_202.height===1){
_1ee=_201[0];
_1ff();
}else{
_202.onerror();
}
};
_202.onerror=function(){
_1fe(_201.slice(2));
};
_202.src=_201[1];
};
function _1e3(_203,_204){
var _205=[_203._staticResource];
function _206(_207){
for(;_207<_205.length;++_207){
var _208=_205[_207];
if(_208.isNotFound()){
continue;
}
if(_208.isFile()){
var _209=new _321(_208.URL());
if(_209.hasLoadedFileDependencies()){
_209.execute();
}else{
_209.loadFileDependencies(function(){
_206(_207);
});
return;
}
}else{
if(_208.URL().absoluteString()===_203.resourcesDirectoryURL().absoluteString()){
continue;
}
var _20a=_208.children();
for(var name in _20a){
if(_7b.call(_20a,name)){
_205.push(_20a[name]);
}
}
}
}
_204();
};
_206(0);
};
var _20b="@STATIC",_20c="p",_20d="u",_20e="c",_20f="t",_210="I",_211="i";
function _1e9(_212,_213,_214){
var _215=new _107(_213);
if(_215.magicNumber()!==_20b){
throw new Error("Could not read static file: "+_214);
}
if(_215.version()!=="1.0"){
throw new Error("Could not read static file: "+_214);
}
var _216,_217=_212.bundleURL(),file=NULL;
while(_216=_215.getMarker()){
var text=_215.getString();
if(_216===_20c){
var _218=new CFURL(text,_217),_219=_1a0.resourceAtURL(new CFURL(".",_218),YES);
file=new _1a0(_218,_219,NO,YES);
}else{
if(_216===_20d){
var URL=new CFURL(text,_217),_21a=_215.getString();
if(_21a.indexOf("mhtml:")===0){
_21a="mhtml:"+new CFURL(_21a.substr("mhtml:".length),_217);
if(_1ee===_1f1){
var _21b=_21a.indexOf("!"),_21c=_21a.substring(0,_21b),_21d=_21a.substring(_21b);
_21a=_21c+"?"+_1b0+_21d;
}
}
CFURL.setMappedURLForURL(URL,new CFURL(_21a));
var _219=_1a0.resourceAtURL(new CFURL(".",URL),YES);
new _1a0(URL,_219,NO,YES);
}else{
if(_216===_20f){
file.write(text);
}
}
}
}
};
CFBundle.prototype.addEventListener=function(_21e,_21f){
this._eventDispatcher.addEventListener(_21e,_21f);
};
CFBundle.prototype.removeEventListener=function(_220,_221){
this._eventDispatcher.removeEventListener(_220,_221);
};
CFBundle.prototype.onerror=function(_222){
throw _222.error;
};
CFBundle.prototype.bundlePath=function(){
return this._bundleURL.absoluteURL().path();
};
CFBundle.prototype.path=function(){
CPLog.warn("CFBundle.prototype.path is deprecated, use CFBundle.prototype.bundlePath instead.");
return this.bundlePath.apply(this,arguments);
};
CFBundle.prototype.pathForResource=function(_223){
return this.resourceURL(_223).absoluteString();
};
var _224={};
function _1a0(aURL,_225,_226,_227){
this._parent=_225;
this._eventDispatcher=new _76(this);
var name=aURL.absoluteURL().lastPathComponent()||aURL.schemeAndAuthority();
this._name=name;
this._URL=aURL;
this._isResolved=!!_227;
if(_226){
this._URL=this._URL.asDirectoryPathURL();
}
if(!_225){
_224[name]=this;
}
this._isDirectory=!!_226;
this._isNotFound=NO;
if(_225){
_225._children[name]=this;
}
if(_226){
this._children={};
}else{
this._contents="";
}
};
_1a0.rootResources=function(){
return _224;
};
_2.StaticResource=_1a0;
function _1d7(_228){
_228._isResolved=YES;
_228._eventDispatcher.dispatchEvent({type:"resolve",staticResource:_228});
};
_1a0.prototype.resolve=function(){
if(this.isDirectory()){
var _229=new CFBundle(this.URL());
_229.onerror=function(){
};
_229.load(NO);
}else{
var self=this;
function _22a(_22b){
self._contents=_22b.request.responseText();
_1d7(self);
};
function _22c(){
self._isNotFound=YES;
_1d7(self);
};
new _b2(this.URL(),_22a,_22c);
}
};
_1a0.prototype.name=function(){
return this._name;
};
_1a0.prototype.URL=function(){
return this._URL;
};
_1a0.prototype.contents=function(){
return this._contents;
};
_1a0.prototype.children=function(){
return this._children;
};
_1a0.prototype.parent=function(){
return this._parent;
};
_1a0.prototype.isResolved=function(){
return this._isResolved;
};
_1a0.prototype.write=function(_22d){
this._contents+=_22d;
};
function _22e(_22f){
var _230=_22f.schemeAndAuthority(),_231=_224[_230];
if(!_231){
_231=new _1a0(new CFURL(_230),NULL,YES,YES);
}
return _231;
};
_1a0.resourceAtURL=function(aURL,_232){
aURL=_1b3(aURL).absoluteURL();
var _233=_22e(aURL),_234=aURL.pathComponents(),_96=0,_235=_234.length;
for(;_96<_235;++_96){
var name=_234[_96];
if(_7b.call(_233._children,name)){
_233=_233._children[name];
}else{
if(_232){
if(name!=="/"){
name="./"+name;
}
_233=new _1a0(new CFURL(name,_233.URL()),_233,YES,YES);
}else{
throw new Error("Static Resource at "+aURL+" is not resolved (\""+name+"\")");
}
}
}
return _233;
};
_1a0.prototype.resourceAtURL=function(aURL,_236){
return _1a0.resourceAtURL(new CFURL(aURL,this.URL()),_236);
};
_1a0.resolveResourceAtURL=function(aURL,_237,_238){
aURL=_1b3(aURL).absoluteURL();
_239(_22e(aURL),_237,aURL.pathComponents(),0,_238);
};
_1a0.prototype.resolveResourceAtURL=function(aURL,_23a,_23b){
_1a0.resolveResourceAtURL(new CFURL(aURL,this.URL()).absoluteURL(),_23a,_23b);
};
function _239(_23c,_23d,_23e,_23f,_240){
var _241=_23e.length;
for(;_23f<_241;++_23f){
var name=_23e[_23f],_242=_7b.call(_23c._children,name)&&_23c._children[name];
if(!_242){
_242=new _1a0(new CFURL(name,_23c.URL()),_23c,_23f+1<_241||_23d,NO);
_242.resolve();
}
if(!_242.isResolved()){
return _242.addEventListener("resolve",function(){
_239(_23c,_23d,_23e,_23f,_240);
});
}
if(_242.isNotFound()){
return _240(null,new Error("File not found: "+_23e.join("/")));
}
if((_23f+1<_241)&&_242.isFile()){
return _240(null,new Error("File is not a directory: "+_23e.join("/")));
}
_23c=_242;
}
_240(_23c);
};
function _243(aURL,_244,_245){
var _246=_1a0.includeURLs(),_247=new CFURL(aURL,_246[_244]).absoluteURL();
_1a0.resolveResourceAtURL(_247,NO,function(_248){
if(!_248){
if(_244+1<_246.length){
_243(aURL,_244+1,_245);
}else{
_245(NULL);
}
return;
}
_245(_248);
});
};
_1a0.resolveResourceAtURLSearchingIncludeURLs=function(aURL,_249){
_243(aURL,0,_249);
};
_1a0.prototype.addEventListener=function(_24a,_24b){
this._eventDispatcher.addEventListener(_24a,_24b);
};
_1a0.prototype.removeEventListener=function(_24c,_24d){
this._eventDispatcher.removeEventListener(_24c,_24d);
};
_1a0.prototype.isNotFound=function(){
return this._isNotFound;
};
_1a0.prototype.isFile=function(){
return !this._isDirectory;
};
_1a0.prototype.isDirectory=function(){
return this._isDirectory;
};
_1a0.prototype.toString=function(_24e){
if(this.isNotFound()){
return "<file not found: "+this.name()+">";
}
var _24f=this.name();
if(this.isDirectory()){
var _250=this._children;
for(var name in _250){
if(_250.hasOwnProperty(name)){
var _251=_250[name];
if(_24e||!_251.isNotFound()){
_24f+="\n\t"+_250[name].toString(_24e).split("\n").join("\n\t");
}
}
}
}
return _24f;
};
var _252=NULL;
_1a0.includeURLs=function(){
if(_253){
return _253;
}
var _253=[];
if(!_1.OBJJ_INCLUDE_PATHS&&!_1.OBJJ_INCLUDE_URLS){
_253=["Frameworks","Frameworks/Debug"];
}else{
_253=(_1.OBJJ_INCLUDE_PATHS||[]).concat(_1.OBJJ_INCLUDE_URLS||[]);
}
var _254=_253.length;
while(_254--){
_253[_254]=new CFURL(_253[_254]).asDirectoryPathURL();
}
return _253;
};
var _255="accessors",_256="class",_257="end",_258="function",_259="implementation",_25a="import",_25b="each",_25c="outlet",_25d="action",_25e="new",_25f="selector",_260="super",_261="var",_262="in",_263="pragma",_264="mark",_265="=",_266="+",_267="-",_268=":",_269=",",_26a=".",_26b="*",_26c=";",_26d="<",_26e="{",_26f="}",_270=">",_271="[",_272="\"",_273="@",_274="#",_275="]",_276="?",_277="(",_278=")",_279=/^(?:(?:\s+$)|(?:\/(?:\/|\*)))/,_27a=/^[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?$/,_27b=/^[a-zA-Z_$](\w|$)*$/;
function _27c(_27d){
this._index=-1;
this._tokens=(_27d+"\n").match(/\/\/.*(\r|\n)?|\/\*(?:.|\n|\r)*?\*\/|\w+\b|[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?|"[^"\\]*(\\[\s\S][^"\\]*)*"|'[^'\\]*(\\[\s\S][^'\\]*)*'|\s+|./g);
this._context=[];
return this;
};
_27c.prototype.push=function(){
this._context.push(this._index);
};
_27c.prototype.pop=function(){
this._index=this._context.pop();
};
_27c.prototype.peek=function(_27e){
if(_27e){
this.push();
var _27f=this.skip_whitespace();
this.pop();
return _27f;
}
return this._tokens[this._index+1];
};
_27c.prototype.next=function(){
return this._tokens[++this._index];
};
_27c.prototype.previous=function(){
return this._tokens[--this._index];
};
_27c.prototype.last=function(){
if(this._index<0){
return NULL;
}
return this._tokens[this._index-1];
};
_27c.prototype.skip_whitespace=function(_280){
var _281;
if(_280){
while((_281=this.previous())&&_279.test(_281)){
}
}else{
while((_281=this.next())&&_279.test(_281)){
}
}
return _281;
};
_2.Lexer=_27c;
function _282(){
this.atoms=[];
};
_282.prototype.toString=function(){
return this.atoms.join("");
};
_2.preprocess=function(_283,aURL,_284){
return new _285(_283,aURL,_284).executable();
};
_2.eval=function(_286){
return eval(_2.preprocess(_286).code());
};
var _285=function(_287,aURL,_288){
this._URL=new CFURL(aURL);
_287=_287.replace(/^#[^\n]+\n/,"\n");
this._currentSelector="";
this._currentClass="";
this._currentSuperClass="";
this._currentSuperMetaClass="";
this._buffer=new _282();
this._preprocessed=NULL;
this._dependencies=[];
this._tokens=new _27c(_287);
this._flags=_288;
this._classMethod=false;
this._executable=NULL;
this._classLookupTable={};
this._classVars={};
var _289=new objj_class();
for(var i in _289){
this._classVars[i]=1;
}
this.preprocess(this._tokens,this._buffer);
};
_285.prototype.setClassInfo=function(_28a,_28b,_28c){
this._classLookupTable[_28a]={superClassName:_28b,ivars:_28c};
};
_285.prototype.getClassInfo=function(_28d){
return this._classLookupTable[_28d];
};
_285.prototype.allIvarNamesForClassName=function(_28e){
var _28f={},_290=this.getClassInfo(_28e);
while(_290){
for(var i in _290.ivars){
_28f[i]=1;
}
_290=this.getClassInfo(_290.superClassName);
}
return _28f;
};
_2.Preprocessor=_285;
_285.Flags={};
_285.Flags.IncludeDebugSymbols=1<<0;
_285.Flags.IncludeTypeSignatures=1<<1;
_285.prototype.executable=function(){
if(!this._executable){
this._executable=new _291(this._buffer.toString(),this._dependencies,this._URL);
}
return this._executable;
};
_285.prototype.accessors=function(_292){
var _293=_292.skip_whitespace(),_294={};
if(_293!=_277){
_292.previous();
return _294;
}
while((_293=_292.skip_whitespace())!=_278){
var name=_293,_295=true;
if(!/^\w+$/.test(name)){
throw new SyntaxError(this.error_message("*** @accessors attribute name not valid."));
}
if((_293=_292.skip_whitespace())==_265){
_295=_292.skip_whitespace();
if(!/^\w+$/.test(_295)){
throw new SyntaxError(this.error_message("*** @accessors attribute value not valid."));
}
if(name=="setter"){
if((_293=_292.next())!=_268){
throw new SyntaxError(this.error_message("*** @accessors setter attribute requires argument with \":\" at end of selector name."));
}
_295+=":";
}
_293=_292.skip_whitespace();
}
_294[name]=_295;
if(_293==_278){
break;
}
if(_293!=_269){
throw new SyntaxError(this.error_message("*** Expected ',' or ')' in @accessors attribute list."));
}
}
return _294;
};
_285.prototype.brackets=function(_296,_297){
var _298=[];
while(this.preprocess(_296,NULL,NULL,NULL,_298[_298.length]=[])){
}
if(_298[0].length===1){
_297.atoms[_297.atoms.length]="[";
_297.atoms[_297.atoms.length]=_298[0][0];
_297.atoms[_297.atoms.length]="]";
}else{
var _299=new _282();
if(_298[0][0].atoms[0]==_260){
_297.atoms[_297.atoms.length]="objj_msgSendSuper(";
_297.atoms[_297.atoms.length]="{ receiver:self, super_class:"+(this._classMethod?this._currentSuperMetaClass:this._currentSuperClass)+" }";
}else{
_297.atoms[_297.atoms.length]="objj_msgSend(";
_297.atoms[_297.atoms.length]=_298[0][0];
}
_299.atoms[_299.atoms.length]=_298[0][1];
var _29a=1,_29b=_298.length,_29c=new _282();
for(;_29a<_29b;++_29a){
var pair=_298[_29a];
_299.atoms[_299.atoms.length]=pair[1];
_29c.atoms[_29c.atoms.length]=", "+pair[0];
}
_297.atoms[_297.atoms.length]=", \"";
_297.atoms[_297.atoms.length]=_299;
_297.atoms[_297.atoms.length]="\"";
_297.atoms[_297.atoms.length]=_29c;
_297.atoms[_297.atoms.length]=")";
}
};
_285.prototype.directive=function(_29d,_29e,_29f){
var _2a0=_29e?_29e:new _282(),_2a1=_29d.next();
if(_2a1.charAt(0)==_272){
_2a0.atoms[_2a0.atoms.length]=_2a1;
}else{
if(_2a1===_256){
_29d.skip_whitespace();
return;
}else{
if(_2a1===_259){
this.implementation(_29d,_2a0);
}else{
if(_2a1===_25a){
this._import(_29d);
}else{
if(_2a1===_25f){
this.selector(_29d,_2a0);
}
}
}
}
}
if(!_29e){
return _2a0;
}
};
_285.prototype.hash=function(_2a2,_2a3){
var _2a4=_2a3?_2a3:new _282(),_2a5=_2a2.next();
if(_2a5===_263){
_2a5=_2a2.skip_whitespace();
if(_2a5===_264){
while((_2a5=_2a2.next()).indexOf("\n")<0){
}
}
}else{
throw new SyntaxError(this.error_message("*** Expected \"pragma\" to follow # but instead saw \""+_2a5+"\"."));
}
};
_285.prototype.implementation=function(_2a6,_2a7){
var _2a8=_2a7,_2a9="",_2aa=NO,_2ab=_2a6.skip_whitespace(),_2ac="Nil",_2ad=new _282(),_2ae=new _282();
if(!(/^\w/).test(_2ab)){
throw new Error(this.error_message("*** Expected class name, found \""+_2ab+"\"."));
}
this._currentSuperClass="objj_getClass(\""+_2ab+"\").super_class";
this._currentSuperMetaClass="objj_getMetaClass(\""+_2ab+"\").super_class";
this._currentClass=_2ab;
this._currentSelector="";
if((_2a9=_2a6.skip_whitespace())==_277){
_2a9=_2a6.skip_whitespace();
if(_2a9==_278){
throw new SyntaxError(this.error_message("*** Can't Have Empty Category Name for class \""+_2ab+"\"."));
}
if(_2a6.skip_whitespace()!=_278){
throw new SyntaxError(this.error_message("*** Improper Category Definition for class \""+_2ab+"\"."));
}
_2a8.atoms[_2a8.atoms.length]="{\nvar the_class = objj_getClass(\""+_2ab+"\")\n";
_2a8.atoms[_2a8.atoms.length]="if(!the_class) throw new SyntaxError(\"*** Could not find definition for class \\\""+_2ab+"\\\"\");\n";
_2a8.atoms[_2a8.atoms.length]="var meta_class = the_class.isa;";
}else{
if(_2a9==_268){
_2a9=_2a6.skip_whitespace();
if(!_27b.test(_2a9)){
throw new SyntaxError(this.error_message("*** Expected class name, found \""+_2a9+"\"."));
}
_2ac=_2a9;
_2a9=_2a6.skip_whitespace();
}
_2a8.atoms[_2a8.atoms.length]="{var the_class = objj_allocateClassPair("+_2ac+", \""+_2ab+"\"),\nmeta_class = the_class.isa;";
if(_2a9==_26e){
var _2af={},_2b0=0,_2b1=[],_2b2,_2b3={};
while((_2a9=_2a6.skip_whitespace())&&_2a9!=_26f){
if(_2a9===_273){
_2a9=_2a6.next();
if(_2a9===_255){
_2b2=this.accessors(_2a6);
}else{
if(_2a9!==_25c){
throw new SyntaxError(this.error_message("*** Unexpected '@' token in ivar declaration ('@"+_2a9+"')."));
}
}
}else{
if(_2a9==_26c){
if(_2b0++===0){
_2a8.atoms[_2a8.atoms.length]="class_addIvars(the_class, [";
}else{
_2a8.atoms[_2a8.atoms.length]=", ";
}
var name=_2b1[_2b1.length-1];
_2a8.atoms[_2a8.atoms.length]="new objj_ivar(\""+name+"\")";
_2af[name]=1;
_2b1=[];
if(_2b2){
_2b3[name]=_2b2;
_2b2=NULL;
}
}else{
_2b1.push(_2a9);
}
}
}
if(_2b1.length){
throw new SyntaxError(this.error_message("*** Expected ';' in ivar declaration, found '}'."));
}
if(_2b0){
_2a8.atoms[_2a8.atoms.length]="]);\n";
}
if(!_2a9){
throw new SyntaxError(this.error_message("*** Expected '}'"));
}
this.setClassInfo(_2ab,_2ac==="Nil"?null:_2ac,_2af);
var _2af=this.allIvarNamesForClassName(_2ab);
for(ivar_name in _2b3){
var _2b4=_2b3[ivar_name],_2b5=_2b4["property"]||ivar_name;
var _2b6=_2b4["getter"]||_2b5,_2b7="(id)"+_2b6+"\n{\nreturn "+ivar_name+";\n}";
if(_2ad.atoms.length!==0){
_2ad.atoms[_2ad.atoms.length]=",\n";
}
_2ad.atoms[_2ad.atoms.length]=this.method(new _27c(_2b7),_2af);
if(_2b4["readonly"]){
continue;
}
var _2b8=_2b4["setter"];
if(!_2b8){
var _2b9=_2b5.charAt(0)=="_"?1:0;
_2b8=(_2b9?"_":"")+"set"+_2b5.substr(_2b9,1).toUpperCase()+_2b5.substring(_2b9+1)+":";
}
var _2ba="(void)"+_2b8+"(id)newValue\n{\n";
if(_2b4["copy"]){
_2ba+="if ("+ivar_name+" !== newValue)\n"+ivar_name+" = [newValue copy];\n}";
}else{
_2ba+=ivar_name+" = newValue;\n}";
}
if(_2ad.atoms.length!==0){
_2ad.atoms[_2ad.atoms.length]=",\n";
}
_2ad.atoms[_2ad.atoms.length]=this.method(new _27c(_2ba),_2af);
}
}else{
_2a6.previous();
}
_2a8.atoms[_2a8.atoms.length]="objj_registerClassPair(the_class);\n";
}
if(!_2af){
var _2af=this.allIvarNamesForClassName(_2ab);
}
while((_2a9=_2a6.skip_whitespace())){
if(_2a9==_266){
this._classMethod=true;
if(_2ae.atoms.length!==0){
_2ae.atoms[_2ae.atoms.length]=", ";
}
_2ae.atoms[_2ae.atoms.length]=this.method(_2a6,this._classVars);
}else{
if(_2a9==_267){
this._classMethod=false;
if(_2ad.atoms.length!==0){
_2ad.atoms[_2ad.atoms.length]=", ";
}
_2ad.atoms[_2ad.atoms.length]=this.method(_2a6,_2af);
}else{
if(_2a9==_274){
this.hash(_2a6,_2a8);
}else{
if(_2a9==_273){
if((_2a9=_2a6.next())==_257){
break;
}else{
throw new SyntaxError(this.error_message("*** Expected \"@end\", found \"@"+_2a9+"\"."));
}
}
}
}
}
}
if(_2ad.atoms.length!==0){
_2a8.atoms[_2a8.atoms.length]="class_addMethods(the_class, [";
_2a8.atoms[_2a8.atoms.length]=_2ad;
_2a8.atoms[_2a8.atoms.length]="]);\n";
}
if(_2ae.atoms.length!==0){
_2a8.atoms[_2a8.atoms.length]="class_addMethods(meta_class, [";
_2a8.atoms[_2a8.atoms.length]=_2ae;
_2a8.atoms[_2a8.atoms.length]="]);\n";
}
_2a8.atoms[_2a8.atoms.length]="}";
this._currentClass="";
};
_285.prototype._import=function(_2bb){
var _2bc="",_2bd=_2bb.skip_whitespace(),_2be=(_2bd!==_26d);
if(_2bd===_26d){
while((_2bd=_2bb.next())&&_2bd!==_270){
_2bc+=_2bd;
}
if(!_2bd){
throw new SyntaxError(this.error_message("*** Unterminated import statement."));
}
}else{
if(_2bd.charAt(0)===_272){
_2bc=_2bd.substr(1,_2bd.length-2);
}else{
throw new SyntaxError(this.error_message("*** Expecting '<' or '\"', found \""+_2bd+"\"."));
}
}
this._buffer.atoms[this._buffer.atoms.length]="objj_executeFile(\"";
this._buffer.atoms[this._buffer.atoms.length]=_2bc;
this._buffer.atoms[this._buffer.atoms.length]=_2be?"\", YES);":"\", NO);";
this._dependencies.push(new _2bf(new CFURL(_2bc),_2be));
};
_285.prototype.method=function(_2c0,_2c1){
var _2c2=new _282(),_2c3,_2c4="",_2c5=[],_2c6=[null];
_2c1=_2c1||{};
while((_2c3=_2c0.skip_whitespace())&&_2c3!==_26e&&_2c3!==_26c){
if(_2c3==_268){
var type="";
_2c4+=_2c3;
_2c3=_2c0.skip_whitespace();
if(_2c3==_277){
while((_2c3=_2c0.skip_whitespace())&&_2c3!=_278){
type+=_2c3;
}
_2c3=_2c0.skip_whitespace();
}
_2c6[_2c5.length+1]=type||null;
_2c5[_2c5.length]=_2c3;
if(_2c3 in _2c1){
throw new SyntaxError(this.error_message("*** Method ( "+_2c4+" ) uses a parameter name that is already in use ( "+_2c3+" )"));
}
}else{
if(_2c3==_277){
var type="";
while((_2c3=_2c0.skip_whitespace())&&_2c3!=_278){
type+=_2c3;
}
_2c6[0]=type||null;
}else{
if(_2c3==_269){
if((_2c3=_2c0.skip_whitespace())!=_26a||_2c0.next()!=_26a||_2c0.next()!=_26a){
throw new SyntaxError(this.error_message("*** Argument list expected after ','."));
}
}else{
_2c4+=_2c3;
}
}
}
}
if(_2c3===_26c){
_2c3=_2c0.skip_whitespace();
if(_2c3!==_26e){
throw new SyntaxError(this.error_message("Invalid semi-colon in method declaration. "+"Semi-colons are allowed only to terminate the method signature, before the open brace."));
}
}
var _2c7=0,_2c8=_2c5.length;
_2c2.atoms[_2c2.atoms.length]="new objj_method(sel_getUid(\"";
_2c2.atoms[_2c2.atoms.length]=_2c4;
_2c2.atoms[_2c2.atoms.length]="\"), function";
this._currentSelector=_2c4;
if(this._flags&_285.Flags.IncludeDebugSymbols){
_2c2.atoms[_2c2.atoms.length]=" $"+this._currentClass+"__"+_2c4.replace(/:/g,"_");
}
_2c2.atoms[_2c2.atoms.length]="(self, _cmd";
for(;_2c7<_2c8;++_2c7){
_2c2.atoms[_2c2.atoms.length]=", ";
_2c2.atoms[_2c2.atoms.length]=_2c5[_2c7];
}
_2c2.atoms[_2c2.atoms.length]=")\n{ with(self)\n{";
_2c2.atoms[_2c2.atoms.length]=this.preprocess(_2c0,NULL,_26f,_26e);
_2c2.atoms[_2c2.atoms.length]="}\n}";
if(this._flags&_285.Flags.IncludeDebugSymbols){
_2c2.atoms[_2c2.atoms.length]=","+JSON.stringify(_2c6);
}
_2c2.atoms[_2c2.atoms.length]=")";
this._currentSelector="";
return _2c2;
};
_285.prototype.preprocess=function(_2c9,_2ca,_2cb,_2cc,_2cd){
var _2ce=_2ca?_2ca:new _282(),_2cf=0,_2d0="";
if(_2cd){
_2cd[0]=_2ce;
var _2d1=false,_2d2=[0,0,0];
}
while((_2d0=_2c9.next())&&((_2d0!==_2cb)||_2cf)){
if(_2cd){
if(_2d0===_276){
++_2d2[2];
}else{
if(_2d0===_26e){
++_2d2[0];
}else{
if(_2d0===_26f){
--_2d2[0];
}else{
if(_2d0===_277){
++_2d2[1];
}else{
if(_2d0===_278){
--_2d2[1];
}else{
if((_2d0===_268&&_2d2[2]--===0||(_2d1=(_2d0===_275)))&&_2d2[0]===0&&_2d2[1]===0){
_2c9.push();
var _2d3=_2d1?_2c9.skip_whitespace(true):_2c9.previous(),_2d4=_279.test(_2d3);
if(_2d4||_27b.test(_2d3)&&_279.test(_2c9.previous())){
_2c9.push();
var last=_2c9.skip_whitespace(true),_2d5=true,_2d6=false;
if(last==="+"||last==="-"){
if(_2c9.previous()!==last){
_2d5=false;
}else{
last=_2c9.skip_whitespace(true);
_2d6=true;
}
}
_2c9.pop();
_2c9.pop();
if(_2d5&&((!_2d6&&(last===_26f))||last===_278||last===_275||last===_26a||_27a.test(last)||last.charAt(last.length-1)==="\""||last.charAt(last.length-1)==="'"||_27b.test(last)&&!/^(new|return|case|var)$/.test(last))){
if(_2d4){
_2cd[1]=":";
}else{
_2cd[1]=_2d3;
if(!_2d1){
_2cd[1]+=":";
}
var _2cf=_2ce.atoms.length;
while(_2ce.atoms[_2cf--]!==_2d3){
}
_2ce.atoms.length=_2cf;
}
return !_2d1;
}
if(_2d1){
return NO;
}
}
_2c9.pop();
if(_2d1){
return NO;
}
}
}
}
}
}
}
_2d2[2]=MAX(_2d2[2],0);
}
if(_2cc){
if(_2d0===_2cc){
++_2cf;
}else{
if(_2d0===_2cb){
--_2cf;
}
}
}
if(_2d0===_258){
var _2d7="";
while((_2d0=_2c9.next())&&_2d0!==_277&&!(/^\w/).test(_2d0)){
_2d7+=_2d0;
}
if(_2d0===_277){
if(_2cc===_277){
++_2cf;
}
_2ce.atoms[_2ce.atoms.length]="function"+_2d7+"(";
if(_2cd){
++_2d2[1];
}
}else{
_2ce.atoms[_2ce.atoms.length]=_2d0+"= function";
}
}else{
if(_2d0==_273){
this.directive(_2c9,_2ce);
}else{
if(_2d0==_274){
this.hash(_2c9,_2ce);
}else{
if(_2d0==_271){
this.brackets(_2c9,_2ce);
}else{
_2ce.atoms[_2ce.atoms.length]=_2d0;
}
}
}
}
}
if(_2cd){
throw new SyntaxError(this.error_message("*** Expected ']' - Unterminated message send or array."));
}
if(!_2ca){
return _2ce;
}
};
_285.prototype.selector=function(_2d8,_2d9){
var _2da=_2d9?_2d9:new _282();
_2da.atoms[_2da.atoms.length]="sel_getUid(\"";
if(_2d8.skip_whitespace()!=_277){
throw new SyntaxError(this.error_message("*** Expected '('"));
}
var _2db=_2d8.skip_whitespace();
if(_2db==_278){
throw new SyntaxError(this.error_message("*** Unexpected ')', can't have empty @selector()"));
}
_2d9.atoms[_2d9.atoms.length]=_2db;
var _2dc,_2dd=true;
while((_2dc=_2d8.next())&&_2dc!=_278){
if(_2dd&&/^\d+$/.test(_2dc)||!(/^(\w|$|\:)/.test(_2dc))){
if(!(/\S/).test(_2dc)){
if(_2d8.skip_whitespace()==_278){
break;
}else{
throw new SyntaxError(this.error_message("*** Unexpected whitespace in @selector()."));
}
}else{
throw new SyntaxError(this.error_message("*** Illegal character '"+_2dc+"' in @selector()."));
}
}
_2da.atoms[_2da.atoms.length]=_2dc;
_2dd=(_2dc==_268);
}
_2da.atoms[_2da.atoms.length]="\")";
if(!_2d9){
return _2da;
}
};
_285.prototype.error_message=function(_2de){
return _2de+" <Context File: "+this._URL+(this._currentClass?" Class: "+this._currentClass:"")+(this._currentSelector?" Method: "+this._currentSelector:"")+">";
};
function _2bf(aURL,_2df){
this._URL=aURL;
this._isLocal=_2df;
};
_2.FileDependency=_2bf;
_2bf.prototype.URL=function(){
return this._URL;
};
_2bf.prototype.isLocal=function(){
return this._isLocal;
};
_2bf.prototype.toMarkedString=function(){
var _2e0=this.URL().absoluteString();
return (this.isLocal()?_211:_210)+";"+_2e0.length+";"+_2e0;
};
_2bf.prototype.toString=function(){
return (this.isLocal()?"LOCAL: ":"STD: ")+this.URL();
};
var _2e1=0,_2e2=1,_2e3=2,_2e4=0;
function _291(_2e5,_2e6,aURL,_2e7){
if(arguments.length===0){
return this;
}
this._code=_2e5;
this._function=_2e7||NULL;
this._URL=_1b3(aURL||new CFURL("(Anonymous"+(_2e4++)+")"));
this._fileDependencies=_2e6;
if(_2e6.length){
this._fileDependencyStatus=_2e1;
this._fileDependencyCallbacks=[];
}else{
this._fileDependencyStatus=_2e3;
}
if(this._function){
return;
}
this.setCode(_2e5);
};
_2.Executable=_291;
_291.prototype.path=function(){
return this.URL().path();
};
_291.prototype.URL=function(){
return this._URL;
};
_291.prototype.functionParameters=function(){
var _2e8=["global","objj_executeFile","objj_importFile"];
return _2e8;
};
_291.prototype.functionArguments=function(){
var _2e9=[_1,this.fileExecuter(),this.fileImporter()];
return _2e9;
};
_291.prototype.execute=function(){
var _2ea=_2eb;
_2eb=CFBundle.bundleContainingURL(this.URL());
var _2ec=this._function.apply(_1,this.functionArguments());
_2eb=_2ea;
return _2ec;
};
_291.prototype.code=function(){
return this._code;
};
_291.prototype.setCode=function(code){
this._code=code;
var _2ed=this.functionParameters().join(",");
this._function=new Function(_2ed,code);
};
_291.prototype.fileDependencies=function(){
return this._fileDependencies;
};
_291.prototype.hasLoadedFileDependencies=function(){
return this._fileDependencyStatus===_2e3;
};
var _2ee=0,_2ef=[],_2f0={};
_291.prototype.loadFileDependencies=function(_2f1){
var _2f2=this._fileDependencyStatus;
if(_2f1){
if(_2f2===_2e3){
return _2f1();
}
this._fileDependencyCallbacks.push(_2f1);
}
if(_2f2===_2e1){
if(_2ee){
throw "Can't load";
}
_2f3(this);
}
};
function _2f3(_2f4){
_2ef.push(_2f4);
_2f4._fileDependencyStatus=_2e2;
var _2f5=_2f4.fileDependencies(),_96=0,_2f6=_2f5.length,_2f7=_2f4.referenceURL(),_2f8=_2f7.absoluteString(),_2f9=_2f4.fileExecutableSearcher();
_2ee+=_2f6;
for(;_96<_2f6;++_96){
var _2fa=_2f5[_96],_2fb=_2fa.isLocal(),URL=_2fa.URL(),_2fc=(_2fb&&(_2f8+" ")||"")+URL;
if(_2f0[_2fc]){
if(--_2ee===0){
_2fd();
}
continue;
}
_2f0[_2fc]=YES;
_2f9(URL,_2fb,_2fe);
}
};
function _2fe(_2ff){
--_2ee;
if(_2ff._fileDependencyStatus===_2e1){
_2f3(_2ff);
}else{
if(_2ee===0){
_2fd();
}
}
};
function _2fd(){
var _300=_2ef,_96=0,_301=_300.length;
_2ef=[];
for(;_96<_301;++_96){
_300[_96]._fileDependencyStatus=_2e3;
}
for(_96=0;_96<_301;++_96){
var _302=_300[_96],_303=_302._fileDependencyCallbacks,_304=0,_305=_303.length;
for(;_304<_305;++_304){
_303[_304]();
}
_302._fileDependencyCallbacks=[];
}
};
_291.prototype.referenceURL=function(){
if(this._referenceURL===_29){
this._referenceURL=new CFURL(".",this.URL());
}
return this._referenceURL;
};
_291.prototype.fileImporter=function(){
return _291.fileImporterForURL(this.referenceURL());
};
_291.prototype.fileExecuter=function(){
return _291.fileExecuterForURL(this.referenceURL());
};
_291.prototype.fileExecutableSearcher=function(){
return _291.fileExecutableSearcherForURL(this.referenceURL());
};
var _306={};
_291.fileExecuterForURL=function(aURL){
var _307=_1b3(aURL),_308=_307.absoluteString(),_309=_306[_308];
if(!_309){
_309=function(aURL,_30a,_30b){
_291.fileExecutableSearcherForURL(_307)(aURL,_30a,function(_30c){
if(!_30c.hasLoadedFileDependencies()){
throw "No executable loaded for file at URL "+aURL;
}
_30c.execute(_30b);
});
};
_306[_308]=_309;
}
return _309;
};
var _30d={};
_291.fileImporterForURL=function(aURL){
var _30e=_1b3(aURL),_30f=_30e.absoluteString(),_310=_30d[_30f];
if(!_310){
_310=function(aURL,_311,_312){
_153();
_291.fileExecutableSearcherForURL(_30e)(aURL,_311,function(_313){
_313.loadFileDependencies(function(){
_313.execute();
_154();
if(_312){
_312();
}
});
});
};
_30d[_30f]=_310;
}
return _310;
};
var _314={},_315={};
_291.fileExecutableSearcherForURL=function(_316){
var _317=_316.absoluteString(),_318=_314[_317],_319={};
if(!_318){
_318=function(aURL,_31a,_31b){
var _31c=(_31a&&_316||"")+aURL,_31d=_315[_31c];
if(_31d){
return _31e(_31d);
}
var _31f=(aURL instanceof CFURL)&&aURL.scheme();
if(_31a||_31f){
if(!_31f){
aURL=new CFURL(aURL,_316);
}
_1a0.resolveResourceAtURL(aURL,NO,_31e);
}else{
_1a0.resolveResourceAtURLSearchingIncludeURLs(aURL,_31e);
}
function _31e(_320){
if(!_320){
throw new Error("Could not load file at "+aURL);
}
_315[_31c]=_320;
_31b(new _321(_320.URL()));
};
};
_314[_317]=_318;
}
return _318;
};
var _322={};
function _321(aURL){
aURL=_1b3(aURL);
var _323=aURL.absoluteString(),_324=_322[_323];
if(_324){
return _324;
}
_322[_323]=this;
var _325=_1a0.resourceAtURL(aURL).contents(),_326=NULL,_327=aURL.pathExtension();
if(_325.match(/^@STATIC;/)){
_326=_328(_325,aURL);
}else{
if(_327==="j"||!_327){
_326=_2.preprocess(_325,aURL,_285.Flags.IncludeDebugSymbols);
}else{
_326=new _291(_325,[],aURL);
}
}
_291.apply(this,[_326.code(),_326.fileDependencies(),aURL,_326._function]);
this._hasExecuted=NO;
};
_2.FileExecutable=_321;
_321.prototype=new _291();
_321.prototype.execute=function(_329){
if(this._hasExecuted&&!_329){
return;
}
this._hasExecuted=YES;
_291.prototype.execute.call(this);
};
_321.prototype.hasExecuted=function(){
return this._hasExecuted;
};
function _328(_32a,aURL){
var _32b=new _107(_32a);
var _32c=NULL,code="",_32d=[];
while(_32c=_32b.getMarker()){
var text=_32b.getString();
if(_32c===_20f){
code+=text;
}else{
if(_32c===_210){
_32d.push(new _2bf(new CFURL(text),NO));
}else{
if(_32c===_211){
_32d.push(new _2bf(new CFURL(text),YES));
}
}
}
}
var fn=_321._lookupCachedFunction(aURL);
if(fn){
return new _291(code,_32d,aURL,fn);
}
return new _291(code,_32d,aURL);
};
var _32e={};
_321._cacheFunction=function(aURL,fn){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
_32e[aURL]=fn;
};
_321._lookupCachedFunction=function(aURL){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
return _32e[aURL];
};
var _32f=1,_330=2,_331=4,_332=8;
objj_ivar=function(_333,_334){
this.name=_333;
this.type=_334;
};
objj_method=function(_335,_336,_337){
this.name=_335;
this.method_imp=_336;
this.types=_337;
};
objj_class=function(_338){
this.isa=NULL;
this.super_class=NULL;
this.sub_classes=[];
this.name=NULL;
this.info=0;
this.ivars=[];
this.method_list=[];
this.method_hash={};
this.method_store=function(){
};
this.method_dtable=this.method_store.prototype;
this.allocator=function(){
};
this._UID=-1;
};
objj_object=function(){
this.isa=NULL;
this._UID=-1;
};
class_getName=function(_339){
if(_339==Nil){
return "";
}
return _339.name;
};
class_isMetaClass=function(_33a){
if(!_33a){
return NO;
}
return ((_33a.info&(_330)));
};
class_getSuperclass=function(_33b){
if(_33b==Nil){
return Nil;
}
return _33b.super_class;
};
class_setSuperclass=function(_33c,_33d){
_33c.super_class=_33d;
_33c.isa.super_class=_33d.isa;
};
class_addIvar=function(_33e,_33f,_340){
var _341=_33e.allocator.prototype;
if(typeof _341[_33f]!="undefined"){
return NO;
}
_33e.ivars.push(new objj_ivar(_33f,_340));
_341[_33f]=NULL;
return YES;
};
class_addIvars=function(_342,_343){
var _344=0,_345=_343.length,_346=_342.allocator.prototype;
for(;_344<_345;++_344){
var ivar=_343[_344],name=ivar.name;
if(typeof _346[name]==="undefined"){
_342.ivars.push(ivar);
_346[name]=NULL;
}
}
};
class_copyIvarList=function(_347){
return _347.ivars.slice(0);
};
class_addMethod=function(_348,_349,_34a,_34b){
if(_348.method_hash[_349]){
return NO;
}
var _34c=new objj_method(_349,_34a,_34b);
_348.method_list.push(_34c);
_348.method_dtable[_349]=_34c;
if(!((_348.info&(_330)))&&(((_348.info&(_330)))?_348:_348.isa).isa===(((_348.info&(_330)))?_348:_348.isa)){
class_addMethod((((_348.info&(_330)))?_348:_348.isa),_349,_34a,_34b);
}
return YES;
};
class_addMethods=function(_34d,_34e){
var _34f=0,_350=_34e.length,_351=_34d.method_list,_352=_34d.method_dtable;
for(;_34f<_350;++_34f){
var _353=_34e[_34f];
if(_34d.method_hash[_353.name]){
continue;
}
_351.push(_353);
_352[_353.name]=_353;
}
if(!((_34d.info&(_330)))&&(((_34d.info&(_330)))?_34d:_34d.isa).isa===(((_34d.info&(_330)))?_34d:_34d.isa)){
class_addMethods((((_34d.info&(_330)))?_34d:_34d.isa),_34e);
}
};
class_getInstanceMethod=function(_354,_355){
if(!_354||!_355){
return NULL;
}
var _356=_354.method_dtable[_355];
return _356?_356:NULL;
};
class_getClassMethod=function(_357,_358){
if(!_357||!_358){
return NULL;
}
var _359=(((_357.info&(_330)))?_357:_357.isa).method_dtable[_358];
return _359?_359:NULL;
};
class_respondsToSelector=function(_35a,_35b){
return class_getClassMethod(_35a,_35b)!=NULL;
};
class_copyMethodList=function(_35c){
return _35c.method_list.slice(0);
};
class_replaceMethod=function(_35d,_35e,_35f){
if(!_35d||!_35e){
return NULL;
}
var _360=_35d.method_dtable[_35e],_361=NULL;
if(_360){
_361=_360.method_imp;
}
_360.method_imp=_35f;
return _361;
};
var _362=function(_363){
var meta=(((_363.info&(_330)))?_363:_363.isa);
if((_363.info&(_330))){
_363=objj_getClass(_363.name);
}
if(_363.super_class&&!((((_363.super_class.info&(_330)))?_363.super_class:_363.super_class.isa).info&(_331))){
_362(_363.super_class);
}
if(!(meta.info&(_331))&&!(meta.info&(_332))){
meta.info=(meta.info|(_332))&~(0);
objj_msgSend(_363,"initialize");
meta.info=(meta.info|(_331))&~(_332);
}
};
var _364=new objj_method("forward",function(self,_365){
return objj_msgSend(self,"forward::",_365,arguments);
});
class_getMethodImplementation=function(_366,_367){
if(!((((_366.info&(_330)))?_366:_366.isa).info&(_331))){
_362(_366);
}
var _368=_366.method_dtable[_367];
if(!_368){
_368=_364;
}
var _369=_368.method_imp;
return _369;
};
var _36a={};
objj_allocateClassPair=function(_36b,_36c){
var _36d=new objj_class(_36c),_36e=new objj_class(_36c),_36f=_36d;
if(_36b){
_36f=_36b;
while(_36f.superclass){
_36f=_36f.superclass;
}
_36d.allocator.prototype=new _36b.allocator;
_36d.method_store.prototype=new _36b.method_store;
_36d.method_dtable=_36d.method_store.prototype;
_36e.method_store.prototype=new _36b.isa.method_store;
_36e.method_dtable=_36e.method_store.prototype;
_36d.super_class=_36b;
_36e.super_class=_36b.isa;
}else{
_36d.allocator.prototype=new objj_object();
}
_36d.isa=_36e;
_36d.name=_36c;
_36d.info=_32f;
_36d._UID=objj_generateObjectUID();
_36e.isa=_36f.isa;
_36e.name=_36c;
_36e.info=_330;
_36e._UID=objj_generateObjectUID();
return _36d;
};
var _2eb=nil;
objj_registerClassPair=function(_370){
_1[_370.name]=_370;
_36a[_370.name]=_370;
_1ba(_370,_2eb);
};
class_createInstance=function(_371){
if(!_371){
throw new Error("*** Attempting to create object with Nil class.");
}
var _372=new _371.allocator();
_372.isa=_371;
_372._UID=objj_generateObjectUID();
return _372;
};
var _373=function(){
};
_373.prototype.member=false;
with(new _373()){
member=true;
}
if(new _373().member){
var _374=class_createInstance;
class_createInstance=function(_375){
var _376=_374(_375);
if(_376){
var _377=_376.isa,_378=_377;
while(_377){
var _379=_377.ivars,_37a=_379.length;
while(_37a--){
_376[_379[_37a].name]=NULL;
}
_377=_377.super_class;
}
_376.isa=_378;
}
return _376;
};
}
object_getClassName=function(_37b){
if(!_37b){
return "";
}
var _37c=_37b.isa;
return _37c?class_getName(_37c):"";
};
objj_lookUpClass=function(_37d){
var _37e=_36a[_37d];
return _37e?_37e:Nil;
};
objj_getClass=function(_37f){
var _380=_36a[_37f];
if(!_380){
}
return _380?_380:Nil;
};
objj_getMetaClass=function(_381){
var _382=objj_getClass(_381);
return (((_382.info&(_330)))?_382:_382.isa);
};
ivar_getName=function(_383){
return _383.name;
};
ivar_getTypeEncoding=function(_384){
return _384.type;
};
objj_msgSend=function(_385,_386){
if(_385==nil){
return nil;
}
var isa=_385.isa;
if(!((((isa.info&(_330)))?isa:isa.isa).info&(_331))){
_362(isa);
}
var _387=isa.method_dtable[_386];
if(!_387){
_387=_364;
}
var _388=_387.method_imp;
switch(arguments.length){
case 2:
return _388(_385,_386);
case 3:
return _388(_385,_386,arguments[2]);
case 4:
return _388(_385,_386,arguments[2],arguments[3]);
}
return _388.apply(_385,arguments);
};
objj_msgSendSuper=function(_389,_38a){
var _38b=_389.super_class;
arguments[0]=_389.receiver;
if(!((((_38b.info&(_330)))?_38b:_38b.isa).info&(_331))){
_362(_38b);
}
var _38c=_38b.method_dtable[_38a];
if(!_38c){
_38c=_364;
}
var _38d=_38c.method_imp;
return _38d.apply(_389.receiver,arguments);
};
method_getName=function(_38e){
return _38e.name;
};
method_getImplementation=function(_38f){
return _38f.method_imp;
};
method_setImplementation=function(_390,_391){
var _392=_390.method_imp;
_390.method_imp=_391;
return _392;
};
method_exchangeImplementations=function(lhs,rhs){
var _393=method_getImplementation(lhs),_394=method_getImplementation(rhs);
method_setImplementation(lhs,_394);
method_setImplementation(rhs,_393);
};
sel_getName=function(_395){
return _395?_395:"<null selector>";
};
sel_getUid=function(_396){
return _396;
};
sel_isEqual=function(lhs,rhs){
return lhs===rhs;
};
sel_registerName=function(_397){
return _397;
};
objj_eval=function(_398){
var url=_2.pageURL;
var _399=_2.asyncLoader;
_2.asyncLoader=NO;
var _39a=_2.preprocess(_398,url,0);
if(!_39a.hasLoadedFileDependencies()){
_39a.loadFileDependencies();
}
_1._objj_eval_scope={};
_1._objj_eval_scope.objj_executeFile=_291.fileExecuterForURL(url);
_1._objj_eval_scope.objj_importFile=_291.fileImporterForURL(url);
var code="with(_objj_eval_scope){"+_39a._code+"\n//*/\n}";
var _39b;
_39b=eval(code);
_2.asyncLoader=_399;
return _39b;
};
_2.objj_eval=objj_eval;
_153();
var _39c=new CFURL(window.location.href),_39d=document.getElementsByTagName("base"),_39e=_39d.length;
if(_39e>0){
var _39f=_39d[_39e-1],_3a0=_39f&&_39f.getAttribute("href");
if(_3a0){
_39c=new CFURL(_3a0,_39c);
}
}
var _3a1=new CFURL(window.OBJJ_MAIN_FILE||"main.j"),_1b9=new CFURL(".",new CFURL(_3a1,_39c)).absoluteURL(),_3a2=new CFURL("..",_1b9).absoluteURL();
if(_1b9===_3a2){
_3a2=new CFURL(_3a2.schemeAndAuthority());
}
_1a0.resourceAtURL(_3a2,YES);
_2.pageURL=_39c;
_2.bootstrap=function(){
_3a3();
};
function _3a3(){
_1a0.resolveResourceAtURL(_1b9,YES,function(_3a4){
var _3a5=_1a0.includeURLs(),_96=0,_3a6=_3a5.length;
for(;_96<_3a6;++_96){
_3a4.resourceAtURL(_3a5[_96],YES);
}
_291.fileImporterForURL(_1b9)(_3a1.lastPathComponent(),YES,function(){
_154();
_3ac(function(){
var _3a7=window.location.hash.substring(1),args=[];
if(_3a7.length){
args=_3a7.split("/");
for(var i=0,_3a6=args.length;i<_3a6;i++){
args[i]=decodeURIComponent(args[i]);
}
}
var _3a8=window.location.search.substring(1).split("&"),_3a9=new CFMutableDictionary();
for(var i=0,_3a6=_3a8.length;i<_3a6;i++){
var _3aa=_3a8[i].split("=");
if(!_3aa[0]){
continue;
}
if(_3aa[1]==null){
_3aa[1]=true;
}
_3a9.setValueForKey(decodeURIComponent(_3aa[0]),decodeURIComponent(_3aa[1]));
}
main(args,_3a9);
});
});
});
};
var _3ab=NO;
function _3ac(_3ad){
if(_3ab){
return _3ad();
}
if(window.addEventListener){
window.addEventListener("load",_3ad,NO);
}else{
if(window.attachEvent){
window.attachEvent("onload",_3ad);
}
}
};
_3ac(function(){
_3ab=YES;
});
if(typeof OBJJ_AUTO_BOOTSTRAP==="undefined"||OBJJ_AUTO_BOOTSTRAP){
_2.bootstrap();
}
function _1b3(aURL){
if(aURL instanceof CFURL&&aURL.scheme()){
return aURL;
}
return new CFURL(aURL,_1b9);
};
objj_importFile=_291.fileImporterForURL(_1b9);
objj_executeFile=_291.fileExecuterForURL(_1b9);
objj_import=function(){
CPLog.warn("objj_import is deprecated, use objj_importFile instead");
objj_importFile.apply(this,arguments);
};
})(window,ObjectiveJ);
