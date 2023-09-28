import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HP;
import 'Material.dart';

class insMaterial extends StatefulWidget {
  const insMaterial({Key? key}) : super(key: key);

  @override
  State<insMaterial> createState() => _insMaterialState();
}

class _insMaterialState extends State<insMaterial> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _codigoMaterialController = TextEditingController();
  final TextEditingController _nombreMaterialController = TextEditingController();
  final TextEditingController _cantidadMaterialController = TextEditingController();
  final TextEditingController _proveedorController = TextEditingController();


  void _enviarFormularioMate() async{
    if (_formkey.currentState!.validate()){
      final String apiUrl="http://192.168.1.87/insertarMate/";
      final Map<String, dynamic> requestBody={
        'codi_mate' : _codigoMaterialController.text,
        'nomb_mate' : _nombreMaterialController.text,
        'cant_mate' : _cantidadMaterialController.text,
        'proveedor_mate' : _proveedorController.text,
      };

      Navigator.push(context, MaterialPageRoute(builder: (context) => material()));

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
        title:  Text("Insertar Material"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _codigoMaterialController,
                decoration: InputDecoration(
                    labelText: "Codigo"
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
                controller: _nombreMaterialController,
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
                controller: _cantidadMaterialController,
                decoration: InputDecoration(
                    labelText: "Cantidad"
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
                controller: _proveedorController,
                decoration: InputDecoration(
                    labelText: "Proveedor"
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
                  onPressed: _enviarFormularioMate,
                  child: Text("Enviar datos")
              )
            ],
          ),
        ),
      ),
    );
  }
}