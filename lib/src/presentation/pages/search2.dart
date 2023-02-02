import 'package:flutter/material.dart';
import 'package:flutter_spring_login/src/model/model.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';
import 'package:flutter_spring_login/src/service/order_service.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../model/login.dart';
import '../app_widget/app_widget.dart';


class Search2 extends StatefulWidget {
   Search2({Key? key}) : super(key: key);

  @override
  State<Search2> createState() => _Search2State();
}

class _Search2State extends State<Search2> {
  // String? username=Login.userName.toString();
  late OrderService orderService;
  @override
  Widget build(BuildContext context) {

    String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    final searchController=TextEditingController();
    final orderListView=OrderListView();
    return SizedBox(
      //takes host mobile complete screen size
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        //drawer
        drawer: const MenuDrawer(),
        //appbar
        appBar: AppBarWidget(cdate: cdate,builder: Builder(builder: (context) =>
                    IconButton(
                        icon: const Icon(Icons.menu),
                        color: Colors.brown,
                        onPressed: () => Scaffold.of(context).openDrawer()
                    ),
                )),
        backgroundColor: const Color(0xfffd4af37),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    searchByRef(searchController),
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
                    color: const Color(0xffff0ead6),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children:  [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Text("${getOrderData().response as List<OrderDetail>}")
                            //card
                            // OrderDetailCardWidget(),
//                             ListView.builder{
// var orderData=getOrderData().response;
// print(orderData);
//                             })
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

  TextField searchByRef(TextEditingController searchController) {
    return TextField(
                    onChanged: (value)=> OrderListViewState().runFilter2(value),
                    controller: searchController,
                    onTap: OrderListViewState().search(searchController),
                    style: const TextStyle(
                      color: Palette.text,
                      fontSize: 20
                    ),
                    decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(color: Color.fromRGBO(105, 105,105, 0.5),fontSize: 20),
                      labelStyle: TextStyle(
                        fontSize: 20,),
                      filled: true,
                      fillColor: Colors.white70,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.all(Radius.circular(9
                            )
                            )
                        )
                    ),
                  );
  }

 Future<List<OrderDetail>> getOrderData()async{
    try{
      final response=await orderService.getScreenOnLoad();
      print('$response=========>getOrderData');
      return response;
    }catch(error){
      print(error);
      rethrow;
    }

  }
}
