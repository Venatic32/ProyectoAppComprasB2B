import 'dart:async';

import 'package:path/path.dart';
import 'package:proyecto_widgets/src/model/productos.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final database = openDatabase(
    // Establecer la ruta a la base de datos. Nota: Usando la función `join` del
    // complemento `path` es la mejor práctica para asegurar que la ruta sea correctamente
    // construida para cada plataforma.
    join(await getDatabasesPath(), 'pedidos_database.db'),
    // Cuando la base de datos se crea por primera vez, crea una tabla para almacenar dogs
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE productos(id TEXT PRIMARY KEY, nombre TEXT, idProveedor TEXT, descripcion TEXT, cantidad INTEGER, precio DOUBLE)",
      );
    },
    // Establece la versión. Esto ejecuta la función onCreate y proporciona una
    // ruta para realizar actualizacones y defradaciones en la base de datos.
    version: 1,
  );

  Future<void> insertarProducto(Productos producto) async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'productos',
      producto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Productos>> usuarios() async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('pedidos');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Productos(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        descripcion: maps[i]['descripcion'],
        idProveedor: maps[i]['idProveedor'],
        cantidad: maps[i]['cantidad'],
        precio: maps[i]['precio'],
      );
    });
  }

  Future<void> actualizarProducto(Productos usuario) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Actualiza el Dog dado
    await db.update(
      'usuarios',
      usuario.toMap(),
      // Aseguúrate de que solo actualizarás el Dog con el id coincidente
      where: "id = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [usuario.id],
    );
  }

  Future<void> eliminarProducto(int id) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Elimina el Dog de la base de datos
    await db.delete(
      'usuarios',
      // Utiliza la cláusula `where` para eliminar un dog específico
      where: "id = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [id],
    );
  }

  var producto = Productos(
    id: 10,
    nombre: 'Cartuchera rosada',
    descripcion: 'Cartuchera marca Totto',
    idProveedor: 'ab',
    cantidad: 12,
    precio: 54900,
  );

  // Inserta un dog en la base de datos
  await insertarProducto(producto);

  // Imprime la lista de dogs (solamente Fido por ahora)
  print(await usuarios());
}
