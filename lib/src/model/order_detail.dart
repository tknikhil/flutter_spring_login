
class OrderDetail{
  late String? refNo;
  late String? orderDate;
  late String? itemName;
  late String? status;


  OrderDetail(this.refNo, this.orderDate, this.itemName, this.status);

  OrderDetail.fromJson(Map<String, dynamic>json):refNo=json['refNo'],orderDate=json['orderDate'],itemName=json['itemName'],status=json['status'];

  @override
  String toString() {
    return 'OrderDetail{refNo: $refNo, orderDate: $orderDate, itemCode: $itemName, status: $status}';
  }
}