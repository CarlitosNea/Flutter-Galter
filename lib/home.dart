import 'package:flutter/material.dart';
import 'package:galter/Material.dart';
import 'package:galter/masOpciones.dart';
import 'package:galter/pedido.dart';
import 'package:galter/principal.dart';
import 'package:galter/producto.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 400, left: 50),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/logo.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color.fromRGBO(2, 0, 108, 0.6),
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),

          Container(
            width: 250,
            height: 80,
            margin: EdgeInsets.only(top: 50, left: 10),
            color: Colors.grey,
          ),

          Container(
            width: 100,
            height: 90,
            margin: EdgeInsets.only(top: 40, left: 280),
            color: Colors.blue,
          ),

          Container(
            width: 350,
            height: 60,
            margin: EdgeInsets.only(top: 150, left: 30),
            color: Colors.white,
          ),






          Container(
            margin: EdgeInsets.only(left: 30, right: 40, top: 260),
            height: 180,
            width: 160,
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Producto()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/producto.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset('img/producto.png'),
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
                    "Listar Productos",
                    style: TextStyle(color: Colors.white,
                    fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          //
          //
          //
          //
          //
          //
          //
          // Container(
          //   margin: EdgeInsets.only(left: 220, top: 260),
          //   height: 180,
          //   width: 160,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(
          //       color: Colors.white,
          //       width: 2,
          //     ),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => Producto()),
          //           );
          //         },
          //         child: Container(
          //           margin: EdgeInsets.only(top: 15),
          //           height: 100,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: AssetImage('img/material.png'),
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //           child: FittedBox(
          //             fit: BoxFit.contain,
          //             child: Image.asset('img/material.png'),
          //           ),
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => Material()),
          //           );
          //         },
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.transparent,
          //           elevation: 0,
          //         ),
          //         child: Text(
          //           "Listar Material",
          //           style: TextStyle(color: Colors.white,
          //           fontSize: 18),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //
          //
          //
          // Container(
          //   margin: EdgeInsets.only(left: 30, top: 500),
          //   height: 180,
          //   width: 160,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(
          //       color: Colors.white,
          //       width: 2,
          //     ),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround, // Cambiado a spaceAround
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(top: 20),
          //         height: 100,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage('img/calculadora.png'),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => Producto()),
          //             );
          //           },
          //           child: FittedBox(
          //             fit: BoxFit.contain,
          //             child: Image.asset('img/calculadora.png'),
          //           ),
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => Material()),
          //           );
          //         },
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.transparent,
          //           elevation: 0,
          //         ),
          //         child: Text(
          //           "Calculadora",
          //           style: TextStyle(color: Colors.white, fontSize: 20),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //
          //
          // Container(
          //   margin: EdgeInsets.only(left: 230, top: 500),
          //   height: 180,
          //   width: 160,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(
          //       color: Colors.white,
          //       width: 2,
          //     ),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround, // Cambiado a spaceAround
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(top: 20),
          //         height: 100,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage('img/opciones.png'),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => masOpciones()),
          //             );
          //           },
          //           child: FittedBox(
          //             fit: BoxFit.contain,
          //             child: Image.asset('img/opciones.png'),
          //           ),
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => masOpciones()),
          //           );
          //         },
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.transparent,
          //           elevation: 0,
          //         ),
          //         child: Text(
          //           "Mas Opciones",
          //           style: TextStyle(color: Colors.white, fontSize: 18),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //
          //
          // GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => Principal()));
          //     },
          //     child:Container(
          //       width: 300,
          //       height: 60,
          //       margin: EdgeInsets.only(left:60, top: 730),
          //       padding: EdgeInsets.only(left: 110,top: 15),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30),
          //           border: Border.all(
          //             color: Colors.indigo,
          //             width: 2.0,
          //           )
          //       ),
          //       child: Stack(
          //         children: [
          //           Container(
          //             child: Text("Salir",
          //               style: TextStyle(decoration: TextDecoration.none,
          //                 fontSize: 25,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           )
          //         ],
          //       ),
          //     )
          // ),

        ],
      ),

    );
  }
}





// Container(
// margin: EdgeInsets.only(left: 40,right: 40, top: 400),
// height: 50,
// width: 150,
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => Pedido()),
// );
// },
// child: Text("Pedido"),
// ),
// ),
          //



          // SizedBox(height: 40,),
          //

          //
          // SizedBox(height: 40,),
          //



          //
          // SizedBox(height: 40,),
          //
          // Container(
          //   margin: EdgeInsets.only(left: 40,right: 40),
          //   height: 50,
          //   width: 150,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Cliente()),
          //       );
          //     },
          //     child: Text("Cliente"),
          //   ),
          // ),
          //
          // SizedBox(height: 40,),
          //
          // Container(
          //   margin: EdgeInsets.only(left: 40,right: 40),
          //   height: 50,
          //   width: 150,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Usuario()),
          //       );
          //     },
          //     child: Text("Usuario"),
          //   ),
          // ),
          //
          // SizedBox(height: 40,),
          //
          // Container(
          //   margin: EdgeInsets.only(left: 40,right: 40),
          //   height: 50,
          //   width: 150,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Proveedor()),
          //       );
          //     },
          //     child: Text("Proveedor"),
          //   ),
          // ),

