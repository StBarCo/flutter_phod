import 'package:flutter/material.dart';
import 'package:flutter_phod/pages/authenticate.dart';
import 'package:flutter_phod/services/auth.dart';

AppBar IphodAppBar({String title, BuildContext context}) {
  final AuthService _auth = AuthService();
    return AppBar(
          centerTitle: true
        , title: Text(title, style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)
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

