import 'package:flutter/material.dart';
import 'package:hackaton/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:hackaton/widgets/rounded_button.dart';


class UserStats extends StatelessWidget{
  //quickbase headers
  static String token = 'b5sve5_pes5_ceh7dvmdzui7t8d3gbgnksjzgz4';
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json", // or whatever
    HttpHeaders.authorizationHeader: "QB-USER-TOKEN ${token}",
    "QUICKBASE-ACTION": "API_AddField"
  };

  //mongodb connection
  var db = Db('mongodb+srv://admin:0KTtW71vyL9LQIyU@cluster1.9gvtr.mongodb.net/jira?retryWrites=true&w=majority');

  makeMongoDBConnection() async{
    // await db.open();
    // await db.drop();
  }

  makePostRequest() async{
    String url = "https://hackathon20-mdobre.quickbase.com/db/bqzdtnnev";
    String json = '{"title": "Hello"}';
    // Response response =  await post(url, headers: headers);
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

  SnackBar snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(label: 'Undo', onPressed: () {
  // Some code to undo the change.
  },
  ),
  );

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
        body:StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
          children: <Widget>[
            RoundedButton(
              press:() { showAlertDialog(context, "Happy, happy!");},
              text: 'Mongodb'),
            RoundedButton(
                press:(){ FutureBuilder(
                    future: makePostRequest());},
                text: 'QuickBase'),
            GestureDetector(
              child: MyItems(Icons.mood, "Current Mood", 0xffed622b),
              onTap:  () { showAlertDialog(context, "Happy, happy!");}
            ),
            GestureDetector(
              child: MyItems(Icons.score, "Score", 0xffed622b),
                onTap:  () { Scaffold.of(context).showSnackBar(snackBar);}
            ),
            GestureDetector(
              child: MyItems(Icons.question_answer, "Issues closed", 0xffed622b),
                onTap: () { showAlertDialog(context, "Happy, happy!");}
            ),
            GestureDetector(
              child: MyItems(Icons.fitness_center, "Google fit", 0xffed622b),
                onTap:() { showAlertDialog(context, "Happy, happy!");}
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 130),
            StaggeredTile.extent(2, 130),
            StaggeredTile.extent(1, 130),
            StaggeredTile.extent(1, 130),
            StaggeredTile.extent(1, 130),
            StaggeredTile.extent(1, 130)
          ],
        )
    );
  }

  makeMoodAlert(context){
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Mood"),
      content: Text("Happy, happy. Don't be sad! :)"),
      actions: [
        okButton,
      ],
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
