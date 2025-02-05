import 'package:e_commerce/screens/constans.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final String hintText;
  final TextEditingController myControler;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextForm(
      {super.key, required this.hintText,
      required this.keyboardType,
      required this.myControler,
      required this.isPassword,
      required this.validator});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool isObscured = true;

  void togglePasswordVisibility() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPassword) {
      return TextFormField(
        validator: widget.validator,
        controller: widget.myControler,
        obscureText: (widget.isPassword && isObscured),
        keyboardType: widget.keyboardType,
        style: TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: kprimaryColor2,
          )),
          contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          labelText: widget.hintText,
          labelStyle: const TextStyle(color: kprimaryColor, fontSize: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(
            onPressed: togglePasswordVisibility,
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ),
      );
    } else {
      return TextFormField(
        validator: widget.validator,
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        style: TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kprimaryColor2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            filled: true,
            labelText: widget.hintText,
            labelStyle: const TextStyle(color: kprimaryColor, fontSize: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            )),
      );
    }
  }
}
