import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/repository/google_sign_in.dart';
import 'src/resources/login&register/login.dart';
import 'src/resources/myMainPage/my_main.dart';
import 'package:firebase_core/firebase_core.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) =>GoogleSignInProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

}

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            return MyMainPage();
          }else if(snapshot.hasError){
            return Center(child:Text('Something went wrong'),);
          }else{
            return LoginPage();
          }
        }
      ),
    );
  }

}
