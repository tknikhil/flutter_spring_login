import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/order_detail.dart';
import '../../service/order_service.dart';

part 'get_screen_load_state.dart';

class GetScreenLoadCubit extends Cubit<GetScreenLoadState> {
  // Cubit<List<OrderDetail>> use in place extends code modified
  //in order to make api call we need service
  final  OrderService _orderService;
  // GetScreenLoadCubit():super([]);

  //GetScreenLoadInitial is called from GetScreenLoadState when ever GetScreenLoadCubit initialize
  GetScreenLoadCubit(this._orderService):super(GetScreenLoadInitial());

  //when ever this method call it emits LoadingScreenLoadState()
  Future<void> loadCustmrOrdrData()async{
  emit(LoadingScreenLoadState());
  //when gets response
  try{
    final response=await _orderService.getScreenOnLoad();
    emit(ResponseScreenLoadState(response));
  }catch(error){
    emit(ErrorScreenLoadState(error.toString()));
  }
  }


  // get orderDetails async => emit(await _orderService.getScreenOnLoad());
}
