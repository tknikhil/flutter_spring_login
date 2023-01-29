class OrderSummery{
  String? itemCode;
  String? itemUnit;
  String? refNo;
  String? fixRate;
  int? orderStatus;
  int? orderTyp;
  String? rowStatus;
  double? itemPrice;
  String? orderDate;
  String? custCode;

  OrderSummery(
      this.itemCode,
      this.itemUnit,
      this.refNo,
      this.fixRate,
      this.orderStatus,
      this.orderTyp,
      this.rowStatus,
      this.itemPrice,
      this.orderDate,
      this.custCode);

  OrderSummery.fromJson(Map<String,dynamic> json):itemCode=json['itemCode'],itemUnit=json['itemUnit'],refNo=json['refNo'],fixRate=json['fixRate'],orderStatus=json['orderStatus'],orderTyp=json['orderTyp'],rowStatus=json['rowStatus'],itemPrice=json['itemPrice'],orderDate=json['orderDate'],custCode=json['custCode'];


}