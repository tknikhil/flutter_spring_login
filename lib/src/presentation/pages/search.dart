import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spring_login/src/cubit/cubit.dart';
import 'package:intl/intl.dart';

import '../app_widget/app_widget.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //for bottom navigation bar
  int _index = 0;


  @override
  Widget build(BuildContext context) {
    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    switch (_index) {
      case 0:
        var child = print(_index);
        break;
      case 1:
        var child = print(_index);
        break;
    }
    return SizedBox(
      //takes host mobile complete screen size
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        //drawer
        drawer: MenuDrawer(),
        //appbar
        appBar: AppBarWidget(cdate: cdate),
        backgroundColor: const Color(0xfffd4af37),
        //bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) => setState(() => _index = newIndex),
          currentIndex: _index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add New'),
            // BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
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
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  child: Container(
                    color: Color(0xffff0ead6),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //card
                            OrderDetailCardWidget(),
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
