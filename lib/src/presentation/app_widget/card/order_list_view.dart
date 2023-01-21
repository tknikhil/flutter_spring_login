import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/get_screen_load_cubit.dart';

import '../../../model/order_detail.dart';


class OrderListView extends StatefulWidget {
  const OrderListView({
    Key? key,
    // required this.context,
  }) : super(key: key);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
   List<OrderDetail> _orderDetail=[];
  // final BuildContext context ;
  @override
  Widget build(BuildContext context) {
    return Column(

      children:[
      buildBlocBuilder()
      ]);

  }

  BlocBuilder<GetScreenLoadCubit, List<OrderDetail>> buildBlocBuilder() {
    return BlocBuilder<GetScreenLoadCubit, List<OrderDetail> > (

      builder: (context, state) {
  if(state.isEmpty){
  return Center(child:CircularProgressIndicator());
  }else{
    _orderDetail=state.toList() ;
    return SingleChildScrollView(
      child: ListView.builder(
           // scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          itemCount: _orderDetail.length-1,
          itemBuilder: (context,index) =>SizedBox(
            width: MediaQuery.of(context).size.width,
            child: buildCard(index),
          )
      ),
    );
  }

  },
  );
  }

  Card buildCard(int index) {
    return Card(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          shadowColor: Colors.grey,
          child: buildDataTable(index),
        );
  }

  DataTable buildDataTable(int index) {
    return DataTable(
          columns: [
            DataColumn(label: Text('Ref no.:${_orderDetail?[index].firstName.toString()}',style: TextStyle(fontSize: 23),)),
             DataColumn(label: Text('${_orderDetail?[index].lastName.toString()}',style: TextStyle(fontSize: 23),)),
          ],
          rows: [

            DataRow(cells: [
            DataCell(Text('Order Date: ${_orderDetail?[index].id.toString()}',style: TextStyle(fontSize: 17),),),
            DataCell(Text('',style: TextStyle(fontSize: 15,color: Colors.blue),))
            ]),
            DataRow(
            cells: [
            DataCell(Text('Item code: ${_orderDetail?[index].email.toString()}',style: TextStyle(fontSize: 17),),),
            DataCell(Text('Approved ',style: TextStyle(fontSize: 17,color: Colors.green),))
            ]
            )
          ],
        );
  }
}