import 'package:bloc/bloc.dart';
import 'package:flutter_spring_login/src/model/order_summery.dart';
import 'package:meta/meta.dart';

import '../../model/login.dart';
import '../../service/login_service.dart';
import '../../service/order_summery_service.dart';

part 'order_summery_state.dart';

class OrderSummeryCubit extends Cubit<OrderSummeryState> {
  final OrderSummeryService _orderSummerySevice;
  OrderSummeryCubit(this._orderSummerySevice
      ):super(OrderSummeryInitial());

  //when ever this method call it emits LoadingScreenLoadState()
  Future<void> loadOrderSummery(refNo)async{
    emit(LoadingOrderSummeryState());
    //when gets response
    try{
      final response=await _orderSummerySevice.getOrderDetail(refNo);
      print('$response ==================from cubit');
      emit(ResponseOrderSummeryState(response));
    }catch(error){
      emit(ErrorOrderSummeryState(error.toString()));
    }
  }
}
