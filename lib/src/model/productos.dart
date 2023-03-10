import 'dart:ffi';

class Productos {
  final String nombre, descripcion, idProveedor, imagen;
  final int cantidad, id;
  final double precio;

  Productos(
      {this.nombre,
      this.id,
      this.descripcion,
      this.idProveedor,
      this.cantidad,
      this.precio,
      this.imagen});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'idProveedor': idProveedor,
      'cantidad': cantidad,
      'precio': precio,
      'imagen': imagen,
    };
  }

  @override
  String toString() {
    return 'Productos{id: $id, name: $nombre, descripcion: $descripcion, idProveedor: $idProveedor, cantidad: $cantidad, precio: $precio}';
  }

  static List<Productos> productos = [
    Productos(
      id: 1,
      nombre: "Cartuchera Totto",
      descripcion:
          "Cartuchera de excelente calidad, material en lino y cierre con cremallera",
      imagen: "assets/cartuchera.png",
      idProveedor: "Nalsani",
      precio: 23900,
    ),
    Productos(
      id: 2,
      nombre: "Flauta dulce",
      descripcion: "Flauta dulce con excelente sonido y limpiador incluido",
      imagen: "assets/flauta.png",
      idProveedor: "Yamaha",
      precio: 4900,
    ),
    Productos(
      id: 3,
      nombre: "Audifonos Bluetooth",
      descripcion:
          "Audifonos Sony con excelente calidad de audio y sonido binaural",
      imagen: "assets/audifonos.png",
      idProveedor: "Sony",
      precio: 57900,
    ),
    Productos(
      id: 4,
      nombre: "Calculadora cientifica",
      descripcion: "Calculadora ciéntifica y graficadora HP",
      imagen: "assets/calculadora2.png",
      idProveedor: "HP",
      precio: 80000,
    ),
    Productos(
      id: 5,
      nombre: "Cuaderno rayado",
      descripcion: "Cuaderno argollado de diferentes motivos, grande, rayado",
      imagen: "assets/cuaderno.png",
      idProveedor: "Scribe",
      precio: 1900,
    ),
    Productos(
      id: 6,
      nombre: "Flauta dulce",
      descripcion: "Flauta dulce de buena calidad y buen sonido",
      imagen: "assets/flauta.png",
      idProveedor: "Música pa ti",
      precio: 3500,
    ),
  ];
}
