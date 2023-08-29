import 'package:flutter/material.dart';

class opcionesProd extends StatelessWidget {
  const opcionesProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            margin: EdgeInsets.only( left: 10),
            color: Colors.grey,
          ),

          Container(
            width: 100,
            height: 80,
            margin: EdgeInsets.only( left: 280),
            color: Colors.blue,
          ),

          Container(
            width: 350,
            height: 60,
            margin: EdgeInsets.only(top: 90, left: 30),
            color: Colors.white,
          ),



          Container(
            margin: EdgeInsets.only(left: 30, right: 40, top: 200),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.transparent,
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
                      MaterialPageRoute(builder: (context) => opcionesProd()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/agragar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset('img/agragar.png'),
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
                    "Agregar Producto",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),







          Container(
            margin: EdgeInsets.only(left: 30, right: 40, top: 380),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.transparent,
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
                      MaterialPageRoute(builder: (context) => opcionesProd()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/actualizar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset('img/actualizar.png'),
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
                    "Actualizar Producto",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),



          Container(
            margin: EdgeInsets.only(left: 30, right: 40, top: 560),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.transparent,
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
                      MaterialPageRoute(builder: (context) => opcionesProd()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(),
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/eliminar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset('img/eliminar.png'),
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
                    "Eliminar Producto",
                    style: TextStyle(color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),


        ],

      ),

    );
  }
}
