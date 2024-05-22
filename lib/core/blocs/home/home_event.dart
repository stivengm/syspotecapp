part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HandleContract extends HomeEvent {
  final List<GetContractModel> contract;
  const HandleContract(this.contract);
}