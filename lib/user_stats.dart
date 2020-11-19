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
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView.separated(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      child: RoundedButton(
                          press:() { FutureBuilder(
                              future: showPopup(context, _popupBody(), 'Add a mood'));},
                          text: 'Add mood'),
                    ),
                    Align(
                      child: Container(
                        width: 200,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            child: Container(
                              width: 200,
                              child: GestureDetector(
                                  child: MyItems(Icons.mood, "Current Mood", 0xffed622b),
                                  onTap:  () { showAlertDialog(context, "Happy, happy!");}
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        width: 200,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            child: Container(
                              width: 200,
                              child: GestureDetector(
                                  child: MyItems(Icons.score, "Score", 0xffed622b),
                                  onTap:  () { showAlertDialog(context, "Your score is 60, keep it up!");}
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        width: 200,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            child: Container(
                              width: 200,
                              child: GestureDetector(
                                  child: MyItems(Icons.question_answer, "Issues closed", 0xffed622b),
                                  onTap: () { showAlertDialog(context, "You have 3 open issues");}
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        width: 200,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            child: Container(
                              width: 200,
                              child: GestureDetector(
                                  child: MyItems(Icons.fitness_center, "Google fit", 0xffed622b),
                                  onTap:() { showAlertDialog(context, "Only 30 fit points? You should exercise more often!");}
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              )
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
            height: 10,
            );
      },
        )
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
    return Column(
      children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.person),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Name",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.mood),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Mood",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.description),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Description",
            ),
          ),
        ),
        const Divider(
          height: 1.0,
        ),
        new ListTile(
          leading: const Icon(Icons.grade),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: "Grade",
            ),
          ),
        ),
        new Align(
          alignment: Alignment.bottomLeft,
          child:
            new FlatButton(
              child: Text("Add"),
              onPressed: () {
                _handleAddMoodPress();
                Navigator.of(context).pop();
                final snackBar = SnackBar(content: Text('Mood added!'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
            )
        )
      ],
    );
  }

  _handleAddMoodPress()async{
    String url = "https://hackathon20-mdobre.quickbase.com/db/bqzdtnnev";
    String json = '{"title": "Hello"}';
    String endpoint = "https://www.pipelines.quickbase.com/hooks/json-handler/~1s39gio775s";

    Response response =  await post(endpoint, headers: headers, body: json);
  }
}
