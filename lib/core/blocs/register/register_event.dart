part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class HandleLoader extends RegisterEvent {
  final bool isLoaderRegister;
  const HandleLoader(this.isLoaderRegister);
}