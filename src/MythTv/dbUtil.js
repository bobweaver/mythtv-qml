//.pragma library
var text = ""


//////////IP adress
function ipDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_backend_location", "1.0", "StorageDatabase", 1000000);
}
function createInitMainDatabase(){
var db = ipDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_backend_location')
                }
    )
}

function createInitIpAddressTable() {
    var db = ipDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_backend_location(WD_1 INT ,BackendIP TEXT)');
        }
    )
}

function truncateIpAddess(){
    var db = ipDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('DELETE FROM mythbuntu_backend_location WHERE WD_1=1')
                }
         )
}

function ipAddress() {
    var db = ipDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM mythbuntu_backend_location');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).BackendIP
            }
          text = r
        }
        )
    return text
}


////////////////////port

function portDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_backend_port", "1.0", "StorageDatabase", 1000000);
}
function createInitMainPortDatabase(){
var db = portDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_backend_port')
                }
    )
}

function createInitPortTable() {
    var db = portDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_backend_port(WD_1 INT ,BackendPort TEXT)');
        }
    )
}

function truncatePort(){
    var db = portDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('DELETE FROM mythbuntu_backend_port WHERE WD_1=1')
                }
         )
}

function port() {
    var db = portDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM mythbuntu_backend_port');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).BackendPort
            }
          text = r
        }
        )
    return text
}




//FrontEnd DB and Tables
function frontendDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_frontend", "1.0", "StorageDatabase", 1000000);
}
function createInitMainDatabase(){
var db = frontendDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_frontend')
                }
    )
}

function createInitFrontEndTable() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_frontend(WD_1 INT ,FrontIP TEXT, FrontPort TEXT)');
        }
    )
}









//MOVE ME FOR EACH OF THE 5
//function truncatePort(){
//    var db = frontendportDatabase();
//    db.transaction(
//                function(tx){
//                    tx.executeSql('DELETE FROM mythbuntu_backend_port WHERE WD_1=1')
//                }
//         )
//}






//FrontEnd Ip Adress

function frontendIp1() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontIP FROM mythbuntu_frontend WHERE WD_1=1');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontIP
            }
          text = r
        }
        )
    return text
}



function frontendIp2() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontIP FROM mythbuntu_frontend WHERE WD_1=2');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontIP
            }
          text = r
        }
        )
    return text
}


function frontendIp3() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontIP FROM mythbuntu_frontend WHERE WD_1=3');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontIP
            }
          text = r
        }
        )
    return text
}


function frontendIp4() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontIP FROM mythbuntu_frontend WHERE WD_1=4');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontIP
            }
          text = r
        }
        )
    return text
}


function frontendIp5() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontIP FROM mythbuntu_frontend WHERE WD_1=5');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontIP
            }
          text = r
        }
        )
    return text
}





/////////FrontEnd Ports

function frontendPort1() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontPort FROM mythbuntu_frontend WHERE WD_1=1');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontPort
            }
          text = r
        }
        )
    return text
}




function frontendPort2() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontPort FROM mythbuntu_frontend WHERE WD_1=2');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontPort
            }
          text = r
        }
        )
    return text
}

function frontendPort3() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontPort FROM mythbuntu_frontend WHERE WD_1=3');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontPort
            }
          text = r
        }
        )
    return text
}



function frontendPort4() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontPort FROM mythbuntu_frontend WHERE WD_1=4');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontPort
            }
          text = r
        }
        )
    return text
}



function frontendPort5() {
    var db = frontendDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT FrontPort FROM mythbuntu_frontend WHERE WD_1=5');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).FrontPort
            }
          text = r
        }
        )
    return text
}






















function themeDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_theming_engine", "1.0", "StorageDatabase", 1000000);
}
function createInitThemeMainDatabase(){
var db = themeDatabase();
    db.transaction(
                function(tx){
                       tx.executeSql('CREATE database  IF NOT EXISTS mythbuntu_theming_engine')
//                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_backend_location')

                }
    )
}
function createInitIThemingTable() {
    var db = themeDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_theming_table (WD_1 INT ,Theme TEXT)');

        }
    )
}

