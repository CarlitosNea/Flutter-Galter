import 'package:flutter/material.dart';
import 'package:galter/home.dart';
import 'dart:convert';
import 'package:http/http.dart' as HP;

class IniciarSesionView extends StatefulWidget {
  const IniciarSesionView({Key? key}) : super(key: key);

  @override
  State<IniciarSesionView> createState() => _IniciarSesionViewState();
}

class _IniciarSesionViewState extends State<IniciarSesionView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Future<void> _enviarInicioSesion() async{
    print("entrada 1");
    final Map<String, String> data ={

      'username' : _usernameController.text,
      'password' : _passwordController.text,
    };
    print('dos');
    try{
      final response = await HP.post(
          Uri.parse('http://192.168.1.87/iniciarSesion'),
          headers: {
            'content-type' : 'application/json'
          },
          body: json.encode(data)
      );
      if(response.statusCode == 200){
        print('ok');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else{
        print('error en la solicitud: ${response.statusCode}');
        print('error : ${response.body}');
      }
    } catch(e){
      print('excepcion: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(2, 0, 108, 1), Colors.black],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 180),
              width: 300,
              height: 200,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                      color: Colors.transparent,
                    ),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Nombre de usuario",
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),


                  Container(
                    width: 300,
                    height: 60,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                      color: Colors.transparent,
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey)
                      ),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 320,
            height: 50,
            margin: EdgeInsets.only(top: 500, left: 50),
            child: ElevatedButton(
              onPressed: _enviarInicioSesion,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
              child: Text('Ingresar',
              style: TextStyle(
                fontSize: 20
              ),),
            ),
          ),


          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()));
              },
              child:Container(
                width: 250,
                height: 60,
                margin: EdgeInsets.only(left:30, top: 800),
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
        ],
      ),
    );
  }


}
