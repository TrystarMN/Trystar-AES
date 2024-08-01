import 'package:flutter/material.dart';
import 'package:trystar_aes/appSettings.dart';



/// Provides the class to manage the Epicor Integration Settings. This is an abstract class and not the auth provider itself.
class EpicorIntegrationProvider with ChangeNotifier {

  /// Holds the Epicor App Server URL
  String _epicorURL = "";
  String get epicorURL => _epicorURL;

  /// Holds the Epicor Site
  String _epicorSite = "";
  String get epicorSite => _epicorSite;

  /// Sets the Epicor URL from its key
  void setEpicorURL(String environmentKey) {
    _epicorURL = AppSettings.epicorLocations.where((x) => x.key == environmentKey).first.serverURL;
  }

  /// Sets the Epicor Site
  void setEpicorSite(String epicorSite) {
    _epicorSite = epicorSite;
  }

}
