part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoaderLogin;
  final String email;
  final String password;
  final Data? user;

  const LoginState({
    this.isLoaderLogin = false,
    this.email = "",
    this.password = "",
    this.user
  });

  LoginState copyWith({
    bool? isLoaderLogin,
    String? email,
    String? password,
    Data? user
  }) => LoginState(
    isLoaderLogin: isLoaderLogin ?? this.isLoaderLogin,
    email: email ?? this.email,
    password: password ?? this.password,
    user: user ?? this.user
  );
  
  @override
  List<Object?> get props => [ isLoaderLogin, email, password, user ];
}

final class LoginInitial extends LoginState {}
