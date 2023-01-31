import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/presentation/pages/order_summery.dart';
import 'package:flutter_spring_login/src/service/order_service.dart';
import 'package:flutter_spring_login/src/service/order_summery_service.dart';
import 'package:provider/provider.dart';
import '../../../cubit/cubit.dart';

import 'package:flutter_spring_login/src/model/model.dart';

import '../../../cubit/order_summery/order_summery_cubit.dart';
import '../../../service/login_service.dart';

class OrderListView extends StatefulWidget {
  static var refnoval;
  const OrderListView({
    Key? key,
    // required this.context,
  }) : super(key: key);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {

  late OrderSummeryService orderSummeryService;
  late final cubit;
//initState is called before widget tree
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState()');
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       cubit = context.read<GetScreenLoadCubit>();
      if(LoginService.loginval.groupNo==2 )
      //cubit.loadCustmrOrdrData();
        print(LoginService.loginval.userName.toString());
      else
        cubit.loadCustmrOrdrData();
    });
  }

  List<OrderDetail> _orderDetail = [];

  // final BuildContext context ;
  @override
  Widget build(BuildContext context) {

    return Column(children: [buildBlocBuilder()]);
  }

  //List<OrderDetail> instead of cubit state
  BlocBuilder<GetScreenLoadCubit, GetScreenLoadState> buildBlocBuilder() {
    return BlocBuilder<GetScreenLoadCubit, GetScreenLoadState>(
      builder: (context, state) {
        if (state is GetScreenLoadInitial || state is LoadingScreenLoadState) {
          return const Center(child: CircularProgressIndicator());

        } //GetScreenLoadInitial, LoadingScreenLoadState
        else if (state is ResponseScreenLoadState) {
          if (kDebugMode) {
            print("${state.orderDetial} else if ResponseScreenLoadState");
          }
          _orderDetail = state.orderDetial;

          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    // scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _orderDetail.length ,
                    itemBuilder: (context, index) => SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: buildCard(index),
                          ),
                        )),
              ],
            ),
          );
        } //ResponseScreenLoadState
        else if (state is ErrorScreenLoadState) {
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
static var refnoval;
  ListTile buildDataTable(int index) {
    return ListTile(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  OrderSummeryPage(refNo: _orderDetail[index].refNo)));
 // orderSummeryService.getOrderDetail(_orderDetail[index].refNo);
        print('${_orderDetail[index].refNo} refno');
          refnoval=_orderDetail[index].refNo;
        },
      title: DataTable(
        columns: [
          DataColumn(
              label: Text(
            'Ref no.:${_orderDetail[index].refNo.toString()}',
            style: const TextStyle(fontSize: 17),
          )),
          DataColumn(
              label: Text(
            _orderDetail[index].status.toString(),
            style:  TextStyle(fontSize: 17,color:(_orderDetail[index].status=='Assigned')?Colors.green:(_orderDetail[index].status=='Confirmed')?Colors.green:Colors.red),
          )),
        ],
        rows: [
          DataRow(cells: [
            DataCell(
              Text(
                'Order Date',
                style: const TextStyle(fontSize: 17),
              ),
            ),
             DataCell(Text(
              '${_orderDetail[index].orderDate.toString()}',
              style: TextStyle(fontSize: 15, ),
            ))
          ]),
          DataRow(cells: [
            DataCell(
              Text(
                'Item Name',
                style: const TextStyle(fontSize: 17),
              ),
            ),
             DataCell(Text(
              '${_orderDetail[index].itemName.toString()}',
              style: TextStyle(fontSize: 17, ),
            ))
          ])
        ],
      ),
    );
  }
}
