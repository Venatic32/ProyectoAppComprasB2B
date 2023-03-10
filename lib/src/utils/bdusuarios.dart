import 'package:path/path.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBUsuarios {
  DBUsuarios._();
  static final DBUsuarios db = DBUsuarios._();
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

  Future<List<Usuarios>> getAllUsers() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query("usuarios");
    return results.map((map) => Usuarios.fromMap(map));
  }

  Future<List<Usuarios>> todosUsuarios() async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    List<Map<String, dynamic>> maps = await db.query('usuarios');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Usuarios(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        apellido: maps[i]['apellido'],
        clave: maps[i]['clave'],
        correo: maps[i]['correo'],
        idEmpresa: maps[i]['idEmpresa'],
        nombreEmpresa: maps[i]['nombreEmpresa'],
        telefono: maps[i]['telefono'],
        tipoUsuario: maps[i]['tipoUsuario'],
      );
    });
  }
}
