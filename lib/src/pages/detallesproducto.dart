import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/components/itemlist.dart';
import 'package:proyecto_widgets/src/model/productos.dart';

import 'cart.dart';

class ProductDetailsPage extends StatelessWidget {
  final Productos productos;
  const ProductDetailsPage({Key key, this.productos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del producto"),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage(
                      width: 180,
                      height: 180,
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: AssetImage('${productos.imagen}')),
                  Container(
                    padding: const EdgeInsets.all(20.0 / 6),
                    child: Text(
                      "${productos.nombre}",
                      style: TextStyle(fontSize: 19.0),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 21.0,
                color: Colors.blueGrey[900],
              ),
              Text(
                "Descripción",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blueGrey),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  "${productos.descripcion}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Divider(),
              Text(
                "Proveedor",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blueGrey),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  "${productos.idProveedor}",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Divider(
                height: 30.0,
                color: Colors.blueGrey[900],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "\$${productos.precio}",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.blue[300], fontSize: 25.0),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyan),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () => _Agregar(context),
                    child: Text(
                      'Añadir al carrito',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          )),
        ),
      ]),
    );
  }

  void _Agregar(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar producto al carrito"),
          content: Text("¿Deseas agregar este producto al carrito de compras"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () {
                Agregado(context);
              },
              child: Text("Agregar"),
            ),
          ],
        );
      },
    );
  }

  void Agregado(BuildContext context) {
    carrito.add(productos);
    Navigator.pop(context);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("Producto agregado al carrito"),
          content: Text("Deseas ver el carrito de compras"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("No"),
            ),
            FlatButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (context) {
                  return ShoppingCartPage();
                });
                Navigator.push(context, route);
              },
              child: Text("Sí"),
            ),
          ],
        );
      },
    );
  }
}
