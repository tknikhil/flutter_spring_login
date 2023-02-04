import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/item_name/item_name_cubit.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/app_widget.dart';
import 'package:flutter_spring_login/src/service/add_item_service.dart';

import '../../model/item_name.dart';
import '../../service/persist_item_service.dart';
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
  var dropdownval=DropDownBuilderState().cnt.toString();
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
                                inputController: sizeController,
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
                            child: FormAddItemTextField.withChangeEvent(
                                inputController: meltController,
                                label: 'Melt %',
                                onChangeEvent:getStamp)
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField.unEditable(
                                inputController: stampController,
                                label: 'Stamp',
                            boolval: false,)),
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
                              inputController: sizeSmplController,
                              label: 'Size Sample')),
                    ]),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: FormAddItemTextField(
                                  inputController: refNoController,
                                  label: 'Customer Refno')),
                        ),

                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField.withChangeEvent(
                                inputController: daysController,
                                label: 'Days',
                            onChangeEvent: getDueDate,)),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField.unEditable(
                                inputController: dueDateController,
                                label: 'Due Date',
                            boolval: false,)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: MediaQuery.of(context).size.width ,
                        height: 80,
                        child: FormAddItemTextField.multiLine(
                            inputController: remarkController,
                            label: 'Remark', mxLine: 5, )),
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
                         saveItem(dropdownval,itemNameController.text,weightController.text,
                        sizeController.text,
                        quantityController.text,
                        meltController.text,
                        stampController.text,
                        hookController.text,
                        designController.text,
                        sizeSmplController.text,
                            refNoController.text,
                            remarkController.text,
                            daysController.text,
                            dueDateController.text,context);

                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void saveItem(String dropdownval, String itemName, String weight, String size, String qty, String meltper, String stamp, String hook, String design, String sizeSample, String refNo, String remark, String days, String duedate, BuildContext context) {
     // final itemName=DropDownValueModel(name: , value: value);
      var isDataSave = PersisItemService().saveItem(DropDownBuilder.itemname, double.parse(weight), size, int.parse(qty), double.parse(meltper), stamp, hook, design, sizeSample, refNo, remark, int.parse(days));
print('dropdown val=${DropDownBuilder.itemname} itemname=$itemName weight =$weight itemsize=$size qty=$qty meltper=$meltper stamp=$stamp  hook=$hook   design=$design   sizeSample=$sizeSample  refNo=$refNo   remark=$remark   days=$days  ');
      // if(isDataSave=="success"){
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text("item Added... "),
      //   ));
      // }
itemNameController.clear();
    itemCodeController.clear();
    weightController.clear();
    sizeController.clear();
    quantityController.clear();
    meltController.clear();
    stampController.clear();
    hookController.clear();
    designController.clear();
    sizeSmplController.clear();
    refNoController.clear();
    remarkController.clear();
    daysController.clear();
    dueDateController.clear();
    // if(isDataSave=="success"){
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text("item Added... "),
    //   ));
    // }

  }

  getStamp(meltval) {
     print('$meltval=======>getStamp');
    if(meltval.isEmpty){
      stampController.text="";
    }else {
      final stampData = AddItemService().getStamp(meltval);
      stampData.then((value) => stampController.text = value);
    }// stampController.text();
  }

  getDueDate(days) {
    print('$days=======>getdueDate');
    if(days.isEmpty){
      dueDateController.text="";
    }else {
      final dueDate = AddItemService().getDueDate(days);
      print('$dueDate=========>getDueDate');
       dueDate.then((value) => dueDateController.text = value);
    }// stampController.text();
  }

  // void saveItem(String dropdownval, String text, TextEditingController weightController, TextEditingController sizeController, TextEditingController quantityController, TextEditingController meltController, TextEditingController stampController, TextEditingController hookController, TextEditingController designController, TextEditingController sizeSmplController, TextEditingController refNoController, TextEditingController remarkController, TextEditingController daysController, TextEditingController dueDateController, BuildContext context) {
  //   weightController.text;
  // }


}


