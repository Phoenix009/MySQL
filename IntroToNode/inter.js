var faker = require("faker");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "phoenix",
    database : "join_us"
});


connection.connect(function(err){
    if(err) throw err;
    console.log("Connection Established...");
})


var q = "DROP TABLE IF EXISTS users";

connection.query(q, function(err, results, fields){
    if(err) throw err;
    console.log("Previous Table Dropped...");
})


var q = "CREATE TABLE users(email VARCHAR(255) PRIMARY KEY,\
    created_at TIMESTAMP DEFAULT NOW())";

connection.query(q, function(err, results, fields){
    if(err) throw err;
    console.log("Table Created ...");
})


var q = "INSERT INTO users(email)\
VALUES(\"jaideepmore307@gmail.com\");";

connection.query(q, function(err, results, fields){
    if(err) throw err;
    console.log("Sample added ...");
})


var q = "SELECT * FROM users";

connection.query(q, function(err, results, fields){
    if(err) throw err;
    console.log(results);
})


connection.end();
