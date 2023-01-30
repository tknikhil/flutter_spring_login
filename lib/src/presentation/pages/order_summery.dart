import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/app_bar/app_bar.dart';
import 'package:flutter_spring_login/src/service/order_summery_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../cubit/order_summery/order_summery_cubit.dart';
import '../../model/order_summery.dart';
import '../app_widget/app_widget.dart';
import '../app_widget/order_summery/orders_summery_reader.dart';

class OrderSummeryPage extends StatefulWidget {
  var refNo;

  OrderSummeryPage({this.refNo, Key? key}) : super(key: key);
  // @override
  // void initState() {
  //   super.initState();
  //   if (kDebugMode) {
  //     print('initState()');
  //   }
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     final cubit = context.read<OrderSummeryCubit>();
  //     print('$cubit =======>initState of OrderSummeryPage');
  //     print('${refNo} =======>initState of OrderSummeryPage');
  //     cubit.loadOrderSummery(refNo);
  //   });
  // }

  @override
  State<OrderSummeryPage> createState() => _OrderSummeryPageState();
}

class _OrderSummeryPageState extends State<OrderSummeryPage> {
  var orderSummeryService=OrderSummeryService();
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  // late OrderSummery _orderSummery;

// var orderSummery=OrderSummery.fromJson(json);

  @override
  Widget build(BuildContext context) {
    OrderSummery orderSummery1;
    print('${OrderListView.refnoval.toString()} ===========>Main()');
   return Scaffold(
       backgroundColor: const Color(0xffffbf1de),
       appBar: AppBarWidget(
         cdate: cdate,
         builder: Builder(
           builder: (context) => IconButton(
               icon: const Icon(Icons.keyboard_arrow_left),
               color: Colors.brown,
               onPressed: () => Navigator.of(context).pop()),
         ),
       ),
       body: BlocProvider(
         create: (context) => OrderSummeryCubit(OrderSummeryService()),
         child:OrderSummeryReader(widget.refNo),


       ),
       );
  }


}
