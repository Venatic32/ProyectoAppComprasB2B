import 'package:path/path.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProductos {
  DBProductos._();
  static final DBProductos db = DBProductos._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'usuarios.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE usuarios(id TEXT PRIMARY KEY, nombre TEXT, apellido TEXT, correo TEXT, clave TEXT, idEmpresa, TEXT, nombreEmpresa TEXT, telefono TEXT, tipoUsuario TEXT)");
    }, version: 1);
  }

  borrar() async {
    await deleteDatabase('usuarios.db');
  }

  newUser(Usuarios usuario) async {
    final db = await database;

    var res = await db.rawInsert(
        "INSERT INTO usuarios(id, nombre, apellido, correo, clave, idEmpresa, nombreEmpresa, telefono, tipoUsuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
          usuario.id,
          usuario.nombre,
          usuario.apellido,
          usuario.correo,
          usuario.clave,
          usuario.idEmpresa,
          usuario.nombreEmpresa,
          usuario.telefono,
          usuario.tipoUsuario
        ]);

    return res;
  }

  Future<dynamic> getUser() async {
    final db = await database;
    var res = await db.query("usuarios");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}
