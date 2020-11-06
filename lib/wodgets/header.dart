import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluuterdemo/widgets/datosfirebase.dart';
import 'background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:fluuterdemo/lista.dart';

class Headerlnitial extends StatelessWidget {
  final formKey = new GlobalKey<FormState>();
  String mensaje = '';
  String email;
  String password;

  TextEditingController controlEmail = new TextEditingController();
  TextEditingController controlPassword = new TextEditingController();

  Headerlnitial({
    this.email,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    final buttom = new InkWell(
      child: new Container(
        margin: new EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
        height: 50.0,
        width: 100.0,
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                  color: Color(0xFFf38b02),
                  offset: new Offset(10.0, 10.0),
                  blurRadius: 30)
            ],
            borderRadius: new BorderRadius.circular(30.0),
            color: Color(0xFFfeb800)),
        child: new Center(
          child: new Text("Ir a Mapa",
              style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );


void _validarcampos(){
      final form = formKey.currentState;
      /*return form.validate() ? true:false;*/
      if(form.validate()){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Listado() /*{
          return datosfirebase();
        }*/));
        print("validado");
      }else{
        print("Invalido");
        }
  }
    /*
    bool _validarcampos() {
      //final form = formKey.currentState;
      //return form.validate() ? true : false;
      /*if (form.validate()) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return datos_firebase();
        }));
        print("validado");
      } else {
        print("Invalido");
      }
    */
    }
  */
    void validar_ingreso(String email, String password) async {
      //funcion de iniciar sesion con email y password en firebase
      Firebase.initializeApp();
      final form = formKey.currentState;
      form.validate() ? true : false;
      if (form.validate()) {
        print("Validado");
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => {
                  print("Ya esta validado joven"),
                  Toast.show("Bienvenido",
                  context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return datos_firebase();
          })),
        })
        .catchError((error) => {
          print("error al logearse $email"),
          FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
              FirebaseAuth.instance.currentUser.sendEmailVerification().then((value) => {print("correo enviado")})
              .catchError((error) => {print("No se envio el correo")}),
              print("Validado joven"),
              Toast.show("Usuario creado prro",
                  context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),
        })
      .catchError((error) => {
          print("error al logearse $email"),
          FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
              FirebaseAuth.instance.currentUser.sendEmailVerification().then((value) => {print("correo enviado")})
              .catchError((error) => {print("No se envio el correo")}),
              print("Validado joven"),
              Toast.show("Usuario creado prro",
                  context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM),
    })
    }
  
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new BackGroudInitial(),
        new Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            margin: new EdgeInsets.only(
              top: 50.0,
            ),
            child: new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new Text(
                    "UNIANDES",
                    style: const TextStyle(
                        fontSize: 55.0,
                        color: Colors.white,
                        fontFamily: 'RobotMono'),
                  ),
                  new Text(
                    "",
                    style: const TextStyle(
                        fontSize: 55.0,
                        color: Colors.white,
                        fontFamily: 'RobotMono'),
                  ),
                  new TextFormField(
                    controller: controlEmail,
                    decoration: new InputDecoration(labelText: 'email'),
                    validator: (value) =>
                        value.isEmpty ? 'El campo usuario esta vacío' : null,
                    onSaved: (value) => email = value,
                  ),
                  new TextFormField(
                    controller: controlPassword,
                    decoration: new InputDecoration(labelText: 'password'),
                    validator: (value) =>
                        value.isEmpty ? 'El campo contraseña esta vacío' : null,
                    onSaved: (value) => password = value,
                    obscureText: true,
                  ),
                  new RaisedButton(
                      child: new Text("Ingresar"),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () => validar_ingreso(
                          controlEmail.text, controlPassword.text)),
                  buttom,
                ],
              ),
            ))
      ],
    ));
  }
}
