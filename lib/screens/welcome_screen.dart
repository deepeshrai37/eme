import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/provider/auth_provider.dart';
import 'package:sos/screens/home_screen.dart';
import 'package:sos/screens/register_screen.dart';

import '../widgets/custom_button.dart';

class  WelcomeScreen extends StatefulWidget {
  const WelcomeScreen ({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final authprovider=Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      body: Stack(
        children:[
          Container(
          width: 400,
          height: 800,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFF5E98).withOpacity(0.6),
                  Color(0xFF1A1D74).withOpacity(0.6),
                ],
                begin: FractionalOffset(1.0,0.0),
                end:FractionalOffset(0.0,1.0)
            ),
          ),
            child: SafeArea(

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0),
                  child: Column(
                    children: [
                      Image.asset('assets/Logo Dochome.png'),
                      SizedBox(height: 40,),
                      const Text('Welcome to DocHome Bharat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold
                        ),),
                      const Text('Your Safety, Our Priority!!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),),
                      const SizedBox(height: 40,),
                      Image.asset('assets/Frame (2).png'),

                      const SizedBox(height: 40,),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          onPressed:()async{
                            if(authprovider.isSignedIn==true){

                              await authprovider.getDataFromSP().whenComplete(() =>
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()
                                  ),
                                  ),
                              );

                            }
                            else{ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));}
                          } ,
                          text: 'Get Started',
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ),
          
        ), 

        ]
      ),
    );
  }
}
