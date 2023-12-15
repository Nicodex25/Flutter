# Añadir dependencias 
# Manualmente en el archivo pubspec.yaml
# Linea de codigo a editar
dependencies:
  flutter:
  sdk: flutter
  firebase_core: ^2.24.2          --> Añadir
  cloud_firestore: ^4.13.6        --> Añadir
  firebase_auth: ^4.15.3          --> Añadir

---------------------------------------------------------------------------------
# De forma Automatica por comandos
# firebase_core
flutter pub add firebase_core
flutter pub get firebase_core

# firebase auth
flutter pub add firebase_auth

# firebase cloudstore
flutter pub add cloud_firebase

---------------------------------------------------------------------------------

# Instalar la CLI Flutter (Necesitas node.js) y ejecutarlo en powershell
npm install -g firebase-tools

# Iniciar sesion en Firebase
Firebase login

# Activar la CLI si ya la tienes instalada
dart pub global activate flutterfire_cli

# Ejecutar para configurar la base de datos
flutterfire configure

# Ejecutar la app
-> Abrir Visual Studio Code
-> Entrar en la ruta /my_app

# Ejecutar
flutter run
