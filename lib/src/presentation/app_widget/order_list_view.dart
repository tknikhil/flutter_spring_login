import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/get_screen_load_cubit.dart';

import '../../model/order_detail.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({
    Key? key,
    required this.cdate,
  }) : super(key: key);

  final String? cdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      BlocBuilder<GetScreenLoadCubit, List<OrderDetail> > (
        builder: (context, state) {
    if(state.isEmpty){
    return Center(child:CircularProgressIndicator());
    }return ListView.builder(
    itemCount: 5,
    itemBuilder: (context,index) =>SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    ),
    elevation: 4,
    shadowColor: Colors.grey,
    child: DataTable(
    columns: [
    DataColumn(label: Text('Ref no.:$index',style: TextStyle(fontSize: 23),)),
    // DataColumn(label: Text("${orderDetail?.firstName} ",style: TextStyle(fontSize: 23),)),
    ],
    rows: [

    DataRow(cells: [
    // DataCell(Text('Order Date: $cdate',style: TextStyle(fontSize: 17),),),
    // DataCell(Text('${orderDetail?.lastName}',style: TextStyle(fontSize: 15,color: Colors.blue),))
    ]),
    DataRow(
    cells: [
    // DataCell(Text('Item code: ${orderDetail?.email}',style: TextStyle(fontSize: 17),),),
    // DataCell(Text('Approved ${orderDetail?.avatar}',style: TextStyle(fontSize: 17,color: Colors.green),))
    ]
    )
    ],
    ),
    ),
    )
    );
    },
    )
      ]);

  }
}