import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class Usuario extends StatefulWidget {
  const Usuario({Key? key}) : super(key: key);

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  List<dynamic> datos = [];

  Future<void> consultaUsuario() async {
    final url = Uri.parse("direccion/usuario");
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
    consultaUsuario();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
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
