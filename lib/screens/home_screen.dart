import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_android_volume_keydown/flutter_android_volume_keydown.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sos/provider/auth_provider.dart';
import 'ambulance.dart';
import 'home_treatment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<HardwareButton>? subscription;
  void startListening() {
    subscription = FlutterAndroidVolumeKeydown.stream.listen((event) {
      if (event == HardwareButton.volume_down) {
        print("Volume down received");
      } else if (event == HardwareButton.volume_up) {
        NotificationService.handleVolumeButtonPress();
      }
    });
  }

  void stopListening() {
    subscription?.cancel();
  }
  int _volumeButtonPressCount = 0;
  void _handleVolumeButtonPress() {
    setState(() {
      _volumeButtonPressCount++;
      if (_volumeButtonPressCount >= 3) {
        // Reset the count
        _volumeButtonPressCount = 0;
        // Get the stored contact numbers from Firebase
            String contact1 ='+919073732801';
            String contact2 ='+919073732801';
            // Show the emergency notification
            NotificationService.showNotification(contact1, contact2);


      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final authprovider=Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 70,
        elevation: 0,
        leadingWidth: 75,
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: const CircleAvatar(
            radius: 30,
            //backgroundImage: NetworkImage(authprovider.userModel.profilePic),
            child: Icon(Icons.verified_user),
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hi !',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
            ),),

          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){},
            icon: const Icon(Icons.menu),
            color: Colors.blueAccent,
          ),

          IconButton(onPressed: (){},
            icon: const Icon(Icons.search),
            color: Colors.blueAccent,
          ),
        ],
      ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 763.png'),
                        const SizedBox(height: 5),
                        const Text('Accidental')
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 764.png'),
                        const SizedBox(height: 5),
                        const Text('Hospital')
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 765.png'),
                        const SizedBox(height: 5),
                        const Text('Hair Care')
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Image.asset('assets/Rectangle 766.png'),
                        SizedBox(height: 5),
                        Text('Home Treatment')
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
          Container(
              padding: const EdgeInsets.all(15),
              child: const Text('Categories',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),)
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeTreatment()));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.6),
                          radius: 24,
                          child: Image.asset('assets/Group 1000003365.png'),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Home Treatment',style: TextStyle(fontSize: 11),)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ambulance()));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.6),
                          radius: 24,
                          child: Image.asset('assets/Vector (2).png'),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Ambulance',style: TextStyle(fontSize: 11),)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.6),
                        radius: 24,
                        child: Image.asset('assets/Vector (3).png'),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Hospital & Clinic',style: TextStyle(fontSize: 11),)
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.6),
                        radius: 24,
                        child: Image.asset('assets/Vector (4).png'),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Heart Attack',style: TextStyle(fontSize: 11),)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.6),
                        radius: 24,
                        child: Image.asset('assets/icons8-warm-100 1.png'),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('High Fever',style: TextStyle(fontSize: 11),)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.6),
                        radius: 24,
                        child: Image.asset('assets/icons8-head-with-brain-64 1.png'),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Mental Health',style: TextStyle(fontSize: 11),)
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
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
                      onTap: (){},
                      child: Image.asset('assets/Vector (5).png'),
                    ),
                    const Text('Home',style: TextStyle(fontSize: 6),)
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){},
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

class NotificationService {
  static const MethodChannel _channel =
  MethodChannel('com.example.notification');
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  static Future<void> showNotification(String contact1, String contact2) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      'Emergency',
      'Press volume up button 3 times to send an emergency notification',
      platformChannelSpecifics,
      payload: '$contact1,$contact2',
    );
  }
  static Future<void> handleVolumeButtonPress() async {
    // Get the stored contact numbers from Firebase
    String contact1 = '+919073732801';
    String contact2 = '+919073732801';
    // Show the emergency notification
    showNotification(contact1, contact2);

  }
}
void volumeButtonCallback() {
  // Handle volume button press here
  NotificationService.handleVolumeButtonPress();
}
void setupVolumeButtonCallback() async {
  await AndroidAlarmManager.initialize();
  await AndroidAlarmManager.periodic(
    const Duration(seconds: 1),
    0,
    volumeButtonCallback,
  );
}
