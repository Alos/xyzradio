I;21;Foundation/CPObject.jc;2950;






var DOMIFrameElement = nil,
    DOMSpanElement = nil,
    DefaultFont = nil;


{var the_class = objj_allocateClassPair(CPObject, "CPPlatformString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("bootstrap"), function $CPPlatformString__bootstrap(self, _cmd)
{ with(self)
{

    DOMIFrameElement = document.createElement("iframe");

    DOMIFrameElement.name = name = "iframe_" + FLOOR(RAND() * 10000);
    DOMIFrameElement.style.position = "absolute";
    DOMIFrameElement.style.left = "-100px";
    DOMIFrameElement.style.top = "-100px";
    DOMIFrameElement.style.width = "1px";
    DOMIFrameElement.style.height = "1px";
    DOMIFrameElement.style.borderWidth = "0px";
    DOMIFrameElement.style.background = "blue";
    DOMIFrameElement.style.overflow = "hidden";
    DOMIFrameElement.style.zIndex = 100000000000;

    document.getElementsByTagName("body")[0].appendChild(DOMIFrameElement);

    var DOMIFrameDocument = (DOMIFrameElement.contentDocument || DOMIFrameElement.contentWindow.document);

    DOMIFrameDocument.write("<html><head></head><body></body></html>");
    DOMIFrameDocument.close();

    DOMSpanElement = DOMIFrameDocument.createElement("span");

    DOMSpanElement.style.position = "absolute";
    DOMSpanElement.style.whiteSpace = "pre";
    DOMSpanElement.style.visibility = "visible";
    DOMSpanElement.style.padding = "0px";
    DOMSpanElement.style.margin = "0px";
    DOMSpanElement.style.background = "red";

    DOMIFrameDocument.getElementsByTagName("body")[0].appendChild(DOMSpanElement);

}
},["void"]), new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"), function $CPPlatformString__sizeOfString_withFont_forWidth_(self, _cmd, aString, aFont, aWidth)
{ with(self)
{

    if (!aFont)
    {
        if (!DefaultFont)
            DefaultFont = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);

        aFont = DefaultFont;
    }

    var style = DOMSpanElement.style;

    if (aWidth === NULL)
    {
        style.width = "";
        style.whiteSpace = "pre";
    }

    else
    {
        style.width = ROUND(aWidth) + "px";

        if (document.attachEvent)
            style.wordWrap = "break-word";

        else
        {
            style.whiteSpace = "-o-pre-wrap";
            style.whiteSpace = "-pre-wrap";
            style.whiteSpace = "-moz-pre-wrap";
            style.whiteSpace = "pre-wrap";
        }
    }

    style.font = objj_msgSend(aFont, "cssString");

    if (CPFeatureIsCompatible(CPJavascriptInnerTextFeature))
        DOMSpanElement.innerText = aString;

    else if (CPFeatureIsCompatible(CPJavascriptTextContentFeature))
        DOMSpanElement.textContent = aString;

    return { width:DOMSpanElement.clientWidth, height:DOMSpanElement.clientHeight };



}
},["CGSize","CPString","CPFont","float"])]);
}

