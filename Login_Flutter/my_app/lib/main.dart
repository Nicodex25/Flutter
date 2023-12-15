import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/recuperar_contrase%C3%B1a.dart';
import 'package:my_app/pages/registro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/registro': (context) => const RegistroPage(),
        '/recuperar_contraseña': (context) => const RemmemberPasswordPage(),
      },
    );
  }
}
