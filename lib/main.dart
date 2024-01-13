import 'package:elite_ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elite',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

// for user authentications --------------------

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: FutureBuilder(
//         future: RememberUserPrefs.readUserInfo(),
//         builder: (context, dataSnapshot) {
//           if(dataSnapshot.data == null) {
//             return LoginScreen();
//           } else {
//             return UserMainScreen();
//           }
//         },
//       ),
//     );
//   }
// }