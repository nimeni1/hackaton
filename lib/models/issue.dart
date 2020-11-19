import 'package:flutter/material.dart';

class Issue {
  Id iId;
  String memberID;
  String projectID;
  String teamID;
  String issueID;
  int points;
  int status;
  CreatedAt createdAt;
  int iV;

  Issue(
      {this.iId,
        this.memberID,
        this.projectID,
        this.teamID,
        this.issueID,
        this.points,
        this.status,
        this.createdAt,
        this.iV});

  Issue.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    memberID = json['memberID'];
    projectID = json['projectID'];
    teamID = json['teamID'];
    issueID = json['issueID'];
    points = json['points'];
    status = json['status'];
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
    data['memberID'] = this.memberID;
    data['projectID'] = this.projectID;
    data['teamID'] = this.teamID;
    data['issueID'] = this.issueID;
    data['points'] = this.points;
    data['status'] = this.status;
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