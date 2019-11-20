import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:npa_distributor/bloc/authentication/authentication.dart';
import 'package:npa_distributor/bloc/simple_bloc_delegate.dart';
import 'package:npa_distributor/bloc/vehicle/vehicle.dart';
import 'package:npa_distributor/color.dart';
import 'package:npa_distributor/page/landing_page.dart';
import 'package:npa_distributor/repositories/user/user.dart';
import 'package:npa_distributor/repositories/vehicle/vehicle.dart';
import 'package:npa_distributor/routes/route_generator.dart';
import 'package:npa_distributor/widget/widgets.dart';

import 'page/pages.dart';
import 'routes/routes.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  final vehicleRepository = VehicleRepository(
      vehicleApiClient: VehicleApiClient(httpClient: http.Client()));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        builder: (context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..dispatch(AppStarted());
        },
      ),
      BlocProvider<VehicleBloc>(
        builder: (context) {
          return VehicleBloc(vehicleRepository: vehicleRepository);
        },
      ),
    ],
    child: MyApp(
      userRepository: userRepository,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, @required this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dispatch',
      theme: _buildTheme(),
      onGenerateRoute: RouteGenerator.generatorRoute,
      home: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, homeRoute, (Route<dynamic> route) => false);
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            }
            if (state is AuthenticationUnauthenticated) {
              // return HomePage();
              return LandingPage(
                userRepository: userRepository,
              );
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: colorAccentYellow,
    primaryColor: colorPrimary,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: colorPrimaryYellow,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    errorColor: kShrineErrorRed,
  );
}
