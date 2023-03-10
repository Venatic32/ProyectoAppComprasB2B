import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/productos.dart';

class ItemCard extends StatelessWidget {
  final Productos productos;
  final Function press;
  const ItemCard({
    Key key,
    this.productos,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  //padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                      tag: "${productos.id}",
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(productos.imagen),
                        ],
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0 / 5),
              child: Text(
                // products is out demo list
                productos.nombre,
                style: TextStyle(
                  color: Color(0xFF535353),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Proveedor: ${productos.idProveedor}",
                  style: TextStyle(color: Colors.blueGrey)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("\$${productos.precio}"),
            ),
          ],
        ),
      ),
    );
  }
}
