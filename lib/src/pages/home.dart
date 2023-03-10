import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/pages/consulta.dart';
import 'package:proyecto_widgets/src/pages/detallesproducto.dart';
import 'package:proyecto_widgets/src/pages/homeproveedor.dart';
import 'package:proyecto_widgets/src/pages/profileproveedor.dart';
import 'package:proyecto_widgets/src/providers/menu_provider.dart';
import 'package:proyecto_widgets/src/utils/iconos.dart';
import 'package:proyecto_widgets/src/components/itemcard.dart';
import 'package:proyecto_widgets/src/model/productos.dart';

import 'cart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EZProc'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                /*final route = MaterialPageRoute(builder: (context) {
                  return ShoppingCartPage();
                });
                Navigator.push(context, route);*/
                final route = MaterialPageRoute(
                  builder: (context) {
                    return ShoppingCartPage();
                  },
                );
                Navigator.push(context, route);
                {}
              })
        ],
      ),
      drawer: Drawer(
        child: _lista(),
      ),
      body: GridView.builder(
          itemCount: Productos.productos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => ItemCard(
                productos: Productos.productos[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                          productos: Productos.productos[index]),
                    )),
              )),
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          /*final route = MaterialPageRoute(
            builder: (context) {
              return HistoryPage();
            },
          );
          Navigator.push(context, route);*/
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }
}
