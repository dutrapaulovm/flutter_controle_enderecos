import 'dart:io';

import 'package:flutter_controle_enderecos/infra/local/app_sql.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseProvider {
  ///Representa a conexão ativa do banco de dados.
  late Database _database;

  Database get getDatabase => _database;

  Future<void> open() async {
    //Carrega as bibliotecas do SQLite
    sqfliteFfiInit();

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      databaseFactory = databaseFactoryFfi;
    }

    String path = join(await getDatabasesPath(), "financeiro.db");

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => _create(db, version),
    );
  }

  Future<void> _create(Database db, int version) {
    return db.execute(AppSQL.sql);
  }
}
