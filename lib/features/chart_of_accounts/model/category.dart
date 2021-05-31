// To parse this JSON data, do
//
// final accountCategory = accountCategoryFromJson(jsonString);

import 'dart:convert';

AccountCategory accountCategoryFromJson(String str) =>
    AccountCategory.fromJson(json.decode(str));

String accountCategoryToJson(AccountCategory data) =>
    json.encode(data.toJson());

class AccountCategory {
  AccountCategory({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<AccountsCategoryResult> results;

  factory AccountCategory.fromJson(Map<String, dynamic> json) =>
      AccountCategory(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<AccountsCategoryResult>.from(
            json["results"].map((x) => AccountsCategoryResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class AccountsCategoryResult {
  AccountsCategoryResult({
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

  factory AccountsCategoryResult.fromJson(Map<String, dynamic> json) =>
      AccountsCategoryResult(
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
