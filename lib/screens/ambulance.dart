import 'package:flutter/material.dart';
import 'package:sos/screens/appointment.dart';
import 'package:sos/screens/home_screen.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
      children: [
      const SizedBox(height: 50,),
        Row(
          children: [
          Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
          onTap: ()=> Navigator.of(context).pop(),
          child: Container(
          padding:const EdgeInsets.all(8.0),
          child: const Icon(Icons.arrow_back)),
          ),
          ),
          const SizedBox(width: 55,),
          ],
          ),
        Container(
            padding: const EdgeInsets.all(10),

            child:Image.asset('assets/Group 1000003368.png')
          ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  color: Colors.blueAccent,
                ),
                height: 120,
                  width: 150,

                child: const Column(
                  children: [
                    SizedBox(height: 13,),
                    Text('Free Ambulance', style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.phone,color: Colors.blueAccent,),
                        ),
                        Text('108',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),)
                      ],
                    )
                  ],

                ),
              ),
              const SizedBox(width: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.blueAccent,
                ),
                height: 120,
                width: 150,

                child: const Column(
                  children: [
                    SizedBox(height: 13,),
                    Text('Private Ambulance', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.phone,color: Colors.blueAccent,),
                        ),
                        Text('CALL',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),)
                      ],
                    )
                  ],

                ),
              ),
            ],
          ),
        )
          ],
        ),
          ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.pinkAccent,
        child: const CircleAvatar(
          backgroundColor: Colors.pinkAccent,
          child: Text('SOS', style: TextStyle(
              color: Colors.white
          ),),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: const IconThemeData(color: Colors.blueAccent),
          child: Padding(padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                            Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder:(context)=>HomeScreen()), (route) => false);
                      },
                      child: Image.asset('assets/Vector (5).png'),
                    ),
                    const Text('Home',style: TextStyle(fontSize: 6),)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                            Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder:(context)=>Appointment()), (route) => false);
                      },
                      child: Image.asset('assets/image 14.png'),
                    ),
                    const Text('Appointment',style: TextStyle(fontSize: 6),)
                  ],
                ),
                const SizedBox(width: 24,),
                Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/image 16.png'),
                    ),
                    const Text('Message',style: TextStyle(fontSize: 6),)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/image 15.png'),
                    ),
                    const Text('User',style: TextStyle(fontSize: 6),)
                  ],
                ),
              ],
            ),),
        ),
      ),
    );
  }
}
