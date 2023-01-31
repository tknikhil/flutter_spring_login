import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/cubit.dart';
import '../../../../cubit/order_summery/order_summery_cubit.dart';

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
                "${state.orderSummery.itemUnit} else if ResponseScreenLoadState OrderSummey");
          }
          final orderSummery = state.orderSummery;
          print('${orderSummery.itemUnit.toString()}====orderDetailPage');
          return Padding(
            padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 4,
                shadowColor: Colors.grey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                                  'Status',
                                  style: const TextStyle(fontSize: 17,),
                                )),
                            DataColumn(
                                label: Text(
                                  "${orderSummery.status}",
                                  style:  TextStyle(fontSize: 17,color:(orderSummery.status=='Assigned')?Colors.green:(orderSummery.status=='Confirmed')?Colors.green:Colors.red ),
                                )),
                          ],

                          rows: [
                          DataRow(cells: [
                            DataCell(
                              Text(
                               ' Customer Name ',
                                style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                              ),
                            ),
                             DataCell(Text(
                              '  ${orderSummery.custName}',
                              style: TextStyle(fontSize: 17,),
                            ))
                          ]),
                          DataRow(cells: [
                              DataCell(
                                Text(
                                  'Item Name : ${orderSummery.itemName.toString()}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                            DataCell(
                              Text(
                                'Order Type : ${orderSummery.type.toString()}',
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                            ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                'Item Size : ${orderSummery.itemSize.toString()}',
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                             DataCell(Text(
                              'Melt % : ${orderSummery.meltPer.toString()}',
                              style: TextStyle(fontSize: 17,),
                            ))
                          ]),
                          DataRow(cells: [
                              DataCell(
                                Text(
                                  'Hook : ${orderSummery.hook.toString()}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              DataCell(Text(
                                'Ref. Code : ${orderSummery.refNo.toString()}',
                                style: TextStyle(fontSize: 17,),
                              ))
                            ]),
                          DataRow(cells: [
                              DataCell(
                                Text(
                                  'Design Sample : ${orderSummery.designSample.toString()}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              DataCell(Text(
                                'Size Sample : ${orderSummery.sizeSample.toString()}',
                                style: TextStyle(fontSize: 17,),
                              ))
                            ]),
                          DataRow(cells: [
                              DataCell(
                                Text(
                                  'Total Days : ${orderSummery.days.toString()}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              DataCell(Text(
                                'Due Date : ${orderSummery.dueDate.toString()}',
                                style: TextStyle(fontSize: 17,),
                              ))
                            ]),
                          DataRow(cells: [
                              DataCell(
                                Text(
                                  'Workshop : ${orderSummery.workshop.toString()}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                              DataCell(Text(
                                'Order Date : ${orderSummery.orderDate.toString()}',
                                style: TextStyle(fontSize: 17,),
                              ))
                            ]),
                        ],
                        ),
                      ),
                    ),

                    // Text('Customer Name : ${orderSummery.custName}'
                    //     '\nWeight : ${orderSummery.weight}  ${orderSummery.itemUnit}'
                    //     '\nQuantity : ${orderSummery.qty}'
                    //     '\nItem Size : ${orderSummery.itemSize.toString()}'
                    //     '\nMelt % : ${orderSummery.meltPer.toString()}'
                    //     '\nHook : ${orderSummery.hook.toString()}'
                    //     '\nRef. Code : ${orderSummery.refNo.toString()}'
                    //     '\nDesign Sample : ${orderSummery.designSample.toString()}'
                    //     '\nSize Sample : ${orderSummery.sizeSample.toString()}'
                    //     '\nProcessing Days : ${orderSummery.days.toString()}'
                    //     '\nDue Date : ${orderSummery.dueDate.toString()}'
                    //     '\nWorkshop : ${orderSummery.workshop.toString()}'
                    //     '\nStatus : ${orderSummery.status.toString()}'
                    //     '\nOrder Date : ${orderSummery.orderDate.toString()}'
                    //     '\nOrder Type : ${orderSummery.type.toString()}'
                    //   ,style: TextStyle(fontSize: 20,color: Colors.brown,),),

                    // Text('Weight : ${orderSummery.weight}  ${orderSummery.itemUnit}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Quantity : ${orderSummery.qty}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Item Size : ${orderSummery.itemSize.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Melt % : ${orderSummery.meltPer.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Hook : ${orderSummery.hook.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Ref. Code : ${orderSummery.refNo.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Design Sample : ${orderSummery.designSample.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Size Sample : ${orderSummery.sizeSample.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Processing Days : ${orderSummery.days.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Due Date : ${orderSummery.dueDate.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Workshop : ${orderSummery.workshop.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Status : ${orderSummery.status.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Order Date : ${orderSummery.orderDate.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                    // Text('Order Type : ${orderSummery.type.toString()}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.brown),),
                  ],
                ),
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
