import 'package:flutter/material.dart';

class GoogleUser {
  Id iId;
  int healthPoints;
  int steps;
  String userID;
  String accessToken;
  CreatedAt createdAt;
  int iV;

  GoogleUser(
      {this.iId,
        this.healthPoints,
        this.steps,
        this.userID,
        this.accessToken,
        this.createdAt,
        this.iV});

  GoogleUser.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    healthPoints = json['healthPoints'];
    steps = json['steps'];
    userID = json['userID'];
    accessToken = json['accessToken'];
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
    data['healthPoints'] = this.healthPoints;
    data['steps'] = this.steps;
    data['userID'] = this.userID;
    data['accessToken'] = this.accessToken;
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