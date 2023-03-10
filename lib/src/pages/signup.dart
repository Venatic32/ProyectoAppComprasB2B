import 'package:flutter/material.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';
import 'package:proyecto_widgets/src/pages/consulta.dart';
import 'package:proyecto_widgets/src/pages/home.dart';
import 'package:proyecto_widgets/src/utils/bdusuarios.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _id, _nombre, _apellido, _clave, _correo, _idEmpresa, _nombreEmpresa;
  String _telefono, _tipoUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Card(
            child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  "Crea tu cuenta",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Ingresa tus datos",
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(height: 40.0),
                _labelCorreo(),
                SizedBox(height: 15.0),
                _labelPassword(),
                SizedBox(height: 15.0),
                _labelNombre(),
                SizedBox(height: 15.0),
                _labelApellido(),
                SizedBox(height: 15.0),
                _labelTelefono(),
                SizedBox(height: 15.0),
                _labelId(),
                SizedBox(height: 15.0),
                _labelIdEmpresa(),
                SizedBox(height: 15.0),
                _labelTipoUsuario(),
                SizedBox(height: 15.0),
                _labelNombreEmpresa(),
                SizedBox(height: 25.0),
                _loginButton(),
                SizedBox(height: 10.0),
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

  Widget _labelId() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'ID',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _id = value;
      },
    );
  }

  Widget _labelNombre() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _nombre = value;
      },
    );
  }

  Widget _labelApellido() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Apellido',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _apellido = value;
      },
    );
  }

  Widget _labelIdEmpresa() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Id Empresa',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _idEmpresa = value;
      },
    );
  }

  Widget _labelNombreEmpresa() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre Empresa',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _nombreEmpresa = value;
      },
    );
  }

  Widget _labelTelefono() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Telefono',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _telefono = value;
      },
    );
  }

  Widget _labelTipoUsuario() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Tipo Usuario',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        _tipoUsuario = value;
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
          //DBProvider.db.newUser(cliente1);
          var newUser = Usuarios(
              nombre: _nombre,
              apellido: _apellido,
              telefono: _telefono,
              id: _id,
              idEmpresa: _idEmpresa,
              nombreEmpresa: _nombreEmpresa,
              tipoUsuario: _tipoUsuario,
              correo: _correo,
              clave: _clave);
          DBUsuarios.db.borrar();
          DBUsuarios.db.newUser(newUser);
          print(newUser.nombre +
              " " +
              newUser.apellido +
              " " +
              newUser.correo +
              " " +
              newUser.clave +
              " " +
              newUser.telefono +
              " " +
              newUser.id +
              " " +
              newUser.idEmpresa +
              " " +
              newUser.nombreEmpresa +
              " " +
              newUser.tipoUsuario);
          final route = MaterialPageRoute(builder: (context) {
            return Consulta();
          });
          Navigator.push(context, route);
        },
        child: Text(
          "Crear cuenta",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  var cliente1 = Usuarios(
    id: '101789',
    nombre: 'Alfonso',
    apellido: 'Espinosa',
    correo: 'aespinosa@gmail.com',
    clave: 'clave123',
    idEmpresa: '123',
    nombreEmpresa: 'Variedades La Andrea',
    telefono: '3156678899',
    tipoUsuario: '0',
  );
}
