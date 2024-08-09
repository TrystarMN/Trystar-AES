import 'package:flutter/material.dart';
import 'package:trystar_aes/dataModels/epicorLocations.dart';
import 'package:trystar_aes/settings/appSettings.dart';



/// Provides the class to manage the Epicor Integration Settings. This is an abstract class and not the auth provider itself.
class EpicorIntegrationProvider with ChangeNotifier {

  /// Holds the Epicor Location object
  EpicorLocation? _epicorLocation;
  EpicorLocation get epicorLocation => _epicorLocation!;

  /// Holds the Epicor Site
  String _epicorSite = "";
  String get epicorSite => _epicorSite;

  /// Sets the Epicor URL from its key
  void setEpicorLocation(EpicorLocation epicorLocation) {
    _epicorLocation = epicorLocation;
  }

  /// Sets the Epicor Site
  void setEpicorSite(String epicorSite) {
    _epicorSite = epicorSite;
  }

}
