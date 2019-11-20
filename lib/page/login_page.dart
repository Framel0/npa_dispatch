import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npa_distributor/bloc/authentication/authentication.dart';
import 'package:npa_distributor/bloc/login/login.dart';
import 'package:npa_distributor/repositories/user/user.dart';
import 'package:npa_distributor/widget/widgets.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  const LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: widget.userRepository,
          );
        },
        child: SingleChildScrollView(
          child: new Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
                // color: Colors.indigoAccent,
                // image: DecorationImage(
                //   colorFilter: new ColorFilter.mode(
                //       Colors.black.withOpacity(0.05), BlendMode.dstATop),
                //   image: AssetImage('assets/images/mountains.jpg'),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormLogo(),
                SizedBox(
                  height: 30,
                ),
                LoginForm(
                  userRepository: widget.userRepository,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
