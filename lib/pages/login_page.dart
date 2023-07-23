import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/components/square_tile.dart';
import 'package:loginpage/services/auth_services.dart';
import '../components/theme.dart';
import '../components/text_box.dart';
import '../components/my_button.dart';
import 'registeration_page.dart';
import '../components/route_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // Sign in user
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // pop loading circle
    Navigator.pop(context);
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }

    // pop the loading circle
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Invalid Email"));
        });
  }

  // wrong email message popup
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Incorrect Password"));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1,
      ),
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            const SizedBox(height: 30),

            // logo
            const Icon(
              Icons.lock_outlined,
              size: 100,
            ),

            const SizedBox(height: 30),

            // Welcome message
            Text("Welcome back! Please Sign in Below.",
                style: GoogleFonts.poppins(color: c1, fontSize: 18)),

            // Username TextField
            MyTextField(
              hintText: "Username",
              obscureText: false,
              controller: usernameController,
            ),

            // Password Feld
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),

            const SizedBox(
              height: 20,
            ),

            // Sign in button
            MyButton(
                textColor: Colors.white,
                onTap: signUserIn,
                text: "Sign In              ",
                buttonColor: Colors.black),

            // Register Option
            const SizedBox(height: 40),
            Text(
              "New to GoGoKar?",
              style: GoogleFonts.poppins(color: c1, fontSize: 15),
            ),
            MyButton(
              textColor: c1,
              buttonColor: background,
              text: "                     Register Now",
              onTap: () {
                Navigator.of(context).push(createRoute(RegistrationPage()));
              },
            ),

            // OR Continue text
            Text(
              "----Or continue with----",
              style: GoogleFonts.poppins(),
            ),
            //Google login + apple login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Button
                SquareTile(
                  imagePath: 'assets/images/googlelogo.png',
                  onTap: () => AuthService().signInWithGoogle(),
                ),
                // Apple Button
              ],
            )
          ])),
        ),
      ),
    );
  }
}
