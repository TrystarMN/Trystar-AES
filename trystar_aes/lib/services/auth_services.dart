import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trystar_aes/dataModels/epicorLocations.dart';





/// Provides the authentication service that is used to validate the users account.
class EpicorAuthService {
  
  /// Log into the service. This authenticates the user against a service, then stores if the user is logged in
  /// in a local setting so it can persist between sessions.
  static Future<Map<bool, String>> login(String username, String password, EpicorLocation epicorLocation) async {

    // Encode the credentials
    String credentialsRaw = '$username:$password';
    // Encode cred
    String credentials = base64Encode(const Utf8Encoder().convert(credentialsRaw));

    // Try to get the apikey. This will throw is it's empty
    String apiKey = "";
    try {

      apiKey = epicorLocation.apiKey;

    } catch (ex) {

      print("Error: No API Key Found");
      return { false : ex.toString() };
    }

    // Add auth headers
    var headers = {
      'x-api-key': apiKey,
      'Authorization': 'Basic $credentials'
    };

    // Call Epicor so see if we can login
    http.Response? response;
    try {

      response = await http.get(Uri.parse(epicorLocation.fullAPIPath), headers: headers);

    } catch (ex) {
      print("Failed to log in.");
      return { false : "Failed to log in." };
    }
  
    print(response.statusCode);

    // Login succesful
    if (response.statusCode == 200) {
      
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Creates a random token to recognize if a user is logged in. This is not a API or Auth token, merly an 
      // obvuscated indicator that the user has succesfully logged in by way of the token value existing or not.
      prefs.setString('token', Random().nextInt(100).toString());

      print("Succesfull Login");
      return { true : "Successfully Logged In." };
    } 
    // Login Failed
    else {
      print("Failed login");
      return { false : "Failed to Log In." };
    }
  }

  /// "Logs User Out" by removing the logged in token in the app preferences. This will force the user to reauthenticate
  /// on login. 
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  /// Checks if the Logged In user token exists in local settings.
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  /// Gets the API Key for the Epicor Environment. 
  /// The environment variable is set during the app build process and identified by the app server URL (see README)
  static String getAPIKey(EpicorLocation location) {
    
    // Gets the api key from environment variables that are set during build
    //const String apiKey = String.fromEnvironment("https://epicor.trystar.com/dmzpilot/");
    String apiKey = Platform.environment[location.serverURL] ?? "";

    print(location.serverURL);
    print(location.fullAPIPath);
    print(apiKey);

    if(apiKey.isEmpty) {
      throw Exception("No API Key Found");
    }

    return apiKey;
  }


}
