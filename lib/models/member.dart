import 'package:flutter/material.dart';

class Member {
  String sId;
  List<String> teams;
  int score;
  List<BadgeClaimIds> badgeClaimIds;
  CreatedAt createdAt;
  String name;
  String url;
  int iV;

  Member(
      {this.sId,
        this.teams,
        this.score,
        this.badgeClaimIds,
        this.createdAt,
        this.name,
        this.url,
        this.iV});

  Member.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    teams = json['teams'].cast<String>();
    score = json['score'];
    if (json['badgeClaimIds'] != null) {
      badgeClaimIds = new List<BadgeClaimIds>();
      json['badgeClaimIds'].forEach((v) {
        badgeClaimIds.add(new BadgeClaimIds.fromJson(v));
      });
    }
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    name = json['name'];
    url = json['url'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['teams'] = this.teams;
    data['score'] = this.score;
    if (this.badgeClaimIds != null) {
      data['badgeClaimIds'] =
          this.badgeClaimIds.map((v) => v.toJson()).toList();
    }
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt.toJson();
    }
    data['name'] = this.name;
    data['url'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}

class BadgeClaimIds {
  String oid;

  BadgeClaimIds({this.oid});

  BadgeClaimIds.fromJson(Map<String, dynamic> json) {
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