.pragma library

var getAllVideos = "/Video/GetVideoList"
var now = new Date()

//four hours
var time2 = new Date(new Date().getTime() + (12 * 60 * 60 * 1000))
//var time2 = new Date(new Date().getTime() + (1 * 60 * 60 * 1000))
//var time4 = new Date(new Date().getTime() + ())
var defaultDB = "UbuntuSDK"
var otherDB = ""
function zeroConf(uri){
var q = uri
var x = q.substring(q.lastIndexOf("on")+3 )
return "http://"+x ;
}



/* Default color pallette */
var orange = "#DD4814"
var canonicalAubergine = "#772953"
var lightAubergine = "#77216F"
var mediumAubergine = "#5E2750"
var darkAubergine = "#2C001E"
var darkAubergineDesaturated = "#2c1625"
var warmGrey = "#AEA79F"
var coolGrey = "#333333"
var ubuntuGrey =  Qt.darker("#C7C7C7",2)
var MS_PER_HOUR = 1000 * 3600

/* Convert strings like "one-two-three" to "OneTwoThree" */
function convertToCamelCase( name ) {
    var chunksArray = name.split('-')
    var camelName = ''
    for (var i=0; i<chunksArray.length; i++){
        camelName = camelName + chunksArray[i].charAt(0).toUpperCase() + chunksArray[i].slice(1);
    }
    return camelName
}

function fromUTC(object){

    var de = new Date(object).toUTCString()
    var mytime = new Date(de).toLocaleString()
        return mytime.toString()
    }
function toUTC(object){
    var year = Qt.formatDateTime(object,"yyyy")
    var month = Qt.formatDateTime(object,"MM")
    var day = Qt.formatDateTime(object,"dd")
    var hour = Qt.formatDateTime(object,"hh")
    var minute = Qt.formatDateTime(object,"mm")
    var de = new Date(object).toLocaleString()
        return de
    }

function milliSecondsToString(milliseconds) {
    milliseconds = milliseconds > 0 ? milliseconds : 0
    var timeInSeconds = Math.floor(milliseconds / 1000)
    var minutes = Math.floor(timeInSeconds / 60)
    var minutesString = minutes < 10 ? "0" + minutes : minutes
    var seconds = Math.floor(timeInSeconds % 60)
   var secondsString = seconds < 10 ? "0" + seconds : seconds
        return minutesString + ":" + secondsString
    }

function milliSecondsToMinutes(milliseconds) {
    milliseconds = milliseconds > 0 ? milliseconds : 0
    var timeInSeconds = Math.floor(milliseconds / 1000)
    var minutes = Math.floor(timeInSeconds / 60)
    var minutesString = minutes < 10 ? "0" + minutes : minutes
    var seconds = Math.floor(timeInSeconds % 60)
   var secondsString = seconds < 10 ? "0" + seconds : seconds
        return minutesString
    }


function timeOff(timeto){
var q = Date(timeto)
var w = q.substring(q.indexOf("-"))
var e = w.substring(0,w.indexOf(" "))
return e
}




function format_time(time_in_milliseconds, formatting) {
    /* We are using Qt.formatTime to format the time_in_milliseconds because
       this is more practical that doing the formatting manually (JavaScript
       does not provide any string formatting function natively).

       WARNING: this will break for media longer than 24 hours.
    */

    /* Hack JavaScript's Date to ignore timeone offset */
    var zero = new Date(0)
    var offset = zero.getTimezoneOffset()*60*1000
    var date = new Date(time_in_milliseconds+offset)

    return Qt.formatTime(date, formatting)
}

function fromIso8601(date) {
    var timestamp, struct, minutesOffset = 0;
    var numericKeys = [ 1, 4, 5, 6, 7, 10, 11 ];

    // ES5 §15.9.4.2 states that the string should attempt to be parsed as a Date Time String Format string
    // before falling back to any implementation-specific date parsing, so that’s what we do, even if native
    // implementations could be faster
    //              1 YYYY                2 MM       3 DD           4 HH    5 mm       6 ss        7 msec        8 Z 9 ±    10 tzHH    11 tzmm
    if ((struct = /^(\d{4}|[+\-]\d{6})(?:-(\d{2})(?:-(\d{2}))?)?(?:T(\d{2}):(\d{2})(?::(\d{2})(?:\.(\d{3}))?)?(?:(Z)|([+\-])(\d{2})(?::(\d{2}))?)?)?$/.exec(date))) {
        // avoid NaN timestamps caused by “undefined” values being passed to Date.UTC
        for (var i = 0, k; (k = numericKeys[i]); ++i) {
            struct[k] = +struct[k] || 0;
        }

        // allow undefined days and months
        struct[2] = (+struct[2] || 1) - 1;
        struct[3] = +struct[3] || 1;

        if (struct[8] !== 'Z' && struct[9] !== undefined) {
            minutesOffset = struct[10] * 60 + struct[11];

            if (struct[9] === '+') {
                minutesOffset = 0 - minutesOffset;
            }
        }

        timestamp = Date(struct[1], struct[2], struct[3], struct[4], struct[5] + minutesOffset, struct[6], struct[7]).toUTCString();
        return new Date(timestamp);
    }
    else return null;
}

function updateTime(nw){
    var e  = Qt.formatDateTime(nw,"ddd MMMM d yyyy hh:mm:ss");
    var td = new Date(e);
    return "\t"+ td
}

function isSameDay(date1, date2) {
    return (date1.getFullYear() === date2.getFullYear() &&
            date1.getMonth === date2.getMonth &&
            date1.getDay() === date2.getDay())
}

function pad(text, len, paddingChar) {
    var padding = ""
    for (var i = text.length; i < len; i++) padding += paddingChar
    return padding + text
}

/* DOCME */
function linearInterpolation(xa, xb, a, b, x) {
    return (clamp(x, xa, xb) - xa)/(xb - xa) * (b - a) + a
}

function lastof(){

}

/* DOCME */
function segmentsLinearInterpolation(lx, ly, x) {
    /* FIXME: quick, 5 minutes implementation. Needs cleanup */
    var cxa, cxb, cya, cyb
    for (var i = 0, len = lx.length; i < len; i++) {
        cxa = lx[i]
        cya = ly[i]
        if (cxa <= x) {
            if (i >= len-1) return cya
            cxb = lx[i+1]
            if (x < cxb) {
                cyb = ly[i+1]
                return linearInterpolation(cxa, cxb, cya, cyb, x)
            }
        } else {
            return cya
        }
    }
}


function linearInterpolation(xa, xb, a, b, x) {
    return (clamp(x, xa, xb) - xa)/(xb - xa) * (b - a) + a
}
function segmentsLinearInterpolation(lx, ly, x) {
    /* FIXME: quick, 5 minutes implementation. Needs cleanup */
    var cxa, cxb, cya, cyb
    for (var i = 0, len = lx.length; i < len; i++) {
        cxa = lx[i]
        cya = ly[i]
        if (cxa <= x) {
            if (i >= len-1) return cya
            cxb = lx[i+1]
            if (x < cxb) {
                cyb = ly[i+1]
                return linearInterpolation(cxa, cxb, cya, cyb, x)
            }
        } else {
            return cya
        }
    }
}
