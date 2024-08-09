
import 'package:flutter/widgets.dart';
import 'package:trystar_aes/services/auth_services.dart';





class EpicorLocation {

  /// Unique key for these items
  final String key = UniqueKey().toString();

  /// The URL of the Epicor App Server.
  final String serverURL;

  /// The human readable Name of the App Server.
  final String name;

  /// The Epicor Company ID that the sites are related to
  final String companyID;

  /// List of Sites that are on this Server.
  final List<EpicorSite> sites;

  /// The API Path for the environment. Example "api/v2/"
  final String apiPath;

  /// Build the full API path. Example "<server>/<apiPath>/<companyID>/"
  String get fullAPIPath => "$serverURL$apiPath$companyID/";

  /// Gets the API Key that is set in Environment Variables during the build process
  String get apiKey => EpicorAuthService.getAPIKey(this);
  
  /// Data model that holds an Epicor Server URL, Name, and Sites.
  EpicorLocation({required this.serverURL, required this.name, required this.companyID, required this.sites, required this.apiPath});

}


class EpicorSite {

  /// The Site ID
  final String siteID;

  /// The Site Description
  final String description;

  /// Holds the values for an Epicor Site
  EpicorSite({required this.siteID, required this.description});

}