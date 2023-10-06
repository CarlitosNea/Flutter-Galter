import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HP;
import '../listar/cliente.dart';

class insCliente extends StatefulWidget {
  const insCliente({Key? key}) : super(key: key);

  @override
  State<insCliente> createState() => _insClienteState();
}

class _insClienteState extends State<insCliente> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _idClienteController = TextEditingController();
  final TextEditingController _nombreClienteController = TextEditingController();
  final TextEditingController _telefonoClienteController = TextEditingController();
  final TextEditingController _representanteClienteController = TextEditingController();
  final TextEditingController _direccionClienteController = TextEditingController();


  void _enviarFormularioCli() async{
    if (_formkey.currentState!.validate()){
      final String apiUrl="http://10.190.80.47/insertarCli/";
      final Map<String, dynamic> requestBody={
        'id_cliente' : _idClienteController.text,
        'nombre_cliente' : _nombreClienteController.text,
        'telefono_cliente' : _telefonoClienteController.text,
        'representante_cliente' : _representanteClienteController.text,
        'direccion' : _direccionClienteController.text,
      };

      Navigator.push(context, MaterialPageRoute(builder: (context) => Cliente()));

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
        title:  Text("Insertar Cliente"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _idClienteController,
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
                controller: _nombreClienteController,
                decoration: InputDecoration(
                    labelText: "Nombre"
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
                controller: _telefonoClienteController,
                decoration: InputDecoration(
                    labelText: "Telefono"
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
                controller: _representanteClienteController,
                decoration: InputDecoration(
                    labelText: "Nombre del Representante"
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
                controller: _direccionClienteController,
                decoration: InputDecoration(
                    labelText: "Direccion"
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
                  onPressed: _enviarFormularioCli,
                  child: Text("Enviar datos")
              )
            ],
          ),
        ),
      ),
    );
  }
}
