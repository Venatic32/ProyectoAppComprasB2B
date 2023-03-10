import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';
import 'package:proyecto_widgets/src/pages/addproduct.dart';
import 'package:proyecto_widgets/src/pages/login.dart';
import 'package:proyecto_widgets/src/pages/profile.dart';
import 'package:proyecto_widgets/src/pages/profileproveedor.dart';

class HomeProveedorPage extends StatelessWidget {
  const HomeProveedorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EZProc"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Añadir producto a tu catálogo"),
              leading:
                  Icon(Icons.add_shopping_cart_rounded, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return AddProductPage();
                  },
                );
                Navigator.push(context, route);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Perfil"),
              leading: Icon(Icons.person, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return ProfileProvPage();
                  },
                );
                Navigator.push(context, route);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Historial de pedidos"),
              leading: Icon(Icons.history, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return ProfileProvPage();
                  },
                );
                Navigator.push(context, route);
              },
            ),
            Divider(),
            ListTile(
              title: Text("Cerrar sesión"),
              leading: Icon(Icons.logout, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Pedido 1"),
          ),
          ListTile(
            title: Text("Pedido 2"),
          ),
          ListTile(
            title: Text("Pedido 3"),
          )
        ],
      ),
    );
  }
}
