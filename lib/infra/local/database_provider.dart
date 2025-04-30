import 'dart:io';

import 'package:flutter_controle_enderecos/infra/local/app_sql.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();

  ///Representa a conexão ativa do banco de dados.
  static late Database _database;

  Database get getDatabase => _database;

  static const int _dbVersion =
      1; // Atualize a versão ao adicionar novas tabelas

  DatabaseProvider._internal();

  Future<Database> _open() async {
    //Carrega as bibliotecas do SQLite
    sqfliteFfiInit();

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      databaseFactory = databaseFactoryFfi;
    }

    String path = join(await getDatabasesPath(), "financeiro.db");

    _database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) => _create(db, version),
      onUpgrade: (db, oldVersion, newVersion) =>
          _onUpgrade(db, oldVersion, newVersion),
    );

    return _database;
  }

  static Future<void> _create(Database db, int version) {
    return db.execute(AppSQL.sql);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      //await _createUserTable(db);
    }

    // Se futuramente precisar de mais upgrades:
    // if (oldVersion < 3) {
    //   await _createNovaTabela(db);
    // }
  }

  static Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _instance._open();
    return _database!;
  }
}
