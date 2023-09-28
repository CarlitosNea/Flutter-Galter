import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HP;
import 'pedido.dart';

class insPedido extends StatefulWidget {
  const insPedido({Key? key}) : super(key: key);

  @override
  State<insPedido> createState() => _insPedidoState();
}

class _insPedidoState extends State<insPedido> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _idPedidoController = TextEditingController();
  final TextEditingController _clientePedidoController = TextEditingController();
  final TextEditingController _productoPedidoController = TextEditingController();
  final TextEditingController _usuarioPedidoController = TextEditingController();
  final TextEditingController _tiempoPedidoController = TextEditingController();
  final TextEditingController _encargoPedidoController = TextEditingController();
  final TextEditingController _entregaPedidoController = TextEditingController();


  void _enviarFormularioPed() async{
    if (_formkey.currentState!.validate()){
      final String apiUrl="http://192.168.1.87/insertarPedi/";
      final Map<String, dynamic> requestBody={
        'id_pedido' : _idPedidoController.text,
        'cliente_pedido' : _clientePedidoController.text,
        'producto_pedido' : _productoPedidoController.text,
        'usuario_pedido' : _usuarioPedidoController.text,
        'tiempo_pedido' : _tiempoPedidoController.text,
        'fecha_encargo' : _encargoPedidoController.text,
        'fecha_entrega' : _entregaPedidoController.text,
      };

      Navigator.push(context, MaterialPageRoute(builder: (context) => Pedido()));

      final respuesta = await HP.post(Uri.parse(apiUrl),
        headers: {
          'Content-type':'aplication/json'
        },
        body: json.encode(requestBody),
      );

      if (respuesta.statusCode == 200){
        print("datos enviados");
      }
      else{
        print("error en el envio");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Insertar Pedido"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _idPedidoController,
                decoration: InputDecoration(
                    labelText: "Id"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _clientePedidoController,
                decoration: InputDecoration(
                    labelText: "Codigo Cliente"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _productoPedidoController,
                decoration: InputDecoration(
                    labelText: "Codigo Producto"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _usuarioPedidoController,
                decoration: InputDecoration(
                    labelText: "Codigo Usuario"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _tiempoPedidoController,
                decoration: InputDecoration(
                    labelText: "Tiempo del Pedido"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _encargoPedidoController,
                decoration: InputDecoration(
                    labelText: "Fecha Encargo"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _entregaPedidoController,
                decoration: InputDecoration(
                    labelText: "Fecha Entrega"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: _enviarFormularioPed,
                  child: Text("Enviar datos")
              )
            ],
          ),
        ),
      ),
    );
  }
}