import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController inputController;
  final String label;

   const PasswordTextField({Key? key, required this.inputController, required this.label}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool pass=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.inputController,
      obscureText: pass,


      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your ${widget.label} !";
        }
      },

      style: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
      decoration: InputDecoration(
          labelText:widget.label,
          hintText: "Please enter your ${widget.label} ",
          hintStyle: const TextStyle(color: Color.fromRGBO(105, 105,105, 0.5)),
          labelStyle: const TextStyle(
            fontSize: 25,
            color: Color.fromRGBO(183, 135, 39, 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(183, 135, 39, 1),),
              borderRadius:BorderRadius.all(Radius.circular(9
              )
              )
          ),
          filled: true,
          fillColor: Colors.white24,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
              BorderRadius.all(Radius.circular(9
              )
              )
          ),
          suffixIcon: GestureDetector(onTap: (){
            setState((){
              pass=!pass;
            });

          },
          child: Icon(pass?Icons.visibility:Icons.visibility_off),)
      )
      ,
    );
  }
}
