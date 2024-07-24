import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/appSettings.dart';
import 'package:trystar_aes/providers/auth_provider.dart';
import 'package:trystar_aes/screens/login_screen.dart';
import 'package:trystar_aes/screens/home_screen.dart';
import 'package:trystar_aes/utils/router.dart';





void main() {
  runApp(const TrystarAES());
}

class TrystarAES extends StatelessWidget {
  const TrystarAES({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {

          return MaterialApp(
            title: AppSettings.appName,
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
