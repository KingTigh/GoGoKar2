import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/pages/auth_page.dart';
import '../components/theme.dart';
import '../components/my_button.dart';
import '../components/route_utils.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Column(
          children: [
            //Title
            SizedBox(
                height: 200,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text("GoGoKar",
                      style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: c1)),
                ))),

            //Logo
            Image.asset(
              'assets/images/Option1.PNG',
              scale: 7,
            ),

            //Caption
            SizedBox(
                height: 150,
                child: Center(
                  child: Text(
                    "Share The Journey",
                    style: GoogleFonts.poppins(fontSize: 30, color: c1),
                  ),
                )),

            //Get Started button
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: MyButton(
                textColor: Colors.white,
                buttonColor: c1,
                text: "Let's Ride",
                onTap: () {
                  Navigator.of(context).push(createRoute(const AuthPage()));
                },
              ),
            )
          ],
        ));
  }
}
