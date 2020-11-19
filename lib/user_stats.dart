import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';

import 'package:hackaton/widgets/rounded_button.dart';
import 'package:hackaton/constants.dart';
import 'package:hackaton/widgets/popup_content.dart';
import 'package:hackaton/widgets/popup_layout.dart';
import 'package:hackaton/database_connection.dart';

import 'package:hackaton/models/badge.dart';
import 'package:hackaton/models/badgeclaim.dart';
import 'package:hackaton/models/member.dart';
import 'package:hackaton/models/mood.dart';
import 'package:hackaton/models/issue.dart';
import 'package:hackaton/models/quest.dart';
import 'package:hackaton/models/goal.dart';
import 'package:hackaton/models/googleuser.dart';


class UserStats extends StatefulWidget{
  @override
  _UserStatsState createState() => _UserStatsState();
}

class _UserStatsState extends State<UserStats>{
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



  makeQuickBaseConnection() async{
    String url = "https://hackathon20-mdobre.quickbase.com/db/bqzdtnnev";
    String json = '{"title": "Hello"}';
    String endpoint = "https://www.pipelines.quickbase.com/hooks/json-handler/~1s39gio775s";

    Response response =  await post(endpoint, headers: headers, body: json);
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
    DatabaseConnection();
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
                    future: showPopup(context, _popupBody(), 'Add a mood'));},
                text: 'Add mood'),
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

  showPopup(BuildContext context, Widget widget, String title,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 30,
        left: 30,
        right: 30,
        bottom: 50,
        child: PopupContent(
          content: Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
              brightness: Brightness.light,
            ),
            resizeToAvoidBottomPadding: false,
            body: widget,
          ),
        ),
      ),
    );
  }

  Widget _popupBody() {
    return Container(
      child: Text('This is a popup window'),
    );
  }


}
