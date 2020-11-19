import 'package:flutter/material.dart';

class BadgeClaim {
  Id iId;
  String memberID;
  Id badgeID;
  int level;
  CreatedAt createdAt;
  int iV;

  BadgeClaim(
      {this.iId,
        this.memberID,
        this.badgeID,
        this.level,
        this.createdAt,
        this.iV});

  BadgeClaim.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    memberID = json['memberID'];
    badgeID = json['badgeID'] != null ? new Id.fromJson(json['badgeID']) : null;
    level = json['level'];
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
    if (this.badgeID != null) {
      data['badgeID'] = this.badgeID.toJson();
    }
    data['level'] = this.level;
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