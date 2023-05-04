// To parse this JSON data, do
//
//     final research = researchFromJson(jsonString);

import 'dart:convert';

class Research {
  final String name;
  final String author;
  final String url;

  Research({
    required this.name,
    required this.author,
    required this.url,
  });

  Research copyWith({
    String? name,
    String? author,
    String? url,
  }) =>
      Research(
        name: name ?? this.name,
        author: author ?? this.author,
        url: url ?? this.url,
      );

  factory Research.fromRawJson(String str) => Research.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Research.fromJson(Map<String, dynamic> json) => Research(
        name: json["name"],
        author: json["author"],
        url: json["url"],
      );

  List<Research> fromJsonList(String rawData) {
    return (json.decode(rawData) as List<Map<String, dynamic>>)
        .map(
          (e) => Research.fromJson(e),
        )
        .toList();
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "url": url,
      };
}
