import 'package:flutter/material.dart';
import 'package:galter/home.dart';
import 'package:http/http.dart' as HP;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class InsertarUser extends StatefulWidget {
  const InsertarUser({Key? key}) : super(key: key);

  @override
  State<InsertarUser> createState() => _InsertarUserState();
}

class _InsertarUserState extends State<InsertarUser> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();

  File? _image;

  void _pickImage() async{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null){
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }


  void _enviarFormulario() async{
    if(_formkey.currentState!.validate()){
      final String apiUrl="http://10.190.88.170/registroUser";
      final Map<String, dynamic> requestBody={
        'password1':_passwordController.text,
        'last_login':null,
        'is_superuser':true,
        'username':_usernameController.text,
        'pasword2': _password2Controller.text,
        'email':_emailController.text,
        'is_staff':false,
        'is_active':true,
        'date_joined':"2023/08/29",
        'rol':_rolController.text,
        base64Encode(_image!.readAsBytesSync()) : null,
        'documento':_documentoController.text,
      };

      Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));


      final respuesta = await HP.post(Uri.parse(apiUrl),
        headers: {
          'Content-type':'application/json'
        },
        body: json.encode(requestBody),
      );

      if (respuesta.statusCode==200){
        print('datos enviados miso');
      }else{
        print('error en el envio');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("insertar user"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _documentoController,
                decoration: InputDecoration(labelText: "documento"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15,),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Nombre de Usuario"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Correo Electronico"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Contraseña"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15,),
              TextFormField(
                controller: _password2Controller,
                decoration: InputDecoration(labelText: "confirmar contraseña"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15,),
              TextFormField(
                controller: _rolController,
                decoration: InputDecoration(labelText: "Rol"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              _image != null
                  ? Image.file(_image!,height: 200, width: 300)
                  :Container(),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('seleccionar imagen'),
              ),
              ElevatedButton(
                  onPressed: _enviarFormulario,
                  child: Text("Enviar datos")
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _image {
}