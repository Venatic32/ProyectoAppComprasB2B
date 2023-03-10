import 'package:flutter/cupertino.dart';
import 'package:proyecto_widgets/src/model/usuarios.dart';
import 'package:proyecto_widgets/src/pages/cart.dart';
import 'package:proyecto_widgets/src/pages/history.dart';
import 'package:proyecto_widgets/src/pages/home.dart';
import 'package:proyecto_widgets/src/pages/login.dart';
import 'package:proyecto_widgets/src/pages/profile.dart';
import 'package:proyecto_widgets/src/pages/search.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Home(),
    'perfil': (BuildContext context) =>
        ProfilePage(usuarios: Usuarios.usuarios[0]),
    'cart': (BuildContext context) => ShoppingCartPage(),
    'login': (BuildContext context) => LoginPage(),
    'buscar': (BuildContext context) => SearchPage(),
    'historial': (BuildContext context) => HistoryPage(),
  };
}
