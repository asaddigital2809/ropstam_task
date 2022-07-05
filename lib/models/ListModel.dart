import 'dart:convert';
ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));
String listModelToJson(ListModel data) => json.encode(data.toJson());
class ListModel {
  ListModel({
      this.userId, 
      this.id, 
      this.title, 
      this.body,});

  ListModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}