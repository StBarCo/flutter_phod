import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/helpers/constants.dart';
import 'package:flutter_phod/services/auth.dart';
import 'package:flutter_phod/pages/loading.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
          centerTitle: true
        , title: Text("Sign up for Legereme")
        , actions: <Widget>[
            FlatButton.icon(
               icon: Icon(Icons.person)
             , label: Text('Sign up')
              , onPressed: ()  {  widget.toggleView(); }
            )
          ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter Email' : null,
                      onChanged: (val) {
                        setState( () => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => (val.length < 8) ? "Enter password 8+ chars long" : null,
                      onChanged: (val) {
                        setState( () => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.blue[900],
                      child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white)
                      ),
                      onPressed: () async {
                        if( _formKey.currentState.validate() ) {
                          setState( () => loading = true );
                          dynamic resp = await _auth.registerWithEmailAndPassword(email, password);
                          if ( resp == null ) {
                            setState( () {
                              error = 'please supply a valid email address';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox( height: 12.0,),
                    Text(
                      error,
                      style: TextStyle(color: Colors.redAccent, fontSize: 14.0),
                    )
                  ]
              )
          )
      ),
    );
  }
}
