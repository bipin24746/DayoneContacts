import 'package:equatable/equatable.dart';

class Integration extends Equatable {
  final bool success;
  final List<Datum> data;

  const Integration({
    required this.success,
    required this.data,
  });

  @override
  List<Object?> get props => [success, data];

  // ✅ Fix: Add a `toJson()` method
  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.map((x) => x.toJson()).toList(), // ✅ Fix here
  };
}

class Datum extends Equatable {
  final String id;
  final String title;
  final String category;
  final String message;
  final List<dynamic> document;
  final DateTime createdAt;

  const Datum({
    required this.id,
    required this.title,
    required this.category,
    required this.message,
    required this.document,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, category, message, document, createdAt];

  // ✅ Fix: Add a `toJson()` method
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "message": message,
    "document": document, // Assuming this is already in JSON-compatible format
    "createdAt": createdAt.toIso8601String(), // Convert DateTime to String
  };
}
