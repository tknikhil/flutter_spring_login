import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/model/order_detail.dart';
import 'package:flutter_spring_login/src/presentation/pages/add_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../service/loginService.dart';
import '../app_widget/appbar_widget.dart';
import '../app_widget/order_detail_card_widget.dart';
import '../app_widget/side_menu.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
    print('initState()');
    Future.delayed(Duration(seconds: 10),(){
setState(() {
  screenOnLoads=screenOnLoad() as Future<List?>;
});
    });


  }


  final _baseUrl = "https://reqres.in/api/users?page=2";
  // String? stringResponce;
  Map? mapResponse;
  Map? dataResponse;
  List? listResponse;
  List? orderDetails;
  late Future<List?> screenOnLoads;
  List? screenOnLoad() {
    var val;
    http.Response response;
    // response= await http.get(Uri.parse('${_baseUrl}orderdetails/srcOnLoadOrderDtl'));
    response=  http.get(Uri.parse('${_baseUrl}')) as http.Response;
    if(response.statusCode==200){
      setState((){

        // stringResponce=response.body;
        mapResponse=json.decode(response.body);

        listResponse=mapResponse!['data'];
        orderDetails= listResponse?.map((e) => OrderDetail.fromJson(e)).toList();

        print(listResponse.toString()+"screenOnLoad()");
      });
return orderDetails;
    }
return null;
  }




  int _index=0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    switch (_index) {
      case 0:
        var child = print(_index);
        break;
      case 1:
        var child =print(_index);
        break;

    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        drawer: const Drawer(child:
          SideMenu(),),
          appBar:AppBarWidget(cdate: cdate),
        backgroundColor: const Color(0xfffd4af37),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) => setState(() => _index = newIndex),
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add New'),
            // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          ],
        ),
         body:SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //greeting bar



                    const SizedBox(
                      height: 15,
                    ),

                    //  Search Bar

                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffffbf1de),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 15,
              // ),
              Expanded(

                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),

                  child: Container(
                    color: Color(0xffff0ead6),

                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                               padding: const EdgeInsets.all(15.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4,
                                shadowColor: Colors.grey,

                                    // stringResponce.toString()
                                  child:listResponse==null?
                                  Container():
                                  Text(listResponse![0].toString())
                                ,
                              ),
                            ),
                            OrderDetailCardWidget(cdate: cdate,orderDetail: orderDetails![0],),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4,
                                shadowColor: Colors.grey,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text("Ref no.:1300",style: TextStyle(fontSize: 23),)),
                                    DataColumn(label: Text("Status",style: TextStyle(fontSize: 23),)),
                                  ],
                                  rows: [

                                    DataRow(cells: [
                                      DataCell(Text('Order Date: $cdate',style: TextStyle(fontSize: 17),),),
                                      DataCell(Text('',style: TextStyle(fontSize: 15,color: Colors.blue),))
                                    ]),
                                    const DataRow(
                                        cells: [
                                          DataCell(Text('Item code: NC',style: TextStyle(fontSize: 17),),),
                                          DataCell(Text('Progress',style: TextStyle(fontSize: 17,color: Colors.red),))
                                        ]
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4,
                                shadowColor: Colors.grey,
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text("Ref no.:1400",style: TextStyle(fontSize: 23),)),
                                    DataColumn(label: Text("Status",style: TextStyle(fontSize: 23),)),
                                  ],
                                  rows: [

                                    DataRow(cells: [
                                      DataCell(Text('Order Date: $cdate',style: TextStyle(fontSize: 17),),),
                                      DataCell(Text('',style: TextStyle(fontSize: 15,color: Colors.blue),))
                                    ]),
                                    const DataRow(
                                        cells: [
                                          DataCell(Text('Item code: NC',style: TextStyle(fontSize: 17),),),
                                          DataCell(Text('Send',style: TextStyle(fontSize: 17,color: Colors.blue),))
                                        ]
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // _onBottomNavigationBarTap(BuildContext context) {
  //   // Fluttertoast.showToast(
  //   //     msg: "Work in Progress!!",
  //   //     toastLength: Toast.LENGTH_SHORT,
  //   //     gravity: ToastGravity.BOTTOM,
  //   //     timeInSecForIosWeb: 1,
  //   //     textColor: Colors.white,
  //   //     fontSize: 16.0
  //   // );
  //   setState(() {
  //     Future.delayed(Duration.zero,(){
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddItem()));
  //     });
  //
  //   });
  //
  // }
}





