var q = require("q");
var db = require("../common/database");
var conn = db.getConnection();

function getAllPosts() {
    var defer = q.defer();
    console.log(".. getAllPosts");
    var query = conn.query('SELECT * FROM posts', function (err, result) {
        if (err) {
            defer.reject(err);
        } else {
            defer.resolve(result);
        }
    });
    return defer.promise;
};

function addPost(post) {
    if (post) {
        var defer = q.defer();
        console.log(".. addPost");
        post = {
            title: post.title,
            author: post.author,
            content: post.content,
            created_at: new Date(),
            updated_at: new Date()
        };
        var query = conn.query('INSERT INTO posts SET ?', post, function (err, result) {
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
};

function getPostById(id) {
    var defer = q.defer();
    console.log(".. getPostById = " + id);
    var query = conn.query('SELECT * FROM posts WHERE ?', { id: id }, function (err, result) {
        if (err) {
            defer.reject(err);
        } else {
            defer.resolve(result);
        }
    });
    return defer.promise;
};

function updatePost(post) {
    if (post) {
        var defer = q.defer();
        console.log(".. updatePost " + post.id);
        var query = conn.query('UPDATE posts SET title = ?, content = ?, author = ?, updated_at = ? WHERE id = ?',
            [post.title, post.content, post.author, new Date(), post.id],
            function (err, result) {
                if (err) {
                    defer.reject(err);
                } else {
                    defer.resolve(result);
                }
            });
        return defer.promise;
    }
    return false;
};

function deletePost(id) {
    if (id) {
        var defer = q.defer();
        console.log(".. deletePost " + id);
        var query = conn.query('DELETE FROM posts WHERE id = ?', [id], function (err, result) {
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
    getAllPosts: getAllPosts,
    addPost: addPost,
    getPostById: getPostById,
    updatePost: updatePost,
    deletePost: deletePost
};