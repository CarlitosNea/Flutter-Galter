import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class material extends StatefulWidget {
  const material({Key? key}) : super(key: key);

  @override
  State<material> createState() => _materialState();
}

class _materialState extends State<material> {
  List<dynamic> datos = [];

  Future<void> consultaMaterial() async {
    final url = Uri.parse("direccion/material");
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
    consultaMaterial();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materiales'),
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