import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String obscureCharacter;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  const CustomTextField({Key? key,
    required this.controller,
    this.obscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.012),
      child: SizedBox(
        height: height * 0.065,
        width: width,
        child: TextFormField(
          expands: false,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: obscureCharacter,
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: 15, horizontal: 1),
            fillColor: Color(0xFFCEFFBD),
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFFCEFFBD)
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFFA9FF93)
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFF3AAC3F)
              )
            ),

          ),
        ),
      ),
    );
  }
}
