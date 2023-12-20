/*
import 'dart:async';

import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:first_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink
      ),
      home:MySplashPage(),
    );
  }
}

class MySplashPage extends StatefulWidget{

  @override
  State<MySplashPage> createState() => MySplashPageState();
}

class MySplashPageState extends State<MySplashPage>{


  static const String KEYLOGIN="Login";
  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF5E98) ,Color(0xFF1A1D74),
                  ],
                  begin: FractionalOffset(1.0,0.0),
                  end:FractionalOffset(0.0,1.0)
              )
          ),
          child: Center(
            child: RippleAnimation(
                key: UniqueKey(),
                repeat: true,
                duration: Duration(milliseconds: 2300),
                ripplesCount: 20,
                minRadius: 120,
                size: Size.fromHeight(150),
                color: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/Sos.png'),
                  maxRadius: 25,
                )

            ),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void whereToGo() async{
    var sharedPref= await SharedPreferences.getInstance();
    var isLoggedIn= sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds:5),(){
      if(isLoggedIn !=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> HomePage(),));
        }else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=> LoginPage(),));
        }
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> LoginPage(),));
      }
    },);

  }
}*/
