class ListDesk {
  final int id;
  final String name;

  const ListDesk({
    required this.id,
    required this.name,
  });

  ListDesk copy({
    int? id,
    String? name,
  }) =>
      ListDesk(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ListDesk &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  factory ListDesk.fromJson(Map<String, dynamic> json) {
    return ListDesk(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  String toJson() {
    return '{id:$id,name:$name}';
  }

}
