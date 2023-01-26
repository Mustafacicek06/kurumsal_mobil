// To parse this JSON data, do
//
//     final itRequest = itRequestFromJson(jsonString);

import 'dart:convert';

List<ItRequest> itRequestFromJson(String str) =>
    List<ItRequest>.from(json.decode(str).map((x) => ItRequest.fromJson(x)));

String itRequestToJson(List<ItRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItRequest {
  ItRequest({
    this.userID,
    this.requestDate,
    this.accessType,
    this.accessShape,
    this.systemName,
    this.description,
  });
  final String? userID;
  final String? requestDate;
  final AccessType? accessType;
  final AccessShape? accessShape;
  final String? systemName;
  final String? description;

  factory ItRequest.fromJson(Map<String, dynamic> json) => ItRequest(
        userID: json["userID"],
        requestDate: json["requestDate"],
        accessType: json["accessType"] == null
            ? null
            : AccessType.fromJson(json["accessType"]),
        accessShape: json["accessShape"] == null
            ? null
            : AccessShape.fromJson(json["accessShape"]),
        systemName: json["systemName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userID,
        "requestDate": requestDate,
        "accessType": accessType?.toJson(),
        "accessShape": accessShape?.toJson(),
        "systemName": systemName,
        "description": description,
      };
}

class AccessShape {
  AccessShape({
    this.read,
    this.write,
    this.change,
  });

  final bool? read;
  final bool? write;
  final bool? change;

  factory AccessShape.fromJson(Map<String, dynamic> json) => AccessShape(
        read: json["read"],
        write: json["write"],
        change: json["change"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
        "write": write,
        "change": change,
      };
}

class AccessType {
  AccessType({
    this.dataBase,
    this.server,
    this.table,
  });

  final bool? dataBase;
  final bool? server;
  final bool? table;

  factory AccessType.fromJson(Map<String, dynamic> json) => AccessType(
        dataBase: json["dataBase"],
        server: json["server"],
        table: json["table"],
      );

  Map<String, dynamic> toJson() => {
        "dataBase": dataBase,
        "server": server,
        "table": table,
      };
}
