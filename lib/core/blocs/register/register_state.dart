part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoaderRegister;
  const RegisterState({
    this.isLoaderRegister = false
  });

  RegisterState copyWith({
    bool? isLoaderRegister
  }) => RegisterState(
    isLoaderRegister: isLoaderRegister ?? this.isLoaderRegister
  );
  
  @override
  List<Object> get props => [ isLoaderRegister ];
}

final class RegisterInitial extends RegisterState {}
