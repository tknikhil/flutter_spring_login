
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/item_name/item_name_cubit.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/app_widget.dart';
import 'package:flutter_spring_login/src/service/add_item_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/item_name.dart';
import '../../service/persist_item_service.dart';
import '../app_widget/builder/add_item/drop_down_builder.dart';
import '../app_widget/form_field/form_add_item_textfield.dart';
import '../presentation.dart';

class AddItem extends StatefulWidget {

   AddItem({ Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => AddItemState();
}


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

class AddItemState extends State<AddItem> {
   XFile? _image;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<XFile?> getImage(bool isCamera) async{
    XFile? img;
    // final ImagePicker _picker = ImagePicker();

    if (isCamera) {
      img =(await ImagePicker().pickImage(source: ImageSource.camera)) as XFile? ;
    }else{
      img =(await ImagePicker().pickImage(source: ImageSource.gallery)) as XFile? ;
    }
    if (img != null) {
      File imageFile = File(img.path);
    }
setState(() {
  _image=img;
});
  }

  // var dropdownval=DropDownBuilderState(formKey).cnt.toString();
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
                key: formKey,
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
                                label: 'Weight', mxLine: 1, textType: TextInputType.number,)),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: sizeController,
                                label: 'Size',
                            mxLine: 1, textType: TextInputType.text,)),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: quantityController,
                                label: 'Quantity',
                              textType: TextInputType.number,
                            mxLine: 1,)),
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
                              textType: TextInputType.number,
                                onChangeEvent:getStamp, mxLine: 1,)
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: stampController,
                                label: 'Stamp',
                              textType: TextInputType.text,
                            mxLine: 1,
                           )),
                        const SizedBox(width: 25),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: FormAddItemTextField(
                                inputController: hookController,
                                label: 'Hook',
                              textType: TextInputType.text,
                            mxLine: 1,)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: FormAddItemTextField(
                              inputController: designController,
                              label: 'Design Sample',mxLine: 1,textType: TextInputType.text,)),
                      const SizedBox(width: 20),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: FormAddItemTextField(
                              inputController: sizeSmplController,
                              label: 'Size Sample',mxLine: 1,textType: TextInputType.text,)),
                    ]),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: FormAddItemTextField(
                                  inputController: refNoController,
                                  label: 'Customer Refno',textType: TextInputType.text,mxLine: 1,)),
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
                            onChangeEvent: getDueDate,textType: TextInputType.number, mxLine: 1,)),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: FormAddItemTextField.unEditable(
                                inputController: dueDateController,
                                label: 'Due Date',
                            mxLine: 1,
                            boolval: false,)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: MediaQuery.of(context).size.width ,
                        height: 80,
                        child: FormAddItemTextField(
                            inputController: remarkController,
                            label: 'Remark', mxLine: 5,textType: TextInputType.text, )),
                    const SizedBox(height: 10),
                    Row(children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: IconButton(icon: Icon(Icons.camera_alt_outlined,
                            color:Palette.text),
                              splashColor: Color(0xfffd4af37),
                              onPressed: (){
                          getImage(true);
                              },)),
                      const SizedBox(width: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: IconButton(icon: Icon(Icons.image_outlined,
                              color:Palette.text,
                              ),
                            splashColor: Color(0xfffd4af37),

                            onPressed: (){
getImage(false);
                            },)),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: [
                     _image==null?Container(
                     ):Expanded(
                       child: SizedBox(
                         height: MediaQuery.of(context).size.height/7,
                         width: MediaQuery.of(context).size.width/15,
                         child: Card(
                           semanticContainer: true,
                           clipBehavior: Clip.antiAliasWithSaveLayer,
                           child: Image.file(File(_image!.path), fit: BoxFit.fitWidth,),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                           elevation: 5,
                           margin: EdgeInsets.all(10),
                         ),
                       ),
                     ),
                    ]),
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
                        formKey.currentState!.validate();
                         saveItem(itemNameController.text,weightController.text,
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
                         // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                         //   content: Text("Item Added!"),
                         // ));

                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  // void validate(){
  //
  //     if (formKey.currentState!.validate()) {
  //       print("Ok");
  //     } else {
  //       print("Error");
  //     }
  // }

  void saveItem( String itemName, String weight, String size, String qty, String meltper, String stamp, String hook, String design, String sizeSample, String refNo, String remark, String days, String duedate, BuildContext context) {
     // final itemName=DropDownValueModel(name: , value: value);
    days='0';
      var isDataSave = PersisItemService().saveItem(itemName,
          double.tryParse(weight),
          size, int.tryParse(qty),
          double.tryParse(meltper),
          stamp,
          hook,
          design,
          sizeSample,
          refNo,
          remark,
          int.tryParse(days)!);
print('dropdown val=${itemName} itemname=$itemName weight =$weight itemsize=$size qty=$qty meltper=$meltper stamp=$stamp  hook=$hook   design=$design   sizeSample=$sizeSample  refNo=$refNo   remark=$remark   days=$days  ');
print('$isDataSave save item result');
// if(isDataSave=="success"){
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("item Added... "),
//         ));
//       }

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
// DropDownBuilderState().clearVal=true;
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


