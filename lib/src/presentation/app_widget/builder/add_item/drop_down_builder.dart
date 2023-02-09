import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/item_name/item_name_cubit.dart';
import '../../../../model/item_name.dart';
import '../../../pages/add_item.dart';
import '../../../presentation.dart';
import '../../form_field/form_add_item_textfield.dart';

class DropDownBuilder extends StatefulWidget {
  // GlobalKey<FormState>  formval;
   DropDownBuilder({
    Key? key,
  }) : super(key: key);
   var itemname;


  @override
  State<DropDownBuilder> createState() => DropDownBuilderState();
}

class DropDownBuilderState extends State<DropDownBuilder> {
   List<ItemName> items = [];
   bool clearVal=false;
  // final cnt = SingleValueDropDownController();
   final cnt=SingleValueDropDownController()!;
  FocusNode? textFieldFocusNode = FocusNode();
   // GlobalKey<FormState>  formval;
  DropDownBuilderState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemNameCubit, ItemNameState>(
      builder: (context, state) {
        // context.read<ItemNameCubit>().loadItemService();

        if (state is ResponseItemNameState) {
          items = state.itemName;
          final itemval = items
              .map((e) => DropDownValueModel(name: e.label, value: e.value))
              .toList();
          print(cnt.toString());
          print('${items?[0].label.toString()}');
          return SizedBox(
            // height: 40,
            child: DropDownTextField(
              // initialValue: "name4",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textFieldDecoration:  const InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Palette.gold),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                focusedErrorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                label: Text("Select Item"),
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Palette.text,
                ),
                hintStyle:
                    TextStyle(color: Color.fromRGBO(105, 105, 105, 0.5)),
                enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                     borderSide: BorderSide(color: Palette.gold),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Palette.gold),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
              ),

              controller: cnt,
              textFieldFocusNode: textFieldFocusNode,
              clearOption: true,
              keyboardType: TextInputType.text,
              enableSearch: true,
              // dropdownColor: Colors.green,
              searchDecoration:
                  const InputDecoration(hintText: "Search Item Name"),
              dropdownColor: Color(0xffffbf1de),
              textStyle: const TextStyle(color: Palette.text),
              dropDownItemCount: 6,
validator: (value)=> value==null||value.isEmpty?'required':null,

              dropDownList: itemval!,
              onChanged: (val) {
                setState(() {
                  widget.itemname = val.name;
                });

               // formval.currentState!.validate();
                print('$itemval========>changeValue');
                print('$DropDownBuilder.itemname========>changeValue');
                print('${val.name}========>changeValue');
              },
            ),
          );
        } else {
          return FormAddItemTextField.unEditable(
              inputController: itemNameController, label: "Unable to find Item!", boolval: false,mxLine: 1,);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState()');
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context?.read<ItemNameCubit>();
      cubit?.loadItemService();

      cubit?.loadItemService().then((value) => items = value!);
    });
  }


}
