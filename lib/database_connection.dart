import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DatabaseConnection{
  DatabaseConnection(){
    makeMongoDBConnection();
}

  makeMongoDBConnection() async{
    // await db.open();
    // var members = db.collection('members');
    // await members.find().forEach((v) {
    //   print(v);
    // });
    // await db.close();
  }
}
