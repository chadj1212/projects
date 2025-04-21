// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

List<ArticleModel> articlesFromJson(String str) => List<ArticleModel>.from(
    json.decode(str).map((x) => ArticleModel.fromJson(x)));

String articlesToJson(List<ArticleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ArticleModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
