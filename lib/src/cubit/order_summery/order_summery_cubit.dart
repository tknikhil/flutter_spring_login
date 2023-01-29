import 'package:bloc/bloc.dart';
import 'package:flutter_spring_login/src/model/order_summery.dart';
import 'package:meta/meta.dart';

import '../../model/login.dart';
import '../../service/login_service.dart';
import '../../service/order_summery_service.dart';

part 'order_summery_state.dart';

class OrderSummeryCubit extends Cubit<OrderSummeryState> {
  final OrderSummeryService orderSummerySevice;
  OrderSummeryCubit(this.orderSummerySevice
      ):super(OrderSummeryInitial());

  //when ever this method call it emits LoadingScreenLoadState()
  Future<OrderSummery> loadOrderSummery(refNo)async{
    emit(LoadingOrderSummeryState());
    //when gets response
    try{
      print('${orderSummerySevice.getOrderDetail(refNo)} ==================from cubit');
      OrderSummery response=await orderSummerySevice.getOrderDetail(refNo);
      print('${response.itemCode} ==================from loadOrderSummery');
      emit(ResponseOrderSummeryState(response));
      return response;
    }catch(error){
      emit(ErrorOrderSummeryState(error.toString()));
      rethrow;
    }
  }
}
