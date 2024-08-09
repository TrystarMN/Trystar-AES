import 'package:flutter/material.dart';
import 'package:trystar_aes/dataModels/epicorLocations.dart';
import 'package:trystar_aes/services/auth_services.dart';



/// Provides the class to manage logging in and out of the app. This is an abstract class and not the auth provider itself.
class AuthProvider with ChangeNotifier {

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  AuthProvider() {
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    _isAuthenticated = await EpicorAuthService.isLoggedIn();
    notifyListeners();
  }

  Future<Map<bool, String>> login(String username, String password, EpicorLocation epicorLocation) async {
    
    Map<bool,String> loginResults = await EpicorAuthService.login(username, password, epicorLocation);
    _isAuthenticated = loginResults.keys.first;

    notifyListeners();
    return loginResults;
  }

  Future<void> logout() async {

    await EpicorAuthService.logout();
    _isAuthenticated = false;

    notifyListeners();
  }
}
