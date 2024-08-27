import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscured;
  final bool isNumber;
  final bool isNumberLength;
  final String? errorMessage;

  const CustomFormField({
    required this.controller,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscured = false,
    this.isNumber = false,
    this.isNumberLength = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // shadow only on the bottom side
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
               // maxLength: isNumberLength==true?3:null,
              inputFormatters:
                  isNumber ? [LengthLimitingTextInputFormatter(isNumberLength==true?3:10)] : [],

              controller: controller,
              obscureText: isObscured,
              decoration: InputDecoration(
                  filled: true,
                  labelText: hintText,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon),

              // validator: validator ??
              //     (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter email';
              //       }
              //       return null;
              //     },
              keyboardType: isNumber == false
                  ? TextInputType.emailAddress
                  : TextInputType.number,
              style: const TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
          if (errorMessage !=
              null) // Display the error message if it's not null
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                errorMessage!,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
