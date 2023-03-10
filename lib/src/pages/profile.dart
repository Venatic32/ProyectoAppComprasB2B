import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';

class ProfilePage extends StatelessWidget {
  final Usuarios usuarios;
  const ProfilePage({Key key, this.usuarios}) : super(key: key);

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
            leading: Icon(Icons.person),
            title: Text('${usuarios.nombre}' + ' ${usuarios.apellido}'),
            subtitle: Text('${usuarios.correo}'),
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
                  "Datos personales",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.0),
                Text("Nombre: ${usuarios.nombre}"),
                Text("Apellido: ${usuarios.apellido}"),
                Text("Correo: ${usuarios.correo}"),
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
