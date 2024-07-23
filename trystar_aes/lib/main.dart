import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/providers/auth_provider.dart';
import 'package:trystar_aes/screens/login_screen.dart';
import 'package:trystar_aes/screens/home_screen.dart';
import 'package:trystar_aes/utils/router.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp(
            title: 'Flutter App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: authProvider.isAuthenticated ? HomeScreen() : LoginScreen(),
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
