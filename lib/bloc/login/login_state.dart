import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable {
  LoginState([List<Object> props = const []]) : super(props);
}

class LoginInitial extends LoginState {
  @override
  String toString() {
    return "LoginInitial";
  }
}

class LoginLoading extends LoginState {
  @override
  String toString() {
    return "LoginLoading";
  }
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
