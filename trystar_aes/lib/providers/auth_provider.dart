import 'package:flutter/material.dart';
import 'package:trystar_aes/services/auth_services.dart';



/// Provides the class to manage logging in and out of the app. This is an abstract class and not the auth provider itself.
class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  AuthProvider() {
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    _isAuthenticated = await _authService.isLoggedIn();
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _isAuthenticated = await _authService.login(username, password);
    notifyListeners();
    return _isAuthenticated;
  }

  Future<void> logout() async {
    await _authService.logout();
    _isAuthenticated = false;
    notifyListeners();
  }
}