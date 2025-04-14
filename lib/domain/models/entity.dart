abstract class Entity {
  String get primaryKey => "id";

  String get entityName;

  dynamic get getValueId;

  Map<String, dynamic> toMap();

  dynamic fromMap(Map<String, dynamic> map);
}
