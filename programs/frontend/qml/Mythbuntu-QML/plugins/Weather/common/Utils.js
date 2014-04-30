.pragma library
function nightOrDay(){
    var now =  Qt.formatDateTime(new Date(),"hh")
 if (now <= 17 && now >= 05)
     return "day"
 else
     return "night"
}
var observationTime = ""
var timeFrom = ""
var dir = "../artwork/"
var homeDir = "artwork/"
var x = "weatherCondition"
var cutMe = observationTime.substring(observationTime.lastIndexOf(":")-5)

function checkmeOUt(){
return timeFrom.substring(0,timeFrom.lastIndexOf("T"))
}

function cut1ObTime(string){
string.substring(string.lastIndexOf(":")-5)
}

function splitInto(str, len) {
    var model = ""
    var regex = new RegExp('.{' + len + '}|.{1,' + Number(len-1) + '}', 'g');
    return model.substring(regex );
}
