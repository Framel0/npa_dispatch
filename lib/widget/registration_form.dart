import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npa_distributor/bloc/vehicle/vehicle.dart';
import 'package:npa_distributor/color.dart';
import 'package:npa_distributor/model/models.dart';
import 'package:npa_distributor/repositories/user/user.dart';
import 'package:npa_distributor/routes/routes.dart';
import 'package:npa_distributor/util/util.dart';
import 'package:npa_distributor/widget/widgets.dart';

class RegistrationForm extends StatefulWidget {
  final UserRepository userRepository;

  const RegistrationForm({Key key, @required this.userRepository})
      : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextStyle formTextStyle = TextStyle(fontSize: 18.0, color: Colors.black);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  Vehicle _selectedVehicle;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleBloc = BlocProvider.of<VehicleBloc>(context);
    return BlocBuilder<VehicleBloc, VehicleState>(
        bloc: vehicleBloc,
        builder: (context, state) {
          if (state is VehicleLoading) {
            return LoadingIndicator();
          }

          if (state is VehicleLoaded) {
            final dropdownMenuItems = state.vehicles;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildFirstNameField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildLastNameField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPhoneNumberField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPasswordField(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildVehicleField(dropdownMenuItems),
                  SizedBox(
                    height: 20,
                  ),
                  _buildCapacityField(),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          side: BorderSide(color: Colors.white)),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      // color: Theme.of(context).buttonColor,
                      textColor: Colors.white,
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          Navigator.pushReplacementNamed(
                              // replcet the curent layout unlike push that just creates new page
                              context,
                              loginRoute);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    child: Text(
                      'Already have an account, Login',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          // replcet the curent layout unlike push that just creates new page
                          context,
                          loginRoute,
                          arguments: widget.userRepository);
                    },
                  ),
                ],
              ),
            );
          }

          if (state is VehicleError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Error",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.red),
                ),
                IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: () {
                    vehicleBloc.dispatch(FetchVehicles());
                  },
                )
              ],
            );
          }
        });
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      // autovalidate: true,
      validator: (String value) {
        if (!isEmail(value) || value.trim().isEmpty)
          return 'Please enter First Name.';

        return null;
      },

      style: formTextStyle,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      decoration: inputDecoration("First Name"),
      controller: _firstNameController,
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      // autovalidate: true,
      validator: (String value) {
        if (!isEmail(value) || value.trim().isEmpty)
          return 'Please enter Last Name.';

        return null;
      },

      style: formTextStyle,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      decoration: inputDecoration("Last Name"),
      controller: _lastNameController,
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      // autovalidate: true,
      validator: (String value) {
        if (!isEmail(value) || value.trim().isEmpty)
          return 'Please enter Phone Number.';

        return null;
      },

      style: formTextStyle,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.phone,
      decoration: inputDecoration('Phone Number'),
      controller: _phoneNumberController,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      validator: (String value) {
        if (value.trim().isEmpty) return 'Please enter Password.';

        return null;
      },
      style: formTextStyle,
      keyboardType: TextInputType.text,
      decoration: inputDecoration('Password'),
      controller: _passwordController,
    );
  }

  onChangeDropdownItemVehicle(Vehicle selectedVehicle) {
    setState(() {
      _selectedVehicle = selectedVehicle;
    });
  }

  Widget _buildVehicleField(List<DropdownMenuItem<Vehicle>> dropdownMenuItems) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: colorPrimaryYellow, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          shape: BoxShape.rectangle),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: DropdownButton(
        value: _selectedVehicle,
        items: dropdownMenuItems,
        hint: Text(
          "Select Type of Vehicle",
          style: TextStyle(color: colorPrimary),
        ),
        onChanged: onChangeDropdownItemVehicle,
        style: formTextStyle,
        isExpanded: true,
      ),
    );
  }

  Widget _buildCapacityField() {
    return TextFormField(
      obscureText: true,
      validator: (String value) {
        if (value.trim().isEmpty) return 'Please enter Capacity.';

        return null;
      },
      style: formTextStyle,
      keyboardType: TextInputType.text,
      decoration: inputDecoration('Capacity'),
    );
  }
}
