import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:galter/listar/producto.dart';
import 'package:http/http.dart' as http;

class ActualizarProducto extends StatefulWidget {
  @override
  _ActualizarProductoState createState() => _ActualizarProductoState();
}

class _ActualizarProductoState extends State<ActualizarProducto> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreProdController = TextEditingController();
  final TextEditingController _tiempoProdController = TextEditingController();
  final TextEditingController _longitudProdController = TextEditingController();
  final TextEditingController _materialProdController = TextEditingController();
  final TextEditingController _precioProdController = TextEditingController();

  void _cargarProductoPorCodigo() async {
    final String codigo = _codigoController.text;

    if (codigo.isEmpty) {
      // Manejar el caso en que el código esté vacío
      return;
    }

    final apiUrl = "http://192.168.1.87/obtener_producto_por_codigo/?codi_prod=$codigo";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> productoData = json.decode(response.body);
        setState(() {
          _nombreProdController.text = productoData['nomb_prod'];
          _tiempoProdController.text = productoData['tiempo_prod'];
          _longitudProdController.text = productoData['long_prod'];
          _materialProdController.text = productoData['material_prod'];
          _precioProdController.text = productoData['prec_prod'];
        });
      } else {
        // Manejar el error, por ejemplo, mostrar un mensaje de error
        print("Error al obtener los detalles del producto");
      }
    } catch (error) {
      // Manejar el error de la solicitud
      print("Error en la solicitud: $error");
    }
  }

  void _enviarFormularioProd() async {
    if (_formkey.currentState!.validate()) {
      final String codigo = _codigoController.text;
      final String apiUrl = "http://192.168.1.87/actualizar_producto/";

      final Map<String, dynamic> requestBody = {
        'codi_prod': codigo, // Usamos el código ingresado por el usuario
        'nomb_prod': _nombreProdController.text,
        'tiempo_prod': _tiempoProdController.text,
        'long_prod': _longitudProdController.text,
        'material_prod': _materialProdController.text,
        'prec_prod': _precioProdController.text,
      };

      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        print("Datos actualizados");
        // Puedes agregar una navegación aquí para volver a la pantalla de lista de productos
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Producto()),
        );
      } else {
        // Manejar el error, por ejemplo, mostrar un mensaje de error
        print("Error al actualizar los datos");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Producto"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(15, 27, 81, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Campo de texto para ingresar el código
            TextFormField(
              controller: _codigoController,
              decoration: InputDecoration(
                labelText: "Código del producto",
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
            // Botón para cargar los detalles del producto
            ElevatedButton(
              onPressed: _cargarProductoPorCodigo,
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(100, 50),
              ),
              child: Text(
                "Cargar Producto",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Resto del código de la interfaz de usuario (similar al de inserción)
            // ... (código similar al de inserción)

            OutlinedButton(
              onPressed: _enviarFormularioProd,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(color: Colors.black),
                backgroundColor: Colors.black,
                minimumSize: Size(100, 50),
              ),
              child: Text(
                "Actualizar datos",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
