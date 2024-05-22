part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IsLoader extends LoginEvent {
  final bool? isLoaderLogin;
  const IsLoader( this.isLoaderLogin );
}

class LogIn extends LoginEvent {
  final String? email;
  final String? password;
  const LogIn({ this.email, this.password });
}

class HandleUserLogged extends LoginEvent {
  final Data? user;
  const HandleUserLogged(this.user);
}