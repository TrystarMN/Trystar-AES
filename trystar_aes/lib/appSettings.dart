import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trystar_aes/dataModels/epicorLocations.dart';





/// Provides global settings for the app as a static class.
class AppSettings {

  // Decision of the Business Systems team was to hardcode the server settings since they are basically static.
  /// Epicor location information, like Environments, URLs, and Sites.
  static final List<EpicorLocations> epicorLocations = 
  [
    // Production
    EpicorLocations(
      serverURL: "https://ts-e11-prodapp/e11prod", 
      name: "Production",
      sites: 
        [
          EpicorSite(siteID: "MfgSys", description: "Trystar Faribault"),
        ]
    ),

    // Pilot
    EpicorLocations(
      serverURL: "https://ts-e11-devapp/e11pilot", 
      name: "Pilot",
      sites: 
        [
          EpicorSite(siteID: "MfgSys", description: "Trystar Faribault"),
        ]
    ),

    // Test
    EpicorLocations(
      serverURL: "https://ts-e11-devapp/e11test", 
      name: "Test",
      sites: 
        [
          EpicorSite(siteID: "MfgSys", description: "Trystar Faribault"),
        ]
      ),
  ];

  

  /// Name of the app that is used throughout the Dart Code. The app label on the device is set in the pubspec.yaml file.
  static const String appName = "Trystar AES";

  /// Short name of the app 
  static const String appShortName = "AES";

  /// Background Black
  static const Color backgroundBlack = Color.fromARGB(255, 19, 21, 22);

  /// Background Red
  static const Color backgroundDarkRed = Color.fromARGB(255, 37, 4, 5);

  /// Box Grouping Grey
  static const groupGrey = Color.fromARGB(255, 224, 224, 224);

  /// General Text Grey
  static const textGrey = Colors.white60;
}