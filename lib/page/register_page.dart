import 'package:flutter/material.dart';
import 'package:npa_distributor/repositories/user/user.dart';
import 'package:npa_distributor/routes/routes.dart';
import 'package:npa_distributor/util/util.dart';
import 'package:npa_distributor/widget/form_logo.dart';
import 'package:npa_distributor/widget/widgets.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository userRepository;

  const RegisterPage({Key key, @required this.userRepository})
      : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
          child: new Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormLogo(),
                SizedBox(
                  height: 30,
                ),
                RegistrationForm(
                  userRepository: widget.userRepository,
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
