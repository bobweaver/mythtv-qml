//DataBase Stuff IE Adding and remove deleting database Functions
//Table Options For DateBase IE add to table Select from table ect.
var number = 1
var text = ""
function homeDatabase() {
     return LocalStorage.openDatabaseSync("weather_app_home", "1.0", "StorageDatabase", 1000000);
}
function createInitDatabase(){
var db = homeDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS weather_app_home')
                }
    )
}

//function insertIntoTable() {
//    var db = homeDatabase();
//    db.transaction(
//        function(tx) {
//            tx.executeSql('INSERT INTO weather_api_home VALUES(?, ?, ?, ?)', ['1',encodeURI(serie.countryName), encodeURI(serie.adminName1) ,encodeURI(serie.name) ]);
//        }
//    )
//}
function createInitHomeTable() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS weather_api_home( WD_1 INT , Country TEXT, State TEXT, City TEXT, timezone TEXT, timeFrom TEXT, timeTo TEXT,  observationTime TEXT, temperature TEXT, precipitation TEXT, clouds TEXT, windDirection TEXT,  windSpeed TEXT,  windSpeedMPS TEXT, pressure TEXT, sunRise TEXT, sunSet TEXT,  weatherCondition TEXT, status TEXT, creditTXT TEXT, creditURL TEXT )');
        }
    )
}

function truncateHome(){
    var db = homeDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('DELETE FROM weather_api_home WHERE WD_1=1')
                }
         )
}

//////////////////////////////////    Home Country        /////////////////////////////////////////////////////////////
function homeCountry() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).Country
            }
            text = r }
        )
return text
}
//////////////////////////////////    Home State        /////////////////////////////////////////////////////////////

function homeState() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).State }
            text = r })
    return text
}




//////////////////////////////////   Home  City        /////////////////////////////////////////////////////////////
function homeCity() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).City }
            text = r })
    return text
}

//================================================================



//////////////////////////////////   Home  Timezone        /////////////////////////////////////////////////////////////
function homeTimezone() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).timezone }
            text = r })
    return text
}

function homeTimeFrom() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).timeFrom }
            text = r })
    return text
}


function homeTimeTo() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).timeTo }
            text = r })
    return text
}

function homeobservationTime() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).observationTime }
            text = r })
    return text
}

function homeTemperature() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).temperature }
            text = r })
    return text
}

function homePrecipitation() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).precipitation }
            text = r })
    return text
}

function homeClouds() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).clouds }
            text = r })
    return text
}


function homeWindDirection() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).windDirection }
            text = r })
    return text
}

function homeWindSpeed() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).windSpeed }
            text = r })
    return text
}

function homeWindSpeedMPS() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).windSpeedMPS }
            text = r })
    return text
}

function homePressure() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).pressure }
            text = r })
    return text
}


function homeSunRise() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).sunRise }
            text = r })
    return text
}

function homeSunSet() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).sunSet }
            text = r })
    return text
}


function homeWeatherCondition() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).weatherCondition }
            text = r })
    return text
}


function homeStatus() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).weatherCondition }
            text = r })
    return text
}
function homeCreditTXT() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).creditTXT }
            text = r })
    return text
}
function homeCreditURL() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM weather_api_home');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).creditURL }
            text = r })
    return text
}





































function showAllWeatherNoINT() {
    var db = homeDatabase();
    db.transaction(
        function(tx) {
            // Show all added greetings
            var rs = tx.executeSql('SELECT Country,State,City FROM WEATHERAPI');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
            }
            text = r
        }
    )
}








































/////////////////////////////////// FOR favorite
//function createInitDatabase(){
//var db = getDatabase();
//    db.transaction(
//                function(tx){
//                    tx.executeSql('CREATE database IF NOT EXISTS weather_app')
//                }
//    )
//}

//function createInitTable() {
//    var db = getDatabase();
//    db.transaction(
//        function(tx) {
//            tx.executeSql('CREATE TABLE IF NOT EXISTS WEATHERAPI(Country TEXT,State TEXT,City TEXT)');
//        }
//    )
//}

//function insertIntoTable() {
//    var db = getDatabase();
//    db.transaction(
//        function(tx) {
//            tx.executeSql('INSERT INTO WEATHERAPI VALUES(?, ?, ?)', [countryTXT, locationTXT,cityTXT ]);
//        }
//    )
//}


//function truncateTable(){
//    var db = getDatabase();
//    db.transaction(
//                function(tx){
//                tx.executeSql('DELETE * FROM WEATHERAPI')
//                }
//         )
//}

//function showAllDbTable() {
//    var db = getDatabase();
//    db.transaction(
//        function(tx) {
//            // Show all added greetings
//            var rs = tx.executeSql('SELECT * FROM WEATHERAPI');
//            var r = ""
//            for(var i = 0; i < rs.rows.length; i++) {
//                r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
//            }
//            text = r
//        }
//    )
//}

//function showAllWeatherNoINT() {
//    var db = getDatabase();
//    db.transaction(
//        function(tx) {
//            // Show all added greetings
//            var rs = tx.executeSql('SELECT Country,State,Cite FROM WEATHERAPI');
//            var r = ""
//            for(var i = 0; i < rs.rows.length; i++) {
//                r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
//            }
//            text = r
//        }
//    )
//}
