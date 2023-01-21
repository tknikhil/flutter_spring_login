import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/get_screen_load_cubit.dart';
import 'package:flutter_spring_login/src/model/order_detail.dart';


import 'order_list_view.dart';
class OrderDetailCardWidget extends StatelessWidget {
  const OrderDetailCardWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider<GetScreenLoadCubit>(
        create: (context)=>GetScreenLoadCubit()..orderDetails,
        child:OrderListView()
    );
  }
}

