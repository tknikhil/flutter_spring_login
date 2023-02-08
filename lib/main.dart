import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spring_login/src/cubit/item_name/item_name_cubit.dart';
import 'package:flutter_spring_login/src/cubit/order_summery/order_summery_cubit.dart';
import 'package:flutter_spring_login/src/presentation/pages/bottom_navigation_bar_page.dart';
import 'package:flutter_spring_login/src/presentation/presentation.dart';
import 'package:flutter_spring_login/src/service/add_item_service.dart';
import 'package:flutter_spring_login/src/service/order_service.dart';
import 'package:flutter_spring_login/src/service/order_summery_service.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var orderSummeryService=OrderSummeryService();
  var addItemService=AddItemService();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  print('${OrderListView.refnoval.toString()} ===========>Mina');
  //MultiProvider for more than one cubit
  runApp(MultiProvider(
    providers: [
      Provider(create: (_)=>OrderService()),
      Provider(create: (_)=>OrderSummeryCubit(orderSummeryService)),
      Provider(create: (_)=>ItemNameCubit(addItemService))
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Login(),
      // home: Search(),
      //  home: BottomNavigationBarPage(),
    ),
  ));
}
