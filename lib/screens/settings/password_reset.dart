import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/screens/login/pin_enter.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
import 'package:asianbitcoins/screens/settings/setting_security.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

Future<Alert> fetchPost(String old_pass, String new_pass, context) async {
  _onBasicAlertPressed(context) {
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
                    Navigator.pushNamed(context, SettingSecurity.sid);
                  })
            ],
            title: "Password Reset",
            desc: "Password Reset Successful")
        .show();
  }

  _onBasicAlertPressed2(context) {
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
                    Navigator.pushNamed(context, PasswordReset.sid);
                  })
            ],
            title: "Password Reset",
            desc: "Incorrect Old Password")
        .show();
  }

  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/change_password.php?key=anu5781&email=' +
          email +
          '&old_pass=' +
          old_pass +
          '&new_pass=' +
          new_pass);
  if (response.statusCode == 200) {
    //  value=json.decode(response.body);
    // count++;
    // If the call to the server was successful, parse the JSON.
    Map<String, dynamic> value = json.decode(response.body);
    if (value['message'] == "1") {
      return _onBasicAlertPressed(context);
    } else {
      return _onBasicAlertPressed2(context);
    }
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class PasswordReset extends StatefulWidget {
  static const sid = 'password_reset';

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  String value;
  double lastcontainerheight;
  bool checkboxval = true;
  String old_pass;
  String new_pass;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
          child: ChatCount(),
        ),
        title: Text(
          'Password Change',
          style: text4,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 32, bottom: 16, left: 8, right: 8),
              child: Container(
                width: width - 32,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Change your password',
                        style: text2.copyWith(
                          color: color4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Container(
                width: width - 32,
                child: Text(
                  'Old password',
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
                  //  value = text;
                  //  print(value);
                  setState(() {
                    old_pass = text;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••',
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Container(
                width: width - 32,
                child: Text(
                  'New password',
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
                  // print(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••',
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Container(
                width: width - 32,
                child: Text(
                  'New password confirmation',
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
                  // value = text;
                  // print(value);
                  setState(() {
                    new_pass = text;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••',
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
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Container(
                width: width - 16,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              if (new_pass == value) {
                                fetchPost(old_pass, new_pass, context);
                              } else {
                                _onBasicAlertPressed(context);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'Change',
                                style: text2.copyWith(
                                  fontSize: 12.0,
                                  letterSpacing: 0,
                                  color: color2,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: color2,
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
//
    ));
  }

  _onBasicAlertPressed(context) {
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
                    Navigator.pushNamed(context, PasswordReset.sid);
                  })
            ],
            title: "Password Reset",
            desc: "Password and repeat password does not match")
        .show();
  }
}
