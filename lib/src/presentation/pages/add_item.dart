import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/item_name/item_name_cubit.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/app_widget.dart';
import 'package:flutter_spring_login/src/service/add_item_service.dart';

import '../../model/ItemName.dart';
import '../app_widget/builder/add_item/drop_down_builder.dart';
import '../app_widget/form_field/form_add_item_textfield.dart';

class AddItem extends StatefulWidget {

   AddItem({ Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

final _formKey = GlobalKey<FormState>();
final itemNameController = TextEditingController();
final itemCodeController = TextEditingController();
final weightController = TextEditingController();
final sizeController = TextEditingController();
final quantityController = TextEditingController();
final meltController = TextEditingController();
final stampController = TextEditingController();
final hookController = TextEditingController();
final designController = TextEditingController();
final sizeSmplController = TextEditingController();
final refNoController = TextEditingController();
final remarkController = TextEditingController();
final daysController = TextEditingController();
final dueDateController = TextEditingController();

class _AddItemState extends State<AddItem> {

  Widget appBarTitle= const Text("Add Item");
  @override
  Widget build(BuildContext context) {
    late List<ItemName> items=[];
    return Scaffold(
      backgroundColor: const Color(0xffffbf1de),

      appBar:  AppBar(
        title: Center(child: appBarTitle),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfffd4af37),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    BlocProvider(
  create: (context) => ItemNameCubit(AddItemService()),
  child: DropDownBuilder(),
),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: weightController,
                                label: 'Weight')),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: sizeSmplController,
                                label: 'Size')),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: quantityController,
                                label: 'Quantity')),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: meltController,
                                label: 'Melt %')),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: stampController,
                                label: 'Stamp')),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: hookController,
                                label: 'Hook')),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: FormAddItemTextField(
                              inputController: designController,
                              label: 'Design Sample')),
                      const SizedBox(width: 20),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: FormAddItemTextField(
                              inputController: sizeController,
                              label: 'Size Sample')),
                    ]),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField(
                                inputController: refNoController,
                                label: 'Customer Refno')),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField(
                                inputController: remarkController,
                                label: 'Remark')),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField(
                                inputController: daysController,
                                label: 'Days')),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField(
                                inputController: dueDateController,
                                label: 'Due Date')),
                      ],
                    ),
                    const SizedBox(height:25),
                    FormButton(
                      buttonIcon: Icons.add_shopping_cart,
                      textcolor: Colors.white,
                      backgroundColor: Colors.brown,
                      borderColor: Colors.brown,
                      text: "Add Item",
                      heightSize: 45,
                      widthSize: 200,
                      onPressed: () {
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }


}


