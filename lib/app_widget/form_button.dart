import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {

  final Icon buttonIcon;
  const FormButton({Key? key,required this.buttonIcon}) : super(key: key);

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){},
      child: widget.buttonIcon
    );
  }
}