function truncateThemeTable(){
    var db = themeDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('DELETE FROM mythbuntu_theming_table WHERE WD_1=1')
                }
         )
}
function theme() {
    var db = themeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM mythbuntu_theming_table');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).Theme
            }
          text = r
        }
        )
    return text
}





////////////////////////////////////////////////////////////////////////////



function timeDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_time_offset", "1.0", "StorageDatabase", 1000000);
}
function createInitMainDatabase(){
var db = timeDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_time_offset')
                }
    )
}

function createtimeOffSetTable() {
    var db = timeDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_time_offset_table(WD_1 INT ,OffSet TEXT)');
        }
    )
}

function truncateTimeOffSetAddess(){
    var db = timeDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('DELETE FROM mythbuntu_time_offset_table WHERE WD_1=1')
                }
         )
}

function timeOffset() {
    var db = timeDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM mythbuntu_time_offset_table');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).OffSet
            }
          text = r
        }
        )
    return text
}



//////////videoPath
function videosDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_videos", "1.0", "StorageDatabase", 1000000);
}
function createVideosDatabase(){
var db = videosDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_videos')
                }
    )
}
//31
function createVideosTable() {
    var db = videosDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_videos(VD_1 INT ,Id INT ,Title TEXT ,SubTitle TEXT,Tagline TEXT,Director TEXT,Studio TEXT,Description TEXT,Certification TEXT,Inetref INT, Collectionref INT,HomePage TEXT,ReleaseDate TEXT,AddDate TEXT, UserRating TEXT, Length INT,PlayCount INT, Season INT,Episode INT,ParentalLevel INT,Visible TEXT, Watched TEXT, Processed TEXT,ContentType TEXT,FileName TEXT,Hash TEXT,HostName TEXT,Coverart TEXT,Fanart TEXT,Banner TEXT,Screenshot TEXT,Trailer TEXT)');
        }
    )
}

//function truncateIpAddess(){
//    var db = ipDatabase();
//    db.transaction(
//                function(tx){
//                    tx.executeSql('DELETE FROM mythbuntu_backend_location WHERE WD_1=1')
//                }
//         )
//}

//function ipAddress() {
//    var db = ipDatabase();
//    db.transaction(
//        function(tx) {
//            var rs = tx.executeSql('SELECT * FROM mythbuntu_backend_location');
//            var r = ""
//            for(var i = 0; i < rs.rows.length; i++) {
//                r += rs.rows.item(i).BackendIP
//            }
//          text = r
//        }
//        )
//    return text
//}





















////////////////////////////////////////////////////////////////////////////



function preRecordedDatabase() {
     return LocalStorage.openDatabaseSync("mythbuntu_prerec", "1.0", "StorageDatabase", 1000000);
}
function createInitMainDatabase(){
var db = preRecordedDatabase();
    db.transaction(
                function(tx){
                    tx.executeSql('CREATE database IF NOT EXISTS mythbuntu_prerec')
                }
    )
}
//33 colomns for table
function createPreRecTable() {
    var db = preRecordedDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS mythbuntu_prerec_table(PRD_1 INT,startTime TEXT,endTime TEXT,title TEXT,subs TEXT,category TEXT,catType TEXT,repeat TEXT,vidProps TEXT,fileName TEXT,Description TEXT,Inetref TEXT,Season TEXT,Episode TEXT,chanID TEXT,CallSign TEXT,Status TEXT,Priority TEXT,StartTs TEXT,EndTs TEXT,RecordId TEXT,RecGroup TEXT,PlayGroup TEXT,StorageGroup TEXT,RecType TEXT,Profile TEXT,CoverArtURL TEXT,CoverArtName TEXT,CoverArtStorageGroup TEXT,CoverArtTypeTEXT,FanArtURL TEXT,FanArtName TEXT,FanArtStorageGroup TEXT,FanArtType TEXT)');
        }
    )
}

function truncatePreRecorded(count){
    var db = preRecordedDatabase();
      for (var i=0; i<count; i++)
    db.transaction(
                function(tx){
                    tx.executeSql('DELETE FROM mythbuntu_prerec_table WHERE PRD_1='+i)
                }
         )
}

function pRTitle() {
    var db = preRecordedDatabase();
    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM mythbuntu_prerec_table');
            var r = ""
            for(var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).title
            }
          text = rs.rows.length;
        }
        )
    return text
}


///////////////////////////////////////////////////////////////////////////////
