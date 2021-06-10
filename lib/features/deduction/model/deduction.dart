// To parse this JSON data, do
//
//     final deduction = deductionFromJson(jsonString);

import 'dart:convert';

Deduction deductionFromJson(String str) => Deduction.fromJson(json.decode(str));
DeductionResult deductionResultFromJson(String str) =>
    DeductionResult.fromJson(json.decode(str));

String deductionToJson(Deduction data) => json.encode(data.toJson());

class Deduction {
  Deduction({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<DeductionResult> results;

  factory Deduction.fromJson(Map<String, dynamic> json) => Deduction(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<DeductionResult>.from(
            json["results"].map((x) => DeductionResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class DeductionResult {
  DeductionResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.name,
    this.employeeDeductionList,
    this.amount,
    this.description,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  String name;
  int employeeDeductionList;
  double amount;
  String description;

  factory DeductionResult.fromJson(Map<String, dynamic> json) =>
      DeductionResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        name: json["name"],
        employeeDeductionList: json["employee_deduction_list"],
        amount: json["amount"].toDouble(),
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
        "employee_deduction_list": employeeDeductionList,
        "amount": amount,
        "description": description,
      };
}
