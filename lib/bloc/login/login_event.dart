import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List<Object> props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String phoneNumber;
  final String password;

  LoginButtonPressed({
    @required this.phoneNumber,
    @required this.password,
  });

  @override
  List<Object> get props => [phoneNumber, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $phoneNumber, password: $password }';
}
