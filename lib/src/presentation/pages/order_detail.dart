import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/presentation/app_widget/app_bar/app_bar.dart';
import 'package:flutter_spring_login/src/service/order_summery_service.dart';
import 'package:intl/intl.dart';

import '../../cubit/order_summery/order_summery_cubit.dart';
import '../../model/order_summery.dart';

class OrderDetailPage extends StatefulWidget {
  var refNo;

  OrderDetailPage({this.refNo, Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  late OrderSummery _orderSummery ;

// var orderSummery=OrderSummery.fromJson(json);
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState()');
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<OrderSummeryCubit>();
      cubit.loadOrderSummery(widget.refNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    OrderSummery orderSummery1;
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
      body: Container(
        child: BlocProvider<OrderSummeryCubit>(
          create: (context) => OrderSummeryCubit(OrderSummeryService()),
          child: BlocBuilder<OrderSummeryCubit, OrderSummeryState>(
            builder: (context, state) {
              print("$state BlocBuilder");
              if (state is OrderSummeryInitial || state is LoadingOrderSummeryState) {
                return const Center(child: CircularProgressIndicator());
              } //GetScreenLoadInitial, LoadingScreenLoadState
              else if (state is ResponseOrderSummeryState) {
                if (kDebugMode) {
                  print(
                      "${state.orderSummery.itemCode} else if ResponseScreenLoadState OrderSummey");
                }
               _orderSummery = state.orderSummery;
                return Text(_orderSummery.itemPrice.toString());
                  // ListView.builder(
                  //   // scrollDirection: Axis.vertical,
                  //   // physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   // itemCount: orderSummery.length - 1,
                  //   itemBuilder: (context, index) => SizedBox(
                  //         width: MediaQuery.of(context).size.width,
                  //         child: buildCard(index),
                  //       ));
              } //ResponseScreenLoadState
              else if (state is ErrorOrderSummeryState) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Center(
                  child: Text(state.toString()),
                );
              }
            },
          ),
        ),
      ),
    );
  }


}
