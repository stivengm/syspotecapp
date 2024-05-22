import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dio/dio.dart';
import 'package:syspotec_app/core/models/get_contract_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HandleContract>((event, emit) {
      emit( state.copyWith( contract: event.contract ));
    });
  }

  Future getContracts() async {
    // add ( Loader)

    final dio = Dio();
    String api = "http://192.168.0.20:5235/api/Contract/GetContractsByEmail";

    final response = await dio.post(api, data: {'email': 'stivenalexander7u7@gmail.com'});

    List<GetContractModel> resp = getContractModelFromJson( jsonEncode(response.data) );

    if (resp.isNotEmpty) {
      add( HandleContract(resp) );
    }
    

    print(response);



  }
}
