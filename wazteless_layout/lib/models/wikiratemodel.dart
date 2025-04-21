// To parse this JSON data, do
//
//     final companies = companiesFromJson(jsonString);

import 'dart:convert';

Companies companiesFromJson(String str) => Companies.fromJson(json.decode(str));

String companiesToJson(Companies data) => json.encode(data.toJson());

class Companies {
  dynamic id;
  String? name;
  TypeElement? type;
  String? url;
  List<Item>? items;
  List<dynamic>? links;
  List<TypeElement>? ancestors;
  String? htmlUrl;
  dynamic createdAt;
  dynamic updatedAt;
  Paging? paging;
  String? requestedAt;
  String? license;

  Companies({
    this.id,
    this.name,
    this.type,
    this.url,
    this.items,
    this.links,
    this.ancestors,
    this.htmlUrl,
    this.createdAt,
    this.updatedAt,
    this.paging,
    this.requestedAt,
    this.license,
  });

  factory Companies.fromJson(Map<String, dynamic> json) => Companies(
        id: json["id"],
        name: json["name"],
        type: json["type"] == null ? null : TypeElement.fromJson(json["type"]),
        url: json["url"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        links: json["links"] == null
            ? []
            : List<dynamic>.from(json["links"]!.map((x) => x)),
        ancestors: json["ancestors"] == null
            ? []
            : List<TypeElement>.from(
                json["ancestors"]!.map((x) => TypeElement.fromJson(x))),
        htmlUrl: json["html_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
        requestedAt: json["requested_at"],
        license: json["license"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type?.toJson(),
        "url": url,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x)),
        "ancestors": ancestors == null
            ? []
            : List<dynamic>.from(ancestors!.map((x) => x.toJson())),
        "html_url": htmlUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "paging": paging?.toJson(),
        "requested_at": requestedAt,
        "license": license,
      };
}

class TypeElement {
  int? id;
  String? name;
  String? type;
  String? url;
  String? codename;

  TypeElement({
    this.id,
    this.name,
    this.type,
    this.url,
    this.codename,
  });

  factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        url: json["url"],
        codename: json["codename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "url": url,
        "codename": codename,
      };
}

class Item {
  int? id;
  String? name;
  TypeEnum? type;
  String? url;
  String? content;
  String? metric;
  String? company;
  int? year;
  String? value;
  String? comments;
  String? answerUrl;

  Item({
    this.id,
    this.name,
    this.type,
    this.url,
    this.content,
    this.metric,
    this.company,
    this.year,
    this.value,
    this.comments,
    this.answerUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        type: typeEnumValues.map[json["type"]]!,
        url: json["url"],
        content: json["content"],
        metric: json["metric"],
        company: json["company"],
        year: json["year"],
        value: json["value"],
        comments: json["comments"],
        answerUrl: json["answer_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": typeEnumValues.reverse[type],
        "url": url,
        "content": content,
        "metric": metric,
        "company": company,
        "year": year,
        "value": value,
        "comments": comments,
        "answer_url": answerUrl,
      };
}

enum TypeEnum { ANSWER }

final typeEnumValues = EnumValues({"Answer": TypeEnum.ANSWER});

class Paging {
  String? next;

  Paging({
    this.next,
  });

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
