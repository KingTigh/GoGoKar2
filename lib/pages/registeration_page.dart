import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/text_box.dart';
import '../components/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  // Text editing controllers
  final usernameController1 = TextEditingController();
  final usernameController2 = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();

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
              Icons.account_circle,
              size: 100,
            ),

            const SizedBox(height: 30),

            // Welcome message
            Text("Welcome to GoGoKar! Let's get Started.",
                style: GoogleFonts.poppins(color: c1, fontSize: 18)),

            // Username TextField
            MyTextField(
              hintText: "Enter your Email",
              obscureText: false,
              controller: usernameController1,
            ),
            MyTextField(
              hintText: "Choose a Username",
              obscureText: false,
              controller: usernameController1,
            ),

            // Password Feld
            MyTextField(
              hintText: "Create a Password",
              obscureText: true,
              controller: passwordController1,
            ),
            MyTextField(
              hintText: "Repaeat Password",
              obscureText: true,
              controller: passwordController2,
            ),

            const SizedBox(
              height: 20,
            ),

            // Sign in button
            MyButton(
                textColor: Colors.white,
                onTap: () {},
                text: "Register              ",
                buttonColor: Colors.black),
          ])),
        )));
  }
}
