var express = require("express");
var router = express.Router();

var user_md = require("../models/user");
var post_md = require("../models/post");
var helper = require("../helpers/helper");

router.use("/post", require(__dirname + "/adminControllers/post"));
router.use("/user", require(__dirname + "/adminControllers/user"));

router.get("/", function (req, res) {
    if (req.session.user) {
        res.render("admin/dashboard", { data: {} });
    } else {
        res.redirect("/admin/signin");
    }
});

router.get("/signup", function (req, res) {
    res.render("signup", { data: {} });
})

router.post("/signup", function (req, res) {
    var user = req.body;

    if (user.password.trim().length < 6) {
        res.render("signup", { data: { error: "Password is too short" } });
        return;
    }

    if (user.repassword != user.password) {
        res.render("signup", { data: { error: "Re-Type Password is not match" } });
        return;
    }

    // Insert to DB
    var password_code = helper.hash_password(req.body.password);

    user = {
        email: user.email,
        password: password_code,
        first_name: user.firstname,
        last_name: user.lastname,
        created_at: new Date(),
        updated_at: new Date()
    };

    var result = user_md.addUser(user);

    result.then(function (data) {
        res.redirect("/admin/signin");
        return;
    }).catch(function (err) {
        res.render("signup", { data: { error: err } });
        return;
    });
});

router.get("/signin", function (req, res) {
    res.render("signin", { data: {} });
    return;
});

router.post("/signin", function (req, res) {
    var params = req.body;
    if (params.email.trim().length == 0) {
        res.render("signin", { data: { error: "Please enter an email" } });
        return;
    } else {
        var data = user_md.getUserByEmail(params.email);
        if (data) {
            data.then(function (users) {
                var user = users[0];
                var status = helper.compare_password(params.password, user.password);
                if (!status) {
                    res.render("signin", { data: { error: "Password Wrong" } });
                    return;
                } else {
                    req.session.user = user;
                    res.redirect("/admin/");
                    return;
                }
            });
        } else {
            res.render("signin", { data: { error: "User not exists" } });
            return;
        }
    }
})

module.exports = router;