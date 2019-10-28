// var faker = require("faker");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "password",
    database : "join_us" 
});


connection.connect(function(error){
    if (error) throw error;
    console.log("!! Connection Established !!");
});


// var q = "SELECT CURDATE() AS 'answer'";
// connection.query(q, function(error, results, fields){
//     if(error) throw error;
//     console.log(results);
//     console.log(results[0]);
//     console.log(results[0].answer);
// });

// The result will be an list of the dictionaries.
// each row has a single dictionary
// where the keys are the column names 
// and the values are the actual values for corresponding columns


// q = "SELECT CURDATE() AS 'date', CURTIME() AS 'time'";
// connection.query(q, function(error, results, fields){
//     if(error) throw error;
//     console.log(results[0].date, results[0].time);
// });



connection.end();
