import 'package:flutter/material.dart';
import 'package:flutter_spring_login/app_widget/form_button.dart';
import 'package:flutter_spring_login/app_widget/form_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_widget/form_password_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    String email=emailController.text;
    String paswword=passwordController.text;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(129, 3, 54, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: const Offset(0, 5),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        Text("Login",
                            style: GoogleFonts.oswald(
                                // fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: const Color.fromRGBO(255, 201, 187, 1))),
                        const SizedBox(height: 40),
                        FormTextField(
                            inputController: emailController, label: "Email"),
                        const SizedBox(height: 20),
                        PasswordTextField(
                            inputController: passwordController,
                            label: "Password"),
                        const SizedBox(height: 30),
                        Text(
                          "Forget Password !",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(255, 201, 187, 1)),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Don't have account?",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(255, 201, 187, 1)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                FormButton(
                    buttonIcon: Icons.login,
                    textcolor: Colors.white,
                    backgroundColor: Colors.green,
                    borderColor: Colors.greenAccent,
                    text: "Login",
                    heightSize: 60,
                    widthSize: 150,
                  // emailController,
                  // password
                  //need to work on this
                  email: emailController.text,
                  password: passwordController.text,
                )
              ],
            )),
      ),
    );
  }
}
