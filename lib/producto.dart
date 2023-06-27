import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class Producto extends StatefulWidget {
  const Producto({Key? key}) : super(key: key);

  @override
  State<Producto> createState() => _ProductoState();
}

class _ProductoState extends State<Producto> {
  List<dynamic> datos = [];

  Future<void> consultaProducto() async {
    final url = Uri.parse("http://10.190.80.47/Producto");
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
    consultaProducto();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(itemCount: datos.length,
        itemBuilder: (context, index) {
          final item = datos [index];
          return ListTile(
            title: Text(item['codi_prod']),
            subtitle: Row(
              children: [
                Text('Nombre: '),
                Text(item['nomb_prod']),
                SizedBox(height: 30,),
                SizedBox(width: 20,),
                Text('Material'),
                Text(item['material_prod']),
              ],
            ),
          );
        },
      ),
    );
  }
}