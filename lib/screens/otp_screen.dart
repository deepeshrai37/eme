import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/main.dart';
import 'package:sos/provider/auth_provider.dart';
import 'package:sos/screens/splash_screen.dart';
import 'package:sos/screens/user_information.dart';
import 'package:sos/utils/utils.dart';
import 'package:sos/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading=
        Provider.of<AuthProvider>(context,listen: true).isLoading;
    return Scaffold(
        body: Container(
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
        child:isLoading==true? Center(child: CircularProgressIndicator(color: Colors.pink,))
        :SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(height: 40,),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: ()=> Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back),
          ),
        ),
      Image.asset('assets/Logo Dochome.png'),
      SizedBox(height: 50,),
      Text('Verification Code',
      style: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      ),),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(20),
          child: Pinput(
            length: 6,
            showCursor: true,
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)
              ),
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              )
            ),
            onCompleted: (value){
               setState(() {
                 otpCode=value;
               });
            },
          ),
        ),
        SizedBox(height: 25,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(child:Text('Verify'),
              onPressed: () {
              if(otpCode!=null){
                verifyOtp(context, otpCode!);
              }else{
                showSnackBar(context, "Enter 6-digit code");
              }
            },),
          ),
        ),
        SizedBox(height: 20,),
        Text("Didn't receive any code?", style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        ),
        SizedBox(height: 20,),
        Text("Resend Code", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        ),

      ]
      ),
    ),
        ),
        );
  }

  void verifyOtp(BuildContext context, String userOtp)async{
     var sharedPref= await SharedPreferences.getInstance();
     sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
       final authprovider=Provider.of<AuthProvider>(context,listen: false);
       authprovider.verifyOtp(
           context: context,
           verificationId: widget.verificationId,
           userOtp: userOtp,
           onSuccess:(){
           authprovider.checkExisitingUser().then((value) async {
             if(value==true){

             }
             else{


               Navigator.pushAndRemoveUntil(context,
                   MaterialPageRoute(builder:(context)=>UserInfoScreen()),
                       (route) => false);
             }
           });
       });
  }
}
