var q = require("q");
var db = require("../common/database");
var conn = db.getConnection();

function getAbout() {
    var defer = q.defer();
    console.log("..getAbout");
    var query = conn.query('SELECT * FROM about', function (err,result) {
        if (err) {
            defer.reject(err);
        } else {
            defer.resolve(result);
        }
    });
    return defer.promise;
}

function getEducation() {
    var defer = q.defer();
    console.log("..getEducation");
    var query = conn.query('SELECT * FROM education', function (err,result) {
        if (err) {
            defer.reject(err);
        } else {
            defer.resolve(result);
        }
    });
    return defer.promise;
}

function getGoals() {
    var defer = q.defer();
    console.log("..getAbout");
    var query = conn.query('SELECT * FROM about', function (err,result) {
        if (err) {
            defer.reject(err);
        } else {
            defer.resolve(result);
        }
    });
    return defer.promise;
}