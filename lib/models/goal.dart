import 'package:flutter/material.dart';

class Goal {
  Id iId;
  String title;
  String reward;
  String team;
  String memberID;
  String image;
  EndDate endDate;
  EndDate startDate;
  int score;
  EndDate createdAt;
  int iV;

  Goal(
      {this.iId,
        this.title,
        this.reward,
        this.team,
        this.memberID,
        this.image,
        this.endDate,
        this.startDate,
        this.score,
        this.createdAt,
        this.iV});

  Goal.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    title = json['title'];
    reward = json['reward'];
    team = json['team'];
    memberID = json['memberID'];
    image = json['image'];
    endDate =
    json['endDate'] != null ? new EndDate.fromJson(json['endDate']) : null;
    startDate = json['startDate'] != null
        ? new EndDate.fromJson(json['startDate'])
        : null;
    score = json['score'];
    createdAt = json['createdAt'] != null
        ? new EndDate.fromJson(json['createdAt'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['title'] = this.title;
    data['reward'] = this.reward;
    data['team'] = this.team;
    data['memberID'] = this.memberID;
    data['image'] = this.image;
    if (this.endDate != null) {
      data['endDate'] = this.endDate.toJson();
    }
    if (this.startDate != null) {
      data['startDate'] = this.startDate.toJson();
    }
    data['score'] = this.score;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class EndDate {
  String date;

  EndDate({this.date});

  EndDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}