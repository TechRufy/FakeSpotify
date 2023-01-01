import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(200)),
    borderSide: BorderSide(color: color, width: 1.0),
  );
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: _buildBorder(Colors.grey),
            constraints: const BoxConstraints(maxWidth: 150),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: const TextStyle(color: Colors.white),
            hoverColor: Colors.grey,
            filled: true,
            fillColor: Colors.grey,
            border: _buildBorder(Colors.grey),
            focusedBorder: _buildBorder(Colors.grey)),
        textTheme: const TextTheme(
          bodyText1:
              TextStyle(color: Colors.black, fontFamily: "Century Gothic"),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32.0),
          children: <Widget>[
            Image.asset(
              "immagini/logo.png",
              height: 200.0,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Email"),
              ),
              cursorColor: Colors.grey,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Century Gothic",
              ),
              textAlignVertical: TextAlignVertical.center,
              controller: emailEditingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "inserisci qualcosa";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Password"),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "Century Gothic",
                ),
              ),
              style: const TextStyle(color: Colors.white),
              textAlignVertical: TextAlignVertical.center,
              controller: passEditingController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "inserisci qualcosa";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
              onPressed: (() {
                autenticazione(emailEditingController.text,
                    passEditingController.text, context);
              }),
              child:
                  Text(style: Theme.of(context).textTheme.bodyText1, "log in"),
            ),
          ],
        ),
      ),
    );
  }
}

void autenticazione(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: "buonasera",
              )));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      print('No user exists with this email.');
    } else if (e.code == 'wrong-password') {
      print('Incorrect Password.');
    }
  }
}
