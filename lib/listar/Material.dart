import 'package:flutter/material.dart';
import 'package:galter/actualizarProd.dart';
import 'package:galter/eliminar/eliminarMate.dart';
import 'package:galter/eliminar/eliminarProd.dart';
import 'package:galter/home.dart';
import 'package:galter/insertar/insertarMaterial.dart';
import 'package:galter/insertar/insertarProducto.dart';
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
    final url = Uri.parse('http://192.168.20.43/matt');
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
        body: Column(
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
                        icon: Icon(Icons.add_box_outlined),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => insMaterial()),
                          );
                        },
                      ),
                      Text(
                        'Agregar',
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
                        icon: Icon(Icons.update),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActualizarProducto()),
                          );
                        },
                      ),
                      Text(
                        'Actualizar',
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
                        icon: Icon(Icons.delete_forever_outlined),
                        color: Colors.indigo,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EliminarMaterial()),
                          );
                        },
                      ),
                      Text(
                        'Eliminar',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(
                child: Container(
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
                          columnSpacing: 50,
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                          border: TableBorder(
                            horizontalInside: BorderSide(color: Colors.white, width: 3),
                          ),
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
                                        color: Colors.white),
                                  ),
                                ),
                                DataCell(
                                  Padding(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text(
                                      item['nomb_mate'],
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      item['cant_mate'],
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      item['proveedor_mate'],
                                      style: TextStyle(
                                          color: Colors.white),
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


            ))
          ],
        ),
      );





  }
}