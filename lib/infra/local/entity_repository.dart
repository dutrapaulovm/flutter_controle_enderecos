import 'package:flutter_controle_enderecos/domain/models/entity.dart';
import 'package:flutter_controle_enderecos/domain/repository/repository.dart';
import 'package:flutter_controle_enderecos/infra/local/database_provider.dart';
import 'package:flutter_controle_enderecos/infra/result_data.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class EntityRepository<T extends Entity> implements IRepository<T> {
  late DatabaseProvider databaseProvider;

  EntityRepository({required this.databaseProvider});

  @override
  Future<ResultData<int>> delete(T entity) async {
    try {
      await databaseProvider.open();
      Database db = databaseProvider.getDatabase;
      return ResultData(
          success: true,
          data: await db.delete(entity.entityName,
              where: " ${entity.primaryKey} = ? ",
              whereArgs: [entity.getValueId]));
    } on Exception catch (e) {
      return ResultData(success: false, message: e.toString());
      //throw Exception(e);
    } finally {
      if (databaseProvider.getDatabase.isOpen) {
        databaseProvider.getDatabase.close();
      }
    }
  }

  @override
  Future<ResultData<List<T>>> findAll(T entity) async {
    try {
      await databaseProvider.open();
      Database db = databaseProvider.getDatabase;
      List<Map<String, dynamic>> result = await db.query(entity.entityName);

      List<T> entities = List.generate(result.length, (index) {
        return entity.fromMap(result[index]);
      });
      return ResultData(success: true, data: entities);
    } on Exception catch (e) {
      return ResultData(success: false, message: e.toString());
    } finally {
      if (databaseProvider.getDatabase.isOpen) {
        databaseProvider.getDatabase.close();
      }
    }
  }

  @override
  Future<ResultData<T>> findById(T entity) async {
    try {
      await databaseProvider.open();
      Database db = databaseProvider.getDatabase;
      List<Map<String, dynamic>> result = await db.query(entity.entityName,
          where: " ${entity.primaryKey} = ? ", whereArgs: [entity.getValueId]);
      late T entityResult;

      if (result.isNotEmpty) {
        for (var element in result) {
          entityResult = entity.fromMap(element);
        }
      }

      return ResultData(success: true, data: entityResult);
    } on Exception catch (e) {
      return ResultData(success: false, message: e.toString());
    } finally {
      if (databaseProvider.getDatabase.isOpen) {
        databaseProvider.getDatabase.close();
      }
    }
  }

  @override
  Future<ResultData<int>> insert(T entity) async {
    try {
      await databaseProvider.open();
      Database db = databaseProvider.getDatabase;

      var r = await db.insert(entity.entityName, entity.toMap());
      return ResultData(success: true, data: r);
    } on Exception catch (e) {
      return ResultData(success: false, message: e.toString());
    } finally {
      if (databaseProvider.getDatabase.isOpen) {
        databaseProvider.getDatabase.close();
      }
    }
  }

  @override
  Future<ResultData<int>> update(T entity) async {
    try {
      await databaseProvider.open();
      Database db = databaseProvider.getDatabase;
      var r = await db.update(entity.entityName, entity.toMap(),
          where: " ${entity.primaryKey} = ? ", whereArgs: [entity.getValueId]);

      return ResultData(success: true, data: r);
    } on Exception catch (e) {
      return ResultData(success: false, message: e.toString());
    } finally {
      if (databaseProvider.getDatabase.isOpen) {
        databaseProvider.getDatabase.close();
      }
    }
  }
}
