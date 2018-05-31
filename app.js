var express = require("express");
var config = require("config");
var bodyParser = require("body-parser");
var session = require("express-session");

var app = express();

// body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// express-session
app.set('trust proxy', 1); // trust first proxy
app.use(session({
    secret: config.get("secret_key"),
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));

// setup ejs
app.set("views", __dirname + "/apps/views");
app.set("view engine", "ejs");

// định dạng ngày tháng
var moment = require('moment');
app.locals.moment = require('moment');

// static folder
app.use("/static", express.static(__dirname + "/public"));

// import request-promise
const request = require('request-promise');

// tạo router tại controller và include vào app.js
var controllers = require(__dirname + "/apps/controllers");

app.use(controllers);

var host = config.get("server.host");
var port = config.get("server.port");

app.listen(port, host, function(){
    console.log("Server is running on " + `${host}` + ':' + port);
});