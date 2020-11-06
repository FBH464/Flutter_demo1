import 'package:flutter/material.dart';
import 'package:fluuterdemo/wodgets/background.dart';
import 'package:fluuterdemo/lista.dart';

class Header extends StatelessWidget {
  final forkey = new GlobalKey<FormState>();
  String email;
  String password;
  //FormType formType = FormType.Login;
  TextEditingController ControlUsuario = new TextEditingController();
  TextEditingController ControlPassword = new TextEditingController();
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
    void _validarcampos() {
      final form = forkey.currentState;
      //return form.validate() ? true:false;
      if (form.validate()) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Listado() /*{
          return datosfirebase();
        }*/
                ));
        print("validado");
      } else {
        print("Invalido");
      }
    }
    /* void validar_ingreso(String email, String password) async {
      if(_validarcampos()) {
        try {
          FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
          print('Signed in: ${user.uid}');
        } catch (e) {
          print('Error : $e');
        }
        //funcion de inicio de sesion con correo electronico y contraseña de firebase
        /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return datosfirebase();
        }));*/
      }
    }*/
    /*enum FormType{
     login,
    register
    }
    class HeaderInitial extends state<LoginPage>{
     final formKey
    }
    void _validaringreso () async{
      if(_validarcampos()){
        try{
          FirebaseApp initFirebase = await Firebase.initializeApp();
          if(_formType == FormType.login){
            var ingreso_user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
            if (ingreso_user != null) {
              setState((){
                var iduser = ingreso_user.uid;
                print('Ingresando con ID: $iduser');
              });}
          } else if (_formType == FormType.register) {
            var registro_user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
            if (registro_user != null) {
              setState((){
                var iduser = registro_user.uid;
                print('Registro exitoso a la base de datos con ID: $iduser');
              });}
          }
        }catch(e){
          print('Error al ingresar: $e');
        }
        /*Navigator.push(context, MaterialPageRoute(builder: (context){
        return datosFirebase();
        }));*/
      }
    }*/

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
              key: forkey,
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
                    "_UNIANDES",
                    style: const TextStyle(
                        fontSize: 55.0,
                        color: Colors.white,
                        fontFamily: 'RobotMono'),
                  ),
                  new TextFormField(
                    controller: ControlUsuario,
                    decoration: new InputDecoration(labelText: 'email'),
                    validator: (value) =>
                        value.isEmpty ? 'El campo usuario esta vacío' : null,
                    onSaved: (value) => email = value,
                  ),
                  new TextFormField(
                    controller: ControlPassword,
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
                      onPressed: () => _validarcampos()),
                  buttom,
                ],
              ),
            ))
      ],
    ));
  }
}
