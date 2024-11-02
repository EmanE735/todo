import 'package:flutter/material.dart';

class DefultTextFormField extends StatefulWidget {
  DefultTextFormField(
      {required this.controller,
      required this.hintText,
      required this.validator,
      this.isPassword = false});

  TextEditingController controller;
  String hintText;
  String? Function(String?)? validator;
  bool isPassword;

  @override
  State<DefultTextFormField> createState() => _DefultTextFormFieldState();
}

class _DefultTextFormFieldState extends State<DefultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: (Icon(
                    isObscure ?
                    Icons.visibility_outlined
                    : Icons.visibility_off_outlined
                    )),
                  onPressed: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                )
              : null),
      validator: widget.validator,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
