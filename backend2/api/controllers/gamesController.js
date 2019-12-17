'use strict';
var sql = require("mssql");
// config for your database
var config = {
    user: 'oanab',
    password: 'Raducum1h41!',
    server: 'localhost', 
    database: 'Product' 
};

exports.login = function(req, res){

  const enteredUsername = req.body.username;
  const enteredPassword = req.body.password;
  console.log('UserName: ', enteredUsername);
  console.log('Password: ', enteredPassword);
  if (enteredUsername && enteredPassword) {
      var pool = new sqlInstance.ConnectionPool(config);
      pool.connect().then(function(){ 
          // create PreparedStatement object
          const ps = new sqlInstance.PreparedStatement(pool)
          ps.input('username', sqlInstance.VarChar(25));
          ps.input('password', sqlInstance.VarChar(25));
          ps.prepare("SELECT CustomerId FROM Customer WHERE Username=@username AND Password=@password;", err => {
              // ... error checks
              if(err) console.log(err);
              ps.execute({username: enteredUsername,password: enteredPassword}, (err, result) => {
                  // ... error checks
                  if(err) console.log(err);
                  console.log('A USER ID WAS RETURNED: ', result);
                  if (result.recordset[0]==undefined){
                      console.log('NO USER ID WAS RETURNED!');
                      res.json({"response": "username or password is INCORRECT"});
                  }else{
                      const CustomerId = result.recordset[0].CustomerId;
                      console.log(CustomerId);
                      if (CustomerId > 0) {
                          console.log('A USER ID WAS RETURNED: ', CustomerId);
                          res.status(200).json({
                              response: "Logged In",
                              userid: CustomerId
                          });
                      } else {
                          console.log('NO USER ID WAS RETURNED!');
                          res.json({"response": "username or password is INCORRECT"});
                      }
                  }
                  // release the connection after queries are executed
                  ps.unprepare(err => {
                      // ... error checks
                      if(err) console.log(err);
                  })
                  })
          })
      }).catch(function (err) {
          console.log(err);
      });      
  } else {
      res.json({"response": "username or password is INCORRECT"});
  }

}


exports.list_all_games = function (req, res) {
  sqlInstance.connect(config, function (err) {
      if (err) console.log(err);
      // create Request object
      var request = new sqlInstance.Request();
      // query to the database and get the products
      request.query('SELECT * FROM [Product].[dbo].[Product]', function (err, games) {
          if (err) console.log(err);
          // send records as a response
          // console.log(products);
          res.status(200).json({
              games: games
          });
      }); 
  });
};


exports.create_a_game = function(req, res) {

  // sql.connect(config, function (err) {
  //   if (err) console.log(err);

  //   // create Request object
  //   var request = new sql.Request();
       
  //   // query to the database and get the records
  //   request.query('insert into [Product].[dbo].[Product] values'+ req.body, function (err, recordset) {
  //       if (err) console.log(err);
  //       // send records as a response
  //       console.log("1 record inserted");
  //   });
  // });
};


exports.see_a_game = function(req, res) {
  
};


exports.update_a_game = function(req, res) {
 
};


exports.delete_a_game = function(req, res) {
  
};


exports.register_a_customer = function(req, res) {
  
};


exports.get_a_customer = function(req, res) {
  
};