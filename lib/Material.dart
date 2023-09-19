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
    final url = Uri.parse('http://10.190.88.120/matt');
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
          title: Text(
            'Materiales',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(15, 27, 81, 1),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(15, 27, 81, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 40,
                  headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.grey),
                  columns: [
                    DataColumn(
                      label: Text(
                        'Código',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Nombre',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Cantidad',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Proveedor',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                  rows: datos.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            item['codi_mate'],
                            style: TextStyle(
                                color: Colors.white), // Texto blanco
                          ),
                        ),
                        DataCell(
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Text(
                              item['nomb_mate'],
                              style: TextStyle(
                                  color: Colors.white), // Texto blanco
                            ),
                          ),
                        ),
                        DataCell(
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              item['cant_mate'],
                              style: TextStyle(
                                  color: Colors.white), // Texto blanco
                            ),
                          ),
                        ),
                        DataCell(
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Text(
                              item['proveedor_mate'],
                              style: TextStyle(
                                  color: Colors.white), // Texto blanco
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );





  }
}