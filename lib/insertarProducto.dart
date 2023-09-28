import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:galter/producto.dart';
import 'package:http/http.dart' as HP;

class insertarProd extends StatefulWidget {
  const insertarProd({Key? key}) : super(key: key);

  @override
  _insertarProdState createState() => _insertarProdState();
}

class _insertarProdState extends State<insertarProd> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _codiProdController = TextEditingController();
  final TextEditingController _nombreProdController = TextEditingController();
  final TextEditingController _tiempoProdController = TextEditingController();
  final TextEditingController _longitudProdontroller = TextEditingController();
  final TextEditingController _materialProdController = TextEditingController();
  final TextEditingController _precioProdController = TextEditingController();


  void _enviarFormularioProd() async{
    if (_formkey.currentState!.validate()){
      final String apiUrl="http://192.168.1.87/insertarProd/";
      final Map<String, dynamic> requestBody={
        'codi_prod' : _codiProdController.text,
        'nomb_prod' : _nombreProdController.text,
        'tiempo_prod' : _tiempoProdController.text,
        'long_prod' : _longitudProdontroller.text,
        'material_prod' : _materialProdController.text,
        'prec_prod' : _precioProdController.text,
      };

      Navigator.push(context, MaterialPageRoute(builder: (context) => Producto()));

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
        title: Text("Insertar Producto"
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(15, 27, 81, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _codiProdController,
                decoration: InputDecoration(
                    labelText: "Codigo"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _nombreProdController,
                decoration: InputDecoration(
                    labelText: "Nombre del producto"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _tiempoProdController,
                decoration: InputDecoration(
                    labelText: "Tiempo de produccion"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _longitudProdontroller,
                decoration: InputDecoration(
                    labelText: "Longitud del producto"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _materialProdController,
                decoration: InputDecoration(
                    labelText: "Material del producto"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _precioProdController,
                decoration: InputDecoration(
                    labelText: "Precio del producto"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: _enviarFormularioProd,
                  child: Text("Enviar datos")
              )
            ],
          ),
        ),
      ),
    );
  }
}
