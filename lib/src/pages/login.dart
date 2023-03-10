import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';
import 'package:proyecto_widgets/src/pages/home.dart';
import 'package:proyecto_widgets/src/pages/homeproveedor.dart';
import 'package:proyecto_widgets/src/pages/signup.dart';
import 'package:proyecto_widgets/src/utils/bdusuarios.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _correo, _clave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 90.0),
        Text(
          "Bienvenido a EZProc",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        SizedBox(height: 16.0),
        Text(
          "Ingresa tu correo y contraseña para iniciar sesión",
          style: TextStyle(fontSize: 15.0),
        ),
        SizedBox(height: 40.0),
        _labelCorreo(),
        SizedBox(height: 15.0),
        _labelPassword(),
        SizedBox(height: 25.0),
        _loginButton(),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "¿No tienes una cuenta?   ",
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                final route = MaterialPageRoute(builder: (context) {
                  return SignUpPage();
                });
                Navigator.push(context, route);
              },
              child: Text(
                "Crea una aquí",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ],
        )
      ],
    )));
  }

  Widget _labelCorreo() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Correo electrónico',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        _correo = value;
      },
    );
  }

  Widget _labelPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _clave = value;
      },
    );
  }

  Widget _loginButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: FlatButton(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        onPressed: () {
          if (_correo == Usuarios.usuarios[0].correo &&
              _clave == Usuarios.usuarios[0].clave) {
            final route = MaterialPageRoute(builder: (context) {
              return Home();
            });
            Navigator.push(context, route);
          } else {
            if (_correo == Usuarios.usuarios[1].correo &&
                _clave == Usuarios.usuarios[1].clave) {
              final route = MaterialPageRoute(builder: (context) {
                return HomeProveedorPage();
              });
              Navigator.push(context, route);
            } else
              print("Error");
          }
        },
        child: Text(
          "Iniciar sesión",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
