import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/utils/bdusuarios.dart';

class Consulta extends StatefulWidget {
  Consulta({Key key}) : super(key: key);

  @override
  _ConsultaState createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  Map<String, String> newUser = {};
  Future _userFuture;

  @override
  void initState() {
    _userFuture = getUser();
    super.initState();
  }

  getUser() async {
    final _userData = await DBUsuarios.db.getUser();
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Consulta")),
      ),
      body: FutureBuilder(
        future: _userFuture,
        builder: (_, userData) {
          switch (userData.connectionState) {
            case ConnectionState.none:
              return Container(
                child: Text(
                    "No se ha podido conectar a la base de datos de usuarios"),
              );
            case ConnectionState.waiting:
              return Container(
                child: Text("Esperando conexión"),
              );
            case ConnectionState.active:
              return Container(
                child: Text("olaac"),
              );
            case ConnectionState.done:
              if (!newUser.containsKey('id')) {
                newUser = Map<String, String>.from(userData.data);
              }
              return Column(children: <Widget>[
                //lista(),
                Text(newUser['correo']),
                Text(newUser['clave']),
                Text(newUser['nombre']),
                Text(newUser['apellido']),
                Text(newUser['id']),
                Text(newUser['idEmpresa']),
                Text(newUser['tipoUsuario']),
                Text(newUser['nombreEmpresa']),
                Text(newUser['telefono']),
              ]);
          }
        },
      ),
    );
  }
}
