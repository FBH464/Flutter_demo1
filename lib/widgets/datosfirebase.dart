import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class datos_firebase extends StatefulWidget {
  @override
  _datos_firebaseState createState() => _datos_firebaseState();
}

final conexionFirebase =
    FirebaseDatabase.instance.reference().child('Usuarios').child('Persona');

class _datos_firebaseState extends State<datos_firebase> {
  _functionStartAnonymous() async {
    FirebaseApp initFirebase = await Firebase.initializeApp();
    var result = (await FirebaseAuth.instance.signInAnonymously()).user;
    if (result != null) {
      setState(() {
        var idUser = result.uid;
        print('se inició correctamente el usuario: $idUser');
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _functionStartAnonymous();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: new Text("Prueba"),
      ),
    );
  }
}
