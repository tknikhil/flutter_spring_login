import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/app_widget.dart';

import '../app_widget/form_field/form_add_item_textfield.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}
final _formKey=GlobalKey<FormState>();
final  custNameController=TextEditingController();
final itemCodeController=TextEditingController();
final weightController=TextEditingController();
final sizeController=TextEditingController();
final quantityController=TextEditingController();
final meltController=TextEditingController();
final stampController=TextEditingController();
final hookController=TextEditingController();

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffbf1de),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                child:Column(
             children: [
                FormAddItemTextField(inputController: itemCodeController, label: 'Item Code'),
                const SizedBox(height: 10),
                FormAddItemTextField(inputController: custNameController, label: 'Customer Name'),
               const SizedBox(height: 10),
               Row(
                 children: [
                   SizedBox(
                       width: MediaQuery.of(context).size.width/4,
                       child: FormAddItemTextField(inputController: weightController, label: 'Weight')),
                   const SizedBox(width: 25),
                   SizedBox(
                       width: MediaQuery.of(context).size.width/4,
                       child: FormAddItemTextField(inputController: sizeController, label: 'Size')),
                   const SizedBox(width: 25),
                   SizedBox(
                       width: MediaQuery.of(context).size.width/4,
                       child: FormAddItemTextField(inputController: quantityController, label: 'Quantity')),
                 ],
               ),
               const SizedBox(height: 10),
               Row(
                 children: [
                   SizedBox(
                       width: MediaQuery.of(context).size.width/4,
                       child: FormAddItemTextField(inputController: meltController, label: 'Melt %')),
                   const SizedBox(width: 25),
                   SizedBox(
                       width: MediaQuery.of(context).size.width/4,
                       child: FormAddItemTextField(inputController: stampController, label: 'Stamp')),
                   const SizedBox(width: 25),
                   SizedBox(
                       width: MediaQuery.of(context).size.width/4,
                       child: FormAddItemTextField(inputController: hookController, label: 'Hook')),
                 ],
               ),


               const SizedBox(height: 10),
               FormAddItemTextField(inputController: quantityController, label: 'Quantity'),
             ],
            )
            )
          ],
        ),
      ),
    );
  }
}
