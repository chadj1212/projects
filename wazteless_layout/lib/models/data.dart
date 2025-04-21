// To parse this JSON data, do
//
//     final companies = companiesFromJson(jsonString);

import 'dart:convert';

List<Companies> companiesFromJson(String str) =>
    List<Companies>.from(json.decode(str).map((x) => Companies.fromJson(x)));

String companiesToJson(List<Companies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Companies {
  String? brandName;
  List<String>? products;
  int? esgScore;
  EsgGrade? esgGrade;
  String? brandInfo;
  List<RecentEsgNew>? recentEsgNews;

  Companies({
    this.brandName,
    this.products,
    this.esgScore,
    this.esgGrade,
    this.brandInfo,
    this.recentEsgNews,
  });

  factory Companies.fromJson(Map<String, dynamic> json) => Companies(
        brandName: json["brand_name"],
        products: json["products"] == null
            ? []
            : List<String>.from(json["products"]!.map((x) => x)),
        esgScore: json["esg_score"],
        esgGrade: esgGradeValues.map[json["esg_grade"]]!,
        brandInfo: json["brand_info"],
        recentEsgNews: json["recent_esg_news"] == null
            ? []
            : List<RecentEsgNew>.from(
                json["recent_esg_news"]!.map((x) => RecentEsgNew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "esg_score": esgScore,
        "esg_grade": esgGradeValues.reverse[esgGrade],
        "brand_info": brandInfo,
        "recent_esg_news": recentEsgNews == null
            ? []
            : List<dynamic>.from(recentEsgNews!.map((x) => x.toJson())),
      };
}

enum EsgGrade { A, BBB }

final esgGradeValues = EnumValues({"A": EsgGrade.A, "BBB": EsgGrade.BBB});

class RecentEsgNew {
  String? title;
  DateTime? date;
  String? source;
  String? summary;

  RecentEsgNew({
    this.title,
    this.date,
    this.source,
    this.summary,
  });

  factory RecentEsgNew.fromJson(Map<String, dynamic> json) => RecentEsgNew(
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        source: json["source"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "source": source,
        "summary": summary,
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

class DataItem {
  String? name;
  String? category;
  String? details;
  String? additionalInfo;

  DataItem({
    this.name,
    this.category,
    this.details,
    this.additionalInfo,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
        name: json["name"],
        category: json["category"],
        details: json["details"],
        additionalInfo: json["additional_info"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "details": details,
        "additional_info": additionalInfo,
      };
}
