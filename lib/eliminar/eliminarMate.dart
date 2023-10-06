import 'package:flutter/material.dart';
import 'package:galter/home.dart';
import 'package:galter/listar/Material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EliminarMaterial extends StatelessWidget {
  final TextEditingController _codigoController = TextEditingController();

  Future<void> _EliminarMaterial(BuildContext context, String codigo) async {
    final apiUrl = "http://192.168.35.43/eliminar_mate/";

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'codi_mate': codigo}),
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Éxito"),
              content: Text("Material eliminado correctamente."),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/Home');
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
              content: Text("No se pudo eliminar el material."),
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
      // Error de conexión o decodificación
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eliminar Material"),
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

                  ]
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: _codigoController,
              decoration: InputDecoration(
                labelText: "Codigo Del Material",
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
                _EliminarMaterial(context, codigo);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: Colors.black, // Fondo negro
                minimumSize: Size(100, 50), // Tamaño mínimo del botón
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