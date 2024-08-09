import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/settings/appSettings.dart';
import 'package:trystar_aes/providers/auth_provider.dart';
import 'package:trystar_aes/providers/epicor_integration_provider.dart';
import 'package:trystar_aes/screens/login_screen.dart';
import 'package:trystar_aes/screens/home_screen.dart';
import 'package:trystar_aes/services/auth_services.dart';
import 'package:trystar_aes/utils/router.dart';





void main() {
  runApp(const TrystarAES());
}

class TrystarAES extends StatelessWidget {
  const TrystarAES({super.key});

  @override
  Widget build(BuildContext context) {
    // Building this out with a MultiProvider framework in case in the future you need to add additional providers to the app.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => EpicorIntegrationProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {

          return MaterialApp(
            title: AppSettings.appName,
            theme: ThemeData(
              textSelectionTheme: const TextSelectionThemeData(
                selectionHandleColor: AppSettings.textGrey,
              ),
            ),
            home: const LoginScreen(),

            // home: authProvider.isAuthenticated ? HomeScreen() : LoginScreen(),

            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
