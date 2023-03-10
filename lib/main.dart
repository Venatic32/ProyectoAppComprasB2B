import 'package:flutter/material.dart';

import 'package:proyecto_widgets/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getApplicationRoutes(),
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
