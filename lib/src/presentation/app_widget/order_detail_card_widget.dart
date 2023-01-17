import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/model/order_detail.dart';
class OrderDetailCardWidget extends StatelessWidget {
  const OrderDetailCardWidget({
    Key? key,
    required this.cdate,
    required this.orderDetail
  }) : super(key: key);

  final String cdate;
  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        shadowColor: Colors.grey,
        child: DataTable(
          columns:  [
            DataColumn(label: Text('Ref no.:${orderDetail.id}',style: TextStyle(fontSize: 23),)),
            DataColumn(label: Text("${orderDetail.firstName} ",style: TextStyle(fontSize: 23),)),
          ],
          rows: [

            DataRow(cells: [
              DataCell(Text('Order Date: $cdate',style: TextStyle(fontSize: 17),),),
              DataCell(Text('${orderDetail.lastName}',style: TextStyle(fontSize: 15,color: Colors.blue),))
            ]),
             DataRow(
                cells: [
                  DataCell(Text('Item code: ${orderDetail.email}',style: TextStyle(fontSize: 17),),),
                  DataCell(Text('Approved ${orderDetail.avatar}',style: TextStyle(fontSize: 17,color: Colors.green),))
                ]
            )
          ],
        ),
      ),
    );
  }
}