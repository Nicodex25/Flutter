import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/screens/chat_screen.dart';
import 'package:my_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "Registration_screen";

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Ingrese un correo electronico'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Ingrese una contraseña'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
                child: const Text('Registrarse'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  //Create new Account
                  try {
                    await _auth
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()));
                      // Mensaje por consola
                      print('Cuenta Registrada correctamente');
                    });
                  } catch (e) {
                    print(e);
                  }
                }),
            ElevatedButton(
                child: const Text('Volver a Iniciar Sesión'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  //Regresar
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                })
          ],
        ),
      ),
    );
  }
}
