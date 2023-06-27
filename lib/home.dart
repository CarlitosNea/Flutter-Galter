import 'package:flutter/material.dart';
import 'package:galter/cliente.dart';
import 'package:galter/pedido.dart';
import 'package:galter/producto.dart';
import 'package:galter/proveedor.dart';
import 'package:galter/usuario.dart';
import 'package:galter/Material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pedido()),
                );
              },
              child: Text("Pedido"),
            ),
          ),

          SizedBox(height: 15,),

          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Producto()),
                );
              },
              child: Text("Producto"),
            ),
          ),

          SizedBox(height: 15,),

          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => material()),
                );
              },
              child: Text("Material"),
            ),
          ),

          SizedBox(height: 15,),

          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cliente()),
                );
              },
              child: Text("Cliente"),
            ),
          ),

          SizedBox(height: 15,),

          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Usuario()),
                );
              },
              child: Text("Usuario"),
            ),
          ),

          SizedBox(height: 15,),

          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Proveedor()),
                );
              },
              child: Text("Proveedor"),
            ),
          ),

          SizedBox(height: 30,),

        ],
      ),
    );
  }
}
