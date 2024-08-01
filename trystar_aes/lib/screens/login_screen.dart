import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trystar_aes/appSettings.dart';
import 'package:trystar_aes/dataModels/epicorLocations.dart';
import 'package:trystar_aes/providers/auth_provider.dart';
import 'package:trystar_aes/providers/epicor_integration_provider.dart';



/// User login screen.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}


class _LoginScreen extends State<LoginScreen> {

  /// Houses the user selection of the Epicor Environment
  String? selectedEpicorEnvironmentKey;
  /// Houses the user selection of the Epicor Site
  String? selectedEpicorSiteID;
  /// Houses the list of sites for the Environment that the user selectes
  List<EpicorSite> epicorSites = [];

  final _inputFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppSettings.backgroundBlack,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppSettings.backgroundBlack, 
                AppSettings.backgroundDarkRed
              ],
              begin: Alignment.topCenter, 
              end: Alignment.bottomCenter, 
            )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Form(
                key: _inputFormKey,
                child: Column(
                  children: 
                  [
                    
                    // Trystar Logo
                    SizedBox(
                      height: 120,
                      width: 128,
                      child: Image.asset('assets/icons/app_icon_foreground.png',
                        fit: BoxFit.cover,)
                    ),

                    // Epicor Environment
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: Column(
                        children: [
                          
                          // Epicor Environment Label
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Epicor Environment",
                              style: TextStyle(
                                color: AppSettings.textGrey,
                                fontSize: 25
                              ),
                            ),
                          ),

                          // Epicor Environment Selection
                          SizedBox(
                            width: 250,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              iconSize: 0, // Hides the dropdown icon
                              borderRadius: BorderRadius.circular(9),
                              dropdownColor: AppSettings.backgroundBlack,
                              style: const TextStyle( // Adding this empty option disables the default Bold selection style
                              ),
                              value: selectedEpicorEnvironmentKey,
                              items: AppSettings.epicorLocations.map((EpicorLocations location) {
                                return DropdownMenuItem<String>(
                                  value: location.key,
                                  alignment: Alignment.center,
                                  child: Text(location.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppSettings.textGrey,
                                      fontSize: 25
                                    ),  
                                  ),
                                );
                              }).toList(),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Environment Required";
                                }
                                else {
                                  return null;
                                }
                              },
                              onChanged: (locationKey) {
                                  _updateEpicorSite(locationKey);
                              },
                            )
                          )
                        ],
                      ),
                    ),

                    // Epicor Site
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                      child: Column(
                        children: [
                      
                          // Epicor Site Label
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Epicor Site",
                              style: TextStyle(
                                color: AppSettings.textGrey,
                                fontSize: 25
                              ),
                            ),
                          ),

                          // Epicor Site Selection
                          SizedBox(
                            width: 250,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              iconSize: 0, // Hides the dropdown icon
                              borderRadius: BorderRadius.circular(9),
                              dropdownColor: AppSettings.backgroundBlack,
                              style: const TextStyle( // Adding this empty option disables the default Bold selection style
                              ),
                              value: selectedEpicorSiteID,
                              items: epicorSites.map((EpicorSite site) {
                                return DropdownMenuItem<String>(
                                  value: site.siteID,
                                  alignment: Alignment.center,
                                  child: Text(site.description,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppSettings.textGrey,
                                      fontSize: 25
                                    ),  
                                  ),
                                );
                              }).toList(),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Site Required";
                                }
                                else {
                                  return null;
                                }
                              },
                              onChanged: (siteID) {
                                setState(() {
                                  selectedEpicorSiteID = siteID;
                                });
                              },
                            )
                          )
                        ],
                      ),
                    ),

                    // Epicor Username
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                      child: Column(
                        children: [
                      
                          // Username Label
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Username",
                              style: TextStyle(
                                color: AppSettings.textGrey,
                                fontSize: 24
                              ),
                            ),
                          ),

                          // Username
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: _usernameController,
                              style: const TextStyle(
                                color: AppSettings.textGrey,
                                fontSize: 24
                              ),
                              cursorColor: AppSettings.textGrey,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppSettings.textGrey),
                                )
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Username Required";
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Epicor Password
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                      child: Column(
                        children: [
                      
                          // Password Label
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Password",
                              style: TextStyle(
                                color: AppSettings.textGrey,
                                fontSize: 24
                              ),
                            ),
                          ),

                          // Password
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(
                                color: AppSettings.textGrey,
                                fontSize: 24
                              ),
                              cursorColor: AppSettings.textGrey,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppSettings.textGrey),
                                )
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return "Password Required";
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Log in Button
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: WidgetStateProperty.resolveWith<Color?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.pressed)) {
                                return AppSettings.textGrey; 
                              }
                              return null;
                            }
                          )
                        ),
                        onPressed: (){
                          // Validate input fields and log in
                          if(_inputFormKey.currentState!.validate()) {
                            // Set the server settings
                            Provider.of<EpicorIntegrationProvider>(context, listen: false).setEpicorURL(selectedEpicorEnvironmentKey!);
                            Provider.of<EpicorIntegrationProvider>(context, listen: false).setEpicorSite(selectedEpicorSiteID!);

                            // Try logging in
                            Provider.of<AuthProvider>(context, listen: false).login(
                              _usernameController.text, 
                              _passwordController.text, 
                              Provider.of<EpicorIntegrationProvider>(context, listen: false).epicorURL
                              );
                            // TODO Need a notifier if login failed
                          }
                        }, 
                        child: const Text("Login",
                          style: TextStyle(
                            color: AppSettings.textGrey,
                            fontSize: 24
                          ),
                        ),
                      )
                    )
                  ],
                ),
              )
            )
          )
        ),
      ),
    );
  }


  /// Updates the list of Epcior sites for the Epicor Environment. The String could be null if no selection is made
  void _updateEpicorSite(String? locationKey) {
    if(locationKey != null) {
      // Set the sites using the location Key
      setState(() {
        selectedEpicorEnvironmentKey = locationKey;
        epicorSites = AppSettings.epicorLocations.where((x) => x.key == locationKey).first.sites; 
      });
    }
  }


}


