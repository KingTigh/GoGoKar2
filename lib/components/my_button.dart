import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color buttonColor;
  final Color textColor;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: text,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: textColor,
                  )),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(left: 150.0),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
