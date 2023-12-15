import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/screens/chat_screen.dart';
import 'package:my_app/constants.dart';
import 'package:flutter/material.dart';

class PasswordResetScreen extends StatefulWidget {
  static String id = "reset_screen";

  const PasswordResetScreen({super.key});

  @override
  PasswordResetScreenState createState() => PasswordResetScreenState();
}

class PasswordResetScreenState extends State<PasswordResetScreen> {
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
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Ingrese su correo '),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                child: const Text('Restablecer Contraseña'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  //Si el correo existe
                  try {
                    await _auth
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()));
                    });
                    print('Iniciaste sesion correctamente');
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
