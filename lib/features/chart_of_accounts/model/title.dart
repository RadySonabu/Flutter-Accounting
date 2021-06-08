// To parse this JSON data, do
//
//     final accountTitle = accountTitleFromJson(jsonString);

import 'dart:convert';

AccountTitle accountTitleFromJson(String str) =>
    AccountTitle.fromJson(json.decode(str));

AccountsTitleResult accountsTitleResultFromJson(String str) =>
    AccountsTitleResult.fromJson(json.decode(str));

String accountTitleToJson(AccountTitle data) => json.encode(data.toJson());

class AccountTitle {
  AccountTitle({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<AccountsTitleResult> results;

  factory AccountTitle.fromJson(Map<String, dynamic> json) => AccountTitle(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<AccountsTitleResult>.from(
            json["results"].map((x) => AccountsTitleResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class AccountsTitleResult {
  AccountsTitleResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.accountCategoryId,
    this.accountCode,
    this.titles,
    this.description,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  int accountCategoryId;
  String accountCode;
  String titles;
  String description;

  factory AccountsTitleResult.fromJson(Map<String, dynamic> json) =>
      AccountsTitleResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        accountCategoryId: json["account_category_id"],
        accountCode: json["account_code"],
        titles: json["titles"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_status": activeStatus,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "date_modified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
        "account_category_id": accountCategoryId,
        "account_code": accountCode,
        "titles": titles,
        "description": description,
      };
}
