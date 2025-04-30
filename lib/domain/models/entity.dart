abstract class Entity<T extends Entity<T>> {
  int id;

  String get primaryKey => "id";

  String get entityName;

  dynamic get getValueId => id;

  Entity({this.id = 0});

  Map<String, dynamic> toMap();

  T fromMap(Map<String, dynamic> map);
}
