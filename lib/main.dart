import 'package:flutter/material.dart';

import 'login&register/login.dart';

void main() {
  runApp(MyAstrology());
}

class MyAstrology extends StatefulWidget{
  @override
  State<MyAstrology> createState() {
    return _RunMyAstrology();
  }
}

class _RunMyAstrology extends State<MyAstrology>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPage(),
      },
    );
  }
}
