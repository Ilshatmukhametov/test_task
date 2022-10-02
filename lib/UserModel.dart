// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.kind,
    required this.data,
  });

  String kind;
  WelcomeData data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    kind: json["kind"],
    data: WelcomeData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "data": data.toJson(),
  };
}

class WelcomeData {
  WelcomeData({
    required this.children,
  });

  List<Child> children;

  factory WelcomeData.fromJson(Map<String, dynamic> json) => WelcomeData(
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    required this.kind,
    required this.data,
  });

  String kind;
  ChildData data;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    kind: json["kind"],
    data: ChildData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "data": data.toJson(),
  };
}

class ChildData {
  ChildData({
    required this.title,
    required this.thumbnail,
    required this.ups,
    required this.selftext,
  });

  String title;
  String thumbnail;
  int ups;
  String selftext;

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
    title: json["title"],
    thumbnail: json["thumbnail"],
    ups: json["ups"],
    selftext: json["selftext"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumbnail": thumbnail,
    "ups": ups,
    "selftext": selftext,
  };
}
