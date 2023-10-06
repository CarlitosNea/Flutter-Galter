import 'package:flutter/material.dart';
import 'package:galter/listar/Material.dart';
import 'package:galter/masOpciones.dart';
import 'package:galter/principal.dart';
import 'package:galter/listar/producto.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(15, 27, 81, 1),
        child: Column(
          children: [
            Row(
              children: [
                // Container(
                //   margin: EdgeInsets.only(bottom: 280),
                //   width: 350,
                //   height: 50,
                //   color: Colors.white,
                // ),
                Container(
                  margin: EdgeInsets.only(top: 200, left: 30),
                  height: 250,
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Producto()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/producto.png'),
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
                          "Listar Productos",
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
                  margin: EdgeInsets.only(top: 200, left: 30),
                  height: 250,
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => material()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 25),
                          width: 135,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/material.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => material()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Text(
                          "Listar Materiales",
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
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  height: 250,
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Material()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 25),
                          width: 135,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('img/calculadora.png'),
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
                          "Calculadora",
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
                  margin: EdgeInsets.only(left: 30, top: 20),
                  height: 250,
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => masOpciones()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 25),
                            width: 135,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('img/opciones.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => masOpciones()
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Text(
                            "Mas Opciones",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]),
                ),






                // SizedBox(height: 20),
                // GestureDetector(
                //     onTap: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Principal()));
                //     },
                //     child: Container(
                //       height: 60,
                //       width: 250,
                //       margin: EdgeInsets.only(left: 30, top: 480),
                //       padding: EdgeInsets.only(left: 90, top: 15),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       child: Stack(
                //         children: [
                //           Container(
                //             child: Text(
                //               "Salir",
                //               style: TextStyle(
                //                 decoration: TextDecoration.none,
                //                 fontSize: 25,
                //                 color: Colors.black,
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
            )
          ],
        ),
      ),
    );
  }
}

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
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
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

//         ],
//       ),
//       )
//
//     );
//   }
// }

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
