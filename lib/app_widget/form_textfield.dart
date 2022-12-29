import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String label;

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
    color: Color.fromRGBO(255, 255, 255, 0.8),
    ),
    decoration: InputDecoration(
    labelText:label,
    hintText: "Please enter your $label ",
    hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, .3)),
    labelStyle: const TextStyle(
    fontSize: 30,
    color: Color.fromRGBO(255, 255, 255, 0.8),
    ),
    filled: true,
    fillColor: const Color.fromRGBO(199, 44, 65, .4),
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
