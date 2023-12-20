
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/provider/auth_provider.dart';

import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController=TextEditingController();
  Country selectedCountry=Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key:"");
  
  @override
  Widget build(BuildContext context) {
    phoneController.selection=TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length
      ),
    );
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Image.asset('assets/Logo Dochome.png'),
                  SizedBox(height: 100,),
                  Text('Enter your Phone no',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 50,),
                  TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    controller: phoneController,
                    onChanged: (value){
                      setState(() {
                        phoneController.text=value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Phone No.',
                      hintStyle: TextStyle(fontSize:15 ,fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.black)
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.black)
                    ),
                      prefixIcon:Container(
                        padding: const EdgeInsets.all(12.0),
                        child:InkWell(
                          onTap: (){

                                showCountryPicker(context: context,
                                    countryListTheme: CountryListThemeData(
                                      bottomSheetHeight: 600
                                    ),
                                    onSelect:(value){
                                  setState(() {
                                    selectedCountry=value;
                                  });
                                });
                          },
                          child: Text("${selectedCountry.flagEmoji}+ ${selectedCountry.phoneCode}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),),
                        ),
                      ),
                      suffixIcon: phoneController.text.length>9? Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                        ),
                        child: Icon(Icons.done,
                        color: Colors.white,
                        size: 20,),
                      ): null,
                  ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 60,
                  child:SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(text: 'Login', onPressed: ()=>sendPhoneNumber(),

                    ),
                  ) ,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
  }

  void sendPhoneNumber(){
    final authprovider=Provider.of<AuthProvider>(context,listen: false);
    String phoneNumber=phoneController.text.trim();
    authprovider.signInWithPhone(context, "+${selectedCountry.phoneCode}${phoneNumber}");
  }
}
