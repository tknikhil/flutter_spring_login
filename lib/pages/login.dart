import 'package:flutter/material.dart';
import 'package:flutter_spring_login/app_widget/form_button.dart';
import 'package:flutter_spring_login/app_widget/form_textfield.dart';
import 'package:flutter_spring_login/service/loginService.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_widget/form_password_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    String email=emailController.text;
    String password=passwordController.text;
    FormTextField emailF=FormTextField(
        inputController: emailController, label: "Email");
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient:const RadialGradient(
                      colors: [Colors.white,Color.fromRGBO(183, 135, 39, 1), ],
                      radius: 0.90,
                      focal: Alignment(0.9, -0.7),
                      tileMode: TileMode.clamp,
                    ),
                      color: Colors.blueGrey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        Text("Login",
                            style: GoogleFonts.oswald(
                                // fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: const Color.fromRGBO(183, 135, 39, 1),)),
                        const SizedBox(height: 40),
                        emailF,
                        const SizedBox(height: 20),
                        PasswordTextField(
                            inputController: passwordController,
                            label: "Password"),
                        const SizedBox(height: 30),
                        FormButton(
                          buttonIcon: Icons.login,
                          textcolor: Colors.white,
                          backgroundColor: Colors.brown,
                          borderColor: Colors.brown,
                          text: "Login",
                          heightSize: 50,
                          widthSize: 200,
                          // emailController,
                          // password
                          //need to work on this
                          // email: emailController.text,
                          // password: passwordController.text,
                          onPressed: (){
                            LoginService().save(email, password);
                            print(email);
                          },
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Forget Password !",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black45),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Don't have account?",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                ),


              ],
            )),
      ),
    );
  }
}
