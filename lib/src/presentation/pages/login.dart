import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/pages/search.dart';
import 'package:flutter_spring_login/src/service/loginService.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';

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
                  decoration: Palette.backgroundGradient,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        Text("Login",
                            style: GoogleFonts.oswald(
                                // fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Palette.text)),
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
                            var login=LoginService().login(email, password);
                            login.then((value) =>
                            {
                              if(value=="Success"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Search()))
                              }else{
                                print(value),
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Login Failed "),
                            ))
                              }
                            }
                            );
                            print(email);
                          },
                        ),
                        // const SizedBox(height: 25),
                        // Text(
                        //   "Forget Password !",
                        //   style: GoogleFonts.roboto(
                        //       fontSize: 20,
                        //       color: Colors.black45),
                        // ),
                        // const SizedBox(height: 15),
                        // Text(
                        //   "Don't have account?",
                        //   style: GoogleFonts.roboto(
                        //       fontSize: 20,
                        //       color: Colors.black45),
                        // )
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
