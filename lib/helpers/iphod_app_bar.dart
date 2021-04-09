import 'package:flutter/material.dart';
import 'package:legereme/pages/authenticate.dart';
import 'package:legereme/services/auth.dart';

AppBar IphodAppBar({String title}) {
  final AuthService _auth = AuthService();
    return AppBar(
          centerTitle: true
        , title: Text(title)
        , actions: <Widget>[
            if ( _auth == null ) FlatButton.icon(
                  icon: Icon(Icons.person)
                  , label: Text('Sign up')
                  , onPressed: ()  { Authenticate(); }
              )
            else FlatButton.icon(
                icon: Icon(Icons.person)
                , label: Text('logout')
                , onPressed: () async {
              await _auth.signOut();
            }
            )
        ]
    );
}

