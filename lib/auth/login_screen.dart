import 'package:flutter/material.dart';
import 'package:todo/auth/register_sreen.dart';
import 'package:todo/widgets/defult_elevated_button.dart';
import 'package:todo/widgets/defult_text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName ="/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login"),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefultTextFormField(
              
                controller: emailController, hintText: 'Email',
               validator: (value ) { 
                if(value == null || value.trim().length<5){
                  return "email can not be less than 5 characters";
                }
                return null;
                },),
                SizedBox(height: 16,),
               DefultTextFormField(controller: passwordController, hintText: 'password', validator:
                (value ) {
                    if(value == null || value.trim().length<8){
                  return "password can not be less than 8 characters";
                }
                return null;
          
                 },
                 isPassword: true,
                 
                 ),
                 SizedBox(height: 32,),
                 DefultElevatedButton(label: "Login", onPressed: login
          
                 ),
                 SizedBox(height: 8,),
                 TextButton(onPressed: ()=>
                  Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName),
                 
                 
                 
                  child: Text("dont have an account"))
            ],
          ),
        ),
      ),
        
      
    );
  }

  void login(){
    if(formKey.currentState!.validate()){

    }
  }
}