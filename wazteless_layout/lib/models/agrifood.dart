// To parse this JSON data, do
//
//     final agriFood = agriFoodFromJson(jsonString);

import 'dart:convert';

List<AgriFood> agriFoodFromJson(String str) =>
    List<AgriFood>.from(json.decode(str).map((x) => AgriFood.fromJson(x)));

String agriFoodToJson(List<AgriFood> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgriFood {
  MemberStateCode? memberStateCode;
  MemberStateName? memberStateName;
  BeginDate? beginDate;
  EndDate? endDate;
  String? price;
  Unit? unit;
  int? weekNumber;
  Category? category;
  String? productCode;

  AgriFood({
    this.memberStateCode,
    this.memberStateName,
    this.beginDate,
    this.endDate,
    this.price,
    this.unit,
    this.weekNumber,
    this.category,
    this.productCode,
  });

  factory AgriFood.fromJson(Map<String, dynamic> json) => AgriFood(
        memberStateCode: json["memberStateCode"] != null
            ? memberStateCodeValues.map[json["memberStateCode"]]
            : null,
        memberStateName: json["memberStateName"] != null
            ? memberStateNameValues.map[json["memberStateName"]]
            : null,
        beginDate: json["beginDate"] != null
            ? beginDateValues.map[json["beginDate"]]
            : null,
        endDate:
            json["endDate"] != null ? endDateValues.map[json["endDate"]] : null,
        price: json["price"],
        unit: json["unit"] != null ? unitValues.map[json["unit"]] : null,
        weekNumber: json["weekNumber"],
        category: json["category"] != null
            ? categoryValues.map[json["category"]]
            : null,
        productCode: json["productCode"],
      );

  Map<String, dynamic> toJson() => {
        "memberStateCode": memberStateCodeValues.reverse[memberStateCode],
        "memberStateName": memberStateNameValues.reverse[memberStateName],
        "beginDate": beginDateValues.reverse[beginDate],
        "endDate": endDateValues.reverse[endDate],
        "price": price,
        "unit": unitValues.reverse[unit],
        "weekNumber": weekNumber,
        "category": categoryValues.reverse[category],
        "productCode": productCode,
      };
}

enum BeginDate { THE_27012020, THE_30092019 }

final beginDateValues = EnumValues({
  "27/01/2020": BeginDate.THE_27012020,
  "30/09/2019": BeginDate.THE_30092019
});

enum Category {
  ADULT_MALE_INDICATIVE_PRICE,
  BULLS,
  COWS,
  HEIFERS,
  STEERS,
  YOUNG_BULLS,
  YOUNG_CATTLE
}

final categoryValues = EnumValues({
  "Adult male indicative price": Category.ADULT_MALE_INDICATIVE_PRICE,
  "Bulls": Category.BULLS,
  "Cows": Category.COWS,
  "Heifers": Category.HEIFERS,
  "Steers": Category.STEERS,
  "Young bulls": Category.YOUNG_BULLS,
  "Young cattle": Category.YOUNG_CATTLE
});

enum EndDate { THE_02022020, THE_06102019 }

final endDateValues = EnumValues(
    {"02/02/2020": EndDate.THE_02022020, "06/10/2019": EndDate.THE_06102019});

enum MemberStateCode { PT }

final memberStateCodeValues = EnumValues({"PT": MemberStateCode.PT});

enum MemberStateName { PORTUGAL }

final memberStateNameValues =
    EnumValues({"Portugal": MemberStateName.PORTUGAL});

enum Unit { THE_100_KG }

final unitValues = EnumValues({"€/100Kg": Unit.THE_100_KG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
