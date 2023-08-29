import 'package:flutter/material.dart';
import 'package:galter/admi.dart';
import 'package:galter/insertarUser.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(2, 0, 108, 1), Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 200,
                margin: EdgeInsets.only(bottom: 250),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),


              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IniciarSesionView()));
                  },
                  child:Container(
                    width: 250,
                    height: 60,
                    margin: EdgeInsets.only(left:30, top: 480),
                    padding: EdgeInsets.only(left: 90,top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          child: Text("Entrar",
                            style: TextStyle(decoration: TextDecoration.none,
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
              ),




              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InsertarUser()));
                  },
                  child:Container(
                    width: 250,
                    height: 60,
                    margin: EdgeInsets.only(left:30, top: 580),
                    padding: EdgeInsets.only(left: 65,top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 2.0,
                      )
                    ),
                    child: Stack(
                      children: [
                        Container(
                          child: Text("Registrarse",
                            style: TextStyle(decoration: TextDecoration.none,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Principal(),
  ));
}
