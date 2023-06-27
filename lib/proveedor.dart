import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class Proveedor extends StatefulWidget {
  const Proveedor({Key? key}) : super(key: key);

  @override
  State<Proveedor> createState() => _ProveedorState();
}

class _ProveedorState extends State<Proveedor> {
  List<dynamic> datos = [];

  Future<void> consultaProveedor() async {
    final url = Uri.parse("direccion/proveedor");
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
    consultaProveedor();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proveedores'),
      ),
      body: ListView.builder(itemCount: datos.length,
        itemBuilder: (context, index) {
          final item = datos [index];
          return ListTile(
            title: Text(item['']),
            subtitle: Row(
              children: [
                Text(item['']),
                SizedBox(height: 10,),
                Text(item['']),
              ],
            ),
          );
        },
      ),
    );
  }
}