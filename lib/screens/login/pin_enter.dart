import 'package:asianbitcoins/screens/login/pin_buy.dart';
import 'package:asianbitcoins/screens/login/pin_set.dart';
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
import 'package:asianbitcoins/screens/login/pin_enter.dart';
import 'package:asianbitcoins/screens/login/pin_reset.dart';
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
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinEnter extends StatefulWidget {
  static const sid = 'pin_enter';

  @override
  _PinEnterState createState() => _PinEnterState();
}

class _PinEnterState extends State<PinEnter> {
  String value;
  bool checkboxval = true;

  double lastcontainerheight;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkpin() async {
      // final String args = ModalRoute.of(context).settings.arguments;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String pin = prefs.getString('pin');
      if (pin == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pinset()));
      }
    }

    checkpin();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    lastcontainerheight = height - 535 - 70 - 85;
    print(lastcontainerheight);
    if (lastcontainerheight <= 50) {
      lastcontainerheight = 50;
      print(lastcontainerheight);
    }
    _onBasicAlertPressed(context) {
      Alert(
              context: context,
              buttons: [
                DialogButton(
                    color: color9,
                    child: Text(
                      "COOL",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PinEnter()));
                    })
              ],
              title: "Wrong Password",
              desc: "You have entered a wrong password try again !!")
          .show();
    }

    checkpin(String args) async {
      // final String args = ModalRoute.of(context).settings.arguments;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String pin = prefs.getString('pin');
      if (pin == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pinset()));
      }
      if (pin != null) {
        if (args == pin) {
          Navigator.pushNamed(context, BuyCoinDashboard.sid);
        } else {
          _onBasicAlertPressed(context);
        }
      }
    }

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: color2,
            iconTheme: IconThemeData(
              color: color4,
            ),
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              'Enter PIN',
              style: text4,
            ),
          ),
          body: Container(
            color: color2,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 64,
                    left: 8,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: color3,
                            radius: 50,
                            child: Icon(
                              FontAwesomeIcons.lock,
                              color: color2,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //mainavtarbox
                //container3 before mail

//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Container(
//                          width: width - 32,
//                          child: Text(
//                            'example@grabthesite.com',
//                            style: text1.copyWith(
//                              fontWeight: FontWeight.w500,
//                              color: color1,
//                            ),
//                            textAlign: TextAlign.center,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ), //email show
                //container4 before thx

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width - 32,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style:
                                text2.copyWith(fontSize: 20.0, color: color1),
                            children: [
                              TextSpan(
                                text: 'Enter valid 4 digit PIN to enter  !',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ), //thx text
                //container5 before notice
                //notice text
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      value = text;
                      if (value.length > 3) {
                        checkpin(text);
//                        Navigator.pushNamed(
//                            context,
//                            PinBuy.sid,arguments: value
//                        );
                      }
                      //    print(value);
                    },
                    maxLength: 4,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: color1,
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: color1,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: color1,
                          width: 3,
                        ),
                      ),
                    ),
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    style: text7.copyWith(
                      letterSpacing: 15,
                      color: color1,
                    ),
                    cursorColor: color2,
                    cursorWidth: 3,
                  ),
                ), //OTP Input

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
                              Navigator.pushNamed(context, PinReset.sid);
                            },
                            child: Container(
                              width: width - 32,
                              child: Text(
                                'Reset PIN',
                                style: text6.copyWith(
                                  color: color4,
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
                                'Login now !',
                                style: text6.copyWith(
                                  color: color4,
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
          bottomNavigationBar: BottomOne(
            colour: color2,
            text: 'Next',
            ontap: () {
              // checkpin(args);
            },
            textStyle: text5,
          ),
        ),
      ),
    );
  }
}
