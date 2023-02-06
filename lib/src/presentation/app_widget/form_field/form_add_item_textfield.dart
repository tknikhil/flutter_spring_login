import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';

class FormAddItemTextField extends StatefulWidget {
    final  TextEditingController inputController;
  final String label;
  var onChangeEvent;
  var boolval;
  var mxLine;
  // var validation;

    // FormAddItemTextField.multiLine(
    //     {Key? key,
    //       required this.inputController,
    //       required this.label,
    //     required this.mxLine})
    //     : super(key: key);
    FormAddItemTextField.unEditable(
        {Key? key,
          required this.inputController,
          required this.label,
          required this.boolval,
        required this.mxLine})
        : super(key: key);

 FormAddItemTextField.withChangeEvent(
      {Key? key,
         required this.inputController,
        required this.label,
      required this.onChangeEvent,
      required this.mxLine})
      : super(key: key);

    FormAddItemTextField(
        {Key? key,
          required this.inputController,
          required this.label,
        required this.mxLine})
        : super(key: key);

  @override
  State<FormAddItemTextField> createState() => _FormAddItemTextFieldState();
}

class _FormAddItemTextFieldState extends State<FormAddItemTextField> {
 TextEditingController get inputController2 =>widget.inputController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
           controller: widget.inputController,
          cursorHeight: 20,
        // validator:widget.validation,
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget!.label} required!";
            }
            if(value=='INVALID'){
              return "wrong Melt %";
            }
            return null;
          },
        enabled: widget.boolval,
 onChanged: widget.onChangeEvent,
        maxLines: widget.mxLine,
 //         onTap: widget.onChangeEvent,
//       onEditingComplete:widget.onChangeEvent ,
      style: const TextStyle(
      fontSize: 15,
      color: Palette.text,
      ),
      decoration: InputDecoration(
      labelText:widget.label,
      hintText: "${widget.label} ",
      hintStyle: const TextStyle(color: Color.fromRGBO(105, 105,105, 0.5), ),
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
