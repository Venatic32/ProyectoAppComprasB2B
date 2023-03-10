import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/pedidos.dart';
import 'package:proyecto_widgets/src/model/productos.dart';
import 'package:proyecto_widgets/src/pages/cart.dart';
import 'package:proyecto_widgets/src/pages/detallespedido.dart';

class HistoryPage extends StatefulWidget {
  final Productos productos;

  final Function press;
  HistoryPage({
    Key key,
    this.productos,
    this.press,
  }) : super(key: key);
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final pedidos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: Pedidos.pedidos.length,
        itemBuilder: (context, index) => ListTile(
          leading: SizedBox(
            height: 100.0,
            width: 100.0, // fixed width and height
            child: Icon(Icons.monetization_on_outlined),
          ),
          title: Text("Pedido no. " + (index + 1).toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$" + Pedidos.pedidos[index].total.toString()),
              Text(DateTime.now().toString())
            ],
          ),
          isThreeLine: true,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(pedidos: pedidos[index]),
                ));
          },
        ),
      ),
    );
  }
}
