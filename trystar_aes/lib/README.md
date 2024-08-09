



# Building the App

To build the app correctly, you must set the API keys for each Epicor Environment. 
To set them during a production build process, run:

'''
flutter build apk --release
  --dart-define <EpicorLocation_A_URL>=<apiKey> \
  --dart-define <EpicorLocation_B_URL>=<apiKey> \
  --dart-define <EpicorLocation_C_URL>=<apiKey> \
'''

During development, and if you're running the app from VS Code, inject these into the app by creating a launch.json file in the .vscode directory with the following code:

'''
  {
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "trystar_aes",
            "cwd": "trystar_aes",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define", "<EpicorLocation_A_URL>=<apiKey>",
                "--dart-define", "<EpicorLocation_B_URL>=<apiKey>",
                "--dart-define", "<EpicorLocation_C_URL>=<apiKey>"
            ],
        },
        {
            "name": "trystar_aes (profile mode)",
            "cwd": "trystar_aes",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "trystar_aes (release mode)",
            "cwd": "trystar_aes",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        }
    ]
}
'''