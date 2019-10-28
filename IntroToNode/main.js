var faker = require("faker");
var mysql = require("mysql");


var connection = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "password",
    database : "join_us"
});

// For creating the connection
connection.connect(function(err){
    if(err) throw err;
    console.log("Connection Established ...");
});

// To drop the previously created table

var q = "DROP TABLE IF EXISTS users";

connection.query(q, function(err, results, fields){
    if(err) throw err;
    console.log("Previous Table Dropped...");
});


// To again create the table
var q = "CREATE TABLE users(email VARCHAR(255) PRIMARY KEY,\
    created_at TIMESTAMP DEFAULT NOW())";

connection.query(q, function(err, results, fields){
    if(err) throw err;
    console.log("Table Created ...");
});


// My Solution
// var email;
// var q;
// for(var i = 0; i< 500; i++){
//     email = faker.internet.email();
//     q = "INSERT INTO users(email) VALUES ";
//     q = q + "('" + email + "');";

//     connection.query(q, function(err, results, fields){
//         if(err) throw err;
//     });
//     console.log("user", i, "added ...");
// }


//Better Solution

// var data = {
//     email : faker.internet.email()
// };

// connection.query(
//     "INSERT INTO users SET ?", 
//     data,
//     function(err, results, fields){
//         if(err) throw err;
//     }
// );




// Populating the table
var data;
for(var i = 0; i<500; i++){
    data = {email : faker.internet.email(),
        created_at : faker.date.past()};

    connection.query(
        "INSERT INTO users SET ?", 
        data,
        function(err, results, fields){
            if(err) throw err;
        }
    );

    console.log("User", i, "added...");
}




//Excercise in schema section



connection.end();


// NOTE : 
// the format of 
