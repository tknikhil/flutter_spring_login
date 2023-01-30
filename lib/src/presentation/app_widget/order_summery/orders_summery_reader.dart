import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/order_summery/order_summery_cubit.dart';

class OrderSummeryReader extends StatefulWidget {
  var refNo;
   OrderSummeryReader(this.refNo, {Key? key}) : super(key: key);

  @override
  State<OrderSummeryReader> createState() => _OrderSummeryReaderState();
}

class _OrderSummeryReaderState extends State<OrderSummeryReader> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [blockBuilder()],);
  }

  BlocBuilder<OrderSummeryCubit, OrderSummeryState> blockBuilder() {
    return BlocBuilder<OrderSummeryCubit, OrderSummeryState>(
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
          final orderSummery = state.orderSummery;
          print('${orderSummery.itemPrice.toString()}====orderDetailPage');
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                children: [
                  Text('Item Code : ${orderSummery.itemCode.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                ],
              ),

            ),
          );
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
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<OrderSummeryCubit>();
      print('$cubit =======>initState of OrderSummeryPage');
      print('${widget.refNo} =======>initState of OrderSummeryPage');
      cubit.loadOrderSummery(widget.refNo);
    });
  }
}
