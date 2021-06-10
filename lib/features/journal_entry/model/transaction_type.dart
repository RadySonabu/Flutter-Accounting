// To parse this JSON data, do
//
//     final journalTransacitonType = journalTransacitonTypeFromJson(jsonString);

import 'dart:convert';

JournalTransacitonType journalTransacitonTypeFromJson(String str) =>
    JournalTransacitonType.fromJson(json.decode(str));

JournalTransacitonTypeResult journalTransactionTypeResultFromJson(String str) =>
    JournalTransacitonTypeResult.fromJson(json.decode(str));

String journalTransacitonTypeToJson(JournalTransacitonType data) =>
    json.encode(data.toJson());

class JournalTransacitonType {
  JournalTransacitonType({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<JournalTransacitonTypeResult> results;

  factory JournalTransacitonType.fromJson(Map<String, dynamic> json) =>
      JournalTransacitonType(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<JournalTransacitonTypeResult>.from(json["results"]
            .map((x) => JournalTransacitonTypeResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class JournalTransacitonTypeResult {
  JournalTransacitonTypeResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.name,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  String name;

  factory JournalTransacitonTypeResult.fromJson(Map<String, dynamic> json) =>
      JournalTransacitonTypeResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_status": activeStatus,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "date_modified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
        "name": name,
      };
}
