// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
      required this.entries,
    });

    final List<Entry>? entries;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        entries: json["entries"] == null ? [] : List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "entries": List<dynamic>.from(entries!.map((x) => x.toJson())),
    };
}

class Entry {
    Entry({
      required this.api,
      required this.description,
      required this.auth,
      required this.cors,
      required this.link,
      required this.category,
    });

    final String? api;
    final String? description;
    final String? auth;
    final String? cors;
    final String? link;
    final String? category;

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"] ?? '',
        description: json["Description"] ?? '',
        auth: json["Auth"] ?? '',
        cors: json["Cors"] ?? '',
        link: json["Link"] ?? '',
        category: json["Category"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "API": api!,
        "Description": description!,
        "Auth": auth!,
        "Cors": cors!,
        "Link": link!,
        "Category": category!,
    };
}
