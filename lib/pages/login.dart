import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(129, 3, 54, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text("Login",
                    style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white)),
                const SizedBox(height: 40),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Text("Email",style: GoogleFonts.roboto(
                //     // fontWeight: FontWeight.bold,
                //     fontSize: 30,
                //     color: const Color.fromRGBO(255, 255, 255, 0.8),
                //
                //   ),),
                // ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your email!";
                    }
                  },
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                          fontFamily: 'GoogleFonts.roboto'),
                      filled: true,
                      fillColor: Color.fromRGBO(199, 44, 65, .4),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(9)))),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your password!";
                    }
                  },
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                          fontFamily: 'GoogleFonts.roboto'),
                      filled: true,
                      fillColor: Color.fromRGBO(199, 44, 65, .4),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(9)))),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
