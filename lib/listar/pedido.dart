import 'package:flutter/material.dart';
import 'package:galter/insertar/insetarPedido.dart';
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
    final url = Uri.parse('http://192.168.1.87/Pedido');
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
      body: Stack(
        children: [
          ListView.builder(itemCount: datos.length,
            itemBuilder: (context, index) {
              final item = datos [index];
              return ListTile(
                title: Text("Pedido: "+item['id_pedido'].toString()),
                subtitle: Row(
                  children: [
                    Text('Cliente: '),
                    Text(item['cliente_pedido'].toString()),
                    SizedBox(height: 30,),
                    SizedBox(width: 20,),
                    Text('Producto'),
                    Text(item['producto_pedido']),
                    SizedBox(width: 20,),
                    Text('Entrega: '),
                    Text(item['fecha_entrega']),
                  ],
                ),
              );
            },
          ),
          Positioned(
              bottom: 50.0,
              right: 40.0,
              child: Container(
                width: 50,
                height: 50,
                child: ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => insPedido()),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text("")),
              )
          )
        ],
      )

    );
  }
}