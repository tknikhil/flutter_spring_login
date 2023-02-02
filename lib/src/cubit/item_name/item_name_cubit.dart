import 'package:bloc/bloc.dart';
import 'package:flutter_spring_login/src/model/item_name.dart';
import 'package:flutter_spring_login/src/service/add_item_service.dart';
import 'package:meta/meta.dart';

part 'item_name_state.dart';

class ItemNameCubit extends Cubit<ItemNameState> {
  final AddItemService addItemService;

  ItemNameCubit(this.addItemService) : super(ItemNameInitial());

  Future<List<ItemName>> loadItemService() async {
    emit(LoadingItemNameState());
    //when gets response
    try {
      // print('${orderSummerySevice.getOrderDetail(refNo)} ==================from cubit');
      final response = await addItemService.addItemNameLoad();
      // print('${response.itemUnit} ==================from loadOrderSummery');
      emit(ResponseItemNameState(response));
       return response;
    } catch (error) {
      emit(ErrorItemNameState(error.toString()));
      rethrow;
    }
  }
}