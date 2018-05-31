var express = require("express");
var router = express.Router();

var post_md = require("../../models/post");
var helper = require("../../helpers/helper");

router.get("/", function (req, res) {
    if (req.session.user) {
        var data = post_md.getAllPosts();
        data.then(function (posts) {
            var data = {
                posts: posts,
                error: false
            };
            res.render("admin/post/all", { data: data });
        }).catch(function (err) {
            res.render("admin/post/all", { data: { error: "Get Posts data is Error" } });
        });
    } else {
        res.redirect("/admin/signin");
    }
});

router.get("/new", function (req, res) {
    if (req.session.user) {
        res.render("admin/post/new", { data: { error: false } });
    } else {
        res.redirect("/admin/signin");
    }
});

router.post("/new", function (req, res) {
    var post = req.body;
    if (post.title.trim().length == 0) {
        var data = {
            error: "Please enter a title"
        };
        res.render("admin/post/new", { data: data });
        return;
    };

    // Insert to DB
    var result = post_md.addPost(post);

    result.then(function (data) {
        res.redirect("/admin/post");
        return;
    }).catch(function (err) {
        res.render("admin/post/new", { data: { error: err } });
        return;
    });
});

router.get("/edit/:id", function (req, res) {
    if (req.session.user) {
        var params = req.params;
        var id = params.id;
        var data = post_md.getPostById(id);
        if (data) {
            data.then(function (posts) {
                var post = posts[0];
                var data = {
                    post: post,
                    error: false
                };
                res.render("admin/post/edit", { data: data });
            }).catch(function (err) {
                var data = {
                    error: "Could not get Post by Id"
                };
                res.render("/admin/post/edit", { data: data });
            });
        } else {
            var data = {
                error: "Could not get Post by Id"
            };
            res.render("/admin/post/edit", { data: data });
        }
    } else {
        res.redirect("/admin/signin");
    }
});

router.put("/edit", function (req, res) {
    var params = req.body;
    var data = post_md.updatePost(params);
    if (!data) {
        res.json({ status_code: 500 });
    } else {
        data.then(function (result) {
            res.json({ status_code: 200 });
        }).catch(function (err) {
            res.json({ status_code: 500 });
        })
    }
});

router.delete("/delete", function (req, res) {
    var post_id = req.body.id;
    var data = post_md.deletePost(post_id);
    if (!data) {
        res.json({ status_code: 500 });
    } else {
        data.then(function (result) {
            res.json({ status_code: 200 });
        }).catch(function (err) {
            res.json({ status_code: 500 });
        })
    }
})

module.exports = router;