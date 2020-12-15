import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phod/services/auth.dart';
import 'package:flutter_phod/helpers/constants.dart';
import 'package:flutter_phod/pages/loading.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter_phod/controllers/authController.dart';
import 'package:flutter_phod/pages/sign_up.dart';

class SignIn extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return loading ? Loading() : Scaffold(
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true
        , title: Text("Sign in to Legereme")
        , actions: <Widget>[
            FlatButton.icon(
                  icon: Icon(Icons.person)
                , label: Text('Sign up')
                , onPressed: ()  {  Get.to(SignUp() ); }
              ),
            ],
        ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                controller: emailController,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => (val.length < 8) ? "Enter password 8+ chars long" : null,
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue[900],
                child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white)
                  ),
                onPressed: () async {
                  controller.login( emailController.text, passwordController.text );
                }
              ),
              SizedBox( height: 12.0),
              /*
              RaisedButton(
                onPressed: () {
                  dynamic resp = _auth.signInAnon();
                  if ( resp == null ) {
                    setState( () {
                      error = 'Could not sign in with those credentials';
                      loading = false;
                    });
                  }
                },
                child: Text("Sign in Anonymously")
              ),
              SizedBox( height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.redAccent, fontSize: 14.0),
              ),

               */
              RaisedButton(
                onPressed: () { Get.to( SignUp() ); },
                child: Text("Create Account")
              ),
              Text("(Accounts are only necessary to use Prayer List)"),
              Text("Prayer List cost is \$1/year"),
              Text("To help defray database costs"),

            ]
          )
        )
    );
  }
}
