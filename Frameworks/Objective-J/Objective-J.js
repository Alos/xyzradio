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
if(v!==_44){
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
var _1b=new RegExp("([^%]+|%[\\+\\-\\ \\#0]*[0-9\\*]*(.[0-9\\*]+)?[hlL]?[cbBdieEfgGosuxXpn%@])","g");
var _1c=new RegExp("(%)([\\+\\-\\ \\#0]*)([0-9\\*]*)((.[0-9\\*]+)?)([hlL]?)([cbBdieEfgGosuxXpn%@])");
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
var _22=_21[1],_23=_21[2],_24=_21[3],_25=_21[4],_26=_21[6],_27=_21[7];
var _28=null;
if(_24=="*"){
_28=arguments[arg++];
}else{
if(_24!=""){
_28=Number(_24);
}
}
var _29=null;
if(_25==".*"){
_29=arguments[arg++];
}else{
if(_25!=""){
_29=Number(_25.substring(1));
}
}
var _2a=(_23.indexOf("-")>=0);
var _2b=(_23.indexOf("0")>=0);
var _2c="";
if(RegExp("[bBdiufeExXo]").test(_27)){
var num=Number(arguments[arg++]);
var _2d="";
if(num<0){
_2d="-";
}else{
if(_23.indexOf("+")>=0){
_2d="+";
}else{
if(_23.indexOf(" ")>=0){
_2d=" ";
}
}
}
if(_27=="d"||_27=="i"||_27=="u"){
var _2e=String(Math.abs(Math.floor(num)));
_2c=_2f(_2d,"",_2e,"",_28,_2a,_2b);
}
if(_27=="f"){
var _2e=String((_29!=null)?Math.abs(num).toFixed(_29):Math.abs(num));
var _30=(_23.indexOf("#")>=0&&_2e.indexOf(".")<0)?".":"";
_2c=_2f(_2d,"",_2e,_30,_28,_2a,_2b);
}
if(_27=="e"||_27=="E"){
var _2e=String(Math.abs(num).toExponential(_29!=null?_29:21));
var _30=(_23.indexOf("#")>=0&&_2e.indexOf(".")<0)?".":"";
_2c=_2f(_2d,"",_2e,_30,_28,_2a,_2b);
}
if(_27=="x"||_27=="X"){
var _2e=String(Math.abs(num).toString(16));
var _31=(_23.indexOf("#")>=0&&num!=0)?"0x":"";
_2c=_2f(_2d,_31,_2e,"",_28,_2a,_2b);
}
if(_27=="b"||_27=="B"){
var _2e=String(Math.abs(num).toString(2));
var _31=(_23.indexOf("#")>=0&&num!=0)?"0b":"";
_2c=_2f(_2d,_31,_2e,"",_28,_2a,_2b);
}
if(_27=="o"){
var _2e=String(Math.abs(num).toString(8));
var _31=(_23.indexOf("#")>=0&&num!=0)?"0":"";
_2c=_2f(_2d,_31,_2e,"",_28,_2a,_2b);
}
if(RegExp("[A-Z]").test(_27)){
_2c=_2c.toUpperCase();
}else{
_2c=_2c.toLowerCase();
}
}else{
var _2c="";
if(_27=="%"){
_2c="%";
}else{
if(_27=="c"){
_2c=String(arguments[arg++]).charAt(0);
}else{
if(_27=="s"||_27=="@"){
_2c=String(arguments[arg++]);
}else{
if(_27=="p"||_27=="n"){
arg++;
_2c="";
}
}
}
}
_2c=_2f("","",_2c,"",_28,_2a,false);
}
_20+=_2c;
}
}
return _20;
};
function _2f(_32,_33,_34,_35,_36,_37,_38){
var _39=(_32.length+_33.length+_34.length+_35.length);
if(_37){
return _32+_33+_34+_35+pad(_36-_39," ");
}else{
if(_38){
return _32+_33+pad(_36-_39,"0")+_34+_35;
}else{
return pad(_36-_39," ")+_32+_33+_34+_35;
}
}
};
function pad(n,ch){
return Array(MAX(0,n)+1).join(ch);
};
CPLogDisable=false;
var _3a="Cappuccino";
var _3b=["fatal","error","warn","info","debug","trace"];
var _3c=_3b[3];
var _3d={};
for(var i=0;i<_3b.length;i++){
_3d[_3b[i]]=i;
}
var _3e={};
CPLogRegister=function(_3f,_40){
CPLogRegisterRange(_3f,_3b[0],_40||_3b[_3b.length-1]);
};
CPLogRegisterRange=function(_41,_42,_43){
var min=_3d[_42];
var max=_3d[_43];
if(min!==_44&&max!==_44){
for(var i=0;i<=max;i++){
CPLogRegisterSingle(_41,_3b[i]);
}
}
};
CPLogRegisterSingle=function(_45,_46){
if(!_3e[_46]){
_3e[_46]=[];
}
for(var i=0;i<_3e[_46].length;i++){
if(_3e[_46][i]===_45){
return;
}
}
_3e[_46].push(_45);
};
CPLogUnregister=function(_47){
for(var _48 in _3e){
for(var i=0;i<_3e[_48].length;i++){
if(_3e[_48][i]===_47){
_3e[_48].splice(i--,1);
}
}
}
};
function _49(_4a,_4b,_4c){
if(_4c==_44){
_4c=_3a;
}
if(_4b==_44){
_4b=_3c;
}
var _4d=(typeof _4a[0]=="string"&&_4a.length>1)?_2.sprintf.apply(null,_4a):String(_4a[0]);
if(_3e[_4b]){
for(var i=0;i<_3e[_4b].length;i++){
_3e[_4b][i](_4d,_4b,_4c);
}
}
};
CPLog=function(){
_49(arguments);
};
for(var i=0;i<_3b.length;i++){
CPLog[_3b[i]]=(function(_4e){
return function(){
_49(arguments,_4e);
};
})(_3b[i]);
}
var _4f=function(_50,_51,_52){
var now=new Date();
_51=(_51==null?"":" ["+_51+"]");
if(typeof _2.sprintf=="function"){
return _2.sprintf("%4d-%02d-%02d %02d:%02d:%02d.%03d %s%s: %s",now.getFullYear(),now.getMonth(),now.getDate(),now.getHours(),now.getMinutes(),now.getSeconds(),now.getMilliseconds(),_52,_51,_50);
}else{
return now+" "+_52+_51+": "+_50;
}
};
CPLogConsole=function(_53,_54,_55){
if(typeof console!="undefined"){
var _56=_4f(_53,_54,_55);
var _57={"fatal":"error","error":"error","warn":"warn","info":"info","debug":"debug","trace":"debug"}[_54];
if(_57&&console[_57]){
console[_57](_56);
}else{
if(console.log){
console.log(_56);
}
}
}
};
CPLogAlert=function(_58,_59,_5a){
if(typeof alert!="undefined"&&!CPLogDisable){
var _5b=_4f(_58,_59,_5a);
CPLogDisable=!confirm(_5b+"\n\n(Click cancel to stop log alerts)");
}
};
var _5c=null;
CPLogPopup=function(_5d,_5e,_5f){
try{
if(CPLogDisable||window.open==_44){
return;
}
if(!_5c||!_5c.document){
_5c=window.open("","_blank","width=600,height=400,status=no,resizable=yes,scrollbars=yes");
if(!_5c){
CPLogDisable=!confirm(_5d+"\n\n(Disable pop-up blocking for CPLog window; Click cancel to stop log alerts)");
return;
}
_60(_5c);
}
var _61=_5c.document.createElement("div");
_61.setAttribute("class",_5e||"fatal");
var _62=_4f(_5d,null,_5f);
_61.appendChild(_5c.document.createTextNode(_62));
_5c.log.appendChild(_61);
if(_5c.focusEnabled.checked){
_5c.focus();
}
if(_5c.blockEnabled.checked){
_5c.blockEnabled.checked=_5c.confirm(_62+"\nContinue blocking?");
}
if(_5c.scrollEnabled.checked){
_5c.scrollToBottom();
}
}
catch(e){
}
};
var _63="<style type=\"text/css\" media=\"screen\"> body{font:10px Monaco,Courier,\"Courier New\",monospace,mono;padding-top:15px;} div > .fatal,div > .error,div > .warn,div > .info,div > .debug,div > .trace{display:none;overflow:hidden;white-space:pre;padding:0px 5px 0px 5px;margin-top:2px;-moz-border-radius:5px;-webkit-border-radius:5px;} div[wrap=\"yes\"] > div{white-space:normal;} .fatal{background-color:#ffb2b3;} .error{background-color:#ffe2b2;} .warn{background-color:#fdffb2;} .info{background-color:#e4ffb2;} .debug{background-color:#a0e5a0;} .trace{background-color:#99b9ff;} .enfatal .fatal,.enerror .error,.enwarn .warn,.eninfo .info,.endebug .debug,.entrace .trace{display:block;} div#header{background-color:rgba(240,240,240,0.82);position:fixed;top:0px;left:0px;width:100%;border-bottom:1px solid rgba(0,0,0,0.33);text-align:center;} ul#enablers{display:inline-block;margin:1px 15px 0 15px;padding:2px 0 2px 0;} ul#enablers li{display:inline;padding:0px 5px 0px 5px;margin-left:4px;-moz-border-radius:5px;-webkit-border-radius:5px;} [enabled=\"no\"]{opacity:0.25;} ul#options{display:inline-block;margin:0 15px 0px 15px;padding:0 0px;} ul#options li{margin:0 0 0 0;padding:0 0 0 0;display:inline;} </style>";
function _60(_64){
var doc=_64.document;
doc.writeln("<html><head><title></title>"+_63+"</head><body></body></html>");
doc.title=_3a+" Run Log";
var _65=doc.getElementsByTagName("head")[0];
var _66=doc.getElementsByTagName("body")[0];
var _67=window.location.protocol+"//"+window.location.host+window.location.pathname;
_67=_67.substring(0,_67.lastIndexOf("/")+1);
var div=doc.createElement("div");
div.setAttribute("id","header");
_66.appendChild(div);
var ul=doc.createElement("ul");
ul.setAttribute("id","enablers");
div.appendChild(ul);
for(var i=0;i<_3b.length;i++){
var li=doc.createElement("li");
li.setAttribute("id","en"+_3b[i]);
li.setAttribute("class",_3b[i]);
li.setAttribute("onclick","toggle(this);");
li.setAttribute("enabled","yes");
li.appendChild(doc.createTextNode(_3b[i]));
ul.appendChild(li);
}
var ul=doc.createElement("ul");
ul.setAttribute("id","options");
div.appendChild(ul);
var _68={"focus":["Focus",false],"block":["Block",false],"wrap":["Wrap",false],"scroll":["Scroll",true],"close":["Close",true]};
for(o in _68){
var li=doc.createElement("li");
ul.appendChild(li);
_64[o+"Enabled"]=doc.createElement("input");
_64[o+"Enabled"].setAttribute("id",o);
_64[o+"Enabled"].setAttribute("type","checkbox");
if(_68[o][1]){
_64[o+"Enabled"].setAttribute("checked","checked");
}
li.appendChild(_64[o+"Enabled"]);
var _69=doc.createElement("label");
_69.setAttribute("for",o);
_69.appendChild(doc.createTextNode(_68[o][0]));
li.appendChild(_69);
}
_64.log=doc.createElement("div");
_64.log.setAttribute("class","enerror endebug enwarn eninfo enfatal entrace");
_66.appendChild(_64.log);
_64.toggle=function(_6a){
var _6b=(_6a.getAttribute("enabled")=="yes")?"no":"yes";
_6a.setAttribute("enabled",_6b);
if(_6b=="yes"){
_64.log.className+=" "+_6a.id;
}else{
_64.log.className=_64.log.className.replace(new RegExp("[\\s]*"+_6a.id,"g"),"");
}
};
_64.scrollToBottom=function(){
_64.scrollTo(0,_66.offsetHeight);
};
_64.wrapEnabled.addEventListener("click",function(){
_64.log.setAttribute("wrap",_64.wrapEnabled.checked?"yes":"no");
},false);
_64.addEventListener("keydown",function(e){
var e=e||_64.event;
if(e.keyCode==75&&(e.ctrlKey||e.metaKey)){
while(_64.log.firstChild){
_64.log.removeChild(_64.log.firstChild);
}
e.preventDefault();
}
},"false");
window.addEventListener("unload",function(){
if(_64&&_64.closeEnabled&&_64.closeEnabled.checked){
CPLogDisable=true;
_64.close();
}
},false);
_64.addEventListener("unload",function(){
if(!CPLogDisable){
CPLogDisable=!confirm("Click cancel to stop logging");
}
},false);
};
var _44;
if(typeof window!=="undefined"){
window.setNativeTimeout=window.setTimeout;
window.clearNativeTimeout=window.clearTimeout;
window.setNativeInterval=window.setInterval;
window.clearNativeInterval=window.clearNativeInterval;
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
function _6c(_6d){
this._eventListenersForEventNames={};
this._owner=_6d;
};
_6c.prototype.addEventListener=function(_6e,_6f){
var _70=this._eventListenersForEventNames;
if(!_71.call(_70,_6e)){
var _72=[];
_70[_6e]=_72;
}else{
var _72=_70[_6e];
}
var _73=_72.length;
while(_73--){
if(_72[_73]===_6f){
return;
}
}
_72.push(_6f);
};
_6c.prototype.removeEventListener=function(_74,_75){
var _76=this._eventListenersForEventNames;
if(!_71.call(_76,_74)){
return;
}
var _77=_76[_74],_78=_77.length;
while(_78--){
if(_77[_78]===_75){
return _77.splice(_78,1);
}
}
};
_6c.prototype.dispatchEvent=function(_79){
var _7a=_79.type,_7b=this._eventListenersForEventNames;
if(_71.call(_7b,_7a)){
var _7c=this._eventListenersForEventNames[_7a],_7d=0,_7e=_7c.length;
for(;_7d<_7e;++_7d){
_7c[_7d](_79);
}
}
var _7f=(this._owner||this)["on"+_7a];
if(_7f){
_7f(_79);
}
};
var _80=0,_81=null,_82=[];
function _83(_84){
var _85=_80;
if(_81===null){
window.setNativeTimeout(function(){
var _86=_82,_87=0,_88=_82.length;
++_80;
_81=null;
_82=[];
for(;_87<_88;++_87){
_86[_87]();
}
},0);
}
return function(){
var _89=arguments;
if(_80>_85){
_84.apply(this,_89);
}else{
_82.push(function(){
_84.apply(this,_89);
});
}
};
};
var _8a=null;
if(window.ActiveXObject!==_44){
var _8b=["Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP.6.0"],_8c=_8b.length;
while(_8c--){
try{
var _8d=_8b[_8c];
new ActiveXObject(_8d);
_8a=function(){
return new ActiveXObject(_8d);
};
break;
}
catch(anException){
}
}
}
if(!_8a){
_8a=window.XMLHttpRequest;
}
CFHTTPRequest=function(){
this._eventDispatcher=new _6c(this);
this._nativeRequest=new _8a();
var _8e=this;
this._nativeRequest.onreadystatechange=function(){
_8f(_8e);
};
};
CFHTTPRequest.UninitializedState=0;
CFHTTPRequest.LoadingState=1;
CFHTTPRequest.LoadedState=2;
CFHTTPRequest.InteractiveState=3;
CFHTTPRequest.CompleteState=4;
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
var _90=this.status();
if(_90>=200&&_90<300){
return YES;
}
return _90===0&&this.responseText()&&this.responseText().length;
};
CFHTTPRequest.prototype.responseXML=function(){
var _91=this._nativeRequest.responseXML;
if(_91&&(_8a===window.XMLHttpRequest)){
return _91;
}
return _92(this.responseText());
};
CFHTTPRequest.prototype.responsePropertyList=function(){
var _93=this.responseText();
if(CFPropertyList.sniffedFormatOfString(_93)===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(this.responseXML());
}
return CFPropertyList.propertyListFromString(_93);
};
CFHTTPRequest.prototype.responseText=function(){
return this._nativeRequest.responseText;
};
CFHTTPRequest.prototype.setRequestHeader=function(_94,_95){
return this._nativeRequest.setRequestHeader(_94,_95);
};
CFHTTPRequest.prototype.getResponseHeader=function(_96){
return this._nativeRequest.getResponseHeader(_96);
};
CFHTTPRequest.prototype.getAllResponseHeaders=function(){
return this._nativeRequest.getAllResponseHeaders();
};
CFHTTPRequest.prototype.overrideMimeType=function(_97){
if("overrideMimeType" in this._nativeRequest){
return this._nativeRequest.overrideMimeType(_97);
}
};
CFHTTPRequest.prototype.open=function(){
return this._nativeRequest.open(arguments[0],arguments[1],arguments[2],arguments[3],arguments[4]);
};
CFHTTPRequest.prototype.send=function(_98){
try{
return this._nativeRequest.send(_98);
}
catch(anException){
this._eventDispatcher.dispatchEvent({type:"failure",request:this});
}
};
CFHTTPRequest.prototype.abort=function(){
return this._nativeRequest.abort();
};
CFHTTPRequest.prototype.addEventListener=function(_99,_9a){
this._eventDispatcher.addEventListener(_99,_9a);
};
CFHTTPRequest.prototype.removeEventListener=function(_9b,_9c){
this._eventDispatcher.removeEventListener(_9b,_9c);
};
function _8f(_9d){
var _9e=_9d._eventDispatcher;
_9e.dispatchEvent({type:"readystatechange",request:_9d});
var _9f=_9d._nativeRequest,_a0=["uninitialized","loading","loaded","interactive","complete"][_9d.readyState()];
_9e.dispatchEvent({type:_a0,request:_9d});
if(_a0==="complete"){
var _a1="HTTP"+_9d.status();
_9e.dispatchEvent({type:_a1,request:_9d});
var _a2=_9d.success()?"success":"failure";
_9e.dispatchEvent({type:_a2,request:_9d});
}
};
function _a3(_a4,_a5,_a6){
var _a7=new CFHTTPRequest();
if(_a4.pathExtension()==="plist"){
_a7.overrideMimeType("text/xml");
}
if(_a3.async){
_a7.onsuccess=_83(_a5);
_a7.onfailure=_83(_a6);
}else{
_a7.onsuccess=_a5;
_a7.onfailure=_a6;
}
_a7.open("GET",_a4.absoluteString(),_a3.async);
_a7.send("");
};
_a3.async=YES;
var _a8=0;
objj_generateObjectUID=function(){
return _a8++;
};
CFPropertyList=function(){
this._UID=objj_generateObjectUID();
};
CFPropertyList.DTDRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?/i;
CFPropertyList.XMLRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?<\s*plist[^>]*\>/i;
CFPropertyList.FormatXMLDTD="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">";
CFPropertyList.Format280NorthMagicNumber="280NPLIST";
CFPropertyList.FormatOpenStep=1,CFPropertyList.FormatXML_v1_0=100,CFPropertyList.FormatBinary_v1_0=200,CFPropertyList.Format280North_v1_0=-1000;
CFPropertyList.sniffedFormatOfString=function(_a9){
if(_a9.match(CFPropertyList.XMLRE)){
return CFPropertyList.FormatXML_v1_0;
}
if(_a9.substr(0,CFPropertyList.Format280NorthMagicNumber.length)===CFPropertyList.Format280NorthMagicNumber){
return CFPropertyList.Format280North_v1_0;
}
return NULL;
};
CFPropertyList.dataFromPropertyList=function(_aa,_ab){
var _ac=new CFMutableData();
_ac.setRawString(CFPropertyList.stringFromPropertyList(_aa,_ab));
return _ac;
};
CFPropertyList.stringFromPropertyList=function(_ad,_ae){
if(!_ae){
_ae=CFPropertyList.Format280North_v1_0;
}
var _af=_b0[_ae];
return _af["start"]()+_b1(_ad,_af)+_af["finish"]();
};
function _b1(_b2,_b3){
var _b4=typeof _b2,_b5=_b2.valueOf(),_b6=typeof _b5;
if(_b4!==_b6){
_b4=_b6;
_b2=_b5;
}
if(_b2===YES||_b2===NO){
_b4="boolean";
}else{
if(_b4==="number"){
if(FLOOR(_b2)===_b2){
_b4="integer";
}else{
_b4="real";
}
}else{
if(_b4!=="string"){
if(_b2.slice){
_b4="array";
}else{
_b4="dictionary";
}
}
}
}
return _b3[_b4](_b2,_b3);
};
var _b0={};
_b0[CFPropertyList.FormatXML_v1_0]={"start":function(){
return CFPropertyList.FormatXMLDTD+"<plist version = \"1.0\">";
},"finish":function(){
return "</plist>";
},"string":function(_b7){
return "<string>"+_b8(_b7)+"</string>";
},"boolean":function(_b9){
return _b9?"<true/>":"<false/>";
},"integer":function(_ba){
return "<integer>"+_ba+"</integer>";
},"real":function(_bb){
return "<real>"+_bb+"</real>";
},"array":function(_bc,_bd){
var _be=0,_bf=_bc.length,_c0="<array>";
for(;_be<_bf;++_be){
_c0+=_b1(_bc[_be],_bd);
}
return _c0+"</array>";
},"dictionary":function(_c1,_c2){
var _c3=_c1._keys,_8c=0,_c4=_c3.length,_c5="<dict>";
for(;_8c<_c4;++_8c){
var key=_c3[_8c];
_c5+="<key>"+key+"</key>";
_c5+=_b1(_c1.valueForKey(key),_c2);
}
return _c5+"</dict>";
}};
var _c6="A",_c7="D",_c8="f",_c9="d",_ca="S",_cb="T",_cc="F",_cd="K",_ce="E";
_b0[CFPropertyList.Format280North_v1_0]={"start":function(){
return CFPropertyList.Format280NorthMagicNumber+";1.0;";
},"finish":function(){
return "";
},"string":function(_cf){
return _ca+";"+_cf.length+";"+_cf;
},"boolean":function(_d0){
return (_d0?_cb:_cc)+";";
},"integer":function(_d1){
var _d2=""+_d1;
return _c9+";"+_d2.length+";"+_d2;
},"real":function(_d3){
var _d4=""+_d3;
return _c8+";"+_d4.length+";"+_d4;
},"array":function(_d5,_d6){
var _d7=0,_d8=_d5.length,_d9=_c6+";";
for(;_d7<_d8;++_d7){
_d9+=_b1(_d5[_d7],_d6);
}
return _d9+_ce+";";
},"dictionary":function(_da,_db){
var _dc=_da._keys,_8c=0,_dd=_dc.length,_de=_c7+";";
for(;_8c<_dd;++_8c){
var key=_dc[_8c];
_de+=_cd+";"+key.length+";"+key;
_de+=_b1(_da.valueForKey(key),_db);
}
return _de+_ce+";";
}};
var _df="xml",_e0="#document",_e1="plist",_e2="key",_e3="dict",_e4="array",_e5="string",_e6="true",_e7="false",_e8="real",_e9="integer",_ea="data";
var _eb=function(_ec,_ed,_ee){
var _ef=_ec;
_ef=(_ef.firstChild);
if(_ef!==NULL&&((_ef.nodeType)===8||(_ef.nodeType)===3)){
while((_ef=(_ef.nextSibling))&&((_ef.nodeType)===8||(_ef.nodeType)===3)){
}
}
if(_ef){
return _ef;
}
if((String(_ec.nodeName))===_e4||(String(_ec.nodeName))===_e3){
_ee.pop();
}else{
if(_ef===_ed){
return NULL;
}
_ef=_ec;
while((_ef=(_ef.nextSibling))&&((_ef.nodeType)===8||(_ef.nodeType)===3)){
}
if(_ef){
return _ef;
}
}
_ef=_ec;
while(_ef){
var _f0=_ef;
while((_f0=(_f0.nextSibling))&&((_f0.nodeType)===8||(_f0.nodeType)===3)){
}
if(_f0){
return _f0;
}
var _ef=(_ef.parentNode);
if(_ed&&_ef===_ed){
return NULL;
}
_ee.pop();
}
return NULL;
};
CFPropertyList.propertyListFromData=function(_f1,_f2){
return CFPropertyList.propertyListFromString(_f1.rawString(),_f2);
};
CFPropertyList.propertyListFromString=function(_f3,_f4){
if(!_f4){
_f4=CFPropertyList.sniffedFormatOfString(_f3);
}
if(_f4===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(_f3);
}
if(_f4===CFPropertyList.Format280North_v1_0){
return _f5(_f3);
}
return NULL;
};
var _c6="A",_c7="D",_c8="f",_c9="d",_ca="S",_cb="T",_cc="F",_cd="K",_ce="E";
function _f5(_f6){
var _f7=new _f8(_f6),_f9=NULL,key="",_fa=NULL,_fb=NULL,_fc=[],_fd=NULL;
while(_f9=_f7.getMarker()){
if(_f9===_ce){
_fc.pop();
continue;
}
var _fe=_fc.length;
if(_fe){
_fd=_fc[_fe-1];
}
if(_f9===_cd){
key=_f7.getString();
_f9=_f7.getMarker();
}
switch(_f9){
case _c6:
_fa=[];
_fc.push(_fa);
break;
case _c7:
_fa=new CFMutableDictionary();
_fc.push(_fa);
break;
case _c8:
_fa=parseFloat(_f7.getString());
break;
case _c9:
_fa=parseInt(_f7.getString(),10);
break;
case _ca:
_fa=_f7.getString();
break;
case _cb:
_fa=YES;
break;
case _cc:
_fa=NO;
break;
default:
throw new Error("*** "+_f9+" marker not recognized in Plist.");
}
if(!_fb){
_fb=_fa;
}else{
if(_fd){
if(_fd.slice){
_fd.push(_fa);
}else{
_fd.setValueForKey(key,_fa);
}
}
}
}
return _fb;
};
function _b8(_ff){
return _ff.replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&apos;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
};
function _100(_101){
return _101.replace(/&quot;/g,"\"").replace(/&apos;/g,"'").replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&amp;/g,"&");
};
function _92(_102){
if(window.DOMParser){
return (new window.DOMParser().parseFromString(_102,"text/xml").documentElement);
}else{
if(window.ActiveXObject){
XMLNode=new ActiveXObject("Microsoft.XMLDOM");
var _103=_102.match(CFPropertyList.DTDRE);
if(_103){
_102=_102.substr(_103[0].length);
}
XMLNode.loadXML(_102);
return XMLNode;
}
}
return NULL;
};
CFPropertyList.propertyListFromXML=function(_104){
var _105=_104;
if(_104.valueOf&&typeof _104.valueOf()==="string"){
_105=_92(_104);
}
while(((String(_105.nodeName))===_e0)||((String(_105.nodeName))===_df)){
_105=(_105.firstChild);
}
if(_105!==NULL&&((_105.nodeType)===8||(_105.nodeType)===3)){
while((_105=(_105.nextSibling))&&((_105.nodeType)===8||(_105.nodeType)===3)){
}
}
if(((_105.nodeType)===10)){
while((_105=(_105.nextSibling))&&((_105.nodeType)===8||(_105.nodeType)===3)){
}
}
if(!((String(_105.nodeName))===_e1)){
return NULL;
}
var key="",_106=NULL,_107=NULL,_108=_105,_109=[],_10a=NULL;
while(_105=_eb(_105,_108,_109)){
var _10b=_109.length;
if(_10b){
_10a=_109[_10b-1];
}
if((String(_105.nodeName))===_e2){
key=((String((_105.firstChild).nodeValue)));
while((_105=(_105.nextSibling))&&((_105.nodeType)===8||(_105.nodeType)===3)){
}
}
switch(String((String(_105.nodeName)))){
case _e4:
_106=[];
_109.push(_106);
break;
case _e3:
_106=new CFMutableDictionary();
_109.push(_106);
break;
case _e8:
_106=parseFloat(((String((_105.firstChild).nodeValue))));
break;
case _e9:
_106=parseInt(((String((_105.firstChild).nodeValue))),10);
break;
case _e5:
_106=_100((_105.firstChild)?((String((_105.firstChild).nodeValue))):"");
break;
case _e6:
_106=YES;
break;
case _e7:
_106=NO;
break;
case _ea:
_106=new CFMutableData();
_106.bytes=(_105.firstChild)?CFData.decodeBase64ToArray(((String((_105.firstChild).nodeValue))),YES):[];
break;
default:
throw new Error("*** "+(String(_105.nodeName))+" tag not recognized in Plist.");
}
if(!_107){
_107=_106;
}else{
if(_10a){
if(_10a.slice){
_10a.push(_106);
}else{
_10a.setValueForKey(key,_106);
}
}
}
}
return _107;
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
CFPropertyListCreateXMLData=function(_10c){
return CFPropertyList.dataFromPropertyList(_10c,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateFrom280NorthData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.Format280North_v1_0);
};
CFPropertyListCreate280NorthData=function(_10d){
return CFPropertyList.dataFromPropertyList(_10d,CFPropertyList.Format280North_v1_0);
};
CPPropertyListCreateFromData=function(data,_10e){
return CFPropertyList.propertyListFromData(data,_10e);
};
CPPropertyListCreateData=function(_10f,_110){
return CFPropertyList.dataFromPropertyList(_10f,_110);
};
CFDictionary=function(_111){
this._keys=[];
this._count=0;
this._buckets={};
this._UID=objj_generateObjectUID();
};
var _112=Array.prototype.indexOf,_71=Object.prototype.hasOwnProperty;
CFDictionary.prototype.copy=function(){
return this;
};
CFDictionary.prototype.mutableCopy=function(){
var _113=new CFMutableDictionary(),keys=this._keys,_114=this._count;
_113._keys=keys.slice();
_113._count=_114;
var _115=0,_116=this._buckets,_117=_113._buckets;
for(;_115<_114;++_115){
var key=keys[_115];
_117[key]=_116[key];
}
return _113;
};
CFDictionary.prototype.containsKey=function(aKey){
return _71.apply(this._buckets,[aKey]);
};
CFDictionary.prototype.containsValue=function(_118){
var keys=this._keys,_119=this._buckets,_8c=0,_11a=keys.length;
for(;_8c<_11a;++_8c){
if(_119[keys]===_118){
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
CFDictionary.prototype.countOfValue=function(_11b){
var keys=this._keys,_11c=this._buckets,_8c=0,_11d=keys.length,_11e=0;
for(;_8c<_11d;++_8c){
if(_11c[keys]===_11b){
return ++_11e;
}
}
return _11e;
};
CFDictionary.prototype.keys=function(){
return this._keys.slice();
};
CFDictionary.prototype.valueForKey=function(aKey){
var _11f=this._buckets;
if(!_71.apply(_11f,[aKey])){
return nil;
}
return _11f[aKey];
};
CFDictionary.prototype.toString=function(){
var _120="{\n",keys=this._keys,_8c=0,_121=this._count;
for(;_8c<_121;++_8c){
var key=keys[_8c];
_120+="\t"+key+" = \""+String(this.valueForKey(key)).split("\n").join("\n\t")+"\"\n";
}
return _120+"}";
};
CFMutableDictionary=function(_122){
CFDictionary.apply(this,[]);
};
CFMutableDictionary.prototype=new CFDictionary();
CFMutableDictionary.prototype.copy=function(){
return this.mutableCopy();
};
CFMutableDictionary.prototype.addValueForKey=function(aKey,_123){
if(this.containsKey(aKey)){
return;
}
++this._count;
this._keys.push(aKey);
this._buckets[aKey]=_123;
};
CFMutableDictionary.prototype.removeValueForKey=function(aKey){
var _124=-1;
if(_112){
_124=_112.call(this._keys,aKey);
}else{
var keys=this._keys,_8c=0,_125=keys.length;
for(;_8c<_125;++_8c){
if(keys[_8c]===aKey){
_124=_8c;
break;
}
}
}
if(_124===-1){
return;
}
--this._count;
this._keys.splice(_124,1);
delete this._buckets[aKey];
};
CFMutableDictionary.prototype.removeAllValues=function(){
this._count=0;
this._keys=[];
this._buckets={};
};
CFMutableDictionary.prototype.replaceValueForKey=function(aKey,_126){
if(!this.containsKey(aKey)){
return;
}
this._buckets[aKey]=_126;
};
CFMutableDictionary.prototype.setValueForKey=function(aKey,_127){
if(_127===nil||_127===_44){
this.removeValueForKey(aKey);
}else{
if(this.containsKey(aKey)){
this.replaceValueForKey(aKey,_127);
}else{
this.addValueForKey(aKey,_127);
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
function _128(_129){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFMutableData.prototype.setPropertyList=function(_12a,_12b){
_128(this);
this._propertyList=_12a;
this._propertyListFormat=_12b;
};
CFMutableData.prototype.setJSONObject=function(_12c){
_128(this);
this._JSONObject=_12c;
};
CFMutableData.prototype.setRawString=function(_12d){
_128(this);
this._rawString=_12d;
};
CFMutableData.prototype.setBytes=function(_12e){
_128(this);
this._bytes=_12e;
};
CFMutableData.prototype.setBase64String=function(_12f){
_128(this);
this._base64=_12f;
};
var _130=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/","="],_131=[];
for(var i=0;i<_130.length;i++){
_131[_130[i].charCodeAt(0)]=i;
}
CFData.decodeBase64ToArray=function(_132,_133){
if(_133){
_132=_132.replace(/[^A-Za-z0-9\+\/\=]/g,"");
}
var pad=(_132[_132.length-1]=="="?1:0)+(_132[_132.length-2]=="="?1:0),_134=_132.length,_135=[];
var i=0;
while(i<_134){
var bits=(_131[_132.charCodeAt(i++)]<<18)|(_131[_132.charCodeAt(i++)]<<12)|(_131[_132.charCodeAt(i++)]<<6)|(_131[_132.charCodeAt(i++)]);
_135.push((bits&16711680)>>16);
_135.push((bits&65280)>>8);
_135.push(bits&255);
}
if(pad>0){
return _135.slice(0,-1*pad);
}
return _135;
};
CFData.encodeBase64Array=function(_136){
var pad=(3-(_136.length%3))%3,_137=_136.length+pad,_138=[];
if(pad>0){
_136.push(0);
}
if(pad>1){
_136.push(0);
}
var i=0;
while(i<_137){
var bits=(_136[i++]<<16)|(_136[i++]<<8)|(_136[i++]);
_138.push(_130[(bits&16515072)>>18]);
_138.push(_130[(bits&258048)>>12]);
_138.push(_130[(bits&4032)>>6]);
_138.push(_130[bits&63]);
}
if(pad>0){
_138[_138.length-1]="=";
_136.pop();
}
if(pad>1){
_138[_138.length-2]="=";
_136.pop();
}
return _138.join("");
};
CFData.decodeBase64ToString=function(_139,_13a){
return CFData.bytesToString(CFData.decodeBase64ToArray(_139,_13a));
};
CFData.bytesToString=function(_13b){
return String.fromCharCode.apply(NULL,_13b);
};
CFData.encodeBase64String=function(_13c){
var temp=[];
for(var i=0;i<_13c.length;i++){
temp.push(_13c.charCodeAt(i));
}
return CFData.encodeBase64Array(temp);
};
var _13d,_13e,_13f=0;
function _140(){
if(++_13f!==1){
return;
}
_13d={};
_13e={};
};
function _141(){
_13f=MAX(_13f-1,0);
if(_13f!==0){
return;
}
delete _13d;
delete _13e;
};
var _142=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"([^?#]*)"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _143=["url","scheme","authorityRoot","authority","userInfo","user","password","domain","portNumber","path","queryString","fragment"];
function _144(aURL){
if(aURL._parts){
return aURL._parts;
}
var _145=aURL.string(),_146=_145.match(/^mhtml:/);
if(_146){
_145=_145.substr("mhtml:".length);
}
if(_13f>0&&_71.call(_13e,_145)){
aURL._parts=_13e[_145];
return aURL._parts;
}
aURL._parts={};
var _147=aURL._parts,_148=_142.exec(_145),_8c=_148.length;
while(_8c--){
_147[_143[_8c]]=_148[_8c]||NULL;
}
_147.portNumber=parseInt(_147.portNumber,10);
if(isNaN(_147.portNumber)){
_147.portNumber=-1;
}
_147.pathComponents=[];
if(_147.path){
var _149=_147.path.split("/"),_14a=_147.pathComponents,_8c=0,_14b=_149.length;
for(;_8c<_14b;++_8c){
var _14c=_149[_8c];
if(_14c){
_14a.push(_14c);
}else{
if(_8c===0){
_14a.push("/");
}
}
}
_147.pathComponents=_14a;
}
if(_146){
_147.url="mhtml:"+_147.url;
_147.scheme="mhtml:"+_147.scheme;
}
if(_13f>0){
_13e[_145]=_147;
}
return _147;
};
CFURL=function(aURL,_14d){
aURL=aURL||"";
if(aURL instanceof CFURL){
if(!_14d){
return aURL;
}
var _14e=aURL.baseURL();
if(_14e){
_14d=new CFURL(_14e.absoluteURL(),_14d);
}
aURL=aURL.string();
}
if(_13f>0){
var _14f=aURL+" "+(_14d&&_14d.UID()||"");
if(_71.call(_13d,_14f)){
return _13d[_14f];
}
_13d[_14f]=this;
}
if(aURL.match(/^data:/)){
var _150={},_8c=_143.length;
while(_8c--){
_150[_143[_8c]]="";
}
_150.url=aURL;
_150.scheme="data";
_150.pathComponents=[];
this._parts=_150;
this._standardizedURL=this;
this._absoluteURL=this;
}
this._UID=objj_generateObjectUID();
this._string=aURL;
this._baseURL=_14d;
};
CFURL.prototype.UID=function(){
return this._UID;
};
var _151={};
CFURL.prototype.mappedURL=function(){
return _151[this.absoluteString()]||this;
};
CFURL.setMappedURLForURL=function(_152,_153){
_151[_152.absoluteString()]=_153;
};
CFURL.prototype.schemeAndAuthority=function(){
var _154="",_155=this.scheme();
if(_155){
_154+=_155+":";
}
var _156=this.authority();
if(_156){
_154+="//"+_156;
}
return _154;
};
CFURL.prototype.absoluteString=function(){
if(this._absoluteString===_44){
this._absoluteString=this.absoluteURL().string();
}
return this._absoluteString;
};
CFURL.prototype.toString=function(){
return this.absoluteString();
};
function _157(aURL){
aURL=aURL.standardizedURL();
var _158=aURL.baseURL();
if(!_158){
return aURL;
}
var _159=((aURL)._parts||_144(aURL)),_15a,_15b=_158.absoluteURL(),_15c=((_15b)._parts||_144(_15b));
if(_159.scheme||_159.authority){
_15a=_159;
}else{
_15a={};
_15a.scheme=_15c.scheme;
_15a.authority=_15c.authority;
_15a.userInfo=_15c.userInfo;
_15a.user=_15c.user;
_15a.password=_15c.password;
_15a.domain=_15c.domain;
_15a.portNumber=_15c.portNumber;
_15a.queryString=_159.queryString;
_15a.fragment=_159.fragment;
var _15d=_159.pathComponents;
if(_15d.length&&_15d[0]==="/"){
_15a.path=_159.path;
_15a.pathComponents=_15d;
}else{
var _15e=_15c.pathComponents,_15f=_15e.concat(_15d);
if(!_158.hasDirectoryPath()&&_15e.length){
_15f.splice(_15e.length-1,1);
}
if(_15d.length&&_15d[0]===".."){
_160(_15f,YES);
}
_15a.pathComponents=_15f;
_15a.path=_161(_15f,_15d.length<=0||aURL.hasDirectoryPath());
}
}
var _162=_163(_15a),_164=new CFURL(_162);
_164._parts=_15a;
_164._standardizedURL=_164;
_164._standardizedString=_162;
_164._absoluteURL=_164;
_164._absoluteString=_162;
return _164;
};
function _161(_165,_166){
var path=_165.join("/");
if(path.length&&path.charAt(0)==="/"){
path=path.substr(1);
}
if(_166){
path+="/";
}
return path;
};
function _160(_167,_168){
var _169=0,_16a=0,_16b=_167.length,_16c=_168?_167:[];
for(;_169<_16b;++_169){
var _16d=_167[_169];
if(_16d===""||_16d==="."){
continue;
}
if(_16d!==".."||_16a===0||_16c[_16a-1]===".."){
_16c[_16a]=_16d;
_16a++;
continue;
}
if(_16a>0&&_16c[_16a-1]!=="/"){
--_16a;
}
}
_16c.length=_16a;
return _16c;
};
function _163(_16e){
var _16f="",_170=_16e.scheme;
if(_170){
_16f+=_170+":";
}
var _171=_16e.authority;
if(_171){
_16f+="//"+_171;
}
_16f+=_16e.path;
var _172=_16e.queryString;
if(_172){
_16f+="?"+_172;
}
var _173=_16e.fragment;
if(_173){
_16f+="#"+_173;
}
return _16f;
};
CFURL.prototype.absoluteURL=function(){
if(this._absoluteURL===_44){
this._absoluteURL=_157(this);
}
return this._absoluteURL;
};
CFURL.prototype.standardizedURL=function(){
if(this._standardizedURL===_44){
var _174=((this)._parts||_144(this)),_175=_174.pathComponents,_176=_160(_175,NO);
var _177=_161(_176,this.hasDirectoryPath());
if(_174.path===_177){
this._standardizedURL=this;
}else{
var _178=_179(_174);
_178.pathComponents=_176;
_178.path=_177;
var _17a=new CFURL(_163(_178),this.baseURL());
_17a._parts=_178;
_17a._standardizedURL=_17a;
this._standardizedURL=_17a;
}
}
return this._standardizedURL;
};
function _179(_17b){
var _17c={},_17d=_143.length;
while(_17d--){
var _17e=_143[_17d];
_17c[_17e]=_17b[_17e];
}
return _17c;
};
CFURL.prototype.string=function(){
return this._string;
};
CFURL.prototype.authority=function(){
var _17f=((this)._parts||_144(this)).authority;
if(_17f){
return _17f;
}
var _180=this.baseURL();
return _180&&_180.authority()||"";
};
CFURL.prototype.hasDirectoryPath=function(){
var _181=this._hasDirectoryPath;
if(_181===_44){
var path=this.path();
if(!path){
return NO;
}
if(path.charAt(path.length-1)==="/"){
return YES;
}
var _182=this.lastPathComponent();
_181=_182==="."||_182==="..";
this._hasDirectoryPath=_181;
}
return this._hasDirectoryPath;
};
CFURL.prototype.hostName=function(){
return this.authority();
};
CFURL.prototype.fragment=function(){
return ((this)._parts||_144(this)).fragment;
};
CFURL.prototype.lastPathComponent=function(){
if(this._lastPathComponent===_44){
var _183=this.pathComponents(),_184=_183.length;
if(!_184){
this._lastPathComponent="";
}else{
this._lastPathComponent=_183[_184-1];
}
}
return this._lastPathComponent;
};
CFURL.prototype.path=function(){
return ((this)._parts||_144(this)).path;
};
CFURL.prototype.pathComponents=function(){
return ((this)._parts||_144(this)).pathComponents;
};
CFURL.prototype.pathExtension=function(){
var _185=this.lastPathComponent();
if(!_185){
return NULL;
}
_185=_185.replace(/^\.*/,"");
var _186=_185.lastIndexOf(".");
return _186<=0?"":_185.substring(_186+1);
};
CFURL.prototype.queryString=function(){
return ((this)._parts||_144(this)).queryString;
};
CFURL.prototype.scheme=function(){
var _187=this._scheme;
if(_187===_44){
_187=((this)._parts||_144(this)).scheme;
if(!_187){
var _188=this.baseURL();
_187=_188&&_188.scheme();
}
this._scheme=_187;
}
return _187;
};
CFURL.prototype.user=function(){
return ((this)._parts||_144(this)).user;
};
CFURL.prototype.password=function(){
return ((this)._parts||_144(this)).password;
};
CFURL.prototype.portNumber=function(){
return ((this)._parts||_144(this)).portNumber;
};
CFURL.prototype.domain=function(){
return ((this)._parts||_144(this)).domain;
};
CFURL.prototype.baseURL=function(){
return this._baseURL;
};
CFURL.prototype.asDirectoryPathURL=function(){
if(this.hasDirectoryPath()){
return this;
}
return new CFURL(this.lastPathComponent()+"/",this);
};
function _189(aURL){
if(!aURL._resourcePropertiesForKeys){
aURL._resourcePropertiesForKeys=new CFMutableDictionary();
}
return aURL._resourcePropertiesForKeys;
};
CFURL.prototype.resourcePropertyForKey=function(aKey){
return _189(this).valueForKey(aKey);
};
CFURL.prototype.setResourcePropertyForKey=function(aKey,_18a){
_189(this).setValueForKey(aKey,_18a);
};
CFURL.prototype.staticResourceData=function(){
var data=new CFMutableData();
data.setRawString(_18b.resourceAtURL(this).contents());
return data;
};
function _f8(_18c){
this._string=_18c;
var _18d=_18c.indexOf(";");
this._magicNumber=_18c.substr(0,_18d);
this._location=_18c.indexOf(";",++_18d);
this._version=_18c.substring(_18d,this._location++);
};
_f8.prototype.magicNumber=function(){
return this._magicNumber;
};
_f8.prototype.version=function(){
return this._version;
};
_f8.prototype.getMarker=function(){
var _18e=this._string,_18f=this._location;
if(_18f>=_18e.length){
return null;
}
var next=_18e.indexOf(";",_18f);
if(next<0){
return null;
}
var _190=_18e.substring(_18f,next);
if(_190==="e"){
return null;
}
this._location=next+1;
return _190;
};
_f8.prototype.getString=function(){
var _191=this._string,_192=this._location;
if(_192>=_191.length){
return null;
}
var next=_191.indexOf(";",_192);
if(next<0){
return null;
}
var size=parseInt(_191.substring(_192,next),10),text=_191.substr(next+1,size);
this._location=next+1+size;
return text;
};
var _193=0,_194=1<<0,_195=1<<1,_196=1<<2,_197=1<<3,_198=1<<4;
var _199={},_19a={},_19b=new Date().getTime(),_19c=0,_19d=0;
CFBundle=function(aURL){
aURL=_19e(aURL).asDirectoryPathURL();
var _19f=aURL.absoluteString(),_1a0=_199[_19f];
if(_1a0){
return _1a0;
}
_199[_19f]=this;
this._bundleURL=aURL;
this._resourcesDirectoryURL=new CFURL("Resources/",aURL);
this._staticResource=NULL;
this._isValid=NO;
this._loadStatus=_193;
this._loadRequests=[];
this._infoDictionary=new CFDictionary();
this._eventDispatcher=new _6c(this);
};
CFBundle.environments=function(){
return ["Browser","ObjJ"];
};
CFBundle.bundleContainingURL=function(aURL){
aURL=new CFURL(".",_19e(aURL));
var _1a1,_1a2=aURL.absoluteString();
while(!_1a1||_1a1!==_1a2){
var _1a3=_199[_1a2];
if(_1a3&&_1a3._isValid){
return _1a3;
}
aURL=new CFURL("..",aURL);
_1a1=_1a2;
_1a2=aURL.absoluteString();
}
return NULL;
};
CFBundle.mainBundle=function(){
return new CFBundle(_1a4);
};
function _1a5(_1a6,_1a7){
if(_1a7){
_19a[_1a6.name]=_1a7;
}
};
CFBundle.bundleForClass=function(_1a8){
return _19a[_1a8.name]||CFBundle.mainBundle();
};
CFBundle.prototype.bundleURL=function(){
return this._bundleURL;
};
CFBundle.prototype.resourcesDirectoryURL=function(){
return this._resourcesDirectoryURL;
};
CFBundle.prototype.resourceURL=function(_1a9,_1aa,_1ab){
if(_1aa){
_1a9=_1a9+"."+_1aa;
}
if(_1ab){
_1a9=_1ab+"/"+_1a9;
}
var _1ac=(new CFURL(_1a9,this.resourcesDirectoryURL())).mappedURL();
return _1ac.absoluteURL();
};
CFBundle.prototype.mostEligibleEnvironmentURL=function(){
if(this._mostEligibleEnvironmentURL===_44){
this._mostEligibleEnvironmentURL=new CFURL(this.mostEligibleEnvironment()+".environment/",this.bundleURL());
}
return this._mostEligibleEnvironmentURL;
};
CFBundle.prototype.executableURL=function(){
if(this._executableURL===_44){
var _1ad=this.valueForInfoDictionaryKey("CPBundleExecutable");
if(!_1ad){
this._executableURL=NULL;
}else{
this._executableURL=new CFURL(_1ad,this.mostEligibleEnvironmentURL());
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
var _1ae=this._infoDictionary.valueForKey("CPBundleEnvironmentsWithImageSprites")||[],_8c=_1ae.length,_1af=this.mostEligibleEnvironment();
while(_8c--){
if(_1ae[_8c]===_1af){
return YES;
}
}
return NO;
};
CFBundle.prototype.environments=function(){
return this._infoDictionary.valueForKey("CPBundleEnvironments")||["ObjJ"];
};
CFBundle.prototype.mostEligibleEnvironment=function(_1b0){
_1b0=_1b0||this.environments();
var _1b1=CFBundle.environments(),_8c=0,_1b2=_1b1.length,_1b3=_1b0.length;
for(;_8c<_1b2;++_8c){
var _1b4=0,_1b5=_1b1[_8c];
for(;_1b4<_1b3;++_1b4){
if(_1b5===_1b0[_1b4]){
return _1b5;
}
}
}
return NULL;
};
CFBundle.prototype.isLoading=function(){
return this._loadStatus&_194;
};
CFBundle.prototype.load=function(_1b6){
if(this._loadStatus!==_193){
return;
}
this._loadStatus=_194|_195;
var self=this,_1b7=this.bundleURL(),_1b8=new CFURL("..",_1b7);
if(_1b8.absoluteString()===_1b7.absoluteString()){
_1b8=_1b8.schemeAndAuthority();
}
_18b.resolveResourceAtURL(_1b8,YES,function(_1b9){
var _1ba=_1b7.absoluteURL().lastPathComponent();
self._staticResource=_1b9._children[_1ba]||new _18b(_1b7,_1b9,YES,NO);
function _1bb(_1bc){
self._loadStatus&=~_195;
var _1bd=_1bc.request.responsePropertyList();
self._isValid=!!_1bd||CFBundle.mainBundle()===self;
if(_1bd){
self._infoDictionary=_1bd;
}
if(!self._infoDictionary){
_1bf(self,new Error("Could not load bundle at \""+path+"\""));
return;
}
if(self===CFBundle.mainBundle()&&self.valueForInfoDictionaryKey("CPApplicationSize")){
_19d=self.valueForInfoDictionaryKey("CPApplicationSize").valueForKey("executable")||0;
}
_1c3(self,_1b6);
};
function _1be(){
self._isValid=CFBundle.mainBundle()===self;
self._loadStatus=_193;
_1bf(self,new Error("Could not load bundle at \""+self.bundleURL()+"\""));
};
new _a3(new CFURL("Info.plist",self.bundleURL()),_1bb,_1be);
});
};
function _1bf(_1c0,_1c1){
_1c2(_1c0._staticResource);
_1c0._eventDispatcher.dispatchEvent({type:"error",error:_1c1,bundle:_1c0});
};
function _1c3(_1c4,_1c5){
if(!_1c4.mostEligibleEnvironment()){
return _1c6();
}
_1c7(_1c4,_1c8,_1c6);
_1c9(_1c4,_1c8,_1c6);
if(_1c4._loadStatus===_194){
return _1c8();
}
function _1c6(_1ca){
var _1cb=_1c4._loadRequests,_1cc=_1cb.length;
while(_1cc--){
_1cb[_1cc].abort();
}
this._loadRequests=[];
_1c4._loadStatus=_193;
_1bf(_1c4,_1ca||new Error("Could not recognize executable code format in Bundle "+_1c4));
};
function _1c8(){
if((typeof CPApp==="undefined"||!CPApp||!CPApp._finishedLaunching)&&typeof OBJJ_PROGRESS_CALLBACK==="function"&&_19d){
OBJJ_PROGRESS_CALLBACK(MAX(MIN(1,_19c/_19d),0),_19d,_1c4.path());
}
if(_1c4._loadStatus===_194){
_1c4._loadStatus=_198;
}else{
return;
}
_1c2(_1c4._staticResource);
function _1cd(){
_1c4._eventDispatcher.dispatchEvent({type:"load",bundle:_1c4});
};
if(_1c5){
_1ce(_1c4,_1cd);
}else{
_1cd();
}
};
};
function _1c7(_1cf,_1d0,_1d1){
var _1d2=_1cf.executableURL();
if(!_1d2){
return;
}
_1cf._loadStatus|=_196;
new _a3(_1d2,function(_1d3){
try{
_19c+=_1d3.request.responseText().length;
_1d4(_1cf,_1d3.request.responseText(),_1d2);
_1cf._loadStatus&=~_196;
_1d0();
}
catch(anException){
_1d1(anException);
}
},_1d1);
};
function _1d5(_1d6){
return "mhtml:"+new CFURL("MHTMLTest.txt",_1d6.mostEligibleEnvironmentURL());
};
function _1d7(_1d8){
if(_1d9===_1da){
return new CFURL("dataURLs.txt",_1d8.mostEligibleEnvironmentURL());
}
if(_1d9===_1db||_1d9===_1dc){
return new CFURL("MHTMLPaths.txt",_1d8.mostEligibleEnvironmentURL());
}
return NULL;
};
function _1c9(_1dd,_1de,_1df){
if(!_1dd.hasSpritedImages()){
return;
}
_1dd._loadStatus|=_197;
if(!_1e0()){
return _1e1(_1d5(_1dd),function(){
_1c9(_1dd,_1de,_1df);
});
}
var _1e2=_1d7(_1dd);
if(!_1e2){
_1dd._loadStatus&=~_197;
return _1de();
}
new _a3(_1e2,function(_1e3){
try{
_19c+=_1e3.request.responseText().length;
_1d4(_1dd,_1e3.request.responseText(),_1e2);
_1dd._loadStatus&=~_197;
_1de();
}
catch(anException){
_1df(anException);
}
},_1df);
};
var _1e4=[],_1d9=-1,_1e5=0,_1da=1,_1db=2,_1dc=3;
function _1e0(){
return _1d9!==-1;
};
function _1e1(_1e6,_1e7){
if(_1e0()){
return;
}
_1e4.push(_1e7);
if(_1e4.length>1){
return;
}
_1e4.push(function(){
var size=0,_1e8=CFBundle.mainBundle().valueForInfoDictionaryKey("CPApplicationSize");
if(!_1e8){
return;
}
switch(_1d9){
case _1da:
size=_1e8.valueForKey("data");
break;
case _1db:
case _1dc:
size=_1e8.valueForKey("mhtml");
break;
}
_19d+=size;
});
_1e9([_1da,"data:image/gif;base64,R0lGODlhAQABAIAAAMc9BQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",_1db,_1e6+"!test",_1dc,_1e6+"?"+_19b+"!test"]);
};
function _1ea(){
var _1eb=_1e4.length;
while(_1eb--){
_1e4[_1eb]();
}
};
function _1e9(_1ec){
if(_1ec.length<2){
_1d9=_1e5;
_1ea();
return;
}
var _1ed=new Image();
_1ed.onload=function(){
if(_1ed.width===1&&_1ed.height===1){
_1d9=_1ec[0];
_1ea();
}else{
_1ed.onerror();
}
};
_1ed.onerror=function(){
_1e9(_1ec.slice(2));
};
_1ed.src=_1ec[1];
};
function _1ce(_1ee,_1ef){
var _1f0=[_1ee._staticResource];
function _1f1(_1f2){
for(;_1f2<_1f0.length;++_1f2){
var _1f3=_1f0[_1f2];
if(_1f3.isNotFound()){
continue;
}
if(_1f3.isFile()){
var _1f4=new _2fb(_1f3.URL());
if(_1f4.hasLoadedFileDependencies()){
_1f4.execute();
}else{
_1f4.loadFileDependencies(function(){
_1f1(_1f2);
});
return;
}
}else{
if(_1f3.URL().absoluteString()===_1ee.resourcesDirectoryURL().absoluteString()){
continue;
}
var _1f5=_1f3.children();
for(var name in _1f5){
if(_71.call(_1f5,name)){
_1f0.push(_1f5[name]);
}
}
}
}
_1ef();
};
_1f1(0);
};
var _1f6="@STATIC",_1f7="p",_1f8="u",_1f9="c",_1fa="t",_1fb="I",_1fc="i";
function _1d4(_1fd,_1fe,_1ff){
var _200=new _f8(_1fe);
if(_200.magicNumber()!==_1f6){
throw new Error("Could not read static file: "+_1ff);
}
if(_200.version()!=="1.0"){
throw new Error("Could not read static file: "+_1ff);
}
var _201,_202=_1fd.bundleURL(),file=NULL;
while(_201=_200.getMarker()){
var text=_200.getString();
if(_201===_1f7){
var _203=new CFURL(text,_202),_204=_18b.resourceAtURL(new CFURL(".",_203),YES);
file=new _18b(_203,_204,NO,YES);
}else{
if(_201===_1f8){
var URL=new CFURL(text,_202),_205=_200.getString();
if(_205.indexOf("mhtml:")===0){
_205="mhtml:"+new CFURL(_205.substr("mhtml:".length),_202);
if(_1d9===_1dc){
var _206=URLString.indexOf("!"),_207=URLString.substring(0,_206),_208=URLString.substring(_206);
_205=_207+"?"+_19b+_208;
}
}
CFURL.setMappedURLForURL(URL,new CFURL(_205));
var _204=_18b.resourceAtURL(new CFURL(".",URL),YES);
new _18b(URL,_204,NO,YES);
}else{
if(_201===_1fa){
file.write(text);
}
}
}
}
};
CFBundle.prototype.addEventListener=function(_209,_20a){
this._eventDispatcher.addEventListener(_209,_20a);
};
CFBundle.prototype.removeEventListener=function(_20b,_20c){
this._eventDispatcher.removeEventListener(_20b,_20c);
};
CFBundle.prototype.onerror=function(_20d){
throw _20d.error;
};
CFBundle.prototype.bundlePath=function(){
return this._bundleURL.absoluteURL().path();
};
CFBundle.prototype.path=function(){
CPLog.warn("CFBundle.prototype.path is deprecated, use CFBundle.prototype.bundlePath instead.");
return this.bundlePath.apply(this,arguments);
};
CFBundle.prototype.pathForResource=function(_20e){
return this.resourceURL(_20e).absoluteString();
};
var _20f={};
function _18b(aURL,_210,_211,_212){
this._parent=_210;
this._eventDispatcher=new _6c(this);
var name=aURL.absoluteURL().lastPathComponent()||aURL.schemeAndAuthority();
this._name=name;
this._URL=aURL;
this._isResolved=!!_212;
if(_211){
this._URL=this._URL.asDirectoryPathURL();
}
if(!_210){
_20f[name]=this;
}
this._isDirectory=!!_211;
this._isNotFound=NO;
if(_210){
_210._children[name]=this;
}
if(_211){
this._children={};
}else{
this._contents="";
}
};
_18b.rootResources=function(){
return _20f;
};
_2.StaticResource=_18b;
function _1c2(_213){
_213._isResolved=YES;
_213._eventDispatcher.dispatchEvent({type:"resolve",staticResource:_213});
};
_18b.prototype.resolve=function(){
if(this.isDirectory()){
var _214=new CFBundle(this.URL());
_214.onerror=function(){
};
_214.load(NO);
}else{
var self=this;
function _215(_216){
self._contents=_216.request.responseText();
_1c2(self);
};
function _217(){
self._isNotFound=YES;
_1c2(self);
};
new _a3(this.URL(),_215,_217);
}
};
_18b.prototype.name=function(){
return this._name;
};
_18b.prototype.URL=function(){
return this._URL;
};
_18b.prototype.contents=function(){
return this._contents;
};
_18b.prototype.children=function(){
return this._children;
};
_18b.prototype.parent=function(){
return this._parent;
};
_18b.prototype.isResolved=function(){
return this._isResolved;
};
_18b.prototype.write=function(_218){
this._contents+=_218;
};
function _219(_21a){
var _21b=_21a.schemeAndAuthority(),_21c=_20f[_21b];
if(!_21c){
_21c=new _18b(new CFURL(_21b),NULL,YES,YES);
}
return _21c;
};
_18b.resourceAtURL=function(aURL,_21d){
aURL=_19e(aURL).absoluteURL();
var _21e=_219(aURL),_21f=aURL.pathComponents(),_8c=0,_220=_21f.length;
for(;_8c<_220;++_8c){
var name=_21f[_8c];
if(_71.call(_21e._children,name)){
_21e=_21e._children[name];
}else{
if(_21d){
_21e=new _18b(new CFURL(name,_21e.URL()),_21e,YES,YES);
}else{
throw new Error("Static Resource at "+aURL+" is not resolved (\""+name+"\")");
}
}
}
return _21e;
};
_18b.prototype.resourceAtURL=function(aURL,_221){
return _18b.resourceAtURL(new CFURL(aURL,this.URL()),_221);
};
_18b.resolveResourceAtURL=function(aURL,_222,_223){
aURL=_19e(aURL).absoluteURL();
_224(_219(aURL),_222,aURL.pathComponents(),0,_223);
};
_18b.prototype.resolveResourceAtURL=function(aURL,_225,_226){
_18b.resolveResourceAtURL(new CFURL(aURL,this.URL()).absoluteURL(),_225,_226);
};
function _224(_227,_228,_229,_22a,_22b){
var _22c=_229.length;
for(;_22a<_22c;++_22a){
var name=_229[_22a],_22d=_71.call(_227._children,name)&&_227._children[name];
if(!_22d){
_22d=new _18b(new CFURL(name,_227.URL()),_227,_22a+1<_22c||_228,NO);
_22d.resolve();
}
if(!_22d.isResolved()){
return _22d.addEventListener("resolve",function(){
_224(_227,_228,_229,_22a,_22b);
});
}
if(_22d.isNotFound()){
return _22b(null,new Error("File not found: "+_229.join("/")));
}
if((_22a+1<_22c)&&_22d.isFile()){
return _22b(null,new Error("File is not a directory: "+_229.join("/")));
}
_227=_22d;
}
_22b(_227);
};
function _22e(aURL,_22f,_230){
var _231=_18b.includeURLs(),_232=new CFURL(aURL,_231[_22f]).absoluteURL();
_18b.resolveResourceAtURL(_232,NO,function(_233){
if(!_233){
if(_22f+1<_231.length){
_22e(aURL,_22f+1,_230);
}else{
_230(NULL);
}
return;
}
_230(_233);
});
};
_18b.resolveResourceAtURLSearchingIncludeURLs=function(aURL,_234){
_22e(aURL,0,_234);
};
_18b.prototype.addEventListener=function(_235,_236){
this._eventDispatcher.addEventListener(_235,_236);
};
_18b.prototype.removeEventListener=function(_237,_238){
this._eventDispatcher.removeEventListener(_237,_238);
};
_18b.prototype.isNotFound=function(){
return this._isNotFound;
};
_18b.prototype.isFile=function(){
return !this._isDirectory;
};
_18b.prototype.isDirectory=function(){
return this._isDirectory;
};
_18b.prototype.toString=function(_239){
if(this.isNotFound()){
return "<file not found: "+this.name()+">";
}
var _23a=this.name();
if(this.isDirectory()){
var _23b=this._children;
for(var name in _23b){
if(_23b.hasOwnProperty(name)){
var _23c=_23b[name];
if(_239||!_23c.isNotFound()){
_23a+="\n\t"+_23b[name].toString(_239).split("\n").join("\n\t");
}
}
}
}
return _23a;
};
var _23d=NULL;
_18b.includeURLs=function(){
if(_23e){
return _23e;
}
var _23e=[];
if(!_1.OBJJ_INCLUDE_PATHS&&!_1.OBJJ_INCLUDE_URLS){
_23e=["Frameworks","Frameworks/Debug"];
}else{
_23e=(_1.OBJJ_INCLUDE_PATHS||[]).concat(_1.OBJJ_INCLUDE_URLS||[]);
}
var _23f=_23e.length;
while(_23f--){
_23e[_23f]=new CFURL(_23e[_23f]).asDirectoryPathURL();
}
return _23e;
};
var _240="accessors",_241="class",_242="end",_243="function",_244="implementation",_245="import",_246="each",_247="outlet",_248="action",_249="new",_24a="selector",_24b="super",_24c="var",_24d="in",_24e="=",_24f="+",_250="-",_251=":",_252=",",_253=".",_254="*",_255=";",_256="<",_257="{",_258="}",_259=">",_25a="[",_25b="\"",_25c="@",_25d="]",_25e="?",_25f="(",_260=")",_261=/^(?:(?:\s+$)|(?:\/(?:\/|\*)))/,_262=/^[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?$/,_263=/^[a-zA-Z_$](\w|$)*$/;
function _264(_265){
this._index=-1;
this._tokens=(_265+"\n").match(/\/\/.*(\r|\n)?|\/\*(?:.|\n|\r)*?\*\/|\w+\b|[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?|"[^"\\]*(\\[\s\S][^"\\]*)*"|'[^'\\]*(\\[\s\S][^'\\]*)*'|\s+|./g);
this._context=[];
return this;
};
_264.prototype.push=function(){
this._context.push(this._index);
};
_264.prototype.pop=function(){
this._index=this._context.pop();
};
_264.prototype.peak=function(_266){
if(_266){
this.push();
var _267=this.skip_whitespace();
this.pop();
return _267;
}
return this._tokens[this._index+1];
};
_264.prototype.next=function(){
return this._tokens[++this._index];
};
_264.prototype.previous=function(){
return this._tokens[--this._index];
};
_264.prototype.last=function(){
if(this._index<0){
return NULL;
}
return this._tokens[this._index-1];
};
_264.prototype.skip_whitespace=function(_268){
var _269;
if(_268){
while((_269=this.previous())&&_261.test(_269)){
}
}else{
while((_269=this.next())&&_261.test(_269)){
}
}
return _269;
};
_2.Lexer=_264;
function _26a(){
this.atoms=[];
};
_26a.prototype.toString=function(){
return this.atoms.join("");
};
_2.preprocess=function(_26b,aURL,_26c){
return new _26d(_26b,aURL,_26c).executable();
};
_2.eval=function(_26e){
return eval(_2.preprocess(_26e).code());
};
var _26d=function(_26f,aURL,_270){
this._URL=new CFURL(aURL);
_26f=_26f.replace(/^#[^\n]+\n/,"\n");
this._currentSelector="";
this._currentClass="";
this._currentSuperClass="";
this._currentSuperMetaClass="";
this._buffer=new _26a();
this._preprocessed=NULL;
this._dependencies=[];
this._tokens=new _264(_26f);
this._flags=_270;
this._classMethod=false;
this._executable=NULL;
this.preprocess(this._tokens,this._buffer);
};
_2.Preprocessor=_26d;
_26d.Flags={};
_26d.Flags.IncludeDebugSymbols=1<<0;
_26d.Flags.IncludeTypeSignatures=1<<1;
_26d.prototype.executable=function(){
if(!this._executable){
this._executable=new _271(this._buffer.toString(),this._dependencies,this._URL);
}
return this._executable;
};
_26d.prototype.accessors=function(_272){
var _273=_272.skip_whitespace(),_274={};
if(_273!=_25f){
_272.previous();
return _274;
}
while((_273=_272.skip_whitespace())!=_260){
var name=_273,_275=true;
if(!/^\w+$/.test(name)){
throw new SyntaxError(this.error_message("*** @property attribute name not valid."));
}
if((_273=_272.skip_whitespace())==_24e){
_275=_272.skip_whitespace();
if(!/^\w+$/.test(_275)){
throw new SyntaxError(this.error_message("*** @property attribute value not valid."));
}
if(name=="setter"){
if((_273=_272.next())!=_251){
throw new SyntaxError(this.error_message("*** @property setter attribute requires argument with \":\" at end of selector name."));
}
_275+=":";
}
_273=_272.skip_whitespace();
}
_274[name]=_275;
if(_273==_260){
break;
}
if(_273!=_252){
throw new SyntaxError(this.error_message("*** Expected ',' or ')' in @property attribute list."));
}
}
return _274;
};
_26d.prototype.brackets=function(_276,_277){
var _278=[];
while(this.preprocess(_276,NULL,NULL,NULL,_278[_278.length]=[])){
}
if(_278[0].length===1){
_277.atoms[_277.atoms.length]="[";
_277.atoms[_277.atoms.length]=_278[0][0];
_277.atoms[_277.atoms.length]="]";
}else{
var _279=new _26a();
if(_278[0][0].atoms[0]==_24b){
_277.atoms[_277.atoms.length]="objj_msgSendSuper(";
_277.atoms[_277.atoms.length]="{ receiver:self, super_class:"+(this._classMethod?this._currentSuperMetaClass:this._currentSuperClass)+" }";
}else{
_277.atoms[_277.atoms.length]="objj_msgSend(";
_277.atoms[_277.atoms.length]=_278[0][0];
}
_279.atoms[_279.atoms.length]=_278[0][1];
var _27a=1,_27b=_278.length,_27c=new _26a();
for(;_27a<_27b;++_27a){
var pair=_278[_27a];
_279.atoms[_279.atoms.length]=pair[1];
_27c.atoms[_27c.atoms.length]=", "+pair[0];
}
_277.atoms[_277.atoms.length]=", \"";
_277.atoms[_277.atoms.length]=_279;
_277.atoms[_277.atoms.length]="\"";
_277.atoms[_277.atoms.length]=_27c;
_277.atoms[_277.atoms.length]=")";
}
};
_26d.prototype.directive=function(_27d,_27e,_27f){
var _280=_27e?_27e:new _26a(),_281=_27d.next();
if(_281.charAt(0)==_25b){
_280.atoms[_280.atoms.length]=_281;
}else{
if(_281===_241){
_27d.skip_whitespace();
return;
}else{
if(_281===_244){
this.implementation(_27d,_280);
}else{
if(_281===_245){
this._import(_27d);
}else{
if(_281===_24a){
this.selector(_27d,_280);
}
}
}
}
}
if(!_27e){
return _280;
}
};
_26d.prototype.implementation=function(_282,_283){
var _284=_283,_285="",_286=NO,_287=_282.skip_whitespace(),_288="Nil",_289=new _26a(),_28a=new _26a();
if(!(/^\w/).test(_287)){
throw new Error(this.error_message("*** Expected class name, found \""+_287+"\"."));
}
this._currentSuperClass="objj_getClass(\""+_287+"\").super_class";
this._currentSuperMetaClass="objj_getMetaClass(\""+_287+"\").super_class";
this._currentClass=_287;
this._currentSelector="";
if((_285=_282.skip_whitespace())==_25f){
_285=_282.skip_whitespace();
if(_285==_260){
throw new SyntaxError(this.error_message("*** Can't Have Empty Category Name for class \""+_287+"\"."));
}
if(_282.skip_whitespace()!=_260){
throw new SyntaxError(this.error_message("*** Improper Category Definition for class \""+_287+"\"."));
}
_284.atoms[_284.atoms.length]="{\nvar the_class = objj_getClass(\""+_287+"\")\n";
_284.atoms[_284.atoms.length]="if(!the_class) throw new SyntaxError(\"*** Could not find definition for class \\\""+_287+"\\\"\");\n";
_284.atoms[_284.atoms.length]="var meta_class = the_class.isa;";
}else{
if(_285==_251){
_285=_282.skip_whitespace();
if(!_263.test(_285)){
throw new SyntaxError(this.error_message("*** Expected class name, found \""+_285+"\"."));
}
_288=_285;
_285=_282.skip_whitespace();
}
_284.atoms[_284.atoms.length]="{var the_class = objj_allocateClassPair("+_288+", \""+_287+"\"),\nmeta_class = the_class.isa;";
if(_285==_257){
var _28b=0,_28c=[],_28d,_28e={};
while((_285=_282.skip_whitespace())&&_285!=_258){
if(_285===_25c){
_285=_282.next();
if(_285===_240){
_28d=this.accessors(_282);
}else{
if(_285!==_247){
throw new SyntaxError(this.error_message("*** Unexpected '@' token in ivar declaration ('@"+_285+"')."));
}
}
}else{
if(_285==_255){
if(_28b++==0){
_284.atoms[_284.atoms.length]="class_addIvars(the_class, [";
}else{
_284.atoms[_284.atoms.length]=", ";
}
var name=_28c[_28c.length-1];
_284.atoms[_284.atoms.length]="new objj_ivar(\""+name+"\")";
_28c=[];
if(_28d){
_28e[name]=_28d;
_28d=NULL;
}
}else{
_28c.push(_285);
}
}
}
if(_28c.length){
throw new SyntaxError(this.error_message("*** Expected ';' in ivar declaration, found '}'."));
}
if(_28b){
_284.atoms[_284.atoms.length]="]);\n";
}
if(!_285){
throw new SyntaxError(this.error_message("*** Expected '}'"));
}
for(ivar_name in _28e){
var _28f=_28e[ivar_name],_290=_28f["property"]||ivar_name;
var _291=_28f["getter"]||_290,_292="(id)"+_291+"\n{\nreturn "+ivar_name+";\n}";
if(_289.atoms.length!==0){
_289.atoms[_289.atoms.length]=",\n";
}
_289.atoms[_289.atoms.length]=this.method(new _264(_292));
if(_28f["readonly"]){
continue;
}
var _293=_28f["setter"];
if(!_293){
var _294=_290.charAt(0)=="_"?1:0;
_293=(_294?"_":"")+"set"+_290.substr(_294,1).toUpperCase()+_290.substring(_294+1)+":";
}
var _295="(void)"+_293+"(id)newValue\n{\n";
if(_28f["copy"]){
_295+="if ("+ivar_name+" !== newValue)\n"+ivar_name+" = [newValue copy];\n}";
}else{
_295+=ivar_name+" = newValue;\n}";
}
if(_289.atoms.length!==0){
_289.atoms[_289.atoms.length]=",\n";
}
_289.atoms[_289.atoms.length]=this.method(new _264(_295));
}
}else{
_282.previous();
}
_284.atoms[_284.atoms.length]="objj_registerClassPair(the_class);\n";
}
while((_285=_282.skip_whitespace())){
if(_285==_24f){
this._classMethod=true;
if(_28a.atoms.length!==0){
_28a.atoms[_28a.atoms.length]=", ";
}
_28a.atoms[_28a.atoms.length]=this.method(_282);
}else{
if(_285==_250){
this._classMethod=false;
if(_289.atoms.length!==0){
_289.atoms[_289.atoms.length]=", ";
}
_289.atoms[_289.atoms.length]=this.method(_282);
}else{
if(_285==_25c){
if((_285=_282.next())==_242){
break;
}else{
throw new SyntaxError(this.error_message("*** Expected \"@end\", found \"@"+_285+"\"."));
}
}
}
}
}
if(_289.atoms.length!==0){
_284.atoms[_284.atoms.length]="class_addMethods(the_class, [";
_284.atoms[_284.atoms.length]=_289;
_284.atoms[_284.atoms.length]="]);\n";
}
if(_28a.atoms.length!==0){
_284.atoms[_284.atoms.length]="class_addMethods(meta_class, [";
_284.atoms[_284.atoms.length]=_28a;
_284.atoms[_284.atoms.length]="]);\n";
}
_284.atoms[_284.atoms.length]="}";
this._currentClass="";
};
_26d.prototype._import=function(_296){
var _297="",_298=_296.skip_whitespace(),_299=(_298!==_256);
if(_298===_256){
while((_298=_296.next())&&_298!==_259){
_297+=_298;
}
if(!_298){
throw new SyntaxError(this.error_message("*** Unterminated import statement."));
}
}else{
if(_298.charAt(0)===_25b){
_297=_298.substr(1,_298.length-2);
}else{
throw new SyntaxError(this.error_message("*** Expecting '<' or '\"', found \""+_298+"\"."));
}
}
this._buffer.atoms[this._buffer.atoms.length]="objj_executeFile(\"";
this._buffer.atoms[this._buffer.atoms.length]=_297;
this._buffer.atoms[this._buffer.atoms.length]=_299?"\", YES);":"\", NO);";
this._dependencies.push(new _29a(new CFURL(_297),_299));
};
_26d.prototype.method=function(_29b){
var _29c=new _26a(),_29d,_29e="",_29f=[],_2a0=[null];
while((_29d=_29b.skip_whitespace())&&_29d!=_257){
if(_29d==_251){
var type="";
_29e+=_29d;
_29d=_29b.skip_whitespace();
if(_29d==_25f){
while((_29d=_29b.skip_whitespace())&&_29d!=_260){
type+=_29d;
}
_29d=_29b.skip_whitespace();
}
_2a0[_29f.length+1]=type||null;
_29f[_29f.length]=_29d;
}else{
if(_29d==_25f){
var type="";
while((_29d=_29b.skip_whitespace())&&_29d!=_260){
type+=_29d;
}
_2a0[0]=type||null;
}else{
if(_29d==_252){
if((_29d=_29b.skip_whitespace())!=_253||_29b.next()!=_253||_29b.next()!=_253){
throw new SyntaxError(this.error_message("*** Argument list expected after ','."));
}
}else{
_29e+=_29d;
}
}
}
}
var _2a1=0,_2a2=_29f.length;
_29c.atoms[_29c.atoms.length]="new objj_method(sel_getUid(\"";
_29c.atoms[_29c.atoms.length]=_29e;
_29c.atoms[_29c.atoms.length]="\"), function";
this._currentSelector=_29e;
if(this._flags&_26d.Flags.IncludeDebugSymbols){
_29c.atoms[_29c.atoms.length]=" $"+this._currentClass+"__"+_29e.replace(/:/g,"_");
}
_29c.atoms[_29c.atoms.length]="(self, _cmd";
for(;_2a1<_2a2;++_2a1){
_29c.atoms[_29c.atoms.length]=", ";
_29c.atoms[_29c.atoms.length]=_29f[_2a1];
}
_29c.atoms[_29c.atoms.length]=")\n{ with(self)\n{";
_29c.atoms[_29c.atoms.length]=this.preprocess(_29b,NULL,_258,_257);
_29c.atoms[_29c.atoms.length]="}\n}";
if(this._flags&_26d.Flags.IncludeDebugSymbols){
_29c.atoms[_29c.atoms.length]=","+JSON.stringify(_2a0);
}
_29c.atoms[_29c.atoms.length]=")";
this._currentSelector="";
return _29c;
};
_26d.prototype.preprocess=function(_2a3,_2a4,_2a5,_2a6,_2a7){
var _2a8=_2a4?_2a4:new _26a(),_2a9=0,_2aa="";
if(_2a7){
_2a7[0]=_2a8;
var _2ab=false,_2ac=[0,0,0];
}
while((_2aa=_2a3.next())&&((_2aa!==_2a5)||_2a9)){
if(_2a7){
if(_2aa===_25e){
++_2ac[2];
}else{
if(_2aa===_257){
++_2ac[0];
}else{
if(_2aa===_258){
--_2ac[0];
}else{
if(_2aa===_25f){
++_2ac[1];
}else{
if(_2aa===_260){
--_2ac[1];
}else{
if((_2aa===_251&&_2ac[2]--===0||(_2ab=(_2aa===_25d)))&&_2ac[0]===0&&_2ac[1]===0){
_2a3.push();
var _2ad=_2ab?_2a3.skip_whitespace(true):_2a3.previous(),_2ae=_261.test(_2ad);
if(_2ae||_263.test(_2ad)&&_261.test(_2a3.previous())){
_2a3.push();
var last=_2a3.skip_whitespace(true),_2af=true,_2b0=false;
if(last==="+"||last==="-"){
if(_2a3.previous()!==last){
_2af=false;
}else{
last=_2a3.skip_whitespace(true);
_2b0=true;
}
}
_2a3.pop();
_2a3.pop();
if(_2af&&((!_2b0&&(last===_258))||last===_260||last===_25d||last===_253||_262.test(last)||last.charAt(last.length-1)==="\""||last.charAt(last.length-1)==="'"||_263.test(last)&&!/^(new|return|case|var)$/.test(last))){
if(_2ae){
_2a7[1]=":";
}else{
_2a7[1]=_2ad;
if(!_2ab){
_2a7[1]+=":";
}
var _2a9=_2a8.atoms.length;
while(_2a8.atoms[_2a9--]!==_2ad){
}
_2a8.atoms.length=_2a9;
}
return !_2ab;
}
if(_2ab){
return NO;
}
}
_2a3.pop();
if(_2ab){
return NO;
}
}
}
}
}
}
}
_2ac[2]=MAX(_2ac[2],0);
}
if(_2a6){
if(_2aa===_2a6){
++_2a9;
}else{
if(_2aa===_2a5){
--_2a9;
}
}
}
if(_2aa===_243){
var _2b1="";
while((_2aa=_2a3.next())&&_2aa!==_25f&&!(/^\w/).test(_2aa)){
_2b1+=_2aa;
}
if(_2aa===_25f){
if(_2a6===_25f){
++_2a9;
}
_2a8.atoms[_2a8.atoms.length]="function"+_2b1+"(";
if(_2a7){
++_2ac[1];
}
}else{
_2a8.atoms[_2a8.atoms.length]=_2aa+"= function";
}
}else{
if(_2aa==_25c){
this.directive(_2a3,_2a8);
}else{
if(_2aa==_25a){
this.brackets(_2a3,_2a8);
}else{
_2a8.atoms[_2a8.atoms.length]=_2aa;
}
}
}
}
if(_2a7){
throw new SyntaxError(this.error_message("*** Expected ']' - Unterminated message send or array."));
}
if(!_2a4){
return _2a8;
}
};
_26d.prototype.selector=function(_2b2,_2b3){
var _2b4=_2b3?_2b3:new _26a();
_2b4.atoms[_2b4.atoms.length]="sel_getUid(\"";
if(_2b2.skip_whitespace()!=_25f){
throw new SyntaxError(this.error_message("*** Expected '('"));
}
var _2b5=_2b2.skip_whitespace();
if(_2b5==_260){
throw new SyntaxError(this.error_message("*** Unexpected ')', can't have empty @selector()"));
}
_2b3.atoms[_2b3.atoms.length]=_2b5;
var _2b6,_2b7=true;
while((_2b6=_2b2.next())&&_2b6!=_260){
if(_2b7&&/^\d+$/.test(_2b6)||!(/^(\w|$|\:)/.test(_2b6))){
if(!(/\S/).test(_2b6)){
if(_2b2.skip_whitespace()==_260){
break;
}else{
throw new SyntaxError(this.error_message("*** Unexpected whitespace in @selector()."));
}
}else{
throw new SyntaxError(this.error_message("*** Illegal character '"+_2b6+"' in @selector()."));
}
}
_2b4.atoms[_2b4.atoms.length]=_2b6;
_2b7=(_2b6==_251);
}
_2b4.atoms[_2b4.atoms.length]="\")";
if(!_2b3){
return _2b4;
}
};
_26d.prototype.error_message=function(_2b8){
return _2b8+" <Context File: "+this._URL+(this._currentClass?" Class: "+this._currentClass:"")+(this._currentSelector?" Method: "+this._currentSelector:"")+">";
};
function _29a(aURL,_2b9){
this._URL=aURL;
this._isLocal=_2b9;
};
_2.FileDependency=_29a;
_29a.prototype.URL=function(){
return this._URL;
};
_29a.prototype.isLocal=function(){
return this._isLocal;
};
_29a.prototype.toMarkedString=function(){
var _2ba=this.URL().absoluteString();
return (this.isLocal()?_1fc:_1fb)+";"+_2ba.length+";"+_2ba;
};
_29a.prototype.toString=function(){
return (this.isLocal()?"LOCAL: ":"STD: ")+this.URL();
};
var _2bb=0,_2bc=1,_2bd=2,_2be=0;
function _271(_2bf,_2c0,aURL,_2c1){
if(arguments.length===0){
return this;
}
this._code=_2bf;
this._function=_2c1||NULL;
this._URL=_19e(aURL||new CFURL("(Anonymous"+(_2be++)+")"));
this._fileDependencies=_2c0;
if(_2c0.length){
this._fileDependencyStatus=_2bb;
this._fileDependencyCallbacks=[];
}else{
this._fileDependencyStatus=_2bd;
}
if(this._function){
return;
}
this.setCode(_2bf);
};
_2.Executable=_271;
_271.prototype.path=function(){
return this.URL().path();
};
_271.prototype.URL=function(){
return this._URL;
};
_271.prototype.functionParameters=function(){
var _2c2=["global","objj_executeFile","objj_importFile"];
return _2c2;
};
_271.prototype.functionArguments=function(){
var _2c3=[_1,this.fileExecuter(),this.fileImporter()];
return _2c3;
};
_271.prototype.execute=function(){
var _2c4=_2c5;
_2c5=CFBundle.bundleContainingURL(this.URL());
var _2c6=this._function.apply(_1,this.functionArguments());
_2c5=_2c4;
return _2c6;
};
_271.prototype.code=function(){
return this._code;
};
_271.prototype.setCode=function(code){
this._code=code;
var _2c7=this.functionParameters().join(",");
this._function=new Function(_2c7,code);
};
_271.prototype.fileDependencies=function(){
return this._fileDependencies;
};
_271.prototype.hasLoadedFileDependencies=function(){
return this._fileDependencyStatus===_2bd;
};
var _2c8=0,_2c9=[],_2ca={};
_271.prototype.loadFileDependencies=function(_2cb){
var _2cc=this._fileDependencyStatus;
if(_2cc===_2bd){
return _2cb();
}
this._fileDependencyCallbacks.push(_2cb);
if(_2cc===_2bb){
if(_2c8){
throw "Can't load";
}
_2cd(this);
}
};
function _2cd(_2ce){
_2c9.push(_2ce);
_2ce._fileDependencyStatus=_2bc;
var _2cf=_2ce.fileDependencies(),_8c=0,_2d0=_2cf.length,_2d1=_2ce.referenceURL(),_2d2=_2d1.absoluteString(),_2d3=_2ce.fileExecutableSearcher();
_2c8+=_2d0;
for(;_8c<_2d0;++_8c){
var _2d4=_2cf[_8c],_2d5=_2d4.isLocal(),URL=_2d4.URL(),_2d6=(_2d5&&(_2d2+" ")||"")+URL;
if(_2ca[_2d6]){
if(--_2c8===0){
_2d7();
}
continue;
}
_2ca[_2d6]=YES;
_2d3(URL,_2d5,_2d8);
}
};
function _2d8(_2d9){
--_2c8;
if(_2d9._fileDependencyStatus===_2bb){
_2cd(_2d9);
}else{
if(_2c8===0){
_2d7();
}
}
};
function _2d7(){
var _2da=_2c9,_8c=0,_2db=_2da.length;
_2c9=[];
for(;_8c<_2db;++_8c){
_2da[_8c]._fileDependencyStatus=_2bd;
}
for(_8c=0;_8c<_2db;++_8c){
var _2dc=_2da[_8c],_2dd=_2dc._fileDependencyCallbacks,_2de=0,_2df=_2dd.length;
for(;_2de<_2df;++_2de){
_2dd[_2de]();
}
_2dc._fileDependencyCallbacks=[];
}
};
_271.prototype.referenceURL=function(){
if(this._referenceURL===_44){
this._referenceURL=new CFURL(".",this.URL());
}
return this._referenceURL;
};
_271.prototype.fileImporter=function(){
return _271.fileImporterForURL(this.referenceURL());
};
_271.prototype.fileExecuter=function(){
return _271.fileExecuterForURL(this.referenceURL());
};
_271.prototype.fileExecutableSearcher=function(){
return _271.fileExecutableSearcherForURL(this.referenceURL());
};
var _2e0={};
_271.fileExecuterForURL=function(aURL){
var _2e1=_19e(aURL),_2e2=_2e1.absoluteString(),_2e3=_2e0[_2e2];
if(!_2e3){
_2e3=function(aURL,_2e4,_2e5){
_271.fileExecutableSearcherForURL(_2e1)(aURL,_2e4,function(_2e6){
if(!_2e6.hasLoadedFileDependencies()){
throw "No executable loaded for file at URL "+aURL;
}
_2e6.execute(_2e5);
});
};
_2e0[_2e2]=_2e3;
}
return _2e3;
};
var _2e7={};
_271.fileImporterForURL=function(aURL){
var _2e8=_19e(aURL),_2e9=_2e8.absoluteString(),_2ea=_2e7[_2e9];
if(!_2ea){
_2ea=function(aURL,_2eb,_2ec){
_140();
_271.fileExecutableSearcherForURL(_2e8)(aURL,_2eb,function(_2ed){
_2ed.loadFileDependencies(function(){
_2ed.execute();
_141();
if(_2ec){
_2ec();
}
});
});
};
_2e7[_2e9]=_2ea;
}
return _2ea;
};
var _2ee={},_2ef={};
_271.fileExecutableSearcherForURL=function(_2f0){
var _2f1=_2f0.absoluteString(),_2f2=_2ee[_2f1],_2f3={};
if(!_2f2){
_2f2=function(aURL,_2f4,_2f5){
var _2f6=(_2f4&&_2f0||"")+aURL,_2f7=_2ef[_2f6];
if(_2f7){
return _2f8(_2f7);
}
var _2f9=(aURL instanceof CFURL)&&aURL.scheme();
if(_2f4||_2f9){
if(!_2f9){
aURL=new CFURL(aURL,_2f0);
}
_18b.resolveResourceAtURL(aURL,NO,_2f8);
}else{
_18b.resolveResourceAtURLSearchingIncludeURLs(aURL,_2f8);
}
function _2f8(_2fa){
if(!_2fa){
throw new Error("Could not load file at "+aURL);
}
_2ef[_2f6]=_2fa;
_2f5(new _2fb(_2fa.URL()));
};
};
_2ee[_2f1]=_2f2;
}
return _2f2;
};
var _2fc={};
function _2fb(aURL,_2fd){
aURL=_19e(aURL);
var _2fe=aURL.absoluteString(),_2ff=_2fc[_2fe];
if(_2ff){
return _2ff;
}
_2fc[_2fe]=this;
var _300=_18b.resourceAtURL(aURL).contents(),_301=NULL,_302=aURL.pathExtension();
if(_2fd){
_301=_2fd;
}else{
if(_300.match(/^@STATIC;/)){
_301=_303(_300,aURL);
}else{
if(_302==="j"||!_302){
_301=_2.preprocess(_300,aURL,_26d.Flags.IncludeDebugSymbols);
}else{
_301=new _271(_300,[],aURL);
}
}
}
_271.apply(this,[_301.code(),_301.fileDependencies(),aURL,_301._function]);
this._hasExecuted=NO;
};
_2.FileExecutable=_2fb;
_2fb.prototype=new _271();
_2fb.prototype.execute=function(_304){
if(this._hasExecuted&&!_304){
return;
}
this._hasExecuted=YES;
_271.prototype.execute.call(this);
};
_2fb.prototype.hasExecuted=function(){
return this._hasExecuted;
};
function _303(_305,aURL){
var _306=new _f8(_305);
var _307=NULL,code="",_308=[];
while(_307=_306.getMarker()){
var text=_306.getString();
if(_307===_1fa){
code+=text;
}else{
if(_307===_1fb){
_308.push(new _29a(new CFURL(text),NO));
}else{
if(_307===_1fc){
_308.push(new _29a(new CFURL(text),YES));
}
}
}
}
return new _271(code,_308,aURL);
};
var _309=1,_30a=2,_30b=4,_30c=8;
objj_ivar=function(_30d,_30e){
this.name=_30d;
this.type=_30e;
};
objj_method=function(_30f,_310,_311){
this.name=_30f;
this.method_imp=_310;
this.types=_311;
};
objj_class=function(){
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
class_getName=function(_312){
if(_312==Nil){
return "";
}
return _312.name;
};
class_isMetaClass=function(_313){
if(!_313){
return NO;
}
return ((_313.info&(_30a)));
};
class_getSuperclass=function(_314){
if(_314==Nil){
return Nil;
}
return _314.super_class;
};
class_setSuperclass=function(_315,_316){
_315.super_class=_316;
_315.isa.super_class=_316.isa;
};
class_addIvar=function(_317,_318,_319){
var _31a=_317.allocator.prototype;
if(typeof _31a[_318]!="undefined"){
return NO;
}
_317.ivars.push(new objj_ivar(_318,_319));
_31a[_318]=NULL;
return YES;
};
class_addIvars=function(_31b,_31c){
var _31d=0,_31e=_31c.length,_31f=_31b.allocator.prototype;
for(;_31d<_31e;++_31d){
var ivar=_31c[_31d],name=ivar.name;
if(typeof _31f[name]==="undefined"){
_31b.ivars.push(ivar);
_31f[name]=NULL;
}
}
};
class_copyIvarList=function(_320){
return _320.ivars.slice(0);
};
class_addMethod=function(_321,_322,_323,_324){
if(_321.method_hash[_322]){
return NO;
}
var _325=new objj_method(_322,_323,_324);
_321.method_list.push(_325);
_321.method_dtable[_322]=_325;
if(!((_321.info&(_30a)))&&(((_321.info&(_30a)))?_321:_321.isa).isa===(((_321.info&(_30a)))?_321:_321.isa)){
class_addMethod((((_321.info&(_30a)))?_321:_321.isa),_322,_323,_324);
}
return YES;
};
class_addMethods=function(_326,_327){
var _328=0,_329=_327.length,_32a=_326.method_list,_32b=_326.method_dtable;
for(;_328<_329;++_328){
var _32c=_327[_328];
if(_326.method_hash[_32c.name]){
continue;
}
_32a.push(_32c);
_32b[_32c.name]=_32c;
}
if(!((_326.info&(_30a)))&&(((_326.info&(_30a)))?_326:_326.isa).isa===(((_326.info&(_30a)))?_326:_326.isa)){
class_addMethods((((_326.info&(_30a)))?_326:_326.isa),_327);
}
};
class_getInstanceMethod=function(_32d,_32e){
if(!_32d||!_32e){
return NULL;
}
var _32f=_32d.method_dtable[_32e];
return _32f?_32f:NULL;
};
class_getClassMethod=function(_330,_331){
if(!_330||!_331){
return NULL;
}
var _332=(((_330.info&(_30a)))?_330:_330.isa).method_dtable[_331];
return _332?_332:NULL;
};
class_copyMethodList=function(_333){
return _333.method_list.slice(0);
};
class_replaceMethod=function(_334,_335,_336){
if(!_334||!_335){
return NULL;
}
var _337=_334.method_dtable[_335],_338=NULL;
if(_337){
_338=_337.method_imp;
}
_337.method_imp=_336;
return _338;
};
var _339=function(_33a){
var meta=(((_33a.info&(_30a)))?_33a:_33a.isa);
if((_33a.info&(_30a))){
_33a=objj_getClass(_33a.name);
}
if(_33a.super_class&&!((((_33a.super_class.info&(_30a)))?_33a.super_class:_33a.super_class.isa).info&(_30b))){
_339(_33a.super_class);
}
if(!(meta.info&(_30b))&&!(meta.info&(_30c))){
meta.info=(meta.info|(_30c))&~(0);
objj_msgSend(_33a,"initialize");
meta.info=(meta.info|(_30b))&~(_30c);
}
};
var _33b=new objj_method("forward",function(self,_33c){
return objj_msgSend(self,"forward::",_33c,arguments);
});
class_getMethodImplementation=function(_33d,_33e){
if(!((((_33d.info&(_30a)))?_33d:_33d.isa).info&(_30b))){
_339(_33d);
}
var _33f=_33d.method_dtable[_33e];
if(!_33f){
_33f=_33b;
}
var _340=_33f.method_imp;
return _340;
};
var _341={};
objj_allocateClassPair=function(_342,_343){
var _344=new objj_class(),_345=new objj_class(),_346=_344;
if(_342){
_346=_342;
while(_346.superclass){
_346=_346.superclass;
}
_344.allocator.prototype=new _342.allocator;
_344.method_store.prototype=new _342.method_store;
_344.method_dtable=_344.method_store.prototype;
_345.method_store.prototype=new _342.isa.method_store;
_345.method_dtable=_345.method_store.prototype;
_344.super_class=_342;
_345.super_class=_342.isa;
}else{
_344.allocator.prototype=new objj_object();
}
_344.isa=_345;
_344.name=_343;
_344.info=_309;
_344._UID=objj_generateObjectUID();
_345.isa=_346.isa;
_345.name=_343;
_345.info=_30a;
_345._UID=objj_generateObjectUID();
return _344;
};
var _2c5=nil;
objj_registerClassPair=function(_347){
_1[_347.name]=_347;
_341[_347.name]=_347;
_1a5(_347,_2c5);
};
class_createInstance=function(_348){
if(!_348){
objj_exception_throw(new objj_exception(OBJJNilClassException,"*** Attempting to create object with Nil class."));
}
var _349=new _348.allocator();
_349.isa=_348;
_349._UID=objj_generateObjectUID();
return _349;
};
var _34a=function(){
};
_34a.prototype.member=false;
with(new _34a()){
member=true;
}
if(new _34a().member){
var _34b=class_createInstance;
class_createInstance=function(_34c){
var _34d=_34b(_34c);
if(_34d){
var _34e=_34d.isa,_34f=_34e;
while(_34e){
var _350=_34e.ivars;
count=_350.length;
while(count--){
_34d[_350[count].name]=NULL;
}
_34e=_34e.super_class;
}
_34d.isa=_34f;
}
return _34d;
};
}
object_getClassName=function(_351){
if(!_351){
return "";
}
var _352=_351.isa;
return _352?class_getName(_352):"";
};
objj_lookUpClass=function(_353){
var _354=_341[_353];
return _354?_354:Nil;
};
objj_getClass=function(_355){
var _356=_341[_355];
if(!_356){
}
return _356?_356:Nil;
};
objj_getMetaClass=function(_357){
var _358=objj_getClass(_357);
return (((_358.info&(_30a)))?_358:_358.isa);
};
ivar_getName=function(_359){
return _359.name;
};
ivar_getTypeEncoding=function(_35a){
return _35a.type;
};
objj_msgSend=function(_35b,_35c){
if(_35b==nil){
return nil;
}
var isa=_35b.isa;
if(!((((isa.info&(_30a)))?isa:isa.isa).info&(_30b))){
_339(isa);
}
var _35d=isa.method_dtable[_35c];
if(!_35d){
_35d=_33b;
}
var _35e=_35d.method_imp;
switch(arguments.length){
case 2:
return _35e(_35b,_35c);
case 3:
return _35e(_35b,_35c,arguments[2]);
case 4:
return _35e(_35b,_35c,arguments[2],arguments[3]);
}
return _35e.apply(_35b,arguments);
};
objj_msgSendSuper=function(_35f,_360){
var _361=_35f.super_class;
arguments[0]=_35f.receiver;
if(!((((_361.info&(_30a)))?_361:_361.isa).info&(_30b))){
_339(_361);
}
var _362=_361.method_dtable[_360];
if(!_362){
_362=_33b;
}
var _363=_362.method_imp;
return _363.apply(_35f.receiver,arguments);
};
method_getName=function(_364){
return _364.name;
};
method_getImplementation=function(_365){
return _365.method_imp;
};
method_setImplementation=function(_366,_367){
var _368=_366.method_imp;
_366.method_imp=_367;
return _368;
};
method_exchangeImplementations=function(lhs,rhs){
var _369=method_getImplementation(lhs),_36a=method_getImplementation(rhs);
method_setImplementation(lhs,_36a);
method_setImplementation(rhs,_369);
};
sel_getName=function(_36b){
return _36b?_36b:"<null selector>";
};
sel_getUid=function(_36c){
return _36c;
};
sel_isEqual=function(lhs,rhs){
return lhs===rhs;
};
sel_registerName=function(_36d){
return _36d;
};
_140();
var _36e=new CFURL(window.location.href),_36f=document.getElementsByTagName("base"),_370=_36f.length;
if(_370>0){
var _371=_36f[_370-1],_372=_371&&_371.getAttribute("href");
if(_372){
_36e=new CFURL(_372,_36e);
}
}
var _373=new CFURL(window.OBJJ_MAIN_FILE||"main.j"),_1a4=new CFURL(".",new CFURL(_373,_36e)).absoluteURL(),_374=new CFURL("..",_1a4).absoluteURL();
if(_1a4===_374){
_374=new CFURL(_374.schemeAndAuthority());
}
_18b.resourceAtURL(_374,YES);
_2.pageURL=_36e;
_2.bootstrap=function(){
_375();
};
function _375(){
_18b.resolveResourceAtURL(_1a4,YES,function(_376){
var _377=_18b.includeURLs(),_8c=0,_378=_377.length;
for(;_8c<_378;++_8c){
_376.resourceAtURL(_377[_8c],YES);
}
_271.fileImporterForURL(_1a4)(_373.lastPathComponent(),YES,function(){
_141();
_37e(function(){
var _379=window.location.hash.substring(1),args=[];
if(_379.length){
args=_379.split("/");
for(var i=0,_378=args.length;i<_378;i++){
args[i]=decodeURIComponent(args[i]);
}
}
var _37a=window.location.search.substring(1).split("&"),_37b=new CFMutableDictionary();
for(var i=0,_378=_37a.length;i<_378;i++){
var _37c=_37a[i].split("=");
if(!_37c[0]){
continue;
}
if(_37c[1]==null){
_37c[1]=true;
}
_37b.setValueForKey(decodeURIComponent(_37c[0]),decodeURIComponent(_37c[1]));
}
main(args,_37b);
});
});
});
};
var _37d=NO;
function _37e(_37f){
if(_37d){
return _37f();
}
if(window.addEventListener){
window.addEventListener("load",_37f,NO);
}else{
if(window.attachEvent){
window.attachEvent("onload",_37f);
}
}
};
_37e(function(){
_37d=YES;
});
if(typeof OBJJ_AUTO_BOOTSTRAP==="undefined"||OBJJ_AUTO_BOOTSTRAP){
_2.bootstrap();
}
function _19e(aURL){
if(aURL instanceof CFURL&&aURL.scheme()){
return aURL;
}
return new CFURL(aURL,_1a4);
};
objj_importFile=_271.fileImporterForURL(_1a4);
objj_executeFile=_271.fileExecuterForURL(_1a4);
objj_import=function(){
CPLog.warn("objj_import is deprecated, use objj_importFile instead");
objj_importFile.apply(this,arguments);
};
})(window,ObjectiveJ);
