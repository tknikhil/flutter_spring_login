part of 'login_data_cubit.dart';

@immutable
abstract class LoginDataState {}

class LoginDataInitial extends LoginDataState {}

class LoadingLoginDataState extends LoginDataState{}
class ErrorLoginDataState extends LoginDataState{
  final String message;
  ErrorLoginDataState(this.message);
}
class ResponseLoginDataState extends LoginDataState{
  final List<Login> loginData;
  ResponseLoginDataState(this.loginData);
}

