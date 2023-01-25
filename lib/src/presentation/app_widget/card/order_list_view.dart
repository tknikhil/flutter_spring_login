import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/cubit.dart';

import 'package:flutter_spring_login/src/model/model.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({
    Key? key,
    // required this.context,
  }) : super(key: key);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
//initState is called before widget tree
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState()');
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<GetScreenLoadCubit>();
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
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _orderDetail.length - 1,
                itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: buildCard(index),
                    )),
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

  DataTable buildDataTable(int index) {
    return DataTable(
      columns: [
        DataColumn(
            label: Text(
          'Ref no.:${_orderDetail[index].firstName.toString()}',
          style: const TextStyle(fontSize: 23),
        )),
        DataColumn(
            label: Text(
          _orderDetail[index].lastName.toString(),
          style: const TextStyle(fontSize: 23),
        )),
      ],
      rows: [
        DataRow(cells: [
          DataCell(
            Text(
              'Order Date: ${_orderDetail[index].id.toString()}',
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const DataCell(Text(
            '',
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ))
        ]),
        DataRow(cells: [
          DataCell(
            Text(
              'Item code: ${_orderDetail[index].email.toString()}',
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const DataCell(Text(
            'Approved ',
            style: TextStyle(fontSize: 17, color: Colors.green),
          ))
        ])
      ],
    );
  }
}
