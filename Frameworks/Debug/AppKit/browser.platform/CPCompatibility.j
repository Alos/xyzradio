i;9;CPEvent.jc;4576;
CPUnknownBrowserEngine = 0;
CPGeckoBrowserEngine = 1;
CPInternetExplorerBrowserEngine = 2;
CPKHTMLBrowserEngine = 3;
CPOperaBrowserEngine = 4;
CPWebKitBrowserEngine = 5;
CPCSSRGBAFeature = 1 << 5;
CPHTMLCanvasFeature = 1 << 6;
CPHTMLContentEditableFeature = 1 << 7;
CPHTMLDragAndDropFeature = 1 << 8;
CPJavascriptInnerTextFeature = 1 << 9;
CPJavascriptTextContentFeature = 1 << 10;
CPJavascriptClipboardEventsFeature = 1 << 11;
CPJavascriptClipboardAccessFeature = 1 << 12;
CPJavaScriptCanvasDrawFeature = 1 << 13;
CPJavaScriptCanvasTransformFeature = 1 << 14;
CPVMLFeature = 1 << 15;
CPJavascriptRemedialKeySupport = 1 << 16;
CPJavaScriptShadowFeature = 1 << 20;
CPJavaScriptNegativeMouseWheelValues = 1 << 22;
CPJavaScriptMouseWheelValues_8_15 = 1 << 23
CPOpacityRequiresFilterFeature = 1 << 24;
CPInputTypeCanBeChangedFeature = 1 << 25;
var USER_AGENT = "",
    PLATFORM_ENGINE = CPUnknownBrowserEngine,
    PLATFORM_FEATURES = 0;
PLATFORM_FEATURES |= CPInputTypeCanBeChangedFeature;
if (typeof window != "undfined" && typeof window.navigator != "undefined")
    USER_AGENT = window.navigator.userAgent;
if (window.opera)
{
    PLATFORM_ENGINE = CPOperaBrowserEngine;
    PLATFORM_FEATURES |= CPJavaScriptCanvasDrawFeature;
}
else if (window.attachEvent)
{
    PLATFORM_ENGINE = CPInternetExplorerBrowserEngine;
    PLATFORM_FEATURES |= CPVMLFeature;
    PLATFORM_FEATURES |= CPJavascriptRemedialKeySupport;
    PLATFORM_FEATURES |= CPJavaScriptShadowFeature;
    PLATFORM_FEATURES |= CPOpacityRequiresFilterFeature;
    PLATFORM_FEATURES &= ~CPInputTypeCanBeChangedFeature;
}
else if (USER_AGENT.indexOf("AppleWebKit/") != -1)
{
    PLATFORM_ENGINE = CPWebKitBrowserEngine;
    PLATFORM_FEATURES |= CPCSSRGBAFeature;
    PLATFORM_FEATURES |= CPHTMLContentEditableFeature;
    PLATFORM_FEATURES |= CPHTMLDragAndDropFeature;
    PLATFORM_FEATURES |= CPJavascriptClipboardEventsFeature;
    PLATFORM_FEATURES |= CPJavascriptClipboardAccessFeature;
    PLATFORM_FEATURES |= CPJavaScriptShadowFeature;
    var versionStart = USER_AGENT.indexOf("AppleWebKit/") + "AppleWebKit/".length,
        versionEnd = USER_AGENT.indexOf(" ", versionStart),
        versionString = USER_AGENT.substring(versionStart, versionEnd),
        versionDivision = versionString.indexOf('.'),
        majorVersion = parseInt(versionString.substring(0, versionDivision)),
        minorVersion = parseInt(versionString.substr(versionDivision + 1));
    if((USER_AGENT.indexOf("Safari") !== CPNotFound && (majorVersion > 525 || (majorVersion === 525 && minorVersion > 14))) || USER_AGENT.indexOf("Chrome") !== CPNotFound)
        PLATFORM_FEATURES |= CPJavascriptRemedialKeySupport;
}
else if (USER_AGENT.indexOf("KHTML") != -1)
{
    PLATFORM_ENGINE = CPKHTMLBrowserEngine;
}
else if (USER_AGENT.indexOf("Gecko") !== -1)
{
    PLATFORM_ENGINE = CPGeckoBrowserEngine;
    PLATFORM_FEATURES |= CPJavaScriptCanvasDrawFeature;
    var index = USER_AGENT.indexOf("Firefox"),
        version = (index === -1) ? 2.0 : parseFloat(USER_AGENT.substring(index + "Firefox".length + 1));
    if (version >= 3.0)
        PLATFORM_FEATURES |= CPCSSRGBAFeature;
    if (version < 3.0)
        PLATFORM_FEATURES |= CPJavaScriptMouseWheelValues_8_15;
}
if (typeof document != "undefined")
{
    var canvasElement = document.createElement("canvas");
    if (canvasElement && canvasElement.getContext)
    {
        PLATFORM_FEATURES |= CPHTMLCanvasFeature;
        var context = document.createElement("canvas").getContext("2d");
        if (context && context.setTransform && context.transform)
            PLATFORM_FEATURES |= CPJavaScriptCanvasTransformFeature;
    }
    var DOMElement = document.createElement("div");
    if (DOMElement.innerText != undefined)
        PLATFORM_FEATURES |= CPJavascriptInnerTextFeature;
    else if (DOMElement.textContent != undefined)
        PLATFORM_FEATURES |= CPJavascriptTextContentFeature;
}
CPFeatureIsCompatible= function(aFeature)
{
    return PLATFORM_FEATURES & aFeature;
}
CPBrowserIsEngine= function(anEngine)
{
    return PLATFORM_ENGINE == anEngine;
}
if (USER_AGENT.indexOf("Mac") != -1)
{
    CPPlatformActionKeyMask = CPCommandKeyMask;
    CPUndoKeyEquivalent = "Z";
    CPRedoKeyEquivalent = "Z";
    CPUndoKeyEquivalentModifierMask = CPCommandKeyMask;
    CPRedoKeyEquivalentModifierMask = CPCommandKeyMask | CPShiftKeyMask;
}
else
{
    CPPlatformActionKeyMask = CPControlKeyMask;
    CPUndoKeyEquivalent = "Z";
    CPRedoKeyEquivalent = "Y";
    CPUndoKeyEquivalentModifierMask = CPControlKeyMask;
    CPRedoKeyEquivalentModifierMask = CPControlKeyMask;
}

