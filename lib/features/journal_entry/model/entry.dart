// To parse this JSON data, do
//
//     final journalEntry = journalEntryFromJson(jsonString);

import 'dart:convert';

JournalEntry journalEntryFromJson(String str) =>
    JournalEntry.fromJson(json.decode(str));

JournalEntryResult journalEntryResultFromJson(String str) =>
    JournalEntryResult.fromJson(json.decode(str));

String journalEntryToJson(JournalEntry data) => json.encode(data.toJson());

class JournalEntry {
  JournalEntry({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<JournalEntryResult> results;

  factory JournalEntry.fromJson(Map<String, dynamic> json) => JournalEntry(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<JournalEntryResult>.from(
            json["results"].map((x) => JournalEntryResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class JournalEntryResult {
  JournalEntryResult({
    this.id,
    this.activeStatus,
    this.createdBy,
    this.modifiedBy,
    this.dateModified,
    this.date,
    this.entryNumber,
    this.entryUser,
  });

  int id;
  bool activeStatus;
  String createdBy;
  String modifiedBy;
  DateTime dateModified;
  DateTime date;
  int entryNumber;
  String entryUser;

  factory JournalEntryResult.fromJson(Map<String, dynamic> json) =>
      JournalEntryResult(
        id: json["id"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        dateModified: DateTime.parse(json["date_modified"]),
        date: DateTime.parse(json["date"]),
        entryNumber: json["entry_number"],
        entryUser: json["entry_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_status": activeStatus,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "date_modified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "entry_number": entryNumber,
        "entry_user": entryUser,
      };
}
