import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/item_name/item_name_cubit.dart';
import '../../../../model/ItemName.dart';
import '../../../pages/add_item.dart';
import '../../../presentation.dart';
import '../../form_field/form_add_item_textfield.dart';
class DropDownBuilder extends StatefulWidget {
  const DropDownBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownBuilder> createState() => _DropDownBuilderState();
}

class _DropDownBuilderState extends State<DropDownBuilder> {
  late List<ItemName> items=[];
  final _cnt = SingleValueDropDownController();
  FocusNode textFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemNameCubit, ItemNameState>(
      builder: (context, state) {
        // context.read<ItemNameCubit>().loadItemService();

        if(state is ResponseItemNameState){
           items=state.itemName;
           final itemval=items.map((e) => DropDownValueModel(name: e.label, value: e.value)).toList();

            print('${items[0].label.toString()}');
          return DropDownTextField(
            // initialValue: "name4",
            controller: _cnt,
            clearOption: true,
            // textFieldFocusNode: textFieldFocusNode,
            keyboardType: TextInputType.text,
             // enableSearch: true,
            // dropdownColor: Colors.green,
            searchDecoration: const InputDecoration(
                hintText: "enter your custom hint text here"),
            dropdownColor: Color(0xffffbf1de),
            textStyle: TextStyle(color: Palette.gold),
            validator: (value) {
              if (value == null) {
                return "Required field";
              } else {
                return null;
              }
            },
            dropDownItemCount: 6,

            dropDownList: itemval,
            onChanged: (val) {},
          );
        }else{
          return FormAddItemTextField(
              inputController: itemNameController,
              label: "Hi");
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

      cubit.loadItemService().then((value) => items=value);
    });
  }

}