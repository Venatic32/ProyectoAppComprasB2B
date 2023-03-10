import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:proyecto_widgets/src/model/pedidos.dart';
import 'package:proyecto_widgets/src/model/productos.dart';
import 'package:proyecto_widgets/src/pages/detallesproducto.dart';
import 'package:proyecto_widgets/src/utils/iconos.dart';

List<Productos> carrito = [];
//List<Productos> historial = [];

class ShoppingCartPage extends StatefulWidget {
  final Productos productos;
  final Function press;
  ShoppingCartPage({
    Key key,
    this.productos,
    this.press,
  }) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  Map<String, String> newUser = {};

  int dropdownValue = 1;

  String username = "ezprocmail@gmail.com";
  String password = "clave12345";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: carrito.length,
        itemBuilder: (context, index) => ListTile(
          leading: SizedBox(
            height: 100.0,
            width: 100.0, // fixed width and height
            child: Image.asset(carrito[index].imagen),
          ),
          title: Text(carrito[index].nombre),
          subtitle: Text(carrito[index].precio.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Comprar(context),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  void Comprar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("¿Deseas comprar los productos en el carrito?"),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () => pedidoRealizado(context),
              child: Text("Comprar"),
            ),
          ],
        );
      },
    );
  }

  void correo() async {
    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add("manuelfelipe1298@gmail.com") //recipent email
      ..subject = 'Pedido realizado ${DateTime.now()}' //subject of the email
      ..text =
          'Se ha realizado tu pedido correctamente. Recibirás una respuesta del proveedor pronto. Los productos que pediste fueron: ' +
              carrito.toString(); //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  void pedidoRealizado(BuildContext context) {
    Navigator.pop(context);
    correo();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("Pedido realizado"),
          content: Text(
              "Se ha enviado tu pedido al proveedor y se ha enviado un correo de confirmación a tu correo electrónico."),
          actions: [
            FlatButton(
              onPressed: () {
                var newPedido = Pedidos(
                  id: '1',
                  total: 107400,
                  fecha: DateTime.now(),
                  productos: carrito,
                );
                Pedidos.pedidos.add(newPedido);
                Navigator.pop(context);
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}
