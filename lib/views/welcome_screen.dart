import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rsh_mobileapp/views/chat_screen.dart';
import 'package:rsh_mobileapp/colors/colors.dart';
import 'package:rsh_mobileapp/views/register_page.dart';
import 'package:rsh_mobileapp/views/user_info.dart';

import '../provider/auth_provider.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Group 4338.png",
                  height: 300,
                ),
                const SizedBox(height: 15),
                Text("Давайте начнем!",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mainColor)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 85,
                    ),
                    Text("Важное напоминание:\nбезапасность прежде всего",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                // custom button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () async {
                      if (ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(
                              () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Chat(),
                            ),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      }
                    },
                    text: "Начать",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
