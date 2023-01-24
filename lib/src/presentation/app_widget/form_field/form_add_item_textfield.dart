import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';

class FormAddItemTextField extends StatelessWidget {
    final  TextEditingController inputController;
  final String label;

 TextEditingController get inputController2 =>inputController;
  const FormAddItemTextField(
      {Key? key,
         required this.inputController,
        required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
           controller: inputController,
          cursorHeight: 20,
          validator: (value) {
            if (value!.isEmpty) {
              return "please enter your $label !";
            }
            return null;
          },

      style: const TextStyle(
      fontSize: 15,
      color: Palette.text,
      ),
      decoration: InputDecoration(
      labelText:label,
      hintText: "Please enter your $label ",
      hintStyle: const TextStyle(color: Color.fromRGBO(105, 105,105, 0.5)),
      labelStyle: const TextStyle(
      fontSize: 15,
      color: Palette.text,
      ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Palette.gold),
              borderRadius:BorderRadius.all(Radius.circular(9
              )
              )
          ),
      filled: true,
      fillColor: Colors.white24,
      border: const OutlineInputBorder(
      borderRadius:
      BorderRadius.all(Radius.circular(9
      )
      )
      )
      )
      ,
      ),
    );
  }
}
