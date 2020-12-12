import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DatabaseConnection {
  Db db = new Db.pool([
    'mongodb://admin:0KTtW71vyL9LQIyU@cluster1-shard-00-00.9gvtr.mongodb.net:27017/jira?ssl=true&replicaSet=atlas-zdopln-shard-00&authSource=admin&retryWrites=true&w=majority',
    'mongodb://admin:0KTtW71vyL9LQIyU@cluster1-shard-00-01.9gvtr.mongodb.net:27017/jira?ssl=true&replicaSet=atlas-zdopln-shard-00&authSource=admin&retryWrites=true&w=majority',
    'mongodb://admin:0KTtW71vyL9LQIyU@cluster1-shard-00-02.9gvtr.mongodb.net:27017/jira?ssl=true&replicaSet=atlas-zdopln-shard-00&authSource=admin&retryWrites=true&w=majority'
  ]);
  String email;
  String name;

  DatabaseConnection(String email, String name) {
    makeMongoDBConnection();
    this.email = email;
    this.name = name;
  }

  addNewUser() {
    var users = db.collection("users");
    users.insert({'name': this.name, 'email': this.email});
  }

  makeMongoDBConnection() async {
    // await db.open();
    // var members = db.collection('members');
    // await members.find().forEach((v) {
    //   print(v);
    // });
    // await db.close();
  }
}
