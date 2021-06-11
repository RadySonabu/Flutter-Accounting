// To parse this JSON data, do
//
//     final journalEntryDetails = journalEntryDetailsFromJson(jsonString);

import 'dart:convert';

JournalEntryDetails journalEntryDetailsFromJson(String str) =>
    JournalEntryDetails.fromJson(json.decode(str));

JournalEntryDetailsResult journalEntryDetailsResultFromJson(String str) =>
    JournalEntryDetailsResult.fromJson(json.decode(str));

String journalEntryDetailsToJson(JournalEntryDetails data) =>
    json.encode(data.toJson());

class JournalEntryDetails {
  JournalEntryDetails({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<JournalEntryDetailsResult> results;

  factory JournalEntryDetails.fromJson(Map<String, dynamic> json) =>
      JournalEntryDetails(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<JournalEntryDetailsResult>.from(
            json["results"].map((x) => JournalEntryDetailsResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class JournalEntryDetailsResult {
  JournalEntryDetailsResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.entryNumber,
    this.accountCodeId,
    this.transactionType,
    this.transactionAmount,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  int entryNumber;
  int accountCodeId;
  int transactionType;
  double transactionAmount;

  factory JournalEntryDetailsResult.fromJson(Map<String, dynamic> json) =>
      JournalEntryDetailsResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        entryNumber: json["entry_number"],
        accountCodeId: json["account_code_id"],
        transactionType: json["transaction_type"],
        transactionAmount: json["transaction_amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_status": activeStatus,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "date_modified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
        "entry_number": entryNumber,
        "account_code_id": accountCodeId,
        "transaction_type": transactionType,
        "transaction_amount": transactionAmount,
      };
}
