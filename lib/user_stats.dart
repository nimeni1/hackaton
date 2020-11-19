import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:hackaton/widgets/rounded_button.dart';
import 'package:hackaton/constants.dart';

import 'package:hackaton/models/badge.dart';
import 'package:hackaton/models/badgeclaim.dart';
import 'package:hackaton/models/member.dart';
import 'package:hackaton/models/mood.dart';
import 'package:hackaton/models/issue.dart';
import 'package:hackaton/models/quest.dart';
import 'package:hackaton/models/goal.dart';
import 'package:hackaton/models/googleuser.dart';


class UserStats extends StatelessWidget{
  //quickbase headers
  static String token = 'b5sve5_pes5_ceh7dvmdzui7t8d3gbgnksjzgz4';
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json", // or whatever
    HttpHeaders.authorizationHeader: "QB-USER-TOKEN ${token}",
    "QUICKBASE-ACTION": "API_AddField"
  };

  //mongodb connection
  Db db = new Db.pool([
    'mongodb://admin:0KTtW71vyL9LQIyU@cluster1-shard-00-00.9gvtr.mongodb.net:27017/jira?ssl=true&replicaSet=atlas-zdopln-shard-00&authSource=admin&retryWrites=true&w=majority',
    'mongodb://admin:0KTtW71vyL9LQIyU@cluster1-shard-00-01.9gvtr.mongodb.net:27017/jira?ssl=true&replicaSet=atlas-zdopln-shard-00&authSource=admin&retryWrites=true&w=majority',
    'mongodb://admin:0KTtW71vyL9LQIyU@cluster1-shard-00-02.9gvtr.mongodb.net:27017/jira?ssl=true&replicaSet=atlas-zdopln-shard-00&authSource=admin&retryWrites=true&w=majority'
  ]);

  makeMongoDBConnection() async{
    // await db.open();
    // var members = db.collection('members');
    // await members.find().forEach((v) {
    //   print(v);
    // });
    // await db.close();
  }

  makeQuickBaseConnection() async{
    String url = "https://hackathon20-mdobre.quickbase.com/db/bqzdtnnev";
    String json = '{"title": "Hello"}';
    String endpoint = "https://www.pipelines.quickbase.com/hooks/json-handler/~1s39gio775s";

    Response response =  await post(endpoint, headers: headers, body: json);
  }

  makeMongoDBRequest() async{
    // var users = db.collection('members');
    // await users.find().forEach((element) {print(element);});
  }

  Material MyItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //text
                    Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            heading,
                            style: TextStyle(
                                color: new Color(color),
                                fontSize: 20.0
                            ),
                          ),
                        )
                    ),
                    //icon
                    Material(
                        color: new Color(color),
                        borderRadius: BorderRadius.circular(24.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(icon,
                              color: Colors.white,
                              size: 30),

                        )
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    makeMongoDBConnection();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text('User stats',
                style: TextStyle(
                    color: Colors.white
                ))
        ),
      body: ListView(
        children: [
          Align(
            child: RoundedButton(
                press:() { FutureBuilder(
                    future: showAlertDialog(context, "Connection to database is established"));},
                text: 'Mongodb'),
          ),
          Align(
            child: RoundedButton(
                press:(){ FutureBuilder(
                    future: showAlertDialog(context, "Connection to Quickbase is established"));},
                text: 'QuickBase'),
          ),
          GestureDetector(
              child: MyItems(Icons.mood, "Current Mood", 0xffed622b),
              onTap:  () { showAlertDialog(context, "Happy, happy!");}
          ),
          GestureDetector(
              child: MyItems(Icons.score, "Score", 0xffed622b),
              onTap:  () { showAlertDialog(context, "Your score is 60, keep it up!");}
          ),
          GestureDetector(
              child: MyItems(Icons.question_answer, "Issues closed", 0xffed622b),
              onTap: () { showAlertDialog(context, "You have 3 open issues");}
          ),
          GestureDetector(
              child: MyItems(Icons.fitness_center, "Google fit", 0xffed622b),
              onTap:() { showAlertDialog(context, "Only 30 fit points? You should exercise more often!");}
          ),
        ],
      )
    );
  }

  showAlertDialog(BuildContext context, String message) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notification"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
