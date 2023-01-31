class OrderSummery{
  String? itemUnit;
  String? itemName;
  double? weight;
  int? qty;
  String? itemSize;
  double? meltPer;
  String? hook;
  String? refNo;
  String? designSample;
  String? sizeSample;
  int? days;
  String? dueDate;
  String? workshop;
  String? status;
  String? orderDate;
  String? custName;
  String? type;


  OrderSummery(
      this.itemUnit,
      this.itemName,
      this.weight,
      this.qty,
      this.itemSize,
      this.meltPer,
      this.hook,
      this.refNo,
      this.designSample,
      this.sizeSample,
      this.days,
      this.dueDate,
      this.workshop,
      this.status,
      this.orderDate,
      this.custName,
      this.type);

  OrderSummery.fromJson(Map<String,dynamic> json):itemUnit=json['itemUnit']
  ,itemName=json['itemName']
  ,weight=json['weight']
  ,qty=json['qty']
  ,itemSize=json['itemSize']
  ,meltPer=json['meltPer']
  ,hook=json['hook']
  ,refNo=json['refNo']
  ,designSample=json['designSample']
  ,sizeSample=json['sizeSample']
  ,days=json['days']
  ,dueDate=json['dueDate']
  ,workshop=json['workshop']
  ,status=json['status']
  ,orderDate=json['orderDate']
  ,custName=json['custName']
  ,type=json['type'];


}