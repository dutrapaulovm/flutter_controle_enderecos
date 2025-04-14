abstract class Entity {
  int id = 0;

  String get primaryKey => "id";

  String get entityName;

  dynamic get getValueId => id;

  Entity({id});

  Map<String, dynamic> toMap();

  dynamic fromMap(Map<String, dynamic> map);
}
