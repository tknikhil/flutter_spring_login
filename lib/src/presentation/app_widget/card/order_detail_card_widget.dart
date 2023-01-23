import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/get_screen_load_cubit.dart';
import 'package:flutter_spring_login/src/model/order_detail.dart';
import 'package:flutter_spring_login/src/service/order_service.dart';


import 'order_list_view.dart';
class OrderDetailCardWidget extends StatefulWidget {
  const OrderDetailCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailCardWidget> createState() => _OrderDetailCardWidgetState();
}

class _OrderDetailCardWidgetState extends State<OrderDetailCardWidget> {

  @override
  Widget build(BuildContext context) {

    return BlocProvider<GetScreenLoadCubit>(
        create: (context)=>GetScreenLoadCubit(OrderService()),
        child:const OrderListView()
    );
  }
}

