import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomDropDown extends StatefulWidget {
  final value;
  final List<String> itemsList;
  final Color dropdownColor;
  final Function(dynamic value) onChanged;
  const CustomDropDown({
    Key? key,
     this.value,
     required this.itemsList,
    required this.dropdownColor,
     required this.onChanged
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: height * 0.012),
      child: SizedBox(
        height: height * 0.060,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFCEFFBD)
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: DropdownButton(
                isExpanded: true,
                dropdownColor: widget.dropdownColor,
                icon: Icon(Iconsax.search_favorite),
                value: widget.value,
                items: widget.itemsList
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,style: GoogleFonts.poppins(
                      fontSize: 14
                  ),),
                ))
                    .toList(),
                onChanged: (item) => widget.onChanged(item),
              ),
            ),
          ),
        ),
      ),
    );
  }
}