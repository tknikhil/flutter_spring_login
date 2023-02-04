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
  const DropDownBuilder({
    Key? key,
  }) : super(key: key);
  static var itemname;

  @override
  State<DropDownBuilder> createState() => DropDownBuilderState();
}

class DropDownBuilderState extends State<DropDownBuilder> {
  late List<ItemName> items = [];

  final cnt = SingleValueDropDownController();
  FocusNode textFieldFocusNode = FocusNode();

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
          print('${items[0].label.toString()}');
          return SizedBox(
            height: 40,
            child: DropDownTextField(
              // initialValue: "name4",
              textFieldDecoration: const InputDecoration(
                label: Text("Select Item"),
                labelStyle: const TextStyle(
                  fontSize: 15,
                  color: Palette.text,
                ),
                hintStyle:
                    const TextStyle(color: Color.fromRGBO(105, 105, 105, 0.5)),
                enabledBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    // borderSide: BorderSide(color: Palette.gold),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                focusedBorder: OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(color: Palette.gold),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
              ),

              controller: cnt,
              clearOption: true,
              textFieldFocusNode: textFieldFocusNode,
              // keyboardType: TextInputType.text,
              enableSearch: true,
              // dropdownColor: Colors.green,
              searchDecoration:
                  const InputDecoration(hintText: "Search Item Name"),
              dropdownColor: Color(0xffffbf1de),
              textStyle: TextStyle(color: Palette.text),
              validator: (value) {
                if (value == null) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 6,

              dropDownList: itemval,
              onChanged: (val) {
                DropDownBuilder.itemname = val.name;
                print('$itemval========>changeValue');
                print('$DropDownBuilder.itemname========>changeValue');
                print('${val.name}========>changeValue');
              },
            ),
          );
        } else {
          return FormAddItemTextField(
              inputController: itemNameController, label: "Hi",);
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
      final cubit = context.read<ItemNameCubit>();
      cubit.loadItemService();

      cubit.loadItemService().then((value) => items = value);
    });
  }
}
