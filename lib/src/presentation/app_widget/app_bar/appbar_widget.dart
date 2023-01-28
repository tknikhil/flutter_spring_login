import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spring_login/src/cubit/login/login_data_cubit.dart';
import 'package:flutter_spring_login/src/model/login.dart';
import 'package:flutter_spring_login/src/service/login_service.dart';


class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.cdate,
    // required this.username
  }) : super(key: key);

  final String cdate;



  @override
  Widget build(BuildContext context) {

    // String? username=login?.userName.toString();
    // return BlocProvider<LoginDataCubit>(
    //   create: (context) => LoginDataCubit(LoginService()),
    //   child: BlocBuilder<LoginDataCubit, LoginDataState>(
    //     builder: (context, state) {
          // if(state is LoginDataInitial||state is LoadingLoginDataState){
          //   return const Center(child: CircularProgressIndicator());
          // }
          // else if(state is ResponseLoginDataState){
          //   print('$state ResponseLoginDataState');

             return
              buildAppBar();
          // }//ResponseLoginDataState
          // else if(state is ErrorLoginDataState){
          //   return Center(
          //     child: Text(state.message),
          //   );
          // }else{

            // return Center(child: Text(state.toString()));
        //   }
        // },
      // ),
    // );
  }

  AppBar buildAppBar() {

    // List<Login> _login=state.loginData;
    print('App bar ');
    // print(login.userName);
    // print(' ${_login[0].userName.toString()} AppBar buildAppBar');
    return AppBar(
          backgroundColor: const Color(0xfffd4af37),
          leading: Builder(builder: (context) =>
              IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.brown,
                  onPressed: () => Scaffold.of(context).openDrawer()
              ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //menu
                Container(
                  padding: const EdgeInsets.all(12),

                ),
                //Hi Nikhil
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi ${LoginService.loginval.userName.toString()}',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        cdate,
                        style: const TextStyle(
                            color: Color(0xffffbf1de),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        maxRadius: 25.0,
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.brown,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                ])
              ],
            ),
          ],);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}