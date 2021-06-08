// To parse this JSON data, do
//
//     final deductionList = deductionListFromJson(jsonString);

import 'dart:convert';

DeductionList deductionListFromJson(String str) =>
    DeductionList.fromJson(json.decode(str));

DeductionListResult deductionListResultFromJson(String str) =>
    DeductionListResult.fromJson(json.decode(str));

String deductionListToJson(DeductionList data) => json.encode(data.toJson());

class DeductionList {
  DeductionList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<DeductionListResult> results;

  factory DeductionList.fromJson(Map<String, dynamic> json) => DeductionList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<DeductionListResult>.from(
            json["results"].map((x) => DeductionListResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class DeductionListResult {
  DeductionListResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.name,
    this.description,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  String name;
  String description;

  factory DeductionListResult.fromJson(Map<String, dynamic> json) =>
      DeductionListResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_status": activeStatus,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "date_modified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
        "name": name,
        "description": description,
      };
}
