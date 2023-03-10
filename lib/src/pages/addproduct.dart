import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/productos.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String _id, _nombre, _descripcion, _proveedor;
  String _precio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añade un producto a tu catálogo"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            _labelId(),
            SizedBox(height: 15.0),
            _labelNombre(),
            SizedBox(height: 15.0),
            _labelDescripcion(),
            SizedBox(height: 15.0),
            _labelPrecio()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AgregarProducto(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _labelId() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'ID',
          icon: Icon(Icons.arrow_forward_ios_outlined)),
      onChanged: (value) {
        _id = value;
      },
    );
  }

  Widget _labelNombre() {
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre del producto',
          icon: Icon(Icons.arrow_forward_ios_outlined)),
      onChanged: (value) {
        _nombre = value;
      },
    );
  }

  Widget _labelDescripcion() {
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Descripción del producto',
          icon: Icon(Icons.arrow_forward_ios_outlined)),
      onChanged: (value) {
        _descripcion = value;
      },
    );
  }

  Widget _labelProveedor() {
    return TextField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'ID',
          icon: Icon(Icons.arrow_forward_ios_outlined)),
      onChanged: (value) {
        _proveedor = value;
      },
    );
  }

  Widget _labelPrecio() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Precio',
          icon: Icon(Icons.arrow_forward_ios_outlined)),
      onChanged: (value) {
        _precio = value;
      },
    );
  }

  AgregarProducto(BuildContext context) {
    if (_nombre == null ||
        _descripcion == null ||
        _id == null ||
        _precio == null) {
      print("Error: Campos vacíos");
    }
    var newProduct = Productos(
      nombre: _nombre,
      descripcion: _descripcion,
      imagen: "assets/transparente.png",
      precio: double.parse(_precio),
      idProveedor: Usuarios.usuarios[1].nombre + Usuarios.usuarios[1].apellido,
      id: int.parse(_id),
    );
    Productos.productos.add(newProduct);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("¡Hecho!"),
          content: Text("Producto agregado a tu catálogo"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
