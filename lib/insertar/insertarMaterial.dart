import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:galter/actualizarProd.dart';
import 'package:galter/eliminar/eliminarProd.dart';
import 'package:galter/home.dart';
import 'package:http/http.dart' as HP;
import '../listar/Material.dart';

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
      final String apiUrl="http://192.168.35.43/insertarMate/";
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
          title: Text("Insertar Material"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(15, 27, 81, 1),
        ),

        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
                children: [
                  Container(
                      color: Colors.white54,
                      height: 70,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.home_outlined),
                                  color: Colors.indigo,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Home()),
                                    );
                                  },
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.list),
                                  color: Colors.indigo,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => material()),
                                    );
                                  },
                                ),
                                Text(
                                  'Listar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.update),
                                  color: Colors.indigo,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ActualizarProducto()),
                                    );
                                  },
                                ),
                                Text(
                                  'Actualizar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete_forever_outlined),
                                  color: Colors.indigo,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EliminarProducto()),
                                    );
                                  },
                                ),
                                Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                          ]
                      )
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Color.fromRGBO(15, 27, 81, 1),
                    elevation: 8,
                    margin: EdgeInsets.only(left:20, right: 20, top: 10),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 30, right: 30,bottom: 30, top: 50),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _codigoMaterialController,
                              decoration: InputDecoration(
                                labelText: "Codigo",
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo no puede estar vacío';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                            ),



                            SizedBox(height: 25,),
                            TextFormField(
                              controller: _nombreMaterialController,
                              decoration: InputDecoration(
                                labelText: "Nombre del material",
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo no puede estar vacio';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              controller: _cantidadMaterialController,
                              decoration: InputDecoration(
                                labelText: "Cantidad del material",
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo no puede estar vacio';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              controller: _proveedorController,
                              decoration: InputDecoration(
                                labelText: "Proveedor del material",
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo no puede estar vacio';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                            ),

                            SizedBox(height: 40),
                            OutlinedButton(
                              onPressed: _enviarFormularioMate,
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                side: BorderSide(color: Colors.white),
                                backgroundColor: Colors.black,
                                minimumSize: Size(100, 50),
                              ),
                              child: Text(
                                "Enviar datos",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}