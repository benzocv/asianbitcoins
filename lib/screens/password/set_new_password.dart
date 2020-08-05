import 'dart:convert';

import 'package:asianbitcoins/screens/login/pin_enter.dart';
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

class SetNewPassword extends StatefulWidget {
  static const sid = 'set_new_password';

  @override
  _SetNewPasswordState createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  String value;
  double lastcontainerheight;
  bool checkboxval = true;
  String email;
  @override
  void initState() {
    final String args = ModalRoute.of(context).settings.arguments;
    email = args;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 520 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }

    return Container(
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
          'Set Password',
          style: text4,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
              child: Container(
                width: width - 32,
                child: Text(
                  'New Password',
                  style: text4,
                ),
              ),
            ), //phone number title
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                onChanged: (text) {
                  value = text;
                  print(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '..........',
                  hintStyle: text8,
                  helperText: '',
                  helperStyle: text11,
                  helperMaxLines: 5,
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
            ), //phonenumebr Input

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                width: width - 32,
                child: Text(
                  'Repeat Password',
                  style: text4,
                ),
              ),
            ), //phone number title
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: TextField(
                onChanged: (text) {
                  value = text;
                  print(value);
                },
                decoration: InputDecoration(
                  hintText: '..........',
                  hintStyle: text8,
                  helperText: '',
                  helperStyle: text11,
                  helperMaxLines: 5,
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
            ), //phonenumebr Input

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.sid);
                        },
                        child: Container(
                          width: width - 32,
                          child: Text(
                            'Sign In ',
                            style: text6.copyWith(
                              color: color6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //lastsignin button
          ],
        ),
      ),
//
      bottomNavigationBar: Container(
        color: color2,
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  set_password(context, email, value);
//                  Navigator.pushNamed(
//                    context,
//                    LoginScreen.sid,
//                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Next',
                      style: text5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _onBasicAlertPressed4(String email) {
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
                    Navigator.pop(context);
                  })
            ],
            title: "Password Reset",
            desc: "Your password has been changed successfuly")
        .show();
  }

  void set_password(context, String email, String value) async {
    final response = await http.get(
        'https://asianbitcoins.org/abc/api/password_reset.php?key=anu5781' +
            '&email=' +
            email +
            '&pass=' +
            value);
    if (response.statusCode == 200) {
      // count++;
      // If the call to the server was successful, parse the JSON.
      //return Post.fromJson(json.decode(response.body));

      Map<String, dynamic> value = json.decode(response.body);
      if (value['message'] == "1") {
        Navigator.pushNamed(
          context,
          LoginScreen.sid,
        );
      } else {
        return _onBasicAlertPressed4(context);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
