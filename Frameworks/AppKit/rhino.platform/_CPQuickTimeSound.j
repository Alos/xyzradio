i;9;CPSound.jc;4458;
var _1=0;
var _2=objj_allocateClassPair(CPSound,"_CPQuickTimeSound"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_Player")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_haveQuickTime"),function(_4,_5){
with(_4){
var _6=NO;
if(navigator.plugins){
for(i=0;i<navigator.plugins.length;i++){
if(navigator.plugins[i].name.indexOf("QuickTime")>=0){
_6=YES;
}
}
}
if((navigator.appVersion.indexOf("Mac")>0)&&(navigator.appName.substring(0,9)=="Microsoft")&&(parseInt(navigator.appVersion)<5)){
_6=YES;
}
return _6;
}
}),new objj_method(sel_getUid("_CreateDOMObjectElement:"),function(_7,_8,_9){
with(_7){
var _a=document.createElement("object");
var _b=document.createElement("param");
_a.setAttribute("classid","clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B");
_a.setAttribute("codebase","http://www.apple.com/qtactivex/qtplugin.cab");
_a.setAttribute("width","0");
_a.setAttribute("height","0");
_b.setAttribute("src",_9);
_a.appendChild(_b);
_b=document.createElement("param");
_b.setAttribute("controller","false");
_a.appendChild(_b);
_b=document.createElement("param");
_b.setAttribute("autoplay","false");
_a.appendChild(_b);
_b=document.createElement("param");
_b.setAttribute("hidden","true");
_a.appendChild(_b);
_b=document.createElement("param");
_b.setAttribute("enablejavascript","true");
_a.appendChild(_b);
_b=document.createElement("param");
_b.setAttribute("postdomevents","true");
_a.appendChild(_b);
_b=document.createElement("param");
_b.setAttribute("id","CPMixer"+"Object"+_1);
_a.appendChild(_b);
return _a;
}
}),new objj_method(sel_getUid("_CreateDOMEmbedElement:"),function(_c,_d,_e){
with(_c){
var _f=document.createElement("embed");
_f.setAttribute("src",_e);
_f.setAttribute("width","0");
_f.setAttribute("height","0");
_f.setAttribute("pluginspage","http://www.apple.com/quicktime/download/");
_f.setAttribute("name","CPMixer"+"Embed"+_1);
_f.setAttribute("enablejavascript","true");
_f.setAttribute("postdomevents","true");
_f.setAttribute("autoplay","false");
return _f;
}
}),new objj_method(sel_getUid("initWithFile:mixer:"),function(_10,_11,_12,_13){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPSound")},"init");
if(_10){
if(!objj_msgSend(_10,"_haveQuickTime")){
return nil;
}
var _14=objj_msgSend(_10,"_CreateDOMObjectElement:",_12);
var _15=objj_msgSend(_10,"_CreateDOMEmbedElement:",_12);
_14.appendChild(_15);
_13.appendChild(_14);
_Player=document.getElementsByName("CPMixer"+"Embed"+_1);
if(_Player.length==0){
_Player=document.getElementById("CPMixer"+"Object"+_1);
if(!_Player){
return nil;
}
}else{
_Player=_Player[0];
}
if(document.addEventListener){
_Player.addEventListener("qt_ended",function(){
if(_delegate!=nil&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("sound:didFinishPlaying:"))){
objj_msgSend(_delegate,"sound:didFinishPlaying:",_10,YES);
}
},false);
}else{
_Player.attachEvent("onqt_ended",function(){
if(_delegate!=nil&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("sound:didFinishPlaying:"))){
objj_msgSend(_delegate,"sound:didFinishPlaying:",_10,YES);
}
});
}
}
return _10;
}
}),new objj_method(sel_getUid("isPlaying"),function(_16,_17){
with(_16){
return _Player.GetRate()!=0;
}
}),new objj_method(sel_getUid("play"),function(_18,_19){
with(_18){
_Player.Play();
}
}),new objj_method(sel_getUid("pause"),function(_1a,_1b){
with(_1a){
_Player.Stop();
}
}),new objj_method(sel_getUid("stop"),function(_1c,_1d){
with(_1c){
_Player.Rewind();
_Player.Stop();
}
}),new objj_method(sel_getUid("volume"),function(_1e,_1f){
with(_1e){
return _Player.GetVolume()/256;
}
}),new objj_method(sel_getUid("setVolume:"),function(_20,_21,_22){
with(_20){
if(_22>1){
_22=1;
}else{
if(_22<0){
_22=0;
}
}
_Player.SetVolume(_22*256);
}
}),new objj_method(sel_getUid("duration"),function(_23,_24){
with(_23){
return _Player.GetDuration()/_Player.GetTimeScale();
}
}),new objj_method(sel_getUid("loops"),function(_25,_26){
with(_25){
return _Player.GetIsLooping()!=0;
}
}),new objj_method(sel_getUid("setLoops:"),function(_27,_28,_29){
with(_27){
_Player.SetIsLooping(_29?1:0);
}
}),new objj_method(sel_getUid("currentTime"),function(_2a,_2b){
with(_2a){
return _Player.GetTime()/_Player.GetTimeScale();
}
}),new objj_method(sel_getUid("setCurrentTime:"),function(_2c,_2d,_2e){
with(_2c){
if(_2e<0){
_2e=0;
}
_Player.SetTime(_2e*_Player.GetTimeScale());
}
})]);
