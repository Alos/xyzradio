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
CFHTTPRequest.prototype.open=function(_98,url,_99,_9a,_9b){
var _9c=CFHTTPRequest._lookupCachedRequest(url);
if(_9c){
_9c.onreadystatechange=this._nativeRequest.onreadystatechange;
this._nativeRequest=_9c;
}
return this._nativeRequest.open(_98,url,_99,_9a,_9b);
};
CFHTTPRequest.prototype.send=function(_9d){
try{
return this._nativeRequest.send(_9d);
}
catch(anException){
this._eventDispatcher.dispatchEvent({type:"failure",request:this});
}
};
CFHTTPRequest.prototype.abort=function(){
return this._nativeRequest.abort();
};
CFHTTPRequest.prototype.addEventListener=function(_9e,_9f){
this._eventDispatcher.addEventListener(_9e,_9f);
};
CFHTTPRequest.prototype.removeEventListener=function(_a0,_a1){
this._eventDispatcher.removeEventListener(_a0,_a1);
};
function _8f(_a2){
var _a3=_a2._eventDispatcher;
_a3.dispatchEvent({type:"readystatechange",request:_a2});
var _a4=_a2._nativeRequest,_a5=["uninitialized","loading","loaded","interactive","complete"][_a2.readyState()];
_a3.dispatchEvent({type:_a5,request:_a2});
if(_a5==="complete"){
var _a6="HTTP"+_a2.status();
_a3.dispatchEvent({type:_a6,request:_a2});
var _a7=_a2.success()?"success":"failure";
_a3.dispatchEvent({type:_a7,request:_a2});
}
};
function _a8(_a9,_aa,_ab){
var _ac=new CFHTTPRequest();
if(_a9.pathExtension()==="plist"){
_ac.overrideMimeType("text/xml");
}
if(_a8.async){
_ac.onsuccess=_83(_aa);
_ac.onfailure=_83(_ab);
}else{
_ac.onsuccess=_aa;
_ac.onfailure=_ab;
}
_ac.open("GET",_a9.absoluteString(),_a8.async);
_ac.send("");
};
_a8.async=YES;
var _ad={};
CFHTTPRequest._cacheRequest=function(_ae,_af,_b0,_b1){
_ae=typeof _ae==="string"?_ae:_ae.absoluteString();
_ad[_ae]=new _b2(_af,_b0,_b1);
};
CFHTTPRequest._lookupCachedRequest=function(_b3){
_b3=typeof _b3==="string"?_b3:_b3.absoluteString();
return _ad[_b3];
};
function _b2(_b4,_b5,_b6){
this.readyState=CFHTTPRequest.UninitializedState;
this.status=_b4||200;
this.statusText="";
this.responseText=_b6||"";
this._responseHeaders=_b5||{};
};
_b2.prototype.open=function(_b7,url,_b8,_b9,_ba){
this.readyState=CFHTTPRequest.LoadingState;
this.async=_b8;
};
_b2.prototype.send=function(_bb){
var _bc=this;
_bc.responseText=_bc.responseText.toString();
function _bd(){
for(_bc.readyState=CFHTTPRequest.LoadedState;_bc.readyState<=CFHTTPRequest.CompleteState;_bc.readyState++){
_bc.onreadystatechange();
}
};
(_bc.async?_83(_bd):_bd)();
};
_b2.prototype.onreadystatechange=function(){
};
_b2.prototype.abort=function(){
};
_b2.prototype.setRequestHeader=function(_be,_bf){
};
_b2.prototype.getAllResponseHeaders=function(){
return this._responseHeaders;
};
_b2.prototype.getResponseHeader=function(_c0){
return this._responseHeaders[_c0];
};
_b2.prototype.overrideMimeType=function(_c1){
};
var _c2=0;
objj_generateObjectUID=function(){
return _c2++;
};
CFPropertyList=function(){
this._UID=objj_generateObjectUID();
};
CFPropertyList.DTDRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?/i;
CFPropertyList.XMLRE=/^\s*(?:<\?\s*xml\s+version\s*=\s*\"1.0\"[^>]*\?>\s*)?(?:<\!DOCTYPE[^>]*>\s*)?<\s*plist[^>]*\>/i;
CFPropertyList.FormatXMLDTD="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">";
CFPropertyList.Format280NorthMagicNumber="280NPLIST";
CFPropertyList.FormatOpenStep=1,CFPropertyList.FormatXML_v1_0=100,CFPropertyList.FormatBinary_v1_0=200,CFPropertyList.Format280North_v1_0=-1000;
CFPropertyList.sniffedFormatOfString=function(_c3){
if(_c3.match(CFPropertyList.XMLRE)){
return CFPropertyList.FormatXML_v1_0;
}
if(_c3.substr(0,CFPropertyList.Format280NorthMagicNumber.length)===CFPropertyList.Format280NorthMagicNumber){
return CFPropertyList.Format280North_v1_0;
}
return NULL;
};
CFPropertyList.dataFromPropertyList=function(_c4,_c5){
var _c6=new CFMutableData();
_c6.setRawString(CFPropertyList.stringFromPropertyList(_c4,_c5));
return _c6;
};
CFPropertyList.stringFromPropertyList=function(_c7,_c8){
if(!_c8){
_c8=CFPropertyList.Format280North_v1_0;
}
var _c9=_ca[_c8];
return _c9["start"]()+_cb(_c7,_c9)+_c9["finish"]();
};
function _cb(_cc,_cd){
var _ce=typeof _cc,_cf=_cc.valueOf(),_d0=typeof _cf;
if(_ce!==_d0){
_ce=_d0;
_cc=_cf;
}
if(_cc===YES||_cc===NO){
_ce="boolean";
}else{
if(_ce==="number"){
if(FLOOR(_cc)===_cc){
_ce="integer";
}else{
_ce="real";
}
}else{
if(_ce!=="string"){
if(_cc.slice){
_ce="array";
}else{
_ce="dictionary";
}
}
}
}
return _cd[_ce](_cc,_cd);
};
var _ca={};
_ca[CFPropertyList.FormatXML_v1_0]={"start":function(){
return CFPropertyList.FormatXMLDTD+"<plist version = \"1.0\">";
},"finish":function(){
return "</plist>";
},"string":function(_d1){
return "<string>"+_d2(_d1)+"</string>";
},"boolean":function(_d3){
return _d3?"<true/>":"<false/>";
},"integer":function(_d4){
return "<integer>"+_d4+"</integer>";
},"real":function(_d5){
return "<real>"+_d5+"</real>";
},"array":function(_d6,_d7){
var _d8=0,_d9=_d6.length,_da="<array>";
for(;_d8<_d9;++_d8){
_da+=_cb(_d6[_d8],_d7);
}
return _da+"</array>";
},"dictionary":function(_db,_dc){
var _dd=_db._keys,_8c=0,_de=_dd.length,_df="<dict>";
for(;_8c<_de;++_8c){
var key=_dd[_8c];
_df+="<key>"+key+"</key>";
_df+=_cb(_db.valueForKey(key),_dc);
}
return _df+"</dict>";
}};
var _e0="A",_e1="D",_e2="f",_e3="d",_e4="S",_e5="T",_e6="F",_e7="K",_e8="E";
_ca[CFPropertyList.Format280North_v1_0]={"start":function(){
return CFPropertyList.Format280NorthMagicNumber+";1.0;";
},"finish":function(){
return "";
},"string":function(_e9){
return _e4+";"+_e9.length+";"+_e9;
},"boolean":function(_ea){
return (_ea?_e5:_e6)+";";
},"integer":function(_eb){
var _ec=""+_eb;
return _e3+";"+_ec.length+";"+_ec;
},"real":function(_ed){
var _ee=""+_ed;
return _e2+";"+_ee.length+";"+_ee;
},"array":function(_ef,_f0){
var _f1=0,_f2=_ef.length,_f3=_e0+";";
for(;_f1<_f2;++_f1){
_f3+=_cb(_ef[_f1],_f0);
}
return _f3+_e8+";";
},"dictionary":function(_f4,_f5){
var _f6=_f4._keys,_8c=0,_f7=_f6.length,_f8=_e1+";";
for(;_8c<_f7;++_8c){
var key=_f6[_8c];
_f8+=_e7+";"+key.length+";"+key;
_f8+=_cb(_f4.valueForKey(key),_f5);
}
return _f8+_e8+";";
}};
var _f9="xml",_fa="#document",_fb="plist",_fc="key",_fd="dict",_fe="array",_ff="string",_100="true",_101="false",_102="real",_103="integer",_104="data";
var _105=function(_106,_107,_108){
var node=_106;
node=(node.firstChild);
if(node!==NULL&&((node.nodeType)===8||(node.nodeType)===3)){
while((node=(node.nextSibling))&&((node.nodeType)===8||(node.nodeType)===3)){
}
}
if(node){
return node;
}
if((String(_106.nodeName))===_fe||(String(_106.nodeName))===_fd){
_108.pop();
}else{
if(node===_107){
return NULL;
}
node=_106;
while((node=(node.nextSibling))&&((node.nodeType)===8||(node.nodeType)===3)){
}
if(node){
return node;
}
}
node=_106;
while(node){
var next=node;
while((next=(next.nextSibling))&&((next.nodeType)===8||(next.nodeType)===3)){
}
if(next){
return next;
}
var node=(node.parentNode);
if(_107&&node===_107){
return NULL;
}
_108.pop();
}
return NULL;
};
CFPropertyList.propertyListFromData=function(_109,_10a){
return CFPropertyList.propertyListFromString(_109.rawString(),_10a);
};
CFPropertyList.propertyListFromString=function(_10b,_10c){
if(!_10c){
_10c=CFPropertyList.sniffedFormatOfString(_10b);
}
if(_10c===CFPropertyList.FormatXML_v1_0){
return CFPropertyList.propertyListFromXML(_10b);
}
if(_10c===CFPropertyList.Format280North_v1_0){
return _10d(_10b);
}
return NULL;
};
var _e0="A",_e1="D",_e2="f",_e3="d",_e4="S",_e5="T",_e6="F",_e7="K",_e8="E";
function _10d(_10e){
var _10f=new _110(_10e),_111=NULL,key="",_112=NULL,_113=NULL,_114=[],_115=NULL;
while(_111=_10f.getMarker()){
if(_111===_e8){
_114.pop();
continue;
}
var _116=_114.length;
if(_116){
_115=_114[_116-1];
}
if(_111===_e7){
key=_10f.getString();
_111=_10f.getMarker();
}
switch(_111){
case _e0:
_112=[];
_114.push(_112);
break;
case _e1:
_112=new CFMutableDictionary();
_114.push(_112);
break;
case _e2:
_112=parseFloat(_10f.getString());
break;
case _e3:
_112=parseInt(_10f.getString(),10);
break;
case _e4:
_112=_10f.getString();
break;
case _e5:
_112=YES;
break;
case _e6:
_112=NO;
break;
default:
throw new Error("*** "+_111+" marker not recognized in Plist.");
}
if(!_113){
_113=_112;
}else{
if(_115){
if(_115.slice){
_115.push(_112);
}else{
_115.setValueForKey(key,_112);
}
}
}
}
return _113;
};
function _d2(_117){
return _117.replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&apos;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
};
function _118(_119){
return _119.replace(/&quot;/g,"\"").replace(/&apos;/g,"'").replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&amp;/g,"&");
};
function _92(_11a){
if(window.DOMParser){
return (new window.DOMParser().parseFromString(_11a,"text/xml").documentElement);
}else{
if(window.ActiveXObject){
XMLNode=new ActiveXObject("Microsoft.XMLDOM");
var _11b=_11a.match(CFPropertyList.DTDRE);
if(_11b){
_11a=_11a.substr(_11b[0].length);
}
XMLNode.loadXML(_11a);
return XMLNode;
}
}
return NULL;
};
CFPropertyList.propertyListFromXML=function(_11c){
var _11d=_11c;
if(_11c.valueOf&&typeof _11c.valueOf()==="string"){
_11d=_92(_11c);
}
while(((String(_11d.nodeName))===_fa)||((String(_11d.nodeName))===_f9)){
_11d=(_11d.firstChild);
}
if(_11d!==NULL&&((_11d.nodeType)===8||(_11d.nodeType)===3)){
while((_11d=(_11d.nextSibling))&&((_11d.nodeType)===8||(_11d.nodeType)===3)){
}
}
if(((_11d.nodeType)===10)){
while((_11d=(_11d.nextSibling))&&((_11d.nodeType)===8||(_11d.nodeType)===3)){
}
}
if(!((String(_11d.nodeName))===_fb)){
return NULL;
}
var key="",_11e=NULL,_11f=NULL,_120=_11d,_121=[],_122=NULL;
while(_11d=_105(_11d,_120,_121)){
var _123=_121.length;
if(_123){
_122=_121[_123-1];
}
if((String(_11d.nodeName))===_fc){
key=((String((_11d.firstChild).nodeValue)));
while((_11d=(_11d.nextSibling))&&((_11d.nodeType)===8||(_11d.nodeType)===3)){
}
}
switch(String((String(_11d.nodeName)))){
case _fe:
_11e=[];
_121.push(_11e);
break;
case _fd:
_11e=new CFMutableDictionary();
_121.push(_11e);
break;
case _102:
_11e=parseFloat(((String((_11d.firstChild).nodeValue))));
break;
case _103:
_11e=parseInt(((String((_11d.firstChild).nodeValue))),10);
break;
case _ff:
_11e=_118((_11d.firstChild)?((String((_11d.firstChild).nodeValue))):"");
break;
case _100:
_11e=YES;
break;
case _101:
_11e=NO;
break;
case _104:
_11e=new CFMutableData();
_11e.bytes=(_11d.firstChild)?CFData.decodeBase64ToArray(((String((_11d.firstChild).nodeValue))),YES):[];
break;
default:
throw new Error("*** "+(String(_11d.nodeName))+" tag not recognized in Plist.");
}
if(!_11f){
_11f=_11e;
}else{
if(_122){
if(_122.slice){
_122.push(_11e);
}else{
_122.setValueForKey(key,_11e);
}
}
}
}
return _11f;
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
CFPropertyListCreateXMLData=function(_124){
return CFPropertyList.dataFromPropertyList(_124,CFPropertyList.FormatXML_v1_0);
};
CFPropertyListCreateFrom280NorthData=function(data){
return CFPropertyList.propertyListFromData(data,CFPropertyList.Format280North_v1_0);
};
CFPropertyListCreate280NorthData=function(_125){
return CFPropertyList.dataFromPropertyList(_125,CFPropertyList.Format280North_v1_0);
};
CPPropertyListCreateFromData=function(data,_126){
return CFPropertyList.propertyListFromData(data,_126);
};
CPPropertyListCreateData=function(_127,_128){
return CFPropertyList.dataFromPropertyList(_127,_128);
};
CFDictionary=function(_129){
this._keys=[];
this._count=0;
this._buckets={};
this._UID=objj_generateObjectUID();
};
var _12a=Array.prototype.indexOf,_71=Object.prototype.hasOwnProperty;
CFDictionary.prototype.copy=function(){
return this;
};
CFDictionary.prototype.mutableCopy=function(){
var _12b=new CFMutableDictionary(),keys=this._keys,_12c=this._count;
_12b._keys=keys.slice();
_12b._count=_12c;
var _12d=0,_12e=this._buckets,_12f=_12b._buckets;
for(;_12d<_12c;++_12d){
var key=keys[_12d];
_12f[key]=_12e[key];
}
return _12b;
};
CFDictionary.prototype.containsKey=function(aKey){
return _71.apply(this._buckets,[aKey]);
};
CFDictionary.prototype.containsValue=function(_130){
var keys=this._keys,_131=this._buckets,_8c=0,_132=keys.length;
for(;_8c<_132;++_8c){
if(_131[keys]===_130){
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
CFDictionary.prototype.countOfValue=function(_133){
var keys=this._keys,_134=this._buckets,_8c=0,_135=keys.length,_136=0;
for(;_8c<_135;++_8c){
if(_134[keys]===_133){
return ++_136;
}
}
return _136;
};
CFDictionary.prototype.keys=function(){
return this._keys.slice();
};
CFDictionary.prototype.valueForKey=function(aKey){
var _137=this._buckets;
if(!_71.apply(_137,[aKey])){
return nil;
}
return _137[aKey];
};
CFDictionary.prototype.toString=function(){
var _138="{\n",keys=this._keys,_8c=0,_139=this._count;
for(;_8c<_139;++_8c){
var key=keys[_8c];
_138+="\t"+key+" = \""+String(this.valueForKey(key)).split("\n").join("\n\t")+"\"\n";
}
return _138+"}";
};
CFMutableDictionary=function(_13a){
CFDictionary.apply(this,[]);
};
CFMutableDictionary.prototype=new CFDictionary();
CFMutableDictionary.prototype.copy=function(){
return this.mutableCopy();
};
CFMutableDictionary.prototype.addValueForKey=function(aKey,_13b){
if(this.containsKey(aKey)){
return;
}
++this._count;
this._keys.push(aKey);
this._buckets[aKey]=_13b;
};
CFMutableDictionary.prototype.removeValueForKey=function(aKey){
var _13c=-1;
if(_12a){
_13c=_12a.call(this._keys,aKey);
}else{
var keys=this._keys,_8c=0,_13d=keys.length;
for(;_8c<_13d;++_8c){
if(keys[_8c]===aKey){
_13c=_8c;
break;
}
}
}
if(_13c===-1){
return;
}
--this._count;
this._keys.splice(_13c,1);
delete this._buckets[aKey];
};
CFMutableDictionary.prototype.removeAllValues=function(){
this._count=0;
this._keys=[];
this._buckets={};
};
CFMutableDictionary.prototype.replaceValueForKey=function(aKey,_13e){
if(!this.containsKey(aKey)){
return;
}
this._buckets[aKey]=_13e;
};
CFMutableDictionary.prototype.setValueForKey=function(aKey,_13f){
if(_13f===nil||_13f===_44){
this.removeValueForKey(aKey);
}else{
if(this.containsKey(aKey)){
this.replaceValueForKey(aKey,_13f);
}else{
this.addValueForKey(aKey,_13f);
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
function _140(_141){
this._rawString=NULL;
this._propertyList=NULL;
this._propertyListFormat=NULL;
this._JSONObject=NULL;
this._bytes=NULL;
this._base64=NULL;
};
CFMutableData.prototype.setPropertyList=function(_142,_143){
_140(this);
this._propertyList=_142;
this._propertyListFormat=_143;
};
CFMutableData.prototype.setJSONObject=function(_144){
_140(this);
this._JSONObject=_144;
};
CFMutableData.prototype.setRawString=function(_145){
_140(this);
this._rawString=_145;
};
CFMutableData.prototype.setBytes=function(_146){
_140(this);
this._bytes=_146;
};
CFMutableData.prototype.setBase64String=function(_147){
_140(this);
this._base64=_147;
};
var _148=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/","="],_149=[];
for(var i=0;i<_148.length;i++){
_149[_148[i].charCodeAt(0)]=i;
}
CFData.decodeBase64ToArray=function(_14a,_14b){
if(_14b){
_14a=_14a.replace(/[^A-Za-z0-9\+\/\=]/g,"");
}
var pad=(_14a[_14a.length-1]=="="?1:0)+(_14a[_14a.length-2]=="="?1:0),_14c=_14a.length,_14d=[];
var i=0;
while(i<_14c){
var bits=(_149[_14a.charCodeAt(i++)]<<18)|(_149[_14a.charCodeAt(i++)]<<12)|(_149[_14a.charCodeAt(i++)]<<6)|(_149[_14a.charCodeAt(i++)]);
_14d.push((bits&16711680)>>16);
_14d.push((bits&65280)>>8);
_14d.push(bits&255);
}
if(pad>0){
return _14d.slice(0,-1*pad);
}
return _14d;
};
CFData.encodeBase64Array=function(_14e){
var pad=(3-(_14e.length%3))%3,_14f=_14e.length+pad,_150=[];
if(pad>0){
_14e.push(0);
}
if(pad>1){
_14e.push(0);
}
var i=0;
while(i<_14f){
var bits=(_14e[i++]<<16)|(_14e[i++]<<8)|(_14e[i++]);
_150.push(_148[(bits&16515072)>>18]);
_150.push(_148[(bits&258048)>>12]);
_150.push(_148[(bits&4032)>>6]);
_150.push(_148[bits&63]);
}
if(pad>0){
_150[_150.length-1]="=";
_14e.pop();
}
if(pad>1){
_150[_150.length-2]="=";
_14e.pop();
}
return _150.join("");
};
CFData.decodeBase64ToString=function(_151,_152){
return CFData.bytesToString(CFData.decodeBase64ToArray(_151,_152));
};
CFData.bytesToString=function(_153){
return String.fromCharCode.apply(NULL,_153);
};
CFData.encodeBase64String=function(_154){
var temp=[];
for(var i=0;i<_154.length;i++){
temp.push(_154.charCodeAt(i));
}
return CFData.encodeBase64Array(temp);
};
var _155,_156,_157=0;
function _158(){
if(++_157!==1){
return;
}
_155={};
_156={};
};
function _159(){
_157=MAX(_157-1,0);
if(_157!==0){
return;
}
delete _155;
delete _156;
};
var _15a=new RegExp("^"+"(?:"+"([^:/?#]+):"+")?"+"(?:"+"(//)"+"("+"(?:"+"("+"([^:@]*)"+":?"+"([^:@]*)"+")?"+"@"+")?"+"([^:/?#]*)"+"(?::(\\d*))?"+")"+")?"+"([^?#]*)"+"(?:\\?([^#]*))?"+"(?:#(.*))?");
var _15b=["url","scheme","authorityRoot","authority","userInfo","user","password","domain","portNumber","path","queryString","fragment"];
function _15c(aURL){
if(aURL._parts){
return aURL._parts;
}
var _15d=aURL.string(),_15e=_15d.match(/^mhtml:/);
if(_15e){
_15d=_15d.substr("mhtml:".length);
}
if(_157>0&&_71.call(_156,_15d)){
aURL._parts=_156[_15d];
return aURL._parts;
}
aURL._parts={};
var _15f=aURL._parts,_160=_15a.exec(_15d),_8c=_160.length;
while(_8c--){
_15f[_15b[_8c]]=_160[_8c]||NULL;
}
_15f.portNumber=parseInt(_15f.portNumber,10);
if(isNaN(_15f.portNumber)){
_15f.portNumber=-1;
}
_15f.pathComponents=[];
if(_15f.path){
var _161=_15f.path.split("/"),_162=_15f.pathComponents,_8c=0,_163=_161.length;
for(;_8c<_163;++_8c){
var _164=_161[_8c];
if(_164){
_162.push(_164);
}else{
if(_8c===0){
_162.push("/");
}
}
}
_15f.pathComponents=_162;
}
if(_15e){
_15f.url="mhtml:"+_15f.url;
_15f.scheme="mhtml:"+_15f.scheme;
}
if(_157>0){
_156[_15d]=_15f;
}
return _15f;
};
CFURL=function(aURL,_165){
aURL=aURL||"";
if(aURL instanceof CFURL){
if(!_165){
return aURL;
}
var _166=aURL.baseURL();
if(_166){
_165=new CFURL(_166.absoluteURL(),_165);
}
aURL=aURL.string();
}
if(_157>0){
var _167=aURL+" "+(_165&&_165.UID()||"");
if(_71.call(_155,_167)){
return _155[_167];
}
_155[_167]=this;
}
if(aURL.match(/^data:/)){
var _168={},_8c=_15b.length;
while(_8c--){
_168[_15b[_8c]]="";
}
_168.url=aURL;
_168.scheme="data";
_168.pathComponents=[];
this._parts=_168;
this._standardizedURL=this;
this._absoluteURL=this;
}
this._UID=objj_generateObjectUID();
this._string=aURL;
this._baseURL=_165;
};
CFURL.prototype.UID=function(){
return this._UID;
};
var _169={};
CFURL.prototype.mappedURL=function(){
return _169[this.absoluteString()]||this;
};
CFURL.setMappedURLForURL=function(_16a,_16b){
_169[_16a.absoluteString()]=_16b;
};
CFURL.prototype.schemeAndAuthority=function(){
var _16c="",_16d=this.scheme();
if(_16d){
_16c+=_16d+":";
}
var _16e=this.authority();
if(_16e){
_16c+="//"+_16e;
}
return _16c;
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
function _16f(aURL){
aURL=aURL.standardizedURL();
var _170=aURL.baseURL();
if(!_170){
return aURL;
}
var _171=((aURL)._parts||_15c(aURL)),_172,_173=_170.absoluteURL(),_174=((_173)._parts||_15c(_173));
if(_171.scheme||_171.authority){
_172=_171;
}else{
_172={};
_172.scheme=_174.scheme;
_172.authority=_174.authority;
_172.userInfo=_174.userInfo;
_172.user=_174.user;
_172.password=_174.password;
_172.domain=_174.domain;
_172.portNumber=_174.portNumber;
_172.queryString=_171.queryString;
_172.fragment=_171.fragment;
var _175=_171.pathComponents;
if(_175.length&&_175[0]==="/"){
_172.path=_171.path;
_172.pathComponents=_175;
}else{
var _176=_174.pathComponents,_177=_176.concat(_175);
if(!_170.hasDirectoryPath()&&_176.length){
_177.splice(_176.length-1,1);
}
if(_175.length&&_175[0]===".."){
_178(_177,YES);
}
_172.pathComponents=_177;
_172.path=_179(_177,_175.length<=0||aURL.hasDirectoryPath());
}
}
var _17a=_17b(_172),_17c=new CFURL(_17a);
_17c._parts=_172;
_17c._standardizedURL=_17c;
_17c._standardizedString=_17a;
_17c._absoluteURL=_17c;
_17c._absoluteString=_17a;
return _17c;
};
function _179(_17d,_17e){
var path=_17d.join("/");
if(path.length&&path.charAt(0)==="/"){
path=path.substr(1);
}
if(_17e){
path+="/";
}
return path;
};
function _178(_17f,_180){
var _181=0,_182=0,_183=_17f.length,_184=_180?_17f:[];
for(;_181<_183;++_181){
var _185=_17f[_181];
if(_185===""||_185==="."){
continue;
}
if(_185!==".."||_182===0||_184[_182-1]===".."){
_184[_182]=_185;
_182++;
continue;
}
if(_182>0&&_184[_182-1]!=="/"){
--_182;
}
}
_184.length=_182;
return _184;
};
function _17b(_186){
var _187="",_188=_186.scheme;
if(_188){
_187+=_188+":";
}
var _189=_186.authority;
if(_189){
_187+="//"+_189;
}
_187+=_186.path;
var _18a=_186.queryString;
if(_18a){
_187+="?"+_18a;
}
var _18b=_186.fragment;
if(_18b){
_187+="#"+_18b;
}
return _187;
};
CFURL.prototype.absoluteURL=function(){
if(this._absoluteURL===_44){
this._absoluteURL=_16f(this);
}
return this._absoluteURL;
};
CFURL.prototype.standardizedURL=function(){
if(this._standardizedURL===_44){
var _18c=((this)._parts||_15c(this)),_18d=_18c.pathComponents,_18e=_178(_18d,NO);
var _18f=_179(_18e,this.hasDirectoryPath());
if(_18c.path===_18f){
this._standardizedURL=this;
}else{
var _190=_191(_18c);
_190.pathComponents=_18e;
_190.path=_18f;
var _192=new CFURL(_17b(_190),this.baseURL());
_192._parts=_190;
_192._standardizedURL=_192;
this._standardizedURL=_192;
}
}
return this._standardizedURL;
};
function _191(_193){
var _194={},_195=_15b.length;
while(_195--){
var _196=_15b[_195];
_194[_196]=_193[_196];
}
return _194;
};
CFURL.prototype.string=function(){
return this._string;
};
CFURL.prototype.authority=function(){
var _197=((this)._parts||_15c(this)).authority;
if(_197){
return _197;
}
var _198=this.baseURL();
return _198&&_198.authority()||"";
};
CFURL.prototype.hasDirectoryPath=function(){
var _199=this._hasDirectoryPath;
if(_199===_44){
var path=this.path();
if(!path){
return NO;
}
if(path.charAt(path.length-1)==="/"){
return YES;
}
var _19a=this.lastPathComponent();
_199=_19a==="."||_19a==="..";
this._hasDirectoryPath=_199;
}
return this._hasDirectoryPath;
};
CFURL.prototype.hostName=function(){
return this.authority();
};
CFURL.prototype.fragment=function(){
return ((this)._parts||_15c(this)).fragment;
};
CFURL.prototype.lastPathComponent=function(){
if(this._lastPathComponent===_44){
var _19b=this.pathComponents(),_19c=_19b.length;
if(!_19c){
this._lastPathComponent="";
}else{
this._lastPathComponent=_19b[_19c-1];
}
}
return this._lastPathComponent;
};
CFURL.prototype.path=function(){
return ((this)._parts||_15c(this)).path;
};
CFURL.prototype.pathComponents=function(){
return ((this)._parts||_15c(this)).pathComponents;
};
CFURL.prototype.pathExtension=function(){
var _19d=this.lastPathComponent();
if(!_19d){
return NULL;
}
_19d=_19d.replace(/^\.*/,"");
var _19e=_19d.lastIndexOf(".");
return _19e<=0?"":_19d.substring(_19e+1);
};
CFURL.prototype.queryString=function(){
return ((this)._parts||_15c(this)).queryString;
};
CFURL.prototype.scheme=function(){
var _19f=this._scheme;
if(_19f===_44){
_19f=((this)._parts||_15c(this)).scheme;
if(!_19f){
var _1a0=this.baseURL();
_19f=_1a0&&_1a0.scheme();
}
this._scheme=_19f;
}
return _19f;
};
CFURL.prototype.user=function(){
return ((this)._parts||_15c(this)).user;
};
CFURL.prototype.password=function(){
return ((this)._parts||_15c(this)).password;
};
CFURL.prototype.portNumber=function(){
return ((this)._parts||_15c(this)).portNumber;
};
CFURL.prototype.domain=function(){
return ((this)._parts||_15c(this)).domain;
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
function _1a1(aURL){
if(!aURL._resourcePropertiesForKeys){
aURL._resourcePropertiesForKeys=new CFMutableDictionary();
}
return aURL._resourcePropertiesForKeys;
};
CFURL.prototype.resourcePropertyForKey=function(aKey){
return _1a1(this).valueForKey(aKey);
};
CFURL.prototype.setResourcePropertyForKey=function(aKey,_1a2){
_1a1(this).setValueForKey(aKey,_1a2);
};
CFURL.prototype.staticResourceData=function(){
var data=new CFMutableData();
data.setRawString(_1a3.resourceAtURL(this).contents());
return data;
};
function _110(_1a4){
this._string=_1a4;
var _1a5=_1a4.indexOf(";");
this._magicNumber=_1a4.substr(0,_1a5);
this._location=_1a4.indexOf(";",++_1a5);
this._version=_1a4.substring(_1a5,this._location++);
};
_110.prototype.magicNumber=function(){
return this._magicNumber;
};
_110.prototype.version=function(){
return this._version;
};
_110.prototype.getMarker=function(){
var _1a6=this._string,_1a7=this._location;
if(_1a7>=_1a6.length){
return null;
}
var next=_1a6.indexOf(";",_1a7);
if(next<0){
return null;
}
var _1a8=_1a6.substring(_1a7,next);
if(_1a8==="e"){
return null;
}
this._location=next+1;
return _1a8;
};
_110.prototype.getString=function(){
var _1a9=this._string,_1aa=this._location;
if(_1aa>=_1a9.length){
return null;
}
var next=_1a9.indexOf(";",_1aa);
if(next<0){
return null;
}
var size=parseInt(_1a9.substring(_1aa,next),10),text=_1a9.substr(next+1,size);
this._location=next+1+size;
return text;
};
var _1ab=0,_1ac=1<<0,_1ad=1<<1,_1ae=1<<2,_1af=1<<3,_1b0=1<<4;
var _1b1={},_1b2={},_1b3=new Date().getTime(),_1b4=0,_1b5=0;
CFBundle=function(aURL){
aURL=_1b6(aURL).asDirectoryPathURL();
var _1b7=aURL.absoluteString(),_1b8=_1b1[_1b7];
if(_1b8){
return _1b8;
}
_1b1[_1b7]=this;
this._bundleURL=aURL;
this._resourcesDirectoryURL=new CFURL("Resources/",aURL);
this._staticResource=NULL;
this._isValid=NO;
this._loadStatus=_1ab;
this._loadRequests=[];
this._infoDictionary=new CFDictionary();
this._eventDispatcher=new _6c(this);
};
CFBundle.environments=function(){
return ["Browser","ObjJ"];
};
CFBundle.bundleContainingURL=function(aURL){
aURL=new CFURL(".",_1b6(aURL));
var _1b9,_1ba=aURL.absoluteString();
while(!_1b9||_1b9!==_1ba){
var _1bb=_1b1[_1ba];
if(_1bb&&_1bb._isValid){
return _1bb;
}
aURL=new CFURL("..",aURL);
_1b9=_1ba;
_1ba=aURL.absoluteString();
}
return NULL;
};
CFBundle.mainBundle=function(){
return new CFBundle(_1bc);
};
function _1bd(_1be,_1bf){
if(_1bf){
_1b2[_1be.name]=_1bf;
}
};
CFBundle.bundleForClass=function(_1c0){
return _1b2[_1c0.name]||CFBundle.mainBundle();
};
CFBundle.prototype.bundleURL=function(){
return this._bundleURL;
};
CFBundle.prototype.resourcesDirectoryURL=function(){
return this._resourcesDirectoryURL;
};
CFBundle.prototype.resourceURL=function(_1c1,_1c2,_1c3){
if(_1c2){
_1c1=_1c1+"."+_1c2;
}
if(_1c3){
_1c1=_1c3+"/"+_1c1;
}
var _1c4=(new CFURL(_1c1,this.resourcesDirectoryURL())).mappedURL();
return _1c4.absoluteURL();
};
CFBundle.prototype.mostEligibleEnvironmentURL=function(){
if(this._mostEligibleEnvironmentURL===_44){
this._mostEligibleEnvironmentURL=new CFURL(this.mostEligibleEnvironment()+".environment/",this.bundleURL());
}
return this._mostEligibleEnvironmentURL;
};
CFBundle.prototype.executableURL=function(){
if(this._executableURL===_44){
var _1c5=this.valueForInfoDictionaryKey("CPBundleExecutable");
if(!_1c5){
this._executableURL=NULL;
}else{
this._executableURL=new CFURL(_1c5,this.mostEligibleEnvironmentURL());
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
var _1c6=this._infoDictionary.valueForKey("CPBundleEnvironmentsWithImageSprites")||[],_8c=_1c6.length,_1c7=this.mostEligibleEnvironment();
while(_8c--){
if(_1c6[_8c]===_1c7){
return YES;
}
}
return NO;
};
CFBundle.prototype.environments=function(){
return this._infoDictionary.valueForKey("CPBundleEnvironments")||["ObjJ"];
};
CFBundle.prototype.mostEligibleEnvironment=function(_1c8){
_1c8=_1c8||this.environments();
var _1c9=CFBundle.environments(),_8c=0,_1ca=_1c9.length,_1cb=_1c8.length;
for(;_8c<_1ca;++_8c){
var _1cc=0,_1cd=_1c9[_8c];
for(;_1cc<_1cb;++_1cc){
if(_1cd===_1c8[_1cc]){
return _1cd;
}
}
}
return NULL;
};
CFBundle.prototype.isLoading=function(){
return this._loadStatus&_1ac;
};
CFBundle.prototype.load=function(_1ce){
if(this._loadStatus!==_1ab){
return;
}
this._loadStatus=_1ac|_1ad;
var self=this,_1cf=this.bundleURL(),_1d0=new CFURL("..",_1cf);
if(_1d0.absoluteString()===_1cf.absoluteString()){
_1d0=_1d0.schemeAndAuthority();
}
_1a3.resolveResourceAtURL(_1d0,YES,function(_1d1){
var _1d2=_1cf.absoluteURL().lastPathComponent();
self._staticResource=_1d1._children[_1d2]||new _1a3(_1cf,_1d1,YES,NO);
function _1d3(_1d4){
self._loadStatus&=~_1ad;
var _1d5=_1d4.request.responsePropertyList();
self._isValid=!!_1d5||CFBundle.mainBundle()===self;
if(_1d5){
self._infoDictionary=_1d5;
}
if(!self._infoDictionary){
_1d7(self,new Error("Could not load bundle at \""+path+"\""));
return;
}
if(self===CFBundle.mainBundle()&&self.valueForInfoDictionaryKey("CPApplicationSize")){
_1b5=self.valueForInfoDictionaryKey("CPApplicationSize").valueForKey("executable")||0;
}
_1db(self,_1ce);
};
function _1d6(){
self._isValid=CFBundle.mainBundle()===self;
self._loadStatus=_1ab;
_1d7(self,new Error("Could not load bundle at \""+self.bundleURL()+"\""));
};
new _a8(new CFURL("Info.plist",self.bundleURL()),_1d3,_1d6);
});
};
function _1d7(_1d8,_1d9){
_1da(_1d8._staticResource);
_1d8._eventDispatcher.dispatchEvent({type:"error",error:_1d9,bundle:_1d8});
};
function _1db(_1dc,_1dd){
if(!_1dc.mostEligibleEnvironment()){
return _1de();
}
_1df(_1dc,_1e0,_1de);
_1e1(_1dc,_1e0,_1de);
if(_1dc._loadStatus===_1ac){
return _1e0();
}
function _1de(_1e2){
var _1e3=_1dc._loadRequests,_1e4=_1e3.length;
while(_1e4--){
_1e3[_1e4].abort();
}
this._loadRequests=[];
_1dc._loadStatus=_1ab;
_1d7(_1dc,_1e2||new Error("Could not recognize executable code format in Bundle "+_1dc));
};
function _1e0(){
if((typeof CPApp==="undefined"||!CPApp||!CPApp._finishedLaunching)&&typeof OBJJ_PROGRESS_CALLBACK==="function"&&_1b5){
OBJJ_PROGRESS_CALLBACK(MAX(MIN(1,_1b4/_1b5),0),_1b5,_1dc.path());
}
if(_1dc._loadStatus===_1ac){
_1dc._loadStatus=_1b0;
}else{
return;
}
_1da(_1dc._staticResource);
function _1e5(){
_1dc._eventDispatcher.dispatchEvent({type:"load",bundle:_1dc});
};
if(_1dd){
_1e6(_1dc,_1e5);
}else{
_1e5();
}
};
};
function _1df(_1e7,_1e8,_1e9){
var _1ea=_1e7.executableURL();
if(!_1ea){
return;
}
_1e7._loadStatus|=_1ae;
new _a8(_1ea,function(_1eb){
try{
_1b4+=_1eb.request.responseText().length;
_1ec(_1e7,_1eb.request.responseText(),_1ea);
_1e7._loadStatus&=~_1ae;
_1e8();
}
catch(anException){
_1e9(anException);
}
},_1e9);
};
function _1ed(_1ee){
return "mhtml:"+new CFURL("MHTMLTest.txt",_1ee.mostEligibleEnvironmentURL());
};
function _1ef(_1f0){
if(_1f1===_1f2){
return new CFURL("dataURLs.txt",_1f0.mostEligibleEnvironmentURL());
}
if(_1f1===_1f3||_1f1===_1f4){
return new CFURL("MHTMLPaths.txt",_1f0.mostEligibleEnvironmentURL());
}
return NULL;
};
function _1e1(_1f5,_1f6,_1f7){
if(!_1f5.hasSpritedImages()){
return;
}
_1f5._loadStatus|=_1af;
if(!_1f8()){
return _1f9(_1ed(_1f5),function(){
_1e1(_1f5,_1f6,_1f7);
});
}
var _1fa=_1ef(_1f5);
if(!_1fa){
_1f5._loadStatus&=~_1af;
return _1f6();
}
new _a8(_1fa,function(_1fb){
try{
_1b4+=_1fb.request.responseText().length;
_1ec(_1f5,_1fb.request.responseText(),_1fa);
_1f5._loadStatus&=~_1af;
_1f6();
}
catch(anException){
_1f7(anException);
}
},_1f7);
};
var _1fc=[],_1f1=-1,_1fd=0,_1f2=1,_1f3=2,_1f4=3;
function _1f8(){
return _1f1!==-1;
};
function _1f9(_1fe,_1ff){
if(_1f8()){
return;
}
_1fc.push(_1ff);
if(_1fc.length>1){
return;
}
_1fc.push(function(){
var size=0,_200=CFBundle.mainBundle().valueForInfoDictionaryKey("CPApplicationSize");
if(!_200){
return;
}
switch(_1f1){
case _1f2:
size=_200.valueForKey("data");
break;
case _1f3:
case _1f4:
size=_200.valueForKey("mhtml");
break;
}
_1b5+=size;
});
_201([_1f2,"data:image/gif;base64,R0lGODlhAQABAIAAAMc9BQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",_1f3,_1fe+"!test",_1f4,_1fe+"?"+_1b3+"!test"]);
};
function _202(){
var _203=_1fc.length;
while(_203--){
_1fc[_203]();
}
};
function _201(_204){
if(_204.length<2){
_1f1=_1fd;
_202();
return;
}
var _205=new Image();
_205.onload=function(){
if(_205.width===1&&_205.height===1){
_1f1=_204[0];
_202();
}else{
_205.onerror();
}
};
_205.onerror=function(){
_201(_204.slice(2));
};
_205.src=_204[1];
};
function _1e6(_206,_207){
var _208=[_206._staticResource];
function _209(_20a){
for(;_20a<_208.length;++_20a){
var _20b=_208[_20a];
if(_20b.isNotFound()){
continue;
}
if(_20b.isFile()){
var _20c=new _313(_20b.URL());
if(_20c.hasLoadedFileDependencies()){
_20c.execute();
}else{
_20c.loadFileDependencies(function(){
_209(_20a);
});
return;
}
}else{
if(_20b.URL().absoluteString()===_206.resourcesDirectoryURL().absoluteString()){
continue;
}
var _20d=_20b.children();
for(var name in _20d){
if(_71.call(_20d,name)){
_208.push(_20d[name]);
}
}
}
}
_207();
};
_209(0);
};
var _20e="@STATIC",_20f="p",_210="u",_211="c",_212="t",_213="I",_214="i";
function _1ec(_215,_216,_217){
var _218=new _110(_216);
if(_218.magicNumber()!==_20e){
throw new Error("Could not read static file: "+_217);
}
if(_218.version()!=="1.0"){
throw new Error("Could not read static file: "+_217);
}
var _219,_21a=_215.bundleURL(),file=NULL;
while(_219=_218.getMarker()){
var text=_218.getString();
if(_219===_20f){
var _21b=new CFURL(text,_21a),_21c=_1a3.resourceAtURL(new CFURL(".",_21b),YES);
file=new _1a3(_21b,_21c,NO,YES);
}else{
if(_219===_210){
var URL=new CFURL(text,_21a),_21d=_218.getString();
if(_21d.indexOf("mhtml:")===0){
_21d="mhtml:"+new CFURL(_21d.substr("mhtml:".length),_21a);
if(_1f1===_1f4){
var _21e=URLString.indexOf("!"),_21f=URLString.substring(0,_21e),_220=URLString.substring(_21e);
_21d=_21f+"?"+_1b3+_220;
}
}
CFURL.setMappedURLForURL(URL,new CFURL(_21d));
var _21c=_1a3.resourceAtURL(new CFURL(".",URL),YES);
new _1a3(URL,_21c,NO,YES);
}else{
if(_219===_212){
file.write(text);
}
}
}
}
};
CFBundle.prototype.addEventListener=function(_221,_222){
this._eventDispatcher.addEventListener(_221,_222);
};
CFBundle.prototype.removeEventListener=function(_223,_224){
this._eventDispatcher.removeEventListener(_223,_224);
};
CFBundle.prototype.onerror=function(_225){
throw _225.error;
};
CFBundle.prototype.bundlePath=function(){
return this._bundleURL.absoluteURL().path();
};
CFBundle.prototype.path=function(){
CPLog.warn("CFBundle.prototype.path is deprecated, use CFBundle.prototype.bundlePath instead.");
return this.bundlePath.apply(this,arguments);
};
CFBundle.prototype.pathForResource=function(_226){
return this.resourceURL(_226).absoluteString();
};
var _227={};
function _1a3(aURL,_228,_229,_22a){
this._parent=_228;
this._eventDispatcher=new _6c(this);
var name=aURL.absoluteURL().lastPathComponent()||aURL.schemeAndAuthority();
this._name=name;
this._URL=aURL;
this._isResolved=!!_22a;
if(_229){
this._URL=this._URL.asDirectoryPathURL();
}
if(!_228){
_227[name]=this;
}
this._isDirectory=!!_229;
this._isNotFound=NO;
if(_228){
_228._children[name]=this;
}
if(_229){
this._children={};
}else{
this._contents="";
}
};
_1a3.rootResources=function(){
return _227;
};
_2.StaticResource=_1a3;
function _1da(_22b){
_22b._isResolved=YES;
_22b._eventDispatcher.dispatchEvent({type:"resolve",staticResource:_22b});
};
_1a3.prototype.resolve=function(){
if(this.isDirectory()){
var _22c=new CFBundle(this.URL());
_22c.onerror=function(){
};
_22c.load(NO);
}else{
var self=this;
function _22d(_22e){
self._contents=_22e.request.responseText();
_1da(self);
};
function _22f(){
self._isNotFound=YES;
_1da(self);
};
new _a8(this.URL(),_22d,_22f);
}
};
_1a3.prototype.name=function(){
return this._name;
};
_1a3.prototype.URL=function(){
return this._URL;
};
_1a3.prototype.contents=function(){
return this._contents;
};
_1a3.prototype.children=function(){
return this._children;
};
_1a3.prototype.parent=function(){
return this._parent;
};
_1a3.prototype.isResolved=function(){
return this._isResolved;
};
_1a3.prototype.write=function(_230){
this._contents+=_230;
};
function _231(_232){
var _233=_232.schemeAndAuthority(),_234=_227[_233];
if(!_234){
_234=new _1a3(new CFURL(_233),NULL,YES,YES);
}
return _234;
};
_1a3.resourceAtURL=function(aURL,_235){
aURL=_1b6(aURL).absoluteURL();
var _236=_231(aURL),_237=aURL.pathComponents(),_8c=0,_238=_237.length;
for(;_8c<_238;++_8c){
var name=_237[_8c];
if(_71.call(_236._children,name)){
_236=_236._children[name];
}else{
if(_235){
_236=new _1a3(new CFURL(name,_236.URL()),_236,YES,YES);
}else{
throw new Error("Static Resource at "+aURL+" is not resolved (\""+name+"\")");
}
}
}
return _236;
};
_1a3.prototype.resourceAtURL=function(aURL,_239){
return _1a3.resourceAtURL(new CFURL(aURL,this.URL()),_239);
};
_1a3.resolveResourceAtURL=function(aURL,_23a,_23b){
aURL=_1b6(aURL).absoluteURL();
_23c(_231(aURL),_23a,aURL.pathComponents(),0,_23b);
};
_1a3.prototype.resolveResourceAtURL=function(aURL,_23d,_23e){
_1a3.resolveResourceAtURL(new CFURL(aURL,this.URL()).absoluteURL(),_23d,_23e);
};
function _23c(_23f,_240,_241,_242,_243){
var _244=_241.length;
for(;_242<_244;++_242){
var name=_241[_242],_245=_71.call(_23f._children,name)&&_23f._children[name];
if(!_245){
_245=new _1a3(new CFURL(name,_23f.URL()),_23f,_242+1<_244||_240,NO);
_245.resolve();
}
if(!_245.isResolved()){
return _245.addEventListener("resolve",function(){
_23c(_23f,_240,_241,_242,_243);
});
}
if(_245.isNotFound()){
return _243(null,new Error("File not found: "+_241.join("/")));
}
if((_242+1<_244)&&_245.isFile()){
return _243(null,new Error("File is not a directory: "+_241.join("/")));
}
_23f=_245;
}
_243(_23f);
};
function _246(aURL,_247,_248){
var _249=_1a3.includeURLs(),_24a=new CFURL(aURL,_249[_247]).absoluteURL();
_1a3.resolveResourceAtURL(_24a,NO,function(_24b){
if(!_24b){
if(_247+1<_249.length){
_246(aURL,_247+1,_248);
}else{
_248(NULL);
}
return;
}
_248(_24b);
});
};
_1a3.resolveResourceAtURLSearchingIncludeURLs=function(aURL,_24c){
_246(aURL,0,_24c);
};
_1a3.prototype.addEventListener=function(_24d,_24e){
this._eventDispatcher.addEventListener(_24d,_24e);
};
_1a3.prototype.removeEventListener=function(_24f,_250){
this._eventDispatcher.removeEventListener(_24f,_250);
};
_1a3.prototype.isNotFound=function(){
return this._isNotFound;
};
_1a3.prototype.isFile=function(){
return !this._isDirectory;
};
_1a3.prototype.isDirectory=function(){
return this._isDirectory;
};
_1a3.prototype.toString=function(_251){
if(this.isNotFound()){
return "<file not found: "+this.name()+">";
}
var _252=this.name();
if(this.isDirectory()){
var _253=this._children;
for(var name in _253){
if(_253.hasOwnProperty(name)){
var _254=_253[name];
if(_251||!_254.isNotFound()){
_252+="\n\t"+_253[name].toString(_251).split("\n").join("\n\t");
}
}
}
}
return _252;
};
var _255=NULL;
_1a3.includeURLs=function(){
if(_256){
return _256;
}
var _256=[];
if(!_1.OBJJ_INCLUDE_PATHS&&!_1.OBJJ_INCLUDE_URLS){
_256=["Frameworks","Frameworks/Debug"];
}else{
_256=(_1.OBJJ_INCLUDE_PATHS||[]).concat(_1.OBJJ_INCLUDE_URLS||[]);
}
var _257=_256.length;
while(_257--){
_256[_257]=new CFURL(_256[_257]).asDirectoryPathURL();
}
return _256;
};
var _258="accessors",_259="class",_25a="end",_25b="function",_25c="implementation",_25d="import",_25e="each",_25f="outlet",_260="action",_261="new",_262="selector",_263="super",_264="var",_265="in",_266="=",_267="+",_268="-",_269=":",_26a=",",_26b=".",_26c="*",_26d=";",_26e="<",_26f="{",_270="}",_271=">",_272="[",_273="\"",_274="@",_275="]",_276="?",_277="(",_278=")",_279=/^(?:(?:\s+$)|(?:\/(?:\/|\*)))/,_27a=/^[+-]?\d+(([.]\d+)*([eE][+-]?\d+))?$/,_27b=/^[a-zA-Z_$](\w|$)*$/;
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
_27c.prototype.peak=function(_27e){
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
this.preprocess(this._tokens,this._buffer);
};
_2.Preprocessor=_285;
_285.Flags={};
_285.Flags.IncludeDebugSymbols=1<<0;
_285.Flags.IncludeTypeSignatures=1<<1;
_285.prototype.executable=function(){
if(!this._executable){
this._executable=new _289(this._buffer.toString(),this._dependencies,this._URL);
}
return this._executable;
};
_285.prototype.accessors=function(_28a){
var _28b=_28a.skip_whitespace(),_28c={};
if(_28b!=_277){
_28a.previous();
return _28c;
}
while((_28b=_28a.skip_whitespace())!=_278){
var name=_28b,_28d=true;
if(!/^\w+$/.test(name)){
throw new SyntaxError(this.error_message("*** @property attribute name not valid."));
}
if((_28b=_28a.skip_whitespace())==_266){
_28d=_28a.skip_whitespace();
if(!/^\w+$/.test(_28d)){
throw new SyntaxError(this.error_message("*** @property attribute value not valid."));
}
if(name=="setter"){
if((_28b=_28a.next())!=_269){
throw new SyntaxError(this.error_message("*** @property setter attribute requires argument with \":\" at end of selector name."));
}
_28d+=":";
}
_28b=_28a.skip_whitespace();
}
_28c[name]=_28d;
if(_28b==_278){
break;
}
if(_28b!=_26a){
throw new SyntaxError(this.error_message("*** Expected ',' or ')' in @property attribute list."));
}
}
return _28c;
};
_285.prototype.brackets=function(_28e,_28f){
var _290=[];
while(this.preprocess(_28e,NULL,NULL,NULL,_290[_290.length]=[])){
}
if(_290[0].length===1){
_28f.atoms[_28f.atoms.length]="[";
_28f.atoms[_28f.atoms.length]=_290[0][0];
_28f.atoms[_28f.atoms.length]="]";
}else{
var _291=new _282();
if(_290[0][0].atoms[0]==_263){
_28f.atoms[_28f.atoms.length]="objj_msgSendSuper(";
_28f.atoms[_28f.atoms.length]="{ receiver:self, super_class:"+(this._classMethod?this._currentSuperMetaClass:this._currentSuperClass)+" }";
}else{
_28f.atoms[_28f.atoms.length]="objj_msgSend(";
_28f.atoms[_28f.atoms.length]=_290[0][0];
}
_291.atoms[_291.atoms.length]=_290[0][1];
var _292=1,_293=_290.length,_294=new _282();
for(;_292<_293;++_292){
var pair=_290[_292];
_291.atoms[_291.atoms.length]=pair[1];
_294.atoms[_294.atoms.length]=", "+pair[0];
}
_28f.atoms[_28f.atoms.length]=", \"";
_28f.atoms[_28f.atoms.length]=_291;
_28f.atoms[_28f.atoms.length]="\"";
_28f.atoms[_28f.atoms.length]=_294;
_28f.atoms[_28f.atoms.length]=")";
}
};
_285.prototype.directive=function(_295,_296,_297){
var _298=_296?_296:new _282(),_299=_295.next();
if(_299.charAt(0)==_273){
_298.atoms[_298.atoms.length]=_299;
}else{
if(_299===_259){
_295.skip_whitespace();
return;
}else{
if(_299===_25c){
this.implementation(_295,_298);
}else{
if(_299===_25d){
this._import(_295);
}else{
if(_299===_262){
this.selector(_295,_298);
}
}
}
}
}
if(!_296){
return _298;
}
};
_285.prototype.implementation=function(_29a,_29b){
var _29c=_29b,_29d="",_29e=NO,_29f=_29a.skip_whitespace(),_2a0="Nil",_2a1=new _282(),_2a2=new _282();
if(!(/^\w/).test(_29f)){
throw new Error(this.error_message("*** Expected class name, found \""+_29f+"\"."));
}
this._currentSuperClass="objj_getClass(\""+_29f+"\").super_class";
this._currentSuperMetaClass="objj_getMetaClass(\""+_29f+"\").super_class";
this._currentClass=_29f;
this._currentSelector="";
if((_29d=_29a.skip_whitespace())==_277){
_29d=_29a.skip_whitespace();
if(_29d==_278){
throw new SyntaxError(this.error_message("*** Can't Have Empty Category Name for class \""+_29f+"\"."));
}
if(_29a.skip_whitespace()!=_278){
throw new SyntaxError(this.error_message("*** Improper Category Definition for class \""+_29f+"\"."));
}
_29c.atoms[_29c.atoms.length]="{\nvar the_class = objj_getClass(\""+_29f+"\")\n";
_29c.atoms[_29c.atoms.length]="if(!the_class) throw new SyntaxError(\"*** Could not find definition for class \\\""+_29f+"\\\"\");\n";
_29c.atoms[_29c.atoms.length]="var meta_class = the_class.isa;";
}else{
if(_29d==_269){
_29d=_29a.skip_whitespace();
if(!_27b.test(_29d)){
throw new SyntaxError(this.error_message("*** Expected class name, found \""+_29d+"\"."));
}
_2a0=_29d;
_29d=_29a.skip_whitespace();
}
_29c.atoms[_29c.atoms.length]="{var the_class = objj_allocateClassPair("+_2a0+", \""+_29f+"\"),\nmeta_class = the_class.isa;";
if(_29d==_26f){
var _2a3=0,_2a4=[],_2a5,_2a6={};
while((_29d=_29a.skip_whitespace())&&_29d!=_270){
if(_29d===_274){
_29d=_29a.next();
if(_29d===_258){
_2a5=this.accessors(_29a);
}else{
if(_29d!==_25f){
throw new SyntaxError(this.error_message("*** Unexpected '@' token in ivar declaration ('@"+_29d+"')."));
}
}
}else{
if(_29d==_26d){
if(_2a3++==0){
_29c.atoms[_29c.atoms.length]="class_addIvars(the_class, [";
}else{
_29c.atoms[_29c.atoms.length]=", ";
}
var name=_2a4[_2a4.length-1];
_29c.atoms[_29c.atoms.length]="new objj_ivar(\""+name+"\")";
_2a4=[];
if(_2a5){
_2a6[name]=_2a5;
_2a5=NULL;
}
}else{
_2a4.push(_29d);
}
}
}
if(_2a4.length){
throw new SyntaxError(this.error_message("*** Expected ';' in ivar declaration, found '}'."));
}
if(_2a3){
_29c.atoms[_29c.atoms.length]="]);\n";
}
if(!_29d){
throw new SyntaxError(this.error_message("*** Expected '}'"));
}
for(ivar_name in _2a6){
var _2a7=_2a6[ivar_name],_2a8=_2a7["property"]||ivar_name;
var _2a9=_2a7["getter"]||_2a8,_2aa="(id)"+_2a9+"\n{\nreturn "+ivar_name+";\n}";
if(_2a1.atoms.length!==0){
_2a1.atoms[_2a1.atoms.length]=",\n";
}
_2a1.atoms[_2a1.atoms.length]=this.method(new _27c(_2aa));
if(_2a7["readonly"]){
continue;
}
var _2ab=_2a7["setter"];
if(!_2ab){
var _2ac=_2a8.charAt(0)=="_"?1:0;
_2ab=(_2ac?"_":"")+"set"+_2a8.substr(_2ac,1).toUpperCase()+_2a8.substring(_2ac+1)+":";
}
var _2ad="(void)"+_2ab+"(id)newValue\n{\n";
if(_2a7["copy"]){
_2ad+="if ("+ivar_name+" !== newValue)\n"+ivar_name+" = [newValue copy];\n}";
}else{
_2ad+=ivar_name+" = newValue;\n}";
}
if(_2a1.atoms.length!==0){
_2a1.atoms[_2a1.atoms.length]=",\n";
}
_2a1.atoms[_2a1.atoms.length]=this.method(new _27c(_2ad));
}
}else{
_29a.previous();
}
_29c.atoms[_29c.atoms.length]="objj_registerClassPair(the_class);\n";
}
while((_29d=_29a.skip_whitespace())){
if(_29d==_267){
this._classMethod=true;
if(_2a2.atoms.length!==0){
_2a2.atoms[_2a2.atoms.length]=", ";
}
_2a2.atoms[_2a2.atoms.length]=this.method(_29a);
}else{
if(_29d==_268){
this._classMethod=false;
if(_2a1.atoms.length!==0){
_2a1.atoms[_2a1.atoms.length]=", ";
}
_2a1.atoms[_2a1.atoms.length]=this.method(_29a);
}else{
if(_29d==_274){
if((_29d=_29a.next())==_25a){
break;
}else{
throw new SyntaxError(this.error_message("*** Expected \"@end\", found \"@"+_29d+"\"."));
}
}
}
}
}
if(_2a1.atoms.length!==0){
_29c.atoms[_29c.atoms.length]="class_addMethods(the_class, [";
_29c.atoms[_29c.atoms.length]=_2a1;
_29c.atoms[_29c.atoms.length]="]);\n";
}
if(_2a2.atoms.length!==0){
_29c.atoms[_29c.atoms.length]="class_addMethods(meta_class, [";
_29c.atoms[_29c.atoms.length]=_2a2;
_29c.atoms[_29c.atoms.length]="]);\n";
}
_29c.atoms[_29c.atoms.length]="}";
this._currentClass="";
};
_285.prototype._import=function(_2ae){
var _2af="",_2b0=_2ae.skip_whitespace(),_2b1=(_2b0!==_26e);
if(_2b0===_26e){
while((_2b0=_2ae.next())&&_2b0!==_271){
_2af+=_2b0;
}
if(!_2b0){
throw new SyntaxError(this.error_message("*** Unterminated import statement."));
}
}else{
if(_2b0.charAt(0)===_273){
_2af=_2b0.substr(1,_2b0.length-2);
}else{
throw new SyntaxError(this.error_message("*** Expecting '<' or '\"', found \""+_2b0+"\"."));
}
}
this._buffer.atoms[this._buffer.atoms.length]="objj_executeFile(\"";
this._buffer.atoms[this._buffer.atoms.length]=_2af;
this._buffer.atoms[this._buffer.atoms.length]=_2b1?"\", YES);":"\", NO);";
this._dependencies.push(new _2b2(new CFURL(_2af),_2b1));
};
_285.prototype.method=function(_2b3){
var _2b4=new _282(),_2b5,_2b6="",_2b7=[],_2b8=[null];
while((_2b5=_2b3.skip_whitespace())&&_2b5!=_26f){
if(_2b5==_269){
var type="";
_2b6+=_2b5;
_2b5=_2b3.skip_whitespace();
if(_2b5==_277){
while((_2b5=_2b3.skip_whitespace())&&_2b5!=_278){
type+=_2b5;
}
_2b5=_2b3.skip_whitespace();
}
_2b8[_2b7.length+1]=type||null;
_2b7[_2b7.length]=_2b5;
}else{
if(_2b5==_277){
var type="";
while((_2b5=_2b3.skip_whitespace())&&_2b5!=_278){
type+=_2b5;
}
_2b8[0]=type||null;
}else{
if(_2b5==_26a){
if((_2b5=_2b3.skip_whitespace())!=_26b||_2b3.next()!=_26b||_2b3.next()!=_26b){
throw new SyntaxError(this.error_message("*** Argument list expected after ','."));
}
}else{
_2b6+=_2b5;
}
}
}
}
var _2b9=0,_2ba=_2b7.length;
_2b4.atoms[_2b4.atoms.length]="new objj_method(sel_getUid(\"";
_2b4.atoms[_2b4.atoms.length]=_2b6;
_2b4.atoms[_2b4.atoms.length]="\"), function";
this._currentSelector=_2b6;
if(this._flags&_285.Flags.IncludeDebugSymbols){
_2b4.atoms[_2b4.atoms.length]=" $"+this._currentClass+"__"+_2b6.replace(/:/g,"_");
}
_2b4.atoms[_2b4.atoms.length]="(self, _cmd";
for(;_2b9<_2ba;++_2b9){
_2b4.atoms[_2b4.atoms.length]=", ";
_2b4.atoms[_2b4.atoms.length]=_2b7[_2b9];
}
_2b4.atoms[_2b4.atoms.length]=")\n{ with(self)\n{";
_2b4.atoms[_2b4.atoms.length]=this.preprocess(_2b3,NULL,_270,_26f);
_2b4.atoms[_2b4.atoms.length]="}\n}";
if(this._flags&_285.Flags.IncludeDebugSymbols){
_2b4.atoms[_2b4.atoms.length]=","+JSON.stringify(_2b8);
}
_2b4.atoms[_2b4.atoms.length]=")";
this._currentSelector="";
return _2b4;
};
_285.prototype.preprocess=function(_2bb,_2bc,_2bd,_2be,_2bf){
var _2c0=_2bc?_2bc:new _282(),_2c1=0,_2c2="";
if(_2bf){
_2bf[0]=_2c0;
var _2c3=false,_2c4=[0,0,0];
}
while((_2c2=_2bb.next())&&((_2c2!==_2bd)||_2c1)){
if(_2bf){
if(_2c2===_276){
++_2c4[2];
}else{
if(_2c2===_26f){
++_2c4[0];
}else{
if(_2c2===_270){
--_2c4[0];
}else{
if(_2c2===_277){
++_2c4[1];
}else{
if(_2c2===_278){
--_2c4[1];
}else{
if((_2c2===_269&&_2c4[2]--===0||(_2c3=(_2c2===_275)))&&_2c4[0]===0&&_2c4[1]===0){
_2bb.push();
var _2c5=_2c3?_2bb.skip_whitespace(true):_2bb.previous(),_2c6=_279.test(_2c5);
if(_2c6||_27b.test(_2c5)&&_279.test(_2bb.previous())){
_2bb.push();
var last=_2bb.skip_whitespace(true),_2c7=true,_2c8=false;
if(last==="+"||last==="-"){
if(_2bb.previous()!==last){
_2c7=false;
}else{
last=_2bb.skip_whitespace(true);
_2c8=true;
}
}
_2bb.pop();
_2bb.pop();
if(_2c7&&((!_2c8&&(last===_270))||last===_278||last===_275||last===_26b||_27a.test(last)||last.charAt(last.length-1)==="\""||last.charAt(last.length-1)==="'"||_27b.test(last)&&!/^(new|return|case|var)$/.test(last))){
if(_2c6){
_2bf[1]=":";
}else{
_2bf[1]=_2c5;
if(!_2c3){
_2bf[1]+=":";
}
var _2c1=_2c0.atoms.length;
while(_2c0.atoms[_2c1--]!==_2c5){
}
_2c0.atoms.length=_2c1;
}
return !_2c3;
}
if(_2c3){
return NO;
}
}
_2bb.pop();
if(_2c3){
return NO;
}
}
}
}
}
}
}
_2c4[2]=MAX(_2c4[2],0);
}
if(_2be){
if(_2c2===_2be){
++_2c1;
}else{
if(_2c2===_2bd){
--_2c1;
}
}
}
if(_2c2===_25b){
var _2c9="";
while((_2c2=_2bb.next())&&_2c2!==_277&&!(/^\w/).test(_2c2)){
_2c9+=_2c2;
}
if(_2c2===_277){
if(_2be===_277){
++_2c1;
}
_2c0.atoms[_2c0.atoms.length]="function"+_2c9+"(";
if(_2bf){
++_2c4[1];
}
}else{
_2c0.atoms[_2c0.atoms.length]=_2c2+"= function";
}
}else{
if(_2c2==_274){
this.directive(_2bb,_2c0);
}else{
if(_2c2==_272){
this.brackets(_2bb,_2c0);
}else{
_2c0.atoms[_2c0.atoms.length]=_2c2;
}
}
}
}
if(_2bf){
throw new SyntaxError(this.error_message("*** Expected ']' - Unterminated message send or array."));
}
if(!_2bc){
return _2c0;
}
};
_285.prototype.selector=function(_2ca,_2cb){
var _2cc=_2cb?_2cb:new _282();
_2cc.atoms[_2cc.atoms.length]="sel_getUid(\"";
if(_2ca.skip_whitespace()!=_277){
throw new SyntaxError(this.error_message("*** Expected '('"));
}
var _2cd=_2ca.skip_whitespace();
if(_2cd==_278){
throw new SyntaxError(this.error_message("*** Unexpected ')', can't have empty @selector()"));
}
_2cb.atoms[_2cb.atoms.length]=_2cd;
var _2ce,_2cf=true;
while((_2ce=_2ca.next())&&_2ce!=_278){
if(_2cf&&/^\d+$/.test(_2ce)||!(/^(\w|$|\:)/.test(_2ce))){
if(!(/\S/).test(_2ce)){
if(_2ca.skip_whitespace()==_278){
break;
}else{
throw new SyntaxError(this.error_message("*** Unexpected whitespace in @selector()."));
}
}else{
throw new SyntaxError(this.error_message("*** Illegal character '"+_2ce+"' in @selector()."));
}
}
_2cc.atoms[_2cc.atoms.length]=_2ce;
_2cf=(_2ce==_269);
}
_2cc.atoms[_2cc.atoms.length]="\")";
if(!_2cb){
return _2cc;
}
};
_285.prototype.error_message=function(_2d0){
return _2d0+" <Context File: "+this._URL+(this._currentClass?" Class: "+this._currentClass:"")+(this._currentSelector?" Method: "+this._currentSelector:"")+">";
};
function _2b2(aURL,_2d1){
this._URL=aURL;
this._isLocal=_2d1;
};
_2.FileDependency=_2b2;
_2b2.prototype.URL=function(){
return this._URL;
};
_2b2.prototype.isLocal=function(){
return this._isLocal;
};
_2b2.prototype.toMarkedString=function(){
var _2d2=this.URL().absoluteString();
return (this.isLocal()?_214:_213)+";"+_2d2.length+";"+_2d2;
};
_2b2.prototype.toString=function(){
return (this.isLocal()?"LOCAL: ":"STD: ")+this.URL();
};
var _2d3=0,_2d4=1,_2d5=2,_2d6=0;
function _289(_2d7,_2d8,aURL,_2d9){
if(arguments.length===0){
return this;
}
this._code=_2d7;
this._function=_2d9||NULL;
this._URL=_1b6(aURL||new CFURL("(Anonymous"+(_2d6++)+")"));
this._fileDependencies=_2d8;
if(_2d8.length){
this._fileDependencyStatus=_2d3;
this._fileDependencyCallbacks=[];
}else{
this._fileDependencyStatus=_2d5;
}
if(this._function){
return;
}
this.setCode(_2d7);
};
_2.Executable=_289;
_289.prototype.path=function(){
return this.URL().path();
};
_289.prototype.URL=function(){
return this._URL;
};
_289.prototype.functionParameters=function(){
var _2da=["global","objj_executeFile","objj_importFile"];
return _2da;
};
_289.prototype.functionArguments=function(){
var _2db=[_1,this.fileExecuter(),this.fileImporter()];
return _2db;
};
_289.prototype.execute=function(){
var _2dc=_2dd;
_2dd=CFBundle.bundleContainingURL(this.URL());
var _2de=this._function.apply(_1,this.functionArguments());
_2dd=_2dc;
return _2de;
};
_289.prototype.code=function(){
return this._code;
};
_289.prototype.setCode=function(code){
this._code=code;
var _2df=this.functionParameters().join(",");
this._function=new Function(_2df,code);
};
_289.prototype.fileDependencies=function(){
return this._fileDependencies;
};
_289.prototype.hasLoadedFileDependencies=function(){
return this._fileDependencyStatus===_2d5;
};
var _2e0=0,_2e1=[],_2e2={};
_289.prototype.loadFileDependencies=function(_2e3){
var _2e4=this._fileDependencyStatus;
if(_2e4===_2d5){
return _2e3();
}
this._fileDependencyCallbacks.push(_2e3);
if(_2e4===_2d3){
if(_2e0){
throw "Can't load";
}
_2e5(this);
}
};
function _2e5(_2e6){
_2e1.push(_2e6);
_2e6._fileDependencyStatus=_2d4;
var _2e7=_2e6.fileDependencies(),_8c=0,_2e8=_2e7.length,_2e9=_2e6.referenceURL(),_2ea=_2e9.absoluteString(),_2eb=_2e6.fileExecutableSearcher();
_2e0+=_2e8;
for(;_8c<_2e8;++_8c){
var _2ec=_2e7[_8c],_2ed=_2ec.isLocal(),URL=_2ec.URL(),_2ee=(_2ed&&(_2ea+" ")||"")+URL;
if(_2e2[_2ee]){
if(--_2e0===0){
_2ef();
}
continue;
}
_2e2[_2ee]=YES;
_2eb(URL,_2ed,_2f0);
}
};
function _2f0(_2f1){
--_2e0;
if(_2f1._fileDependencyStatus===_2d3){
_2e5(_2f1);
}else{
if(_2e0===0){
_2ef();
}
}
};
function _2ef(){
var _2f2=_2e1,_8c=0,_2f3=_2f2.length;
_2e1=[];
for(;_8c<_2f3;++_8c){
_2f2[_8c]._fileDependencyStatus=_2d5;
}
for(_8c=0;_8c<_2f3;++_8c){
var _2f4=_2f2[_8c],_2f5=_2f4._fileDependencyCallbacks,_2f6=0,_2f7=_2f5.length;
for(;_2f6<_2f7;++_2f6){
_2f5[_2f6]();
}
_2f4._fileDependencyCallbacks=[];
}
};
_289.prototype.referenceURL=function(){
if(this._referenceURL===_44){
this._referenceURL=new CFURL(".",this.URL());
}
return this._referenceURL;
};
_289.prototype.fileImporter=function(){
return _289.fileImporterForURL(this.referenceURL());
};
_289.prototype.fileExecuter=function(){
return _289.fileExecuterForURL(this.referenceURL());
};
_289.prototype.fileExecutableSearcher=function(){
return _289.fileExecutableSearcherForURL(this.referenceURL());
};
var _2f8={};
_289.fileExecuterForURL=function(aURL){
var _2f9=_1b6(aURL),_2fa=_2f9.absoluteString(),_2fb=_2f8[_2fa];
if(!_2fb){
_2fb=function(aURL,_2fc,_2fd){
_289.fileExecutableSearcherForURL(_2f9)(aURL,_2fc,function(_2fe){
if(!_2fe.hasLoadedFileDependencies()){
throw "No executable loaded for file at URL "+aURL;
}
_2fe.execute(_2fd);
});
};
_2f8[_2fa]=_2fb;
}
return _2fb;
};
var _2ff={};
_289.fileImporterForURL=function(aURL){
var _300=_1b6(aURL),_301=_300.absoluteString(),_302=_2ff[_301];
if(!_302){
_302=function(aURL,_303,_304){
_158();
_289.fileExecutableSearcherForURL(_300)(aURL,_303,function(_305){
_305.loadFileDependencies(function(){
_305.execute();
_159();
if(_304){
_304();
}
});
});
};
_2ff[_301]=_302;
}
return _302;
};
var _306={},_307={};
_289.fileExecutableSearcherForURL=function(_308){
var _309=_308.absoluteString(),_30a=_306[_309],_30b={};
if(!_30a){
_30a=function(aURL,_30c,_30d){
var _30e=(_30c&&_308||"")+aURL,_30f=_307[_30e];
if(_30f){
return _310(_30f);
}
var _311=(aURL instanceof CFURL)&&aURL.scheme();
if(_30c||_311){
if(!_311){
aURL=new CFURL(aURL,_308);
}
_1a3.resolveResourceAtURL(aURL,NO,_310);
}else{
_1a3.resolveResourceAtURLSearchingIncludeURLs(aURL,_310);
}
function _310(_312){
if(!_312){
throw new Error("Could not load file at "+aURL);
}
_307[_30e]=_312;
_30d(new _313(_312.URL()));
};
};
_306[_309]=_30a;
}
return _30a;
};
var _314={};
function _313(aURL){
aURL=_1b6(aURL);
var _315=aURL.absoluteString(),_316=_314[_315];
if(_316){
return _316;
}
_314[_315]=this;
var _317=_1a3.resourceAtURL(aURL).contents(),_318=NULL,_319=aURL.pathExtension();
if(_317.match(/^@STATIC;/)){
_318=_31a(_317,aURL);
}else{
if(_319==="j"||!_319){
_318=_2.preprocess(_317,aURL,_285.Flags.IncludeDebugSymbols);
}else{
_318=new _289(_317,[],aURL);
}
}
_289.apply(this,[_318.code(),_318.fileDependencies(),aURL,_318._function]);
this._hasExecuted=NO;
};
_2.FileExecutable=_313;
_313.prototype=new _289();
_313.prototype.execute=function(_31b){
if(this._hasExecuted&&!_31b){
return;
}
this._hasExecuted=YES;
_289.prototype.execute.call(this);
};
_313.prototype.hasExecuted=function(){
return this._hasExecuted;
};
function _31a(_31c,aURL){
var _31d=new _110(_31c);
var _31e=NULL,code="",_31f=[];
while(_31e=_31d.getMarker()){
var text=_31d.getString();
if(_31e===_212){
code+=text;
}else{
if(_31e===_213){
_31f.push(new _2b2(new CFURL(text),NO));
}else{
if(_31e===_214){
_31f.push(new _2b2(new CFURL(text),YES));
}
}
}
}
var fn=_313._lookupCachedFunction(aURL);
if(fn){
return new _289(code,_31f,aURL,fn);
}
return new _289(code,_31f,aURL);
};
var _320={};
_313._cacheFunction=function(aURL,fn){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
_320[aURL]=fn;
};
_313._lookupCachedFunction=function(aURL){
aURL=typeof aURL==="string"?aURL:aURL.absoluteString();
return _320[aURL];
};
var _321=1,_322=2,_323=4,_324=8;
objj_ivar=function(_325,_326){
this.name=_325;
this.type=_326;
};
objj_method=function(_327,_328,_329){
this.name=_327;
this.method_imp=_328;
this.types=_329;
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
class_getName=function(_32a){
if(_32a==Nil){
return "";
}
return _32a.name;
};
class_isMetaClass=function(_32b){
if(!_32b){
return NO;
}
return ((_32b.info&(_322)));
};
class_getSuperclass=function(_32c){
if(_32c==Nil){
return Nil;
}
return _32c.super_class;
};
class_setSuperclass=function(_32d,_32e){
_32d.super_class=_32e;
_32d.isa.super_class=_32e.isa;
};
class_addIvar=function(_32f,_330,_331){
var _332=_32f.allocator.prototype;
if(typeof _332[_330]!="undefined"){
return NO;
}
_32f.ivars.push(new objj_ivar(_330,_331));
_332[_330]=NULL;
return YES;
};
class_addIvars=function(_333,_334){
var _335=0,_336=_334.length,_337=_333.allocator.prototype;
for(;_335<_336;++_335){
var ivar=_334[_335],name=ivar.name;
if(typeof _337[name]==="undefined"){
_333.ivars.push(ivar);
_337[name]=NULL;
}
}
};
class_copyIvarList=function(_338){
return _338.ivars.slice(0);
};
class_addMethod=function(_339,_33a,_33b,_33c){
if(_339.method_hash[_33a]){
return NO;
}
var _33d=new objj_method(_33a,_33b,_33c);
_339.method_list.push(_33d);
_339.method_dtable[_33a]=_33d;
if(!((_339.info&(_322)))&&(((_339.info&(_322)))?_339:_339.isa).isa===(((_339.info&(_322)))?_339:_339.isa)){
class_addMethod((((_339.info&(_322)))?_339:_339.isa),_33a,_33b,_33c);
}
return YES;
};
class_addMethods=function(_33e,_33f){
var _340=0,_341=_33f.length,_342=_33e.method_list,_343=_33e.method_dtable;
for(;_340<_341;++_340){
var _344=_33f[_340];
if(_33e.method_hash[_344.name]){
continue;
}
_342.push(_344);
_343[_344.name]=_344;
}
if(!((_33e.info&(_322)))&&(((_33e.info&(_322)))?_33e:_33e.isa).isa===(((_33e.info&(_322)))?_33e:_33e.isa)){
class_addMethods((((_33e.info&(_322)))?_33e:_33e.isa),_33f);
}
};
class_getInstanceMethod=function(_345,_346){
if(!_345||!_346){
return NULL;
}
var _347=_345.method_dtable[_346];
return _347?_347:NULL;
};
class_getClassMethod=function(_348,_349){
if(!_348||!_349){
return NULL;
}
var _34a=(((_348.info&(_322)))?_348:_348.isa).method_dtable[_349];
return _34a?_34a:NULL;
};
class_copyMethodList=function(_34b){
return _34b.method_list.slice(0);
};
class_replaceMethod=function(_34c,_34d,_34e){
if(!_34c||!_34d){
return NULL;
}
var _34f=_34c.method_dtable[_34d],_350=NULL;
if(_34f){
_350=_34f.method_imp;
}
_34f.method_imp=_34e;
return _350;
};
var _351=function(_352){
var meta=(((_352.info&(_322)))?_352:_352.isa);
if((_352.info&(_322))){
_352=objj_getClass(_352.name);
}
if(_352.super_class&&!((((_352.super_class.info&(_322)))?_352.super_class:_352.super_class.isa).info&(_323))){
_351(_352.super_class);
}
if(!(meta.info&(_323))&&!(meta.info&(_324))){
meta.info=(meta.info|(_324))&~(0);
objj_msgSend(_352,"initialize");
meta.info=(meta.info|(_323))&~(_324);
}
};
var _353=new objj_method("forward",function(self,_354){
return objj_msgSend(self,"forward::",_354,arguments);
});
class_getMethodImplementation=function(_355,_356){
if(!((((_355.info&(_322)))?_355:_355.isa).info&(_323))){
_351(_355);
}
var _357=_355.method_dtable[_356];
if(!_357){
_357=_353;
}
var _358=_357.method_imp;
return _358;
};
var _359={};
objj_allocateClassPair=function(_35a,_35b){
var _35c=new objj_class(),_35d=new objj_class(),_35e=_35c;
if(_35a){
_35e=_35a;
while(_35e.superclass){
_35e=_35e.superclass;
}
_35c.allocator.prototype=new _35a.allocator;
_35c.method_store.prototype=new _35a.method_store;
_35c.method_dtable=_35c.method_store.prototype;
_35d.method_store.prototype=new _35a.isa.method_store;
_35d.method_dtable=_35d.method_store.prototype;
_35c.super_class=_35a;
_35d.super_class=_35a.isa;
}else{
_35c.allocator.prototype=new objj_object();
}
_35c.isa=_35d;
_35c.name=_35b;
_35c.info=_321;
_35c._UID=objj_generateObjectUID();
_35d.isa=_35e.isa;
_35d.name=_35b;
_35d.info=_322;
_35d._UID=objj_generateObjectUID();
return _35c;
};
var _2dd=nil;
objj_registerClassPair=function(_35f){
_1[_35f.name]=_35f;
_359[_35f.name]=_35f;
_1bd(_35f,_2dd);
};
class_createInstance=function(_360){
if(!_360){
objj_exception_throw(new objj_exception(OBJJNilClassException,"*** Attempting to create object with Nil class."));
}
var _361=new _360.allocator();
_361.isa=_360;
_361._UID=objj_generateObjectUID();
return _361;
};
var _362=function(){
};
_362.prototype.member=false;
with(new _362()){
member=true;
}
if(new _362().member){
var _363=class_createInstance;
class_createInstance=function(_364){
var _365=_363(_364);
if(_365){
var _366=_365.isa,_367=_366;
while(_366){
var _368=_366.ivars;
count=_368.length;
while(count--){
_365[_368[count].name]=NULL;
}
_366=_366.super_class;
}
_365.isa=_367;
}
return _365;
};
}
object_getClassName=function(_369){
if(!_369){
return "";
}
var _36a=_369.isa;
return _36a?class_getName(_36a):"";
};
objj_lookUpClass=function(_36b){
var _36c=_359[_36b];
return _36c?_36c:Nil;
};
objj_getClass=function(_36d){
var _36e=_359[_36d];
if(!_36e){
}
return _36e?_36e:Nil;
};
objj_getMetaClass=function(_36f){
var _370=objj_getClass(_36f);
return (((_370.info&(_322)))?_370:_370.isa);
};
ivar_getName=function(_371){
return _371.name;
};
ivar_getTypeEncoding=function(_372){
return _372.type;
};
objj_msgSend=function(_373,_374){
if(_373==nil){
return nil;
}
var isa=_373.isa;
if(!((((isa.info&(_322)))?isa:isa.isa).info&(_323))){
_351(isa);
}
var _375=isa.method_dtable[_374];
if(!_375){
_375=_353;
}
var _376=_375.method_imp;
switch(arguments.length){
case 2:
return _376(_373,_374);
case 3:
return _376(_373,_374,arguments[2]);
case 4:
return _376(_373,_374,arguments[2],arguments[3]);
}
return _376.apply(_373,arguments);
};
objj_msgSendSuper=function(_377,_378){
var _379=_377.super_class;
arguments[0]=_377.receiver;
if(!((((_379.info&(_322)))?_379:_379.isa).info&(_323))){
_351(_379);
}
var _37a=_379.method_dtable[_378];
if(!_37a){
_37a=_353;
}
var _37b=_37a.method_imp;
return _37b.apply(_377.receiver,arguments);
};
method_getName=function(_37c){
return _37c.name;
};
method_getImplementation=function(_37d){
return _37d.method_imp;
};
method_setImplementation=function(_37e,_37f){
var _380=_37e.method_imp;
_37e.method_imp=_37f;
return _380;
};
method_exchangeImplementations=function(lhs,rhs){
var _381=method_getImplementation(lhs),_382=method_getImplementation(rhs);
method_setImplementation(lhs,_382);
method_setImplementation(rhs,_381);
};
sel_getName=function(_383){
return _383?_383:"<null selector>";
};
sel_getUid=function(_384){
return _384;
};
sel_isEqual=function(lhs,rhs){
return lhs===rhs;
};
sel_registerName=function(_385){
return _385;
};
_158();
var _386=new CFURL(window.location.href),_387=document.getElementsByTagName("base"),_388=_387.length;
if(_388>0){
var _389=_387[_388-1],_38a=_389&&_389.getAttribute("href");
if(_38a){
_386=new CFURL(_38a,_386);
}
}
var _38b=new CFURL(window.OBJJ_MAIN_FILE||"main.j"),_1bc=new CFURL(".",new CFURL(_38b,_386)).absoluteURL(),_38c=new CFURL("..",_1bc).absoluteURL();
if(_1bc===_38c){
_38c=new CFURL(_38c.schemeAndAuthority());
}
_1a3.resourceAtURL(_38c,YES);
_2.pageURL=_386;
_2.bootstrap=function(){
_38d();
};
function _38d(){
_1a3.resolveResourceAtURL(_1bc,YES,function(_38e){
var _38f=_1a3.includeURLs(),_8c=0,_390=_38f.length;
for(;_8c<_390;++_8c){
_38e.resourceAtURL(_38f[_8c],YES);
}
_289.fileImporterForURL(_1bc)(_38b.lastPathComponent(),YES,function(){
_159();
_396(function(){
var _391=window.location.hash.substring(1),args=[];
if(_391.length){
args=_391.split("/");
for(var i=0,_390=args.length;i<_390;i++){
args[i]=decodeURIComponent(args[i]);
}
}
var _392=window.location.search.substring(1).split("&"),_393=new CFMutableDictionary();
for(var i=0,_390=_392.length;i<_390;i++){
var _394=_392[i].split("=");
if(!_394[0]){
continue;
}
if(_394[1]==null){
_394[1]=true;
}
_393.setValueForKey(decodeURIComponent(_394[0]),decodeURIComponent(_394[1]));
}
main(args,_393);
});
});
});
};
var _395=NO;
function _396(_397){
if(_395){
return _397();
}
if(window.addEventListener){
window.addEventListener("load",_397,NO);
}else{
if(window.attachEvent){
window.attachEvent("onload",_397);
}
}
};
_396(function(){
_395=YES;
});
if(typeof OBJJ_AUTO_BOOTSTRAP==="undefined"||OBJJ_AUTO_BOOTSTRAP){
_2.bootstrap();
}
function _1b6(aURL){
if(aURL instanceof CFURL&&aURL.scheme()){
return aURL;
}
return new CFURL(aURL,_1bc);
};
objj_importFile=_289.fileImporterForURL(_1bc);
objj_executeFile=_289.fileExecuterForURL(_1bc);
objj_import=function(){
CPLog.warn("objj_import is deprecated, use objj_importFile instead");
objj_importFile.apply(this,arguments);
};
})(window,ObjectiveJ);
