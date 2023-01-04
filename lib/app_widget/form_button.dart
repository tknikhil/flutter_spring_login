import 'package:flutter/material.dart';
import 'package:flutter_spring_login/service/loginService.dart';

class FormButton extends StatelessWidget {
  IconData? buttonIcon;
  final Color textcolor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  double heightSize;
  double widthSize;
  bool? isIcon;
  String email;
  String password;

  FormButton(
      {Key? key,
      this.buttonIcon,
      required this.textcolor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.heightSize,
      required this.widthSize,
      this.isIcon=false,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  LoginService loginService=LoginService();
    return SizedBox(
      height: heightSize,
      width: widthSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

          backgroundColor: backgroundColor,
            side: BorderSide(width:3, color:Colors.lightGreen), //border width and color
            elevation: 3, //elevation of button
            shape: RoundedRectangleBorder( //to set border radius to button
                borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.all(2)
        ),
          onPressed: (){
          loginService.save(email!,password!);
          },
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,style: TextStyle(color: textcolor,fontSize: 25)), // <-- Text
          SizedBox(
            width: 5,
          ),
          Icon( // <-- Icon
            buttonIcon,
            color: textcolor,
            size: 25,
          ),
        ],
      ), ),
    );

    //Container for button
    //   Container(
    //   height: heightSize,
    //   width: widthSize,
    //   decoration: BoxDecoration(
    //       color: backgroundColor,
    //       borderRadius: BorderRadius.circular(15),
    //       border: Border.all(
    //         color: borderColor,
    //         width: 1.0,
    //       )),
    //
    //   child: Center(
    //
    //     child: Text(
    //
    //       text,
    //       style: TextStyle(color: textcolor),
    //     ),
    //   ),
    // );
  }
}
