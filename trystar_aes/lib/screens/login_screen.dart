import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/providers/auth_provider.dart';



class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text;
                final password = _passwordController.text;
                final success = await Provider.of<AuthProvider>(context, listen: false)
                    .login(username, password);
                if (success) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  // Handle error
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
