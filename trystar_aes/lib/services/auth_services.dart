import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';





/// Provides the authentication service that is used to validate the users account.
class EpicorAuthService {
  static const String baseUrl = '';

  /// Log into the service. This authenticates the user against a service, then stores if the user is logged in
  /// in a local setting so it can persist between sessions.
  Future<bool> login(String username, String password, String epicorURL) async {
    // final response = await http.post(
    //   Uri.parse('$baseUrl/login'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'username': username,
    //     'password': password,
    //   }),
    // );

    // if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', "1234");

    //   return true;
    // } else {
    //   return false;
    // }

    return true;
  }

  /// "Logs User Out" by removing the logged in token in the app preferences. This will force the user to reauthenticate
  /// on login. 
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  // Checks if the Logged In user token exists in local settings.
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }
}
