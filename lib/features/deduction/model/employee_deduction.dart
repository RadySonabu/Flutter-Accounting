// To parse this JSON data, do
//
//     final employeeDeduction = employeeDeductionFromJson(jsonString);

import 'dart:convert';

EmployeeDeduction employeeDeductionFromJson(String str) =>
    EmployeeDeduction.fromJson(json.decode(str));
EmployeeDeductionResult employeeDeductionResultFromJson(String str) =>
    EmployeeDeductionResult.fromJson(json.decode(str));
String employeeDeductionToJson(EmployeeDeduction data) =>
    json.encode(data.toJson());

class EmployeeDeduction {
  EmployeeDeduction({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<EmployeeDeductionResult> results;

  factory EmployeeDeduction.fromJson(Map<String, dynamic> json) =>
      EmployeeDeduction(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<EmployeeDeductionResult>.from(
            json["results"].map((x) => EmployeeDeductionResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class EmployeeDeductionResult {
  EmployeeDeductionResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.employeeId,
    this.deduction,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  String employeeId;
  int deduction;

  factory EmployeeDeductionResult.fromJson(Map<String, dynamic> json) =>
      EmployeeDeductionResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        employeeId: json["employee_id"],
        deduction: json["deduction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_status": activeStatus,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "date_modified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
        "employee_id": employeeId,
        "deduction": deduction,
      };
}
