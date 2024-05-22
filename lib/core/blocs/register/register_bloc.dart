import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:syspotec_app/core/models/register_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<HandleLoader>((event, emit) {
      emit( state.copyWith( isLoaderRegister: event.isLoaderRegister ) );
    });
  }

  Future<RegisterModel> register(
    String name, 
    String lastName, 
    String identificationNumber, 
    String address,
    String phone, 
    String email, 
    String password
    ) async {
    add( const HandleLoader(true) );

    final dio = Dio();
    var bodyData  = {
      "name": name,
      "lastName": lastName,
      "identificationNumber": identificationNumber,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address,
      "image": "",
      "companyNit": "905315466",
      "genderId": 1,
      "identificationTypeId": 1
    };
    String api = "http://192.168.0.20:5235/api/Users/enrollment";

    final response = await dio.post(api, data: bodyData);
    RegisterModel resp = RegisterModel.fromJson( response.data );

    if (resp.code == "TRX001") {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', resp.data.token!);
      add( const HandleLoader(false) );
      return resp;
    } else {
      add( const HandleLoader(false) );
      print(resp.message);
      return resp;
    }
  }

}
