import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sos/provider/auth_provider.dart';
import 'package:sos/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



    Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
        );
      await NotificationService.initialize();


      runApp(const MyApp());
    }


    class MyApp extends StatefulWidget {
      const MyApp({super.key});

      @override
      State<MyApp> createState() => MyAppState();
    }

    class MyAppState extends State<MyApp> {

      @override
      Widget build(BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> AuthProvider()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      }


  }
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NotificationService.initialize();
//   VolumeController();
//   VolumeController().listener((volume) {
//     // Handle volume button press here
//     NotificationService.handleVolumeButtonPress();
//   });
//   runApp( const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Contact App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: RegistrationScreen(),
//     );
//   }
// }
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({super.key});
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final TextEditingController _contact1Controller = TextEditingController();
//   final TextEditingController _contact2Controller = TextEditingController();
//   int _volumeButtonPressCount = 0;
//   void _handleVolumeButtonPress() {
//     setState(() {
//       _volumeButtonPressCount++;
//       if (_volumeButtonPressCount >= 3) {
//         // Reset the count
//         _volumeButtonPressCount = 0;
//         // Get the stored contact numbers from Firebase
//             String contact1 ='+919073732801';
//             String contact2 ='+919073732801';
//             // Show the emergency notification
//             NotificationService.showNotification(contact1, contact2);
//
//
//       }
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     VolumeController().listener((volume) {
//       // Handle volume button press here
//
//       _handleVolumeButtonPress();
//     });
//   }
//   @override
//   void dispose() {
//     VolumeController().removeListener();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _contact1Controller,
//               decoration: InputDecoration(labelText: 'Contact 1'),
//             ),
//             TextField(
//               controller: _contact2Controller,
//               decoration: InputDecoration(labelText: 'Contact 2'),
//             ),
//             SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
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

    