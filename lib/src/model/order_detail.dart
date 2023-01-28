
class OrderDetail{
  late String? refNo;
  late String? orderDate;
  late String? itemCode;
  late int? orderStatus;


  OrderDetail(this.refNo, this.orderDate, this.itemCode, this.orderStatus);

  OrderDetail.fromJson(Map<String, dynamic>json):refNo=json['refNo'],orderDate=json['orderDate'],itemCode=json['itemCode'],orderStatus=json['orderStatus'];

  @override
  String toString() {
    return 'OrderDetail{refNo: $refNo, orderDate: $orderDate, itemCode: $itemCode, orderStatus: $orderStatus}';
  }
}