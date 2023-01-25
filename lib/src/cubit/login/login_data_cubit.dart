import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/login.dart';
import '../../service/login_service.dart';

part 'login_data_state.dart';

class LoginDataCubit extends Cubit<LoginDataState> {
  final LoginService _loginSevice;
  LoginDataCubit(this._loginSevice
      ):super(LoginDataInitial());

  //when ever this method call it emits LoadingScreenLoadState()
  Future<void> loadLoginData()async{
    emit(LoadingLoginDataState());
    //when gets response
    try{
      final response=await _loginSevice.loginResponse();
      emit(ResponseLoginDataState(response));
    }catch(error){
      emit(ErrorLoginDataState(error.toString()));
    }
  }
}
