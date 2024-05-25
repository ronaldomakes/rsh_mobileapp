import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rsh_mobileapp/views/chat_screen.dart';
import 'package:rsh_mobileapp/colors/colors.dart';
import 'package:rsh_mobileapp/widgets/dropdown_button.dart';
import 'package:rsh_mobileapp/widgets/text_field.dart';



class SignInScreen extends StatefulWidget {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerTaxipark = TextEditingController();
  SignInScreen(
      {Key? key,
        controllerPhone,
        controllerPassword,
        controllerName,
        controllerSurname,
        controllerTaxipark})
      : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
      },
      child: Container(
        width: 250,
        height: 61,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text('ВОЙТИ', style: TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
  List<String> items = ["QAZ_park", "Такси Байге","EURASIA", "EL TAXI"];
  String selectedItem = "QAZ_park";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 24),
          child: Column(
            children: [
              Center(
                child:
                Image.asset("assets/Group 4338.png", width: 500, height: 150,),
              ),
              SizedBox(height: height * 0.055,),
              Text("Войдите в аккаунт", style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              SizedBox(
                height: 40,
              ),
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: widget.controllerPhone,
                      hintText: "Номер телефона",
                      prefixIcon: Icon(Iconsax.call),
                    ),
                    SizedBox(
                        height: 16
                    ),
                    CustomTextField(
                      controller: widget.controllerPassword,
                      hintText: "Пароль",
                      suffixIcon: Icon(Iconsax.eye_slash),
                      prefixIcon: Icon(Iconsax.password_check),
                    ),
                    SizedBox(height: 30,),
                    _submitButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}