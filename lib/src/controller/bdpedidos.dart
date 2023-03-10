/*import 'dart:async';

import 'package:path/path.dart';
import 'package:proyecto_widgets/src/model/pedidos.dart';
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
        "CREATE TABLE pedidos(id TEXT PRIMARY KEY, idCliente TEXT, idProveedor TEXT, comentarios TEXT, fecha DATE)",
      );
    },
    // Establece la versión. Esto ejecuta la función onCreate y proporciona una
    // ruta para realizar actualizacones y defradaciones en la base de datos.
    version: 1,
  );

  Future<void> insertarPedido(Pedidos pedido) async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'pedidos',
      pedido.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Pedidos>> pedidos() async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('pedidos');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Pedidos(
        id: maps[i]['id'],
        idCliente: maps[i]['idCliente'],
        idProveedor: maps[i]['idProveedor'],
        comentarios: maps[i]['comentarios'],
        fecha: maps[i]['fecha'],
      );
    });
  }

  Future<void> actualizarPedido(Pedidos pedidos) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Actualiza el Dog dado
    await db.update(
      'pedidos',
      pedidos.toMap(),
      // Aseguúrate de que solo actualizarás el Dog con el id coincidente
      where: "id = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [pedidos.id],
    );
  }

  Future<void> eliminarPedido(int id) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Elimina el Dog de la base de datos
    await db.delete(
      'pedidos',
      // Utiliza la cláusula `where` para eliminar un dog específico
      where: "id = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [id],
    );
  }

  var pedido1 = Pedidos(
    id: '12345',
    idCliente: '10',
    idProveedor: 'ab',
    comentarios: 'Ninguno',
    fecha: DateTime.now(),
  );

  // Inserta un dog en la base de datos
  await insertarPedido(pedido1);

  // Imprime la lista de dogs (solamente Fido por ahora)
  print(await pedidos());
}*/
