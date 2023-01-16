import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/presentation/pages/add_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../app_widget/side_menu.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        drawer: const Drawer(child: SideMenu()),
        backgroundColor: const Color(0xfffd4af37),
        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: (newIndex) => setState(() => _index = newIndex),
        //   currentIndex: _index,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add New'),
        //     // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        //   ],
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //greeting bar

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //menu
                        InkWell(
                          child: Container(
                              padding: EdgeInsets.all(12),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.brown,
                                size: 25,
                              ),
                          ),
                          onTap: (){
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                        //Hi Nikhil
                        Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hi Nikhil",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                cdate,
                                style: const TextStyle(
                                    color: Color(0xffffbf1de),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.yellow,
                                maxRadius: 25.0,
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.brown,
                                  size: 50,
                                ),
                              )
                            ],
                          ),
                        ])
                      ],
                    ),

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
                                child: DataTable(
                                  columns: const [
                                    DataColumn(label: Text("Ref no.:1000",style: TextStyle(fontSize: 23),)),
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
                                    DataColumn(label: Text("Ref no.:1200",style: TextStyle(fontSize: 23),)),
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
                                          DataCell(Text('Approved',style: TextStyle(fontSize: 17,color: Colors.green),))
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
