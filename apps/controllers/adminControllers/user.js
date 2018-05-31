var express = require("express");
var router = express.Router();

var user_md = require("../../models/user");
var helper = require("../../helpers/helper");

router.get("/", function(req, res) {
    var data = user_md.getAllUser();
    data.then(function(users) {
        var data = {
            users: users,
            error: false
        };
        res.render("admin/user/all", {data: data});
    }).catch( function(err) {
        res.render("admin/user/all", {data: {error: "Could not get all user"}});
    });
});

module.exports = router;