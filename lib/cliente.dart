import 'package:flutter/material.dart';
import 'package:galter/insertarCliente.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class Cliente extends StatefulWidget {
  const Cliente({Key? key}) : super(key: key);

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {

  List<dynamic> datos=[];

  Future<void> consultaCliente() async{
    final url = Uri.parse('http://10.190.80.47/Cliente');
    final respuesta = await HP.get(url);

    if (respuesta.statusCode == 200){
      print('conectado');
      final jsonResponse = json.decode(respuesta.body);
      setState(() {
        datos = jsonResponse;
      });
    }
    else{
      print('Error en la conexion');
    }
  }
  void initState(){
    super.initState();
    consultaCliente();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body:Stack(
        children: [
          ListView.builder(itemCount: datos.length,
            itemBuilder: (context,index){
              final item = datos [index];
              return ListTile(
                title: Text(item['nombre_cliente']),
                subtitle: Row(
                  children: [
                    Text('Telefono: '),
                    Text(item['telefono_cliente']),
                    SizedBox(height: 30,),
                    SizedBox(width: 20,),
                    Text('Direccion: '),
                    Text(item['direccion']),
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
                        MaterialPageRoute(builder: (context) => insCliente()),
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