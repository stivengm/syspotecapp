part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<GetContractModel>? contract;

  const HomeState({
    this.contract
  });

  HomeState copyWith({
    List<GetContractModel>? contract,
  }) => HomeState(
    contract: contract ?? this.contract
  );
  
  @override
  List<Object?> get props => [ contract ];
}

final class HomeInitial extends HomeState {}
