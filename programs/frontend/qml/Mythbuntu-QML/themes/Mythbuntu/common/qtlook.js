// Color of the background
var BackgroundColor = "#404040"
// Color of lines, text, etc
var ForegroundColor = "white"
// Pixmap to use for the background
var BackgroundPixmap = "background.png"

// Colors for the different program categories
function guideColor(catType){
    var x = ""
    switch(catType){
case "":
    x =  "#c10033"
     break;
case "Comedy" :
    x =  "green"
 break;
case "Animals":
    x =  "darkblue"
 break;
case "Nature":
    x =  "#552277gg"
 break;
case "SciFi":
    x =  "brown"
 break;
case "Horror":
    x =  "firebrick"
 break;
case "Action":
    x =   "maroon"
 break;
case "Game":
    x =  "#22E7E7E7"
 break;
case "Childrens":
    x =  "#66FFFFFF"
 break;
case "Edu":
    x =  "#C7C7C7"
 break;
case "Adult":
    x =  Qt.blue
 break;
case "Musical":
    x =  Qt.red
 break;
case "News":
    x =  "darkred"
 break;
case "Reality":
    x =  Qt.darker("#ff7505", 1.6)
 break;
case "Cooking":
    x =  "purple"
 break;
case "Doc":
    x =  "#44FFFFFF"
 break;
case "Sports":
    x =  "green"
 break;
case "Mystery":
    x =  "FFDD88"
 break;
case "Drama":
    x =  ActiveDark
 break;
case "Classic":
    x =  ActiveMidlight
 break;
case "Crime":
    x =  ActiveLight
 break;
case "Talk":
    x =  "forestgreen"
break;
case "Sitcom":
    x =  "forestgreen"
}
    return x
    }

// Forground for dialogs
var ActiveForeground = "//FFFFFF"

//# This is the background for inactive buttons
var ActiveButton = "#404040"
var ActiveLight = "#606060"
var ActiveMidlight = "#505050"
var ActiveDark = "#202020"
var ActiveMid = "#303030"
var ActiveText = "#FFFFFF"
var ActiveBrightText = "#FFFFFF"
var ActiveButtonText = "#FFFFFF"
var ActiveBase = "#202020"
var ActiveBackground = "#404040"
var ActiveShadow = "#000000"
var ActiveHighlight = "#808080"
var ActiveHighlightedText = "#FFFFFF"

var InactiveForeground = "#FFFFFF"
var InactiveButton = "#254A55"
var InactiveLight = "#435B70"
var InactiveMidlight = "#324C57"
var InactiveDark = "#204150"
var InactiveMid = "#214351"
var InactiveText = "#FFFFFF"
var InactiveBrightText = "#FFFFFF"
var InactiveButtonText = "#ffffff"
var InactiveBase = "#254E56"
var InactiveBackground = "#264F57"
var InactiveShadow = "#000000"
var InactiveHighlight = "#2D733F"
var InactiveHighlightedText = "#000000"

var DisabledForeground = "#FFFFFF"
var DisabledButton = "#404040"
var DisabledLight = "#24385C"
var DisabledMidlight = "#192944"
var DisabledDark = "#1A2E53"
var DisabledMid = "#1B2D53"
var DisabledText = "#4F535B"
var DisabledBrightText = "#71757E"
var DisabledButtonText = "#4F535B"
var DisabledBase = "#1E3356"
var DisabledBackground = "#1E3356"
var DisabledShadow = "#000000"
var DisabledHighlight = "#274E57"
var DisabledHighlightedText = "#ffffff"

var curTimeChan_bgColor = "#8f2813"
var curTimeChan_fgColor = "#ffffff"
var date_bgColor = "#0f2e8f"
var date_dsColor = "#000000"
var date_fgColor = "#ffffff"
var chan_bgColor = "#0f2f5a"
var chan_dsColor = "#000000"
var chan_fgColor = "#ffffff"
var time_bgColor = "#0f2e8f"
var time_dsColor = "#000000"
var time_fgColor = "#ffffff"
var prog_bgColor = "#2d587b"
var prog_fgColor = "#ffffff"
var progLine_Color = "#104064"
var progArrow_Color = "#ffffff"
var progArrow_Type = 0
var curProg_bgColor = "#85a5bc"
var curRecProg_bgColor = "#bc4c32"
var curProg_dsColor = "#000000"
var curProg_fgColor = "#eefb92"
var misChanIcon_bgColor = "#000000"
var misChanIcon_fgColor = "#ffffff"
