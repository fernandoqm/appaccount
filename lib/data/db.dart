import 'dart:html';

import 'package:accountapp/domain/entities/cuentas.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'cuentas.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE cuentas (id_cuenta INTEGER PRIMARY KEY, nombre_cuenta TEXT, numero_cuenta TEXT, banco TEXT, saldo NUMERIC, estado TEXT)",
      );
    }, version: 1);
  }

  static Future<int> insertCuenta(Cuentas cuenta) async {
    Database database = await _openDB();

    return database.insert("Cuentas", cuenta.toMap());
  }

  static Future<int> updateCuenta(Cuentas cuenta) async {
    Database database = await _openDB();
    return database.update("Cuentas", cuenta.toMap(),
        where: "id_cuenta = ?", whereArgs: [cuenta.id_cuenta]);
  }

  static Future<int> deleteCuenta(Cuentas cuentas) async {
    Database database = await _openDB();

    return database.delete("Cuentas",
        where: "id_cuenta = ?", whereArgs: [cuentas.id_cuenta]);
  }

  static Future<List<Cuentas>> cuenta() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> cuentasMap =
        await database.query("Cuentas");

    return List.generate(
        cuentasMap.length,
        (i) => Cuentas(
            id_cuenta: cuentasMap[i]['id_cuenta'],
            nombre_cuenta: cuentasMap[i]['nombre_cuenta'],
            numero_cuenta: cuentasMap[i]['numero_cuenta'],
            banco: cuentasMap[i]['banco'],
            saldo: cuentasMap[i]['saldo'],
            estado: cuentasMap[i]['estado']));
  }
}
