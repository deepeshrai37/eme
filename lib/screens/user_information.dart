import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/model/user_model.dart';
import 'package:sos/provider/auth_provider.dart';
import 'package:sos/screens/intro_screen.dart';
import 'package:flutter/services.dart';
import 'package:sos/utils/utils.dart';
import 'package:sos/widgets/custom_button.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? image;
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phoneController_one=TextEditingController();
  TextEditingController phoneController_two=TextEditingController();
  TextEditingController phoneController_three=TextEditingController();
  TextEditingController phoneController_four=TextEditingController();
  TextEditingController phoneController_five=TextEditingController();
  @override
  void dispose(){
    super.dispose();
    namecontroller.dispose();
    phoneController_one.dispose();
    phoneController_two.dispose();
    phoneController_three.dispose();
    phoneController_four.dispose();
    phoneController_five.dispose();
  }

  void selectImage() async{
    image=await pickImage(context);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final isLoading=
        Provider.of<AuthProvider>(context,listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child:Container(
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
          padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
          child: Center(
            child: Column(
              children: [
                Text('User Information', style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 30,),
                InkWell(
                  onTap:()=>selectImage(),
                  child: image==null?const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Icon(Icons.account_circle,size: 50,color: Colors.pinkAccent,),
                  )
                      :CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 50,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      textField(
                          hintText: "Your Full Name",
                          icon:Icons.verified_user,
                          inputType: TextInputType.text,
                          maxLines:1,
                          controller: namecontroller
                      ),
                         SizedBox(height: 20,),
                         textField(
                             hintText: "Enter Guardians Contact No.",
                             icon:Icons.phone,
                             inputType: TextInputType.phone,
                             maxLines:1,
                             controller: phoneController_one
                         ),
                      SizedBox(height: 20,),
                      textField(
                          hintText: "Enter Spouse Contact No.",
                          icon:Icons.phone,
                          inputType: TextInputType.phone,
                          maxLines:1,
                          controller: phoneController_two
                      ),
                      SizedBox(height: 20,),

                      textField(
                          hintText: "Enter Friends contact No.",
                          icon:Icons.phone,
                          inputType: TextInputType.phone,
                          maxLines:1,
                          controller: phoneController_three
                      ),
                      SizedBox(height: 20,),
                      textField(
                          hintText: "Enter Neighbour contact No.",
                          icon:Icons.phone,
                          inputType: TextInputType.phone,
                          maxLines:1,
                          controller: phoneController_four
                      ),
                      SizedBox(height: 20,),
                      textField(
                          hintText: "Enter Office contact No.",
                          icon:Icons.phone,
                          inputType: TextInputType.phone,
                          maxLines:1,
                          controller: phoneController_five
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.80,
                  child: CustomButton(text: 'Continue', onPressed: () {
                        storeData();
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
                  },),
                )

              ],
            ),
          ),
        ),
        )
      ),
    );
  }

  Widget textField({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller
  })
  {
    return Padding(
    padding:EdgeInsets.only(bottom: 10),
    child: TextFormField(
      cursorColor: Colors.pinkAccent,
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon:Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pinkAccent
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
            hintText: hintText,
            hintStyle: TextStyle(fontSize:15 ,fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.black)
            ),
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.black)
            ),
            alignLabelWithHint: true,
            border: InputBorder.none,
            fillColor: Colors.white.withOpacity(0.6),
            filled: true
        ),

      ),
    );
}

//store user data to Database

void storeData() async{
    final authprovider=Provider.of<AuthProvider>(context,listen: false);
    UserModel userModel=UserModel(
        name: namecontroller.text.trim(),
        friend: phoneController_three.text.trim(),
        office: phoneController_five.text.trim(),
        spouse: phoneController_two.text.trim(),
        guardian: phoneController_one.text.trim(),
        neighbour: phoneController_four.text.trim(),
        createdAt: "",
        uid: "",
        phoneNumber:"",
        profilePic:"",
    );

    if(image!=null){
      authprovider.saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          profilePic: image!,
          onSuccess:(){
            authprovider.saveUserDataToSP().then((value) => authprovider.setSignIn().then((value) => 
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>IntroScreen()), (route) => false)));
          } ,
      );
    }else{
      showSnackBar(context, "Please Upload your Profile Pic");
    }
}

}
