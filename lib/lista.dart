import 'package:flutter/material.dart';
import 'package:fluuterdemo/registrolista.dart';

class Listado extends StatefulWidget {
  @override
  _Listado createState() => _Listado();
}

class _Listado extends State<Listado> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Registro()));
              })
        ],
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: "Producto"),
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: "Precio"),
      )
    ];
  }
}
