import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';

class ProfileProvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Card(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FadeInImage(
              width: 200,
              height: 200,
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: AssetImage('assets/man-300x300.png')),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Variedades Don William'),
            subtitle: Text('De todo un poquito'),
          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Información de contacto",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.0),
                Text("Nombre: Variedades Don William"),
                Text("Dirección: Cll 29 #57-3"),
                Text("Correo: wguarino@ucentral.edu.co"),
                TextButton(
                  child: const Text('Modificar datos'),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
