import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:galter/actualizarProd.dart';
import 'package:galter/eliminar/eliminarProd.dart';
import 'package:galter/home.dart';
import 'package:galter/listar/producto.dart';
import 'package:http/http.dart' as HP;

class insertarProd extends StatefulWidget {
  const insertarProd({Key? key}) : super(key: key);

  @override
  _insertarProdState createState() => _insertarProdState();
}

class _insertarProdState extends State<insertarProd> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _codiProdController = TextEditingController();
  final TextEditingController _nombreProdController = TextEditingController();
  final TextEditingController _tiempoProdController = TextEditingController();
  final TextEditingController _longitudProdontroller = TextEditingController();
  final TextEditingController _materialProdController = TextEditingController();
  final TextEditingController _precioProdController = TextEditingController();


  void _enviarFormularioProd() async{
    if (_formkey.currentState!.validate()){
      final String apiUrl="http://192.168.35.43/insertarProd/";
      final Map<String, dynamic> requestBody={
        'codi_prod' : _codiProdController.text,
        'nomb_prod' : _nombreProdController.text,
        'tiempo_prod' : _tiempoProdController.text,
        'long_prod' : _longitudProdontroller.text,
        'material_prod' : _materialProdController.text,
        'prec_prod' : _precioProdController.text,
      };

      Navigator.push(context, MaterialPageRoute(builder: (context) => Producto()));

      final respuesta = await HP.post(Uri.parse(apiUrl),
        headers: {
          'Content-type':'aplication/json'
        },
        body: json.encode(requestBody),
      );

      if (respuesta.statusCode == 200){
        print("datos enviados");
      }
      else{
        print("error en el envio");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Insertar Producto"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(15, 27, 81, 1),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
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
                          icon: Icon(Icons.list),
                          color: Colors.indigo,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Producto()),
                            );
                          },
                        ),
                        Text(
                          'Listar',
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
                              MaterialPageRoute(builder: (context) => EliminarProducto()),
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

                  ]
                )
              ),
              SizedBox(height: 20),
              Card(
                color: Color.fromRGBO(15, 27, 81, 1),
                elevation: 8,
                margin: EdgeInsets.only(left:20, right: 20, top: 10),
                child: Padding(
                  padding:  EdgeInsets.only(left: 30, right: 30,bottom: 30, top: 50),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _codiProdController,
                          decoration: InputDecoration(
                            labelText: "Codigo",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo no puede estar vacío';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),



                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _nombreProdController,
                          decoration: InputDecoration(
                            labelText: "Nombre del producto",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo no puede estar vacio';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _tiempoProdController,
                          decoration: InputDecoration(
                            labelText: "Tiempo de produccion",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo no puede estar vacio';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _longitudProdontroller,
                          decoration: InputDecoration(
                            labelText: "Longitud del producto",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo no puede estar vacio';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _materialProdController,
                          decoration: InputDecoration(
                            labelText: "Material del producto",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo no puede estar vacio';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: _precioProdController,
                          decoration: InputDecoration(
                            labelText: "Precio del producto",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Este campo no puede estar vacio';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 40),
                        OutlinedButton(
                          onPressed: _enviarFormularioProd,
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            side: BorderSide(color: Colors.white),
                            backgroundColor: Colors.black,
                            minimumSize: Size(100, 50),
                          ),
                          child: Text(
                            "Enviar datos",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )




                      ],
                    ),
                  ),
                ),
              ),
            ]
          )
        )
      );
  }
}
