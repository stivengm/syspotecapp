import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dio/dio.dart';
import 'package:syspotec_app/core/models/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<IsLoader>((event, emit) => emit( state.copyWith( isLoaderLogin: event.isLoaderLogin ) ));
    on<HandleUserLogged>((event, emit) => emit( state.copyWith( user: event.user ) ));

  }
  
  Future<LoginModel> login(String email, String password) async {
    add( const IsLoader(true) );

    final dio = Dio();
    String api = "http://192.168.0.20:5235/api/Users/authentication";

    final response = await dio.post(api, data: {'email': email, 'password': password});
    LoginModel resp = LoginModel.fromJson( response.data );

    if (resp.code == "TRX001") {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', resp.data.token!);
      add( const IsLoader(false) );
      add( HandleUserLogged( resp.data[0] ) );
      return resp;
    } else {
      add( const IsLoader(false) );
      print(resp.message);
      return resp;
    }
  }
}
