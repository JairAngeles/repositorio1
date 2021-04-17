import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //TextEditingController nombreTextController;
  //TextEditingController apTextController;
  String usuario;
  String password;

  FocusNode usuarioFocus;
  FocusNode passwordFocus;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Twitter')),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.network(
                      'https://help.twitter.com/content/dam/help-twitter/brand/logo.png',
                      height: 150),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Usuario', prefixIcon: Icon(Icons.person)),

                  //controller: nombreTextController,
                  //autofocus: true,
                  onSaved: (value) {
                    usuario = value;
                  },
                  focusNode: this.usuarioFocus,
                  onEditingComplete: () {
                    requestFocus(context, passwordFocus);
                  },
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Este campo no puede estar vacío';
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  //controller: apTextController,
                  //autofocus: false,
                  onSaved: (value) {
                    password = value;
                  },
                  focusNode: this.passwordFocus,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Error';
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue, style: BorderStyle.solid),
                  ),
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (formkey.currentState.validate()) {
                        formkey.currentState.save();
                        if (usuario.compareTo('Jair Ramirez') == 0 &&
                            password.compareTo('pandas99') == 0) {
                          Navigator.pushNamed(context, 'formulario dos',
                              arguments: Argumentos(
                                  usuario: this.usuario,
                                  password: this.password));
                        } else {
                          print(' Error de validacion');
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Text(
                      'Lo que esta pasando ahora. Unute a Twitter hoy mismo'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void initState() {
    super.initState();
    usuarioFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    //nombreTextController.dispose();
    //apTextController.dispose();
    usuarioFocus.dispose();
    passwordFocus.dispose();
  }
}

class Argumentos {
  String usuario;
  String password;

  Argumentos({this.usuario, this.password});
}
