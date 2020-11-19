import 'package:flutter/material.dart';

class Quest {
  Id iId;
  String name;
  String description;
  String creatorID;
  String team;
  String image;
  int boardID;
  CreatedAt createdAt;
  int iV;

  Quest(
      {this.iId,
        this.name,
        this.description,
        this.creatorID,
        this.team,
        this.image,
        this.boardID,
        this.createdAt,
        this.iV});

  Quest.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    name = json['name'];
    description = json['description'];
    creatorID = json['creatorID'];
    team = json['team'];
    image = json['image'];
    boardID = json['boardID'];
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
    data['name'] = this.name;
    data['description'] = this.description;
    data['creatorID'] = this.creatorID;
    data['team'] = this.team;
    data['image'] = this.image;
    data['boardID'] = this.boardID;
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