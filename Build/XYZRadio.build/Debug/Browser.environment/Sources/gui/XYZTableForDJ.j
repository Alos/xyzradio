@STATIC;1.0;i;18;../model/XYZSong.ji;16;StarRatingView.jt;13920;objj_executeFile("../model/XYZSong.j", YES);
objj_executeFile("StarRatingView.j", YES);
SongsDragType = "SongsDragType";
{var the_class = objj_allocateClassPair(CPView, "XYZTableForDJ"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("collectionView"), new objj_ivar("model"), new objj_ivar("columnModel"), new objj_ivar("celdas"), new objj_ivar("pos")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithColumnModel:model:frame:"), function $XYZTableForDJ__initWithColumnModel_model_frame_(self, _cmd, aColumnModel, aModel, bounds)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("XYZTableForDJ").super_class }, "initWithFrame:", bounds);
    objj_msgSend(self, "setModel:", aModel);
 celdas = objj_msgSend(objj_msgSend(XYZCellForDJ, "alloc"), "initWithFrame:", CGRectMakeZero());
 objj_msgSend(celdas, "setModel:",  aColumnModel);
    collectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:",  CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
    pos=0;
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:",  CGRectMake(0, 30, CGRectGetWidth(bounds), CGRectGetHeight(bounds)));
    objj_msgSend(scrollView, "setAutohidesScrollers:",  YES);
    objj_msgSend(scrollView, "setDocumentView:",  collectionView);
    objj_msgSend(objj_msgSend(scrollView, "contentView"), "setBackgroundColor:",  NULL);
    objj_msgSend(scrollView, "setHasHorizontalScroller:", NO)
    objj_msgSend(scrollView, "setAutoresizesSubviews:", YES);
    var listItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(listItem, "setView:",  celdas);
    objj_msgSend(collectionView, "setItemPrototype:",  listItem);
    objj_msgSend(collectionView, "setMaxNumberOfColumns:", 1);
    objj_msgSend(collectionView, "setMinItemSize:", CPSizeMake(CGRectGetWidth(bounds), 20));
    objj_msgSend(collectionView, "setMaxItemSize:", CPSizeMake(CGRectGetWidth(bounds), 20));
    objj_msgSend(collectionView, "setContent:",  model);
    objj_msgSend(self, "addSubview:", scrollView);
    objj_msgSend(collectionView, "setDelegate:",  self);
    var borderTop = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 5, CGRectGetWidth(bounds)-2, 1));
        objj_msgSend(borderTop, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  borderTop);
    var borderArriba = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 25 , CGRectGetWidth(bounds)-2, 1));
        objj_msgSend(borderArriba, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  borderArriba);
    objj_msgSend(self, "setColumnModel:", aColumnModel);
    objj_msgSend(self, "registerForDraggedTypes:", [SongsDragType]);
    return self;
}
},["void","CPDictionary","CPArray","CGRect"]), new objj_method(sel_getUid("setColumnModel:"), function $XYZTableForDJ__setColumnModel_(self, _cmd, aColumnModel)
{ with(self)
{
 columnModel = objj_msgSend(aColumnModel, "allValues");
 for(var i=0; i<objj_msgSend(columnModel, "count");i++){
        var thisColumnModel = objj_msgSend(columnModel, "objectAtIndex:", i);
        objj_msgSend(self, "addSubview:",  thisColumnModel);
        if(i>0 && i<objj_msgSend(columnModel, "count")){
            pos = pos+CGRectGetWidth(objj_msgSend(objj_msgSend(columnModel, "objectAtIndex:",  i-1), "bounds"))+1;
            var border = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(pos, 5, 1, CGRectGetHeight(objj_msgSend(self, "bounds"))-7));
            objj_msgSend(border, "setBackgroundColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
            objj_msgSend(self, "addSubview:",  border);
        }
    }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setModel:"), function $XYZTableForDJ__setModel_(self, _cmd, aModel)
{ with(self)
{
    model = aModel;
    objj_msgSend(collectionView, "setContent:",  model);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","CPArray"]), new objj_method(sel_getUid("addItem:"), function $XYZTableForDJ__addItem_(self, _cmd, anItem)
{ with(self)
{
    CPLog.trace("Adding in XYZTableForDJ: "+anItem);
    var info = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anItem, "songAdded");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", "NewSongAddedToPlaylist", self, info);
    CPLog.info("The model: "+ model);
    objj_msgSend(model, "addObject:", anItem);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","CPObject"]), new objj_method(sel_getUid("removeItem:"), function $XYZTableForDJ__removeItem_(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(model, "removeObjectAtIndex:",  anIndex);
    objj_msgSend(collectionView, "reloadContent");
}
},["void","int"]), new objj_method(sel_getUid("getSelectedItem"), function $XYZTableForDJ__getSelectedItem(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(collectionView, "selectionIndexes"), "firstIndex");
}
},["int"]), new objj_method(sel_getUid("removeSelectedItems"), function $XYZTableForDJ__removeSelectedItems(self, _cmd)
{ with(self)
{
    var indexes= objj_msgSend(collectionView, "selectionIndexes");
    var a = objj_msgSend(indexes, "firstIndex");
    objj_msgSend(model, "removeObjectAtIndex:",  a);
    objj_msgSend(collectionView, "reloadContent");
}
},["void"]), new objj_method(sel_getUid("getSongIndex:"), function $XYZTableForDJ__getSongIndex_(self, _cmd, aSong)
{ with(self)
{
 return objj_msgSend(model, "indexOfObject:", aSong);
}
},["int","XYZSong"]), new objj_method(sel_getUid("getSongByIndex:"), function $XYZTableForDJ__getSongByIndex_(self, _cmd, index)
{ with(self)
{
 CPLog.trace("Getting song by index: %s ",objj_msgSend(objj_msgSend(model, "objectAtIndex:", index), "pathToSong"));
 return objj_msgSend(model, "objectAtIndex:", index);
}
},["XYZSong","int"]), new objj_method(sel_getUid("getSongListSize"), function $XYZTableForDJ__getSongListSize(self, _cmd)
{ with(self)
{
 return objj_msgSend(objj_msgSend(collectionView, "content"), "count");
}
},["int"]), new objj_method(sel_getUid("getSelectedItems"), function $XYZTableForDJ__getSelectedItems(self, _cmd)
{ with(self)
{
    return objj_msgSend(collectionView, "selectionIndexes");
}
},["CPIndexSet"]), new objj_method(sel_getUid("setSelectionIndexes:"), function $XYZTableForDJ__setSelectionIndexes_(self, _cmd, index)
{ with(self)
{
  objj_msgSend(collectionView, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", index));
}
},["void","CPIndexSet"]), new objj_method(sel_getUid("collectionView:dragTypesForItemsAtIndexes:"), function $XYZTableForDJ__collectionView_dragTypesForItemsAtIndexes_(self, _cmd, aCollectionView, indices)
{ with(self)
{
 CPLog.trace("here in dragtypes XYZTableForDJ....%s",indices);
    return [SongsDragType];
}
},["CPArray","CPCollectionView","CPIndexSet"]), new objj_method(sel_getUid("collectionView:dataForItemsAtIndexes:forType:"), function $XYZTableForDJ__collectionView_dataForItemsAtIndexes_forType_(self, _cmd, aCollectionView, indexes, aType)
{ with(self)
{
    var index = CPNotFound,
        content = objj_msgSend(aCollectionView, "content"),
        songs = [];
    while ((index = objj_msgSend(indexes, "indexGreaterThanIndex:", index)) != CPNotFound)
        songs.push(content[index]);
    return objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", songs);
}
},["CPData","CPCollectionView","CPIndexSet","CPString"]), new objj_method(sel_getUid("performDragOperation:"), function $XYZTableForDJ__performDragOperation_(self, _cmd, aSender)
{ with(self)
{
    CPLog.trace("Got to performdrag in the XYZTableForDJ....");
    if (objj_msgSend(aSender, "draggingSource") == collectionView){
        CPLog.error("Same draggingSource");
        return;
    }
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if (objj_msgSend(objj_msgSend(pasteboard, "types"), "containsObject:", SongsDragType))
    {
        songs = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(pasteboard, "dataForType:", SongsDragType));
        var index = 0,
            count = songs.length;
        for (; index < count; ++index){
            if(!objj_msgSend(objj_msgSend(collectionView, "content"), "containsObject:", songs[index])){
                CPLog.trace("Adding "+songs[index]);
                objj_msgSend(self, "addItem:", songs[index]);
            }
            else
            CPLog.trace("Repetido!");
        }
    }else{
        CPLog.trace("XYZTableForDJ does not accept drags for types: "+objj_msgSend(pasteboard, "types"));
    }
}
},["void","id<CPDraggingInfo>"])]);
}
var authorViewSizeForDJ;
var titleViewSizeForDJ;
var timeViewSizeForDJ;
var ratingViewSizeForDJ;
var playingViewSizeForDJ;
{var the_class = objj_allocateClassPair(CPView, "XYZCellForDJ"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("titleView"), new objj_ivar("authorView"), new objj_ivar("timeView"), new objj_ivar("highlightView"), new objj_ivar("theSong"), new objj_ivar("raterView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setModel:"), function $XYZCellForDJ__setModel_(self, _cmd, aModel)
{ with(self)
{
    CPLog.trace("Setting the model: %s", aModel);
    if(aModel){
        var playingColumn = objj_msgSend(aModel, "objectForKey:", " ");
        if(playingColumn){
            var playingColumnWidth = objj_msgSend(playingColumn, "frame").origin.x;
            playingViewSizeForDJ = playingColumnWidth+2;
        }
        var titleColumn = objj_msgSend(aModel, "objectForKey:", "title");
        if(titleColumn){
            var titleColumnWidth = objj_msgSend(titleColumn, "frame").origin.x;
            titleViewSizeForDJ = titleColumnWidth+2;
        }
        var artistColumn = objj_msgSend(aModel, "objectForKey:", "artist");
        if(artistColumn){
            var artistColumnWidth = objj_msgSend(artistColumn, "frame").origin.x;
            authorViewSizeForDJ = artistColumnWidth+2;
        }
        var ratingColumn = objj_msgSend(aModel, "objectForKey:", "rating");
        if(ratingColumn){
            var ratingColumnWidth = objj_msgSend(ratingColumn, "frame").origin.x;
            ratingViewSizeForDJ = ratingColumnWidth+2;
        }
        CPLog.info("titleViewSizeForDJ:"+titleViewSizeForDJ);
    }
}
},["void","CPDictionary"]), new objj_method(sel_getUid("setRepresentedObject:"), function $XYZCellForDJ__setRepresentedObject_(self, _cmd, anObject)
{ with(self)
{
    theSong = anObject;
    if(!titleView)
    {
        titleView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset( objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(titleView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  titleView);
    }
    objj_msgSend(titleView, "setStringValue:",  objj_msgSend(anObject, "songTitle"));
    objj_msgSend(titleView, "sizeToFit");
    objj_msgSend(titleView, "setFrameOrigin:",  CGPointMake(titleViewSizeForDJ,0.0));
    if(!authorView)
    {
        authorView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(self, "bounds"), 4, 4));
        objj_msgSend(authorView, "setFont:",  objj_msgSend(CPFont, "systemFontOfSize:",  12.0));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(self, "addSubview:",  authorView);
    }
    objj_msgSend(authorView, "setStringValue:",  objj_msgSend(anObject, "artist"));
    objj_msgSend(authorView, "sizeToFit");
    objj_msgSend(authorView, "setFrameOrigin:",  CGPointMake(authorViewSizeForDJ,0.0));
    if(!raterView){
        var raterView = objj_msgSend(objj_msgSend(StarRatingView, "alloc"), "initWithFrame:", CGRectMake(0, 0, 300, 25));
        objj_msgSend(raterView, "setFrameOrigin:", CGPointMake(ratingViewSizeForDJ, 0.0));
        CPLog.trace("Setting rater for %s width %s", objj_msgSend(anObject, "songTitle"), raterView);
        objj_msgSend(anObject, "setStarRater:",  raterView);
        objj_msgSend(self, "addSubview:",  raterView);
    }
    var control = objj_msgSend(raterView, "rater");
    objj_msgSend(control, "setIntValue:",  objj_msgSend(anObject, "rating"));
}
},["void","JSObject"]), new objj_method(sel_getUid("setSelected:"), function $XYZCellForDJ__setSelected_(self, _cmd, flag)
{ with(self)
{
    if(!highlightView)
    {
        highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectCreateCopy(objj_msgSend(self, "bounds")));
        objj_msgSend(highlightView, "setBackgroundColor:",  objj_msgSend(CPColor, "greenColor"));
    }
    if(flag)
    {
        objj_msgSend(self, "addSubview:positioned:relativeTo:", highlightView, CPWindowBelow,  titleView);
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "blackColor"));
    }
    else
    {
        objj_msgSend(highlightView, "removeFromSuperview");
        objj_msgSend(titleView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(authorView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
        objj_msgSend(timeView, "setTextColor:",  objj_msgSend(CPColor, "colorWithHexString:", "33FF00"));
    }
}
},["void","BOOL"])]);
}

