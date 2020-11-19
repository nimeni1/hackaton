import 'package:flutter/material.dart';

class Mood{
  Id iId;
  double grade;
  int smiley;
  String description;
  String team;
  String memberID;
  CreatedAt createdAt;
  int iV;

  Mood(
      {this.iId,
        this.grade,
        this.smiley,
        this.description,
        this.team,
        this.memberID,
        this.createdAt,
        this.iV});

  Mood.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    grade = json['grade'];
    smiley = json['smiley'];
    description = json['description'];
    team = json['team'];
    memberID = json['memberID'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId.toJson();
    }
    data['grade'] = this.grade;
    data['smiley'] = this.smiley;
    data['description'] = this.description;
    data['team'] = this.team;
    data['memberID'] = this.memberID;
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

class CreatedAt {
  String date;

  CreatedAt({this.date});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}