I;21;Foundation/CPObject.jc;607;
var _1=objj_allocateClassPair(CPObject,"CPPlatform"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("bootstrap"),function(_3,_4){
with(_3){
var _5=document.getElementsByTagName("body")[0];
_5.innerHTML="";
_5.style.overflow="hidden";
if(document.documentElement){
document.documentElement.style.overflow="hidden";
}
objj_msgSend(CPPlatformString,"bootstrap");
objj_msgSend(CPPlatformWindow,"setPrimaryPlatformWindow:",objj_msgSend(objj_msgSend(CPPlatformWindow,"alloc"),"_init"));
}
})]);
