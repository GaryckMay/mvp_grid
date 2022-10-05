import 'package:mvp_grid/models/list.dart';

class Desk {
  final int id;
  final String name;
  final List<ListDesk> lists;

  const Desk({
    required this.id,
    required this.name,
    required this.lists,
  });

  Desk copy({
    int? id,
    String? name,
    List<ListDesk>? lists,
  }) =>
      Desk(
        id: id ?? this.id,
        name: name ?? this.name,
        lists: lists ?? this.lists,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Desk &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  factory Desk.fromJson(Map<String, dynamic> json) {
    return Desk(
      id: json['id'] as int,
      name: json['name'] as String,
      lists: (json['lists'] as List<dynamic>).map((dynamic e) => ListDesk.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
