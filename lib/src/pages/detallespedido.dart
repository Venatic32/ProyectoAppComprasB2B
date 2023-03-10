import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/pedidos.dart';

class DetailPage extends StatefulWidget {
  final Pedidos pedidos;
  final Function press;
  const DetailPage({
    Key key,
    this.pedidos,
    this.press,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalles del pedido")),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [Text("$Pedidos.id")],
            ),
          )
        ],
      ),
    );
  }
}
