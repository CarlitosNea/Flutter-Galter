import 'package:flutter/material.dart';
import 'package:galter/home.dart';
import 'package:galter/listar/Material.dart';
import 'package:galter/listar/producto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EliminarProducto extends StatelessWidget {
  final TextEditingController _codigoController = TextEditingController();

  Future<void> _eliminarProducto(BuildContext context, String codigo) async {
    final apiUrl = "http://192.168.20.43/eliminar_prod/";

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'codi_prod': codigo}),
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Éxito"),
              content: Text("Producto eliminado correctamente."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Producto()));
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("No se pudo eliminar el producto."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eliminar Producto"),
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
                              MaterialPageRoute(builder: (context) => Producto()),
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

                  ]
              ),
            ),


            SizedBox(height: 30,),
            TextFormField(
              controller: _codigoController,
              decoration: InputDecoration(
                labelText: "Codigo Del Producto",
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Este campo no puede estar vacío';
                }
                return null;
              },
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final codigo = _codigoController.text;
                _eliminarProducto(context, codigo);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: Colors.black,
                minimumSize: Size(100, 50),
              ),
              child: Text(
                "Eliminar Producto",
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
    );
  }
}