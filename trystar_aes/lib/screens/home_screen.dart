import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/providers/auth_provider.dart';







class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
//TODO: Check if the user is still logged in before going back
      canPop: true, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
        body: Center(child: Text('Welcome to the home page!')),
      ),
    );
  }
}
