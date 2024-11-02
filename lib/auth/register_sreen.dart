import 'package:flutter/material.dart';
import 'package:todo/auth/login_screen.dart';
import 'package:todo/widgets/defult_elevated_button.dart';
import 'package:todo/widgets/defult_text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefultTextFormField(
                controller: nameController,
                hintText: 'Name',
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return "name can not be less than 3 characters";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              DefultTextFormField(
                controller: emailController,
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.trim().length < 5) {
                    return "email can not be less than 5 characters";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              DefultTextFormField(
                controller: passwordController,
                hintText: 'password',
                validator: (value) {
                  if (value == null || value.trim().length < 8) {
                    return "password can not be less than 8 characters";
                  }
                  return null;
                },
                isPassword: true,
              ),
              SizedBox(
                height: 32,
              ),
              DefultElevatedButton(label: "Register", onPressed: login),
              SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName),
                  child: Text("Already have an account"))
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {}
  }
}
