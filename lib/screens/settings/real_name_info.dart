import 'dart:convert';

import 'package:asianbitcoins/components/chat_count.dart';
import 'package:asianbitcoins/screens/login/pin_enter.dart';
import 'package:asianbitcoins/screens/settings/setting_profile.dart';
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
import 'package:asianbitcoins/screens/settings/email_reset.dart';
import 'package:asianbitcoins/screens/settings/phone_deactivate.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Alert> fetchPost(String fname, String lname, context) async {
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
                    Navigator.pushNamed(context, SettingProfile.sid);
                  })
            ],
            title: "Change Name",
            desc: "Change Name Successful")
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
                    Navigator.pushNamed(context, RealNameInfo.sid);
                  })
            ],
            title: "Change Name",
            desc: "Failed")
        .show();
  }

  // BuildContext context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String email = prefs.getString('email');
  final response = await http.get(
      'https://asianbitcoins.org/abc/api/change_real_name.php?key=anu5781&email=' +
          email +
          '&fname=' +
          fname +
          '&lname=' +
          lname);
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

class RealNameInfo extends StatefulWidget {
  static const sid = 'real_name_info';

  @override
  _RealNameInfoState createState() => _RealNameInfoState();
}

class _RealNameInfoState extends State<RealNameInfo> {
  String value;
  double lastcontainerheight;
  bool checkboxval = true;
  String fname;
  String lname;
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
          'Real Name',
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
                        text: 'Your Name',
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
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: width - 32,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'You may need to set your name before you can buy bitcoins from some advertisements. After setting your real name it is not displayed publicly, it is only shown to Bitcoin traders with whom you\'ve opened trades to buy Bitcoin. You can set your real name only once and it can\'t be changed after it has been confirmed by a bitcoin seller.',
                        style: text10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                width: width - 32,
                child: Text(
                  'First Name',
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
                  fname = text;
                  print(value);
                },
                decoration: InputDecoration(
                  hintText: 'User Name',
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
                  'Last Name',
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
                  lname = text;
                  print(value);
                },
                decoration: InputDecoration(
                  hintText: 'User Name',
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
            ),
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
                              fetchPost(fname, lname, context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                'Set real name',
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
}
