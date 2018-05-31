var q = require("q");
var db = require("../common/database");
var conn = db.getConnection();

function addUser(user) {
    if (user) {
        var defer = q.defer();
        console.log(".. addUser");
        var query = conn.query('INSERT INTO users SET ?', user, function (err, result) {
            if (err) {
                defer.reject(err);
            } else {
                defer.resolve(result);
            }
        });
        console.log(query.sql);
        return defer.promise;
    }
    return false;
}

function getUserByEmail(email) {
    if (email) {
        var defer = q.defer();
        console.log(".. getUserByEmail " + email);
        var query = conn.query('SELECT * FROM users WHERE ?', { email: email }, function (err, result) {
            if (err) {
                defer.reject(err);
            } else {
                defer.resolve(result);
            }
        });
        return defer.promise;
    }
    return false;
}

function getAllUser() {
    var defer = q.defer();
    console.log(".. getAllUser ");
    var query = conn.query('SELECT * FROM users', function (err, result) {
        if (err) {
            defer.reject(err);
        } else {
            defer.resolve(result);
        }
    });
    return defer.promise;
}

function deleteUser(id) {
    if (id) {
        var defer = q.defer();
        console.log(".. deleteUser " + id);
        var query = conn.query('DELETE FROM users WHERE id = ?', [id], function (err, result) {
            if (err) {
                defer.reject(err);
            } else {
                defer.resolve(result);
            }
        });
        return defer.promise;
    }
    return false;
}

module.exports = {
    getAllUser: getAllUser,
    addUser: addUser,
    getUserByEmail: getUserByEmail,
    deleteUser: deleteUser
}