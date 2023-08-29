import 'package:flutter/material.dart';
import 'package:galter/insertarMaterial.dart';
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
    final url = Uri.parse('http://192.168.135.43/Material');
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
      body: Stack(
        children: [
          ListView.builder(itemCount: datos.length,
            itemBuilder: (context, index) {
              final item = datos [index];
              return ListTile(
                title: Text(item['codi_mate']),
                subtitle: Row(
                  children: [
                    Text('Nombre: '),
                    Text(item['nomb_mate']),
                    SizedBox(height: 30,),
                    SizedBox(width: 20,),
                    Text('Stock: '),
                    Text(item['cant_mate']),
                  ],
                ),
              );
            },
          ),
          Positioned(
              bottom: 50.0,
              right: 40.0,
              child: Container(
                width: 50,
                height: 50,
                child: ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => insMaterial()),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text("")),
              )
          )
        ],
      )

    );
  }
}