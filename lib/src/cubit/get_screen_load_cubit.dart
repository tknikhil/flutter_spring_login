import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/order_detail.dart';
import '../service/order_service.dart';

part 'get_screen_load_state.dart';

class GetScreenLoadCubit extends Cubit<List<OrderDetail>> {
  final _orderService = OrderService();
  GetScreenLoadCubit():super([]);

  void get orderDetails async => emit(await _orderService.getscreenOnLoad());
}
