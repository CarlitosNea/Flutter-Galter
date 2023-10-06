import 'package:flutter/material.dart';
import 'package:galter/actualizarProd.dart';
import 'package:galter/eliminar/eliminarProd.dart';
import 'package:galter/home.dart';
import 'package:galter/insertar/insertarProducto.dart';
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
    final url = Uri.parse("http://192.168.35.43/produc");
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
        title: Text(
          'Productos',
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
            height: 70,// Personaliza el color de fondo de la barra de navegación
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
                          MaterialPageRoute(builder: (context) => insertarProd()),
                        );
                      },
                    ),
                    Text(
                      'Agregar',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black, // Puedes personalizar el color del texto
                        fontWeight: FontWeight.bold, // Puedes personalizar la fuente y el estilo del texto
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
                        color: Colors.black, // Puedes personalizar el color del texto
                        fontWeight: FontWeight.bold, // Puedes personalizar la fuente y el estilo del texto
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
                          MaterialPageRoute(builder: (context) => EliminarProducto()),
                        );
                      },
                    ),
                    Text(
                      'Eliminar',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black, // Puedes personalizar el color del texto
                        fontWeight: FontWeight.bold, // Puedes personalizar la fuente y el estilo del texto
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
                      columnSpacing: 30,
                      headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey,
                      ),
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
                            'Tiempo',
                            style: TextStyle(color: Colors.black),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text(
                            'Longitud',
                            style: TextStyle(color: Colors.black),
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text(
                            'Material',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Precio',
                            style: TextStyle(color: Colors.black),
                          ),
                          numeric: true,
                        ),
                      ],
                      rows: datos.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Text(
                                  item['codi_prod'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: EdgeInsets.only(right: 1),
                                child: Text(
                                  item['nomb_prod'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  item['tiempo_prod'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  item['long_prod'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text(
                                  item['material_prod'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  item['prec_prod'],
                                  style: TextStyle(color: Colors.white),
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
          ),
        ],
      ),
    );

  }

}




