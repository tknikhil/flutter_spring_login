import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';

class FormTextField extends StatelessWidget {
  final  TextEditingController inputController;
  final String label;

TextEditingController get inputController2 =>this.inputController;
  const FormTextField(
      {Key? key, required this.inputController, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: inputController,

        validator: (value) {
          if (value!.isEmpty) {
            return "please enter your $label !";
          }
        },

    style: const TextStyle(
    fontSize: 20,
    color: Palette.text,
    ),
    decoration: InputDecoration(
    labelText:label,
    hintText: "Please enter your $label ",
    hintStyle: TextStyle(color: Color.fromRGBO(105, 105,105, 0.5)),
    labelStyle: const TextStyle(
    fontSize: 25,
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
    borderSide: BorderSide.none,
    borderRadius:
    BorderRadius.all(Radius.circular(9
    )
    )
    )
    )
    ,
    );
  }
}
