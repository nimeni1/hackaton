import 'package:flutter/material.dart';

class Badge {
  Id iId;
  List<int> minValues;
  String iconUrl;
  String name;
  String description;
  int type;
  int maxLevel;
  int valueType;
  int activePeriodInDays;
  CreatedAt createdAt;
  int iV;

  Badge(
      {this.iId,
        this.minValues,
        this.iconUrl,
        this.name,
        this.description,
        this.type,
        this.maxLevel,
        this.valueType,
        this.activePeriodInDays,
        this.createdAt,
        this.iV});

  Badge.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    minValues = json['minValues'].cast<int>();
    iconUrl = json['iconUrl'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    maxLevel = json['maxLevel'];
    valueType = json['valueType'];
    activePeriodInDays = json['activePeriodInDays'];
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
    data['minValues'] = this.minValues;
    data['iconUrl'] = this.iconUrl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['maxLevel'] = this.maxLevel;
    data['valueType'] = this.valueType;
    data['activePeriodInDays'] = this.activePeriodInDays;
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