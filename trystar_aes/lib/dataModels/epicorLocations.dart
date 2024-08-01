




import 'package:flutter/widgets.dart';

class EpicorLocations {

  /// Unique key for these items
  final String key = UniqueKey().toString();

  /// The URL of the Epicor App Server.
  final String serverURL;

  /// The human readable Name of the App Server.
  final String name;

  /// List of Sites that are on this Server.
  final List<EpicorSite> sites;

  /// Data model that holds an Epicor Server URL, Name, and Sites.
  EpicorLocations({required this.serverURL, required this.name, required this.sites});

}


class EpicorSite {

  /// The Site ID
  final String siteID;

  /// The Site Description
  final String description;

  /// Holds the values for an Epicor Site
  EpicorSite({required this.siteID, required this.description});

}