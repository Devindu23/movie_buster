// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_bee/main.dart';
// import 'package:provider/provider.dart';

// import '../UtilitiesList/app_state.dart';
// import '../UtilitiesList/authentication.dart';

// class loginPage extends StatefulWidget {
//   const loginPage({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return loginPageState();
//   }
// }

// class loginPageState extends State<loginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/background blur.jpg"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 "assets/Moviee Bee Logo.png",
//                 height: 200.0, // adjust the height as needed
//               ),
//               const SizedBox(height: 20.0),
//               const SizedBox(height: 40.0),
//               Consumer<ApplicationState>(
//                 builder: (context, appState, _) => AuthFunc(
//                   loggedIn: appState.loggedIn,
//                   signOut: () {
//                     FirebaseAuth.instance.signOut();
//                   },
//                 ),
//               ),
//               const SizedBox(height: 40.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Home()),
//                   );
//                 },
//                 child: const Text(
//                   'Movie Bee →',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
