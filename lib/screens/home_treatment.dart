import 'package:flutter/material.dart';

class HomeTreatment extends StatefulWidget {
  const HomeTreatment({super.key});

  @override
  State<HomeTreatment> createState() => _HomeTreatmentState();
}

class _HomeTreatmentState extends State<HomeTreatment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: ()=> Navigator.of(context).pop(),
                      child: Container(
                          padding:EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back)),
                    ),
                  ),
                  SizedBox(width: 55,),
                  Text('Home Treatment',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 34624125.png'),
                        SizedBox(height: 5),
                        Text('Skin Care')
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 34624126.png'),
                        SizedBox(height: 5),
                        Text('Dental Care')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 34624127.png'),
                        SizedBox(height: 5),
                        Text('Hair Care')
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 34624128.png'),
                        SizedBox(height: 5),
                        Text('Physiotherapy')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: CircleAvatar(
          backgroundColor: Colors.pinkAccent,
          child: Text('SOS', style: TextStyle(
              color: Colors.white
          ),),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Colors.blueAccent),
          child: Padding(padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Image.asset('assets/Vector (5).png'),
                    ),
                    Text('Home',style: TextStyle(fontSize: 6),)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/image 14.png'),
                    ),
                    Text('Appointment',style: TextStyle(fontSize: 6),)
                  ],
                ),
                SizedBox(width: 24,),
                Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/image 16.png'),
                    ),
                    Text('Message',style: TextStyle(fontSize: 6),)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/image 15.png'),
                    ),
                    Text('User',style: TextStyle(fontSize: 6),)
                  ],
                ),
              ],
            ),),
        ),
      ),
    );
  }
}
