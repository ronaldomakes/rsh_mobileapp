import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rsh_mobileapp/views/chat_screen.dart';
import 'package:rsh_mobileapp/colors/colors.dart';
import 'package:rsh_mobileapp/views/map_screen_page.dart';
import 'package:rsh_mobileapp/widgets/dropdown_button.dart';
import 'package:rsh_mobileapp/widgets/text_field.dart';



class SignupScreen extends StatefulWidget {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerTaxipark = TextEditingController();
  SignupScreen(
      {Key? key,
        controllerPhone,
        controllerPassword,
        controllerName,
        controllerSurname,
        controllerTaxipark})
      : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MapSample()));
      },
      child: Container(
        width: 250,
        height: 61,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text('РЕГИСТРАЦИЯ', style: TextStyle(fontSize: 18),),
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
              Text("Давайте создадим вам аккаунт!", style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              SizedBox(
                height: 40,
              ),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: widget.controllerName,
                            hintText: "Имя",
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: widget.controllerSurname,
                            hintText: "Фамилия",
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                    SizedBox(height: 16,),
                    CustomDropDown(
                      value: selectedItem,
                      itemsList: items,
                      dropdownColor: transperentColor,
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
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