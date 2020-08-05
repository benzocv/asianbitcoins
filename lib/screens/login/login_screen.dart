import 'dart:convert';

import 'package:asianbitcoins/backend/user_data.dart';
import 'package:asianbitcoins/screens/password/forgot_password_enter_email.dart';
import 'package:flutter/material.dart';
//components include
import 'package:asianbitcoins/components/bottom_navigation_one.dart';
import 'package:asianbitcoins/components/field_label.dart';
import 'package:asianbitcoins/components/side_bar.dart';
import 'package:asianbitcoins/components/welcome_navigation_buttons.dart';

//screens
//buy
import 'package:asianbitcoins/screens/buy/buy_trade_explore.dart';
//chat
import 'package:asianbitcoins/screens/chat/chat_home.dart';
//dashboard
import 'package:asianbitcoins/screens/dashboard/dashboard_open_trade.dart';
//explore
import 'package:asianbitcoins/screens/explore/buy_coin_dashboard.dart';
import 'package:asianbitcoins/screens/explore/post_trade_decide.dart';
import 'package:asianbitcoins/screens/explore/sell_coin_dashboard.dart';
//extra
import 'package:asianbitcoins/screens/extra/trusted_people.dart';
//login
import 'package:asianbitcoins/screens/login/login_screen.dart';
//notification
import 'package:asianbitcoins/screens/notification/notification_home.dart';
//reading
import 'package:asianbitcoins/screens/reading/faq.dart';
import 'package:asianbitcoins/screens/reading/fees.dart';
import 'package:asianbitcoins/screens/reading/guide.dart';
import 'package:asianbitcoins/screens/reading/help.dart';
import 'package:asianbitcoins/screens/reading/how_to_buy.dart';
import 'package:asianbitcoins/screens/reading/support.dart';
//sell
import 'package:asianbitcoins/screens/sell/sell_trade_explore.dart';
//signup
import 'package:asianbitcoins/screens/signup/email_verification.dart';
import 'package:asianbitcoins/screens/signup/phone_verification.dart';
import 'package:asianbitcoins/screens/signup/privacy_policy.dart';
import 'package:asianbitcoins/screens/signup/profile_information_one.dart';
import 'package:asianbitcoins/screens/signup/profile_information_two.dart';
import 'package:asianbitcoins/screens/signup/profile_information_three.dart';
import 'package:asianbitcoins/screens/signup/signup_screeen_one.dart';
import 'package:asianbitcoins/screens/signup/teram_of_service.dart';
import 'package:asianbitcoins/screens/signup/two_factor.dart';
//wallet
import 'package:asianbitcoins/screens/wallet/wallet_send.dart';
//welcome navigation alone screen
import 'package:asianbitcoins/screens/welcome_navigation.dart';
//utilites
import 'package:asianbitcoins/utilites/const_design1.dart';
import 'package:asianbitcoins/utilites/dropdown_lists.dart';
import 'package:asianbitcoins/utilites/functionality.dart';
//packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const sid = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String value;
  final _formKey2 = GlobalKey<FormState>();
  bool _autoValidate = false;
  double lastcontainerheight;
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      _autoValidate = true;

      return 'Enter Valid Email';
    } else
      return null;
  }

  String _email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    lastcontainerheight = height - 505 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }

    return Container(
      child: Form(
        key: _formKey2,
        autovalidate: _autoValidate,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: color4,
            ),
            centerTitle: true,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(FontAwesomeIcons.chevronLeft),
            ),
            title: Text(
              'Log In',
              style: text4,
            ),
          ),
          body: StaggeredGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: color3,
                        backgroundImage: AssetImage('images/logo.png'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Asian Bitcoins',
                        style: text1,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              FieldLabel(
                title: 'Email',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: TextFormField(
                  onSaved: (val) => setState(() => _email = val),
                  validator: validateEmail,
                  onChanged: (text) {
                    value = text;
                    _email = text;
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'example@gmail.com',
                    hintStyle: text8,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: color2,
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: color2,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: color2,
                        width: 3,
                      ),
                    ),
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  style: text7,
                  cursorColor: color2,
                  cursorWidth: 3,
                ),
              ),
              Container(
                height: 20.0,
                width: double.infinity,
              ),
              FieldLabel(
                title: 'Password',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      //_autoValidate=true;
                      return 'Please enter password';
                    }

                    return null;
                  },
                  onChanged: (text) {
                    value = text;
                    pass = text;
                    print(value);
                  },
                  onSaved: (val) => setState(() => pass = val),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '.......',
                    hintStyle: text8,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: color2,
                        width: 2,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: color2,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: color2,
                        width: 3,
                      ),
                    ),
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  style: text7,
                  cursorColor: color2,
                  cursorWidth: 3,
                ),
              ),
              Container(
                height: 20.0,
                width: double.infinity,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordEmail.sid);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Forget Password ?',
                            style: text6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      children: <Widget>[
//                        GestureDetector(
//                          onTap: () {
//                            Navigator.pushNamed(context, SignUpScreenOne.sid);
//                          },
//                          child: Text(
//                            'Sign Up now !',
//                            style: text6.copyWith(
//                              color: color6,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
            ],
            staggeredTiles: [
              StaggeredTile.extent(2, 130), //avatar
              StaggeredTile.extent(2, 20), //sizedbox
              StaggeredTile.extent(2, 30), //company text

              StaggeredTile.extent(2, 50), //firstpad contianer
              StaggeredTile.extent(2, 30), //email label
              StaggeredTile.extent(2, 60), //email input
              StaggeredTile.extent(2, 25), //container
              StaggeredTile.extent(2, 30), //password label
              StaggeredTile.extent(2, 60), //password input
              StaggeredTile.extent(2, 10), //container 2
              StaggeredTile.extent(2, 60), //forget password
              StaggeredTile.extent(
                  2, lastcontainerheight), //lastcontainerheight
            ],
          ),
          bottomNavigationBar: BottomOne(
            colour: color2,
            text: 'Log In',
            ontap: () {
              if (_formKey2.currentState.validate()) {
                final FormState form = _formKey2.currentState;
                form.save();
                verify_email(_email, pass);
              }
            },
            textStyle: text5,
          ),
        ),
      ),
    );
  }

  _onBasicAlertPressed6(context) {
    Alert(
            context: context,
            buttons: [
              DialogButton(
                  color: color2,
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, DashboardOpenTrade.sid);
                    Navigator.pop(context);
                  })
            ],
            title: "Login Failed",
            desc: "Incorrect email or password entered")
        .show();
  }

  void verify_email(String email, String pass) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/logins.php?email=' +
            email +
            '&key=anu5781&pass=' +
            pass);
    if (response.statusCode == 200) {
      // count++;
      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        Navigator.pushNamed(context, TwoFactor.sid,
            arguments: LoginCredentials(email, pass));

        // return releasetrade(con_id);
      } else {
        _onBasicAlertPressed6(context);
      }

      // If the call to the server was successful, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
