// // To parse this JSON data, do
// //
// //     final integration = integrationFromJson(jsonString);
//
// import 'dart:convert';
//
// Integration integrationFromJson(String str) => Integration.fromJson(json.decode(str));
//
// String integrationToJson(Integration data) => json.encode(data.toJson());
//
// class Integration {
//   bool success;
//   // Docs docs;
//   List<Datum> data;
//
//   Integration({
//     required this.success,
//     // required this.docs,
//     required this.data,
//   });
//
//   factory Integration.fromJson(Map<String, dynamic> json) => Integration(
//     success: json["success"],
//     // docs: Docs.fromJson(json["docs"]),
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     // "docs": docs.toJson(),
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   String id;
//   String title;
//   String category;
//   String message;
//   List<dynamic> document;
//   DateTime createdAt;
//
//   Datum({
//     required this.id,
//     required this.title,
//     required this.category,
//     required this.message,
//     required this.document,
//     required this.createdAt,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     title: json["title"],
//     category:json["category"]!,
//     message: json["message"],
//     document: List<dynamic>.from(json["document"].map((x) => x)),
//     createdAt: DateTime.parse(json["createdAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "category": categoryValues.reverse[category],
//     "message": message,
//     "document": List<dynamic>.from(document.map((x) => x)),
//     "createdAt": createdAt.toIso8601String(),
//   };
// }
//
// enum Category {
//   TESTING
// }
//
// final categoryValues = EnumValues({
//   "testing": Category.TESTING
// });
//
// class Docs {
//   Next total;
//   Next next;
//   Next prev;
//
//   Docs({
//     required this.total,
//     required this.next,
//     required this.prev,
//   });
//
//   factory Docs.fromJson(Map<String, dynamic> json) => Docs(
//     total: Next.fromJson(json["total"]),
//     next: Next.fromJson(json["next"]),
//     prev: Next.fromJson(json["prev"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "total": total.toJson(),
//     "next": next.toJson(),
//     "prev": prev.toJson(),
//   };
// }
//
// class Next {
//   int? page;
//   int limit;
//
//   Next({
//     required this.page,
//     required this.limit,
//   });
//
//   factory Next.fromJson(Map<String, dynamic> json) => Next(
//     page: json["page"],
//     limit: json["limit"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "page": page,
//     "limit": limit,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
