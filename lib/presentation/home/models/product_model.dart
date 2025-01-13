import 'dart:convert';

class Products {
  final int tenantId;
  final String name;
  final String description;
  final bool isAvailable;
  final int id;

  Products({
    required this.tenantId,
    required this.name,
    required this.description,
    required this.isAvailable,
    required this.id,
  });

  Products copyWith({
    int? tenantId,
    String? name,
    String? description,
    bool? isAvailable,
    int? id,
  }) =>
      Products(
        tenantId: tenantId ?? this.tenantId,
        name: name ?? this.name,
        description: description ?? this.description,
        isAvailable: isAvailable ?? this.isAvailable,
        id: id ?? this.id,
      );

  factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    tenantId: json["tenantId"],
    name: json["name"],
    description: json["description"],
    isAvailable: json["isAvailable"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tenantId": tenantId,
    "name": name,
    "description": description,
    "isAvailable": isAvailable,
    "id": id,
  };
}
