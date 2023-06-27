import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  List<dynamic> datos = [];

  Future<void> consultaPedido() async {
    final url = Uri.parse("direccion/pedido");
    final respuesta = await HP.get(url);

    if (respuesta.statusCode == 200) {
      print('conectado');
      final jsonResponse = json.decode(respuesta.body);
      setState(() {
        datos = jsonResponse;
      });
    }
    else {
      print('Error en la conexion');
    }
  }

  void initState() {
    super.initState();
    consultaPedido();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: ListView.builder(itemCount: datos.length,
        itemBuilder: (context, index) {
          final item = datos [index];
          return ListTile(
            title: Text(item['']),
            subtitle: Row(
              children: [
                Text(item['']),
                SizedBox(height: 10,),
                Text(item['']),
              ],
            ),
          );
        },
      ),
    );
  }
}