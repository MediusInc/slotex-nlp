db.auth(admin, 
        toor123);

db.adminCommand('listDatabases')
db = db.getSiblingDB(medius_nlp);

db.createUser(
   {
     user: toor123,
     pwd: admin,
     roles:
       [
         { role: "readWrite", db: medius_nlp}, 
         "userAdmin"
       ]
   }
);

db.getcollectionNames();
