// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trystar_aes/appSettings.dart';
// import 'package:trystar_aes/providers/auth_provider.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           //title: Text('Gradient Background'),
//           backgroundColor: Color.fromARGB(255, 19, 21, 22),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color.fromARGB(255, 19, 21, 22), Color.fromARGB(255, 21, 24, 25)],
//                 stops: [0.4, 1],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 170,
//                   width: 178,
//                   child: Image.asset(
//                     'assets/icons/app_icon_foreground.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 // App Name
//                 Padding(
//                   padding: EdgeInsets.only(top: 10),
//                   child: Text(
//                     AppSettings.appShortName,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                       fontFamily: 'Tradegothic',
//                     ),
//                   ),
//                 ),
//                 // Epicor Environment
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//                   child: Container(
//                     height: 100,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(9),
//                       color: Colors.white.withOpacity(0.8),
//                     ),
//                     child: const Column(
//                       children: [
//                         // Epicor Environment Label
//                         Padding(
//                           padding: EdgeInsets.only(top: 5),
//                           child: Text(
//                             "Epicor Environment",
//                             style: TextStyle(fontSize: 24),
//                           ),
//                         ),
//                         // Epicor Environment Selection
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Epicor Site
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//                   child: Container(
//                     height: 100,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(9),
//                       color: Colors.white.withOpacity(0.8),
//                     ),
//                     child: const Column(
//                       children: [
//                         // Epicor Site Label
//                         Padding(
//                           padding: EdgeInsets.only(top: 5),
//                           child: Text(
//                             "Epicor Site",
//                             style: TextStyle(fontSize: 24),
//                           ),
//                         ),
//                         // Epicor Site Selection
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Epicor Login
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//                   child: Container(
//                     height: 100,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(9),
//                       color: Colors.white.withOpacity(0.8),
//                     ),
//                     child: Column(
//                       children: [
//                         // Username Label
//                         Padding(
//                           padding: EdgeInsets.only(top: 5),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Username",
//                               style: TextStyle(fontSize: 24),
//                             ),
//                           ),
//                         ),
//                         // Username
//                         Padding(
//                           padding: EdgeInsets.all(0),
//                           child: SizedBox(
//                             child: TextField(
//                               controller: _usernameController,
//                               decoration: InputDecoration(
//                                 labelText: 'Username',
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Password Label
//                         Padding(
//                           padding: EdgeInsets.only(top: 5),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Password",
//                               style: TextStyle(fontSize: 24),
//                             ),
//                           ),
//                         ),
//                         // Password
//                         Padding(
//                           padding: EdgeInsets.all(0),
//                           child: SizedBox(
//                             child: TextField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                               ),
//                               obscureText: true,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // SizedBox(height: 20),
//                 // ElevatedButton(
//                 //   onPressed: () async {
//                 //     final username = _usernameController.text;
//                 //     final password = _passwordController.text;
//                 //     final success = await Provider.of<AuthProvider>(context, listen: false)
//                 //         .login(username, password);
//                 //     if (success) {
//                 //       Navigator.of(context).pushReplacementNamed('/home');
//                 //     } else {
//                 //       // Handle error
//                 //     }
//                 //   },
//                 //   child: Text('Login'),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/appSettings.dart';
import 'package:trystar_aes/providers/auth_provider.dart';



class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //title: Text('Gradient Background'),
          backgroundColor: Color.fromARGB(255, 19, 21, 22),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 19, 21, 22), Color.fromARGB(255, 21, 24, 25)],
              stops: [0.4, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                width: 178,
                child: Image.asset('assets/icons/app_icon_foreground.png',
                  fit: BoxFit.cover,)
              ),

              // App Name
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  AppSettings.appShortName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Tradegothic',
                  ),
                ),
              ),

              // Epicor Environment
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white.withOpacity(0.8)
                  ),
                  child: const Column(
                    children: [
                      
                      // Epicor Environment Label
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Epicor Environment",
                          style: TextStyle(
                            fontSize: 24
                          ),
                        ),
                      ),

                      // Epicor Environment Selection

                    ],
                  ),
                ),
              ),

              // Epicor Site
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white.withOpacity(0.8)
                  ),
                  child: const Column(
                    children: [
                  
                      // Epicor Site Label
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Epicor Site",
                          style: TextStyle(
                            fontSize: 24
                          ),
                        ),
                      ),

                      // Epicor Site Selection

                      
                    ],
                  ),
                ),
              ),

              // Epicor Login
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white.withOpacity(0.8)
                  ),
                  child: const Column(
                    children: [
                  
                      // Username Label
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Username",
                            style: TextStyle(
                              fontSize: 24
                            ),
                          )
                        ),
                      ),

                      // Username
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(


                          child: TextField(),
                        ),
                      )

                      // Password Label


                      // Password

                      
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




        // Column(
        //   children: [
            
            
            
            
            // TextField(
            //   controller: _usernameController,
            //   decoration: InputDecoration(labelText: 'Username'),
            // ),
            // TextField(
            //   controller: _passwordController,
            //   decoration: InputDecoration(labelText: 'Password'),
            //   obscureText: true,
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () async {
            //     final username = _usernameController.text;
            //     final password = _passwordController.text;
            //     final success = await Provider.of<AuthProvider>(context, listen: false)
            //         .login(username, password);
            //     if (success) {
            //       Navigator.of(context).pushReplacementNamed('/home');
            //     } else {
            //       // Handle error
            //     }
            //   },
            //   child: Text('Login'),
            // ),
        //   ],
        // ),


        
      