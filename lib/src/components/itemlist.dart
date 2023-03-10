import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/productos.dart';

class ItemList extends StatelessWidget {
  final Productos productos;
  final Function press;
  const ItemList({
    Key key,
    this.productos,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          title: Text(productos.nombre),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productos.precio}"),
              Text("Proveedor: ${productos.idProveedor}"),
            ],
          ),
          leading: SizedBox(
            height: 100.0,
            width: 100.0, // fixed width and height
            child: Image.asset(productos.imagen),
          ),
        ),
        Divider(),
      ],
    );
  }
}
