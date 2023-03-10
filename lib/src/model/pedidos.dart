import 'package:proyecto_widgets/src/model/productos.dart';

class Pedidos {
  final String id;
  final DateTime fecha;
  final double total;
  final List<Productos> productos;

  Pedidos({
    this.id,
    this.fecha,
    this.total,
    this.productos,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha': fecha,
      'total': total,
      'productos': productos,
    };
  }

  @override
  String toString() {
    return 'Pedidos{id: $id, fecha: $fecha, total: $total, productos: $productos}';
  }

  static List<Pedidos> pedidos = [];
}
