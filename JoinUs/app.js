var express = require("express");
var app = express();
var mysql = require("mysql");
var bodyParser = require("body-parser");


app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended : true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "phoenix",
    database : "join_us"
});


connection.connect(function(err){
    if(err) throw err;
    console.log("Connection Established...");
});

 

app.get("/dummy", function(req, res){
    var joke = "A labracadabrador";
    res.send(joke);
});


app.get("/", function(req, res){
    var q = "SELECT COUNT(*) AS total FROM users;";

    connection.query(q, function(err, results, fields){
        if(err) throw err;
        console.log("Data retrieved...");
        var count = results[0].total;
        res.render("home", {count : count});
    });
});


app.post("/register", function(req, res){
    var data = {email : req.body.email};
    connection.query("INSERT INTO users SET ?",
        data,
        function(err, results, fields){
            if(err) throw err;
            console.log("New email Added Successfully...");
            res.redirect("/");
        })
});


app.listen(8080, function(){
    console.log("Server running in 8080");
});
