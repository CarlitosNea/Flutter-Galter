import 'package:flutter/material.dart';
import 'package:galter/insertarMaterial.dart';
import 'package:galter/insertarProducto.dart';
import 'package:galter/insetarPedido.dart';
import 'package:galter/producto.dart';

class opcionesProd extends StatelessWidget {
  const opcionesProd({Key? key}) : super(key: key);

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
        backgroundColor: Color.fromRGBO(15, 27, 18, 1),
      ),
      body: Container(
        color: Color.fromRGBO(15, 27, 81, 1),
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 4),
                  width: 350,
                  height: 50,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(top: 60, left: 10),
                  height: 180,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => insertarProd()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/agragar.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => opcionesProd()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Text(
                          "Agregar un Producto",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),




                Container(
                  margin: EdgeInsets.only(top: 40, left: 10),
                  height: 180,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Material()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/actualizar.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Material()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Text(
                          "Actualizar Producto",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),




                Container(
                  margin: EdgeInsets.only(top: 50, left: 10),
                  height: 180,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Producto()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/eliminar.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Producto()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Text(
                          "Eliminar Producto",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
    )
      ),

    );

  }
}
